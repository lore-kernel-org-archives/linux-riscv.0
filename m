Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C977606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EEkr0/7O;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Xj7He5+f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QR4N2cJEqmUwdq7hQuQKVQx5eZvYZIt+/xQSaWr/mSU=; b=EEkr0/7OxikLDzGe1fUxv5ZWpk
	XNgDeUwdF92GzpB1/8Q5MAbPiZjN4TlfvHmFunOyfbKXgnSTLzIF2xtTkov6Hl4OL6KJLXu3Fie1S
	eDENAbMVCkhAF4DH3Gi2yI3AjWGeSnyXPZKuloTGQR7DNG9/MEVwg/W0j7E1ZgCQmBk063j+TB9zp
	uhPakR7Y9gvdkZgqXgBdcvECSquuY8c6B7beTPCZGN30Iwxi2SU+1J8Lg6tgfht34ygi9vQev+oOS
	69tjTZU9suvDZ+kG/xCAywXNamKSTtI10SrJjqshEDG+4vHB3P39/mEUq+0n+VIDwfDzXUkh14+bu
	ZoNhaXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCR-00000000hNf-22RG;
	Sat, 28 Nov 2026 11:02:35 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGCO-00000000hMJ-2pxW
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 11:02:34 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652ad;
	Sat, 28 Nov 2026 19:02:29 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: linusw@kernel.org,
	brgl@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	maz@kernel.org,
	atish.patra@linux.dev,
	wesley@sifive.com,
	yash.shah@sifive.com,
	kamlakant.patel@broadcom.com
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 0/2] gpio: Unregister SiFive and XLP GPIO chips on unbind
Date: Sat, 28 Nov 2026 19:02:27 +0800
Message-Id: <20261128110229.875394-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa221d2245203a2kunmfbc41f2a3cbc75
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTU5PVk5CH0hDSR1LQxlNHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=Xj7He5+fa2vjcQ22Nk3R/Tubgx2hhS+ihLGmHiIy+cqJL0yqz8tQpaXo19CJL+rVGwSpfD207aiYg9KSop3qxbjputu96gA02hv3tdsQf+/MH24gt9Nx/nVvsirRKYnSS4oASkBTYCrvYmJicMeYFdmDRoj1VH+uX/tBk00W9ZM=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=YqCOGOo4FPzDVcuX+4UUwXDM2gP1PBCZnYRftUoIm/o=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_030232_997252_1B0E392D 
X-CRM114-Status: UNSURE (   0.91  )
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Pair GPIO chip registration with teardown in the SiFive and XLP drivers.

Tian Xuechen (2):
  gpio: sifive: Unregister the GPIO chip on unbind
  gpio: xlp: Unregister the GPIO chip on unbind

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
