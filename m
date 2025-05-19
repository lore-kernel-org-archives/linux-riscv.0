Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB52C2D0CD
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 23:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XajhklKfVKooXfjywYGa6dWdYft1PRjNd6G0jD/WyCI=; b=J+c7FT4rwpCtsz
	HRczDoGvr5ApMK76u7hIFY06qWsDy/PqPtc5+Jg53VbfUAO4kundxnQJVOeJiVeXI7pHavP2p3Xef
	xay4HuHEVcxIf1vnYpFd3T7Az8kQswdfABs+wUhwnbv4tgFnMwuFrh+jlW7Auj+XEwUUSyIrjzbsq
	fAZzejMJxuJkv5gy4iQhiJoTjgB1zqHmDY4R9xdSzGPnSQLIEYQdseqKhZcgZokcBhDdS+GqAh+O3
	mKs3vY6MVM/RNdGE2KACDJzumDdkVguDzgavd7jdsvq5b8pFfRJ26EFLZO+uE6ZDijcuRjEZ6S+d9
	1DNYTQeet6CHUj3v1rOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHA3x-0000000AwgV-1vSN;
	Mon, 19 May 2025 23:38:29 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHA3u-0000000Awf6-1OMW
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 23:38:28 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JNVbpg009698;
	Mon, 19 May 2025 16:38:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=rZ/iZEwnnKfEZwPMqtY63RJbQR4FCeUkvb7g/BzHn5g=; b=
	li86WzU1QGVFoQIwoPeOmVTISMAIu8kmG7XHTNgYvquI/9peay7Uq+gZjZh2FrC0
	FqcWjnd58hiboE78aO0OvHQbecZGZMYcpbNy13qwCD5JEiFTBGXDXn8mVLQQg1Lx
	9610ciDSNYKy/Gu7qwu703cH/a0q38iTUL4cgzto1jqNfSyr9Hx/yOeLyvH2pvYH
	bwXhFqQH7SBseUtzmAo9o+lV7+61UPM0gqxRKR+3eddKeGpsVjQwtZXbLu+jsXHM
	bvOSW/kJhyk36VJsWQqXVyQsgum/JPUs6X75tp/HgnkkH9//ikXxui5og28AhYaj
	nbPF7OMhqK9DWCSNsX2Rxw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 46pscu0g4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 16:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747697882; bh=rZ/iZEwnnKfEZwPMqtY63RJbQR4FCeUkvb7g/BzHn5g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kx+SoL0/JZXe4DuOdKtTdgvKG7RoTjGnMS3UbnkcaqPRBGAJIJp9SGpOKH5SwcicA
	 QyDF73zb9dmuaNZQ6Y0nuwLBeU1et9I294WCzaJ2xWuw4NBKsZM+ICwCLO5PzOlOAq
	 oqFx/+Y/SSuZzBMeew1WU0I8BKXrXRd4ADfOvpzo0VH/ewTHJjjipJYpNPKl2WEIOD
	 Y1ONhDkC9Z4sYOoyj3BUH4GG/YBN2Db5tqQsP1EzHNBMbh4EVt0YS0ND59br5JSiQn
	 7o04k0DvVOsmbC0TikCOszpPWEbnNkct+8TRVNqaVoP7DPCpadZVJ31Owp+R0yBr3b
	 2f/Fgjk6jGCew==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 260A24013E;
	Mon, 19 May 2025 23:37:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 07974A00A0;
	Mon, 19 May 2025 23:37:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kYeIKukm;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 63BC74013C;
	Mon, 19 May 2025 23:37:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aE3sul+enBJq8duVhHdW5iuNUCOhiEeKsWFG7f6odHSJwz84xKX3DBQsuwxuHsBrTsbLWdDtBPYiGkHz6VbIeAUQrGnHz1Lz3Or92ncXPjOKY6mNXCDa8BRdfamxx0PskjC8GG9OlNqcfBWJFuwWBPInmkJRDPabQczd+cld9St2Bhwp0yQmWd/+Q7t83RXFJcJ+7tFaLUos0rBJC/9ZdGBgwrjKQDugAu4jZMGeXdfWS9WFyo4S8DyzMxFSGJgFZnN159hIJiSbRR4VLqzRSbtu+2kiVI3dq+g/D51FItVIKqY+Noga4vrGqcsnJz3chYkWjcs4Y/RC9bUxxgh2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZ/iZEwnnKfEZwPMqtY63RJbQR4FCeUkvb7g/BzHn5g=;
 b=mYgagjckCai6l6OslxP8jAp9kLZWY7RieRU6wWNkuk9jpkwKpIwdopX7EH2eexsKlydcijWaqnmCgog+ES7uA4l96pmAnDIBlmqsJm7llxwvxyFi0QDMKfSb0InY6WP5vynlxTRe3TFPo90sIXWUh+tMUNIIJmORYem51uBVs9nhp+R5f+f1/XIeQzse3yOPgv0p3GNEBEj2YjOd44SJkY+1N3SCYPE4xtmh8DuRZqHhb2+NzmJhS8GFKOBDqkelu0dw27f1xcuU8SRA5OKPkGBdOTVLvdgROIPJV2B5LIiDAjY2K0k68iFLN91yQkWX31UApODlnyGxhz/B+Lydxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZ/iZEwnnKfEZwPMqtY63RJbQR4FCeUkvb7g/BzHn5g=;
 b=kYeIKukmR0GHYSGGmSU4tmY4u0/pc+Eo5To1CzfwabLzjmxuLR+6EBulA6YwjS9xlvGm8zjDRV8o1USCn+034mCsxzqbHOgLYwDmWatSwGJR39IVUMkHe118LRyDFmPwP+w6Co7Eu2Mu93T8OH2u2/3fd3eNm4XpHgQmA/3ngB8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7737.namprd12.prod.outlook.com (2603:10b6:610:14d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 23:37:36 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 23:37:35 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ze Huang <huangze@whut.edu.cn>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] usb: dwc3: add common driver to support flattened
 DT
