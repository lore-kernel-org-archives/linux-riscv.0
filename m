Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E504CD37B3
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75YFuWT83n70S79O5AFXgNEu5qVuFWrTuoPxQ9Sd0ak=; b=JwtqlvVbBpLlDn
	HjpQv4IWWrCVRp9qU9ortGb7MUlnsG/v+v59ScDY2syEABWB/V2wwRjhUgt5MnlHDRq9R3Qxfnn9C
	KnHsqpbM7Wd5erJmUPOOuVjzzEQ0wxUgdMRnRQDvTJqcZ+cFd6WKCcoJx5tpKwQm4+gQi0BMoOHKc
	Du11GB7Kbl63icEekjHsb56ZIxl2W17hCnndak8iv+ZoBAzqSSRUAdcw631+u3bmLsHCM1ShVHSUl
	CQ1Nhxp26zelAR3n4R5juOzgaHK4MfkAyHLSwqcrUfiqEPPFF7bQtkBfemA+2DqD1w4G9Ob9BqO9J
	INZs9ymFz7VA7wAaXaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtMd-00DkuH-0x;
	Sun, 17 Sep 2023 15:07:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtMZ-00Dktl-35
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 15:07:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 09C98CE0AAD
	for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 15:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B06CC433A9
	for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694963222;
	bh=uPJ5RfMmvHKK1Dw4GtfSI+98f15rrKi1ZGs6Fsv2hGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dgeVYLbhvP0wGfho9LXfIV61SUy6g3IFu2TN0XARzuisadkm2lSUqA/5Hy0IHMU9U
	 TH3J6FTnEfr7YP9sImKe6F1AUUfwzBQWRL/YOTNkrYZvFqgMNMcfdr5zvBAzF/rJHJ
	 ysiEuOQHAYEVo78g1KnAF7ZMZta3/VGOKEyvCNltBO0wxT/NmCo9GKaBvHsR+9HBnH
	 f50ROh9FSot9f04o8KHNe83gfskA0lO7alVKIEleGCLugr6xXyWkGkO7lkgC0ZkV4o
	 UlYyuDCLKRFnIjUUrtY1hd4Y6lZuqsZF52CmwEODndVHIg+Y/mZzN39hNlUFwaYnSG
	 l2hgbq2TYHDiA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso482510766b.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 08:07:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YyHoIhyl81oZ6/QWj1nYrH7rjmes8A4wXiuWn4ivtP1si5q8Azq
	tVaheW+uwcYatSwXxgB54SYyDekPolYwjJ/7oFc=
X-Google-Smtp-Source: AGHT+IEo06GeZj87fmcUeNBkBoXnXuEAiq0PrBqIKyMwrBO3S6Kp3wzR8JVXpu32F7fYkN9L8OCd75KsrJk3bf+/R10=
X-Received: by 2002:a17:906:20d4:b0:9a9:d5dd:dacd with SMTP id
 c20-20020a17090620d400b009a9d5dddacdmr6117465ejc.26.1694963220748; Sun, 17
 Sep 2023 08:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910082911.3378782-14-guoren@kernel.org>
 <ZQP4SXLf00IntVWd@redhat.com>
In-Reply-To: <ZQP4SXLf00IntVWd@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 17 Sep 2023 23:06:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBwFKjVOovMHB171s+nymL88OANpS3O-uwKBLxto43mA@mail.gmail.com>
Message-ID: <CAJF2gTTBwFKjVOovMHB171s+nymL88OANpS3O-uwKBLxto43mA@mail.gmail.com>
Subject: Re: [PATCH V11 13/17] RISC-V: paravirt: pvqspinlock: Add SBI implementation
To: Leonardo Bras <leobras@redhat.com>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_080708_344985_CED4143A 
X-CRM114-Status: GOOD (  25.89  )
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

