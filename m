Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E703D6E2BF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJjOBg2BddU7AOeGtufRZyyOw04nOWrzR9dYjARyuvQ=; b=MeS1LIKNQ2WI6j
	4jDlapb4veNDsO+g4SCRMjqlFd7DxdP7zxLgIx0GS0kOJORHFE3U6a4z42XhhOh/wrpYvNU6bksrD
	9UwZWIYF6Z1oaXpoAbAkDedvMa/6bOlnOiHK7FDkkINJz6vBQVoD93BzxtCBvpCLUdVH/fzkOgwlb
	QZvbp2F1RUvDgH1pVlF21V+bx6FbA7CgHnyBGje4S4n+l8UJV5DiEhb5nAQ2Zp4KO5ast4tj1/KP3
	v7zTVY5BzR6eilcGxV4yF5khmM+TuaAjpH7MNZw/ajE1CElQ1JKgguY01qGp4TO4opG5yKfEA43Ob
	d1Hup/W9e9gGd/lE0A0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWHn3-00000008vD3-077u;
	Thu, 18 Dec 2025 17:27:49 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWHmz-00000008vCa-2Vzs
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 17:27:48 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDDPRs1418263;
	Thu, 18 Dec 2025 17:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AZS8J0mU0H3h/wmdVdP8YGmGc6uPcNT9bOAIfD56E30=; b=
	ghu6QbbWf5JhfwFkqHxrBaSvGaG+Cixsrfd9+RseTc1TcbjiZ98UHndoVCfXRj2i
	GWUmt48ku+ER1W7xQAE7Wjr/z3ArOaqKhwyDZ+tUqeTKz0+CoHXVcAsZEboHu5WJ
	loAGVMNOGYERmk/S7MteyZjliwJO7yBmGvvaBQBLYv9ht1kXxSM+al8xVn0n/Vkl
	R4DMdYHg5YiLDDyAMQiii/qpgg7enKGydOT8VMNSA3Zd+Zyxdavs9p0TaTF/UQNh
	Ohw/Afe+eTOSkh7u87/64vkGxO0LnsLqVRd9QM2QuK4d08WyBQKkniKSbbEk3E+Q
	TMnJ+bohqIbpH+OLCcky9Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b47vws41u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 17:27:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIH966Z024739;
	Thu, 18 Dec 2025 17:27:18 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkd5rgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 17:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNn2SEiSlMl1S7cc/Vz7g8U7FGdHVjXt1HbRxTPJn5ZhmsgMTbyBbJKy8zW+dq2ScZFWopHALJARnh5PxDtG7ewmRL69bvKDK12oiJDS6M4USd12eIQhDa1IqdDUkYWxOpL7McKvwqMoivRnEyO7HBPL7o5bz2WlTdHiwVUHKDOELF0kNpIRtsRKwrQ+PbS1+XIobNAND3ywGp5gEvosztyGA7CMJtigzRYWp7gJ/2mSMLh39NCikZFFrXSIuwRQ3WGcLsyr8pRq6fFSTA2LHrGxF16x72EIHgGzd9jnh2v2rnHSi6FptJrhCx+TE5pvFPFcZrNkwxE+nQ3ko5idWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nHNFnGpIC6UKQsCyHgQnepMejrYpxJEur5lXl4Y9rs=;
 b=RPSixblMF27D+cPqANbAMGC8CaFD2y0ACsH+T8w1Pw4vNqoi7C0uceGAG6tkTo/LsU88qn80OJ480kGhrBH24B0g6wNqItssk316qAVbldipKUtsJvv/P8WEGuStDgZ0YE+45luYCEwPzST8LNJM9pBGwAYvhpsiKK9LvD/DWvRPdF9P7BB2w0od89tpLXxcEuKgkv8DgQiD2dB9cE25hyiFtnB9ZqKTFVUdOQQLhQTJwH0vvjGBRQ2a6z8nZrWH+wXbqlfEXnVBgwkS0UfPzPy8znT8y/2/tAw9KRfvpYVoxCtRudRLqX69Y12/yS2yn61S8elzpPoAymailvjkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nHNFnGpIC6UKQsCyHgQnepMejrYpxJEur5lXl4Y9rs=;
 b=MnOQZbhb3DFvm6GsC++XAzS1rM4KxRPwuz/a+b+xmIG1480jwSEycasd8QacmSdwtud0NETe22M5rQHh7vqIefaHo9kv3U80ixeBGjeFpV6r7hu7ybuqTRza8TRfjwhvgOGOwwXMoPf1h2d9/TwMVemprsIGLD0bZOYVuAO6q+c=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Thu, 18 Dec 2025 17:27:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 17:27:13 +0000
