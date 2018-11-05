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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939E0C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:36:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B7420819
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rznhAU2w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPhwSxe+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66B7420819
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H33CMmuGxDDgNDzHH72g46VmtlZ5nFLd+hFwfccNrtI=; b=rznhAU2w9BhfdW
	zlxGKydHipsM2DL5WWyN6m4djSu9XSiKCvaPkKNXQiNMjVC6F/HFkEmn5xcx4n/TPVkyMpDIIY5lF
	BuztImeIfyKMp8+dihfNzYXi9tqEhxtOe+Pj64fiwpdfKjecNNLVvvPDs7ZP9aLvkPXhwP/DmBDRj
	srUmsixtM+2kSgKo0chTOWCpBJpdDD05mqyXOmeDSIeaOzzuf1x7+idiY1mTpRFrzA2N2idOfRmqj
	4A6AxJopUxjTQq5laBJwPraETjmVINFRTUt72LMTwnMSiyyFbfYzpybJ2Auv8YgIYa3bnaOUmMohM
	5ifrvLuMl0FCgShvKPpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJfzK-000188-Bf; Mon, 05 Nov 2018 14:36:22 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJfzA-00015u-Jb
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 14:36:20 +0000
Received: by mail-wm1-x344.google.com with SMTP id l66-v6so2452997wml.2
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 06:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rll+3a6sim5r4iYb/OVW+ZQ3/aG/mb9q23Uc50bWxkM=;
 b=UPhwSxe+xd5ApS0SGX7RRPT9iC640prbYb+ufqJzx/xRhImUP24PSbxVYz5QCUXajs
 iaVCFn97C+rEwP26+8fcXO25BrCtX/9TVgtVoZaUidFr80PH9g6ZgVS6HBbnZpRbaHVo
 4w++QppRHcRK/klBRrlDjnb27668glOqa0NQxrtD9E+GMzv0BNZXBuRcDnQr0ySl09cO
 Z6t4RfxPPkmVm8kqmDJ9zPyxfN2mTqbc2kfp13u4ZP8nW2z/DcdKqriV6uyDptQTH887
 CEkKOUoXdoJNbTZ3iHEmjPAM8j5jf3fgj2jaRX1sGk+ku0DFiRf64jIvBLnBg7nmofeX
 IM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rll+3a6sim5r4iYb/OVW+ZQ3/aG/mb9q23Uc50bWxkM=;
 b=eK/+tq8bORtMmvh3lKaA3yOHUwS+K3pp9iZwJ3D/UqjPHJjXj/S5SfxQlgSdGZAIqr
 O48G4/FsVK+n0xgYDrpFfMpT5blSL3h+1TC/n3x7mj+wHcTUtkvUxgvhDHqT0ECjzJBA
 3iaubcv/5ZrfAfMgkNINPuc/IQBK6udmtKr2A0kpFu48MdbB/EHSJGrJdqu/O6cXS8Wv
 cpiCWdAjmeapV8AK9LplWriQUCr5ZwvZAYWBFYiSXDhuorCP5YXZm5ZCQFFzmhUOnn8p
 IZ9xUoRRYdlQpQmrGHrYyqRQ7NQ7JxQaUaqmzKydOlUa080S9lrEkneNQgF8u7QwiTSR
 q8ag==
X-Gm-Message-State: AGRZ1gLOYcxVrdIonqB5qWfR/tUHZVF+DSUeBfl3zfHIfMpSNjPMWTD5
 Qd2PNMl1cTgq49vsNyseTWc=
X-Google-Smtp-Source: AJdET5dkbYthTquJ1fz5I9JyOvAsZ+xcKOTMGCZUBedWT+QuvPspKj/So+TSJWYIm7zjGVmpljTfxw==
X-Received: by 2002:a1c:bc82:: with SMTP id
 m124-v6mr6715758wmf.47.1541428560725; 
 Mon, 05 Nov 2018 06:36:00 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id x139-v6sm15473731wme.3.2018.11.05.06.35.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Nov 2018 06:35:59 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: add missing vdso_install target
Date: Mon,  5 Nov 2018 15:35:37 +0100
Message-Id: <20181105143537.27396-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_063612_644856_0FA3619D 
X-CRM114-Status: UNSURE (   7.27  )
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
Message-ID: <20181105143537.t9GLOVIAZGFRkn-PRP9_mQLmpypLgQDEGXyG65z_IEE@z>

Building kernel 4.20 for Fedora as RPM fails, because riscv is missing
vdso_install target in arch/riscv/Makefile.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index d10146197533..4af153a182b0 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -77,4 +77,8 @@ core-y += arch/riscv/kernel/ arch/riscv/mm/
 
 libs-y += arch/riscv/lib/
 
+PHONY += vdso_install
+vdso_install:
+	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
+
 all: vmlinux
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
