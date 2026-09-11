Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058C8C88E42
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 06:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLW9HOrQR2Z17hcvmUkbqf3rkYDu0yhAFOGDYXhbsZs=; b=uKZCxr4z6l01Xe
	hsRtTk96j+QKN+6U8XYymcu3qCNSo+dwMFT/AdKa+ZeU9AOpWpG5vqcy8HeRKhAShb3Iz6BMTLcfG
	FJabFW2I7nJECtNjelMw8QLfT+pDEkan5vdGojejaKcNq0Z1PFnbcIqPrmFpKvp6cRChdbFKByprZ
	w2zXGDF/jV5/R37DKtWYVOpuUUD53msRtFuGE0GQUyZyoTMVe27L3MJ9/E5v6o7AMmo9zxttFlfJU
	jtGkROM4xYJOOAjjEwnHFug3ByskETX1tx3ECc7cFl4e0Khl0YtKUBQ9ArgDoNM0Qoi6ur4ZaTNkg
	5hSoR2Vn4aK7KykHKzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vBg-0000000FyJA-3n2y;
	Fri, 11 Sep 2026 06:56:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vBe-0000000FyIe-3vSr
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 06:56:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 624FF60202
	for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 06:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195261F0089D
	for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 06:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789109798;
	bh=8vc/xDWnQFzx1CI8QRvR+U52l8TSGE5NUTd3IlCDLPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cv8nTb4EWYG0Cl1WjvfZKsufMAVlP0Gedoscwr8lkqfY8YWphAh94m714SYfuAXMA
	 FU6s5uyGiPWuh1AHy4gNO91mJOkrxBTzcL9mzDSHtZ5/GqJjWa7DJhJn7h6ZwfKz4r
	 xqjy+WPmqxjFnypKCpvDPiJxiqr+SEnvzLwwxl6LXGrAFtlvs2I0rs6/rYn/lsVVh0
	 euC7i5kH6jCSrSUfYES4tvHyofZFzfVMiEW1CN7OvDt3ney8cFwZrieBb56LdIuWD/
	 zYllR1ZGr51eFpG6TJU9OMZZs5xdpSZ46NtS6AJtCXjOt1Ore8Z89sYTmYu2ICI6aH
	 10AZmmLDC9gWA==
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so145832f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 23:56:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxk9Nk1rkVJh/n/pGPcOCWh3SiuY3Bbx2RIQde9pvkPNB3RsBKzn0xwOcjrTEP1g3gs4tt83luk8TyW9w==@lists.infradead.org
X-Gm-Message-State: AFuF++m4EvZq7+gWGZnpNsu9cl6eSTw2vVfy8fnrSQbg4ys4fzouGq/7
	hOAYm9JuKqAMc85ZEF9aJezl1QXuJTpiT/bglfwZEn6o6JTmPOG7ByMCZUfUo/17F6sTPZYaKfB
	PrvJC0TbViHo8D2zPkc1ACYeVZTdYVnw=
X-Received: by 2002:a05:6000:2404:b0:486:ec88:95ca with SMTP id
 ffacd0b85a97d-486ec889612mr3706963f8f.12.1789109796605; Thu, 10 Sep 2026
 23:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
In-Reply-To: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Sep 2026 14:56:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRn4keG=peEKkncgdsu=RLP3N0Ev6cO7mzXg-J48R+bEg@mail.gmail.com>
X-Gm-Features: AcwNN1W7oAcQyKXUOitVQI1nGzO90U5LsLKofTdxYWn-2h9HJHlgkOexcvKkbvw
Message-ID: <CAJF2gTRn4keG=peEKkncgdsu=RLP3N0Ev6cO7mzXg-J48R+bEg@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context save/restore
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andybnac@gmail.com>, 
	Vincent Chen <vincent.chen@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCA5OjAz4oCvUE0gVHJveSBNaXRjaGVsbCA8dHJveS5taXRj
aGVsbEBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gVGhlIHN0YW5kYXJkIHZlY3RvciBzYXZlL3Jlc3Rv
cmUgYXNtIGFkdmFuY2VzIGRhdGFwIGJ1dCBkZWNsYXJlcyBpdCBhcwo+IGlucHV0LW9ubHkuIEFu
IGlubGluZWQgY2FsbGVyIHJldXNpbmcgdGhlIG9yaWdpbmFsIHBvaW50ZXIgbWF5IHRoZXJlZm9y
ZQo+IHVzZSB0aGUgYWR2YW5jZWQgYWRkcmVzcyBpbnN0ZWFkLgo+Cj4gRGVjbGFyZSBkYXRhcCBh
cyByZWFkLXdyaXRlIHNvIHRoZSBjb21waWxlciBjYW4gcHJlc2VydmUgdGhlIG9yaWdpbmFsCj4g
cG9pbnRlciB3aGVuIG5lZWRlZC4KPgo+IEZpeGVzOiAwM2MzZmNkOTk0MWEgKCJyaXNjdjogSW50
cm9kdWNlIHN0cnVjdC9oZWxwZXJzIHRvIHNhdmUvcmVzdG9yZSBwZXItdGFzayBWZWN0b3Igc3Rh
dGUiKQo+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXgu
ZGV2Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdmVjdG9yLmgKPiBpbmRleCBmZmZlNzJhNzcyMDgwLi5jN2ZkNmQ1MGE3YTQ3IDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gQEAgLTIzMCw3ICsyMzAsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9zYXZlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0
YXRlICpzYXZlX3RvLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICJhZGQgICAgICAgICAgICAl
MSwgJTEsICUwXG5cdCIKWWVzLCAlMSBpcyBtb2RpZmllZC4gR29vZCBjYXRjaCEKClJldmlld2Vk
LWJ5OiBHVU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+CgpQUzoKRG9uJ3QgZm9y
Z2V0ICJpZiAoaGFzX3h0aGVhZHZlY3RvcigpKSB7IiBwYXJ0LCB0aHggOikKCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgInZzZTgudiAgICAgICAgIHYyNCwgKCUxKVxuXHQiCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIi5vcHRpb24gcG9wXG5cdCIKPiAtICAgICAgICAgICAgICAgICAgICAg
ICA6ICI9JnIiICh2bCkgOiAiciIgKGRhdGFwKSA6ICJtZW1vcnkiKTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICA6ICI9JnIiICh2bCksICIrciIgKGRhdGFwKSA6IDogIm1lbW9yeSIpOwo+ICAg
ICAgICAgfQo+ICAgICAgICAgcmlzY3Zfdl9kaXNhYmxlKCk7Cj4gIH0KPiBAQCAtMjY2LDcgKzI2
Niw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoc3RydWN0
IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnJlc3RvcmVfCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ImFkZCAgICAgICAgICAgICUxLCAlMSwgJTBcblx0Igo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICJ2bGU4LnYgICAgICAgICB2MjQsICglMSlcblx0Igo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICIub3B0aW9uIHBvcFxuXHQiCj4gLSAgICAgICAgICAgICAgICAgICAgICAgOiAiPSZyIiAodmwp
IDogInIiIChkYXRhcCkgOiAibWVtb3J5Iik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgOiAi
PSZyIiAodmwpLCAiK3IiIChkYXRhcCkgOiA6ICJtZW1vcnkiKTsKPiAgICAgICAgIH0KPiAgICAg
ICAgIF9fdnN0YXRlX2Nzcl9yZXN0b3JlKHJlc3RvcmVfZnJvbSk7Cj4gICAgICAgICByaXNjdl92
X2Rpc2FibGUoKTsKPgo+IC0tLQo+IGJhc2UtY29tbWl0OiBjZWU5Mzk1YWNkODA0M2JlMDY0NGIy
NWMzNGJmYTg2NjIzZjJiOTM1Cj4gY2hhbmdlLWlkOiAyMDI2MDkwOC1yaXNjdi12ZWN0b3ItYXNt
LWZpeC0yN2VkMzY2MjM5MzQKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IFRyb3kgTWl0Y2hlbGwg
PHRyb3kubWl0Y2hlbGxAbGludXguZGV2Pgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
