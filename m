Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CCFC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1tooOdkeBA9IyWxUE/VyCxhKRsJqFJP84YAgP5mDzE=; b=NCTQZkIvguLipT
	vkp5kwcpHf214pHS5wtDvFwYRT3MI7OdGdnmbZAAsLpAtOTNw5cl+skDGTrb6I647EfW7Y+jmFcP7
	GdC04pnzQYd3SzFWff0bNT8Kzd+6DfT9ZrcCYNmXvrD95wvyAMKDaMPRLu++x+NCgq6nadPDmx3eE
	IZkDFJSEdUpUmvDzaqVOvcNjJhqAdNAaemJ7dZe4Fr1oM5N3bfc3sipOENR/z67r6TZh7OIQfN0kE
	9SoX3Xe3b5s42GGjhoZ7v+ytvVJ7JQq/y9gEbrpUZAWxtQfotVryxXvtCfMB7pZ979MBZbl0zstX0
	zu4pBxczc7kTF2SOImGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bWl-000SH2-Fd; Fri, 24 Jun 2022 05:06:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bFB-000HN9-Aq
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 04:48:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id k14so1110177plh.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 21:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=wG/cL1k0Db5CVASFDb2IJyBBfutIm8qgplfgRR5fvCw=;
        b=w8F/BHDTxvIXVC6FheFa0ViKJnTjyUoyIMvRk0YYdJtATT1LrUdw4skWF37W1cigG1
         8x26sID7xOkrcZRAchZerfjH7lOACfj2tmNIrBZ1/r2GPmzAKWlx6frKuZjlCffBR3dT
         cILziiDXGtRMOmeDIPoYZvVFfjJHND4L3eYFVKazXRkfaPzs5IxUG8YfnCnNLEcIIGiZ
         ucX6bRmC3mnNG88dA73+TR1MtLtUG2atpNDco24+MUvNN7l5Tt8gB3lTehD+HUIQi1N8
         eABa8iunfXAEsLk03BnTZMhn+68TeYVz2heeoCqjLyH8V0dLx6q5hl8IYX/wXoFj5UTt
         CYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:cc:from:to;
        bh=wG/cL1k0Db5CVASFDb2IJyBBfutIm8qgplfgRR5fvCw=;
        b=AT8UGjPXnd/Q2UR+5pmy43fDnsitmoCSycXl4kOTUjbHv+GtoJlkfIVySUUE9Sh8V4
         F1frRZTk4R+sOAzmyzDKWwJNpk6xpKpe+1EP3uyibYmR7zzETv9Gdhdqr/e9lzZz5E7C
         vaOV2dgg+VnnOj1tA6C2A5vwlZmIU24G7btdUJ+GCGtJHJ0DqDC9iqvSmWKCFbXNgOqy
         aCMOeG9vjjLo0zC8lMrc1SZWWSkRS1VavgF9TbPksomTwXWDEmsOCBpQ77eAljpNzlqD
         rmbDv/jj333Mk0gbmI/fgHJcdkW0/68fnkkPLtn8QWK/9kJNKipUpj6hd6YvnqtzJRhO
         aoEQ==
X-Gm-Message-State: AJIora/2MN8pD6wOAnqehaoa8bD9UW1JX06n66RWjLRr/8wXo8r1KWza
	Jenlo1E0Tx+lhUkP57pNuytr+8WmNYFzGg==
X-Google-Smtp-Source: AGRyM1tDIqY+T0/4qiFzu9A4UssddVx4//CxdxfSa1dBpSxtstyE6Y1jCr4wGD+7ippEZV5Y3XJaZw==
X-Received: by 2002:a17:902:b681:b0:16a:f81:6b02 with SMTP id c1-20020a170902b68100b0016a0f816b02mr31620723pls.28.1656046109159;
        Thu, 23 Jun 2022 21:48:29 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id ik14-20020a170902ab0e00b0015e8d4eb2e3sm651922plb.301.2022.06.23.21.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 21:48:28 -0700 (PDT)
Subject: [PATCH v2 4/5] RISC-V: purgatory: Use XLEN-length loads to support rv32
Date: Thu, 23 Jun 2022 21:48:10 -0700
Message-Id: <20220624044811.9682-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624044811.9682-1-palmer@rivosinc.com>
References: <20220624044811.9682-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, linux-integrity@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_214833_487002_23EA952B 
X-CRM114-Status: UNSURE (   9.55  )
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

This uses an explicit "ld" to load up target address, which dosn't work
on rv32.  Convert it to a REG_L macro, like everywhere else.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/purgatory/entry.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
index 0194f4554130..71c50fef051c 100644
--- a/arch/riscv/purgatory/entry.S
+++ b/arch/riscv/purgatory/entry.S
@@ -8,6 +8,8 @@
  *
  */
 
+#include <asm/asm.h>
+
 .macro	size, sym:req
 	.size \sym, . - \sym
 .endm
@@ -26,7 +28,7 @@ purgatory_start:
 	/* Start new image. */
 	mv	a0, s0
 	mv	a1, s1
-	ld	a2, riscv_kernel_entry
+	REG_L	a2, riscv_kernel_entry
 	jr	a2
 
 size purgatory_start
@@ -41,7 +43,7 @@ size purgatory_start
 
 .globl riscv_kernel_entry
 riscv_kernel_entry:
-	.quad	0
+	REG_ASM	0
 size riscv_kernel_entry
 
 .end
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
