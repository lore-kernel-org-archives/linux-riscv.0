Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63409C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C1L/vZHfITte8/FLCihLCw7ejEU0XgouOR1l8di4f2U=; b=rVcczFk7wiEqHj
	vwf4yscFTzM7hr71CtGo4ZL9y4C3hvKu7TxZdtB6hjaEmFlS1o/XsmnqC/SJUGC74mwzNQgQ3/hTz
	0oxmpixmZeclND6xP0+YO2PaxPmqxhIf/YMQzHdwxlgJuu3Dzdmjr1UEMbjBaff45uXvqYUvlQU3e
	8Vqabc3k3lnK3PYf6aknEttFxIgyXvCPswIkkPGLDvjiC91S5OGZeGdf2D81EwSghjOrVQfOYVYdj
	MH/I7COlXb5t0RGzHKatMzn4OPhSgmVKPKCNcZISDO3jw8c0VjenNkUOnqzmfkFFFj34tWKI8Twi8
	6kSMv5W96m9NiqgjWfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeHL-004UrD-CW; Tue, 20 Sep 2022 14:31:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeHH-004Ung-Pc
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 14:31:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso6999124wma.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 07:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date;
        bh=kJEjRCn27Ik95iVvsLYFCVLVuES5oubtuur+rwTB+gE=;
        b=pMEe/wd79uhcOl0pQ8OA9IGF1yYbVXyQLkgVIQIGmYQVbdE09ojNXDGIymVWPnhg0F
         2t6Eti/ZZ5lfb6D2FGY4WIZvg1j8dcEVqvgpv7rd6plL+Ktw31LQbk7yA9xytBo2F8nh
         Q4ybMlcFQjleQYnXSIsjYK1e2vIZjZ0mrOs5f80iQxvzmf2BTqGUxahdOTcwoIwZnqDT
         JnHagtSGI7nJn5/xXQafZle2y9ox/Jc3XW+EEyRrpSLs2bvBmrPiUBP6pZAVtkS56qHw
         /gmTAEAwD+qDXQ4d8J4WcuksaQSwW89TuG6W/h+b4Yd2YMenjUr0ajfKD1y1q/6P4T0z
         rouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=kJEjRCn27Ik95iVvsLYFCVLVuES5oubtuur+rwTB+gE=;
        b=5TjorMjuWHFvqOzwWezkF2v1VWBm52oQ/ZKWF9XnnmtM+bF2/Zwg/PsP+MXNs8wgUE
         PxTGnlPpYwRRLxE/+zFyiNwd6UAJiwss695xXFOEj2AEGJxr+kl4amckkosMK6lXOfc9
         vBfqVQ6KVs0a7lJfTWUAE4vGBD/R2WbyDlY+TCL433GHaRoiT5a7Mv1koKzZNZmEGrsL
         OdXAukCOH+IzjOaiLQBFrxpmX3j0Ty0uBc783DU+zOcOOcX1Ng/rRMfN/tQ+J1PbPOOE
         ut3wYM4Mf+mt99trn0gPYbDBXksQgI+a6nL/5kUx/cCFlTASjYtoKoczGcFnvFz629fl
         8ukg==
X-Gm-Message-State: ACrzQf2xMc1njZg9HGYGa0N7BA/QBJmyS7CD1ERkGswUc1NukWF0gmWa
	UWRg1vheEAoUunLhh8ZS6Ufm8w==
X-Google-Smtp-Source: AMsMyM7JG+S944o33e9uvzcT6EOgx2Vlc7hpSLL+cuXy7uC9ZY984smB63l7jZZYM+X4URFNObJHjg==
X-Received: by 2002:a05:600c:26d2:b0:3b4:7572:4317 with SMTP id 18-20020a05600c26d200b003b475724317mr2752449wmv.134.1663684268608;
        Tue, 20 Sep 2022 07:31:08 -0700 (PDT)
Received: from localhost (p57a238e9.dip0.t-ipconnect.de. [87.162.56.233])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0021e6c52c921sm204827wrv.54.2022.09.20.07.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:31:07 -0700 (PDT)
Subject: [PATCH 1/3] Documentation: RISC-V: Fix a typo in patch-acceptance
Date: Tue, 20 Sep 2022 07:01:37 -0700
Message-Id: <20220920140138.27210-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_073112_122630_E0238DEB 
X-CRM114-Status: GOOD (  12.17  )
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

I just stumbled on this when modifying the docs.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index dfe0ac5624fb..5da6f9b273d6 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -29,7 +29,7 @@ their own custom extensions.  These custom extensions aren't required
 to go through any review or ratification process by the RISC-V
 Foundation.  To avoid the maintenance complexity and potential
 performance impact of adding kernel code for implementor-specific
-RISC-V extensions, we'll only to accept patches for extensions that
+RISC-V extensions, we'll only accept patches for extensions that
 have been officially frozen or ratified by the RISC-V Foundation.
 (Implementors, may, of course, maintain their own Linux kernel trees
 containing code for any custom extensions that they wish.)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
