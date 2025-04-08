Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A7EC3600C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40HWieyePgbEpR7Y19eb5oxph8QykuNpD8Fo583j5qM=; b=1SVcvohEpmLqqA
	tsbr5MZscFt86CQCaqFe/cfYY0w/077xvU1VOPrF0Zwgxcl3bCd9Br+K1xm1jnrTymCNnexboAiIB
	vzc1dXeYOIO/MIYKumzGwQzv7L40+yxdVuCKuP1GQV/mr7A/82QEckRKBAvaqqPBuHm5jzJ0xemuj
	/EfT3jybQknGsV/sGbcVYtDoXybzO+6azWftGoTPF/xumFCmRwB+HuCXlj+oA8P4Jm98kItblSC/k
	2z/m2PKQMiGSejcZtW3TKEnx0SEu+jE5A+kyqHdFbqla7Gcz4cej+5pBbQRxa1/yZnhFmkuu5YzSl
	lzwaY9nXj10+Hr0vdhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24tb-00000003NHh-1H9w;
	Tue, 08 Apr 2025 09:05:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24cO-00000003JQ0-1ShU
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 08:47:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744102057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r4BlX0lCwbiIFb4qchxJxBRV88YRP4RCgKqrrz3VFes=;
	b=ljoLSqixW5WrBxDLEm9j4dh8ysqPFujFvuy4u401FJUZcT6KpgcEhCrBPU73TtG0E4+GuV
	AEhK/VLg6faTU++ebJsXR1H2QNIFuidGnver9GWVVyHsVv/a7juoCJA6i87LXVyaDAVpL2
	Ffjue5OUd7T5UCjPmhF0zv9vDjQjZBGDBXACg8AdiMDC9kfMps4c2QAdUVmfQSBjb3C+CS
	HKiX8Nnq7cKFcTwfzrassHZMVKwvNRpWxRR+QMBxZhDh4/iWkO/QYTS/ygL80aHZakUiwv
	WcUz4s6I2QpYunlHR5HJP61Gt6JutFkm1J1QCm2Sts72M6gm5QQvtxRjCiy+oQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744102057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r4BlX0lCwbiIFb4qchxJxBRV88YRP4RCgKqrrz3VFes=;
	b=Zlmz6sQFQbmRosJeoqbAq2dV0g8gygZFHZ2yi9oSV+ZOE19E1xJTh+9EABGXwJuNt5sGnj
	aFSdX5uO+GIla1CA==
To: Bartosz Golaszewski <brgl@bgdev.pl>, Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alex Elder
 <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
In-Reply-To: <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
 <20250407103320-GYA13974@gentoo>
 <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
Date: Tue, 08 Apr 2025 10:47:36 +0200
Message-ID: <87r023ujiv.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_014740_522293_64A8279A 
X-CRM114-Status: UNSURE (   8.01  )
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

T24gTW9uLCBBcHIgMDcgMjAyNSBhdCAxMzoyNiwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToK
PiBPbiBNb24sIEFwciA3LCAyMDI1IGF0IDEyOjMz4oCvUE0gWWl4dW4gTGFuIDxkbGFuQGdlbnRv
by5vcmc+IHdyb3RlOgo+PiBPbiAwNjowNiBXZWQgMjYgTWFyICAgICAsIFlpeHVuIExhbiB3cm90
ZToKPj4gICBJJ2QgYXNzdW1lIHRoaXMgcGF0Y2ggWzIvMl0gd2lsbCBnbyB2aWEgcGluY3RybCdz
IHRyZWU/Cj4+IGFzIHBhdGNoIFsxLzJdIGhhcyBiZWVuIGFjY2VwdGVkIGJ5IFRob21hcyBpbnRv
IHRpcCB0cmVlIFsxXS4uCj4+ICAgQWRkaXRvbmFsbHkgbmVlZCB0byBwdWxsIHRoYXQgY29tbWl0
IGZpcnN0PyBzaW5jZSBpdCdzIGEgZGVwZW5kZW5jeQo+Pgo+Cj4gTm8sIHRoaXMgc2hvdWxkIGdv
IHRocm91Z2ggdGhlIEdQSU8gdHJlZSBidXQgZm9yIHRoYXQgSSdkIG5lZWQgYW4KPiBpbW11dGFi
bGUgdGFnIHdpdGggcGF0Y2ggMS8yLgoKSGVyZSB5b3UgZ286CgogICBnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcC5naXQgaXJxZG9tYWluLTA0LTA4
LTI1CgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
