Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40179C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 20:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgfuyLkmbf3MFk2rPAx/XGmiX2GpXloB9P9qWP0AYNA=; b=uR++9d6qyKZiYm
	IorIhIdRhCUkJKTW4dVqL5/1hFRhu6b02ojTeAamXIHhC13z6avAR58PL3pkOqoqvDof4xQo02HkX
	LagVDbWMxKSjn3DlVKaTwrcse1YMnJ546COpOcaFhCEPImLwPKKYLyI3ByZx6I2J1IV/ot2R1t8S+
	rl94wKOXNYJAlBfcRZre2u75EW2+Q5olZ8QK5fx772thH4WgUSz5/AkYrYnfP6qNGiMcmJsGkxAw0
	vb4nKh/ogUEKs3TNe+4wvevPuptALPFLaA6qkXshYKQY+w0a+u4npz9JKFQWeVd04TvyPLMsOmz7d
	1Pcq17EJQDLItAhFtAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05o7-0000000A6PI-1bcg;
	Thu, 25 Apr 2024 20:35:03 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s05o2-0000000A6MS-0eLy;
	Thu, 25 Apr 2024 20:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1714077293;
	bh=bZqtcMhFx7TDPaIgrLqyfpl0/OfmMPAKopBgZDQprIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+gqGa8PD+3BrRxF+Exe+s/+n1FrcsSYPFeQUrvoT2UUvEiGsEXMDYuXjYQJDYiRJ
	 9/0fJxtI2lDBLEHhkegO15rObvRhgIuWQMhE+D085PPIsVKHmI/z9Zz6qr7xUxUgOg
	 gdOVIytSYg1zquf83mxdxD8VyvGj7mHBMGjmlG8k=
Date: Thu, 25 Apr 2024 22:34:52 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Joel Granados <j.granados@samsung.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Eric Dumazet <edumazet@google.com>, 
	Dave Chinner <david@fromorbit.com>, linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, 
	linux-hardening@vger.kernel.org, bridge@lists.linux.dev, lvs-devel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, linux-sctp@vger.kernel.org, 
	linux-nfs@vger.kernel.org, apparmor@lists.ubuntu.com
Subject: Re: [PATCH v3 00/11] sysctl: treewide: constify ctl_table argument
 of sysctl handlers
Message-ID: <d11f875e-4fb5-46dd-a412-84818208c575@t-8ch.de>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <CGME20240425031241eucas1p1fb0790e0d03ccbe4fca2b5f6da83d6db@eucas1p1.samsung.com>
 <20240424201234.3cc2b509@kernel.org>
 <20240425110412.2n5d27smecfncsfa@joelS2.panther.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240425110412.2n5d27smecfncsfa@joelS2.panther.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_133458_371508_8511D0DD 
X-CRM114-Status: GOOD (  27.68  )
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

