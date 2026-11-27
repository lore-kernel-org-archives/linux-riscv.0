Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB909606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jjBAD4/l;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=yIn8bRkt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-IMGTecCRM-onmicrosoft-com header.b=SVgbi7bG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fv7qNmt7MZN8ruh3mW9JPenyVIrKPULEIjtYD/PxMrY=; b=jjBAD4/le43HdJ1u6HNOxtXF/0
	lms+H1bbAcUc95pH2+Tno1QveHd/k0wZ2seRty7gPvsgtWOmvciT+NbFRMLET5YAbjuiaCUeW8QwH
	BOCeY0IkntWvRAdqIXAme9WB7dNQOdtqRTnoTH1v6i0/hk0v7lZ3sTDggMZXnkM3O+Sy0yGXA0lxu
	IHjrFeLKyhXzBZgimTGXkegWdBA8WsS6pLMNY7YXzwrPRyH+uaQ3k41Axnu3YIQUrO3Eb5q35S+TY
	9sVVFSKzMlLn4YNrmYEXZyM6a1Y08zb4M5BWqWeYGmgJTZJ9+NhlCC5kRBJGJnWLPSDR+RGZzwIKE
	DJS2mvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhk-0000000FzY0-2KCI;
	Fri, 27 Nov 2026 12:05:28 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhd-0000000FzQA-467R
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 12:05:28 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6ARBR2XD3419306;
	Fri, 27 Nov 2026 12:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	dk201812; bh=e/jIHXSN5Q/k0C2U9O4+kV1lOYVK77VqLgGSgRBNP1Y=; b=yIn
	8bRktaQnXyoFPO7LBjrAc7UImezTwTqLsJt7R1Rw3rcSJm3uNYodSMwCLJASnj7k
	rlTY04QJLWwEfSBXc7Zqofz73T73Lse8FjWW2lHW3h5IOAUDAHrBxztkWHBHhf9M
	7IQq82I6qQ2cAgyK7NWwe1N+C1Y+0fl7GdOXSYCC0NzzLaGLzc16yKldcpwp6Ypl
	aGBD10XpFSqYgH/TByCcGeRFv7oVp2Mnbo1bxYJ6wJDP3bzeNInUxoCTr6ybzUSn
	M7LsunKu6YgoTbK4mRdNO2VFIHU8GmK9AczzeuK2qn+j12lWffvL/UOnuVg/rzWa
	7tPpta3NwJZic9UPpdg==
Received: from lo0p265cu003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4j32ev4gqq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Fri, 27 Nov 2026 12:04:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKzsdWgxUaNORVNh4t0k/0bNiaybf992MarbcYPj2ynfBbhVoqJCX2y0IhF55dhfODrSiSBlRRRZ6kQ89IXRQ7qm53/MWfaY4ZgNISZNseIxnGqJ2GsxLgPrwwD8ZYRGczCJLZjbFWnrk9MiGyDMtWvnrodXkHhxO7WnBQry8ZtorqBcz43SsmV5dVkvdkTTptDzdRCcr+iCTc6QtMvJZ0gTaftbQHXIBnWwiYkDiPDGOWjCPz/Kz69VAexmKmv33isgH6Of/2ZSkkhkM/C8di8Kc5jGhDiQPx8a1vyRjRHJ2IRPJdxMNSMqpgbxxDjN2m3DiVZ0XHTWCzSMec7ExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/jIHXSN5Q/k0C2U9O4+kV1lOYVK77VqLgGSgRBNP1Y=;
 b=YvAuFsYXUr7RF79Yujt87C4SZc1Sa6p4jn+SYfNtLJVehOBnhqNS/VuJP61WmW1PTIfG1Ph0Q83ZdhBgwB1DXXjqWtQXIrcnr0xB6fVZwpEPMiJAmxiFby4/hvfHMyRvRhNzXuNqUWr+Z+TG7dDK0pboIId9BemwPmSxEwoR4ibComrmkzGVwPcdvHSm8UDLtXgqN9cYhT/b6mDqK64f6iB0B9JEnzNLqItyFKTcIE84QwtEMKg4nz5KrOMEP+KnMtD82lfZZqSPhH/B+Inoby+ydOjh+MJInoKtNDY/b4R3+S4KF/zWL4ahUAuTgWiffymdm1d0MqVCnFUo/+WMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/jIHXSN5Q/k0C2U9O4+kV1lOYVK77VqLgGSgRBNP1Y=;
 b=SVgbi7bGE/9CNnQT99rpNxbsVYtO0YFvN3AasqfIaQaE7x+AUY8XMSYjd4UwAZcT4lPh6WfkHgePmVA+LAfrFL9c7iDnePnG3ga9b8Uk9KHAK9gc4sM7wEvTCQEZrJiYG9tKIEFUF+AlIlhtM9RLmmpHGAJ4Eb2p1Vh3/I8gcaY=
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b5::14)
 by CWXP265MB2470.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 12:04:40 +0000
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722]) by LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 12:04:39 +0000
From: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
To: Luigi Santivetti <Luigi.Santivetti@imgtec.com>,
        "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "simona@ffwll.ch" <simona@ffwll.ch>, "pjw@kernel.org" <pjw@kernel.org>,
        "alex@ghiti.fr" <alex@ghiti.fr>,
        "glaroque@baylibre.com"
	<glaroque@baylibre.com>,
        "airlied@gmail.com" <airlied@gmail.com>,
        Alessio
 Belle <Alessio.Belle@imgtec.com>,
        "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>,
        "mripard@kernel.org"
	<mripard@kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "gye976@gmail.com" <gye976@gmail.com>,
        "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>,
        "imagination@lists.freedesktop.org"
	<imagination@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/imagination: drop redundant zeroing of new GEM
 objects
