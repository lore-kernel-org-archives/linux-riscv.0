Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A742C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qiP8f3uWOoufSDrt8EWQbfJNZm9QVrHhNIr/Mjw4crU=; b=gUwi3HB2S6WoLR
	pvTClYxDdJr04WXwgct9TmBQkhVdT2wVQO4+o4Sjg2FlwnSSUx4ceiRgajVP+ovaV+FQDeLrTNBF5
	flbg/Xnlt01k1iWTfjQyiYEtvt1DWRjW7b8iSrlSAY9QRyEIIoYXVx+egMO3nzTRRgS/sFs0o8AaC
	MwwtTcMJUHwr2YEA9Aidxlfudw7ktfnZ4y/lQRtBIMdoS15StC5046SysQQbaFTOJbsy4wACRmdcJ
	friGLWM0XJxCq955eIO11HAm9/eZsBPhu7CJ/UJ9Tu2C8kFapCS6LhHeiQcN9EPzEPYf0Ek5i82oZ
	fHeim8mu+JFPlqsm4zqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysuf-00CkCK-CK; Wed, 08 Jun 2022 10:27:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysgB-00CeC0-Fz; Wed, 08 Jun 2022 10:12:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0F8FACE2763;
	Wed,  8 Jun 2022 10:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B515C3411D;
	Wed,  8 Jun 2022 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654683163;
	bh=l+YAwT5Lngsb4fdcNuzv2q5gFCd5jD6EiSqwsTDfTGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EjqgUZWHuAr0cwQKq8GtDFb6lKZ/g888xVBC0+lVlrM6b1hx7E3v4HVOf1sJw56nO
	 /hosftyGtNVmb8t5IMKs/nGkBvofsEAORCmkBVgvLiirD3bMKLmKYToqfHwmqqB+8J
	 vuFVSRq1M0Go4KdQYRLImQ1fydkBjXBegwl6Bm+Gh/u/oAiKLgHLTZSbm7G84D6Gla
	 zdgHtC9qAD+sZmdtlatx4clQixV1XA5ifJOmEKkcsI9YbQzOwUrmbbCp5su1BKxgIh
	 AHMBq2BGOhj+FXOotSE810D7b31ptQh7jyjXGJLFST2Ysd+KgI5W8OIjQeqYY3gp/s
	 2fI9Saw39y14w==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-fb6b4da1dfso8615422fac.4;
        Wed, 08 Jun 2022 03:12:43 -0700 (PDT)
X-Gm-Message-State: AOAM532YFDqct6GOIW4SmDzhTg+3zBAPgBFLC1h4BGAvnhvEp5ue0zyS
	XlZEv5zG5aerC/KjFq9gm5cOsOtSqGL2ng/MWHk=
X-Google-Smtp-Source: ABdhPJzxYxZTceIJqNDwmpmSozg43OnDPkArkQbDWCLe95GIqxVyAqbW6DGZeHBqAB2kTy8qg+6sAkBoES1ptkis2Mo=
X-Received: by 2002:a05:6808:f88:b0:32b:d10f:cc6b with SMTP id
 o8-20020a0568080f8800b0032bd10fcc6bmr1993451oiw.228.1654683151841; Wed, 08
 Jun 2022 03:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-6-mawupeng1@huawei.com> <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
 <CAMj1kXGkzjq3koW_sgO4uzrdtwqSqzsJfT5ABYyvodf+ggXT2w@mail.gmail.com>
 <29900b05-ec44-76a2-645a-22a13399d7fd@huawei.com> <YqBzwgTgWEAx8J/C@kernel.org>
 <cd0e727d-8ad6-2d74-55f5-498394aae297@redhat.com>
In-Reply-To: <cd0e727d-8ad6-2d74-55f5-498394aae297@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 8 Jun 2022 12:12:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEKKcnPE5crMYbuFpDJBqmgjFwna84MzAZkfp-mM3B7vA@mail.gmail.com>
Message-ID: <CAMj1kXEKKcnPE5crMYbuFpDJBqmgjFwna84MzAZkfp-mM3B7vA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
To: David Hildenbrand <david@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>, mawupeng <mawupeng1@huawei.com>, corbet@lwn.net, 
	will@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, dvhart@infradead.org, andy@infradead.org, 
	akpm@linux-foundation.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, paulmck@kernel.org, keescook@chromium.org, 
	songmuchun@bytedance.com, rdunlap@infradead.org, 
	damien.lemoal@opensource.wdc.com, swboyd@chromium.org, wei.liu@kernel.org, 
	robin.murphy@arm.com, anshuman.khandual@arm.com, thunder.leizhen@huawei.com, 
	wangkefeng.wang@huawei.com, gpiccoli@igalia.com, chenhuacai@kernel.org, 
	geert@linux-m68k.org, chenzhou10@huawei.com, vijayb@linux.microsoft.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_031247_961589_12EAFE5B 
