Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34B9C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 23:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+8GYLXJTrilmthkeKWuuIPddztaJLMjNkQ+owLR+sc=; b=27kjdL8kYQnI5h
	AgvxMgyujmT3BpPuVXi8y1UdTy9ddD6cQKd0By4omSXpo42CklJle9Bk5x+BAysu/R4pZB5oAzaV8
	h6WGqs+kniLhGWgDTt8OvBY4V+f6W/eleVRpbR63VRrknqfNxh5ipBUr7b/H0agzssSOpL+avQs7l
	bYbELaVEKXyYlVSn+fdcR4ppB5kVj7qhi3AHsUIoqh6zMoX58B8tbJsGPI1sP2cNKb1skqPOq3O5p
	g3pRNqU7MDGnlnJdpMBLiMvCJQgl8FSMH/Jg1Y2/mFKcQ96oWLa2HTz36OyA6QHTmPlZ9VoycCmWw
	cU3DnCd/HU2p8V7+sKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNJq-0000000G1rF-3MC0;
	Fri, 11 Jul 2025 23:38:18 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNJn-0000000G1qt-2Fz1
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 23:38:17 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BKj1Q7014839;
	Fri, 11 Jul 2025 16:37:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=JLEcNTh5fW1RysQXudWzNyLj1piNxVwys/EQOXaDKHc=; b=
	PmlU6HQDgh5KNXNZVJEI91DCCZHeucCZL4xKtUFkfyQsJmIXtSvwD3ReBEsepjj/
	x36Ptt8Md0iHulrRnfYQwrjYQOqoSk5ZRBYeuP3T2XmLXQvOr/Svz2dbv1InUkH5
	GsC9rYS9FnNMYHqUwTIOKgvpOWt2UqyWcN0qXAxsxxjCRi/vu9v83mVAK8eLXEEg
	laoqantf4ukmdrGhXy0btRCPSXtodTukLtnEhJhJvQvHat2cJBJk6HkjkX8o+5q6
	1ywQakZt0DhVaAARIdu6a9sxao4or00bmkGMGEeT/fO/68f2agjNvnGgHMv8ZPc9
	LiOpgfvOK/W66SlQg4u7aQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 47rbqua53h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 16:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1752277064; bh=JLEcNTh5fW1RysQXudWzNyLj1piNxVwys/EQOXaDKHc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gBVJcZNqyV7FpzA+SeENfp/aVvCvrO2vEIL8wqqYn8Cis4ekkXFps0o7dMBhY2Xz5
	 Ewe8FuC/nfNczwx9X5FjHEfd/9OSJHlobHmdWS1t2TjyiaLhs/PYeMdDePMYjx+WRw
	 0+R8HoyV9VI4ErQxdvAY+cdp3/TDayfvS0cHklzd3pNsL93OcBmOOM1MdJy9tLSkfx
	 H9e8WNHFQ7AHDo2b5dubOfO462+UAWJ1K0HD64N8neBEeKmTDyPMi7g/KHN7d6WBT5
	 fTJ9KfymQXleHWQz4Ova9Ffym6dEZLZTIj9uqnp+iD1lYtFotRTF69m38f+Vw/nY3S
	 zvcz04SNhgNtA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 201F44035B;
	Fri, 11 Jul 2025 23:37:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 88059A0070;
	Fri, 11 Jul 2025 23:37:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=b9xqmuT8;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7481F404D4;
	Fri, 11 Jul 2025 23:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRU5Wua6z2N3gSeHHQwIyKP23turHNHxZfzWJQ3ikUeNg7b+xf5i794BUZiqlfRPBJE37X0r3nYEARgRyReFEcT+ZWbHmUx5mY/eiDefrCyGvy5Gng32soqVobpYiGzi5g9UCB56j1PVIeWnH5l+FB8s/W+TRMVcdlDbLDkcNRpOIL+CM3C5pKZl5sLBAuSWlKluwjRC76qGEw5scJfyqZqaE67Ra0hLvDwM2wI2Xv6WYfkQH/GLj3ak1KYlo6F2sztG4h+7uk9WCIwGUpUnIdAY3C+3Pt8msUBaIyNMZKqtfX75T1c9WGC6xkaV9LVfhb7eiO/jPryIR2vV4F5TDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLEcNTh5fW1RysQXudWzNyLj1piNxVwys/EQOXaDKHc=;
 b=AFR5ApqeStiIbMwYgOnbmvrqNtxTKgsXwcgY5rOuBnByG1GKvahxA91ACbiubcKg/LJlOkhojEfxIThy085mgUPD8xnDxqDejn6V7hT6rzxsi4VsrLL/D3j+vucZDeGimEB8T8qzWZtnxM6Sfi4Y4UHrSS8KbRWx6lB6ag1DN3g24vmltu/sKOvhm7+DRZHtcHF6X3Za0CPvAO5i0WvzDYygQn0duiFuDOXQkkyl3lEyzfU7oOZ/79tFxJZP+HWA8kHeyRuC3+UrsZJ5QGUGB4pVe6i4+JvXMMDXi+IzBmXStlb6kajBWxChq7N4a5KRMxoWULLp8Nnj+MgytGfN2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLEcNTh5fW1RysQXudWzNyLj1piNxVwys/EQOXaDKHc=;
 b=b9xqmuT8cDVMCMI+xZWtbj4g/DsjqrOhletbIwYyPiztOF3zpFcjHwQXysADlWwzcg2K0dPsNIz4rpIUQ1fAZay2eM0+KApY0b3rGRiMlKtDRh0XWbEzRJ4swuZWPzyyRTp/U0lG20VMiQc5a/AQXs8K6pX8XsY0EWRCrkATu78=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 23:37:32 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 23:37:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ze Huang <huang.ze@linux.dev>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] usb: dwc3: add generic driver to support flattened
