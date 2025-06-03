Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3484CC5B549
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 01:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSEchQvFASngfKyEMRtPDfUUXuxAeIHiUKXfRjtyXkw=; b=fySrb+/jenGIJ7
	+BRi9u2ntt28MLzbGiWo7B9zOoEvr2eliQ+YZL02UnBzcYkycT0L0x2QDo9DoEmh4YNx7YhJcMbND
	n+fpvej66E4awgQRjyhkqYEvm6KIMwx+/THQsDvI6y8XtY5ypAHlLLocCshFWeDLS2N9xLcfbnQh1
	fc0ofoqwOL0IzjyCZt6hpv1VJc2BZlVKF8UVyH9Vc0ctJZr6vDnCXAemkKPa0gffP/CEkrughsBEc
	RRyhy8Jmz4PQMzs0cwu0KGvDxJqxLMa0rXQOkVi6kYaltucM+N2H3X5zhgh8C2ju1mUMaX89WmRxj
	IFPE6oSk+xbCyedR2ZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMGLI-00000009TeC-0GY6;
	Tue, 03 Jun 2025 01:21:28 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMGLE-00000009Tdr-38bt
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 01:21:26 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5531BrSP016380;
	Mon, 2 Jun 2025 18:20:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8U9LskwIREdfEDY+FbZUrgweBOapZep537/Iwtjr1X8=; b=
	MFLSlHVF8JkJFR2qge+UXTrbnXM7qJ4Do3oS5joq52O0sshp1K/lld+AApMkEcZs
	fB1ohVE871ZU1XKOX+rKSRAKOH0JFeMCglvPeUHhR5ubq3FbKN6WJDSC7ucIYMJt
	2V2nbMikkXTUoMgj3pj62ssqhR/XvL2RI/VlptnR57FWm6o1lZ5Eko7pJFdJUzFb
	sfLD/2bG/HIDlSN57nfp2adoiDyJKzuqpTIy+H/U/7WwBjBo4hR+8BIb4SjSUS/v
	JGX+UPoaG7QuegxYh4l6GBpi6ZW4v89X89ZnaztxFEiPo4RFovjLaaOgXrPJ+Sx0
	J1VyRJ+IIHTl+WDayWD/Gg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 471g969kqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 18:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1748913654; bh=8U9LskwIREdfEDY+FbZUrgweBOapZep537/Iwtjr1X8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EVkQ+y0w36aCav+9z6B1gRSCS0u1SlRzGee6GpDFdY7DYQBvoK9+YquJoMUP9BhoT
	 Y8TzxVcE/nOQ02Jui7+WoyWXwnLGmpirVWEiAV2OL6IZmlSkzg+zX+r4UwXKBIpBza
	 K4BWE1elnrpo/7fKeQPbQmqXGbMZxqSLTkFK+qp+PAaqQgSA/2nEMg7YLcwzIPPw+M
	 cHNB/2ZQjSFVC84GnaldeBhXQULRKPBKUZfYmVn8QkQAiAHcvYI37kFIIXDvZD7ywz
	 ov8KBVKmz8/BlSydnR8tQkKgn1WLpX9XY4WggYeJVdorX25nxh6dASKJIHNIk4KBnH
	 +WCAqY/izpIhQ==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9B1CE40132;
	Tue,  3 Jun 2025 01:20:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 47CF4A00A4;
	Tue,  3 Jun 2025 01:20:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YN2WC1jI;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 90FDD40347;
	Tue,  3 Jun 2025 01:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plbPhZsEF70rgP1sciPPZ3nrQPTsof2jN1Fr9JVUwFbeL+vLb04wc0wooZMyf8Lc8DaoYpkHQ9JhIR1Xvpf4VFkwDCWYY+6n9MVtawlT1S1Y2W2+v7tL4mS5fH8ocSnuOYVcA8lgfM6z3Apdn3uHzmlWtjYI8K5fv2TlTDLFbPAUFwYMcSIfJv1jLCPMc7jl/BiBxgb0KDtbu8tOZaWFIPaNBstcnogAdmeXveTojmAAMIthQwBqVU8Z/DNO9gmXCDdtcw47/kBNYHilXQU2gpkZmovEM5sxQgW95a44bUrEs7Qjk9iqYJZolz5bTt811ZDOPevaiFd1dT09dPI+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U9LskwIREdfEDY+FbZUrgweBOapZep537/Iwtjr1X8=;
 b=AuGBx2nEACFEnVlntWh5ygLQTf+qu0gW2beqc70p90CQXjQc/V4w9nNRyFdoQ4XFxFCCCs09elHxzP+Vqpa+01+UHJXTwFBgxIf0TnJ17hazMNCAwJZv2+nkzrZFOvR1v/0Lq3hX8lSVfGhhWwdKXVcGkMoza/qnoyzFBwAtstVoSE/yEgVsxkfu968qh8q90ndS6l9S2WSu0nakF1IiniTPsyubI9+ZAYdTR/o1Wc1F8HmH1+kZavUbUyON8I1bKjpwo8S6IThaFSGqwoKl+vGrySxRZHripsSPPtuILSLxxhPtrHdLHrzOL7HBQky3P6suzZS7zTx6TvYzu8Sx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U9LskwIREdfEDY+FbZUrgweBOapZep537/Iwtjr1X8=;
 b=YN2WC1jI4GsQDUX4lZdhe5aM+n1VoK3zFFdI1MQmYHDwoIUIaJDpggRA6y8shbvEe7jzP5WK1MBwhNcSFkT3cSSNDWsZig3U1pn6jEM5YroOKlj+uG1oTNdddglA9vwf1LJiN9zQhTmAvbdgKNIgsBD/BKD2CzrCqxMbXDZFXw8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 01:20:36 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 01:20:35 +0000
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
Subject: Re: [PATCH v4 3/4] usb: dwc3: add generic driver to support flattened
 DT
