Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC4606A691
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rHVIDZc8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CBEFfCgC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NA3luoXpxOlOlXhKM3ORT+vEDuLUjW/v0cnXFgp2iF0=; b=rHVIDZc8aRq313FOdM9v0nhdbN
	FKJC6GBJVn8j5b/bqLoYWAYl1405fiHGc4TyNAOBvjgHajs3X1sj8CFowFUf2c3F+S4L880xbxs7j
	ZuyYnos+GdEVLoA+aCpdr+a6n9uuGTlSeT7wBoePathL/IsAQ8YgDa73CHC5g+iZeAX9UsTOLBlzz
	XhUGntBVYHAelu1tyj4L0duOkIOik7PNsKVpGr+fVwb+1ttTV1Zow9wTv2uUysCJCI5a5TxAElH3T
	aX28xUvIvQAo9mr3WYoeR0RF8O7dtfNPZI5hwKdsGBmm6HtGU9TsQF1hHwDs1djvyvibZH5W+yn+q
	+DZoXVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7hm-000000018c3-2EVO;
	Sun, 22 Nov 2026 13:34:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7hk-000000018br-3DhY
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 13:34:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25F5043E43;
	Sun, 22 Nov 2026 13:34:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354444;
	b=Wv04mLyL3vizUp6qlx3Vy6Eu1pGmm0RjZNYJD8QnlLmtmuZPnopYx+FThMiGlaf5rpQJ
	 a8Rjqq1QT5cBhVRwBzjh60s82HYb07eqXU2omWtT4BbhdAH6+S1MGJY9Cc/i4QPM3aB/I
	 +5by1EDo7f0LLJMwU45RQLEnQ+TyNuUADlfn3BuKUuidXfcTqJgSJjyb/1m4Bk2hEleWc
	 FhcgXQ2MMa8rx0qXXqs6tyJhNO2T9ahcafNfKBICofEYFQgvSF1800Tr2O0+X03t+z561
	 B505asWPhj2JZoLJlAV74udGYiQKxOH9ED/cZRCkcXbn9L36eSh3Rb2aH3X6odvfriw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354444;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=9GnjWJB91qCe0KX8+6Rd/TFOaVLw2wAKbH7CLAgnS94=;
	b=Z3o8mngMgVjUGcXMlw/j576mkeHxYTq5QcGFTrIZUwwWVeY4njQcEPL2xfNksSHs5wcL
	 T5xlJsuuph0LHJDrMjBW7vt/RmmHlcacs/HBpDz9Kk+auy+llhdDvvwwUHETaMMjdPRxn
	 wKZ1jpBE1r8zhsZzlcWOeJrhDREigcgp4utSwqKs+aG+QYaxdugxuodekxsKfj93nPjie
	 vhlcK831iWNnai8Je1Uyvm8dbtNhLh0pC3BMp2dwOxn1i7MgI40FQPtMaYDJJTrSGnY4v
	 uNDh9c9njJDbsjBG70ovSXu+G/kAv+Pxgn23IcNYf4tkvAifMmVtV5a00KEb03EQMOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75DE31F000C4;
	Sun, 22 Nov 2026 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354444;
	bh=9GnjWJB91qCe0KX8+6Rd/TFOaVLw2wAKbH7CLAgnS94=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=CBEFfCgCuVwk27D0mSoph9zuU1XT2Z9in2u2SmQ4Mh4dAbvr/RQYhG/znwniNqukS
	 SgtSoTwdLr227kIiL69dgFiPW0niOoRytDufqnKESKrypicyGZxkXuFuqzhcPeM4gA
	 DhAz+W9TnALJvO6/VSRkyrNRIdbxN4X22yWO4vRxoBoEtVszK6XBqLFGZ8HoVIKhDr
	 dtP8dA1EsucQM6gJ9muwGtme6WRolKdFLsmnbhAYZnYpqskeIv3GEnJ/ogfl3BXXUH
	 rdsEJEU3FepVyFHdoQTMjCORuE4OQ4o+aVQhlEjFE8h7ZQz/RCZNCpk8CIfaEfK0bb
	 VHNoRsg9LHPeQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 01E364C05B;
	Sun, 22 Nov 2026 13:33:59 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH 0/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v1/v2
Date: Sun, 22 Nov 2026 21:33:50 +0800
Message-Id: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD7vAmsC/x3MQQqAIBBA0avErBvIoUy6SrTIGms2FhoSiHdPW
 r7F/xkiB+EIU5MhcJIol69QbQPbufqDUfZqoI60UkQYD+p6Qk4Ww7OhsdqSHdxoBoYa3YGdvP9
 wXkr5AKcMWRtgAAAA
X-Change-ID: 20261122-sg2042-evb-rtc-8b6b2b5f785e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354439; l=724;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=0g/iv1tZgTdpWri/xql23J0iaDx4fUB3t4ZFsEz3YN4=;
 b=+5BwCbRV7xK/ReufgCCIT6UzmxknvULqgSgcG+xyvC6vOI7S0jEuMmD18uEGiD1Je+eiuaHCt
 rRquTEvpn5BDC8eQ5IWRVv6NUO3WiNZRlI+VTwGcvpYze/OF3cpsml3
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

Both SG2042 EVB boards have a PT7C4307 RTC on I2C0, same as the
Milk-V Pioneer. Enable it on both.

Datasheet: https://datasheet.octopart.com/PT7C4307WE-Diodes-Inc.-datasheet-180988416.pdf

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Han Gao (2):
      riscv: dts: sophgo: Enable the RTC on SG2042 EVB v1
      riscv: dts: sophgo: Enable the RTC on SG2042 EVB v2

 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 21 +++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 21 +++++++++++++++++++++
 2 files changed, 42 insertions(+)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261122-sg2042-evb-rtc-8b6b2b5f785e

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
