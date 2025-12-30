Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84BCE95A8B
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xc9kBHriV98AS72M6WUCmuTN8Y83lP7qHis+8dds2UQ=; b=snMJOuueugGAwK
	T9adoxH3kC5hpWP+KQsUYFbbipv1mlL1FS2QVenc9MiS0BRICQ0BYNR8E6qq9UwDW2RCv/LMebRuo
	TWGCQLQnFJT4RDEMq5Lu33o+MYlja7uD8f52X6honx8WP/p0/FgEQotgi/65G5femsrnkAjGBqdiK
	kjAsWXR2jBenwuZ8TL5K/wvWhcOcCB+5pF4YAFbL//nyEiqZa42BRqb3XAUeDj7XC2xKGE2dydYL/
	u/CNDAqUYG8+CYImD4xMDWURn11iUmR8Fu9XeYTZbSyWIkLz9r9S/8GQ5Ch0v3vJILw73zawMCY42
	M8PwKkFV0+RYBpudiztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaDl-00000004t1O-0Nuy;
	Tue, 30 Dec 2025 13:57:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaDi-00000004t0x-0e2Z
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 13:57:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0834769f0so98203885ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767103024; x=1767707824; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=APWv0N7VAVEafE/tRaAfzsntSA7mb1asugldnCJpAhE=;
        b=amiD6LdbXE2+rn5B+yAROArlp3Zd/2kxCmtP6sjM3k9dj7gtxqM/kU5V4sHRx7eSMa
         zyXzgLORZ0ILqiEkgb7luQ+1PLhaZdcDMOK+LvLN0rKK+a8d3R9mONZPA/vQgVECzkZx
         vn/MwN2TMQofkbAtIC5pBX0Y5YdvN/gGffwFAlsYe4dIfndUvPdP3BRjs+ihDBcZnrWT
         ourMVlVT11gpxjRrJLMHiYzreutIkoS/agteEVRgrjw4CPavEyC0L19yCa/c/43vcTOM
         2Cl2fg/4Mm+g7ziDEMMQvx2T91wvcmi8+LS1CBYWW/4HjRalpINz/VEpx4+uI4PLv0VA
         LxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767103024; x=1767707824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APWv0N7VAVEafE/tRaAfzsntSA7mb1asugldnCJpAhE=;
        b=ILk4SB5B1qDcZg+3+VnHx4D16ipl+EcJwsQdP/b6LkB0wTqa+b+2fISAwqnlcxazHD
         yoUHjKUuZNnDFo+NuX+SENGuLgspiMVzq6NZBDr6LsRIe0skiR+CMSzlz6P5WVXQ1Rdz
         YlDrCY34behms+4Sz5blrAuLnxRJVSFy1RqvjBJ77k1Sh6SNrXHUXRmlyRHHNaewF7+w
         600j5vHirFEiWLKr4UPZQ1HkhP964urcuGYKH//YfVqqqbbt7Dz8Jahb79o8AC7OU54t
         HEakoe2N/3Ch8BooCqpDQ7M5395uchdP4BCuDMz3git//lDXVtJO+k7y+LT8ebUV2n7o
         /+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVWJKLsttgBzdxXemtnQcj9eCgEN6fXAUa3Fasi/7QIr3t7WVDj4pfh2UQJVgq/z76C2E7U4AEnRVO6yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoVF1JEvoPps9yUm4dXAoo0yRP12FXovxMNpjZo6+q40GNfI5S
	Ez165xTFZiA5p8NLzNBSQVDAhZYRToD5loxVTQAORyXTtnr6R9YnhxTTFfyKOqTdwPU=
X-Gm-Gg: AY/fxX7M+nCtFlRpPDL1e1souqq8pzN6LIUQtM6gw+0NLRvqxluQrx/tuy8etrx8Jcu
	W44OPA/Fe9g5e3wPUIKke83UNkQtnKS8FYxMabBHq91LJEMUJQsnRvPEgeYlQD+AMRQMdETovwD
	rS6lWWNsW5lSpjMeQecuxhMftkSF4QMcUc2nQ0ryhUfvnwES7vAlSck6LGDdi7qMjlf/dpweo80
	X3wl48qjWzqdxQSxWgd4bP+/E+7rYGzNs//ITqm8jIauK1rX5/vl5SnmbiMevo5L3o+NfAKFtZl
	ngq67qiVo/FMLx962YnxmuKxndR0dfzO+bdSRX+ody5HSeScgdULxK7uaGC1P0QWginnwCKZ2XP
	CUPfatzCnWZ98+k2CcPXAe7ZgYnCY3cTr1RwQQIfjDzo6/yzQGZeK172wh0L7Bdc0S7j1MFhV8+
	4+pe1H
