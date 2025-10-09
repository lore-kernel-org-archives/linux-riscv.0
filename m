Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F473CCA471
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 06:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wss1vmJ4secU3DKwH4pgshrhWEXBYEru21doD0gyXjM=; b=hcVXPUkJp0mnEv
	9iL6Xcp1FtpmLVkr7FahYs4JyA80XPTvg8rkBe39jFqFrGK8DRznHaudFOP2ONZemCNQQZkAw4zbD
	ZYFjV5xS05oj74qmfYRoxRllyck+RH4cG03gdVLymV+WBa8y+x4eaWpXrNNRWSRlKtsWW2/GkTA2G
	NeA0dSeugJSZMXO0D35J5Kjj5rBop2yR3crtDMjAsqf4xARGW/Wi5B5lDC2ghWtGc2FmhNj80Wrp5
	sybojKyuJPcjHQ21jpXNd+WFDNo08VpE7nrnaSXvK/J0oCqwLKJNfTSoMXfUE0AQg+kca3teBmJ/1
	gQfsYkJtDOauslSlUMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kBp-00000005HYe-0N3S;
	Thu, 09 Oct 2025 06:31:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kBl-00000005HX2-1lzL
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 06:31:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46fa4dbb72fso746015e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759991503; x=1760596303; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZphDIVd5tmeP6KAhy58kJYA1PrGr3bDOHMWlYgqBwIY=;
        b=nYCPyRjZT7TKPwY3IOnRG7nY/t3Pe00iTBZFHaqVN6qKQf8+xaxBtlKcqIXOM5/Nfj
         IZDcSzAxeU6d0/ksaUUjM1hnG73HNb+e+JgUpcot9LFvox824HoXd306bQ8Lno8Qgulw
         DhUHRre8xN50vyAF/VbjdHrCDHpceEpKY8V32/O6WHUOeeYeauAi+wtEoLiqZ7QIjx0g
         u/clT8+7Q14bK/Ernpn+4NF95ooVx+GtbiDwA96FJgf6Yu4f0krHrKdStqwUwrbH/wCt
         2671+tMahTjGrXM0hcdE0JTrRJiwoYKrMRePytpdb1iO8mbkx1xInnmRQ357lGRQDaZZ
         G2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759991503; x=1760596303;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZphDIVd5tmeP6KAhy58kJYA1PrGr3bDOHMWlYgqBwIY=;
        b=qVKPNlj5hQ69aBdu29XlLCs9TDxAJ2+RkEc1cHeC8cnjSMnu0nItxdvWDNn4wZZ6zg
         2u1ckOBFDxD/7j2l9QJijM6jCBq4dWSG2aXbIvrPFoZWyvt/pz5O4T4PwbAw5UgcTVGE
         bkxFwzFe4aT6ue1YkMaGAUIjmaDN94eAcqe2h7N47kzCbHDGkGfRGUQhGjgp8CQPZYSh
         e8OV6CQUtB2ICEC2s59R1Djd9ScFBfGmZx7c4DmArzCTbDa7Hk9+SZA994PDVbCGoGMT
         +iqLY2u2Be3BO8KoYaITTnGEBSYQK35YUL8iw/JcFR3C8fq1Nbund4rrQ4b+hjU3zZpt
         GxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjiJKsYvZnMf7Mjs5kEjDpvsVHeuYDuCHa+3fX4kCPsqDif3ZftCFNIxSWurIFoV3IxHECto1MgLr9Ig==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzsUD4jtqFVMDZsyLGU3pICl22FMq21z5kKVFpMbTXL8CYlHj7
	++v4BKygM6V6veFwOjdz1xJtChuFFQSm6T35UHME7wz7y5btjR56rB8J5o++P7LrcbU=
X-Gm-Gg: ASbGncvcTSqQj+MULOtQU4InpDfyYv8ZzpulrgHvvOWtMxfxi9dOtJz2m+YOYjNaWS1
	kpC1wDGC3+SFKoI8NFBqdzW0eRaIT2ysP8E+GqI103KuwL1f+wJ3/W7jkGZjvPxdOK5skFdfmzF
	H3/tQdepgvGyzykf1pxqW6X1DNt6o5Wv43jw/Pb/uOXfhfCFpdviLEYmJcxhNa8zwsWTBLGHvC3
	992A2fTxhmKBp6rCf/IrVknjgEYqVAHn73urBjgAtk5XbWAkYU8SUKeBWCt7L1ucRKBHM+eveN4
	usMGcp3f1duzZ2w8CXhQ+0fH8seTbevAbpj/RVXV2vVlwADnswz27v7wyzQOiQ4ffCf8E0Tgnnm
	UmE0qqV8Jdbmt2mUb7C6Pi0OrlXw/NzXg3P2wZS6laMF+MjvO/hT90BMRyLQ=
