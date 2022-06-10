Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A437C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hzek5c0PN5exGyALnIx0t2CX1vO0Gf2Bmx/05rIjHoA=; b=vx8FgJ37uwJjht
	utfDeiFwn+/r1khVqJSPPVP8xyBTE4i5QA2Vh9EFT6x9DNy7JLZwzyiKNhcojsoeGSFSPKzQx4Aea
	d42WOT/f6tvdiN+9mogfC6fjEFKcPxaZVUAYn3Rbyb6bxShcmqq2fw9nTc6BLNHXtwYKhpkgKsk4J
	pxsG457am0jf3nFHUup4seSLEHgmZJfgfK15j2XTNo6pDIV9OUzIgj/ADhXPAqMlxw5rOpHAtzPdZ
	wuqe9WYRYNo4MKUkCKIGQF0uulMYu6VDgQQ+W9m/AJGT5xe3e1eFGva9IhtYtUJxxBUip4/gjYfS7
	NLZVBy3iARHTApHiYEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzcXx-007nZR-UQ; Fri, 10 Jun 2022 11:11:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzcTm-007l1M-3u; Fri, 10 Jun 2022 11:07:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92F106207B;
	Fri, 10 Jun 2022 11:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04024C34114;
	Fri, 10 Jun 2022 11:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654859221;
	bh=QPelFN8AL92VksfY96r5jUsYCZvlTT4zLZ07LzwS7DQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TbeEV5zTgTFMoLxNVhKthTVyn5XyvE8Fbp4zvNMejyx03T4L2AWB92TD3XT8LxSsN
	 jCETP4gGqG3aeHzvjivz7oF/AcPPJHytWgKees1A9JZYTGjQPRLRANhlGlb0qIhyf+
	 2Z0bdasjlXW9YPINyJl/DIb8ICVzapI1pmHVuvUj+/nr2FMCrV5BBjoIWbDOy50ORQ
	 owJxEdkih/z++eSAXm8V+jjY2ptZwGXqpKCdp7h7weQ+nx7sAQdxawZa+9wya3fKy3
	 ZtHXeWaecHLcio1xfUVwus7ccZn9Ar4adja1NyMUmIpHVYOg0Xsg1qJaMVL1kDGAqY
	 9Qx8AA7sIQA7g==
Received: by mail-yb1-f174.google.com with SMTP id r82so46360828ybc.13;
        Fri, 10 Jun 2022 04:07:00 -0700 (PDT)
X-Gm-Message-State: AOAM531Dm6XZG4pDbbiI0MUWe1iY8OD9XUQc7t4jzYer1rS3qMnSwrlI
	R87JX6uwuRFJGlERGkAtyuNXS/a1fpiw9A1qKJo=
X-Google-Smtp-Source: ABdhPJzh16psgzjij7DW4g0fUughTfP83t6zSkopbYoDijol00+82UviKfwBST1gV1Xr1xLVMsx+Y8jk4I968paElKA=
X-Received: by 2002:a05:6830:9c2:b0:606:1e0a:cc8d with SMTP id
 y2-20020a05683009c200b006061e0acc8dmr19062664ott.265.1654859209198; Fri, 10
 Jun 2022 04:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-6-mawupeng1@huawei.com> <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
 <CAMj1kXGkzjq3koW_sgO4uzrdtwqSqzsJfT5ABYyvodf+ggXT2w@mail.gmail.com>
 <29900b05-ec44-76a2-645a-22a13399d7fd@huawei.com> <YqBzwgTgWEAx8J/C@kernel.org>
 <cd0e727d-8ad6-2d74-55f5-498394aae297@redhat.com> <CAMj1kXEKKcnPE5crMYbuFpDJBqmgjFwna84MzAZkfp-mM3B7vA@mail.gmail.com>
 <1e7df7bc-5a18-f76a-4408-0579a60c91e3@huawei.com>
