Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A917606A336
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QL6dXpD/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KxNA6PQR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QZIIP1FnVZnAbxagYehe8UUFSHbpF5HKZo0ljO/oAIo=; b=QL6dXpD/4ihgCUXlleRqK8uRAr
	tJe07X37hb0W6svXrtMvHow8XYOybvvXSkw7NY36SvnbMogkKvEmlGVaUTHDWwykjb5bihHsonBMQ
	yhBt7y9fk+0RQ6W7ca0k3+amarcspY1R88h1oVtMOtuOwck6iuTVnyJW0wt6ju/QFBFwXWgJRj6oA
	lusperCORZgpDVGCxW1V6W9s0sFGWNgU0sA2UIfiZ3DTEok7Gh6JN5pA4OLsZen2FVNf7bAoEMjbo
	kzVoDeew2OEDXkppDxJyEsvweHLvEtHXPPWge9jwgRafkYlzcbQwLi0AajGY59lIVmBnGhHBZo2DM
	hoh+BPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2OO-0000000AAPV-3WG8;
	Thu, 05 Nov 2026 18:40:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2O3-0000000AAJr-3g3S
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:40:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FEAB432C4;
	Thu,  5 Nov 2026 18:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808641F000C1;
	Thu,  5 Nov 2026 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904035;
	bh=owaKlD8oLnDzryLHo6z1T1KNQuIMA+s07F6t1tORQy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KxNA6PQRF/ooZDITVNYoeJsxh4blye8mGQicqkeLhnzx3sSR9Wpuy6bYC6WxhdRnI
	 iLpDZjY5rLhESJYSNt29rrC7kK7yblLO1JI5Sm6IBTIL/415UWOM1iSivDbErdGXTa
	 wsizeELBGl3kKFfJX3oDSrnVkaTG+NxvmuS4IP+I7WoWo98tJ6Pps3Jh3/zhte7fkF
	 Vk8uVFUMewyZpRKHPH95MkQLSi9G1Md6TW0XR8mU9tpdMx4Y1toRDo5gCDApTTwcgf
	 Bv7OGeNkDm+i3rvZHQgkImZZCjl6GPlSCf2nBo+s3nzgrzii4vn9/rHly0leinzsMW
	 gmoF4aZHXHRLQ==
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] soc: microchip: mpfs-sys-controller: put the flash device reference
Date: Thu,  5 Nov 2026 18:39:44 +0000
Message-ID: <179390394386.1477457.365561090513206596.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104021435.1468301-1-vulab@iscas.ac.cn>
References: <20261104021435.1468301-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=646; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ie3smbEtm3ecVbEoJiIqxoXtQG2xYonjbXDjOLJfKXU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuZ+nl7jcuvbt2/TOHL3dQb35l1MTy9QvmnGrTGFQ XCqkUBNRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZyX5WR4ZjG0biI+Hv6ERf6 NQyTq2+J/rpqOW/TFlkXk2NG9pc2nmRk2MIlmZt3oZfx+xMzKWWR4JgCXUPxnwKu5hWKVw8r7J7 PAAA=
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

On Wed, 04 Nov 2026 02:14:35 +0000, Wentao Liang wrote:
> of_get_mtd_device_by_node() returns an mtd_info with a reference taken
> on the MTD device, which is stored in sys_controller->flash.  The
> reference is never released, neither when the last sys_controller user
> goes away nor on the probe error path that frees a freshly allocated
> controller without initialising the kref.
> 
> Balance it with put_mtd_device() in both places.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] soc: microchip: mpfs-sys-controller: put the flash device reference
      https://git.kernel.org/conor/c/6fdd47bf3736

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
