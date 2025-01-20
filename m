Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D882DC02182
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 11:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2A41An9uU1vna9YpioQysClQYHkTNbNtYW2eEZiT8yY=; b=nchd31ri5be2Kv
	YBx5PG2GM6bG9+HQg/XHOqvJU6wgI8eZsjDwvd7Pdp/O2jLmOuoU4Lgvu+dyXmJdo+pofDIErThRl
	KmVbk4tMd2OD5rH2jAplLcVXuW2M+YKiQwjVC4aTSZD6IjrKqaVlWp3vxxS38/A7YELFho5qGn+Vv
	YXohV5GDYJm+ehMu4JGp+3QibUurcszoVgJWOuhp6seVSi6PJdC6x8F5a98srK5sFHA809+ayb6tV
	HBKaD0qPI56tA7AVWla8Vk7n12xnmxrxhLE02Sa34GdZ1krbPXH9N5A4DAOVstCGpJjxV4Lov4Juk
	Dg3oFuMcpi1hYlfrHsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpc6-00000005Oba-0Ej5;
	Mon, 20 Jan 2025 11:06:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpbF-00000005OVm-0Y7U
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 11:05:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2166022c5caso69259155ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 03:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737371140; x=1737975940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N8ML0yu3zv74qYbQBwE6LdfD5dixOukyHKOWCLjmCc=;
        b=Uvz4cCOuWex/AV8skyUCuRJLumvlzPWCzsL3GFZiRqfbqUxKdpXS9fkEkk7RhGWPcp
         oLxTjXRI3/Anv2mbDIqUCjRzRneHXekB7qGihrNAO9SIfA4j9aAmMUGZhzuhle+M69MA
         RKpIZgYBtBNSeLGNbb5Iq/VkjBRt0MMz/0xR9v9uNmyyNLFu3wYD393bsZl1DjvVGWo/
         y05qCTiFV2JT3TPS/JIC07QWTNITaWO/9uUfQS9EYe/rrg2hwEELHaSAO0d+iRs962un
         VAWtFu1VE4uVd+5shglrDHmEKfkcFez/Gdg4j2rSyM68+f9wXwRqnmrs7XnJbcQ6xjVb
         IXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737371140; x=1737975940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6N8ML0yu3zv74qYbQBwE6LdfD5dixOukyHKOWCLjmCc=;
        b=s0xAsZicvgGYy4P52D0lOcUYk9YHp7WN9YLjcMudpH1uCXlXErCj86N/gCT4Lu5wB6
         a+O6pMwnCMlCdKFgkwT41C3DgV+cHwcEuCX3UYs/rtu4HcBEx1C2kK2NzfTlBe2xxcXf
         9qrDxMMgH8I1moXkQrAywjHjRrXii5U3wwiuFKsSY3GgI2SqcnfUhjuECPm5W7QP6drh
         JgMVLvm1Ytlpu+9irDYLibxQzbS/xadeIghBJoP2n0JUk5WWoSFTuVYzyxBShFlIeNx/
         Q+v5y156W2QW1geH5AktSo8z6jXqQd7evp4Yznb59JgtbPTM5YilfdMYzkQh/bL7igJs
         OUUA==
X-Forwarded-Encrypted: i=1; AJvYcCXrPZqMFc1ORO1cfrZ4vaG4moQMis1BXhnCdQ7mEhM7UcH1Xql89/CVNFiEYDb7Dyvr5gh7AzhoIVv2bg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdZ7900ns88bghWWZgkUFpO/IS82iL0R2OlbswpH1bVRW2sfji
	/sj4RcdM2MaxeSF7jeGlSXsiBo8kwtNy4OHLqkGrU5MNLAKdACoJA+3XgKchiuj/gDXGx0PAtxp
	kOgklqO8w0sMTDa/71RrgLL7KqlCzaX9mQpbFLdI9uc08QbBjR5pCOA==
X-Gm-Gg: ASbGnct9BkP5OggauYSMvNdL9XFqKYoqMx1yu1uVAnSSck1XUlMUqkwbz0Nfw38PxfN
	vhpfIGy0lU4+p2xvjeWgZBlDSBMh9kFnj2VeQWNFbvNfP7SBWMcb2/uguM33IF8Ysi8Ak9bBRT4
	U=
X-Google-Smtp-Source: AGHT+IF6/rizOkYE2fQ4RX7hHFq7tJqddhc16pMl8N2bF0tASGnsBqNuxI5n/t9mKH0W12J4ZAYaF8QCcH5hUXDlZTQ=
X-Received: by 2002:a05:6a20:8410:b0:1e1:b0df:6cd7 with SMTP id
 adf61e73a8af0-1eb2146019fmr18511623637.5.1737371139913; Mon, 20 Jan 2025
 03:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20250116120710.51673-1-luxu.kernel@bytedance.com>
 <Z4l1fklnUPyTSLO4@ghost> <87ldv9afso.ffs@tglx> <CAAhSdy0cDUHASb0iOfGFdh_AW3NH-M+2JHTOG+O_FYkhAS4dDw@mail.gmail.com>
 <87frle9br2.ffs@tglx>
