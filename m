Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098C7C54EE9
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D6mxBqH5WjuMBS6Xq7R+oP6r/tkDvX84FTw4KzXwNuo=; b=Xtuhb/JfgYUltK
	kVxmkm/vdbS5soD/YmESRAYK+OoMu4ZvlEfzxR508WZRm3ImfqlIgDljP6p2FT+Zd2lPniHtqhQGE
	82q4X9js82QtwWHZubu0dWewAvTD1ZEZU5JeMZZIn40PUHIoP8EpcvdiaF7a8+nmgoyE0xvVULOfA
	ETNGoGj4qNaKe8AiZjIA6smKjGSV8BtR/ClsZA8qiPYqJGrIhi1S+OrD9MUFwxajeKkVnMP8L/bPP
	4yXfv4sG8u4WRKOsVZOUhJj2BJZiTBJ8PGFc93EeFP9Vz8Hm6g5VznkUK9CyhfNDHvq7+jQSIfSSa
	v3+eobHKcT+Wfc0Egc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZqh8-00ENKz-7N; Sun, 18 Sep 2022 09:34:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZqh3-00ENGU-W6
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 09:34:33 +0000
Received: by mail-ed1-x530.google.com with SMTP id z2so1202565edi.1
        for <linux-riscv@lists.infradead.org>; Sun, 18 Sep 2022 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date;
        bh=XXXQaq2ICA1/48RlH6TfT1kJGtpEWiZknpLWAX2p170=;
        b=23LQqFazWKz7zUsGsPqPqoFW3ZYe7awyZlO57PU2gIQPcUv/4vHgbW1hwhcX7P0h4s
         +Bnpz/GtVk3LL6xfjf5M28Pyb32vPbztUwp3xZ9eON5XrX++AHHKoZOsKue4TC/IdTq4
         PZAylGT9h7Kmkz6fV3GCUwAyo4YCwDsd21qvpjvkrIw/93QUmaebnAc48g0YwbS83FUR
         h54jsL4Al74CWxqfsxixmawz61ZyYQMFp//5xUkeoKMOfdIP5yCDFFjxDqfxwqG2XTaZ
         HQ7rmEm88s4PxD2hGfIUSiIDGipOPZ+OuqeerILbDBGQx/wszPFzB4Z3JGO8Ow4a7UnZ
         XRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=XXXQaq2ICA1/48RlH6TfT1kJGtpEWiZknpLWAX2p170=;
        b=WLyxYI3pgxZ4M8Pz7ilUerm5p0eFI3qL2qnlw1FM8VhI6Q/ld8mVBxy67sbXOcNRQU
         lr3b4haeb4OMZvFkwFm5nL+Ps1v0xNEbb9VQ8NmCwaE9gcA0sqUAzhilloNkezR0YXgh
         OVX9TtYNHLhPodlKntK2asUJQZaUZ9D78jxwbw9I1Ye6PhhTewJN84JCAMtCnU1zCl4n
         cNx7AEZkejJbjCAtFVmapqayRDkd06R0iL+sXLpaM1HLIBZP2XDmgET0PkkwhsBunrEP
         T6K7gozPn6wSeSRJyqvHsiSowjDTPK/OhLJoTzBnOTlrk2mhLOuWXpzszxcczQMsoVo0
         uHaQ==
X-Gm-Message-State: ACrzQf0H8TZXN5Bk0U/ojiBf9lTqszLmWnI0HT25UIH9c6KXcN1zWJsA
	SsWe0Veiq5BE/HejO9a1i4q0gA==
X-Google-Smtp-Source: AMsMyM5MEygK7a6jd84QrBs6rdwEv1KcL+QFkjAriPpLoerU4jmOYjj7UXbCiZ2B9ciFUcNttWK9SA==
X-Received: by 2002:a05:6402:148e:b0:44e:aa8c:abc5 with SMTP id e14-20020a056402148e00b0044eaa8cabc5mr10977077edv.145.1663493667224;
        Sun, 18 Sep 2022 02:34:27 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
        by smtp.gmail.com with ESMTPSA id k22-20020aa7d8d6000000b00445f9faf13csm17724082eds.72.2022.09.18.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 02:34:26 -0700 (PDT)
Subject: [PATCH v2/RESEND] riscv: Pass -mno-relax only on lld < 15.0.0
Date: Sun, 18 Sep 2022 02:29:34 -0700
Message-Id: <20220918092933.19943-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: maskray@google.com,         linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_023430_310438_75781048 
X-CRM114-Status: GOOD (  12.09  )
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

From: Fangrui Song <maskray@google.com>

lld since llvm:6611d58f5bbc ("[ELF] Relax R_RISCV_ALIGN"), which will be
included in the 15.0.0 release, has implemented some RISC-V linker
relaxation.  -mno-relax is no longer needed in
KBUILD_CFLAGS/KBUILD_AFLAGS to suppress R_RISCV_ALIGN which older lld
can not handle:

    ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN
    requires unimplemented linker relaxation; recompile with -mno-relax
    but the .o is already compiled with -mno-relax

Signed-off-by: Fangrui Song <maskray@google.com>
Link: https://lore.kernel.org/r/20220710071117.446112-1-maskray@google.com/
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Fanguri poked me about this one on IRC, I'm not sure what happened but
it didn't make it to my inbox (and neither did the replies, which is
kind of scary).  Rather that trying to resurrect that thread from lore,
I figured it would be best to just send the v2 as the commit message
needed a bit of cleanup.

Changes since v1 <20220710071117.446112-1-maskray@google.com>:

* Clean up the commit message a bit.
---
 arch/riscv/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3fa8ef336822..e7d52a2301e2 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -37,6 +37,7 @@ else
 endif
 
 ifeq ($(CONFIG_LD_IS_LLD),y)
+ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
 	KBUILD_CFLAGS += -mno-relax
 	KBUILD_AFLAGS += -mno-relax
 ifndef CONFIG_AS_IS_LLVM
@@ -44,6 +45,7 @@ ifndef CONFIG_AS_IS_LLVM
 	KBUILD_AFLAGS += -Wa,-mno-relax
 endif
 endif
+endif
 
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
