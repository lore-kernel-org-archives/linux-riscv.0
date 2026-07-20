Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0557C4451B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 03:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wb4qi6YFEfqZ5v4DP7QdZ8lpdIu4N91Z9hcon76v5lM=; b=eZYeI5PAJalSbs
	Xs0rBRUC2roMlmzb+wSom3JBVitovUBbbTZGQL4w/5gBVmKA4VdcWad58S6e7REGlbEBGj0vUcxie
	fUcXPnZrEEyxU2FlVC9ekJpUsZS3abiewoDtrZ9zk4QSYmxX8xEE2U9OVmBZxJkoaVRqdK9jWPMRd
	U8caCky2D4Zu3axFCHp34m7M81aXYIaUN8cWyQDEr2IM7WWdjDJoPq6jS86qIx2gM34TgU1IwjfHE
	MXWtTxmBMfL5UUma/aF/gnIkKhlmyH7VRBSqMnCbSVblXyEXlVp8Z9+pqqB5nu1YdGYV1NE9fnYmy
	6SVqMKF8gBCNHuKkP+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlemb-00000005mlF-1lhj;
	Mon, 20 Jul 2026 03:35:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlemY-00000005mkr-3MAQ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 03:35:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493f75f7172so75062905e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jul 2026 20:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784518505; cv=none;
        d=google.com; s=arc-20260327;
        b=nwJkhZAYuNSBdmjM6UVN68TPEvK7a40kY09dJH29r6enIa82AA345NGA9kFPHDx7Nx
         Ms+lBeq2RHnZdWlp7eIkH2CRaQO636b30OJyZixNsgPrMZTVRgfcdhsOT3fEnGdA5I7f
         q2xLhMADCOZGkNaU62581Ii2qEMBtFlYhBDWtTezJStvTjYJgioj3sPQNkOU1iV4dzAy
         CmOaY/J2xFMiJD4tHZeNdPVWDWJPt9cPK2xWO/S5f97HyKpX/tQWqdVxOaFE3b4owfrT
         LWmuMwKl7mjvzq953NosYeAXfqtyE6jYDEc7c/gql7j4v+UsoOlQTl7Fl9odXTw8hNT4
         ci/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kw7kjOxHxRLV8m6fVwSO1oFnQm+Mlz0UQI4Ihy/fR10=;
        fh=REhztLuxt47K8cs92YJoYrcDfsu7aAhHpOg2PH77WQM=;
        b=ZRa3InaJ7kvYD3c3Tk2AciOqg6mvAInmk4eSHu1kIA991dQnReOLLaQTKTn8QQXCXV
         b2WH3ULqbfbFRZhY+nnMZbnzLje+h44DPeQInBsKe7KJWASBBsqOvq1wJ5AcCf61lp2J
         lqr2PFRBDanBv7FxsCkL7Nf0THrIBQT5Gwa3d55qcql6CcYlY4kF+2Rr34HNU4dex+i3
         6rCFPv2vvqmVwOoCztxGovsmbp/V6ANFcaeg0iO8nFKRJ1kVdSCQuwQwcUkVGemFXe26
         829H93iby4FHL4XcLvRgq4o7L/PqkKMwNnbcoG8/9mUUJZL6TBEJ1FrEhPnhqLZIshF+
         Cx8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784518505; x=1785123305; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kw7kjOxHxRLV8m6fVwSO1oFnQm+Mlz0UQI4Ihy/fR10=;
        b=luB0KSuEL11bgy1RCqrTD9wFfgBlr7K3YDeRG74UwAkg0OvDApaeI2Ye29vkgt07Uh
         ULD6NU/iPPlnkunyYO0DpA1kyDQHVHp0PKDzS3o0OXnFs/1m/F3A6DijnzkTE8wWa//y
         ww3EE48WOQW2R2r407yGOC+bkUBVqGRD5xegtjSRiYGU4wF9bwMhpV030lybh0Bfi3gL
         XlEJeA+oq91p4zFh/sJurEM6SwYvcxAL0y6caJOiQwx5PxpemleLzFyt8osUjxw2zR/Y
         LQ5M53RlnNpFKMk1IsgFVYjQwnM2YgzzNfB8khI8ALZigPQF1AGojR5eBtoZL22d1Qac
         69Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784518505; x=1785123305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kw7kjOxHxRLV8m6fVwSO1oFnQm+Mlz0UQI4Ihy/fR10=;
        b=Mw092Jiqy0Ot2TqbFB1sfwkZ0aMUqLdzTsp5TC7k7kNCq24SbyIiH3KQrBU3x3rFwL
         vcqPT2Njxni8ho5b4UychnZLJ/NdPNu00kSUj1oGZUfrZL7RA86eholp2YuzQMqoyppr
         ld1sQFdyiz+FI5Qlbtad5gYWW4JtQNqsQypeRYub7lWlkOUZNs/dPxHAdL9sm4mXe6oZ
         NommXTYmgHQEP1cZ1O0ZI935VehG8gO907k5rS+tbx2haIBw5A0d+niSELTpxJShzMRr
         OWgDxBPy1PZH7+zDZzW+Exzi8rgeqWuWwWj5/G2oDaC3SLwdrKpV074LPA94giELsD7u
         M8wA==
