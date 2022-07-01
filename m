Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBC5C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQwI3OHBmsW38j9vCeAl2Ol6L5q6b7PsCOOcHjIVvEE=; b=Pdohi/OCZ/BiSF
	6NovvOFRs13UnESOXA5fexl65SmYFJT/KiaZH6VIgGvw+34a0xoqRYXvMymFdxgzsnYVNSXcZXrxp
	WCrYOVBsjTO70pjdp3gjB5AGdqP+ca2ijSyvFTp9wpTMYAaLZOj49JY8EfBKTRCgvdJByhNBV1TFu
	jA9SIy0k+kctDPIhinduAaont6jcSyR3KbXLbKde2i8EDaMhTHPavxtSDq7+DPlG/ov0XfuM4REc0
	F2uf39PUi8FNb1v7svOYs2KhtnFqEBISpYWPLouJrAP/9NbIHPPeLU2vWbUaJjW0Q9hYLdCkzI4qt
	soFWkL4qENAuhHl9/r+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BUm-003UfB-6Q; Fri, 01 Jul 2022 07:55:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BUj-003Udk-8U
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 07:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656662117; x=1688198117;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8ip44PujCQtjjKyHRtI/nt5ehGL9Ou9pZeQKSiNN3ME=;
  b=KMxXt2nF+dGwJmo4iZl3ckm7bPjEtxZjXhOOkJ8o+G+Z5mtCcCuZyyRD
   3eMLHCb7CoXjKKKZ63RKfMKIjNwjodxf7HoUeNPlseQ7AN2LlLl88TBtY
   QpQglaBZhBQfkvtTxMr4/Gtm7cpLDLtzcorqAcCHUivfKiRrfnt/QxXVC
   oPkOS07yYCBTIznTcNejTytf78QmxSw6MmjSfeM29QpZsYX3/eWfZvXcD
   2OqZZKSIgJK1aW5oeKD/PqxTZjOktOi1Zog3sIJsFESzZFtrganTlLwEo
   OXSK7X7MhO9PN6JZcBXj+db6/VZdsUqs0O8bbxMX89JOReMOUblRfg+Y9
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="180329621"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jul 2022 00:55:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 1 Jul 2022 00:55:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 1 Jul 2022 00:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTVcepf7tGVyzMECg8nkbzBcP4I1lhlthHqRZyw3sr9m0BGWl4d2V9Du5N1E72oGUKV20lGQR+eCuf8187J8tqPUYPb4U087K76wV82zXmXvV169O0RdFhEX9BhzyEr1P1/KVng29Yqw81tBMxdHVZl3izK6Eh0xPYrl1pNNre56PwjYauV1r2BcXs66DdaghZxqSlZDFAcCfxMbfKdUCPzKK3cL/9zMjJRiFWh45mokE/D+ev5bfemEwkf8LgTsIoV5O6UGtleAWHbqD5GDQiiRrjBl+MXCWPoLG/X0ON9NIGKTOoAlGd8psRYLNz7e5zDAcJyBm7fTmvYjfKmZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ip44PujCQtjjKyHRtI/nt5ehGL9Ou9pZeQKSiNN3ME=;
 b=CQWDaMoPHUdixwcbnoXuwDPEruMnkE2fVSesW1Pu5W3NEBLA4VSw+rgaLUkddxMG8/XQnmEVRp91zBTZHdAHQTOBEGrAVCv3CYeK4gJAbo3qN+lbqx688r6VKkmjrkCPydrrU6z0j2K5mwPBugoGP0+SBU+3ZMTHCtM/bKoyrEpooMDS4Lm9yXkOL+khTRJlhdQFb1HYh2MnEkQkDkwgZ5dtNy2ovfrM/uGGY88+POJII+muiiJ5xhTlICZpZsnvb3on556OqYxbT374DXsN7oYtw4fRvk8NU4kbctzJUonUnQNMvuBrJ7pQws5g+cszmj+OvU7tN5cwsFhsVCnNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ip44PujCQtjjKyHRtI/nt5ehGL9Ou9pZeQKSiNN3ME=;
 b=N2/VLA64tcheV1ptHBgLyAp35gX/8OZ8ggDqdbPqsiYvA3+pA5zyMNInMSUdLWeaFOx5p/1y9P+wh4ht1r70yCharJnpgXdzx/4HzgJ8AWFNJ/Y6Khuzy/KxCRfyGc95yZV3axg2yJdFB+Ds5xT+u5tNnqEQN/GtJHDJ/U1WEyw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 07:55:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 07:55:10 +0000
From: <Conor.Dooley@microchip.com>
To: <Claudiu.Beznea@microchip.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Nicolas.Ferre@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [net-next PATCH RESEND 2/2] net: macb: add polarfire soc reset
 support
