Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8345ECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmELftYxSH4+TB/MQoSQwQDJ1/gymz2f1Oo9q9tAhs0=; b=iLPG1VdldKJ1cU
	sJFduRChWyIm6NKAidB3tmTyWHvWxCKMmxmRCl9EMryxXEF86xhj8CRVXqCgqw3hFXfi+Afiq5GGX
	xaeE6GFUDr2xH8z2YCEN3ef646Ew6vEqQ8tfA0YgjD0zPuUO1pRBPypqg3CysHYuu3ekhsPFsRXCy
	+PV+sbyAB30A8Y9l62i20/taqgIVU6eKbeXfukCgMKwRcQRnTDdnxLHztRmac59GAnBKtZoqxvPcx
	jG6a7s3G3Nms/KQX4413RBgMQ3wfUZwQM0R0qaGvcuUpkkyGnovbNNFupBOfi4OXxuY1EVEjxyS7Q
	DOr1nOkrBfnbCB58CLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVbRL-00FPuj-DM; Tue, 06 Sep 2022 16:28:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVb9s-00FEWs-KX; Tue, 06 Sep 2022 16:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662480640; x=1694016640;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MkAlicgdVkoJtB4+hbuAvw/yYhnPFB72XWuZg7ctvm0=;
  b=EdDP5Di/SLkJ7p/dj8O3Y4roH+BgYsHDsOF+KGan6Qq7ooqCWIQRa4W1
   FowUIXQVRQ6x2I1q3NMDtaDsrtsvvYnECKX5s2XAczX9wlTpDBduYyx13
   0GFjrjCl3lO65ziJVaqc97lfkVh+QNSqmFFpVL95TEfZSt173RYqUEifH
   d55QVRYyDQYSYq+JYRw4x7LCkanI2Kwpc1bppczMWlp2ALrJ8z8XBn15e
   R8WUNGK7O/U7iYyLncq/6HbvbE3D33UY5W2AWrI3xliNJhHnQZ3DmAiFN
   MK9upMPjMfT4xxS4Lshrwc7H4tkbyvINVKhzobjohaEzBU/x587+KyipX
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="179247739"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 09:10:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 09:10:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 6 Sep 2022 09:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkpnmEfAO4Px2nHBVaDoajCAUCHtcORNaLulqxwwxFLdmjlO2T9BjAA4AuiOhvndiiAZveXeA5tyofwgMlbMInbOoMGkwX29wFxfVHVMaD9fNhIsWoGHAuAnOTWdsQkaZII8kkk3BsUXSFwtrHJMU0HfxuFicH+O/8UcQXEzvOaMywanp80E+HMCpYuHlrf2SfUzPfaiogSTh3/rdLaAUHK79WMKWJ5tDKnwxoqKQ7HuVv8O/QbqBTVCZ62qBtvikN/rLDnic8bonBfUUQQSodvcvDDbwzTeTxYVP0wYo67R140mdUjHM2cY7ypfo89cHAS4BVMTPvW10sTeD2a3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkAlicgdVkoJtB4+hbuAvw/yYhnPFB72XWuZg7ctvm0=;
 b=GOA2xxsZA929g97hEfYNbTsPilF9VaWFj6V9V2lXaPx9FjISYVFRj98KZ0EmFg+9PL8QQ7iNWw4ljWjf+7HmfBWOSnOnY7zTnx5QZZC1q3pSDPuPAtW2sYasuNXDugJOh6xur6jqikBq3zaf+9eJoHSo2hpu8Y86xqCFI05CgG5f8yeKaWBRHEwrC3V7WcYreqAAuF5iSDixYw4TQzZjbJRj0YUeJmkkMWV/Q58ewrd+UUbOPSwV/KBteVdvngi3tSU67YM85Qaen06wFqrP6oMT1WcjyFmCGIsxwHvC+5yE94l+Iz46M5ToBt7swmcXzA4t0pj0N2Tq0IbKAj3DYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkAlicgdVkoJtB4+hbuAvw/yYhnPFB72XWuZg7ctvm0=;
 b=nQ0Vw0zsDoWE4Kr5Qry3bOzYOPH4+nmr0DgyOWTpJ1LXIm7u5QqX9AJweKgSpH35xq9NUNQARg0eOk2ivmP4JJHHXqQnUKLhaTIpG3+V4z+k7XvmWVp3Nj4EdAb1KMLQcI4hzdQ4bFaSh29XdGrjmuwkvybv4WzSL1DDsNJ7RSY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB4068.namprd11.prod.outlook.com (2603:10b6:405:7c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 6 Sep
 2022 16:10:17 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 16:10:16 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>
CC: <anup@brainfault.org>, <atishp@atishpatra.org>
Subject: Re: [PATCH v2 0/2] riscv: KVM: Expose Zicbom to the guest
Thread-Topic: [PATCH v2 0/2] riscv: KVM: Expose Zicbom to the guest
Thread-Index: AQHYwghoCwqyglEfoUuqMS/hp/m5f63SkjwA
Date: Tue, 6 Sep 2022 16:10:16 +0000
Message-ID: <201f510f-9b29-d299-7827-4f135145fc21@microchip.com>
References: <20220906145842.965488-1-ajones@ventanamicro.com>
In-Reply-To: <20220906145842.965488-1-ajones@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f580f78a-dd15-4077-1849-08da902249dd
x-ms-traffictypediagnostic: BN6PR11MB4068:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7hBzfu/0+5N9eD5gjr5a3Wvmb8fxIXAF7Rr8lHPxawKhDn2pvOyBc3RNK9+FviZCpgOeSC3XwNJF56EtQMUbuzjBRFLSZEkQA7c9/eypOiEa+BO5ulfsbNAPKis4xLKwLxd9pIfgk+Pc4wQtdU3YRyfF3iGRoBr9JBIcoDEX5xuSkFN0C5UUpnpTCeQbrRlcNxWCZvLemZLKoSPHpKsPhfjsgD+/TEs6mmLpClPK2xHO6t6oGBXKLZwxgFRU0krF/oxL2jtKt0+ZqH9yUf0i0VgaqC/1Lzq40rRzSOelyhdfF6lsZPOAs/NqK7487EDic5lMGO02m7PUSVPBZViOjkssTo4krhgLZ18K++p6EfG5GrnWAY/TZaGBegHaTUf8slrJzkJSQiDGRch0qAfB5Zl03PuqByJHziDY4polCoKblf5PJZ4nFUYU2ZyRJc9fm1/pKL0T8N8N4WS+SPRP57dMd6SUoPiE+aP6xGFEWzw27o/ZeF30X30gUPkKzYsbJbz7wpYyu8ZFqP5a7e/94xhOXqrKyv/+isz+6i/kmyJinmMp0Up+yDVOyXU/bTDy7VP1A3RpA8PNBu19fC3h52tYFudJfB5I+hhLFcYwQyYCSRd4t4QVnnNcoGb5RzTm8RqQEWoVN+6e7LInxaJ6rOSH79ZE4oMc+9xPcXn9ZzDGWt8a7lSReiKMTwFY6Cgc0KpX055iFwp88bq7Foze2mpwEjIK/VBJUq+Taefc+wx277DABES+ph1iE22NJ9DxmzVP8FfgVcEPXlgmtkBQwnjxKUETDQrvWCWG2vU5V0g/jwWHdraXoKRe5miJL/RU64plR6TYh4ygar8uoA5FsAAZp5dD2W4h9OatxAToLfxJEniUjcuDZ3SlywZyptXRZP+yCoo84miSiWYiIDCtew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(39860400002)(376002)(136003)(41300700001)(53546011)(71200400001)(86362001)(8936002)(6506007)(31696002)(5660300002)(2906002)(6512007)(26005)(122000001)(38100700002)(91956017)(38070700005)(64756008)(2616005)(66946007)(76116006)(83380400001)(186003)(66446008)(66556008)(110136005)(66476007)(31686004)(316002)(8676002)(6486002)(36756003)(966005)(4326008)(54906003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTFWVkJiZkpibXZSTXZxZVIveHhBQXZlYmtnSWtuNExaSDB5TUpXSW11Y1VU?=
 =?utf-8?B?UU1Ca25UYmFzN2E3dmFiTmFWMVp5cXNpQ05FY3ZjbmlTSG44VTdVOWdvYVR1?=
 =?utf-8?B?YXNlNzB4Y28vNVFoNU5OWnhGU2dPaU9mR2MrT2lGRkczMFkya3Nlam9lNDNn?=
 =?utf-8?B?SFVIWlZZWkpJQ1ZBMHJhVWdoV1MrbGJ3RkVNWWNta0VtZDhYdHdpWWFnRUxu?=
 =?utf-8?B?RzE0ZWZRL2lmZzlVbTZGOXBENkpRSXpOTmxySkorYjc2Sk16b2tneWYwM0VP?=
 =?utf-8?B?S0pacjAzVWtjRnVueVQraXlZa0xNMjhkZXNMUFd3OVRYR25kdEdjMXhFOXMx?=
 =?utf-8?B?VE9aSWRjY0M0SG1BRm5wK3prRlNad1BDRmFKVUxQNExORm9HTmZPSGY0NHlR?=
 =?utf-8?B?NWZZQ0lraUVRd1hYenlDUzREUFMzQk9XbUl5ZG40OW9ZZS93NldkdUpzR3N3?=
 =?utf-8?B?dWZEK093VnFJOVdaSGxMUnkrd1l3QTd6NnlUS0QzWWRxYTcvYjlBT210YXNJ?=
 =?utf-8?B?MnRHdjVLL0RFbEJHR3VhWjh4STV2emp1QTJxTXByU3dsdFBMNCtYcXFLNzVl?=
 =?utf-8?B?YjNvb3IrYnJndzcrcy9yOVFCODZUNE9wQzlCcHE4MlZyT1Y2VEZOSFlhcEls?=
 =?utf-8?B?Rzkwb01xQzVBdy96NHh3TEYzaDZESWdxOXJKY1BHVnB3WVJSSUJjYXhaRERD?=
 =?utf-8?B?L2hjZzdTak1pSm5HQ1BVRUhmaGdJZ2xJc2UxMDY5NTNMR3FrYXNBTjk3TnVq?=
 =?utf-8?B?dGM1NU9PQ1ZiR0pQaDg4M0ZQa2ZOSmxXNkhIMEw3RDZHdFFsREI3T0lpY1RG?=
 =?utf-8?B?Z0dFUGl4U0tsY1pyZzB6ZUQ5UDhmOEhhT05jd3JPRmdqSkJVeitiT0xsWWJD?=
 =?utf-8?B?dkdxMzVvTWJjNE1Lb3dBNVdBVEJLVFNhZVRIdXJpL1NIbC9NQjhGbXVJU3da?=
 =?utf-8?B?bU43RExOeUxIeXJ4dkxqeFJMTkJab01CaUJyTk1TM1AvdnBKUkRYdTkxQ2FV?=
 =?utf-8?B?RHlPejRUbCtmQjRNSVE0TDVEVXBsdzAzVnNQRW5YT1FnYmZ2TUVvQTl3VHJH?=
 =?utf-8?B?QXFwb0w1RXljZ1IvemdVZmVlaXZEVm16SHpaTmk1eXVueW5LcUw3ZCs5TmJh?=
 =?utf-8?B?bVphWTFKOVc5Tjk4WFh3bWhYZTJxdlFmWlN4N21jeDM0L2lTNUpBcUk3UGxx?=
 =?utf-8?B?eXVINm5kZ2pEUmgvZlFFbXAxeFBDQVNEM3BFYnZKTllCUWpUQTZUQ2dia3Z0?=
 =?utf-8?B?L2FUUUp5c2t2Y001cXY0L1FqcHk4VG03V29HOVRtS3YwRkJJVWhEV2Vxc0xW?=
 =?utf-8?B?ZDNxOExFaUJhQ0NrNjRHU0ZXamxlK2t3WVgwZUMzMmM0R2xUUm1TVVdJOTBo?=
 =?utf-8?B?WkJQT1JjaXUxWXZvcnQ5NmtvdlA3Q2lPZU1ncHlPdnRWT1k1cURLYXVxUmtH?=
 =?utf-8?B?bzFJdG0yN0pSdERoSCtrUS9INVhoZkFZMGdwRXhOWCtDS2dCb0Jpb3pxVFVE?=
 =?utf-8?B?VnltRDN6N2tnR3F2bEcyL1o5UnhZSFQ1d0ZJQmN6VHRNY3hLV1pkNnZoVHJ4?=
 =?utf-8?B?THhacGE5MDZCUXBYdElpQzVtelNiWUcxSlZyeUtIazhrdmNyT29XMjNGZG9X?=
 =?utf-8?B?Qi9YbGZYTEtPYlVkeVpRZFFFWXlNWDkvVWtwcWRYcnNQVUt5L1BJS0lwSHM2?=
 =?utf-8?B?SW5vdGpsaUh4T0E2Ly9vSmdTdEJkTmpQOFlIZzg4NVFwMklVSmNOc2pnQXo2?=
 =?utf-8?B?Sm5nRjBQR2tML2VrMmlBZUE0clZzV0NRdmpCMmt3K2NZOFdodklqU0RRdkpB?=
 =?utf-8?B?dXpaY0dVVXZHbnZiUklZbnovTTQ5elQzVDJTVWJ4dW9CcU9OVXpNZGQyTXRT?=
 =?utf-8?B?TXJrcUJmYmxkeDdJSGdtM1VUdjVLSGpnU3BSSUVScXpkU2xRQnEyUE9SM3JT?=
 =?utf-8?B?R1NjOUdNc1M4OHl0czVZNHNRaXAwUnV6aXN4RnJOdWtCVkJkZmt0Q29SdzdB?=
 =?utf-8?B?UFJLSXlOVDUxR2lNeWJUeElCbHRBNG9EcldldS9rclhBN3hqZVF0QXFialVo?=
 =?utf-8?B?aFJEVmwvMlU1eCtLTFVCYlp0VEEvcjdxU3BCWDdyeUo3NktVdVdlcGVScEFo?=
 =?utf-8?Q?thxz26SrbO0RF7Td1d2Av0YVN?=
Content-ID: <5188A236B053E7409477A76F5B7841BC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f580f78a-dd15-4077-1849-08da902249dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 16:10:16.8392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chT4WEvemoUX5Bi9SdyIXLahZH/4v+JqIj0NxUoTj9pnQg5Zkn+TmSuNe/13Z75b8OZf7y9ww3nu8rZ/vg9Qc21XeYaKtOXDv2dk0s0o6qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_091040_907296_7A60CB16 
X-CRM114-Status: GOOD (  18.45  )
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

On 06/09/2022 15:58, Andrew Jones wrote:
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

Saw this right before I left it against v1, but both of these patches
look sane-&-reasonable to me.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> [1] https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicbom
> [2] https://github.com/jones-drew/kvmtool/commits/riscv/zicbom
> [3] https://github.com/avpatel/kvmtool/commits/riscv_svpbmt_sstc_v1
> [4] https://lore.kernel.org/linux-riscv/20220906074509.928865-1-ajones@ventanamicro.com/T/#u
> [5] https://github.com/jones-drew/linux/commits/riscv/kvm/zicbom-v2
> 
> Thanks,
> drew
> 
> v2:
>  - Dropped a patch that output the cache block size to dmesg
> 
> Andrew Jones (2):
>   RISC-V: KVM: Provide UAPI for Zicbom block size
>   RISC-V: KVM: Expose Zicbom to the guest
> 
>  arch/riscv/include/uapi/asm/kvm.h |  2 ++
>  arch/riscv/kvm/vcpu.c             | 11 +++++++++++
>  arch/riscv/mm/cacheflush.c        |  1 +
>  3 files changed, 14 insertions(+)
> 
> --
> 2.37.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