Date: Thu, 18 Dec 2025 17:27:13 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
        "David Hildenbrand (Red Hat)" <david@kernel.org>,
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
        "Liam R . Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH v3 08/22] mm: Allow page table accessors to be
 non-idempotent
Message-ID: <bc637516-d013-4f3b-b1a8-33bc1d9f52d1@lucifer.local>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-9-samuel.holland@sifive.com>
 <fbfef7fc-4030-462b-b514-498eea6620aa@arm.com>
 <c2597d43-d909-4259-bb5b-9294e4069385@kernel.org>
 <af8fd275-a34d-4b2f-8834-9c85dab2bbae@sifive.com>
 <a063f6c5-2785-4a9f-8079-25edb3e54cef@arm.com>
 <9eda3825-64bf-47d9-ab4a-0a536b2d6474@lucifer.local>
 <7b6a203f-a141-45f7-8a09-a2266e125d22@arm.com>
Content-Disposition: inline
In-Reply-To: <7b6a203f-a141-45f7-8a09-a2266e125d22@arm.com>
X-ClientProxiedBy: LO4P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 038e5747-0513-43d4-d2c3-08de3e5aae90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8YSRDCsH4j335ElN0Ib33hqTEdfWsZHmCQsejPVpSFTi21AREXsR2LVXVv?=
 =?iso-8859-1?Q?qGQn2iwJlXs3qsBGDzqk9Vbkhm5USRjDPfyqKSgigv49gyAjueQYMApGPt?=
 =?iso-8859-1?Q?qNoDTVZg8i+mr64oTL2SwbGMrwAhgPZc+GJbJodVEHMrN6njo/MwH8P2qH?=
 =?iso-8859-1?Q?hiTNtqWbIRLeiBjUrbteF2swNzHFxZx4R/5fHUsanZXvEzmUW6c7JcNKQK?=
 =?iso-8859-1?Q?l/rzkim2dtlp3YRrd876m+dRq71UN89qJu6Nc5YS08aW+pq4zVW99bKNjU?=
 =?iso-8859-1?Q?aip2uU6YgOnvyzmfUnWb6lVmmL5P36EtxzxsKfxLuP/1J1TU2d74JP+tjo?=
 =?iso-8859-1?Q?Xx4NovwpsN9q0PKl8Fcsk4J+hpDkjaYZgz6gZiDmSKFjfQPueoGDMVM6Gh?=
 =?iso-8859-1?Q?CgvugqfULfPTeU5etrPFMNDNBBNujzxTlr1t06pPiuzGtIeNOj00zI4XPT?=
 =?iso-8859-1?Q?PGvvKud34JGY9hSHa+wx13w6UeC5EUh1wVA3PTp7yfTU8+ypvP5LKOmoNU?=
 =?iso-8859-1?Q?WT13ZHr1JRpi/hZNhYqFJFaEpdwdKcN7q0iZLCU6C7Ptrsptt7KSceOeAq?=
 =?iso-8859-1?Q?rgdTNlJreGZX0YnWRIB8K7RPMKk7YdH+ub5uR7pxUIMeKMCtP0BAcjaWJ0?=
 =?iso-8859-1?Q?7mzb0X9kHVrUjZGdzMpCHKPiKujernkyh2ZJirh/X6ybamFHzupZHdks11?=
 =?iso-8859-1?Q?+gAGuoDmCpGGgyisZ2t6xZDRMhqlIvkAkfb4ygRot35cHTldVMSjygfLWg?=
 =?iso-8859-1?Q?k7wy4MaGdOtj++Mo7gaOjPuNgwUwGwemqApw35MqC99loKRq7eR9Ntb7FH?=
 =?iso-8859-1?Q?g9alD/Er15Fh0ysCqTfm89ine6QkCq4QuL8u+xY6xbTmlrjgYStLmk7osh?=
 =?iso-8859-1?Q?MWdGbAtDWTaDhe0lky2F26mK/k0WYJ1o2b5xvjzpJ5R8xWJ4+t5x298kia?=
 =?iso-8859-1?Q?18nqFe7ovL82kP/2JdEnpFefp+Hdsu31DHezx9qpDFYPSxnUn+rW+cGl6l?=
 =?iso-8859-1?Q?NY2Ygz7YdvZu8knUy2rvQ7gmxPdg0BXuSeaMK3fip/lB4mZCUlVW1xCIlt?=
 =?iso-8859-1?Q?o5dh4Co0GtlLmIhCmg8Ux8rdDBON3xoYs+m7a66T9E6mELU9LZgn+TMEOu?=
 =?iso-8859-1?Q?ykTEdkdbU/hXjyVaTCH9ulkqC4oSAWsDIOS8VWpZqamyVBwH8lAzJigMDd?=
 =?iso-8859-1?Q?Vd1YnNlm3H5Q4XW5lpZ4Zf1ebVM1y/YlpojMjGlCrUTpwf6bVScePoGpUp?=
 =?iso-8859-1?Q?BQ/6LGrMtgj9VnLRj3nvDB4ycCnn2PYrNJ/yoDHLguBTf3jfe9i7TZvaxx?=
 =?iso-8859-1?Q?ihAXUMmKng5CFbh3HHJFrrBfDpQ8rm+qJWa5iVrp24lYalrKGGieZIAHi9?=
 =?iso-8859-1?Q?0QfM4JZtiI32OYhMaA8MYAIOvIFXx1edi29v2RMvlhvJa/EnLKKSqd6Ump?=
 =?iso-8859-1?Q?zUT5aLPWEfIfmik60L4vEqWOLsZzAXyohqAwLK1G6jMHhft4Qx36BdeLXp?=
 =?iso-8859-1?Q?egHZOsmfUi0QQ5DWzQ4gCp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XYCKznrMhjp3tisKbdK4vmKu9MPx+n4sr4n4R9o6GiixI17k856eCYFY8Y?=
 =?iso-8859-1?Q?Mfb9ljlHvvkcr+952tK7Xl0fJP1vKltt8Hx2ReHTeaKtbzpWsQjHY+dRCu?=
 =?iso-8859-1?Q?ue275DfET2U8GpNoz/Ns/C/exSYgDgBjMVz0Wrdz/rWuDuJ6RUiYVue5Je?=
 =?iso-8859-1?Q?N61janE6QlvF8Up0oqK8gibp+G7+B5P2uUGh7tbgjHhfTNSEpkpXW7dCX9?=
 =?iso-8859-1?Q?xn5/pNA20FNRmbJaffxk+VRgcDly5wM4zuZ0q7zmsSNetdb4X8dhWUtRon?=
 =?iso-8859-1?Q?epWkiheoe5ljIyz0sONvfWRcTk2E9pz0jl2NIdlHj6MjWQzsnuQPdACFfm?=
 =?iso-8859-1?Q?h+NrrzmtDmQJxq1K0W+YzjflxHdsl9lkNxE4x0pD7uKt2Vo+mLNrSgQ8pJ?=
 =?iso-8859-1?Q?ZmKABNzW/fE5uD5Rwp210LgGp6zgnsiDlyvcG8uZvdwz7LXx8ByCtdKZl1?=
 =?iso-8859-1?Q?vCMuvmcru6jnfd1UdTcKj6k8HNHP/Adx03hs6WcB0E7HfHWigUBrMFFF2i?=
 =?iso-8859-1?Q?W+eSuMyrVPKyDvX0QZPC9B1lzOIh9aYtmOuH6jkLERKx6BDkpdn6yGB+EI?=
 =?iso-8859-1?Q?6qZ8V5TXRb/xW04hHkVmBm5qs28qXHuIW8TYkwtzWT5TuoxmGVeb+nW4gW?=
 =?iso-8859-1?Q?7WG/HhlmPUR+HViZYSCK/74e0fQ31IE8N3yMCxJAp33+7ON+CKFcX7rFcf?=
 =?iso-8859-1?Q?eB/xt5jYrfIBzDYudNCYoQ6aSVIyXcZgrWXRGSxLGEZMwxfTqrIwnqobSr?=
 =?iso-8859-1?Q?YrgNWKv9LiGOzS76wXoB62nN+jgC1OVTUIX1KSH0RzKjb8ScvI0HY6+5r+?=
 =?iso-8859-1?Q?k1Ce+Q5kHAYJdrZT198aHgDdS0iR/PBf47RIFWEntzox4voMSguUme8IzH?=
 =?iso-8859-1?Q?eHThgp7pRolaz6G6CfLRzH7SPm3gQ/pKYb3++8mUiMIcyo2NiFdnse1tuD?=
 =?iso-8859-1?Q?DsUxvT2rVwlvJb5biWFzDUA6ztmsIWH6eVpg1IwMklZQDzWJEcocGj2kmE?=
 =?iso-8859-1?Q?9ZFebH493B+ZrZpqMszznCDuhCLRXA6p12iqu++K9ELYvpO4PBhuZLBWAS?=
 =?iso-8859-1?Q?K+FokTdep/CsBtzjYjiVsUBxk81CaUlpDrVchfdxr7ji561C+16Pk1ackN?=
 =?iso-8859-1?Q?dB1RWBJ/SFwC8o/TNaqc5GhiZ9IyUoTZMgIrdCKaB9UAo7IyCUN8/Eo8ev?=
 =?iso-8859-1?Q?QXTHW3xLyu19IGIrYRzlwaLFCwlAxbJ0aGVJBXwrlSY8CCDJQpz6x9bDIE?=
 =?iso-8859-1?Q?wjKRcz2hjBOadRXRELtVKPV022W2JyKPKivEn93viiU2lTJJ1uqfwjMVT5?=
 =?iso-8859-1?Q?uNTQomf8VGl7wCrlk4v9wUszz/beGLp8QdNaiioV2et/20WGF1zxo87w/f?=
 =?iso-8859-1?Q?SZH0DMs66z6vns0NaNvwVxsdv1Hedztn8m9NJQ4QPFygjuhClQambYgtBH?=
 =?iso-8859-1?Q?M7PfZzmi7eMu63HKmBsGoTy5UHab36P6pnhy2/Uap3fiz1RGRd+aLpV340?=
 =?iso-8859-1?Q?Gau6zFID0bXOc3RqOKGAZ24sGvbae+lOEQqpmzE9hwnS2De6zkXmrMyxdX?=
 =?iso-8859-1?Q?GYTk5f4lUpwm1Wepw6cY92yXQGvS3QzAx0LTTFkg9wBv9IhQeVubYllw6U?=
 =?iso-8859-1?Q?I3UjguzKuiDHkN8yGB01p3G5iv6mrFKWUcXCTLZLmn0Rtt68Pnzo5FJQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eu2N3m4ETecYhLPh7i5mMjsVswOHMH08k2u/SOc/ViLEpFn+tjgBBo/vbqpWjmDQl+5OlQuSlsi93z5BzXFXijOvYMFU+jgrxePx2RpftPhT/Vut/epGhqtEnlK9Peh4RTGvvFTZY7QreB7meKXIrI5HabrBZx9KtkOwjCkV4dVPfXgDLrftCX4NjsZrK8pPBEPMiPFPYAHs1csmOEScxhIWe43e/pqTDfc5CCp1b7L34HLsDR2Q/XDG9Q5HWFEvSBuXGw+nFlxqzFTt1fBLpuXWW27pdKt1gwrOb/c6o6Aus9kJVY9SvdvEvW/vWm/mDB4P0PzgciCQLKAFgvb7CHSPEIf2XthbX4QZjQOHaopELw9rjSwP9SHejLc4nksfNkKGxhjDW7F4lKtcaYQhZCZOYkwGP/mgwnRAyx52evue4rCjCMoD8XMsIAFmnr/eNwNEJcBTRh6lNbx0hUyAFDJecR042e6S1SAtXePG70thTCGJbu7PREFiv0A3Dlc0PV3Wj1ZDa/GfBhELz+CVpTvp0IBbFKUi1r3fX1lsM89OQCPxMkgLpASefEHolCO7Ox8FID3XWJ/rEgjng0lvNASgqDEKC8BTJrjxbtL0N04=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 038e5747-0513-43d4-d2c3-08de3e5aae90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 17:27:13.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aLgZH22lzLl+1iADz6uVqlP8DoA4qZsVPKvZHIdSEhHYlpaxqruyNA9pWEAXmVN47V8RWjGTOWW5iEsZAWcPqd8YxUu542xSs+V4vihV7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180143