Thread-Topic: [PATCH v4 3/4] usb: dwc3: add generic driver to support
 flattened DT
Thread-Index: AQHbzkwx6ls1Oqerk0i4clhdvzYiubPwrsqA
Date: Tue, 3 Jun 2025 01:20:35 +0000
Message-ID: <20250603012029.4agja77rdoneeyrl@synopsys.com>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB6893:EE_
x-ms-office365-filtering-correlation-id: a3ed4db7-fbdb-4816-f49d-08dda23cd7c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VVQrK3JQM3RqOEEzS1lhcGREVkxCdzVXSXFpd0V4ZjhwWmU1WVpXU1Jidlpz?=
 =?utf-8?B?SjR6aU1BaEQwY3d1NEY2OUtobHF1MHZETG9DZHRvK0h1cmxEVVJIcUduRWFQ?=
 =?utf-8?B?dUJDSXBSWXI2Uy9iYzVoWXNtd0hJRWV3NFRaNEI1NllIVnVpaXVENFUwaEdW?=
 =?utf-8?B?SjI4ZG82S2FTR2R2MDJJR3FwU0IvZ1VMQmVIN2pEaE9DRi9KY0dSYi9JOVNB?=
 =?utf-8?B?TU81dHNaZXhSbWNrU3hiNkZ0VkFNdC9BSGs1WmNnVkt1VnJ1bjl6ekhJZXNI?=
 =?utf-8?B?d2lOTWFhK2R6SGFCN0ZNTDg5azRPT0tEYUhJb1JlQmprY21QbkQ3U1ZlUlFa?=
 =?utf-8?B?cHpoZ2ZneUY1Mi8wSzl3VVVyempWcExnTFFjcnVuL0Z4VkNJaytrQ1ZnTGRQ?=
 =?utf-8?B?bzFjWERvNk1hWWtUMnhkcTRjYno4TDRpZ1hiQTZkcWszQ3dJdkdtOXJmajJP?=
 =?utf-8?B?bGltcUJneFZTUVQ3N255QS81WGtlb3JFY1VpdkQ0Wkd3VzQwUExCemhyYlhC?=
 =?utf-8?B?SHNrUmlPeDJaZ2k4L0ZuMkZpVGNzbFc1WGpHRExUZ0tmK1NyQWx3Y3lpN3BE?=
 =?utf-8?B?QnhDYnhZUlRDcHY0eC9mbWJZWVVZdXBDeGMyWjlWdkx4anN0ZzlQMEtYdWxn?=
 =?utf-8?B?VG14VnBubEQrRUIvai9jWGNia3FVbjlUcXpIbWd1dGlDWFhVZnIxTVJzSjJP?=
 =?utf-8?B?OTBUVHhvcUhqMDVZZDBPUXBUc3psNHZBbXZtOE9zbHI3VVJISVdodFRIVzZl?=
 =?utf-8?B?Rng3am9TdnBlTWFQVU0veUpWeXVodGN0dndWdkNpeFdmbEV3TlRjNjNNeDNH?=
 =?utf-8?B?OWFFM3JyUXhjRXdLOS9ZRzJwN1BKMXJJQm5ETkdzZ09DNW1sdVBaQS9aWUhI?=
 =?utf-8?B?dG50MkFaaHI5MWZ5YWE1STI2dyt0QTh1TVIrUnkvOTVvWStUc2RZL0xMSEpO?=
 =?utf-8?B?MllDeWVFRmtGTHhiK3dXbzNjQUl1M1dIRGVzMUJmanUxZTZJRGZQbzFXRGxz?=
 =?utf-8?B?dEFwRFpYbVlSYXZqRnNqdnBVQTVmSkRpYXV1RU1CQVVrS0FJdDgwS3Y4bm1J?=
 =?utf-8?B?VXZOWTJ6Z28xdHpuTWZ0MUdvZTIvV2I1Z3BzTnVOaWFZMVhlNWx0dXNOc2pI?=
 =?utf-8?B?cTY5UnJJS1VqeDBUVmp6WEdUQ0k5Y2srOWFicjdpUHhNUmQrK1g3TU1Kcmt4?=
 =?utf-8?B?MXBBL1NIL3dQeUxqUmxPWTlKYW9sNHlmNkdVVmhlVUdjVGorSENZSlY1VWxL?=
 =?utf-8?B?TUpQZktBNTNvMHV4ZTVLWTFOSWpseW0zN3hLS3MzT2JKNEJwNW91SkVOZkVq?=
 =?utf-8?B?OU9udjVseU96VjhNcHdVU1l0Q2NRaGpFd0E2QTdrQnJRbDdXNDFmKzNpNW1H?=
 =?utf-8?B?blhIM1RjT3E2aDRKRThwMFNuN3huNnVPU2VBTThQNS9sZlFmOEYyL3dpMWRT?=
 =?utf-8?B?YXpFb29TenV4YmkyaWREYUlCYU5wVmlmTk9Sc1FDczVjTytHcGszVUl2czIv?=
 =?utf-8?B?b1BQck9uOEZhZDNueGZVdzVzRnBJS2FnQVU5MGtISTExRS9XaFBoeU4wa0lN?=
 =?utf-8?B?RVZ4QnJ4RndzYXpXb0FyV2h1bk9KV0lQRXlDQUFiREJKTUpVclNoVjBoWWts?=
 =?utf-8?B?MUtSMzNKNk5WVTQzRUEwdjBObzZDV3hnT0JPbThqcHhVNlVKVGtLYlpGYXcr?=
 =?utf-8?B?RXp4WWo4RU5HeEN0Y2w2cHNtRXJvVkh3cWhvLzJXdy9HTDRTMEJ6dnBma0p4?=
 =?utf-8?B?Y2R4RFZtbEpZaURKUml1RmEyQkpFbXNlWXZzYmt0N2JGR0l5R2tPNWxGWWgr?=
 =?utf-8?B?U0FkNmNJWlNNdDRFOXo2Z3BtWCtWb21OUy9rK045L216cVJmMXdCdWVoWUg3?=
 =?utf-8?B?QUlkenFydTJyMm9tRFNGWkFndWpoZkN6SzVUcU9FaU84UDlaZDc3enM3U0w1?=
 =?utf-8?B?WXN6Rk9QQ0FNM3dQcVhzOWlOMDBJY0Z5MW9UU2U0OStSQWVMb0RUdmJqREtE?=
 =?utf-8?Q?M8wx30idTBigvG+jMYIMhZGcrU0mZA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVNMcWlScjF4d3NPYnpER2l6WVRab0hjOWhEaWVFM2xNVU55Q09JRHZhUUlp?=
 =?utf-8?B?NXNrVTRSR3NscDhGUzF6Q1dzc2VNclRNWTFwSzdWamdjN0RXSW5sVWVsTHds?=
 =?utf-8?B?eEtLMHpwaUNoRWV6Znl5K3V5R0FiZDRNT0pickNRNE1UUzNIdlJudTBWSkJK?=
 =?utf-8?B?TzNwNGI0L0VMQm1jSmdVSjBtZmkrZ1hOTVhucExiY1d4Z1FteHlCbkJrMUND?=
 =?utf-8?B?cExaZmMvem4ydlpUb3ZIbzBIdEpUcUhaOVUwSmZObGw3cXhWdmx1ZllNM0lu?=
 =?utf-8?B?V2l4RERieVBkYzZVQ0FkVnZYUHRVV3RkSWZLTllFZ0FHVElzVElnZXIrR3JV?=
 =?utf-8?B?ZVdLbmwvTW91UElLSnFVczZNeEdSVFo0cE13dzZ0dXAyYkpWWTRHVkRmUnI2?=
 =?utf-8?B?c3Z2MVcyc3VxY0llRFV5RE5RZENmb3FiV1Y4ZENUVFBJN0xGVnN5RjFhMWRo?=
 =?utf-8?B?b0tCVVRoSTZyc204RktNSlg4aytrdGVHV3VJNmJBdVk1NGlTdW4rejB5K3FI?=
 =?utf-8?B?c3NOeGVVY0pWcHpQNjAydjJ2K05DOVFDYThwQ3pReUw4QUo5N21SQldRQ21t?=
 =?utf-8?B?MVRrb1ppbmVTSE5NbXlycys3Q3RsMTRxb2h1Vk90OVpCWnZWNDhSY2FOQjhD?=
 =?utf-8?B?ZWUxYTluRGQ1UnZtZTZYTHZaNmpRNTVwajVCQVJMODlzU1NWRFdKcmNYVTZi?=
 =?utf-8?B?WWVkV1ZZaGVKQmNpYW5ZL1lkUUZNaTZZMnFSOHFRa3ZXUEVEVlU4MmN0YktR?=
 =?utf-8?B?MVVGNWJRU0V1Z3VYeXFRY2Y5UDRSTVQrVENwQ1AyWVNOVm12b3BNaEVzbmVq?=
 =?utf-8?B?NThRRVZqTmhONktZOVpHcUI3NDBBNEQ5WmJJczIwaHEzdnBYeDVJU1lPbi9k?=
 =?utf-8?B?eEFsZ0JxSDBSejBPcUVnbnVMTXc3MDBNcEwrYThncXFmcXNpTGQ3M24wd1Nz?=
 =?utf-8?B?SFVCSURrMEwrMjZtY3FCOG9oNVV3TC9tVkxNbHZXVlNNclBSbDF2S2taTXFu?=
 =?utf-8?B?T2dwdU41U3c3cVEwa3BNVXZ0ZEpnVUc3N0xBSU5JUnVBVndsZm5vdFpkenVH?=
 =?utf-8?B?MWdJY05sT012TDVvK1YyeU56dEpGQnk0dHVRbUQwaDBrVWtUbjlxUHI2NDZG?=
 =?utf-8?B?N2p1NERpMHpTelcwOXprQ2NXRWpxcUVQR0hPckEyTFZ1MlExT3JPeEFNd2RQ?=
 =?utf-8?B?elI1U1UxUzJDVDA1YVNSNGR6RVVwRXRnL1pCVE9pVm4rOVYxWmNCaVgyc2x6?=
 =?utf-8?B?NWZEZVJ2Y2RWWnNxNjQ0UENDNGwxU2RsZ21RUmd3bHg4N3FnNlo4MGx5ZUFX?=
 =?utf-8?B?YlJWK2t4VTRhQ28zQ2pZdlRnMW9uNHhiUExWdFQvVENucnZCdUhsenRQdGU4?=
 =?utf-8?B?MmZzS051NzhGTWFpam56SzFQWHpucEJLT05nRGdXTUw3d3RMWEQvbUc5QytY?=
 =?utf-8?B?cFdXWVpicGIxMVkzSHB5b2lyMDZJQUdrenQyalRKMXVoeWdlMmJOVFVnb2Ji?=
 =?utf-8?B?SUZaZTA0MDAySytNR0lpM3FBN0xGOUw5aC9QZFRHaWFaZDV0Qi8rQjV1YlVm?=
 =?utf-8?B?ZWpyd0l6NFMvTlcrYzI4NWJSS1p5M3J0cFpPWW1XNzJ6RWg2RUh6aHVmZDlH?=
 =?utf-8?B?NUNwNUt6a2JlaXpPUUcyeUEvTFc1RzhjVHYvVWIxTk1GWGtjV283SWVqOFpR?=
 =?utf-8?B?bkcxUkJUWWt1eFlwOHl2WE5ySThORkR5MVJOa3FPMEJsUVVSMHI4UjBiQnNw?=
 =?utf-8?B?WEVWQmdUYUsyUm9MSVBVdGc0SFlaRXE4U0VwUzVndEFad2ZOTjJveEg3eG1Y?=
 =?utf-8?B?SkVDOGVES1hNOEgrZE9MR1pRS21aRU0rbW5Hc1VLSlZQT3hDLzBVOUxhOHNi?=
 =?utf-8?B?YWEwZFYxTFkxUlV6UTVDSmVIVXVQTE5icDFBUmQ1Y1J3VzZlWDhhL0h1b0RS?=
 =?utf-8?B?RytESHl5V2UzWXNGQmlwRnNwQU5hc1dpay92UjZrSzZsYnErdHVUdHRkV24y?=
 =?utf-8?B?NkNvaEpqaW12QzBvdmpiTGhtUVBNd2dQVFl0SWdobENkWVNmWmdveTJ5bGFF?=
 =?utf-8?B?M2VBVzA3bU1XcmNWWi8rcmpZZEhUcTMxVVhtaUR3YTVrMjl4dGJGSk9USnA2?=
 =?utf-8?Q?5lybUyN6MGf76ZVOUezA5aS57?=