Thread-Topic: [PATCH v5 2/2] usb: dwc3: add generic driver to support
 flattened
Thread-Index: AQHb7a0JNzaQEImb90G4YNAfakciTbQtniwA
Date: Fri, 11 Jul 2025 23:37:32 +0000
Message-ID: <20250711233728.cmkhbnmgzacwx7uk@synopsys.com>
References: <20250705-dwc3_generic-v5-0-9dbc53ea53d2@linux.dev>
 <20250705-dwc3_generic-v5-2-9dbc53ea53d2@linux.dev>
In-Reply-To: <20250705-dwc3_generic-v5-2-9dbc53ea53d2@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN2PR12MB4096:EE_
x-ms-office365-filtering-correlation-id: a68b5acb-f1d0-4781-7c95-08ddc0d3e857
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZWhCbkZYckVodElOeTNnQnNqRzBPNjR5T2NIZ3JYSSt0Qk1SaDdEa3VSMTJH?=
 =?utf-8?B?dm9BUHN5dGhSR25lcWRodUxpUnhxN1FJUXgzS3l0TE1zZDh1T1NBV0ZLNUNt?=
 =?utf-8?B?c2JUT2ZsQ2laVmhVVUtGc0MvRyswa3ZlL0NCU2RtVjlCQnM1RkF1L2pRdWR1?=
 =?utf-8?B?K1JOaVJGdWVHamIyN2hkeFBKVTVMK3JzeTlvcTF0ZWhDcFdQR1c3MnlIcFV0?=
 =?utf-8?B?UmllQk5QNFZxMWttNVJ6RitVZ2VkZ2JOb3dURFNQa21mdko1K1Znc1hGUnBU?=
 =?utf-8?B?NWl5aEs4UFNCUnBNUUNqYjU4eS92U0pBb2VmdWpIRU9zNThEbHlPekd4SFRy?=
 =?utf-8?B?LzhJdHhRajdLb3QxYWhGWGY4RGVTUU0zamVNd1plWnI1L1NCR1FHdisyUUQ4?=
 =?utf-8?B?dkhXc2hka0wzdTJWeU5EUVB3Q3E5ZkNuTFppdUxyd0NnbktDVG1rdFpEcmkx?=
 =?utf-8?B?SW5UYXpqK09vWXFxNGhtNjdpN3RDYlZKSVRnalFLakQ5NUJVbDNDSUM5OS9C?=
 =?utf-8?B?eTBGUDdTTDVXZTYrYXFPVkw5a3ZjS2h0TzVQOE1jck96K0JFaHNkRHg4RFFG?=
 =?utf-8?B?RkZJblRObTRtQ1BCbVVwL0RzeVBjNnJ0RVlYclB2ZXR6WTJpUXJJQjNpdCtP?=
 =?utf-8?B?ZFRlZE1oVitLQkc1MllNMVdwc0wrckkrNVh0bFdIQzRhSElCY0hPb2dsN0R1?=
 =?utf-8?B?akxJMnFQTVQrSy9wSU5xNkNtWHN4UWg1UzU2a3NBc2cyYmZaU1FFR1RmVWJI?=
 =?utf-8?B?cUVtSG0wSm95R0IwMjVFL01UeWJkRHJxRll5SnMvZUhkNC9nSmE3NWkySnpy?=
 =?utf-8?B?STZpSFdEK0tDK1dqVHVkWElMRzJxeVZhVE9ucUo3aVpNWWo3Yy9rYUxnTWRp?=
 =?utf-8?B?KytjOHlTVy81cjJGbUIydWdNUEVyK3V3bHdIS29EYkNrOVJHR3hia2l6Vko5?=
 =?utf-8?B?cUtlYnpmQlFGZ3ErUzB5RjhDWURWcXhkcDE5cnJzOXN5Qmd1eTRhMm94RWxh?=
 =?utf-8?B?L0RzZkcrdXRQUEcrbnY2UElWelZPMnlLYXJSeDAvY21LZXlaSUk5YTg4VDMv?=
 =?utf-8?B?UFBTNVRJMEFVVi9OT21QUUVQNHU3WVdwOGZubHJ2UHJXcTNPR1dvQlRvblg4?=
 =?utf-8?B?WmJjc0xraDhVTklkQi90WjhxWmtseGM1WVJwZEZkbDAzTzMrdUdyQ01ZZEc4?=
 =?utf-8?B?MGRoYnN2ZU9YVXAxZDlLYWhoZXF3MEZzYkhhK0NpRmxDcE03cjVQb21aR1RL?=
 =?utf-8?B?NGlRRWZiMkM4bFVJNFNndXBTU2dZSTRVa2p3MFpqZHhuaHc2Y0VTODY1OEhV?=
 =?utf-8?B?VlM5SkV2UzRjSGtvRlI5bG9IcVgrNUYwNjVkWXN1RW5iTElGOTY5L29qN05p?=
 =?utf-8?B?ZHZoUldIZ3VZc1dIeENrcURGQ3B5NTgxZGNvU0ZGUnYwOTZRaEl3OFZGTER1?=
 =?utf-8?B?aGVJRzBoTzk2NTdKcUdOcE8vQThGOWlnT2tTT3Z0N0N3MDZXWGcxQUdsd0l0?=
 =?utf-8?B?VmFQU3hwS0V1eDF6YlRPZVpyazFBUm1iQ29hemJ6OFlzTlpiVTF4eVlpOG9N?=
 =?utf-8?B?dW9uRVpvSTVsRXlVbW05UGhLWHYvV2p3bXRuZCtmSnI4T2FPWWVmOSs3WTBR?=
 =?utf-8?B?ME9QNDAraitoTUQzT2JEWmR1bjRwMFhNdzVnUStaaVdqNmNSbVA3ZVFYRTRU?=
 =?utf-8?B?OHdkcjRjQi9seTRiQjdwOG4rZlRRTmNURkkyWXlxM2xUaEgrQldIUVdBL21v?=
 =?utf-8?B?Q0dzWnk5ZGpQSG52bHQzWndLelk3ek80R0QxS1pnQTcyOVIvM05oMjBLLzlt?=
 =?utf-8?B?QW9vL1BSc1d2VDdNWXE0d20xVlg1MHJBalN2WmxseFdRY0lrUXBSN2tFR2Z4?=
 =?utf-8?B?QlJORkxFTllNVXQweGJJTUx6REdRdHdPWmlUaE9VSmFVV2xYU3d5WmJUSTRK?=
 =?utf-8?B?dGNGcnNZTURZYU5ONnczYk5kVXV2ZjFVdzArd2NrNUJpams1Q0xWTndvc1U4?=
 =?utf-8?Q?OZpVQne/GoBnq9SkgBF5RUOSXexnpg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXpjMWJBaHhjSHd4bVliQWE3QkpnelovdGVzU1EzeVIwVEIveHpURUdFTDho?=
 =?utf-8?B?WVI4bmlUVy9qc0RtN0czSEk1TVRMSXN0SU0veWdVN1craThVaThyR0VaMjc5?=
 =?utf-8?B?citoczhmVitpM0FPS1hUL3ZENG1mTWZCUjRWUkFkNUdjRWprS3ZLNGxoNVNt?=
 =?utf-8?B?YUFKZWErcjBYUFlURHh3a2lQZzZxRHNIWWtLd0JEL2xuSGlhdWFLUHNmM1Z6?=
 =?utf-8?B?WXA0cUlGRFlsU2JTblFDYWovVFR3eEQvdW5FTzl6Um9hSTY2ejZkSnIrNlhW?=
 =?utf-8?B?L29Cb1hRYmpBWHlheXhaZElVMU1qUlRDVmRCNnpCR3hucVpWWk02RVI4SENs?=
 =?utf-8?B?d3h3ZlNPRGtLQ1lYT1ByRU40SkhnSzZyaEErdkhTYjdyRUdxNVZtVDA4OUor?=
 =?utf-8?B?dWFRUk5tOEh4RER0WldwaEVsU3NrdlQxYTU5UTVsMmlHMmlEWGhVd0lDWEhT?=
 =?utf-8?B?dHRRR042VFlNT0V1STJLM1VZem9Nd284TlZCQzZBUVZSL016MUw4SHZPMlhW?=
 =?utf-8?B?cUVNVTliSW8vWWwvMzVIUm1TeENuNnBta3ZLWGoxL2dsOG41SlF6Ym5ZbnRV?=
 =?utf-8?B?R1l6cXc5YkhJbG5jTXBKMWxyN3RnRHVIOVlxM3JLc2ZEV3VRcUJxTUMvdHVQ?=
 =?utf-8?B?WVFBYld5cjBKQS9JL2ZBaUdZQzdES3pEL2I5UTBpeHNhVlFNR0ZPTUp1cDFT?=
 =?utf-8?B?OVNUN2ErSy80aDRObXJNaWVyZmV5S1d4SytPUlBxQldGcGNZR3ZPSkNnZklN?=
 =?utf-8?B?NmZqMkNFSU10dW9MY0JITWIvMTJhNWo5T0NkTnhkTmo4UXcxdGhoM2RNdDh5?=
 =?utf-8?B?V0VuNnZTeWZhQUVMbGZRWGFiUWNLbG5DRnkxR3lmQTIweXFmeEZvTGdqT1d6?=
 =?utf-8?B?VXBPK24rS2wyaGtGSVJEdEJWOVNqZk4wNVZ0VllaUkdkMmVQVE42Y0ptM3ht?=
 =?utf-8?B?RkNSaStpN3MxUjNsRVVaZjdmQVEzUmc5WTJwR0tjd2VCelorVWhXVFRYdm1K?=
 =?utf-8?B?d0tFZCtzekp2aHU2LzNBZUh2aitiRHBDcFRjZExsK08rNFF4K1ZsdDRBTEg0?=
 =?utf-8?B?dWdUOWx5ekpLS3pUTnJsNzBkeCtySnVmdFY3cWZHM3ZLVzY5Mld0K3M5WUY0?=
 =?utf-8?B?TjZmSlNRbHJCQlNVTFJKVWtEaTlhUVJhRGtiR2lvRTFmZHZIalNGT0FGL1pk?=
 =?utf-8?B?SUFCRklkOXM0ZTlIMS9qZ3FqVGlBTXIzVTA3MDQwbEFjNTBOWUlGd0ZNdU5V?=
 =?utf-8?B?RmZRcVdxc1JHdWVzWTFFL0JZYkNrcm1VWTNpUHJtWG9ZNEFQU1FGRU5vUEZU?=
 =?utf-8?B?eGVaWHJOVGNYcFRGUTQ0Q1pPM21FQ0p0aG5XSVFxMGxkdWdPekl5dldSNExY?=
 =?utf-8?B?UWpvdzNYaXN6WWs5MlBpT01yMnFMUnR4VW5zYXA0eEJPNlE3ZW9zM3hVckJp?=
 =?utf-8?B?NGVtQmZoK24rdUhiQS9WR1ZxOHdaL2Z0aVFlOCtNWXA5Y2xOaDZYSGlYbjRn?=
 =?utf-8?B?Q0pHSlBQei9ZOTUrZU5HNUE0bXVjQU80UGZ4Qjlhb3N6UTJEdS81T1dqNmJu?=
 =?utf-8?B?MFNRY2pGc0FLMlQvbHVHTjlDRzdJdkg5Tm4rNkRaRWJQeFB6a25jN004OFJx?=
 =?utf-8?B?aGhLb3JRRXMzd1pteHBwSVhUdExSd1BQQTRiK0E3QlhvRGVGU3ZETDRLRGN4?=
 =?utf-8?B?UlJsc2xYeGkrYmlUdDVIMEh3c1EzeGlBcGprdDljUU9ya0FpMmJXUlVrZW04?=
 =?utf-8?B?TGVOUG5qcGxPcm16UUEvZFU1VHZTeXhmN3F2aUJiTUlJTDMyYWI5OFptbGtN?=
 =?utf-8?B?RHVpTldNKzFVOU5oYUZLWE91R2J5VTNqMjRPOGFsWkhVOUkyQmRzWWl2Y2NC?=
 =?utf-8?B?MkRHT2QvU0lnNGxMVEZrbGlxY1JwVFhmUFRxNUV4UGtrbWRDMnRRZ0t0R1dm?=
 =?utf-8?B?TGY2M3ZSU3UxK2xYQXkwbm8yUTFCTjZLdkYrbzA5TWZVTVdWeXV2WFFDS01Z?=
 =?utf-8?B?YjYxVkZyWFpRMk1OaGRpM1NsT2JrZUtaVWUwUEgvTGVOd3pZb091WGFoWTls?=
 =?utf-8?B?dklsS3lGRTZwdXpRcnMzQ01rNm5hUEFLMzdSMFIyT3MvT2RSUzBubHJuNk9h?=
 =?utf-8?B?ek5sWXlQRDRjTEtLNGxBRyt1c0FJamxqNzQ5eElKYkZybjMzcU9ySlBPWmY5?=
 =?utf-8?B?cWc9PQ==?=