T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgMjoyM+KAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIFNlcCAxMCwgMjAyMyBhdCAwNDoyOTowN0FN
IC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBJbXBsZW1lbnQgcHZfa2ljayB3aXRoIFNCSSBp
bXBsZW1lbnRhdGlvbiwgYW5kIGFkZCBTQklfRVhUX1BWTE9DSwo+ID4gZXh0ZW5zaW9uIGRldGVj
dGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+
IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggICAgICAgICAgIHwgNiArKysr
KysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9xc3BpbmxvY2tfcGFyYXZpcnQuYyB8IDcgKysrKysr
LQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gaW5kZXggZTAyMzNiM2Q3YTVmLi4zNTMzZjhkNGYz
ZTIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiBAQCAtMzAsNiArMzAsNyBAQCBlbnVt
IHNiaV9leHRfaWQgewo+ID4gICAgICAgU0JJX0VYVF9IU00gPSAweDQ4NTM0RCwKPiA+ICAgICAg
IFNCSV9FWFRfU1JTVCA9IDB4NTM1MjUzNTQsCj4gPiAgICAgICBTQklfRVhUX1BNVSA9IDB4NTA0
RDU1LAo+ID4gKyAgICAgU0JJX0VYVF9QVkxPQ0sgPSAweEFCMDQwMSwKPiA+Cj4gPiAgICAgICAv
KiBFeHBlcmltZW50YWxzIGV4dGVuc2lvbnMgbXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8K
PiA+ICAgICAgIFNCSV9FWFRfRVhQRVJJTUVOVEFMX1NUQVJUID0gMHgwODAwMDAwMCwKPiA+IEBA
IC0yNDMsNiArMjQ0LDExIEBAIGVudW0gc2JpX3BtdV9jdHJfdHlwZSB7Cj4gPiAgLyogRmxhZ3Mg
ZGVmaW5lZCBmb3IgY291bnRlciBzdG9wIGZ1bmN0aW9uICovCj4gPiAgI2RlZmluZSBTQklfUE1V
X1NUT1BfRkxBR19SRVNFVCAoMSA8PCAwKQo+ID4KPiA+ICsvKiBTQkkgUFZMT0NLIChraWNrIGNw
dSBvdXQgb2Ygd2ZpKSAqLwo+ID4gK2VudW0gc2JpX2V4dF9wdmxvY2tfZmlkIHsKPiA+ICsgICAg
IFNCSV9FWFRfUFZMT0NLX0tJQ0tfQ1BVID0gMCwKPiA+ICt9Owo+ID4gKwo+ID4gICNkZWZpbmUg
U0JJX1NQRUNfVkVSU0lPTl9ERUZBVUxUICAgICAweDEKPiA+ICAjZGVmaW5lIFNCSV9TUEVDX1ZF
UlNJT05fTUFKT1JfU0hJRlQgMjQKPiA+ICAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFKT1Jf
TUFTSyAgMHg3Zgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3FzcGlubG9ja19w
YXJhdmlydC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcXNwaW5sb2NrX3BhcmF2aXJ0LmMKPiA+IGlu
ZGV4IGEwYWQ0NjU3ZjQzNy4uNTcxNjI2ZjM1MGJlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvcXNwaW5sb2NrX3BhcmF2aXJ0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3FzcGlubG9ja19wYXJhdmlydC5jCj4gPiBAQCAtMTEsNiArMTEsOCBAQAo+ID4KPiA+ICB2b2lk
IHB2X2tpY2soaW50IGNwdSkKPiA+ICB7Cj4gPiArICAgICBzYmlfZWNhbGwoU0JJX0VYVF9QVkxP
Q0ssIFNCSV9FWFRfUFZMT0NLX0tJQ0tfQ1BVLAo+ID4gKyAgICAgICAgICAgICAgIGNwdWlkX3Rv
X2hhcnRpZF9tYXAoY3B1KSwgMCwgMCwgMCwgMCwgMCk7Cj4gPiAgICAgICByZXR1cm47Cj4gPiAg
fQo+ID4KPiA+IEBAIC0yNSw3ICsyNyw3IEBAIHZvaWQgcHZfd2FpdCh1OCAqcHRyLCB1OCB2YWwp
Cj4gPiAgICAgICBpZiAoUkVBRF9PTkNFKCpwdHIpICE9IHZhbCkKPiA+ICAgICAgICAgICAgICAg
Z290byBvdXQ7Cj4gPgo+ID4gLSAgICAgLyogd2FpdF9mb3JfaW50ZXJydXB0KCk7ICovCj4gPiAr
ICAgICB3YWl0X2Zvcl9pbnRlcnJ1cHQoKTsKPiA+ICBvdXQ6Cj4gPiAgICAgICBsb2NhbF9pcnFf
cmVzdG9yZShmbGFncyk7Cj4gPiAgfQo+ID4gQEAgLTYyLDYgKzY0LDkgQEAgdm9pZCBfX2luaXQg
cHZfcXNwaW5sb2NrX2luaXQodm9pZCkKPiA+ICAgICAgIGlmKHNiaV9nZXRfZmlybXdhcmVfaWQo
KSAhPSBTQklfRVhUX0JBU0VfSU1QTF9JRF9LVk0pCj4gPiAgICAgICAgICAgICAgIHJldHVybjsK
PiA+Cj4gPiArICAgICBpZiAoIXNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9QVkxPQ0spKQo+
ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiArCj4gPiAgICAgICBwcl9pbmZvKCJQViBxc3Bp
bmxvY2tzIGVuYWJsZWRcbiIpOwo+ID4gICAgICAgX19wdl9pbml0X2xvY2tfaGFzaCgpOwo+ID4K
PiA+IC0tCj4gPiAyLjM2LjEKPiA+Cj4KPiBJSVVDIHRoaXMgUFZMT0NLIGV4dGVuc2lvbiBpcyBu
b3cgYSByZXF1aXJlbWVudCB0byB1c2UgcHZfcXNwaW5sb2NrKCksIGFuZAo+IGl0IGFsbG93cyBh
IGNwdSB0byB1c2UgYW4gaW5zdHJ1Y3Rpb24gdG8gd2FpdCBmb3IgaW50ZXJydXB0IGluIHB2X3dh
aXQoKSwKPiBhbmQga2lja3MgaXQgb3V0IG9mIHRoaXMgd2FpdCB1c2luZyBhIG5ldyBzYmlfZWNh
bGwoKSBvbiBwdl9raWNrKCkuClllcy4KCj4KPiBPdmVyYWxsIGl0IExHVE0sIGJ1dCB3b3VsZCBi
ZSBuaWNlIHRvIGhhdmUgdGhlIHJlZmVyZW5jZSBkb2MgaW4gdGhlIGNvbW1pdAo+IG1zZy4gSSBl
bmQgdXAgaW5mZXJyaW5nIHNvbWUgb2YgdGhlIGlubmVyIHdvcmtpbmdzIGJ5IHlvdXIgaW1wbGVt
ZW50YXRpb24sCj4gd2hpY2ggaXMgbm90IGlkZWFsIGZvciByZXZpZXdpbmcuCkkgd291bGQgaW1w
cm92ZSB0aGUgY29tbWl0IG1zZyBpbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHBhdGNoLgoKPgo+IElm
IHVuZGVyc3RhbmRpbmcgYWJvdmUgaXMgcmlnaHQsCj4gUmV2aWV3ZWQtYnk6IExlb25hcmRvIEJy
YXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPgo+IFRoYW5rcyEKPiBMZW8KPgoKCi0tIApCZXN0IFJl
Z2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