X-Forwarded-Encrypted: i=1; AHgh+RppLoRBfrX6xsFHe/Svt5KAC1Kyr8EZLhCIbv5wB3a3i4qcZZwge9kA1A7y6WBmCGxnHUxtaK16qvxI7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOWo38yKyJl9ozryJg2uPw02nSP0dZz8YjJ9onVvTWY6BOIRtE
	ewexYvf1LYramhlQa199rQ5Gi29GBV8FEReQlgzbIt8q6EVe7JLocq80H1qr3XSYKU7zxnZzZOf
	M8j7GvEq9UhvDNf8OG97cB9/WhKUAMnNgC6SkMnQZhQ==
X-Gm-Gg: AfdE7clSygqoxB2d6Xgms4mVyxkVZBelRvlV/mnuYtynLqqpTRzLFh9XoyJFLAqEdaC
	n5UUHbjJCHzPaxA3dz9eaU1QBNLXoTh2auV+XJKSCXr2AIdupXsC+m5OEzZB2p4la603Tv/bTPm
	652NMotuYUK5Asf5Wnkg9NTs95mViMjGcNgFkhR6vdqwzH4cVLZiVxDyQrqD/Y9nhgkcA87RmEo
	J2iVjP31U7h2JTXkT40+pAODbsU6J7EZV1uPKdhmgNOhd9vhyxO3FQD9KcvYMcVO72952eBiJ2y
	CtFTRm9oNslLSnlvNPAK9d1QZ2urvP1DSpNXUoBfQ0RKCwXcSR77pF1U3caz7qvj3gfAcKAIp6+
	CxPZyOQ==
X-Received: by 2002:a05:600c:6dda:b0:493:e79e:daa6 with SMTP id
 5b1f17b1804b1-4954a50c4f2mr86313805e9.33.1784518504712; Sun, 19 Jul 2026
 20:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Jul 2026 09:04:51 +0530
