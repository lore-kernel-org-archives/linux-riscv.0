Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C318C25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ih7AiDvNtm0BHRMhmWtwB3GNvHo+AAXU1x/NQGyuLwk=; b=ti3BBWWs2w0fqO
	UAfKpePH4cN/RsOFIM87iFFDG9gygAdNtZo2xnZpmhp+G+5d/Pxpr6bSwbrdgFJkInAZBuVOnlLOJ
	x7ThVQ2g8K4jaP69ivSiO63+SyPcBk7b2CcoP1jdztdnyHB97gGmxc91R8pm7NNtmLYBnrHR53gsB
	8izzm6gsCizqNC7ATV8gk+jHzXRawUB+hOQwa90txraoOYTIULKjSpPuG/NROyHUh/irK8+lrylZ4
	4xBGGSuzEkPGQvnoQM6MtrdTb+kwfixIWTYTQe+N1itn3r08nkDvwtmQELBkzKsHONV0gmib2+Vp0
	NgiCPT6rIhH6v1/zvv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FiZ-0000000A3Rw-1O4a;
	Tue, 07 May 2024 07:58:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FiV-0000000A3Qs-1zEe
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 07:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715068707; x=1746604707;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5EssCNVHJo6pjKWHB7PpDbfaBu5itJo78VDNsi6q5lM=;
  b=VXF+pwGd8cjvb4TKOBRoNXwXr5XsNCYGgUOhLjncBChG7Na/uSbuhvfV
   d1G5RYstleT4irkWc63lR+VrAoyh/C4IZ69jTcJfuAOQ31HFXOZgfrswe
   xM7bcpYn8p3jMsraMzeKd0j+HbqPn8MwtSCVTZi301TW7QyRJa9BD+l6K
   aHEk40Lfaw3e2Afjq19AB+dzuQnHogr2tWinuEY7Q1GI2fW6pM3AxWuvD
   gWV0/9gFu1aEm1P9P72q0Z0I2lwb5nrE+hl6Dj9V12wsDf9gnyMe6rOQQ
   7SE7R/qEvhXCblv3TbbfPpI2NbZb5lWOX26+ALnKE8WEVQOp+PlwfzB74
   A==;
X-CSE-ConnectionGUID: pDU4R+kjSCq2Htzn5riqEg==
X-CSE-MsgGUID: 0hVTZVqUQSSb+w9hyCzVeA==
X-IronPort-AV: E=Sophos;i="6.07,260,1708412400"; 
   d="scan'208";a="23940927"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2024 00:58:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 00:58:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 00:58:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZdq11/nOISorHsivC6PZKXvFyNiPeikFelFMyQAcHxb7XfJZKV53qIDYGuxLS8znsYFRcZgwM8nT/AXIbgNrgw8fEp9nKNtG1CQHD9QNiuwVSn8Urc2HdWiVDrgVbTV7oQIwrmUofonJYs8f5Sn38/QiiQbFrovTdX9cdLbpepFd44Myn0WaV8e/SZ4MHXtxsfVjzhXSu/49OAz5os+lHlJcGI+XeM1ydLjgia5lI7Hta2CvJ+duzUQkwcgLhPpcHpMGqYjejry0RrNz3f2G6HgnD1i8ROVqd4l3NvWH9qTRV8FeT6katJYef8xXgcz5Wl0ILbr25qCcHNQ5OFdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EssCNVHJo6pjKWHB7PpDbfaBu5itJo78VDNsi6q5lM=;
 b=ljnU/oq23uaY+fescegS37Ws+qp0hGfP//dIZldR4FCD3zqqqgsXO4qpxQbC1Bv63pWPEN6oYjyUgS5dHy7w1LQpF94b+2OiqVOUrM5bv7Qb2Vo096djKgfsaiaRbQ7V07l4BDFNnUtgx6pmxB6FX0Gicv3VihLNB+lJwp3aswP2pVQusb0Txox5FNo/w3tmF8tprFLXRfR3K0K6YW9HLitZ9Sv8I6FHCkCwa2Vxrspdm5lhDnrsW2VApTFk3yd2XkE3/JvZVHnylenx0LRJrXwwTxBAILJTENA1DmFBkM+6LDP2mhE4PNNjLs+lbtiMvc+W5/ORS39l3PyLvyV42Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EssCNVHJo6pjKWHB7PpDbfaBu5itJo78VDNsi6q5lM=;
 b=m0PiswWfXTJgQf2QvYdX9T24HAfHgqXV5OcHhOsDkFKJqNRG5uprSlU79ndfqTSMVbX7mVo6T86IO/JrO4EjKeHOQGdb3akeclV4o5w0x/B11h8MODatQ384pMiWJCW2SZql1gv+nztyXxx3wnsDfSajPWbfm4lUK0iB13nt2btmlfjq12iAKIqK2XqiB5SqjkhwDrSTYPG//YRD7GtrFjbX7jywMZX1lze02ogrVF6shsPhs/q/XNUQw+0L9PjG5SThDHfLOVpNtC9SJlYCHmGe0riEEC3d/pbcyjpkXvrYZBB0EaU07AdqoSpERC1u2ahsiCEFpgZFe63fV3jMzw==
