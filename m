Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B16E7C4CB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+hDs88u21bNlz6sGsGIPb0dXxXai5P3JeDnXi0JPNas=; b=icuaytDP69zHhp
	6/hWUag4nVfp/DG3qX2IArFhpa7LvhIdURsIlaEKEiztQ+ghxVkTBg1lnNQAnCx6b+daRT5AmexU7
	ByyH9D7jD2a25mawZS+HQ45xfUGmdRRGwPq8uExirCd5wQWVgDQGE7dMMSzDYVhNfpZ2OhxMzbiV9
	ftsrUs/sRqBkpVdEpnJD1qH1EoSQE6FGKQx5oua07UVFxTcVuqh/+fPDXd8rKhrO3KuuHx5MAFrpG
	++A5bMfCQRGb1bn9ZBlrQonCK1LXHzamMq0+MWRZodhPaRKuWOC8yUJehy3vss8Z0HeWibrfUp7oy
	IZHyHk3bnwm8Y0wnC/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3Lp-000HhN-2M;
	Wed, 04 Oct 2023 14:59:49 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3Lm-000Hfy-1q
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:59:48 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-57bb6b1f764so1395221eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696431584; x=1697036384; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEXQevqSveCTnz5Ht5KZikoHbpn3n64PdUPId3xt3YE=;
        b=X3LoSPBDafOii7CNZyZWbJMmImV1lqNdVFAN2acHF/lUjbD0rbnq/7LgdybADuokeP
         1/MX9nrWXxouYO/xUNO2+C/2HaPY/gpYxUMbZaHwMHQtlKoahgnxjqeO7jufFlDu2U4/
         ixUT41zsCccyr56Defn1VIE/v6m39Fw9S5ZWBQRoK5HFMf2JQiMOH9qD3hvj1LHCe/Gv
         MKLPdb4Y0nlvEyLfR/IBTwD1lkjfyNt67YnTLokfPQNDl1GfxKj7LV4l7xkZhJQyF8kr
         z7lbaCTUok+KSco6xBURA0LBh9QW4KVyahOhyolFW/4A2MNiysMq0Y/DhlnhFacXgrMj
         GB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696431584; x=1697036384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEXQevqSveCTnz5Ht5KZikoHbpn3n64PdUPId3xt3YE=;
        b=AGTDjDn0/Ex16A+L5yqf7P/z4w/OaQsnS30rEXsMLXjykDa5c+296pkt7Kc3votJkL
         ebQgbiBnMa1LpcweIwYURes1TZN1nEezWL6I1FVq6YgVPlybut11gyEzra4gj3+HTSGC
         pR0M8qqlBV53qLgjF+f4uDriyJhhyrh1E0300xDVsofHVLf9qEFM1cFIs+EOCrc7pG7y
         r+VhmQrIjBkzKJiT0zTDhWn2d4NNhY09Hqv11pRe3oEO2aaHk8l4vMsygD7Ei9NkW2Uw
         0TV9n5Nh96FIwg0zShrloyOVBIJLjf1YcLt7FSiGPdEbFUd0avUEt9rmIRZ7E3hKOGc2
         vIQQ==
X-Gm-Message-State: AOJu0YzQmcQbVfQimfCdtfEABe7Cpq2UNIVvhk8lCdvQpAcEjp8yjpVy
	QRYPb5VKPkP5yJhcH9s/vmqR5BuszOKoH5eUQJJxmQ==
X-Google-Smtp-Source: AGHT+IFU7hW/Kn3xhnt1RQxTnCHcZyF4PyxNb82RfQJ7+yx9mDLdmtP9so8jDV+twSh1CFHLLdLH12ppJ6Wj39xJrXw=
X-Received: by 2002:a05:6358:718b:b0:142:d678:f708 with SMTP id
 t11-20020a056358718b00b00142d678f708mr3006382rwt.19.1696431584156; Wed, 04
 Oct 2023 07:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230926102801.1591126-1-dunaev@tecon.ru> <CAK9=C2UiBNQtv0Q2yJMKqc5pMX_jam+ZmfRz3Rme0ZYuqN68HA@mail.gmail.com>
 <86il7mofmm.wl-maz@kernel.org>
