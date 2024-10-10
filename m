Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83290CF07C2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcqEBpIaqO8blQDinH5YTcjp+mTm8y5097ScGmkZtqo=; b=CCxCcAEHZh0llt
	NzMeKmdrBpNsPnPPOb7/sZ9Jxq5laycdStZ9hy8jmaJoftlv57EoofNMBe4Rtq+aNvqp5ip7a9iqQ
	ZlpZ+qYWPSjZ2W1sPWb5R/Wni1arKDfcXWe3ZOnjUBGfxaUAVmuz4J91AshRPeQQ6b489ES0cvsuw
	YhaQFNwa/oIYD1+OFH2fzEGqZVON/9bSYPuBhaCYNT/Dd7SagIc7HoTsgaJvYMUF7TrFa3u5MmpO0
	3Ij2R7qqHQAIy0HRDNOTe+o7TmBzWmA24Q/p6n9ivHXh0Ba7rq9sktxHScLnmbjJKCI3zk7ftevPE
	Bn1UfmpYfIrmSvDb0HjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syoMo-0000000BxEQ-0tXR;
	Thu, 10 Oct 2024 08:17:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syo1l-0000000Bszo-3jUO;
	Thu, 10 Oct 2024 07:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0yVn8tI3lyhXM3ZeiBQKCb5kXwilQgq2bp9dwcfLyYI=; b=o/zwFs4ROwIU/DA73He7O74q9t
	7n2B1ug4uN158r/Z1Y5Cdq7n/Pl9TxH64uiwa0GxZfUJ2GZMnOEH72Jl3UQyo9ZZzodMyoO6Wcunr
	YFblBcEKy1lEPGXoWTc62afofE7DYVEPxRSJkGauCBWVe0uZpXRa/lr9oTXXUnkmw5p/vyrSrzWY4
	Al++BbBakjVEcjaUhYaAgdHWjwTh2KsgPBwWA2p92N/6Ugje7thtbxv1tj4Jx2r8qhG2wrhfGmYV4
	buKUwsKMqxjgWSdKwiwRtispY9RuY0TUzNeRiaPdldFZHis1qkvMMq1nV0m1AYbKVBG3AhH9ICaF2
	3r4AtBzA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syo1a-00000005EFM-2QSv;
	Thu, 10 Oct 2024 07:56:01 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A7YT0q005037;
	Thu, 10 Oct 2024 07:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=pp1; bh=0
	yVn8tI3lyhXM3ZeiBQKCb5kXwilQgq2bp9dwcfLyYI=; b=Q5pjE1ERdXenpwSx9
	H+3tZabSr8DH7Beyxy8drvLqU3Ht7Ga5XyW6C2PTL3fPAuIoZz3HzJyiSMoG5gdj
	JjsNnDX89G4/TG2MQ2BW0D7oNe96JjJi5G8uZ9mB/IapFOPGaPI969vLuEtTw6gE
	D6w8jekAr6Nzp3HaTEja4FUr8tp1ftTFqMfyfMTZNpMqVCBoXY9zpXfp1OYNxpHv
	kbP2c54yz9Ep1Dqaj3eGZkuA+jhRxDx4QQwAhzA66Rkp22oRkrTbO5vLbuYRFTlL
	+Pd5u72MCl/j+dMSEbRW7gnpYCpEOaMHPSE7LD2eBuG5IA3bgsjtNp/LMzgsdAiG
	yYq+A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426anb82uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:55:18 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49A7tHik016153;
	Thu, 10 Oct 2024 07:55:17 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426anb82uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:55:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49A544L3013784;
	Thu, 10 Oct 2024 07:55:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 423fssen8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:55:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49A7tCoY59048420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 07:55:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC8702004B;
	Thu, 10 Oct 2024 07:55:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCECD2004E;
	Thu, 10 Oct 2024 07:55:11 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Oct 2024 07:55:11 +0000 (GMT)
Date: Thu, 10 Oct 2024 09:55:10 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Russell King <linux@armlinux.org.uk>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 28/28] vdso: Rename struct arch_vdso_data to
 arch_vdso_time_data
Message-ID: <20241010075510.6997-C-hca@linux.ibm.com>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-28-b64f0842d512@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010-vdso-generic-base-v1-28-b64f0842d512@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: txKjIm6oMyh-bYlrWVbJ8zIUfT6c90P5
X-Proofpoint-GUID: EzJFZF0xHPJktynCv2z269EPy5OXcKam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_04,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=644 priorityscore=1501
 clxscore=1011 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_085559_683589_AA0EC1DB 
X-CRM114-Status: GOOD (  15.85  )
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

On Thu, Oct 10, 2024 at 09:01:30AM +0200, Thomas Wei=DFschuh wrote:
> From: Nam Cao <namcao@linutronix.de>
> =

> The struct arch_vdso_data is only about vdso time data. So rename it to
> arch_vdso_time_data to make it obvious.
> Non time-related data will be migrated out of these structs soon.
> =

> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  arch/Kconfig                                        |  2 +-
>  arch/riscv/Kconfig                                  |  2 +-
>  arch/riscv/include/asm/vdso/{data.h =3D> time_data.h} |  8 ++++----
>  arch/riscv/kernel/sys_hwprobe.c                     |  2 +-
>  arch/riscv/kernel/vdso/hwprobe.c                    |  4 ++--
>  arch/s390/Kconfig                                   |  2 +-
>  arch/s390/include/asm/vdso/data.h                   | 12 ------------
>  arch/s390/include/asm/vdso/time_data.h              | 12 ++++++++++++
>  include/vdso/datapage.h                             |  8 ++++----
>  9 files changed, 26 insertions(+), 26 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
