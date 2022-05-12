Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5100BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 17:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFyWeysuz0yU+ORDsL4wxf01zjXeM7YNGxNU322GoeQ=; b=XSzTjTmSsCSq9l
	k5Sa4UZURxkeQGADQkViLCdN9/3l7nOuFFp7tJoehBW6K2tpRnFpGsE62cYl3OC3w7q33NX3teRcL
	0X0fL3tobIPIjwNZM6xiSsm5z8kNb6WTGHQTJvTRUaj7DLa0Ada3vpOToAn52ZB457WE4zU23SdF/
	h1/mrnjWOqEPmLdOjVm6iuyAEFmfFM/mtNZtqqKGOdIpAuIJrm9tDD87QIpU7RvLHGPpVNlzLkY3Z
	I1Ko5m2P3GCgyno6FT9J30T/WhBeC74eZGrojo3c8ifrVPMjwrUn0osL2CUNAkjL6URotI77RSGUl
	asWYZGuMstPLOHUXp5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npCVz-00Cwkp-RP; Thu, 12 May 2022 17:22:15 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npCVx-00Cwim-6r
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 17:22:14 +0000
Received: by mail-lj1-x233.google.com with SMTP id t25so7356562ljd.6
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k5uBtUuVEeyc/uDRq1ERjuwGFNzbvMoQDv2ORcXlb34=;
 b=zSde4TismK45+H65/WKteA+kIU8dYdT5m6nUNBnPGE10a/oyMx9hE8U3rDy16Xu1eQ
 5vWYkxU0GKQp6i6p6DMtPshoptRmUTYUYsUWN/vePrAPF5fClSkzPdwBZGYs4dzlulKF
 3mg7REuBmBQrPAJsvOPivBw3HuAXK9PIwQRoVEmM2bXYJers3CHKHzuva4OQ6cAW80Vw
 Hatmw/L8aLsB4rJ8IyF4OGEEf3na/ogfoTln7b/NDIDnoVAmREbxmA1FdstbMiU8i3WQ
 iFXW3Qb62yRy+N0sGcJo7YJR4i0sfyNVx9bND0XVIZ8BhwvhFJ9lFaz/4QJt43NMNFq/
 hRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k5uBtUuVEeyc/uDRq1ERjuwGFNzbvMoQDv2ORcXlb34=;
 b=al5AAT/doAk3/0gy5TBJ+mJlaJTGk7iBVIP4lU8mVJIwd5DEUbLZgXrIJSPTvz4aUD
 6m6Tl72JfM0lBm/OI9WSsBs5473AvItsNmxL/nyBxwiX9Yzw7cqB/McJ0sxgqmo33i9z
 wNicB0yiin7Nh5aPZAVm5sU9+i7XS9RRDY4KeOgI+m8HIWmL/jqPuZCs903P81aP0BR5
 HY3hx2fF1zGFB/++aXWno1kgRe25DCdYDk337JEVT4uMFRrPnL0cbY860hIOiF+8FxzQ
 i1WQ+ELwUDppAqaD4nBKwGVqPP7wy/wITbjQbut2CoLKgtJARtR6LXI/5dr6Wz9qLmwW
 YdoA==
X-Gm-Message-State: AOAM531GuQwHF/MHvy1XFdMM3RfvZeZBI0ei+KIbnfpeSwH3paHpy/ct
 eMeZh5+UexZDhyo5WFGxSrL25Apxmdhz1gyMSgEFG4nCoYgWqg==
X-Google-Smtp-Source: ABdhPJwRQYyKvWXSdO1RUyMSIOChIO0JcTz2B2sJ96JajpdlrOav1FcCfG0mrPRe+zl3iw+NxE/6pYCDfEEZBBurGtA=
X-Received: by 2002:a2e:82c5:0:b0:247:e81f:8b02 with SMTP id
 n5-20020a2e82c5000000b00247e81f8b02mr644883ljh.90.1652376128189; Thu, 12 May
 2022 10:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220511201107.2311757-1-atishp@rivosinc.com>
 <CAAhSdy3mbGdK9LrLxZX0JL0mQxP5FrFUuneX1cQS2SABpO=7dw@mail.gmail.com>
 <23274575.ouqheUzb2q@diego>
 <CAAhSdy3t6cnfR02kfHvnKdCcDPvyX4jwccV7qkR_=-dV_m0aGQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3t6cnfR02kfHvnKdCcDPvyX4jwccV7qkR_=-dV_m0aGQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 12 May 2022 10:21:56 -0700
Message-ID: <CAHBxVyF5T7r26nAp1Hep+DRkZErr2PH43k=HwLi6iuqMXWju6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Fix counter restart during overflow for RV32
To: Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_102213_290699_EF3A23F9 
X-CRM114-Status: GOOD (  24.78  )
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

