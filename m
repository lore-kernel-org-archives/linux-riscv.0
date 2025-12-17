Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085BED5C0C9
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 03:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3euVgCIWARoNpU4/SZiH8fcnEjkOdlxPAEoc6yDwo0E=; b=JUjSPxNeXdtia+
	N45ggJLeXzQvODX6AJzMX47V7nMaR4R5wqshv21AJJF+MTXg780TMz1CIZT1n9Su1CzJ89ApjXLf3
	6/xv1QnWy10TgUVB5S+sZ9lxG0JtbWbCt5fLuVj/Rmk/ziL4RemVVpfg07I79OGVL+AGfPhCV+azI
	oKhCANbc94svACVxbhwO6orOpwHUkTI8dsjVM+Hm+AA31ZY6/U7Vrh/qXzsKUxxLtHNhib9QhHa0E
	k3MWh+hDHYiV6Nmf3A9DbGDnbxfWPaU9pGsTeLCFh9zWV3lCRDJsIU/wq/JsRfyqFs5oo2LV9pPMQ
	THAqWm2eApyic1iDtL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vViWn-000000067my-0TWl;
	Wed, 17 Dec 2025 03:48:41 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vViWj-000000067md-3ebf
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 03:48:39 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7881b67da53so47021517b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 19:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765943316; x=1766548116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T94a7cnx4YfqtwUokEvbKCG0vEzrPFcv5snanGGxpYk=;
        b=oIIrW5dpPInTB0/d+08y/eShk4CUqMJSxxfHrSZKOM3KfjWeIzZyreud/SLDgcehjH
         h+xo2trvmKIKfBl2FQ0a+Hw+qeWn1ZCHJ7IX8m/HBJ6XRWmaw0uu/MO9OIPZFqunivKp
         amjv+tsb7IJPxCA230I2DBdprX55ops+MH3IOFBCPke/RFf01UWrBX7eg3WyMyZqYmHs
         IWnizZ+YCKVtnjUuwikYZ53BZVCKIrS+lCT9m2u9EB89s3G2Fepwv3hPJpZugKCg3mRc
         rFWsgQKMz9YtAIADfzc3g8VzauObKVcB3Zf+BuBLUKUQ0FL3vmBUGGByPA6cutdUmvGg
         ZUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765943316; x=1766548116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T94a7cnx4YfqtwUokEvbKCG0vEzrPFcv5snanGGxpYk=;
        b=Yf97jx2HWoV/MHOMhZjI00xmK6yjQqDbti9wTXtybqfLQRkMOsGIWnaIw+Tb8D0IXb
         pcT7/nnv/aMK5yVtfJXrLJJMssMi/1tz0ijVcr5Fn01bwg9UKo0vcDdixhM9KZNCUwRR
         RY0cZ3q25jze7GsyINx+aSP61qT4PR5jH4aehUoSm/HVw64AJnzXnijfhn6qYDqk1eqg
         q0mtTMzuNN4SCFMJ3v58WhVRAMIxdsU7FYxdNd2T+vAbKBSeKv21/MPJ8NAFPOOdOoKu
         x/ygsAGjt8rzh8yTFagEOtzYNLpvP14LkPyMj9dzv6odZweDJ2M9xgVJPpuPt1+hjg+m
         Alxw==
X-Forwarded-Encrypted: i=1; AJvYcCU0uHsHs2NBohf5inK6tM+nPQKMFxCvJ3TDimo+BR02Mikn6Tl3JMO7rsmCzRCJQiujIIcqweuSsnffTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaNskjFYoyY3BV09GkWBYP0G2gMh6vj1d5c2xQKjYYIkFq6KRG
	4KmalUlD0bbaeV62aXTvogdka7z6/qmdx2NLB0ZWGPEGw0cZ8AAHxF8LqnVBSh37+4I9eyekxOu
	f0+u8liDyowQR28HTDOQHwuDR/f/4QP1vgXudxrZeWA==
X-Gm-Gg: AY/fxX5BACaR+HqxHtY2JFyDMvv5ZWrtEu4PZ4GlhScM7u4ATIWAzHwdvyzSQ1I1QP9
	LVVcPou4IERQLrkLlGsDuK+rCQS1+scF8qZ5htA/ntngwkm9WWelKTdXP633F4dd64hxR/VRbqC
	Mp2HBGIlN99iStNwaQWdwt661yGt1fwXnBbbtvbN/jvkxEXHRmq6d3wyazw4Wo1N9xI/wRB581/
	JNjSr738CSlGwJGWO3leYxHO8yOWwwRNH1XO/OpSuBN5jDGOl9f8337lj4g8DJdEnOpluuGxK38
	X21ZQdtZ0vwTxbgDCvEZul5bTg6mwVH+9SmiPMmScL3y
X-Google-Smtp-Source: AGHT+IGCRy+MgcC+gjoWTqizBxZYC2VIXnORXboRecI5mqVuneW7cQwX/1bYSoQ1MM7mSJb8g348UoINohu6U0LgAzg=
X-Received: by 2002:a05:690c:688b:b0:786:2f01:16fb with SMTP id
 00721157ae682-78e68331c64mr142690047b3.26.1765943316482; Tue, 16 Dec 2025
 19:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-4-a0d256c9dc92@riscstar.com> <b3af2b4a-1d70-4c49-a794-b4006e930fd7@kernel.org>
In-Reply-To: <b3af2b4a-1d70-4c49-a794-b4006e930fd7@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 11:48:25 +0800
X-Gm-Features: AQt7F2p6ARP-MpjYyTdAooXcg_070s9HlwUsyU9wcd7x5M0Aq4HZ6ZgO_uPeqUI
Message-ID: <CAH1PCMZdsUfurDqeRh2WQig=VzNx1k_3Z=1m_3TdJd2bYX=nVQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_194837_919359_BE6BAD39 
X-CRM114-Status: GOOD (  11.42  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTE6MzTigK9QTSBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMTYvMTIvMjAyNSAxNDozMiwgR3VvZG9uZyBY
dSB3cm90ZToKPiA+IEFkZCBjb21wYXRpYmxlIHN0cmluZyBmb3IgU3BhY2VtaVQgSzMgSU1TSUMu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+
Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvcmlzY3YsaW1zaWNzLnlhbWwgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGltc2ljcy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2
LGltc2ljcy55YW1sCj4gPiBpbmRleCBjMjNiNWMwOWZkYjkwYmFjY2VjZTAzNzA4ZjRhMzgxMDg0
YjIyMDQ5Li4xNTJlZmY3MzM1ZGQ4NDU3YmYwMWQwMjQ5N2I3MDgwZjJhMDJhYjY1IDEwMDY0NAo+
ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL3Jpc2N2LGltc2ljcy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YsaW1zaWNzLnlhbWwKPiA+IEBA
IC00Nyw2ICs0Nyw3IEBAIHByb3BlcnRpZXM6Cj4gPiAgICBjb21wYXRpYmxlOgo+ID4gICAgICBp
dGVtczoKPiA+ICAgICAgICAtIGVudW06Cj4gPiArICAgICAgICAgIC0gc3BhY2VtaXQsazMtaW1z
aWNzCj4KPiBBbHNvIG5vdCBzb3J0ZWQuIHMgPiBxLgo+CgpUaGFua3MsIEtyenlzenRvZi4gSSB3
aWxsIGZpeCB0aGlzLiBxIGdvZXMgZmlyc3QuCgpCUiwKR3VvZG9uZyBYdQoKPiBCZXN0IHJlZ2Fy
ZHMsCj4gS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
