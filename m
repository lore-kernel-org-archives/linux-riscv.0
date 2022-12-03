Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207DFC4321E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 03:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfWVmCJquFOMNIXbK0rd5ovzdrsHGQMWCs2VOYM3BtU=; b=z5Bba/2SQ7OlnI
	Sp45A8V/5dXbIDowWhO072TWur+FedRiKl++91UOSg5cjd9j3ZIw1MK5HUn7aDNwLXXH/Hl4rVpEy
	ps4+nfUfEeU3n1FH5DlVYcyhEcd70xadoAYOvii6x4nl1VkFSGPSmxMe1qNWNBUfVz8nWMuDf3twp
	wecBPvmJy/wqm7J5lcyAqd+fRZIoExFRt+MAAuGvA7H3/gaGQxmpdFayGkSJFNCIZTDL0wiskMrca
	UWj0uysUriT5MiXcYw+Nrvv9xN+50RPNPrkgj3mwBCE9C5zBClvhfMmOwvgjKj8Tp1Kc0jywQj/kV
	5juIHuc4vzV20Y8zYTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1IrZ-002B8l-VK; Sat, 03 Dec 2022 03:06:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Iqb-002AeP-Fg
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 03:05:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id q15so5534554pja.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 19:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhR/DvZbp+3vR9eB4A5wFYKGQTjA+LqOJxd/xHKwNw4=;
        b=KpJKmzUqKuY7RNz1zoEByIJW90y1Livh3n8yRVCtF7Wr2SNUWd5EFqo0EjjNi6loJv
         TlFuL2eEbd8DZ8FBCGv2ReWj958YzPC2Tt8AZagpgWofFTbPz3N9Aoss5wquaRZv35pt
         zf534yNV0g0gfKF8Bxz3qsNDzOBS2wJGcO2gP6yGN2p/yU3fATEm0f/qdKSMHwBwAsqk
         jnSfc+OaPsVevmGerR1dP9afYP2sPSSOlwlnAwWpFHuq0XqOLftSexffps5iSRlfBRFT
         fJHeyOjJR8qw7F5Bxhqn6UBDRAZfg680T48PHv4bOtksy7UlERFx7XNKzkB4IIToom71
         zAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhR/DvZbp+3vR9eB4A5wFYKGQTjA+LqOJxd/xHKwNw4=;
        b=0As16zIiSMCJuWsxlbxLa6EbAS0MsqqEZoghwqgpsKaulJJqhUVzuipOCtEUc4BE5h
         TrxW3RTtWpb5+COFgkYItw0XXpJ3eySKFPP3Mda8Ggq93dgI5B04EYoqeto986g0Uep1
         3dAWzJYTO70XMlsK3KX8ekzdt1OgIC5gNSSNW3g5piQmxFDqCe5i7OtDve+8xYWj2Sgg
         d/x6xNKROFraqWXSqN7vP0FwBnm96MvEtT3DBJTOB8WGde57PUJ/ddFFsxnyWwjvIO1Q
         XmpqpknMZlfshuoJYLS0hFB6ttpb7E/lfLj2AUVLlM/UnwIkjRby3WdNEqkPoMqRhl9S
         phRg==
X-Gm-Message-State: ANoB5pmU8cgFcSLJdTdB36qFo0v0fpJXYrTSYkBHDSZcdbec2Avtnmh9
	2++ZqbIKGdX2j/1dtcFxiTJr6w==
X-Google-Smtp-Source: AA0mqf7bOAyepA04ituLKXHZJH3uQ4cqneDkfqNEF7GDlldsPNuzsJMKn7BDVi7Zx/YGZ+BpcYq8AA==
X-Received: by 2002:a17:902:bf06:b0:188:d3b1:dbfc with SMTP id bi6-20020a170902bf0600b00188d3b1dbfcmr57933988plb.127.1670036744950;
        Fri, 02 Dec 2022 19:05:44 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c11-20020a170903234b00b00186c3afb49esm6182561plh.209.2022.12.02.19.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:05:44 -0800 (PST)
Subject: [PATCH 3/5] arm: fault: Convert to VM_FAULT_ARCH_* codes
Date: Fri,  2 Dec 2022 19:03:54 -0800
Message-Id: <20221203030356.3917-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203030356.3917-1-palmer@rivosinc.com>
References: <20221203030356.3917-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_190549_535519_1C620827 
X-CRM114-Status: UNSURE (   9.51  )
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

These conflict with VM_FAULT_HINDEX_MASK, so move to some designated
arch-specific values.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/arm/mm/fault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 46cccd6bf705..7063b875b05f 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -201,8 +201,8 @@ void do_bad_area(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 }
 
 #ifdef CONFIG_MMU
-#define VM_FAULT_BADMAP		((__force vm_fault_t)0x010000)
-#define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)
+#define VM_FAULT_BADMAP		VM_FAULT_ARCH_0
+#define VM_FAULT_BADACCESS	VM_FAULT_ARCH_1
 
 static inline bool is_permission_fault(unsigned int fsr)
 {
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