T24gVGh1LCBNYXkgMTIsIDIwMjIgYXQgODozNiBBTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDEyLCAyMDIyIGF0IDY6MTIgUE0gSGVpa28g
U3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPgo+ID4gQW0gRG9ubmVyc3RhZywg
MTIuIE1haSAyMDIyLCAwNjo0NDoxMiBDRVNUIHNjaHJpZWIgQW51cCBQYXRlbDoKPiA+ID4gT24g
VGh1LCBNYXkgMTIsIDIwMjIgYXQgMTo0MSBBTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBQYXNzIHRoZSB1cHBlciBoYWxmIG9mIHRoZSBp
bml0aWFsIHZhbHVlIG9mIHRoZSBjb3VudGVyIGNvcnJlY3RseQo+ID4gPiA+IGZvciBSVjMyLgo+
ID4gPiA+Cj4gPiA+ID4gRml4ZXM6IDQ5MDVlYzJmYjdlNiAoIlJJU0MtVjogQWRkIHNzY29mcG1m
IGV4dGVuc2lvbiBzdXBwb3J0IikKPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNo
IFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJz
L3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgMiArLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
Ywo+ID4gPiA+IGluZGV4IGExMzE3YTQ4MzUxMi4uMjRjZWE1OTYxMmJlIDEwMDY0NAo+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+ID4gPiArKysgYi9kcml2ZXJz
L3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiA+ID4gQEAgLTUyNiw3ICs1MjYsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgcG11X3NiaV9zdGFydF9vdmVyZmxvd19tYXNrKHN0cnVjdCByaXNjdl9wbXUg
KnBtdSwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBtYXhfcGVyaW9kID0gcmlzY3Zf
cG11X2N0cl9nZXRfd2lkdGhfbWFzayhldmVudCk7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgaW5pdF92YWwgPSBsb2NhbDY0X3JlYWQoJmh3Yy0+cHJldl9jb3VudCkgJiBtYXhfcGVy
aW9kOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9lY2FsbChTQklfRVhUX1BN
VSwgU0JJX0VYVF9QTVVfQ09VTlRFUl9TVEFSVCwgaWR4LCAxLAo+ID4gPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmbGFnLCBpbml0X3ZhbCwgMCwgMCk7Cj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsYWcsIGluaXRfdmFsLCBpbml0X3ZhbCA+
PiAzMiwgMCk7Cj4gPiA+Cj4gPiA+IFRoaXMgc2hvdWxkIGJlIHVuZGVyICIjaWYgX19yaXNjdl94
bGVuID09IDMyIi4KPiA+Cj4gPiBXaGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB1c2luZyBD
T05GSUdfMzJCSVQKPiA+IGFuZCBjaGVja2luZyB0aGUgX19yaXNjdl94bGVuIGZsYWcgdmFsdWU/
Cj4KPiBJdCdzIG9uZSBhbmQgdGhlIHNhbWUuCj4KPiA+Cj4gPiBDT05GSUdfMzJCSVQgc2VlbXMg
dG8gYmUgYSBiaXQgdGhlIG1vcmUga2VybmVsJ2lzaAo+ID4gd2F5IHRvIGRvIHRoaXMsIGJ1dCBp
dCBsb29rcyBsaWtlIG1vc3QgU0JJIHBhcnRzIGNoZWNrIHRoZQo+ID4gX19yaXNjdl94bGVuIGlu
c3RlYWQuCj4KCk5vdCBvbmx5IFNCSSBwYXJ0cywgdGhlcmUgYXJlIG1vcmUgdXNlcnMgb2YgX19y
aXNjdl94bGVuIGNvbXBhcmVkCkNPTkZJR18zMkJJVCBpbiBhcmNoL3Jpc2N2LgoKPiBJIGFncmVl
IHdpdGggeW91LiBXZSBzaG91bGQgcHJlZmVyICIjaWZkZWYgQ09ORklHXzMyQklUIgo+IGluIHRo
aXMgY2FzZSB0byBtYXRjaCB0aGUga2VybmVsIGNvZGluZyBzdHlsZS4KPgoKU3VyZS4gSSB3aWxs
IGNoYW5nZSBpdCB0byBDT05GSUdfMzJCSVQuCgoKPiBDdXJyZW50bHksIE9wZW5TQkkgZG9lcyBu
b3QgaGF2ZSBDT05GSUdfeHl6IGRlZmluZXMgc28KPiBvdmVyIHRoZXJlIHdlIHVzZSAiI2lmIF9f
cmlzY3ZfeGxlbiA9PSAzMiIuCj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+ID4KPiA+Cj4gPiBJbiBh
bnkgY2FzZSwgbG9va2luZyBhdCB0aGUgb3BlbnNiaS1zaWRlIG9mIHRoZSBjYWxsLAo+ID4gdGhp
cyBmaXggaXMgYWJ2aW91c2x5IGNvcnJlY3QsIHNvCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEhlaWtv
IFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gPgo+ID4KPiA+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