X-Proofpoint-GUID: AJEiS3OswUmY7_h1--MbIRlTDvMQOuqG
X-Proofpoint-ORIG-GUID: AJEiS3OswUmY7_h1--MbIRlTDvMQOuqG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE0NCBTYWx0ZWRfXzPba7ukQoYDa
 tUj7AXN6ZzaJXXe+cQZnuZxF8bHSUEtsVlcI68LqG1IRSsWtUscBbLUuCUpSSmvQt7WxQ1zXVfo
 M9d+zS9gnm5XBqQhkNR8/aK6UDyPJPEuo4ACJ6u1ZKP0o/XJ2NzS9pL+yEBP1kjxQm2pM5ZiWPO
 Jt9xpPUIqeed0xPKV0O106U5PObUX/cNboFC3E2sxytvdlEpRZSGdAIdDJM33zjtHPHq29xWzvZ
 IpqZBSF8R6gbgXn8NbyMFgLyqrx652qZKqfI9pGH6Lq5Gbibfiv2Vaeal6UiB55Ak00+8i5nKSo
 Ix55VezCEKHB+aRpr2RVDNGJrPfRu0Jb1U1lyWD+xwjpzL6uog0emhAR52Vt+w1kSPO5qjm8Kl4
 XMQTLqYHtxOi2X6LZt3KH6de6Nh3wQ==
