Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706A1D0E6EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYLkmWRxEyYAA9QC6uQV58TTY14ZW1Rsf9zR6Dgum2I=; b=rOeWJikBjJamDk
	l7H1Bx/k5oIi6KEHmgmU4QHp7cgx89eaf3n8P3AE9EDA7AugiMr+mcPQnpAx7g9umwpy32KVT6Bhz
	L1Es2bT4NOQ3dFBltySUkRnpjpph2U70RJDJC7+D5HKkkHQvEtahgQzZMVP+8tj7hCgsr+X//hXkK
	Gkh/YYZ/wOB3EBx2xmnnpgPiMnqaO2LeZ2Zbl1BO6KO8QXyY65R9o8ItBpFL/QC0x4oWfTqUgK8xA
	0jdJsr2HZpQQqZ5osZFlnwrEUDPx9gDW/hrbfwzMWZE0Lho+IvszC2SW0O34mJB0HJxZhR4euqOJm
	M4lkP5hO2clNgChyNLvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pvF-00000006wNK-3tm8;
	Mon, 21 Oct 2024 10:46:01 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pph-00000006v41-0mfZ;
	Mon, 21 Oct 2024 10:40:19 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L2KH3K032533;
	Mon, 21 Oct 2024 10:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=92knE4jiltiV907EhRGLVYeamkXayI
	7j0BwYX0ZH1JA=; b=WL4D7lJNas37Nzdhxi9rX+lx/0u/7ytK48q3TqjJR++gKt
	r7ueMht7alDtgQ7pasPryEpqoYRd0OWJqyszZwZ+SpNOF2LJ1isSitDYhyMC/LAS
	FwERDIOSqxtV94TGFg/XwPocGXOJNG9slT3/uBhOpxWpILgE6aPOyXK2xUh7rTpF
	iZSfIsmznUv35ep6vlQ2EA5avKOIqsYrhOQyes8ee48qcQRT99bJpKxarFGhHfc/
	Sf1AmAC4Lua0AKvgB9CPRIHyiQxUS0kOC4/Q4iiF3ywr7qQlDkQN+CyvM61jpuW4
	hTkpnbK13JKGJKjwKEuAWROXZpMXdSctg6J3mWmA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42c5hm8my5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 10:40:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49L9CWB9018605;
	Mon, 21 Oct 2024 10:40:12 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42csaj5kvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 10:40:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49LAe94P24249044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Oct 2024 10:40:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 389B320043;
	Mon, 21 Oct 2024 10:40:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F0602004B;
	Mon, 21 Oct 2024 10:40:08 +0000 (GMT)
Received: from osiris (unknown [9.171.37.192])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 21 Oct 2024 10:40:08 +0000 (GMT)
Date: Mon, 21 Oct 2024 12:40:07 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org,
        Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH 07/15] s390/crc32: expose CRC32 functions through lib
Message-ID: <20241021104007.6950-E-hca@linux.ibm.com>
References: <20241021002935.325878-1-ebiggers@kernel.org>
 <20241021002935.325878-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021002935.325878-8-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: f0A5vIL1iLbWasgVAUuToCuIbQMCR4iX
X-Proofpoint-GUID: f0A5vIL1iLbWasgVAUuToCuIbQMCR4iX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=730 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_034017_372720_14336A72 
X-CRM114-Status: GOOD (  27.09  )
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

On Sun, Oct 20, 2024 at 05:29:27PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Move the s390 CRC32 assembly code into the lib directory and wire it up
> to the library interface.  This allows it to be used without going
> through the crypto API.  It remains usable via the crypto API too via
> the shash algorithms that use the library interface.  Thus all the
> arch-specific "shash" code becomes unnecessary and is removed.
> 
> Note: to see the diff from arch/s390/crypto/crc32-vx.c to
> arch/s390/lib/crc32-glue.c, view this commit with 'git show -M10'.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/s390/Kconfig                      |   1 +
>  arch/s390/configs/debug_defconfig      |   1 -
>  arch/s390/configs/defconfig            |   1 -
>  arch/s390/crypto/Kconfig               |  12 -
>  arch/s390/crypto/Makefile              |   2 -
>  arch/s390/crypto/crc32-vx.c            | 306 -------------------------
>  arch/s390/lib/Makefile                 |   3 +
>  arch/s390/lib/crc32-glue.c             |  82 +++++++
>  arch/s390/{crypto => lib}/crc32-vx.h   |   0
>  arch/s390/{crypto => lib}/crc32be-vx.c |   0
>  arch/s390/{crypto => lib}/crc32le-vx.c |   0
>  11 files changed, 86 insertions(+), 322 deletions(-)
>  delete mode 100644 arch/s390/crypto/crc32-vx.c
>  create mode 100644 arch/s390/lib/crc32-glue.c
>  rename arch/s390/{crypto => lib}/crc32-vx.h (100%)
>  rename arch/s390/{crypto => lib}/crc32be-vx.c (100%)
>  rename arch/s390/{crypto => lib}/crc32le-vx.c (100%)

...

> -static int __init crc_vx_mod_init(void)
> -{
> -	return crypto_register_shashes(crc32_vx_algs,
> -				       ARRAY_SIZE(crc32_vx_algs));
> -}
> -
> -static void __exit crc_vx_mod_exit(void)
> -{
> -	crypto_unregister_shashes(crc32_vx_algs, ARRAY_SIZE(crc32_vx_algs));
> -}
> -
> -module_cpu_feature_match(S390_CPU_FEATURE_VXRS, crc_vx_mod_init);

What makes sure that all of the code is available automatically if the
CPU supports the instructions like before? I can see that all CRC32
related config options support also module build options.

Before this patch, this module and hence the fast crc32 variants were
loaded automatically when required CPU features were present.
Right now I don't how this is happening with this series.

> -MODULE_ALIAS_CRYPTO("crc32");
> -MODULE_ALIAS_CRYPTO("crc32-vx");
> -MODULE_ALIAS_CRYPTO("crc32c");
> -MODULE_ALIAS_CRYPTO("crc32c-vx");

...

> +static int __init crc32_s390_init(void)
> +{
> +	if (cpu_have_feature(S390_CPU_FEATURE_VXRS))
> +		static_branch_enable(&have_vxrs);
> +	return 0;
> +}
> +arch_initcall(crc32_s390_init);

I guess this should be changed to:

module_cpu_feature_match(S390_CPU_FEATURE_VXRS, ...);

Which would make at least the library functions available if cpu
features are present. But this looks only like a partial solution of
the above described problem.

But maybe I'm missing something.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
