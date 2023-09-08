Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7CDEE7FF3
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Fj+l6PNrP1+UrrwreXZ7H5oWc9ZsO4ZX7IKndZ56fo=; b=wrAZup/KE68I+G
	uzdQiY6vaxvsUwE1dz3j4qMyfTfSaq0WySVYucnHgN8UFxwqaW/8EreHu8JoinxRHcCrjDk1Sz40o
	P2G0YmrEb5dSeg+yEzj0jAbLAVFvwOL5+DB6currRih//4lvkN4oLqVJO1KAUNsvSoIzuupkn27Fg
	2iNrQwrKaf8xpsPRai9chd+qWsZ2oYmcJPxWWjYTjjHZ62TGmQ1bysqg4xgFk+bLma78eK9zuGOwJ
	V9IJieL2LIUca58FwjbtMfTl4s2/ditHqAbMiR8+1sfNJ6mUdDKpesY8dNDvwKvlOOntNkdg+qu4N
	8JvW6FprG9q/ZZ/A7FEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qebKx-00DpZv-2A;
	Fri, 08 Sep 2023 13:15:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qebKu-00DpZP-0v
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 13:15:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31768ce2e81so1938350f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694178940; x=1694783740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yqcWt1Hglud++CQfzsuwf09IKfawpsHYMpmq0AjR8Y=;
        b=SX9gwvl/cBKUhqQVW3BobiDMLVRdOgvlveSO+X7OGNYNTiVDe0rxt/RiK/Cx2O8NRN
         PaE4T5J2KSoBulOtp4hl4vkJJ6A2QiZm/cwSlQJg+29S4H+7GsU5z/2S473+0Sz6zfFg
         vKqD52ztK3pKZSTjH+VCC4k0D4zlo0hf5Rbtb0Iy2HwT1Y5TvfdqGbnkS8sONkYzEfOF
         Xq2R/s4COGqCSA5K7auFxfOgEelF97X+4frl/YhbD1wtIrQa9s9wJmG0oHAmBQhdgUIS
         KOKb3aBgJO9KSs/4J+ZS/yDSUHD70JXcI/Rm1vNQgMA/iDQo993b3yKACp3sfoS8C1qm
         W5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694178940; x=1694783740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yqcWt1Hglud++CQfzsuwf09IKfawpsHYMpmq0AjR8Y=;
        b=GhZIokWe1ySyLJYcQbNCurx7kfZHwnRfG/zeQPKBSmFt/pAVdxJjahLBD2+7Ua04qT
         MZiinQSnqqRv/biR4F0jjbUj7YZkMSVdqzqcSQYTr68qGSjdDHGPJlUvvScLGQGU1J9b
         hiIt4s00AOkrSUYntPes+WzGl4tOfuwf7/mtAqAN0mfl7AxSzF1JYazJwrsXx/wO5KMW
         /hy1VpOAKU1P3rNwplfjVcTFPTLe3gUXMx+1tTJ9dKkjt7QLo1hIIREEsFuivEy4+Fay
         79AZR2AJXoU+6tECkAAiX+yhqm/aC9C79DyuPYksHqJ3360G35Zctx0cytdJAOu7CH7g
         Kniw==
X-Gm-Message-State: AOJu0YxN3b8PANHgHRoPRMMY7Xa7i+px5+oyHhT9aGOixQzprwAVzRWp
	VuXiVMx+B5wOZ/A9YXvs4GtWwLfq9MOzPyKGwGpcAA==
X-Google-Smtp-Source: AGHT+IEqG2gHm77D4R94T0nPTziGoxtx/t04mDshmmzgzQlaZtiktBRrZdCc6fRZT9fX5FgfUeD8n07AkMBwtMkZ0bg=
X-Received: by 2002:a05:6000:cd:b0:314:3a4b:6cc6 with SMTP id
 q13-20020a05600000cd00b003143a4b6cc6mr2072972wrx.53.1694178939673; Fri, 08
 Sep 2023 06:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230901123043.73700-1-cuiyunhui@bytedance.com> <878r9hvn3m.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <878r9hvn3m.fsf@all.your.base.are.belong.to.us>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 8 Sep 2023 21:15:28 +0800
