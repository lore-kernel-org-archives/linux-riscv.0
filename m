Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D9FC53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kilIgGL1La2Ua6MvKW9Lakx3655j+JbQ6MyIKeZr4wc=; b=G5E0sgqOwFQqI1
	dFUo6wpCS6AtsJi3tAk4AuhfzDK/DE01QjSJfuHsZrjqiixp0snWVIf4zvQ6rVAy+LJk49htl5i7z
	PVA9+7QdkRFNBnfXVnvtQD+s6J/aeK4sWSBMzdRFeIb+u3VaUfhyreKDB5/Ancm1rh/oALDGW2hyF
	sfixoyAfYXF2ckAba2JyTRU9yhPcZ64IVAuC/hL80lpaPpYBksEEXp4K3m1KRlmuhd5bKHk1I0mQx
	Oe1C+P3mvBa6SOleGD0IhDfViVn0wHKeg6hmlAWBDNw5qzR8Fn/ER8Fu2+qC96ienjD31MJPOAKDa
	mWNquLNhlu/GZXNulDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woszU-00000006ZqM-1jGY;
	Wed, 29 Jul 2026 01:21:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woszR-00000006Zq2-1SNc
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:21:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso310678f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 18:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288103; x=1785892903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/yNUmJXbEn4d1QfM+/JRPejjSzhIBZ/Fs+rqUcpp98=;
        b=SPpvkRk+VXBKEAXBsr+DiFtl28uf70MQcmk+SLy4BuEsxMKgfR4RfQ17yrV7MdJnxI
         ko5Zk/oKKVLMBYGNn2ymX0+sikEUvvxOZRAZjHWtRfXyzIrZ8mGao20lrl8EROVX/QoZ
         H/gX+9uCyDfO18osKwy+0sGK/9wqtI1LWH1H2FEy54Cfl8hB8VYa48cE0DS/S+opxp2o
         a4dk0KdLKWrojaWxY0HuwIvrUIiTkGPKRJcdr1+ICO+I8ELYsIRECnIui6CycPiyEkt3
         MV4Ga0Xw6x7w0c0sJmiirSs6mLbaHvPGC5Mbt6QQpZQ+6DwwEjKrJ2xm/GIAmop+oLrA
         Xp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288103; x=1785892903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/yNUmJXbEn4d1QfM+/JRPejjSzhIBZ/Fs+rqUcpp98=;
        b=MTbn0VTVeno+eLL6mf42njbQLGMkgZN/Xs+vLHz4k3WMYSvbd2QD4DSxi9zriCJuUC
         HwdcZSdGfxj0rfWZGPAGDGDxLlNhHEtfaZGeLXECFOsT3j6gd7CgBVvP1KbL9Q5sVzTJ
         nvAVtinQKgMX9lL/Nacy7uvVW/3f8yoVmU/3IppaiKYQG4IyA2njthqhsUsx76SoPGa2
         Cgap1QAPCmt8+J6ooAteQH+zJhQuvC6s2ac2hF8K70d1DK9C1EW1F3+KI2Xwa1y7XYL3
         AVFJpu584+PKf3FyEyNE57q3vYM219557D5Etg/6c93Dr30zNbD9iMVAOMVT7mKvATyE
         KqnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDLUxHlL0WZZaeWwJQ9wGHKPwQWaCL7AfBRCpEIYfWhjSQatUeVAwZlzzieSYf6IXz+lei3VwpPaEarg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMmLF4XXLsaZKb5oLmwuIKJiZ6mVDPUipBFPYBzcJ5SpLY+sWC
	NNoNVHVtANKOgE/efIxep5DfOcbpSQ5m8CK7fuG+qjgaeYRlaZ61181e9r8sKKhP
