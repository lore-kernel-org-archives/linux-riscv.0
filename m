Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9E3C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6LxBaNxuFMLdmwayKg4BqHyyrf/1ktdBUVNWdwKGhw=; b=nedzToHhmRUEK0
	8uW+mr4tHEyM7e0iqjF9vsTMi00YyojSefkTy6RLcoNRz0hxVBoBdVNFG/oZcRvsbLF1c2yoG+V/i
	tGiOISlK0e+yAiffG/fp0EGGMs+ZmuQ1qFXgnj5GKpNppOddWZ+fzczMFspkPXW5aZws2UMOEyG/K
	2+KS1VFJtVBmmC2Gws0D1H9+91K6EJF/5g0fb19BEccyscRjluvfRtlBRLAKodfvOBZRGXvoxoMak
	tGtG1YMRlgOhZDg3pka8euf64asOta9hwEJcZ9SblNM7PTdGbMD+45j0vWL+PzQAEUm4bRfhaSjIN
	hRt8/HjIyB6OjNf5RRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7MyG-000000031Zj-1wF0;
	Wed, 15 May 2024 22:19:36 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7MyD-000000031YO-3ZAQ
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 22:19:35 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44FL19pT003823;
	Wed, 15 May 2024 22:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=1vrh5wI1wNw6ugWZ/VwTP/wK4l8RZpuJUAeO3eNGC8M=;
 b=aSRhpE3X/D6Yh8w8G3wdDNKQAN62Kqk4muyj+zSPCsXSPCwVk3C2CbdjIgJfi5h1mnRo
 nyLrvcMkeRE1XOb5W/qli6IsB9oucw1pscNMHTZI36BY3YfeouN2ndJE77eOvm/TW8rY
 u+w5HCIKPn/ywdMoiwuz8jpUtGqB7b7FKgKw6j6thDIhN/65uRGqiarLa5h6itCoBGwR
 MtOvbItBEQ5GxYGcB2+oDFvXM44zmPJLDTpAGxfJm/cAba7YlzUUZtKZTHu88neXTsyG
 nNhtAV/EHJ8DEfH1/jC8cL9xFh9hP+8a62rRM4Rc15Zrbk/k+HMLQc3d70XJIK4P1qZd 2A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3tx8m4ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 22:18:23 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44FKT6AR000580;
	Wed, 15 May 2024 22:18:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y4fssrg0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 22:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4Xqdngtmf8HTOZIeK8Ss+lU3QOj0Q4hYSakMfD7voc0mv3cFvJfrIGmCSjwX04qIzxvF5H+xnrqHG98Iu4kSyhy/rmfZK3+ceo0zVe7bFbw9atk3CbFLyEJL3CPuA8aib6Dod+9LgvvhgdaTJH4lhklnuwXUizNNdjYdEF0ENIZjEagTH/kw0cUxE27oWfhfcVABd3sHdC+YNQ7vzzsv2PXbWR3ImxcUrA8maW7rzTatfeHwURxbsc22cRSQ+F7jJqcrZb+8EHiALnKK/12KOHr60r2rGC4vw3Y20gG/qv5fo/mgUZoTaF1jPwzJMz4ZTZ3GYkjmmx6q1Jmw+pMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vrh5wI1wNw6ugWZ/VwTP/wK4l8RZpuJUAeO3eNGC8M=;
 b=HXvLOjqPqvKjR28/FzWT74svyRXnuoDZwiwpPkdTd2tnYddndZUZwi0frYwQAhcIaeqxXscvJCgK2ueRQRPYbQs37kunGGJgf6ZzP3h+sU/zNtCsNSEHo6s63O9NUJYJ4n9YUBxrYnQOEyIkBKLdv9+fJtBtBFCdBz8TAcnSRSwWZLdtw/HwO1QyCZxTi6R4xzKdzdIWhwVqc41FGiFsShTsozLt1aNi+u4IG05F2J3PIaz18TLdWO1q0WToy9VcEhGD3dFh3OXL8DV0CMPlpUK7oV6Z+lhGHwItgM/hvh/Aa8MklPiL0R8xCkiabdp1rtwU9KninHO7TciJtCJbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vrh5wI1wNw6ugWZ/VwTP/wK4l8RZpuJUAeO3eNGC8M=;
 b=C1SzOQRonr8RnKTehW3B8IYxr7uzAGmWwtijqsQkrOms7ew1i1CTZZzlQMoBw9slIiPxQ90rivkXGmLmL0fof3/CaIic3tjdmRfgH/ojxM6NiU38sANkRkKBqoPa672XsllnVo8u0o0Sqvzq8JFQgKONOnm76eHwjEFvpSwuvUI=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CH0PR10MB7498.namprd10.prod.outlook.com (2603:10b6:610:18e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 22:18:10 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7587.028; Wed, 15 May 2024
 22:18:10 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller
 <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav
 Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
In-Reply-To: <20240502110348.016f190e0b0565b7e9ecdb48@kernel.org>
References: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
 <CAJF2gTT8a4PBU3ekZFNTi6EuETT9hhKfhXrPgGGpn92rQMNSvg@mail.gmail.com>
 <20240502110348.016f190e0b0565b7e9ecdb48@kernel.org>
Date: Wed, 15 May 2024 15:18:08 -0700
Message-ID: <87r0e2pvmn.fsf@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CH0PR10MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f3971a1-2707-4295-a665-08dc752ce75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|7416005|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUIyVmNmYWtHWDlKOHg4djRjZWczMGx3TGlHS241OFZRejVSS0s0dUIyZUpG?=
 =?utf-8?B?ZU0zUWxaS1R3YWF4WEhVcHllbzQ1VG9VZkNxTUtVWlJLK3lFUWxoNkE3YkJm?=
 =?utf-8?B?U01FRjA4RnVoQURlZ0x2ZGtnc1NwWnB4RWFFV0IxaE50SG1waXVyTjdMYVll?=
 =?utf-8?B?d3dHd2NFaXJkcm1wcDB0OTRNQUZYRDMxbkNQbzRlRSt3NlpPR3hOWkVMemFR?=
 =?utf-8?B?T2FINE4rcjNlNVRVMnN3V0ZoTnVqWGZFb1VLN0pDSVBNaFBsTU5KNGt0UlFH?=
 =?utf-8?B?VCtDTDlkRnVnZ0R2NDUyVzltRGZGZHVmdWpYRmdWUm1pZFFydFE2QkZqUEs3?=
 =?utf-8?B?UHJKT1FuelFMU1kvNk51OTNuaWZyR05SeE5sd0JEaFJEaC9PNnRMblFKTWVG?=
 =?utf-8?B?azBvM0Zqa3JSanhKM1B2TmZWMFJBblhKWnlMOW5Jb2RoUUVaeWJhNlB5TmFp?=
 =?utf-8?B?VkVLSERkZUNTU3NUcmdVNWhyNXRVV3hBWHovZ05xSjZndXZWamNmZndRWTFQ?=
 =?utf-8?B?ekptdGJTeGF0UXpRMmFsRVNlRVFEek1jRWl6OXJQVXhTczU0RWI5cmVVdzhZ?=
 =?utf-8?B?Mmh3dDFTQzkzVEowU3Q1azBMMmJ6T1N0OUd1L3RXR3lIMTBzc3RJcy90cElU?=
 =?utf-8?B?N3l0RGwyb1JVOEZwTkc4TWpKOW5aVkdyWXA2SmV3WUxUeDVRdzQ3ZDBiMUIv?=
 =?utf-8?B?RUhUTGJwRTBnN3ZiR2dLS3B2dUdBaHNCRGpaUHZnTHhhNGdqRFJQRkoyZjdj?=
 =?utf-8?B?TG9teTFEZllrU0dGMVZlWnJzMXYzSWRjNXNNQ2l6RXFHYTJySHQ4cmNIcUpM?=
 =?utf-8?B?OWs4ZEFqWEl0ZENHRWtkUHdzdGNOdno5V3B1SmhnWXg2NW9NZFJYSVNWWnYv?=
 =?utf-8?B?Q0pLaTBmWnJORU1nWW1QYzVpMWtBVUMyMHpham82VHU0WGd6NjYrbk1jOGln?=
 =?utf-8?B?RGxpdTRuT1lheXNxZnV1Mm1YZVRxWUw0RGFpVzdBVFRSdlAxWSt6SmZ1TlN6?=
 =?utf-8?B?U3BrT1o2b1ZRU2JJcVA4QXlsN3pkZEx3YXQ3MlMxanRBWXdTdkJBMlF1ZjFl?=
 =?utf-8?B?eUtWTjMwWlgvUWpCd0hoY0JRQzUrUFpZL1dTTkVCbGQ4U2o3c1IxaFA5NlNB?=
 =?utf-8?B?dGhFQlJFRytiem5OMFBsdXJrSUNnVzRUY3pkL1dBanhNOEtrV1NJeS81dmZm?=
 =?utf-8?B?d29MK0IwUWZZYkwwN08wSGN2Z1lYV2tNNFJxSTFzbFk0aDgzSGlOQ1pQcmRi?=
 =?utf-8?B?TWc3bndPY3hIL01YL0hPQ2tiNHQwS2NtbXhQclVycC9uNnN0SEVVYnNWV0w4?=
 =?utf-8?B?T3QyTHU4K0lqMHJibFRydHVNdFJ2SThHSVJKWFk1MkJWSm9uWGJJZnBNZ2RQ?=
 =?utf-8?B?SkoyY2ZhOXJIckcxU2lYanpHVDV6UkhkQU0ySExuamVNNEw1Y1lmd1JDaHdN?=
 =?utf-8?B?SFpBSmxYVnU2dS9qVXZKd2RmcjEyanpaSmZLV1ZENm9raDFlUE5tZ0YzYmdO?=
 =?utf-8?B?ZW9NMitaUEkrdzZPSjdXeTYycVRQbnVPZDQxQ2I5ZzZJbjd0c2t1SEVMSVBM?=
 =?utf-8?B?SmI3UEd3M2ZnaWp5MXVSVG9pdVpWcTZNUjlyS0xJMTF6SVBaRm1MVlRDY04w?=
 =?utf-8?Q?yQ/RQT9QxXgG+zDaaIY0DXjqnvd9ClBEg1O0owCWXq8w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(7416005)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3hvclREdVFDWmh2WXVhNXcxOVRRZTBhWkJkL0RNdVFYSWNKT2dMNHlwNlcr?=
 =?utf-8?B?MG9ScEJRWEpUZDdXMmQzUFJXbWxSdDVLaENFYkNJMms1WDUwYVB2Zlp0ei83?=
 =?utf-8?B?QSs1bEppRGowemxRVDl3c1k4cHBia2NHQXNzL2xWckpsY3JhQVN2d295Rkp3?=
 =?utf-8?B?R1hJQ0Y0dVhpZi9UU0J3STJIeGZKUVpQUmVjdTFPVUdsdWdZZXl0dURwMVhY?=
 =?utf-8?B?TGxMQWVCOExaUnFtZTZ2eFdPNzdtMEs2ak5tMXF3SEpNK3R6dHI0RDBUL1px?=
 =?utf-8?B?TkxLS1F5aWVmelZ3VTZrMGVQRGNlTHFxcmxPejRJNythTFM2bjJ1ckpMNk5q?=
 =?utf-8?B?UVVNUTh0SlFRUjVKMGE4aWRnOGpnVUtCTUoyU0xpd3UwbTQ2YUx0QnptTDVz?=
 =?utf-8?B?eWVYWDBXV3BXTllsZnhJTi8veHBDVDI2YnBHaS9sbnQ1czltMDdsdkpWamdu?=
 =?utf-8?B?eUVxU2R5bEJLeGpPYlVGSlRZellEWUpydEZFMUxJWmEwOTRJTUNkUUNJWEQy?=
 =?utf-8?B?WWVmbitrMWxYYldSTkZIeHpqTnN5WHNJcUxOOG5NaHNEaHRwV0I0M0RzdlJs?=
 =?utf-8?B?YW9PQnJsbWJDVHFvQ1FwYW5oQVZKR3hrZ2cxdk9DUm5RVWpiRkt2Mno5YVV6?=
 =?utf-8?B?L3NuMmlpTnlZOGRyb0VhYjhNNG1tdDZyQmhVYUdPdDVabWNhMDZtTFA4eThT?=
 =?utf-8?B?dTlnbmw1TVY1QTN3VnBFNFFROWtDY2FKZzJPRTJoWkhLS2dZTUlSWWZ1b3E4?=
 =?utf-8?B?aFVQbzk3YnpxaldtWDZTcGZZOVlSbDBVeHcwRWRaZnl3T0k1STJuTzNpS3lo?=
 =?utf-8?B?Wm1Xd2J4ZS8zSytvQWNjNDRTNjZFR3Blay9WczNxckt0ZkNKamozTDdLUGhw?=
 =?utf-8?B?dVZzYWtBamxXVHkwdlpacHBMb0hFVlR1N1BJMjJMcmNtQklNMlJrVllRUmpo?=
 =?utf-8?B?YkNRb3dRTnFBeE16cVJmalNnTllvY0FlaXluUnVMU0ZkWkZ6eEw5cTN5SDRh?=
 =?utf-8?B?UnhEeG5Xb0Z0ZldMd3VjejVvVnUxcTMwUmRkc09hUlN0cTlneXE3SU1rVmtp?=
 =?utf-8?B?MFdUd25qbHIwUVAvUHhUaU5wRW9TNmcycUtnWkhQWkprL0VnaXU2Sm95SmFM?=
 =?utf-8?B?NFFZaFA3aGJQMVpjNUl1elVlbklKejdjblRRazg1UzdrWDgrOFQ2NTNuUkZW?=
 =?utf-8?B?VXE5TkxiYUR2R25mWUhLUnEvRU9uVUY4RE1NS2pERmJ5VytTbTA4SmVobmZ1?=
 =?utf-8?B?azRUYm13TFZYVDluMVJtelU2M2IrZFhXb0NFT09wK054b0NtMmJyOEpVR0tX?=
 =?utf-8?B?MDJsN1ZzcGYwL0VDWHhObENsdlhmMThFeEpXN01PTVFnMGI3TWw1QkRmbzNB?=
 =?utf-8?B?cHZhYnkwU0pReGJxOWN5ZzVWbjBDZnVoSkp3V0pTSkpoS1g5NldGUTlBVDRx?=
 =?utf-8?B?S2MyMDlSUXptRmhWZWF5QTIzZ3hCbkZSZTVuNUdtbUxWZ21TTXgxU3VSL0d4?=
 =?utf-8?B?SDFVWmFaL2M5dTg0bk9DZG90ZHdvY25ncm1DNDFGakFWV0RCRURRYnQyU2c2?=
 =?utf-8?B?cGlLYnJhU21FVkZKTnBKeUdlVnlVU2xXQ0xhNUVBY0FGTnhkcFpoRjhwZmQz?=
 =?utf-8?B?Rzk5M3dZYkhmVnJUMDEyNDdtZnFxYXVKa2J5RHd1RlRISkpxK080RnNtd0o2?=
 =?utf-8?B?YmMwL28rakMvOFBNeVpDOW15ME9SRjB5MUVaM1dBZDdCU055NjF5aXVYYnRC?=
 =?utf-8?B?Z04zY2w1T2NlaVNqRnArd1owSzI5Mm9yVWg5ZXpkRDZDVWhJMjZ5OFBLRW5V?=
 =?utf-8?B?Smdwbm9XZE5kMzlRYVZ1WFhSYThwaVhtdmFwd01ycm1vUVlZTmdCVVMwZ1Vk?=
 =?utf-8?B?Y1M0NFRsM0VxYUtHKytiajdMTzhkYkwvb0tWeG40YnJFNjhDUGNNNjk1OHA4?=
 =?utf-8?B?R1ppdCt1Q1ZTOTVxSjRpdlM2ZW1zTE43MW1sY2RzUFFmM2ZkKzZoQlB1K3Rx?=
 =?utf-8?B?Z0FFWUlpTDNtbElPeTZsTkQ3RlpSZTh6SGZBTjBxRmg5T3U4d05mR2lDNXFJ?=
 =?utf-8?B?V3hxOWdBMFJ2Z05EQXN4Uk1JbkVzYkNtMlhWWkYwWHNyTFVMQ1RqbUprVTRR?=
 =?utf-8?B?VHZFTHZweC9ER1dzbjVBVHJydXNaK1FrN3FROWxZREY5RkpLKzlMNjlpLy8z?=
 =?utf-8?B?blhiQmplbkN1V29kVS9IOG1ockk2RkpYekdHODBPTXVCQVppUWVKSmgvNllw?=
 =?utf-8?B?Ri83azNmUFJHNm4yQklGVEhGSXlBPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dvbrj2qtt6f5n4HPZChCVSm+u7QScH9CGVQD+SyhGB3FYfI4QmcFnRWnsPm7n6RG7fypEPvCVO3Efv79wxFa3khTE4wAx6ZOUVhvI3Z70nHrCo0iO0bui90xglm/WqpdC45WoWp1mBkueFcKvjCUDJOf3V++RuGg+1AvJ2q43URyniRcK+n3TdPXeZTguaBZuMRkRzsToKN0vBv13dpSTGehS7uQASKhlnQ1Y8lflgnB6m2mgFUESEcJpybHwepRIA/BWVSTVSgnKXuBOuprWw5qoaDM/wQXxv8zErMN6viNpTgJLN/6F2Iu8SITMa7KsYnOjQNmJyCpJD+C2g6TdNcP1zZAVUrgjhgDeSeNl5xUe5hgssDh2ErINjDCqW4u/1bBS6TtFkFE7fzFFhzCi435sdRDTA+swSAp0ghAbJ19TkZ6PoGtRC0MrN2YoJ+3nzUeHLvXWjZMXLwwtJgw73/urDkXrvdm3x4qSy6veB1Mx8KCR3wVHXGW5IMGyFXmCwDs8m0ZXp8e32TaUF1gP/XbU5LKPiKh7vLKbhKcCI1BzwNiZALW0Kc998eeFYTfEaIJuNsjnw5Khs6JdTHAsRSE0r4/EfsBmBpxvO5m5qg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3971a1-2707-4295-a665-08dc752ce75a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 22:18:10.1818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40ZCihD6ecQRTyxoUHJGbUfnu3E6FJ4Qyirca6PPxzkoIkqg5YYdTS+SRaPWblNGNzaeCXSLiVRUc4gZzXUknMZjoc04az/k9/oaFfTy2Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7498
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_14,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405150160
X-Proofpoint-GUID: 4o82Ffv-manoniq9ypVXdaF6r7cgJ7C9
X-Proofpoint-ORIG-GUID: 4o82Ffv-manoniq9ypVXdaF6r7cgJ7C9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_151934_096448_C2CC2554 
X-CRM114-Status: GOOD (  24.50  )
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

TWFzYW1pIEhpcmFtYXRzdSAoR29vZ2xlKSA8bWhpcmFtYXRAa2VybmVsLm9yZz4gd3JpdGVzOgo+
IE9uIFRodSwgMiBNYXkgMjAyNCAwMTozNToxNiArMDgwMAo+IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+PiBPbiBUaHUsIE1heSAyLCAyMDI0IGF0IDEyOjMw4oCvQU0gU3Rl
cGhlbiBCcmVubmFuCj4+IDxzdGVwaGVuLnMuYnJlbm5hbkBvcmFjbGUuY29tPiB3cm90ZToKPj4g
Pgo+PiA+IElmIGFuIGVycm9yIGhhcHBlbnMgaW4gZnRyYWNlLCBmdHJhY2Vfa2lsbCgpIHdpbGwg
cHJldmVudCBkaXNhcm1pbmcKPj4gPiBrcHJvYmVzLiBFdmVudHVhbGx5LCB0aGUgZnRyYWNlX29w
cyBhc3NvY2lhdGVkIHdpdGggdGhlIGtwcm9iZXMgd2lsbCBiZQo+PiA+IGZyZWVkLCB5ZXQgdGhl
IGtwcm9iZXMgd2lsbCBzdGlsbCBiZSBhY3RpdmUsIGFuZCB3aGVuIHRyaWdnZXJlZCwgdGhleQo+
PiA+IHdpbGwgdXNlIHRoZSBmcmVlZCBtZW1vcnksIGxpa2VseSByZXN1bHRpbmcgaW4gYSBwYWdl
IGZhdWx0IGFuZCBwYW5pYy4KPj4gPgo+PiA+IFRoaXMgYmVoYXZpb3IgY2FuIGJlIHJlcHJvZHVj
ZWQgcXVpdGUgZWFzaWx5LCBieSBjcmVhdGluZyBhIGtwcm9iZSBhbmQKPj4gPiB0aGVuIHRyaWdn
ZXJpbmcgYSBmdHJhY2Vfa2lsbCgpLiBGb3Igc2ltcGxpY2l0eSwgd2UgY2FuIHNpbXVsYXRlIGFu
Cj4+ID4gZnRyYWNlIGVycm9yIHdpdGggYSBrZXJuZWwgbW9kdWxlIGxpa2UgWzFdOgo+PiA+Cj4+
ID4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vYnJlbm5zMTAva2VybmVsX3N0dWZmL3RyZWUvbWFz
dGVyL2Z0cmFjZV9raWxsZXIKPj4gPgo+PiA+ICAgc3VkbyBwZXJmIHByb2JlIC0tYWRkIGNvbW1p
dF9jcmVkcwo+PiA+ICAgc3VkbyBwZXJmIHRyYWNlIC1lIHByb2JlOmNvbW1pdF9jcmVkcwo+PiA+
ICAgIyBJbiBhbm90aGVyIHRlcm1pbmFsCj4+ID4gICBtYWtlCj4+ID4gICBzdWRvIGluc21vZCBm
dHJhY2Vfa2lsbGVyLmtvICAjIGNhbGxzIGZ0cmFjZV9raWxsKCksIHNpbXVsYXRpbmcgYnVnCj4+
ID4gICAjIEJhY2sgdG8gcGVyZiB0ZXJtaW5hbAo+PiA+ICAgIyBjdHJsLWMKPj4gPiAgIHN1ZG8g
cGVyZiBwcm9iZSAtLWRlbCBjb21taXRfY3JlZHMKPj4gPgo+PiA+IEFmdGVyIGEgc2hvcnQgcGVy
aW9kLCBhIHBhZ2UgZmF1bHQgYW5kIHBhbmljIHdvdWxkIG9jY3VyIGFzIHRoZSBrcHJvYmUKPj4g
PiBjb250aW51ZXMgdG8gZXhlY3V0ZSBhbmQgdXNlcyB0aGUgZnJlZWQgZnRyYWNlX29wcy4gV2hp
bGUgZnRyYWNlX2tpbGwoKQo+PiA+IGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQgb25seSBpbiBleHRy
ZW1lIGNpcmN1bXN0YW5jZXMsIGl0IGlzIGludm9rZWQgaW4KPj4gPiBGVFJBQ0VfV0FSTl9PTigp
IGFuZCBzbyB0aGVyZSBhcmUgbWFueSBwbGFjZXMgd2hlcmUgYW4gdW5leHBlY3RlZCBidWcKPj4g
PiBjb3VsZCBiZSB0cmlnZ2VyZWQsIHlldCB0aGUgc3lzdGVtIG1heSBjb250aW51ZSBvcGVyYXRp
bmcsIHBvc3NpYmx5Cj4+ID4gd2l0aG91dCB0aGUgYWRtaW5pc3RyYXRvciBub3RpY2luZy4gSWYg
ZnRyYWNlX2tpbGwoKSBkb2VzIG5vdCBwYW5pYyB0aGUKPj4gPiBzeXN0ZW0sIHRoZW4gd2Ugc2hv
dWxkIGRvIGV2ZXJ5dGhpbmcgd2UgY2FuIHRvIGNvbnRpbnVlIG9wZXJhdGluZywKPj4gPiByYXRo
ZXIgdGhhbiBsZWF2ZSBhIHRpY2tpbmcgdGltZSBib21iLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1i
eTogU3RlcGhlbiBCcmVubmFuIDxzdGVwaGVuLnMuYnJlbm5hbkBvcmFjbGUuY29tPgo+PiA+IC0t
LQo+PiA+IENoYW5nZXMgaW4gdjM6Cj4+ID4gICBEb24ndCBleHBvc2UgZnRyYWNlX2lzX2RlYWQo
KS4gQ3JlYXRlIGEgImtwcm9iZV9mdHJhY2VfZGlzYWJsZWQiCj4+ID4gICB2YXJpYWJsZSBhbmQg
Y2hlY2sgaXQgZGlyZWN0bHkgaW4gdGhlIGtwcm9iZSBoYW5kbGVycy4KPj4gPiBMaW5rIHRvIHYx
L3YyIGRpc2N1c3Npb246Cj4+ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0
MjYyMjU4MzQuOTkzMzUzLTEtc3RlcGhlbi5zLmJyZW5uYW5Ab3JhY2xlLmNvbS8KPj4gPgo+PiA+
ICBhcmNoL2Nza3kva2VybmVsL3Byb2Jlcy9mdHJhY2UuYyAgICAgfCAzICsrKwo+PiA+ICBhcmNo
L2xvb25nYXJjaC9rZXJuZWwvZnRyYWNlX2R5bi5jICAgfCAzICsrKwo+PiA+ICBhcmNoL3Bhcmlz
Yy9rZXJuZWwvZnRyYWNlLmMgICAgICAgICAgfCAzICsrKwo+PiA+ICBhcmNoL3Bvd2VycGMva2Vy
bmVsL2twcm9iZXMtZnRyYWNlLmMgfCAzICsrKwo+PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9i
ZXMvZnRyYWNlLmMgICAgfCAzICsrKwo+PiA+ICBhcmNoL3MzOTAva2VybmVsL2Z0cmFjZS5jICAg
ICAgICAgICAgfCAzICsrKwo+PiA+ICBhcmNoL3g4Ni9rZXJuZWwva3Byb2Jlcy9mdHJhY2UuYyAg
ICAgfCAzICsrKwo+PiA+ICBpbmNsdWRlL2xpbnV4L2twcm9iZXMuaCAgICAgICAgICAgICAgfCA3
ICsrKysrKysKPj4gPiAga2VybmVsL2twcm9iZXMuYyAgICAgICAgICAgICAgICAgICAgIHwgNiAr
KysrKysKPj4gPiAga2VybmVsL3RyYWNlL2Z0cmFjZS5jICAgICAgICAgICAgICAgIHwgMSArCj4+
ID4gIDEwIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPj4gPgo+PiA+IGRpZmYgLS1n
aXQgYS9hcmNoL2Nza3kva2VybmVsL3Byb2Jlcy9mdHJhY2UuYyBiL2FyY2gvY3NreS9rZXJuZWwv
cHJvYmVzL2Z0cmFjZS5jCj4+ID4gaW5kZXggODM0Y2ZmY2ZiY2UzLi43YmE0Yjk4MDc2ZGUgMTAw
NjQ0Cj4+ID4gLS0tIGEvYXJjaC9jc2t5L2tlcm5lbC9wcm9iZXMvZnRyYWNlLmMKPj4gPiArKysg
Yi9hcmNoL2Nza3kva2VybmVsL3Byb2Jlcy9mdHJhY2UuYwo+PiA+IEBAIC0xMiw2ICsxMiw5IEBA
IHZvaWQga3Byb2JlX2Z0cmFjZV9oYW5kbGVyKHVuc2lnbmVkIGxvbmcgaXAsIHVuc2lnbmVkIGxv
bmcgcGFyZW50X2lwLAo+PiA+ICAgICAgICAgc3RydWN0IGtwcm9iZV9jdGxibGsgKmtjYjsKPj4g
PiAgICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzOwo+PiA+Cj4+ID4gKyAgICAgICBpZiAodW5s
aWtlbHkoa3Byb2JlX2Z0cmFjZV9kaXNhYmxlZCkpCj4+ID4gKyAgICAgICAgICAgICAgIHJldHVy
bjsKPj4gPiArCj4+IEZvciBjc2t5IHBhcnQuCj4+IEFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KPgo+IFRoYW5rcyBTdGVwaGVuLCBHdW8gYW5kIFN0ZXZlIQo+Cj4gTGV0IG1l
IHBpY2sgdGhpcyB0byBwcm9iZXMvZm9yLW5leHQhCgpUaGFuayB5b3UgTWFzYW1pIQoKSSBkaWQg
d2FudCB0byBjaGVjaywgaXMgdGhpcyB0aGUgY29ycmVjdCBnaXQgdHJlZSB0byBiZSB3YXRjaGlu
Zz8KCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RyYWNl
L2xpbnV4LXRyYWNlLmdpdC9sb2cvP2g9cHJvYmVzL2Zvci1uZXh0CgooIEknbSBub3QgdHJ5aW5n
IHRvIHByZXNzdXJlIG9uIHRpbWluZywgYXMgSSBrbm93IHRoZSBtZXJnZSB3aW5kb3cgaXMKICBo
ZWN0aWMuIEp1c3QgbWFraW5nIHN1cmUgSSdtIHdhdGNoaW5nIHRoZSBjb3JyZWN0IHBsYWNlISAp
CgpUaGFua3MsClN0ZXBoZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
