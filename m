Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD8DC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 22:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrki2xhdWLeEQNVi7SEa6aSMrH9ETLqEwmLcRCa7ClE=; b=IMaS5hHl2o2S0u
	/6L9ZD3ZxhTw3vQqvAolbFWMfItlCoopfnevDz331+BrLI9vinsYW6OBNPsUxvlEEl5mwflRAw/fz
	PlVWwKyEWGXieeNi/PXBzdL7OmqX7PDyZr3GGIgmIGp1AxjoMrCqqdSNr/FhkahIWBozzy2cwhAP1
	mwQEPn3p5H4tX/iggvIlVe53es7U5CTHwQRFC8tU3knBqLIXHKg8OFBSVcs+AxnwUj+JFQukyyTbu
	q7lg9j7dffr+jjOZZkkDmmSt4OOSquisIRNxdtyoPcR+DZIq46c05txhoNSwy7xvgK/HF1Jl+0fls
	naDkR1FWrcZX2AY2TIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2e1A-00000008hjK-2mrJ;
	Wed, 09 Apr 2025 22:35:36 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2e18-00000008hin-2U2q;
	Wed, 09 Apr 2025 22:35:36 +0000
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539KD71E013400;
	Wed, 9 Apr 2025 15:35:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Va1pfy12XnOpGbmfJhgMW05Up8sEaj9iPTebUIWQNz0=; b=
	Uf3vyXSMDOfkhKNKS4HLaRQ/TTy8MpqRRx6tEbstM3U02xgdup7wzBlb7EC2QwwV
	KFySqthtbkhTwehxYdr3Qmcx+iWD9m/jYFrk7TgOqIgBzYE/9iDYMT9zXt8QiGNx
	PA77KRW9eR9j7kEe4cc7tACuvwTovlYbbMk20AnJOc/KYZIhQF5fs1HHOZT8PC01
	aED1WOcgn3rKJwl+jGoBsH5TyU1i6FbXSoeK5R3FfgYJXIKs3dhUX56MDVGdSkyP
	5nukEkQ3ruxUIV15HaApbNLXUfqXAOdDtrILJVjxPcJPoSUv/BfETSn03ezfvoZU
	aMlchZ/1fpX7P51UBZJvxQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hprh3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744238112; bh=Va1pfy12XnOpGbmfJhgMW05Up8sEaj9iPTebUIWQNz0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LLae/EJ7qrRPzt1swkgs0RrSzEoSiZSsrgwrzAbIHi51VuSZrZSB6ReHxFFjWPNjh
	 PDLN8tfU3yHfVIKcMpidAB9xY1VsuicQWGBQRwYgepSHrVmBAHk1Bz5LtX6T2S7PF0
	 ZqpGSYAtKSy+99oN+UnJIPPOBFtKmOeSIIk6aV4vfeRWn8SGRcAwo5Cr0UJ/pFEUFs
	 R1lH/f+EyZyT6I6BBqMr1Gho+U0qFVpSmz+4029ekch7o7IaZQ/v79DFTlJDo9IihC
	 A7tnhDjKHY9ojtnlo4s7Y1jsK/Durd4Bld83rCT/Mp9XJt0KfTmugx7TvBT3861/n8
	 meZzV04vyEPNA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6B2124052E;
	Wed,  9 Apr 2025 22:35:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9B0E1A006D;
	Wed,  9 Apr 2025 22:35:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dehoSTsZ;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A44194048E;
	Wed,  9 Apr 2025 22:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHdh+a2NqS2S3++LzWyzkOCMNZvKNIM2CCF4F13iPebfZDDt574x9PUO7OmVF2eZsy2GexgRx8HzPCW9yjrs8g9gd8/0Hav4aWwQ6arFGRxIgWVvtj6OS5v81ACf4fZkVsXyuBBlowRWaAxqBVBgH0oNVhNhW466mwGCPVrCl3yJkIt2m0ZZm5bTna9mGYUWZSAAKwcfuTQwVimVdAgOBI+ayc7KRzK+BBFd76X+u4eFSDI1QKS2XsrGCtdFT6RWJOtNROSHQtFUYJ2okQlTcEv6w1uVqxk4pCX9URxaiUy5r9eRwEqkJK86uxYYcaNsn/KJM+qDwsUxYyuUTj9/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va1pfy12XnOpGbmfJhgMW05Up8sEaj9iPTebUIWQNz0=;
 b=n2U9tE5UD5hWaLu1vZ9hu22CDQk90QN8WWz64cpohnIewwS71v8BQh64yuQjliGViEERLpgRiNOimUi/tmuKesBlvEYKXH5ejWCWJFyQ5InrJ7v4V+gzyFX32UrMUv5YnhEgEgQypLHxL67E3s8EP333Hjb79zj7ccL9ZderwCHmu6deI9XHVwsXTGM2YlllTgcf3S0mQ7mD8QUWO0CmnGZV/JoFSxX/cLPILdN3gyo0rPP9LN1M8ifA3s4g87y++Y7ru976RnAfeototU5iluKk4J7c33qWjQmvTV2jDcymawPiI1dv1Z21B1HlZruMsDpvPGwC/hsEHtS7QuaTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Va1pfy12XnOpGbmfJhgMW05Up8sEaj9iPTebUIWQNz0=;
 b=dehoSTsZ9NnA5GHEMnSt+J+ZhXbD55MEsNHgY2Q03nn8u0Mc3TOJjjwv3ozNweaYSC7oo8mXJZEc10WMkC2PuVRMlN0M3s64oG9v7eBstkZeAWJ/uV1b1HdgrSprr4LzX/m9dkT8l1hK5TnsXHzV2xQPOzOZqbTlh9H55R1+frY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 22:34:55 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 22:34:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ze Huang <huangze@whut.edu.cn>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 6/7] usb: dwc3: add spacemit dwc3 glue layer driver
