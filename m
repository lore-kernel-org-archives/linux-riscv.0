Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8147C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 20:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pM8ap2IiLlB0n1foF4zbkOAnkoQa4zQpSY2Ujduhk3s=; b=kHVARKv8iwIznP
	W/Jmk76RpJgVfD/bI17kjYIB6sLXEZ8RJcbO43+R1aMvbDh5wbLcw1B9A1GbnPPS11S/GUKfmO/s9
	rJ+cC593v6Oj0fEjFXAF5yv81DDCFyx/hzpwXS0ZO+kiGEH/k6HGn7oHMHuzoFaxqpu/PDkHnR3Dn
	VCMem286NFbDsF8eGTzLLZnP7aoGKoIwWdF+nZT0czONdbHQ9dA8Jla6I/7cPCQLIiODLpzQoKlcZ
	lBXRhNIeAlXp5XhNUDWblk3uX7ZF1wxmpQdDTRPm8rYArIe9dk1ThNhIXlm7cdh3I4cLUFOMYxr7q
	68OSPMFPyGtk2gHvmWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB0Bk-004hsZ-L1; Mon, 11 Jul 2022 20:39:28 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB0Bi-004hre-5z
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 20:39:27 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-31c86fe1dddso61568947b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 13:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tgao7UaaDt/zCf+jX3ApL4sHCcBbuTaY4KeXN5lOVYA=;
        b=LJq6iZ3zFH6oSmz8Dhh6LUDzTwxFjQIGr0UXgza45SL/R4monaUXD0ZBVda33/dzgA
         F29hgrY91ChwHT/91+h4yHD+xXzQrwY7GOBLlAEGY79MMqeQ1hcmWJ+uNK3HUmoLCRVj
         +iBiBnegxn4dlRpCkdj4jIAw7WYrWDQQQB6Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tgao7UaaDt/zCf+jX3ApL4sHCcBbuTaY4KeXN5lOVYA=;
        b=Y3+/q0NsuzWFJWxCI+/cj3H/0sR0xMnzXILr97tOik9vXBmvyIK/aXWGBLVi8zr/UI
         wq513CnqLh9jGoKBF2dcMkYe5wwLp/W900HgiiivvQNzc0UAcGRvBp5kQLstqcYAr6IR
         loWp9XRARa0sNOQOjD6RnlCa8ovpVvZGfF5W0bj7pOljTNqsG+4dTbq2DIItaE/fgPBq
         6urgC+0n0v/1xf4EN2j+qf3+jOEMx8hthkCeDmbNjvtRWeUK6oa5Vd1GAPWJr6hOeYkD
         iEUl0+HlnQ6P6VozaLE1V4HAyGnlA+/UZTSe5AhPHyK8IY3lZiOp/awwMaDFiOZUqZV3
         qy+w==
X-Gm-Message-State: AJIora/35Sl6PfZ1flYOZ8rodxc7SjcXQCUXzzijrLGLOHubxXja31hy
	b/OjU4aoQVC1ondCSUStZ6T6hwx1MwDsWTfFROM0
X-Google-Smtp-Source: AGRyM1tUiWPuYI3f+PHbDzTskStbiQ3MpIsGOcLuxKwKHU5/CzcXhcZq8xJqeNoLxOUtwe+Fr081dMmGbtwm1CMh+B4=
X-Received: by 2002:a81:1514:0:b0:31c:a84b:350a with SMTP id
 20-20020a811514000000b0031ca84b350amr21755746ywv.400.1657571963548; Mon, 11
 Jul 2022 13:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220620201530.3929352-1-daolu@rivosinc.com>
In-Reply-To: <20220620201530.3929352-1-daolu@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 11 Jul 2022 13:39:12 -0700
Message-ID: <CAOnJCUJnN0LjADDHRSrr6R7saNxYft9BN36K5SK-2utupTGzFQ@mail.gmail.com>
Subject: Re: [PATCH v4] arch/riscv: add Zihintpause support
To: Dao Lu <daolu@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Niklas Cassel <niklas.cassel@wdc.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>, Rob Herring <robh@kernel.org>, 
	Tsukasa OI <research_trasio@irq.a4lg.com>, Yury Norov <yury.norov@gmail.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_133926_510962_4E10B434 