Thread-Topic: [PATCH v3 2/3] usb: dwc3: add common driver to support flattened
 DT
Thread-Index: AQHbx2C7z9nJwwzpmUy6whApTroGG7Pany+A
Date: Mon, 19 May 2025 23:37:35 +0000
Message-ID: <20250519233723.zky3t6ynchg2a32z@synopsys.com>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-2-7609c8baa2a6@whut.edu.cn>
In-Reply-To: <20250518-b4-k1-dwc3-v3-v3-2-7609c8baa2a6@whut.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7737:EE_
x-ms-office365-filtering-correlation-id: af68754a-0a49-469a-de95-08dd972e2267
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cWFRTGs3cnVlUmRGUlJ3TjA1SmtiVEtOK2tvTlJqdS8zSUI4QWk0QSt1ZU40?=
 =?utf-8?B?ZFhKOHpNcjBqQUoySStvakVIbFNUMHdCTnFybFgwNnY3dWVVUzdhNkQ2WFQ0?=
 =?utf-8?B?bytJL0tkK0NIdC9GR0xqdVRtKzdmczdEOHdWQm5pMFEzb21VUkphK2JkaEho?=
 =?utf-8?B?ZU9wdXhMblM5bHBKZ2RwYTk3SnpzS3Jnc1FmVmoxRVJFeWUvaStYMXJXbHhq?=
 =?utf-8?B?TDgxUlVxUjVodzdTYXhWOFIvZTdTdkdMYVRUUmFLNkVyMUNUMkYxZm91dXpX?=
 =?utf-8?B?cjJQTFJjdzNNVlhVcGoxbHBVUXU1NEExRDBhQWpkM1dDNFU4QTlyVzFkR1ZY?=
 =?utf-8?B?OGoyQURqZy8rM21qVUZRU1NKZ2RUQUtNTWVWWFlJblV4Ti9DODRCMnlTY0Vz?=
 =?utf-8?B?V1FtaVJlZlNjQXdzQ3JnVERweWZjUmZvcitwcnN3QlhmdVF3S01raHgvcGZU?=
 =?utf-8?B?Y0svalJ2RytxcUpJamQzRkp3eFZoMDhzOFc4SHFnNUlpUmRidDlKQzlMY1VK?=
 =?utf-8?B?WUlwL0FKY3lhQVJob0VyU05yN1B4R2ZJUkRPdVN4b2lNaFNUbHVnblFUT2Vr?=
 =?utf-8?B?WGVlckxWWE5acVVoelV2WmNWZXlnSU0yZE8zTWNLMjZFUWZMOTJkRTdMMTNX?=
 =?utf-8?B?MFoxOWRKYm5mdVFNN1psaENyRjdKa1R2TlBMTW5nT1JFNW1GeUtBSC9VWFlM?=
 =?utf-8?B?dnIzb2dneWdNNk9MRUJXcWlheStrbHFXMDJTWFlMUU5ROTkvUzFPaG9nYzBo?=
 =?utf-8?B?TVdRU2o2REcvRmZabHlPdXRhOEFFYS9sT3BoeHNiczdycS9YRUlnQ2hXb05E?=
 =?utf-8?B?d0JIZmM4WTdJZ1BNeVVCUHVwVHI4eGIyV0hQWnpVMTV5TjlDY0JvdVBoTHVW?=
 =?utf-8?B?ZGpIVE91SFVEcFhRdUlNMnFRUHEvczBOM0hPaUxzVE5XNmtwRkZMZUtMQ2px?=
 =?utf-8?B?M2ZpM0oxdUdZM2g3TytKQ2RGTmVrRkg3SGhtaDFVQzVjcVZTOTlhZyt3ek44?=
 =?utf-8?B?dG9ZS1FEcDVjMEg1MEJ5c2NnbGNUbkRVajJpVmhNQjd2RHdneURPdnljQllh?=
 =?utf-8?B?L2FXMklXdlpaOFp6WGFTU2FaZlBUNG53WHZWMzY4WWlhMlNYaDlHOU11ZkNy?=
 =?utf-8?B?RlVlUFdwQzlBZ21WVG15aHhNcW5HeXJvUWNXL0xVc3VTNVRMZTVGTWkzeUw4?=
 =?utf-8?B?RjhLcVo2SW9pZFdreHZLNnpzV1BwSU1qZThrT0lIemlUZFRVSVlGd0Y1Z3hx?=
 =?utf-8?B?MlpRbHF6R2s5LzJKZWE1S3JjWUIyVDYrMlVQck94VXY0eGhyUEczL1FwSXBr?=
 =?utf-8?B?aTlkZHFNZjZzdFdFNzZBUENVRFVlVDdaL1J4WW1sNGhMTVZBRFcvaHRNc0xZ?=
 =?utf-8?B?Z2ltczhnTzUzVUZtU0ZtZW1rbEJUSFdNQlp4M2t5bHpLcEtYWWIzRUNNbTNx?=
 =?utf-8?B?TEVqaFBkSFZ5SG9HTWt6S0VEN2IweW0wdDF4V0VNWGNzSi8xQjhqWk1GV3Ju?=
 =?utf-8?B?eEZrd3J0Y3hlVTFubk5QNjU2bGQ1RW9OV2tKang4R2xPWWNtajBXUTVPaFhZ?=
 =?utf-8?B?VjErL3ZCbjFDT1puMjlISkw1Y0pCUzhxTlRjbnlMN01GVG5LaXRlall4UlBG?=
 =?utf-8?B?aCs2NktIZGJBWTg0aU5aeDUzYzVIR1V5WDBNdDdjSyt0NitlRFFRbXN4OVpE?=
 =?utf-8?B?Tm5jcTdsUnoxWWE5aDVWMkxkYWFieTR3OStOUXg2Z3dhOTlTU0IrVWd3V0po?=
 =?utf-8?B?Vy9UUm9XdG14dGlCUE1ZZlNvVGdrVEYvQ2w0VnMwL0o2Uk1DVGs1bDR0dnpJ?=
 =?utf-8?B?TFVOMUFHNThyRVJGc3lrL1pFNzBIcitPUjlxRG5ZbDFqeGlUdDRhQWhES2dH?=
 =?utf-8?B?UitkYW5ncDhjM2VPaEc4bW5aaktKM2RZSXorbkU3ZEpzeHV5MjAxbzk2QmRt?=
 =?utf-8?B?VHhtVUxxa3Fvd2xJMk43UHJHbW1rVWdEWWRURk1aeVlRekhSSXFOZGIyU0sw?=
 =?utf-8?Q?DEPi/biB89ME0NJcA9aPS1uv3TkCp4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkUyMmdRTEVQTXlTTzRrMlRscFBPZXFWVmM5SHFTUk5zV090b0FGYjVUZlI5?=
 =?utf-8?B?ekF5QzhZSnc3K0FaZUZMTXRSMFA5enJ5YkVtS0ZuTGxhaXExVXlZVGJ5VDhL?=
 =?utf-8?B?ODhNMERvT1pPc2VQNExNcjdxYlZzNm9URGxJRy8weHlYeDBrVkROS1ptZEFq?=
 =?utf-8?B?ZmZCckJ4eTFSSlVKMDM5ZG5MTkxVUGtwOXR4ck1RMjBpM3dqTDZ5ZjNvMTVK?=
 =?utf-8?B?YWpSd3VhdlI3YkJIbHJ4SUkvR09LYUpEWEpCLytvUmJhakp0ZGVjMWw0bFE2?=
 =?utf-8?B?czRMUTRUZWtXbTBEVnpnY3o5bm0zYmxqYXNZaHd4NVRaaWxUT25NcWltWTlP?=
 =?utf-8?B?Q0E1dCtaeTJ3clBTTVhlV2xkbmppdGQzWGFyYUhlSTE3bEZ1Ulh3b0E5aXhZ?=
 =?utf-8?B?WjFLQzZDNlJyUFBLSklNWCtLTkEvTzRHbjg5QnVENmVBK0s3bkRGV1dpOS81?=
 =?utf-8?B?NnRZMUcvRkRXSVBOaGFQaE1Nb0o4RWUxa0tEaStKWEprRE9PRjVaWjFrbjFx?=
 =?utf-8?B?UWNiaUtHd3NQbFByeUpVbUhycjByZjd1eHZVdlpLQkF3TEZ1ZUowVHM1YklJ?=
 =?utf-8?B?UTdDd0phb3JOTk52eE9kQWNaanYrTWh5Rk1nV0tYRDljY0hJMzBvQmoyTFFi?=
 =?utf-8?B?R0JCcW5aMEFUSTZaRm5JZWxkM1YyUEpDMU9ZSTEyOE40alVPL2FRZ1EyWHRP?=
 =?utf-8?B?LzB4dHpEbTljOHRZVkUyRE5JaTFCU1hySlh3VTJSQWNaMTV4cXErLzVQWkhL?=
 =?utf-8?B?SWFXVnpNVXg5OWk0N3NpSXRPbDhrb0tQR2h1R2puRTFXSzhYcXhyNEZCRkZN?=
 =?utf-8?B?bjRLa2l3WWpwWExYRldJbWNpdS9neHk3ZzVzaHV0NnFXUGhodHRsZmFKMVE2?=
 =?utf-8?B?NUFvdHRFOGNpVjNSdUR5eFI1SVQ5TnBKeERmZ2x3WW9FU1YyWThiMFF5Y3lN?=
 =?utf-8?B?SGRSbUVFMUVvMnhFV0xUNHdCSlJGQUw4RExSTU9ncnB5ZExCT3hmemFtT00v?=
 =?utf-8?B?VGIydU1UaHQ5RURlMUpQaE9hYURDcGp0eE9RSDc2azZQK3NIZWNzU0lMZXNW?=
 =?utf-8?B?elF5cXg4TDRTSCtVU1ZTeHlNejVaaEFubjdJTjRPYnYxc1BmYXhVdmFabVRD?=
 =?utf-8?B?OUdJUFBFdWRydWFKTEpmTVZoM2lMOUtURHB5emZVU0ZDWjFOOHNuZlpSTVRI?=
 =?utf-8?B?eVM0UEtXLzBidnB3UXp3OW1GakhhTDlhVTNmSHl5eTJjZFlVN2tqNEtkM2tB?=
 =?utf-8?B?TTU0SnBUSktvRXFaK1JZRXNUcmM4bXUxOGZEcDNUaVdCeGFzdFl6cHpsa2t0?=
 =?utf-8?B?VVFTRHdmMjhacjhNQUZKbStFcGZzYTlxaWlGZXBkZHdGM0JhQk5pUlJVZ3Zt?=
 =?utf-8?B?VVNyZ01FNjdnMURTUEVNVUR2UmxKREFtVFN4aUVmWW1zVEMxc01FQTArMWNJ?=
 =?utf-8?B?cHV2QWZ0WUhWWDBxR3FCYmQyVENQS3RZUWV1Ym1MelliWldzRytQTHdvazNX?=
 =?utf-8?B?c283cS9oT1JmWUh1OHBYemZqYkt5Z1pBc1NBVGtmYkNwalluSS9VYTNha3BS?=
 =?utf-8?B?SmdZUFNSUk9CMVI5TVE5MWwrWUI1MmNhb2JWSFhDajdGMmFjWU5QOU9iOTNU?=
 =?utf-8?B?czBxWmhZaE5BNGYwL2gyYVhYemxNUDgyc0l4NW9KMStTM0U5My94VW5YTnhu?=
 =?utf-8?B?d21ReUpiWGZKZVJxWDhhVmI3c2pjQUhoaXdFeHlqcFI2M0FuRWVZTGxPTnJ1?=
 =?utf-8?B?bEZwRytlVTJTSjkzMkJOdU0xVm1KeXl5VjRYaFdOKzViRUJnYTFSd0YrL1ZD?=
 =?utf-8?B?aERpSlVqM2kvblIzajMvTXR0cnpRQWw3VGhKaURsa0V4STZZTmROcTRhVGtp?=
 =?utf-8?B?a0w0NDBJQ28rVWNIWkJZYjliZkJhZzBOSEIyOEVIZE9wc2JrMzFBZVljNkQ4?=
 =?utf-8?B?dm0rNFhXT3p2dVFDUU9PNlkyZzh0MTJtZFA3MVRmQ2JSUkhaVGNsdCtyalBZ?=
 =?utf-8?B?MURxL3NWMkRTSFFMU1pyR2RtYmEzUzZ6YXVKK1VuVzNkYUMvWkZsTkZvdFgx?=
 =?utf-8?B?eVQxZkhOTlpONWlNN0ZsOWdqWE1qdlVnT1EzTFFWV0srVGZIeW8yRjBod1lU?=
 =?utf-8?Q?JBjGwABO2FrITPUFFTz4Hgwmf?=
