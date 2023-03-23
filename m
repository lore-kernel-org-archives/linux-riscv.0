Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C67C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 00:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nX/0Mvq+extcpl8gLMhrPSADvbs+RPDD9Ff69ju0TCo=; b=U1QaPON6fWiFkf
	dhxDa6RXUD01K6dP9r/Dr7b9IJxceYSI/zqC8PZ8av5OhuW0STsvtoevQdYEpxuVj53z2//uT2mMm
	uj6JQDNK5Q1TfNlnkqFyihy/by9bIXv0Qlv9WJv76quapPU0ZpEu5dxPD3SUHF280Bxbmk/foVSKe
	z+q7uVoVafUxJt8VAhzQaTuwMkoBuWefKfZqlV5zbVvSaUmFK79RwkDEEBTzs8IeiKjwcho1VeB2i
	zAU4oL3vGb7Ng4jfjEXPxnn4c3ZVMi9D/SPX1gPS0VLnirGVMKGzj48Dr21rY3XR+sJKy6vb1/9Ih
	UgUwOkFC4N9U1trhN8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf938-000N1E-0W;
	Thu, 23 Mar 2023 00:43:26 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf934-000N05-2r
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 00:43:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id cu12so6961820pfb.13
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 17:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679532201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryXXnmIeAtrWfMN7Ri1B53r6iw4ZKcLWFN/AVr6shlQ=;
        b=BDwRp2yXM3s6qg8QiWi2RAo18onjprMVNuzzF8fFzrj3rQOuhHHVLZ3GZMyJvzfzan
         cUwoEOeul2KaacLewByJ68nIpY5AiWyGx6hKe2wk/W7OHDA9l8Fq82nQQjvaK3qNTPD2
         VKMrlOgtbVeGv7IQZJP7310M+smRR8UD+RCkWF0WyBB8okjTi4dhQc68Hj1YoT/Z77v3
         4AZOQCVp5NikmgEz8D9MVXMCc0+cs7tvrs7rzLcV5n9m3C1MaqEx8B+JUU8T3gOpyRxL
         bgoalYgoUu9vxCK3qJVius2pWYEsmbdKjwceUtXkrHczHAo9gnZH/1O1oqjgxd1r+ax/
         Wh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679532201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryXXnmIeAtrWfMN7Ri1B53r6iw4ZKcLWFN/AVr6shlQ=;
        b=GpB005E0l6jkWZoDLkyDtQaScZBSm+U0NIi5EeDujEBKi1izqh5pt/alSYrNcTbBA7
         3kx4R3XTagATM+LiYVoET6x0tojKCSSmEupnQ1zsJ39tUBLnHpRfKN62T9aRocCD2xRj
         Hxkgx7K7pn5Yo/7ejNjJi4o2wZN6Qi5OOQAWcz0+17mqyIp9F+mTGX9brlZdLLOVgPwV
         bnWsHR7z6i43p3Lz+C9R6eH5Ztn5cr2blEofAnsfXNaoNvGfaG8D09r0rmIaMW1cyJ7F
         JRJv+Gzso2LxCE4y2BAiorzmsnthv5BKCHBZRN60g/CLVwRpQ71Oxwt1dqQA0mdsxvrk
         pUmQ==
X-Gm-Message-State: AO0yUKWKKLlgHbLULCpJpk76I04ncpHyul+8WKgNMX0/JdLTb5K173X7
	JWCeaM5eIrvilpRXEFeKDNSp2eD9X51kyduDtxQ=
X-Google-Smtp-Source: AK7set/d2aevsj9G+8nYaIRCWaQtHIS0zZn1kqp5FZKOqqzsARfgQDeB6WHYCSX2yGF2uQmpFy2app9LeJUPZJkI95A=
X-Received: by 2002:a65:4509:0:b0:503:4a2c:5f0 with SMTP id
 n9-20020a654509000000b005034a2c05f0mr1375140pgq.9.1679532200648; Wed, 22 Mar
 2023 17:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230222033021.983168-1-guoren@kernel.org> <20230222033021.983168-2-guoren@kernel.org>
In-Reply-To: <20230222033021.983168-2-guoren@kernel.org>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Thu, 23 Mar 2023 08:43:08 +0800
Message-ID: <CAJhGHyCAZT+NMpSvUaL0fASnD+HMu-zUsT4Emr9h_VFgYHowVQ@mail.gmail.com>
Subject: Re: [PATCH -next V17 1/7] compiler_types.h: Add __noinstr_section()
 for noinstr
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	mark.rutland@arm.com, ben@decadent.org.uk, bjorn@kernel.org, 
	palmer@dabbelt.com, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Lai Jiangshan <laijs@linux.alibaba.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <keescook@chromium.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_174322_993069_88D2C056 
X-CRM114-Status: GOOD (  16.18  )
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

