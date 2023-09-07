Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74745EC8727
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 13:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E8PsISULeFQW6G3RlUbPWBwrObMrt9Pe4NKnmdejHfQ=; b=WVdLeEEzmzAZ3+
	WULYBgxkyvmI+96UV8qxcoHQuIukbxQ0Z0j52p1SICHNAFke0/2StPHaJwk/0XDHbbTCSWU0PGJ5V
	Cgg6y3ccY9rIPB6FapxpgyaSWIzaeFtQrrXGNLQrOiMISQiRgq4MWmlJHmUNyCqWfxWCrLcMyaJeR
	KtXNEZp12HBjeN/dK3ZWOGf0hUN8pJuWRy91Q7m/GGKyzYh/lvLCb6KHbL67HsVPF4SzwlqlmY4mG
	az0HtIZVRK92WmO7EP1kMc1kl5zaQ+Q2yp5VJ5u+SSqPxZVcz8lW7brVeiibh1A6j8VXob+XBZNZm
	PE/kVxf/V5gpakBmqDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeEj1-00C7Pr-1S;
	Thu, 07 Sep 2023 13:07:11 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeEiy-00C7Os-1i
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 13:07:10 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so16882311fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 06:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1694092024; x=1694696824; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlqiYu4W6Rw8b3OUfLdEXFPD32dWiZ3Dy4bMwhxUd4E=;
        b=sy5mvrsRbhAwKj+wijfo//JJ12quuXjC8rnbE2K8HmrA57ByF4RTluhZJp4wUd4avL
         9V94mY0M3IGCnLtqVeJAXoxvlvmzPSIpzLnNKj8RWBBTz6nba+gYOk0h3T4fFCNBqkrd
         vvKdh2pCPPQgQ+ATa3RMs8x01hqDR5Zytc0p8VnRJjHaxUy0vvjctkNNPOUvhrVWRzai
         S2Rg07EW0TmfaBlMX6+qOLt12WQe3Ie2tWS8muy3ING8vR1pF9L4qFQsji7QFxbg4dPG
         Pt8DE3EaQ+knaY6SQCU9ZM1TkSy/CoPCIVt3UKBj0dRqDlqbGX1zckluSUkLxbuAycVg
         eY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694092024; x=1694696824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlqiYu4W6Rw8b3OUfLdEXFPD32dWiZ3Dy4bMwhxUd4E=;
        b=C+2w4WNFsrpQzPFTy78c0DyzXeCalEigWztTJe059Ei8xtVKIsElRZCzfwrtiUhFn1
         N3YPyGWrkuYqUUjCBoeKpymRzR6OixaxJU35LoFrGreIEZImMeRqZMvhwQrcZLHqqSeU
         YEARNyXf5y3XZ73AMDc/fd5aC0Z8jsvNz6pi9I9IhBhhNUdgN9kym8KZbqksl8ZzmYTX
         s7P9ZgcWrUMkKGB4aUYHNs0YIKOd3VGG/0psD/kheRoPankXSq74Hdr00+gdxl1isRjy
         fFOA0LW9uI2+g2LfbfSZT6+oLrId78Mp0mLtwA8pHQ2XurX/6NCuOnwPHrKEQUTT2p2F
         RnUw==
X-Gm-Message-State: AOJu0Yz4Z8HbpqGxNaeq2OrgsorHHKaYVa80qMQBascapj7JlMB6cPNw
	hrKpbfpS1GpsT1/D7jb1wPa1m7jlDy8wXnHF5K3C4A==
X-Google-Smtp-Source: AGHT+IFZKvLvDrcUUt1AdJGgmJG9It2BwH1JwdrdkbJnayvU4ppYimD21mX/yyhLW9K0tMnO6jb+LUunyIXhKsgJQIw=
X-Received: by 2002:a05:6512:706:b0:4f8:62a6:8b2 with SMTP id
 b6-20020a056512070600b004f862a608b2mr4812176lfs.46.1694092023638; Thu, 07 Sep
 2023 06:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230907021635.1002738-1-peterlin@andestech.com> <20230907021635.1002738-3-peterlin@andestech.com>
In-Reply-To: <20230907021635.1002738-3-peterlin@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 Sep 2023 18:36:52 +0530
Message-ID: <CAAhSdy0iy_7-XaE0s97J8jUESUzV-4BMsxsJ8QFNDyHgtv63ZA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] irqchip/riscv-intc: Support large non-standard
 hwirq number
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, atishp@atishpatra.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, ajones@ventanamicro.com, 
	heiko@sntech.de, samuel@sholland.org, geert+renesas@glider.be, 
	n.shubin@yadro.com, dminus@andestech.com, ycliang@andestech.com, 
	tim609@andestech.com, locus84@andestech.com, dylan@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_060708_655528_004210A5 
