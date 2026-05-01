Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE53CCFA13
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1A4S0qZnFPLlJRnOEK0aOCIbiMGI54/KnYndw3zTXBQ=; b=Yd8d3HHttTqLE/
	DO9+swcpPsyiG9ZR92VWkySzMrvEzUibdTg6PNuS6Sn74sDlACYBzaT/kR2ZumOQB9Cml6JQxafLM
	/weHp6MpZK45+tXTZkLvPst7ovoYXhiZHCyoWqYhAYxs12OIRIMZX1ipb4/EGsmzgu8CYSjfmJOyr
	gG/kXnllVkpHUxTn/tOKGPbwpUEBJ0NHarZHC1lIzq+NERORnlMjMDA+rn7YwdPGkUzl98hW20Ch5
	tblm5MIGDsotlYKc52W9ZZOhJbNyQ5T8o6iaUF+MXolMU1O7UOG+EDIKCddkwQA8SoISQFjAb1N7G
	ABaawM8I2meDDO6/myag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIs7o-00000007XYf-3qPg;
	Fri, 01 May 2026 17:58:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIs7n-00000007XYG-0O6i;
	Fri, 01 May 2026 17:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u/+O11I2l5uEWQtHiF9iLIDtrtif7F+7W2x9HgtS2Zk=; b=cS0FYwD2XOEYVbuKnpFKh9ZiSM
	0EwDyUhzf4L/Z7u5RfwH9F/lLM1NhuqZPIwTkUmNl1PS4VMevXWN1PepuvnRy9E8BXEEBe1NqpbST
	JCuDyJciLjPMlOgK/msGkQ/Etm/ww5vna/xrv//xWjQSuG3YKtTWGFNZVR8+M3tsp34wr0aQKFWkJ
	uFsTeHHXdKUGothOh1mQqNx0qA+TQ+SY8myKKpSqt0cEDRnA3Sr7IVPyxsjySvvgY2FjAsXzlkA0p
	PsB/KjAACHCD+NoUMzQlqunyAml2flv3i9OPzaSZZMasw49lDXCUAuGtnBBvR4d+htLsXvVM7+CgM
	/hohbFOw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIs7c-000000098SG-2Rmh;
	Fri, 01 May 2026 17:57:52 +0000
Date: Fri, 1 May 2026 18:57:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, jack@suse.cz,
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn,
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com,
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com,
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <afTpoL3FklpQZNMM@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
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

T24gU2F0LCBNYXkgMDIsIDIwMjYgYXQgMDE6NDQ6MzRBTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiBPbiBGcmksIE1heSAxLCAyMDI2IGF0IDEwOjU34oCvUE0gTWF0dGhldyBXaWxjb3ggPHdp
bGx5QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgTWF5IDAxLCAyMDI2IGF0
IDA2OjQ5OjU4QU0gKzA4MDAsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gPiA+IDEuIFRoZXJlIGlzIG5v
IGRldGVybWluaXN0aWMgbGF0ZW5jeSBmb3IgSS9PIGNvbXBsZXRpb24uIEl0IGRlcGVuZHMgb24K
PiA+ID4gYm90aCB0aGUgaGFyZHdhcmUgYW5kIHRoZSBzb2Z0d2FyZSBzdGFjayAoYmlvL3JlcXVl
c3QgcXVldWVzIGFuZCB0aGUKPiA+ID4gYmxvY2sgc2NoZWR1bGVyKS4gU29tZXRpbWVzIHRoZSBs
YXRlbmN5IGlzIHNob3J0OyBhdCBvdGhlciB0aW1lcyBpdCBjYW4KPiA+ID4gYmUgcXVpdGUgbG9u
Zy4gSW4gc3VjaCBjYXNlcywgYSBoaWdoLXByaW9yaXR5IHRocmVhZCBwZXJmb3JtaW5nIG9wZXJh
dGlvbnMKPiA+ID4gc3VjaCBhcyBtcHJvdGVjdCwgdW5tYXAsIHByY3RsX3NldF92bWEsIG9yIG1h
ZHZpc2UgbWF5IGJlIGZvcmNlZCB0byB3YWl0Cj4gPiA+IGZvciBhbiB1bnByZWRpY3RhYmxlIGFt
b3VudCBvZiB0aW1lLgo+ID4KPiA+IEJ1dCBkb2VzIHRoYXQgYWN0dWFsbHkgaGFwcGVuPyAgSSBm
aW5kIGl0IGhhcmQgdG8gYmVsaWV2ZSB0aGF0IHRocmVhZCBBCj4gPiB1bm1hcHMgYSBWTUEgd2hp
bGUgdGhyZWFkIEIgaXMgaW4gdGhlIG1pZGRsZSBvZiB0YWtpbmcgYSBwYWdlIGZhdWx0IGluCj4g
PiB0aGF0IHNhbWUgVk1BLiAgbXByb3RlY3QoKSBhbmQgbWFkdmlzZSgpIGFyZSBtb3JlIGxpa2Vs
eSB0byBoYXBwZW4sIGJ1dAo+ID4gaXQgc3RpbGwgc2VlbXMgcmVhbGx5IHVubGlrZWx5IHRvIG1l
Lgo+IAo+IEl0IGRvZXNu4oCZdCBoYXZlIHRvIGludm9sdmUgdW5tYXBwaW5nIG9yIGFwcGx5aW5n
IG1wcm90ZWN0IHRvCj4gdGhlIGVudGlyZSBWTUHigJRqdXN0IGEgcG9ydGlvbiBvZiBpdCBpcyBz
dWZmaWNpZW50LgoKWWVzLCBidXQgdGhhdCBzdGlsbCBmYWlscyB0byBhbnN3ZXIgImRvZXMgdGhp
cyBhY3R1YWxseSBoYXBwZW4iLiAgSG93IG11Y2gKcGVyZm9ybWFuY2UgaXMgYWxsIHRoaXMgY29t
cGxleGl0eSBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGVyIGJ1eWluZyB1cz8KSWYgeW91IGRvbid0
IGFuc3dlciB0aGlzIHF1ZXN0aW9uLCBJJ20ganVzdCBnb2luZyB0byBnbyBpbiBhbmQgcmlwIGl0
CmFsbCBvdXQuCgo+IEJUVywgdGhlIGNoYWluIGNhbiBwcm9wYWdhdGU6IGEgcGFnZSBmYXVsdCBv
Y2N1cnMsIEIgd2FudHMgdG8gd3JpdGUgdGhpcwo+IFZNQSwgYW5kIEMgKGEgaGlnaGVyLXByaW9y
aXR5IHRhc2spIHdhbnRzIHRvIHdyaXRlIGFub3RoZXIgVk1BLiBEIG1heSBuZWVkCj4gdG8gaXRl
cmF0ZSBWTUFzIHVuZGVyIG1tYXBfbG9jaywgc28gQiBjYW4gZW5kIHVwIGJsb2NraW5nIGJvdGgg
QyBhbmQgRC4KCkkga25vdy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
