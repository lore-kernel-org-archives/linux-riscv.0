Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9348FECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Y4+3xENYI3w1j2OB8rhz3RvTZ8WACuu/bMspPTzhZU=; b=NODwO6eW9zld0n
	DdruRXItiCrq1MxUrhJ61WNvqKq7s2fCjWhbH8EVDK0xiRxDiRr82vCmiKoGdJt2MJHKVG7VnQk6+
	lHhw01S65YIICVliBdNmNeD5EJcvUNeKdsEaXdawmFslsADeH9WuVHMgszLMMUQZKcUruH88KW8Y/
	BTcDGKx/jfUWavw/qPmkNmTKWGcZSgYIbX7I2EZjuvodx81Vfa/hrOfuyz6zNVISmQwx/9qFzwlFf
	wKAe5kgEHXN0d1iwRXsQcNOIuOrZc/dVaQ6Z5jqtLoo0/b/2ef85wjeRi5ofvyV3R4IDQALKH7p0U
	YjIRFDyzk1Wnr4JGV+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmjA-00DA2T-Q5; Thu, 01 Sep 2022 16:07:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmj7-00DA11-7j
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 16:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662048453; x=1693584453;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cooSGfe0usPEWbZoHgQ5Hu1tIVpKbppCNEDuc6vJVQY=;
  b=0OVyF0nP4KEVpfFWg328Gg2lz3QJg7N8euGg16Sh4nIgrNLol6ZojSQx
   VWeEN3vmkgvjNvKf6qBAm0AV3Tc2vH5GrEcRtLVbXtiu14QuC+KxXlUXF
   arRhSN+ZWCq+Y53CmrMgzdUzXb0UJ7k2mEjoaKkoZJh3CNIcZ/fgAcPyT
   tGZ0Iz4Ph5CibWA4kYo98shDzfJc4V0dM8SJEk16W7JZt7Qv+Pm0x81fq
   P5ugWD1ds77XzlujMYDYHNmDmvWEwH09oJsvO3Ot5/CUQvEC7VPgrLBJz
   +lJKhG0n29MrLB3Ffpq2M6qT2al04yl+2IPA+QyBjh4EjM/5dl7z8IqEU
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="189031284"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Sep 2022 09:07:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Sep 2022 09:07:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 1 Sep 2022 09:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vy+7UAchCqAQb9vNsE7L+IctzAuUwXD49IL8m2Gf/sr97d98ksmAOFqT2HcBxiufgdBY5JZzDsZWl1ESza/bG/6VKKyPujj3Q/Cvcmd5L96yemhvjpz/Q7I16cwvZtoJWIk2FfMGmmTScWx+URCcJaDPR+WP+1oguApRVT41gV+QkMVvc8ShN+l8RO6B+J9947DVemm5uQCPRlcCEeyc4aEgX2zpHD48XRwyHLBzwIGcL4rz4TyuvRHg3qHL7jeYtWc6DQXGMygvw3hy91387zn5IIR9J69sznu9FjzaVQiQ15fOQKERL1C3XElCD9VhoB27KJTyl6SXK0IoNpVpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cooSGfe0usPEWbZoHgQ5Hu1tIVpKbppCNEDuc6vJVQY=;
 b=nn0qpT7dy691mcra6PX1L9bBxuig9ITZl6xxWkYVScxpV8DXu1ixPzY7cL63WwU5N6Q+QFrlv6semBBT0K14HQdy4wFvkyit5qJuC0IwsROa9Di3gSBclfmlNelPxkt1gMIEzLaUnoewQLYa46Ad1e7txOJAFY3f/fOHx+xeDdB+H1Ay3hXk5S6bMAuKidwz0XTd9K7S2wPkh+4CDUArRSkVvL8HLchul+BTCUZrzWoQYtA56Va56s+XscUTpCSCezEe0xPVHEv27xKVLwAIRN1tRzrYGAKO3Jqzxmi4H1d5viSyRiyNgikkxdIKuQA6KM9Bt2KoiFZmrys0uaVq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cooSGfe0usPEWbZoHgQ5Hu1tIVpKbppCNEDuc6vJVQY=;
 b=JoizYsquhUZWCEion38Ra76RMe7VH4fOgaaXsgTyGIAMeAY4/Xe6D+3lgd04A1YNbxBfVs1k1vsErHuJQN2JTzKUE41YTHFmIy11T04hp7F5ZYGQdZzFc246QQdGQE3GB1/Ublq+CdUp4jCHoAXOSbMspZnlP319mWKx2b8jw3g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB4024.namprd11.prod.outlook.com (2603:10b6:a03:192::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Thu, 1 Sep
 2022 16:07:22 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 16:07:21 +0000
From: <Conor.Dooley@microchip.com>
To: <apatel@ventanamicro.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>
CC: <atishp@atishpatra.org>, <heiko@sntech.de>, <anup@brainfault.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<mchitale@ventanamicro.com>
Subject: Re: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for
 systems with Svpbmt
Thread-Topic: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for
 systems with Svpbmt
Thread-Index: AQHYvCu1UPk03OM4rUyI2zo2sTDn563KwX2A
Date: Thu, 1 Sep 2022 16:07:21 +0000
Message-ID: <04b2941a-a8c9-76e8-3189-76c51b811174@microchip.com>
References: <20220830044642.566769-1-apatel@ventanamicro.com>
 <20220830044642.566769-2-apatel@ventanamicro.com>
In-Reply-To: <20220830044642.566769-2-apatel@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b48c6a2c-dce3-4e63-ee48-08da8c340d7d
x-ms-traffictypediagnostic: BY5PR11MB4024:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0d9DUm0l9Sjbezv/TxzCaiR/rhZvvgH/JSwZc3vZFcDQUgiXNbZvo0Pn+jB2u4A5F6wxAAnnoma/xRQJIfe6Uwa6FKZ1qviRDgSPYICiOBCaHKP8aRGACBDV8IUGyEt1ogzkWvpn37eme//lngyHh0bg2r+RH3eviJNvQP0c2IiBSrRus4n3xz/9ZIxCfieRICG6NwUJ3WeaVNGemD0wz3lActWmeQxxkWEZm54pWBD3SK8igtxzk4RQ4ThlSXSLssX+X23U04T+E4sqEeYerNhK6dnJkd/GCNDZ4mgDQz/ehrzQdJf7eQ9O/4SYiq9xxrXV8ND5hYqmb7Cb0M7wvIZn1fLsj6q5otBQlc9y6EZE01KbYOrSqkVt+DlUV6nvmtEGWRFVdQQM0uiPGWu34lUMGfwgkcYLnebzqaPJI/q2bihX+IN5dYJjW3zuA7oPuAAeBkkU8HKn/5hgq/fxh/w/vtfR/xqfDx3h9IVZXIwYFxbJf2pSvvfJiY5nb5EU1XVpQK+0k1GvhflTFD02DMdDQchlfyfYp30JP9v/FOMOI7NFglPyCXTSX06PVwjZxTTUhJMuJZZHW/AWpnSL08pqUnLLd38qpQSXBpvLV8exj/sCzMtW1f0R0twOrefsU0fOZNY+8kCnd7u4R4QOF0W/f2MBTU2hbtmEE9xvsE3jiBlkQN6nMJHuiiZ8x0Y6nvkimi+mPrJYe8IlAZeBsrTF+cvLTLMtcBcJsX7nG4G1ANP6X97xwgVR01BYvKej5/c64wpEgozNJr1a8wocDHrm9k8iLsN/8rBUCfbhhf8rN2XF52DrxjKlVa0nGVuhQCnbfEnCFci7jjZcRmWynIm7uzmyQviDVC4Fm2ZLmMU8iVIAuGNNpsqb4pcWtH2q
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(376002)(396003)(136003)(6512007)(41300700001)(478600001)(110136005)(54906003)(31696002)(26005)(6486002)(316002)(5660300002)(86362001)(66446008)(8936002)(38070700005)(8676002)(4326008)(76116006)(91956017)(66946007)(64756008)(66556008)(53546011)(186003)(66476007)(6506007)(38100700002)(36756003)(122000001)(71200400001)(2906002)(2616005)(31686004)(17423001)(156123004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OG1YN2ovSXZRSWc2L3BZRDFhS3ZGSmE3eUZ5alZFTUx4ZndDSUZQYTc2azdI?=
 =?utf-8?B?QVJFRjJkV1MvbFdaS21MdDhhTXBaOHNaaWtseGI0OWJLa2N4OTJKbHBOTmNQ?=
 =?utf-8?B?bzQxdnVKdE94SlpKamFZTmxWOGdnRzllQ2pKKzF0eGhHNUxIUTVNOW9KdHNw?=
 =?utf-8?B?cGpycmxuZ3d3L1p2N1hRZTdxdE1MTk9yQmtWejN3eXJzSURWcHRENWFZS2FI?=
 =?utf-8?B?QUNYdC9oYlF1UXprRk5KQU9NaElDTndzckE1Wk5WRkdIa0tiTG5QUXVQdVcx?=
 =?utf-8?B?Nm1zSUVEWlRWNFpTeExqREtkWUJ1djh6eDBIZGVTa0MzQkJ5Ly9odTEvSDVv?=
 =?utf-8?B?YStIVkcxbzhZM21YZW0wQ3NMNmgzVDNXR21lVk5tVitoVEQ4VWxRWmFGUXBn?=
 =?utf-8?B?TTJDTDBIckpycjN2alV0VWVQY010Vzd2dG5IM3djM2cvQWRRYnliRi9jOGFz?=
 =?utf-8?B?Q2JXWVpVQ21EK2ZJMWY3bm9aQko1UHQ5ZXJnUE1xYXJLLytOMDBGQlFwcS9x?=
 =?utf-8?B?ZDIyVkMxRFVEVjNaZ3ptV3FCVUJUYU9qY1BUQ3hEN2tvYWwrVFlZSENKaDBQ?=
 =?utf-8?B?UkROM2ZjandmM3QyM0FaaTlIZVNPUTVraytGVnZEdDMrUHJ3Rk1YRzZyYTZv?=
 =?utf-8?B?YzArNWsyOU5aUXNNR2k0TDFjcUl1RmJWTk56RVNDUVdubG04RklQc2NZajE0?=
 =?utf-8?B?bUNGT2VTRVVJTEdhMWV0aG5GZFNid2xmS3c2di9oZm10VXVSQlhDVGVmSWhJ?=
 =?utf-8?B?bkZRTVkxZ0NXMG9xWHdhckhqbVBxczA4N2hZMS9BZUQxeTZ1bFNBaEdxMkZy?=
 =?utf-8?B?ZWdzMGMrREhsOElWZXFDazh5VGxINGRzcWJTT3Z0UDFDSUhjZWVBaTJuYWpC?=
 =?utf-8?B?UXlYbXdWYmQ4NkhmNERjUndrWkt3WjJkRnNOd0FOUEFIRWQ3cHlPQm02YXZs?=
 =?utf-8?B?NWlmY1o2bmFxbVhLQWUyTVZrbmVWVEVOeTBTWCtvVy90VGorYytnajdtTkRl?=
 =?utf-8?B?V3NNS3IrdkhTNTlqZlQ0UlE1Zjd2MEdOZ3JVMVhPWm5Xc1lNZStvZkthWGRC?=
 =?utf-8?B?ekxSS2JjSk1vQlE0OW0zL2dMZGdoRElFa29XUDJNSHkxSFc0OFg2RjQ0cXdr?=
 =?utf-8?B?WXg2amhHbDIweStNcGRGbEhMakZOemZqMCtFV3R0ZXRBV2gxcG11UWNRUkN5?=
 =?utf-8?B?ME1aVDdyaS8xakRFRUNVbTYwZ2hmbTIwTjkybG9tSG1KS0hCNDFzd2tjQmhL?=
 =?utf-8?B?dEJ1MjNhTzN5VWdWUnpHTDAxQkxSOXNGN3FQeUQ2ZVJEelpzckxLVWQvV0V0?=
 =?utf-8?B?SnMwbUs4cDN6VVVZVDlmbDlJZzFiT0U5TmlaYUZNYWlVU01iQ2ZpTndscWUz?=
 =?utf-8?B?Zy9KelJsWmczNFNBRUxDaStYWkNpYWVFdUZiYUMrYVdQc1lVY3FFY2EwQUh3?=
 =?utf-8?B?ZkwzekE5TlNCZWVRT0VFZHJwb2VqZStWN2Y2dlZuNjB5MlRXdVovbWZYN0gv?=
 =?utf-8?B?R0EzckVxY0cxaWxqZXVBRWkyNTYzNHZFLzRNSkNhbDdpeGJxNHdzVUFlRFJR?=
 =?utf-8?B?R0RWRzhFNnBnbWVJRDJjeTBSK0d5YmpwTmljN0J2eGw2ZVd2MTVSWHNjTkJk?=
 =?utf-8?B?VkFORDdPMTdWcDRIYndWRVYzL0NieDR1QXpIQTNjNDhlMGxSTzdvN212SDcr?=
 =?utf-8?B?VFpmRStHbVRKMGR4SzUrc3JBNldqaUlHM2MrR3RMbW5qcjlna25uMmhtYm13?=
 =?utf-8?B?N0pDRjFhMUhGWityWmZvbUtUTCtGdXliU0pkcW5NbGFCR2hPMURibEIzTENv?=
 =?utf-8?B?emozeG1WbUhhNFkyckw2aUpuWlROL0dVd05yOWt4VXRzam1yN3A2OTRCSWJ0?=
 =?utf-8?B?a1o1NFBWejgvYldoU3A2RlVEQWhKMlRRSzFMdXYrb1g0MzA1emkyYmxmek1t?=
 =?utf-8?B?QlFoYVR1NnRFVHNqN0lzSTVlUHJSR3JIaWRmb1RKTjJ1MHl0TUF1Ung2Tzdu?=
 =?utf-8?B?ZTRkaFEydHpZbW5zUVV6bFRTaE5oeEs5bVVsZk85cG1NZk1Reng1c0E0RjZq?=
 =?utf-8?B?UDJOSm9VTzFnSU1tWkNaVU1WZ2pzT2xnNDlzbmhaam1GV2ZMRXFObTE1WlFt?=
 =?utf-8?B?b3ZTcnFac0RXTzFhRkpkUUhxV0NmZThpRFQ2QVh1MXkvMnZCRGpGK3VxUlMv?=
 =?utf-8?B?VXc9PQ==?=
Content-ID: <B9EED7077B554E4AAD5AFAEBA5B59DBA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b48c6a2c-dce3-4e63-ee48-08da8c340d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 16:07:21.7797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+hTrGHHa9d5GgkTNdbSdgnUc0kIzdZSoKYKH7t95CN4wwrozJpSBMLA5Z1zUcPnTol2s+41JZWt9E6gbrTKfiEhoIYQhPPFJX8e28SowMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_090733_313254_A2B3C9AC 
X-CRM114-Status: GOOD (  16.15  )
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

On 30/08/2022 05:46, Anup Patel wrote:
> Currently, all flavors of ioremap_xyz() function maps to the generic
> ioremap() which means any ioremap_xyz() call will always map the
> target memory as IO using _PAGE_IOREMAP page attributes. This breaks
> ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
> remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
> page attributes.
> 
> To address above (just like other architectures), we implement RISC-V
> specific ioremap_cache() and ioremap_wc() which maps memory using page
> attributes as defined by the Svpbmt specification.
> 
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Seems sane to me too :)
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/io.h      | 10 ++++++++++
>  arch/riscv/include/asm/pgtable.h |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 69605a474270..07ac63999575 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -133,6 +133,16 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
>  #define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
>  #endif
>  
> +#ifdef CONFIG_MMU
> +#define ioremap_wc(addr, size)		\
> +	ioremap_prot((addr), (size), _PAGE_IOREMAP_WC)
> +#endif
> +
>  #include <asm-generic/io.h>
>  
> +#ifdef CONFIG_MMU
> +#define ioremap_cache(addr, size)	\
> +	ioremap_prot((addr), (size), _PAGE_KERNEL)
> +#endif
> +
>  #endif /* _ASM_RISCV_IO_H */
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..346b7c1a3eeb 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -182,6 +182,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
>  #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
>  
>  #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
> +#define _PAGE_IOREMAP_WC	((_PAGE_KERNEL & ~_PAGE_MTMASK) | \
> +				 _PAGE_NOCACHE)
>  #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
>  
>  extern pgd_t swapper_pg_dir[];
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
