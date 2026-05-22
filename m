Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C500ACD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v//xXE41Vdljj5F7R9lwxiT7tDFZDudx3YfFBzMeq2A=; b=hXf+Dw3xic0CT/
	WqSlb3fmYgctezqne/F/vuFUfpv1kSAc80w5twqAzpUxnskAqvM8YNX4ImLVJG/MMfwC2iaOwvr9k
	ChhDDNDvShoMjY4symGaM43Hk7KbC1pTcU6hXqj3dRmWFZ2BNI3r+F9enqKFB1NIT+dwTfqHBnM1G
	a22puDBdjU8an1a3NtE+tXNzKboLSZzJxEYmUb2+BUPsQ8IMsI6z58uwSI9jExgIhqfFGZ7GSBdmh
	AgoszSk1F8x541b5Mmo1phpJ/VbbS8ettkA4dViyw+MlAO9wm4MWBtcTCY7TuhW25pIWMOoKKSs5m
	fuT9lkjQGaiU2aqOb/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS1O-0000000BJE9-348M;
	Fri, 22 May 2026 15:42:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS1M-0000000BJDY-20EA;
	Fri, 22 May 2026 15:42:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CECB060138;
	Fri, 22 May 2026 15:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E9D1F000E9;
	Fri, 22 May 2026 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779464563;
	bh=JCpY0JkuhcYxNLRV1IUbXIozIjXdostYdAAnrNS61cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fevBbZWW+amNTaTyKMVEGcATHJGI5beCyHSrNicjKpiIEwqwkPh/z0cIoe3sMBOEF
	 9KpGqhtEFq0bU7LJzRPro+xlky95JCucz80W5KK1l7KFP6+a4UbvOddg/RjiUMRrBc
	 TnJmst4YvoB1b0exji4XGaiDzIYHqxZdQizL+lY9YRCXPqsiUNa4Iwizpjdil6w8kp
	 avB7IiJOReUiZACrj/lPByfzfPgo+MU9KSfdz4bAzD5EbUs+mS2HRvW6EaIzmE8J07
	 jvv3I3rp4Q5xcvMk2ehvO5RHd+1nyNoGg6Bez7jfcnci4AcbssWI275h4ttA7+QWrP
	 1r5bMWvNKzJAA==
