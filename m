Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB60ECAAD1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCjnBdswg8H3DtIl/ZtdBemF/bISAkqiKl+jctuQRb8=; b=ivQw4Af4CWN9BF
	l6d5NNfLVNx/riNuk4qDsguAZs4c35ILZhCE/3kvI5EoRGgEyhw3us0uiqxPAefPyh8USrGIuHWu9
	xlzPtKdxt97RXRmWt1koxrrjrM6G9wAAkIGcbIAg+svLnUaUv92r1U+FTRmAHO6JkTBU407WIOo5j
	HLrgfVLIZ10vVPyATA9yoOhmFp/YQio9ICCb+vu2dpTuUukIgw74P8csGXb8sxJvVcDzpxvTXH2s5
	q1l6CtWZ7SLH7bzZtF1+G7YNz0QWACyi+niw89OYWebCIGH+jIzECK2x/I2dQdFx71XK7Dl1Yvd5V
	GJ9M+vipLVHJ9zqobvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSi-007Ol9-H7; Wed, 31 Aug 2022 17:25:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSd-007OhG-Sx
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 17:25:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id bu22so18835143wrb.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DdNOmnay44tpamKMrs1LwErqXxNdYL1hnnIQ+CjZ7QA=;
        b=MG0rBr2wWp2+FARb5OnChcQ4x0S23ZL60h95CnzB7VjDZ/H2HzOa4qhBqJfaUhg+bl
         HH5NMuPrPw4BBMJ3GKz++cbp+aJPSUUdP776VpS+lgLuEgUKtZt18gnVv3ooY7nKDzxl
         vwmrQATtXcj1hDSk4rrVBtBx0sqkrypO3+3VGt8gksRuuwORrUdhboPgeoODeKhpbVqp
         W4+J069NjrhutbCY/qVWI0Pk5r3H8/XFTGFFdVfn7/SHsW0aszphuwKoa5PaZPpGYZQM
         WiwK8bGL1chbaM/cM+VZ5grJrVGRBHGb/OYSZDQwgm1s2MBXHEJqrvVJx8SRmoWWtlrg
         bViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DdNOmnay44tpamKMrs1LwErqXxNdYL1hnnIQ+CjZ7QA=;
        b=pZ2sFMgDAIgy1duonv0RdloAgRH2DSppMytS5zqgH0wwAdmQvNV2mwrmMznqTTKoLN
         px4X9ZBQIhSul2X1bhvFqrvtfCNhzwKy34O8cZiqMncKiQ7YPdBcxh30LlWxYYtQO8o/
         UzTnqsvFR9Es5Tp4tot7/CDk06ci1wOo0uhFEzUIe21J+bauKn27yGHy7ZQTEqe6ggIx
         rzvI5JVwf1do6Zcwa1WhWPiw95Bm6xhTBSfkvfyVm/Dx0kRhCD/iLjGC8d56kE6Bw82q
         6S9fhhK6lcNj81lK+mTA9+/xh+DjFYDoZrXOdVY6pc1pxXAVXDZAOr6vNaiffJd7yLuq
         FFFA==
X-Gm-Message-State: ACgBeo3FhxLFdUAIALmtszwOEaKyZ56FS66k16fPVv6v+FL2jyCltk5+
	JqfUx3BCRfujAK9RchYW/egYu5FoqA9jGw==
X-Google-Smtp-Source: AA6agR4D9tdHfJxgAr4odD2uA9lewMl1R3XYhjjgYG/X1gSRjA2gExwl6O2ex2Vl5wzSh024Cw+XvQ==
X-Received: by 2002:adf:d1c5:0:b0:222:cbe8:f9fa with SMTP id b5-20020adfd1c5000000b00222cbe8f9famr12286408wrd.383.1661966703923;
        Wed, 31 Aug 2022 10:25:03 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b003a5a5069107sm2618214wmq.24.2022.08.31.10.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 10:25:03 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	mchitale@ventanamicro.com,
	heiko@sntech.de
Subject: [PATCH v2 1/4] riscv: Add X register names to gpr-nums
Date: Wed, 31 Aug 2022 19:24:57 +0200
Message-Id: <20220831172500.752195-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831172500.752195-1-ajones@ventanamicro.com>
References: <20220831172500.752195-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_102507_938636_83172548 
X-CRM114-Status: UNSURE (   9.35  )
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

When encoding instructions it's sometimes necessary to set a
register field to a precise number. This is easiest to do using
the x<num> naming.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/gpr-num.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/gpr-num.h b/arch/riscv/include/asm/gpr-num.h
index dfee2829fc7c..efeb5edf8a3a 100644
--- a/arch/riscv/include/asm/gpr-num.h
+++ b/arch/riscv/include/asm/gpr-num.h
@@ -3,6 +3,11 @@
 #define __ASM_GPR_NUM_H
 
 #ifdef __ASSEMBLY__
+
+	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
+	.equ	.L__gpr_num_x\num, \num
+	.endr
+
 	.equ	.L__gpr_num_zero,	0
 	.equ	.L__gpr_num_ra,		1
 	.equ	.L__gpr_num_sp,		2
@@ -39,6 +44,9 @@
 #else /* __ASSEMBLY__ */
 
 #define __DEFINE_ASM_GPR_NUMS					\
+"	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31\n" \
+"	.equ	.L__gpr_num_x\\num, \\num\n"			\
+"	.endr\n"						\
 "	.equ	.L__gpr_num_zero,	0\n"			\
 "	.equ	.L__gpr_num_ra,		1\n"			\
 "	.equ	.L__gpr_num_sp,		2\n"			\
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