Message-ID: <CAEEQ3wnDAJOMo2SZAB23aZgOhBKPmZegC9E048YJaFhiXEkA-A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5] riscv: add userland instruction dump to
 RISC-V splats
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	jszhang@kernel.org, andy.chiu@sifive.com, dave.hansen@linux.intel.com, 
	elver@google.com, glider@google.com, cyphar@cyphar.com, 
	kirill.shutemov@linux.intel.com, keescook@chromium.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_061548_657866_0FBF49FF 
X-CRM114-Status: GOOD (  19.27  )
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

SGkgQmrDtnJu77yMCgpPbiBGcmksIFNlcCA4LCAyMDIzIGF0IDI6NDXigK9BTSBCasO2cm4gVMO2
cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cml0ZXM6Cj4KPiA+IEFkZCB1c2VybGFuZCBpbnN0cnVjdGlvbiBkdW1w
IGFuZCByZW5hbWUgZHVtcF9rZXJuZWxfaW5zdHIoKQo+ID4gdG8gZHVtcF9pbnN0cigpLgo+ID4K
PiA+IEFuIGV4YW1wbGU6Cj4gPiBbICAgIDAuODIyNDM5XSBGcmVlaW5nIHVudXNlZCBrZXJuZWwg
aW1hZ2UgKGluaXRtZW0pIG1lbW9yeTogNjkxNksKPiA+IFsgICAgMC44MjM4MTddIFJ1biAvaW5p
dCBhcyBpbml0IHByb2Nlc3MKPiA+IFsgICAgMC44Mzk0MTFdIGluaXRbMV06IHVuaGFuZGxlZCBz
aWduYWwgNCBjb2RlIDB4MSBhdCAweDAwMDAwMDAwMDAwNWJlMTggaW4gYmJbMTAwMDArNWZiMDAw
XQo+ID4gWyAgICAwLjg0MDc1MV0gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWludGVk
IDUuMTQuMC1yYzQtMDAwNDktZ2JkNjQ0MjkwYWE3Mi1kaXJ0eSAjMTg3Cj4gPiBbICAgIDAuODQx
MzczXSBIYXJkd2FyZSBuYW1lOiAgLCBCSU9TCj4gPiBbICAgIDAuODQxNzQzXSBlcGMgOiAwMDAw
MDAwMDAwMDViZTE4IHJhIDogMDAwMDAwMDAwMDA3OWU3NCBzcCA6IDAwMDAwMDNmZmZjYWZkYTAK
PiA+IFsgICAgMC44NDIyNzFdICBncCA6IGZmZmZmZmZmODE2ZTlkYzggdHAgOiAwMDAwMDAwMDAw
MDAwMDAwIHQwIDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICAwLjg0Mjk0N10gIHQxIDogMDAw
MDAwM2ZmZmM5ZmRmMCB0MiA6IDAwMDAwMDAwMDAwMDAwMDAgczAgOiAwMDAwMDAwMDAwMDAwMDAw
Cj4gPiBbICAgIDAuODQzNDM0XSAgczEgOiAwMDAwMDAwMDAwMDAwMDAwIGEwIDogMDAwMDAwM2Zm
ZmNhMDE5MCBhMSA6IDAwMDAwMDNmZmZjYWZlMTgKPiA+IFsgICAgMC44NDM4OTFdICBhMiA6IDAw
MDAwMDAwMDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogMDAwMDAwMDAwMDAwMDAw
MAo+ID4gWyAgICAwLjg0NDM1N10gIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6IDAwMDAwMDAw
MDAwMDAwMDAgYTcgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgIDAuODQ0ODAzXSAgczIgOiAw
MDAwMDAwMDAwMDAwMDAwIHMzIDogMDAwMDAwMDAwMDAwMDAwMCBzNCA6IDAwMDAwMDAwMDAwMDAw
MDAKPiA+IFsgICAgMC44NDUyNTNdICBzNSA6IDAwMDAwMDAwMDAwMDAwMDAgczYgOiAwMDAwMDAw
MDAwMDAwMDAwIHM3IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICAwLjg0NTcyMl0gIHM4IDog
MDAwMDAwMDAwMDAwMDAwMCBzOSA6IDAwMDAwMDAwMDAwMDAwMDAgczEwOiAwMDAwMDAwMDAwMDAw
MDAwCj4gPiBbICAgIDAuODQ2MTgwXSAgczExOiAwMDAwMDAwMDAwZDE0NGUwIHQzIDogMDAwMDAw
MDAwMDAwMDAwMCB0NCA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgMC44NDY2MTZdICB0NSA6
IDAwMDAwMDAwMDAwMDAwMDAgdDYgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgIDAuODQ3MjA0
XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAwMjAgYmFkYWRkcjogMDAwMDAwMDBmMDAyODA1MyBjYXVz
ZTogMDAwMDAwMDAwMDAwMDAwMgo+ID4gWyAgICAwLjg0ODIxOV0gQ29kZTogZjA2ZiBmZjVmIDM4
MjMgZmExMSAwMTEzIGZiMDEgMmUyMyAwMjAxIDAyOTMgMDAwMCAoODA1MykgZjAwMgo+ID4gWyAg
ICAwLjg1MTAxNl0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxs
IGluaXQhIGV4aXRjb2RlPTB4MDAwMDAwMDQKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkg
Q3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzLmMgfCAxOSArKysrKysrKysrKysrKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiBp
bmRleCBmNzk4Yzg1M2JlZGUuLjkyM2I0OWMzODk4NSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+
IEBAIC0zMyw3ICszMywxOSBAQCBpbnQgc2hvd191bmhhbmRsZWRfc2lnbmFscyA9IDE7Cj4gPgo+
ID4gIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0soZGllX2xvY2spOwo+ID4KPiA+IC1zdGF0aWMgdm9p
ZCBkdW1wX2tlcm5lbF9pbnN0cihjb25zdCBjaGFyICpsb2dsdmwsIHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQo+ID4gK3N0YXRpYyBpbnQgY29weV9jb2RlKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1MTYg
KnZhbCwgY29uc3QgdTE2ICppbnNucykKPiA+ICt7Cj4gPiArICAgICBpZiAoIXVzZXJfbW9kZShy
ZWdzKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGdldF9rZXJuZWxfbm9mYXVsdCgqdmFsLCBp
bnNucyk7Cj4gPiArCj4gPiArICAgICAvKiBUaGUgdXNlciBzcGFjZSBjb2RlIGZyb20gb3RoZXIg
dGFza3MgY2Fubm90IGJlIGFjY2Vzc2VkLiAqLwo+ID4gKyAgICAgaWYgKHJlZ3MgIT0gdGFza19w
dF9yZWdzKGN1cnJlbnQpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVQRVJNOwo+ID4gKwo+
ID4gKyAgICAgcmV0dXJuIGNvcHlfZnJvbV91c2VyX25vZmF1bHQodmFsLCBpbnNucywgc2l6ZW9m
KCp2YWwpKTsKPgo+IEhtbSwgSSB0aGluayB5b3UgbWlzc2VkIHRoZSBhY3R1YWwgcHJvYmxlbSBp
biBbMV0uIEknbSBzdGlsbCBnZXR0aW5nOgo+Cj4gICB8ICAgQ0hFQ0sgICBhcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jCj4gICB8IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmM6NDY6NDQ6IHdhcm5p
bmc6IGluY29ycmVjdCB0eXBlIGluIGFyZ3VtZW50IDIgKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNl
cykKPiAgIHwgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzo0Njo0NDogICAgZXhwZWN0ZWQgdm9p
ZCBjb25zdCBbbm9kZXJlZl0gX191c2VyICpzcmMKPiAgIHwgYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYzo0Njo0NDogICAgZ290IHVuc2lnbmVkIHNob3J0IGNvbnN0IFt1c2VydHlwZV0gKmluc25z
Cj4KCkhvdyBkaWQgdGhlIHdhcm5pbmdzIGFib3ZlIGNvbWUgYWJvdXQ/IEkgZG9uJ3QgaGF2ZSBv
bmUgbG9jYWxseS4gV2hhdAppcyB5b3VyIHJpc2MtdiBnY2MgdmVyc2lvbj8KClRoaXMgaXMgbWlu
ZToKCi9vcHQvcmlzY3YvYmluL3Jpc2N2NjQtdW5rbm93bi1saW51eC1nbnUtZ2NjIC12ClVzaW5n
IGJ1aWx0LWluIHNwZWNzLgpDT0xMRUNUX0dDQz0vb3B0L3Jpc2N2L2Jpbi9yaXNjdjY0LXVua25v
d24tbGludXgtZ251LWdjYwpDT0xMRUNUX0xUT19XUkFQUEVSPS9vcHQvcmlzY3YvbGliZXhlYy9n
Y2MvcmlzY3Y2NC11bmtub3duLWxpbnV4LWdudS8xMi4yLjAvbHRvLXdyYXBwZXIKVGFyZ2V0OiBy
aXNjdjY0LXVua25vd24tbGludXgtZ251CkNvbmZpZ3VyZWQgd2l0aDogLi4uL3Jpc2N2LWdudS10
b29sY2hhaW4vZ2NjL2NvbmZpZ3VyZQotLXRhcmdldD1yaXNjdjY0LXVua25vd24tbGludXgtZ251
IC0tcHJlZml4PS9vcHQvcmlzY3YKLS13aXRoLXN5c3Jvb3Q9L29wdC9yaXNjdi9zeXNyb290IC0t
d2l0aC1wa2d2ZXJzaW9uPWcyZWU1ZTQzMDAxOAotLXdpdGgtc3lzdGVtLXpsaWIgLS1lbmFibGUt
c2hhcmVkIC0tZW5hYmxlLXRscwotLWVuYWJsZS1sYW5ndWFnZXM9YyxjKyssZm9ydHJhbiAtLWRp
c2FibGUtbGlibXVkZmxhcCAtLWRpc2FibGUtbGlic3NwCi0tZGlzYWJsZS1saWJxdWFkbWF0aCAt
LWRpc2FibGUtbGlic2FuaXRpemVyIC0tZGlzYWJsZS1ubHMKLS1kaXNhYmxlLWJvb3RzdHJhcCAt
LXNyYz0uLi4vcmlzY3ZfYWNwaS9yaXNjdi1nbnUtdG9vbGNoYWluL2djYwotLWRpc2FibGUtbXVs
dGlsaWIgLS13aXRoLWFiaT1scDY0ZCAtLXdpdGgtYXJjaD1ydjY0aW1hZmRjCi0td2l0aC10dW5l
PXJvY2tldCAtLXdpdGgtaXNhLXNwZWM9Mi4yICdDRkxBR1NfRk9SX1RBUkdFVD0tTzIKLW1jbW9k
ZWw9bWVkbG93JyAnQ1hYRkxBR1NfRk9SX1RBUkdFVD0tTzIgICAtbWNtb2RlbD1tZWRsb3cnClRo
cmVhZCBtb2RlbDogcG9zaXgKU3VwcG9ydGVkIExUTyBjb21wcmVzc2lvbiBhbGdvcml0aG1zOiB6
bGliIHpzdGQKZ2NjIHZlcnNpb24gMTIuMi4wIChnMmVlNWU0MzAwMTgpCgpUaGFua3MsCll1bmh1
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