Date: Fri, 22 May 2026 16:42:34 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	bhe@redhat.com, chentao@kylinos.cn, chrisl@kernel.org, david@kernel.org, 
	jack@suse.cz, kasong@tencent.com, kunwu.chan@gmail.com, liam@infradead.org, 
	lianux.mm@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, liyangouwen1@oppo.com, 
	loongarch@lists.linux.dev, mhocko@suse.com, nphamcs@gmail.com, nzzhao@126.com, 
	pfalcato@suse.de, rppt@kernel.org, shikemeng@huaweicloud.com, surenb@google.com, 
	vbabka@kernel.org, wanglian@kylinos.cn, youngjun.park@lge.com
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ahB4_m6H37K7kDdO@lucifer>
References: <ag4kj84EcKqamdB-@casper.infradead.org>
 <20260522023305.98223-1-baohua@kernel.org>
 <ahBVh4NM2uoyhPNm@casper.infradead.org>
 <CAGsJ_4zQuJx1reJxgV387Gh0AqWF0KdoFn9KahQ1BNLPRm57TQ@mail.gmail.com>
 <CAGsJ_4zrm3sCp8Uz0Gh+sAwRcdtNF8rDLqX250sFVG3rZy9HNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4zrm3sCp8Uz0Gh+sAwRcdtNF8rDLqX250sFVG3rZy9HNw@mail.gmail.com>
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMDk6NDg6MzVQTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiBPbiBGcmksIE1heSAyMiwgMjAyNiBhdCA5OjM24oCvUE0gQmFycnkgU29uZyA8YmFvaHVh
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgTWF5IDIyLCAyMDI2IGF0IDk6MDni
gK9QTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIEZyaSwgTWF5IDIyLCAyMDI2IGF0IDEwOjMzOjA1QU0gKzA4MDAsIEJhcnJ5IFNvbmcg
KFhpYW9taSkgd3JvdGU6Cj4gPiA+ID4gbmVlZCB0byB0b3VjaCBgZmlsZW1hcC5jYCBhdCBhbGwg
KHByb2JhYmx5IGJlY2F1c2UgeW91IGFyZSBhbHJlYWR5Cj4gPiA+ID4gbWFpbnRhaW5pbmcgYGZp
bGVtYXAuY2AgcGVyZmVjdGx5KToKPiA+ID4KPiA+ID4gSSdtIGdvaW5nIHRvIGdpdmUgeW91IG9u
ZSBjaGFuY2UgdG8gYXBvbG9naXNlIGZvciB0aGF0Lgo+ID4KPiA+IEFwb2xvZ2llcyBpZiBteSB3
b3JkaW5nIGNhdXNlZCBhbnkgbWlzdW5kZXJzdGFuZGluZy4KPiA+IFRoYXQgd2FzIG5vdCBteSBp
bnRlbnRpb24gYXQgYWxsLgo+ID4KPiA+IFdoYXQgSSBtZWFudCBpcyB0aGF0IGZpbGVtYXAuYyBh
bHJlYWR5IGhhcyBhIHZlcnkKPiA+IHNvbGlkIGRlc2lnbi4KPiA+Cj4gPiBGb3IgbWVtb3J5LmMs
IEkgaGFkIHRvIHRvdWNoIHNldmVyYWwgcGxhY2VzIGZvciB0aGUKPiA+IGJsYWNrbGlzdDsgb3Ro
ZXJ3aXNlLCB0aGUga2VybmVsIHdvdWxkIGhhbmcuCj4gPgo+ID4gQnV0IGZvciBmaWxlbWFwLmMs
IEkgYmFzaWNhbGx5IGRpZG4ndCBuZWVkIHRvIHRvdWNoCj4gPiBhbnl0aGluZywgYW5kIHByZWxp
bWluYXJ5IHRlc3Rpbmcgc2hvd3Mgbm8gaXNzdWVzIGFmdGVyCj4gPiBtb3ZpbmcgaXQgZnJvbSB0
aGUgd2hpdGVsaXN0IHRvIHRoZSBibGFja2xpc3QuIFRoaXMgaXMKPgo+IFNvcnJ5LCBJIGZlZWwg
SSBtYXkgYmUgY2F1c2luZyBzb21lIG1pc3VuZGVyc3RhbmRpbmcKPiBhZ2Fpbi4KPgo+IEJ5ICJ3
aGl0ZWxpc3QiLCBJIG1lYW4gSSB1c2VkIHRvIGFsbG93IGNlcnRhaW4gY2FzZXMKPiB0byB1c2Ug
cGVyLXZtYSByZXRyeS4KPgo+IEJ5ICJibGFja2xpc3QiLCBJIG1lYW4gSSBhbSBub3cgbW92aW5n
IHRvIGRpc2FsbG93Cj4gY2VydGFpbiBjYXNlcyBmcm9tIHVzaW5nIHBlci12bWEgcmV0cnkuCj4K
PiBSaWdodCBub3csIEkgaGF2ZSB0byBhZGQgc2V2ZXJhbCBjYXNlcyBpbiBtZW1vcnkuYwo+IHRv
IHRoZSBibGFja2xpc3Q7IG90aGVyd2lzZSwgdGhlIGtlcm5lbCB3b3VsZCBoYW5nLgo+Cj4gQnV0
IGl0IHNlZW1zIHRoYXQgZXZlcnl0aGluZyBpbiBmaWxlbWFwLmMgaXMgZmluZSBzbwo+IGZhciBi
YXNlZCBvbiB0ZXN0aW5nLgo+Cj4gSSdtIG5vdCBzdXJlIGlmIEkndmUgZXhwbGFpbmVkIHRoaW5n
cyBjbGVhcmx5LiBQbGVhc2UKPiBsZXQgbWUga25vdyBpZiBhbnl0aGluZyBpcyBzdGlsbCB1bmNs
ZWFyIG9yIGluc3VmZmljaWVudC4KCkJhcnJ5IC0gdGhpcyB0aHJlYWQgaXMgY29tcGxldGVseSBv
dXQgb2YgaGFuZCBhbmQgZ2V0dGluZyBfcmFwaWRseV8KdW5wcm9kdWN0aXZlLgoKSXQncyBjZXJ0
YWlubHkgYWJvdXQgYXMgY2xlYXIgYXMgbXVkIHdoZXJlIHdlIHN0YW5kIHJpZ2h0IG5vdywgc28g
aGVyZSdzIG15CnN1Z2dlc3Rpb24gLSBsZXQncyBqdXN0IHN0b3AgYWRkaW5nIHRvIHRoZSBub2lz
ZSBoZXJlIDopIGFuZCBpbnN0ZWFkLCB5b3UKdGFrZSB0aGUgYXBwcm9hY2ggc3VnZ2VzdGVkIGJ5
IFN1cmVuIGF0IExTRiBhbmQgc2VuZCB0aGF0IGFzIGFuIF9SRkNfCnNlcmllcy4KClRoYXQgd2F5
IHdlIGNhbiBsb29rIGF0IHRoYXQgYW5kIGhvcGVmdWxseSBhY3R1YWxseSBjaXJjbGUgaW4gb24g
YSBzb2x1dGlvbgpyYXRoZXIgdGhhbiBoYXZlIGVuZGxlc3Mgc3ViIHRocmVhZHMgYW5kIHN1YiBk
aXNjdXNzaW9ucyA6KSBJdCdzIGZhciB0b28Kc3Vubnkgb3V0IGluIHRoZSBVSyByaWdodCBub3cg
Zm9yIHRoYXQgOykKClRoYW5rcywgTG9yZW56bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
