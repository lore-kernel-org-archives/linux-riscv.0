Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978B9C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 15:51:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63BF060F5A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 15:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63BF060F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFVrxTbURlY4SL+QAT5frVympbgLW5hG6sguvJ38wAA=; b=DchA/qfjK9PF86
	6S5dC5Qjq/PF08BrVEZ8TP3SNBvo5Y7wuXYJNEyRSzC5hR5nHgag8fGp4exetQ5GbI6PI4porkpAY
	JG9Qowp93Vlo220MUXL7orOwNKMHzGfa7NMUVqWTo6qgRbi1/ak7qSgWSLD6LLUvaG4Xi506R3xn8
	SnQXbS5NrCvJuFr5L0HLZP+I/QGDwS+gja6ZBUlEoC4WTJAWqUfJAL5rxYcN6UdMU5LR1g4GLoClk
	65N5b/lB3HJKD4UtijoXLtzzmKGTX2xkCko+tJTWgNqXPNvSsALGfxPYw+4pqK3Jk0FsW/rJaHs4b
	Y0TRoWIyvlwFhznNYebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhw4k-002C9L-9G; Tue, 02 Nov 2021 15:51:50 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhw4h-002C88-6d
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 15:51:48 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8D178212C3;
 Tue,  2 Nov 2021 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635868303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Jn3BaAn3lExYJcPf9xUO6RYJ/5roELy886njRhgwJY=;
 b=wB/1cmf5b6RnbrrA20EJZzimJvULePq1Q91n5m9al5Y+o5W4DDQbL8KMqNyXnCMDaYU96Q
 /+bUednnEYrxG1wgF4oLwOcQzWohrJAUwmenR3R9lK1YOmhDdcj8FuvxpV6Bo2+/mkBZjO
 TNcHox+RD6VMaQx3xdVqpQ7S8PO2iBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635868303;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Jn3BaAn3lExYJcPf9xUO6RYJ/5roELy886njRhgwJY=;
 b=x2VoycqqmoqL5TlYQH6i+IRqs0XEjjGWxwkvnjIbVdtXTSaETvxlUhmsd1EGjdaPacL46G
 3Dx5fVZr7FId6aDQ==
Received: from hawking.suse.de (hawking.suse.de [10.160.4.0])
 by relay2.suse.de (Postfix) with ESMTP id 80F14A3B81;
 Tue,  2 Nov 2021 15:51:43 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id 666894431CC; Tue,  2 Nov 2021 16:51:43 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Cc: Saleem Abdulrasool <abdulras@google.com>,  linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,  Nathan Chancellor
 <nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Bill
 Wendling <morbo@google.com>,  clang-built-linux@googlegroups.com
Subject: [PATCH] riscv: fix building external modules
References: <20210804173214.1027994-1-abdulras@google.com>
X-Yow: An INK-LING?  Sure -- TAKE one!!  Did you BUY any COMMUNIST UNIFORMS??
Date: Tue, 02 Nov 2021 16:51:43 +0100
In-Reply-To: <20210804173214.1027994-1-abdulras@google.com> (Saleem
 Abdulrasool's message of "Wed, 4 Aug 2021 17:32:14 +0000")
Message-ID: <mvma6imr1ww.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_085147_437373_7F005965 
X-CRM114-Status: UNSURE (   9.87  )
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

When building external modules, vdso_prepare should not be run.  If the
kernel sources are read-only, it will fail.

Fixes: fde9c59aebaf ("riscv: explicitly use symbol offsets for VDSO")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0eb4568fbd29..41f3a75fe2ec 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -108,11 +108,13 @@ PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
 
+ifeq ($(KBUILD_EXTMOD),)
 ifeq ($(CONFIG_MMU),y)
 prepare: vdso_prepare
 vdso_prepare: prepare0
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
 endif
+endif
 
 ifneq ($(CONFIG_XIP_KERNEL),y)
 ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
-- 
2.33.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