Content-ID: <EB9728719F33DD4497BF494F604285D9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PFaQTP0KV5WoAVNN2KpDfCeJAM3/N+N0qDh9QrrSgUEBohJy7ot22gtAIFpEkqeqXPD6NGcqH2U8/Y2bHTvMYFkemm4N2pXIe/0UNwLlndo5VD+SblxPfz95tiwOJbqZoT6BdwBHDPyCSvbKCVdo8eQbbJ8s9y/Xc5efhmP/oHHOkxc6oPQOXRhAMPwWHmqzT5VP5FLZaXHIZ40bsh+h80iAdCLJSBpOpHCIITOB7Iz3+OoGsksBHAQRsqj9GP9flnAAr0ioXap65AALWUNTow2irynbsoOfZ1fDjkq64WDB9WByGzG1cFnPP108xDdhnsrcn6FnZ8ZdVI/G69dHon0INDqHHjXTxT/89di8xtgXx83uQtaSudfwlT99elnpYlomp/LbVAPm40ocLKz0ACiHjhUREIKw1AfBFG7ig9OxboMdrBbE5yATCR9SX0QEBiJhQMOp49bVzQsuRjEWq+zwEeIR0zWURoSZIY/yh51wA3fLWOr8Ei/n1iQ4lzVpTwHqYzXvtCVkm03SlsrFeU5jL482iLzcanoCv1DdZVdnV2QPHZoHAaYXciFdUmngeMMEFdWeaaJyj6q91skuB+D3K6jUKmZ+0WN3ECTrhRYrfMUpxD3+z6fdVZJwLWbsN3H/1Umd+FGy/QfTGBd7gA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ed4db7-fbdb-4816-f49d-08dda23cd7c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 01:20:35.7751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJdYbfutOqtz8lRrAUfSKE5L/euu6AVICL0RiuOTlPKrbrQFDmbnLiGVFHHm8PtSeDdvym3DrlVvgWSICdz9Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
X-Proofpoint-GUID: 6XqASLdw8-UgcAGUDiduI5iSIdwQFSez
X-Proofpoint-ORIG-GUID: 6XqASLdw8-UgcAGUDiduI5iSIdwQFSez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAwOSBTYWx0ZWRfXxyt/4WA/MkuE
 I90onLiZfUIyz6CaMlmnh2kuWk+kjGqsoXSNVGT0t2GoCTwa7+4oLSS0mjrId9HEaDKvuQf95FJ
 LxvP+1bPSa/WDZVGX+iOGlilz5HKrhjrEh2X7YACQW9IPqWaWptrdwp97+yGX/CTaqJeDj3x4ey
 /HXf0/tTdv6VV0Hi8X0HIkCHCuIycbtAMo5zjS1V7AjQDPU1NcQBC/hacqNOlC4o9y5iegCdZxA
 08hONiiFsR/bP8mLDam+z4fE6Npc0EYYCkLDxkNrgN3fAZd3/aczqiFDB2LV3Ilrry1Oo7ZeDLF
 nNcOO9QQQlFgbWrjvMQFTf34ok7CouT6fOVOaeTwwNKL/gQh7rRU5QMTcAZToSbBC9u2nUkDvXq
 FsWVFLZIrygW5PqRxoi4JXPL1C/mJztokCkNpD+alcpd2Rl85oACC9p4Z+TMqq6zqMvzDBO9