Thread-Topic: [net-next PATCH RESEND 2/2] net: macb: add polarfire soc reset
 support
Thread-Index: AQHYjRgQ3x7EmTGw/U+0JO50iJROM61pI3YAgAACHIA=
Date: Fri, 1 Jul 2022 07:55:10 +0000
Message-ID: <0d52afa2-6065-25c5-2010-46aaa0129b59@microchip.com>
References: <20220701065831.632785-1-conor.dooley@microchip.com>
 <20220701065831.632785-3-conor.dooley@microchip.com>
 <25230de4-4923-94b3-dcdb-e08efb733850@microchip.com>
In-Reply-To: <25230de4-4923-94b3-dcdb-e08efb733850@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe2f8980-a9f5-4e9b-626e-08da5b3705d8
x-ms-traffictypediagnostic: BYAPR11MB2726:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iexakNk3UPsk8dgcGrdcM28zAmKGCI79/K0gTHXfwEVcBACiXijZvckM5wcQLSPoZjONrybhxYPyeaKewXgWfo4RY4R/JhJCbCCq5bj9/i5MoXas6kGehE5YKF8YcJCj/CPRGwcO9QagO3s8BHays3SaIrXHOvDNhTv1sbWwlxQ5L8j6BOeaM9uEPmZHmx4YdeJzJft3nMtts7qkRsiW7tALLL/xFDgHcvrCj6r3sAgoki6LTDuPwppuDM0+INdG5dj3qxzouT50KGMwIhchak5rVQG3cICqMaIQxhCiBwerIDJIxfHjGHx/XrQwtpp/7vWoh1XpDFDfz5dzKKmhKHdszWexMxYSu0s4hbRWriU6Ev8I0nBv3JNon06IdV/qdQg1xPdRdWDANOgC/YkXdVoLxlktcIpC0BfFLHPgQCa1dTEY96k7FWJVV6ak/hDc8SEBBrmfM1M0f3S/jyAyhmR72adKHeS42ivlEI67X0m4VWOXT9Ste3SP0rPs2TIFZ2eqCp6e/hfyn4f1Q3DyTJBCRhaKmfso5Ywi1SlIRKNraSCCH5DiKrxFe214O3WOWCabi909zRKzyzFOKVL3YlpypljnN1cSP2D1h0z14bk7M3QcNz/6E8AUPWQI8Xe0PjcTAlhq9Dc5vCXXyfLPd3knx365zyG0KVMMuRSZjgduaSqun3D+Xbx8zvbibXeSwOUMPpcVQmj1O1Ng7OdZkMbKhDYdoMafEJ0g6fmfcvmXFMCRTjq1XqPOBMY54oMqyMhzxkI0GhGjFKKfhXAxWUTtAkEMUj2feAsB2Q94vGKLeDdZCUXgNxVhdUC7ielyHg03SPK55N3GrFhoWr8sVEoEYjb+QMO7GlmYf8qDVPsQQZYHVht8LcPz4e1sOnri
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(136003)(396003)(39860400002)(186003)(6506007)(2616005)(53546011)(7416002)(8936002)(122000001)(4326008)(83380400001)(54906003)(8676002)(31696002)(6512007)(41300700001)(26005)(91956017)(66446008)(86362001)(66556008)(66946007)(38100700002)(36756003)(64756008)(5660300002)(2906002)(110136005)(76116006)(316002)(66476007)(478600001)(38070700005)(6636002)(31686004)(71200400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzVPVHpDcWlMSUxIaWxYRUJacVhnWUgyMjJrVzZ5dDRzNmlJMTZvYzcxUEs1?=
 =?utf-8?B?V21xR2psOWRLbkVyWmNGTk12enNGMHlMK0U4cGE1ZUVBYmJQM3NPWGU3b2VF?=
 =?utf-8?B?NVZGZFlrOHZIdWZrQnpWYkxRQVhKemhPK2tYZXFlTW10SFhWcUxndFUvNE0w?=
 =?utf-8?B?UDVBa1V4ZFNsclpFM1ROWlAyaHNHSnY1SlRQQ2RZQ2JDR0Q4VHpJNUt3bWdq?=
 =?utf-8?B?c2RMYmxiVjB3RGZNc2JwZGlmaTRFbDBKN3ljcWRzNjcwUDV0dHdnUVlBMW5i?=
 =?utf-8?B?VUFTTjFGU2Z2bzRzWHEzNVUxRVJxQmh3RytldlExNjV5QUNBMEplMmpvREI5?=
 =?utf-8?B?NGgvRU96Z2FMT2VBc3J3aEtJRU5OMjZZZHZ6MUlRS2pjRktBUU55NDh1TDhh?=
 =?utf-8?B?K21rUC9WeThDOHEwOU04c2FGbmdzK1hsRWdwZUVXOWJOL0pSVmdzVHdHVldZ?=
 =?utf-8?B?S1RrdHJtUVVPSXlEbXN4cHg3SHh6V3VUb1kwQXRyTnlMZXJnSE1Lbm5RcWxk?=
 =?utf-8?B?QUpKYm9TU3E3WFJmcHdUL1YzaHdweDJrMEg3L3FFb1dacE1wbk50MWNVYzgx?=
 =?utf-8?B?MkhMQmRlZHFsSHlyRjlrVnBOQVV5UVdIZFNsc2tyTjJQOGFRTlM4MWdCaWY3?=
 =?utf-8?B?NUs0dkJFM2RoemZMRXI4WlRxVlpwMGVsb1k2NjRVc2w1TmdwTmdra2IvU0do?=
 =?utf-8?B?b3dTazRvdWJhZmtRMjdtSTFWZFBxMXpmQ0pJaUl4WHV1bGFJQ3VGWHJEeUs3?=
 =?utf-8?B?dDU0Mnd2SVN2MEtKbGd3SlFRdHZYMkkxc3NSMkJlMDhBc0pRUHd1M2FDMFFO?=
 =?utf-8?B?OGdQOThqSmJSRHlpZitaQzlVVmR5NG9KQnZCQTlJeU5kajdPcTkxeUxYS0NP?=
 =?utf-8?B?dTIrWlozWlJIV3BVdTBaL1dTbEZ3c1JRamFTVitUUEtnM1k1YnNyVkJzVlV3?=
 =?utf-8?B?QlkreEY0UERoV3o2RXIxbHMrK0oySlFsczFrN2k0WjQ3czRCcEEzNFllY0tF?=
 =?utf-8?B?SlcrTkVoRzdqZDdnYXpVZkQrUnBXRmU0UGxlQzJxUTlsOE16S0tHTkFYWUtZ?=
 =?utf-8?B?NlRlK2IvUXNrTDdtYmlLL1k3SE1KNEhBYkhvVU14T1QzNjdXaHRsdHI0Z2g1?=
 =?utf-8?B?T1E1bVlYY3JZTFZEZWdUMDdyOXRXMjNCN1VTM3lKTVBwalFib1owVU5qZExN?=
 =?utf-8?B?WlBTQ2pic0lKeDYxWENCelZ3RU5lNlpCbUVNWFdOUGVxdkJ6Y0hCSWo3OVNH?=
 =?utf-8?B?NjlIZWdCd3kvNzg5d2dxcnV3NW9rQ1p2YnFFNVBldUNSSEhONVRhZFliUXlN?=
 =?utf-8?B?OEVHWDg2RkFJU3pQNjNlalN2L0RKNWJuUnFRU3FKUmRtd3VvOTB6c2t5LzBQ?=
 =?utf-8?B?K0FNWnBNNk85ZE5pNWxqdzdLTnhwM3l2bnJhY2VDOU5aUDYrWXdQenh2Tng0?=
 =?utf-8?B?aGFSclg2VXJXcy8xRkFtNHJTYXgxMlhnb0liRlVGM2JMeHMrTFZocXZHc2ho?=
 =?utf-8?B?NkEza1pKc2p6cG1ZaFoyckJBY0U0THVFTE5rNm9BSDIxa1lQK1dKUHp0dzd2?=
 =?utf-8?B?L0VGdzEyaS9qa1hvWHAxWnFUVzRkUzRyMzNtVFBkNklsZXFZTEpLeWROd2Vz?=
 =?utf-8?B?UW9Beml0TENaTmlBM1VsMUpSaVdkVmhjZ2ZsYkhjdTlJcHdmN0NnTXBCajUz?=
 =?utf-8?B?YXpFN2lUakd0NFZ4TlBBQmpOOCs1SHpTenNJcjMrRjBTTzczSzNqVlpHVEFp?=
 =?utf-8?B?RnVnNWVWNTNQM0g1ZEJrcHpBOVJEMEMvdWJ1bk1nRmhDUnZiWDFpdEJxTlZH?=
 =?utf-8?B?T2wxM2RqamVOejdqQ1dlMDlpQ25iUHdjeXBNa3VFTTlyR0F0TCsraFBxN0ow?=
 =?utf-8?B?TGlLQS9kdzR3WGsrclE2S2xZR1RLVUJTR0I5TVN6d3QxYzUzZ1Uva0RVbmlE?=
 =?utf-8?B?bkRoNUlHeXJZaW8zMEwrUlhVYndESmxoQUlIUHU0a0N1VGR5NUFHdHd0bzFD?=
 =?utf-8?B?NDdnYW8yTHAweXJHRENNcllpTndRSzNoL0xJdC9jbG9NL3pGcktkSFNoVkUr?=
 =?utf-8?B?eG9BaDEySkxtQkh3U3ZvN1N1SXFzRWRndXVpV1dvUDByZ05jdmJQc1g1dXNl?=
 =?utf-8?Q?3YoGrTmfHtA/yXYTEcHnmoKRB?=
Content-ID: <33AB4E8BC619EE41BDAA909ADFAF26A3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2f8980-a9f5-4e9b-626e-08da5b3705d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 07:55:10.5117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwajyDNq+5GIOjlS/5L3tBaBKbp9Dk6YQQPChfPfBowquZMSkPkwwfU0SvE12mr2amcrfnsrcFvkwRJuuQ0AnV/EbQBt0TUE9W8XzCQq9BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_005517_357636_BA692216 
X-CRM114-Status: GOOD (  24.62  )
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

On 01/07/2022 08:47, Claudiu Beznea - M18063 wrote:
> On 01.07.2022 09:58, Conor Dooley wrote:
>> To date, the Microchip PolarFire SoC (MPFS) has been using the
>> cdns,macb compatible, however the generic device does not have reset
>> support. Add a new compatible & .data for MPFS to hook into the reset
>> functionality added for zynqmp support (and make the zynqmp init
>> function generic in the process).
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   drivers/net/ethernet/cadence/macb_main.c | 25 +++++++++++++++++-------
>>   1 file changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
>> index d89098f4ede8..325f0463fd42 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -4689,33 +4689,32 @@ static const struct macb_config np4_config = {
>>   	.usrio = &macb_default_usrio,
>>   };
>>   
>> -static int zynqmp_init(struct platform_device *pdev)
>> +static int init_reset_optional(struct platform_device *pdev)
> 
> It doesn't sound like a good name for this function but I don't have
> something better to propose.

It's better than zynqmp_init, but yeah...

> 
>>   {
>>   	struct net_device *dev = platform_get_drvdata(pdev);
>>   	struct macb *bp = netdev_priv(dev);
>>   	int ret;
>>   
>>   	if (bp->phy_interface == PHY_INTERFACE_MODE_SGMII) {
>> -		/* Ensure PS-GTR PHY device used in SGMII mode is ready */
>> +		/* Ensure PHY device used in SGMII mode is ready */
>>   		bp->sgmii_phy = devm_phy_optional_get(&pdev->dev, NULL);
>>   
>>   		if (IS_ERR(bp->sgmii_phy)) {
>>   			ret = PTR_ERR(bp->sgmii_phy);
>>   			dev_err_probe(&pdev->dev, ret,
>> -				      "failed to get PS-GTR PHY\n");
>> +				      "failed to get SGMII PHY\n");
>>   			return ret;
>>   		}
>>   
>>   		ret = phy_init(bp->sgmii_phy);
>>   		if (ret) {
>> -			dev_err(&pdev->dev, "failed to init PS-GTR PHY: %d\n",
>> +			dev_err(&pdev->dev, "failed to init SGMII PHY: %d\n",
>>   				ret);
>>   			return ret;
>>   		}
>>   	}
>>   
>> -	/* Fully reset GEM controller at hardware level using zynqmp-reset driver,
>> -	 * if mapped in device tree.
>> +	/* Fully reset controller at hardware level if mapped in device tree
>>   	 */
> 
> The new comment can fit on a single line.
> 
>>   	ret = device_reset_optional(&pdev->dev);
>>   	if (ret) {
>> @@ -4737,7 +4736,7 @@ static const struct macb_config zynqmp_config = {
>>   			MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
>>   	.dma_burst_length = 16,
>>   	.clk_init = macb_clk_init,
>> -	.init = zynqmp_init,
>> +	.init = init_reset_optional,
>>   	.jumbo_max_len = 10240,
>>   	.usrio = &macb_default_usrio,
>>   };
>> @@ -4751,6 +4750,17 @@ static const struct macb_config zynq_config = {
>>   	.usrio = &macb_default_usrio,
>>   };
>>   
>> +static const struct macb_config mpfs_config = {
>> +	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
>> +			MACB_CAPS_JUMBO |
>> +			MACB_CAPS_GEM_HAS_PTP,
> 
> Except for zynqmp and default_gem_config the rest of the capabilities for
> other SoCs are aligned something like this:
> 
> +	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
> +		MACB_CAPS_JUMBO |
> +		MACB_CAPS_GEM_HAS_PTP,
> 
> To me it looks better to have you caps aligned this way.

Yeah, I picked that b/c I copied straight from the default config.
I have no preference, but if you're not a fan of the default...
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
