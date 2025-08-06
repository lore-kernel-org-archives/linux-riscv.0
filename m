Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404B4C87FD1
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 00:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjEImNJyfVjCwGq3gPJCCRavKvVMUuTaW0EaHFRqZcs=; b=xL1D+oo0D0M+gU
	SPOJizwNOA9ydteQ7EpSQRJQKZRXT7W2vUxm8ptyG6VtAFKdy89wvpmfAd49mgy7N9GSLvkGoQrtV
	k3/O5Ny6UPQ0c1U0lamyZ7/peR1m+on4VL4vTjQzCK8VzDMfV6Enop8bc+Rl9xJshL84M4jsRj/lI
	WA3T9hNN7yw3vOFdc5Arip9Ke2wRuaboCSmW4rc1Ax94YEzrVod8iQGERtAXiQ4zF2o3wTMDOLUHH
	JjADqlUEwh67L98n7ngStL4vuGSNma+0J9JWaBwyP3au00MNMIa1oEo2qdjlSsnEgYCUcuPLsQy9P
	0sZj3Uwa5XKXTVnvx73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRzO-0000000E3ik-2JSE;
	Wed, 06 Aug 2025 00:26:42 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRzL-0000000E3iO-29gJ
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 00:26:40 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IAh59001004;
	Tue, 5 Aug 2025 17:26:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=vdUb2MFzsa+Sgpoj85DczSrLIiGOj0XTM4Hq+GKdLEM=; b=
	HdcvrRxLJmccTdj8ZUV6LSF7DQ6M6ive2sKJLgvJZJGQFw2q1v9hF2ij6XjPLOrr
	7fRJym2qyVjFDStfk7AYKTaEv5OED1A/DHT7khjHTjGFyRoogingNftttHVxRUhE
	rvjqXqbhgQ4zo+ephDU7VOOXIBJ6PSvQWrhGX5FWnPmoBCXSRGwFbIrrFcprUkTg
	Bys0eBHXl1BLTZM1yUukehaGgFBaSWLNSaL2GQSyL+6KEyUctIPwwSLAQNmfCNqu
	U8eplGp2/cTaE7p7Qn3k517EYnI8rMClE5Q1jv2xfuIWLyRhQhSMshJtbb3RMQ0i
	glqgmb0fdCrbkMNp2F71AA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 48bq0r9n62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 17:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1754439974; bh=vdUb2MFzsa+Sgpoj85DczSrLIiGOj0XTM4Hq+GKdLEM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Hz+KRCQk12LFdy8DF3X3cWKtOGm23wGuLSTCv67C59IYpEgxENhit069fArG6Ako9
	 akECRv0+rGRNtvw78HXstig2zenZeupRx3mBhyGbsqWNH7S5mI73WvZybjpsMDFosT
	 JFF2nANywIEtzMCWeHD/fZdRZSqVQkmCQZy+AguJR9z2y6NrzqV3CC46AV+eG8hPye
	 1x91iPniq7rzDLpcSjd8TkW+NtDbWaHLkTVGDSOCMSIhbCSnIEJyTY4MDg2UVDvSyf
	 f8F1FGk2b6INYJYxb8n+qCny1kDtPyqKAgnOq7s02DyVmSkmKUN0Vtrz1ad9NIflxR
	 nDS8yHe0eUUlA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F09C240349;
	Wed,  6 Aug 2025 00:26:13 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E87FEA0075;
	Wed,  6 Aug 2025 00:26:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=StseLVZK;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DCDEC40533;
	Wed,  6 Aug 2025 00:26:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqFJqERijD1yPkd2eMQI+mYF1UlpnbectufSNJXzezOTOvjsp6xkBFXiikoqbK+beUD6q/0gCUeDZDOoLbFDNuYN9jFHBBZUAFcBy+hPMcFxyT+JCJDqtEPjepWGVjKwyLhhOy1w5BYPAwGuGQ8Ibc7rXPG1jx8iwJw/KB3kKUelchfRdi6QlLdHqfJelBXfsEv48l9dYLbd3ywbB/Si9HqaY6/HVIBh/+Sk++ESwQAczD94DKzzKYHie4M0babeQ14qN2QRX/oTHHmLZCQb7cDMFfyQPqNNdpKEmVMfP7GPzm0uo+/AFwar3xhodKWJpUsVfRymYdg0/J7ead+4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdUb2MFzsa+Sgpoj85DczSrLIiGOj0XTM4Hq+GKdLEM=;
 b=aO0LU+1hvYPRKdQ0v3fGktZLJfi4Dms2jP45wb3MKEzDtgm1POvhLhGfCisIS0YD6x7nJ2gxBldu8oBNgx1k8yllcXZNRf0QcApahGYbWsxvFNpAXJt+YB7q0QCBX3qv8xfnGmKrwBMX6St+i8F+JFAE6mJmLwN5lJBd1WrMSsC+D6YOL8AC4y9kp4oEu3KEWHlD5gSKn9l0WgSTIgR6RQjjA24/DjY5QM0Wp2JuX41mAWVFmHF5OucLKRWSKdNksdENW2eJ94nyX8aTd2Xw/90Z8HGLfbgwsMIIXL/m/F/vNNoZbyQjdRJ/us8R6ZBOZsacMDX54is/7AixDqPDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdUb2MFzsa+Sgpoj85DczSrLIiGOj0XTM4Hq+GKdLEM=;
 b=StseLVZKE0oDCuRSiXcAkCqt17VNMmo+riIFG8d0uh4gXfT8PT8gaS1SnuiMpMzYuYF8l+xGThvp56fSvItLarNIWE+MCqrliMAqy7uFvU94jhJsSRg52v6/kKFURS2ujVKISOEctU2oBCwqSMkT6kAVNskZOzFkKew1TyBUmm8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Wed, 6 Aug
 2025 00:26:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 00:26:07 +0000
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
Subject: Re: [PATCH v7 2/2] usb: dwc3: add generic driver to support flattened
Thread-Topic: [PATCH v7 2/2] usb: dwc3: add generic driver to support
 flattened
