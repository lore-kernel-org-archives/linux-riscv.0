Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6809CA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vf7XYJ1BPYSNPE6dXOG/8YwKAqS0dDbYlXerc54c9rI=; b=HjirQXRXpjHKOq
	aOjI+84QcYjJC/tGev88wXCV0yPYMxtk72QaTbvS89M0tJEli4AJLt3F/Gvs1sxTQB3XnKR1Sbobr
	FVXaw+mhXntLzutl4mSxF7A8s1y63ZPeDMj4nR3coGHuAqg/icq6ja2vp+DgrATwS8gj5Lh/4ce4Q
	jvQiktNcDg6urenvsJTUyAgMmwqf8pSMuIFBDKcgav9N8SS9KnTgRXfz/t864VLjPIH2T1/D9yMnK
	EYEDVCy+6QSAPUALEIqsSgIn3DZ9Tw4oGSiHZLwJeezLt/QZXmSt8WwOxiGcAAn4168u7rJPS2XBv
	NkRQ1Tln+Tawwxdo4CCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaGf-000000040Bu-3xOK;
	Tue, 29 Sep 2026 16:01:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaGd-000000040Aw-2eP7;
	Tue, 29 Sep 2026 16:01:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqnuc3842907;
	Tue, 29 Sep 2026 16:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=5TTbWVFayReKqenTwjaXpTJ8raP/lYRMHDnngJ6MC3w=; b=Rf
	AKDNQh89b8lhNq8SAaQrVkOSRL36pHFqyuoEamkQoIk7+B0bJeEv1y9w4kQDYZC6
	7NfS+eTFjLh8kCyxjvNZFDXT7SDHRlL5wbbvvqx0jHuNPJw4N16FAIpnQ/MH54w2
	mZcQMaeo/qReQAHg+RGiK3rDEO1/yvmMjUiX+8rjFv/o+EYrCrzrpTz8WrNCT1tB
	KdtpaqORWii/VsB/IWl9vvx2HtuYCfeqpt455615FKX2+P6B7JEFUv05zVOg6GMc
	VfEy++Ay6gqjNCSeQ52v3J0bFSYyr9crzqJxtMRv4YdIb7p5BNa4Kr97p2h3vG5m
	BhIHIMfz3mYA6Rxu0FhQ==
Received: from cy3pr08cu001.outbound.protection.outlook.com (mail-cy3pr08cu00107.outbound.protection.outlook.com [40.93.6.111])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v9mc8-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 16:00:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKES52YRoZ8x+IyA6LnhKsudbtmj7Z5thkwmqVUZuOHVEj3B2h81CMzB3RFXC23BbHvnP2Jrhvoy1tjZxkvtxxG++px8RYKJm7T/ClEns7mJJ/drcb5g861QAPIUINyMuAyv00SgIyD3t8QLeEczNzPnOwQUtQB3SB3Ub8DwkgvqbP8GUJM/3EPdCFG8d61RYGTENGk/N5RiKozvwVk8XT4/tLgTpC6AIZrsPLZ9/WR7qkhRdTAuLaYXdSch6bWQ9QP8OJ9vdgZS80wKfiRC5f1MmgHdT2tfoxZXa8K6GUUNOIi4Cdz26/e5jgYRCTAq7tk4I9ZhxMeDVUowQWavDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TTbWVFayReKqenTwjaXpTJ8raP/lYRMHDnngJ6MC3w=;
 b=lFW8JD8Q+9N7W8SR411f65QqabJQ6ugr+SxZsa/v5dVuU2k7qKmGhEYJz1MgfuNE383tfVIFpjnhkBUY34D0ujKPW2GCro4mxIGC5whXfu/qXjl9T0jMDHMOQp8kQTLOvM7APNwC8nBrsAIfRSGb6HW7znvEYBj3KWB2ipzULE3OLD0qLomfozHWH6pGkgVjefJaM/IXRAkkGLWk2moK7exGlttA0MZx4F/qhX13JNV5NoJS+5f+wkZRTHmBLvYOvjH7X+oVucMmFohahQ3pNB1vnhuk1CtqlzG6TxZifHH16S/eeTaiw6IF94Qs33fKXELLILIimoyOnEsK/kAVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by IA3PPF34B2BFAD2.namprd02.prod.outlook.com (2603:10b6:20f:fc02::248) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 16:00:23 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 16:00:23 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang
	<chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev"
	<spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev"
	<sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>,
        Florian
 Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones
	<andrew.jones@oss.qualcomm.com>,
        linux-riscv
	<linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v8 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
