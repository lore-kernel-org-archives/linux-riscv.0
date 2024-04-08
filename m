Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C09C67861
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 03:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vW1OiD3eYcVl7yKwLKs9AJn7hSTp5NnqWeJSOdmhU4c=; b=xlAiXtIv6UNQjK
	bHllqX5akQs12FGiscN0AitNFkfak7s65PJNKJRqpkVHyZsIrCxZmebX//aO0Zd6+5B/+yzMuALOt
	BBb5f2E9+fS9evBl7aBQjXL2vqAHF2E2HyPCpM91J459BLOW8cR+/E/0xPuN8W/n2V5Xz7yrA3wPH
	FBHplRB4CF5Lbl2igmYZNgFqX5v8bGC4/wvcHbttjNu+H3+pX5Vma/zLVaUjrc9ny5dLNCNp2LBk5
	V5fYhaHov1Sru7N8ACFlJfT5CyLatmIBSyksrZoa6OSIiOoWzz7zH/2e+6Mgl+iLbgM1UIAbcwTj+
	7/hf8QNnzptSrrlEBHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtg82-0000000EFIN-0Zmz;
	Mon, 08 Apr 2024 03:57:06 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtg7x-0000000EFHI-3bEe
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 03:57:03 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5a9d93ed063so1460697eaf.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2024 20:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712548619; x=1713153419; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5nAgfNYfB0Z+mfrRK2mpFihZrCx/GK87TdIEbmr9Oo=;
        b=d9abM4NVxk2gNBq+AhLKJeKs4PnOo6hnUCikd3yurSXMRe0XNiouZXmbaGKcuLXGp9
         qH18x3z4t8nu1mM/fj8eWa5oNhRMOZyNIIlI955VkOvEyqFM/TIX/AfhbEvLPQ4GL8Cu
         3PzZLqM7gOAqTeg/mK4Y/a1U1OYig5B0dMT7UxibIRFzOzXQCdcwKRBe9ehOZkDEL0Qp
         dyaYorkhX+jw5I2PILatUlm+idfySsqDBjEWg77GyPkUAP+75ty4P6VX4gWNlVKZdC6F
         V71jiCqhcYNIErI4WBsye8UaCAYrg6ecHpWXryo+hKNcpK1VQNwOPNNwL+x9xTl3ceha
         +/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712548619; x=1713153419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5nAgfNYfB0Z+mfrRK2mpFihZrCx/GK87TdIEbmr9Oo=;
        b=hzMjxKq9p8vzefBmVPi08SyOVfpf7cFAbaxac9g9PkxkoDH3SIaVjNwaRH/ZE7bwYf
         ca+4lrg6qZI3u/NG9g5DNMpUMlRGoMNkr/+T2iMmDMn6W/ZihKmejZbwYFhlBqsZfsuF
         im5oIG99RF2xcF18rDYTyLwPE/RgmyYmyfVUsgilj5wVYN4Itq3/0FGVTS4w9Y/MNdoZ
         A2Kq1soBZ1eCrqq/ZcweaFD53fBsAznVFJ4hOmyUk7L0JKJdHTcqEjw/5DAu3EJJnVmd
         ChiFTPTnRu+CZsGR3OjSMoyqv7GAE6tPDnE9Jdrh2nUa4L3Pk5qnl04xA3R6PRi+orE/
         cTpg==
X-Gm-Message-State: AOJu0Yxf49acTWOR8oxjeRi8vUOQQxkSx9+yQEw+rSDhU/YCn/SUtOgv
	+09CF5OxMWQPTw7fvZRdAiS0qHkpEI9DQ3eAuaDIGWrsN6jP7+yoZ/09R6kTc6v7qkjdH3NHLju
	vJpCcy3Qpsf6PKi33FdCkCBolfgvqxjSc0nUHoQ==
X-Google-Smtp-Source: AGHT+IE/Ou7t3VMQvqKVwCYFU5LDxOSJd7+j4C4rAo22QszPPaWs4HaP202BhM7lGz72M31bL/UZ1n8l4wATZmU98dk=
X-Received: by 2002:a05:6820:619:b0:5aa:a8f:e4b1 with SMTP id
 e25-20020a056820061900b005aa0a8fe4b1mr2603089oow.4.1712548619015; Sun, 07 Apr
 2024 20:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240326101054.13088-1-yongxuan.wang@sifive.com> <CAAhSdy1EOyzg+Sdx5-uJJqFipehde+zGic8jNnnTXBEj7k4P3g@mail.gmail.com>