Thread-Topic: [PATCH 6/7] usb: dwc3: add spacemit dwc3 glue layer driver
Thread-Index: AQHbp7o+/NmdAfu2KEabLwwgtR4VZbOb78MA
Date: Wed, 9 Apr 2025 22:34:55 +0000
Message-ID: <20250409223452.svwckotac4dbze6v@synopsys.com>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-6-bf0bcc41c9ba@whut.edu.cn>
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-6-bf0bcc41c9ba@whut.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7642:EE_
x-ms-office365-filtering-correlation-id: 9d5c432f-fa54-4d01-aa2c-08dd77b6c0a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cmdUaXB5OGhGWlJPcnBBZ1RUN3NRL0xjYWdvSTlWZ2RKUUpENnhoeFBJUktl?=
 =?utf-8?B?cFQ0ak5ieDFzMk9oRGEwVytqV054MGJPaUl6STNzZ1JyMFNRQ1NzREFPR1lV?=
 =?utf-8?B?bzRIQXFpVWwrT0pQaWo5NUU2Qm0vRXVjb25jdTFsVzF2cXJJOU9FeU5ndldV?=
 =?utf-8?B?OHRlazMySlJENkVTMEQ2K1JaUmgybnhCMjQ5bG9kN2xlV1V2Y1NxU2dVWmpx?=
 =?utf-8?B?cGhjaHNsRTZrc2dNcmcveTZNK0pNS1ZrOVgwS01icHBLWjRQWSsyQXExL0R0?=
 =?utf-8?B?SjlwOGhyVHVqODBieWpGemRJalgxMk5hZE9KL3ZkdHdIRmhOVEFIZVF5d0Mz?=
 =?utf-8?B?YXBSV0RZbFhDblY4SWtBbFhSYXAxVWk5eTNDYWxxK3NlRzVYL2UwbTI3NjBi?=
 =?utf-8?B?a1pHcUVaZTMrVk9EQVozeDRTZGhzc2d5UFdnSUZwMmQrc3FESFhxOFNLT1dy?=
 =?utf-8?B?NGNGT1h3dGdQZndnZ3llZFVZWTNab0pUdk4rY0JCdkg2U3l5dDVIeUFWMmxD?=
 =?utf-8?B?WVpseUViL2hMRVVHNkNwOXR4UnJVTkRPZ2Q3Q1J6eWFSQVdLU3ZvZEZ0WllS?=
 =?utf-8?B?YzdIMXJkRlBSNEVsaWgxM0t1aE1lQUxncFFOaHZON0VqbjVtWk1HNUZyQVl5?=
 =?utf-8?B?S2JiNDVRa1FYWG8zUUdOZ2ppS2dYNmVyZS9VT2Nqell4aXdnVGZQb2hSMW1n?=
 =?utf-8?B?V2ZNNk4zTWwvWlZUVXdtdUMzaWdqblhaYUtsTWpjWXlkMDdhRmhubFA5NFJD?=
 =?utf-8?B?RDB3bnk5RFhvTFprOEgxU1N3blRUTUZLN3U5TDVnc1B4TEozaHY3c0Z6aVZa?=
 =?utf-8?B?VFdoQ2Fkbm1VYjJPdk9NTXBUaEhrcVRIM0NkTHhrY2pYT3RUeFRKSlVpMzYz?=
 =?utf-8?B?Sk9lNTQyZ0hLamRPeVlUSzRJUWNyLzJPanpscDNjVytzZ24zdXczc2tPSjM5?=
 =?utf-8?B?SXpXbXo0WlNacXQ4cktFWHJqalNPOEhBR1ZsNEtjVWhUVk1PM0FjRkIraXRs?=
 =?utf-8?B?TmhibzV0ekhrTmFLaDNnVEZOemdtSEcrYWVOYTk4Q241cndpczdoZnlQS3Ar?=
 =?utf-8?B?TDFieVIxSW5qNjVpTHlLVHlOWEVTZyttc3NJRXJVbHRUYWovUnYvd2wwcUI2?=
 =?utf-8?B?Z3pBQ0FRcWI3N0R4Zk9YSitjUVhsV0NRZ2lrWmhVWGxwL294OXltWVJiZk5r?=
 =?utf-8?B?RmgvR3VNUzJUUXl4TzlaRGg5bXJ1dGdSNjNrRjNOODN1Y0Y4RDM1dCtCTUJC?=
 =?utf-8?B?SmhvMFJ1VmF1clNMa25LWERWRXhwazlxaStnOHNwOVNuR1I4a1R0am8vRXow?=
 =?utf-8?B?RU1BK2crQWI0QlhqRXREKzNlTWtlY0dYYkM0WWJtbzRkaEJxQ0ZFN2dQOWkw?=
 =?utf-8?B?UmpxaGVGMXpISzVKMVFaMjBLa0pRaWY3VDJqdHNibEtDbmRZMTNVcktRRjdE?=
 =?utf-8?B?OHRXYWM5YkZzbzdkeUQ5Vm1OYnNYNzhhaTNlb05QWFlScUFjK0NCeGNnVVFS?=
 =?utf-8?B?cVBEQUZFT1d1cVhrR2RlQzZXQzRHNjdWQ1FYcWgzWHpER1pnKzRtZlJvZVdH?=
 =?utf-8?B?eHY2MTh1ZlVuR0VwYW5qSjB6SHFJajJJd29HbjJMV0NSUmFXQU5hYzlVNnVP?=
 =?utf-8?B?TjJnVU1uZ0VXLy9VMUM4dkdud1JHUmJEUlpvSnVZRXJoMXBmWDBjNXJ3aE9H?=
 =?utf-8?B?RGRJVU4xMXptQWhYdXhxSmNGTWpYb3BUZlRjbEhYOTJqZFY5Yk5PT1Fadisv?=
 =?utf-8?B?R2dCNjBMaXFqd2pLa1F3T08wRWFBc2pEQURBZWZYTWdDSVB1VllxVDhjRVFP?=
 =?utf-8?B?WlhWUS9tME1KNXBLbjl6WFJLQllycitybE9zS1dwem5TdVd1VWg4bzZlOFdt?=
 =?utf-8?B?bDcza1c3cmVaa1RQcDBtTGY4QjE0SkpZMHBvdnhYeE5NaWFDTjJZaWlFVnJB?=
 =?utf-8?B?ZFp5MjNnYjE2YVFrc25GK2laU2RTeVozTjlXWWExQlY2UjU2YlRTSEFYSmlH?=
 =?utf-8?B?amYzREowVlBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0NmTTNSTmJVNGlhYUIwM3ltR21zaldmV1BMTU85OC9RbHFmNm5zekUvWVRt?=
 =?utf-8?B?UzIzU2VmZnlOOVFibU9aWDVqbHZnTTUwQkdaUEw3WWgvMWdYWEZ0d29zWnJT?=
 =?utf-8?B?SWFYWVh0aW9vUTBweHdPRWxjcDV5VlRBYlo1KzBPT2FYWDRxSDdSZVJ4RjFV?=
 =?utf-8?B?bFU5b201SGdId2NSSGJMVGkzOWtkTDRha3VLZHl1b0JsWFM2RWFPN1BhTTMw?=
 =?utf-8?B?UWk1ckJQZ2ZXWUNucThsNUxPVzg0NUUvRGtoRVlQUGFQZkpJckw3Z0xja3BH?=
 =?utf-8?B?NDhiektMQURobFlEQkRweWtUK3M0b1NhSkhQWFR0QlVNemV4V1pjR3BUSUcy?=
 =?utf-8?B?a0ZNZWJxc1REYWhSNXZzUlo5eVNYMGlWaHFFMnV3UnJ0dFc3RUdhUmNsUlpz?=
 =?utf-8?B?RU4raVJKc2Z3Y01Od0NSbkpZMkpLZGxQT2hBSEpvV3dFRFJXWklqM0ZMT24v?=
 =?utf-8?B?SW9RWkFxaWFpWnYxNFY5SHU1bUpaVUFydFgyUGd2NHNyWUFLVkMrYlBUYm5y?=
 =?utf-8?B?dm92NG00ODFwWTBqYVJkN1hIZWlwTWdNaUZLN2h6RnZ0R3J5bVBGcTltVkh1?=
 =?utf-8?B?SlNOdUdYNDRmazlxcUNNUkRJVHdXczNmNWtxbjZjZFZ5a2UvUUQySVZXSW9P?=
 =?utf-8?B?cE1manBhVTI2QUhmVTRZYWFuRlhzd0tWUkVZRXNqd3NTYlVZR0RvWW1pYjFu?=
 =?utf-8?B?T1J1Rk5lMVlRakZMZVhCL3VBRmJmclQ3MVY2SnpKczIyYlI1MFdVcGZrYkhU?=
 =?utf-8?B?Y1hldVNSR0RjQzlSSE5sQ0M2Q1VmajYrNWhCSGVCRTdId0VoTCtxUS9qa3Bv?=
 =?utf-8?B?cWc4WWxFSGFWMlFoVTdqK2dxVTRaVlhBd09maDhIS0t5QnQ2Z1ZOOWJOTGVv?=
 =?utf-8?B?QTFwVVdJMzNhSDNDRGUvTE90SDJrS2dLcU55dHJtcUQ5US83OWtLRVRPS3Z4?=
 =?utf-8?B?WDRvT3ptZmdkNUVlMWVLNC9BaEhYamJyM05IbWpZS2tyeGNzWXZQZ0VLaFVF?=
 =?utf-8?B?OTlaRW5FZnVwaG5ELzFnRTF5WW9JNzRxK0dLSHhnSjV2TmFrZnhsQVNqM0pm?=
 =?utf-8?B?UzVSdzhCWTdDaVhseHFqdWhwRitBVFJqdlo0OXRRQWZ2ZC8rU2RPZFhxWThQ?=
 =?utf-8?B?Tnh1U0k0R2xwSUtoTTVXdy9ScTd5NVdqbzFETzdzcWJhWndvVk1NRDdRS1c1?=
 =?utf-8?B?TzE0VWYxak5HTEUvM1RQMEkyUCtjZ2Z4cDJRZSs1T1hGbUptdzVLd2F3dEZX?=
 =?utf-8?B?akpIdEdQUDA5V2dQNTNSZmZPcklMMXFmczBYZHdRcFNYZkhYOXBuWVVzY1pE?=
 =?utf-8?B?WEVJM0NiSVVaWGEzYkdMY3MxYW5Ia0ZMRkRrWWd2cUhKbmlRMTFkTTZQOXJZ?=
 =?utf-8?B?R1dBcno0Mk1CQkNIbDgvZWdWR0E5cFB3eFdJaDRjRDF1RjlDc09IekRhU1Ev?=
 =?utf-8?B?c2hzZXZScHVjK2RaK2lnQmdibGY0ejdDbmROWnpjTEhUNUJPTmIwandsdzc5?=
 =?utf-8?B?N0d3RC9OKzViWlZaS0IrWGxCeWRUU0R6d1FmZ0p1Y21UR2EvZHBOL0Qza1hm?=
 =?utf-8?B?LzBEUHpLdmE5T2daNmtvU0lINkhVbFBMZ0RGallWeW9tUnRrcXVnQWtyQlBN?=
 =?utf-8?B?QkdIYy84NWVZSHJrR3BLZ0hDQTZJNE9pZC9vRDFqbmU5NE5QZlZQbGVVSGVN?=
 =?utf-8?B?OUdTZ0Q1OHpuRDVoMHA4VTNvV2FSM3hTVi81RlhJdmtSWDVEaW9lUW9YU2kw?=
 =?utf-8?B?WUt0ZWxGYm9jZEQ5cllPekw3WUZrMGNzZXlTTzNhRklBS1N3TlNRNkFwckZR?=
 =?utf-8?B?bTAvTE9SMmhuU2diaUg3cUFadXJ1R1doTGpHSWxla2lEWWI1UFUyUEtPaEJS?=
 =?utf-8?B?alVqWGVOZE5sSHNaNUd2QjhxbFlUajkwWDBFQ0l2dWdybXRNUDdhOWhxUEhO?=
 =?utf-8?B?MmN6dWVjTHZVZUdkTFZoN0Y3UVdaNWN2dlk1UlpoWXQyWXNJaXFFcTh6ejZY?=
 =?utf-8?B?WDg5YW0ydU9OQUdQRzhCR2ZBNEpEMWYvUDZDQ2pjN21NcnJoVG9VK2MvSHJa?=
 =?utf-8?B?dmxGcnZQY0YvMnNYTURTNEwyS1ZWSE9EeG1wZjZGZTFXWDhFL2dLYS91bVpF?=
 =?utf-8?B?L0tKcDZmclEvVUtnWmRJMm9JOTJjWDRsQUxiNlVSOGdrWUU0ZVQ1TWpWNm5E?=
 =?utf-8?B?MEE9PQ==?=
