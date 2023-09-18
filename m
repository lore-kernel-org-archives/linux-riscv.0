Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DA2CD13D2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewwk1EedKmo7S0OsXCPlgODOD2wFLlL9eAVZIBXKO0c=; b=zG+KoYLfAe/7DD
	3RP+kAPj40ceazUhHwThKp9Xi/ZmIMhrK0HxbHpiunxWsBbBhzMA7yUjdNTOGqTExHGyzTWdrRqgG
	AOs7ClUGKORiNtMsVkyQW6xaYQSd8gq0lByFFvBVi3+KLwcxcocVD5obyXij7xorOa4OSME2zUEP4
	4AACpMCOp4bJl+xeby6w76G8Z1tOlu0ZNi55ezUkDFMnVyi4hhh41reXBKLT8lkKXALZfnGbV5/Mn
	DM+oOUz4ME3jujucWb+q/vQei2K5Urk9rVw88PpiMYzUJ936v81CThhJRGFOHSBYUT6EqQ45++vjX
	qON3Rvpfo8+eNmKf2SKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiETh-00FaMm-20;
	Mon, 18 Sep 2023 13:39:53 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiETd-00FaKu-0S;
	Mon, 18 Sep 2023 13:39:50 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38ID7m8K022184;
	Mon, 18 Sep 2023 13:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=uFeVU8GBdED+6wySKC1QfNlfLSeapRp6zibRkLvoEAg=;
 b=EUgSQDYEXZESVbmvkEiNuTPHwixQI0U9Ur8KrwnxnMW2rt/Omu+WNYY+LSeIucK5gSnp
 S46UxA82HvBTG79IhgqPc3bJWagb2EQrV6N6sBiCAQfeDqMb1/IRaAevgqWYUEmNprJM
 CoQge9/E6BjJJexoJEcwD8pFZZH5lUVqkDK+rtX6/jOGGKyAGgZxTW7kCP7IloKLULSA
 uLF9aW9go5BJnf502MEDdq0h/x/9yJ4/9antoFKqhJIdLC0b7ZLwyR3kUrL4qzyRBTUl
 434+oSex3Z32l1kYQ/R9tHJdVDFCiMdI6l9ljlLNe7B8KabkWYR0oTSwNKAaxenA0HxS mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t6p46325r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 13:39:09 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38IDVHPH027141;
	Mon, 18 Sep 2023 13:39:08 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t6p46325b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 13:39:08 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38ICo7GK031259;
	Mon, 18 Sep 2023 13:39:07 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t5r6kayvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 13:39:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38IDd36h20185604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Sep 2023 13:39:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF04D20040;
	Mon, 18 Sep 2023 13:39:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04E452004B;
	Mon, 18 Sep 2023 13:39:03 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.66])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 18 Sep 2023 13:39:02 +0000 (GMT)
Date: Mon, 18 Sep 2023 15:38:35 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael
 Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul
 Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav
 Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de
 Melo <acme@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tony Krowiak
 <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne
 <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Alex
 Williamson <alex.williamson@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Anish
 Ghulati <aghulati@google.com>,
        Venkatesh Srinivas
 <venkateshs@chromium.org>,
        Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 10/26] KVM: s390: Stop selecting and depending on
 HAVE_KVM
Message-ID: <20230918153835.3303b94c@p-imbrenda>
In-Reply-To: <20230916003118.2540661-11-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
	<20230916003118.2540661-11-seanjc@google.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gka9lWRUKLxmY8CnWLPRD9lJIPkhC1FX
X-Proofpoint-GUID: SpRDGM75-9ApKh_bEVRf-E8W1-9pMypd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_06,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=719
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_063949_294113_DC9D87F0 
X-CRM114-Status: GOOD (  20.23  )
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

On Fri, 15 Sep 2023 17:31:02 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Now that nothing in s390 or architecture agnostic code consumes HAVE_KVM,
> stop selecting it in s390.  This is one of several steps towards deleting
> HAVE_KVM from the common KVM Kconfig.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/s390/Kconfig     | 1 -
>  arch/s390/kvm/Kconfig | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index ae29e4392664..8a5dca0036d9 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -193,7 +193,6 @@ config S390
>  	select HAVE_KPROBES
>  	select HAVE_KPROBES_ON_FTRACE
>  	select HAVE_KRETPROBES
> -	select HAVE_KVM
>  	select HAVE_LIVEPATCH
>  	select HAVE_MEMBLOCK_PHYS_MAP
>  	select HAVE_MOD_ARCH_SPECIFIC
> diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> index 459d536116a6..9056cee72945 100644
> --- a/arch/s390/kvm/Kconfig
> +++ b/arch/s390/kvm/Kconfig
> @@ -19,7 +19,6 @@ if VIRTUALIZATION
>  config KVM
>  	def_tristate y
>  	prompt "Kernel-based Virtual Machine (KVM) support"
> -	depends on HAVE_KVM
>  	select PREEMPT_NOTIFIERS
>  	select HAVE_KVM_CPU_RELAX_INTERCEPT
>  	select HAVE_KVM_VCPU_ASYNC_IOCTL

it looks like we don't use HAVE_KVM on s390x

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
