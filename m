Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30BECFD2F6
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ypwaf34B7nG3SwEZ1gm2IAXylVau9J11WCC4aUogygo=; b=LtSAp0V5opEN5m
	ezbTVgkXwLPYAEWhKpc9lDzc1SxF3DbNrKl2tfSZoD+b6BcdH9Ue5ReDxkY9elHqhv8bwK8polROm
	oyWJYolIvcdRwwjYdHMkO77yAO/yQuO4jgdgeQrt2LsaAon6/mvcPXUhIbRUbYONyYTtopKpG+wVt
	lrek+M4bu2AjUBWbp3BTFPB12+JsYcjmf2sCugdNP5x5TKTc6sf5sycJMffYfo7ZJkMrNXmtpPPNN
	Uz+n/o3/QuyhQj02mdrFdCxigK5WMWgVwrfob7+ib2JoKC0JP+NIwFn4kvK5xg6pQVi76kMqnnTdH
	Z6BtvnCYbR21jHkgp/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL14-00000004yjB-157o;
	Tue, 02 Dec 2025 07:41:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL11-00000004yfs-048M
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 07:41:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29568d93e87so52684415ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764661298; x=1765266098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdY669oPFp64Z/oUf+jdUTfbYCRwgKwWZWXra6Qr1vI=;
        b=jRZHOKPpekoZvvXbh8MYSAuAIoUaeuyWn4GQIOLp7lwoYznr/tik2SnPuqlYtvlFML
         Ir6/HDs33n+8JY9V9m8pre6OchHO9bnD4v6hVqClqONO2c9vkpeg5ioTiuAECNTztkBB
         oAoT7+36mO48U6A7N2RDTl1DetQ32rWAJQ/EeurR3FwFk9vm3LCrGjBw7IrV/E3DA+og
         ak3x7c0459KYibN/3UGmC4JqnAPFlN3kG8TBntJ38YTpC/sMoCGwwK6vSfGAQYXHtlkl
         fRmUoj0+LlDnjbKNlexifsvn3udDfq+JgsXNdimWdDDF/S9rdw9+oeWX12MW/hiL3QcS
         5ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764661298; x=1765266098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pdY669oPFp64Z/oUf+jdUTfbYCRwgKwWZWXra6Qr1vI=;
        b=OCzGb2jk8gImYVicZu95KQSe6vjvcUYrdu474jbIhFoz8ri6BW+nvwXTVR/NznaKjE
         GNtPT1KLizzU9mF0wTWQECwuEfRcGToy+AMJXLeIHh0sF3p+jPRtc5ZN26lHgk11UTeG
         IDP06zECPwvAFxNM9HrEDwxsDdxiq+R/duFfvZciFZ6iv12XjtG1k5BdNW8qXs6VSLXE
         mmMLlea1l0XPUdH/FMElhVEK8XzcDfXmKNvD2ayODKfnAclYrCLmv/vacXGQRjzcSPAk
         vVd62EAoo9+5Y24vRImxxkUV9KnSMHXXkhdcypxymdOuLqIxrYyhpX9lTs5S7oJixIzz
         DJrw==
X-Forwarded-Encrypted: i=1; AJvYcCUYdNDkDXXugXYcz2i1fuYt8fbqdMYrm4/adPqXnMIeoWE0nhCHEM3zNqvGZDgTppGa3JvEYkPkkPsvvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/P5OtIpnAfP1yIWmUFCMLZgtfFKkRURdNPE9tk2Doo+rFrXOd
	XVNklMu79GhSMG2e2H2DUI1HXulxG1dq0i2L/dcCOb2pJcYEu5vDhC6/
