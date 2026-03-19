Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881331091916
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1PIGFP+/5Q3XcFo/lntOQZrkQj1CbnOegzHH0xhBcE=; b=opg6vnq7iUhcwP
	WDOgVzQkpmgiVjX2uXhH9EM1TYJHyfvGwPhbutfN6S2rzzGaQdOB/tG3R87m6oEWfAS0pv9+nM1vD
	9U9+bZlReq78yS6wsE4YcY8ENcYUomRH7gDnZDHWkxCV4xPTJtj/gE2S+aNOJHks9roUnCxBifQ5W
	/ozhGfrE50N1S1taBtO4FtSu0VDvu4si29n7zhVTmPiG8Xa3NaGmjQUAIEZEQiswetiaGzzDJcbSf
	hd/46ss126vmMGPkp0xtM6C172fe8WG8qxatdhq2R8tt3rtPRIgG4P95eR99SJUDiVhDOSX6v1c+K
	ZfNC+yrgf+UeyUOc1HWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LD3-0000000BbaP-22HM;
	Thu, 19 Mar 2026 21:47:17 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LD0-0000000BbZy-2I90
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 21:47:16 +0000
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JL2SPR4113725;
	Thu, 19 Mar 2026 14:46:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=TqHDUY7Ko2rV27iX7nTaaWAfySR25IrpmACV5BsSceQ=; b=
	XUBUtE3rBPHjM9ylIctuwFfS6OQGvQ1IBaAQwipqQpsT2G83ZQPRC2S5RUAvUB6e
	vX3pkFuyhQx8tkAKjZSE58+DryRCH43fldhG4YORGzWX+6cj0JVXn8rlCTMkgf0w
	j+Roh+qf4hNRIFYYvFwJZjLAxUAK/8d1FmCL7Pi7yDrsw7t6whHdBjDcpdfetIs/
	v/x6/QXIJuiXIeKknPUS4KrxTq4etk7AT+ptjXqugyyGkw2RUl6g7IZF7aHg1Xsb
	lwCsUoeoo+Bw2zBaxFcnCmVR9QD9r7+z0IxSa7GKZwljIMubo4JfoMsglFUg7Dll
	UyLz2qhdJSR05uN0TRvpVQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4d0mv49qy8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 14:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773956805; bh=TqHDUY7Ko2rV27iX7nTaaWAfySR25IrpmACV5BsSceQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=iImvE/BUB9iZsNS+jCw1K5YcFk6o8IAODz+cIwWWq6NBCgAAJxha15pOsKKO8OQrV
	 3Z8jfLbq1m3quvP0hNGZ0nE35sPyrPdTskZBIdy0B7YWp3x8ixvxEeBmK9NkGMSQEO
	 iChUOVurGRCRsk9Z+lXKDaINY00aVRVcCWls8UZdPyVypm1P5qH6ammvhYoG7u/hjW
	 K2ZCS1a8yjgo2LQoVTacQjFf2FFj96aTv06g9+0izp9UHM0F+p5w8KiHHKd3dOYehW
	 qxJU1H6lU7fm9f1Hz11bw/3sNWSCXRQ4rfYRpixyxUHmH7K/yvdUhLf/ABLAHruboA
	 ijYg9eIpcx2gg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8BF2040346;
	Thu, 19 Mar 2026 21:46:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 78979A0070;
	Thu, 19 Mar 2026 21:46:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ubm27Vqu;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 896044021B;
	Thu, 19 Mar 2026 21:46:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fceiGsfgRzU3/2W9AE3wDNuWt6wFfZtPu2wpd5NRIJ6zf5gif0ZcfMqLV0x+ZdJBRYrqid9bUzSw8Hf3jHPko8rPLudxDHfq3Aq3193v9d84JLPK4jGX6+FcDW37T6gkn0SnSLNUg3gsTic14K3BnAx2Gjz1U5iK+MoAjNwgbfjGxlB9gx3SUG4FT63dkBuEgUxt58bUFCm9DuSo72q6uUXv0eidWjAM9C7HRtjwxQVL/KjC9m23YlyrJ4hBVrnxo6BQNieVzp1oNATalJXsUVomCidr5rQUzEjRCYPr2urqX+sOCUuPQ83QFtX9g9XAe7zhVNsQdknQDsvYKiwetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqHDUY7Ko2rV27iX7nTaaWAfySR25IrpmACV5BsSceQ=;
 b=DvCosums6oKmafuv5X10iUM3RNITBi8h+4jr7aA8iINNQtyBY/SDqgId2FuRC7F8CRu1hcbLtX2/gAUN2Sf92F+efdTxkbz7XbF+bp5Okkmr67t1YkIPuwgxez8/pcnspgHUBrfC6bbD66H7iF87/NJ901rjSUexwWWAXPfxt3I3qFJC7yNcZJkdph/eMVLpxR6Prvf3BRtvSBn3oLnJVjzlSkrL/I1j1/+mc7503Jr8Z3ZJvaJMEpeXTGv/6922iRrlUkz3vu/VX4Qld1vyX8YEE4BysFZ9PnfH0iZ1F6xdFF03gaVh3/B395bjRLXN/kqV1vba5jDvmdEufPG7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqHDUY7Ko2rV27iX7nTaaWAfySR25IrpmACV5BsSceQ=;
 b=Ubm27VquDIsN1cQwH3bDZTGCaIKRO93OnUMktJbjm4ctnVBZBjXGxxjhVukKAKkig603DSPvRcA2xQjG4yueEFe3QvO1nCU1iCR5DKJd3jNWwFPet75E4FtRDJmpnuGyqm9YvbVmDPcN5RmfHockkubvytnYlJDTmIOAZjCESMY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Thu, 19 Mar
 2026 21:46:34 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 21:46:34 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "dlan@kernel.org" <dlan@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "huang.ze@linux.dev" <huang.ze@linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Topic: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Index: AQHctRr0ppGnJPsRE0yK8zk2BTHieLWzcneAgABkoACAARj7AIAAeDqAgAEBMoA=
