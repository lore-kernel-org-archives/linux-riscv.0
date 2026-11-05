Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9EB606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AhBudSnW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dV6ULbux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aGFZYDUum81U4vj+5sa3CEkD6ecFzvdIMoDrZYH8rNM=; b=AhBudSnWHThlOgW5ID+Q75hTxs
	pDpplLvLTGIP7l+Pfp8QBMcKqRPlSBAGIAF8N31odD0KprxPQR3BsAF/8j69OKH7lx71Hu6flSO/2
	vSAUVzNbpgQ7eLUlzpqokzJA2/6Lxe9L2JCM2Qu+nECy94kOdPIHJI3fLGZHB9eybjG/4euhrbJsu
	60Xxyke9qTiBFkGCPQ2uW08jRpAuFtuAB1yeEGR4CVmUlf0VtoU6e2YnaAO+XlFsVS2FxT+EWUvWs
	j0kJdwDT8T/+iq69xsW/ayGngJjGfNGMnVR5MXn/0Hhgcp4dsyck/f/FVOY2MUXNyda/O7kb6lTEI
	7+WbEmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2QI-0000000AB9A-1ULH;
	Thu, 05 Nov 2026 18:42:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2QD-0000000AB6q-1eva
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:42:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 853D0601D4;
	Thu,  5 Nov 2026 18:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85051F000C1;
	Thu,  5 Nov 2026 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904168;
	bh=GRNGObKHI3lnA3yeJz++OADSyBlXSs934ZgQwntZ4Ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dV6ULbuxdTCuH5vO6pjckyW7fXvXauFmAzuA3z1i6VAae+f393/VU+Oi6KdgkRnRd
	 L3+Wo7DaV57yVOn8X4PDej0IBLfenaWitK5JsgxmU+F4WUsOhI0CaQbXWXfP7O1Gzi
	 A/QPrm9xJzY1ILQP7uv7VRQ+a2yfXdy/1C5vLfjMHGs33KGSSBR64R28+YvE/mJqFl
	 XHZTHZ+0xG2yn4ru9o07p6ZzOC+5RIV/NUgQX+XLwy/EeUxfcgFNeC9rw7e5ve52hg
	 ZkgsPqSbWUi01zGAjV7fCFk1+rA0Viab8lxNa3p7qyOlzSzPlnoQjw0oUbkFgTTWuP
	 VEmSlMYU/Z1mg==
From: Conor Dooley <conor@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] riscv: dts: sifive: Add the missing FU740 CLINT
Date: Thu,  5 Nov 2026 18:42:37 +0000
Message-ID: <179390412800.1478853.10812616929498115582.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
References: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=465; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=K3IQubwUk2vgWcXnLJFAQXa+kWhgi/GPRVetmK83/eA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzsleu/9894Lbwol/Q+TOcVkcieJxWnAw6RHDlQVuO Vumv3lzvqOUhUGMi0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATyfjA8D8xhKu1PvevlxL7 lYu3F+iJ6jOzLrrB7P6bX+yJ+wzX+yWMDC1H1pxe/Le4iL///nyj9kOy8RGSFh7RNctOzTx+aEN KKRMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Conor Dooley <conor.dooley@microchip.com>

On Sun, 01 Nov 2026 21:35:30 +0800, Han Gao wrote:
> coreboot and U-Boot already describe the FU740 CLINT for OpenSBI.
> Add the missing node to the Linux device tree and document its
> compatible.

Applied to riscv-dt-for-next, thanks!

[1/2] dt-bindings: timer: add the FU740 CLINT
      https://git.kernel.org/conor/c/c567dab56912
[2/2] riscv: dts: sifive: describe the FU740 CLINT
      https://git.kernel.org/conor/c/076ecbd42c0e

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
