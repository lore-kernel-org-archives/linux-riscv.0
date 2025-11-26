Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364D7D10F33
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 12:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7wrpfPsgawR8dsY/OdvPlEJmIKotsUYQDsV2G/YFNE=; b=wzYmBdWv8U8raW
	QPHwmJHcqv99NxPJ0rHwBSMmDoGhJ0Q5grjmiUSLeP5uCvXlLgEpeqQkl8IHhAZ4UyK5OmDHYKJE7
	tUND+WRNAduov2R1QFolNXja2eGDPc66u3FWMUGW5WyXXZELhsGePa1l42lnhBgJkuBdK8YY3FSAe
	7a0uGtrkR4m7TKCzyaHRGZeCK7squodBETQulsp8eJyUnNoLbFcnhv9pxJnQzhvr4xeK4yt8ipCTW
	UW1NLgjyUqfXgbSqllCLduUfsvMu9WFFraL+RFGiAwXmmQp6nb5lxYdUVk6KaQjtCV5f7Cnlge3x7
	CLoixGWjKJhcYNK1IdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEdU-0000000EyeJ-1xE0;
	Wed, 26 Nov 2025 12:28:40 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEdQ-0000000Eydg-107H
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 12:28:38 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAdNZQ1496418;
	Wed, 26 Nov 2025 12:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=yFpZZEuslfAMrLlYTZ
	sGQ+G8cBu7lDd5adQaOeCwuQU=; b=ofja2pcJC4P/rg2Yw/3zbSCGMy/rcvFcGM
	GapET3JdbTNBpbNNJmxzOun8Pwk7epL+FDKx0yfedpm144i4o5gMJkDAL//hBhkg
	d1gRTNWPj2S7K5QSEjx2hcs/it6zwQkSiOU1XF/2YujyFipTVBy+yKpKdIiTCgzo
	jH3h4vy90d9j3tePawgzT9v/X2I5iacOnHbzlyxe9ZDJMNSVGSYedf6zqJtilBGQ
	LqO6xv82A1KmIsIS851y8ep/EarFnNrCvMsRY4rBH9/TM/n5MAiw6jjA/kuY0Qz5
	soxZ8+eb7+VE7xKHxop/1ayZVAJ/HcThUSiS+18/WAHWgM57e/SQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ak8d33m6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Nov 2025 12:28:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQBKEhG022240;
	Wed, 26 Nov 2025 12:28:03 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010001.outbound.protection.outlook.com [40.93.198.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ak3mepa4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Nov 2025 12:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIcpYTDLl2APyMsdXyG5aiOTngFiinkb1Y6PgLlmtvUdTu09y/kHZXnUG8w4PKc9zY/6SRG6UeJvC4ajxtuD23EAoXKeVNPGeO9FLyf5D4G30K5QOskxYEdhf0pCOC+CHZlAi5PFZNzKS9X74aNZAFyyCTE9jhuZGWFHZ6JQO2JW6/HPQkxjndyc+puDRkUqSCVgwflpM/Ow1gVONMuHP8umVDVvuO0ElWZyHA1NL6020fMKLcBGApDkIHkEMN4XoqWjSXJZSA3TRXNrxAaRteQOQe7PfucBzrLRFi7T8F8pMgpVUAaA7DeDE3gFIesfEltQJI71G1RnPvtz8spyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFpZZEuslfAMrLlYTZsGQ+G8cBu7lDd5adQaOeCwuQU=;
 b=qp116gMNMEhHaM2JBVD5+jqL5DBgoxT3aREWGZVlpIhLlqHfLkMFpmrxRBDIAwLxrVc93G6LZmNOCt4bsVzmHHVz3HUVUqO8MFJIB5VnFVZLDRNHFlmETtMRHVUCFI/YFLuj4h2m5A8voXX1S8/JAXJJlQgfm9srAdKOS2WzYT0uZ5hJX/2jPJ3pm2eH/sOCrSFH5EDp0/f4gIx7q2Do7RxTOL34LuTK0HH4C1ip8JLKuYsYrh1fLvPtuMtPr7vaJ4ZVotK9O2oM/qhzLzhecjhh4WxXHgWtWGbPrfk/ZrjS+wgPvLVvJVYdDF3wfkePq2p7+MK2AUFyZH9huQko7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFpZZEuslfAMrLlYTZsGQ+G8cBu7lDd5adQaOeCwuQU=;
 b=xa1+6iTNzid/SZQ3S0oI4/FaMkaecGBEcN4eWZCbprqn5oG5v+/AaAQdctRBlJFekAn9wyMmIi/r7YQk12QAdH4cNw7uHGrJRXubZXfbxyYftBxsR/Olf7cSWA3XMVhfUGzbho5KZcylB6CM0dj2rhqd3q4S4cw0HA1hhleDPK8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4187.namprd10.prod.outlook.com (2603:10b6:5:210::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 12:28:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 12:28:00 +0000
Date: Wed, 26 Nov 2025 12:27:56 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        linux-riscv@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
Message-ID: <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-7-samuel.holland@sifive.com>
 <02e3b3bd-ae6a-4db4-b4a1-8cbc1bc0a1c8@arm.com>
 <bc88d132-452a-42a1-9ee5-5407334d8aac@kernel.org>
 <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
Content-Disposition: inline
In-Reply-To: <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: fa431486-76e9-45e7-e4c6-08de2ce73d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S3dPqJDBPugDWIMw8L+s3CTiMKBZxNvtjjtQ+uTUIJpMGB075hrWAe2iaBZD?=
 =?us-ascii?Q?kIO9CL4ww9nsrVWAeGOTR7Q3s1w4NH0Bt4XxmskYmHhRBHSIy/bkVkBNf9By?=
 =?us-ascii?Q?rEcpp4kT1yHsSSZZTf+1dloRJR7Uqz3O6jzVIMQHpr7wNshk1Nb3lYyd1JP1?=
 =?us-ascii?Q?zFqafMsVjMwAg/FtaE0nul/+qVrC9pizPrSEIAKvCgZa2r3EqXnB+ml9KFHy?=
 =?us-ascii?Q?UhOTNmNFCmp9wliyB+XpLA+2WuiadzlnZLe36Wq3T1SH6xsdskNgTIhOVpHQ?=
 =?us-ascii?Q?2bV/8tuKwm6cvkawiTQO0VQBV3U0AEUEMcKF6FlURZP5VjJsYenffJ9qIyxf?=
 =?us-ascii?Q?7t+rk+Zg6R3spoK8uG5ZieYzbeCXgXAqgrnN08SzkKt3fUK1EXWlnegByD6j?=
 =?us-ascii?Q?rP22eLl1CEIVsQ0BIT92CqYpRMAoSBT1glxVv3QyzcjHp9wOxJsUirXLlcfM?=
 =?us-ascii?Q?hulVN+c+yPuGC5zA6xUik57NgirW+ltqyukSW+5tCy456mlk6qo8ipjz15yT?=
 =?us-ascii?Q?Uy8Y7r9FOPmE7HUy44LuuuM4cUcohNMpva5qcBX6HhsDtK/7n8z7S/m2Q8PK?=
 =?us-ascii?Q?5gJTbfP55WyuSiqoEyV1q87/f0Q7FlCtbQdh8tldRkrYYb5AZNHEF6LFnieL?=
 =?us-ascii?Q?whK5DK3eMxAGRED9ThkOe0+mELya0Kgd+FVGZWKpyN8JAnyc2kRCZkp1zgKh?=
 =?us-ascii?Q?WE3ZYGXKENFDaz+ZLIINq8depyCZOmP9qK6NTq26j8mJg/puYJ4Cotbe5/iH?=
 =?us-ascii?Q?dD9oSZKdSmY2LrJRFhZgsqQffDd9FBDg3VbMvzfLhbWE8iWNF0DDFjsbbkMl?=
 =?us-ascii?Q?ixjX3vD5nMwYakaYlBoMvVyH3idLYbGqleJelMTqUYDFwskZ5BP1bZJdjIIL?=
 =?us-ascii?Q?E6UkajfmnnC9TFh42EZzUT36kccP5wC5YW1SRD7qTZpYOCrJsT2S4DagidOy?=
 =?us-ascii?Q?+bUcDcMKhoi7cy6+lUN7ZGwfQ4pWgn4Dx66zYlLamQa/opBq7us5UvzVQLL3?=
 =?us-ascii?Q?ta/hkQvHaFesQt2xarGEXkRhfgh9wWhOGlvtDlb871qt64LP2JGJ2juTqMKc?=
 =?us-ascii?Q?uFVjNB7d3r9tojsOlGLOhA9w00pXmpAhDV4detS2bEoRzG9Lf/+pEzmKKQTu?=
 =?us-ascii?Q?WuXvpipljRiPA5fZOt86Z7gqVvzsEwaHvmsxIz0hSl09ryRgq7SL7zUgzGq7?=
 =?us-ascii?Q?dLeGovdwmEyC9APaHkq+yFsK8pYwr8bzH7/smjzwNGz7i2pQmIo7nqM6nUS2?=
 =?us-ascii?Q?07syEpJzhI/qtns2hKzq93hF54aFrmMpx6DyG7jAm+AyJwpx3P40OC7DdVHg?=
 =?us-ascii?Q?hjW1h/zX4qG9yUUsRNbf6xEvPKMYh0GysRR53AjCreI2JCXMHmcs3pK/RKlg?=
 =?us-ascii?Q?dbKPuVFo+pBVpmF/3djIyN5evr6OKqbhfmT0XqN6o6CEp3HdjrAzkezdUML/?=
 =?us-ascii?Q?pQ4PcRTtcOGJdZM7q1+vTU+i4D0C3CV8napI26/RfmyBAeRmE7KRPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ige8qEyXdTyo/6xOVwDh8I+FlSOubuZflK9/n3oU02CZkmR5E6vPrr4CDu3S?=
 =?us-ascii?Q?FbrrTL5pGOaJ6jo3f+4KOUItWoBiZuXHniF9Iq3UQ4UXgaX//1M+5sXPabAj?=
 =?us-ascii?Q?cGeEj+J3bG2phjRTBZUWOG//Rgx60rHC8f699Fj5b9GPkOZ2b+of1r/XDaIS?=
 =?us-ascii?Q?0wRp9NpkyTwPvP9ughzzjhc7dOhmQA/4A86jqbcx/ZS9UMmSEgIWSSqUraG+?=
 =?us-ascii?Q?XqD6u483I24bY0In0t1jYrkelHcO1gHoxIcK0hwPlaicEZqD14AhGbHjF+3+?=
 =?us-ascii?Q?Wyg+Yxuxd1y3PwhAAqMLZnxcmzTCg75beXzawtWA3iK3qZtKM5zt8ayVDMTe?=
 =?us-ascii?Q?YBWFasOZBWFdnG8fNuXNYLIYnjXJM69ATxuicQPqzBeHalE4wBXpCUBT1diG?=
 =?us-ascii?Q?/765FcIbKlUm2nPNMzGO6eDkQm8/OVlw6iaF20hxAZ9XwnsgP+r45WXqgcBl?=
 =?us-ascii?Q?bGZZrngSBtkdWr6SNLQHvKaUsK6mwpUxKPNncLCLb1sJJPm6oiw5HQjYcrfF?=
 =?us-ascii?Q?s9c6jQcGZdksQ59sY2MzoYJYLbiLCfh7snclnpa7wxSUE8HFIczTRYTneLhD?=
 =?us-ascii?Q?ou83KX011eR9DptPi9fNWjUkq6CSHzCGwSn5PTpzrLCxatUUpxpwhcH8REo5?=
 =?us-ascii?Q?n4sd0s5wrAdlpMKzRbt9mHNgfAComRCCCAhdlXztWKMyP87fp3MDvMi/tt9d?=
 =?us-ascii?Q?L4A1xsgZFGsGkFJ1Ut8TZZ7xxL+7P8vlGBpBpw1IXwuCk7dWzwR9SawdoIY2?=
 =?us-ascii?Q?vKTGHUcp5nfjPBVXybltFUmtfz+s7lQJkA2V9V8eZKxaIgoxTJQsBjuL0vZD?=
 =?us-ascii?Q?IZfvVIi3RVDPuPT5I/j7bUjErDu8Y4cI7U9EW7RZJco4YEvUenXX1RaAo2g6?=
 =?us-ascii?Q?pOVfMA1wBYtW4OUoJYiHn/H7nEoJjPjUBZewjq8AOHMRwhoGvyO8gGB7KPpM?=
 =?us-ascii?Q?lSVPowcz3Fd/Z5BAPOYQCKpXfjeUaKxXG6pmGKNGUMVZo+tN7LRX35m8ztq/?=
 =?us-ascii?Q?ZGlb8fojy+cCXIXbr2ImR96JkLmCYkeBlHf1bod6IAd1K7JBGZM8k0ueaoT3?=
 =?us-ascii?Q?S8N+BTBgZJFcJ56jUuJkTkYoVbs6a9qIVCTfmtaQwac6DOyWDAwCaFam/pxC?=
 =?us-ascii?Q?Qp5ddCT9jP1eyByBUhUFVcFTexmLdpCdYpbtqPcPaXhRnkiyZxweUiCglmmB?=
 =?us-ascii?Q?0UtUgtL8VLrFbIiXDSjo8+uXq48Rv2BQMt8WKc8QIH9fiThZVvPbqPPPz5QW?=
 =?us-ascii?Q?dDB+NyEyV5TyuLh96mqHGKtSOrvLvSwi489MBqDX/3MpIPZlA0NmNhVTtwgt?=
 =?us-ascii?Q?7S49MViaNyeOuQfki0cbv2LqluXa4ihwKMkEzDbTXwoz4FL9qPSICAyA7aj9?=
 =?us-ascii?Q?b2K6pDUMUR9zZZARbjkg2wykO77tUnGQVLm0gLzVIj9NNK5HFSEMDC9WfAM4?=
 =?us-ascii?Q?lwvFGh9XjL2GuBTd3BV47UQ1zrzC9AgMENG8Qvi08nvXhE0PbXgxCA72cyeU?=
 =?us-ascii?Q?W8OgA6lfYL15HfhimCNhWrweFjBkmzTjIBy3FAAsXp0z7Tq4ohgrtdf6ZwL6?=
 =?us-ascii?Q?WMg9/f0gCacCmAEzsUoOary2hrC3/AZzGsTNU+6KRsdAyVRIbsDlUKAOsvm9?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ugv1T4lYxwilC05NWq0B7Mha/Vvsf8Lze4Y5gz8A5uhUKfckQfBCOVQg3hawtXWleVObvMmws0caLJeZdEKzDJKcXlWR9aPSmTUF7IbFmOomxg/g5fL5l4tvsbbzxBUI89SfnGdisytxhIw0poVHWLKmkHFG04SmKSe5A2FuE47Cd87kgIAtu2aqr7KJelm5U3jZ8P3mEV4QaurcPf1c5z52ZlMlDdCK8bjw8zJJ/r4ZzDDUABQiS8CZG+iUd4zJD8HvpEOF5ICkEFtmBP0X1k2JpBiCSETskdzgzm6cfKZx2s1PmAyRVrLj+vkPfVwlN+Xf1I3jEyhCvPyfjbuzWGi+6C/YqcetehKNmDJq1H8ytRz0wHU9OJ2Nbx5Y30ZEVDFb9C0PUF4KOLGyMItVeTfI2Yoozkgd646RFdDxhtV2v+f3ZqTtbzzRhhHY93O0D+tCLL9LpxKzpqK7LsBavsYh23ZKN05068fdUsXF+IzaAlIodMcaURmGYjKkYPBzsJJmB20TD1uaMyFZkwMuMEruRM8OjI1110e9Hbd20oER2CVW5luUkh3tfZBfnrPmeBNCqdgpvqq3k+bhsWtureRsUqkJte3DX+eG9I+/VIY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa431486-76e9-45e7-e4c6-08de2ce73d03
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 12:28:00.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEmK9zeRNz+9oQb8yOgUyd8fJNCW/IZ1oHePkHyO0zzmzwJhHoKrYJVauhK8uPzo+xJeZ9n3HRQXR6ASnG6oXtwWmh8a8ePZ0CaUpHtUKy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511260101
X-Authority-Analysis: v=2.4 cv=QPJlhwLL c=1 sm=1 tr=0 ts=6926f255 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=pFyQfRViAAAA:8 a=mGtF36JwNE1Y1aFlrBIA:9
 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=oJz5jJLG1JtSoe7EL652:22 cc=ntf
 awl=host:12098
X-Proofpoint-GUID: qsTO1_xxts2WhJXx9YxtJXgs_I9waiX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEwMiBTYWx0ZWRfXybjj4kPYuy9e
 k7Sgg8AwqZt9FqnQpliKRx145Z5Ib8U27OIxFWuR6rxzJ8kn3g2boMq8yHJNq9dgD4vLurtcoa4
 8Japr+s5q7zmGdjYHquEtXHKwfx/A2i3bSqBLA1K684DfeawWJX5D5Q9zm7OKumFg0Ktw8P4Cou
 JFPuuPC39tO1viRCfaEbVT7E5KM5uX3QD+agbDUtb6MHPTaf/rVmYlw7wvDXJN+JuMna9uL5KFE
 0x2pH/mAiHjmbm9QksqwRHxVfXeaGW5Y4o9dwtWMrZd0ZGz3m77ByO5tP/2+e2OxYkkv1tjKMMs
 OLzp0QS1dzDYw2jkjkLQU+RyRuS4YIKUHyyRtAY0H8Dl2FMZ1SGVbon7XuNqRHdVCuxLOy3YPwa
 dUYPQ3cYGcRWiakAKn+pzXOjIpNsd3Qv1SI4wVBEeKAnSdMyXCs=
X-Proofpoint-ORIG-GUID: qsTO1_xxts2WhJXx9YxtJXgs_I9waiX1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_042836_381140_67B57B04 
X-CRM114-Status: GOOD (  26.31  )
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

On Wed, Nov 26, 2025 at 01:19:00PM +0100, David Hildenbrand (Red Hat) wrote:
> On 11/26/25 13:16, David Hildenbrand (Red Hat) wrote:
> > On 11/26/25 12:09, Ryan Roberts wrote:
> > > On 13/11/2025 01:45, Samuel Holland wrote:
> > > > Some platforms need to fix up the values when reading or writing page
> > > > tables. Because of this, the accessors must always be used; it is not
> > > > valid to simply dereference a pXX_t pointer.
> > > >
> > > > Fix all of the instances of this pattern in generic code, mostly by
> > > > applying the below coccinelle semantic patch, repeated for each page
> > > > table level. Some additional fixes were applied manually, mostly to
> > > > macros where type information is unavailable.
> > > >
> > > > In a few places, a `pte_t *` or `pmd_t *` is actually a pointer to a PTE
> > > > or PMDE value stored on the stack, not a pointer to a page table. In
> > > > those cases, it is not appropriate to use the accessors, because the
> > > > value is not globally visible, and any transformation from pXXp_get()
> > > > has already been applied. Those places are marked by naming the pointer
> > > > `ptentp` or `pmdvalp`, as opposed to `ptep` or `pmdp`.
> > > >
> > > > @@
> > > > pte_t *P;
> > > > expression E;
> > > > expression I;
> > > > @@
> > > > - P[I] = E
> > > > + set_pte(P + I, E)
> > > >
> > > > @@
> > > > pte_t *P;
> > > > expression E;
> > > > @@
> > > > (
> > > > - WRITE_ONCE(*P, E)
> > > > + set_pte(P, E)
> > > > |
> > > > - *P = E
> > > > + set_pte(P, E)
> > > > )
> > >
> > > There should absolutely never be any instances of core code directly setting an
> > > entry at any level. This *must* always go via the arch code helpers. Did you
> > > find any instances of this? If so, I would consider these bugs and suggest
> > > sending as a separate bugfix patch. Bad things could happen on arm64 because we
> > > may need to break a contiguous mapping, which would not happen if the value is
> > > set directly.
> > >
> > > >
> > > > @@
> > > > pte_t *P;
> > > > expression I;
> > > > @@
> > > > (
> > > >     &P[I]
> > > > |
> > > > - READ_ONCE(P[I])
> > > > + ptep_get(P + I)
> > > > |
> > > > - P[I]
> > > > + ptep_get(P + I)
> > > > )
> > > >
> > > > @@
> > > > pte_t *P;
> > > > @@
> > > > (
> > > > - READ_ONCE(*P)
> > > > + ptep_get(P)
> > > > |
> > > > - *P
> > > > + ptep_get(P)
> > > > )
> > >
> > > For reading the *PTE*, conversion over to ptep_get() should have already been
> > > done (I did this a few years back when implementing support for arm64 contiguous
> > > mappings). If you find any cases where direct dereference or READ_ONCE() is
> > > being done in generic code for PTE, then that's a bug and should also be sent as
> > > a separate patch.
> > >
> > > FYI, my experience was that Coccinelle didn't find everything when I was
> > > converting to ptep_get() - although it could have been that my Cochinelle skills
> > > were not up to scratch! I ended up using an additional method where I did a
> > > find/replace to convert "pte_t *" to "ptep_handle_t" and declared pte_handle_t
> > > as a void* which causes a compiler error on dereference. Then in a few key
> > > places I did a manual case from pte_handle_t to (pte_t *) and compiled allyesconfig.
> > >
> > > I'm assuming the above Cocchinelle template was also used for pmd_t, pud_t,
> > > p4d_t and pgd_t?
> > >
> > > >
> > > > Additionally, the following semantic patch was used to convert PMD and
> > > > PUD references inside struct vm_fault:
> > > >
> > > > @@
> > > > struct vm_fault vmf;
> > > > @@
> > > > (
> > > > - *vmf.pmd
> > > > + pmdp_get(vmf.pmd)
> > > > |
> > > > - *vmf.pud
> > > > + pudp_get(vmf.pud)
> > > > )
> > > >
> > > > @@
> > > > struct vm_fault *vmf;
> > > > @@
> > > > (
> > > > - *vmf->pmd
> > > > + pmdp_get(vmf->pmd)
> > > > |
> > > > - *vmf->pud
> > > > + pudp_get(vmf->pud)
> > > > )
> > > >
> > > >
> > > > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > > > ---
> > > > This commit covers some of the same changes as an existing series from
> > > > Anshuman Khandual[1]. Unlike that series, this commit is a purely
> > > > mechanical conversion to demonstrate the RISC-V changes, so it does not
> > > > insert local variables to avoid redundant calls to the accessors. A
> > > > manual conversion like in that series could improve performance.
> > > >
> > > > [1]: https://lore.kernel.org/linux-mm/20240917073117.1531207-1-anshuman.khandual@arm.com/
> > >
> > > Hi,
> > >
> > > I've just come across this patch and wanted to mention that we could also
> > > benefit from this improved absraction for some features we are looking at for
> > > arm64. As you mention, Anshuman had a go but hit some roadblocks.
> > >
> > > The main issue is that the compiler was unable to optimize away the READ_ONCE()s
> > > for the case where certain levels of the pgtable are folded. But it can optimize
> > > the plain C dereferences. There were complaints the the generated code for arm
> > > (32) and powerpc was significantly impacted due to having many more (redundant)
> > > loads.
> > >
> >
> > We do have mm_pmd_folded()/p4d_folded() etc, could that help to sort
> > this out internally?
> >
>
> Just stumbled over the reply from Christope:
>
> https://lkml.kernel.org/r/0019d675-ce3d-4a5c-89ed-f126c45145c9@kernel.org
>
> And wonder if we could handle that somehow directly in the pgdp_get() etc.

I find that kind of gross to be honest. Isn't the whole point of folding that we
don't have to think about it...

And we're now modifying how we do things for ppc32 specifically? Or are there
arches with fewer cobwebs on them that are actually impacted here?

Is it really necessary to do this?

And obv. that doesn't address the READ_ONCE() vs. not READ_ONCE() stuff, plus
then we have to do it for every arch no?

>
> --
> Cheers
>
> David

Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
