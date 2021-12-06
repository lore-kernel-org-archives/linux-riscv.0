Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F96C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 16:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8za7EfD9PuqnZgUiX/VFLiq0ixSc0mbIvLeZB+tI00=; b=CW4aPKbqHoHfba
	k6w1steCqIYjhlgWYgkwdEAU6vXdl1ZXrXzqqIJiso4i67MZblkn6brr3UwHvWNfqUbkBwrdW/AfJ
	LJWJMtxJqlsGMhfvyZrSZQ2xQD3yXS2c2J5Gaxc4pBiGCaZaEiP4pBEcadi/haFAOaqHq7Dd2a6EB
	u1Q/p3UxYKMY0toCG24ZLl6R0j4mSvtB8dZ9lCvpqixW3vwHD3NuEhxdzTHeDIRYMweI3mmgg+DoU
	ztPhXaDtrxkUvFCGQlNeYIz37Ms/JCCU2RKdr6J/VpKu4mzXY27curC0nAZjag9v0WMcyptjRUG0k
	1A+N9HNWXpeN487COolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muGbv-004grV-9B; Mon, 06 Dec 2021 16:13:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muGbV-004gfY-65; Mon, 06 Dec 2021 16:12:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5895ECE16C8;
 Mon,  6 Dec 2021 16:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B956C341C5;
 Mon,  6 Dec 2021 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638807153;
 bh=Pwe0wYHKG5lxvAb6z5/hTI+22/H72lsdHUeOXryUv9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HTthzCPNXZsIEG0DB5CS9wiZM+kKPI1cgbZDwA9kKTHfyUBjdHKrDbAEmobT7ni5a
 xTnX6fk/MLonIW5znbVYv62epkKB55ZMZNvFFyi6kSxZr0I7Xytz3hjl4MtU6Xbyvp
 xxtrwjuSuqwMs8EyXxLd60XZuGfwz1naw9L5M7eYhlz5H8xnwfjZ0iFOHYwJUuqnyb
 +VzDdARPnLckFenOQOuw+/RKJMof/D1wBE3OTD3aHgwO56dUQV4QwMTzx2XBVPwUv6
 5L4nOMXBFT7QXKqK5WeBs1KEX4dCrxLYmkprqqk4aq5+OpMvF1mYasqr/ua1YA6pbK
 RRj8yZHjFUZ3Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Alexandre ghiti <alex@ghiti.fr>
Subject: [PATCH v2 1/5] kexec: make crashk_res,
 crashk_low_res and crash_notes symbols always visible
Date: Tue,  7 Dec 2021 00:05:10 +0800
Message-Id: <20211206160514.2000-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206160514.2000-1-jszhang@kernel.org>
References: <20211206160514.2000-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_081237_414191_A352B3D1 
X-CRM114-Status: GOOD (  12.77  )
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

Make the forward declarations of crashk_res, crashk_low_res and
crash_notes always visible. Code referring to these symbols can then
just check for IS_ENABLED(CONFIG_KEXEC_CORE), instead of requiring
conditional compilation using an #ifdef, thus preparing to increase
compile coverage and simplify the code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 include/linux/kexec.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0c994ae37729..58d1b58a971e 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -20,6 +20,12 @@
 
 #include <uapi/linux/kexec.h>
 
+/* Location of a reserved region to hold the crash kernel.
+ */
+extern struct resource crashk_res;
+extern struct resource crashk_low_res;
+extern note_buf_t __percpu *crash_notes;
+
 #ifdef CONFIG_KEXEC_CORE
 #include <linux/list.h>
 #include <linux/compat.h>
@@ -350,12 +356,6 @@ extern int kexec_load_disabled;
 #define KEXEC_FILE_FLAGS	(KEXEC_FILE_UNLOAD | KEXEC_FILE_ON_CRASH | \
 				 KEXEC_FILE_NO_INITRAMFS)
 
-/* Location of a reserved region to hold the crash kernel.
- */
-extern struct resource crashk_res;
-extern struct resource crashk_low_res;
-extern note_buf_t __percpu *crash_notes;
-
 /* flag to track if kexec reboot is in progress */
 extern bool kexec_in_progress;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
