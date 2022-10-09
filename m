Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A24C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7tOUuyQc2U/9/LhLkTPsUSuWPfsnWDvcHaotxulq15I=; b=sWXrIDfO7b7DcH
	FiR90+bZ2bhDKWMBdyOTS2bGXH6OhhRegint4jRbrTRX5buBPHXPxLKf9ADvTQhBmogg6mruU3Y3+
	zS2rupmDgK+f52QIkY7PjS7e2s0CruhNlDrfs2NFHxpgxwzrZH6cTn0BHjGEdkFmj9SfwFCneObXk
	au6QcI+7MmtK2vwbXT6vYGIxBp4NQugRiSkAYahK2Z+Qf49ajP4KD9HIhMxBkEPNNUSKDD/VEp4Mr
	ErbPhZU88ghLPfdEQeMMNtuEKd2r8+9IQou2zE2+8HmxPrX1c+mHuPnynHWWugy+Nodf/GVgK/AhE
	g7cobob5xKpSwreaKxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohW7s-00FcfF-Hp; Sun, 09 Oct 2022 13:13:52 +0000
Received: from mail.galaxycrow.de ([162.55.242.111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohW7n-00Fce7-KN
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 13:13:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3D85621F5;
	Sun,  9 Oct 2022 15:13:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=galaxycrow.de;
	s=dkim; t=1665321220; h=from:subject:date:message-id:to:mime-version:content-type;
	bh=gG3hMKGT5zMsFTXzJUA7f6NuykxZjEN3ciFuYY+hf48=;
	b=kCs8EbW8rZpAQN1OHbubUKTg/z45I7b1I96SHQOaGbjRpZCDuyyH3sYN71c95caRoyp2ip
	QCoKVUfVTJpd8k9k7KLcsVGLKBpd7K2XEWUOweAuswoWwfiphsV1tHn2edj/kQ121E52f0
	ysVAwYbZTJ21uydYkwPWyMvJjN66i5w9heoodpwM0cHzGFptkw0G8wAlIvzDBPm57jqX9K
	qRCHiXZGRY0eIZ2TTmx0CsXRe8z6ON/RdGBpHVGv+jH5yQGp+H8gqfcbO8S2aGl1UMaOBA
	z6R+g1EhiwWeIBhIXWsHnjWZ9x5ZYRSFCF+Un7FjNJ8vHQLDS57ZVnrwrDOA2Q==
Date: Sun, 9 Oct 2022 15:13:27 +0200
From: Cleo John <waterdev@galaxycrow.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: fix styling in ucontext header
Message-ID: <20221009131327.GA50929@watet-ms7b87>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_061347_851827_522C372A 
X-CRM114-Status: GOOD (  12.38  )
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

Change the two comments in ucontext.h by getting them up to
the coding style proposed by torvalds.

Signed-off-by: Cleo John <waterdev@galaxycrow.de>
---
In my opinion this also improves the readability so I think
this is a useful change to do.
Please also tell me if you have a different opinion.

Changes in v2:
 - change opening comments too

 arch/riscv/include/uapi/asm/ucontext.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
index 44eb993950e5..516bd0bb0da5 100644
--- a/arch/riscv/include/uapi/asm/ucontext.h
+++ b/arch/riscv/include/uapi/asm/ucontext.h
@@ -15,19 +15,23 @@ struct ucontext {
 	struct ucontext	 *uc_link;
 	stack_t		  uc_stack;
 	sigset_t	  uc_sigmask;
-	/* There's some padding here to allow sigset_t to be expanded in the
+	/*
+	 * There's some padding here to allow sigset_t to be expanded in the
 	 * future.  Though this is unlikely, other architectures put uc_sigmask
 	 * at the end of this structure and explicitly state it can be
-	 * expanded, so we didn't want to box ourselves in here. */
+	 * expanded, so we didn't want to box ourselves in here.
+	 */
 	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
-	/* We can't put uc_sigmask at the end of this structure because we need
+	/*
+	 * We can't put uc_sigmask at the end of this structure because we need
 	 * to be able to expand sigcontext in the future.  For example, the
 	 * vector ISA extension will almost certainly add ISA state.  We want
 	 * to ensure all user-visible ISA state can be saved and restored via a
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
