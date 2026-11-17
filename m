Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D717606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=trRllHJe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQv4ULh/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jOAq2Q4pd/RPHPrO0+u/3Zla1KUjWZy9TpfrzqbbAxA=; b=trRllHJeBi1MEu3lQ4mfSVxfiR
	m/tcORpd3dpXTK5RD5evHaGprMiLLmrmfrmHN+4pU6/pfrxGtHeoLWuCydTLIeKlATPK7omNdJN7W
	0ucz9Ebx3w4uRaYFrb8FdIi7NLh5A81v9/5ln55w4Kic3q4LsWkUshjMXMFPI1QTE3K+e9HcdU6fG
	mqrN2iIeIs1cBi+R/tlGJllX/cAVxs2Bb/iRl8RMeJs5RQVag/650zh/w2EA0b7zKbbc4cRL7/e9j
	9AI+jueOPkbZd9oiWFXMsbkY+E8+XWDqlKQaXbZnDc3/YZuBGVDMAkfvleR2zsjytuPYdjxprJK2h
	OaRhniXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJjV-0000000624y-2dt2;
	Tue, 17 Nov 2026 14:00:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJjU-0000000624Y-3jRT
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 14:00:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A403342B23;
	Tue, 17 Nov 2026 14:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD12F1F000C5;
	Tue, 17 Nov 2026 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924024;
	bh=QAKEKUUgAktJKHEVX7KI7OTga21H38xwimtePgaRsRg=;
	h=From:Subject:Date:To:Cc;
	b=hQv4ULh/2quRo1tcUh32wYacvtu6Sr7S73HF1zlVZXA0Kzb9MKlu7C6qkdnXUJQtR
	 kfG/PLK8vU2ntfIpLupbjBFmGgC7kyvQOEnGyekTQqD18lX1micAOSOsRAbs/WIQJ3
	 r6yhib/od8zo4eKcpjqeMJZoaZ0CyKTHdx4sIF7ru9rcEpB/L8lwQqtr92ToGB31og
	 mrlGCuaPrOhraNzVhdRu7sKf17+u/9aYIPqgQmgKnGCm+4YoKashCjqejb4plSTpGG
	 TvpbLUAeREeRpAmoOGa6lHKT1iL377Aj+bQD5//EygMaGUWR6Y+pNLcI2O8uIGmT1H
	 p8t0kb0znU2Hg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH v2 0/2] riscv: mm: fix set_memory_x() and
 kernel_page_present()
Date: Tue, 17 Nov 2026 16:00:19 +0200
Message-Id: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OyxKCMAxFf8Xp2iqtIsWV/+GwaGuA+GidBBkdh
 n+3xa3Lk5v7mAQDIbA4riZBMCJjDAn0eiV8b0MHEi+JhS70QSmlZYtvYEnIfpQ72JvKmLY0LYj
 keBIscjKcmx/zy13BDzkifzjLIB3Z4Pt8ioQdhu3D8gCU9R55iPRZ5owq5/xvHpUspPLWelWbu
 nLl6QYU4L6J1IlmnucvN5aG6NkAAAA=
X-Change-ID: 20261112-fixes-riscv-3e48788f58fe
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These are two riscv fixes I found while working on a generic
implementation of the set_memory APIs.

The first one stops set_memory_x() from making the linear map alias of
module and BPF text executable.

The second one makes kernel_page_present() report the pages removed from
the linear map as not present. Today it says they are mapped, and
hibernation could copy them without mapping them first.

---
Changes in v2:
- read the PMD entry once in kernel_page_present() (Jisheng)
- Link to v1: https://patch.msgid.link/20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org

---
Mike Rapoport (Microsoft) (2):
      riscv: mm: do not make the linear map alias executable in set_memory_*()
      riscv: mm: check the valid bit in kernel_page_present()

 arch/riscv/mm/pageattr.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-fixes-riscv-3e48788f58fe

--
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