Thread-Index: AQHb/919tIbyhD3OhUCAdig/9wgQ9LRU0aoA
Date: Wed, 6 Aug 2025 00:26:07 +0000
Message-ID: <20250806002606.sz4s3thebvgvrqyn@synopsys.com>
References: <20250729-dwc3_generic-v7-0-5c791bba826f@linux.dev>
 <20250729-dwc3_generic-v7-2-5c791bba826f@linux.dev>
In-Reply-To: <20250729-dwc3_generic-v7-2-5c791bba826f@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB9504:EE_
x-ms-office365-filtering-correlation-id: 257b74a0-2471-4fa5-1526-08ddd47fd62e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S0hWTnhwTzhXampmbDJXbVRaRUdZNjFIMGVHM2ZJeUJqdmsrWmNlNm5nMTh3?=
 =?utf-8?B?TzE4ZFM4VWxFUCt6Q2o1OHZuVU5DMW03alVURUxzakF4UUp2cG1VYjJLNzAw?=
 =?utf-8?B?UE1vcElmSDNCRlJWMjAveUFZeXp0ZjJsTHZ6ajF5dkJwZFdpMkVybkRLa2lt?=
 =?utf-8?B?SzZuNCtQb1o0VWRZeEp3R3V4WmlkNmdacnBON3VaclFVOENqaVNnQThwK3Z4?=
 =?utf-8?B?SjFMQWMyeGJPWUp4bkVxM3ZCbWlDRlZ6bjZGdFBNQnFjMHJodnUxNFVqVGdP?=
 =?utf-8?B?Mk5mUjFQbVgvTnlaMGRTNXQ5VmNhc0kvTmNyRmpOQWVwbEVCTDBTVlArT3Ay?=
 =?utf-8?B?NG5FbEU3TnVYbUl5Y1lmaTRmVG1JK0pWNGR5K2I4SzlzdHorMmVPVUptOXBU?=
 =?utf-8?B?L0MzZ0QyalJnUlF3TkxWZ1NyMHNQWTNuSUlGNGwzU1FBeDVadEFCeFlZY1VJ?=
 =?utf-8?B?ZmxtSFZWZS9la2JNcldrREFsZjJrZkpVWC9FN2hYM1paQzNMdXRhZjJOek1s?=
 =?utf-8?B?UERpSm80K0pVUXE1aTJvR1pSUFlDOE5BazZSU1k0VUQ2NExYQXcrMElTdE9o?=
 =?utf-8?B?L2szQnJXY25CU25KSzVYOHVmZndxbmdxb0p5Skh4b2dDOUs4N2tNRnJ5Y2Rp?=
 =?utf-8?B?RXBrblkxUFdZaU5ac2tPTGlBSVMrd3JTUzBvSDJGWWRTRXM4SUdRbENia055?=
 =?utf-8?B?bTNOd1cvcktRSU9XZVF6bVZYRnJmK3lwaXh0bWdmK0ZSV1hEZGhJaVJncTBM?=
 =?utf-8?B?UTBXMWo4K3BOSS93S3VtZ3FlYzJNRFl1WFpmUE5qQU9FL2xVd2JmajM5TVVK?=
 =?utf-8?B?bnFTYk9la1huTTFyYmR5TFVwOGpsWTJyaXFWK0xlK0Q4M1lsclVWUDdmczNx?=
 =?utf-8?B?c1lpSjRQeExBckdoU1RPajI0a2FNUHRJNi90VVlYV2dyNzNjM0tpbVJkVkZZ?=
 =?utf-8?B?SndpdE56a0k4bXpNdjB6QStqSFl1djAvdnpzYlpUeGpPdElxMS9rYlRQencv?=
 =?utf-8?B?d0dVNmxVcnBVaCsralZkamNUOXVPSVFkd0Rva2RzdUx5T1BTMTZqaG9rQjBh?=
 =?utf-8?B?RXoxeVJ2S3JhWm5UTUkrOVJxQkN6VG16TW9ocGdEOUdocVhzVHA0bTNIeTgy?=
 =?utf-8?B?Wk1Jc0twc2hHYnFXbnVHZDdJQ2Q4MW90TDBkK1gyR2NteDdSTEdaRFdYRCtT?=
 =?utf-8?B?a1ErTkdKNE03eHprQzhvL2U1bGxsek5CZXNXUThlMjRkUUdXTjZ2YzFIZGpL?=
 =?utf-8?B?S0QzRGFmeEkrc2ZDbEtUMEYzVGd6SmV2MmJUNk9vUzhlOUt1ZEJ2cHhxYkZp?=
 =?utf-8?B?RjM4cVFRZndiZ0Q5bjlROVJUNzdFZGxSbWZLd3hGN1BRRUNMU0lJUWVabzQ5?=
 =?utf-8?B?U1VlU3pQRkxJL21lcmZpa2dIZnU2dGpqSEZoaCtHWVFlbzVJZnJ1RVNjUU9l?=
 =?utf-8?B?dmVJSDlMbUdFT2NZUU15MVdGVmFpOCtnSC9yOG5IQlJLQmFkVHdzM3I5VElX?=
 =?utf-8?B?T0FqRTBFQTVuNW1FUjdtQUZ1aElaV05SVDBHeHVKQmpJTnp3UnM1aVU1bDA1?=
 =?utf-8?B?UVcydk56TkxIb1lOTGFaS1pFSEZOOVhtcTIxUzVYMHNDT1RBZ0JTcW5ldVNo?=
 =?utf-8?B?M01yU0N2WnZLTEZBbXZHQjU4QkNITUpTR3k5RjBUMUVKckUwTnFSQlYySDJo?=
 =?utf-8?B?VWtnVzg4djdYMFg3TjJTR042N1pmRjZYaEdMbmdIVDVPa2FERFVjN2VtSTRx?=
 =?utf-8?B?OFNsOFBzNnI1RVo2OTRkY0dPQS9WM2Evb2pFYzZNalQ2eVZwb3ZFRHNRQS9Z?=
 =?utf-8?B?VytZOXdBL0RmVG0xN1JwZ2xzMGFLTjBEVHZmOVgvSmpYL2lYWDJhWHJ4dWZB?=
 =?utf-8?B?emNmbUVmdzkrOC9Fa051eHdBYWUzTG1yc29zdXRVWlU1WUo0S2c4d08xWCtm?=
 =?utf-8?B?a3NpeGZHS0JQNU96UXdmWHdlaERWbjBQbjVmeVNtcnVUTlZmeGhZV3FGVVEx?=
 =?utf-8?Q?/DmMkxETqesyXD/Y6cEQjfws6P2ZA4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTJJT3N6WFFFbndDTkNBcTNlVnVjQnMzR2o1R0xYeEN2c09uOVUxQVBwNE0z?=
 =?utf-8?B?d3ViK0F6Smh1U2QwZlBJNGhBemNqMHFXSlVPSjc0WkxiaUJRakMycVhJNUFU?=
 =?utf-8?B?WjNhM01CQjduYlZpd2lwUjBXNWxwK0RJcjA3bXFPTkJvWFNGN0pEb2NMNXBq?=
 =?utf-8?B?ck5xNHluemg5Z0R3SllKT3FvbmtaRHRaSjdFWFRnNGdCc0NZMGNDS2tmeS9Q?=
 =?utf-8?B?L3NHT3puWmNZbHZCZzUwRWVlKzVBdGFER3lHcHJVbUxKRDEreU16T1pMUCtu?=
 =?utf-8?B?MWp4WTh0UEFHTjdpL2tDL3BRODBGSm1wWC9SakQ4OWFrQ25WeXJCdG91aXk2?=
 =?utf-8?B?NDRHR25KOVpHVG9vMFJnK1pCdk5sd1NWcW05UE1pNFNSOFpNRElveW9NZzFK?=
 =?utf-8?B?cTh3YUhZNmxyUmhpRnJBU1RhWVRiaHB5bytUbWtZZ1NTYzR4Y0hHemlZeTBT?=
 =?utf-8?B?Tk9OeE5UdnphNjdoRUQwSllMamVXQjNyQ2Q1N3p5OUZLUTdSKzJCNEx5Z005?=
 =?utf-8?B?NW1kUjR5M2NuemprckRWc0k2RDVEOTFDZkRuWTJuOGMxOWdoUkpwSWtjUGZ1?=
 =?utf-8?B?cklWZjMvT3lSdTlrbGUrRzZCdEhMb1doUEp6RDZHdU1oa2RkNUpXbzREYXVN?=
 =?utf-8?B?R3pORmI3dm8wVGtEUXZrWkZtYkp2N1NwSnhicjZMb3lhVU00MW9PWUk1aTJm?=
 =?utf-8?B?L3JFTnc2L3BiN1ZINzNXN3l1cDl4dXlGeEdhcXY5ZGllUEJWc0hxaVZKLzE3?=
 =?utf-8?B?SXVNd0xFakpGMGl1WDlCMEVOQ1F0d1FjWDBhMHF2cmMxcHN1SjRsaE9RK0VG?=
 =?utf-8?B?N3R6bWxiWXl3QnVPK2EwcVRIVGVFcjcvQTYzTWRySnhOVTVwZ0pXV0pnSU9w?=
 =?utf-8?B?K08zd2xXcmdXS3NjMmhnaVBOUWM3bnFuTVRoWmVsM3Z6SmRHWHQ1VTkzdXRH?=
 =?utf-8?B?LzlKMG44SzNsd29hVldnVzJjdTJVQjVUSW9pc1hqSjgweTVHeGhJWUdsYnA1?=
 =?utf-8?B?WDBDVlhoRWljTHdybE54MURhMnU4Qk5Pd09veFovTDdHUTBJdTNuaHN1K0ZD?=
 =?utf-8?B?dnladXE2QUx5dDZWUjJRS1cwZnNuN3MvSHVoMHFFWWkvaHRiaDJwdk54T0Jv?=
 =?utf-8?B?U3c4TTg1VG5xL2NjbjRxbjB1S3hwMk1iUmhZeC9SV3ZLZnk0blFRdFI1Q1ds?=
 =?utf-8?B?em5QT0w5Sjl5SU1NRVVsTnhRMkI4RlArWTBhdVh2K0RlRkIyc25IZHFuUDB2?=
 =?utf-8?B?Mnd2NGExTFJzOG5RVVNOOTBDTHJIK2tMVnVmMldvTGZxZnZSK2g5QmNOMkU4?=
 =?utf-8?B?aGJkYU1qVWg5Q0F0eTZ1RmZ1cmRWQzJVVjg2UHJiS21RRnVJS2poMnRhbVhW?=
 =?utf-8?B?NERJZ2ErN3BNV3ZSNVdjN2d3OEFLUWoxRFJCMktSVFY1NStEWjJ4Ymdrdzl1?=
 =?utf-8?B?eklTZmxLSHZvOXhOWTZscTQ0c3h5enN0cWVuSEZCdk9IVWhYZDlLTzBjR2Ra?=
 =?utf-8?B?eUxibzZ6dE83QTExangrOWNYSjkyM2o0M3pmU3pyQ0o1WEpTbmtFSDlZRVB1?=
 =?utf-8?B?MjBMY29TdTJVK1Qyemo5UnNMSVNSZG56RVlUd1NhNjh0MnhhcjlkYVNIeEZh?=
 =?utf-8?B?WGcwaEhoWThYMzVKZDVMdU02UVZnbTZndURBbFZjbTJ6cmYvN2tTcTk4Ymlo?=
 =?utf-8?B?WFVaTCtRcmp5Rlk4bk5sYWRHdlVkWVVRQWIyc3NSL0pBQWY4RnljQzY5UXhY?=
 =?utf-8?B?M1dDTXpKTFNjYm9oK1VZSEcxSzRGanF1NzhWYzVSK1dxSzVTak05bmQ2c0NT?=
 =?utf-8?B?T2FJNkx4aGJqVlFNL2dXbzEzanE4THVWUzVPTEZYcDBIZ21ncXE0U2NIenhl?=
 =?utf-8?B?V3F5dFdoREZIWEhIYTNkbDE5M0Z2d1dvck1WN0tBVG8wZjBsMlprNXRqbGo1?=
 =?utf-8?B?L3dpcHRyMDFHQ1ZMbDFYczQ1eUt4VTRQUGRSZVVabTNmcnlyWTlJV1kySnlz?=
 =?utf-8?B?TjJEZi95a0FzbHp3ZnR5amtmajNCVWhyR2RoYVpySUZxWEtoZ0IrVGNDQzlN?=
 =?utf-8?B?bUxLUWVjR0VsVkpVb21jUFh4MEo3dnkxc1pqQ1U3WUVmTGhwMVQ5dTEzSzlv?=
 =?utf-8?Q?o0CgUyhX9p9rJ6VBZT1K0lhXG?=