In-Reply-To: <CAAhSdy1EOyzg+Sdx5-uJJqFipehde+zGic8jNnnTXBEj7k4P3g@mail.gmail.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 8 Apr 2024 11:56:50 +0800
Message-ID: <CAMWQL2j_cca2nSerhQKVZYRu-pOQmFzxUaGmi8gbE5GFb8=oqA@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: KVM: Avoid lock inversion in SBI_EXT_HSM_HART_START
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_205702_179036_11E4A445 
X-CRM114-Status: GOOD (  26.10  )
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

SGkgQW51cCwKCk9uIFR1ZSwgQXByIDIsIDIwMjQgYXQgMTE6NDjigK9BTSBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWFyIDI2LCAyMDI0IGF0IDM6
NDHigK9QTSBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPiB3cm90ZToK
PiA+Cj4gPiBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2xvY2tpbmcucnN0IGFkdmlzZXMgdGhhdCBr
dm0tPmxvY2sgc2hvdWxkIGJlCj4gPiBhY3F1aXJlZCBvdXRzaWRlIHZjcHUtPm11dGV4IGFuZCBr
dm0tPnNyY3UuIEhvd2V2ZXIsIHdoZW4gS1ZNL1JJU0MtVgo+ID4gaGFuZGxpbmcgU0JJX0VYVF9I
U01fSEFSVF9TVEFSVCwgdGhlIGxvY2sgb3JkZXJpbmcgaXMgdmNwdS0+bXV0ZXgsCj4gPiBrdm0t
PnNyY3UgdGhlbiBrdm0tPmxvY2suCj4gPgo+ID4gQWx0aG91Z2ggdGhlIGxvY2tkZXAgY2hlY2tp
bmcgbm8gbG9uZ2VyIGNvbXBsYWlucyBhYm91dCB0aGlzIGFmdGVyIGNvbW1pdAo+ID4gZjBmNDQ3
NTJmNWY2ICgicmN1OiBBbm5vdGF0ZSBTUkNVJ3MgdXBkYXRlLXNpZGUgbG9ja2RlcCBkZXBlbmRl
bmNpZXMiKSwKPiA+IGl0J3MgbmVjZXNzYXJ5IHRvIHJlcGxhY2Uga3ZtLT5sb2NrIHdpdGggYSBu
ZXcgZGVkaWNhdGVkIGxvY2sgdG8gZW5zdXJlCj4gPiBvbmx5IG9uZSBoYXJ0IGNhbiBleGVjdXRl
IHRoZSBTQklfRVhUX0hTTV9IQVJUX1NUQVJUIGNhbGwgZm9yIHRoZSB0YXJnZXQKPiA+IGhhcnQg
c2ltdWx0YW5lb3VzbHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlv
bmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaCB8IDEgKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAg
ICB8IDEgKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jICAgICB8IDUgKystLS0K
PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gPiBpbmRleCA0ODRkMDRhOTJmYTYuLjUz
NzA5OTQxMzM0NCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gPiBAQCAt
MjU0LDYgKzI1NCw3IEBAIHN0cnVjdCBrdm1fdmNwdV9hcmNoIHsKPiA+Cj4gPiAgICAgICAgIC8q
IFZDUFUgcG93ZXItb2ZmIHN0YXRlICovCj4gPiAgICAgICAgIGJvb2wgcG93ZXJfb2ZmOwo+ID4g
KyAgICAgICBzdHJ1Y3QgbXV0ZXggaHNtX3N0YXJ0X2xvY2s7Cj4KPiBJbnN0ZWFkIG9mIGEgbXV0
ZXggaHNtX3N0YXJ0X2xvY2ssIGxldCdzIGludHJvZHVjZSBzcGlubG9jayBtcF9zdGF0ZV9sb2Nr
Cj4gd2hpY2ggbmVlZHMgdG8gYmUgdGFrZW4gd2hlbmV2ZXIgcG93ZXJfb2ZmIGlzIGFjY2Vzc2Vk
LiBBbHNvLCB3ZSBzaG91bGQKPiByZW5hbWUgInBvd2VyX29mZiIgdG8gIm1wX3N0YXRlIiB3aXRo
IHR3byBwb3NzaWJsZSB2YWx1ZXMuCj4KPiA+Cj4gPiAgICAgICAgIC8qIERvbid0IHJ1biB0aGUg
VkNQVSAoYmxvY2tlZCkgKi8KPiA+ICAgICAgICAgYm9vbCBwYXVzZTsKPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiA+IGluZGV4
IGI1Y2E5ZjJlOThhYy4uNGQ4OWI1YjVhZmJmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiA+IEBAIC0xMTksNiAr
MTE5LDcgQEAgaW50IGt2bV9hcmNoX3ZjcHVfY3JlYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
PiA+ICAgICAgICAgc3Bpbl9sb2NrX2luaXQoJnZjcHUtPmFyY2guaGZlbmNlX2xvY2spOwo+ID4K
PiA+ICAgICAgICAgLyogU2V0dXAgcmVzZXQgc3RhdGUgb2Ygc2hhZG93IFNTVEFUVVMgYW5kIEhT
VEFUVVMgQ1NScyAqLwo+ID4gKyAgICAgICBtdXRleF9pbml0KCZ2Y3B1LT5hcmNoLmhzbV9zdGFy
dF9sb2NrKTsKPiA+ICAgICAgICAgY250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0X2NvbnRl
eHQ7Cj4gPiAgICAgICAgIGNudHgtPnNzdGF0dXMgPSBTUl9TUFAgfCBTUl9TUElFOwo+ID4gICAg
ICAgICBjbnR4LT5oc3RhdHVzID0gMDsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9oc20uYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jCj4gPiBpbmRleCA3
ZGNhMGU5MzgxZDkuLmI1MjhmNmU4ODBhZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpX2hzbS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYwo+
ID4gQEAgLTcxLDE0ICs3MSwxMyBAQCBzdGF0aWMgaW50IGt2bV9zYmlfZXh0X2hzbV9oYW5kbGVy
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiA+ICB7Cj4gPiAg
ICAgICAgIGludCByZXQgPSAwOwo+ID4gICAgICAgICBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpj
cCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQ7Cj4gPiAtICAgICAgIHN0cnVjdCBrdm0gKmt2
bSA9IHZjcHUtPmt2bTsKPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBmdW5jaWQgPSBjcC0+YTY7
Cj4gPgo+ID4gICAgICAgICBzd2l0Y2ggKGZ1bmNpZCkgewo+ID4gICAgICAgICBjYXNlIFNCSV9F
WFRfSFNNX0hBUlRfU1RBUlQ6Cj4gPiAtICAgICAgICAgICAgICAgbXV0ZXhfbG9jaygma3ZtLT5s
b2NrKTsKPiA+ICsgICAgICAgICAgICAgICBtdXRleF9sb2NrKCZ2Y3B1LT5hcmNoLmhzbV9zdGFy
dF9sb2NrKTsKPiA+ICAgICAgICAgICAgICAgICByZXQgPSBrdm1fc2JpX2hzbV92Y3B1X3N0YXJ0
KHZjcHUpOwo+ID4gLSAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygma3ZtLT5sb2NrKTsKPiA+
ICsgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJnZjcHUtPmFyY2guaHNtX3N0YXJ0X2xvY2sp
Owo+Cj4gVGhlIHVzZSBvZiBrdm0tPmxvY2sgb3ZlciBoZXJlIHdhcyBhbHNvIHByb3RlY3RpbmcK
PiBzaW11bHRhbmVvdXMgdXBkYXRlcyB0byBWQ1BVIHJlc2V0IGNvbnRleHQuIEl0J3MgYmV0dGVy
Cj4gdG8gaW50cm9kdWNlIGEgc2VwYXJhdGUgbG9jayBmb3IgcHJvdGVjdGluZyBWQ1BVIHJlc2V0
Cj4gY29udGV4dCBhY2Nlc3MuCj4KPiA+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAg
ICAgY2FzZSBTQklfRVhUX0hTTV9IQVJUX1NUT1A6Cj4gPiAgICAgICAgICAgICAgICAgcmV0ID0g
a3ZtX3NiaV9oc21fdmNwdV9zdG9wKHZjcHUpOwo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KPgo+IEkg
dGhpbmsgdGhpcyBwYXRjaCBjYW4gYmUgYnJva2VuIGRvd24gaW50byB0d28gcGF0Y2hlczoKPiAx
KSBQYXRjaCByZXBsYWNpbmcgVkNQVSAicG93ZXJfb2ZmIiB3aXRoICJlbnVtIG1wX3N0YXRlIgo+
ICAgICBhbmQgaW50cm9kdWNpbmcgIm1wX3N0YXRlX2xvY2siCj4gMikgUGF0Y2ggaW50cm9kdWNp
bmcgVkNQVSByZXNldCBjb250ZXh0IGxvY2sKPgo+IFJlZ2FyZHMsCj4gQW51cAoKR290IGl0ISBJ
IHdpbGwgdXBkYXRlIHRoZXNlIGluIGEgbmV3IHBhdGNoc2V0LiBUaGFuayB5b3UhCgpSZWdhcmRz
LApZb25nLVh1YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
