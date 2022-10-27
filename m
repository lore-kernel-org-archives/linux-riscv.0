Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09187FA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 17:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfBCPZyovom6BHCTkb7L7xTXlHyx2PhcSfVyZ8W4E6I=; b=ybG8swgsHGRabg
	pVo4b8zeglEQW/GK4f+0huL6n+SgJJf48HfZd/R6V6ef3+luDgG8vL9S70lT3Qe9GkT2LXiyn0Jgz
	QKS/SwaObaE7Z6/c6nWjhw0vr3uqITDzEdYT96M+Iacqugllqtb/SR2qsNKhswugoho4KdXNkc21/
	wXjgVsEicoXkIh2EclHxYfTr0Ul17Ogp0zIeYQSy/pqw0QBI80qSiiid7l8GCreCc9Pyh+BBb/qfC
	n23VqbMjFTypIF81BvpSpdMkW4nMTbITJ2He7En49/q7nHRPbACvPxcva2fllnmyffMlWmC2UdQXq
	XrAcrZyeeCfzWzzQKAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6cm-00ELxO-3K; Thu, 27 Oct 2022 17:25:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6cd-00ELtM-2e
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 17:24:52 +0000
Received: by mail-wr1-x432.google.com with SMTP id o4so3398487wrq.6
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 10:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Foc+ZsRTpPuNp/FC+AASB+MU46pkv+B3wRisDrOWup0=;
        b=g0BOYhC0B2GvezKxGzIITKqtB5oHvShUQ3NxgDxq0Kh6MUWNqlGzcpP+vIj9sDKWC+
         zngkFCXKA9Roa5gTE8EvkpTSVDulFlkyMVXBcgRjChlB88JQsMuEEzGI/Zse1VMkHEu3
         7C3AkNgjZ3UNHzPrP2OA2doxLAa3pydl4ntlDKtiSYUX7hrrxo8U7WQT325fJFT5uEml
         ZNNhrdPO5Ux0R0YkoqA8O2/yW3AcCQDU0XTMu6XnHpvZ2eLZNFK8grMaLjRb//1aRGIc
         tdISnqG5FaeG89xhMsfcrPBpKsaACvYxQjyYPCiXVY6ITBH1ds1UOrldVFnZXwFpIZZi
         /BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Foc+ZsRTpPuNp/FC+AASB+MU46pkv+B3wRisDrOWup0=;
        b=OwTnS9DsTiSLa4gBrFDsFLP7HskYSUfXTPyk9KJ6ARM+Ax7HOLuidawA/qv7uMaM9V
         OZ8HhhYx31X9CDr16mXve2RWbQphw1/0JE2OBFlnoSGDOWoxdcxjG1WI/1qdbEYZTvwe
         WrZUAl25YdVhrQdL2biM/iQIO1FBaAQzT6EwGoCqVb1xSCUnvUhHCOOyMrk6gmZgmEh9
         Fy62k9q79H87sFX9sXBW38mZoSYj8Szfw16pOxojKraqcvb2CZZdgxbUYl01ilTiD2KI
         BRXHF5No+7OuygcNwV2uewmhKT0sPaZX+9/r332YyqYGRiBxyJANwMQ+M9/REpcCM21k
         UTYQ==
X-Gm-Message-State: ACrzQf1HFVCNUtgaXjkfQGL5DKfiiw56WZfNLpxTSq1Iu9owbcmEpEXa
	lQPhY17ha7Q6KEyDeK360A7t2B02Jt06Ig==
X-Google-Smtp-Source: AMsMyM6okfiCLYXQUv8R6rPyb5OnCgeD7zxRYBhbUepk3l9Ziicl8E8QNcaPNtnKQfLZ/YmvF0OffA==
X-Received: by 2002:a5d:4887:0:b0:226:ed34:7bbd with SMTP id g7-20020a5d4887000000b00226ed347bbdmr31391961wrq.561.1666891487380;
        Thu, 27 Oct 2022 10:24:47 -0700 (PDT)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d43d0000000b00236733f0f98sm1559702wrr.107.2022.10.27.10.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 10:24:47 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCH 3/4] RISC-V: preserve a1 in mcount
Date: Thu, 27 Oct 2022 18:24:34 +0100
Message-Id: <20221027172435.2687118-4-jamie@jamieiles.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027172435.2687118-1-jamie@jamieiles.com>
References: <20221027172435.2687118-1-jamie@jamieiles.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_102451_136697_513AADA4 
X-CRM114-Status: UNSURE (   9.36  )
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

Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/riscv/kernel/mcount.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 4166909ce7b3..5aa29509f047 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -29,6 +29,7 @@
 	REG_S	s0, 2*SZREG(sp)
 	REG_S	ra, 3*SZREG(sp)
 	REG_S	a0, 1*SZREG(sp)
+	REG_S	a1, 0*SZREG(sp)
 	addi	s0, sp, 32
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