X-CRM114-Status: GOOD (  22.22  )
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

T24gVGh1LCBTZXAgNywgMjAyMyBhdCA3OjQ44oCvQU0gWXUgQ2hpZW4gUGV0ZXIgTGluCjxwZXRl
cmxpbkBhbmRlc3RlY2guY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgdGhlIGltcGxlbWVudGF0
aW9uIG9mIHRoZSBSSVNDLVYgSU5UQyBkcml2ZXIgdXNlcyB0aGUKPiBpbnRlcnJ1cHQgY2F1c2Ug
YXMgaHdpcnEgYW5kIGhhcyBhIGxpbWl0YXRpb24gb2Ygc3VwcG9ydGluZyBhCj4gbWF4aW11bSBv
ZiA2NCBod2lycXMuIEhvd2V2ZXIsIGFjY29yZGluZyB0byB0aGUgcHJpdmlsZWdlZCBzcGVjLAo+
IGludGVycnVwdCBjYXVzZSA+PSAxNiBhcmUgZGVmaW5lZCBmb3IgcGxhdGZvcm0gdXNlLgo+Cj4g
VGhpcyBsaW1pdGF0aW9uIHByZXZlbnRzIHVzIGZyb20gZnVsbHkgdXRpbGl6aW5nIHRoZSBhdmFp
bGFibGUKPiBsb2NhbCBpbnRlcnJ1cHQgc291cmNlcy4gQWRkaXRpb25hbGx5LCB0aGUgaHdpcnFz
IHVzZWQgb24gUklTQy1WCj4gYXJlIHNwYXJzZSwgd2l0aCBvbmx5IGludGVycnVwdCBudW1iZXJz
IDEsIDUgYW5kIDkgKHBsdXMgU3Njb2ZwbWYKPiBvciBULUhlYWQncyBQTVUgaXJxKSBiZWluZyBj
dXJyZW50bHkgdXNlZCBmb3Igc3VwZXJ2aXNvciBtb2RlLgo+Cj4gVGhlIHBhdGNoIHN3aXRjaGVz
IHRvIHVzaW5nIGlycV9kb21haW5fY3JlYXRlX3RyZWUoKSB3aGljaAo+IGNyZWF0ZXMgdGhlIHJh
ZGl4IHRyZWUgbWFwLCBhbGxvd2luZyB1cyB0byBoYW5kbGUgYSBsYXJnZXIKPiBudW1iZXIgb2Yg
aHdpcnFzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBh
bmRlc3RlY2guY29tPgo+IFJldmlld2VkLWJ5OiBDaGFybGVzIENpLUp5dW4gV3UgPGRtaW51c0Bh
bmRlc3RlY2guY29tPgo+IFJldmlld2VkLWJ5OiBMZW8gWXUtQ2hpIExpYW5nIDx5Y2xpYW5nQGFu
ZGVzdGVjaC5jb20+Cj4KPiAtLS0KPiBUaGVyZSBhcmUgMyBod2lycXMgb2YgbG9jYWwgaW50ZXJy
dXB0IHNvdXJjZSBleGNlZWQgNjQgZGVmaW5lZCBpbgo+IEFYNDVNUCBkYXRhc2hlZXQgWzFdIFRh
YmxlIDU2OiBBWDQ1TVAtMUMgc2NhdXNlIFZhbHVlIEFmdGVyIFRyYXA6Cj4gLSAyNTYrMTYgU2xh
dmUgcG9ydCBFQ0MgZXJyb3IgaW50ZXJydXB0IChTLW1vZGUpCj4gLSAyNTYrMTcgQnVzIHdyaXRl
IHRyYW5zYWN0aW9uIGVycm9yIGludGVycnVwdCAoUy1tb2RlKQo+IC0gMjU2KzE4IFBlcmZvcm1h
bmNlIG1vbml0b3Igb3ZlcmZsb3cgaW50ZXJydXB0KFMtbW9kZSkKPgo+IFsxXSBodHRwOi8vd3d3
LmFuZGVzdGVjaC5jb20vd3AtY29udGVudC91cGxvYWRzL0FYNDVNUC0xQy1SZXYuLTUuMC4wLURh
dGFzaGVldC5wZGYKPiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgfCAx
MCArKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMg
Yi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+IGluZGV4IDRhZGVlZTFiYzM5MS4u
NzZlMTIyOWM0NWRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50
Yy5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiBAQCAtMjQsOCAr
MjQsOCBAQCBzdGF0aWMgYXNtbGlua2FnZSB2b2lkIHJpc2N2X2ludGNfaXJxKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQo+ICB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGNhdXNlID0gcmVncy0+Y2F1
c2UgJiB+Q0FVU0VfSVJRX0ZMQUc7Cj4KPiAtICAgICAgIGlmICh1bmxpa2VseShjYXVzZSA+PSBC
SVRTX1BFUl9MT05HKSkKPiAtICAgICAgICAgICAgICAgcGFuaWMoInVuZXhwZWN0ZWQgaW50ZXJy
dXB0IGNhdXNlIik7Cj4gKyAgICAgICBpZiAoIWlycV9maW5kX21hcHBpbmcoaW50Y19kb21haW4s
IGNhdXNlKSkKPiArICAgICAgICAgICAgICAgcGFuaWMoInVuZXhwZWN0ZWQgaW50ZXJydXB0IGNh
dXNlOiAlbGQiLCBjYXVzZSk7CgpDaGVja2luZyBpcnFfZmluZF9tYXBwaW5nKCkgaXMgcmVkdW5k
YW50IGhlcmUgaW5zdGVhZCBjaGVjayB0aGUgcmV0dXJuCnZhbHVlIG9mIGdlbmVyaWNfaGFuZGxl
X2RvbWFpbl9pcnEoKSBhbmQgcHJpbnQgd2FybmluZyBvbiBlcnJvci4KCj4KPiAgICAgICAgIGdl
bmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEoaW50Y19kb21haW4sIGNhdXNlKTsKPiAgfQo+IEBAIC0x
MTcsOCArMTE3LDggQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihz
dHJ1Y3QgZndub2RlX2hhbmRsZSAqZm4pCj4gIHsKPiAgICAgICAgIGludCByYzsKPgo+IC0gICAg
ICAgaW50Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV9saW5lYXIoZm4sIEJJVFNfUEVSX0xP
TkcsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcmlz
Y3ZfaW50Y19kb21haW5fb3BzLCBOVUxMKTsKPiArICAgICAgIGludGNfZG9tYWluID0gaXJxX2Rv
bWFpbl9jcmVhdGVfdHJlZShmbiwgJnJpc2N2X2ludGNfZG9tYWluX29wcywKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKTsKClRoaXMgaXMgaW5jb21w
bGV0ZSBiZWNhdXNlIHlvdSBoYXZlIGFkZGl0aW9uYWwgY3VzdG9taXphdGlvbiBvbi10b3Atb2YK
dmFuaWxsYSBSSVNDLVYgSU5UQy4KCkkgc3VnZ2VzdCB0byBkbyB0aGUgZm9sbG93aW5nOgoxKSBE
ZWZpbmUgYW4gZW51bSBvZiB0eXBlcyBvZiBJTlRDIChzdWNoIGFzIGdlbmVyaWMsIGFuZGVzdGVj
aCwgZXRjKQoyKSBEZWZpbmUgbmV3IGNvbXBhdGlibGUgc3RyaW5nICJhbmRlc3RlYyxjcHUtaW50
YyIgZm9yIHlvdSBjdXN0b20gSU5UQwogICAgYW5kIHBhc3MgdGhhdCBpbmZvcm1hdGlvbiB0byBy
aXNjdl9pbnRjX2luaXRfY29tbW9uKCkKMykgRXh0ZW5kIHJpc2N2X2ludGNfZG9tYWluX21hcCgp
IHRvIHVzZSBjdXN0b20gYW5kZXN0ZWNoX2ludGNfY2hpcAogICAgZm9yIHRoZSBjdXN0b20gbG9j
YWwgaXJxcy4gVGhlIGFuZGVzdGVjaF9pbnRjX2NoaXAgd2lsbCBwcm92aWRlIGFuZGVzCiAgICBz
cGVjaWZpYyBtYXNrL3VubWFzayBtZWNoYW5pc20uCgo+ICAgICAgICAgaWYgKCFpbnRjX2RvbWFp
bikgewo+ICAgICAgICAgICAgICAgICBwcl9lcnIoInVuYWJsZSB0byBhZGQgSVJRIGRvbWFpblxu
Iik7Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5YSU87Cj4gQEAgLTEzMiw4ICsxMzIsNiBA
QCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2luaXRfY29tbW9uKHN0cnVjdCBmd25vZGVf
aGFuZGxlICpmbikKPgo+ICAgICAgICAgcmlzY3Zfc2V0X2ludGNfaHdub2RlX2ZuKHJpc2N2X2lu
dGNfaHdub2RlKTsKPgo+IC0gICAgICAgcHJfaW5mbygiJWQgbG9jYWwgaW50ZXJydXB0cyBtYXBw
ZWRcbiIsIEJJVFNfUEVSX0xPTkcpOwo+IC0KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAt
LQo+IDIuMzQuMQo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
