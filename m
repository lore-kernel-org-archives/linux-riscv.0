Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251DAD0C619
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T56BEchkfXemI/wuWS8iRiEN4zrUqRX2YzIx7398oqc=; b=YzUJ/cDWt5CqKX
	4JUR6RVpB/I2j9YO5UaNWHBmUjRQUaBVGG5qZ6JNaN74rWUOv7g1+eGbreSGk5PwXteeHn4Zn6PEA
	fCPjrreryF+jGRPSy5mvauU3jL4MO7xSP380AZFWWSLBrMIIugfy5n+1Y+Q1UB+IOfBDrMmkWh02p
	dxBkOFACOOfNBHSHYcXXmK7tNem2aF77sumbb/6oJ2/P6Bhh+ukOQ59tO765AgzjETt8PpR0mE99a
	MD9fLzMISH9MPyWD9vN0wr06HjYw5b+evC1YEAyZZtzH4YUfFDD/CEaLpxe9J3gBezdXtkORVJdVG
	ACJruDp8SEp0BMiR83Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LLU-000000041VL-3arL;
	Fri, 25 Oct 2024 14:31:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K6z-00000003m8w-2SuV
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 13:12:23 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729861935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CCakkuEsajugg/PgpFQNY8pqc/CyoUnL2IGo8dHuAo=;
	b=3opULSf5YcYafX2XXc3JliiHlbCwCqGdZGKObFcdRQ+rSX+pTwuA8cytrXvHhUK5gErFKF
	RPhku62wfhLz+/0lUSYssEBAnaVbQ9zieb8p/caBk6VTn9CdAwmeSxwnuxxpdef5iYcRZ2
	6SVpCRRXVjZrTYvTXIJKF7QMFvWYPfc6qIxatrbQE6/nzHjbmG2D7niPCHPufjBEvCHEIs
	gE+WJDOMpNDyk07d4o9V08fus2sT8o8XEk2rFARLveFa3wr24rq8dAvO1+p9B9m3n3Oy9D
	ZITyYzhRsgv97EOdFhMuAhfsVhPd2UtfNtXXZlwmAsiK8N94EtApTWacal+aMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729861935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CCakkuEsajugg/PgpFQNY8pqc/CyoUnL2IGo8dHuAo=;
	b=ZqBU12QTzxdqkbQWnwL3tA/lmm+1CqOFPszaVKX++FHjHGFaYBmDVW7LFFl3wbDA369YLZ
	or7ODo+dQRGnnfAQ==
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Celeste Liu
 <coelacanthushex@gmail.com>,
 Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi
 <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
In-Reply-To: <8734kpqu8k.fsf@all.your.base.are.belong.to.us>
References: <20241017-fix-riscv-syscall-nr-v1-1-4edb4ca07f07@gmail.com>
 <87a5exy2rx.fsf@all.your.base.are.belong.to.us>
 <b72e3d2b-d540-47bf-adec-0ab6eda135d8@gmail.com>
 <8734kpqu8k.fsf@all.your.base.are.belong.to.us>
Date: Fri, 25 Oct 2024 15:12:14 +0200
Message-ID: <871q045ntd.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061217_792876_8DB94CEB 
X-CRM114-Status: GOOD (  14.88  )
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