X-Authority-Analysis: v=2.4 cv=PpGergM3 c=1 sm=1 tr=0 ts=69443976 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=h24hY16prsOVtH9eonwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_092745_656058_D44BC107 
X-CRM114-Status: GOOD (  26.33  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 16, 2025 at 05:46:57PM +0000, Ryan Roberts wrote:
> On 16/12/2025 10:29, Lorenzo Stoakes wrote:
> > On Thu, Dec 11, 2025 at 01:59:53PM +0000, Ryan Roberts wrote:
> >> On 11/12/2025 00:33, Samuel Holland wrote:
> >>> On 2025-11-28 2:47 AM, David Hildenbrand (Red Hat) wrote:
> >>>> On 11/27/25 17:57, Ryan Roberts wrote:
> >>>>> On 13/11/2025 01:45, Samuel Holland wrote:
> >>>>>> Currently, some functions such as pte_offset_map() are passed both
> >>>>>> pointers to hardware page tables, and pointers to previously-read =
PMD
> >>>>>> entries on the stack. To ensure correctness in the first case, the=
se
> >>>>>> functions must use the page table accessor function (pmdp_get()) to
> >>>>>> dereference the supplied pointer. However, this means pmdp_get() is
> >>>>>> called twice in the second case. This double call must be avoided =
if
> >>>>>> pmdp_get() applies some non-idempotent transformation to the value.
> >>>>>>
> >>>>>> Avoid the double transformation by calling set_pmd() on the stack
> >>>>>> variables where necessary to keep set_pmd()/pmdp_get() calls balan=
ced.
> >>>>>
> >>>>> I don't think this is a good solution.
> >>>>
> >>>> Agreed,
> >>>>
> >>>> =A0=A0=A0=A0set_pmd(&pmd, pmd);
> >>>>
> >>>> is rather horrible.
> >>> I agree that this patch is ugly. The only way I see to avoid code lik=
e this is
> >>> to refactor (or duplicate) the functions so no function takes pointer=
s to both
> >>> hardware page tables and on-stack page table entries. Is that sort of
> >>> refactoring the right direction to go for v4?
> >>
> >> From a quick look at the code, I think that some cases are solvable by
> >> refactoring to pass the value instead of the pointer, and leave it to =
the higher
> >> level decide how to read the value from the pointer - it knows if it i=
s pointing
> >> to HW pgtable or if it's a (e.g) stack value.
> >>
> >> But the more I look at the code, the more instances I find where point=
ers to
> >> stack variables are being passed to arch pgtable helpers as if they ar=
e HW
> >> pgtable entry pointers. (Mainly pmd level).
> >
> > Ugh. We do need to nip this in the bud I think!
> >
> >>
> >> I wonder if we need to bite the bullet and explicitly separate the typ=
es? At
> >> each level, we have:
> >>
> >>  1. page table entry value
> >>  2. pointer to page table entry _value_ (e.g. pointer to pXX_t on stac=
k)
> >>  3. pointer to page table entry in HW pgtable
> >>
> >> Today, 1 is represented by pte_t, pmd_t, etc. 2 and 3 are represented =
by the
> >> same type; pte_t*, pmd_t*, etc.
> >>
> >> If we create a new type for 3, it will both document and enforce when =
type 2 or
> >> type 3 is required.
> >>
> >> e.g:
> >>
> >> // pte_t: defined by arch.
> >> typedef unsigned long pte_t;
> >>
> >> // ptep_t: new opaque type that can't be dereferenced.
> >> struct __ptep_t;
> >> typedef struct __ptep_t *ptep_t;
> >>
> >> // getter/setter responsible for cast & deref as appropriate.
> >> pte_t ptep_get(ptep_t ptep)
> >> {
> >> 	return READ_ONCE(*(pte_t *)ptep);
> >> }
> >
> > I think we've got ourselves in a jumble with pte vs ptep vs pteval
> > vs. etc. etc. and we aren't always consistent with it.
> >
> > So I think we ought to put 'hw' somewhere in the name.
>
> Yeah that would probably give the best end result. I was thinking that pt=
ep/pXdp
> might reduce churn since we already use it in function names. Stack point=
ers are
> definitely a small minority so easier to change their convention.
>
> But having an explicit "hw" would probably be best.

Yeah, unfortunately I think the existing inconsistencies call for a clean
break.

>
> >
> > And we can also now get away from the overly abbreviated names given we=
 have the
> > chance :)
> >
> > So something like 'pte_hw_t' perhaps?
>
> sounds good. Or hw_pte_t? Then "pte_t" is still greppable and it better m=
atches
> the hw_pte_get() that you have below.

