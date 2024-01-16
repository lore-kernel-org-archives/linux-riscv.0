Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E616FC47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOS8roLWrEq1Lx6UVoX+0sphCD8EUm3KLmnjL6gbBeo=; b=uPMCsyS1V7ldmw
	H74J1stcZ+J1UYfc9Tb4M9/UjxwzRQ2HF7pqP967RlEgE0FuFqOSSl8v9M6edelvbh0x9QYq0fAp4
	ZAXnKrG+AJtBI3ZV85StCa3X2MFhlSnYetD41ZBBy8NvObzM1U9jwArthwkrIUBRvqncbWi/b/Dh4
	3L6pGlAsqQFsgsj5Q1+FH0whqzkJrGzR4cbKrzUAx/vikw8geZBG6pQnhn7Xpf7Gmrv1Bae88Tu06
	71ZJvf2MW4BAkoXkH0ptYJoKkp7VMb1v17XQh2VdKy8eLq5tUMYuF+Wqg6QrBvAi1jarZqYDsLsQZ
	flFewjtbWew+0UlEzGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPhwP-00BzYh-03;
	Tue, 16 Jan 2024 11:49:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPhwL-00BzY4-30
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 11:49:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 389D1B80DF0;
	Tue, 16 Jan 2024 11:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0986DC433F1;
	Tue, 16 Jan 2024 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705405747;
	bh=/vWDhkN+L+qnpAsWBVkM//QYOz+BY0ycQGurSJk7C0Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m84+NW4q9KkKLbTbNoi7pgWS7814zRVT+M46OMPeLkkx0ZIVI5FPtQ2qkKi4gLFMm
	 fzvyFgouPijZmB94DEs3GyPygYnIKJGx5ih/PSFDS5EFPMxURM0zG9HYWNtwpQQf3V
	 ylEtZFvkoFGSP+UhYkcBFxPWcWxBmKzMbIAGmqluWKqNAN+z92hg1eQOMxng23yCC3
	 bwdSR5jzBK64SgFr0BEXaTwEcdxAjMUNFp4y9xuzP8UzKwkpd0PcybzpIukCOOxDtn
	 B6VLGSmrFuVZVhe9pWYRMyW8+AiAOxmhVk6Im5Q3d5XDvGBF98vjn0057D5ffflF9H
	 5Yj9ai8KxPpDQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, greentime.hu@sifive.com,
 guoren@linux.alibaba.com, charlie@rivosinc.com, ardb@kernel.org,
 arnd@arndb.de, peterz@infradead.org, tglx@linutronix.de,
 ebiggers@kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>
Subject: Re: [v11, 00/10] riscv: support kernel-mode Vector
In-Reply-To: <CAJ+HfNgh1eOH4yVH2RZUnzJ-0bN-XrocCr9yBT2_qOV7nk9Q5g@mail.gmail.com>
References: <20240115055929.4736-1-andy.chiu@sifive.com>
 <CAJ+HfNgh1eOH4yVH2RZUnzJ-0bN-XrocCr9yBT2_qOV7nk9Q5g@mail.gmail.com>
Date: Tue, 16 Jan 2024 12:49:04 +0100
Message-ID: <87a5p58pn3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_034910_119947_D36EC537 
X-CRM114-Status: GOOD (  10.21  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBIaSBBbmR5LAo+Cj4g
T24gTW9uLCAxNSBKYW4gMjAyNCBhdCAwNjo1OSwgQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4+Cj4+IFRoaXMgc2VyaWVzIHByb3ZpZGVzIHN1cHBvcnQgcnVubmluZyBW
ZWN0b3IgaW4ga2VybmVsIG1vZGUuCj4+IEFkZGl0aW9uYWxseSwga2VybmVsLW1vZGUgVmVjdG9y
IGNhbiBiZSBjb25maWd1cmVkIHRvIHJ1biB3aXRob3V0Cj4+IHR1cm5uaW5nIG9mZiBwcmVlbXB0
aW9uIG9uIGEgQ09ORklHX1BSRUVNUFQga2VybmVsLiBBbG9uZyB3aXRoIHRoZQo+PiBzdXBvcnQs
IHdlIGFkZCBWZWN0b3Igb3B0aW1pemVkIGNvcHlfe3RvLGZyb219X3VzZXIuIEFuZCBwcm92aWRl
IGEKPj4gc2ltcGxlIHRocmVzaG9sZCB0byBkZWNpZGUgd2hlbiB0byBydW4gdGhlIHZlY3Rvcml6
ZWQgZnVuY3Rpb25zLgo+Cj4gWy4uLl0KPgo+PiBDaGFuZ2Vsb2cgdjExOgo+PiAgLSBUaGlzIGlz
IGEgcXVpY2sgcmVzcGluIHRvIGFkZHJlc3MgYm9vdCBmYWlsaW5nIG9uIHVidW50dSBhbmQgYWxw
aW5lLgo+PiAgLSBQYXNzIHRoZSB1cGRhdGVkIGNvcHkgc2l6ZSB3aGVuIGNhbGxpbmcgc2NhbGFy
IGZhbGxiYWNrLgo+PiAgLSBTa2lwIHNvbWUgYnl0ZXMgZm9yIHNjYWxhciBmYWxsYmFjayB3aGVu
IGZhdXRpbmcgYXQgdnNlOC52IHdpdGggYQo+PiAgICBub24temVybyAkdnN0YXJ0LiAoR3VvKQo+
PiAgLSBHdWFyZCByaXNjdl92X3NldHVwX2N0eF9jYWNoZSgpIHdpdGggIGhhc192ZWN0b3IoKSBj
aGVjay4KClsuLi5dCgo+IEknbGwga2ljayBvZmYgYSBmdWxsIGJ1aWxkL2Jvb3Qgd2l0aCB0aGUg
djExIQoKV2hlbiB0aGlzIHZlcnNpb24gKHYxMSkgaXMgYXBwbGllZCwgYWxsIDE3NCBib290cyBh
cmUgc3VjY2Vzc2Z1bGwuIEZvcgp0aGUgc2VyaWVzOgoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+CgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
