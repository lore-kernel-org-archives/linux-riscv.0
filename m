Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9F0C83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 09:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9/6GMaxcqPTLLU0uu9w2noXOB4sooPLJUy75nYr8y0=; b=B64//X17PohfRP
	6/iTqMOgyfOEQ2BvXGdXqfWuNci4OLVHy0qiEPV9wjSg3XjVZcaqxCzmRyad+hSpLajrxjwnsGo4F
	pRYZla+vwlIQ+2nmdG1QekjIyL/9ShMOynbJFWpZCiQDOyXKpW+d/PrpoVbWHlQAGS6OT35KPjizr
	Oi4uSIxc5dRKAHJc8X8WGACm70+vZ5j9N+bdQU85ZMdvixbV7uHGJsGYl2lCYGlTLYDgB6I6tU73y
	50ZGQr48caaEBnCuZKdYFOYBzX46F7JgNMKlRt9osQ8L8V+vx2KEReV9xLGweyqK+smvGgQkLWe0k
	VM1cZba52KTUgoyD4cgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBhJ-007hpp-0d;
	Sun, 27 Aug 2023 09:04:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBhH-007hpE-08
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 09:04:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72FFC62AA1;
	Sun, 27 Aug 2023 09:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717B7C433C8;
	Sun, 27 Aug 2023 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693127077;
	bh=y6B4CMo2bzrCCuPYGklfmEMWK+PNdiefaXdkAiB6EXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hr03HINqXIhQ+zBrth4/64FTbAKYnShVwYXQaMHl+jZayZzUevYD80sggXd4onoiK
	 Dqn56mfbkB5ZfedoR0KJRNb17GBwni2HQ03bDfjDc1sLt+tj9CbMQyxi7fVEevxFhG
	 AhlKtP+fLPWYarORlE7Ocv0Mce3+dtui1Ncz0+fVjM44D0xGr92v0gx3BLmsG1Zn1F
	 xSjdj4bp4ziYWDb5xiBhaYwJNdRpihs28SFn84tgFFad4c9txgIVArwiOCea5M+gaM
	 Nk9vrEj7y2vzABoJThJ5vwAGbhNmYQUp0WFOGN8O+opRR2uqaWLbPFABBFg/Gtlg3S
	 aRifv4kuVS8zw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcaov@gmail.com>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
 bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
 yonghong.song@linux.dev, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
In-Reply-To: <ZOsKukBz8i+h4Y8j@nam-dell>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <87v8d19aun.fsf@all.your.base.are.belong.to.us>
 <ZOpAjkTtA4jYtuIa@nam-dell>
 <87cyz8sy4y.fsf@all.your.base.are.belong.to.us>
 <ZOsKukBz8i+h4Y8j@nam-dell>
Date: Sun, 27 Aug 2023 11:04:34 +0200
Message-ID: <87y1hw7t5p.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_020439_165461_B9B3D95B 
X-CRM114-Status: GOOD (  15.64  )
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

TmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKCj4gT24gU3VuLCBBdWcgMjcsIDIw
MjMgYXQgMTA6MTE6MjVBTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gVGhlIGRlZmF1
bHQgaW1wbGVtZW50YXRpb24gb2YgaXNfdHJhcF9pbnNuKCkgd2hpY2ggUklTQy1WIGlzIHVzaW5n
IGNhbGxzCj4+IGlzX3N3YnBfaW5zbigpLCB3aGljaCBpcyBkb2luZyB3aGF0IHlvdXIgcGF0Y2gg
ZG9lcy4gWW91ciBwYXRjaCBkb2VzIG5vdAo+PiBhZGRyZXNzIHRoZSBpc3N1ZS4KPgo+IGlzX3N3
YnBfaW5zbigpIGRvZXMgdGhpczoKPgo+ICAgICAgICAgI2lmZGVmIENPTkZJR19SSVNDVl9JU0Ff
Qwo+ICAgICAgICAgICAgICAgICByZXR1cm4gKCppbnNuICYgMHhmZmZmKSA9PSBVUFJPQkVfU1dC
UF9JTlNOOwo+ICAgICAgICAgI2Vsc2UKPiAgICAgICAgICAgICAgICAgcmV0dXJuICppbnNuID09
IFVQUk9CRV9TV0JQX0lOU047Cj4gICAgICAgICAjZW5kaWYKPgo+IC4uLnNvIGl0IGRvZXNuJ3Qg
ZXZlbiBjaGVjayBmb3IgMzItYml0IGVicmVhayBpZiBDIGV4dGVuc2lvbiBpcyBvbi4gTXkgcGF0
Y2gKPiBpcyBub3QgdGhlIHNhbWUuCgpBaCwgd2FzIHRvbyBxdWljay4KCkFGQUlVIHVwcm9iZXMg
KmFsd2F5cyogdXNlcyBjLmVicmVhayB3aGVuIENPTkZJR19SSVNDVl9JU0FfQyBpcyBzZXQsIGFu
ZAplYnJlYWsgb3RoZXJ3aXNlLiBUaGF0J3MgdGhlIHJlYXNvbiBpc19zd2JwX2luc24oKSBpcyBp
bXBsZW1lbnRlZCBsaWtlCnRoYXQuIElmIHRoYXQncyBub3QgdGhlIGNhc2UsIHRoZXJlJ3MgYSBh
bm90aGVyIGJ1ZywgdGhhdCB5b3VyIHBhdGNoZXMKYWRkcmVzc2VzLgoKSW4gdGhhdCBjYXNlIHdl
IG5lZWQgYW4gYXJjaCBzcGVjaWZpYyBzZXRfc3dicCgpIGltcGxlbWVudGF0aW9uIHRvZ2V0aGVy
CndpdGggeW91ciBwYXRjaC4KCkd1bywgdGhvdWdodHM/IC4uLnRleHQgcGF0Y2hpbmcgb24gUklT
Qy1WIGlzIHN0aWxsIGEgYmlnIFdJUC4KCj4gQnV0IG9rYXksIGlmIGl0IGRvZXNuJ3Qgc29sdmUg
dGhlIHByb2JsZW0sIHRoZW4gSSBtdXN0IGJlIHdyb25nIHNvbWV3aGVyZS4KClllcywgdGhpcyBi
dWcgaXMgYW5vdGhlciBpc3N1ZS4KCj4+IFdlJ3JlIHRha2luZyBhbiBlYnJlYWsgdHJhcCBmcm9t
IGtlcm5lbCBzcGFjZS4gSW4gdGhpcyBjYXNlIHdlIHNob3VsZAo+PiBuZXZlciBsb29rIGZvciBh
IHVzZXJsYW5kICh1cHJvYmUpIGhhbmRsZXIgYXQgYWxsLCBvbmx5IHRoZSBrcHJvYmUKPj4gaGFu
ZGxlcnMgc2hvdWxkIGJlIGNvbnNpZGVyZWQuCj4+IAo+PiBJbiB0aGlzIGNhc2UsIHRoZSBUSUZf
VVBST0JFIGlzIGluY29ycmVjdGx5IHNldCwgYW5kIGluY29ycmVjdGx5IChub3QpCj4+IGhhbmRs
ZWQgaW4gdGhlICJjb21tb24gZW50cnkiIGV4aXQgcGF0aCwgd2hpY2ggdGFrZXMgdXMgdG8gdGhl
IGluZmluaXRlCj4+IGxvb3AuCj4KPiBUaGlzIGNoYW5nZSBtYWtlcyBhIGxvdCBvZiBzZW5zZSwg
bm8gcmVhc29uIHRvIGNoZWNrIGZvciB1cHJvYmVzIGlmIGV4Y2VwdGlvbgo+IGNvbWVzIGZyb20g
dGhlIGtlcm5lbC4KCk9rISBJIHNlbnQgYSBwYXRjaCBwcm9wZXIgZm9yIHRoaXMuCgoKQmrDtnJu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
