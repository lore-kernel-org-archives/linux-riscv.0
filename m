Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B482C25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 18:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJBqG9osLpAZWuCJqXPDLkr32oGoLW+qI9+wLQ1U2XY=; b=2Uu1galjKIx+xN
	TgHtgJv9ZimCOy2/eD2Ahg51F+xILaDspIv3scMC8YuTAasv5JcCwIMdiIHvsQo/5g8cgd3/n2hou
	xbhSFxzSNSWERwnXsYi23Bq9ct+Dj+RMzOQFbVm4nTj/mVHqPsPgpADyZbdj1ERbWH3TW/Zh2XToe
	2s6I7wJI6CrQTSevAEy933wBjcHd2ucBsFYxHC4KrP19iTkQV+2JngelDeH0Xq+QAOGhNTghzf7lg
	NK2WJ+0ctgEk/vRxUPUU3aXi6sqZ/QjjX5ZWLsVbymL1pcOCMJBgRKEAjAAt7eyB4ySyQRrOUUFbr
	yAhRNwmu2i6MajCdpS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Pgh-0000000CO3f-0XjS;
	Tue, 07 May 2024 18:37:15 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Pgd-0000000CO0V-0LAJ
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 18:37:13 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 447IK7WP026216;
	Tue, 7 May 2024 18:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=+NSfvSZq2CrY+rd+lSMoaVY+9pa/iDvVFk9ybBAz1Uo=;
 b=WL4fSDCuTlQ7boD0bHFUX+FcX5xDta1jJkhAnHtGy9xCKM0fyTGq2FtgT/mXnPqXo9Bw
 CH8L/WocXZNQ1RIG0g9LsdEi7ptES9gNIgkY9zGBO1jjQBoP1DCILgXkfAnfJYpd6D/K
 J2/dYnAw4+zwGDPm6+H9j52QMw4f24ItDcUiUmzSYxyYoadKr9TusQTLhFVhuoG6B0DR
 K3yc5qa1h2ZGnLU3bCzn1xnb62D5/V/C1R69PZQxLC7K0spP0dIh3kKjz8BKZsz1sJAt
 nBfmA/ori6SY7Dx8CeIGq/1Q9ePYr3zxWN5xJoBt0JPW9lFno7WQYeO9ho/H38HqZK1T 8g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xysfvg1be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 May 2024 18:36:32 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 447IJ1KN030927;
	Tue, 7 May 2024 18:36:31 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xysfk0pxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 May 2024 18:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hli/8+9nF9PDwC6oCEyFjrzC8UXPQJLxkm2Z+wBMf7lCGNdO0pHSvy1sdMB9IL4Hz2OBjund8OLuipznCO3FxRvmPmH15qRAgFobgjTP84dTxhi1C9Hasa0C5SMH6RaLIzNbIU81Wm7KahVz8jTbCUHa98KNSymeBZjldGfViRfp2U+dEoOB/j+23Lc67XmlBsBKl/6eHj0JUQGcn19HHDZN1deGkgy1HSy9s48oHyQW892fL+XPReTmTGs9EjySxqqHQfFc2sA4p1FNs7anxK2aNzGWcga3KG1dzSJLubfSMjlwTyT35ey51nyA7aDLTp2S0h7jDlQzuTAgjMHh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NSfvSZq2CrY+rd+lSMoaVY+9pa/iDvVFk9ybBAz1Uo=;
 b=Nph4N1R9zW9UY2VNMkzqJ5q6P/SE3I4Rw4Cv5Zya15jg6UZAIwiOfIemn8QI9PaM7X0AcRLBV28QdGb7OdBnV/+G3f0yMN5HhG4Why0arSULajSPdlIyUr09rBxR4ZFISDgc00yC3bxBtMCUXYc3fksSD+ujy5QgvGTgV86ZbLkNQ3XnE7oqIB8dQ8XIkktbywDswi/RGOmfQJ3jsBl5Uh4XR458Jq8Hp1Hyx3vFt8BMyLG/a48vkmv6VxCI92lAJ1raLZBIaL7SLn6MJvs2rkfr4gA6+2I+YsdMYTh/3K9mWy2JfuOSj2T1L4kJW0SXRlJuSjx1oqMJkIoOh0G9Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NSfvSZq2CrY+rd+lSMoaVY+9pa/iDvVFk9ybBAz1Uo=;
 b=MU2+bulkRRXqhtacPUuHMNjzkCyYM/WS6TT2aZ6QaO56trABCmQd8u0hJbAgQIXuM9ZZR063kdmT5oRaY7TB0fvWeNYpRGD8m6aiGJIXYGQi7aJntP9EjJTFKA2iQhBO8duDNeDzYfjQm+zNSAxbLoT2TFnhMQU5zTNqL+GASQg=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by BN0PR10MB5175.namprd10.prod.outlook.com (2603:10b6:408:115::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 18:36:25 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 18:36:25 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Steven Rostedt
 <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark
 Rutland <mark.rutland@arm.com>
Cc: Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG
 Xuerui <kernel@xen0n.name>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>,
        Paul Walmsley
 <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
 <aou@eecs.berkeley.edu>,
        Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander
 Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav
 Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
In-Reply-To: <fd8283ac-232e-49e8-a5be-60e54d87b9eb@csgroup.eu>
References: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
 <fd8283ac-232e-49e8-a5be-60e54d87b9eb@csgroup.eu>
Date: Tue, 07 May 2024 11:36:22 -0700
Message-ID: <87ttj9h3kp.fsf@oracle.com>
X-ClientProxiedBy: BL1PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::35) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|BN0PR10MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: ded9d75e-bc25-49eb-49f4-08dc6ec4996d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGVwZkRRaW96TWg1QVlpakpJMjFwUjBjVVIrdFV5NU5OMFAvV3VFVXkrVVBU?=
 =?utf-8?B?V2d5djJ2N0tRUEI2V2dqL3dZYVBneGVuQ09RUFVVQUpLeVBxd0RCTExxRks2?=
 =?utf-8?B?VXdnZXZGVmJqU0RhdHpMSDVibmM0WTViSUJNMS9zd2lRNDViQ25KNWFEdU50?=
 =?utf-8?B?WENjcWpvUWsxUXQ2dkk2WGtndjJVbjhIMUU0dExOaHYydkJ1RlljdHRkM092?=
 =?utf-8?B?WVAreDNLU28zbEZNU3JhZUxKa0xTMWo0VGVCd1pqeUdyenVIU1ZRd1NpZkwr?=
 =?utf-8?B?ZmZsbm9ub0dIWXh4VW9nTmd3YTI0Vk81b2YwdmR6TjB1T0JNeXVMTHdtM2lt?=
 =?utf-8?B?VHNMYjhmZzhqYWw0VEkwOW9rajNYZXBWNFovMThTeG9OUWRTMnFGYTBGVFpV?=
 =?utf-8?B?R2E1UXNPTjdwYVpaZ2pGZ3dNdCtHNzY1OVE4RE1wWHNzTStZOTdYbjBUV1hw?=
 =?utf-8?B?MHdoS3EwUGMxNTcrNTlEbFlndjVueTZySGR6OE5jMGR3WHhIUnJaRkNobWth?=
 =?utf-8?B?a0o1bndoSWptbDBVZGZjeUd2VDIzaWNJazhGUTVSSVZlYWxLUzhQMks0Q2Qy?=
 =?utf-8?B?WFl2c1A5SnI0VkxqYWlncXQzbzNWbmQrMmR3cTI3VTRpUEZiV1RMK1VnVFRu?=
 =?utf-8?B?M2NoU0ZMOGhPS0M2NVcxalgxaFdYcFh4anA0MnBZTFRoL2RQN1E4YTg5NkN6?=
 =?utf-8?B?cmxPeWMrckFwNDdwNVRRS3FNQkNTU1Yrd2ovS1ZUaXdhTmpySWlCalkxRDBu?=
 =?utf-8?B?aXUzUFdnaGpNWEtqbWJsbHNTNE56U2oyRi9uMVJSR2IyYkNYWUdDZHJNMkFy?=
 =?utf-8?B?RmMxQXo5VzcvNE01V0VkMnpEK0pXa292VGQwb3R2TVhUQlBxZnh1SG9QNGNQ?=
 =?utf-8?B?NUlxZFMrVERmekwxU3dVMThLelQ3REpMei82WnlKb3EyMTFkNTgvNHRLek84?=
 =?utf-8?B?QVJkUHAyck05YkFrSG92MHhoVUo3MklIaUlVV3hDVzZTMmZPeVJ0MWp1MnRJ?=
 =?utf-8?B?VmdwQWtHMldkdStkaUN1OC8ycFN6SGJ0S2tKc1dkQjNPWlIwODFqQWpPTTFp?=
 =?utf-8?B?WmdVR1hOTEs1Y2lNVHB6RVNvU085MXZ4akdFa0hTR3REMXRQK0NlVUw2Mmpo?=
 =?utf-8?B?ajlIRGUvVncvVGREdVV3Y2dPOTlXSVVpMjY3dmQ5T280czFCVVVDV0tHanF1?=
 =?utf-8?B?WnIwdlF4NitERDNBMWc0R042MjNWMllsWVllMStaYVdrTDMzUjY3K21SQnhp?=
 =?utf-8?B?NEFraDBEVzFtNS96NE84THB1V2orUzBibCtBeG1ybGp5cjVCVFdtdnFaNkFJ?=
 =?utf-8?B?ck9kWi8yai83a2F4RmJaSHdYRkpwdXd4RXhMMnB2K1RBUmJUYlBjb1I4ZXFF?=
 =?utf-8?B?eFM4UGM5K0xoY3FlcXZUZkhmck1saTJydjlxbHZVdTVZT3p0cHJ3bDVYaHJu?=
 =?utf-8?B?bE9LUE9uVlZpeTdSTVkrbENxdWVWdVI0c0N5cEhMck9CcW1GMlNnRWFlRlZs?=
 =?utf-8?B?QTRCRU5Wd2dvNjZEUXBabmVDVVh6T1UzS01CekxBajQyVUFUK1BySVVrWGtn?=
 =?utf-8?B?Z2QwbFNqck54SEtEL2k0N290c1JNdkhtNms2ZWZVbWhuVXpQaXJxR1hkci9l?=
 =?utf-8?Q?2f7+Q0sLsVgDn+Y9Q9w7OEAm+5kASeFZVr6g+NB03e/k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzl5eWJiRG16Q1lVRy9yZmt3bE5KQUNNUFBWTXkxVlFBTFM5V1Rrc0hvWDBN?=
 =?utf-8?B?WVlNbC9tSmZBMjQ2czZ0Z2JQWFFVbmgrWFhDTmM0TWhYOEVLbjBYME50Vmwv?=
 =?utf-8?B?TXFHVXJiMzZmWHVJU3VDK2VLcXZWWUQwSUN0bHhRTXo2VE5DTnVPbytMdWdL?=
 =?utf-8?B?cEJnSGVCb1l0K1pBdDlBb0dLSVlqOTcraUd3cytCR1BTL3ZOTEZqSkYyaUFa?=
 =?utf-8?B?a2QwZnpxYnFuZVBKU2FJUy9ZajQrNnExYXVGVlFpNHRqWEFKSUtEQm44NHdm?=
 =?utf-8?B?b3J5endKdDZXejFLcGN5eWlxTUlWYjBiOGYvNnF0Q01BeWUwM24vaDUzN1pZ?=
 =?utf-8?B?anhKcG9YbUtLLzVvekdxbzlYY0ltZWFZNHZ2VEs0ZlRRY00zUzdpZklnbnk0?=
 =?utf-8?B?bTF2a2owSkZJK1V2UjBDcXNneHVIWDZST0NEM1JDSWFFU2RnNXBUTUZnTjh0?=
 =?utf-8?B?dDJNMkRhZHVjam9vWC9uMlpiSWNybC8xK1lTU3NjbTBOQWVwNkxqNW45UWhY?=
 =?utf-8?B?dVNZYXdvT1g5blVTanhEUElGRHhJaEVTdWZmTFMvbFFZY0ZRcDhhdEZ3eG5H?=
 =?utf-8?B?dzNnOEZ4eTR1cnVEbTgvOVZwTDRkWjQyem9CMlY4ODgyNVNuY3dqYmxXbGlL?=
 =?utf-8?B?YWJhRXl6ajUzOHhSUkNqT0lYZHRNbEhSY1BsdlRONDBRT08wV1NjRzVaV2pW?=
 =?utf-8?B?b0d5NzBYcjlBMGpqc05udU4zbG1aTktRelhkVm9lbFpadmI1QktXWUxOTk9K?=
 =?utf-8?B?aXcvOXh2STVwT0ZQNllGZFBCSVRjQWdPMVlmR3Jka0dtbE9pN0JQTlZwTFdP?=
 =?utf-8?B?Z1lkeWFMblVKYXBBY0FITjBBSnVBSmVOWVZNWERmMHcwRjVzOFYyUVd0ZHh6?=
 =?utf-8?B?bmZkcXc1MytCYk9HRksrdTFmNDM4Yk1qL21pajJuWnVxc3prZExaVW0xVjJ6?=
 =?utf-8?B?ei9BeDdHZXZIa0c2MXBQK0FWV1l2UFZndjJTSklRNHNub1BGT3JLeDVscEw4?=
 =?utf-8?B?Z3FWQ3g3MFI4S1hZcmEvblZVdmNyS2NlOE0rUDNHMEdiR21qbFhqbmtyYU1s?=
 =?utf-8?B?bjZNNWtNbEtKNGJTYyt4cHJneEZVQSs2MFFzdjFhVzc1d2I4V1ZERGdpNmpY?=
 =?utf-8?B?SDlLUDZQNUVWdzFOSkJETTloTlpybWh3R2JFN3UvK0ZpbmR0V3ZNdlpZbzkz?=
 =?utf-8?B?dzZJZ3pIb01ja0pxNk45S1VmWEt1R2VRZ1pLLzlLQmRHR09yZWFsM0VYcWhK?=
 =?utf-8?B?NzdRZzNYTndLVWZoWkRqZVYxTHZPTVpqWm5DSk84YjJFTFBVUzVPUU9WK0l3?=
 =?utf-8?B?RkpQY2tLUTA5RHB6cVp3c25BTHlza2d4ZkExUUxwNEFIWkdjRGhVVVJhZlkw?=
 =?utf-8?B?YW1tZ1U0N2tKczZwUWRFOHhOS0JpNE1OTUd0Mmp4N0liNTlQZHZvazc1UVl6?=
 =?utf-8?B?OVJObVF0NTUyeC8wMmxPb0hNclRZYm9ENG1QUkN4enRwNVZvZVFWRnBid0tl?=
 =?utf-8?B?b1EvOFF4MnJLUWs2bVhZQ3RKMmxiODl1cFZzcGNLR0d5RDNwdUdxcnNHekp1?=
 =?utf-8?B?WExPaHdYQVB0QVY4RTNxMkpsbjdVT1FnZTFkKzRWSGtObW0rajF2YnMxZVEx?=
 =?utf-8?B?SnZlKzhEclFLOGRWTzVHM0xJL0dvTXBOS3VOTWtkZk42QWV1N1hCUHEvbXJW?=
 =?utf-8?B?cWJhTDdVdFUxenNxRUptRGtxRkdVSExRQWRZcy81cUJmVTUrNk5lUSs5NDZu?=
 =?utf-8?B?Q0hGWUw5Z0ZKMWx1c1AxVTlXVzFQK2RtMUI3UU9idHI3ZTBnSHhKVTh6ejZh?=
 =?utf-8?B?dHNXZkdpNnlERUs4eU9QTmpFL0R1eUlSSFR3MFRlaXRQVnQwVVl4K1JlUGZI?=
 =?utf-8?B?aGtLdXQ1NlZ0eGFEc2FwRk8xQkFnb3FPQkVOWUVvTlZzTVk3MDdPendsOFRw?=
 =?utf-8?B?bnNKTmpJd1Bwb1JERkNTUkRFR3BuZXhrVTFFVmw3dUhhdEhBL3Vxb0VIVGxC?=
 =?utf-8?B?TjczS2U5S3IwTXp0R1BzTTBSNkh1R1hicTRRYndsKy8zV0MvZVM4MXZPejky?=
 =?utf-8?B?VVIzc25RWExxZmdtVXJEVTNEWGhESEVmTXBxREFDUW1pbzhMVnc0QkhyRzF6?=
 =?utf-8?B?QVVaMmhObHdtZHhrWXBGd1U3UkJPNFBYZWpkRDRFWmJrcm5WcVNXRnNic0Nv?=
 =?utf-8?Q?haBgcaU/iOiriI6vHqJmqfg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GyWSZpflPjHJQXVh/b1/6ZH2xUHXQdYVOZw+gFcBkfqmv8XH/mTImkhSx7NOM3v81Q6rssqmZB7qct3ggSGKA/Eda8mL/p5QjdL8ocsxlsgKvXDcr6QCMOUUysL8+BwfO7/1QuHV5GvryYaH55uoA2PNU9Q3HZy33isLuMkuiYTcFvqSzITQs2C9vKgF/yR6HvLcmSMguWL8iP8/gZXs+vOoI4jP5y9KEW3qGFwBCbUyu2K7oLC/0zox2uVmTh4vvSFFX8m7/39pnWUoNlF28offR8hrxFIPBCktYQXyLlz0MD79V4d8bPj/2APlNjM6mTvKNRAg6wsT154sNm46FZ0s0mFDm5nS/naOzZ2KtlqpW0dekmCV+Nl1TUoFeXifEaDaMztA2RbqNWGXp/2CyJXPkcOdtH8VbVJLDBt7jjgjt3BQhucMK7rD7zQr72ewbpy3XawpxsBLkQukamC+buo3RtZ0e1Nkvk+k6AbEhaz4l4634maaaasbJBFLkRJSl52BH8voN6PRZgpQPkiPbt+YMBaRA/PjO55kzki0QVEJL9XfWa7VC+Vx/cG2Ikt9587A/qvOR75XQx3gBlftOmizLHUs2Kqp/2ReQKDGOYI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded9d75e-bc25-49eb-49f4-08dc6ec4996d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 18:36:24.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwOZnOdTcj9ULTuqz/0avjVKx9btM5qxYc0NMnjYQFMlaisO/0u5IjF03NoaoJjK95a7QmQlppYstMra0ggegeG22juA3e7wn+gl49mVWfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5175
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_11,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405070130
X-Proofpoint-ORIG-GUID: wo5v_Q4_FFO82DYzsVnZnT63OzaEeOFg
X-Proofpoint-GUID: wo5v_Q4_FFO82DYzsVnZnT63OzaEeOFg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_113711_400940_5D46A785 
X-CRM114-Status: GOOD (  19.29  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6Cj4g
TGUgMDEvMDUvMjAyNCDDoCAxODoyOSwgU3RlcGhlbiBCcmVubmFuIGEgw6ljcml0wqA6Cj4+IElm
IGFuIGVycm9yIGhhcHBlbnMgaW4gZnRyYWNlLCBmdHJhY2Vfa2lsbCgpIHdpbGwgcHJldmVudCBk
aXNhcm1pbmcKPj4ga3Byb2Jlcy4gRXZlbnR1YWxseSwgdGhlIGZ0cmFjZV9vcHMgYXNzb2NpYXRl
ZCB3aXRoIHRoZSBrcHJvYmVzIHdpbGwgYmUKPj4gZnJlZWQsIHlldCB0aGUga3Byb2JlcyB3aWxs
IHN0aWxsIGJlIGFjdGl2ZSwgYW5kIHdoZW4gdHJpZ2dlcmVkLCB0aGV5Cj4+IHdpbGwgdXNlIHRo
ZSBmcmVlZCBtZW1vcnksIGxpa2VseSByZXN1bHRpbmcgaW4gYSBwYWdlIGZhdWx0IGFuZCBwYW5p
Yy4KPj4gCj4+IFRoaXMgYmVoYXZpb3IgY2FuIGJlIHJlcHJvZHVjZWQgcXVpdGUgZWFzaWx5LCBi
eSBjcmVhdGluZyBhIGtwcm9iZSBhbmQKPj4gdGhlbiB0cmlnZ2VyaW5nIGEgZnRyYWNlX2tpbGwo
KS4gRm9yIHNpbXBsaWNpdHksIHdlIGNhbiBzaW11bGF0ZSBhbgo+PiBmdHJhY2UgZXJyb3Igd2l0
aCBhIGtlcm5lbCBtb2R1bGUgbGlrZSBbMV06Cj4+IAo+PiBbMV06IGh0dHBzOi8vZ2l0aHViLmNv
bS9icmVubnMxMC9rZXJuZWxfc3R1ZmYvdHJlZS9tYXN0ZXIvZnRyYWNlX2tpbGxlcgo+PiAKPj4g
ICAgc3VkbyBwZXJmIHByb2JlIC0tYWRkIGNvbW1pdF9jcmVkcwo+PiAgICBzdWRvIHBlcmYgdHJh
Y2UgLWUgcHJvYmU6Y29tbWl0X2NyZWRzCj4+ICAgICMgSW4gYW5vdGhlciB0ZXJtaW5hbAo+PiAg
ICBtYWtlCj4+ICAgIHN1ZG8gaW5zbW9kIGZ0cmFjZV9raWxsZXIua28gICMgY2FsbHMgZnRyYWNl
X2tpbGwoKSwgc2ltdWxhdGluZyBidWcKPj4gICAgIyBCYWNrIHRvIHBlcmYgdGVybWluYWwKPj4g
ICAgIyBjdHJsLWMKPj4gICAgc3VkbyBwZXJmIHByb2JlIC0tZGVsIGNvbW1pdF9jcmVkcwo+PiAK
Pj4gQWZ0ZXIgYSBzaG9ydCBwZXJpb2QsIGEgcGFnZSBmYXVsdCBhbmQgcGFuaWMgd291bGQgb2Nj
dXIgYXMgdGhlIGtwcm9iZQo+PiBjb250aW51ZXMgdG8gZXhlY3V0ZSBhbmQgdXNlcyB0aGUgZnJl
ZWQgZnRyYWNlX29wcy4gV2hpbGUgZnRyYWNlX2tpbGwoKQo+PiBpcyBzdXBwb3NlZCB0byBiZSB1
c2VkIG9ubHkgaW4gZXh0cmVtZSBjaXJjdW1zdGFuY2VzLCBpdCBpcyBpbnZva2VkIGluCj4+IEZU
UkFDRV9XQVJOX09OKCkgYW5kIHNvIHRoZXJlIGFyZSBtYW55IHBsYWNlcyB3aGVyZSBhbiB1bmV4
cGVjdGVkIGJ1Zwo+PiBjb3VsZCBiZSB0cmlnZ2VyZWQsIHlldCB0aGUgc3lzdGVtIG1heSBjb250
aW51ZSBvcGVyYXRpbmcsIHBvc3NpYmx5Cj4+IHdpdGhvdXQgdGhlIGFkbWluaXN0cmF0b3Igbm90
aWNpbmcuIElmIGZ0cmFjZV9raWxsKCkgZG9lcyBub3QgcGFuaWMgdGhlCj4+IHN5c3RlbSwgdGhl
biB3ZSBzaG91bGQgZG8gZXZlcnl0aGluZyB3ZSBjYW4gdG8gY29udGludWUgb3BlcmF0aW5nLAo+
PiByYXRoZXIgdGhhbiBsZWF2ZSBhIHRpY2tpbmcgdGltZSBib21iLgo+PiAKPj4gU2lnbmVkLW9m
Zi1ieTogU3RlcGhlbiBCcmVubmFuIDxzdGVwaGVuLnMuYnJlbm5hbkBvcmFjbGUuY29tPgo+PiAt
LS0KPj4gQ2hhbmdlcyBpbiB2MzoKPj4gICAgRG9uJ3QgZXhwb3NlIGZ0cmFjZV9pc19kZWFkKCku
IENyZWF0ZSBhICJrcHJvYmVfZnRyYWNlX2Rpc2FibGVkIgo+PiAgICB2YXJpYWJsZSBhbmQgY2hl
Y2sgaXQgZGlyZWN0bHkgaW4gdGhlIGtwcm9iZSBoYW5kbGVycy4KPgo+IElzbid0IGl0IHNhZmVy
IHRvIHByb3ZpZGUgYSBmb25jdGlvbiByYXRoZXIgdGhhbiBhIGRpcmVjdCBhY2Nlc3MgdG8gYSAK
PiB2YXJpYWJsZSA/CgpJcyB0aGUgY29uY2VybiB0aGF0IG90aGVyIGNvZGUgY291bGQgbW9kaWZ5
IHRoaXMgdmFyaWFibGU/IElmIHNvLCB0aGVuIEkKc3VwcG9zZSB0aGUgZnVuY3Rpb24gY2FsbCBp
cyBzYWZlci4gQnV0IHRoZSB2YXJpYWJsZSBpcyBub3QgZXhwb3J0ZWQgYW5kCkkgdGhpbmsgYnVp
bHQtaW4gY29kZSBjYW4gYmUgdHJ1c3RlZCBub3QgdG8gbXVjayB3aXRoIGl0LiBNYXliZSBJJ20K
bWlzc2luZyB5b3VyIHBvaW50IGFib3V0IHNhZmV0eSB0aG91Z2g/Cgo+IEJ5IHRoZSB3YXksIHdv
dWxkbid0IGl0IGJlIG1vcmUgcGVyZm9ybWFudCB0byB1c2UgYSBzdGF0aWMgYnJhbmNoIChqdW1w
IAo+IGxhYmVsKSA/CgpJIGFncmVlIHdpdGggU3RldmVuJ3MgY29uY2VybiB0aGF0IHRleHQgbW9k
aWZpY2F0aW9uIHdvdWxkIHVuZm9ydHVuYXRlbHkKbm90IGJlIGEgZ29vZCB3YXkgdG8gaGFuZGxl
IGFuIGVycm9yIGluIHRleHQgbW9kaWZpY2F0aW9uLiBFc3BlY2lhbGx5LCBJCmJlbGlldmUgdGhl
cmUgY291bGQgYmUgZGVhZGxvY2sgcmlza3MsIGFzIHN0YXRpYyBrZXkgZW5hYmxlbWVudCByZXF1
aXJlcwp0YWtpbmcgdGhlIHRleHRfbXV0ZXggYW5kIHRoZSBqdW1wX2xhYmVsX211dGV4LiBJJ2Qg
YmUgY29uY2VybmVkIHRoYXQKdGhlIHRleHRfbXV0ZXggY291bGQgYWxyZWFkeSBiZSBoZWxkIGlu
IHNvbWUgc2l0dWF0aW9ucyB3aGVyZQpmdHJhY2Vfa2lsbCgpIGlzIGNhbGxlZC4gQnV0IEknbSBu
b3QgY2VydGFpbiBhYm91dCB0aGF0LgoKVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rIQpTdGVwaGVu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
