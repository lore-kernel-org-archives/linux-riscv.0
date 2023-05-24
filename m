Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC73CC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 05:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nxeyiJjhqrJxa/qd2Taj2bZj+LWpnas0OoNrobEuTg=; b=IivvlV2FpMxPsb
	qxg7nlanK3M+hAw6NkOwg8l8rcUT3bTq07wi/17pegOXHny9PnSmBDNCw5TLOkJ3pkvzZ7P+KQcFW
	03vebUYz+cgp2wuk14wGa4YnO1c76zNxjG9+82Zj8BVKGBJpnZGFbaSxbb3rhAIb7GTEEP45fes0t
	nmdS1JI2Jvq5BeTv92h3OPSa0AZ/hSYco/JSG4SVhfDDGMeSvcbrQy+imyylg8yr7k6N+uITw6uw5
	OR8oe3OWDeFCehXeiDg/M0ytkoXfnW+ZrANzsS/1KDnV9TCXfh9Nr7xbLLsJShC/iw+Wo0EaXbA1q
	w5POxEEsV6K3co9LA53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1h3F-00CP80-0a;
	Wed, 24 May 2023 05:28:45 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1h3B-00CP7b-31
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 05:28:43 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-55db055b412so82851917b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 May 2023 22:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684906120; x=1687498120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aS3Nhb3VAWEGlLu+XBwgpmCXcyJvTR79ms1GmCOYiuc=;
        b=yHK9rzEq2VzEMfw2DClczT1cZ0xt1Sc1yfEDGlQ/piJkXnt8SYE6F8347x9r4Bnc4X
         5iu3V89eWxuFne6sR9CxkQ6TxK6EN/6k7xBX1U24kVBLCxj0/5whUbyYRpkJBxC9+85Q
         qqvV1OC49D6WylWj5VRJukBH6nVXLiiZnWrGw7MJOfNnudiIuo1Wu8eRwGaol4pdIkqT
         mJXhFmDRVi/PyVkDerk/ALdFKhRrvkAuKqS0sctgyaFABXSacfned5FhxHdfNtu1TwO+
         i4pfgPYu6LKg+XSwBDJi7TyvTqRGiO2lfSZsYPaVWA+nZ4XwxxojQ5ChtP3PdIDKRzqK
         7OCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684906120; x=1687498120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aS3Nhb3VAWEGlLu+XBwgpmCXcyJvTR79ms1GmCOYiuc=;
        b=f+x0v19c4ulvJaBVq/jBvBQ0Vu0EeMZSqT3ea8h0iDqbe7zpp8guChv0Vns5v3afZ7
         YD379fTboecDuOQpCDk98nm9o3m3jxVJuAtma/y6ojU2zNtYXHWVzVzkIZBIKuf+Qcb/
         PvMZcUBCSIyzwulODAQ4oF4m5b4NWuyCYJ1ZocbrVI1MrTEov68HJPQehMz2/ludRXLp
         plznGwMqqO4caomlyOvIS8TQohxOCo/PwK2ZqEwJYcyu/YheUT6YwET4d5K6mskzzy6j
         lr6txic7+G1tjxaF5kcRWoqil1xqJNaI/JVockOpe30c/AIOfavLLFgp5vZEcBoCAmQz
         qo9Q==
X-Gm-Message-State: AC+VfDxyu1YMLdmYSi6D98lI2YhCM7ftbM7CunTeEr2JIIKLbXuxtQrZ
	JcpSy9QATbX+LGnnr1U2Fnmfz5JeUw2D1fb1wMGXqQ==
X-Google-Smtp-Source: ACHHUZ4Try6TclbYIBRhUv6Q1d1POhNmJXlpCYm6I1CpyXdd8PNyciLfqJujJFDOKp0b7AKP6kzrS4aavRcC3gJgu4g=
X-Received: by 2002:a05:690c:810:b0:565:62e7:223a with SMTP id
 bx16-20020a05690c081000b0056562e7223amr925533ywb.3.1684906120498; Tue, 23 May
 2023 22:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230523165942.2630-1-jszhang@kernel.org> <20230524050259.104358-1-guoren@kernel.org>
In-Reply-To: <20230524050259.104358-1-guoren@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 23 May 2023 22:28:29 -0700
Message-ID: <CAJuCfpGAV1dhxS3FDyxJNtg25ZznYOv4tHzSezhoWZdG_WRizQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: try VMA lock-based page fault handling first
To: guoren@kernel.org
Cc: jszhang@kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	chenhuacai@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_222841_971353_3E3112C8 
X-CRM114-Status: GOOD (  25.25  )
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