Received: from CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Tue, 7 May
 2024 07:58:07 +0000
Received: from CYYPR11MB8386.namprd11.prod.outlook.com
 ([fe80::22ac:bfa1:678f:f510]) by CYYPR11MB8386.namprd11.prod.outlook.com
 ([fe80::22ac:bfa1:678f:f510%4]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 07:57:55 +0000
From: <Prajna.Rajendrakumar@microchip.com>
To: <broonie@kernel.org>, <krzk@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Conor.Dooley@microchip.com>, <devicetree@vger.kernel.org>,
	<Valentina.FernandezAlanis@microchip.com>, <linux-kernel@vger.kernel.org>,
	<krzk+dt@kernel.org>, <robh@kernel.org>, <Daire.McNamara@microchip.com>,
	<Prajna.Rajendrakumar@microchip.com>
Subject: Re: [PATCH 2/3] spi: dt-bindings: Add num-cs property for mpfs-spi
Thread-Topic: [PATCH 2/3] spi: dt-bindings: Add num-cs property for mpfs-spi
Thread-Index: AQHanJ37n9FOOFXPxkOxyyvGvn4yU7GEB80AgAFxNICAAB8MgIAF122A
Date: Tue, 7 May 2024 07:57:55 +0000
Message-ID: <1ba98f27f1cc4cd6c3db0b398fa3252c20ef5c3a.camel@microchip.com>
References: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
	 <20240502143410.12629-3-prajna.rajendrakumar@microchip.com>
	 <10671947-f418-4520-a29f-4ce129770e65@kernel.org>
	 <1edb6c4c1a66c1a2009278b99f897e3a71b592c6.camel@microchip.com>
	 <7b6489b7-ec9f-4fc7-af72-4d5cc87acd7f@kernel.org>
In-Reply-To: <7b6489b7-ec9f-4fc7-af72-4d5cc87acd7f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8386:EE_|PH8PR11MB6756:EE_
x-ms-office365-filtering-correlation-id: 2c492028-021d-4f07-bb50-08dc6e6b67a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?NG9SbzhXdXpaSkxrRnpvdE5McEFLV25wVU5DTEc1eFdMVURpVEpzZmU0WjVj?=
 =?utf-8?B?UEo3K0FSNm5VQWNkWForZmNidFFqM205akZnbVBXMkpQSm5jOU9xejBXdmt6?=
 =?utf-8?B?SDVvWkdxd093Y1BrazJ5U0dCaXdWcXlMdG5DTnowRms4alJYQ2FJV1Jhc0RC?=
 =?utf-8?B?LzNNejNhYVNkcTJabFhOc0xGMkV5S29qcXJTQXVPcUtISmwvZHpIaGgyQlQy?=
 =?utf-8?B?d01aZG1xa05wMzBXc2YyeStOQVJjYzU0akJKc1RZMWFiR3JFc3BOQ3FvME5t?=
 =?utf-8?B?S2lLR3l6Uzc4d3ZNMGRPMEpDbEI0K3Npayt3NmNkNzJ2R1FhZ21YUTFTWmNx?=
 =?utf-8?B?Y2IrdWFZN3N1MlNnNkU2eCszcUJycFpEQzJLdFllcUQvYmp2MWZVY1BHSDlk?=
 =?utf-8?B?K2RPUlEyUzA1Ti9uV2ZMMm1hb0NoZkRoUU1iQUExTFJ5bFNkM21YWGVRQXRQ?=
 =?utf-8?B?d1dqSEdVbUFkUDFMS2FrYm8wOUZURGhRRGpzTTNlUitNOHhwVVU3VFUyWFJa?=
 =?utf-8?B?MmdsWGRPNU0rTC8vMEtzazh5N3g2M1RBMldLMFNsUkJHSndyY2VJajE5RGly?=
 =?utf-8?B?SU43UGtpVUI4T1RaWFR6NHFZL1ZJeW1wbi92UjlXUUtlT0prckZnQ2JBTk14?=
 =?utf-8?B?TG1pY2syZGU5ZzVsdmZSVXlnc2QzNEF3ejlYRStOY1hBR216M0d5M1VmVmM3?=
 =?utf-8?B?N0JjK0tWK3dEZEpYUlBoK2RSMDlGTEl0ZW5aRnhMN1JSZXhQSEIwaFhIbUpQ?=
 =?utf-8?B?VGVLTm4xOHhyYXYrL1IvQkhqUHRDY1BwU0JqZEl2aUNBaEJ0WnkvaUhPbGxM?=
 =?utf-8?B?M3B5VW0xTS9sNFMwNkxDN0lrdDRaZXlGcHNUR2Zvb3JxY0xTdEJwbTRKanZC?=
 =?utf-8?B?djMwY0R2bTdFdHpUT3BLZjRXenc4Mno1eGhVczhLOUdiR3NHMjcwdUZtTTIw?=
 =?utf-8?B?WFAzVVU3N29vL0ZQemJhenlaVFBHQXpUTE9pMWM0VDlaMkc3U2h4VDR2VlNB?=
 =?utf-8?B?dDdTTkxHdCtYWEQ1aWlTYWhCQXZscERadDlmODJFOTdZUVROdDBEQ1EzcjZX?=
 =?utf-8?B?K3NnaU1RNDByT0p1TVZPSWZmMXBERnBvYWdXL0pTU25IS25TZ0lndnpxM1A2?=
 =?utf-8?B?cWFxZjhMTk91ajF4SG9GcHJCY2s4aHRDemRHZmpWdER0Rkl6RENMRndibWx1?=
 =?utf-8?B?ZVlKVkIxRXNvQ3FiVjM5Yk9UTkVXQjJSd3RSNjVsNnF3R3c2a2lMOW5SSll4?=
 =?utf-8?B?OUZmYjBTSEdndTFjeDVLNUlRZW04MUdLRnlKakhGLytZeDRBdFppcTA0UlRG?=
 =?utf-8?B?R3l6cmVhdHVNSHIzUGVQRGluYWlxcnZlWkxsV3FDRnNBTjA1SXdKNGJPNmR5?=
 =?utf-8?B?SUdKc21Ibno1dVNXajNVM1pKSE9NajdEZXRwQWEvV2h0Sjl1MGdyRHpJdWhR?=
 =?utf-8?B?WG9DR1A3VXZGRTl6a3Rzd2hrK3dTNTlQdkJOUWxPbmtjNkxVbmZYcHJjYVAr?=
 =?utf-8?B?ZzJHTGpKYmVoUjRHTUFzTHVMVlBUQURGc0FTSHJLbC8xREkyZ2N0OG92RVVO?=
 =?utf-8?B?dnhHeXBrckJ0NWNROXBRMmRwSzJZNy9RaUE3QWxldUtPcXRnZVdMOUw4WlhB?=
 =?utf-8?B?MnpZZWlCaVIrZkNQdFlEWjZyWjBlNkZicE8yaTFFM3lQd2g4MFRCOUhuMEVN?=
 =?utf-8?B?dzJucy8wejJQbUdlSWZCdnNVT3B0UnpnczFETHNHOGwrdEludWlxb2JNby8r?=
 =?utf-8?B?bW1nWWpEVW54TjF4aEY4dWYvV3NieTV2dzliNGRwSCtCbUxMYjdCbkNISjdR?=
 =?utf-8?B?eUhxVjdhRUwwRlNYcU0vUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8386.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWFoNXNkRGZOZUI4QlhNOVBHYUkxY0Q0eWgrNnQ0WEpBc05DdGhzNUxGN010?=
 =?utf-8?B?WUc0SFNsTzRPdk9zdDBvZ3l4ZW5OZDN1VHlqbEpPM05ZVkJuQXRLT0RMdi9Y?=
 =?utf-8?B?NWNodkxLc3k0alc1cWE5TEV4YWxheUo3MkZnRmE3ZVVnVThDTlFweUtReVU3?=
 =?utf-8?B?Nk9yL1hQZXhTTzI0T2dDY2sraDhVQlBnSE1zL2lwOXE5YnBzd0UwTXRJN3gz?=
 =?utf-8?B?SlB1VmJKekpmY0tKSzl0REZHY1RuQ1RRcmpZbndxVkEySkhKYnFvd2NacklT?=
 =?utf-8?B?VHExZ2oyWHlpTjlGeUk3bnlaMHJCc1g1dHJMTEVjUmkvYU4zNVZ4cE5JWEVZ?=
 =?utf-8?B?YkN1SlpSYlY0T29KUUE4dUkrNHFrVEEwOEZuZzNTWHVra0FrWWZrNU9VWGZ5?=
 =?utf-8?B?czRLQXEweituZlNXSUtwYWpyQzVwWFo0QXB2WWltWGkxdlNpZFNGWGhmT2NV?=
 =?utf-8?B?N2UrT0dNdjhIUm94MUxmeFN2RGJ4UFBHUVZuSEErSGU2SUtpdlFGVUUwWGtB?=
 =?utf-8?B?cVlrWEhOZ0RUSzg1U1YwMU5aNm1LcDh4SSt5SWZjZGZyT2xWdzhmYThYeHV0?=
 =?utf-8?B?ZXlzcjVad2VvRGMxVWZwVjlXbEQwVGVEUjBjNmg2QXByaklDdVFVLzBhZ0cv?=
 =?utf-8?B?dGNVY1pkVHEzWGt0UlcvQkJEcDI0eVBUcUU5KzUweWhkVGVqcGFnQmtEMVY3?=
 =?utf-8?B?OGRyU24ySG11NXJDVnE0U0U5R0REY3RxRzRXdEZKMEpNV1BnTjM1Y0Z2WFcr?=
 =?utf-8?B?VjJGL0d1YzJldXlBajZkZTU4T1FwR3VacW5veG5CUmZqVlplNFNlcFh5MHN1?=
 =?utf-8?B?L2RBRGNSM0VLMHozeUs5MEthMENXdE1Da3ZUaFlKckZhcjRiSTBqOWxJQnlz?=
 =?utf-8?B?d0JCNnpKL2ZTSkNWWmxxY3RVeUJrOVk3M2sxN0xTRFBQaUVlTFBEM0wxT05n?=
 =?utf-8?B?c1k5QUtLcUhnblA4RjJRQ0NwUS84Wk1WVGhXYTR5RWhLOTk2OER6aWdTajk2?=
 =?utf-8?B?bVEwWDBvcjY1L3Nua2VMOVk1MEF0UXZXK0t3ZHFBbzkxRHdLQU5Tei8vbTNJ?=
 =?utf-8?B?S1lyYzhNT2NHdzNoQkJoTmV4SWlGR0pQYnh6ckFkcGNzMG1aNjJDTEdUbm1w?=
 =?utf-8?B?M2N3ZXNUNFdWdlloMko0ejRZYlUxMHRLdy95anZ3RWxpVGJOVEJxUys3Y292?=
 =?utf-8?B?b2Jjdy95ZnhlRmNIKytra3ltWVNITFB3bjlKSVl1aFVRMHJDallhVXhmUkJK?=
 =?utf-8?B?NHZuMjBUcmZnREhweHd4amhXbnlsdys0Z25LMFRYa2xkc1FrSGpTTzhxQWFB?=
 =?utf-8?B?N3dkYmF5WXdKQld3K0NRalk5OTgwc2UvL0FWVmJ0Ykp0NkNTWTRPTXBhMlRo?=
 =?utf-8?B?QWRDRklNMExVVVJ4N0hHaHpJNVBWdnBIT1g4eFQvUWwyUnR4QzZIc0pHby95?=
 =?utf-8?B?SlY0S2ZrLzhTQTNudk9yMkIyRmE4aHN0WHMrb0pzZFhSbmR2MWZFeitqY0pt?=
 =?utf-8?B?NURsWHc1dCt6eTdiVkI2TUpuQnE4alA4RUUxQnVTMWlWSDkwMDRBamlwb2VG?=
 =?utf-8?B?aHE2by9YZGRpQnhwNHZxRHFlWWRtcEVjU0sxajQ2ZEFPZVp4NmRNbTRpSnRn?=
 =?utf-8?B?KzVoT0tQWXRLQmc4RjFSMkErb205WWpXUUZYeFBFYVZKKzR1ZVZ3Kzgzbzc0?=
 =?utf-8?B?WFc2VFlNVnRLM1ZFbjc0NnNWRnlDQlo2RXFXdHZHd2Q5a2w1RlBITm1BMzE5?=
 =?utf-8?B?eDVyV3dQMks0UWp4WWJYbVlSYURYVEN2RDVHZkMzVzVyN2pvMTljYU84TTc3?=
 =?utf-8?B?V0taYXcvdk9VK016L055UC9LeG4wdjRIeHg1TzczcFNpQ1l5V0tpUHpHZ3JW?=
 =?utf-8?B?TjFSTis3a2hsSDFvNENjbVFWaUxWUDYxTUJsTjFJRUljUU14VTdlc2VrR1k3?=
 =?utf-8?B?UTdTbC9mTnZrSGV3dG1HSHlFS2hkbmVJbWVSVnVZeVVqblh2dXhrMkkvTEd5?=
 =?utf-8?B?Z3M2eDcwVVFSbjhSS0hLNGVyZi9KeTUvL2oyK1hBVktqZTVSaGZUSU14ZlVH?=
 =?utf-8?B?UktnbDFaTDBEU2NoeitzakJKeEZhWnRlbUhUQm9TVTVHVlNPTThBWTg4T0hz?=
 =?utf-8?B?VkV5YlJza3RzNEk2QmNRdjRYYnJadkFoeG1FZFZIaGR0d0lBanRSYXpQakZE?=
 =?utf-8?Q?qquizikxZR8myi7goH6k24k=3D?=
Content-ID: <0D47EAD9DCBDE446841E3E0654D8F8B6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8386.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c492028-021d-4f07-bb50-08dc6e6b67a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 07:57:55.8806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t1FkIofsqbmsiuo/mdb5N28ownNH7YAI1L3pPu4Gc8EqdKAJcO5jROaft+3ECgePQgAk1EL5nl0FIzG85q7NIeyfCxR72KQtHKzNGWKh1S9Ug2GmL6XegzPoRSy/REDE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_005827_679849_F15F8003 
X-CRM114-Status: GOOD (  16.81  )
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

On Fri, 2024-05-03 at 16:46 +0200, Krzysztof Kozlowski wrote:
> [Some people who received this message don't often get email from
> krzk@kernel.org. Learn why this is important at 
> https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On 03/05/2024 14:54, Prajna.Rajendrakumar@microchip.com wrote:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: microchip,mpfs-spi
> > > > +      not:
> > > > +        required:
> > > > +          - cs-gpios
> > > 
> > > I don't understand what you are expressing here. Did you actually
> > > validate it that it achieves exactly what you want?
> > 
> > Since the controller supports only one chip select, the num-cs
> > should
> > default to 1 and cannot exceed 1 unless GPIOs are used as chip
> > selects.
> 
> That's not really the answer... or you want to say you did not test
> it?
> 
I overlooked mentioning this in my previous reply. It's been thoroughly
validated.

> Best regards,
> Krzysztof
> 
Best regards,
Prajna
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