SGkgSm9lbCwKCk9uIDIwMjQtMDQtMjUgMTM6MDQ6MTIrMDAwMCwgSm9lbCBHcmFuYWRvcyB3cm90
ZToKPiBPbiBXZWQsIEFwciAyNCwgMjAyNCBhdCAwODoxMjozNFBNIC0wNzAwLCBKYWt1YiBLaWNp
bnNraSB3cm90ZToKPiA+IE9uIFR1ZSwgMjMgQXByIDIwMjQgMDk6NTQ6MzUgKzAyMDAgVGhvbWFz
IFdlacOfc2NodWggd3JvdGU6Cj4gPiA+IFRoZSBzZXJpZXMgd2FzIHNwbGl0IGZyb20gbXkgbGFy
Z2VyIHNlcmllcyBzeXNjdGwtY29uc3Qgc2VyaWVzIFswXS4KPiA+ID4gSXQgb25seSBmb2N1c3Nl
cyBvbiB0aGUgcHJvY19oYW5kbGVycyBidXQgaXMgYW4gaW1wb3J0YW50IHN0ZXAgdG8gYmUKPiA+
ID4gYWJsZSB0byBtb3ZlIGFsbCBzdGF0aWMgZGVmaW5pdGlvbnMgb2YgY3RsX3RhYmxlIGludG8g
LnJvZGF0YS4KPiA+IAo+ID4gU3BsaXQgdGhpcyBwZXIgc3Vic3lzdGVtLCBwbGVhc2UuCj4gSXQg
aXMgdHJpY2t5IHRvIGRvIHRoYXQgYmVjYXVzZSBpdCBjaGFuZ2VzIHRoZSBmaXJzdCBhcmd1bWVu
dCAoY3RsKikgdG8KPiBjb25zdCBpbiB0aGUgcHJvY19oYW5kbGVyIGZ1bmN0aW9uIHR5cGUgZGVm
aW5lZCBpbiBzeXNjbHQuaDoKPiAiCj4gLXR5cGVkZWYgaW50IHByb2NfaGFuZGxlcihzdHJ1Y3Qg
Y3RsX3RhYmxlICpjdGwsIGludCB3cml0ZSwgdm9pZCAqYnVmZmVyLAo+ICt0eXBlZGVmIGludCBw
cm9jX2hhbmRsZXIoY29uc3Qgc3RydWN0IGN0bF90YWJsZSAqY3RsLCBpbnQgd3JpdGUsIHZvaWQg
KmJ1ZmZlciwKPiAgICAgICAgICAgICAgICAgc2l6ZV90ICpsZW5wLCBsb2ZmX3QgKnBwb3MpOwo+
ICIKPiBUaGlzIG1lYW5zIHRoYXQgYWxsIHRoZSBwcm9jX2hhbmRsZXJzIG5lZWQgdG8gY2hhbmdl
IGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4gSG93ZXZlciwgdGhlcmUgaXMgYW4gYWx0ZXJuYXRpdmUg
d2F5IHRvIGRvIHRoaXMgdGhhdCBhbGxvd3MgY2h1bmtpbmcuIFdlCj4gZmlyc3QgZGVmaW5lIHRo
ZSBwcm9jX2hhbmRsZXIgYXMgYSB2b2lkIHBvaW50ZXIgKGNhc3RpbmcgaXQgd2hlcmUgaXQgaXMK
PiBiZWluZyB1c2VkKSBbMV0uIFRoZW4gd2UgY291bGQgZG8gdGhlIGNvbnN0aWZpY2F0aW9uIGJ5
IHN1YnN5c3RlbSAobGlrZQo+IEpha3ViIHByb3Bvc2VzKS4gRmluYWxseSB3ZSBjYW4gInJldmVy
dCB0aGUgdm9pZCBwb2ludGVyIGNoYW5nZSBzbyB3ZQo+IGRvbid0IGhhdmUgb25lIHNpemUgZml0
IGFsbCBwb2ludGVyIGFzIG91ciBwcm9jX2hhbmRsZXIgWzJdLgo+IAo+IEhlcmUgYXJlIHNvbWUg
Y29tbWVudHMgYWJvdXQgdGhlIGFsdGVybmF0aXZlOgo+IDEuIFdlIHdvdWxkIG5lZWQgdG8gbWFr
ZSB0aGUgZmlyc3QgYXJndW1lbnQgY29uc3QgaW4gYWxsIHRoZSBkZXJpdmVkCj4gICAgcHJvY19o
YW5kbGVycyBbM10gCj4gMi4gVGhlcmUgd291bGQgYmUgbm8gdW5kZWZpbmVkIGJlaGF2aW9yIGZv
ciB0d28gcmVhc29uczoKPiAgICAyLjEuIFRoZXJlIGlzIG5vIGNhc2Ugd2hlcmUgd2UgY2hhbmdl
IHRoZSBmaXJzdCBhcmd1bWVudC4gV2Uga25vdwo+ICAgICAgICAgdGhpcyBiZWNhdXNlIHRoZXJl
IGFyZSBubyBjb21waWxlIGVycm9ycyBhZnRlciB3ZSBtYWtlIGl0IGNvbnN0Lgo+ICAgIDIuMi4g
V2Ugd291bGQgYWx3YXlzIGdvIGZyb20gbm9uLWNvbnN0IHRvIGNvbnN0LiBUaGlzIGlzIHRoZSBj
YXNlCj4gICAgICAgICBiZWNhdXNlIGFsbCB0aGUgc3R1ZmYgdGhhdCBpcyB1bmNoYW5nZWQgaW4g
bm9uLWNvbnN0Lgo+IDMuIElmIHRoZSBpZGVhIHN0aWNrcywgaXQgc2hvdWxkIGdvIGludG8gbWFp
bmxpbmUgYXMgb25lIHBhdGNoc2V0LiBJCj4gICAgd291bGQgbm90IGxpa2UgdG8gaGF2ZSBhIHZv
aWQqIHByb2NfaGFuZGxlciBpbiBhIGtlcm5lbCByZWxlYXNlLgo+IDQuIEkgdGhpbmsgdGhpcyBp
cyBhICJ3aW4vd2luIiBzb2x1dGlvbiB3ZXJlIHRoZSBjb25zdGlmaWNhdGlvbiBnb2VzCj4gICAg
dGhyb3VnaCBhbmQgaXQgaXMgZGl2aWRlZCBpbiBzdWNoIGEgd2F5IHRoYXQgaXQgaXMgcmV2aWV3
YWJsZS4KPiAKPiBJIHdvdWxkIHJlYWxseSBsaWtlIHRvIGhlYXIgd2hhdCBwcGwgdGhpbmsgYWJv
dXQgdGhpcyAiaGVyZXRpYyIKPiBhbHRlcm5hdGl2ZS4gQFRob21hcywgQEx1aXMsIEBLZWVzIEBK
YWt1Yj8KClRoYW5rcyBmb3IgdGhhdCBhbHRlcm5hdGl2ZSwgSSdtIG5vdCBhIGJpZyBmYW4gdGhv
dWdoLgoKQmVzaWRlcyB0aGUgd29ua3kgc3ludGF4LCBDb250cm9sIEZsb3cgSW50ZWdyaXR5IHNo
b3VsZCB0cmFwIG9uCnRoaXMgY29uc3RydWN0LiBGdW5jdGlvbnMgYXJlIGNhbGxlZCB0aHJvdWdo
IGRpZmZlcmVudCBwb2ludGVycyB0aGFuCnRoZWlyIGFjdHVhbCB0eXBlcyB3aGljaCBpcyBleGFj
dGx5IHdoYXQgQ0ZJIGlzIG1lYW50IHRvIHByZXZlbnQuCgpNYXliZSBwZW9wbGUgZmluZCBpdCBl
YXNpZXIgdG8gcmV2aWV3IHdoZW4gdXNpbmcKIi0td29yZC1kaWZmIiBhbmQvb3IgIi1VMCIgd2l0
aCBnaXQgZGlmZi9zaG93LgpUaGVyZSBpcyByZWFsbHkgbm90aGluZyBnb2luZyBhbiBiZXNpZGVz
IGFkZGluZyBhIGZldyAiY29uc3Qicy4KCkJ1dCBpZiB0aGUgY29uc2Vuc3VzIHByZWZlcnMgdGhp
cyBzb2x1dGlvbiwgSSdsbCBiZSBoYXBweSB0byBhZG9wdCBpdC4KCj4gWzFdIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2pvZWwuZ3JhbmFkb3MvbGludXgu
Z2l0L2NvbW1pdC8/aD1qYWcvY29uc3RmeV90cmVld2lkZV9hbHRlcm5hdGl2ZSZpZD00YTM4MzUw
M2IxZWE2NTBkNGUxMmMxZjU4Mzg5NzRlODc5ZjVhYTZmCj4gWzJdIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2pvZWwuZ3JhbmFkb3MvbGludXguZ2l0L2Nv
bW1pdC8/aD1qYWcvY29uc3RmeV90cmVld2lkZV9hbHRlcm5hdGl2ZSZpZD1hM2JlNjU5NzNkMjdl
YzI5MzNiOWU4MWUxYmVjNjBiZTNhOWI0NjBkCj4gWzNdIHByb2NfZG9zdHJpbmcsIHByb2NfZG9i
b29sLCBwcm9jX2RvaW50dmVjLi4uLgoKClRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