T24gTW9uLCBPY3QgMjEgMjAyNCBhdCAwOTo0NiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBDZWxl
c3RlIExpdSA8Y29lbGFjYW50aHVzaGV4QGdtYWlsLmNvbT4gd3JpdGVzOgo+PiAxLiBzeXNjYWxs
X2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgd2lsbCBkbyB0d28gdGhpbmdzOgo+PiAgICAxKSB0aGUg
cmV0dXJuIHZhbHVlIGlzIG9ubHkgdG8gaW5mb3JtIHdoZXRoZXIgdGhlIHN5c2NhbGwgc2hvdWxk
IGJlIHNraXBwZWQuCj4+ICAgIDIpIHJlZ3Mgd2lsbCBiZSBtb2RpZmllZCBieSBmaWx0ZXJzIChz
ZWNjb21wIG9yIHB0cmFjZSBhbmQgc28gb24pLgo+PiAyLiBmb3IgY29tbW9uIGVudHJ5IHVzZXIs
IHRoZXJlIGlzIHR3byBpbmZvcm1hdGlvbnM6IHN5c2NhbGwgbnVtYmVyIGFuZAo+PiAgICB0aGUg
cmV0dXJuIHZhbHVlIG9mIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSAoY2FsbGVkIGlz
X3NraXBwZWQgYmVsb3cpLgo+PiAgICBzbyB0aGVyZSBpcyB0aHJlZSBzaXR1YXRpb25zOgo+PiAg
ICAxKSBpZiBzeXNjYWxsIG51bWJlciBpcyBpbnZhbGlkLCB0aGUgc3lzY2FsbCBzaG91bGQgbm90
IGJlIHBlcmZvcm1lZCwgYW5kCj4+ICAgICAgIHdlIHNldCBhMCB0byAtRU5PU1lTIHRvIGluZm9y
bSB1c2Vyc3BhY2UgdGhlIHN5c2NhbGwgZG9lc24ndCBleGlzdC4KPj4gICAgMikgaWYgc3lzY2Fs
bCBudW1iZXIgaXMgdmFsaWQsIGlzX3NraXBwZWQgd2lsbCBiZSB1c2VkOgo+PiAgICAgICBhKSBp
ZiBpc19za2lwcGVkIGlzIC0xLCB3aGljaCBtZWFucyB0aGVyZSBhcmUgc29tZSBmaWx0ZXJzIHJl
amVjdCB0aGlzIHN5c2NhbGwsCj4+ICAgICAgICAgIHNvIHRoZSBzeXNjYWxsIHNob3VsZCBub3Qg
cGVyZm9ybWVkLiAoT2YgY291cnNlLCB3ZSBjYW4gdXNlIGJvb2wgaW5zdGVhZCB0bwo+PiAgICAg
ICAgICBnZXQgYmV0dGVyIHNlbWFudGljKQo+PiAgICAgICBiKSBpZiBpc19za2lwcGVkICE9IC0x
LCB3aGljaCBtZWFucyB0aGUgZmlsdGVycyBhcHByb3ZlZCB0aGlzIHN5c2NhbGwsCj4+ICAgICAg
ICAgIHNvIHdlIGludm9rZSBzeXNjYWxsIGhhbmRsZXIgd2l0aCBtb2RpZmllZCByZWdzLgo+Pgo+
PiBJbiB5b3VyIGRlc2lnbiwgdGhlIGxvZ2ljYWwgY29uZGl0aW9uIGlzIG5vdCBvYnZpb3VzLiBX
aHkgc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpCj4+IGluZm9ybWVkIHRoZSBzeXNjYWxs
IHdpbGwgYmUgc2tpcHBlZCBidXQgdGhlIHN5c2NhbGwgaGFuZGxlciB3aWxsIGJlIGNhbGxlZAo+
PiB3aGVuIHN5c2NhbGwgbnVtYmVyIGlzIGludmFsaWQ/IFRoZSB1c2VycyBuZWVkIHRvIHRoaW5r
IHR3byB0aGluZ3MgdG8gZ2V0IHJlc3VsdDoKPj4gYSkgLTEgbWVhbnMgc2tpcAo+PiBiKSAtMSA8
IDAgaW4gc2lnbmVkIGludGVnZXIsIHNvIHRoZSBza2lwIGNvbmRpdGlvbiBpcyBhbHdheXMgYSBp
bnZhbGlkIHN5c2NhbGwgbnVtYmVyLgo+Pgo+PiBJbiBtYXkgd2F5LCB0aGUgdXNlcnMgb25seSBu
ZWVkIHRvIHRoaW5rIG9uZSB0aGluZzogVGhlIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUo
KQo+PiBzYWlkIC0xIG1lYW5zIHRoZSBzeXNjYWxsIHNob3VsZCBub3QgYmUgcGVyZm9ybWVkLCBz
byB1c2UgaXQgYXMgYSBjb25kaXRpb24gb2YgcmVqZWN0Cj4+IGRpcmVjdGx5LiBUaGV5IGp1c3Qg
bmVlZCB0byBjb21iaW5lIHRoZSBpbmZvcm1hdGlvbnMgdGhhdCB0aGV5IGdldCBmcm9tIEFQSSBh
cyB0aGUKPj4gY29uZGl0aW9uIG9mIGNvbnRyb2wgZmxvdy4KPgo+IEknbSBhbGwtaW4gZm9yIHNp
bXBsZXIgQVBJIHVzYWdlISBNYXliZSBtYXNzYWdlIHRoZQo+IHN5c2NhbGxfZW50ZXJfZnJvbV91
c2VyX21vZGUoKSAob3IgYSBuZXcgb25lKSwgc28gdGhhdCBhZGRpdGlvbmFsCj4gc3lzY2FsbF9n
ZXRfbnIoKSBjYWxsIGlzIG5vdCBuZWVkZWQ/CgpJdCdzIGNvbXBsZXRlbHkgdW5jbGVhciB0byBt
ZSB3aGF0IHRoZSBhY3R1YWwgcHJvYmxlbSBpcy4gVGhlIGZsb3cgaG93CnRoaXMgd29ya3Mgb24g
YWxsIGFyY2hpdGVjdHVyZXMgaXM6CgogICAgICAgcmVncy0+b3JpZ19hMCAgPSByZWdzLT5hMAog
ICAgICAgcmVncy0+YTAgPSAtRU5PU1lTOwoKICAgICAgIG5yID0gc3lzY2FsbF9lbnRlcl9mcm9t
X3VzZXJfbW9kZSguLi4uKTsKCiAgICAgICBpZiAobnIgPj0gMCkKICAgICAgICAgIHJlZ3MtPmEw
ID0gbnIgPCBNQVhfU1lTQ0FMTCA/IHN5c2NhbGwobnIpIDogLUVOT1NZUzsKICAgICAgICAgICAg
ICAgICAgICAgCklmIHN5c2NhbGxfdHJhY2VfZW50ZXIoKSByZXR1cm5zIC0xIHRvIHNraXAgdGhl
IHN5c2NhbGwsIHRoZW4gcmVncy0+YTAKaXMgdW5tb2RpZmllZCwgdW5sZXNzIG9uZSBvZiB0aGUg
bWFnaWMgb3BlcmF0aW9ucyBtb2RpZmllZCBpdC4KCklmIHN5c2NhbGxfdHJhY2VfZW50ZXIoKSB3
YXMgbm90IGFjdGl2ZSAobm8gdHJhY2VyLCBubyBzZWNjb21wIC4uLikgdGhlbgpyZWdzLT5hMCBh
bHJlYWR5IGNvbnRhaW5zIC1FTk9TWVMuCgpTbyB3aGF0J3MgdGhlIGV4YWN0IHByb2JsZW0/CgpU
aGFua3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
