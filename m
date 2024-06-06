Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29478C27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XNb6wHs/Obs4cPy/EnqqpYFQ3YI0qX6N5WJ6KV9tGcA=; b=ipyugyZ2L0twCp
	fIhUUqRYJyAumKsAEMePdkhVaSHOm2Isu6vFA6mjx99OOVNzK90rhNbgHuUZRJJq98pViXdzRLeao
	uYy6UkoysqJPCpeXeRWOYKPDF7shfBSyuMjftHhkZoupCSzvI1IbtgCW1Lx5tYblY+X+VyJMVmDum
	uwDgPvZmx0LqApchydsbBHUJBYEvnOW83QxEQ3dxiwq9uE/qyKhxjW1Fh4XpBaTCwBHezbK9P3KUw
	x7H/E288evvSlV4ryrCB9hqDzuwb6/Z7D0QtYySLes9ObwcbueqH4mJxHYb3kZbBFiNKocOmgJd9t
	QA3Q3yc3Sl6ui1SkAEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHqS-0000000AwpC-1nIX;
	Thu, 06 Jun 2024 18:28:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHqO-0000000AwnY-3ipu
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 18:28:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f6342c5faaso11974465ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717698491; x=1718303291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnjrltBnoDUBuMjYPvFD9/BtWTyCCjyld10aySgsRYQ=;
        b=l+fiZkkIruhX0Vq9Q5IOd8zuBEsgSvdJWTM4xrhlI9E9NlZSn+aCQYZMIqXyFjCapd
         FnktR0BehCCjmvvzM17nzPQ2OV1x0GfRjmvrmekLbtoI/CYuyiQicmhcvT44wRQMnlQN
         /gLCOKeBvZwNLThnpSkDI+eVFdxZBVtx1UkrqG9k44XiZCY4fc818QCDJiMtaYPA1Bu7
         H2YRm4xwwBqfNUMRHj/NOxWF9bUaH5CSBKOpCGsZ4rwmu56i2grSXxPukgaez9EU7zAW
         8gYFFAl0n00Mb+d+6hVVq4pPqBJ4wn7vj+JZIpWA+OXum4LZaXjK88NhJ6zagGc6TgX1
         n1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717698491; x=1718303291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnjrltBnoDUBuMjYPvFD9/BtWTyCCjyld10aySgsRYQ=;
        b=fjL8HjOKgE2XYXhdR1xqIgXTZQm+qAIa0Oq0nJ9jEa/MPZO48kABtW8SPqQBRGHFD/
         N46bJzWygeaIm0U9Anji7Lb2thizyuvJC26f9vkX6wUda82r+k8GccCKYdjrl/ZnOMti
         LQukgGCkEU3qbnHgN0XNR8er9KTEcCmHpv5vujHfw0f7pmGl7pvsBu4Ok+nTcDxc4M8D
         Cm7SNkxHXoDYE7yCVZKIvL7A8Q2V+eNB1tFchu6qbgVKOwNG3b3+S6YySaDgonyUdjit
         kyt38AtjB9AT8WbiGciWRM66iSwpfUQMhgdhu2YM42QY16dUzy02wSn6UsSVFFhCCP01
         G6jA==
X-Gm-Message-State: AOJu0Yw6wW8oJzxuzhqsvdIY1Djn8lHfesOqNWQ7Ih9U5XHHE1J0lnvw
	vYziH3ZrbcUWVVWN9kIamIxLnwx8be3WL3ZzhAAXUocGX4A0BHfe2A+TYBSZ99fHhOuSXSnqi3N
	qC74=
X-Google-Smtp-Source: AGHT+IHFogoDpFoL0fyeOw09KtRwYuvv9EThx7HSbC93vFGnNu+pzJGBVR3kjG3MFGlDR4iCZSXrkw==
X-Received: by 2002:a17:902:db0e:b0:1f6:6407:cf85 with SMTP id d9443c01a7336-1f6d0395b10mr4076855ad.53.1717698491085;
        Thu, 06 Jun 2024 11:28:11 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7ccfd3sm18400835ad.132.2024.06.06.11.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 11:28:10 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nam Cao <namcaov@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jesse Taube <jesse@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: fix vector insn load/store width mask
Date: Thu,  6 Jun 2024 14:28:00 -0400
Message-ID: <20240606182800.415831-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_112813_075805_E4E114E4 
X-CRM114-Status: UNSURE (   9.21  )
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

RVFDQ_FL_FS_WIDTH_MASK should be 3 bits [14-12], shifted down by 12 bits.
Replace GENMASK(3, 0) with GENMASK(2, 0).

Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/include/asm/insn.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 06e439eeef9a..09fde95a5e8f 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -145,7 +145,7 @@
 
 /* parts of opcode for RVF, RVD and RVQ */
 #define RVFDQ_FL_FS_WIDTH_OFF	12
-#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(3, 0)
+#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(2, 0)
 #define RVFDQ_FL_FS_WIDTH_W	2
 #define RVFDQ_FL_FS_WIDTH_D	3
 #define RVFDQ_LS_FS_WIDTH_Q	4
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
