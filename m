Return-Path: <SRS0=W22O=LV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857E1C48BC2
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 13:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C2B61993
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 13:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C2B61993
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eaN5tbWtEwSgdCEaj4FD8FylVPhnNNVDHwybHZCF6LA=; b=4n75AoCC9uVGYl
	nv2QTyHLBhGwLciSjoLnrq5JVi9QOr41aD9Ldc+Hrmyoa1GQ+wY3cyLrAlwD88W0+jeWWX0d8d5qx
	0BkWOUqWAFj+FvUatSDvV5RiUuj6frLPn7Q+KeVubhejkS4gyRg52Tuk3XrTh5whWLF9FnZDCmkYm
	78Pq8Un/CKwgvdMcIQQXvXd7+mGbO9x61ZfoH3oqLWG+WAfe0kodzA/BMSSYqaZ4NV4njcBu4k3Vp
	5S18RA8SMFNURlYHosyx3vyU5AEgeux71hB5InsTER8d0vhsAaYBSibqwnPvy6BsBExa4SIQx81NN
	6ZlbZvT+nGOBhHisSQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxVC6-005dh9-O4; Sun, 27 Jun 2021 13:51:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxVC4-005dgU-Sn
 for linux-riscv@lists.infradead.org; Sun, 27 Jun 2021 13:51:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id o3so2262243plg.4
 for <linux-riscv@lists.infradead.org>; Sun, 27 Jun 2021 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bTjmvU8yn2/k0kOaZkGNIygSTdPKkN7MOcxmayDA4lI=;
 b=OdGpBXHtWVue7u4/yCfRuucDLA2lcAkTkuHNxW38YjfxpCkbjgrsqMQvzAVvwzpbje
 NUAq5k3FZpGXY8LygkpAhG32cyPFaxj2z6HNiEjy8p1BNCvZhjSebCmuvnOvQwlGSxQu
 9Ub9gbmhiEFgsUYrNYChAT56HHUNvoeRw0kQJbLgE8wJKawlVYuY5U1p+dRNyYpIhJ9O
 FhDSmb9rQzHFG0svVN09s6BtJvfhn2MBda8/DIPGiy0pVsuvrWsu2AmFBHBvg1bjwgWo
 QIsi/O9P+d5PAkU/paZmZiuSXHhJk9qyKqNdJV2lt04OndwQpmNTgUkJmYvzH/JDvLrM
 CR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bTjmvU8yn2/k0kOaZkGNIygSTdPKkN7MOcxmayDA4lI=;
 b=FKmehFqpFqrigx3TxrK+4nuj8a62aThUERsnL/huJAdE1Vm+k1gweCl0AUC2N75iwO
 k6kkEH1dYPM0Le5pbkwzSAzl6EtAmTzzJqS8dYmT/NMwHvlzeVqkCku3Y6SLnJpUkBd5
 8BbssStT4fokSjnvRo3RMMGsvdrRmgWIKaIUAqfx0uR9wN9+WK/Yr/aifNsb72k8Sa6P
 jjBvLkW+9Q3zQwx+cTf5/3NfjdCvIXZpSDFyZ8svi2DOU4L2Vpq12ttJOljU4PvF5iCr
 p8GhuoUIz6n6Cy30XsCDcTEuboDDkOQpqKYNirgmyN1CN+QvcACibbTIcQWqa2iACbs3
 A6KA==
X-Gm-Message-State: AOAM533FwOfn2M2DqyQPda3HJJ1hQ6ZAFBE4wWF1sfMUazzBtcAx6Ygb
 wADFOzFEWU9M+iqt15Xmn/0=
X-Google-Smtp-Source: ABdhPJzjT7YC09scR8s5v2+ndh3rZPHMTmEYf67yRO7QQ/E4qz+CXAbP8Mm+trT56tLJrtzz3o+voA==
X-Received: by 2002:a17:90a:b390:: with SMTP id
 e16mr22444595pjr.197.1624801887319; 
 Sun, 27 Jun 2021 06:51:27 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id c5sm10870034pfv.47.2021.06.27.06.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 06:51:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: stable@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH] riscv: Fix 32-bit RISC-V boot failure
Date: Sun, 27 Jun 2021 21:51:17 +0800
Message-Id: <20210627135117.28641-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_065128_974083_185F3446 
X-CRM114-Status: GOOD (  11.13  )
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

Commit dd2d082b5760 ("riscv: Cleanup setup_bootmem()") adjusted
the calling sequence in setup_bootmem(), which invalidates the fix
commit de043da0b9e7 ("RISC-V: Fix usage of memblock_enforce_memory_limit")
did for 32-bit RISC-V unfortunately.

So now 32-bit RISC-V does not boot again when testing booting kernel
on QEMU 'virt' with '-m 2G', which was exactly what the original
commit de043da0b9e7 ("RISC-V: Fix usage of memblock_enforce_memory_limit")
tried to fix.

Fixes: dd2d082b5760 ("riscv: Cleanup setup_bootmem()")
Cc: stable@vger.kernel.org # v5.12+
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 arch/riscv/mm/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4c4c92ce0bb8..9b23b95c50cf 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -123,7 +123,7 @@ void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
-	phys_addr_t dram_end = memblock_end_of_DRAM();
+	phys_addr_t dram_end;
 	phys_addr_t max_mapped_addr = __pa(~(ulong)0);
 
 #ifdef CONFIG_XIP_KERNEL
@@ -146,6 +146,8 @@ void __init setup_bootmem(void)
 #endif
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
+	dram_end = memblock_end_of_DRAM();
+
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
