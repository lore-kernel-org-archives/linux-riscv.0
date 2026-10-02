Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88913CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MwwHzgChRrdesgehKlBXokVzg9rbtLV57Ob6a0nSbQ=; b=vvA0nN9zE7Xwd+
	AcipUEgS2IgEPujh3jVsj+nRlW0BpDQyyTqGqEasvKw/FjNnQ3zUeHRg++N7mumuWLdmDLFf+5R4T
	AbqwAeNm3RM01LQiks4p+HVmpEn+J4iLP/XhUk0NwJthfMSgpyo18f4w7qAKRD1/QLNAe8WVX2Tm5
	91YhS2ALVeQCIGr1L0WxxPxKyi0OvkC2Rd1tHd9+DdAmGz/LNmM5s08WMqmBnZloYRVWb18mcctTR
	Z/GYSWWpOEtiRoT8qFt/fa+ck2pPPp+NTABxIy9Ew7mxlLwON9PNV9W5NcUYVbHSZ2hi0D2Gu8Ymh
	EiYEzNzPCxM7ZyKzRPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCchs-0000000Bc3Q-3aIy;
	Fri, 02 Oct 2026 12:49:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCchq-0000000Bc2t-2h7Q;
	Fri, 02 Oct 2026 12:49:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nbA21177698;
	Fri, 2 Oct 2026 12:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=A+m0V2z/IlkzKhwZBfzC1MvdkV2pAP7bWNAlKgnhWw8=; b=hd
	uN7hHL+PNSMp61GL5aPppfWYSV/zQIkgmapNzLywgR1PrF6I1DuSrrFGfYnAirfi
	o0d+GLZQlBuGhL3UGxiy8n+v4jULjjvyN72opIwA1ZubtlHlWfCuX9vk7BEA5z5R
	ziEz5AWD0Mz6doB41s0X+soZA6KM1JreBEoIJkulAhSOG5I4ywMlK4NcmydKE72A
	J4J67mbmv/w051BNNOhFJ7HaebqIZMQj/boy4rvQfcDGyiYwcb+uUFLHhHNzx/ur
	XK3F2xXwL8EeLwr5DAVBNXf9IxDF+3+VFPQ6my/bh3+qHtdiS9pB2lG6JzCo4MO2
	8fGkYmw9Ke1ZSZszJuHQ==
