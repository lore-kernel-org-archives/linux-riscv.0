Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAA9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 20:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9nxe+li8GEIO8p3mv/iI1XQB7aJtW2wInq21zQF9XI=; b=gC9fx6/fIE6csM
	dR79qfUU1i2IPbq0wlNlhWE4CACcHMmloZ1/C0tnjKnilshhTHBZOUOQ6ZgGlOHd8Sv/sWSteWE7L
	yMwW3FPz/VNROAPeaVFJVbLyT9HLr7Riekpiz8DNn8k8K+GKYKjDR1MQjd0HFfjBcrVZaaDdO0AI7
	wXZQdemZBSm6hXS47e99MSc6doIARN1ihHEH5g5wirpdgVdjuR4K9e3Nm6cyOxQlxQUR8B74Bdfv6
	fRZaU1/pI/MoPTwI0jrnDsBGlfxRmwGOXYCV+VsZh8yDYxTnKZFP0U9gswEkrAv812hdlrFs4uVHT
	JzmlQQZ65aNzUKAIBvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Ej-00EURN-J7; Tue, 15 Nov 2022 20:08:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Eg-00EUP0-3t
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 20:08:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5so10449507wmo.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 12:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lem3JFRGQXteyT/VGs+SUok868Rxk0mkNrpcdtQDPu4=;
        b=efeqNe7UBWvJ9srYeZdQOEOF5c67vebzOXKSmneU4d+msHmqlQ+YC5DNc1luVUTvPn
         N8tpJBX77jqBJlufu12OzvqnUBd1J362fnM+AhC7Ddd9Y8CMlt8BrXCiMbt/73GlFRhp
         /zs+boQXvMOL7OkV86x8xrx3G6FZ4tO5YlKGs4zd4IcWguO3IlX83Cn1bAbKSgarDabI
         YKNrXvmIQwSUi8SJn9gG8BSvziVY7Xc+VKM2N0cDdGQJLHHrwu2gH+P8oeC4TPnVALP3
         dOZN74l23uMfRONFeSyTgjot+7FP0DYTcIubuzpQ7a6+nu2f4dJl2ryhbFsry3pivEMj
         kjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lem3JFRGQXteyT/VGs+SUok868Rxk0mkNrpcdtQDPu4=;
        b=Mecc4lO42CSAU074MBrCPI2QC3NovgtezsQ0hzu8nxqMjttkAcgaueQnxPUL1x8zC8
         68SnTN5kf6yL4xaGCbVLNJgbLeWIte2ihaZLGovDLbMupkYrJV7zLuL/oMOWlczp/zGW
         8txwPCyk5sLZTC6z7Hd1NEhAhHpd2K0xradzkFw163q2+Wch7Y2YQWW6txkUFw1vMvUv
         ZqA682FrVQp0zvU0OujGeLJTajZ7+imkQKsPMnG32bOaOh8vlw9xCS1nTopGNg05ujB1
         bBoPCqLA3l7D4QvrIv1YsVu0PVKIMSQHnpY8y5OlZ6AsrRJP+bILAZDXnRkBXVJt9fLY
         vEyQ==
X-Gm-Message-State: ANoB5pku911OtzCvvX0ST93GPomRKytWpRA/nWmvnMrHhsP0CgrT/O7L
	gt3DoFBLpCy+bA+ZoTiir11W01lzmwJV8w==
X-Google-Smtp-Source: AA0mqf6/Mmc4WS6QQ+6kUEAbx02G8YxbDsCrelEPePKWmDWQ6VheJGqxojM4hI832MsOFsZ+yfHMAQ==
X-Received: by 2002:a05:600c:3788:b0:3cf:6c2f:950c with SMTP id o8-20020a05600c378800b003cf6c2f950cmr2702503wmr.146.1668542922585;
        Tue, 15 Nov 2022 12:08:42 -0800 (PST)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id z8-20020adfec88000000b00236722ebe66sm13401745wrn.75.2022.11.15.12.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:08:41 -0800 (PST)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 3/4] RISC-V: preserve a1 in mcount
Date: Tue, 15 Nov 2022 20:08:31 +0000
Message-Id: <20221115200832.706370-4-jamie@jamieiles.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221115200832.706370-1-jamie@jamieiles.com>
References: <20221115200832.706370-1-jamie@jamieiles.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_120846_172946_5B210AAD 
X-CRM114-Status: UNSURE (   9.54  )
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

The RISC-V ELF psABI states that both a0 and a1 are used for return
values so we should preserve them both in return_to_handler.  This is
especially important for RV32 for functions returning a 64-bit quantity
otherwise the return value can be corrupted and undefined behaviour
results.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/riscv/kernel/mcount.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 613bd07c6268..30102aadc4d7 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -29,6 +29,7 @@
 	REG_S	s0, 2*SZREG(sp)
 	REG_S	ra, 3*SZREG(sp)
 	REG_S	a0, 1*SZREG(sp)
+	REG_S	a1, 0*SZREG(sp)
 	addi	s0, sp, 4*SZREG
 	.endm
 
@@ -42,6 +43,7 @@
 	REG_L	ra, 3*SZREG(sp)
 	REG_L	s0, 2*SZREG(sp)
 	REG_L	a0, 1*SZREG(sp)
+	REG_L	a1, 0*SZREG(sp)
 	addi	sp, sp, 4*SZREG
 	.endm
 
@@ -71,9 +73,9 @@ ENTRY(return_to_handler)
 	mv	a0, t6
 #endif
 	call	ftrace_return_to_handler
-	mv	a1, a0
+	mv	a2, a0
 	RESTORE_RET_ABI_STATE
-	jalr	a1
+	jalr	a2
 ENDPROC(return_to_handler)
 #endif
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
