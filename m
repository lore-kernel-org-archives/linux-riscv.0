Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF8BC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5FZBG8JHf/whw6awPIMHquoOTdd6H7KWYnY5Bu6KdrA=; b=URQHfJ0KXHWIZX
	Mww3K6vumKp+hk6h6hnKtsrgQBxGBMzkykaxGHItpN/7sx7LU8jz6+A4yr9VE69j5YN8f5J6OioDd
	1zcViTzhOHfSSgcn8HdXXXvh985bL23/ZFhvfU1rrKy9ysy4iFH8oz6dc+kGHgOdbvuRq75G8cRmW
	Fm0Cb2jkTfDJJ8RXRaom+IjlYZry9+aAD/+j1tFpYasm+ffa3Tf+MFiGFJnWmrmIuX3DuEFseAmIJ
	YsKq1Ct7BcjyFb3g1WjWnzL8+JMGERX+3HRjcBieWDG8AVig/2te8fwLol4f6hur5aZKkWQqinioP
	7neh+XvgpjG2nm3041Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohV2j-00FUJk-8L; Sun, 09 Oct 2022 12:04:29 +0000
Received: from mail.galaxycrow.de ([162.55.242.111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohV2g-00FUE0-Aq
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 12:04:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57C95620F9;
	Sun,  9 Oct 2022 14:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=galaxycrow.de;
	s=dkim; t=1665317049; h=from:subject:date:message-id:to:mime-version:content-type;
	bh=47nDLmeP9CCnVKPlIg8SFdJ7QMltUB4o3PzBaMbLha8=;
	b=jkvtLgg01cJDalSjU3eysx98IJA7tNSjXX/rvdGJhC6cLHLhxQ5XR3r1dvkdETm1MSG99F
	25/daH6WlTxfU3eFnt6hPv0uIk387avE3OnHuI3+8DPSpzEngtZJcsw85KZxKHMe3vMDt9
	GTQpJ6msb6UwJklUccxkBMWTSUsh9dQYjtLadr85xCqcv/2bWQUT/SgRi1z/6tbYOf/weV
	4RHzUTXriiFNrPB7Y34dD1yOylF2E3kfZGbPDznJzQgNbM+miAOykXCEYttupMabWOpoax
	Xqh0r2p1FJbM/71UhQnzLLjeqrUpql9nITpmjKv8nvp+YZdpL+h1EMzYoAlDnQ==
Date: Sun, 9 Oct 2022 14:03:40 +0200
From: Cleo John <waterdev@galaxycrow.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fixed styling in riscv ucontext header
Message-ID: <20221009120340.GA41243@watet-ms7b87>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_050426_576913_D972A15B 
X-CRM114-Status: GOOD (  11.74  )
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

This patch changes the two comments in ucontext.h by getting them up to the cody style proposed by torwalds. 
In my opinion this also improves the readability so I think this is a useful change to do.
Please also tell me if you have a different opinion.

Signed-off-by: Cleo John <waterdev@galaxycrow.de>
---
 arch/riscv/include/uapi/asm/ucontext.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
index 44eb993950e5..0cd6f8616985 100644
--- a/arch/riscv/include/uapi/asm/ucontext.h
+++ b/arch/riscv/include/uapi/asm/ucontext.h
@@ -18,7 +18,8 @@ struct ucontext {
 	/* There's some padding here to allow sigset_t to be expanded in the
 	 * future.  Though this is unlikely, other architectures put uc_sigmask
 	 * at the end of this structure and explicitly state it can be
-	 * expanded, so we didn't want to box ourselves in here. */
+	 * expanded, so we didn't want to box ourselves in here.
+	 */
 	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
 	/* We can't put uc_sigmask at the end of this structure because we need
 	 * to be able to expand sigcontext in the future.  For example, the
@@ -27,7 +28,8 @@ struct ucontext {
 	 * ucontext, so we're putting this at the end in order to allow for
 	 * infinite extensibility.  Since we know this will be extended and we
 	 * assume sigset_t won't be extended an extreme amount, we're
-	 * prioritizing this. */
+	 * prioritizing this.
+	 */
 	struct sigcontext uc_mcontext;
 };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