In-Reply-To: <1e7df7bc-5a18-f76a-4408-0579a60c91e3@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jun 2022 13:06:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFTR=aHBN9oKdQjhNvS4_CX=uaPnpN7gGi0bEbOkmgXhg@mail.gmail.com>
Message-ID: <CAMj1kXFTR=aHBN9oKdQjhNvS4_CX=uaPnpN7gGi0bEbOkmgXhg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
To: mawupeng <mawupeng1@huawei.com>
Cc: david@redhat.com, rppt@kernel.org, corbet@lwn.net, will@kernel.org, 
	catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	dvhart@infradead.org, andy@infradead.org, akpm@linux-foundation.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	paulmck@kernel.org, keescook@chromium.org, songmuchun@bytedance.com, 
	rdunlap@infradead.org, damien.lemoal@opensource.wdc.com, swboyd@chromium.org, 
	wei.liu@kernel.org, robin.murphy@arm.com, anshuman.khandual@arm.com, 
	thunder.leizhen@huawei.com, wangkefeng.wang@huawei.com, gpiccoli@igalia.com, 
	chenhuacai@kernel.org, geert@linux-m68k.org, vijayb@linux.microsoft.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_040702_262043_1BC2121C 
X-CRM114-Status: GOOD (  47.56  )
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