X-Gm-Features: AUfX_mycM3abyurInz4GEtF04WLZnR3xSruCR8KVYYJjftJYalBrFGLTqXxDK64
Message-ID: <CAAhSdy35CocaJELiX=rMD3cuSsrsUo0wjF7xkoLGh-GXNca5wQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Use GENMASK for base address masks
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_203506_917097_25DF6E4F 
X-CRM114-Status: GOOD (  18.53  )
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTA6MDTigK9BTSBQZW5ncGVuZyBIb3UgPHBlbmdwZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBJTVNJQyBEVCBiaW5kaW5nIGFsbG93cyByaXNj
dixndWVzdC1pbmRleC1iaXRzIHVwIHRvIDcgYW5kCj4gcmlzY3YsaGFydC1pbmRleC1iaXRzIHVw
IHRvIDE1LiBPbiBSVjMyLCBndWVzdC1pbmRleC1iaXRzPTcgYW5kCj4gaGFydC1pbmRleC1iaXRz
PTEzLCB0b2dldGhlciB3aXRoIHRoZSAxMi1iaXQgSU1TSUMgcGFnZSBvZmZzZXQsIGlzIGEKPiBi
aW5kaW5nLXZhbGlkIGxheW91dCB0aGF0IGNvbnN1bWVzIGEgMzItYml0IGxvdy1hZGRyZXNzIG1h
c2suCj4KPiBUaGUgcGFyc2VyIGFjY2VwdHMgdGhpcyBlcXVhbGl0eSBjYXNlIGJlY2F1c2UgaXQg
cmVqZWN0cyBvbmx5IHZhbHVlcwo+IGxhcmdlciB0aGFuIHRoZSByZW1haW5pbmcgYml0IGJ1ZGdl
dC4gVGhlIGJhc2UgYWRkcmVzcyBjYW5vbmljYWxpemF0aW9uCj4gdGhlbiBidWlsZHMgdGhlIGxv
dy1hZGRyZXNzIG1hc2sgd2l0aCBCSVQoc3VtKSAtIDEuIFdoZW4gc3VtIGlzIDMyIG9uCj4gUlYz
MiwgdGhhdCBleHByZXNzaW9uIHNoaWZ0cyBhbiB1bnNpZ25lZCBsb25nIGJ5IGl0cyBmdWxsIHdp
ZHRoLgo+Cj4gS2VlcCB0aGUgbGVnYWwgZXF1YWxpdHkgbGF5b3V0IGFuZCBleHByZXNzIHRoZSBt
YXNrIHdpdGggR0VOTUFTSyhzdW0gLSAxLAo+IDApIGluc3RlYWQuIFRoZSBleGlzdGluZyBwYXJz
ZXIgYm91bmRzIGd1YXJhbnRlZSB0aGF0IHN1bSAtIDEgaXMgYmVsb3cKPiBCSVRTX1BFUl9MT05H
IGF0IGJvdGggbWFzayBzaXRlcy4KPgo+IEZpeGVzOiAyMWE4ZjhhMGViMzUgKCJpcnFjaGlwOiBB
ZGQgUklTQy1WIGluY29taW5nIE1TSSBjb250cm9sbGVyIGVhcmx5IGRyaXZlciIpCj4gU2lnbmVk
LW9mZi1ieTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0uCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoK
PiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jIHwgMTMgKysr
KysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3Rh
dGUuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IGluZGV4IGI4
ZDFiYmJmNDJmNzMuLjk1MDVkZGJkOWVlYzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbXNpYy1zdGF0ZS5jCj4gQEAgLTcsNiArNyw3IEBACj4gICNkZWZpbmUgcHJfZm10KGZtdCkg
InJpc2N2LWltc2ljOiAiIGZtdAo+ICAjaW5jbHVkZSA8bGludXgvYWNwaS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvY3B1Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9iaXRtYXAuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvaXJxLmg+Cj4gQEAgLTc2OSw5ICs3NzAsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBp
bXNpY19wYXJzZV9md25vZGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICAgICB9Cj4gICAgICAgICBnbG9iYWwtPmJh
c2VfYWRkciA9IHJlcy5zdGFydDsKPiAtICAgICAgIGdsb2JhbC0+YmFzZV9hZGRyICY9IH4oQklU
KGdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cyArCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBnbG9iYWwtPmhhcnRfaW5kZXhfYml0cyArCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBJTVNJQ19NTUlPX1BBR0VfU0hJRlQpIC0gMSk7Cj4gKyAgICAgICBnbG9i
YWwtPmJhc2VfYWRkciAmPSB+R0VOTUFTSyhnbG9iYWwtPmd1ZXN0X2luZGV4X2JpdHMgKwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdsb2JhbC0+aGFydF9pbmRleF9i
aXRzICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTVNJQ19NTUlP
X1BBR0VfU0hJRlQgLSAxLCAwKTsKPiAgICAgICAgIGdsb2JhbC0+YmFzZV9hZGRyICY9IH4oKEJJ
VChnbG9iYWwtPmdyb3VwX2luZGV4X2JpdHMpIC0gMSkgPDwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZ2xvYmFsLT5ncm91cF9pbmRleF9zaGlmdCk7Cj4KPiBAQCAtODUwLDkgKzg1
MSw5IEBAIGludCBfX2luaXQgaW1zaWNfc2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUg
KmZ3bm9kZSwgdm9pZCAqb3BhcXVlKQo+ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAg
ICAgICAgYmFzZV9hZGRyID0gbW1pb3NbaV0uc3RhcnQ7Cj4gLSAgICAgICAgICAgICAgIGJhc2Vf
YWRkciAmPSB+KEJJVChnbG9iYWwtPmd1ZXN0X2luZGV4X2JpdHMgKwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZ2xvYmFsLT5oYXJ0X2luZGV4X2JpdHMgKwo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSU1TSUNfTU1JT19QQUdFX1NISUZUKSAtIDEpOwo+
ICsgICAgICAgICAgICAgICBiYXNlX2FkZHIgJj0gfkdFTk1BU0soZ2xvYmFsLT5ndWVzdF9pbmRl
eF9iaXRzICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdsb2JhbC0+
aGFydF9pbmRleF9iaXRzICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IElNU0lDX01NSU9fUEFHRV9TSElGVCAtIDEsIDApOwo+ICAgICAgICAgICAgICAgICBiYXNlX2Fk
ZHIgJj0gfigoQklUKGdsb2JhbC0+Z3JvdXBfaW5kZXhfYml0cykgLSAxKSA8PAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnbG9iYWwtPmdyb3VwX2luZGV4X3NoaWZ0KTsKPiAgICAg
ICAgICAgICAgICAgaWYgKGJhc2VfYWRkciAhPSBnbG9iYWwtPmJhc2VfYWRkcikgewo+IC0tCj4g
Mi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