X-Gm-Gg: ASbGnctb/6YqfUPygzKcNHXb5QpIP9Pq49s7ORQZ9js1wcIm5Mf49UC9ri2iT++8JOc
	NqT9C5fuk6Eto08hswASoEmZ4Yd2oIQZp2HjXM4cL2o0hO0Zq11x5OEGmx/XRSUs7GZyLDiUB8E
	Ffd7nfyvsfdvusPuHAgoXJReI6cfqLQaT0AG8CzHo7edBD2BhVHAD+S2HK7AnWbm5P+CiML4VTn
	SSR2WkXKqKF7Vo2nJhPvtH0mACmQ1SQ10DLyLet0uvs6ma0mT6m4ijJH04XyvbxdswWKkiMCMw6
	nqiUkjJa5nFNByjN2hMyFj9aSobSsLbvTTUaU5rgHPZH5cmJw7tazF9wFigu11XEjntbcmVA8VR
	mKqHjVP9cdW20F1Wn3Qses8d1V4WelXRv7pqc0EzK44t8v/CetGsk553kqUjKqD/hGOQ/kt3YSU
	Okd4J4aXUpIA5rwguS/NXBIIcu1dGX+EDHmA==
X-Google-Smtp-Source: AGHT+IEi6+/L2LO/9oDve9kx9ZLziN85TJNVlxJPaA1DiO6RqWCP8Y1ivDHqQ4sUsQ/zqpXNrnohTg==
X-Received: by 2002:a17:903:1a0f:b0:27c:56af:88ea with SMTP id d9443c01a7336-29bab3166acmr289375615ad.60.1764661297941;
        Mon, 01 Dec 2025 23:41:37 -0800 (PST)