Content-ID: <ACE433DD10CCE646B6FEA52DC5676EA7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: t74gp+PLurbJhOxzJXSLwYRvqo54/fFyyPQYqJl8Sn72LWtXW5UzABs7fb7DoUOFtiCkIKsENTK1LaOOolwZKR7b3vXFccZFD4UblSCQUhJeSPYEeGy/McIHjp85Nb3UTT8NuUTniXx4yUauWTe5GNi2aQJRIULxulLjEr+VmKMJ1FRoCqekFWQhEE3anQ/WxApWMriMagWAcYnKtQ9LdzaJquvYsOV+yRF5479wVURNFcecOuSgUWvbdoy7Xe8x17nPp2T7gVXPxvLU3Yiu6Jac0zMXfNLpDmlYXZgav2x8IXFh/ihBmSsRqg62wrhDaqLMb84lxhInzMHzaZMAALv5Clv7D1akmdlFtR54Af0RafGSimyr/JI4F3E6G2cjrVAURgJNFzPawn1jCIc9AyIORF4TyqiOAFnAYnAACL65r1akwR4/F1RIyh/62N24FKGaWSZWFYmydmJTL8DIjRpsYuhvDqn7pGsE+SfBQYkdxeaPc0bnUobNVzEEcLKKog80mxjozxY89MLdhO0j+V1Dgr3REK0V4WV0VALjixqc+vxSyxKNdG9HlvDQTHVw46N63vatBnkRXk34J/uJejb7iS1PIRZY0/UCF5Cf6eWrnvl139ThkFWdG20bwJBAJ8258LuQsg+2pL13WHeswg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257b74a0-2471-4fa5-1526-08ddd47fd62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 00:26:07.5381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYh7eUVHAAJUZHjPoBuaIn1xuzZ3lf9Jj7RXDmBCdouME7oQTuid1tv1An2skA23er4chms8FSMzOukXnLpRLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504
X-Proofpoint-GUID: N12HLjyu9WDDf2G6YYg2OU19oTIar7gd
X-Proofpoint-ORIG-GUID: N12HLjyu9WDDf2G6YYg2OU19oTIar7gd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyNyBTYWx0ZWRfX+uyzjoTA1haJ
 vJxvJkyI5oIZ/XLiz8ejdURghxr5Q0NlAQUu4ehbCgk5QipBn/uSDt94gIzLLxYhkoKQTyGYm/u
 oV+URzkERG5CfA9YdRVUkasiaSS2166K2ZXoCSVSJIkjkllgwhtOm2DnoAiXEoo5vEsFMme7RMy
 pNcEUVMxjmoiL5rAIaY2z4TJk8TILOefViz4fnq1n5KovdJU2r/7TJE7Jet4ssl0z7Drqc7Qvjt
 N2DDyc9fzj4yoiLAMC6BTk7HKTeH/UYMcxs4QNvjzbnvPD/fRnUbYuKCuuWi1IUeieLaPcR1pm0
 BmxfZxdCHas9QZqBBQ4B4kqIWJyE/cQ+J3GHye6ED88QVs23SF5je4ywAYCfdeon+xMuj8+s52N
 Pp+ghzNn
