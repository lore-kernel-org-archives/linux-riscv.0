Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56971C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1ImnlnKJr3viIhxkxviImZjNL3pmGWZSmrKhMCes5Y=; b=De8ZNxxwPyL9bD
	bIPbCF4ASbWDGsoEEDtk5dv/7J2sZWYk52HiUkDRQmaLnDVZJgeBJRYCHDWoaN7kWZPEkRgxGThGv
	1NpK23sCA9+ujlhGWRIVCp+Iymf/YsmOuthv49bWP59upKsFDsRG0x8XnhGZ7EsyG7BHExE+Qhm67
	NjfVDPbrP8Fw+SuzkKQGZuR4K5STWVXwWhoWDwIZMuNg5GUdjmXv2sf6+RzjvYPmTZq2KF2e6L45Q
	RqdFFUXKYbARuKNbt3uBt1SBWtcN5UF9NrZT3OvV6JFVM6rpo80Ba+rUoWpdmkTG+mIZ5kIj+BjJN
	m2wmCArT2l8fGaCUEhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXTz-004LVm-BP; Mon, 30 Jan 2023 16:58:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXSZ-004L21-Ry
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 16:56:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F593611DB;
	Mon, 30 Jan 2023 16:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1C4C4339B;
	Mon, 30 Jan 2023 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675097806;
	bh=ewr/oDOz3QgnkOdhjAWLANR8/++xZfNx9fetWwn02wc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TnotIDIjxyAKloXOFrfY+5Fs6kkrG3ajpcmyy+hOzoHjngt/WZNthH56Ls87DKMbJ
	 eJJAOT3ykQ+ykv0nnV3mmOnT7rs0daNwDkYhnBYKE8qALswYYIzaAXGJBegQjXN9SZ
	 f28Is6DeoQ8goSMuJ//ZVIoZmCPJKDCA7hP91JyGfqnIpz1WV4OtDJWY0rdub5Rm5H
	 r8yoeyykNsUmXFuu7SUmKVl2EI9LXRec8RDwLTUyxzzJJlSeZwvJn+IxadeJg3RzwX
	 I1ugAYrwcGpu1vj2pXdUXUqHC6rYoxNXwXrl9CXtD5aYNB3v/IfUWeehutgI/svBmj
	 WR2WAMqElDMYw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Guo Ren <guoren@kernel.org>, "liaochang (A)" <liaochang1@huawei.com>,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org,
 conor.dooley@microchip.com, penberg@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
In-Reply-To: <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
 <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
Date: Mon, 30 Jan 2023 17:56:43 +0100
Message-ID: <87edrc2c6s.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_085647_990001_7E33E8EE 
X-CRM114-Status: GOOD (  12.36  )
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

TWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JpdGVzOgoKPj4gLi4uYW5kIHN0
b3BfbWFjaGluZSgpIHdpdGggIVBSRUVNUFRJT04gaXMgYnJva2VuIGFzIHdlbGwsIHdoZW4geW91
J3JlCj4+IHJlcGxhY2luZyBtdWx0aXBsZSBpbnN0cnVjdGlvbnMgKHNlZSBNYXJrJ3MgcG9zdCBh
dCBbMV0pLiBUaGUKPj4gc3RvcF9tYWNoaW5lKCkgZGFuY2UgbWlnaHQgd29yayB3aGVuIHlvdSdy
ZSByZXBsYWNpbmcgKm9uZSogaW5zdHJ1Y3Rpb24sCj4+IG5vdCBtdWx0aXBsZSBhcyBpbiB0aGUg
UklTQy1WIGNhc2UuIEknbGwgZXhwYW5kIG9uIHRoaXMgaW4gYSBjb21tZW50IGluCj4+IHRoZSBP
UFRQUk9CRVMgdjYgc2VyaWVzLgo+Cj4gSnVzdCB0byBjbGFyaWZ5LCBteSBjb21tZW50cyBpbiBb
MV0gd2VyZSBhc3N1bWluZyB0aGF0IHN0b3BfbWFjaGluZSgpIHdhcyBub3QKPiB1c2VkLCBpbiB3
aGljaCBjYXNlIHRoZXJlIGlzIGEgcHJvYmxlbSB3aXRoIG9yIHdpdGhvdXQgUFJFRU1QVElPTi4K
Pgo+IEkgYmVsaWV2ZSB0aGF0IHdoZW4gdXNpbmcgc3RvcF9tYWNoaW5lKCksIHRoZSAhUFJFRU1Q
VElPTiBjYXNlIGlzIGZpbmUsIHNpbmNlCj4gc3RvcF9tYWNoaW5lKCkgc2NoZWR1bGVzIHdvcmsg
cmF0aGVyIHRoYW4gcnVubmluZyB3b3JrIGluIElSUSBjb250ZXh0IG9uIHRoZQo+IGJhY2sgb2Yg
YW4gSVBJLCBzbyBubyBDUFVzIHNob3VsZCBiZSBtaWQtc2VxdW5jZSBkdXJpbmcgdGhlIHBhdGNo
aW5nLCBhbmQgaXQncwo+IG5vdCBwb3NzaWJsZSBmb3IgdGhlcmUgdG8gYmUgdGhyZWFkcyB3aGlj
aCBhcmUgcHJlZW1wdGVkIG1pZC1zZXF1ZW5jZS4KClRJTCEgc3RvcF9jcHVzKCkgaGlnaGxpZ2h0
cyB0aGF0IHZlcnkgbmljZWx5LiBUaGFua3MgZm9yIGNsZWFyaW5nIHRoYXQKb3V0ISBUaGF0J3Mg
Z29vZCBuZXdzOyBUaGF0IG1lYW5zIHRoYXQgdGhpcyBmaXggWzRdIHNob3VsZCBnbyBpbi4KCj4g
VGhhdCBhbGwgc2FpZCwgSUlVQyBvcHRwcm9iZXMgaXMgZ29pbmcgdG8gZGlzYXBwZWFyIG9uY2Ug
ZnByb2JlIGlzIHJlYWR5Cj4gZXZlcnl3aGVyZSwgc28gdGhhdCBtaWdodCBiZSBtb290LgoKWWVz
IChIb3dldmVyLCB0aGUgc3RvcF9tYWNoaW5lKCkvIVBSRUVNUFRJT04gaXNzdWUgd2FzIHdpdGgg
ZnRyYWNlKS4KCgpCasO2cm4KCls0XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMw
MTA3MTMzNTQ5LjQxOTI2MzktMi1ndW9yZW5Aa2VybmVsLm9yZy8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
