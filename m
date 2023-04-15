Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F99C77B70
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Apr 2023 21:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmJjp4+9ezlekkfaMI48+ufnTqwqwFZy2bTLgobYKA0=; b=c/Q1/Req44jFJP
	6g/CR9OtMo8MJbVHPP6XlvG61mGrLP/Bx5NbNOeC57FAzSnKtW4jLyfGSuVyfax/5j7nGng7jqORC
	nmbk4+zO+6j9vUr05JhWpyuzQo/scTcv/uNgMTXLWrgJ7IwPaA6EUisD1EagjCnGY1vzqOpvFpi5c
	RvLGGenrD4m/bgFLIH9+LXEezibjzGPV/7/sC10tGAFEMqlE8pGH/ncdiMK2TbuQrhRccQ6yQ35XK
	aK8EuLYw7Qmti0jwUq1JhtWquBoAxU/GfJdtUA5jgNVnESHlWnMGMX6oQ4JHZV1nsd6VEoh6+Jg/9
	6YD7RT5WTaj8Ril8lzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnn4N-00CidX-1j;
	Sat, 15 Apr 2023 21:04:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnn4I-00Cicf-38;
	Sat, 15 Apr 2023 21:04:24 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681592657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QvzaDLok1TQ4UelYWBZG7isf5NmoEpMzY70xaWHq6tY=;
	b=fIS1RUsnFKdb9xABGYfFiZCU2J2QWZeug/pOhRzYO2SSFiN67M2BraQ6i1WFD37roLQsyb
	0Xo1pTWRYZ/WwMogkjjzj3I+bbwhVwR7hTC3ROy5wKT1EIYulJpr/cXNAdOvjkRz7uB3BI
	klyFr/vToH0lZCb+hb3VXX9pfB0N3D76XKagNMZKWitt63oRwb7aPaIvEhJSApLEK7ILRG
	Zkcr6A4WMIslSyduOboeP87v5gUiVRgVXC8mEjpP6oV0s0oxKgYk+mkzY1TMBc6xKWwYqj
	lHlMmqQccgQg7IW71Y5KizHByK/0ncSB7/Q2HObdyAE/q+s6MPivfs7vv6Bz9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681592657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QvzaDLok1TQ4UelYWBZG7isf5NmoEpMzY70xaWHq6tY=;
	b=uGGpswhVFZB8lospVRZK/FCDeguM0Ticu2FJ7GXNrivH09zniqOSmq2BEICy2eBqNRVNGH
	0xJtAf6AVJyuuYBQ==
To: Brian Gerst <brgerst@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Arjan van
 de Veen <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>, Usama Arif
 <usama.arif@bytedance.com>, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 19/37] x86/smpboot: Switch to hotplug core state
 synchronization
In-Reply-To: <CAMzpN2j4NbGGR=jfxpVVQwYCZ=hHOUKm3oBpw1WKGiTUJ73EXA@mail.gmail.com>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.382005483@linutronix.de>
 <CAMzpN2j4NbGGR=jfxpVVQwYCZ=hHOUKm3oBpw1WKGiTUJ73EXA@mail.gmail.com>
Date: Sat, 15 Apr 2023 23:04:16 +0200
Message-ID: <87pm84yi0f.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_140423_181086_C2662C76 
X-CRM114-Status: UNSURE (   8.87  )
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

T24gU2F0LCBBcHIgMTUgMjAyMyBhdCAwODo1OCwgQnJpYW4gR2Vyc3Qgd3JvdGU6Cj4gT24gRnJp
LCBBcHIgMTQsIDIwMjMgYXQgNzo0NOKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJv
bml4LmRlPiB3cm90ZToKPj4gICAgICAgICBwcl9kZWJ1ZygiQmVmb3JlIGJvZ29taXBzXG4iKTsK
Pj4gLSAgICAgICBmb3JfZWFjaF9wb3NzaWJsZV9jcHUoY3B1KQo+PiAtICAgICAgICAgICAgICAg
aWYgKGNwdW1hc2tfdGVzdF9jcHUoY3B1LCBjcHVfY2FsbG91dF9tYXNrKSkKPj4gKyAgICAgICBm
b3JfZWFjaF9wb3NzaWJsZV9jcHUoY3B1KSB7Cj4+ICsgICAgICAgICAgICAgICBpZiAoY3B1bWFz
a190ZXN0X2NwdShjcHUsIGNwdV9vbmxpbmVfbWFzaykpCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGJvZ29zdW0gKz0gY3B1X2RhdGEoY3B1KS5sb29wc19wZXJfamlmZnk7Cj4KPiBUaGlzIHNo
b3VsZCBiZSB0aGUgc2FtZSBhcyBmb3JfZWFjaF9vbmxpbmVfY3B1KCkuCgpEdWgsIHllcy4gT2J2
aW91c2x5Li4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
