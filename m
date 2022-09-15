Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D752C6FA89
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MgLlnzu85oKBoM1pRBrnEOAXTJxkUDLADpKc6ZDc74=; b=PaowMFhUIgWNc1
	KuCCG8vYwKRyA/vgjzMODLd2cYASuvsvR0XUHE5MTrz0u0afRYueza/KOOj15K1wf1KjEyocfo5lv
	ST0Tu/sRnjXV2224jQ9ZplBXxu6yO5+8nGFghI8RS/0q9vPYGD+E7WqoXxRh2l4OAH9BnNWoeQoGp
	suxiSMqAuqXurSRVN4QqOHbck/FABF4QhdI6/vgav8t6TDzK3D3TrVtQ3u3BVq38hLvjLrb9Y4zDQ
	71YxX+sKzLPed7YD6J+SEC/RmjFy6t5fZFcNuf+qa9Rll6vMNcW2tolqzhJUIV6cq+prlyCArKNFt
	koLCqCQvhXeyE8Jp/Itw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsBj-00DjGO-Ks; Thu, 15 Sep 2022 16:58:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsBf-00Dj5o-MT; Thu, 15 Sep 2022 16:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663261083; x=1694797083;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wKFK1o6MRKWiET6eCj1afZBuDPgjAJ8GO9If3yt7i3M=;
  b=DXY2RYb7fQQVs8JIV96zL3x4e7q0iJUy85wXLykBWAWNPHlyQr0HuTuq
   Dvz97+VWnVCBD7RUBx+uOQuWv+nHhunDxORFfqTSdY+jPc4ahFxSHE3Ca
   Bld3awC4mO5DfpneDilyZxjcw/bJiaE9JifL5ouxXC4vN1HhjDV0YO7CL
   XVyyaqICP/auKOd3cxu52ipsLj61XypGTqHWqgIhyA1XOFL0MEfysgrYR
   oPjNMOjhuSuOcPIY+CxlHt3UIwjFUyGsbvH7KxPk66JUDfqAOiLRk7oQv
   S1xtl0uDidGfIofzuI+uzyQvAypVaZxMaYWypfyv7Vnm63AgcantLjBnS
   g==;
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="180678039"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 09:58:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 09:58:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 15 Sep 2022 09:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pkoud1aBJ7BEtjb8DciEAXCXkRc8eA8t9riw9QW3A9+2LqCSB0WVywgw6mWfV4lAMdfE5nAKe67ZEbL/J0bg4lmyx5e0won4jn1NsHaNMfqAELSxrbAbNm5eWe0iamLV/6rvyJiYKu5CugkliarMKRkrMFtSYyAwZA4hrd6uL7Bc+k9qyVwJkV8onwJ95wNxWiPrK203i68Dpd4iHNVQ8vxuQ4lvViqNZXQWMZPaATEIqV03hJcvBwx5SLuXs0/t6kUzL4TD2c5r0rkLmWJFfWOCb9WRiUQsAvdSnwEseQXAmfxGc+VvaMoYlKWOamDmwla5bHv5uRMFWBhSDm6ugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKFK1o6MRKWiET6eCj1afZBuDPgjAJ8GO9If3yt7i3M=;
 b=GCqUrXScshBjMF9v3vnZLePwrLz5jOJQ+6avG6syPLFOsd7cufJWvR45WyCuip6UyqQgTA5hIqsIa1dUMsvmr+muptdmFzN48dATN0X2QirZh0eKLELVBqFY+M5Pmt3b7J1vSmwMeqdu7w0pjRoJqimUAydzhv809teKuPlrOAPYu4M66YeKlQXhzxzXU05ApbBUq+2pSbuYnGjceEqCrq/xRhnKPUjC19Og9U/850f1GfccAgJlVcNiWgBGKFEbArTkrepOavzthaYM84ustk1lCCmQkL8ca4Fm2u4onm5BWx/9i2CnsEIQ7HD4X5e1tz6JW7bF/svV/v2I9K3nGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKFK1o6MRKWiET6eCj1afZBuDPgjAJ8GO9If3yt7i3M=;
 b=XYDdUQ9B+hoTt1e2OHBaOmh5cZE++m+nkuz8rtrAOT4hXCvxRoBHp3NMuePMzPtFRpEhaUU8X5/RvBLzak9IQKYoGptbRPLAyqoTNK45sVhc4Imd5b1WPTBHp0JUC8lZT2UIc+ca0lydNqrqweOt7w30Z+k50nqOYN6RBaawyPc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 16:57:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 16:57:55 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>
