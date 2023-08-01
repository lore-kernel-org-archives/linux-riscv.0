Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C69C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 11:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2rI/OoyvZDo6xtuahWXjVN266WY+6+3GXxLaSEh5OPI=; b=C8V7eSLWYJAAMr
	4DoBT+sfOb25SAychL4SgXvdEjrlSYEofpb9gBWuTw4c2Y4sU8i9HmF/WxUconihm1ot9JefrbLSD
	aQpl8YZ+JDm5hibfCZGfY9WFAMHPe3sX4Y7ogTuuvfpTYJyrBcWdg5+bBbqKviwgtF1JHAeXLxdKg
	SDWieL3QaC59zxc6hovW7L/px0IBkAKArZ9GayGFilUkOJMogk+S5sEpo4Q/75ZABHnnGygwL1z8o
	5EUK9nGgNiJVvyQsAPSSmxHVASPYw0LKo11v9snYk2CqbobauQh0O8A/lHKSXnNX5uu4jLU4P4OVs
	ieMUIrapgT7o9TLVURnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQnGx-0023nY-0P;
	Tue, 01 Aug 2023 11:10:39 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQnGu-0023lp-01
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 11:10:37 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-686f25d045cso3695439b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 04:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690888232; x=1691493032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=korDIX4sAxkkpV8e2u1lpZVVT/VDItzmnploqLBkDn8=;
        b=Wnq3DcKZan5Aboi+g1Wj9nsuA84KdfbJtt+q3/KNQzTxN3hYM4f9QnqXKiLq7+3A1o
         Guy/RsJkRpJbXECMZwp+ncrLvFsLksgEiV2jrnzbsqRuJgth/Yjh0aj7OmTcaB+B8UEZ
         wG9REFyMJ2rR8HmLXnwkBooGtg1Erc1E9Ylbas2+BKUg3LK1mlBpbEe/5b4v9nARxycD
         6fZKEyLyYMm/Et6ruaDUC9n+hlydZEir8iBIZ4lb6H4O0dXolAG/wybyGdB/eXCvyIPs
         2S4LPsJcm4KmFFKy4aanULlgUbNgR/gZBqy8ypMdv1wNlsP5rIPpla2uDZL8TvlJxY/W
         VsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690888232; x=1691493032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=korDIX4sAxkkpV8e2u1lpZVVT/VDItzmnploqLBkDn8=;
        b=J6DA9GavH9lAqnmXItnTvdBb9l7Jeso7JIEtEW/FAPWW9kjAvYxBjApSkueFyJmQon
         pgjtwQj7xXbw0p5x2gzDptBwnpk2uIjPsNo+GilmTWpHPgkna2UX2Hdwi20uDqgoHuVq
         YA27y3WSlJC7ZmOHYEHR6OFyaF3+HQnECKBiR6GiBW29zjvfg/ivkYnexxR+RjjCWRE8
         pI+U+dvyBnemk+xXyUCiFWMqJZ7a5KbfG7s/tb1hdraZxvoF45eFdgMdNirhGao/2T6L
         nnWr5Ga7PA45Bs7zCG5Mr7BH5l8IXeRyjJk1L6V5iW5jiyS36bbkzS5RxGISjjqQUvMC
         LOMg==
X-Gm-Message-State: ABy/qLaHnc4yRbBMziG/FY3mHEFXw5IuZgrXPHI5UiDHm9Bhigv1ij3h
	9ywSpgKDQB+3pN3mV2r0C5A=
X-Google-Smtp-Source: APBJJlEYp1j6BwyQLziDwdHTNZ+u1PmA2QBMmpEqC8F6TVbtI0o0UaxbKtb/ll5qLBcPF6fJW/ZwFw==
X-Received: by 2002:a05:6a21:35c9:b0:131:5995:340 with SMTP id ba9-20020a056a2135c900b0013159950340mr11470828pzc.20.1690888231952;
        Tue, 01 Aug 2023 04:10:31 -0700 (PDT)
Received: from localhost.localdomain ([2408:843e:c00:f3f:aeab:c5ff:e07e:654d])
        by smtp.gmail.com with ESMTPSA id g1-20020aa78741000000b00682ad3613eesm9047516pfo.51.2023.08.01.04.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 04:10:31 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	guoren@kernel.org,
	alexghiti@rivosinc.com,
	sergey.matyukevich@syntacore.com,
	david@redhat.com,
	wangkefeng.wang@huawei.com,
	panqinglin2020@iscas.ac.cn,
	woodrow.shen@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH] riscv: Correct the MODULES_VADDR
Date: Tue,  1 Aug 2023 19:10:14 +0800
Message-Id: <20230801111014.1432679-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_041036_041102_6B0EDF24 
X-CRM114-Status: GOOD (  12.39  )
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

As Documentation/riscv/vm-layout.rst describes, the 2G-sized "modules, BPF"
area should lie right before the "kernel" area. But the current definition
of MODULES_VADDR isn't consistent with that, so correct it.

Before this patch, the size of "modules" from print_vm_layout() is not 2G.

[    0.000000]      modules : 0xffffffff2ff2f000 - 0xffffffffae600000 (2022 MB)
[    0.000000]       lowmem : 0xff60000000000000 - 0xff60000040000000 (1024 MB)
[    0.000000]       kernel : 0xffffffffae600000 - 0xffffffffffffffff (1305 MB)

After this patch, the size is 2G.

[    0.000000]      modules : 0xffffffff3a000000 - 0xffffffffba000000 (2048 MB)
[    0.000000]       lowmem : 0xff60000000000000 - 0xff60000040000000 (1024 MB)
[    0.000000]       kernel : 0xffffffffba000000 - 0xffffffffffffffff (1119 MB)

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 75970ee2bda2..7c57e17fc758 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -53,8 +53,8 @@
 #ifdef CONFIG_64BIT
 /* This is used to define the end of the KASAN shadow region */
 #define MODULES_LOWEST_VADDR	(KERNEL_LINK_ADDR - SZ_2G)
-#define MODULES_VADDR		(PFN_ALIGN((unsigned long)&_end) - SZ_2G)
 #define MODULES_END		(PFN_ALIGN((unsigned long)&_start))
+#define MODULES_VADDR		(MODULES_END - SZ_2G)
 #endif
 
 /*
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