X-Authority-Analysis: v=2.4 cv=VIrdn8PX c=1 sm=1 tr=0 ts=683e4df6 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=pGLkceISAAAA:8 a=_vetTfaIHP0e6m5HPtYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxlogscore=999 phishscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506030009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_182124_902973_2D19AAA1 
X-CRM114-Status: GOOD (  10.00  )
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

On Mon, May 26, 2025, Ze Huang wrote:
> To support flattened dwc3 dt model and drop the glue layer, introduce the
> `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> and offers an alternative to the existing glue driver `dwc3-of-simple`.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  drivers/usb/dwc3/Kconfig             |   9 ++
>  drivers/usb/dwc3/Makefile            |   1 +
>  drivers/usb/dwc3/dwc3-generic-plat.c | 189 +++++++++++++++++++++++++++++++++++
>  3 files changed, 199 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 310d182e10b50b253d7e5a51674806e6ec442a2a..082627f39c9726ee4e0c5f966c5bc454f5541c9a 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -118,6 +118,15 @@ config USB_DWC3_OF_SIMPLE
>  	  Currently supports Xilinx and Qualcomm DWC USB3 IP.
>  	  Say 'Y' or 'M' if you have one such device.
>  
> +config USB_DWC3_GENERIC_PLAT
> +       tristate "DWC3 Generic Platform Driver"
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
> index 830e6c9e5fe073c1f662ce34b6a4a2da34c407a2..96469e48ff9d189cc8d0b65e65424eae2158bcfe 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
>  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
>  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
>  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> +obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8ff4626d324c40ecb52e115832c803fed7d38354
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * dwc3-generic-plat.c - DesignWare USB3 generic platform driver
> + *
> + * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
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
> +struct dwc3_generic {
> +	struct device		*dev;
> +	struct dwc3		dwc;
> +	struct clk_bulk_data	*clks;
> +	int			num_clocks;
> +	struct reset_control	*resets;
> +};
> +
> +static int dwc3_generic_probe(struct platform_device *pdev)
> +{
> +	struct dwc3_probe_data probe_data = {};
> +	struct device *dev = &pdev->dev;
> +	struct dwc3_generic *dwc3;
> +	struct resource *res;
> +	int ret;
> +
> +	dwc3 = devm_kzalloc(dev, sizeof(*dwc3), GFP_KERNEL);
> +	if (!dwc3)
> +		return -ENOMEM;
> +
> +	dwc3->dev = dev;
> +
> +	platform_set_drvdata(pdev, dwc3);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
> +
> +	dwc3->resets = of_reset_control_array_get_optional_exclusive(dev->of_node);
> +	if (IS_ERR(dwc3->resets))
> +		return dev_err_probe(dev, PTR_ERR(dwc3->resets), "failed to get reset\n");
> +
> +	ret = reset_control_assert(dwc3->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to assert reset\n");
> +
> +	usleep_range(10, 1000);
> +
> +	ret = reset_control_deassert(dwc3->resets);
> +	if (ret) {
> +		dev_err(dev, "failed to deassert reset\n");
> +		goto reset_assert;
> +	}
> +
> +	ret = clk_bulk_get_all(dwc3->dev, &dwc3->clks);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get clocks\n");
> +		goto reset_assert;
> +	}
> +
> +	dwc3->num_clocks = ret;
> +
> +	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		goto reset_assert;
> +	}
> +
> +	dwc3->dwc.dev = dev;
> +	probe_data.dwc = &dwc3->dwc;
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
> +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> +	clk_bulk_put_all(dwc3->num_clocks, dwc3->clks);
> +
> +reset_assert:
> +	reset_control_assert(dwc3->resets);
> +
> +	return ret;
> +}
> +
> +static void dwc3_generic_remove(struct platform_device *pdev)
> +{
> +	struct dwc3_generic *dwc3 = platform_get_drvdata(pdev);
> +
> +	dwc3_core_remove(&dwc3->dwc);
> +
> +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> +	clk_bulk_put_all(dwc3->num_clocks, dwc3->clks);
> +
> +	reset_control_assert(dwc3->resets);
> +}
> +
> +static int __maybe_unused dwc3_generic_suspend(struct device *dev)

We shouldn't need __maybe_unused attr with the new PM macros.

> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = dwc3_pm_suspend(&dwc3->dwc);
> +	if (ret)
> +		return ret;
> +
> +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dwc3_generic_resume(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = dwc3_pm_resume(&dwc3->dwc);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dwc3_generic_runtime_suspend(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_suspend(&dwc3->dwc);
> +}
> +
> +static int __maybe_unused dwc3_generic_runtime_resume(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_resume(&dwc3->dwc);
> +}
> +
> +static int __maybe_unused dwc3_generic_runtime_idle(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_idle(&dwc3->dwc);
> +}
> +
> +static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_generic_suspend, dwc3_generic_resume)
> +	SET_RUNTIME_PM_OPS(dwc3_generic_runtime_suspend, dwc3_generic_runtime_resume,
> +			   dwc3_generic_runtime_idle)
> +};
> +
> +static const struct of_device_id dwc3_generic_of_match[] = {
> +	{ .compatible = "spacemit,k1-dwc3", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
> +
> +static struct platform_driver dwc3_generic_driver = {
> +	.probe		= dwc3_generic_probe,
> +	.remove		= dwc3_generic_remove,
> +	.driver		= {
> +		.name	= "dwc3-generic-plat",
> +		.of_match_table = dwc3_generic_of_match,
> +#ifdef CONFIG_PM_SLEEP

Use the new pm_ptr/pm_sleep_ptr.

Thanks,
Thinh

> +		.pm	= &dwc3_generic_dev_pm_ops,
> +#endif /* CONFIG_PM_SLEEP */
> +	},
> +};
> +module_platform_driver(dwc3_generic_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DesignWare USB3 generic platform driver");
> 
> -- 
> 2.49.0
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
