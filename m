Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8F1CD3423
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRpUgl41fsqmKyaHdjrVzBRPxWOcU6T3ezAFuXJFc7g=; b=n8mzSIwdG7Y+PE
	PGijFGP1GJ5OyO7GvGrZIRBTyeFGMdAL2JdCFcMwWc22fQbayyvcy1uRsihODE+wPONmb0BbOvAhz
	SgitPswfX0zTA8RcBb+TmLHeyLXfv/t/vU/5VwGU0p1zd/Hv73vGYkm2vHomE/gEyuIpgkgNn9Gs8
	Khazqm9mjzdU8CECgyJRCyKQabmVrgzA7wu2Ed8JyCmreka/3it/Knmf4gH+HNkEIosjCk4jPPYze
	dxNhs2tF9NPiOcbxmXAUYzNabrn1N3NozIr/BbAFXApdCmPpYLwGd8qcB6OgERl+7o0bURFdrY3Ui
	ivCJwNYzw92SoRm8KB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIthr-00000007csR-3AbO;
	Fri, 01 May 2026 19:39:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIthp-00000007csA-3GZJ;
	Fri, 01 May 2026 19:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rp8f/WeQia8QAD+YJmPABxXPXrvHyOM5hZfBchCKMDA=; b=uHjHrPPD2LeDk5mLziBh3YyqEj
	pfhR1tJpiKuUsooCkGqL2JZsb+D6vXBCRLBIbK0Q44xOCZOqwgtOj5wLR1q5KX9Q3NvcP0rciSd+G
	ckgC0Zlz14TMgm+JsN7ZyOCt1Uvx4cReuGP0X3rwHMIqy2VNYPteQIn4/oeQedWAMeFvYDZOK+5J9
	gMu8Q18KidiWTxvlLNVjdpduJUbW8ext7a3iuodZcXYJM4buozO5xWvugDSnEUtY1AeZRzE+j32qI
	9Rxm90eK24xcN0FvxD+xBCl3zDGmbqcxwWSaplpXlbRREhdZ7Fj4povFbiHlxELsrOySKt4514WFP
	5emRWH6A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIthf-00000009F6Q-0jSu;
	Fri, 01 May 2026 19:39:11 +0000
Date: Fri, 1 May 2026 20:39:10 +0100
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
Message-ID: <afUBXnPVnt7Jt5hh@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4x8sNtgv7Y198Gh9NSY+SE2o_JPFAxG9aWE+xXsB9vwGg@mail.gmail.com>
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

T24gU2F0LCBNYXkgMDIsIDIwMjYgYXQgMDI6MjU6MzdBTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiBPbiBTYXQsIE1heSAyLCAyMDI2IGF0IDE6NTjigK9BTSBNYXR0aGV3IFdpbGNveCA8d2ls
bHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiBZZXMsIGJ1dCB0aGF0IHN0aWxsIGZhaWxzIHRv
IGFuc3dlciAiZG9lcyB0aGlzIGFjdHVhbGx5IGhhcHBlbiIuICBIb3cgbXVjaAo+ID4gcGVyZm9y
bWFuY2UgaXMgYWxsIHRoaXMgY29tcGxleGl0eSBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGVyIGJ1
eWluZyB1cz8KPiA+IElmIHlvdSBkb24ndCBhbnN3ZXIgdGhpcyBxdWVzdGlvbiwgSSdtIGp1c3Qg
Z29pbmcgdG8gZ28gaW4gYW5kIHJpcCBpdAo+ID4gYWxsIG91dC4KPiAKPiBJ4oCZbSBnZXR0aW5n
IHF1aXRlIGNvbmZ1c2VkLiBJbiBwYXRjaCA0LzUsIHlvdSBzdWdnZXN0IGEgbW9yZQo+IHJlc3Ry
aWN0aXZlIGNvbmRpdGlvbiB1c2luZwo+IGlmIChmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSAm
JiAhZm9saW9fdGVzdF93cml0ZWJhY2soZm9saW8pKQo+IHJhdGhlciB0aGFuIGlmIChmb2xpb190
ZXN0X3VwdG9kYXRlKGZvbGlvKSksIGJlZm9yZSB3ZSBkZWNpZGUgdG8gc2tpcAo+IHJldHJ5aW5n
IHRoZSBwYWdlIGZhdWx0IFsxXS4KPiBUaGF0IHNlZW1zIHRvIHN1Z2dlc3Qgd2Ugc2hvdWxkIGJl
IG1vcmUgY2F1dGlvdXMgYWJvdXQgd2hlbiB3ZSBjYW4gc2tpcAo+IHJldHJ5aW5nIHRoZSBwYWdl
IGZhdWx0Lgo+IAo+IEhvd2V2ZXIsIGluIHRoZSBjb3ZlciBsZXR0ZXIsIHlvdSBzdWdnZXN0IHJl
bW92aW5nIGFsbCByZXRyeSBjb2RlIGVudGlyZWx5Lgo+IERvZXMgdGhpcyBzdWdnZXN0aW9uIGFw
cGx5IG9ubHkgdG8gZmlsZS1iYWNrZWQgcGFnZSBmYXVsdHM/CgpJJ20gbWFraW5nIHN1cmUgdGhh
dCBpZiBBbmRyZXcgZGVjaWRlcyB0byBvdmVycmlkZSBtZSBoZSBhdCBsZWFzdCBzZWVzCnRoYXQg
dGhlcmUgYXJlIG90aGVyIHByb2JsZW1zIHdpdGggdGhpcyBwYXRjaHNldCBiZXlvbmQgIkkgZG9u
J3QgbGlrZQp0aGUgYWRkaXRpb25hbCBjb21wbGV4aXR5Ii4KCkFuZCBtYXliZSB3ZSBkZWNpZGUg
dG8gZG8gdGhlIGZhbGxiYWNrIGZvciBhbm9uLW1tIGJ1dCBub3QgZmlsZSBtZW1vcnkuCk9yIG1h
eWJlIGl0J3MganVzdCBzb21ldGhpbmcgc29tZWJvZHkgaGFwcGVucyB1cG9uIHdoZW4gcmVhZGlu
ZyB0aGUKbWFpbGluZyBsaXN0IChvciBtb3JlIGxpa2VseSBpdCdzIGp1c3QgZ3Jpc3QgZm9yIGFu
IEFJKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
