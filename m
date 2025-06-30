Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D36C8302D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7izQ0TnVq1/i8uh8homyUFCBaWeDf8QZLdOBaOjm3GM=; b=mPnm03fS7qI8jp
	SjtIdJPtSc64xFXt9S2LL0XhEZw1G54oEBa9bpx7UyzDImpIuBl58KF8jf7FrxNdTMnE9lCixIB4M
	eVZC3ynRGr2UwKe+6gUsulor4wsPuG/aYybo/O1QzA1piieIMGi9cLr/VZcsY+5SGzJtwwL2pE1up
	Ua7Yn8C91s1iAiCzkJaA2Nwi8M8Njb1GqHehp2F14W/dm0R3mum+rJBd1+8j8ZM4CtETIH3rFSC/n
	41L0/nu14N1CGpCzB29qFrcpvl/EITo/fka/0JsLwhPqZkRmZb4KqpQciTotmsuNFMSf35CnZ4iJt
	Ms87dXZuSSPFRfUm8nuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWErU-00000002Qac-1TCB;
	Mon, 30 Jun 2025 13:47:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEdj-00000002OAC-0pCu
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 13:33:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3406061126;
	Mon, 30 Jun 2025 13:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAB2C4CEE3;
	Mon, 30 Jun 2025 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751290421;
	bh=iZ+s9SMgf+Y4MCs52QI7GV/8Kt/HHq5Cj/gYOGruYyU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iurEpeVsfekOhVmSaId5siebDwIAvaETGpWgx0tgrX60B3g4kkU28DC2YufKIwQER
	 IVvZ+DhGLKc/6QYLJn+2PGgQWx08/BV6tvYWTheBtC2S7kzNshWy3JpAqXxRG/TaYJ
	 0euI806g+52O4Zgpyj0xDdKqfUcdGivlEO39SIHhgEPBN1SALeGHByEj6CNGjkkkyR
	 ecGt85Y6ul1qTbpUW2L7tLg03EK/jViGXc2axe1VVlJwMQauFMK4Ty5Asv/qlHaar5
	 nCVtXZxDi/O8sFtyyv1H2ksDSZ60H+Zjc3SFWdHT+DNM3t7jzOCUBsuvhsyFK6O51G
	 yhIzNjGeaa/qQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pnina Feder <pnina.feder@mobileye.com>
Cc: alex@ghiti.fr, bjorn@rivosinc.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mick@ics.forth.gr, palmer@dabbelt.com,
 paul.walmsley@sifive.com, Pnina Feder <pnina.feder@mobileye.com>
Subject: Re: [PATCH 0/1] Fix for riscv vmcore issue
In-Reply-To: <20250630112309.97162-2-pnina.feder@mobileye.com>
References: <20250409182129.634415-1-bjorn@kernel.org>
 <20250630112309.97162-2-pnina.feder@mobileye.com>
Date: Mon, 30 Jun 2025 15:33:38 +0200
Message-ID: <87jz4txsjx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UG5pbmEhCgpQbmluYSBGZWRlciA8cG5pbmEuZmVkZXJAbW9iaWxleWUuY29tPiB3cml0ZXM6Cgo+
IFdlIGFyZSBjcmVhdGluZyBhIHZtY29yZSB1c2luZyBrZXhlYyBvbiBhIExpbnV4IDYuMTUgUklT
Qy1WIHN5c3RlbSBhbmQKPiBhbmFseXppbmcgaXQgd2l0aCB0aGUgY3Jhc2ggdG9vbCBvbiB0aGUg
aG9zdC4gVGhpcyB3b3JrZmxvdyB1c2VkIHRvCj4gd29yayBvbiBMaW51eCA2LjE0IGJ1dCBpcyBu
b3cgYnJva2VuIGluIDYuMTUuCgpUaGFua3MgZm9yIHJlcG9ydGluZyB0aGlzIQoKPiBUaGUgaXNz
dWUgaXMgY2F1c2VkIGJ5IGEgY2hhbmdlIGluIHRoZSBrZXJuZWw6Cj4gSW4gTGludXggNi4xNSwg
Y2VydGFpbiBtZW1ibG9jayBzZWN0aW9ucyBhcmUgbm93IG1hcmtlZCBhcyBSZXNlcnZlZCBpbgo+
IC9wcm9jL2lvbWVtLiBUaGUga2V4ZWMgdG9vbCBleGNsdWRlcyBhbGwgUmVzZXJ2ZWQgcmVnaW9u
cyB3aGVuCj4gZ2VuZXJhdGluZyB0aGUgdm1jb3JlLCBzbyB0aGVzZSBzZWN0aW9ucyBhcmUgbWlz
c2luZyBmcm9tIHRoZSBkdW1wLgoKSG93IGFyZSB5b3UgY29sbGVjdGluZyB0aGUgL3Byb2Mvdm1j
b3JlIGZpbGU/IEEgZnVsbCBzZXQgb2YgY29tbWFuZHMKd291bGQgYmUgaGVscGZ1bC4KCj4gSG93
ZXZlciwgdGhlIGtlcm5lbCBzdGlsbCB1c2VzIGFkZHJlc3NlcyBpbiB0aGVzZSByZWdpb25z4oCU
Zm9yIGV4YW1wbGUsCj4gZm9yIElSUSBwb2ludGVycy4gU2luY2UgdGhlIGNyYXNoIHRvb2wgbmVl
ZHMgYWNjZXNzIHRvIHRoZXNlIG1lbW9yeQo+IGFyZWFzIHRvIGZ1bmN0aW9uIGNvcnJlY3RseSwg
dGhlaXIgZXhjbHVzaW9uIGJyZWFrcyB0aGUgYW5hbHlzaXMuCgpXZHltIHdpdGggIklSUSBwb2lu
dGVycyI/IEFsc28sIHdoYXQgdmVyc2lvbiAoc2hhMSkgb2YgY3Jhc2ggYXJlIHlvdQp1c2luZz8K
CgpUaGFua3MhCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