Thread-Topic: [PATCH v2] drm/imagination: drop redundant zeroing of new GEM
 objects
Thread-Index: AQHdfTaJjzbjQns7N0+3Df05NmkC4bdB1G+A
Date: Fri, 27 Nov 2026 12:04:39 +0000
Message-ID: <cfc8dc44cd03dfd0e65c31bf6c292bbb9d562541.camel@imgtec.com>
References: <20261125-pvr-gem-drop-zeroing-v2-1-8453a6e01e81@baylibre.com>
In-Reply-To: <20261125-pvr-gem-drop-zeroing-v2-1-8453a6e01e81@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=imgtec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOCP265MB8661:EE_|CWXP265MB2470:EE_
x-ms-office365-filtering-correlation-id: 5fa07579-a09a-4339-fd61-08df4c7e9d52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|1800799024|23010399003|376014|366016|7416014|921020|38070700021|261022115727099003|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: l4ZiHTYfh2UC9psZ0S8sfyU5AT8LWgp6c5Zqs/HptUoYZn+KJ6nnB9wnBOtzWrDPTmzaUVpQLBIQIgkpLbjgDBjaICynpmy2qD+zDw4kQWP3WKkCK2+thKdc5W88v4pQ/DEwcAhv96Guj5uKWVORr2Fm+ms87kJpxidS4vGifQ4uXYZ+Kw9eN9K/3QrNcS/qLF1B8iRGsiv615MUntNZmhIv8Jc0Ga+rzlXvaTgi/6a/hvCji5BgsClDqZfvfoe2lY2HcgoLy+bLoj5RhoWTfwN0JHt0NzzAqnLDFwwEY2gMc5FqsBFF9tOtKwBMl+zgHyG6x2jHvcpWx/4jeBxvw/cooUiwycuxpumJ1mGAuJPFCWuHoHI1jjycs4Bgd19VcKgVAOIEVol8ccVl0hyfSlI/0GetBj651bkr+nhDQDxYPksswqbO9hT0PRYrKmzqak0fX5IIESsHNmCVyffUdj/ql3UpmqtC9HtVlYMwSat1ZBgrDroivaPLsOFxMHApOMb7OwWJm+ACIYxhHoZ8Ywi8zehoRppLeQcpWXSubhXUU3OMRIP6hoQC3lanBXbxPULjayrecVECjQDbT8e7pfKAdRIEOE4dEKvnKT2J0OPXbyeSnyEuhmpHizb3kQsTsLBMng8AXWcmIf5ftwmxcrzacXbgOA3j+N/hLda8x3ksAgjWtHI89POwbWu7GeBP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(376014)(366016)(7416014)(921020)(38070700021)(261022115727099003)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGpFNXJhcnd6cnMzWkJZTURMVHFVQ1d0Zm90aTVQYzBlNGV6eEhBL25Qa1NC?=
 =?utf-8?B?VkZFRld5MXN4VVJMQi9lN2phTTN3RzN2d2lCWFhPWTRnNDdPY0tuN1hMV2NZ?=
 =?utf-8?B?YXNwUzdsNEk1WWNyWDVBem80ejBBY3NtKzgvY2JlY09oeFh4enNJSENaZElh?=
 =?utf-8?B?VGhaaFgvUUtVamoxQXVQd015U09MQUJ5TFFRUVY4TlpzdUFvYjJZazNpbWI0?=
 =?utf-8?B?ZzhaQ2pMRU9uZWpPNVlITDZzZVE3REc5cDFrTmpVeTl0WjQ2cFpqMUJNY1VV?=
 =?utf-8?B?TVdKWkFrK05nY09vdlkzVG1JZ21ZRWcvcXcwRTU4NWZvWVcvUGtrcmQ0QW9t?=
 =?utf-8?B?WlQwaThQVitWeFl6djRqYy91Q0plczBjeGNqZDhVUW1TaGJFZnR3MmR1Rkkx?=
 =?utf-8?B?SUQ5WXY3UTRmUS9IWlZmQml0S3l6NXo3MkkyNHhaL1IxUzRwZWJNZW1YbG9C?=
 =?utf-8?B?dExJc2F5eVdxWm9CSnZFSHlXN0F1WXZ2YXkrMDRzSmIzb1dEMWgxYWZsZzRP?=
 =?utf-8?B?enNxSnlVOUpOZTJnTWNrUlVpakxYcmJSekFTUFJmazliSHFEaXBWZzBFdld5?=
 =?utf-8?B?UWhsWmV3RGtTKzVScUtCb3VyU1FpdENHQnVCL0ZKUG9TdjhJM3dhVlR0eUhW?=
 =?utf-8?B?N0QzMzYzK1VlNTEyWDNLMldiV0NDek5jWlRHcCtvY3hJczZ0Y2VHZG5hbmt1?=
 =?utf-8?B?RWxqaVB4RUN0dHMyMDliUEVzRXB1V1liT3BORUF3R0hDVmpDaXBCd1VvNjd1?=
 =?utf-8?B?OHhPWFFJcVNjY2Fmc2N5ZXgwOHlRZ2dSbHdKbkNjakd2R0lxaWVkek8xakU2?=
 =?utf-8?B?NGVqTDFQKy9xdDNRTk5nQldRUFBHYmhKSHZmaGpQWTdxcUE4WklaTkQ3QVpM?=
 =?utf-8?B?SkorMmg4OGJpclJaUzR1RkxMb2JyOTFiS0VacGhFNVFibDl4SC9NNXppMHJO?=
 =?utf-8?B?dTd6YUYwamhOVlowZ2lyZTQ2a2JKVXlwa1N6dEMxTjU5S3N5VFZDU1V5NFpM?=
 =?utf-8?B?MFdkMmxaenVTenU5c1dYQzVEeWdZUzVDL3FSWkdBdG9KQmZPamdqZDlSSmdu?=
 =?utf-8?B?QjRGVEtIRjdJZ3lUc1pxMkMwRG9KMzUyNCtmN2RlSmhHZitPaGtsVHVxVFJF?=
 =?utf-8?B?Sno1WjcrQXd0SGI0eDFsUm1yWXd0REV0RUZsQjJNd1dkaFU4c0RteldkKzVa?=
 =?utf-8?B?TUo5cnNJVVdhYk00N1lPSHlJTW9OVWJ2Wjh6NkVaUHhOZnczYVpVaXF3VmdT?=
 =?utf-8?B?M0JxTmsyZTk4YmVaZ2ZwUzRlZmRLYlE3dTFzU1U2NWF4TGVFZkc5bEMrOVBz?=
 =?utf-8?B?dkI2VElDWnpyT3JBQlF1ZFA2bU9GaGxPRE8rc3F1dEs3S25RZXJ2cCs0NDRC?=
 =?utf-8?B?c0ozcTVsYUlZTnZ5dUNUMEx4Y1d2YW4rVFBpMEMzaU5MdkFqaXpoVTJ3Y2w0?=
 =?utf-8?B?NHEzSnJNY3BQbnNXcksraU52c2VDWi9oV1lZa1NzRW12L3NtbkY3YW9VTGtt?=
 =?utf-8?B?UWxiRitjQ3FvcFROZ1BWR1dqWlpzcFZhaVJGOTkvMVZTNVErbEMwMkFUc2JM?=
 =?utf-8?B?Q28ydTQ2OGVoMlpGTGJlYVVUMjd5Y29YSW44eDdSR05WL3JjN2dLbVM3cWl0?=
 =?utf-8?B?dkpwUEJWS1lYZkpyZjR6b3kvVHJFQmtPaHBKVWpwK2pqY3h0K01zM3lUK2U3?=
 =?utf-8?B?RnRvemE1OEtEZEhNZGJDWjZoYjNyWGRBbCt1aHVlRkJiZ3pLdFJxOVcxa0p5?=
 =?utf-8?B?TFRMSm4zTUtsd2p1TDFIVkpYWW8raHcrM0hCS090SWczbTVTTnhkR3YwYzFq?=
 =?utf-8?B?NFFFOW4ycnZ2blJHSjlhQXRrMVRiQkVDaUdVb2xabWhFa3VtQmhvcTlvMm9C?=
 =?utf-8?B?ZWNTbSt0TzVUcmhzTUswalkyY3VXbVMybXBzdnNBa25EMzVRT1c2ekZTT21x?=
 =?utf-8?B?MzVUcSsya3FGdTcvVEdiTUN0cEVCSGk5Y2laT1JrU0hiK3VVY2U3VHpCaHUx?=
 =?utf-8?B?dTNLc044cjh4YVpFM2s3NnB1aGpVQ2RKUlMxV2RhcEN5L1I5YjNmMVh4RkpI?=
 =?utf-8?B?dE94TmFiUnlsWGt4bERvbmljSVpJN09kbnFUcEhVV081R0VCOElEUFB6THRj?=
 =?utf-8?B?bmtBUmVVU295SDIwS2x6NEpwN2V2RnJlTDBrN3Q4MDJsdFh0TjFvUjFxY1VJ?=
 =?utf-8?B?TlJ3TVA4TGduY3lSVUM5UkN4Tm1ncGRndmZGL0lycEdQNVFoT1R6b1RVLzMx?=
 =?utf-8?B?VzUzSS9uNFI5NnRRc1RRdjFVclNkSUt3YjF2OHRBTEc2OXcxV2hjTHROdzFw?=
 =?utf-8?B?US8zc2JBK1o3aWw5VXZiM2p2a1BVdVpnMGJrM1hTQnJRUGhsb04xR3JVYUNq?=
 =?utf-8?Q?mVo0zUcIUhAf7NiafLbkB1sOR8777H1FEJVzm72EPe06j?=
