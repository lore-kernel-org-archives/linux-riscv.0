Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB22C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3pwv3LCdQq4ZWqyHxOh9Jum/l5ofrW9uAYE0v9Mn20=; b=1sLt+a3qCH2Eit
	JrZtKRgweTxLferXbZhl/2MgmMsqKKfXsEAqVev8MwETAlca7KtFC+MPXbtJjSYszLwu8+HhOBk5F
	jn7LNkbz3QkRurJmVuq3/rW1dKLaiuqZSH23xsKS6OkPffafFA3C6xjcuk25opQhJRJ0gMmqXtLmv
	7SSQSIdQ6seXRwrecYIz3RQHN/cES8xT/PPpMtp9HvZYXY+jngFyFXdw+AZdo0FuqEY7TOnKmgwYt
	7fJrcKemYrSbyrdhXUTgy8z3G9DooFaH4x6dli7wCM4fW78Z8WFuM+vujQC/FtazylW6sF2klU3nT
	19+DVFyzpsBVWFgNP1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5qZ-00E7TB-5j; Tue, 28 Feb 2023 19:41:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5qU-00E7Sb-VE
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 19:41:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84F8061181;
	Tue, 28 Feb 2023 19:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F063C433D2;
	Tue, 28 Feb 2023 19:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677613265;
	bh=30kPHMTvf9IF3XE2xLeD5hW+gxkyjy3HKdW7y5ZQaAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vJXU+9iK9fRWPssxiKgTLPyYfCohny+8DPpXHTDpRCiGHcwv6TP8m+aI97Hq8OYNy
	 spEO9O0HKPuh8VwxGiTTEK7dfHCmeHDMH/gkox7ltHzv58BzvaWiumP1C7D7NrbGO+
	 60FYa8rzNkVuMvGFXeHmfjwgwdXtf0GLNSWu/L6b2J8MBVGXP7ffP8YnSrT5i+3Fmk
	 3zk2d0r/kp2bhTTNrf8Fd2RMloxcnX6PLGpzLETp798Aww3127UuKTOOeRCr+vQH7h
	 nj77UqAf8XSX4YUuqZ6J5X5rNv82xfPZ/6lUp1Cr80/8DPXgo1MsEHdnYUjt8Y/cNE
	 BohuTvKFXfvyQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Heiko
 Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] lib/test_string.c: Make definition less dense
In-Reply-To: <CAHp75VfK3RM+SP90d3nOXEobY81Xd_94tLL=Qt86mmdNwXaQpg@mail.gmail.com>
References: <20230228184245.1585775-1-bjorn@kernel.org>
 <CAHp75VfK3RM+SP90d3nOXEobY81Xd_94tLL=Qt86mmdNwXaQpg@mail.gmail.com>
Date: Tue, 28 Feb 2023 20:41:03 +0100
Message-ID: <87o7pdfui8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_114107_059680_0483463B 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9u
IFR1ZSwgRmViIDI4LCAyMDIzIGF0IDg6NDLigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPj4KPj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Pgo+PiBDaGVja3BhdGNoIHNlZW1zIHRvIGhhdmUgdHJvdWJsZSBtYWtpbmcgc2Vuc2Ug
b2YgdGhlIHNpdHVhdGlvbiB3aGVuCj4+IHN0cnVjdCBkZWZpbml0aW9ucywgdmFyaWFibGUgZGVm
aW5pdGlvbnMsIGFuZCBfX2luaXRjb25zdCBtYXJraW5nIGlzCj4+IGRvbmUgaW4gb25lIGdvLgo+
Pgo+PiBMZXQncyBiZSBuaWNlciB0byBjaGVja3BhdGNoLCBhbmQgbW92ZSB0aGUgc3RydWN0IGRl
ZmluaXRpb24gb3V0LAo+PiB3aGljaCByZW1vdmVzIHRoZSBlcnJvci4KPgo+IE5vdCB0aGF0IEkn
bSBhZ2FpbnN0IHRoZSBwYXRjaCwgYnV0IGhvdyBoYXJkIGlzIGl0IHRvIGZpeCB0aGUgY2hlY2tw
YXRjaD8KClVobSwgZ29vZCBvbmUuIEknbGwgaGF2ZSBhIGxvb2sgKHRoZSAucGwgc2NhcmVkIG1l
IG9mZikuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