X-CRM114-Status: GOOD (  46.78  )
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

T24gV2VkLCA4IEp1biAyMDIyIGF0IDEyOjA4LCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiAwOC4wNi4yMiAxMjowMiwgTWlrZSBSYXBvcG9ydCB3cm90
ZToKPiA+IE9uIFdlZCwgSnVuIDA4LCAyMDIyIGF0IDAzOjI3OjA5UE0gKzA4MDAsIG1hd3VwZW5n
IHdyb3RlOgo+ID4+Cj4gPj4g5ZyoIDIwMjIvNi83IDIyOjQ5LCBBcmQgQmllc2hldXZlbCDlhpnp
gZM6Cj4gPj4+IE9uIFR1ZSwgNyBKdW4gMjAyMiBhdCAxNDoyMiwgRGF2aWQgSGlsZGVuYnJhbmQg
PGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IE9uIDA3LjA2LjIyIDExOjM4
LCBXdXBlbmcgTWEgd3JvdGU6Cj4gPj4+Pj4gRnJvbTogTWEgV3VwZW5nIDxtYXd1cGVuZzFAaHVh
d2VpLmNvbT4KPiA+Pj4+Pgo+ID4+Pj4+IEluaXRyZCBtZW1vcnkgd2lsbCBiZSByZW1vdmVkIGFu
ZCB0aGVuIGFkZGVkIGluIGFybTY0X21lbWJsb2NrX2luaXQoKSBhbmQgdGhpcwo+ID4+Pj4+IHdp
bGwgY2F1c2UgaXQgdG8gbG9zZSBhbGwgb2YgaXRzIG1lbWJsb2NrIGZsYWdzLiBUaGUgbG9zdCBv
ZiBNRU1CTE9DS19NSVJST1IKPiA+Pj4+PiBmbGFnIHdpbGwgbGVhZCB0byBlcnJvciBsb2cgcHJp
bnRlZCBieSBmaW5kX3pvbmVfbW92YWJsZV9wZm5zX2Zvcl9ub2RlcyBpZgo+ID4+Pj4+IHRoZSBs
b3dlciA0RyByYW5nZSBoYXMgc29tZSBub24tbWlycm9yZWQgbWVtb3J5Lgo+ID4+Pj4+Cj4gPj4+
Pj4gSW4gb3JkZXIgdG8gc29sdmUgdGhpcyBwcm9ibGVtLCB0aGUgbG9zdCBNRU1CTE9DS19NSVJS
T1IgZmxhZyB3aWxsIGJlCj4gPj4+Pj4gcmVpbnN0YWxsZWQgaWYgdGhlIG9yaWdpbiBtZW1ibG9j
ayBoYXMgdGhpcyBmbGFnLgo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogTWEgV3VwZW5n
IDxtYXd1cGVuZzFAaHVhd2VpLmNvbT4KPiA+Pj4+PiAtLS0KPiA+Pj4+PiAgIGFyY2gvYXJtNjQv
bW0vaW5pdC5jICAgICB8ICA5ICsrKysrKysrKwo+ID4+Pj4+ICAgaW5jbHVkZS9saW51eC9tZW1i
bG9jay5oIHwgIDEgKwo+ID4+Pj4+ICAgbW0vbWVtYmxvY2suYyAgICAgICAgICAgIHwgMjAgKysr
KysrKysrKysrKysrKysrKysKPiA+Pj4+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9u
cygrKQo+ID4+Pj4+Cj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vaW5pdC5jIGIv
YXJjaC9hcm02NC9tbS9pbml0LmMKPiA+Pj4+PiBpbmRleCAzMzllZTg0ZTVhNjEuLjExNjQxZjky
NGQwOCAxMDA2NDQKPiA+Pj4+PiAtLS0gYS9hcmNoL2FybTY0L21tL2luaXQuYwo+ID4+Pj4+ICsr
KyBiL2FyY2gvYXJtNjQvbW0vaW5pdC5jCj4gPj4+Pj4gQEAgLTM1MCw5ICszNTAsMTggQEAgdm9p
ZCBfX2luaXQgYXJtNjRfbWVtYmxvY2tfaW5pdCh2b2lkKQo+ID4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgImluaXRyZCBub3QgZnVsbHkgYWNjZXNzaWJsZSB2aWEgdGhlIGxpbmVhciBtYXBw
aW5nIC0tIHBsZWFzZSBjaGVjayB5b3VyIGJvb3Rsb2FkZXIgLi4uXG4iKSkgewo+ID4+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgcGh5c19pbml0cmRfc2l6ZSA9IDA7Cj4gPj4+Pj4gICAgICAg
ICAgICAgICAgfSBlbHNlIHsKPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgaW50IGZsYWdz
LCByZXQ7Cj4gPj4+Pj4gKwo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSBtZW1i
bG9ja19nZXRfZmxhZ3MoYmFzZSwgJmZsYWdzKTsKPiA+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgaWYgKHJldCkKPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyA9
IDA7Cj4gPj4+Pj4gKwo+ID4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgbWVtYmxvY2tfcmVt
b3ZlKGJhc2UsIHNpemUpOyAvKiBjbGVhciBNRU1CTE9DS18gZmxhZ3MgKi8KPiA+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgIG1lbWJsb2NrX2FkZChiYXNlLCBzaXplKTsKPiA+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgIG1lbWJsb2NrX3Jlc2VydmUoYmFzZSwgc2l6ZSk7Cj4gPj4+Pgo+
ID4+Pj4gQ2FuIHlvdSBleHBsYWluIHdoeSB3ZSdyZSByZW1vdmluZytyZS1hZGRpbmcgaGVyZSBl
eGFjdGx5PyBJcyBpdCBqdXN0IHRvCj4gPj4+PiBjbGVhciBmbGFncyBhcyB0aGUgY29tbWVudCBp
bmRpY2F0ZXM/Cj4gPj4+Pgo+ID4+Pgo+ID4+PiBUaGlzIHNob3VsZCBvbmx5IGhhcHBlbiBpZiB0
aGUgcGxhY2VtZW50IG9mIHRoZSBpbml0cmQgY29uZmxpY3RzIHdpdGgKPiA+Pj4gYSBtZW09IGNv
bW1hbmQgbGluZSBwYXJhbWV0ZXIgb3IgaXQgaXMgbm90IGNvdmVyZWQgYnkgbWVtYmxvY2sgZm9y
Cj4gPj4+IHNvbWUgb3RoZXIgcmVhc29uLgo+ID4+Pgo+ID4+PiBJT1csIHRoaXMgc2hvdWxkIG5l
dmVyIGhhcHBlbiwgYW5kIGlmIHJlLW1lbWJsb2NrX2FkZCdpbmcgdGhpcyBtZW1vcnkKPiA+Pj4g
dW5jb25kaXRpb25hbGx5IGlzIGNhdXNpbmcgcHJvYmxlbXMsIHdlIHNob3VsZCBmaXggdGhhdCBp
bnN0ZWFkIG9mCj4gPj4+IHdvcmtpbmcgYXJvdW5kIGl0Lgo+ID4+Cj4gPj4gVGhpcyB3aWxsIGhh
cHBlbiBpZiB3ZSB1c2UgaW5pdHJkbWVtPTNHLDEwME0gdG8gcmVzZXJ2ZSBpbml0cmQgbWVtb3J5
IGJlbG93Cj4gPj4gdGhlIDRHIGxpbWl0IHRvIHRlc3QgdGhpcyBzY2VuYXJpbyhqdXN0IGZvciB0
ZXN0aW5nLCBJIGhhdmUgdHJvdWJsZSB0byBib290Cj4gPj4gcWVtdSB3aXRoIGluaXRyZCBlbmFi
bGVkIGFuZCBtZW1vcnkgYmVsb3cgNEcgYXJlIGFsbCBtaXJyb3IgbWVtb3J5KS4KPiA+Pgo+ID4+
IFJlLW1lbWJsb2NrX2FkZCdpbmcgdGhpcyBtZW1vcnkgdW5jb25kaXRpb25hbGx5IHNlZW1zIGZp
bmUgYnV0IGNsZWFyIGFsbAo+ID4+IGZsYWdzKGVzcGVjaWFsbHkgTUVNQkxPQ0tfTUlSUk9SKSBt
YXkgbGVhZCB0byBzb21lIGVycm9yIGxvZy4KPiA+Pgo+ID4+Pgo+ID4+Pj4gSWYgaXQncyByZWFs
bHkganVzdCBhYm91dCBjbGVhcmluZyBmbGFncywgSSB3b25kZXIgaWYgd2UgcmF0aGVyIHdhbnQg
dG8KPiA+Pj4+IGhhdmUgYW4gaW50ZXJmYWNlIHRoYXQgZG9lcyBleGFjdGx5IHRoYXQsIGFuZCBo
aWRlcyB0aGUgd2F5IHRoaXMgaXMKPiA+Pj4+IGFjdHVhbGx5IGltcGxlbWVudGVkIChvYnRhaW4g
ZmxhZ3MsIHJlbW92ZSwgcmUtYWRkIC4uLiksIGludGVybmFsbHkuCj4gPj4+Pgo+ID4+Pj4gQnV0
IG1vc3QgcHJvYmFibHkgdGhlcmUgaXMgbW9yZSBtYWdpYyBpbiB0aGUgY29kZSBhbmQgY2xlYXJp
bmcgZmxhZ3MKPiA+Pj4+IGlzbid0IGFsbCBpdCBlbmRzIHVwIGRvaW5nLgo+ID4+Pj4KPiA+Pj4K
PiA+Pj4gSSBkb24ndCByZW1lbWJlciBleGFjdGx5IHdoeSB3ZSBuZWVkZWQgdG8gY2xlYXIgdGhl
IGZsYWdzLCBidXQgSSB0aGluawo+ID4+PiBpdCBoYWQgdG8gZG8gd2l0aCBzb21lIGNvcm5lciBj
YXNlIHdlIGhpdCB3aGVuIHRoZSBpbml0cmQgd2FzCj4gPj4+IHBhcnRpYWxseSBjb3ZlcmVkLgo+
ID4+IElmICJtZW09IiBpcyBzZXQgaW4gY29tbWFuZCBsaW5lLCBtZW1ibG9ja19tZW1fbGltaXRf
cmVtb3ZlX21hcCgpIHdpbGwKPiA+PiByZW1vdmUgYWxsIG1lbW9yeSBibG9jayB3aXRob3V0IE1F
TUJMT0NLX05PTUFQLiBNYXliZSB0aGlzIHdpbGwgYnJpbmcgdGhlCj4gPj4gbWVtb3J5IGJhY2sg
aWYgdGhpcyBpbml0cmQgbWVtIGhhcyB0aGUgTUVNQkxPQ0tfTk9NQVAgZmxhZz8KPiA+Pgo+ID4+
IFRoZSByZmMgdmVyc2lvbiBbMV0gaW50cm9kdWNlIGFuZCB1c2UgbWVtYmxvY2tfY2xlYXJfbm9t
YXAoKSB0byBjbGVhciB0aGUKPiA+PiBNRU1CTE9DS19OT01BUCBvZiB0aGlzIGluaXRyZCBtZW1i
bG9jay4KPiA+PiBTbyBtYXliZSB0aGUgdXNhZ2Ugb2YgbWVtYmxvY2tfcmVtb3ZlKCkgaXMganVz
dCB0byBhdm9pZCBpbnRyb2R1Y2luZyBuZXcKPiA+PiBmdW5jdGlvbihtZW1ibG9ja19jbGVhcl9u
b21hcCk/Cj4gPj4KPiA+PiBTaW5jZSBjb21taXQgNGM1NDZiOGEzNDY5ICgibWVtYmxvY2s6IGFk
ZCBtZW1ibG9ja19jbGVhcl9ub21hcCgpIikgYWxyZWFkeQo+ID4+IGludHJvZHVjZWQgbWVtYmxv
Y2tfY2xlYXJfbm9tYXAoKS4gQ2FuIHdlIHVzZSB0aGlzIHRvIHJlbW92ZSBmbGFnIE1FTUJMT0NL
X05PTUFQCj4gPj4gdG8gc29sdmUgdGhpcyBwcm9ibGVtIHJhdGhlciB0aGFuIGJyaW5nIGZsYWcg
TUVNQkxPQ0tfTUlSUk9SIGJhY2s/Cj4gPgo+ID4gQUZBSUNULCB0aGVyZSBhcmUgdHdvIGNvcm5l
ciBjYXNlcyB0aGF0IHJlLWFkZGluZyBpbml0cmQgbWVtb3J5IGNvdmVyczoKPiA+ICogaW5pdHJk
IG1lbW9yeSBpcyBub3QgYSBwYXJ0IG9mIHRoZSBtZW1vcnkgcmVwb3J0ZWQgdG8gbWVtYmxvY2ss
IGVpdGhlcgo+ID4gYmVjYXVzZSBvZiBmaXJtd2FyZSB3ZWlyZG5lc3Mgb3IgYmVjYXVzZSBpdCB3
YXMgY3V0IG91dCB3aXRoIG1lbT0KPiA+ICogaW5pdHJkIG1lbW9yeSBvdmVybGFwcyBhIE5PTUFQ
IHJlZ2lvbgo+ID4KPiA+IFNvIHRvIG1ha2Ugc3VyZSBpbml0cmQgbWVtb3J5IGlzIG1hcHBlZCBw
cm9wZXJseSBhbmQgcmV0YWlucwo+ID4gTUVNQkxPQ0tfTUlSUk9SIEkgdGhpbmsgdGhlIGJlc3Qg
d2UgY2FuIGRvIGlzCj4gPgo+ID4gICAgICAgbWVtYmxvY2tfYWRkKCk7Cj4gPiAgICAgICBtZW1i
bG9ja19jbGVhcl9ub21hcCgpOwo+ID4gICAgICAgbWVtYmxvY2tfcmVzZXJ2ZSgpOwo+Cj4gV291
bGQgc2ltcGx5IGRldGVjdCtyZWplY3RpbmcgdG8gYm9vdCBvbiBzdWNoIHNldHVwcyBiZSBhbiBv
cHRpb24/IFRoZQo+IHJlcGxpZXMgc28gZmFyIGluZGljYXRlIHRvIG1lIHRoYXQgdGhpcyBpcyBy
YXRoZXIgYSBjb3JuZXIgY2FzZSB0aGFuIGEKPiByZWFzb25hYmxlIHVzZSBjYXNlLgo+CgpUaGUg
c2FkIHJlYWxpdHkgaXMgdGhhdCBtZW09IGlzIGtub3duIHRvIGJlIHVzZWQgaW4gcHJvZHVjdGlv
biBmb3IKbGltaXRpbmcgdGhlIGFtb3VudCBvZiBtZW1vcnkgdGhhdCB0aGUga2VybmVsIHRha2Vz
IGNvbnRyb2wgb2YsIGluCm9yZGVyIHRvIGFsbG93IHRoZSByZW1haW5kZXIgdG8gYmUgdXNlZCBp
biBwbGF0Zm9ybSBzcGVjaWZpYyB3YXlzLgoKT2YgY291cnNlLCB0aGVyZSBhcmUgbXVjaCBiZXR0
ZXIgd2F5cyB0byBhY2hpZXZlIHRoYXQsIGJ1dCBnaXZlbiB0aGF0CndlIGN1cnJlbnRseSBzdXBw
b3J0IGl0LCBJIGRvbid0IHRoaW5rIHdlIGNhbiBlYXNpbHkgYmFjayB0aGF0IG91dC4KCkkgZG8g
dGhpbmsgdGhhdCB0aGVyZSBpcyBubyBuZWVkIHRvIGdvIG91dCBvZiBvdXIgd2F5IHRvIG1ha2Ug
dGhpcwpjYXNlIHdvcmsgc2VhbWxlc3NseSB3aXRoIG1pcnJvcmVkIG1lbW9yeSwgdGhvdWdoLiBT
byBJJ2QgcHJlZmVyIHRvCm1ha2UgdGhlIHJlbW92ZStyZS1hZGQgY29uZGl0aW9uYWwgb24gdGhl
cmUgYWN0dWFsbHkgYmVpbmcgYSBuZWVkIHRvCmRvIHNvLiBUaGF0IHdheSwgd2UgZG9uJ3QgYnJl
YWsgdGhlIG9sZCB1c2UgY2FzZSBvciBtaXJyb3JlZCBtZW1vcnksCmFuZCB3aGF0ZXZlciBoYXBw
ZW5zIHdoZW4gdGhlIHR3byBhcmUgY29tYmluZWQgaXMgRE9OVENBUkUuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
