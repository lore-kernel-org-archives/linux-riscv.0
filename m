Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEAFC79FA0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 19:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QNMMagUV8rRZaSi3dM8FQHaCECof4y1mui/MhIO2VjU=; b=xVPBIK9cPOQOu/
	xXXAVT8ozvVxPUVLH2LWnd7M+xt1v47f7nOHsntMlnGW6Iu4VaNDCBfgH9NpfNAjEztBJViNNxMTL
	Jzq0asSlV3IBIMoZYUI10FmMXvU9a0fBXdOcBDzN0Ptxm5dW0lzgiYhyix7Hj8FQqrNL71noyi7ai
	ifcsB1bACOFx9aTx06ldKKhOyyavvA6KeIB9AriTaA6SyFXg4YxmYU2rtoSUrqX8f64mX2hu+gJLM
	kQ3yS5aeKriKQjIWtHdSbLjAGIRxFkOMxvJJqA6YHL6GH9JL8V5kn4xgqSOSICX/oMIdoPij47Fi6
	I1FODpvHlSYWTbyxScqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ehE-00000007dkK-0ruz;
	Mon, 07 Sep 2026 19:08:00 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ehB-00000007djJ-1zjY
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 19:07:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so39049095e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788808075; x=1789412875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCg+kqJBNRvAirf0IACBhcdBxWIbdof2JqDpd+PZMGE=;
        b=UGGgn35y8I97M9VCbLvL9+8cdNqiGqgyw2W3cN6YeJYpYJ4eJgHjL7MxiI3p4FLB7y
         A36ClpDGWOvbYdtO4/tvt8ZdIPrjR60Rd4+DzwuiTJjCnTqdFAXPLQixcAED6AGkXrtF
         8zTJEUpZ1RMwvTbEmEBoT0bIajMIwZGU4CwRe3krePgJ+DEkXUB4xoZOuB8szu4H3dpK
         IzaTj8GR0NOqfcezRbSWwkCaHowklrstzVCXNhEF6IWdO0VRPCwTj+bl19dZUK/hCLlh
         8wr+mfyCTyxBElu9OzUkiDM4ZKNe5LzBJ3ReZwvvQxhnREB8hWK/Kc97/tpYbV/au9Uo
         9zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808075; x=1789412875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCg+kqJBNRvAirf0IACBhcdBxWIbdof2JqDpd+PZMGE=;
        b=FO13w8ZrhF6nksEloxqowKuEMwbrmpqtuivo/XZUWeMoSJ5ZmG5f7uWrhqaib/2G6U
         VY9mM7WvZ8to8Ttl67N5NQEVZzZkryzoIcb3KCav4TzpbonIxpqol5uVMsH7c9eh/IoR
         cTm0rg0ozb6Syllv5Nt0PY296mjKw8l2p7DGD9F4O8l1UpJGbHJ4Y9KXIMKR8x3DxvZx
         7fRHQrpGZSJ+cEeZG1QmoBzRkgY4wNrDFB0DWEB97wmxj4iD50Nx74QSurYfOVdQzTGF
         4pyxb676/zgnxLfFkkfsWLx7KOcUh25qAZHGBY1Vsc6tUFoteqYC07APe1qSZKbVgId1
         Rz+A==
X-Forwarded-Encrypted: i=1; AKwUvBxVzXqcqIiuHPUFF0ccQSTvrowqiwcZ62YBQExMkTX8su5D7futWQP0I/4HVfUsh5O0FQh9GsgeI2YOHg==@lists.infradead.org
X-Gm-Message-State: AFuF++mrTSFgOD692J8Lj4pFXIBn3YLdXxZKtNfF7p7P4ODCLFQ47SpK
	yR8M+3o4YiSHAbT59Vfg61GdV+Ubgi1rViNo37s7mT/fK1aHvMcb25lI