T24gVHVlLCBNYXkgMjMsIDIwMjMgYXQgMTA6MDPigK9QTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Cj4gPiBBdHRlbXB0IFZNQSBsb2NrLWJhc2VkIHBhZ2UgZmF1bHQgaGFuZGxpbmcgZmly
c3QsIGFuZCBmYWxsIGJhY2sgdG8gdGhlCj4gPiBleGlzdGluZyBtbWFwX2xvY2stYmFzZWQgaGFu
ZGxpbmcgaWYgdGhhdCBmYWlscy4KPiA+Cj4gPiBBIHNpbXBsZSBydW5uaW5nIHRoZSBlYml6enkg
YmVuY2htYXJrIG9uIExpY2hlZSBQaSA0QSBzaG93cyB0aGF0Cj4gPiBQRVJfVk1BX0xPQ0sgY2Fu
IGltcHJvdmUgdGhlIGViaXp6eSBiZW5jaG1hcmsgYnkgYWJvdXQgMzIuNjglLiBJbgo+IEdvb2Qg
aW1wcm92ZW1lbnQsIEkgdGhpbmsgVk1BIGxvY2sgaXMgd29ydGggdG8gc3VwcG9ydCBpbiByaXNj
di4KPgo+IFBsZWFzZSBnaXZlIG1vcmUgZGV0YWlscyBhYm91dCBlYml6enksIElzIGl0Cj4gaHR0
cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvYmxvYi9tYXN0ZXIvdXRpbHMv
YmVuY2htYXJrL2ViaXp6eS0wLjMvZWJpenp5LmMKPiA/Cj4KPiA+IHRoZW9yeSwgdGhlIG1vcmUg
Q1BVcywgdGhlIGJpZ2dlciBpbXByb3ZlbWVudCwgYnV0IEkgZG9uJ3QgaGF2ZSBhbnkKPiA+IEhX
IHBsYXRmb3JtIHdoaWNoIGhhcyBtb3JlIHRoYW4gNCBDUFVzLgo+ID4KPiA+IFRoaXMgaXMgdGhl
IHJpc2N2IHZhcmlhbnQgb2YgIng4Ni9tbTogdHJ5IFZNQSBsb2NrLWJhc2VkIHBhZ2UgZmF1bHQK
PiA+IGhhbmRsaW5nIGZpcnN0Ii4KPiA+Cj4KPiBIb3cgYWJvdXQgYWRkIExpbmsgdGFnIGhlcmU6
Cj4gTGluazogaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzkwNjg1Mi8KPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiBBbnkg
cGVyZm9ybWFuY2UgbnVtYmVycyBhcmUgd2VsY29tZSEgRXNwZWNpYWxseSB0aGUgbnVtYmVycyBv
biBIVwo+ID4gcGxhdGZvcm1zIHdpdGggOCBvciBtb3JlIENQVXMuCj4gPgo+ID4gIGFyY2gvcmlz
Y3YvS2NvbmZpZyAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L21tL2ZhdWx0LmMgfCAzMyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDM0IGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJj
aC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCA2MmU4NGZlZTJjZmQuLmI5NThmNjdmOWExMiAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29u
ZmlnCj4gPiBAQCAtNDIsNiArNDIsNyBAQCBjb25maWcgUklTQ1YKPiA+ICAgICAgIHNlbGVjdCBB
UkNIX1NVUFBPUlRTX0RFQlVHX1BBR0VBTExPQyBpZiBNTVUKPiA+ICAgICAgIHNlbGVjdCBBUkNI
X1NVUFBPUlRTX0hVR0VUTEJGUyBpZiBNTVUKPiA+ICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRT
X1BBR0VfVEFCTEVfQ0hFQ0sgaWYgTU1VCj4gPiArICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19Q
RVJfVk1BX0xPQ0sgaWYgTU1VCj4gPiAgICAgICBzZWxlY3QgQVJDSF9VU0VfTUVNVEVTVAo+ID4g
ICAgICAgc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9SV0xPQ0tTCj4gPiAgICAgICBzZWxlY3QgQVJD
SF9XQU5UX0RFRkFVTFRfVE9QRE9XTl9NTUFQX0xBWU9VVCBpZiBNTVUKPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+IGluZGV4
IDg2ODVmODVhNzQ3NC4uZWNjZGRkZjI2ZjRiIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9t
bS9mYXVsdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+IEBAIC0yODYsNiAr
Mjg2LDM2IEBAIHZvaWQgaGFuZGxlX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
PiAgICAgICAgICAgICAgIGZsYWdzIHw9IEZBVUxUX0ZMQUdfV1JJVEU7Cj4gPiAgICAgICBlbHNl
IGlmIChjYXVzZSA9PSBFWENfSU5TVF9QQUdFX0ZBVUxUKQo+ID4gICAgICAgICAgICAgICBmbGFn
cyB8PSBGQVVMVF9GTEFHX0lOU1RSVUNUSU9OOwo+ID4gKyNpZmRlZiBDT05GSUdfUEVSX1ZNQV9M
T0NLCj4gPiArICAgICBpZiAoIShmbGFncyAmIEZBVUxUX0ZMQUdfVVNFUikpCj4gPiArICAgICAg
ICAgICAgIGdvdG8gbG9ja19tbWFwOwo+ID4gKwo+ID4gKyAgICAgdm1hID0gbG9ja192bWFfdW5k
ZXJfcmN1KG1tLCBhZGRyKTsKPiA+ICsgICAgIGlmICghdm1hKQo+ID4gKyAgICAgICAgICAgICBn
b3RvIGxvY2tfbW1hcDsKPiA+ICsKPiA+ICsgICAgIGlmICh1bmxpa2VseShhY2Nlc3NfZXJyb3Io
Y2F1c2UsIHZtYSkpKSB7Cj4gPiArICAgICAgICAgICAgIHZtYV9lbmRfcmVhZCh2bWEpOwo+ID4g
KyAgICAgICAgICAgICBnb3RvIGxvY2tfbW1hcDsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAg
IGZhdWx0ID0gaGFuZGxlX21tX2ZhdWx0KHZtYSwgYWRkciwgZmxhZ3MgfCBGQVVMVF9GTEFHX1ZN
QV9MT0NLLCByZWdzKTsKPiA+ICsgICAgIHZtYV9lbmRfcmVhZCh2bWEpOwo+ID4gKwo+ID4gKyAg
ICAgaWYgKCEoZmF1bHQgJiBWTV9GQVVMVF9SRVRSWSkpIHsKPiA+ICsgICAgICAgICAgICAgY291
bnRfdm1fdm1hX2xvY2tfZXZlbnQoVk1BX0xPQ0tfU1VDQ0VTUyk7Cj4gPiArICAgICAgICAgICAg
IGdvdG8gZG9uZTsKPiA+ICsgICAgIH0KPiA+ICsgICAgIGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50
KFZNQV9MT0NLX1JFVFJZKTsKPiA+ICsKPiA+ICsgICAgIGlmIChmYXVsdF9zaWduYWxfcGVuZGlu
ZyhmYXVsdCwgcmVncykpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKCF1c2VyX21vZGUocmVncykp
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgbm9fY29udGV4dChyZWdzLCBhZGRyKTsKPiA+ICsg
ICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgfQo+ID4gK2xvY2tfbW1hcDoKPiA+ICsjZW5k
aWYgLyogQ09ORklHX1BFUl9WTUFfTE9DSyAqLwo+ID4gKwo+ID4gIHJldHJ5Ogo+ID4gICAgICAg
bW1hcF9yZWFkX2xvY2sobW0pOwo+ID4gICAgICAgdm1hID0gZmluZF92bWEobW0sIGFkZHIpOwo+
ID4gQEAgLTM1NSw2ICszODUsOSBAQCB2b2lkIGhhbmRsZV9wYWdlX2ZhdWx0KHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQo+ID4KPiA+ICAgICAgIG1tYXBfcmVhZF91bmxvY2sobW0pOwo+ID4KPiA+ICsj
aWZkZWYgQ09ORklHX1BFUl9WTUFfTE9DSwo+ID4gK2RvbmU6Cj4gPiArI2VuZGlmCj4gSXQncyB2
ZXJ5IGNsb3NlIHRvIGNkN2YxNzZhZWE1ZiAoImFybTY0L21tOiB0cnkgVk1BIGxvY2stYmFzZWQg
cGFnZSBmYXVsdAo+IGhhbmRsaW5nIGZpcnN0IiksIGFuZCBJIGRpZG4ndCBmaW5kIGFueSBwcm9i
bGVtLiBTbzoKPgo+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCkxv
b2tzIGNvcnJlY3QgdG8gbWUuCgpSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJl
bmJAZ29vZ2xlLmNvbT4KCj4KPiBGLlkuSSBIdWFjYWkgQ2hlbiwgbWF5YmUgaGUgYWxzbyB3b3Vs
ZCBiZSBpbnRlcmVzdGluZyB0aGlzIG5ldyBmZWF0dXJlLgo+Cj4KPiA+ICAgICAgIGlmICh1bmxp
a2VseShmYXVsdCAmIFZNX0ZBVUxUX0VSUk9SKSkgewo+ID4gICAgICAgICAgICAgICB0c2stPnRo
cmVhZC5iYWRfY2F1c2UgPSBjYXVzZTsKPiA+ICAgICAgICAgICAgICAgbW1fZmF1bHRfZXJyb3Io
cmVncywgYWRkciwgZmF1bHQpOwo+ID4gLS0KPiA+IDIuNDAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
