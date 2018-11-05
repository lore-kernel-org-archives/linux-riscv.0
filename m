Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2599EC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D6520685
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rk4MuLZH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbtm3Vs9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8D6520685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t+UWX3nUUhMZ65jO379koeAG4p+PEekVW7/qLfjMSF4=; b=rk4MuLZHKJhIsj
	3tOKkdhEf9sLDDBKpC25SI1xDi3W6SW/VLqMrjP9LM7vcXCTweQVwsrUtX3zznqhFmQMQPilwmF1f
	8E2E19axi6krxXFdDrS1m58PQnvHf5cmBF2yyHbPbvRs9Gg4ogbANPQtNOddVKrExhZcPeI+LzxfO
	i/0II3efTFgmhK8QFJCm+L50AMLl8wsR3gRsFs3CjG8QmRfyduqO3w8w31TPkVG29bD+DrbLKg6Xc
	SGZj2V+lxcz0cyQne6MrwnXkR8CnCuYYyaYLvwkO8gC44tqWKBVUkCVG1wkoRJNycxBgvnl/lPet9
	ShMAYKl4oYTeozj2W7LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJg3H-0003qY-3W; Mon, 05 Nov 2018 14:40:27 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJg3D-0003fh-MG
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 14:40:25 +0000
Received: by mail-wr1-x444.google.com with SMTP id 74-v6so9775897wrb.13
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Km825+85SpwT6OL7WxEGVjzI0rN5HmKE1nN73PZAbRY=;
 b=sbtm3Vs9lnWBRIn7DYOsvY+Ohuvpk6elLiYg1uHG7Cqccvv9od9m0prQEoSWCEbciP
 k0hENR2uDXI4AiV+1tUgVA8qADQVtgrKc0dEbL2ujNTb+6gMKVZKzaU6JTECyYH1Prms
 XyXeNKihxFynukv3tnFeVrwGKk6Jbeeuu8qKhaeKTdUWvoN3bOtxmnkmuGcJ149kULo8
 jpbXc+O2Q8uVOZWzZREoA26fw9oULXxZDxPwZYpBEBRpOeV3QqMRAS1sVZr+/58BGUXj
 m5lPEYeJVKetuHnkyiXvbcv3EQXx9YoJ2HcXjXBre+s35faJ2+QrUvdA8ev5bwsVs2sx
 c8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Km825+85SpwT6OL7WxEGVjzI0rN5HmKE1nN73PZAbRY=;
 b=FdFB7J0xFVuLydzti4MLfEHXHd6y/sN37FP0h5eC4ABDeKpVxH39F5VXW9GdE/AksM
 ExuVqYEv09hQc1lNwfDIdbapgax7udo8soIbRDEsxHSYVkvyOvf5hrOv+5oX7Han15IQ
 840pHitDLjmZNK6wj/A/opzcUbQQXM0c7t70NdR3PnAbGJm2nWf8iZBBWx0zcsxq0lGz
 4Vgon75FDTmTXq82+pbyAOlbhXNJuHJopWVjDV9rBRasOjvuGrc/wMqp+VIon1a0QnYQ
 hmXaJIpj+UHK8KzxFqITNDjTXkavl3z+ExtDjhFPeQ0iVwvQAy8JTVGILbEV2NwhACpl
 IOkQ==
X-Gm-Message-State: AGRZ1gKGYKwfeiQImnYey86+ahj5iYj3z+eUctDYy3D+NX2hKMrqy54V
 fxRP/TnkJjhorgHZBo+pq2EI0HNbINI=
X-Google-Smtp-Source: AJdET5dovkIWMsL56D2YRurZepz8AHbuijPFXBFOTAhZzeikL/+QSpLNReIEu70aIXHtcanYSX6b8w==
X-Received: by 2002:adf:90af:: with SMTP id
 i44-v6mr18455036wri.77.1541428811867; 
 Mon, 05 Nov 2018 06:40:11 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id e66-v6sm3783346wmf.40.2018.11.05.06.40.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Nov 2018 06:40:11 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: fix spacing in struct pt_regs
Date: Mon,  5 Nov 2018 15:40:04 +0100
Message-Id: <20181105144004.28267-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_064023_752340_6589FC3B 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105144004.gqK4CjrLbX_VAhGP_6tkoSRT8_CRW4PrwB4aknYOGiQ@z>

Replace 8 spaces with tab to match styling.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/include/asm/ptrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index 2c5df945d43c..bbe1862e8f80 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -56,8 +56,8 @@ struct pt_regs {
 	unsigned long sstatus;
 	unsigned long sbadaddr;
 	unsigned long scause;
-        /* a0 value before the syscall */
-        unsigned long orig_a0;
+	/* a0 value before the syscall */
+	unsigned long orig_a0;
 };
 
 #ifdef CONFIG_64BIT
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