Date: Thu, 19 Mar 2026 21:46:34 +0000
Message-ID: <20260319214633.cyzr7silffbzisot@synopsys.com>
References: <20260318231542.mmbcrqy36oyw44xc@synopsys.com>
 <20260319062601.1042965-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260319062601.1042965-1-amadeus@jmu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7841:EE_
x-ms-office365-filtering-correlation-id: f8aa637f-fc83-4fe8-c5f9-08de8600fd91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: xtBcOiKakwtjAgQHoJUyh/WKp7hA/jX75b7zhKSl0ohTHF3r27rub606OoOvmthae9n90pVA8d+GwNADqne/G+DCP1id2hwYDwW5TgWuUfOneURY0/1Eck71XqvxK8Rd7rlquMK6ne22DG98nVoXq4sKRoja/NKqT7Yyto5DdxpA9LC7/SJEuNYW+ySCsVrBvyr+hH5vT+PEj0XClWSeBZ0MsD7CZUgnLShyoh5j6jn6wTuF8TKsiiwwXPLedFdbxVGJRMfrkKvMOFNFjP75W+527ZNrRKh2efpLc/ANhgOQMupZTb20XebyktkNpyfY8qX9qOz4Xu3P0B5U5JKqAcefMQgTPXi4L3yoCPrB270Ju7Y3qZmZczQloKiG3ZO8o4SDyVn055XHF0pXWpGFPRVxvvLIXDqGIn6ML2ly0GMr7cX0wCYz9n0WOKVwSkeW+ZefmFYJ3e8/bWW4rlXQ+XxHC0bI92YlLlL5oIWt0whYgHfV4rM4QqNYR1SxkGI5JY2t1g3gfrk6hwDIKepii9RreY469fc+LjZmStshtbRNRSHlhCgPJwIfAFxpaweMhjyqo2/Mc7SplH28bMgDJXyUFeBV/COY2neOUT+8MtiteSexmQcbsfdJ1h+WjVH468CvzidciV7jiaf/jH3v3OPzaD4UNcEx3TIFUFF189de75miR992SCGHm7q5zIHIP3FQn2hvHRaNkIKl/xaQM48LRJRF4/yDu9TqUqyxae/vWYrsqkvNHqrRLbMd3h9HwyujxVfqRxLSVtOXm7GDAFwisWFJkaUWa0dMymKvL8Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cm1mcnUrQjRRTForZ0VGNG1IR0RWbURSMkJTZjhmbjlodC9OWDE5emExYmRS?=
 =?utf-8?B?K1NHWnVlWVNCVE9UZVpVOUJaRFMvNnh6QndXVzc2VWNVYnNzQWVqbGlIcUhz?=
 =?utf-8?B?TC9ubmZKMzBmLytqVDNIdTBJSGRsWThQdUVOTEFhUlpTM2hLMHNPUUNQVHVX?=
 =?utf-8?B?SUZOUjV0b0tqbHdCVm9kOW5uVGdCc3B2WnVST1Q4WWdtbC9YK0szZnpkSGMx?=
 =?utf-8?B?WW9RL3hXR3pTN3FxWG42cHo3eTRoam9pTGpGcjluRXdjaHVWdTR6c2x0bTBE?=
 =?utf-8?B?dURGeDUyNGU5dHpNYUtQU3RkUWUycUVlNCtQSjdjdnl1VE4zd2R2UlhMVzFX?=
 =?utf-8?B?VDBaUHhPY2VsaDVHZXlWY3d3Q0xBQ2xOZGFUNkIyZmtacFMvMTVSaVB6YlFq?=
 =?utf-8?B?Y3d0WThvdnVlSVU0cnE3OGR3cXJjUjdsTnZRNnkvQVozb2VZZHZzVUxoYzFP?=
 =?utf-8?B?OSswS2lDVks5NWd4Ri9IajZzSktXV29aazI3VmlTeVJXSFc5bCtrekwvckNG?=
 =?utf-8?B?d05YZTJqUVZTTC9vemhNQzdiSFhNODg5TWIwVkZLTnlZYWpuYXA3aUUwK2Fz?=
 =?utf-8?B?UGd0K0RNdlFvNmpNQnJCcWc2b09zMkJDNU4yaitueHJZc2xFQVN4YWM2bWI4?=
 =?utf-8?B?cExtQ3AwQkFwWW9LOWJpNlFYNUFTL3JrOWVhWFkvck4xRkZMd3hoaktOYWds?=
 =?utf-8?B?TVJ6bFArQk11L0I5K2Q2RTd6RHNGd0xxVGdLbjZMc2ZIVERZVExVM2lVZVZW?=
 =?utf-8?B?bWRYSnM0M0lCcmpSRk1TalhyV2V5V3FuVmwwdk5kZ0FVOUNJcTU4dmZCdWc1?=
 =?utf-8?B?ZmJETUMvdC96THpoN2VlS2YyNjhqUForQXdhbmJHMk9FeWxBTmxwaHJCb3Ey?=
 =?utf-8?B?ME5YUlF2dE1kNm0rbGdxbXBRMldpL3ZCN1NvZDdValJjdW5JYjVyRGw1RElZ?=
 =?utf-8?B?ampwcnpCUy8vajlweXl1NU5hNlIzUW02M0lIOFIvUkcxWUNPdWQrdllyQURY?=
 =?utf-8?B?VXFWdHBmRnp1K2RadDQ5NVlMSHByYlhDNlgwM2UvR3JMbUpiOWlLY2x1aGR6?=
 =?utf-8?B?YVQ0QUlQSlBieEh4bDNhMUJra01SRVlIdGxYU1NNWW9vZXpmN1daU29NOE5p?=
 =?utf-8?B?MHpTcjVxUE9tYlJJSWdzTXo2V2c5RVpZcnNCOUR6VjVQNFJZbG4zRzY4WnlO?=
 =?utf-8?B?Q2Z2MVl2T0ExVFFKdmVMTzJVWDdxRE93TnNSVXM5cFFYMnY2RlpQTlpmNWkx?=
 =?utf-8?B?M3dseU9YZGtpKzRWS0ZQVzhJZlVjbkxBTzNlUUtQR1g5a0hPNDNhaFlNT3BZ?=
 =?utf-8?B?M1FDbXdRcExVUzVLVVFiT2daalhzMXlRSzlMUlpidGoycExjb2NEeS9wVElR?=
 =?utf-8?B?TGE2eFpOYUM3bytmSzQveVBxWks1V0IzSmU0VlRjYy9raU40SC9LWlZMS0ZX?=
 =?utf-8?B?RU40Qy9nRnZCTXBEeU1UVFlKRFdOaG1HcWZKMkdkdjFIZm41WmdVVStTRlVU?=
 =?utf-8?B?Y2VremJCMFRXOUw4aFBOdmJWZytVQkxIM0xubnRGLzJTN3ZjRG9ldi9aaTdH?=
 =?utf-8?B?R3BJcEMxaENXS2ZRZlFVMW1mdzdNWUJFa2FnY0diYmtXdU9IWXY1cjg0WUF4?=
 =?utf-8?B?TTE1OFVtT0Q5TlJWZlE2S2h1RElKVGlVRTRpbGMrY3dhc1p2NFl6SkVSQnYr?=
 =?utf-8?B?UldSNGRvT09nNWlyK1dJeC80Q2pONE95RHVISFFIbVNMMnNWRExhK0VORnUr?=
 =?utf-8?B?cXhLUFhJb0FucG1EYS9sWWJnbzVQVklpNUQyUTZvaWRxZWN4MEpoVlVhanE4?=
 =?utf-8?B?amVoTTI4L1VUODFMa3NibitZYlRibVZXR2plcVVOYVBudlpyRlBoOUZmMVgv?=
 =?utf-8?B?UkNzbWtzcmU4VUFaeU5NdGU0K05EbTlXZ3VabDM2L21IWkN5N3d2ekdTdEw5?=
 =?utf-8?B?RHlPQVI3YW1RY0Jvc3ZoY0o4aENvR1ZlYjRsc0tFaS9JMGFvSzNYdmNjRnhO?=
 =?utf-8?B?bmNKMFFNMnRNeWhvaWFRYnNta0l0a0d6OC9BaElycThyckxGZmN6WHNFZ282?=
 =?utf-8?B?L0dpREk4NDlZK1dTUXhjZDRHZXM5QTFwYmppYVhXN25UQTJOeEVoUDI4VmFL?=
 =?utf-8?B?OHpZcUhyZjhYd0x5YmxqenU2YkRTUi9teG9VTGRYeG93VFBiR2tDazJiTWdW?=
 =?utf-8?B?cmU2enA2OFd4ZzNoaUVTcjVMR2lxREh6bmZhMGVQWHE5OUhGeDR5Z3dSVTA4?=
 =?utf-8?B?cC8rTHl6QVYzb3RIT1BLSkZXeVJiVTRsejdvZWRLaWU1YlUxSFNiNGo5OG03?=
 =?utf-8?B?TFVab08vVlRSQTN1MHp2MlZXRytRZ3NLYjY2OVBMNm4veml5b0VrUT09?=
