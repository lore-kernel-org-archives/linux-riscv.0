Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C59EC7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 20:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGmCHdPwyTeCkH/QF+HB07T0uAAvu45aKaAF9TUbzDs=; b=nGc0iRw0ynmyz9
	IZPYBo7optcy66IweZ3uQKx6KfNwYqMABoQFsNA3X6RME8odA2/89qa36spl8jQI6YnZ9G76+qy7g
	SCbxIDwlVVHBCbSM4M9twxHE7Y27V8zaJ7ihXqRXbyczlxN/2mIxUtqKZ5Re9gN4ry8CXUo0WrU2b
	wvA7TchZa6UhTeK2oW8ORRS9hYULpQr1/OV/T4GkzBWxwVcvX8GhMTCcmDGjw1dAhW2yyjz/FboWb
	MNLAX46pt9XcJaefNcGYlvotiWyTM1ZwuS48cCX7rL4LO7W6fv7avatNYYhue2GTkTCEu+tKrleQE
	T1YoegNHD/VKsK2S26Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLpO-0000000ECg7-2fRJ;
	Thu, 19 Jun 2025 20:25:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKpv-0000000E57P-2M3d;
	Thu, 19 Jun 2025 19:22:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 876305C66CD;
	Thu, 19 Jun 2025 19:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7F8C4CEEA;
	Thu, 19 Jun 2025 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360930;
	bh=TvyRRr0Q9p57RHCbNRzLmr80cK6DSzs3Te1JHJiic8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gsWHI6uCzGtgTFS0+9VVGWSKxIlVRoAXr7ncQjaX5JwXgHpNeTiXfuOdhYkgBgHlJ
	 YQL+IwHGvkSc1iwP/qogzJwScgBGmtDDqgVmXHbv1uR/qUAz+wTmjf+9RfsQ9xDMXt
	 cx09P6ml5LT5uoXwPMu9X1MNzCP//2MHKBcUUMASgM0/fV4ggydLqclno7rm2SDVnv
	 ONIUBY64Njs+//9An/TZjwOxs648bB/vuUO+DLFNNZV/7HJSplry+6xHCOjC37RY1I
	 BLeB2leI6kKtRZ0xNTVxiSLCJo6HP4VbBMk/fOsC2kXM/UVnKAzfqEAO22jUF5/WYU
	 gM0TVdi6sVQnQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 9/9] MAINTAINERS: drop arch/*/lib/crypto/ pattern
Date: Thu, 19 Jun 2025 12:19:08 -0700
Message-ID: <20250619191908.134235-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_122211_794506_3F6D3956 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Eric Biggers <ebiggers@google.com>

Since all files arch/*/lib/crypto/* have been moved into lib/crypto/,
remove the arch/*/lib/crypto/ file pattern from MAINTAINERS.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..8ca374b24a806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6408,11 +6408,10 @@ M:	Jason A. Donenfeld <Jason@zx2c4.com>
 M:	Ard Biesheuvel <ardb@kernel.org>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
-F:	arch/*/lib/crypto/
 F:	lib/crypto/
 
 CRYPTO SPEED TEST COMPARE
 M:	Wang Jinchao <wangjinchao@xfusion.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