X-Google-Smtp-Source: AGHT+IEIf07lX5X1t9lPoRt1uKJDa5WT2TozooFfyQvTgQYIm3IKeoNZOzn9APYtFiu6W4PehuHHyQ==
X-Received: by 2002:a05:600c:548b:b0:46e:3d3d:ea92 with SMTP id 5b1f17b1804b1-46fa9b06cabmr25204355e9.5.1759991502804;
        Wed, 08 Oct 2025 23:31:42 -0700 (PDT)
Received: from localhost ([193.86.240.59])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8abf38sm32664903f8f.20.2025.10.08.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:31:42 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 09 Oct 2025 08:31:41 +0200
Message-Id: <DDDKX1VNCCVS.2KVYNU4WBEOVI@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: flush VS-stage TLB after VCPU migration to
 prevent stale entries
Cc: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <liujingqi@lanxincomputing.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <tim609@andestech.com>, "Hui Min Mina Chou"
 <minachou@andestech.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Ben Zong-You Xie" <ben717@andestech.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251002033402.610651-1-ben717@andestech.com>
In-Reply-To: <20251002033402.610651-1-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_233145_498713_BD54029B 
X-CRM114-Status: GOOD (  15.92  )
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

MjAyNS0xMC0wMlQxMTozNDowMiswODowMCwgQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVz
dGVjaC5jb20+Ogo+IEZyb206IEh1aSBNaW4gTWluYSBDaG91IDxtaW5hY2hvdUBhbmRlc3RlY2gu
Y29tPgo+Cj4gSWYgbXVsdGlwbGUgVkNQVXMgb2YgdGhlIHNhbWUgR3Vlc3QvVk0gcnVuIG9uIHRo
ZSBzYW1lIEhvc3QgQ1BVLAo+IGhmZW5jZS52dm1hIG9ubHkgZmx1c2hlcyB0aGF0IEhvc3QgQ1BV
4oCZcyBWUy1zdGFnZSBUTEIuIE90aGVyIEhvc3QgQ1BVcwo+IG1heSByZXRhaW4gc3RhbGUgVlMt
c3RhZ2UgZW50cmllcy4gV2hlbiBhIFZDUFUgbGF0ZXIgbWlncmF0ZXMgdG8gYQo+IGRpZmZlcmVu
dCBIb3N0IENQVSwgaXQgY2FuIGhpdCB0aGVzZSBzdGFsZSBHVkEgdG8gR1BBIG1hcHBpbmdzLCBj
YXVzaW5nCj4gdW5leHBlY3RlZCBmYXVsdHMgaW4gdGhlIEd1ZXN0LgoKVGhlIGlzc3VlIGNhbiBh
bHNvIGJlIGhpdCB3aXRoIGEgc2luZ2xlIFZDUFUgbWlncmF0ZWQgb3ZlciB0d28gaGFydHM6Cgog
IDEpIFtoYXJ0IEFdIGFjY2Vzc2luZyBYIGFzIFksIGNhY2hpbmcgWC0+WSBpbiBmaXJzdCBzdGFn
ZSBUTEIKICAyKSBbaGFydCBCXSByZW1hcHBpbmcgWCB0byBaLCBzZmVuY2Uudm1hCiAgMykgW2hh
cnQgQV0gYWNjZXNzaW5nIFggYXMgWSwgaW5zdGVhZCBvZiBjb3JyZWN0IFoKCk1pZ3JhdGlvbiBm
cm9tIDIgdG8gMSBkb2VzIGhmZW5jZS5ndm1hLCBidXQgdGhhdCBkb2Vzbid0IGZsdXNoIGZpcnN0
CnN0YWdlIFRMQiwgc28gdGhlIHRyYW5zbGF0aW9uIHByb2R1Y2VzIGFuIGVycm9yIGR1ZSB0byBz
dGFsZSBlbnRyaWVzLgoKV2hhdCBSSVNDLVYgaW1wbGVtZW50YXRpb24gYXJlIHlvdSB1c2luZz8g
IChBbmQgZG9lcyB0aGUgaW1wbGVtZW50YXRpb24KaGF2ZSB0aGUgc2FtZSBtZW1vcnkgYWNjZXNz
IHBlcmZvcm1hbmNlIGluIFY9MCBhbmQgVj0xIG1vZGVzLCBldmVuCnRob3VnaCB0aGUgbGF0dGVy
IGhhcyB0d28gbGV2ZWxzIG9mIFRMQnM/KQoKPiBUbyBmaXggdGhpcywga3ZtX3Jpc2N2X2dzdGFn
ZV92bWlkX3Nhbml0aXplKCkgaXMgZXh0ZW5kZWQgdG8gZmx1c2ggYm90aAo+IEctc3RhZ2UgYW5k
IFZTLXN0YWdlIFRMQnMgd2hlbmV2ZXIgYSBWQ1BVIG1pZ3JhdGVzIHRvIGEgZGlmZmVyZW50IEhv
c3QgQ1BVLgo+IFRoaXMgZW5zdXJlcyB0aGF0IG5vIHN0YWxlIFZTLXN0YWdlIG1hcHBpbmdzIHJl
bWFpbiBhZnRlciBWQ1BVIG1pZ3JhdGlvbi4KPgo+IEZpeGVzOiBiNzliZjIwMjVkYmMgKCJSSVND
LVY6IEtWTTogUmVuYW1lIGFuZCBtb3ZlIGt2bV9yaXNjdl9sb2NhbF90bGJfc2FuaXRpemUoKSIp
CgpiNzliZjIwMjVkYmMgZG9lcyBub3QgY2hhbmdlIGJlaGF2aW9yLgpUaGUgYnVnIG11c3QgaGF2
ZSBiZWVuIGludHJvZHVjZWQgZWFybGllci4KCj4gU2lnbmVkLW9mZi1ieTogSHVpIE1pbiBNaW5h
IENob3UgPG1pbmFjaG91QGFuZGVzdGVjaC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmVuIFpvbmct
WW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+Cj4gLS0tCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZtaWQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwo+IEBAIC0xNDYsNCArMTQ2
LDEwIEBAIHZvaWQga3ZtX3Jpc2N2X2dzdGFnZV92bWlkX3Nhbml0aXplKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKClRoZSBmdW5jdGlvbiBpcyBub3cgZG9pbmcgbW9yZSB0aGF0IHNhbml0aXppbmcg
Z3N0YWdlLgpNYXliZSB3ZSBjYW4gYWdhaW4gY2FsbCBpdCBrdm1fcmlzY3ZfbG9jYWxfdGxiX3Nh
bml0aXplKCk/Cgo+ICAKPiAgCXZtaWQgPSBSRUFEX09OQ0UodmNwdS0+a3ZtLT5hcmNoLnZtaWQu
dm1pZCk7Cj4gIAlrdm1fcmlzY3ZfbG9jYWxfaGZlbmNlX2d2bWFfdm1pZF9hbGwodm1pZCk7Cj4g
Kwo+ICsJLyoKPiArCSAqIEZsdXNoIFZTLXN0YWdlIFRMQnMgZW50cnkgYWZ0ZXIgVkNQVSBtaWdy
YXRpb24gdG8gYXZvaWQgdXNpbmcKPiArCSAqIHN0YWxlIGVudHJpZXMuCj4gKwkgKi8KPiArCWt2
bV9yaXNjdl9sb2NhbF9oZmVuY2VfdnZtYV9hbGwodm1pZCk7Cj4gIH0KCkkgaGFkIHNvbWUgbml0
cywgYnV0IHRoZSBhcHByb2FjaCBpcyBzb3VuZCwKClJldmlld2VkLWJ5OiBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KClRoYW5rcy4KCi0tLQpUaGVyZSBpcyBhIHJv
b20gZm9yIGEgUklTQy1WIGV4dGVuc2lvbiB0aGF0IHRlbGxzIHdoZXRoZXIgdGhlIHR3byBUTEIK
Zmx1c2hlcyBhcmUgbmVlZGVkLCBvciBoZmVuY2UuZ3ZtYSBpcyBlbm91Z2guIDopCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
