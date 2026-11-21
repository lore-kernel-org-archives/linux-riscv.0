Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E21606A320
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z5EaAwe4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kop1P+bj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=65ed1QYCGONotsMa2PAONYGfGiqlNflEaHqt6hzvtoE=; b=Z5EaAwe41q6qBMotA6UYx+lYNZ
	5XJTOScVPqxo4uvnVPGF77aZN2XhCD3b/aeMjLB4n29kVujcHzZEFPfm7T6O0qYCcUCW/e+9s/18f
	LqX3OlibbxelNYABaBDW+S9lNYHNoi6vU/9A1GaUQkWCidPFpoNi01O4/LhpYRq11XQCyQAC/rJiT
	s5Ac6ub+GfTgTx2stEUgQL8SvDGuFWT2mFvWZF3viDyfRXOLt5YmriywZ24O7DMv6BBoxXGWI7sF3
	iMkngefzlPXs3gEtj4WBznN+EvKhAtCqEuArWiTbGiorNo/GE0Lwp51FYCGnJ+j7mPBgWYIqbr8X1
	NdSOPk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiU8-0000000H2i7-0Ubw;
	Sat, 21 Nov 2026 10:38:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiU6-0000000H2hn-3OZE
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 10:38:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C18A42BAB;
	Sat, 21 Nov 2026 10:38:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795257498;
	b=zSzrvqgiNHtOz5gtXa077U7MaFHVl4lh1Lh/Mi4xqpquPMrsz0XupNWGBHHck+cdecBW
	 wSdinURyuZR0862A8LcaOBn8/9HEkSzARvqGxkpaeFyBzEHs6i8aKZO49wX2t588DR7WK
	 xHZKUG5PTT6amXesY+CsngVQTYnec628eu3QGuVFPYIW4DXjuy5b1dihTAuys2kTHT71U
	 ctXnBEOmey09OqbGRFMeKFi27/aeaGRQTZNsbYinLBboOOhC7TuRCpcqxbD4MrudocCku
	 lmWfbl5ESAO/9JuvKwMv3lma0xU+Wkz11t4kZCiHtFa0np910DdH5LJ97hpTTzvijvg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795257498;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WEuXb2RE8zSTJ0DUvVgVg41JYrBzTwV6rSqVaKBxb4I=;
	b=QrhtKyGCWCww0KqHJzNErAauQdC6wJOeC+ZTsXigKBcggSmQm+kjdivYvrkIVlI3pjUx
	 9AxcwenBB3y0tTRGQfb9A5r8cUvScZVRXNxa5DxTFWf9zou++1QTsdYSafZbolwZ3znB8
	 0IJQ1JtvBpBOX0Rg9ljVuNjnVQftqG4hURlmVFYfOiFjPZyuz4j8+5E1eLBEMGSSErkiu
	 LuXIKWiz/bbJ1Dp+337OGlOuDlhIvI34ROxWlx0/8w/iRFhHTpvaNu3ryEsMu6KDBGnoR
	 QShlM24rfdiQv+XrRpCIr1dwDKRByM7AnI9H3qmG1kcY7Q7FK/6sBBGg7ogmt/32W5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 906361F000C0;
	Sat, 21 Nov 2026 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795257498;
	bh=WEuXb2RE8zSTJ0DUvVgVg41JYrBzTwV6rSqVaKBxb4I=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Kop1P+bjVy7M9sxkyQ8mtfKddSzXXWIlPQmdnKZtKXoWov5MGWZcnx7nWj5fEAd/+
	 obHSPxMSv1iJ0Y5LgBglK4GpVKZ3uNMcaPnXXGKMNBnAGGGLo7cagOn4GsdW/U4bgy
	 V4zHp0VEwbwogQR+0XcRVJNLb0p7rMkpP+gGlCb+jLgbyqO5MRR/HTnLi6OiO3XvW9
	 wTWyoek4ZIOklPG7nBfe+GnsvWHYQwRJjvMyMiAZdZkNDmSirnib+eT11Nw1oPymeu
	 P+owkKt+OftDXSk/KNs+KZW65Y7rCtVxzqM7CIXIB7qJbum2yps8txr8j59QewgEq1
	 Q1EADrQV5jVBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E66CC4BBCB;
	Sat, 21 Nov 2026 10:38:16 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH 0/2] riscv/clk: sophgo: Fix EFI RTC on Milk-V Pioneer
Date: Sat, 21 Nov 2026 18:38:06 +0800
Message-Id: <20261121-b4-sg2042-efi-rtc-v1-0-19898b8ad497@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAyF4asgz7UUm9CBq1QdSDDUDGkV06oSy
 t0JMH56ev8GJlnFoG82yPJT03eqoFsD8TWkWVDHamDHdyImDB5tZucZZVLMa0TxY8fMHbWDQP1
 9cl3+Z/PxvGzfsEhcjxCUsgNqcxa+dQAAAA==
X-Change-ID: 20261121-b4-sg2042-efi-rtc-e4d5222513ae
To: Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <atish.patra@linux.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-efi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, sophgo@lists.linux.dev, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795257496; l=1142;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=dT/cAMPkqhwiO+NmtZDAeUI+RgA0LLjV2VMwVQoEOVE=;
 b=FC7ThTXl38Ss0fnSg/4mwqUL1JUFP/nRR5YZZ9Bk32T3DV7XgF8zFNlDBS/VV/IdQ2NT1jZvE
 atOl+cn9WM9D1k1MLLRh6y5Gr2yM/TK/lvJwVM1CPf6X/Q5pk/UR3TE
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pioneer firmware can take over the DS1307 on I2C0 and expose it through
EFI runtime services, so Linux uses rtc-efi. I2C0 is then marked
"reserved" in the device tree.

Two things break GetTime() in that setup:

- RISC-V maps EFI runtime MMIO as normal memory, and firmware takes a
  load access fault on the clock controller. Patch 1 maps it as I/O.

- I2C0 shares a clock gate with the other I2C controllers. Once Linux
  runtime-suspends them, the gate goes off and GetTime() returns
  EFI_NOT_READY. Patch 2 keeps gates used by reserved devices on.

Tested on Milk-V Pioneer.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Han Gao (2):
      riscv: efi: Map runtime MMIO with device attributes
      clk: sophgo: sg2042-clkgen: Keep gates of reserved devices enabled

 arch/riscv/kernel/efi.c                |  2 +-
 drivers/clk/sophgo/clk-sg2042-clkgen.c | 38 +++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261121-b4-sg2042-efi-rtc-e4d5222513ae

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