Content-ID: <220F956D2D0AF641A3C8116F2124834E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JAdl1sBBZf7k0oNZdVtEC59bH+9/cYsduSqdGD9Ug3x6AFzX3PWOtiHqmgPyw4vg47/NtkwFH5+LvabVh0zhWmPCBSE2BKGMJSyIPvrP1IvfFK6tiNxS5YyhG4UpkM4bICYyP9E21wlcp1E7iJ8Xy2TtVZCzD+gzDP2Tbj13MAXm+NZs157x3aSZR9Q1BCaudaBwtzPFXTRSibLJanScpZnb1OQUKawbSkz672tWU9N/jLmQ09oYV9RIh9VwxZZQfjcDssBeUWkhcYh1NPcTyMlDgonYzFbe7J7e8UXj6NvlA9Jh8k3EYEp4ALLkcIMtRk+ydXOzGH6LjgQ6sPRX5amWwhU3pMnooTumDiDqWLi4aTw4wqyUvwazqw2sovb5q1/DaxbTomL7+0ylsFhSuc5AkP2pcvlhJr44T1b1PprFmYGSJY4vzn0dpZ+kS81xGMH6r/7b3ZmApBn5pGvnoO1IDDik4K6w6xlmb4+8mCBAUb8xCMyLXOz9dxHt56dqx461wYoJ8HoxXcHb8Ep1xYyBoy9eFsxYKdfzClsft3Wtw/rXuXtXNcjekzU/lJOIj9kJA+QAI37Wbb4wTKT4W2CksTCJZMZptbmVe9fHTFtwi9f2CqLf+bJ+CGrdXtrB+K3hTPHK+4ZwNQkud3Tfcg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5c432f-fa54-4d01-aa2c-08dd77b6c0a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 22:34:55.6390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u69WUhgwJTVEpiVTxJ+rZ84IcAxuVhRl7stHL2l4rvsOGS6Oseb35T9rqE3UiHQBHQEQfXdrpOw6U3molRuaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642
X-Proofpoint-ORIG-GUID: gzXs1MLrEHaIXjFA8MuJWq8kYELEMNVL
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f6f620 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=lv0vYI88AAAA:8 a=FJzgsiReXIDKSwhZvwUA:9 a=QEXdDO2ut3YA:10 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: gzXs1MLrEHaIXjFA8MuJWq8kYELEMNVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1011 mlxlogscore=964 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_153534_663166_995E617D 
X-CRM114-Status: GOOD (  10.19  )
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