Content-ID: <2326DFFDBB449F4FA157E986B17939EB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bex3DeLvIxRsnbRrMYt1OkmnSJbVydd7qXqRyCwleoUEJVal2K/QOgEO5fyiKCrnpEgCt+KkLSRkaDu0EBcWbG4NDQPNWIfO5HrqzV1e6p9UUiZG5JM985lcjKXdywIb4pNgWqwDtmhue478QKJN+pvcxxRO7FohcajnrAkrW9Uc8/wC/wlwczyYs+FdmtCs0CryfHwocmdSJH4faHKXKuKZJAv2nuKhajjbp99t4ybkT0fV18L7TUfRd1wpeZlvefYR5/onh2j8Y0fZywUW115kWy82PCSydJVzoSz3jDEu72rCEvZ0Evm954g+yL4fzC5V5+APRN4HGR1Nhd62n7nzNADBO4TwtVTeLhAAW8dyaZlNV2twaw7gZc16tJOxDCPanH+91DKLbR7lCBsa19fUuaO3GESodIjxlEtpj3In3q/TIs/665wM1WAlr5sKgH0OttAKLMXwSKuC6v2o/VqS9JbyEx8b/VQekXJSeEHWZq+upgU0+baUHuIjI9lR2eqsDiUfQ4QrXxalFFzswMvkGxjfSAAkIuGEhXKT5+7wyFhYaFANk2Rht810Q3VJ8Wqstai1eXNHCitN8FaKUv5WpqBoif91KfBUBUJEzGwPGO9HtJ1ahk59Bz7TvFtLY1LmQ6N/ScbCJ1gkg9MEgw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af68754a-0a49-469a-de95-08dd972e2267
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 23:37:35.7384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEkvDaeLkP4O6GFMEaKVrnJbCp4SQt5071fY5TjPAJvqbSok7yTOvC1faOu46fdwd7ovJvEWt5bxqw5L27KMQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7737
X-Proofpoint-ORIG-GUID: 6SW-hSpu1vEALs3jsQlQT0mAwxgNTyAi
X-Proofpoint-GUID: 6SW-hSpu1vEALs3jsQlQT0mAwxgNTyAi
X-Authority-Analysis: v=2.4 cv=EqvSrTcA c=1 sm=1 tr=0 ts=682bc0da cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=_vetTfaIHP0e6m5HPtYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDIyMCBTYWx0ZWRfX86sfo1xXxBTe
 cx1b1x9nH8VCN+McGssQqXWqihx+eQdqlFIafFzGvMnm+oG2k1Ud8huQxxxdiClAVcjWLbeRdLt
 lfNYIbnK6NG4Mk376hByNzf66/WNa8AvPQM0/wxfxoImarLasneKWXvHT68riG0SQTKQ6SEvQ2L
 BO2nPoaETVt/yE0DkeNlWHdTEYznagCnIT+MkMX+p202ga6jiFOY/1Xxxev/VWe/mC7sNpP/vZk
 GWlsXZMqt1HTCJOm0QRTzdmZ7Va5AWOp+JdmQubu3mUJJZWJMsuTwsYChMwkkar3MaGVjK4fNSU
 HkeY23VOvW53lZgIeR19OKy4DE9Oons8WdYRPyOOi6U8RN5TGyUA6lOZq9lRj1mfQ+8OvQDsUXb
 ZqvwyA+RkPwxllBPFnGX5SZMp0+wYwHAB99llfHUrCwnga2GNPFWP15hZSQEtTns8GeoYFbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000 definitions=main-2505190220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_163826_529528_A9551183 