Sure hw_pte_t works!

>
> >
> > I like the general concept, though I think it's kinda gross to hide the=
 fact
> > that it's a pointer in the typedef _that_ directly.
>
> My aim was to have a type that you can't dereference, can't accidentally =
pass as
> a pte_t* and also can't increment/decrement/index.

Right.

>
> This gives us a framework where the architecture can completely virtualiz=
e the
> pgtable if it likes; and the compiler can enforce that higher level code =
can't
> accidentally work around it.

Yeah it's nice to be able to hide properties like this, I did think the use
of an incomplete type pointer was quite nice there :)

>
> I have a couple of use cases where these properties will come in handy; a=
rm64
> now defines 128-bit pgtables. We have a prototype adding it to the kernel=
, but
> at the moment it has to be a compile time descision so that all the gener=
ic code
> knows the size of the entries. It would be preferable to make it a boot t=
ime
> decision, based on the HW capabilities (or cmdline, ...). But for that, w=
e need
> to better insulate the physical pgtables from the core-mm. This concept s=
olves that.

NIce.

>
> >
> > So perhaps be less horrid if it was something like:
> >
> > typedef struct {
> > 	pte_t *ptr;
> > } pte_hw_t;
> >
> > Perhaps?
>
> I _think_ that works for the above, and it is certainly nicer.
>
> pte_hw_t pte_table =3D pte_alloc(...);
> for (i =3D 0; i < PTRS_PER_PTE; i++)
> 	hw_pte_get(pte_table[i]);
>
> I think that would fail to compile, right? Which is what we want. Instead=
 we
