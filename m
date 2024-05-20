Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFBDC04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 20 May 2024 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dszDnm0AFixYqAuUFKJbpKSxhGIX4ysQeAgF+BKgas=; b=XrpxkcqF3X38QP
	5Ou69WQHcQO4C8oQJZR8psvgNLU/1FEvDVCHMkc21HzGc6c4pBQauA55K6BTpMBJheOvbzCOmizMJ
	FJPM5xiiAx72ot6fxzSaLI/tcnjoOY6x+FDVQ0WjpMBSCOaXx1u+Hmk4LYJkIH34EO6RAXcdfbRdf
	Hx5HT+86eRQszxrMbuNEuaTd+Lup9ysMoYrC6Qhvmw569ScS8uxPXtlOBRaT8ETGWoPQSNCBVtMCr
	HlXULCWarVGmMRMXjpIntzamOpneiLzpZ163qUyi57M/HIAHFpn+p3MeB05bHNNuOqvGSo7/L6/fZ
	OXZZZGd4+lpNBEC/qhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zV0-0000000E0vW-1x3f;
	Mon, 20 May 2024 09:40:06 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zUt-0000000E0u2-2dlm
	for linux-riscv@lists.infradead.org;
	Mon, 20 May 2024 09:40:01 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-574b3d6c0f3so7684881a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 May 2024 02:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716197996; x=1716802796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TE4Bjv61tGt6MfM/w4KNZws90Cz9+Zg1L5iuglgNgRU=;
        b=Tb8LHyxkpYOdHmXw2T2HQd6U5MbBQfT2Pozq69G+sFOY6PyLnXbovBDuG9+N54I3gi
         KAbYDZhxGUCNbX17LimNaQmtpeXy9NpNPTvMCnPkIBfr+yk9ETNo1UiAHUF4vgrjOr9u
         ydjqB/R+hImzyzlVaQ/13GMi1RPzrMad3y5JowUlVJ/rM9gx/y6Hvs7j63w8bN484mW2
         4ck51Hp24NR7K/vanJOvD2nzARbB68enRspnioDmr4mOEvmEPaYeGG88JZwjNkwCcaL8
         lWBGKE50O7y3Q+HkXf7yJGC7Xu8WKzLSipTVE7bOkt3gKz0gXQI9ju0xE6d/7H/7j4fQ
         8sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716197996; x=1716802796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TE4Bjv61tGt6MfM/w4KNZws90Cz9+Zg1L5iuglgNgRU=;
        b=oBBbyTnVBta7LzL9cBpFv0jhV5ToAcKhYCW+lg+cyDZ0KfMlAx4u8DpNlMZEqMpHG3
         BvzZcR3X6aGAUNcJCwDbO/8D4kDg5lb/d1cJBacIHmPjTgRgwwdMqSZ+9H6yt4+DIdhm
         X+AWAkzjTLwGGk0w6qv7wKNc4hB/ksNxBGo3Qwr4C92up3dk5m77jBSTMz0mBIZ81jkj
         ZH+HmS0Ruj1SvpMGjznKx5cW0ZxrZfpJLJ9WlYM4mi9lc8pIneqAZzij9JZqBSmd9nMH
         eUR5pbIInS0Jm2Bko8xV7Zgy9i6ekO2D02zCsgptPzKJTWfdVr5tiEsPCdjCXZ9LU2Oq
         j7WA==
X-Gm-Message-State: AOJu0Yw/zeOgpi3PgyDf5QpRXqYLnN+iPcPvSZoxJdUG5a+SYjqjTlDn
	IwRAoJfUNY43B76rvpeGQixEq6K7tRaInDcuqXCJCeDzl06hyCU6ZAszSL/lEWQ92ZSCjrPJR66
	95wkW8M+841u+Tmqi5enQgmUK2GI=
X-Google-Smtp-Source: AGHT+IFTjPcbAOBoZPuDA+2ZVhZiSxbh5DItcS/p4qaB3QtONbnWddERDXFwXh2FDVKJSw9VKN4cMxjpfjWNaBqlbQ4=
X-Received: by 2002:a50:f60d:0:b0:571:fc6b:966c with SMTP id
 4fb4d7f45d1cf-5734d5bec1amr18121585a12.13.1716197996125; Mon, 20 May 2024
 02:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240519175906.138410-1-kanakshilledar111@protonmail.com>
 <20240519175906.138410-3-kanakshilledar111@protonmail.com> <171614715439.2941344.11264816105918092609.robh@kernel.org>