Thread-Topic: [PATCH v8 11/11] riscv: hwprobe: Introduce rva23u64 base
 behavior
Thread-Index: AQHdUCuigBDsWrpZLE+5pUF07crdOA==
Date: Tue, 29 Sep 2026 16:00:22 +0000
Message-ID: <DLRXBUKNNOWW.BHCJX6LQ9LB1@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|IA3PPF34B2BFAD2:EE_
x-ms-office365-filtering-correlation-id: 6480966b-625f-43fa-7e30-08df1e42c528
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|10067099003|4143699003|11063799006|6133799003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: VQbkunr51aViZ9+iC1TBkO6Y3CSIqXFm/Y+lbdfGjI63vyIsV54GXiJ3dKL6GcQ32zhCd40LKh2CweSpy4wY6YMiYjk24yVkNcNdQENw5dWOquKNOHdE3PzpKDsockv/lczL1Ouk+uaga/Lw3LBLydIZtHUMfIfSOx9LR4bomQVzWTXmed/em9ttfnNWrNMnR2And/HtD6dn4Tvmr5ImBbXcWfTfxxBQLuRnNc2DUS9UPP5eeICwFX9Jr+xhsa7zkkBavgUxZFyZ43ZGR4Ql7TKcqFpISJMLBiypkZUpL8+d4DvmzSw4qRb5O0jZW3iGIOclILrdo7Pgn0VHTtIecF2anovP6DgspqayrNixSh/VLhb824lPTpLt4pgTQRCDJvBx6WPUDK3s0Kw07ys2BWGfKItnwn/s4kzusPEIYOTZB5V3qzm/ZVaFegooeJ06bU18L2uMzi8N6BM/qwcY/Kz3twNJOpDmjMxZp3v+G7Kd+mZYZWyRD6JXhNLAzQKo0rhemyTH0reS+6TCCuB28PHYweQkKZQid+ueILHpn1bBCUq+t3y2hHY18GNB6cno02r+YrfuXGEluP+vTT22O72rzv0WJk0bxFQfplJB1hG1bz747byjgZBibkQfQQzoQkb+e06O8QC2lKhIyh52vbSAjkTf4KdvvrklPB02xg2R7nWUeFjKUJyRPUPdlae/5PSpLdYTy+PIXx0FYWJyIdWjppe4EeVwF3a2WvbC8es=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(10067099003)(4143699003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1lWTTRwUDI4NXNIL0dvY0t0c2RERUNUVVlLMTlUOFNDdFJNTzV3b2VHVVpN?=
 =?utf-8?B?ZUFwaVJUT291bFhKZis3QU1vU3ZVRmdLYVZyUDBsQWpZdW05NnFpS2YvcVVH?=
 =?utf-8?B?YzJwSVFEU1lERVBucWUzRUJsU3kvSnp2eC9EOStNb2N5M1p2RjNQNHE4Tnd0?=
 =?utf-8?B?T3hzU2kwQk4rSVQwWTV6emJxcm96VmM2TG5UTWljSHRaN05VWFBMRmc3bEcx?=
 =?utf-8?B?S1hCRnlDemJBMDlJcHNsTUlaYnRBWWdSY2llZFJCUE5qVTVWTGdmMkg4cFNK?=
 =?utf-8?B?QTZ1b09sVklpTE9MY1JnbFFUVEsxaFhOVWdJMitxV0xjTmY0SExramdONXE2?=
 =?utf-8?B?Sk5URXJXdnlnNEkyTWJoUW44SmMzRFIvUS80OE9NR2tENUg1NyszbzBJT1dE?=
 =?utf-8?B?N2tKUVBKVFFEUDRWQVdjM3VqMGtCOUxHZXZsaXRPWUFlUmxuWWJFWE04bmto?=
 =?utf-8?B?NDAyMGRYQ1FIaVhTbUhISkZHS3RzbzdsRk5IRGtoWjhWQ3dSaEk3NW42Z2I5?=
 =?utf-8?B?OHhlcVdsL1pxQjJTWFJSY0ZEOFBONnp4L1crVy96bUJoTzBjQUhaSjY1RW1Z?=
 =?utf-8?B?czg4eTJVUmJzRjRiTmRRSzBqWHBxV2VCMWVjY3BHY0lXQWk1a0ordVV5ZTQx?=
 =?utf-8?B?TlJJdDNhbGkzUGJYRjBicWhYaW1qeWFnREZEeGxBNVBXbGdNdlZhRkY5UURD?=
 =?utf-8?B?VHl6bUVMMFhYcUs0RFhRUTNPTGlCOTBxdFUwdEduTkpLb25VZ3ZldDF1bzFv?=
 =?utf-8?B?Q2prNlNiZG5JNlhUb2s1TFJtSDJ6ZkJxdzMvMzE2NGQyV1NjZHRMdjBkYTJm?=
 =?utf-8?B?SFdlMUd6NnN6RUgzdHlhb1lnN3hTZm9raytIbDk2WThFMG8wWFlzd0lpcGwy?=
 =?utf-8?B?Tmk3QXZZU1FHeFd4a1BhSHZkdlArelcrakVLVXpLU2tyM1JLL21uUElUZ0ZC?=
 =?utf-8?B?Y0ZVSjJsNE1FdEpZM2NiTnBQdkh0N3RTcnpzZVhrUHFpR0psSUp3N1hhUGpj?=
 =?utf-8?B?ZGoyTEpZVlgrVGJvYzBnTGkyYnE5Rlo2OW8zR2I1RERGWkZiTnphZ0dkaUNH?=
 =?utf-8?B?OFdmZWNrMFE0SzUyQ2FjaEFvOG5xaVFOR0ppbmdnSWQxZDU1OXZqQjBPTW5m?=
 =?utf-8?B?dldEb29EcjZhbDZlK0NmVHV1Vjh4M0dnMHZmRkpyNUJQU2RYQXZxbndKbG9Z?=
 =?utf-8?B?aWlDQ08xQ1lEMGVxb3Z2R1kvT3I2WVAweks0UUNVR0g5OUtETWtTdDJZVFpE?=
 =?utf-8?B?SXYybUlBa0pqQnZUbWE2UTREeFd5R0o3WGtCV1JqR0ZqZ2ZIeEFTcnN4U2VG?=
 =?utf-8?B?V3ZSRC9jQU1DK3R3bWo4a0tJK0dMUGlMUmV1RTNiUTF4SzVEVjNXaHlmaDlh?=
 =?utf-8?B?N2ppQmcrSkEzYWlYZENibFg1UUpaMDJoaHZCQ0hmZ0o3d0ZsaUpkRlRJL2hR?=
 =?utf-8?B?YTJhRXVrNmdXSit3TTJINkdxbmVPWk9HMmI0VzlDKzBibkEvVHlvcER0Vk5J?=
 =?utf-8?B?UkZRNG5iNjhMamZiZm1vZVBtWFhZaER5dWwvZlQ2K3dHeWJhOThPY3ZCbm5W?=
 =?utf-8?B?eXdKU3Z4cUExSFRmd3VRYWZFem9tYlk0S2lHL3ozY1J5ZVBGajQ1Zm5objBX?=
 =?utf-8?B?bVlsR3FMWXFzeFo5ZDUyeGxxRFYxVkNPWXBleDBjNERUNWNsT2V4bE9kMkVi?=
 =?utf-8?B?VFgvMTI1cXB6L3FOWjRITjlJOCtUaHEzVWpMYUt3alcweC9PRGpaWjlWV1N2?=
 =?utf-8?B?RVRsTUxlMG1yc1pHVlpzS3NXNUVMQlRSNW1Rdkh4dzVGdzFQOTBoWkN2RmpD?=
 =?utf-8?B?WDMyWmh1RUFCQWRjQXlRck1jR3Ridkx6UWhLWWF2cmU3M2ZkLzdLM1Mxek9s?=
 =?utf-8?B?VWNDYmFicEhMUU16bkdma3RuL3BmN09JZ1dxWmxLZFlCYUdqNmlZVlNXeWRE?=
 =?utf-8?B?VzYweUs0VlFOTzVVd202emwwcWE3dFIwN1l3eDM1TUxiRm1hNE1kNnBLbkk2?=
 =?utf-8?B?M2ErMUUxRWJIdmNha1NqUVRqZXBydUFjajNZOTQ2UGViYVFhcStWV1liZFBJ?=
 =?utf-8?B?Ylc4MjVUb1pPTHdkOXMrYksvNEJFSkZLMUo2ZmlscXFjeG1jc2hqcEcxZmE3?=
 =?utf-8?B?a3FoWCs4VTNhR0tpSklRSkNXd3ZhdjhtaXVvZTBGYUNEWXhUV25VdU95Tkhs?=
 =?utf-8?B?eEtHM0RzN0ZEV0xGUnR1Y25aOStuc2lLMjB5bTVBcVJPL2VhRWFMbHdpODZL?=
 =?utf-8?B?WFJ2bzVzaGpJQnQ2WkFZU2JQT04zejZBVkk0cDFJTWJaRURncEU3Rnk4T1dW?=
 =?utf-8?B?Tjk5NzZSMnMxZnRJYVM3QzlHMWMraUFDc2U5N21PeGFWN1g1WHZwbGxuUzFG?=
 =?utf-8?Q?+ne+5cPynSOsbz9Y=3D?=
Content-ID: <DCD8B61CF6B59A429D39478BA6B3DAB8@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3bvFenV5er88iYpkM/Ovv1EEvomiMVX/bmRK9BV4EIHLaYGGoT3GVQY7PtF6NIma5B3iIrXcDDJPvqw4RfNFt1JXfwxMCKCQEN0VvFCK7mcQ3K/CcCwG317FErYCVXFwWxlEJCxn+p7x+T7ipOG0u3kGXzmeLdFtgfdIAYCNkHMivbowXhtXwJEfLrWv05sWiM5D7gN6Tsi1YU/fJqQFgmec3CnLKbxgnPCe/0FLtHoDEgu/P6gL+lo6n4Sp6TKrIfi9tKyKUo/o2vWaqI2PMfUbA8FD6fuydSXHvt7J9pVg2EFY8JxIHRNGrGEn7/dL7P8+LVY4bNhXmyXEWKOlSQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4xpmdwBLNpsZeIKhnIFybukPhvhuOCvaaBf+LTh99RRCcVRJXQulQAf7gGb+C+TxN/BQ3uQMNsnDFWCpgE81kI6NbqS9a+/sfjIh0ZXP1MAegWqWNTWmE0u+Fw0jAse3qT4b2HNJu8+IcRX3Zhy+6N5ZdT9jtTHFZwtIu46GDPvPDyUU2f+jiUMgCWlcEDr6w6K2evyaq6LtyBWOwNq8KLViwJ27+geQDF8RdFdNmV85i0zbKS9F9NBJ4N3LLjkBNF0l95Oi97VfssjVGzKAmjNpSUkmMaxKz6DQuWSY7X9vCZHCxp55zDZXA6viLp8MCVqE6t7QO8Zy9whX+WxqOv0+vHD8jamuwVxCKUsUboO2QXdA+ZG1BxaNUZ8J3ERkedAD9Tuk0U8FYD6V7vaw/9IkDwp1u6JJ+Xt/R+G4UaZbk57SbbbykZsxOyaCUTRV/fb0edPPmhJ0l07t6/O55Je58WoBRCQZVNlWTa9ygj8axuwlrTNRSI54WnwzfyP74aPTVrjQMKoC8ER577wuSXibFn5y+cnt4K9Ar4XLnSKAjoLC/UFPjlQZHIviLQhc5bob+9y0kqngKSIMh8tNWfQLEydEqe+f2VYtBSs6UtKXHWzy4ceZUErvrmowoK0I
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6480966b-625f-43fa-7e30-08df1e42c528
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 16:00:23.3948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1gOu96alweiz1AS0K8+fIz+0yd1ZgDVbUPjCxV7S6b439FvXj/8PPX8epGm82dJhfcRzWuqVx5vGLhdQqvOq2DY5D7DUlCAescrW0bwEnx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF34B2BFAD2
X-Proofpoint-ORIG-GUID: zgeB83xomMjaKodpddyNGF9NPtvHHG6F
X-Proofpoint-GUID: zgeB83xomMjaKodpddyNGF9NPtvHHG6F
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbe09a cx=c_pps
 a=LFrV0Uq1DfWk6JpZZ2TuOw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5WXU76tXmd2n-3-7Ze0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX2jmIC3ymOSfW
 uN/EOsZs+CCtEZ7YkDyM/uwVbhLTXsG1dzurUqvYh9KwE2F2CbLIBzWhsF6LG5ht8pn9hiM4CPJ
 cfHGQdDxKDJIw4YNRU/a7+LALOa1QG1Ds3m9YZsoubV8IDohNzaXOsmADUBmuVWU+eGoTDAlhwF
 TJCBmaQfTKzmLU1x63qe2jzqtkIBcVeHciIqrGS9t2GyBPrwpCsfZc8I+KjBg009GJHWjxpBx5E
 p8JGWDnKSJUqc3mW6oJlKaf485oeyrdQW7H35KGMR4nt7jYQwyLNMK+yspG28L70jeaQDs/urln
 BWRqn/HNCsXGUneQeHIGpwTnCs7WL4hRibPVlJugKceBlvrtxlnm389M/cgswUj8/DWPV/01gyJ
 LR98lF23BuYk4ugV8ctVI5B4fZThGENRasbkpj4Mi/Ize4UAZX//DOJSUtg0FxwqkcY3NHzKgON
 UoVlKVGlMbogHmwPL+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfXycdBy57xst4+
 ST5NrM5M54z5DZKteyZf0msFxmw1beZqSqpPXrmhEr50f2Uy7FZKyLdziMzYaiaZ8+XTnZLA/r7
 ZZsh/gpCOTsZQmCUkFobN80Y3J2aGnE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_090119_792082_5E13637E 
X-CRM114-Status: GOOD (  15.89  )
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

2026-09-20T03:18:31-04:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> Provide a hwprobe base-behavior bit so userspace can check RVA23U64
> support in one call.  Without it, a consumer needs five hwprobe
> calls and four prctl calls, which is error-prone to require of every
> caller.  Most software treats RVA23U64 as a new base anyway, so
> expose it directly.
>
> The IMA bit is now derived from the same cached bases instead of being
> hardcoded, so it agrees with AT_HWCAP and the "isa bases" cpuinfo lines;
> on any system this kernel can run on it stays set.
>
> Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> ---
> index 8a38a4d37806f..2290126792797 100644
> +static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
> +{
> +	int cpu;
> +
> +	for_each_cpu(cpu, cpus) {
> +		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
> +			return false;

I think that extensions like F or V might be present in the ISA, yet
actually disabled in user-mode and this loop would misreport that
RVA23U64 is present.

Is there a reason to diverge from how hwprobe_isa_ext0() does the
extension detection?  (has_fpu() and other global checks)

Thanks.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
