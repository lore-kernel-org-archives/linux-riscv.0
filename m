Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309B7C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyq2FQBTrRXSejXSYmM5vMl/iah006NRZ3Qe8EVsIe0=; b=XazGJ9OH+S4ZFU
	XQpcvOileosWH1k+nT0z5olqOm1TNbc3zCmFzhZp+0zhqLd8We78R75Oc2ZrwOfkxzS3oyac4bL3u
	CVPTjEg9QwEi+bqCmL2S8D0tu3qv9V/tXYeRYs9NoV/ltyY9OZsBwzfTjdg9xv+tlenR0KKeobIz/
	CDQs+VCjVXWMjuzdYCUS98yD9u4qMDN5BF4we7+dQl/KvDzai2f4StvYDwYKFC9BnL1r7X/i51lyi
	nE/Xo3mvhsGJ1+Q6LIKiUWS2FqKhlRGW1IXosxOqAnulsRtEyAiB3vTucAgKr2ssSU6af5sobnT3U
	CkNh1Cr93HLQH4x0xMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrm-00D9xh-TX; Mon, 13 Feb 2023 04:55:03 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrD-00D9WH-Fg
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso13050167pju.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kFxia6anvFekuQwjCC0QPCBdBTnfubmGffGfTpNbSM=;
        b=Afh0xW9utFfUPrEQU4hWTDRSLlXwhIpd8cKrKCCTb090OxZcC7+dw1lGI4WLigSRcR
         SlTrKyg46yjgyducZFlnzNgMFLW5ERNIE51qDZs52oKKqKeicOr0GQ+2vSpH+tMZHU2f
         xYrN3xaSDbe059vhC8YmE0Mo0lm4LvpwwnWJlS9G0hlCENclXKagmo2zWcBcb/mdENgY
         1gAOJIewodgaQQlqmUK6bvaKGXX2/aGrqMFG9OmQDkZFfYSfsjHFpOrGmHNtyqkqNXHp
         spSkkxoNxWE3KUzm1/n3/sYW083aXMKfQdw4fAAEkBpyepXmSDGgPYoR/nS0jY3uaDuw
         o80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kFxia6anvFekuQwjCC0QPCBdBTnfubmGffGfTpNbSM=;
        b=8Fi25o32s7XJ1dGNYFA+v8gQhOp7r0I+3Oes8rmFb7nZSPURQmC/xUZJa0+ihRtVBR
         yZPA1WmfGx+KIQz3j0UageECEPfZiVJQAOOlD0q+xkk1GyytN5MaN4rG2yY2Qe0INnJZ
         /n0cMQAC9UilLMBSNoIIXbh1WHfN1qBv/2tle1eThG+pmC+BQCumEXDWvAke8Q7kHHj/
         XOT62BPOZY8Nia6y6ApDjAO+hnnzVkyvRtfYaCPGwKtRUaUYzA2cMvYdRgw82fixjd73
         a/4JnmQEuWarz7dfQkcMK9PALwLLRuMTqRu+ktGVc5GAF8KxIyZOxd3ts5UysNpoxe9O
         itvg==
X-Gm-Message-State: AO0yUKWor5ZrhExVNyvJMN1AtyaFBnvvpTglObY6t35BuM8npf7ZgdPK
	fllxLksfNmrWzKrrVQyN64kH5A==
X-Google-Smtp-Source: AK7set9VuKBu8EY+mqmdMSQsVnXb77Y1JO5W24ZyHIbOWCePXvCVZrSZJKZ86C/lIOIyZdIFSrBmVw==
X-Received: by 2002:a17:902:f64f:b0:198:adc4:229f with SMTP id m15-20020a170902f64f00b00198adc4229fmr16162307plg.26.1676264066962;
        Sun, 12 Feb 2023 20:54:26 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:26 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 17/20] riscv ucontext: adding shadow stack pointer field in ucontext
Date: Sun, 12 Feb 2023 20:53:46 -0800
Message-Id: <20230213045351.3945824-18-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205433_269158_B39C64A5 
X-CRM114-Status: GOOD (  14.31  )
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

Shadow stack needs to be saved and restored on signal delivery and
signal return.

ucontext structure on riscv has existing large padding for possible
future extension of uc_sigmask. This patch steals XLEN/8 bytes from
padding to keep structure size and offset of existing member fields
same.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/ucontext.h | 32 +++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
index 516bd0bb0da5..72303e5618a1 100644
--- a/arch/riscv/include/uapi/asm/ucontext.h
+++ b/arch/riscv/include/uapi/asm/ucontext.h
@@ -21,9 +21,12 @@ struct ucontext {
 	 * at the end of this structure and explicitly state it can be
 	 * expanded, so we didn't want to box ourselves in here.
 	 */
-	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
-	/*
-	 * We can't put uc_sigmask at the end of this structure because we need
+	__u8		  __unused[1024 / 8 - sizeof(sigset_t)
+#ifdef CONFIG_USER_SHADOW_STACK
+				   - sizeof(unsigned long)
+#endif
+				  ];
+	/* We can't put uc_sigmask at the end of this structure because we need
 	 * to be able to expand sigcontext in the future.  For example, the
 	 * vector ISA extension will almost certainly add ISA state.  We want
 	 * to ensure all user-visible ISA state can be saved and restored via a
@@ -31,7 +34,30 @@ struct ucontext {
 	 * infinite extensibility.  Since we know this will be extended and we
 	 * assume sigset_t won't be extended an extreme amount, we're
 	 * prioritizing this.
+	 */				  
+
+	/*
+	 * Zisslpcfi will need state in ucontext to save and restore across
+	 * makecontext/setcontext. Such one state is shadow stack pointer. We may need
+	 * to save label (of the target function) as well (but that's to be decided).
+	 * Stealing 8 (64bit) / 4 (32bit) bytes from padding (__unused) reserved
+	 * for expanding sigset_t. We could've expanded the size of ucontext. But
+	 * shadow stack is something which by default would be enabled via ELF.
+	 * ucontext expansion makes more sense for situations like vector where
+	 * app is willingly opting in to get special functionality. Opt-in allows
+	 * for enlightening in ucontext restore. Second reason is shadow stack
+	 * doesn't need a lot of state and only shadow stack pointer. Tax on
+	 * ecosystem due to a small size change (8 bytes) of ucontext is more than
+	 * simply keeping the size same and shoving the ss pointer in here. Please
+	 * note that shadow stack pointer is pointing to a shadow stack address.
+	 * Shadow stack address has shadow stack restore token using which shadow
+	 * stack should be restored.
+	 * Please note that we're keeping uc_ss_ptr at that this location so that
+	 * every other offsets are same and thus works for compatibility.
 	 */
+#ifdef CONFIG_USER_SHADOW_STACK
+	unsigned long uc_ss_ptr;
+#endif
 	struct sigcontext uc_mcontext;
 };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
