Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27778606A887
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 20:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z4KTq598;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rf0hdqbX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J+K3FCheENqTDXbhQ5+/RerRFVovWXYsdStKCwwm/0U=; b=Z4KTq598Cj706cqhkXMQ1FIZcC
	pwMxzRteEu+0O/wXbQSnXGOFbAfWIjvWlMa52qbt/oREqrSe+0WYAURCCARaDBcFUjRZari4NqEU3
	Dcd6dONFR+EOAAdg6C9RJOKpCTXGL5Fk+5shyQBzdqLj6XqHluXMr+8pkjIqqA2N9LHdm17ZYidBN
	KKlKcFt8ToxOlvWXIwGeYD2LGvX3MV4ufcOpTZUa/V4b/qDuQS0InO2GW/DDbY7kM3atiqBjypi66
	XDStUYZczCBzCWhNd1XBJD+E28i/B0/7hg2jD2w98sfIxUhKNPaeTEchcASpijs8Uo5atRReaS6Ax
	/K6ERurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPLj-00000006ydM-2qTs;
	Tue, 17 Nov 2026 20:00:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPLh-00000006yc6-3cRt
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 20:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 886E9457AF;
	Tue, 17 Nov 2026 20:00:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945613;
	b=wPg5yaoqEa43xiaocJD0UVn39PqiS107pB2u7EnaeE8Aox0IWvu3ufTK1lluibOJUc2x
	 gLAIqxcGufa5ypa2+PaFiCeJaJ1RAGVKu+JVSTsZrG1mCLg+glIzgYZnMamHDifRz59yL
	 jK51azOXeVVUzeBmnsMemHKXkqvrkGguVqudKYDnODfRWwmI61SqmLYjqCa/NdQoFL1NQ
	 QOyvbY7Jq5i1BmYNGcfapANhd8FSWPjV9nkg1/moIYpqUBqGpMfF9vBzNnFmbjgwXrJ+4
	 Na3AET0BZ72mZ9oV9w2FW7WT3lttTGbJP4UztPX+jvgmTKNpiYAj5YaF5QDO23Jm/+w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945613;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=W7wzKrMIF5A35pVBIgo5N/n+mM8H4di7DwvtH1jtWd0=;
	b=vludeIvKLCbfkq5tkJAdBCw28bpJ42VbwvsKT5lefuxPzOnStfff8qZ6nBQN/QwuWcyj
	 d2XE2BRnxn3/jEBngWCxvboJKpYxkNWLN8g//8CaNYTjzU4tGjftwfpBu+md+pjqQEVfM
	 ZTknSD3IxN3S2lia5pDvcP5Hvw8kDPcpkRHNbhpbHY5Ncj5O2MBXut9EkvEWJdUtPa7mi
	 AONtyyX1dRy7G/2yMDysD//R6Chf13vhlDnjYk/4ofKnKC8bSKHnw5AoDhIwVj6MYmMQl
	 Ky9ltclgEUuPXn9jMzpUis6Uuia34FWbdKiGDaMk/KTvoOR9tV3qvFiqQ8VnTf3QJuA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD6661F000C6;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945613;
	bh=W7wzKrMIF5A35pVBIgo5N/n+mM8H4di7DwvtH1jtWd0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Rf0hdqbX0upqMT5UR5QBpBzcCmSXS+VTRSzxqVUM2kh9KE1i0HISxC1U4b+rDNy+a
	 NxvF6gyRqhFIBsrsUcn2/YH7XtG9LwXpKQRe4KiCAEmX1Py3Gz9QszZp9Ox30AgUyc
	 dkBAL2ooxrB5aQhaO3tAxbz759cScvgtBqBiUfLRVznOg6IEJyIDYR7EY8XD9HXljg
	 YC0h2ai8Ptz1n61L0MCridP6Ql24qd6XMQzP2CdtVieCbZAK2oEKR4UAt5qJA6xvM2
	 KYpFXh6NiM0Ny/OsBTFV30B1x7TMwv6vtg/RJNc2YVlFxZWV6Ov/8nhHN+Mg1Jm0Rc
	 QWwJTO/5kfl0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2A7CF4AAA2;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH v2 0/2] riscv: eswin: Add Milk-V Megrez board support
Date: Wed, 18 Nov 2026 04:00:04 +0800
Message-Id: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAESy/GoC/3WMQQ7CIBBFr9LMWhqgFoir3sN0gdOhnYWtAUPUh
 ruL3bv5yfvJezskikwJLs0OkTIn3tYK+tQALn6dSfBUGbTURinlBDFaK6W40xzpI5SRvcWApp8
 CVOkRKfDrCF7Hygun5xbfRz+r3/s3lZWQwgfXdeebq2sGTuhT67HFFcZSyhcfUkbtrgAAAA==
X-Change-ID: 20261118-eic7700-megrez-16057cfc65df
To: Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945611; l=896;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=SDt48WVWTll6uo/OVctZfZyhSoQdBdTCZ/44sy5DSzI=;
 b=u5au61AgyaWYlf2mfOXaHopJIw1oONJFU2rD9aw2fH8nLvUaYZf7YKoTbyIlrss08dQoklfXs
 7Yv3lOtbYLZBGcS5QEURKWrlRcLkeXHdR2VxU/wmaD4Bvvo9CpuMYKl
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Milk-V Megrez is a Mini-ITX board based on the ESWIN EIC7700X SoC.

This series documents the board compatible and adds a minimal device
tree that enables UART0 on the USB-C debug port as the serial console.

Changes in v2:
- Add missing email to the copyright line.
- Link to v1: https://lore.kernel.org/r/20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn

---
Han Gao (2):
      dt-bindings: riscv: eswin: Add Milk-V Megrez
      riscv: dts: eswin: Add Milk-V Megrez board

 Documentation/devicetree/bindings/riscv/eswin.yaml |  1 +
 arch/riscv/boot/dts/eswin/Makefile                 |  1 +
 arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts | 25 ++++++++++++++++++++++
 3 files changed, 27 insertions(+)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-eic7700-megrez-16057cfc65df

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
