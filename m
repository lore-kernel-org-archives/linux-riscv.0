Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1D5CC6B2A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWQR76/R7bEz9+M1RIygGtOvxLbCZ4BSlRzbwCRp4HA=; b=kF/NLMD30L/WMd
	EXX4F1rVKLiwnOhfyqFP7qdVZdHT4hqYfhSdSrgZszT/PnKzVnATWi/1XZvnOX1S9jBSh0d8iYd0v
	Ttek0bDLpdoJ9qeM6qAXTH3pfKSnTzZ5S2m6/Tgb5s5hVEzS54PAC+Nh7SilnpmvLbx5PV2R4FVLB
	oxlhAA1DhPPJrdKggpGrNCY8szNMGxh+newA5Kg420D7pcwvQMlxhZbYQJL7A+U5xMlpuBiYmFbFX
	3CwIy5e2VfbvrgdXkeU1/el8ZNZJG9GTsP9nl8CieG4TXNQKjrY84NGlqeaFOLYiW+k/amacOd57M
	JdA9LGLzg5j7MwV/gi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHynj-00000004VmS-0YM9;
	Sat, 17 Oct 2026 07:25:55 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyne-00000004Vlm-3pCs
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 07:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ewuZS2LJoV706wzysln/YWmht6PjItoyLpPQRx9kbB0=; b=l
	vs9pdhpXAxF45CzbDkGjtggXjVH3zOSWw0nYR1CpOfZdZNWQXUPvqLLVHRYF8q2x
	OoTsJJJUfGYOaYJ/X2x37YXh9HgWyC2rKsSTt9gDCZ3LUpWSD+zY3FGw8HFz1FRb
	20eSKNT798uA/vTFXOEy1Xp5K6pYpurxX6As+Wmx4w=
Date: Sat, 17 Oct 2026 15:25:20 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH 1/2] riscv: validate RINTC entries before use
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141249.2791819-2-yaojiale02@163.com>
References: <20261016141249.2791819-1-yaojiale02@163.com>
 <20261016141249.2791819-2-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvkEp5ieYZOkdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHbCwH52DkjYoSYRnetF+bJw==
MIME-Version: 1.0
Message-ID: <37a131ae.17f0.1a148c03dc7.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZygvCgDnX2XgItNq3vpaAA--.127W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQBQimrTIuD8GAAA3I
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_002552_837516_F9C2D6F4 
X-CRM114-Status: UNSURE (   7.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

At 2026-10-16 22:12:47, "Jiale Yao" <yaojiale02@163.com> wrote:
>The RINTC parser reads the flags field before checking that the MADT
>entry contains a complete RINTC structure. A truncated firmware record
>can therefore trigger an out-of-bounds read during early CPU discovery.
>
>Move the existing BAD_MADT_ENTRY() check ahead of the first typed field
>access.
>

Fixes: ce92546cd637 ("RISC-V: smpboot: Add ACPI support in setup_smp()")

>Signed-off-by: Jiale Yao <yaojiale02@163.com>
>---
> arch/riscv/kernel/smpboot.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>index a9de2dae804c..9c341398058c 100644
>--- a/arch/riscv/kernel/smpboot.c
>+++ b/arch/riscv/kernel/smpboot.c
>@@ -76,6 +76,9 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
> 	static bool found_boot_cpu;
> 	struct acpi_madt_rintc *processor = (struct acpi_madt_rintc *)header;
> 
>+	if (BAD_MADT_ENTRY(processor, end))
>+		return -EINVAL;
>+
> 	/*
> 	 * Each RINTC structure in MADT will have a flag. If ACPI_MADT_ENABLED
> 	 * bit in the flag is not enabled, it means OS should not try to enable
>@@ -84,9 +87,6 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
> 	if (!(processor->flags & ACPI_MADT_ENABLED))
> 		return 0;
> 
>-	if (BAD_MADT_ENTRY(processor, end))
>-		return -EINVAL;
>-
> 	acpi_table_print_madt_entry(&header->common);
> 
> 	hart = processor->hart_id;
>-- 
>2.34.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