Received: from byapr08cu003.outbound.protection.outlook.com (mail-byapr08cu00300.outbound.protection.outlook.com [40.93.1.104])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nft8fk-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 12:49:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Up7/oPB1saLZhBQtGycL+GGNRACDsXv7H4UW21zIBacFxiMf8uy/oVsPWrzqCmn+F7ZvgthnJmBCrataqvFq/IjGPMqYaQCAmZgsWpVxTPc4Ak66EfoScmeQZRwseX3S1bV+kkYIs06Wl/7/X4E1RaG3jfCEkrneUbQW/zT307sXbICajtmATrB8+B8UYN7yIL75SZnyWN+fWogqMmMCgF8RfeuqlnxDb6moUR6++rBXCIZK+BN/jFQVXGwh3Apj9kIpxrCDp6g66mC1tRMnVE0LJE2YwGJoWAxHAS1YI4TpwYDQfGI5jUsJdr23rvFPhRLgWbX5ZJ9L89OJ/P8WNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+m0V2z/IlkzKhwZBfzC1MvdkV2pAP7bWNAlKgnhWw8=;
 b=BmNiMoHzh61Saqx3EwR1zR6lLpT2EzUMz7NkQhR4fnyA9v1WrphCs33rLMdahSfrP+xIXczUiij17hpazOJXVW3oFiT+jXvcq+Mq/9RwMpiKAIep7WqR4VMOcwLG4auP0FE2lr2tfz0iqXDOTHSGnBX8KtME4yYQocW89NkZ8itsgMkQkHxTcgPi3l1+bkCz22vufVkySA7U9VI7W9IjvPA4cqmMk1Vb9IzoP2kNDI1NcdNv0EwVFr6N6weOKCfVoUPvCHuzHdoCpUGfT6XZ6/WJUxnuMW1+ma44mgkj/q1KnzZwq6h3IbiuCc9mDgxbE6QKbubTpi9BOrajfXKydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by SA2PR02MB7674.namprd02.prod.outlook.com (2603:10b6:806:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 2 Oct
 2026 12:48:59 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 12:48:59 +0000
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
Thread-Index: AQHdUCuigBDsWrpZLE+5pUF07crdOLbp8yCAgABFT4A=
Date: Fri, 2 Oct 2026 12:48:59 +0000
Message-ID: <DLUD4XZN9F16.2LBMTP1H5Q1VC@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com>
 <DLRXBUKNNOWW.BHCJX6LQ9LB1@qti.qualcomm.com>
 <7325307a9d029ef3277c343230a46a40.guodong.xu@oss.qualcomm.com>
In-Reply-To: <7325307a9d029ef3277c343230a46a40.guodong.xu@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|SA2PR02MB7674:EE_
x-ms-office365-filtering-correlation-id: 81d28efd-27d8-491c-a6b4-08df20838743
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003|6133799003|38070700021;
x-microsoft-antispam-message-info: vLYCp2E3x+QjEA+4hWsO44knuFwz9pQ4Q7z0coeQZYh9NgSTGIfQlyJRWkZui43tgQsOQ1tdV9Nu13kyYytDjG9x2spmuS+8Rka2fQ4LHkc92wkhlsjaAzuFNZE8rQew4Sv0fWg4TQ/sSxDVJ4YGOoXQFp9Qr//xaOO553hiXSuiifk3umQXGc8o/rFPMmRXJWLKPzxiqzmcIjh3KJT5r2FeUMsmQ9kbRqph/qPGaE3TgTqFqSUGx+5o/jUZpU+hg8LpvGK8H4NRJo9xzBSmv1xpsCVRNJUam5c+0VzGfBJmgB1CEZhXXrHVrD2ATOonITJvevRoq9oyNSsE0+wWMZ7J27zmBAxYPudynfDMOyKDNYr/y/Q0rR9l7/yWEgGDw0rLhQZ75auLr9Jyk4UTAcmKmGfcj9cWvsn43jxEanKwUarvQHR76QJpDI0uYz28YzIcS5H5JpXSC+9Abmr99zy7bycGY5olDSveVdrS26Pbgf/6+QdzOxFo9iJvQVUnrtwenvyxxxDt7npqEVDrcQIHDcsFZyYRHcbafnxFSyxaWYD8BaIhS56Pw79gyD4xZpGTCQz1IfbhO9r/FGXPxRKxVJ+kbastyqIi/6DXHYhE43Kz2Z0z1d/1cJore9W19M6ETbSItnH4Yy6+4+3dIUFhifw+fgKm362vj6b5eT4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bm4xTW1vVjN3RE9KNUt2UHRsMDNFWUF1cWtOdkZ5L0pvM2hDVDIwRUY2RktD?=
 =?utf-8?B?S3psY1BEWnJMY2xrc1QxakJXT1JpakdKS1FabWpaQUMwZTN4Zkc3ZGw4Y0l5?=
 =?utf-8?B?SWJxZWdpOElwMmw5QjJ6VUJWZis0dGRoL2ZnRTZrSU9ycHE4OHRxcmdrVWQ3?=
 =?utf-8?B?QlhLZ1BnMVZDM2R0WVhSSVBOaU1HWkhWdngvY2swcElQTVFvOGFzTkhtR1Nn?=
 =?utf-8?B?L2xsb2paWVZEQTVRSVRrb1BadmVKUmVXM25JOTBrSEV2ZDBPbGEvRkhrbXpY?=
 =?utf-8?B?WWVEeDNoUjJqc2FwejdmZ1pNU0ZaMHl2U3VrUjFCdC9HMXNXY0VYMUxnR1RH?=
 =?utf-8?B?SU15UGV4WUpkY25qSzZyQkNqOHNvWEFjWHo3QlowRWhDMkFWNE5FaFNFeXln?=
 =?utf-8?B?VHFMZlF4a0E0WHNSQm5Od296ZWZOWHNzMlg4bEtvME1ORHAwMGVtU0tHd1Vp?=
 =?utf-8?B?OWUvQmdnLzVZYkhaY29UWFQrSEt5dHpVRVFXQ2I3SEVZSHFxY0dsOFpnampX?=
 =?utf-8?B?OWZINjBFS2FjZUQxRVRzS3J3Q3gzR3hzbk53UFgvVzNYSXozNnFDRVpaVCs3?=
 =?utf-8?B?RThmNkNMcjlDeCtyYUdOZGc4NkxBMVA3S1Q1RXVTT01haHRtUjBMaTlCK3RH?=
 =?utf-8?B?elBSRytXaFRjck5JNkpEcmhzMDZ3WUxRN0tjaTlVZkdFL2lLN0lKTnRuazJ5?=
 =?utf-8?B?andWUFJGV1E1b0dnMjI0dGhpbkc3Mm10aVdCMVZJcERueDJMenFIMzZwcWRI?=
 =?utf-8?B?TGIyVXc5MUhYb0lIWjN6RzVjMENmTHBRV0xVbzhZSjJIbEdUVHovMXYvYk9T?=
 =?utf-8?B?ZXZwUFc2aytOOXlLTHQvbG5KZkFLUjhybDNkTEJxdUlMcWtnRFlVVEJINTQ1?=
 =?utf-8?B?Y0lHK2tvN1gwK2o2WWNkNGJqVzJwSGZtWTRST3hEUVFXa2FUaHVQM0JXREor?=
 =?utf-8?B?NHNnbkFoWk93NlBIWjRkVlprS0VxMEpRbkNJaFcySGgzRFpEQ2F1c2lXTVlI?=
 =?utf-8?B?YWxERVZYQWZWSm4yYWZGdzZqNFhnTldXTE82UnFjRWJaTks0NENaVC9ESG5a?=
 =?utf-8?B?dWJZUUxkb2w2SDhzc0pYV1VTYUVLTjJpaEs5ZWJTWXAzVWhQekljRzUyeW9Q?=
 =?utf-8?B?UHcvU1JJdnFzTE5TbWg0U2M2T1hmZjRxZ0FRcGxRalVDVmZBdGFQcG10d3RK?=
 =?utf-8?B?Y0ZydGtCSXBJYzF3TFpyWnFkS1NBSFlwRy9Vc2Q3RlAyUHdqaVUwcFp4UFpD?=
 =?utf-8?B?cldFWHVud3hoY1JYT2ZsTEN6c2VnTFZ3RURmZmg5aHRKVEZ5aCtJZzNiN3Bv?=
 =?utf-8?B?NnVDaGtJQkZHQnh6Nms2T3JIVVF0VGM4dWF5UVdydnVpYTBBNWp5VnliK1Z2?=
 =?utf-8?B?V2Z2UTNjcFJDNG1BckRLcXJMUnJHMS9NOXV5ajIzNUF0bHRFZEdVbk5ZRkNu?=
 =?utf-8?B?SUNHTGRGSUQ2dXRNd1lkWXA0K2d5U0xXNFl2WEIyUEwrYWVqMHh0NFpuOTFy?=
 =?utf-8?B?WVhHRE42OU1FRjl3a3BMZnAyc1k5bWxDYkpCU3d6SXViVXNnSlNmM05tazY0?=
 =?utf-8?B?bzBjeVRFd2YyR0lqdGwreWI5d2U2MTFlUjVNWW1kNFZmb0kwUEl3eFY3U3dX?=
 =?utf-8?B?cmpQL2dHeGpyRTNrZmR3UzdxdnRzcDN4RnA2QWhPQmUxWi94WS9QSi9POW1k?=
 =?utf-8?B?V0s2SzFrK1lrRnVMU0xkRDFSZHhaT3ZQeGJjQlM3bEJjMXRrU2gzNjNpOGl2?=
 =?utf-8?B?N0sxT0lZRm96MW1HTUtjcWxVN0thMEk5S203V3BGWkpMTE5DcHV2cGJQeTc1?=
 =?utf-8?B?bkJrWXFLZHBVdUhwQ1BxbzBSdVlHNk1GY1k1bVJqK3V1bnphTWdBdlQ5Rk9L?=
 =?utf-8?B?MFhhWHNrZ1pqSHhPTUpOL0x4OFFLL1lWUU1IMXpUaEtUWkpYcmkvRGVYUDJY?=
 =?utf-8?B?OFF2bGNVd2ZFS3BtSW9zQm1kL2F3eGZTWkJKQTVxTjV3N1BWLzVhNkVvOEpV?=
 =?utf-8?B?S09MRVZRaHlJTUd0b3hwTFU5Q29CaTlTN2RsUWp2WDlzdFlINnd3eGU3Rm92?=
 =?utf-8?B?eEtXZVdBaGVVc3EwUmFFSk9vZHRDT0tpcWdDdHdHdS9nS05BQ1NraVp0Nld3?=
 =?utf-8?B?eFlDS2krL1JDbWlmMzhqN1dLeHZHbFNweGJlN0M0OWdDUk5WY1gyRUZ2eDN2?=
 =?utf-8?B?OEhFMmY3a01KamVuRXBnTDBzSGhpUldlSkltdldONFZUOG9QTWtVRmZGK3Vs?=
 =?utf-8?B?S0FKUlorWEovV0lkNnpteTA3dnBnUUdMbEwvTmJsYWlFSFJDUGszK094OEVR?=
 =?utf-8?B?TXp6bFJpRE9LazBYWE1iTEVoZ3VWZ1RQUTBoTUF2TTZEMVZTcUZ5VXNaako4?=
 =?utf-8?Q?zk/Po3xg9wsvt7nI=3D?=
Content-ID: <F4D3555A7BE91A409EE9062936A762B0@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4nZHhzuvBAeinXmQKT/6UxTXq5swzQnBX5LwD8VJ78QfF8mgykA76HDReRp6RJoLGcpDODYkKYfAHFvn/oPpMxy2eaSaSsd8PFiayN5d2n/Y7HDBYW3miSASPf96Hy1heJGxhcAf9b7+Iq9vxdRao5K+GxVgmONPfhwkDVFqYjB6e4j5/1UOI39qcbcytkA0xyROPspLIh5ar0i386zNFu2cXWqavnfqqkClxGFdzyGC/Z4SpJBaqq8DZA0/MoqSELeiIfUINoSS2uPBYbgYIuyDI4gyQukuMVuxqI4aHPd9MwoBj9olyt85VWKwIcXDaVgLTusoB4e8jYGNlxJI+Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gW0gcq6GTqN30k8lvZXi/kb7RqgqxL2cDAwXOfgLinjI0jKtVeW2/oOa0QKZnh1k+MwIi0zrgYN7B1/YlHrsle9oVROzacPTWWqprYJybkZLn1k49uYfLh33Mk+nXUDn8flmNEc+YH+5ZMbg/rm5mWUvyY1ZXGWaZ26WaQVvvbSucaiob2oHJERRiEABEXPbx5D36mgW/9Z6rzuvS07Lb9Y3XP6nlk93+vTs/wEl//r7urjiRp36st96sLiVhGZFxWSgYnX2y3whGZLilLAjxOLoEv0oH5UZ6b2SRcESIFEQqJEUdH03Xnr0z/ufwzfpWO1UsuL89gro7i8tzJH8nGQylWnAEg9mmW4L6s8KUfAI+lv2gx4Jc/7TG67FZaMhsML7OlEXfzT9k3Bqr+luPoJoZIvPqV8dyGVG7LDwx1MLdQ/QJHShit0V2Mm4B9p43+7mvSW84I5Tv1duUfdbLY0sfXnS1QYh/hA5PxZ65HNe0COZ6rCgDkoIQUNIH934KX614qZ+i7y5AxuuW9i1bRbVlYwhpkPKlib6qAdCtGH6UcL3GvRTMPSe4zZRSYNKS8rFIAOMx8UZbn27Gj3cfBtSMYm57oisHh17wKJDdr8OX/xLP4z8nzqKbkKmLwCd
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d28efd-27d8-491c-a6b4-08df20838743
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 12:48:59.1721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nax68aUkhl207Qgi41atomwhr0qwnj8ou5QJYd6synoUbQnjGTfIefh9k6zoVWB90xPvxsTINIIuxmEwPd9uKWCusRnYaDk84uppWyrQOTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7674
X-Proofpoint-GUID: 1oMs6pSG_f_y3O1690SFdSfy9_Vh02aK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfX9UgM087Mkoxz
 0YIjZ4y4dQkTLMEOQ0WbshypFkc3sCQ7zOiCvAzXk5LbOy7dKhNOmgIQBFgBQRmBGPxGiVScR2L
 gfhZjE/e4Ob4mZhV3ENdJvOe929zYYw=
X-Proofpoint-ORIG-GUID: 1oMs6pSG_f_y3O1690SFdSfy9_Vh02aK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfX5gjv9zZevdhp
 l9XCRys0ueVgwjLdGC3Gfj+pg8kM1fHUZKwIBikf2Qk/c1mI/1D274wnzxCwmH8elyrUJVnEXgs
 pw2quSE+sR1eM9PeMW/DxqFKvYrY1OurE6j2/Kj1zBff7GwSoJVg48KS0BvK2MdYVw8R7BMp1KF
 ifAmuIB0TBc5pohbUgNGisn3vwEIbChaseOEelvg7IOT/MM11Ed288j7lKRDKUjVmRZA/JU8O50
 M4qejlHlF8GtUUxBzkjiXRfyS5dw+7KSalyPDPlI22Rv5XgdnMHMK5NTq7z+0qtrPXZVgeovvHe
 xEav3+rurj+gAvfG0XpCAJC8AntHbBzcqOjjGMjtZtSm1JR/YsdGuKwELdIKePf8ro26ee/MIU+
 EE9DW6WRjzIkGIjFKg5tiejzd4npepqbaFP/xGE2kTyVYFlsjNiFkFTP7cmL9AE4ArTj/kXymSY
 caDz5Eef2Ff95B0srzw==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6abfa840 cx=c_pps
 a=W2rhl5c+35KWs3qLQ/Kc1g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qu7hb3CLATIGZ95TUdsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_054942_822506_D335A9CA 
X-CRM114-Status: GOOD (  15.91  )
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

2026-10-02T04:40:53-04:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> On Tue, 29 Sep 2026 16:00:22 +0000, Radim Krcmar wrote:
>> 2026-09-20T03:18:31-04:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
>>> [ ... ]
>>> +	int cpu;
>>> +
>>> +	for_each_cpu(cpu, cpus) {
>>> +		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
>>> +			return false;
>>
>> I think that extensions like F or V might be present in the ISA, yet
>> actually disabled in user-mode and this loop would misreport that
>> RVA23U64 is present.
>
> Only V has a way to be disabled by user-mode, through
> prctl(PR_RISCV_V_SET_CONTROL) with PR_RISCV_V_VSTATE_CTRL_OFF. That
> interface is questionable, and obsoleting it was discussed on the
> RISE Platform WG call on 16 Sep. And I plan to take this to LPC26
> next week in Prague to see what the community says.

Sounds like a good plan.  I'll have to figure out how to an invite to
the RISE meetings again...

> Besides, since you mentioned hwprobe_isa_ext0() below: actually, today's
> per hart hwprobe_isa_ext0() doesn't honor that prctl(V OFF), IMA_V stays
> set. Refer to [1].

Yes, that is an acceptable behavior.  User-mode should know what it does
with prctls, so hwprobe doesn't need to report the prctl affected state.

I meant that there are sstatus.FS/VS, senvcfg, sstateen, and possibly
other bits that control the set of extensions that are present in
user-mode based on variables outside of user-mode's control.

> There is no way for a user-mode application to disable F/D.
>
>> Is there a reason to diverge from how hwprobe_isa_ext0() does the
>> extension detection?  (has_fpu() and other global checks)
>
> Anyway, back to the RVA23U64 isa_base bit. In this design, I mean to
> report the per-hart RVA23U64 base, which is derived from hart_isa[cpu].isa.
> That bitmap has passed the validate callbacks in riscv_resolve_isa(), so
> it "matches kernel configuration as well as correct extension
> dependencies".

Whether kernel is compiled without a support for an extension that needs
to be enabled, or decided to not enable such extension at runtime
(command line parameter or weird platform) makes no difference to
user-mode and hwprobe output should be the same.

> There can be a mismatch on a system with heterogeneous harts, where
> has_fpu() is false globally but this particular hart has F/D. On such
> a system Zfa and Zcd are still reported for that hart today, which is
> the same mismatch. Same reason, because Zfa/Zcd passed validate callbacks
> per hart.

That is the bug.  User-mode can never utilize F, Zfa, and Zcd even on
harts that have those extensions, because sstatus.FS is always Off
without has_fpu().

I'll send patches for Zfa and Zcd in hwprobe_isa_ext0, but since this
series doesn't leverage the existing code, we'll need a fix here too.

> So the isa_base bit RVA23U64 behaves like the per-hart keys do today,
> while IMA_FD, IMA_C and IMA_V at the top of hwprobe_isa_ext0() are
> host-wide. My take is that when user space queries over all CPUs, it
> gets the intersection, where RVA23U64 is not reported in such a
> heterogeneous situation. Per hart, I want to keep the kernel config + ISA
> string truth.

Right, when querying across a subset of harts, user-mode should get the
maximal set of extension that are present on each.

Why we would report RVA23U64 on a hart that doesn't run RVA23U64
user-mode, though?

Thanks.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