X-CRM114-Status: UNSURE (   9.58  )
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

On Sun, May 18, 2025, Ze Huang wrote:
> To support flattened dwc3 dt model and drop the glue layer, introduce the
> `dwc3-common` driver. This enables direct binding of the DWC3 core driver
> and offers an alternative to the existing glue driver `dwc3-of-simple`.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  drivers/usb/dwc3/Kconfig       |   9 ++
>  drivers/usb/dwc3/Makefile      |   1 +
>  drivers/usb/dwc3/dwc3-common.c | 191 +++++++++++++++++++++++++++++++++++++++++

Let's rename the dwc3-common to dwc3-generic-plat. I'd associate
"common" to common code that exists in all drivers; where as this is
mainly for generic platform driver.

>  3 files changed, 201 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 310d182e10b50b253d7e5a51674806e6ec442a2a..852f94f906e4f339dcbb562e1ce708409ba77b76 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -118,6 +118,15 @@ config USB_DWC3_OF_SIMPLE
>  	  Currently supports Xilinx and Qualcomm DWC USB3 IP.
>  	  Say 'Y' or 'M' if you have one such device.
>  
> +config USB_DWC3_COMMON

Let's rename to USB_DWC3_GENERIC_PLAT. I would expect to also have
USB_DWC3_GENERIC_PCI at some point in the future.

