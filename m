Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F07C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 22:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nOp6nJRFyzCIRE3CZSTabp8LX0Z5pXuq90ZTamR2VbM=; b=KH4cqmDAlzTt1U
	6mlWYvOHhfU3LegnTlqVMbWNHNAK8A1UB/fd1fAWwUnBTPigYFWhZBAO8rJ701WRyDud0VY5Qq+29
	tcXupXSlJYJAG4Ezpo1gsWcQEaZegENPDVEpC7PGUX6RTtS2lANEg91xTO7P38y1U1rjMHTG3ejB0
	cr6CDcfvrAbl+FAU01dB9QUHqOUkq+EYMrBDLQ+f9lXU19sZ1giv4oUHa/DyXsJ0vd6nW7sX1Lukc
	SFzCFOEfK4JNJw1GoIi5F7OiSKj3MDbhde9RfyWYmuaQwlEYX5h9qKKe2YPyWeUBtw8Ycn3LyEhZn
	lrcBedx92ylrhG6TcKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyKry-002xkZ-84; Mon, 06 Jun 2022 22:06:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyKru-002xjl-PH
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 22:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654553198; x=1686089198;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=RVtBY6itYWsqXZ1bg4klx2X6PSfAthHCK1M6AwNTTck=;
  b=MzJMOMJ78rSHzpjOzoREYfZrwrC35HLzy17BC+mwJ89TxUuRAYcRBA0S
   j0ivXB4BX3QCDEk6kJV6m5+RXYLF6bjcIG3YtzZUpUdHZjVcmlZoKQv5w
   FA2NSh069A/0NTiI/+XWYL6PLADQtts0m9a2tY05ufDwgVI+W3xgdDmAb
   ZZc86wajiIo7MfHFjRCCMoIbag0OfJrzzcPFte7yvMua5QWkQrLVNdy/L
   n/VOSlvXxbgiVqqLsNKbtgNUjgPLRAeU4wVtVsrwRMJEuVuQNW3YTFkyr
   aeJEZbMs7WxokMTbyH+cyeterAWR9UIEV/DQtH1iZj3X+nUUaZEBxKxSV
   A==;
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="176771000"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 15:06:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 15:06:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 6 Jun 2022 15:06:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6R5FtQ162gT+oRLpxzjJgCSAyD8zwDIeFcpqqLMLh/DMYD5s1hYni2S8loLV2HJYs80GuiY7l0aYqvKph0+UB0oYW1plP+J/TiuXT/R3s8uFwab9gRum/auR4gGFqIv926QCVCSH+WTXjCy2//J/QJWgmygw/sJfD5RDEFXVjya6c0OfGJJJ9Jp7vAGIpC5f7Nw6Sea5tZgtrRMhdzTOma5H47m4ebRARSI069BAFMuP4OjE3bnmwtJxHy+Hj3e4Mfo+i8Z6DJuTQXmSpNpkV1bWMtM6EG4OuOuC2UkTm5o9nVl6dN4k82LS7Em1tR5MJvpHYzg3U8leAH60uEd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVtBY6itYWsqXZ1bg4klx2X6PSfAthHCK1M6AwNTTck=;
 b=VBio78ZXxFx3UFmFVZu6RfulpAr4zO754nJH0Ny0OOfHdIukP0NiMStLO3gi1+Xs8CvuOQZ8HHlvg210fjH+qi9DEIXn/l1IW2Z6HE50fUiq8qi1Pb4w+U+8EBByoTkw2yEPaQqxXtOmB+z8GDsSjI9Z/QEQdpBiM7srqOc9om8YyFYbRvV5ezGLzxDhkcN/e8KBCRyX4EWsvTPYz034ggAND9GEsM0uT/rZc8XaSnVsJ9ZlL8tN0wsOIPBa87CZFEbepNmFtKa3RYO98KCGjlxwMYYJHIwx/w1JGyQUBpZZ7HJn6Tnsfag9azAwMiPlrFko2rf0Pm32HXx/J2gqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVtBY6itYWsqXZ1bg4klx2X6PSfAthHCK1M6AwNTTck=;
 b=D66QFwRNU508YzIXAvqNnPoaLFo48E07Y9IJX+AIZaSmRmANstLML30Qc5YvPgCAq+4EhtzRDNow31/YNB8StcAnmPwhc9DiUct3PYt7nmagpppcwJym47Uf59ulHnQGHndTqbfm9cAQQMwJiAvSDjcfTTsw31IL8Au6LjLgsBg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 22:06:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 22:06:19 +0000