X-CRM114-Status: GOOD (  24.76  )
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

T24gTW9uLCBKdW4gMjAsIDIwMjIgYXQgMToxNSBQTSBEYW8gTHUgPGRhb2x1QHJpdm9zaW5jLmNv
bT4gd3JvdGU6Cj4KPiBJbXBsZW1lbnQgc3VwcG9ydCBmb3IgdGhlIFppSGludFBhdXNlIGV4dGVu
c2lvbi4KPgo+IFRoZSBQQVVTRSBpbnN0cnVjdGlvbiBpcyBhIEhJTlQgdGhhdCBpbmRpY2F0ZXMg
dGhlIGN1cnJlbnQgaGFydOKAmXMgcmF0ZQo+IG9mIGluc3RydWN0aW9uIHJldGlyZW1lbnQgc2hv
dWxkIGJlIHRlbXBvcmFyaWx5IHJlZHVjZWQgb3IgcGF1c2VkLgo+Cj4gUmV2aWV3ZWQtYnk6IEhl
aWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5l
ciA8aGVpa29Ac250ZWNoLmRlPgo+IFNpZ25lZC1vZmYtYnk6IERhbyBMdSA8ZGFvbHVAcml2b3Np
bmMuY29tPgo+IC0tLQo+Cj4gdjEgLT4gdjI6Cj4gIFJlbW92ZSB0aGUgdXNhZ2Ugb2Ygc3RhdGlj
IGJyYW5jaCwgdXNlIFBBVVNFIGlmIHRvb2xjaGFpbiBzdXBwb3J0cyBpdAo+IHYyIC0+IHYzOgo+
ICBBZGRlZCB0aGUgc3RhdGljIGJyYW5jaCBiYWNrLCBjcHVfcmVsYXgoKSBiZWhhdmlvciBpcyBr
ZXB0IHRoZSBzYW1lIGZvcgo+IHN5c3RlbXMgdGhhdCBkbyBub3Qgc3VwcG9ydCBaaUhpbnRQYXVz
ZQo+IHYzIC0+IHY0Ogo+ICBBZG9wdGVkIHRoZSBuZXdseSBhZGRlZCB1bmlmaWVkIHN0YXRpYyBr
ZXlzIGZvciBleHRlbnNpb25zCj4gLS0tCj4gIGFyY2gvcmlzY3YvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICsrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAg
ICAgICAgIHwgIDUgKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nv
ci5oIHwgMjEgKysrKysrKysrKysrKysrKysrLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5j
ICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
ICAgICAgICAgIHwgIDEgKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gv
cmlzY3YvTWFrZWZpbGUKPiBpbmRleCAzNGNmOGE1OTg2MTcuLjZkZGFjYzZmNDRiOSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+
IEBAIC01Niw2ICs1NiwxMCBAQCByaXNjdi1tYXJjaC0kKENPTkZJR19SSVNDVl9JU0FfQykgICAg
Oj0gJChyaXNjdi1tYXJjaC15KWMKPiAgdG9vbGNoYWluLW5lZWQtemljc3ItemlmZW5jZWkgOj0g
JChjYWxsIGNjLW9wdGlvbi15biwgLW1hcmNoPSQocmlzY3YtbWFyY2gteSlfemljc3JfemlmZW5j
ZWkpCj4gIHJpc2N2LW1hcmNoLSQodG9vbGNoYWluLW5lZWQtemljc3ItemlmZW5jZWkpIDo9ICQo
cmlzY3YtbWFyY2gteSlfemljc3JfemlmZW5jZWkKPgo+ICsjIENoZWNrIGlmIHRoZSB0b29sY2hh
aW4gc3VwcG9ydHMgWmloaW50cGF1c2UgZXh0ZW5zaW9uCj4gK3Rvb2xjaGFpbi1zdXBwb3J0cy16
aWhpbnRwYXVzZSA6PSAkKGNhbGwgY2Mtb3B0aW9uLXluLCAtbWFyY2g9JChyaXNjdi1tYXJjaC15
KV96aWhpbnRwYXVzZSkKPiArcmlzY3YtbWFyY2gtJCh0b29sY2hhaW4tc3VwcG9ydHMtemloaW50
cGF1c2UpIDo9ICQocmlzY3YtbWFyY2gteSlfemloaW50cGF1c2UKPiArCj4gIEtCVUlMRF9DRkxB
R1MgKz0gLW1hcmNoPSQoc3Vic3QgZmQsLCQocmlzY3YtbWFyY2gteSkpCj4gIEtCVUlMRF9BRkxB
R1MgKz0gLW1hcmNoPSQocmlzY3YtbWFyY2gteSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBp
bmRleCBlNDhlZWJkZDI2MzEuLmRjNDcwMTlhMGIzOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmgKPiBAQCAtOCw2ICs4LDcgQEAKPiAgI2lmbmRlZiBfQVNNX1JJU0NWX0hXQ0FQX0gKPiAgI2Rl
ZmluZSBfQVNNX1JJU0NWX0hXQ0FQX0gKPgo+ICsjaW5jbHVkZSA8YXNtL2Vycm5vLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4gICNpbmNsdWRlIDx1YXBpL2FzbS9od2NhcC5oPgo+Cj4g
QEAgLTU0LDYgKzU1LDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgZWxmX2h3Y2FwOwo+ICBlbnVt
IHJpc2N2X2lzYV9leHRfaWQgewo+ICAgICAgICAgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiA9IFJJ
U0NWX0lTQV9FWFRfQkFTRSwKPiAgICAgICAgIFJJU0NWX0lTQV9FWFRfU1ZQQk1ULAo+ICsgICAg
ICAgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKPiAgICAgICAgIFJJU0NWX0lTQV9FWFRfSURf
TUFYID0gUklTQ1ZfSVNBX0VYVF9NQVgsCj4gIH07Cj4KPiBAQCAtNjQsNiArNjYsNyBAQCBlbnVt
IHJpc2N2X2lzYV9leHRfaWQgewo+ICAgKi8KPiAgZW51bSByaXNjdl9pc2FfZXh0X2tleSB7Cj4g
ICAgICAgICBSSVNDVl9JU0FfRVhUX0tFWV9GUFUsICAgICAgICAgIC8qIEZvciAnRicgYW5kICdE
JyAqLwo+ICsgICAgICAgUklTQ1ZfSVNBX0VYVF9LRVlfWklISU5UUEFVU0UsCj4gICAgICAgICBS
SVNDVl9JU0FfRVhUX0tFWV9NQVgsCj4gIH07Cj4KPiBAQCAtODMsNiArODYsOCBAQCBzdGF0aWMg
X19hbHdheXNfaW5saW5lIGludCByaXNjdl9pc2FfZXh0MmtleShpbnQgbnVtKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gUklTQ1ZfSVNBX0VYVF9LRVlfRlBVOwo+ICAgICAgICAgY2FzZSBSSVND
Vl9JU0FfRVhUX2Q6Cj4gICAgICAgICAgICAgICAgIHJldHVybiBSSVNDVl9JU0FfRVhUX0tFWV9G
UFU7Cj4gKyAgICAgICBjYXNlIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0U6Cj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBSSVNDVl9JU0FfRVhUX0tFWV9aSUhJTlRQQVVTRTsKPiAgICAgICAgIGRl
ZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAgfQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPiBpbmRleCAxMzQzODhjYmFhYTEu
LjFlNGY4YjRhZWY3OSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28v
cHJvY2Vzc29yLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29y
LmgKPiBAQCAtNCwxNSArNCwzMCBAQAo+Cj4gICNpZm5kZWYgX19BU1NFTUJMWV9fCj4KPiArI2lu
Y2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4KPiAgI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4g
KyNpbmNsdWRlIDxhc20vaHdjYXAuaD4KPgo+ICBzdGF0aWMgaW5saW5lIHZvaWQgY3B1X3JlbGF4
KHZvaWQpCj4gIHsKPiArICAgICAgIGlmICghc3RhdGljX2JyYW5jaF9saWtlbHkoJnJpc2N2X2lz
YV9leHRfa2V5c1tSSVNDVl9JU0FfRVhUX0tFWV9aSUhJTlRQQVVTRV0pKSB7Cj4gICNpZmRlZiBf
X3Jpc2N2X211bGRpdgo+IC0gICAgICAgaW50IGR1bW15Owo+IC0gICAgICAgLyogSW4gbGlldSBv
ZiBhIGhhbHQgaW5zdHJ1Y3Rpb24sIGluZHVjZSBhIGxvbmctbGF0ZW5jeSBzdGFsbC4gKi8KPiAt
ICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgiZGl2ICUwLCAlMCwgemVybyIgOiAiPXIiIChk
dW1teSkpOwo+ICsgICAgICAgICAgICAgICBpbnQgZHVtbXk7Cj4gKyAgICAgICAgICAgICAgIC8q
IEluIGxpZXUgb2YgYSBoYWx0IGluc3RydWN0aW9uLCBpbmR1Y2UgYSBsb25nLWxhdGVuY3kgc3Rh
bGwuICovCj4gKyAgICAgICAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgiZGl2ICUwLCAl
MCwgemVybyIgOiAiPXIiIChkdW1teSkpOwo+ICAjZW5kaWYKPiArICAgICAgIH0gZWxzZSB7Cj4g
KyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIFJlZHVjZSBpbnN0cnVjdGlv
biByZXRpcmVtZW50Lgo+ICsgICAgICAgICAgICAgICAgKiBUaGlzIGFzc3VtZXMgdGhlIFBDIGNo
YW5nZXMuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsjaWZkZWYgX19yaXNjdl96aWhpbnRwYXVz
ZQo+ICsgICAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoInBhdXNlIik7Cj4gKyNl
bHNlCj4gKyAgICAgICAgICAgICAgIC8qIEVuY29kaW5nIG9mIHRoZSBwYXVzZSBpbnN0cnVjdGlv
biAqLwo+ICsgICAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoIi40Ynl0ZSAweDEw
MDAwMEYiKTsKPiArI2VuZGlmCj4gKyAgICAgICB9Cj4gICAgICAgICBiYXJyaWVyKCk7Cj4gIH0K
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdS5jCj4gaW5kZXggZmJhOWU5ZjQ2YThjLi5hMTIzZTkyYjE0ZGQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUu
Ywo+IEBAIC04OSw2ICs4OSw3IEBAIGludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSkKPiAgc3RhdGljIHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgaXNh
X2V4dF9hcnJbXSA9IHsKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBS
SVNDVl9JU0FfRVhUX1NTQ09GUE1GKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2
cGJtdCwgUklTQ1ZfSVNBX0VYVF9TVlBCTVQpLAo+ICsgICAgICAgX19SSVNDVl9JU0FfRVhUX0RB
VEEoemloaW50cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAo+ICAgICAgICAgX19S
SVNDVl9JU0FfRVhUX0RBVEEoIiIsIFJJU0NWX0lTQV9FWFRfTUFYKSwKPiAgfTsKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPiBpbmRleCAxYjNlYzQ0ZTI1ZjUuLjcwOGRmMmMwYmMzNCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtMTk4LDYgKzE5OCw3IEBAIHZvaWQgX19pbml0IHJp
c2N2X2ZpbGxfaHdjYXAodm9pZCkKPiAgICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VUX0lTQV9FWFRfTUFQKCJzc2NvZnBt
ZiIsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgU0VUX0lTQV9FWFRfTUFQKCJzdnBibXQiLCBSSVNDVl9JU0FfRVhUX1NWUEJNVCk7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAoInppaGludHBh
dXNlIiwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSk7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgfQo+ICAjdW5kZWYgU0VUX0lTQV9FWFRfTUFQCj4gICAgICAgICAgICAgICAgIH0KPiAtLQo+
IDIuMjUuMQo+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3Np
bmMuY29tPgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