Side note: flattened driver for PCI driver will allow the dwc3
host controllers to take advantage of MSIX interrupts going through the
dwc3 code path.

> +       tristate "DWC3 Platform common Driver"
> +       depends on OF && COMMON_CLK
> +       default USB_DWC3
> +       help
> +         Support USB3 functionality in simple SoC integrations.
> +         Currently supports SpacemiT DWC USB3 IP.
> +         Say 'Y' or 'M' if you have one such device.
> +
>  config USB_DWC3_ST
>  	tristate "STMicroelectronics Platforms"
>  	depends on (ARCH_STI || COMPILE_TEST) && OF
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index 830e6c9e5fe073c1f662ce34b6a4a2da34c407a2..ad1b0705c4d464f19e79ed0c3c63d942446e4742 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
>  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
>  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
>  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> +obj-$(CONFIG_USB_DWC3_COMMON)		+= dwc3-common.o
> diff --git a/drivers/usb/dwc3/dwc3-common.c b/drivers/usb/dwc3/dwc3-common.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..afd9a7bec14b68dfd4f2353d714041882660a1a4
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-common.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * dwc3-common.c - DesignWare USB3 common driver
> + *
> + * Copyright (C) 2025 Ze Huang <huangze@whut.edu.cn>
> + *
> + * Inspired by dwc3-qcom.c and dwc3-of-simple.c
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include "glue.h"
> +
> +struct dwc3_common {
> +	struct device		*dev;
> +	struct dwc3		dwc;
> +	struct clk_bulk_data	*clks;
> +	int			num_clocks;
> +	struct reset_control	*resets;
> +};
> +
> +static int dwc3_common_probe(struct platform_device *pdev)
> +{
> +	struct dwc3_probe_data probe_data = {};
> +	struct device *dev = &pdev->dev;
> +	struct dwc3_common *dwc3c;
> +	struct resource *res;
> +	int ret;
> +
> +	dwc3c = devm_kzalloc(dev, sizeof(*dwc3c), GFP_KERNEL);
> +	if (!dwc3c)
> +		return -ENOMEM;
> +
> +	dwc3c->dev = dev;
> +
> +	platform_set_drvdata(pdev, dwc3c);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
> +
> +	dwc3c->resets = of_reset_control_array_get_optional_exclusive(dev->of_node);
> +	if (IS_ERR(dwc3c->resets))
> +		return dev_err_probe(dev, PTR_ERR(dwc3c->resets), "failed to get reset\n");
> +
> +	ret = reset_control_assert(dwc3c->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to assert reset\n");
> +
> +	usleep_range(10, 1000);
> +
> +	ret = reset_control_deassert(dwc3c->resets);
> +	if (ret) {
> +		dev_err(dev, "failed to deassert reset\n");
> +		goto reset_assert;
> +	}
> +
> +	ret = clk_bulk_get_all(dwc3c->dev, &dwc3c->clks);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get clocks\n");
> +		goto reset_assert;
> +	}
> +
> +	dwc3c->num_clocks = ret;
> +
> +	ret = clk_bulk_prepare_enable(dwc3c->num_clocks, dwc3c->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		goto reset_assert;
> +	}
> +
> +	dwc3c->dwc.dev = dev;
> +	probe_data.dwc = &dwc3c->dwc;
> +	probe_data.res = res;
> +	probe_data.ignore_clocks_and_resets = true;
> +	ret = dwc3_core_probe(&probe_data);
> +	if (ret)  {
> +		dev_err(dev, "failed to register DWC3 Core\n");
> +		goto clk_disable;
> +	}
> +
> +	return 0;
> +
> +clk_disable:
> +	clk_bulk_disable_unprepare(dwc3c->num_clocks, dwc3c->clks);
> +	clk_bulk_put_all(dwc3c->num_clocks, dwc3c->clks);
> +
> +reset_assert:
> +	reset_control_assert(dwc3c->resets);
> +
> +	return ret;
> +}
> +
> +static void dwc3_common_remove(struct platform_device *pdev)
> +{
> +	struct dwc3_common *dwc3c = platform_get_drvdata(pdev);
> +
> +	dwc3_core_remove(&dwc3c->dwc);
> +
> +	clk_bulk_disable_unprepare(dwc3c->num_clocks, dwc3c->clks);
> +	clk_bulk_put_all(dwc3c->num_clocks, dwc3c->clks);
> +
> +	reset_control_assert(dwc3c->resets);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP

Use the new SYSTEM_SLEEP_PM_OPS macros and we can do away with these PM
guards.

> +static int dwc3_common_suspend(struct device *dev)
> +{
> +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = dwc3_pm_suspend(&dwc3c->dwc);
> +	if (ret)
> +		return ret;
> +
> +	clk_bulk_disable_unprepare(dwc3c->num_clocks, dwc3c->clks);
> +
> +	return 0;
> +}
> +
> +static int dwc3_common_resume(struct device *dev)
> +{
> +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(dwc3c->num_clocks, dwc3c->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = dwc3_pm_resume(&dwc3c->dwc);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int dwc3_common_runtime_suspend(struct device *dev)
> +{
> +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_suspend(&dwc3c->dwc);
> +}
> +
> +static int dwc3_common_runtime_resume(struct device *dev)
> +{
> +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_resume(&dwc3c->dwc);
> +}
> +
> +static int dwc3_common_runtime_idle(struct device *dev)
> +{
> +	struct dwc3_common *dwc3c = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_idle(&dwc3c->dwc);
> +}
> +
> +static const struct dev_pm_ops dwc3_common_dev_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_common_suspend, dwc3_common_resume)
> +	RUNTIME_PM_OPS(dwc3_common_runtime_suspend, dwc3_common_runtime_resume,
> +		       dwc3_common_runtime_idle)
> +};
> +#endif /* CONFIG_PM_SLEEP */
> +
> +static const struct of_device_id dwc3_common_of_match[] = {
> +	{ .compatible = "spacemit,k1-dwc3", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_common_of_match);
> +
> +static struct platform_driver dwc3_common_driver = {
> +	.probe		= dwc3_common_probe,
> +	.remove		= dwc3_common_remove,
> +	.driver		= {
> +		.name	= "dwc3-common",
> +		.of_match_table = dwc3_common_of_match,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm	= &dwc3_common_dev_pm_ops,
> +#endif /* CONFIG_PM_SLEEP */
> +	},
> +};
> +module_platform_driver(dwc3_common_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DesignWare USB3 common driver");
> 
> -- 
> 2.49.0
> 

Thanks for the work. Going forward, I hope more platforms will move to
this and take advantage of this new flattened model.

Thanks,
Thinh
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