> need something like:

Yeah that wouldn't work of course.

But wouldn't it also not work if you had an opaque type? As you'd then be
dereferencing it? So it'd be something to solve for either approach right?

(An aside - this brings me back to the whole thing of differentiating
between page _tables_ and _entries_, another thing we do badly at.)

>
> pte_hw_t hwpte =3D pte_alloc(...);
> for (i =3D 0; i < PTRS_PER_PTE; i++, hwpte =3D hw_pte_next(hwpte))
> 	hw_pte_get(hwpte);
>
> >
> > Then could have:
> >
> > pte_t hw_pte_get(pte_hw_t pte_hw)
> > {
> > 	return READ_ONCE(*pte_hw.ptr);
> > }
> >

Yeah could do something like that.

It might actually be nice to abstract the iterator-like behaviour too to
the arch for e.g. your 128-bit entry stuff?

> >>
> >> int do_stuff(void)
> >> {
> >> 	// value on stack: ok
> >> 	pte_t mypte;
> >>
> >> 	// pointer to value on stack: ok
> >> 	pte_t *pmypte =3D &mypte;
> >>
> >> 	// handle to entry on stack: not allowed by compiler!
> >> 	ptep_t myptep =3D &mypte;
> >>
> >> 	// handle to entry in pgtable: ok
> >> 	ptep_t myptep =3D pte_offset_kernel(...);
> >>
> >> 	// read value of pgtable entry: ok
> >> 	pte_t val =3D ptep_get(myptep);
> >>
> >> 	// attempt to pass pointer to stack variable: not allowed by compiler!
> >> 	pte_t val =3D ptep_get(&mypte);
> >>
> >> 	// attempt to directly dereference ptep: not allowed by compiler!
> >> 	pte_t val =3D *myptep;
> >> }
> >>
> >>
> >> We could do this incrementally by initially typedefing ptep_t to be:
> >> typedef pte_t *ptep_t;
> >
> > Hm yeah still hate the idea of typedef'ing this as a ptr so directly.
>
> What's the problem with it?