Content-ID: <9EFC7116B921F241A075AA552C3DDE16@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: soMnk75F+HJmpWYpcK6TNzw8Dbka2TiPPkQivCJ60IVFqXUhLuWeiRFP7bNp4ZCs11tX/LIIGihp2OrptTneDalpONo37djkcuM8jzQyiVQA1ODDttEdhxbN3bosVQEM5s6BriaZEwupVZR707ktwHct/jPQZUMJ9GuPGAP3cDF1JD0Eb1/x8FQMqDeOqIqDcxxTDVtHKLsj1g6LVQjvfXoAO2hRXa9hyBYkh4A1M0KQfOheWokw2JjtqfJyuum9ZLc9HmqEzGUIBGP+vc2kUW48pcqgQI78NiZY19lWU0+WQXNHSyNsSed3H+gJnHKyzgOTclprNxAS4PIaI1NqN7Sm8ezl0MYHVwOGTosDzkAKMptFaBErksGhcEiS8sxRpL8OYxvUuV/3C+TBBmSt2ZBUXjWhp+F/ObaxWcEH/9bXDOl/IgPYeFOJQ6xIrxocnl1Rs9DK3MwosMAph4FkJico2/A+MyMxOSTFlr1A/RpKUgJGF3kgotxvB45XEYsuepOxfx30DvpwyAs7ViK1mc0sVhctO03UvkbKu4crKx8SZ5hmQqUBPn8fUy3fB/JO74fYkIVtTI2k/2Wfsl+wGzLJv9BG756khXbOYDhH+zFfe5dj8M4pfJZv9L3ifxKdihUvFeXTIZhyoh3Mc1D6Ng==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68b5acb-f1d0-4781-7c95-08ddc0d3e857
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 23:37:32.4726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jo7/sjfKOcjLADsPJrLlk1uWSW9P9JKRN7fJcImymWE8D832qCYLHnGFR9BUQ3o2dWk49SdA0/PrZUFYdrvsCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE3OSBTYWx0ZWRfX3AFDFBvB5nde
 DWKEn3d0QJUE79gkBvQ1VnQZbjQ+deYriwTikWMRNtLcRD3pqZo5rXUENNtJcfUCM0li9n7fu3x
 gnnGvLWpvVw0dGdygnE34AcDNfMaZ6S9ozVscPe5YpWoIyjxCj3yrVZ7WerSHT9O2bP/xPKxWrN
 2+HQW9qoKSkth2BuJHRdyUjvBvzpwdvYlm4HEGnFNysvDfFKIMN9IXcfbjbDU87pIar5WdOcx+a
 jGcotATuyDL65BomIbg+wOXKo8YgT73ugTdGAi43qYKyCract0OZuYVInYq+nUIf3p1lpnA9uFZ
 HY32VlEe3rX41bWx4pSmDZtzxrBJo48At0nIuqdsPclAVXZcFi9L0+fEWD+VuZIlyeLHQy3hUCg
 y5vllVDlhR5NyfB8vkqpHYN5+yzspjr90jP/bzhw75ZWmq3/wCZpFlaL799Ejkfm+D1KK6+b