T24gVGh1LCA5IEp1biAyMDIyIGF0IDEwOjE2LCBtYXd1cGVuZyA8bWF3dXBlbmcxQGh1YXdlaS5j
b20+IHdyb3RlOgo+Cj4KPgo+IOWcqCAyMDIyLzYvOCAxODoxMiwgQXJkIEJpZXNoZXV2ZWwg5YaZ
6YGTOgo+ID4gT24gV2VkLCA4IEp1biAyMDIyIGF0IDEyOjA4LCBEYXZpZCBIaWxkZW5icmFuZCA8
ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAwOC4wNi4yMiAxMjowMiwgTWlr
ZSBSYXBvcG9ydCB3cm90ZToKPiA+Pj4gT24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMDM6Mjc6MDlQ
TSArMDgwMCwgbWF3dXBlbmcgd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4g5ZyoIDIwMjIvNi83IDIyOjQ5
LCBBcmQgQmllc2hldXZlbCDlhpnpgZM6Cj4gPj4+Pj4gT24gVHVlLCA3IEp1biAyMDIyIGF0IDE0
OjIyLCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPj4+Pj4+
Cj4gPj4+Pj4+IE9uIDA3LjA2LjIyIDExOjM4LCBXdXBlbmcgTWEgd3JvdGU6Cj4gPj4+Pj4+PiBG
cm9tOiBNYSBXdXBlbmcgPG1hd3VwZW5nMUBodWF3ZWkuY29tPgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+
IEluaXRyZCBtZW1vcnkgd2lsbCBiZSByZW1vdmVkIGFuZCB0aGVuIGFkZGVkIGluIGFybTY0X21l
bWJsb2NrX2luaXQoKSBhbmQgdGhpcwo+ID4+Pj4+Pj4gd2lsbCBjYXVzZSBpdCB0byBsb3NlIGFs
bCBvZiBpdHMgbWVtYmxvY2sgZmxhZ3MuIFRoZSBsb3N0IG9mIE1FTUJMT0NLX01JUlJPUgo+ID4+
Pj4+Pj4gZmxhZyB3aWxsIGxlYWQgdG8gZXJyb3IgbG9nIHByaW50ZWQgYnkgZmluZF96b25lX21v
dmFibGVfcGZuc19mb3Jfbm9kZXMgaWYKPiA+Pj4+Pj4+IHRoZSBsb3dlciA0RyByYW5nZSBoYXMg
c29tZSBub24tbWlycm9yZWQgbWVtb3J5Lgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEluIG9yZGVyIHRv
IHNvbHZlIHRoaXMgcHJvYmxlbSwgdGhlIGxvc3QgTUVNQkxPQ0tfTUlSUk9SIGZsYWcgd2lsbCBi
ZQo+ID4+Pj4+Pj4gcmVpbnN0YWxsZWQgaWYgdGhlIG9yaWdpbiBtZW1ibG9jayBoYXMgdGhpcyBm
bGFnLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hIFd1cGVuZyA8bWF3dXBl
bmcxQGh1YXdlaS5jb20+Cj4gPj4+Pj4+PiAtLS0KPiA+Pj4+Pj4+ICAgIGFyY2gvYXJtNjQvbW0v
aW5pdC5jICAgICB8ICA5ICsrKysrKysrKwo+ID4+Pj4+Pj4gICAgaW5jbHVkZS9saW51eC9tZW1i
bG9jay5oIHwgIDEgKwo+ID4+Pj4+Pj4gICAgbW0vbWVtYmxvY2suYyAgICAgICAgICAgIHwgMjAg
KysrKysrKysrKysrKysrKysrKysKPiA+Pj4+Pj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5z
ZXJ0aW9ucygrKQo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21t
L2luaXQuYyBiL2FyY2gvYXJtNjQvbW0vaW5pdC5jCj4gPj4+Pj4+PiBpbmRleCAzMzllZTg0ZTVh
NjEuLjExNjQxZjkyNGQwOCAxMDA2NDQKPiA+Pj4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQvbW0vaW5p
dC5jCj4gPj4+Pj4+PiArKysgYi9hcmNoL2FybTY0L21tL2luaXQuYwo+ID4+Pj4+Pj4gQEAgLTM1
MCw5ICszNTAsMTggQEAgdm9pZCBfX2luaXQgYXJtNjRfbWVtYmxvY2tfaW5pdCh2b2lkKQo+ID4+
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgImluaXRyZCBub3QgZnVsbHkgYWNjZXNzaWJs
ZSB2aWEgdGhlIGxpbmVhciBtYXBwaW5nIC0tIHBsZWFzZSBjaGVjayB5b3VyIGJvb3Rsb2FkZXIg
Li4uXG4iKSkgewo+ID4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgcGh5c19pbml0cmRf
c2l6ZSA9IDA7Cj4gPj4+Pj4+PiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICBpbnQgZmxhZ3MsIHJldDsKPiA+Pj4+Pj4+ICsKPiA+Pj4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSBtZW1ibG9ja19nZXRfZmxhZ3MoYmFzZSwgJmZs
YWdzKTsKPiA+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4+Pj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgPSAwOwo+ID4+Pj4+Pj4gKwo+ID4+
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgbWVtYmxvY2tfcmVtb3ZlKGJhc2UsIHNpemUp
OyAvKiBjbGVhciBNRU1CTE9DS18gZmxhZ3MgKi8KPiA+Pj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgIG1lbWJsb2NrX2FkZChiYXNlLCBzaXplKTsKPiA+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgIG1lbWJsb2NrX3Jlc2VydmUoYmFzZSwgc2l6ZSk7Cj4gPj4+Pj4+Cj4gPj4+Pj4+
IENhbiB5b3UgZXhwbGFpbiB3aHkgd2UncmUgcmVtb3ZpbmcrcmUtYWRkaW5nIGhlcmUgZXhhY3Rs
eT8gSXMgaXQganVzdCB0bwo+ID4+Pj4+PiBjbGVhciBmbGFncyBhcyB0aGUgY29tbWVudCBpbmRp
Y2F0ZXM/Cj4gPj4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiBUaGlzIHNob3VsZCBvbmx5IGhhcHBlbiBp
ZiB0aGUgcGxhY2VtZW50IG9mIHRoZSBpbml0cmQgY29uZmxpY3RzIHdpdGgKPiA+Pj4+PiBhIG1l
bT0gY29tbWFuZCBsaW5lIHBhcmFtZXRlciBvciBpdCBpcyBub3QgY292ZXJlZCBieSBtZW1ibG9j
ayBmb3IKPiA+Pj4+PiBzb21lIG90aGVyIHJlYXNvbi4KPiA+Pj4+Pgo+ID4+Pj4+IElPVywgdGhp
cyBzaG91bGQgbmV2ZXIgaGFwcGVuLCBhbmQgaWYgcmUtbWVtYmxvY2tfYWRkJ2luZyB0aGlzIG1l
bW9yeQo+ID4+Pj4+IHVuY29uZGl0aW9uYWxseSBpcyBjYXVzaW5nIHByb2JsZW1zLCB3ZSBzaG91
bGQgZml4IHRoYXQgaW5zdGVhZCBvZgo+ID4+Pj4+IHdvcmtpbmcgYXJvdW5kIGl0Lgo+ID4+Pj4K
PiA+Pj4+IFRoaXMgd2lsbCBoYXBwZW4gaWYgd2UgdXNlIGluaXRyZG1lbT0zRywxMDBNIHRvIHJl
c2VydmUgaW5pdHJkIG1lbW9yeSBiZWxvdwo+ID4+Pj4gdGhlIDRHIGxpbWl0IHRvIHRlc3QgdGhp
cyBzY2VuYXJpbyhqdXN0IGZvciB0ZXN0aW5nLCBJIGhhdmUgdHJvdWJsZSB0byBib290Cj4gPj4+
PiBxZW11IHdpdGggaW5pdHJkIGVuYWJsZWQgYW5kIG1lbW9yeSBiZWxvdyA0RyBhcmUgYWxsIG1p
cnJvciBtZW1vcnkpLgo+ID4+Pj4KPiA+Pj4+IFJlLW1lbWJsb2NrX2FkZCdpbmcgdGhpcyBtZW1v
cnkgdW5jb25kaXRpb25hbGx5IHNlZW1zIGZpbmUgYnV0IGNsZWFyIGFsbAo+ID4+Pj4gZmxhZ3Mo
ZXNwZWNpYWxseSBNRU1CTE9DS19NSVJST1IpIG1heSBsZWFkIHRvIHNvbWUgZXJyb3IgbG9nLgo+
ID4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+PiBJZiBpdCdzIHJlYWxseSBqdXN0IGFib3V0IGNsZWFyaW5n
IGZsYWdzLCBJIHdvbmRlciBpZiB3ZSByYXRoZXIgd2FudCB0bwo+ID4+Pj4+PiBoYXZlIGFuIGlu
dGVyZmFjZSB0aGF0IGRvZXMgZXhhY3RseSB0aGF0LCBhbmQgaGlkZXMgdGhlIHdheSB0aGlzIGlz
Cj4gPj4+Pj4+IGFjdHVhbGx5IGltcGxlbWVudGVkIChvYnRhaW4gZmxhZ3MsIHJlbW92ZSwgcmUt
YWRkIC4uLiksIGludGVybmFsbHkuCj4gPj4+Pj4+Cj4gPj4+Pj4+IEJ1dCBtb3N0IHByb2JhYmx5
IHRoZXJlIGlzIG1vcmUgbWFnaWMgaW4gdGhlIGNvZGUgYW5kIGNsZWFyaW5nIGZsYWdzCj4gPj4+
Pj4+IGlzbid0IGFsbCBpdCBlbmRzIHVwIGRvaW5nLgo+ID4+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4g
SSBkb24ndCByZW1lbWJlciBleGFjdGx5IHdoeSB3ZSBuZWVkZWQgdG8gY2xlYXIgdGhlIGZsYWdz
LCBidXQgSSB0aGluawo+ID4+Pj4+IGl0IGhhZCB0byBkbyB3aXRoIHNvbWUgY29ybmVyIGNhc2Ug
d2UgaGl0IHdoZW4gdGhlIGluaXRyZCB3YXMKPiA+Pj4+PiBwYXJ0aWFsbHkgY292ZXJlZC4KPiA+
Pj4+IElmICJtZW09IiBpcyBzZXQgaW4gY29tbWFuZCBsaW5lLCBtZW1ibG9ja19tZW1fbGltaXRf
cmVtb3ZlX21hcCgpIHdpbGwKPiA+Pj4+IHJlbW92ZSBhbGwgbWVtb3J5IGJsb2NrIHdpdGhvdXQg
TUVNQkxPQ0tfTk9NQVAuIE1heWJlIHRoaXMgd2lsbCBicmluZyB0aGUKPiA+Pj4+IG1lbW9yeSBi
YWNrIGlmIHRoaXMgaW5pdHJkIG1lbSBoYXMgdGhlIE1FTUJMT0NLX05PTUFQIGZsYWc/Cj4gPj4+
Pgo+ID4+Pj4gVGhlIHJmYyB2ZXJzaW9uIFsxXSBpbnRyb2R1Y2UgYW5kIHVzZSBtZW1ibG9ja19j
bGVhcl9ub21hcCgpIHRvIGNsZWFyIHRoZQo+ID4+Pj4gTUVNQkxPQ0tfTk9NQVAgb2YgdGhpcyBp
bml0cmQgbWVtYmxvY2suCj4gPj4+PiBTbyBtYXliZSB0aGUgdXNhZ2Ugb2YgbWVtYmxvY2tfcmVt
b3ZlKCkgaXMganVzdCB0byBhdm9pZCBpbnRyb2R1Y2luZyBuZXcKPiA+Pj4+IGZ1bmN0aW9uKG1l
bWJsb2NrX2NsZWFyX25vbWFwKT8KPiA+Pj4+Cj4gPj4+PiBTaW5jZSBjb21taXQgNGM1NDZiOGEz
NDY5ICgibWVtYmxvY2s6IGFkZCBtZW1ibG9ja19jbGVhcl9ub21hcCgpIikgYWxyZWFkeQo+ID4+
Pj4gaW50cm9kdWNlZCBtZW1ibG9ja19jbGVhcl9ub21hcCgpLiBDYW4gd2UgdXNlIHRoaXMgdG8g
cmVtb3ZlIGZsYWcgTUVNQkxPQ0tfTk9NQVAKPiA+Pj4+IHRvIHNvbHZlIHRoaXMgcHJvYmxlbSBy
YXRoZXIgdGhhbiBicmluZyBmbGFnIE1FTUJMT0NLX01JUlJPUiBiYWNrPwo+ID4+Pgo+ID4+PiBB
RkFJQ1QsIHRoZXJlIGFyZSB0d28gY29ybmVyIGNhc2VzIHRoYXQgcmUtYWRkaW5nIGluaXRyZCBt
ZW1vcnkgY292ZXJzOgo+ID4+PiAqIGluaXRyZCBtZW1vcnkgaXMgbm90IGEgcGFydCBvZiB0aGUg
bWVtb3J5IHJlcG9ydGVkIHRvIG1lbWJsb2NrLCBlaXRoZXIKPiA+Pj4gYmVjYXVzZSBvZiBmaXJt
d2FyZSB3ZWlyZG5lc3Mgb3IgYmVjYXVzZSBpdCB3YXMgY3V0IG91dCB3aXRoIG1lbT0KPiA+Pj4g
KiBpbml0cmQgbWVtb3J5IG92ZXJsYXBzIGEgTk9NQVAgcmVnaW9uCj4gPj4+Cj4gPj4+IFNvIHRv
IG1ha2Ugc3VyZSBpbml0cmQgbWVtb3J5IGlzIG1hcHBlZCBwcm9wZXJseSBhbmQgcmV0YWlucwo+
ID4+PiBNRU1CTE9DS19NSVJST1IgSSB0aGluayB0aGUgYmVzdCB3ZSBjYW4gZG8gaXMKPiA+Pj4K
PiA+Pj4gICAgICAgIG1lbWJsb2NrX2FkZCgpOwo+ID4+PiAgICAgICAgbWVtYmxvY2tfY2xlYXJf
bm9tYXAoKTsKPiA+Pj4gICAgICAgIG1lbWJsb2NrX3Jlc2VydmUoKTsKPiA+Pgo+ID4+IFdvdWxk
IHNpbXBseSBkZXRlY3QrcmVqZWN0aW5nIHRvIGJvb3Qgb24gc3VjaCBzZXR1cHMgYmUgYW4gb3B0
aW9uPyBUaGUKPiA+PiByZXBsaWVzIHNvIGZhciBpbmRpY2F0ZSB0byBtZSB0aGF0IHRoaXMgaXMg
cmF0aGVyIGEgY29ybmVyIGNhc2UgdGhhbiBhCj4gPj4gcmVhc29uYWJsZSB1c2UgY2FzZS4KPiA+
Pgo+ID4KPiA+IFRoZSBzYWQgcmVhbGl0eSBpcyB0aGF0IG1lbT0gaXMga25vd24gdG8gYmUgdXNl
ZCBpbiBwcm9kdWN0aW9uIGZvcgo+ID4gbGltaXRpbmcgdGhlIGFtb3VudCBvZiBtZW1vcnkgdGhh
dCB0aGUga2VybmVsIHRha2VzIGNvbnRyb2wgb2YsIGluCj4gPiBvcmRlciB0byBhbGxvdyB0aGUg
cmVtYWluZGVyIHRvIGJlIHVzZWQgaW4gcGxhdGZvcm0gc3BlY2lmaWMgd2F5cy4KPiA+Cj4gPiBP
ZiBjb3Vyc2UsIHRoZXJlIGFyZSBtdWNoIGJldHRlciB3YXlzIHRvIGFjaGlldmUgdGhhdCwgYnV0
IGdpdmVuIHRoYXQKPiA+IHdlIGN1cnJlbnRseSBzdXBwb3J0IGl0LCBJIGRvbid0IHRoaW5rIHdl
IGNhbiBlYXNpbHkgYmFjayB0aGF0IG91dC4KPiA+Cj4gPiBJIGRvIHRoaW5rIHRoYXQgdGhlcmUg
aXMgbm8gbmVlZCB0byBnbyBvdXQgb2Ygb3VyIHdheSB0byBtYWtlIHRoaXMKPiA+IGNhc2Ugd29y
ayBzZWFtbGVzc2x5IHdpdGggbWlycm9yZWQgbWVtb3J5LCB0aG91Z2guIFNvIEknZCBwcmVmZXIg
dG8KPiA+IG1ha2UgdGhlIHJlbW92ZStyZS1hZGQgY29uZGl0aW9uYWwgb24gdGhlcmUgYWN0dWFs
bHkgYmVpbmcgYSBuZWVkIHRvCj4gPiBkbyBzby4gVGhhdCB3YXksIHdlIGRvbid0IGJyZWFrIHRo
ZSBvbGQgdXNlIGNhc2Ugb3IgbWlycm9yZWQgbWVtb3J5LAo+ID4gYW5kIHdoYXRldmVyIGhhcHBl
bnMgd2hlbiB0aGUgdHdvIGFyZSBjb21iaW5lZCBpcyBET05UQ0FSRS4KPgo+IERvZXMgdGhhdCBt
ZWFuIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBjYXJlIGFib3V0IHRoaXMgc2NlbmFyaW8gd2l0aAo+
IG1pcnJvciBtZW1vcnk/Cj4KCldlIHNob3VsZG4ndCwgYnV0IHdlIGRvLCB1bmZvcnR1bmF0ZWx5
LgoKU28gd2Ugc2hvdWxkIHByb2JhYmx5IGFkb3B0IHRoZSBzZXF1ZW5jZSBzdWdnZXN0ZWQgYnkg
TWlrZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