From: <Conor.Dooley@microchip.com>
To: <sfr@canb.auug.org.au>
CC: <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<linux-next@vger.kernel.org>, <Daire.McNamara@microchip.com>
Subject: Please add Microchip RISC-V branches to linux-next
Thread-Topic: Please add Microchip RISC-V branches to linux-next
Thread-Index: AQHYefGmGrpMi2Za+ESP/Wott2kYNg==
Date: Mon, 6 Jun 2022 22:06:19 +0000
Message-ID: <5ecd9c16-ce86-3666-3c2d-a14218659d79@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de077bc2-4a29-47c0-4e47-08da4808c926
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_
x-microsoft-antispam-prvs: <CO6PR11MB560226A4A80DC0E634114FA698A29@CO6PR11MB5602.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DA+YwYxuBsie7R37q/TlmDL3g0E8r1X4pWGeSHcSPqnnYxM31jqng2Y4IXSPP8HXY2SJJp8d+PN4VkY1+PpmygHeIOH/KB7+PeWbLKs9BWQ+HZPhv+d1A8Dlt6FC0yN8NbB68PMYY34Dfx00patm7WGEvxo3Fkqw1yfLMZmPjeHUMxdWvCkuSb9kfdzJ7lBE1AXbECtVXWm74oaiZjHIQgzBGLHv2jiauntvucup/saIRQthX1pMjcuBL9RlkgFxqsesfuSTu1FgncVYDegWxVRC7tW0+NnQ0TBkkyBw/4DfgBvdniJXBqi9HM3+yHAqhdP3wDk1f/7/13aY7pB8aJUuwJjiwRYHOZSghzBHlMd6hzLWFaI5ilcv+lvoQgl/PWbOc0xa3HAasPn89e5ztf0WlIme8FLDtfnqUAL49bbcdRIIEhg4O1OyV1OAQ3EOGQHcaj438Ri3wsDWzsonKI5waUhsEv+DhyfWca7efBhK5m8YoJMaRlB95+Jzju/9kgQfgi/NcPRktg1GvbAXAI5DF6Alueno2lK83Obb08Z7aiCi0gDkD1HDUgU9iN5Hk9sNWm/jDMeEjoILJjUNeTvUoTajwLRATSq8yk/Dk3kS0QUbo6FhKueMaYfVP6+bjZT0u6DDPO6yQNatGqJ0ZMP444pO5spWs+wWbHY1UGCWjQgscyKoRiBbs9egy2+GdEm03wVav/HcWe7CR4hQdwHivEr1Qo8L6IjKkhQcnrqq29PX+jWY7jDaIgV8WqeVWtn2zNnO6TTgM6D7ossy/k+iIBYPcc94v2Dud44QBqIckwGzPWWOyvSVG7ukv/Z0Gi+WsRQIYr2RHYZIAN4Xyi6UdIR1SlDJOIj9hqwbvrgDPQYFuCBNkh+4X2M5L/ES
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(38100700002)(8676002)(76116006)(5660300002)(31686004)(91956017)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(107886003)(4744005)(122000001)(6506007)(6486002)(8936002)(54906003)(6916009)(38070700005)(316002)(26005)(186003)(83380400001)(2906002)(508600001)(36756003)(71200400001)(2616005)(966005)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmZiVVUyODd5SUl4VVR0ZE5TQ2k4WUNYdkw2WVE0R2x4dHd6bnpHVXd2WGRx?=
 =?utf-8?B?WFJjUDZHTkxOdmpjcXdCOVAxbWthakdSZ1ZCaFhMLzFFQy9mbitIbU1aeVB1?=
 =?utf-8?B?TXNqQVl3bU1sMzYzU1pPc0lOUTVKU2RwVi9lSkU3aHVQbzQxS3htK2VKSk05?=
 =?utf-8?B?NDFVamNNVEFVMHhkMTJqdVNUd3ZoSVA1YmdKOXJaR0NOOWRqMVE1ZWlFRllG?=
 =?utf-8?B?MVRSQXU5emszRksvcFhrMGRQdDUxcEcxbUdvUXNtM0FqaTdGV2pvSFdXTlBy?=
 =?utf-8?B?Z3Z6VjVVcFh1Y1BlQ2FtVE9xTytnd3ZvMnV1VkZPVWRPU01BUlVFck82YjNs?=
 =?utf-8?B?STNhK0tudURVRHZXbnRFN1NzdzhQSVZTVVI0S0xFUzRoL0xvc3hmM2p6Snha?=
 =?utf-8?B?WFJqZXltbFh2OWJYNnp3UEt1S3ZBVFp6ZGhSTVl4ZTYxN0w5ejlaRVhQY2Ji?=
 =?utf-8?B?USs2Mm1YbTRDZ2x3anc0RnR2Z3hwOXlieUhuSVE5am85ODFWTXNqUTNxakho?=
 =?utf-8?B?QXNDSkZKbFNpaVo2Q0MxS0t4KzJtekhsNWpqNWRmTEkwVzV2cnk3L1NCcE00?=
 =?utf-8?B?ekRyM1ZJR0UxYUhvWnJ2TFliMTU4WXpWZEJ1cVRuZlJxNlVPWVpjcGJndkts?=
 =?utf-8?B?MHVYRVNKcVV6K0xZOE1GSlN2TVl3SHJoUlFPV1BuY2NRdWhWaGRqOEIveEkx?=
 =?utf-8?B?THM4bWdEejlLMDI4UzRkeTBTYmQ1bTJYMEdTaXNGSFBVVHcxT09jQ2dhRVkw?=
 =?utf-8?B?c0Ivc3gzS0xwWGxqU3luTHZQN3JUNkpPM0kwRG1GNGd4dXNhQVNES3A5Mytr?=
 =?utf-8?B?ZmJaam1WTlFCdTIwWGlmMndmb3lwSll4bnJyS0Zsemd4YkZ1V1hOSjkyYkRy?=
 =?utf-8?B?MmcwbVQ4TXI0OFBtQVorWDR5SUtGSUtzNm96S0FOa0RMLzUvYWdkRDhYdXdY?=
 =?utf-8?B?d29vSGJMaVE1NmlleVBWa1VjSWk0NVdZK0JEdEh3Yzd6SWpydS80V2ltUzJi?=
 =?utf-8?B?MGNmL2Zqd0FjbUMzNFVxNmF1RW92bVdZNnIzQ0RBdkV2dzQ0Y2piZ1VSMTll?=
 =?utf-8?B?YlMzNEZ5bjhCNkdoZmdWRWg0NmhjUm1JSDc1OUV5Y29JZk8rTDRjcjhZd1BL?=
 =?utf-8?B?bDFGT0pXWFJob0E2TStBTDloWldTalgyVVYzQjBUWitvaHZEWlNOa2VKeGt2?=
 =?utf-8?B?NWtZME5OSGFZV0dCYUJEM1JrNHMxeXorOEduWTRTVFpZNEZyTEhQOWE2R3p5?=
 =?utf-8?B?TGlvVUpxbkI4YXZwZ29HcWxGS2hVUEF5N3ZvR3pham9Cd0U0bHk0NmxkVHdz?=
 =?utf-8?B?dkQ5TGFDOWdNN1prOGlrck10OUoxL1ozVmEvRFdrV29OcHA4bzZOZ2w5YmZT?=
 =?utf-8?B?dGczYVhQMXNRblBOZklZcEwyYlZ2cEZGYllqb0o5TGRIK25ORW5VVVNqRHIr?=
 =?utf-8?B?UlhvU3FwSWpRaFczemZEbGJwUlFhTFkrS3MzMExDanFQU3lqT0VadnhLNzVy?=
 =?utf-8?B?MUROaktoTFR5c2hsallieklXTGVBRDljQjZFT2FSL25oc2tZbyttN25mMkRN?=
 =?utf-8?B?OGhWb0UrQVBOc0hVMFJQNWJ1VW1DM29USnd2UlppZ2x0dWt4R1B3N0RvSFhD?=
 =?utf-8?B?eEVMcVpUS0NBTDlWMUhZQm11aXd3SDdCTEVwUW12Vm9rTHdGbjNQMFJ4SU5k?=
 =?utf-8?B?TUVVY2dJRFlpUWdkcWJuYWY1UGttZHh0VnBXM3ovOUtycGNTekFGTTR4Q0RZ?=
 =?utf-8?B?cjVlZldkNFhBaG56Q2lwMjZ1S0xBMCtKTmx4Rjd3TW9TZ0MyK21mYXloak1x?=
 =?utf-8?B?VU5US2dZUzJVS0xPMHFueVhXV2tic1V6eUw5WTlhcGMwRVkxcWNGRHlsZUh5?=
 =?utf-8?B?eHBwNFFRblplOEt3a3Zvdm1uL0NnaEJDbnIzZnBkSjNobjNJRTdmdjNEZVJD?=
 =?utf-8?B?Z1ZjbGw2R2t5NjBkb0tOclZaSk45K3MxcXFXeDg4N1dEMm1hbzJNUnNXK01s?=
 =?utf-8?B?Q1pLSkduUW9kdGVtUEJrM01jY25HK2M2MDF4dS9BNjlyZURwUGhkUE9ObXM3?=
 =?utf-8?B?eDd5V1ZLYTdqTnEyKzlacSsrbmI2NHpOY3pvY0p4eTM4OEt3MGZTa1pqUTE2?=
 =?utf-8?B?cGNXTWxSOFZNTGZ1YWtnWkVNdjRIYzN5YThZMlJjRDJXbXgwbWlJVE5NcDJT?=
 =?utf-8?B?ZkNtK1dWL215QnBLVGxUWFh2Ync4dDM1cmVyeVprWmF1Uzd4VDVMSk8wNEJB?=
 =?utf-8?B?MUV4aGp1cEthbERzdTNPZkxMTmJCWGxHVTNWblBTekRqSHZoRjhtZ0FPVVhR?=
 =?utf-8?B?KzNQdGtHSGxNaStMMXZMbXN1RDVic1k5STg0Wll4dUNScFZZZGtIN2o4Z3pj?=
 =?utf-8?Q?sMqKNycpnhGqLLuA=3D?=
Content-ID: <230A9B14B8DBE94DA845264E6795F4B8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de077bc2-4a29-47c0-4e47-08da4808c926
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 22:06:19.7390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ad8KxnPxWi0UZH4Ngqr3KO/igYS/V1SX/8MXhwCfhA10XbNcR1BSHYcrJDSovhIdDWDuT5cGwV00ESKwEl4ZDosxs3CXXN3FjOYbSOQSKWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_150639_139917_63993DED 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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

Hi Stephen,
To take some work off Palmer's shoulders, I am going to send him
PRs for "my" (Microchip RISC-V) device trees going forwards.

Could you please add the following branches to linux-next?
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-for-next
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-fixes

I had a quick look on lore, but couldn't easily see an example
of someone requesting a tree that goes via Arnd etc, so in case
it is relevant that the PRs will be to Palmer rather than Linus,
my branches are aimed at
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/ for-next
&
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/ fixes
respectively.

Please let me know if you need any more info,
Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