It's the fact you are making what looks like not-a-pointer into a pointer.

It's even more egregious for the non-opaque default thing of typedef pte_t
*hw_pte_t - as then you truly are just making hw_pte_t not look like a
pointer but behave like one.


>
> >
> > Obviously this would make an incremental thing a little harder, but cou=
ld have
> > this stuff on top of existing logic and make it incremental by changing=
 logic
> > bit-by-bit?
>
> I'm not sure... sounds to me like we would need to convert absolutely eve=
rything
> including arches that are difficult for most people to test. With the "ty=
pedef
> pte_t *hw_pte_t;" approach, you can go bit-by-bit and leave those unloved=
 arches
> alone entirely.

Couldn't we have a generic thing for arches that don't yet use the type
potentially? Might be a pain.

>
> >
> >>
> >> Then we could flip the switch arch-by-arch to enable the stronger chec=
king. We
> >> likely wouldn't need to convert arches that don't care.
> >>
> >> I think by doing this, it will expose all the current issues and force=
 us to fix
> >> them properly.
> >
> > Yeah this is nice.
> >
> >>
> >> On the related subject of conversion to pXXp_get(); I've been looking =
into this
> >> and personally, I think we should have 2 helper flavours at each level:
> >>
> >>  - pXXd_get()      optimizable by compiler; defaults to C dereference
> >>  - pXXd_get_once() single-copy-atomic and unmovable by compiler
> >
> > Yes!
> >
> > There is some _real_ confusion about when and when we don't need to do =
this.
>
> I think the requirements are basically this:
>
> "_ONCE" gives 2 properties; single-copy-atomicity and compiler can't move=
/remove
> instructions.
>
> SCA is important to prevent tearing if the HW can update the PTE concurre=
ntly
> with SW reading it (i.e. HW access/dirty) or if SW is reading without hol=
ding
> the PTL. But there are times when it doesn't matter if the PTE gets torn =
because
> you are only comparing the result using pte_none() or pte_same().
>
> The "compiler can't move/remove" property (I'm sure there is a formal nam=
e for
> this?) is important for lockless walkers. Probably you could achieve simi=
lar
> results by using barrier()?

OK makes sense.

>
> >
> > Though wouldn't having a typdef separating out a hw entry imply that hw=
 entry ->
> > get once, sw entry -> get?
>
> No; you should never use the accessor methods for sw entries - they are j=
ust
> variables - read them normally. If all HW accesses use "once", then the c=
ompiler
> can't optimize away the accesses for the folded pgtable case.

Right, yes makes sense.

>
> >
> >>
> >> It simplifies the converstion process, and reduces the risk of bugs
> >> significantly (go read about the arm32 issues discussed in Anshuman's =
series if
> >> you haven't done already).
> >
> > Though I haven't read this series so can't remember actually if there w=
ere cases
> > where even with hw entries we wanted to sometimes READ_ONCE() and somet=
imes not?
>
> Yes exactly that.

Yeah I guess based on whether the properties desired match the above or
not.

>
> >
> >>
> >> I appreciate this is all probably a lot more work than you would prefe=
r to sign
> >> up for, I'd be happy to collaborate if we get concensus that this appr=
oach makes
> >> sense. What do you think?
> >>
> >> Thanks,
> >> Ryan
> >>
> >
> > Thanks for this concept, overall very much in agreement!
>
> I think it would work but it's going to be a lot of churn. But if you thi=
nk it's
> worth it and we'll be able to get it in, then I'm up for working on it in=
 the
> background.

Well I am never averse to churn :)

I think at this point we have so much of a confusing mess of things going
on in the page table logic that it makes sense to pay the churn price for t=
his.

>
> >
> > Cheers, Lorenzo
>

Thanks for looking into this,

Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