x-ms-exchange-antispam-messagedata-1: AOKEGEEYlIj1ggBsWokyWHJX78FWqqjEpCU=
Content-ID: <5F9070117C55CC4A9A0F6A1A01939619@GBRP265.PROD.OUTLOOK.COM>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OSUKUKRrcD5KQdqrd9Vp+29DEbSTiMb25MabDZzUN1amPSpvdGCLrAh+pzqgGVu9oGCNBwItKyAp/7wQFo8bJnUwjldVY0Q5H3v+pRjQzWlGk3MG1DeX0l1nM6ap+8PRlTVFeuDYB2/NWM6UhYWJL/WYfUxJd2IcHosn98CmNKKKFX91c4FEWrnBpAV3253NQp3TN2Be+E9eS+5j/aWQnMKof3ClvIG4hP5t5I7NFh1F73ZDOPA1QZ+itm9Y+77oCtjI0lfoI8XGWXVDU/oPbJFZhKmlgUwn6ZN5wR7yiNkdiDGgmzIAtGnHp+ZZC3Y+BnOwcrLiYbzxCO84p35V6A==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa07579-a09a-4339-fd61-08df4c7e9d52
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 12:04:39.8319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uiHMYaqjuziLR0X/Xj9tAx+ntKIT7VRcXER6hP+glEZNRWcRA9Tm1G/ul+aVLzZODbojLaXWGF0JmpOlfY8oTX+I0m1GUW8q5nrww/Imp6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2470
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfXyn0UBCtWmegv
 ohh/xQSYO/CjXp0wqO6hiHiRtjZEuDLREnGd4gIkz8pASPX2FS5COWC5YFHjbku8kqqVA1BMBPJ
 krjjJqhfObJA5JBN7E1TQLjVKwhfPUs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfX+WjdHd04cza+
 ZC6OL+XSLsh08PS8hO8At9hqIb+gh556mxXztjSNBE23wh5fqNJwFMjV8FwN/L2gpg6YlTDok/F
 Y+KzFNki10qQiaBPXx1HzGY1gBNdtcXV7fbVd3vMk1sswO0x4lnXm5Tx8Omii2FAPI+GnJNICOC
 iIr1PxN1aPIi/lMaIpdOCrV83X1xQYDqXim4KpMk0fGb2rgujl5+5FepR5ObCgTJVGgA7kcKo9y
 EnY1/QpTcXkZ9fAfLHdXEbAmO9F4wmHZIsYY2XYLqHus/o7U0e5xwAm/jAkuPC+4IMckiuY0VJ6
 aRm0GwcE65ap3+QcWCTAq9Pmm3mqWrgHn+G3v90wWfNbFYZYpTT4mHTh4fyK+cTK/NAz3B5IchG
 VMN4iU9uBdXOUvHbVAK9Z3PFWk73FfMtTkWb2nhNzsrD+xox77FhotphNZOhNM+RZDE4a+okIUF
 YoFMl+zEq+PmBvOH0lA==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6b0971db cx=c_pps
 a=BzI6E2rmsAXjrj6Fd9aogw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22 a=VwQbUJbxAAAA:8
 a=b3CbU_ItAAAA:8 a=bC-a23v3AAAA:8 a=IpJZQVW2AAAA:8 a=r_1tXGB3AAAA:8
 a=pGLkceISAAAA:8 a=8q0DIKUy8RcdCIgXhrwA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=FO4_E8m0qiDe52t0p3_H:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: MYjtoDIh48uQED0lm-teYzdIUU2C0Bp7