Content-ID: <59B689E6B2B713498D13C06CD4F15452@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cAVTJudnAnIOhMjRThAlEd4E75QXncleTMGCFArssy//fEKw9RwYgsUSAbr5KJT9Pz2g+HT+DySgJ7NqaWjLcWscd2e0Cdi/FUGMok1fZmin0l1DFjSaZkSyyHTNssHgv9gIeBxYzdwlHZr5x2Y+8WPMAhZjkfhql3iTA9OzLGDZYsgCRkxiGFXRyLQp6t+qT5Ju7fRmGok4OHfSuoqgYIJS5SwVlaKkik2jB9UZL6iKPVQhMq7sPL72we3/z5sdc+c8kU1re7S7DitKkcnma+sLcapQeClSpfZeoS6dx83ib9GxDlwJGPIPx5BCsa+klZv9WSYQt4DiEO6fxBDpOQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dBL+KWpy+EEVlMtoBaOTAwTbmlSXhdVJCFrL4CekM4VbZruNiZh9QQO3Wqam/M+qt2CPgf+/yUCw8M17+iuWvPG61tWbRlusn29/Q7uc1PnzNpVvKwnvnExzB97okoSQRfBAOvla/nIaLjf9D04gL57/WmaRFk0XyuXxXmB80LOm4vJ36eFZ3n31TBSldmnCItM92LdtLWNLjTD+j8DIWTJQWUzT/mIDJz3d+BgWVnHpVeHp1nFN0MkE5Sq7lRQm4FLCGyysOb9iPass/JTlWKsXa/e+ZYhEqNqniXt2b8gZs2MvDI/09pMyhNkUEQHMXn1Q0KtjfbsqRqHCXfEOPUh7XnOdhmoLk7tszpWj3LOpsWq0yOxgCa1jM56LH1O2g3ZDpHt85kQWpSkcQUyfgAd5tiZ771N/FTRd0oy4HkTcv7LOPwAkAcL0X7M89shH/nrrNGBHgCSVoZYU6ojgwNbfRiOoMQ3iF1eRpDETmypQD4M0YQ/kIlLjA65OWeEnJ3rwp5fqKxtewJ+OxHWTj9EfPZDF3Oak8yaQlAsb3tBgOJGLdfDN+HulrpHv7s3nSa/89VsY3x8hBkM901B82+y9LPHNDrU/9pzCtn/akrLrnkCyPFjwBgoej69FJAwT/jglopYYq7kndHoIfo58Xg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8aa637f-fc83-4fe8-c5f9-08de8600fd91
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 21:46:34.5045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiqBHJYn6yzDAlSf45QaVctZO3u371NmoXclf1x0En9jwHi86wpaQ18Lo1tpvGK0qToSwXOMoBcwB6KVa23JnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841
X-Proofpoint-ORIG-GUID: BCj1k6ehnCIFoIDqGgIkwFVnP8USO4aJ
X-Proofpoint-GUID: BCj1k6ehnCIFoIDqGgIkwFVnP8USO4aJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE3NCBTYWx0ZWRfX593lTwQkLiAN
 RicaCRUrJcIZJr7qgmcjcOB4J9eTNI/oKh+nRHxxpIGV2XD68t9iR4xGPz863h9booQ0DBWHMEA
 gK3oKw0qjcf/1gELvtPLlLvGRfB0+RyHQTx5s63FhtaFuZkXKZtr/L5sztWVGC0kSGySx5UQ/66
 pvZ1d+DYxiaS36KhJ/OLumVcX6HT1Xhx14IUIznCRaChc49R5HGlWdrX2nE1bixg2fj0VKhDmf1
 1eMt92AzWCE5+Tklv8/vdMYKAYCdeUk9wZ5eCFmcrhvlULWGTDgFeGgLQ7TpSW3z5SJXjOfUBOU
 rqfuKvfZfEoH//KBI5BoaIS7b/xE1e2jXEZ8JNri0Agnmbl6qo/oa+M07PBeZT3oNmdhP1fOKcR
 K80TUSLUa1+J5XJhif3+96T1wu0y270cLCNM32pVp3vELlIzE/UmFBLCNtGIbYe7/SoKsKDrt/Q
 zKEK2DXBp9nAeXctfkw==