CC: <anup@brainfault.org>, <atishp@atishpatra.org>
Subject: Re: [PATCH v3 0/2] riscv: KVM: Expose Zicbom to the guest
Thread-Topic: [PATCH v3 0/2] riscv: KVM: Expose Zicbom to the guest
Thread-Index: AQHYxFsS7TQ4xlS3fUmrkQVP6LQlWK3gv+IA
Date: Thu, 15 Sep 2022 16:57:55 +0000
Message-ID: <5835b765-ee0d-753d-7772-1ce64b9ec32b@microchip.com>
References: <20220909144400.1114485-1-ajones@ventanamicro.com>
In-Reply-To: <20220909144400.1114485-1-ajones@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CO1PR11MB5059:EE_
x-ms-office365-filtering-correlation-id: 2a18dbea-ed49-4086-0b4f-08da973b6f4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Q81kkJHoKeFFpNXct2F3EPIBLwErbeJz5Eoh+H4Fw0lY3SCVbMu+PS83CwRS/G1DyBpGE8Ryt+XjJr5YlaoRL9ZYnnljSKE0yzb8ine2Me2COn4/WnMDHG+7FZfyDRpVEWziU6yeZQZDZW89fkd1NR+sRN9l2vXfkR/IatlVw6LXyRL4baJVOOKOKpkB6Uush4D/mEXvk6+s9APDSwMAbIqKkW2ibOKGurhpGn2f4zKYotVWKUzDtAwZCPX5jXYQSozZACr2/FMTjSwkZoaS2vRMVusbO3JJKtJw8zC+9rFpeCI7B9qcYHLsPcYLicoPOojEelGlD9IMU3TuQT5R7UkcGuOHLUocNspxHvRkQ2tCuna+6n5goGnm56Ztt8mF8UL413NXnMKL/LpiikytyjfSnWiivneXUswGvIlVMjriUnnKu7sgdc/MNNPAKj+f2KxyJJGkMm0hbV7PXDqDQzGAAZrneaflP4Lu2hAtmZOFRfS/MQ8r0o1hz7bzz7HoDc4ZrdJg5pK9nrQ4OexBu9rB3WLUzDz8TWO9U7ouK+G5pPum7fN7W5u2QMRQQ/bUdy/l1oZtDOUFSkEjFrGX9rYmoDh8jcga5yTCcrmmaho6vmV6TOySdJUrJ8rxlSir3r2PYPWrK/umwKsO1HtrOI4fLsfq5SALx+4Gfmjh9zl58nl6yGIDwuWx5ZElCxGgd0ccGnz6XxYZhF6I8jqyJ0yb3Uxp/+c5yNDI50LZ9tAETxTwgvLZRR3NFX0GWmymxfHotmdswkShdYeVyjB98Y0oNVMX1AYw4oitxUWSM8qadqazH/4rKc1NDEzT/HNqdc48+FHPLWwcl75zIOiTsry4AfBpF2JvtajI/c3fOf7uR06IpYSE4559fPkzYMhhWc61woYTAR+HW1e1nBn9A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(91956017)(86362001)(31696002)(38100700002)(110136005)(8676002)(122000001)(66556008)(66946007)(66446008)(38070700005)(64756008)(4326008)(54906003)(66476007)(76116006)(316002)(8936002)(2906002)(5660300002)(478600001)(186003)(2616005)(83380400001)(966005)(6486002)(71200400001)(53546011)(6506007)(26005)(41300700001)(6512007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjRHc1htckgwWWhaaCtsNEsyK09vdG95MkVkbGlLcHNpM2F3UVZOODJhU3hM?=
 =?utf-8?B?Y00yZGJoMlZUdS91TlF6YThoN012UmFmSDk4dmZhVm1LcXBDdjhjWEhiOTM4?=
 =?utf-8?B?V0p4NXZPU2F0K3ZKVlRkS1ZYa2x3TExtaFpJbnVyZDBMSDZjdHV5eFoydWdZ?=
 =?utf-8?B?dXF5Nmh4c2M1WEJpb3dLaDZxU2VCTWVJSlRMVnVtUVZPTjV5L0xXK3VtUHBV?=
 =?utf-8?B?UEVCdFpadTNLNDhHUGhVWkYwL3REMXhXUVFrSzFiVmNwa0xhM2U2d05qTm5N?=
 =?utf-8?B?eTBGeGlVMnVDYVpQVkN0eURaUlZ2N09tYUo0QkJ4THVhdHYyelIyNTBBMmlB?=
 =?utf-8?B?YUx2S0ZPZHRNdjFRT1A0dEVqd3J1MXRtR0ZqWnRRd25LY0FiZUVUczlLVGNj?=
 =?utf-8?B?Vi9ENDNGcndCSXhGbDRCYS9XS1JMMWVobVpFNDcyanQvYjZRQkZlS1dXZlRn?=
 =?utf-8?B?bzFzbVlLR21SZDhRNjJLMHE0dkVTNlhoT0F2LzhoVGxLQU1QdXRTdWIxeUpP?=
 =?utf-8?B?eVQrekduYW9ZS1lneHkvdzJ4UEhPRXZjeTZtdTBoUGlkTjZ5TkFUdDBDWDFW?=
 =?utf-8?B?S242TVhTYXBtbWZ6bDIxZUhvaXRoSzJpbllUakRKU3pUN0dhS3RWNENXUXg0?=
 =?utf-8?B?NW5kMlBoMXA3ekRPYUJSbFhWM0dFZnkyUVRJaWROUm5VNGpSaGxUUzdHZTB4?=
 =?utf-8?B?ZTBPTzFyUzdmaXhBNFczU3dMTk1hT2JRdllRbHBSY0F6TnU5UVFPbjZPbVdI?=
 =?utf-8?B?MEhqUXI1bExsTFRsbnJzK2QvZjdYeGlMTXRKZCsrbzRoazlaMThHaCtSQWRY?=
 =?utf-8?B?WTBHUHZ1TjQvWHFtZUVUT1VDSGtPM2UzaU5wNzd0ZWw2OEZKb1RaOFpQdXBQ?=
 =?utf-8?B?emx0bmtnb3dhK2Y0NWVnc2drSWtOdzdKOWlJMTFjOWx4SVhuRnlBWWVWK3Vq?=
 =?utf-8?B?STNwdVgrOTJXdFZmZjhuQ1d5T0c2SlU3WGZmTThpSno3aXhMWWFvVlMwdndT?=
 =?utf-8?B?eDNmOGhEbHpqZmlHamZEa3JvV3h2dVR3Y3JVSkJjcDBpZVFqcEpTbGNoRkFM?=
 =?utf-8?B?TU50eE5ETDMrb2lnRmx0MG54TGhVbmh4NTAvYjd2Vmhqc0JIMnRaaXRHL1A2?=
 =?utf-8?B?b0RlWmVqNUtFZ3dFeVNjRDZ6dTNwekxmUmkvUi8weHYzdm1vWkh6THA0TlA1?=
 =?utf-8?B?alM4UVpDSFhLYitRdzZST0VMaW01a0x0VklTNDE5cVlqMVdpYkdKQ09rWXJ1?=
 =?utf-8?B?eldMOE1GWHN0SmxYMmVsVEI1OHJ0U2NadFNITTdaNy9PMnhvRFFlNUs2UXVt?=
 =?utf-8?B?VSt0RE5TRnlpRU55L1BHcnhFQWE5ZlJBUkYvTXdxL2U0TDdVakdmMC80VUFI?=
 =?utf-8?B?SUg4TFg4MzlFN0FDTUY4dE44ckNmZlc0bURQUlJSSkcvcUpRcU9jSEJDS2ox?=
 =?utf-8?B?dmR2ekdyejZsRWIvVFp3QXZUR1E0dzlSdFRsUnRpeTByVkNnUnlwV1gyeFRp?=
 =?utf-8?B?ODBDSWtwamplblVYeXlNYW5uREpoK051ZkRJNDczR1ZHQkZSVTlRbEp1WWZK?=
 =?utf-8?B?a2VzeXNRallmY0VIQ1pFNzYrKy9QUEhjNy9HR3NOZ2l1VTVyeE9pS09pZ3ox?=
 =?utf-8?B?UEF2QW5MQ1hlNUZYanVvaThuR3hTK1Z0eXZzNzdFMXdSYlRBTjRzdlJ0R3Zp?=
 =?utf-8?B?ZlE2eUtpV0NBOWRaUDZueG43b1lhVWlaRFdsNExwUXJ4eUM2amZPdnVmZDZV?=
 =?utf-8?B?VFNhUHIrSWY2YmgvK0kxVWZ6N1FZdUlzcDRZSVlrU09DenlPWEphVjFldVE3?=
 =?utf-8?B?VlpENlBxNG04MTF6RTRkcUZnMGNKMUh2c0pXZlZaSEptWnc0OGhkelNPYVMx?=
 =?utf-8?B?cnlYS0krdmtLNUl6dUNBcmVQOStlaDNUOXBNWlhZM25YQlNJaEFndnlGbDNO?=
 =?utf-8?B?T2hRWjArM3QxQjNmM1MxaWRQOVBXMGUzUmZleitLZ1B4OGlMZUdrVXErYnhR?=
 =?utf-8?B?SzVsck5CT0tFaXIyZzBNbnVzaHo4Q211VTZubUJqaEQvQU5jbDcweXpGaDVk?=
 =?utf-8?B?YmhzMkVZdk1MaVQ3R2RRYUpDa1lxV0xCUCttSk1QU0JEQ2RlKzNvaVhPbnBZ?=
 =?utf-8?B?ZW0waXAxVVVkTTc0b24yVTA1d0YrNDE3b0RPYVQ3VnI2cFNDeVl5OThpUVRo?=
 =?utf-8?B?QVE9PQ==?=
Content-ID: <2216CB10884CFE4A9C7B15AABA1C85D1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a18dbea-ed49-4086-0b4f-08da973b6f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 16:57:55.2440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r/2ONHCZfjxTL+KgkKGdSrMgRRxC8GG+5VArMtac9zK7W1VJEtM6QjQT9rutRvh439uEiEc0W8zv2hDtJC4W4e8qqWbywbDC1jei5SfEtcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_095803_789867_48323781 
X-CRM114-Status: GOOD (  18.99  )
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

Hey Andrew,
Since Palmer declined the version of the Zicbom fixes with the relocation
of the block size, does this patch need a respin?
Thanks,
Conor.

On 09/09/2022 15:43, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for exposing the Zicbom extension to guests. This has been
> tested over a QEMU including the Zicbom support [1] ([1] was rebased and
> the Zicboz support from it was dropped.) QEMU was further modified to
> ensure the cache block size was provided in the DT. kvmtool was also
> modified [2] to test the new KVM API and provide the guest the cache
> block size in its DT (The kvmtool patches are based on Anup's Svpbmt/Sstc
> series [3]). These KVM patches are based on the riscv_init_cbom_blocksize()
> cleanup patch from Palmer and the move and expose riscv_cbom_block_size
> patch from Anup which was reposted [4]. This series is also available here
> [5].
> 
> [1] https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicbom
> [2] https://github.com/jones-drew/kvmtool/commits/riscv/zicbom
> [3] https://github.com/avpatel/kvmtool/commits/riscv_svpbmt_sstc_v1
> [4] https://lore.kernel.org/linux-riscv/20220906074509.928865-1-ajones@ventanamicro.com/T/#u
> [5] https://github.com/jones-drew/linux/commits/riscv/kvm/zicbom-v3
> 
> Thanks,
> drew
> 
> v3:
>  - Added check to ensure the extension is enabled for
>    config.get(blocksz) [Atish and Anup]
>  - Opportunistically switched all extension checks in
>    kvm_riscv_vcpu_update_config() to riscv_isa_extension_available()
>    from its __ counterpart
>  - Picked up some r-b's
> 
> v2:
>  - Dropped a patch that output the cache block size to dmesg
> 
> Andrew Jones (2):
>   RISC-V: KVM: Provide UAPI for Zicbom block size
>   RISC-V: KVM: Expose Zicbom to the guest
> 
>  arch/riscv/include/uapi/asm/kvm.h |  2 ++
>  arch/riscv/kvm/vcpu.c             | 17 +++++++++++++++--
>  arch/riscv/mm/cacheflush.c        |  1 +
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> --
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