On Mon, Apr 07, 2025, Ze Huang wrote:
> Add SpacemiT glue logic to support dwc3 HC on K1 SoC. The driver manages
> clock, reset and interrupt resource.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  drivers/usb/dwc3/Kconfig         |   7 +++
>  drivers/usb/dwc3/Makefile        |   1 +
>  drivers/usb/dwc3/dwc3-spacemit.c | 127 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 135 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 310d182e10b50b253d7e5a51674806e6ec442a2a..3c30680fa4f83565fc03c6800e867c6ced0fe101 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -189,4 +189,11 @@ config USB_DWC3_RTK
>  	  or dual-role mode.
>  	  Say 'Y' or 'M' if you have such device.
>  
> +config USB_DWC3_SPACEMIT
> +	tristate "Spacemit Platforms"

Does this depend on other configs like OF and COMMON_CLK?

> +	default USB_DWC3
> +	help
> +	  Support SPACEMIT platforms with DesignWare Core USB3 IP.
> +	  Say 'Y' or 'M' here if you have one such device
> +
>  endif
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index 124eda2522d9c1f4caab222ec9770d0deaf655fc..61a87765c0c591e0a53c33b5a6544db056166f96 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -56,3 +56,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
>  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
>  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
>  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> +obj-$(CONFIG_USB_DWC3_SPACEMIT)		+= dwc3-spacemit.o
> diff --git a/drivers/usb/dwc3/dwc3-spacemit.c b/drivers/usb/dwc3/dwc3-spacemit.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..4574ad3b34a200ffe999c7da61b74c2ef33c0483
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-spacemit.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * dwc3-spacemit.c - Spacemit DWC3 Specific Glue layer
> + *
> + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + *
> + * Author: Wilson <long.wan@spacemit.com>
> + * Contributor: Ze Huang <huangze@whut.edu.cn>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +struct dwc3_spacemit {
> +	struct device		*dev;
> +	struct clk		*clk;
> +	struct reset_control	*reset;
> +};
> +
> +static int dwc3_spacemit_init(struct dwc3_spacemit *data)
> +{
> +	struct device *dev = data->dev;
> +	int ret = 0;
> +
> +	data->reset = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(data->reset))
> +		return dev_err_probe(dev, PTR_ERR(data->reset), "failed to get reset\n");
> +
> +	ret = reset_control_assert(data->reset);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to assert reset\n");
> +
> +	usleep_range(10, 20);
> +
> +	ret = reset_control_deassert(data->reset);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert reset\n");
> +
> +	return 0;
> +}
> +
> +static int dwc3_spacemit_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	struct dwc3_spacemit *spacemit;
> +	int ret;
> +
> +	spacemit = devm_kzalloc(dev, sizeof(*spacemit), GFP_KERNEL);
> +	if (!spacemit)
> +		return -ENOMEM;
> +
> +	spacemit->dev = dev;
> +
> +	platform_set_drvdata(pdev, spacemit);
> +
> +	spacemit->clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(spacemit->clk))
> +		return dev_err_probe(dev, PTR_ERR(spacemit->clk), "Failed to get clock\n");
> +
> +	ret = dwc3_spacemit_init(spacemit);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to init SpacemiT USB3 glue\n");
> +
> +	ret = of_platform_populate(node, NULL, NULL, dev);
> +	if (ret)
> +		dev_err_probe(dev, ret, "failed to add dwc3 core\n");
> +
> +	return 0;
> +}
> +
> +static void dwc3_spacemit_remove(struct platform_device *pdev)
> +{
> +	of_platform_depopulate(&pdev->dev);
> +}
> +
> +static const struct of_device_id spacemit_dwc3_match[] = {
> +	{ .compatible = "spacemit,k1-dwc3", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_dwc3_match);
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int dwc3_spacemit_suspend(struct device *dev)
> +{
> +	struct dwc3_spacemit *spacemit = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(spacemit->clk);
> +
> +	return 0;
> +}
> +
> +static int dwc3_spacemit_resume(struct device *dev)
> +{
> +	struct dwc3_spacemit *spacemit = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(spacemit->clk);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops dwc3_spacemit_dev_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_spacemit_suspend, dwc3_spacemit_resume)
> +};
> +#endif /* CONFIG_PM_SLEEP */
> +

Use DEFINE_SIMPLE_DEV_PM_OPS to remove the CONFIG_PM_SLEEP guards. 

> +static struct platform_driver dwc3_spacemit_driver = {
> +	.probe		= dwc3_spacemit_probe,
> +	.remove		= dwc3_spacemit_remove,
> +	.driver		= {
> +		.name	= "spacemit-dwc3",
> +		.of_match_table = spacemit_dwc3_match,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm	= &dwc3_spacemit_dev_pm_ops,
> +#endif /* CONFIG_PM_SLEEP */
> +	},
> +};
> +module_platform_driver(dwc3_spacemit_driver);
> +
> +MODULE_AUTHOR("Wilson <long.wan@spacemit.com>");

The author is different than the commiter? Also, is there a last name?

> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DesignWare USB3 Spacemit Glue Layer");
> 
> -- 
> 2.49.0
> 

The logic in this glue driver looks quite simple. Can this platform work
as dwc3-of-simple?

Thanks,
Thinh
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