In-Reply-To: <171614715439.2941344.11264816105918092609.robh@kernel.org>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Mon, 20 May 2024 15:09:44 +0530
Message-ID: <CAGLn_=tLdJU1F-i9YV5aCZQbS0L7y7Wu+_k6Dn=6HwH5JmZoMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: cpus: add ref to interrupt-controller
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Kanak Shilledar <kanakshilledar111@protonmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_023959_753517_39A1D717 
X-CRM114-Status: GOOD (  16.25  )
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

T24gTW9uLCBNYXkgMjAsIDIwMjQgYXQgMTowMuKAr0FNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4KPiBPbiBTdW4sIDE5IE1heSAyMDI0IDIzOjI5OjA2ICsw
NTMwLCBLYW5hayBTaGlsbGVkYXIgd3JvdGU6Cj4gPiByZW1vdmVkIHRoZSByZWR1bmRhbnQgcHJv
cGVydGllcyBmb3IgaW50ZXJydXB0LWNvbnRyb2xsZXIKPiA+IGFuZCBwcm92aWRlIHJlZmVyZW5j
ZSB0byB0aGUgcmlzY3YsY3B1LWludGMueWFtbCB3aGljaCBkZWZpbmVzCj4gPiB0aGUgaW50ZXJy
dXB0LWNvbnRyb2xsZXIuIG1ha2luZyB0aGUgcHJvcGVydGllcyBmb3IgcmlzY3YKPiA+IGludGVy
cnVwdC1jb250cm9sbGVyIGF0IGEgY2VudHJhbCBwbGFjZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBLYW5hayBTaGlsbGVkYXIgPGthbmFrc2hpbGxlZGFyMTExQHByb3Rvbm1haWwuY29tPgo+ID4g
LS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sICAgICAgIHwg
MjIgKy0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMjEgZGVsZXRpb25zKC0pCj4gPgo+Cj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdt
YWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4KPiB5YW1sbGludCB3YXJuaW5n
cy9lcnJvcnM6Cj4KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgo+IC9idWlsZHMvcm9i
aGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2NwdXMueWFtbDogcHJvcGVydGllczppbnRlcnJ1cHQtY29udHJvbGxlcjogJ29u
ZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgo+ICAgICAgICAgQWRk
aXRpb25hbCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJyRyZWYnIHdhcyB1bmV4cGVjdGVk
KQo+ICAgICAgICAgJ3R5cGUnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAgICAgICAgICAgICAg
ICAgaGludDogRFQgbm9kZXMgKCJvYmplY3QiIHR5cGUgaW4gc2NoZW1hcykgY2FuIG9ubHkgdXNl
IGEgc3Vic2V0IG9mIGpzb24tc2NoZW1hIGtleXdvcmRzCj4gICAgICAgICBmcm9tIHNjaGVtYSAk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvaW50ZXJydXB0cy55YW1sIwo+
Cj4gZG9jIHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tkb2NzKToKPgo+IFNlZSBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRj
aC8yMDI0MDUxOTE3NTkwNi4xMzg0MTAtMy1rYW5ha3NoaWxsZWRhcjExMUBwcm90b25tYWlsLmNv
bQoKSSBoYXZlIGZpeGVkIHRoZSBhYm92ZSB3YXJuaW5nLgoKPiBUaGUgYmFzZSBmb3IgdGhlIHNl
cmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlmZmVyZW50IGRlcGVuZGVuY3kK
PiBzaG91bGQgYmUgbm90ZWQgaW4gKnRoaXMqIHBhdGNoLgoKQ2FuIHlvdSBwbGVhc2UgY2xhcmlm
eSB0aGlzIHBhcnQ/IElzIG15IGJhc2UgY29tbWl0IElEIGluY29ycmVjdD8KSSBhbSBjdXJyZW50
bHkgdXNpbmcgdGhlIDYuOS4wLXJjMyBrZXJuZWwgdmVyc2lvbiBmb3JtCmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3JvYmgvbGludXguZ2l0LyByZXBvLgoK
VGhhbmtzIGFuZCBSZWdhcmRzLApLYW5hayBTaGlsbGVkYXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
