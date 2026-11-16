Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC7606A338
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 03:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ucen07vI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=HZU073pi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jZlWxDKIbSICEwjikF9Bemg7q2GdPQL7R66DVNsFKuU=; b=Ucen07vIaAUs3J5IG5EZecRqZo
	Reiui/+eWCMk08qD8DD7elgEzpkOYoQudTsdmgDUcbnPZE2oBqxxmPY54vaHJqEPXhR+1G+Jy7yQw
	UQgbF+B50F/q9+6Q3nKOhUHhmtX5JQ72rmRp5v9qog71ZgZsJHUNNc/p3c6JAfrJlyzwqTwyMXuRK
	pS/1kMLNLxh6KUC2XvZaT1MAwJ824UuSb9jTQ2rC71uOddrr0K+Cb3b70aFiwJV67UQRHyGo3W/20
	wWY4lbRyGdUCGZ8843XNzG2PUlJZb63+y4XqKZjePh3nH9H9FNd6if7XAkCR89vfMB3A5KXMUBgRh
	35aOb0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnMA-000000012TN-0Dkl;
	Mon, 16 Nov 2026 03:26:10 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnM8-000000012Sy-0c1S
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 03:26:09 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2959162eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 19:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794799567; x=1795404367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKCQB/Fkd7oKivhdMJjaV0uk7dFPCE0pzO3P5Iy4dPU=;
        b=HZU073piMoz0dwVod9L7MguOA/BSjmVum38luIZrzsnKq9EYhY1y/05kIUmhtFsZe4
         vJyVZNqXGMs2ADWCEzFh6XcrBBTaXWi+BhDdKSXveMQL4VgBI1TSXddsMbskpzO79WnE
         WxWfOj+M9QyebSXryWIzgJ99nGxV0sVyYMvlI0k9SoztykSISc1MhHMFUeQS3GxlKaKK
         V1Vp9t8qPlUz2RaQKO6pdCtkVrR7q/TTamxRxndzn4d+NIyLVRo90kJM8qQKzLY4AFoN
         HXCR2vhDVHOje1/7DT8njUNl5BLYpb5u46R4NIWla3R5TeYCtA44Z+a5yOu+Kb8SgfzV
         K8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799567; x=1795404367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKCQB/Fkd7oKivhdMJjaV0uk7dFPCE0pzO3P5Iy4dPU=;
        b=BoM63IJzXkEX4MmuHToPZQpXOOWEDBrw2nAARqW754Ep8cp+RWlZY245PLyLkDEmhA
         UGcQzNHDmVticfZauK2qA1BrLsHg+Kfr2sNr4nNFopGyaSDsnuRDC32xLkJ3T2jFEESt
         Zd35pGUo1wF0LRohPtr9G5gRSM/cHL4CwhE/TfE1ufivZGw05710KDmwEOZ5Finy3JXo
         huefLLiPyfZ8CdlfzefSdHIdLvLsiCuXcdEQAgq1AzhHtQz0gcGzN15UJZ8KEVme21NU
         sdYxwlXREG9F1uoxOn5RnM9Kh8HWo2XUXOQbcGPRHf8sqT6Mjo/XGbq/Wh8ubxy4mLtR
         RGmQ==
X-Forwarded-Encrypted: i=1; AL+hErE48E7b5F2x67CHpjLm9cbkO4K/cu4E2YKThfXEZj5GxaG++fdfN/sLjPUDBiOnbszkSiP1tRyISmX24w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/m3vJM6/Fh3QRAM1JJsV0XDPXfwnGQnr5nbBe3wOFYcrZYrvE9
	tkdiIG2j0Nkf6V3/bUA9fAbqEDkgP3erGmLBg5/aDus6appVxAASX0OZOT5TZvPmpac=
X-Gm-Gg: AYBFou1B+AD+/a98uaOGQkACSUKkieXQSioGefQkxpU2DXy6BKy0qVUTWKBJGHU7/dg
	TTTbTyt3U8GKZgabNUP3/dVG0LgX3sKf667B3nrdk8XqXWmD4mRHBqhtzfDE3gFd5iFgaOSwv9h
	0FKDLRZuCOVno4iGBfj+a9imE1W+p6SoJrsAECA/K/mhOvp3MRT6viJ2ZA1LY6eEqjhAJ8ZCZG9
	qaVENJ1c4BIHYdk+KipKuWwluCS8t3wOcEqFbxK2mY+QQuktn6h0nFBLMteegS95T7B94IDPYOd
	9rpOe1nTUyqXzh4BM0BAjkzw3ASoXGvx/Ei8gvMP+v518+FERwYBKpjr1eN/FdkJduBFb6dbtst
	v3mf5WUyykC3foE5kPpwyqXm/iCg/CDQSYHDSgJtw9JAurumuEhZDh8Z7kbn5t8MY8RipVI0mLP
	1W3UMSiBC1CF/AaBqOflDEg+Yr07QzjkJS150FCdGytDu7f3Om3/dNPn6VDQp1kbb+JaM5L3LVn
	I96jr/3R5GqvB2B4sAXhWTlOAQ+gLFTxTbX//TBbg9nU+/mmuhq5yfejzRx1ShSNJE/XxKYx9J6
	6QX4H92ABYSuWfLme8hH7rMWPHF1xin3FRPNtiuSGA==
X-Received: by 2002:a05:7300:d18b:b0:36d:37c4:3759 with SMTP id 5a478bee46e88-37965f9d24cmr9318940eec.18.1794799566676;
        Sun, 15 Nov 2026 19:26:06 -0800 (PST)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm53117337eec.21.2026.11.15.19.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:26:06 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	samuel.holland@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH] riscv: usercfi: Don't inherit parent shadow stack for user workers
Date: Sun, 15 Nov 2026 19:25:58 -0800
Message-ID: <20261116032558.130928-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_192608_198047_0D1CF616 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

User-space background workers created through the copy_thread() args->fn
path (such as io_uring io-wq/SQPOLL threads and vhost workers) share the
parent's memory space (CLONE_VM) but never return to userspace.

Currently, these workers inherit the parent's user_cfi_state bookkeeping
via dup_task_struct() (e.g., enabling shadow stack and pointing to the
parent's live shadow stack base). When such a worker exits, mm_release()
invokes shstk_release(), which incorrectly executes vm_munmap() on the
parent's active user shadow stack. This triggers a fatal SIGSEGV
(SEGV_MAPERR followed by SI_KERNEL) in the parent process during its next
function return check (sspopchk).

Fix this by explicitly clearing the inherited shadow stack bookkeeping
(setting base and active state to 0) in the user worker branch of
copy_thread().

Fixes: 61a0200211d3 ("riscv: Implement arch-agnostic shadow stack prctls")

Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/process.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d1ca..4bc95acc5462 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -261,6 +261,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
+
+		/*
+		 * User workers (io_uring io-wq/SQPOLL, vhost) share the parent's mm
+		 * but never return to userspace. Don't inherit the parent's shadow
+		 * stack bookkeeping, otherwise shstk_release() on their exit would
+		 * vm_munmap() the parent's live shadow stack.
+		 */
+		set_shstk_base(p, 0, 0);
+		set_active_shstk(p, 0);
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
 		ssp = shstk_alloc_thread_stack(p, args);
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
