Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C665BECD6CB
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sbT1xvNuzXUJ7Npy/UEgjNjpnbP0db2ZY6MnUmO7CkI=; b=oxs+lvM7G0nQTi
	a1hcyCViVkurjy40XWqDioR1CszDhHFcckNa9fk1TLMK+ICVonuzTMZmfREZLLI5oip4RCgiA39wm
	3+a9V7WaNyuH+M3Y3s0xZgKeVtcfpyYeaCti9rQ5nvcyn0vokFOxhUp8t8Mmq8WbrNYxSd4XxOXhT
	O1tPwWGhaiMwlEJe1rZ0BV5tmxooGfjhM6a08zEKSiEu9aY7vZ4ORD368uWfD+ZCfdPSSF79bb6pS
	447sQvhzV0pjsAtWKUL472YSSYhd5Ii9L8b6edjyPSsSfJh/2Ci3jUeZZCMG/mDbTqDRg8Rzido2q
	fHT7uEA08fKTFXUQtuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3D-00000000tln-1Eg1;
	Wed, 11 Feb 2026 17:30:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3A-00000000tjx-3LpV
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 17:30:54 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770831047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3lruDsVqHt0DDZU4L6ReeWR11gmn26KN2zmJ7mPsbtw=;
	b=Xh1UqN3VKXUsWAGMmRQvMP8kaTAyukyNyqDOc8CEtX6/5QLs9E0UAw0JZISks2Z281eSJq
	ASO6AUzY8Q6FNtroDzSnhIABvCcq8kVnTUEEyEO2fyX7Ma2J//iR7VtDr0yfUB4KYRBVKu
	0fWZWgXzlvuI5RTxfg/QRHogNt3CYdPDXW+ShaDFGWThVUv3DXPX8JWElj03sgnso/o+uF
	TlZgiJcixm2NmSSj2sYB/kPTBP2zGBMWZXpKxp7JgfVKgouIezYesZ2ZDsignqyQfaY/KS
	hoipyfNjVElCozuofLpcwm7vfWSPhs+oleiSd9XxaY4N8j7ojUKbkI69A28n8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770831047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3lruDsVqHt0DDZU4L6ReeWR11gmn26KN2zmJ7mPsbtw=;
	b=NDTUOcOUDAf0O3Ih0Xu2QZaGAsDxBfXm2SZP6fltRJWaVhWlBftMOA367bwBPJv8BzVYKG
	Byi3MUX7/BMY93Aw==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/5] riscv: Cleanup and deduplicate unaligned access speed probe
Date: Wed, 11 Feb 2026 18:30:30 +0100
Message-ID: <cover.1770830596.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_093053_046060_853BD1E6 
X-CRM114-Status: UNSURE (   2.95  )
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

Hi,

This series does some minor cleanups and deduplication of riscv unaligned
access speed probe.

 arch/riscv/kernel/unaligned_access_speed.c | 221 ++++++++-------------
 1 file changed, 85 insertions(+), 136 deletions(-)

Nam Cao (5):
  riscv: Clean up & optimize unaligned scalar access probe
  riscv: Split out measure_cycles() for reuse
  riscv: Reuse measure_cycles() in check_vector_unaligned_access()
  riscv: Split out compare_unaligned_access()
  riscv: Reuse compare_unaligned_access() in
    check_vector_unaligned_access()

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