X-Gm-Gg: AR+sD11djl8vPA2xTfcD6HZ0RFbJnUgitF8XZq4vhek8anl/8YJi3j1uXYmEZCTS+D4
	lhl9a+K2/orLN7f3C5G7BnU7o7iDbUbNoSVW9HKCzZlvTR18xO9pFXyo0Ezq+WOtsEQIxZlmJyr
	fo6cnpobpTb2Uv0irdx9Ka+YtujKxSbeBNGb5ilSP31dUgPrkfi7MILosp0sDZ/4L0hYD3wNvgs
	01wkUNkDUTALl14IMUQEJWB/2cl/a85py+0cB8loqAODDbcUK6L82m49SkLjpFdjJk2vgXV2sKo
	LU3ci1+1iLSQr5oTLgTKBIZ+mZvdFi3AFniuQDzwU/aOHvii9LBfEx35zrfmbaPZeizf6VgZ6Kn
	ornMexdTcXk4riiprT72GWrjrEPMRcP4FU2dW18uo7TiNu+3c4y7NjvsisTSXYw+C5QLDP72QX7
	8jR/4IQWEOhUSA3Xca8RJVn9Q3vXxNFQ02ih+SZkqcLEAk3DEBIyb8yiCWA92EZy91HdpEbQnoM
	g8AMOg9Xeu7xipqjqioxghP8eV2KpQ6YA2tm0E3e+P8FC0sjHU728CBB7XTf+Df8vFcYwlrwAbp
	RfvTW/RN8B8x52SWgOd/YWM0aliK8jYvgW/9tOXo2FQpMmMD59ajGl9LdE5UOdiaM5S8
X-Received: by 2002:a5d:5f42:0:b0:47f:aead:f81b with SMTP id ffacd0b85a97d-47fb1e9381amr4471613f8f.21.1785288103396;
        Tue, 28 Jul 2026 18:21:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b323-2b01-0d98-9fe8-a4cd-78ab.310.pool.telefonica.de. [2a02:3100:b323:2b01:d98:9fe8:a4cd:78ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0f039sm3507389f8f.18.2026.07.28.18.21.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 18:21:42 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Fix out-of-bounds page-table walk during memory hot-remove
Date: Wed, 29 Jul 2026 03:21:32 +0200
Message-Id: <20260729012132.24882-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_182145_423435_10CF5A9D 
X-CRM114-Status: GOOD (  12.19  )
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

remove_pud_mapping() and remove_p4d_mapping() obtain a child table base
with pud_offset(p4dp, 0) and p4d_offset(pgd, 0), then add the index for
addr.

RISC-V folds page-table levels at runtime. When a level is folded, its
offset helper returns the parent entry itself, but the index can still be
nonzero. Adding it walks past the parent table. Sv48 folds P4D, while Sv39
folds both P4D and PUD, so memory hot-remove can descend into unrelated
memory and pass an invalid page to __free_pages(). This can trigger:

  kernel BUG at include/linux/mm.h:1810!
  VM_BUG_ON_PAGE(page_ref_count(page) == 0)
  arch_remove_memory+0x1e/0x5c
  try_remove_memory+0x15e/0x200
  remove_memory+0x24/0x3c

Only add the index when the corresponding page-table level is enabled,
matching p4d_offset() and pud_offset().

Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 3e450890be07..338a8cbf4b80 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1618,7 +1618,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 
 	for (; addr < end; addr = next) {
 		next = pud_addr_end(addr, end);
-		pudp = pud_base + pud_index(addr);
+		pudp = pgtable_l4_enabled ? pud_base + pud_index(addr) : pud_base;
 		pud = pudp_get(pudp);
 		if (!pud_present(pud))
 			continue;
@@ -1649,7 +1649,7 @@ static void __meminit remove_p4d_mapping(p4d_t *p4d_base, unsigned long addr, un
 
 	for (; addr < end; addr = next) {
 		next = p4d_addr_end(addr, end);
-		p4dp = p4d_base + p4d_index(addr);
+		p4dp = pgtable_l5_enabled ? p4d_base + p4d_index(addr) : p4d_base;
 		p4d = p4dp_get(p4dp);
 		if (!p4d_present(p4d))
 			continue;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
