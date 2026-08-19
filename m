Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A76C5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=didfoDpw57KhHmJxUkHbPMx1LubDbDYKWA/fLqkg2pc=; b=w03/+N/SNRDmvI
	PCgx5Z4hKkq2IeEmOlZKBFlGDn8QZEMyr+hYV3Jd3vrqUIIbFYrs/8hOLm7/P6gEI4jR1lsKkhPx5
	CU2BmSQ4COH/5MCqDCgPyYjTOpNPbhMHPcuryaqJsklzCoGDm60gYqweAQsq6qwRwG3FntQyxgJwT
	HFo1J+BjFp2ElCDskhDUTw7zDiPmLSnJECMr19HUoemswVlZykOB0tc8AI1dWnkV+HHxQ+T4H2RVX
	xL9e3f1JMnScavN1suEBVs1NTK40yf5atZSkTjCAfoyNNjJr8Y+dA9aT5V9mqqmqZiBF/yymF/KTF
	YEZjmRG83YrxQob0SHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbyY-00000009Kyz-0lOD;
	Wed, 19 Aug 2026 08:48:46 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbyV-00000009Kya-0ckv
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 08:48:45 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso967969a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 01:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787129321; x=1787734121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQ7keLJ8medHWvNAYhKdIsoM73FCKMrfDS9RRH+9RkI=;
        b=S1640e0qC/8ZMV8UHyVhQ2MMnTJrQ+lmUBdrKqXQsdlJ3x3pTSzt65smoFl8Vt0adQ
         optbW00ONM/yz7TgAPXFTVG1JZpCzuA+mJgUzu3Fb3BgZRp+utpnFCC1HWviDL1EWCqT
         fL+zTb8dLvqDCToC50MNmnbaA1jfCB0AY3Qmnw2vr2vCVykZlWet6ZGzK+/XHdYjrcta
         alegLI//8YbxiKF3Iuq/eth8+nicoep2yGDUjSfGZAtoPNeQZ7+Detnh4L/c/WlvNmJo
         JMmZHjN5mmQKgqOD+CBF5ck27mwqDIGfazcRri3vH16gTDW9HZVejPrZDEYq9dN91o5z
         0o+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787129321; x=1787734121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQ7keLJ8medHWvNAYhKdIsoM73FCKMrfDS9RRH+9RkI=;
        b=KAlGJOCNWTTW4Nf9zF0boiT3cYpJk6BI13j7TBg6udtUlsGUdpCFSkExplexLwgpme
         dumBZjnj79GzzylzCjcsmCqBkj/6pAjJiDKPPAuBmxGGO6rkmcx+QXc/PMEuuBRSAmjb
         JIe+hRmQDHEoJwt5jvE98M0ZZEcn0N/+Sd6HOFzhhDVGrXud0HBhth+mwfZg2PlEGMWi
         aMS77jaNw/fGItO4Vgx4av+REs6DnBe/cTgP2uQuz3Dty/AthMOgxMRZefPTjDtheN/R
         VRuDiwxqAJVTDrSp2zyCVTS8ZxV2qhVhjKuKRJ1/pIvNJpStG99DlLeLKaRhlgI1yvc4
         IRoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtXM4oUr5PoABiPWoITAjOWZG3ArQlv53pwaDYtjAI9YRRD45M3Y3CoKohSeYsXUeoItUJaxAVXwdeYg==@lists.infradead.org
X-Gm-Message-State: AFuF++layf19F4IsrW9rxjXFaoWR2RGE+vBr97KCYs2JjeJFB6KFBT/P
	9D0lHduANBBjXIFGfQDBB0opGw+Nhz06hewmeVTihRRaRLqUm3LSzACD
X-Gm-Gg: AR+sD134XwxhTNGT+Cc+e09RUsuewYaEQix4K/S/FN3E9YHRSV5pLvTnW0ivk/89QNB
	u80aR3PnoakbI0cEiM0ttD2xtE826Z+CCnMHojH7YfT5YnU69oiLA+LoRlTxeZuuUXiZtrR+Rwa
	1Wm3+X+Y2chVX1NpKDuQEiKk85XWpWyATth/Uytl1tKhC6X/p9DPBE2VIzZznRStiOB6DKThmp7
	rQFJI/kYIzXftgpTdqvMDhX0Zsq0nYrDhVwG65DImfiWdwLWO035RtWpnL9Epe8rRv8nznhpmw1
	zw/oIXLc8yXxvIRwgu+vh0uzYaBthNqDfV/tafaeeFu+aLj+dansrC25jTCQ6PyHqjxxdZKKM+A
	Li/9bc4k5zzkTKczTSUjpULtC+SJlHfku3e9i6LFakXka6qeWU84/arO+zNvcCP2I5iqE5PNKty
	yXcUifvwzBcFSYFDMp3xp+nEpDc7Guyx1kPXIDEgmy/gHnE0/8hgkYHlTNisT7lrkQg3zMX9XER
	GBO1/uX8EbGvo3py2divD6CLwYz7pHZYx7TV+oyWw==
X-Received: by 2002:a17:90b:4cc5:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39580ed0a57mr6214530a91.8.1787129320646;
        Wed, 19 Aug 2026 01:48:40 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf13f4bdsm5154174eec.20.2026.08.19.01.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:48:40 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	thuth@redhat.com,
	mkchauras@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Wed, 19 Aug 2026 14:18:25 +0530
Message-ID: <20260819084825.969116-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_014843_197207_7A84B54E 
X-CRM114-Status: GOOD (  11.07  )
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

The Rust kernel infrastructure generates inline asm for WARN() via
ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
arch-specific asm template string for use in Rust's core::arch macros.

powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
Rust builds to fail on powerpc.

Refactor _EMIT_BUG_ENTRY to accept explicit (file, line, flags) string
arguments rather than relying on positional asm operand references
(%0, %1, %2, %3). This allows the macro to be composed as a plain
string concatenation, which is required for ARCH_WARN_ASM where no asm
operand context exists.

Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
the BUG_ENTRY() call site to preserve existing behaviour while enabling
ARCH_WARN_ASM to supply its own size operand independently.

Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
convention, indicating that no additional reachability annotation is
needed after a WARN on powerpc.

This brings powerpc into line with x86, arm64, s390, and riscv, all of
which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.

Suggested-by: FUJITA Tomonori <tomo@flapping.org>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/bug.h | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..8aba39e0cf26 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -32,34 +32,38 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLER__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.4byte " file " - .\n"		\
+	"	.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY("%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY(file, line, flags)	\
+		".org 2b+" size "\n"			\
+		".previous\n"
+
+#define ARCH_WARN_REACHABLE
+
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
