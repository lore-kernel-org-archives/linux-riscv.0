Return-Path: <SRS0=n0wm=N2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3140CC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 00:28:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03242208A3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Nov 2018 00:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QsDFpyqC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="ZGqqP+Gv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03242208A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IeJxLt/6h+3fghlTVWuMq48clLrvsgGa+7acYqja1rU=; b=QsD
	FpyqC/kCJGeOHw8hGtaxgoi8IasShErRCGngLX2z7Y+zfZ+9QsT1qDIChqwC+L60uQzzbAQqQhA3S
	7viS8ts4sQ/A9GZILKnLjPYnu1EVP/nsV8eRAtKg0/YrD2fC/tW2tvDzt354/Ybq9N0Rhux03Gq4y
	xE4XVwEq79QEYjluZx3dMllfQ8IRkHal1L5BdQvZLYGEBGygrzjFMft/0/X7ZJKbUj+qymHGa7dkD
	abQbtZ53TTf1Qx0ccUaxEMfikqvnKNXGrkwB0+bNZAenGCOMRlFIjmJ3UZb6hzwSgShEtN77evF5t
	qgLa2Cb7XKHUHMZN9WMwVccZyJtVJzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gN5WA-0006Jc-4u; Thu, 15 Nov 2018 00:28:22 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN5W7-0006In-IF
 for linux-riscv@lists.infradead.org; Thu, 15 Nov 2018 00:28:20 +0000
Received: by mail-pl1-x643.google.com with SMTP id b5so2164797plr.4
 for <linux-riscv@lists.infradead.org>; Wed, 14 Nov 2018 16:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=+YBnNurkqDo7ErqUbtfeyI5S4n0SWhVxEZNF1H10U08=;
 b=ZGqqP+Gvxz89We5VkbQ98KgKuA8EiRmJF5fF7P2tmTEExGi1Nixn2oUtDSHqacP3RL
 NTApvPwGWQC5u87ShFaZXdKXJYQswrMp4IM0nqPq1jjRiH96XXkhGfPMu7em6ni6X+9z
 tsPn4I1sMPT2rohyuxsCc5rZgtx9EnZXSGk4SnCDMiU8njE/LNER+GWM8CjxCqLtmGAx
 7raXT5d4a5vtCMvd7v/87zwvVm7V4YOqItL2d6UeLLEldS93epH6Y4Afwmy1Aw/XjUhY
 +B8YHBJUqaetNzdo5y5+Aocyusw8tjgm/bif5T9km2t4y0RDwgmqh4pD9PVFsE4NJbb5
 kYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+YBnNurkqDo7ErqUbtfeyI5S4n0SWhVxEZNF1H10U08=;
 b=aBMx6LJx+GsXJH47oLds0WY0pmWwmEeblcbqr2dhvGNvGn99kgoA+x9jwoL/4Qbgzc
 7yC+q8/ekQF0TT/Fm1aznGaLcxvbEymHw4NJxWMlX5DoxRGvLuW2HAClpyouOUY7P1hR
 TH8hvftvPveA/fnv7wBKBSn5bNSyNM2EZ+kpNFQkUmOZ+NrXGgJiBhuG5/GEXDV8YcVb
 iV2852Tt9sMzxAEgg3weL26Qio9HOejtasRw2LVCR3AhLjmINcM2PL1CF1SG9s9PRLeD
 MOcQZhM7OoOl2fiJslxfMtsIGuTuVwDpfeB7VTR+tezGHnQiBqmNlx2LhMC+qNG+HM4B
 wgTw==
X-Gm-Message-State: AGRZ1gIrNK+gHOfB5x9/1KJTUIpWgzHqrceiouUns71LTHEDWJeZmK8D
 /aA1vCrnzaYSE59H6HIdRqy7fw==
X-Google-Smtp-Source: AJdET5ccpmVeWWLqZ5C55DH4IVPkwN3PoT+a9D7VZaSk6mMTs9/6/VsYBH5ZsVBy4YmTgd8MRpDaxg==
X-Received: by 2002:a17:902:bb83:: with SMTP id
 m3-v6mr3957902pls.144.1542241688346; 
 Wed, 14 Nov 2018 16:28:08 -0800 (PST)
Received: from localhost.localdomain
 (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id d8-v6sm29159472pfj.106.2018.11.14.16.28.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Nov 2018 16:28:07 -0800 (PST)
From: Olof Johansson <olof@lixom.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH] RISC-V: Fix raw_copy_{to,from}_user()
Date: Wed, 14 Nov 2018 16:27:55 -0800
Message-Id: <20181115002755.24195-1-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181114_162819_605253_0C558A94 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181115002755.d1cZI3o7bpJLPdOhLcest5wD0q85OrBP2eGuxrw-PBs@z>

Sparse highlighted it, and appears to be a pure bug (from vs to).

./arch/riscv/include/asm/uaccess.h:403:35: warning: incorrect type in argument 1 (different address spaces)
./arch/riscv/include/asm/uaccess.h:403:39: warning: incorrect type in argument 2 (different address spaces)
./arch/riscv/include/asm/uaccess.h:409:37: warning: incorrect type in argument 1 (different address spaces)
./arch/riscv/include/asm/uaccess.h:409:41: warning: incorrect type in argument 2 (different address spaces)

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 473cfc84e412f..8c3e3e3c8be12 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -400,13 +400,13 @@ extern unsigned long __must_check __asm_copy_from_user(void *to,
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	return __asm_copy_to_user(to, from, n);
+	return __asm_copy_from_user(to, from, n);
 }
 
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	return __asm_copy_from_user(to, from, n);
+	return __asm_copy_to_user(to, from, n);
 }
 
 extern long strncpy_from_user(char *dest, const char __user *src, long count);
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
