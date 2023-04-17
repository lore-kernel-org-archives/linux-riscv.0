Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01E6C77B72
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GW4Nw0EuL4BEUhNfWgCl9lcZA450CNqm3ruztixv54E=; b=gZwePxAy3Hz0PC
	ywKPeDOJiPf00+Jt2DDmCwtMiF9Go6pN1Qgzz+meixj/o2flKpK3biahupb2tS/n93YftSdaliild
	Vm3Ei1sbDDZmkwDcyhOxokGZ8yxHdePszZv+U//TllW9Of15D4ZIIyOjcfgS/IviMDZiJ00GkQTx4
	r+LbtJKJ6vBaGoayZViprsDZrn+/NLn153ed2fYGjDd0qXNVo+pxXHgNp+/z2DXjHRy+CSDhVGJHN
	sC0MQzJC86CfLfFDkrPc8HgPE25jJMjXeuX0SxOFg7QjhPRat+O0/tiJpOXl/fQAVlsLKidsxQvqN
	T2Ur5dkDrcwCVH8wO5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poMyT-00FyYK-1j;
	Mon, 17 Apr 2023 11:24:45 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMyN-00FyX3-2D;
	Mon, 17 Apr 2023 11:24:42 +0000
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id C7E5061CC40F9;
	Mon, 17 Apr 2023 13:24:36 +0200 (CEST)
Message-ID: <a736cae5-8c05-ddda-a1b0-37c8afdbd6ea@molgen.mpg.de>
Date: Mon, 17 Apr 2023 13:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, David Woodhouse
 <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "James E. J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de>
In-Reply-To: <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_042439_867076_2258795A 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

W0NvcnJlY3QgRGF2aWTigJlzIGFkZHJlc3NdCgpBbSAxNy4wNC4yMyB1bSAxMzoxOSBzY2hyaWVi
IFBhdWwgTWVuemVsOgo+IERlYXIgVGhvbWFzLAo+IAo+IAo+IEFtIDE1LjA0LjIzIHVtIDAxOjQ0
IHNjaHJpZWIgVGhvbWFzIEdsZWl4bmVyOgo+IAo+PiBUaGlzIGlzIGEgY29tcGxldGUgcmV3b3Jr
IG9mIHRoZSBwYXJhbGxlbCBicmluZ3VwIHBhdGNoIHNlcmllcyAoVjE3KQo+Pgo+PiAgICAgIAo+
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwMzI4MTk1NzU4LjEwNDk0NjktMS11
c2FtYS5hcmlmQGJ5dGVkYW5jZS5jb20KPj4KPj4gdG8gYWRkcmVzcyB0aGUgaXNzdWVzIHdoaWNo
IHdlcmUgZGlzY292ZXJlZCBpbiByZXZpZXc6Cj4gCj4gW+KApl0KPiAKPiBUaGFuayB5b3UgdmVy
eSBtdWNoIGZvciB5b3VyIHJld29yay4KPiAKPiBJIHRlc3RlZCB0aGlzIG9uIHRoZSBBU1VTIEYy
QTg1LU0gUFJPLCBhbmQgZ2V0IGEgZGVsYXkgb2YgdGVuIHNlY29uZHMuCj4gCj4gYGBgCj4gW+KA
pl0KPiBbwqDCoMKgIDAuMjU4MTkzXSBzbXBib290OiBDUFUwOiBBTUQgQTYtNjQwMEsgQVBVIHdp
dGggUmFkZW9uKHRtKSBIRCAKPiBHcmFwaGljcyAoZmFtaWx5OiAweDE1LCBtb2RlbDogMHgxMywg
c3RlcHBpbmc6IDB4MSkKPiBb4oCmXQo+IFvCoMKgwqAgMC4yNTkzMjldIHNtcDogQnJpbmdpbmcg
dXAgc2Vjb25kYXJ5IENQVXMgLi4uCj4gW8KgwqDCoCAwLjI1OTUyN10geDg2OiBCb290aW5nIFNN
UCBjb25maWd1cmF0aW9uOgo+IFvCoMKgwqAgMC4yNTk1MjhdIC4uLi4gbm9kZcKgICMwLCBDUFVz
OsKgwqDCoMKgwqAgIzEKPiBbwqDCoMKgIDAuMjYxMDA3XSBBZnRlciBzY2hlZHVsZV9wcmVlbXB0
X2Rpc2FibGVkCj4gW8KgwqAgMTAuMjYwOTkwXSBDUFUxIGZhaWxlZCB0byByZXBvcnQgYWxpdmUg
c3RhdGUKPiBbwqDCoCAxMC4yNjEwNzBdIHNtcDogQnJvdWdodCB1cCAxIG5vZGUsIDEgQ1BVCj4g
W8KgwqAgMTAuMjYxMDczXSBzbXBib290OiBNYXggbG9naWNhbCBwYWNrYWdlczogMgo+IFvCoMKg
IDEwLjI2MTA3NF0gc21wYm9vdDogVG90YWwgb2YgMSBwcm9jZXNzb3JzIGFjdGl2YXRlZCAoNzgw
MC41NCBCb2dvTUlQUykKPiBbwqDCoCAxMC4yNjE2MDFdIGRldnRtcGZzOiBpbml0aWFsaXplZAo+
IFvCoMKgIDEwLjI2MTY5N10geDg2L21tOiBNZW1vcnkgYmxvY2sgc2l6ZTogMTI4TUIKPiBgYGAK
PiAKPiBUaGlzIGRlbGF5IGhhcyBiZWVuIHRoZXJlIHdpdGggdjYuMy1yYzYtNDYtZ2RlNDY2NDQ4
NWFiYmMgYW5kIHNvbWUgCj4gY3VzdG9tIChwcmludGspIHBhdGNoZXMgb24gdG9wIGFuZCBtZXJn
aW5nIGR3bXcyL3BhcmFsbGVsLTYuMi1yYzMtdjE2IAo+IGludG8gaXQuIEkgb25seSB0ZXN0ZWQg
dGhpcy4gSSB0aGluayBkd213Mi9wYXJhbGxlbC02LjItdjE3IGZhaWxlZCB0byAKPiBidWlsZCBm
b3IgbWUsIHdoZW4gdHJ5aW5nIHRvIG1lcmdlIGl0IGludG8gTGludXPigJkgbWFzdGVyIHZlcnNp
b24gYXQgdGhhdCAKPiB0aW1lLiBJIGRpZG7igJl0IGNvbWUgYXJvdW5kIHRvIHJlcG9ydCBpdCwg
YW5kIHlvdSBwb3N0ZWQgeW91ciByZXdvcmssIHNvIAo+IEkgYW0gcmVwbHlpbmcgaGVyZS4KPiAK
PiBJIGFtIGdvaW5nIHRvIHRyeSB5b3VyIGJyYW5jaCBkaXJlY3RseSBpbiB0aGUgbmV4dCBkYXlz
LCBidXQganVzdCB3YW50ZWQgCj4gdG8gcmVwb3J0IGJhY2sgYWxyZWFkeS4KPiAKPiAKPiBLaW5k
IHJlZ2FyZHMsCj4gCj4gUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
