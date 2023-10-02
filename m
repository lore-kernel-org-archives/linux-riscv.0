Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EE7E784AC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKpz5g2C1v8wo39Rc5aqvCf55RMcAuoaMeM+dvhNhq4=; b=VTr3UKATB5NE97
	nzFoVhEekt5i7CkP25Gr2I2NZ6twP1OLY3EGktijWT7Ex8Y7729cUt+86qIFcBEBF5mx8pY/niJty
	fPtgVplTCppJ2t9YfFlSXHYv4WqZtaYG196hSWmUaKZRSQuOpGMP1PRQ0/zJ9dZN/cHT3qTkSqbXH
	fQ9LQRuzGko8a7Ry/PDUv5ZXn0kXLHOfGRgPEAfrq99ZvGsG8UOQg04N2plhW9oxNJliyS2KqgkxG
	/JzN8BTbBiQAIhFBrhau0+QeRZnn4P64dskw5J7/KADgi3cC3y+AsyAf7kuzjiXEye3EhXVltRLJu
	TD0SrnxlqKQmXC+7Hbvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnH7C-00CXSM-36;
	Mon, 02 Oct 2023 11:29:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnH72-00CXGk-2B;
	Mon, 02 Oct 2023 11:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A05B60E8C;
	Mon,  2 Oct 2023 11:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5371DC116D2;
	Mon,  2 Oct 2023 11:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696246157;
	bh=8Y0OZ+ek4AhIcf8Sjp8fQ2M9HKsNYRF/q4Q31JpOT5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HoYlpryWcQZV4xEoh38551sI60gfNK4cNGdEKgXPz9x08VsBC5G/69LBFbXuToEgn
	 BfBDfABhYQMaA/7y4/yMOLRE2yxXFJEEmhWmuOXt9SqvBUrhF02pxsFB+Oy95KS3Uo
	 lMq4M9cbbqTcQLk8Mt0GHY0NkCOn4Jd8OvFimK3fza9rF9VZ+2Ar+cUV7TeEgsIf0n
	 AfN3Z6+zr6tOgqL9qirOQi2pRK98RKq8bt6HNDMvcyBkOvRb/QX5w6hRjj7JYKtuUg
	 tRfO2u8Hi/A7XL6lw6dB721W2W3IWPxGFfSchln4SLcXKRGbevSUs6wqi75teA8l65
	 WpR4VjGman2fA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A93FE7849A;
	Mon,  2 Oct 2023 11:29:17 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 13:30:42 +0200
Subject: [PATCH v3 7/7] c-sky: Remove now superfluous sentinel element from
 ctl_talbe array
MIME-Version: 1.0
Message-Id: <20231002-jag-sysctl_remove_empty_elem_arch-v3-7-606da2840a7a@samsung.com>
References: <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
In-Reply-To: <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=aVH730u6MpA8SyXSwY+KroDm6RkQOYcUB41QGWJqNpM=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGqoU5tuFWjnPIMvFbKyN6zHH0cwg/pUFRD/vM
 SfkGU2MIlyJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqqFAAKCRC6l81St5ZB
 TyUKC/0c39WVZtnSe4HAi+KjUVd8v38cq95t+0bYTAm0t4UjG8Lsp3T5G80IFPYLmapvMnK4uVe
 Lyeg6+WlLJagatcnmBtfVxhCU0ewAPcEqiwiP6qZx3c8PLEexEriY2mthOka69yhwr3nKHEnyV8
 Bqp7zzu/E1zwrNE1+/cSzV96Y/lZ/qWZCRPRHR7SuOeWwWTDbyhgveJ+cmUr4q6nwLVv9D8Vj6M
 B7kOycGh+RMxgVTKEAlnSPVgKcwgHE24nlo5RUyuu77WXCMlCIrZdyyNDZrrQykuiXWNxLKiMrj
 XLAE5oYgpIZ9uRGWS1dzT2edeQ+COFGaR51Q/tvQualP2kfj7A2dQzLIAF8fmcWYwWVMj1RN44o
 jz1VmKwvgpAAwhyJL1nlRqp0Dx+iccYp2zBAhv5X8ptE4axnZuJSjdUGQVapPNd/0eA4u87Ubaa
 zmvv90vSv16KKgBYe+ABuMSkfh7iM8iC7eDe4BQqUi7MyRotUfD+EMFwsoiIIw56IZ6Jg=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_042920_812855_8631A865 
X-CRM114-Status: GOOD (  12.88  )
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
Reply-To: j.granados@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel from alignment_tbl ctl_table array. This removal is safe
because register_sysctl_init implicitly uses ARRAY_SIZE() in addition to
checking for the sentinel.

Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/csky/abiv1/alignment.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/csky/abiv1/alignment.c b/arch/csky/abiv1/alignment.c
index b60259daed1b..e5b8b4b2109a 100644
--- a/arch/csky/abiv1/alignment.c
+++ b/arch/csky/abiv1/alignment.c
@@ -329,7 +329,6 @@ static struct ctl_table alignment_tbl[5] = {
 		.mode = 0666,
 		.proc_handler = &proc_dointvec
 	},
-	{}
 };
 
 static int __init csky_alignment_init(void)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