In-Reply-To: <87frle9br2.ffs@tglx>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 20 Jan 2025 19:05:29 +0800
X-Gm-Features: AbW1kvZ8gXXMGK7C3WTPJ6_mT5Nr-kiLKrH9E0olyJGtqhJP9AAR8aGJ0d48FOk
Message-ID: <CAPYmKFtR0EMq4ExjpW7XsNKX2Mp8MHA0QNgPBy4QRGOBAOkORw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] irqchip: riscv: Order normal writes and
 IPI writes
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>, Charlie Jenkins <charlie@rivosinc.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_030545_463767_F36DAC76 
X-CRM114-Status: GOOD (  26.09  )
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

T24gTW9uLCBKYW4gMjAsIDIwMjUgYXQgMzozN+KAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIEZyaSwgSmFuIDE3IDIwMjUgYXQgMjE6MjMsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBGcmksIEphbiAxNywgMjAyNSBhdCA0OjA14oCvUE0gVGhv
bWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+ID4+IE9uIFRodSwgSmFu
IDE2IDIwMjUgYXQgMTM6MDksIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+PiA+IE9uIFRodSwg
SmFuIDE2LCAyMDI1IGF0IDA4OjA3OjEwUE0gKzA4MDAsIFh1IEx1IHdyb3RlOgo+ID4+ID4+IFJl
cGxhY2Ugd3JpdGVsX3JlbGF4ZWQoKSB3aXRoIHdyaXRlbCgpIHdoZW4gaXNzdWluZyBJUEkgdG8g
ZW5zdXJlIGFsbAo+ID4+ID4+IHByZXZpb3VzIHdyaXRlIG9wZXJhdGlvbnMgbWFkZSBieSBjdXJy
ZW50IENQVSBhcmUgdmlzaWJsZSB0byBvdGhlciBDUFVzLgo+ID4+ID4KPiA+PiA+IERpZCB5b3Ug
ZXhwZXJpZW5jZSBhbiBvcmRlcmluZyBpc3N1ZSBmcm9tIHRoaXM/Cj4gPj4KPiA+PiBUaGF0J3Mg
bm90IHRoZSByaWdodCBxdWVzdGlvbi4KPiA+Pgo+ID4+ICAgICAgIENQVSAwICAgICAgICAgICAg
ICAgICAgICAgQ1BVIDEKPiA+PiAgICAgICBzdG9yZSBBICAgLy8gZGF0YQo+ID4+ICAgICAgIHN0
b3JlIEIgICAvLyBJUEkKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElQSSBo
YW5kbGVyCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2FkIEEKPiA+Pgo+
ID4+IFRoZSByZWFsIHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhlIFJJU0MtViBtZW1vcnkgbW9kZWwg
Z3VhcmFudGVlcyB1bmRlcgo+ID4+IGFsbCBjaXJjdW1zdGFuY2VzIHRoYXQgQSBpcyBnbG9iYWxs
eSB2aXNpYmxlIGJlZm9yZSB0aGUgSVBJIGhhbmRsZXIKPiA+PiBsb2FkLiBJZiBzbywgdGhlbiB0
aGUgd3JpdGVsX3JlbGF4ZWQoKSBpcyBmaW5lLiBJZiBub3QsIHRoZSBmZW5jZSBpcwo+ID4+IHJl
cXVpcmVkLgo+ID4+Cj4gPj4gVGhhdCdzIG5vdCBhIHF1ZXN0aW9uIG9mIG9ic2VydmF0aW9uLiBJ
dCdzIGEgcXVlc3Rpb24gb2YgZmFjdHMgZGVmaW5lZAo+ID4+IGJ5IHRoZSBhcmNoaXRlY3R1cmUu
IFBlb3BsZSBoYXZlIHdhc3RlZCBtb250aHMgdG8gYW5hbHl6ZSBzdWNoIGZhaWxzCj4gPj4gd2hp
Y2ggdGVuZCB0byBoYXBwZW4gb25jZSBldmVyeSBibHVlIG1vb24gd2l0aCBubyBvdGhlciB0cmFj
ZSB0aGFuCj4gPj4gInNvbWV0aGluZyB3ZW50IHdyb25nIiAuLi4uCj4gPgo+ID4gVGhlIFJJU0Mt
ViBGRU5DRSBpbnN0cnVjdGlvbiBkaXN0aW5ndWlzaGVzIGJldHdlZW4gbm9ybWFsCj4gPiBtZW1v
cnkgb3BlcmF0aW9ucyBhbmQgSS9PIG9wZXJhdGlvbnMgaW4gaXRzIHByZWRlY2Vzc29yIGFuZAo+
ID4gc3VjY2Vzc29yIHNldHMgd2hlcmUgciA9IG5vcm1hbCByZWFkLCB3ID0gbm9ybWFsIHdyaXRl
LAo+ID4gaSA9IEkvTyByZWFkLCBhbmQgbyA9IEkvTyB3cml0ZS4KPiA+Cj4gPiBUaGUgaXBpX211
eF9zZW5kX21hc2soKSBkb2VzIHNtcF9tYl9fYWZ0ZXJfYXRvbWljKCkgKGVxdWFscwo+ID4gdG8g
ImZlbmNlIHJ3LHJ3IikgYmVmb3JlIGNhbGxpbmcgaW1zaWNfaXBpX3NlbmQoKS4gVGhpcyBwcmV2
ZW50cwo+ID4gb3JkZXJpbmcgb2Ygbm9ybWFsIG1lbW9yeSB3cml0ZXMgaW4gaW1zaWNfaXBpX3Nl
bmQoKSBiZWZvcmUKPiA+IHNtcF9tYl9fYWZ0ZXJfYXRvbWljKCkgaW4gaXBpX211eF9zZW5kX21h
c2soKSBidXQgaXQgZG9lcwo+ID4gbm90IHByZXZlbnQgSS9PIG1lbW9yeSB3cml0ZXMgaW4gaW1z
aWNfaXBpX3NlbmQoKSB0byBiZSBvcmRlcmVkCj4gPiBiZWZvcmUgc21wX21iX19hZnRlcl9hdG9t
aWMoKS4KPiA+Cj4gPiBUaGlzIG1lYW5zIGN1cnJlbnRseSBub3RoaW5nIHByZXZlbnRzIHRoZSBJ
L08gbWVtb3J5IHdyaXRlIGluCj4gPiBpbXNpY19pcGlfc2VuZCgpIHRvIGJlIG9yZGVyZWQgYmVm
b3JlIG5vcm1hbCBtZW1vcnkgd3JpdGVzIGluCj4gPiBpcGlfbXV4X3NlbmRfbWFzaygpIGhlbmNl
IHRoZXJlIGlzIGEgdmVyeSB1bmxpa2VseSBwb3NzaWJpbGl0eQo+ID4gb2YgYW4gSVBJIGhhbmRs
ZXIgb24gdGhlIHRhcmdldCBDUFUgc2VlaW5nIGluY29ycmVjdCBkYXRhLgo+Cj4gVmVyeSB1bmxp
a2VseSBpcyBhIHZhbGlkIGFzc3VtcHRpb24gZm9yIGEgc2luZ2xlIHN5c3RlbSwgYnV0IGF0IHNj
YWxlIGl0Cj4gYmVjb21lcyB2ZXJ5IGxpa2VseSA6KQo+Cj4gPiBUaGUgY29udmVyc2lvbiBvZiB3
cml0ZWxfcmVsYXhlZCgpIHRvIHdyaXRlbCgpIGluIGltc2ljX2lwaV9zZW5kKCkKPiA+IGFkZHMg
YSAiZmVuY2UgdyxvIiBiZWZvcmUgdGhlIGFjdHVhbCBJL08gbWVtb3J5IHdyaXRlIHdoaWNoCj4g
PiBlbnN1cmVzIHRoYXQgSS9PIG1lbW9yeSB3cml0ZSBpcyBub3Qgb3JkZXJlZCBiZWZvcmUgbm9y
bWFsCj4gPiBtZW1vcnkgd3JpdGVzLgo+ID4KPiA+IEJhc2VkIG9uIHRoZSBhYm92ZSwgdGhlIGNv
bnZlcnNpb24gb2Ygd3JpdGVsX3JlbGF4ZWQoKSB0bwo+ID4gd3JpdGVsKCkgaW4gaW1zaWNfaXBp
X3NlbmQoKSBsb29rcyBnb29kIHRvIG1lLgo+Cj4gQ2FuIHdlIHBsZWFzZSBoYXZlIHNvbWV0aGlu
ZyBsaWtlIHRoZSBhYm92ZSBpbiB0aGUgY2hhbmdlIGxvZyBzbyB0aGlzIGlzCj4gZG9jdW1lbnRl
ZCBmb3IgcG9zdGVyaXR5PwoKVGhhbmtzIGZvciBBbnVwJ3Mgc3VwcGxpZWQgaW5mb3JtYXRpb24u
IEkgd2lsbCByZWZpbmUgdGhlIGNvbW1pdAptZXNzYWdlIGFuZCByZXNlbmQgdGhlIHBhdGNoLgoK
VGhhbmtzLAoKWHUgTHUKCj4KPiBUaGFua3MKPgo+ICAgICAgICAgdGdseAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