X-Authority-Analysis: v=2.4 cv=PbDyRyhd c=1 sm=1 tr=0 ts=69bc6ec6 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=SYu5jhNYSSl1RfnI_B4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603190174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_144714_728402_EBDBA53E 
X-CRM114-Status: GOOD (  13.69  )
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

On Thu, Mar 19, 2026, Chukun Pan wrote:
> Hi,
> 
> > I mean this is a generic glue driver and not specific to your spacemit
> > k1. Some platforms use regulators to drive the vbus (e.g. dwc3 meson)
> > while others for internal controller supplies (e.g. dwc3 exynos). Also,
> 
> So shouldn't the generic glue driver manage vbus, but rather the Spacemit
> USB PHY driver? I don't have any good ideas about the current name.

In my previous response, I noted to pass the name/id that best match
your platform in the dwc3_generic_config. This structure is passed as
private data corresponding to your k1 platform compatible string. That
should solve the naming issue (i.e. you can keep the name "vbus").

> 
> > if the platform is operating in device mode, there should be no vbus.
> 
> Do I need to check if it's in host mode?

Is your k1 a DRD controller, and that it can operate in device mode? If
so, does it save power to disable the regulator while operating in
device mode?

This is power saving optimization that should not impact functionality,
and it can be implemented in the future. However, it's better to keep
this in mind should this be the path forward in your future enhancement.

> 
> > Also do we want to disable the regulator on system suspend? If so, we
> > may need a regulator handle.
> 
> I'll add it if you think it's necessary.

Same comment as above, but this will be more involved. E.g. you may only
want to disable the vbus when remote wakeup is disabled and power saving
is more essential (disabling vbus will disconnect the device).

Thanks,
Thinh

> 
> I'm not quite sure how to do it well, thank
> you for taking the time to review.
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