X-Gm-Gg: AYBFou1WZhL/K2MlGpRFokTJJt1qRdeMtT2+jmGR4NWaNu6pjFuSk0AFSH1R2R4qQZ8
	5bajn2aVA881TwmL1YiS6NvLNOOdMirqzWgCaOsGMjrbBJkfB27cIKjBkCGbJQZo7taVFcNVNjl
	3AxxB9Rtr2oFZn5L7/S4BC7WjQIaOXjB9ueeMf1+MR+9sekNgNcATamG9tenbEU+6cEVbNiOK5K
	qehttRxQj8hMZu8MAYJTwWfzMtWGY9EzGizn4rfQ/sqUjnuPgGk0LjlCU9g9U0bh7Jibwdd0yc5
	UJ41VYiLK4yzZJGc7bSVAVvSRvwb51gkauUnCJtpjam6/Li6AyYYb2WjRnJRMrbbBRncQf0shLR
	FRUwt9Mc4mxmHH8xPtbSw3vgy7jinct2LxIloZ5TlbU/KrgfSxYlUn/9PgqQflSIe76PLJp8zvt
	Z63EjI2f+KXfgnNIvarp/GPwZn/atFo3q5bJHMIxKdDTm4HgWS64Y8vCGrfbJJciov644k+R5bd
	CCH9I4NZ3GrKDIDkn2TeAcoMQubTs4O6yPJDQsANcBBv91P7H1GLkKdw8rdj3HCYaGvoMSVb1Kt
	CrjkrV6m7q1rj2fT6lO4w6MQkeSsbv4BQ3fh7qdZ50X+KsrM3zgI1K4bGM0F9GmJbC81nwJ5lgI
	43NeEjaEmgSGa
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49cfc6cc142mr205512535e9.29.1788808074866;
        Mon, 07 Sep 2026 12:07:54 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-b0c9-3601-cdce-ba4b-d0e3-dede.310.pool.telefonica.de. [2a02:3100:b0c9:3601:cdce:ba4b:d0e3:dede])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm265229165e9.2.2026.09.07.12.07.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 12:07:54 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: fix load_unaligned_zeropad() fixup for RV32
Date: Mon,  7 Sep 2026 21:07:50 +0200
Message-Id: <20260907190750.26303-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_120757_532676_0944DF71 
X-CRM114-Status: GOOD (  12.68  )
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

The fixup for load_unaligned_zeropad() runs when REG_L crosses into an
unmapped page. REG_L is lw on RV32 and ld on RV64, but the fixup assumes
an 8-byte load: it rounds the address down to 8 bytes and derives the
shift from three address bits.

On RV32, a load starting in the last three bytes of a mapped page selects
the word four bytes earlier and shifts it by 40, 48, or 56 bits, more than
the register width. The caller gets earlier bytes instead of the string
tail followed by zeroes. This affects RV32 MMU kernels built with
RISCV_EFFICIENT_UNALIGNED_ACCESS=y, which selects DCACHE_WORD_ACCESS
and lets dcache name hashing and comparison and strscpy() use this
path.

Derive the alignment and offset masks from sizeof(data) instead of a fixed
8. This makes RV32 use the correct source word. RV64 code is unchanged: the
complete extable.o is byte-for-byte identical before and after.

Fixes: d0fdc20b0429 ("riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on RV32 QEMU virt/TCG with a KUnit guard-page test. Before, the last
three offsets returned fill bytes from the previous word (0xa5, 0xa5a5, and
0xa5a5a5) instead of the string tail (0x44, 0x4433, and 0x443322), and the
suite failed. After, all three cases and the suite passed.

Built full RV32 Images for both sides with GCC 15.2.0. The complete RV64
extable.o is byte-for-byte identical before and after the change.

 arch/riscv/mm/extable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index dd1530af3ef1..e252eba55ede 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -68,8 +68,8 @@ ex_handler_load_unaligned_zeropad(const struct exception_table_entry *ex,
 
 	addr = regs_get_gpr(regs, reg_addr * sizeof(unsigned long));
 
-	offset = addr & 0x7UL;
-	addr &= ~0x7UL;
+	offset = addr & (sizeof(data) - 1);
+	addr &= ~(sizeof(data) - 1);
 
 	data = *(unsigned long *)addr >> (offset * 8);
 
-- 
2.53.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