X-Authority-Analysis: v=2.4 cv=H+nbw/Yi c=1 sm=1 tr=0 ts=6892a126 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qPHU084jO2kA:10
 a=jIQo8A4GAAAA:8 a=jTgrpLQJI89nFxPhvfMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508050127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_172639_584162_2262ED5E 
X-CRM114-Status: UNSURE (   9.66  )
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

On Tue, Jul 29, 2025, Ze Huang wrote:
> To support flattened dwc3 dt model and drop the glue layer, introduce the
> `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> and offers an alternative to the existing glue driver `dwc3-of-simple`.
> 
> Signed-off-by: Ze Huang <huang.ze@linux.dev>
> ---
>  drivers/usb/dwc3/Kconfig             |  11 +++
>  drivers/usb/dwc3/Makefile            |   1 +
>  drivers/usb/dwc3/dwc3-generic-plat.c | 167 +++++++++++++++++++++++++++++++++++
>  3 files changed, 179 insertions(+)
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
> index 0000000000000000000000000000000000000000..abb144867bf5f678223483c948521ceb44d05190
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -0,0 +1,167 @@
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
> +	/* Not strict timing, just for safety */
> +	udelay(2);
> +
> +	ret = reset_control_deassert(dwc3->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert resets\n");
> +
> +	ret = devm_add_action_or_reset(dev, dwc3_generic_reset_control_assert, dwc3->resets);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_clk_bulk_get_all_enabled(dwc3->dev, &dwc3->clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	dwc3->num_clocks = ret;
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
> +	SYSTEM_SLEEP_PM_OPS(dwc3_generic_suspend, dwc3_generic_resume)
> +	RUNTIME_PM_OPS(dwc3_generic_runtime_suspend, dwc3_generic_runtime_resume,
> +		       dwc3_generic_runtime_idle)
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
> +		.pm	= pm_ptr(&dwc3_generic_dev_pm_ops),
> +	},
> +};
> +module_platform_driver(dwc3_generic_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DesignWare USB3 generic platform driver");
> 
> -- 
> 2.50.1
> 

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Thanks,
Thinh
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
