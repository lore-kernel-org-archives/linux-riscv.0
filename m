Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4457C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcXrUxkRDasF9nHD4Li0UmDACkMBAKH5uKDk1AGQNB8=; b=sHf99Y/NSA5NaN
	0Ct/VbiGC61zMB2PTG04NMW7jl2zjw4RPwQ2BYGPTBX2+EGvVQel89fIqO2eyAs5CQZVCJ/rHNPUj
	QVCs4e0kPvWH8axafLTNS0QhdixjfrQsB/mReWxjTFQ4dSfsqS/6gQZlKQ2xCg9OBW/BVz/vCScU/
	zvv7jiMHdi/a+D8C2les+xFcVlyTm70Xj0T+6/SLFFXuRH0zaY3ZH4PlFQqLKuljVBPtHQMxy3vct
	wEKmwtdLMwsaZ94N1X0IWJZZWSfjTLSMaPLu7qVJTjIt45zymPhraXr94lol2Myrb5Vt2+G9LBNJJ
	9q8KmiCVsgjb8G85/skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNeYx-002veM-8m; Mon, 15 Aug 2022 18:11:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNe1r-002PKL-G6
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 17:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660585051; x=1692121051;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=m1ZYsgO4lsF8LAqFz9tBn7uu0bneJhgKlDZMeQT729c=;
  b=oxxP/6nzKPa3JtxOPkmHfqEhzIQprCzHL/gy1O7juI59fh3yHL3Whnaf
   G4pbAswqoK9R44yyjrcETXX08+6kE9J6PdXVGSHYpTT4AeE/sz+5QKMD2
   Fl7O2Q1g0fHZxL9Bb/gLdSxpbY3w9zQY2B6N+L2MyVHrF8D2MF/QfAEHs
   mdebY8PtIyNjFcfBdM8J3+1GQTpXrbnj7tiir4K5TAuu9/94tpUiPUDr7
   t/2/0quq6HLqwCerZJpQTJYWApvUbKQ+u/brbxwaYE/xjBsxKw3HgdGvg
   Y2/hH/QziG8OXcIbhgzowqFP4CqjQ2GnZamNdPkNIDC8LtYvEou5EOxtm
   g==;
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="109109524"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 10:37:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 10:37:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 10:37:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLPjUUwm2xrm1e/wZ8cpICLGVUzPrQicnW76rBWHF2Ar1/SqBIl5QstgZLP44iAbCDygMUMJSLj9dk2USSBF6ZRJQzmjMtZ/AFRqiWFEKLi36bsx9HaMWLgIzOm2x4050VPB83G+U9PCyZJ+l2mk2f1RAg2uVFTZt0/22i83wXGxuWRpfzCN4UcECYxeFzjIY04Lx3sbbsoezTCFkonOiUSmoc8/+BS+DLtrvHhRdf/ojQnEDSAp8L84EkIYCuVQoakdfLk/sQt7vb3NWzWxRAOa3Bl6Ch/uIJzpQ0MoGn0ue7UUGMemAtILglBrq8zZPwZr1aAt3zyvw1Z2ibBbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1ZYsgO4lsF8LAqFz9tBn7uu0bneJhgKlDZMeQT729c=;
 b=NlCXPRRcvwxffwlTymd+t3rYtp3kUE7DVrm7biIRzUwgLqDxW9aJzLIsRCZkdJpxyxGSvj2KnjCGXkg52pxd1ENg+o/j+OQohMaE+Qh07gYmF3b9aOF3MSoikasHPEYXpWPGbT55cLFZvMOS+ukh1bVRaiQCnxke+phIz1NK5Um5C66FL17WFNvbnfp2S0QDQiA/NwP8z5JTGX4rIxko6L2isvcFAqfUIV+ncAE6yPnrjWr+TkkzKSpikb/AE3O+B9Aurz2cAklO1T6ckQQjWfdH6sqpHd8GqVURH97xv5on25LJTC3jUD2dmAemXLEJzRcJr1X0wBW/UeO8p5hjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1ZYsgO4lsF8LAqFz9tBn7uu0bneJhgKlDZMeQT729c=;
 b=Cj+ARtmQ2I3qGuDVKYEhBecd6RzXXFJ5G0P4L1j8URdtJxD2DIhYe9Drb3AtcOSGp1Xzy6TWoHloqStbRdC5DdsKlt/VPXGD0JXPtwVkl0KnVshDxBtMTap5Pmzrk45iTXeSAKVkd1eo4A947QRXXL7M/8rsQAWlXiCkq0x3OKY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1509.namprd11.prod.outlook.com (2603:10b6:910:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 15 Aug
 2022 17:37:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 17:37:11 +0000
From: <Conor.Dooley@microchip.com>
To: <samuel@sholland.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Thread-Topic: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Thread-Index: AQHYsGUr+3EH8+Kn3EeAQmOckfNsnK2wOoAA
Date: Mon, 15 Aug 2022 17:37:11 +0000
Message-ID: <ee3b13fb-109d-ca5a-537e-27cce50926e1@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-8-samuel@sholland.org>
In-Reply-To: <20220815050815.22340-8-samuel@sholland.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4da162f5-6436-40aa-13ea-08da7ee4c8bc
x-ms-traffictypediagnostic: CY4PR11MB1509:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gOUJTtbpKdkh0p+CILWxzhA9zXxfi0UiUZAZJGO8eB+KoYJgcX6uAsGm99VvLnh4DSGehZGTdnI7Xzp1Reg9ejA7VZrTyig8fS9z9evFySKtFLhCeSxeS/QjjYbYXpyXtlgkTWHvKpMW8eGjbcFQo+kcRjvBfZeUez9n/A2/foRc++HZvZjfqRxaO+mroezRRPR1Q67+culEjbk9aiBtc/fmSwW7CVS8H6uviI1swPiJPhjYlOFY18JTrU8TGzAcE+hbXmt8qbUIwl2mPvtrMDXgttyWsD1BlB8eQuVR9u03vg7MKxlkf1rEaADmVM7ES1TrUZAykgaqbzhm0TQKTLTK1fDlOJsrp+/g8KqjWcP9zmnCwE940FDfXaEIMsca76q+HGbCU9sw/67TWKMjHmoHEBfX00HLvI4Ol8OV4vf+QrL6v2q6Q6b/XpMWS9LizqNt7ri7dkKf2Fk45GCmH0R3i820q7a/ybelZgu/THO4LKvy7uZzZH8YfYvd+fBlEPxs2rX+RhHmebU/cAAYfDI8dHc95Zf5J/cSGOQCynZJGGGiIdPR+/K73c86mdZ/+FeEbnc1KK3QWC4eElNBpnVUg1DauAqf7SdjNNS+BeTBEVplHbUw6oVdk5RN97Bt15YhD37ubeHB6MDhOTyzupqAYdnAe/hSP8XGxajPJNdnYgG7imQKdVgp1fuh62NScYGpAHvrb56I6eHe0FQ3MwGZe1qb7z4vJ7z/OM1v4bfwTH3wQhGnQHs8dNwE72D7qi4okf4vyt2JPWfahvWiuZf08CsSrfVuS+Qjrwq4OXZoxSKYt0aKgQgBejnbomQjUXVuALXpZwFVpRwq65iVZ6WxLEEbads5HDm7nH1vHVY3wlxaNJbSxoWMeo0RwYwGZ8c+BcwcZcJ8wu+aozjkkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(136003)(366004)(39860400002)(86362001)(478600001)(53546011)(6506007)(26005)(6512007)(41300700001)(966005)(6486002)(2906002)(8676002)(66556008)(64756008)(66446008)(66476007)(36756003)(110136005)(31686004)(31696002)(316002)(71200400001)(54906003)(38100700002)(2616005)(38070700005)(186003)(5660300002)(76116006)(4326008)(91956017)(7416002)(8936002)(122000001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGNwbCtmVitXUGo0K280RTlzRWZiaE0xcVc0UlN3Y3gyQXZWQXpSbzlEWUZD?=
 =?utf-8?B?Sm92NnVSZTc4OHBGODN4b2ZmaHR3M0cwdGpWcmpEMGhTeGYvRmRnQ0xadnJ1?=
 =?utf-8?B?NUtYakRwVjNvdGs4cDk3RlNrT1lGMjV6OVFBRmlHbGU1eWkzMHdML0dSNVhO?=
 =?utf-8?B?Q1N0a0dzVnVxRDlYaXNlazJ0emV0WkJEakc4cldNdDFhRzhWMGVLZTgyQ282?=
 =?utf-8?B?QXNVVlVvTGd0dHBZWFNYcHdseG1NZG5oQmxNV1pBRXJrNWRPWGpFVURjejBm?=
 =?utf-8?B?N1Z1STVSWFJLRHlDZk1HY1p5NGdWMmh3OGhvWUFqK1cxUnRYTmNKWDhTTjhS?=
 =?utf-8?B?VnJEWEFuc3laRG1URVRHMG13WVpMZ20zaFNDZEUwYUhRNDdZeWJRR0NqUXlG?=
 =?utf-8?B?cFNlajZGVjdaZTNUTkEyVmYzcjVxUWEwdC9EaDBMS1lwSkFtWUQvRnJBR3dX?=
 =?utf-8?B?dlNVSXJSc29ydWFQMCt5dXRLV1hDbWFHYWdxQTFCS1E2RVk4Wm5zK0xiV25J?=
 =?utf-8?B?SU1EMDNhVmZMeDBtYU5Hd0c0RWtvK1VLTWt4VEZWaVUxeWw2d09KL1pTK05B?=
 =?utf-8?B?TGdLWXBRR0xiV21sNW5rUmVKb29WUGRmSE93NkdZK0QyaHQyV1ZaQmIxcy8y?=
 =?utf-8?B?WGJtelJOZ1EwbXZKWkhGUlZiWmNkR0ZUYWN6Tk5mR3cwdmd2MjhLYXlxbmgz?=
 =?utf-8?B?T0VraVdCdEttOEJuMlRhbkJRL0RqNlFVOFV1V1JWZTFiNDJZcmdrd0pETDJV?=
 =?utf-8?B?SnhPM0UwK2xIOVZxQllpd1p4d1hYNTh4Z0JwK09DOUZkNFZkRGEvcG8yTWpI?=
 =?utf-8?B?RWo2Z1RSZS9qRk5pRm41aldpMDhhTFFBeGVCN2FRWURrLzBqZG1GR1NhQWRE?=
 =?utf-8?B?SVNkd2RoTFVLcVhZelU4RjRBcW9vMkM5YUsrS0ZWNzlWL1hHcU4yMFdldVZ4?=
 =?utf-8?B?dG83WmhXTkZOdkFDRWFEdW4zMUROdW5qQzQzQ1F1bERLVnVEU0xJcitDMHhs?=
 =?utf-8?B?Ni83U2RFOHo1UFIxVktmMThEdFNtQ0JLRjVuclcrcGlzanI5U3hPdy9XZHdO?=
 =?utf-8?B?WW9iQ25oVEhBM3QyOWR2SGZOUHRIVjd4VFRwenBTdXRUMFc5b0Y4bjRZMzlo?=
 =?utf-8?B?QVFEVnFhWUszc29sZDAzT3pWaGhYR29KditiNkp0M1k5OXFhTTlFMGVUaUY2?=
 =?utf-8?B?WWxmd1pKUEI2aUtBSUl2dkhCOUVmRGFHbHZoK0VxREhXWHpWY0hmcTMyaXBY?=
 =?utf-8?B?SUY2RDltcHNmYzQzSFhIRWtkbUExZnR3L2J2R0ZRdm0za2x5R2xNWnpOaFcx?=
 =?utf-8?B?cW96T1B6TDNRZVJJLys2emhUeWlaS1VvVWV4ZFY4ZG5EeWJQbnJWM25vVjlh?=
 =?utf-8?B?VVNUNVV3U0drVk1ONlZnUFQxa0RicWRBQm9HcXFQcXBZSkR1eVJoa01vU2U0?=
 =?utf-8?B?RzVPVWtvL09zQnNBSTFyV3lGcHFRVG5iQmNadDNqL0tmOGw3V1F2S24zdVgr?=
 =?utf-8?B?bHhmOVF1U1FyblpFL0RjNjdjNjBZa3l4Ungrb1NpMnNsOGRtRUJsRDVKaDBY?=
 =?utf-8?B?V3ZxNHpMTjNNQU80YWl2NHR4ZGtJdEs3M1U3WmttTS9tTDNraFBJcDhJSW1Q?=
 =?utf-8?B?UkVmaGZMVDZQSFZFb2gxQnEzNGI2MUx4cG53eE1reUUrRnpTVWd6eHB3MUZN?=
 =?utf-8?B?UmVqa2tRZkt0eHl6RjlrWnRmRzU5WVhBb0U5b1FNTDBRYk9tU0t1RW9ldlBy?=
 =?utf-8?B?SUdBVVZ1RzVyRGxwWjlUVmdsVGhKVGdDZjltbzdkMlNTbVQ4S3VkUzJ4Wm5O?=
 =?utf-8?B?VG51THZLS1p6RjNrWXI4ZVNSQldSTW1QVWd2T00rMFFZZTlJd1o4TEY1RFoy?=
 =?utf-8?B?bmxKWldZNUdnKzEvZ0UyVVRXTFgvN042cmRMQXFlcjVUU3BlbVBERU1lT0pa?=
 =?utf-8?B?MFEzT3VjcFcxRGcyNTF4ZmZvazZjTGU4amJ6ZTFnRHp6TkhMOWNMN3k2MjZF?=
 =?utf-8?B?SFFxS3ZhOHJHbHVaWURhRUxOU0pyUC8xT2JRaC90b2FQK0wvM3MyTFZ3cjll?=
 =?utf-8?B?TUpDaUhWTlpvUm0rVm9tYUxRWkVHaGJIMVQ0VEVXOUJQYTRRUjdZL2ZrN1FX?=
 =?utf-8?Q?7MrMmBkbA6JxyyKAFjbSH2cKj?=
Content-ID: <3B4A377F7AEF5C4A954B0F740C70675C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da162f5-6436-40aa-13ea-08da7ee4c8bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 17:37:11.1446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lsTDk6Pa4tqm29FFSCUuzhTUPkRqm70AiX53PzHaDOty7vD6dgKXn8Xdm0P8rgeduvzlwuwEiyFCTy9oHOBO9l3XluWiw0gDBJmEwPA/dQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1509
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_103731_787094_87B55DF4 
X-CRM114-Status: GOOD (  18.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 15/08/2022 06:08, Samuel Holland wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
> It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,
> HDMI, gigabit Ethernet, WiFi and Bluetooth, USB 2.0 host and OTG ports,
> plus low-speed I/O from the SoC and a GPIO expander chip.
> 
> Most other D1 boards copied the Nezha's power tree, with the 1.8V rail
> powered by the SoCs internal LDOA, analog domains powered by ALDO, and
> the rest of the board powered by always-on fixed regulators. Some (but
> not all) boards also copied the PWM CPU regulator. To avoid duplication,
> factor out the out the regulator references that are common across all
> known boards.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Hey Samuel,
Replying here as it's the board I happen to have but I saw some kernel
panics. Some of this has reproduced for Ron/drmpeg on an unmatched:
https://www.w6rz.net/segfault.png
but some of this is different:
https://gist.github.com/ConchuOD/7d87f574df1ddc56f192e505ecab6574

defconfig is default riscv defconfig - the DRM modules + my cmdline:
CONFIG_CMDLINE="earlyprintk=sunxi-uart,0x02500000 earlycon console=ttyS0,115200"

lmk if you want anymore info :)
Conor.

> ---
> 
>  arch/riscv/boot/dts/allwinner/Makefile        |   1 +
>  .../sun20i-d1-common-regulators.dtsi          |  51 ++++++
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 171 ++++++++++++++++++
>  3 files changed, 223 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> 
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
> index f66554cd5c45..b0a15e8c8d82 100644
> --- a/arch/riscv/boot/dts/allwinner/Makefile
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -1 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
> new file mode 100644
> index 000000000000..143a3e710c3c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
> +
> +/ {
> +       reg_vcc: vcc {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +       };
> +
> +       reg_vcc_3v3: vcc-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc-3v3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               vin-supply = <&reg_vcc>;
> +       };
> +};
> +
> +&lradc {
> +       vref-supply = <&reg_aldo>;
> +};
> +
> +&pio {
> +       vcc-pb-supply = <&reg_vcc_3v3>;
> +       vcc-pc-supply = <&reg_vcc_3v3>;
> +       vcc-pd-supply = <&reg_vcc_3v3>;
> +       vcc-pe-supply = <&reg_vcc_3v3>;
> +       vcc-pf-supply = <&reg_vcc_3v3>;
> +       vcc-pg-supply = <&reg_vcc_3v3>;
> +};
> +
> +&reg_aldo {
> +       regulator-min-microvolt = <1800000>;
> +       regulator-max-microvolt = <1800000>;
> +       vdd33-supply = <&reg_vcc_3v3>;
> +};
> +
> +&reg_hpldo {
> +       regulator-min-microvolt = <1800000>;
> +       regulator-max-microvolt = <1800000>;
> +       hpldoin-supply = <&reg_vcc_3v3>;
> +};
> +
> +&reg_ldoa {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1800000>;
> +       regulator-max-microvolt = <1800000>;
> +       ldo-in-supply = <&reg_vcc_3v3>;
> +};
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> new file mode 100644
> index 000000000000..df865ee15fcf
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +#include "sun20i-d1.dtsi"
> +#include "sun20i-d1-common-regulators.dtsi"
> +
> +/ {
> +       model = "Allwinner D1 Nezha";
> +       compatible = "allwinner,d1-nezha", "allwinner,sun20i-d1";
> +
> +       aliases {
> +               ethernet0 = &emac;
> +               ethernet1 = &xr829;
> +               mmc0 = &mmc0;
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       reg_usbvbus: usbvbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usbvbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               gpio = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
> +               enable-active-high;
> +               vin-supply = <&reg_vcc>;
> +       };
> +
> +       /*
> +        * This regulator is PWM-controlled, but the PWM controller is not
> +        * yet supported, so fix the regulator to its default voltage.
> +        */
> +       reg_vdd_cpu: vdd-cpu {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vdd-cpu";
> +               regulator-min-microvolt = <1100000>;
> +               regulator-max-microvolt = <1100000>;
> +               vin-supply = <&reg_vcc>;
> +       };
> +
> +       wifi_pwrseq: wifi-pwrseq {
> +               compatible = "mmc-pwrseq-simple";
> +               reset-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
> +       };
> +};
> +
> +&cpu0 {
> +       cpu-supply = <&reg_vdd_cpu>;
> +};
> +
> +&ehci0 {
> +       status = "okay";
> +};
> +
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&emac {
> +       pinctrl-0 = <&rgmii_pe_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&ext_rgmii_phy>;
> +       phy-mode = "rgmii-id";
> +       phy-supply = <&reg_vcc_3v3>;
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       pinctrl-0 = <&i2c2_pb0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       pcf8574a: gpio@38 {
> +               compatible = "nxp,pcf8574a";
> +               reg = <0x38>;
> +               interrupt-parent = <&pio>;
> +               interrupts = <1 2 IRQ_TYPE_LEVEL_LOW>; /* PB2 */
> +               interrupt-controller;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
> +&lradc {
> +       status = "okay";
> +
> +       button-160 {
> +               label = "OK";
> +               linux,code = <KEY_OK>;
> +               channel = <0>;
> +               voltage = <160000>;
> +       };
> +};
> +
> +&mdio {
> +       ext_rgmii_phy: ethernet-phy@1 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <1>;
> +       };
> +};
> +
> +&mmc0 {
> +       bus-width = <4>;
> +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +       disable-wp;
> +       vmmc-supply = <&reg_vcc_3v3>;
> +       vqmmc-supply = <&reg_vcc_3v3>;
> +       pinctrl-0 = <&mmc0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&mmc1 {
> +       bus-width = <4>;
> +       mmc-pwrseq = <&wifi_pwrseq>;
> +       non-removable;
> +       vmmc-supply = <&reg_vcc_3v3>;
> +       vqmmc-supply = <&reg_vcc_3v3>;
> +       pinctrl-0 = <&mmc1_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       xr829: wifi@1 {
> +               reg = <1>;
> +       };
> +};
> +
> +&ohci0 {
> +       status = "okay";
> +};
> +
> +&ohci1 {
> +       status = "okay";
> +};
> +
> +&uart0 {
> +       pinctrl-0 = <&uart0_pb8_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&uart1 {
> +       uart-has-rtscts;
> +       pinctrl-0 = <&uart1_pg6_pins>, <&uart1_pg8_rts_cts_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       /* XR829 bluetooth is connected here */
> +};
> +
> +&usb_otg {
> +       dr_mode = "otg";
> +       status = "okay";
> +};
> +
> +&usbphy {
> +       usb0_id_det-gpios = <&pio 3 21 GPIO_ACTIVE_HIGH>; /* PD21 */
> +       usb0_vbus_det-gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> +       usb0_vbus-supply = <&reg_usbvbus>;
> +       usb1_vbus-supply = <&reg_vcc>;
> +       status = "okay";
> +};
> --
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