Received: from mao-OptiPlex-3050.hz.ali.com ([47.246.101.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7f69asm142957605ad.102.2025.12.01.23.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 23:41:37 -0800 (PST)
From: maohan4761@gmail.com
To: pjw@kernel.org,
	palmer@dabbelt.com
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mao Han <han_mao@linux.alibaba.com>
Subject: [PATCH 1/1] riscv: Optimize user copy with efficient unaligned access support
Date: Tue,  2 Dec 2025 15:41:21 +0800
Message-Id: <20251202074121.81364-2-maohan4761@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202074121.81364-1-maohan4761@gmail.com>
References: <20251202074121.81364-1-maohan4761@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_234139_082976_318F4114 
X-CRM114-Status: GOOD (  10.38  )
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

From: Mao Han <han_mao@linux.alibaba.com>

Introduce an optimized path in fallback_scalar_usercopy_sum_enabled for
systems that support efficient unaligned memory accesses (i.e., when
CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS is enabled).
This eliminates the overhead of bit-shifting and OR-ing partial words to
reconstruct misaligned values, which was previously required for handling
protential alignments. Medium-sized buffers between 8 and 9*SZREG also see
noticeable improvement, as the original path would fall back to
byte-by-byte copying.

Signed-off-by: Mao Han <han_mao@linux.alibaba.com>
---
 arch/riscv/lib/uaccess.S | 113 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 4efea1b..bf124a1 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -54,6 +54,118 @@ EXPORT_SYMBOL(__asm_copy_from_user_sum_enabled)
 EXPORT_SYMBOL(__asm_copy_to_user_sum_enabled)
 
 SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
+       /*
+         * Save the terminal address which will be used to compute the number
+         * of bytes copied in case of a fixup exception.
+         */
+        add     t5, a0, a2
+
+        /*
+         * Register allocation for code below:
+         * a0 - start of uncopied dst
+         * a1 - start of uncopied src
+         * a2 - size
+         * t0 - end of uncopied dst
+         */
+        add     t0, a0, a2
+#ifdef CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS
+        /* If length < 8, go to byte copy */
+        li      a3, 8
+        bltu    a2, a3, .Lbyte_copy_tail
+
+        /* check length >= 128 */
+        li      t1, 128
+        bltu    a2, t1, .L_len_less_16x_szreg
+
+.L_loop_16x_reg:
+        fixup REG_L   a4,        0(a1), 10f
+        fixup REG_L   a5,    SZREG(a1), 10f
+        fixup REG_L   a6,  2*SZREG(a1), 10f
+        fixup REG_L   a7,  3*SZREG(a1), 10f
+        fixup REG_S   a4,        0(a0), 10f
+        fixup REG_S   a5,    SZREG(a0), 10f
+        fixup REG_S   a6,  2*SZREG(a0), 10f
+        fixup REG_S   a7,  3*SZREG(a0), 10f
+
+        fixup REG_L   t1,  4*SZREG(a1), 10f
+        fixup REG_L   t2,  5*SZREG(a1), 10f
+        fixup REG_L   t3,  6*SZREG(a1), 10f
+        fixup REG_L   t4,  7*SZREG(a1), 10f
+        fixup REG_S   t1,  4*SZREG(a0), 10f
+        fixup REG_S   t2,  5*SZREG(a0), 10f
+        fixup REG_S   t3,  6*SZREG(a0), 10f
+        fixup REG_S   t4,  7*SZREG(a0), 10f
+
+        fixup REG_L   a4,  8*SZREG(a1), 10f
+        fixup REG_L   a5,  9*SZREG(a1), 10f
+        fixup REG_L   a6,  10*SZREG(a1), 10f
+        fixup REG_L   a7,  11*SZREG(a1), 10f
+        fixup REG_S   a4,  8*SZREG(a0), 10f
+        fixup REG_S   a5,  9*SZREG(a0), 10f
+        fixup REG_S   a6,  10*SZREG(a0), 10f
+        fixup REG_S   a7,  11*SZREG(a0), 10f
+
+        fixup REG_L   t1,  12*SZREG(a1), 10f
+        fixup REG_L   t2,  13*SZREG(a1), 10f
+        fixup REG_L   t3,  14*SZREG(a1), 10f
+        fixup REG_L   t4,  15*SZREG(a1), 10f
+        fixup REG_S   t1,  12*SZREG(a0), 10f
+        fixup REG_S   t2,  13*SZREG(a0), 10f
+        fixup REG_S   t3,  14*SZREG(a0), 10f
+        fixup REG_S   t4,  15*SZREG(a0), 10f
+
+        addi    a1, a1, 16*SZREG
+        addi    a0, a0, 16*SZREG
+
+        addi    t1, a0, 16*SZREG
+        bleu    t1, t0, .L_loop_16x_reg
+
+.L_len_less_16x_szreg:
+        # Pre-check: ensure at least one register copy is possible
+        addi     t1, a0, 4*SZREG
+        bgtu    t1, t0, .L_len_less_4x_szreg
+
+.L_loop_4x_reg:
+        fixup REG_L   a4,        0(a1), 10f
+        fixup REG_L   a5,    SZREG(a1), 10f
+        fixup REG_L   a6,  2*SZREG(a1), 10f
+        fixup REG_L   a7,  3*SZREG(a1), 10f
+        fixup REG_S   a4,        0(a0), 10f
+        fixup REG_S   a5,    SZREG(a0), 10f
+        fixup REG_S   a6,  2*SZREG(a0), 10f
+        fixup REG_S   a7,  3*SZREG(a0), 10f
+        addi    a1, a1, 4*SZREG
+        addi    a0, a0, 4*SZREG
+
+        # Check if another register copy is safe
+        addi    t1, a0, 4*SZREG
+        bleu    t1, t0, .L_loop_4x_reg
+
+.L_len_less_4x_szreg:
+        # Pre-check: ensure at least one register copy is possible
+        add     t1, a0, SZREG
+        bgtu    t1, t0, .Lbyte_copy_word
+
+.L_loop_reg:
+        fixup REG_L   a4, 0(a1), 10f
+        addi    a1, a1, SZREG
+        fixup REG_S   a4, 0(a0), 10f
+        addi    a0, a0, SZREG
+
+        # Check if another register copy is safe
+        addi    t1, a0, SZREG
+        bleu    t1, t0, .L_loop_reg
+.Lbyte_copy_word:
+#if __riscv_xlen == 64
+        add     t1, a0, 4
+        bgtu    t1, t0, .Lbyte_copy_tail
+
+        fixup lw   a4, 0(a1), 10f
+        addi    a1, a1, 4
+        fixup sw   a4, 0(a0), 10f
+        addi    a0, a0, 4
+#endif
+#else
 	/*
 	 * Save the terminal address which will be used to compute the number
 	 * of bytes copied in case of a fixup exception.
@@ -190,6 +302,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	/* Revert src to original unaligned value  */
 	add	a1, a1, a3
 
+#endif  /* CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS */
 .Lbyte_copy_tail:
 	/*
 	 * Byte copy anything left.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