In-Reply-To: <86il7mofmm.wl-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 4 Oct 2023 20:29:33 +0530
Message-ID: <CAK9=C2UUQ+ChueJVs+AnY0oCTb1zSv7qOCTijSchwxiMspX74w@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-intc: Mark INTC nodes for secondary CPUs as initialized.
To: Marc Zyngier <maz@kernel.org>
Cc: Dmitry Dunaev <dunaev@tecon.ru>, dunaich@mail.ru, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_075946_618153_1B449905 
X-CRM114-Status: GOOD (  31.39  )
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCAzOjQ44oCvUE0gTWFyYyBaeW5naWVyIDxtYXpAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIDI2IFNlcCAyMDIzIDExOjM2OjMxICswMTAwLAo+IEFu
dXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUs
IFNlcCAyNiwgMjAyMyBhdCAzOjU54oCvUE0gRG1pdHJ5IER1bmFldiA8ZHVuYWV2QHRlY29uLnJ1
PiB3cm90ZToKPiA+ID4KPiA+ID4gVGhlIGN1cnJlbnQgTGludXggZHJpdmVyIGlycS1yaXNjdi1p
bnRjIGluaXRpYWxpemUgSVJRIGRvbWFpbiBvbmx5IG9uY2UsCj4gPiA+IHdoZW4gaW5pdCBmdW5j
dGlvbiBjYWxsZWQgb24gcHJpbWFyeSBoYXJ0LiBJbiBvdGhlciBjYXNlcyBubyBJUlEgZG9tYWlu
IGlzCj4gPiA+IGNyZWF0ZWQgYW5kIG5vIG9wZXJhdGlvbiBvbiBpbnRlcnJ1cHQtY29udHJvbGxl
ciBub2RlIGlzIHBlcmZvcm1lZC4KPiA+ID4gVGhpcyBpcyBjYXVzZSBvZiB0aGF0IG5vIGNvbW1v
biBMaW51eCBkcml2ZXIgY2FuIHVzZSBwZXItY3B1IGludGVycnVwdHMKPiA+ID4gbWFwcGVkIHRv
IHNldmVyYWwgQ1BVcyBiZWNhdXNlIGZ3bm9kZSBvZiBzZWNvbmRhcnkgY29yZXMgSU5UQyBpcyBu
b3QKPiA+ID4gbWFya2VkIGFzIGluaXRpYWxpemVkLiBUaGlzIGRldmljZSBpcyBhbHdheXMgd2ls
bCBiZSBtYXJrZWQgYXMgZGVmZXJyZWQuCj4gPiA+IEZvciBleGFtcGxlIHRoZSBzeXN0ZW0gd2l0
aCBkZXZpY2V0cmVlCj4gPiA+Cj4gPiA+ICAgICBjcHUwOiBjcHVAMCB7Cj4gPiA+ICAgICAgICAg
Y3B1MF9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gPiA+ICAgICAgICAgICAgIGludGVy
cnVwdC1jb250cm9sbGVyOwo+ID4gPiAgICAgICAgICAgICBjb21wYXRpYmxlID0gcmlzY3YsY3B1
LWludGM7Cj4gPiA+ICAgICAgICAgfTsKPiA+ID4gICAgIH07Cj4gPiA+Cj4gPiA+ICAgICBjcHUx
OiBjcHVAMSB7Cj4gPiA+ICAgICAgICAgY3B1MV9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7
Cj4gPiA+ICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOwo+ID4gPiAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gcmlzY3YsY3B1LWludGM7Cj4gPiA+ICAgICAgICAgfTsKPiA+ID4gICAg
IH07Cj4gPiA+Cj4gPiA+ICAgICBidXNlcnIgewo+ID4gPiAgICAgICAgIGNvbXBhdGlibGUgPSBy
aXNjdixidXNlcnI7Cj4gPiA+ICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmY3B1MF9p
bnRjIDE2ICZjcHUxX2ludGMgMTY+Owo+ID4gPiAgICAgfTsKPiA+ID4KPiA+ID4gd2lsbCBhbHdh
eXMgcmVwb3J0ICdidXNlcnInIG5vZGUgYXMgZGVmZXJyZWQgd2l0aG91dCBjYWxsaW5nIGFueQo+
ID4gPiBidXMgcHJvYmUgZnVuY3Rpb24uCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggd2lsbCBtYXJr
IGFsbCBzZWNvbmRhcnkgbm9kZXMgcGFzc2VkIHRvIGlycS1yaXNjdi1pbnRjCj4gPiA+IGRyaXZl
ciBpbml0IGZ1bmN0aW9uIGFzIGluaXRpYWxpemVkIHRvIGJlIGFibGUgdG8gYWN0IGFzIGNvcnJl
Y3QKPiA+ID4gSVJRIHBoYW5kbGUgbm9kZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRG1p
dHJ5IER1bmFldiA8ZHVuYWV2QHRlY29uLnJ1Pgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW50Yy5jIHwgOCArKysrKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbnRjLmMKPiA+ID4gaW5kZXggNGFkZWVlMWJjMzkxLi5jMDFhNGU4ZDQ5ODMgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gPiA+ICsrKyBi
L2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gPiA+IEBAIC0xNTUsOCArMTU1LDEw
IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5vZGUsCj4gPiA+ICAgICAgICAgICogZm9yIGVhY2ggSU5UQyBEVCBub2RlLiBXZSBvbmx5IG5l
ZWQgdG8gZG8gSU5UQyBpbml0aWFsaXphdGlvbgo+ID4gPiAgICAgICAgICAqIGZvciB0aGUgSU5U
QyBEVCBub2RlIGJlbG9uZ2luZyB0byBib290IENQVSAob3IgYm9vdCBIQVJUKS4KPiA+ID4gICAg
ICAgICAgKi8KPiA+ID4gLSAgICAgICBpZiAocmlzY3ZfaGFydGlkX3RvX2NwdWlkKGhhcnRpZCkg
IT0gc21wX3Byb2Nlc3Nvcl9pZCgpKQo+ID4gPiArICAgICAgIGlmIChyaXNjdl9oYXJ0aWRfdG9f
Y3B1aWQoaGFydGlkKSAhPSBzbXBfcHJvY2Vzc29yX2lkKCkpIHsKPiA+ID4gKyAgICAgICAgICAg
ICAgIGZ3bm9kZV9kZXZfaW5pdGlhbGl6ZWQob2Zfbm9kZV90b19md25vZGUobm9kZSksIHRydWUp
Owo+ID4KPiA+IFRoZXJlIGlzIGFscmVhZHkgYSBwYXRjaCBvbiBMS01MIHRvIGFkZHJlc3MgdGhp
cy4KPiA+IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2tlcm5lbC9tc2c0OTI5ODg2Lmh0
bWwKPgo+IElmIHRoaXMgaXMgYSBmaXgsIHdoeSBpcyBpdCBidXJpZWQgaW4gYSBodWdlIHNlcmll
cyBhbmQgbm90IGJyb3VnaHQKPiBmb3J3YXJkIGFzIGFuIGluZGVwZW5kZW50IGZpeCB0aGF0IG5l
ZWRzIHRvIGJlIHBpY2tlZCBlYXJseT8KCkRtaXRyeSBzYXcgdGhpcyBpc3N1ZSBpbiBhIHRvdGFs
bHkgZGlmZmVyZW50IGNvbnRleHQgd2hpY2ggaXMgbm90CnJlcHJvZHVjaWJsZSB3aXRoIGV4aXN0
aW5nIERUUyBmaWxlcyBpbiBrZXJuZWwgc291cmNlcy4KClRoaXMgaXNzdWUgb25seSBtYW5pZmVz
dHMgd2hlbiBzb21lIHBsYXRmb3JtIGRyaXZlciBEVCBub2RlCnBvaW50cyB0byB0aGUgcGVyLUhB
UlQgSU5UQyBub2Rlcy4gRm9yIGV4YW1wbGUsIFJJU0MtVgppcnFjaGlwIGRldmljZSBEVCBub2Rl
cyBwb2ludCB0byBwZXItSEFSVCBJTlRDIG5vZGVzLgoKQ3VycmVudGx5LCBhbGwgUklTQy1WIGly
cWNoaXAgZHJpdmVycyAoSU5UQyBhbmQgUExJQykgYXJlIHByb2JlZAplYXJseSAobm90IGFzIHBs
YXRmb3JtIGRyaXZlcnMpIHNvIHdlIGRvbid0IHNlZSB0aGlzIGlzc3VlIHdpdGgKZXhpc3Rpbmcg
aXJxY2hpcCBkcml2ZXJzLgoKVGhlIExpbnV4IEFJQSBzZXJpZXMgaW1wbGVtZW50cyBSSVNDLVYg
aXJxY2hpcCBkcml2ZXJzIChQTElDLApBUExJQywgYW5kIElNU0lDKSBhcyByZWd1bGFyIHBsYXRm
b3JtIGRyaXZlcnMgKGxpa2UgeW91IHN1Z2dlc3RlZCkKc28gdGhpcyBpc3N1ZSBpcyBlYXNpbHkg
c2VlbiB3aXRoIExpbnV4IEFJQSBzZXJpZXMgaGVuY2UgdGhlCmNvcnJlc3BvbmRpbmcgZml4IGlz
IHBhcnQgb2YgdGhlIExpbnV4IEFJQSBzZXJpZXMuCihodHRwczovL3d3dy5zcGluaWNzLm5ldC9s
aXN0cy9kZXZpY2V0cmVlL21zZzYzODA2OC5odG1sKQoKClJlZ2FyZHMsCkFudXAKCgoKPgo+ICAg
ICAgICAgTS4KPgo+IC0tCj4gV2l0aG91dCBkZXZpYXRpb24gZnJvbSB0aGUgbm9ybSwgcHJvZ3Jl
c3MgaXMgbm90IHBvc3NpYmxlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