X-Proofpoint-ORIG-GUID: MYjtoDIh48uQED0lm-teYzdIUU2C0Bp7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040522_316653_B4106F2C 
X-CRM114-Status: GOOD (  14.50  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-11-25 at 18:41 +0100, Guillaume La Roque wrote:
Hi Guillaume,

Changes look good to me as well. You can also add my RB tag.

Reviewed-by: Brajesh Gupta <brajesh.gupta@imgtec.com>

Thanks,
Brajesh
> pvr_gem_object_create() clears every new object through a CPU mapping
> so that userspace never sees data left by a previous owner of the
> pages [1]. Those pages are already zeroed by shmem.
> 
> Each object is backed by a new shmem file, for which
> __shmem_file_setup() only sets the size, and its pages are allocated
> through:
> 
>   drm_gem_shmem_get_pages_sgt()
>     drm_gem_shmem_get_pages_sgt_locked()
>       drm_gem_shmem_get_pages_locked()
>         drm_gem_get_pages()
>           shmem_read_folio_gfp()
>             shmem_get_folio_gfp(..., SGP_CACHE, ...)
> 
> A newly allocated folio is not uptodate, so shmem_get_folio_gfp() clears
> it with clear_highpage() before marking it uptodate; only SGP_WRITE
> skips this, leaving the folio to be filled by the write. panfrost and
> panthor already rely on this too and never clear new objects.
> 
> The dma_sync_sgtable_for_device() call that follows makes those zeroes
> visible to the GPU. The second pass, write-combined on non-coherent
> devices, only adds latency.
> 
> Link: https://lore.kernel.org/dd2ceacc-f59b-9c3c-e4ce-30b3bbd6939b@mailbox.org [1]
> Tested-by: Gyeyoung Baek <gye976@gmail.com>
> Reviewed-by: Gyeyoung Baek <gye976@gmail.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
> pvr_gem_object_create() clears every new object through a CPU mapping,
> on top of the zeroing shmem already does. Dropping that pass speeds up
> object creation, most visibly where it goes through a write-combined
> mapping on a non-coherent platform.
> 
> Testing: drm-misc-next (41ecf852c073) with a Debian rootfs, on a TI
> J722S EVM (BXS-4-64, arm64) and a SpacemiT K3 Pico-ITX (BXM-4-64,
> riscv64). The K3 also needs local patches that are not upstream yet:
> its GPU DT node, an RPMI power domain fix for its firmware and BVNC
> 36.56.104.183. Each board ran two small test programs, once without and
> once with the patch:
> 
> - The first one only uses the powervr DRM ioctls. It fills 250 objects
>   with a pattern through their CPU mapping, frees them, creates new
>   objects of the same size and checks they read back as zero. It also
>   times DRM_IOCTL_PVR_CREATE_BO. Result, without -> with the patch:
>     J722S: 0 -> 0 non-zero bytes, 16 MiB object in 20.6 -> 17.4 ms
>     K3:    0 -> 0 non-zero bytes, 16 MiB object in 41.6 ->  9.2 ms
> 
> - The second one does the same check through Mesa's Vulkan driver,
>   and also reads the new memory from the GPU: the GPU copies it into a
>   buffer that the CPU then checks. 80 allocations, on the J722S only, as
>   Mesa is not built on the K3 yet. Result: 0 non-zero bytes without and
>   with the patch.
> 
> The test programs were written and run with the help of an LLM.
> ---
> Changes in v2:
> - Commit message: show the call chain through which shmem zeroes the
>   pages and explain why this can be relied on (Gyeyoung Baek).
> - Add Tested-by and Reviewed-by from Gyeyoung Baek.
> - No code change.
> - Link to v1: https://patch.msgid.link/20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com
> ---
>  drivers/gpu/drm/imagination/pvr_gem.c | 34 ----------------------------------
>  1 file changed, 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
> index d8660d6a8e01..01b8e08d12f0 100644
> --- a/drivers/gpu/drm/imagination/pvr_gem.c
> +++ b/drivers/gpu/drm/imagination/pvr_gem.c
> @@ -275,34 +275,6 @@ pvr_gem_object_vunmap(struct pvr_gem_object *pvr_obj)
>  	dma_resv_unlock(obj->resv);
>  }
>  
> -/**
> - * pvr_gem_object_zero() - Zeroes the physical memory behind an object.
> - * @pvr_obj: Target PowerVR GEM object.
> - *
> - * Return:
> - *  * 0 on success, or
> - *  * Any error encountered while attempting to map @pvr_obj to the CPU (see
> - *    pvr_gem_object_vmap()).
> - */
> -static int
> -pvr_gem_object_zero(struct pvr_gem_object *pvr_obj)
> -{
> -	void *cpu_ptr;
> -
> -	cpu_ptr = pvr_gem_object_vmap(pvr_obj);
> -	if (IS_ERR(cpu_ptr))
> -		return PTR_ERR(cpu_ptr);
> -
> -	memset(cpu_ptr, 0, pvr_gem_object_size(pvr_obj));
> -
> -	/* Make sure the zero-ing is done before vumap-ing the object. */
> -	wmb();
> -
> -	pvr_gem_object_vunmap(pvr_obj);
> -
> -	return 0;
> -}
> -
>  /**
>   * pvr_gem_create_object() - Allocate and pre-initializes a pvr_gem_object
>   * @drm_dev: DRM device creating this object.
> @@ -378,12 +350,6 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
>  
>  	dma_sync_sgtable_for_device(drm_dev->dev, sgt, DMA_BIDIRECTIONAL);
>  
> -	/*
> -	 * Do this last because pvr_gem_object_zero() requires a fully
> -	 * configured instance of struct pvr_gem_object.
> -	 */
> -	pvr_gem_object_zero(pvr_obj);
> -
>  	return pvr_obj;
>  
>  err_shmem_object_free:
> 
> ---
> base-commit: 41b5458595c60143d0ebaa1e032c9cda5d764dff
> change-id: 20261105-pvr-gem-drop-zeroing-67cc98380a55
> 
> Best regards,
> --  
> Guillaume La Roque <glaroque@baylibre.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
