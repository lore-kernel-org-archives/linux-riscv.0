Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4299ECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 19:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N02SRJEWEbNMGi+dc7wxvzbl4xPbrqor3+yJr9Sft6w=; b=a30QB4A2jCbDa0
	mG0B2MAML/DqkgnSjuZlX37h3rTxidCLlh/trGkATYvEn+Ay+WztAKHxxPqzPtmAz3cvjkqHt3rXF
	3Gru+5RDpWzQojKjhWXYBvTAmFoXILJ+n7wXTq5HaEBBRx8oM84HA/wJFcIga4LLDsvTmURrOGYOe
	jmhNjlMNUEIy6pj+DtqCSS15eBu4SxwIPlexQlxhWgj0SPWbYQ4nuPCKjerz4NrqHucrlZ7PYaGb5
	NpEnTg3gt1UhkIw0TiZJyQmTSO9A56c3M+MrU2x50jTb3oSkMoQgphFgEoyjX0Zm+w0/Hhhc8y6Pq
	QzN8VkUXOjEdi+H+OG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHXN-0092mo-TE; Mon, 05 Sep 2022 19:13:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGQL-0083bG-K0
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 18:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662400937; x=1693936937;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=4vrzNIxJEsTToIDGUogFksBlmMiHAMGToObE3helzWg=;
  b=0NEZiP5/MAgPZ9HQuy3RRv/kLQhW2fupT+k9+NLXe4fa/uKt1yVbNCSj
   UcDgMmvpYRofC6FImdWBYUpfS97WwLPzoHSgdWrI5bNpzZ+kiLvldZL+M
   tBgE09PU3kGknorX7LUV4az99IsMYcA9uDrMO5mVZ8S2QNL0VFdobpqBq
   oKmnuBsDMEaw9kCuYFQavb6kaIttybKCY9t04aB+aZQy7PDl3+vAP9o88
   vmebnRHynB1Li4NDe/CzfY8YbA9LH0228N6V/i35bie5NeDfcIlc+QTIl
   A9dBICSd810/hnO+NvEn+FdeDlmH7lWTKoHjvEBlpn2orHwqmwXfA7yIO
   A==;
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="179243691"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 11:02:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 11:02:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Sep 2022 11:02:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSz3tYh/75VPe0puvZOuSvV9BaV70NWLZTTX63dUR6JN9lAuLx76PZacauc8oMppFHVf0PNi0bdnxA26SHL4HdpSop8zcIhLMbhtN4DA3f+rTPR1fTYJy6UFtCOauGcaVzTpxlMNgcp5dmPSqGUD4gq7mG6R2e44MpgkmKjeUsWMcH3O5/e8dCrykg91nmspBITwew8Fuw5UWBNuGmXlCc6nLENDySTlCuQAIPPwiNPNpmAlAc5gYIGGgm2b3Oqs6zL59c8ax8s9cvbZUtipvaImYQRHz6oq2rZLtmEluLPEu7DjKdfjucpOzq8yee02DVdxOnuPqUdFeK3Pt3ygqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vrzNIxJEsTToIDGUogFksBlmMiHAMGToObE3helzWg=;
 b=gr91Ua9k5YMuMRhwkKDc4wIYWJKmnFf2khdVjKGuIlF95ALTN7TtJhpu0vePRFE7rn/EWySyPUAS40Z5orHLNiEXzTAWewJYox5vHw1X1OAJJOLfFMRQcLqPBZwoa3gAlhIsI0JFDkmjPnAUNaS3Yuxap743Jmc7guEyRqK+ltgfFIQrVRnlfNgH91aQMUkZYtNrIuuPs6ZgbSIt8N2Qb0MTQO/rXwonCa6AnUBBlCcQr6zpLGnEL6JwT6INAy/JzmLVyNPUUZzxIlv6LSvEfQIvY/YtapxnX428V5AOLJ3/2i/doKV0DZD/CQ/tfklfr13MPPcmthLJWGQgLBIeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vrzNIxJEsTToIDGUogFksBlmMiHAMGToObE3helzWg=;
 b=dGsh9P1+aQ+Yw176oNswwO8oEBrrS94OMPewCtsS/XW7IX+2Yn7aeFtN7Mn3Sig4XoYA06MAnPUplFrgsitRldOKQq2WFYOHX1jGRx8vG33RaGtdUxh33mhTo89DvrNyImR/HL4jqdXTNkAVfo3Z970cDN4fk7zSvgP0jCvZxZs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB2843.namprd11.prod.outlook.com (2603:10b6:5:c7::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Mon, 5 Sep
 2022 18:02:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:02:06 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: sifive-ccache: change Sifive L2 cache
 to Composable cache
Thread-Topic: [PATCH v2 1/6] dt-bindings: sifive-ccache: change Sifive L2
 cache to Composable cache
Thread-Index: AQHYwQH9JkERmMJcy0a/nxtQVT6p/q3RITKA
Date: Mon, 5 Sep 2022 18:02:06 +0000
Message-ID: <c5dd145d-1055-ed85-e6fc-b6b6c5a4affe@microchip.com>
References: <20220905083125.29426-1-zong.li@sifive.com>
 <20220905083125.29426-2-zong.li@sifive.com>
In-Reply-To: <20220905083125.29426-2-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddc9d41c-afda-4273-a86e-08da8f68be76
x-ms-traffictypediagnostic: DM6PR11MB2843:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: slAw+l+kwjkJT91OtOurAGSmbCzwOvqpoWFqA6R7KSRIMgJygtOFzwcH/Ws9y0vXb0IFBaOeO6GurNDrZ/izEMFoJbl6PEBYG3JpHfgrpsTuHzL2BZvc0eIu7oV9/tqSD99q2CGVbB2/ygwIfU2dgSfMWVx7GeDj+VKgPNqnlHVYP5TK/tkq3oYb7piT3Rw51pzME62snzOCgreH73/Qd92lb/MhDjAzAtUT8JKJlOeuhSg3I7YlfGe5tqF2a2W+0HOehFRpC8bapdAiwq+WvTVnQ+9B8/eONqV/iRgL2DolqMTuVVC51rivgoZ4ZAu6umnHWkTRUqWj5e2j7ZY7j9/IH/QpoxqppRgl8xCB5PC7tggFrM6kIdC/OQepghDh7oFC3wbou3vJQtw5XjqjRCzz/qIVI4gJd3e0MsE4xO+H+cmGZOZ2M05gOFSOl3ugova9vFAz73V40Tmm6GRrf6tv71Ikle+fekonE3IlsXUlXmXP8gt7ZcBl6fztcOHHEjmu7jC92l2cZSxzIIbHWA2GVirkY7AkMvWMaRhpiDmZuUpZf5oBktqRpMb+239CFgjqF68nRIUR8eT5oMY3PFkhuJEs0/8OJHTJJqkN1E8jGjgsQs4klAebKi1sCbwubPQAmM8QcZQyR1nxDHRZSAg/F4ghh48Zn5qPpH4LzSR6Qw851aaP1tO8mGY5G+DH2I6K/KBGXLG/0xRK5G5EokFkMZDgM3sgd/yNZvTYwJ7JIX9/fVudTv/poJQ1J2NXLSt5zRbd18ChS1HmgNEoa84JSF6okMle9stu1of60hr7OqMgy4B5db0oe73yanwYQZ09JmXeIfD2nji0wMqCwo7lLh6ftWOXD41bPi+A6Huold+n3yYvXaEhX4+rhnpaRheErpIlupdfobQMtyiFmiiB8ScPEogzvkEo7r62UAU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(366004)(396003)(376002)(2616005)(2906002)(31686004)(186003)(38070700005)(31696002)(921005)(5660300002)(36756003)(86362001)(53546011)(7416002)(8936002)(6506007)(83380400001)(66556008)(41300700001)(66946007)(71200400001)(64756008)(76116006)(26005)(8676002)(66446008)(38100700002)(91956017)(66476007)(478600001)(122000001)(110136005)(6512007)(966005)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0t2UWs5MEVwT3BLcnpxQmFSSW1odmdqREltcnBOTzhONUxUNE9kWlZYTDlZ?=
 =?utf-8?B?K09PdUllKzVGdUJsNCtvYTBHcCs5ZzhWOXUvcGVzWmF0TGN4anoyUHNvS1FE?=
 =?utf-8?B?N1BlbCtDV1F0Yjl5dEtZMm0vL3ZQRlFsZ2cwUGZJYWVNc0JqRk1CTjV0bE8r?=
 =?utf-8?B?WCtsQUtMNFV2NHpscHNGMDcxaHVUMkRVN2xFVXJyNFBLNFg5T0w3YWRJMDJW?=
 =?utf-8?B?VG16VndFN0oyNHBkWmZlaGl1VjVoS05aWVowWE01eUprSGRNU3drOHpxZUF4?=
 =?utf-8?B?Zyt6VUIydkJLWGdPcngxREdCcVdRNUFGODJkWUptankyb0ZzUjIzazZYak5h?=
 =?utf-8?B?Q2thSTdVbFh3TmxHVnd1b0d2eWN1a3lUZUc1NHhoYy9Xd2o4YXI1VXVXanN5?=
 =?utf-8?B?SzlqYmNtTGFXVXcwWUVZcmRGS2ZuUHcrYzI2VWZFTy92YzMrS1dDTWFVby9n?=
 =?utf-8?B?bmpaOFBOd3dmZzdPaGtsY3F1YlMyVzM2VFU3WFc0UVBqWmxjN1lHUFVrWjhE?=
 =?utf-8?B?OUxtZlc5WldjNlRiZlBaYTh6NHQ2bGRZN2dMaXJCR2ZlQlJMTXY4UkcrT0hn?=
 =?utf-8?B?bkxKNHVDK20xTS9BemV1czEwaVoxay9KWmRLYk1UNWVMZ1hBKzFYS3RjVmo4?=
 =?utf-8?B?K0JKaVl6Q043UlZWMzd4amQ1U1I4eGJWMTV1Z2dxNHU5bGE4L0R6U1JSODFN?=
 =?utf-8?B?Nlg0d20vYmM0cjllQlRlYy9xekpFK08wUERnSzZWOTBFWDJtaG8xN0hGM3pa?=
 =?utf-8?B?UTQ2K1lrRDgwemFwbU1kL3VQczExdGU3K0JWblQzVkZOaFRIeExEU3llQlRM?=
 =?utf-8?B?TUZpME9NREwvWkh1RXMra2Y2ZXl6L0tRdU4xQUxudFFsc3BkVm5vR2wwVVd6?=
 =?utf-8?B?Z0cyV2dQeUhQNmZLRHdGWFYxZWpiQU1XUnlYOE9yUFZGUGtXUE5LbTNyKzJm?=
 =?utf-8?B?YXUyckVORGdyT2VyeUZaV2NCakFwVGtIbnA5eVJaYzY2TTZqbGtFSlR1RmNx?=
 =?utf-8?B?MWpCSGNIUlZVbHJ3b2dUS3g0c0tTVUNhamlpWGdqcnJ2bEpxVnpvblJBQnV1?=
 =?utf-8?B?d2ZMNG1XeS9UUHZXc1ZRbUtaL2hRUCtjdUJJWGh4SjV2cW1WUUQ3RDFCWUJB?=
 =?utf-8?B?ZjVycWsyaW8rUm5rTDZRQVdWN3ZiMVZUN2s3MXRXcXVrbHFPWkd6cG1sbGp3?=
 =?utf-8?B?WkhFSFhkb2tBclJYVzJ2MFREdVcwNXRrejF5bENmTjZIS2RwUGhuT2FMbkZV?=
 =?utf-8?B?aVpHeENveWZpaE91Y1d6cDMxdFdWaEM1VXpac2tSeHNGTEtJTStPYVJVQU9o?=
 =?utf-8?B?TGZBTWF4c2FSMzZ5bGk1ZWh4MGEyUHp6N05jSGtiaHByeXRSOTdMQlFWLytB?=
 =?utf-8?B?d2d1VmlNK3BQUGp3UnI1VnAwSVViTi9wRVoyaW9yTG1DeVJka0tCcnNWcUoz?=
 =?utf-8?B?MVdiZlc5Ny8vbWFuTkRHQlF6bE5VZm14Y3BNN01pcmQvaXppVldEV0xpMWpK?=
 =?utf-8?B?TkRTaE50Q2xaaXllZGc1aGQrbzEwMlVPMy9VVXhCcm11M0hsOERnVG1XcTVz?=
 =?utf-8?B?NC9wUGJUSkZ5blVJYzl0UURMSjcxb2ZmamlJWG9rWm5rdHhHS0FSK3Q2QWJo?=
 =?utf-8?B?MTl1WW00ZE5kSWZOcFdOQVpOTHRiZWpYVVFFQ1JDRzdoZGd4RDBNNURIMlVR?=
 =?utf-8?B?aXZPSWlGRlNtMW1Wek4yV21YUTNKYWdPaTg3aXJhOXdRbGFBWkl2Qm5oRXB6?=
 =?utf-8?B?MWNFWTltSG53cGE3WU13eENEdEJkd1FmSTkwRVp2TFpidWZDcURQczBXNmhQ?=
 =?utf-8?B?ekNHSXF0MXFZdGRlSDhSam4vcDZOTit1RXpFVGg5emlBVnAySkdXTURpbFZT?=
 =?utf-8?B?cDhDa0o1cGd3dVZxakZNci92NFBKcTlqN1ZBTUhPa1RKMFgvRExlb3pxMnlF?=
 =?utf-8?B?Q0NTNjRQMDA5S0c2OFgwRXZzSmxzZHFZVmZLTlhMeWR2V05iQ3loTTV0NlQz?=
 =?utf-8?B?ajhmL3ozOGNmSW9OY0pLcmx1cC9yYUhscklVRGV4TjRicURCRU00OHpsSnl3?=
 =?utf-8?B?Y0QwVzdINC9jR2szeEhtOWxIUW53TGpHNmNyQ0pFRjBlcTlhaFF6cWE0ZzEy?=
 =?utf-8?Q?CcMK/5+Q8k3USU+8u0/sVAcrM?=
Content-ID: <0182B190CED0E84AB3EED368D57E9C07@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc9d41c-afda-4273-a86e-08da8f68be76
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 18:02:06.0851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ehdme7B8Dov3/UGUGHlYcfDyRDrQuRDb29lMGkadznmsNFwGE3fuDYV11WdoTmQzAHpZubnFKNz6C7Hecxo5b5Mcr0AY0PEQpaqb+zpnZOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_110218_488749_E21A6BCE 
X-CRM114-Status: GOOD (  19.64  )
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

On 05/09/2022 09:31, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Since composable cache may be L3 cache if private L2 cache exists, we
> should use its original name Composable cache to prevent confusion.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>

LGTM, thanks for fixing up the patch to actually show the move.
Not sure if the DT guys will want the move and the extra compatible
to be in extra patches, but to me it seems fair enough to do it all
in one go.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Suggested-by: Ben Dooks <ben.dooks@sifive.com>
> ---
>  ...five-l2-cache.yaml => sifive,ccache0.yaml} | 28 +++++++++++++++----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> similarity index 83%
> rename from Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> rename to Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> index ca3b9be58058..bf3f07421f7e 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> @@ -2,18 +2,18 @@
>  # Copyright (C) 2020 SiFive, Inc.
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#
> +$id: http://devicetree.org/schemas/riscv/sifive,ccache0.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> 
> -title: SiFive L2 Cache Controller
> +title: SiFive Composable Cache Controller
> 
>  maintainers:
>    - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley  <paul.walmsley@sifive.com>
> 
>  description:
> -  The SiFive Level 2 Cache Controller is used to provide access to fast copies
> -  of memory for masters in a Core Complex. The Level 2 Cache Controller also
> +  The SiFive Composable Cache Controller is used to provide access to fast copies
> +  of memory for masters in a Core Complex. The Composable Cache Controller also
>    acts as directory-based coherency manager.
>    All the properties in ePAPR/DeviceTree specification applies for this platform.
> 
> @@ -22,6 +22,7 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - sifive,ccache0
>            - sifive,fu540-c000-ccache
>            - sifive,fu740-c000-ccache
> 
> @@ -33,6 +34,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - sifive,ccache0
>                - sifive,fu540-c000-ccache
>                - sifive,fu740-c000-ccache
>            - const: cache
> @@ -45,7 +47,7 @@ properties:
>      const: 64
> 
>    cache-level:
> -    const: 2
> +    enum: [2, 3]
> 
>    cache-sets:
>      enum: [1024, 2048]
> @@ -115,6 +117,22 @@ allOf:
>          cache-sets:
>            const: 1024
> 
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sifive,ccache0
> +
> +    then:
> +      properties:
> +        cache-level:
> +          enum: [2, 3]
> +
> +    else:
> +      properties:
> +        cache-level:
> +          const: 2
> +
>  additionalProperties: false
> 
>  required:
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
