Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675FFD25B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 13:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWnigxuUw2XMqc8VChFBmld2CxemknrNZXbI/c68ulU=; b=NK5bs5cbktoud95FCkfWnZcf5h
	jrDgTq6kcPnFnUs/T4IYUDaNjFKJe8/5Jjc3+eazIBr3Pr7O35OI+pwBlty8tbbSVsKMl/r2o1P1D
	inVQKgQLJJOJ7W7sLGMEfwam6H5DXhGzIlGaCQ4uKnvkIGReJK+egPdknrsCXnip2q9ZWWL+KbmUf
	vmDlvWqvGtdO1wEivf4MKWAB0b3nX6DyvgiEHUzgc6NiPEliTLLbBXaLZOYVU2bX8RMWLX2jBzVEk
	hocpoFde1YbtPfFrLuTRmZ60UdQnswPiQhk8seUGwCXaOkH5dK0xhTnQsPbqGoV8g4LxNltmWU1U3
	3JUJWQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5sM-0000000G5zV-2FEn;
	Wed, 28 Jan 2026 13:46:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5sL-0000000G5zN-0XIL
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Jan 2026 13:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pgCYcevjsa7P0VKK2d9bPG1qy0zovkICk2c2UItcXHw=; b=h23NvA0OmVc7QKLp7/l7yzmxKW
	5TiE6IPSGuzKzsGj854Ug9udKQ9XgkIQOU+47PCvh1PAdeoFYy56/oatGS+A3h3pmrgZZPsLsfMkl
	BlqDDyfmcj5k/3h4/029VmlkkTL77j0+xjWqPOZMSnOCH7rUB4kXQRcivSdFly6VCZh5QdZpB9wBh
	DJJe8hp2W0raXJSer8FQsGC3OM5jqD+Ebo+xS+FUGhPHv/BXbcEU+FUEL3EGIUQCHUr4EOzAwN2bu
	LHpPZGAIxKbgloKgFYMW17ub5lNhDPkS+T3qwzM22Tfsn9M2Sn1JlIb227V3kBrNg4vjR9hKHOqUO
	7fcF6bZQ==;
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5sF-00000008dLD-0aoI
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 13:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769607963; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=pgCYcevjsa7P0VKK2d9bPG1qy0zovkICk2c2UItcXHw=;
	b=KS6Jqr0V/M7OkSZp7t85U95zGaA8G90fKWYGcGT7nVlbbGj0cB4cJqzpeJcYDXl2q8q26lkR0RcVkELdS1mlOTLPrsjElhPruk1eOf6JIMuPYXcIMQ9590PXuNdgSYGi1jHszziySaaa9jnruJ9rWdxm5RBgkm/E+6kUcFUbGMI=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wy3b8jq_1769607960 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 Jan 2026 21:46:02 +0800
From: fangyu.yu@linux.alibaba.com
To: guoren@kernel.org
Cc: alex@ghiti.fr,
	alexghiti@rivosinc.com,
	bjorn@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: Re: [PATCH V2] riscv: mm: Fixup no5lvl failure when vaddr is invalid 
Date: Wed, 28 Jan 2026 21:45:53 +0800
Message-Id: <20260128134553.69518-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260125055212.433163-1-guoren@kernel.org>
References: <20260125055212.433163-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_134623_547859_729DE0EC 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6310320079876681547=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6310320079876681547==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

>From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
>
>Unlike no4lvl, no5lvl still continues detect satp, which
>requires va=pa mapping. When pa=0x800000000000, no5lvl
>would fail in Sv48 mode due to an illegal VA value of
>0x800000000000.
>
>So, prevent detecting the satp flow for no5lvl, when
>vaddr is invalid. Add the is_vaddr_valid() function for
>checking.
>
>Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
>Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
>Cc: Björn Töpel <bjorn@rivosinc.com>
>Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
>---
>Changelog:
>
>v2:
> - Use is_vaddr_valid() instead of simple return.
> - Don't change the original no5lvl code logic.
>
>v1:
>https://lore.kernel.org/linux-riscv/20260118145441.291302-1-guoren@kernel.org/
>---
> arch/riscv/mm/init.c | 25 +++++++++++++++++++++++++
> 1 file changed, 25 insertions(+)
>
>diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>index addb8a9305be..bfea9f73e703 100644
>--- a/arch/riscv/mm/init.c
>+++ b/arch/riscv/mm/init.c
>@@ -852,6 +852,27 @@ static void __init set_mmap_rnd_bits_max(void)
> 	mmap_rnd_bits_max = MMAP_VA_BITS - PAGE_SHIFT - 3;
> }
> 
>+static bool __init is_vaddr_valid(unsigned long va)
>+{
>+	unsigned long up = 0;
>+
>+	switch (satp_mode) {
>+	case SATP_MODE_39:
>+		up = 1UL << 38;
>+		break;
>+	case SATP_MODE_48:
>+		up = 1UL << 47;
>+		break;
>+	case SATP_MODE_57:
>+		up = 1UL << 56;
>+		break;
>+	default:
>+		return false;
>+	}
>+
>+	return (va < up) || (va >= (ULONG_MAX - up + 1));
>+}
>+
> /*
>  * There is a simple way to determine if 4-level is supported by the
>  * underlying hardware: establish 1:1 mapping in 4-level page table mode
>@@ -893,6 +914,9 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
> 			   set_satp_mode_pmd + PMD_SIZE,
> 			   PMD_SIZE, PAGE_KERNEL_EXEC);
> retry:
>+	if (!is_vaddr_valid(set_satp_mode_pmd))
>+		goto out;
>+
> 	create_pgd_mapping(early_pg_dir,
> 			   set_satp_mode_pmd,
> 			   pgtable_l5_enabled ?
>@@ -915,6 +939,7 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
> 		disable_pgtable_l4();
> 	}
> 
>+out:
> 	memset(early_pg_dir, 0, PAGE_SIZE);
> 	memset(early_p4d, 0, PAGE_SIZE);
> 	memset(early_pud, 0, PAGE_SIZE);
>--
>2.40.1

Tested on hardware where DRAM/PA starts at 0x800000000000.  With "no5lvl"
on the kernel command line, the kernel boots successfully after this patch.

Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Thanks,
Fangyu


--===============6310320079876681547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6310320079876681547==--