X-Authority-Analysis: v=2.4 cv=cOzgskeN c=1 sm=1 tr=0 ts=6871a048 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=qPHU084jO2kA:10 a=Rl9bu5jJuELA1LziygoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Qypial7bS5ofd9svbQ0hn22MoRkpLIav
X-Proofpoint-GUID: Qypial7bS5ofd9svbQ0hn22MoRkpLIav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2507110179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_163815_725040_E28A73D4 
X-CRM114-Status: UNSURE (   9.55  )
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

On Sat, Jul 05, 2025, Ze Huang wrote:
> To support flattened dwc3 dt model and drop the glue layer, introduce the
> `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> and offers an alternative to the existing glue driver `dwc3-of-simple`.
> 
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
>  drivers/usb/dwc3/Kconfig             |  11 +++
>  drivers/usb/dwc3/Makefile            |   1 +
>  drivers/usb/dwc3/dwc3-generic-plat.c | 182 +++++++++++++++++++++++++++++++++++
>  3 files changed, 194 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 310d182e10b50b253d7e5a51674806e6ec442a2a..4925d15084f816d3ff92059b476ebcc799b56b51 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -189,4 +189,15 @@ config USB_DWC3_RTK
>  	  or dual-role mode.
>  	  Say 'Y' or 'M' if you have such device.
>  
> +config USB_DWC3_GENERIC_PLAT
> +	tristate "DWC3 Generic Platform Driver"
> +	depends on OF && COMMON_CLK
> +	default USB_DWC3
> +	help
> +	  Support USB3 functionality in simple SoC integrations.
> +	  Currently supports SpacemiT DWC USB3. Platforms using
> +	  dwc3-of-simple can easily switch to dwc3-generic by flattening
> +	  the dwc3 child node in the device tree.
> +	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
> +
>  endif
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
> index 0000000000000000000000000000000000000000..f251dda60903364d6b326a0904ec9b113e61f5c0
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * dwc3-generic-plat.c - DesignWare USB3 generic platform driver
> + *
> + * Copyright (C) 2025 Ze Huang <huang.ze@linux.dev>
> + *
> + * Inspired by dwc3-qcom.c and dwc3-of-simple.c
> + */
> +
> +#include <linux/clk.h>
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
> +static void dwc3_generic_reset_control_assert(void *data)
> +{
> +	reset_control_assert(data);
> +}
> +
> +static void dwc3_generic_clk_bulk_disable_unprepare(void *data)
> +{
> +	struct dwc3_generic *dwc3 = data;
> +
> +	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
> +}
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
> +	dwc3->resets = devm_reset_control_array_get_optional_exclusive(dev);
> +	if (IS_ERR(dwc3->resets))
> +		return dev_err_probe(dev, PTR_ERR(dwc3->resets), "failed to get resets\n");
> +
> +	ret = reset_control_assert(dwc3->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to assert resets\n");
> +
> +	ret = devm_add_action_or_reset(dev, dwc3_generic_reset_control_assert, dwc3->resets);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 1000);
> +
> +	ret = reset_control_deassert(dwc3->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert resets\n");
> +
> +	ret = devm_clk_bulk_get_all(dwc3->dev, &dwc3->clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	dwc3->num_clocks = ret;
> +
> +	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");
> +
> +	ret = devm_add_action_or_reset(dev, dwc3_generic_clk_bulk_disable_unprepare, dwc3);
> +	if (ret)
> +		return ret;
> +
> +	dwc3->dwc.dev = dev;
> +	probe_data.dwc = &dwc3->dwc;
> +	probe_data.res = res;
> +	probe_data.ignore_clocks_and_resets = true;
> +	ret = dwc3_core_probe(&probe_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> +
> +	return 0;
> +}
> +
> +static void dwc3_generic_remove(struct platform_device *pdev)
> +{
> +	struct dwc3_generic *dwc3 = platform_get_drvdata(pdev);
> +
> +	dwc3_core_remove(&dwc3->dwc);
> +}
> +
> +static int dwc3_generic_suspend(struct device *dev)
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
> +static int dwc3_generic_resume(struct device *dev)
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
> +static int dwc3_generic_runtime_suspend(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_suspend(&dwc3->dwc);
> +}
> +
> +static int dwc3_generic_runtime_resume(struct device *dev)
> +{
> +	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
> +
> +	return dwc3_runtime_resume(&dwc3->dwc);
> +}
> +
> +static int dwc3_generic_runtime_idle(struct device *dev)
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
> +		.pm	= &dwc3_generic_dev_pm_ops,

You're still not using the new pm_ptr()/pm_sleep_ptr. The kernel build
bot will complain about the maybe unused functions.

BR,
Thinh
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