T24gV2VkLCBGZWIgMjIsIDIwMjMgYXQgMTE6NTbigK9BTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Cj4gRnJvbTogTGFpIEppYW5nc2hhbiA8bGFpanNAbGludXguYWxpYmFiYS5jb20+Cj4K
PiBVc2luZyBfX25vaW5zdHJfc2VjdGlvbigpIGRvZXNuJ3QgYXV0b21hdGljYWxseSBkaXNhYmxl
IGFsbAo+IGluc3RydW1lbnRhdGlvbnMgb24gdGhlIHNlY3Rpb24uIEluaGliaXRpb24gZm9yIHNv
bWUKPiBpbnN0cnVtZW50YXRpb25zIHJlcXVpcmVzIGV4dHJhIGNvZGUuIEkuRS4gS1BST0JFUyBl
eHBsaWNpdGx5Cj4gYXZvaWRzIGluc3RydW1lbnRpbmcgb24gLm5vaW5zdHIudGV4dC4KPgo+IFN1
Z2dlc3RlZC1ieTogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+Cj4g
U3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4gUmV2
aWV3ZWQtYnk6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTog
S2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiBUZXN0ZWQtYnk6IEppc2hlbmcgWmhhbmcgPGpz
emhhbmdAa2VybmVsLm9yZz4KPiBUZXN0ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IExhaSBKaWFuZ3NoYW4gPGxhaWpzQGxpbnV4LmFsaWJhYmEuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKSGVsbG8KClRo
ZSBjaGFuZ2UgaGFzIGJlZW4gbWFkZSB1cHN0cmVhbSBhcyBhIHBhcnQgb2YgdGhlIGNvbW1pdAoy
YjVhMGU0MjVlNmUob2JqdG9vbC9pZGxlOiBWYWxpZGF0ZSBfX2NwdWlkbGUgY29kZSBhcyBub2lu
c3RyKS4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzAxMTIxOTU1NDAuMzczNDYxNDA5
QGluZnJhZGVhZC5vcmcKClRoYW5rcwpMYWkKCj4gLS0tCj4gIGluY2x1ZGUvbGludXgvY29tcGls
ZXJfdHlwZXMuaCB8IDE1ICsrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2NvbXBpbGVyX3R5cGVzLmggYi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmgKPiBpbmRl
eCA3YzFhZmUwZjQxMjkuLjBhMmNhNTc1NWJlNyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2NvbXBpbGVyX3R5cGVzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmgK
PiBAQCAtMjMxLDEyICsyMzEsMTkgQEAgc3RydWN0IGZ0cmFjZV9saWtlbHlfZGF0YSB7Cj4gICNk
ZWZpbmUgX19ub19zYW5pdGl6ZV9vcl9pbmxpbmUgX19hbHdheXNfaW5saW5lCj4gICNlbmRpZgo+
Cj4gLS8qIFNlY3Rpb24gZm9yIGNvZGUgd2hpY2ggY2FuJ3QgYmUgaW5zdHJ1bWVudGVkIGF0IGFs
bCAqLwo+IC0jZGVmaW5lIG5vaW5zdHIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgICAgbm9pbmxpbmUgbm90cmFj
ZSBfX2F0dHJpYnV0ZSgoX19zZWN0aW9uX18oIi5ub2luc3RyLnRleHQiKSkpICAgIFwKPiAtICAg
ICAgIF9fbm9fa2NzYW4gX19ub19zYW5pdGl6ZV9hZGRyZXNzIF9fbm9fcHJvZmlsZSBfX25vX3Nh
bml0aXplX2NvdmVyYWdlIFwKPiArLyoKPiArICogVXNpbmcgX19ub2luc3RyX3NlY3Rpb24oKSBk
b2Vzbid0IGF1dG9tYXRpY2FsbHkgZGlzYWJsZSBhbGwgaW5zdHJ1bWVudGF0aW9ucwo+ICsgKiBv
biB0aGUgc2VjdGlvbi4gIEluaGliaXRpb24gZm9yIHNvbWUgaW5zdHJ1bWVudGF0aW9ucyByZXF1
aXJlcyBleHRyYSBjb2RlLgo+ICsgKiBJLkUuIEtQUk9CRVMgZXhwbGljaXRseSBhdm9pZHMgaW5z
dHJ1bWVudGluZyBvbiAubm9pbnN0ci50ZXh0Lgo+ICsgKi8KPiArI2RlZmluZSBfX25vaW5zdHJf
c2VjdGlvbihzZWN0aW9uKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAg
bm9pbmxpbmUgbm90cmFjZSBfX3NlY3Rpb24oc2VjdGlvbikgX19ub19wcm9maWxlICAgICAgICBc
Cj4gKyAgICAgICBfX25vX2tjc2FuIF9fbm9fc2FuaXRpemVfYWRkcmVzcyBfX25vX3Nhbml0aXpl
X2NvdmVyYWdlIFwKPiAgICAgICAgIF9fbm9fc2FuaXRpemVfbWVtb3J5Cj4KPiArLyogU2VjdGlv
biBmb3IgY29kZSB3aGljaCBjYW4ndCBiZSBpbnN0cnVtZW50ZWQgYXQgYWxsICovCj4gKyNkZWZp
bmUgbm9pbnN0ciBfX25vaW5zdHJfc2VjdGlvbigiLm5vaW5zdHIudGV4dCIpCj4gKwo+ICAjZW5k
aWYgLyogX19LRVJORUxfXyAqLwo+Cj4gICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiAtLQo+
IDIuMzYuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