X-Google-Smtp-Source: AGHT+IHGfTQHu2drfAKQu53WiG/Gy4iDJrxBQ4VfdVs/FW7w4jXnrnuNi5IJgVAmYtjoOeiIgiSPkg==
X-Received: by 2002:a17:902:e808:b0:29e:facd:7bf4 with SMTP id d9443c01a7336-2a2f2940511mr319051025ad.50.1767103023863;
        Tue, 30 Dec 2025 05:57:03 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d407sm299696265ad.72.2025.12.30.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 05:57:03 -0800 (PST)
Date: Tue, 30 Dec 2025 21:56:58 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i2c: spacemit: add reset support
Message-ID: <20251230135658.GA9515@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <604e5781-5c59-422f-9c5a-ee4be6f8b329@kernel.org>
 <CAH1PCMag00z2Fp8zjMUPS7AdU6Lgk0UsS+mku93NtNejqjyBMg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMag00z2Fp8zjMUPS7AdU6Lgk0UsS+mku93NtNejqjyBMg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_055706_222215_2F475770 
X-CRM114-Status: GOOD (  22.44  )
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

T24gU3VuLCBEZWMgMjgsIDIwMjUgYXQgMDc6NTM6NTJBTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBGcmksIERlYyAxOSwgMjAyNSBhdCA0OjAz4oCvUE0gS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiAxOS8xMi8yMDI1IDA4OjQyLCBF
bmNyb3cgVGhvcm5lIHdyb3RlOgo+ID4gPiBBZGQgcmVzZXQgc3VwcG9ydCBmb3IgdGhlIEsxIEky
QyBkcml2ZXIuIEEgcmVzZXQgZW5zdXJlcyB0aGF0IHRoZQo+ID4gPiBjb250cm9sbGVyIHN0YXJ0
cyBpbiBhIGNsZWFuIGFuZCBrbm93biBzdGF0ZS4KPiA+ID4KPiA+ID4gUmVzZXQgZW5zdXJlcyB0
aGF0IHRoZSBJMkMgaGFyZHdhcmUgaXMgaW4gYSBjbGVhbiBzdGF0ZS4gV2UgY2Fubm90IGFzc3Vt
ZQo+ID4gPiB0aGF0IG5vIHByb2dyYW0gdXNlZCBJMkMgYmVmb3JlIHRoZSBrZXJuZWwgYm9vdGVk
Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFbmNyb3cgVGhvcm5lIDxqeWMwMDE5QGdtYWls
LmNvbT4KPiA+ID4gLS0tCj4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+IC0gUmVwbGFjZSByZXNl
dCBwcm9wZXJ0eSBpbiBkdC1iaW5kaW5ncy4KPiA+Cj4gPiBSZXBsYWNlIHdpdGggd2hhdD8gSSBk
b24ndCBzZWUgYW55dGhpbmcgZWxzZSB0aGVyZSAtIHlvdSBzdGlsbCBoYXZlCj4gPiByZXNldCBw
cm9wZXJ0eS4KPiAKPiBJdCBsb29rcyBsaWtlIGEgcGhyYXNpbmcgaXNzdWUuIEJ5ICdyZXBsYWNl
LCcgSSBndWVzcywgRW5jcm93IG1lYW50IHRoYXQKPiB0aGUgcmVzZXRzIHByb3BlcnR5IHdhcyBt
b3ZlZCAocmVvcmRlcmVkLCBwdXQgaW50byBhIGRpZmZlcmVudCAncGxhY2UnKQo+IHdpdGhpbiB0
aGUgZmlsZSwgbm90IHRoYXQgaXQgd2FzIHN3YXBwZWQgZm9yIGEgZGlmZmVyZW50IHByb3BlcnR5
Lgo+IAo+IEVuY293LAo+IAo+IFdvdWxkIHlvdSBwbGVhc2UgY29ycmVjdCB5b3VyIGNoYW5nZWxv
ZyBkZXNjcmlwdGlvbgo+IGluIHRoZSBuZXh0IHZlcnNpb24gd2l0aCBzb21ldGhpbmcgbGlrZQo+
ICdSZW9yZGVyIHRoZSBwbGFjZW1lbnQgb2YgdGhlIHJlc2V0cyBwcm9wZXJ0eSBpbiB0aGUgZHQt
YmluZGluZyBmaWxlLicKPiAKPiBCUiwKPiBHdW9kb25nCj4gCiBUaGFuayB5b3UgZm9yIHlvdXIg
c3VnZ2VzdGlvbiwgR3VvZG9uZy4gSSB3aWxsIG1vZGlmeSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9u
LgoKIAkJCS0gRW5jcm93Cj4gPgo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IEtyenlzenRvZgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
