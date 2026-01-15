Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00114D4662F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9Tiyz7FpVTrE8PZEDNHp4aKVis8LcSUdnvO+HKqTuk=; b=a6GN6ih2vFFpKq
	I1dW9TAJp+b14xx/5T2R9Is4HjN/Upwq2S6doS9UmLT0ylEUbR6Jcea8lSPc3x+e6NAcfCpNm7MCR
	RRm+PxMXjN03l7Jc5PCT486hpkJbiXBYUw3HAj8fuvY7mHAHvHbeeNPYMmILCQ2cj/1UPIRNFp94s
	BqCEcxBEB1JGBoUYgxLjl2HXZ1fZwiPWoFe7Ru5kg+OwY0pM7e8kaDln/h04y4k1x1MbisuvtXLJ6
	1m2LEIhW97Q9ld+7YFA4AfpaHw6gBDXFTCPgb9scrYS4TW7694VWsdTgpBrx0Cd8t6TSUW5RZEiCq
	pdTY8VWrK9JrNQdjWe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWOu-0000000DIRN-1AA3;
	Thu, 15 Jan 2026 23:05:12 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWOr-0000000DIQX-23tx
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:05:10 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-78fb9a67b06so14019647b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768518308; x=1769123108; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYKmJDEQ3HcAny/HSnaNVeQI6nrNVioX/wfvfu9LcB8=;
        b=M9nAil3H2zyfFxG/PoSQBIp+vpaYx2O8gQ6o/tjgB+QKHJnfPpsVHqB2oMBDdNzRGH
         SHAqr9xkc21JrIuAPSX4GDYvqyFrf8amcwsixZNI+CW/7buiBjQyn4xKn9f9dqJLLxAo
         q81MNNWyK1Cx1mgBT3mjN1D3fNYeXe1hUBeeiYet3R7PU6+ufpeEURKS5+5d62yEkQSQ
         Cx1/W8CfiVEgbTmyeWqP9GOnnpLI5IPJdNBbdswSNkP2pKoE+CuwKFPV9j+UODKJUrFp
         GIM+Ke+zY6newch5aoyzayKtS1DcV8VV9jXfSMpFWlA3VoVvhhdb0optgi0k95/M1JEO
         THpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768518308; x=1769123108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dYKmJDEQ3HcAny/HSnaNVeQI6nrNVioX/wfvfu9LcB8=;
        b=bqCjqTbtm1tmloNicxczQZSjC0RWZ7HP+blC+p1a44w66qNU1LrDFAqOSZByZlxyux
         MzZFsMzpl1op+LavNiQB/3kHHC/vXcCvGqnHMVZ8S8/a114T42ELyRrmRL4RPc0bR3BY
         4LMYFyMh/3FVCeFkLjIgu/w/5tbl+Tid0cO/4dX4a8IMOrzICvPNkQVK5spMWnXEGPcP
         /NkqGLwFderlTUx9n5Rfp6SoMF3oMBUQ0ONSmi8bf4VYsyB5CL+2iGF2/adZ0qzslSvd
         cgNGG+CBZTy4ezkvW01lZu1XIZuF+irRmoeN3wXmU4lGrtuwvOtOsbtOOyzF3srfmOzR
         Qq3g==
X-Forwarded-Encrypted: i=1; AJvYcCU3kT/yVvLJ52M01Jw4sHP9YxH1eD3XZyIEgq/O+AOCSiOx6tnUnnWHBfs2jmohd6WIyiqf97J6rnwqkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI7R8zeyEcRrfaTDrjqLp+ruj/M6to06JtUd2kvmcWFXR8uuMk
	rcfXNS9fySeZYPsZLv0lLXLKdtWA7dwkDBAxGSaHQAQS93ELDru8qDvNUB792zNvhwOZJXypXug
	rETQGwfWtK4teYu9M/tlGO9EesFZsf/8X0OqsbEsZLg==
X-Gm-Gg: AY/fxX55nl/2YU3GTJQPkV4UpMpLTNXX8ynPn/NvmOTRwlPoSQPabM0b0ayxRTS8iWo
	mIMhf99/C3gj9YR0WlIKGMVbePHXnAo0bSJY76wWAgpIJ2quucub8yk2RdmamuSxmBryPqI7ja0
	NbRz2/qevPMs+wdpfEsw0TniTMeJq/xm5wUKNQlBZoRX1ng1+vsdiniYBgrCJ3SqN3rRsAnTRVM
	B8B7wN+m2b7Ts772YzB/LJasV46OWvxyXnnZSUGMVjOJ+Ho6u1b+WM7Ty7SKd6VpWHvFUMeWvPH
	HPGdd4csiSFV3pWHUAPsfmRlEqO0bF01bv6MZQ==
X-Received: by 2002:a05:690c:6089:b0:792:7113:a305 with SMTP id
 00721157ae682-793c671a7f3mr7321837b3.29.1768518308331; Thu, 15 Jan 2026
 15:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com> <20260115-phonics-reversal-80541ca1f2df@spud>
In-Reply-To: <20260115-phonics-reversal-80541ca1f2df@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 16 Jan 2026 07:04:57 +0800
X-Gm-Features: AZwV_QgpKX7QEi2C0Yhv9u5ga5ukQKR3VN0_gQKQrF7MKWPbynpMV7kUo4W9FqM
Message-ID: <CAH1PCMbc_QGZMicNNie9mvicaHHUbvLF-C+Xb-mgvPC59Sgnbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_150509_782100_9C75EACC 
X-CRM114-Status: GOOD (  10.27  )
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

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMzoxM+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEphbiAxNSwgMjAyNiBhdCAwNzoxODo1NkFNICsw
ODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gLS0tCj4gPiBiYXNlLWNvbW1pdDogMzFkMTY3ZjU0
ZGU5M2YxNGZhOGU0YmM2Y2JjNGFkYWY3MDE5ZmQ5NAo+ID4gY2hhbmdlLWlkOiAyMDI2MDExMy1h
ZGRpbmctYi1kdHNpLTE0ODcxNDUzM2YwNwo+ID4gcHJlcmVxdWlzaXRlLW1lc3NhZ2UtaWQ6IDwy
MDI2MDExMC1rMy1iYXNpYy1kdC12NC0wLWQ0OTJmM2EzMGZmYUByaXNjc3Rhci5jb20+Cj4gPiBw
cmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDBjODU5YjRkMTMxYjMzNjA4NzVjNzk1YzYxNDhjNjE3NmI1
NWZiOTEKPiA+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMmVkOThkYzFhYjBmNWVkOTIzY2MyNTI0
MTVjMzQ1ZGM4Y2FmNmYxNwo+ID4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAxYmUxYTAzMTc2M2Zh
YzAyOTA3NmE3NjhmMDEyYWYzMWU0NTViZTY2Cj4gPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDIx
YmI4Mzg3Yzk0NmUwNTA5MTA0NDBlN2E3NjIyMzA1ZDQ2ZDk0NmQKPiA+IHByZXJlcXVpc2l0ZS1w
YXRjaC1pZDogZjNiZGMyYzc0YjIzMDY2MzcxMDA4NmJkNzcwYTc1NWQ1NmNiOGI5Ywo+ID4gcHJl
cmVxdWlzaXRlLXBhdGNoLWlkOiAxZjE2MmMwMmY4YmRiNWJiYzhjZTUyZWFkNGZjYjc2MjU4ZjVj
MmI5Cj4gPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDc2ZTFmZjI2YzJmMWZlNDAxOWNmYTU3NDk0
MmI1NjgwMDBlNmNhMWYKPiA+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogNzdkZGM5ZTVkYzg1NDk1
YWRjODAzY2RjNjA1YmRkYTJkZGM3ZmE0Nwo+ID4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBhNzVj
Nzk4MzgzYjQ2YTE0ZDQwNDM2MzU3Yzc2OWMzNjcxMTg0NzY4Cj4gPiBwcmVyZXF1aXNpdGUtcGF0
Y2gtaWQ6IDc4MWZjMTBkY2FlMmMzOGM4NGMyNWJlZTg4N2VmNzQ3NDc4NmRkMzYKPiA+IHByZXJl
cXVpc2l0ZS1wYXRjaC1pZDogNWJlNWQzZTYyYWE3MzAyNGJmOWUxZGU2YWFkMTU1YmU2ZDYxOGY0
MAo+Cj4gRldJVywgdGhpcyBraW5kIG9mIHByZXJlcS1wYXRjaC1pZCBzdHVmZiBpc24ndCByZWFs
bHkgaGVscGZ1bCwgYmVjYXVzZSBJCj4gZG9uJ3QgdGhpbmsgdGhlcmUncyBhY3R1YWxseSBhbnkg
ZGVwZW5kZW5jaWVzIG9uIHRoYXQgd29yay4gSXQgYWN0dWFsbHkKPiB0cmlwcyB1cCBzb21lIHBh
cnRzIG9mIGI0IHRoYXQgdGhpbmsgdGhleSdyZSBuZWVkZWQuCgpOb3RlZC4gVXNpbmcgaW5kaXZp
ZHVhbCBwYXRjaCBtZXNzYWdlLWlkcyBpcyBiZXR0ZXIgaW4gYSBjYXNlIGxpa2UgdGhpcy4KCkFi
b3ZlLCBJIHB1dCB0aGUgZW50aXJlIHNlcmllcycgbWVzc2FnZS1pZCwgd2hpY2ggY3JlYXRlcyB1
bnJlbGF0ZWQKcHJlcmVxdWlzaXRlIHN0dWZmLCBhcyB5b3UgcG9pbnRlZCBvdXQuCgo+Cj4gSSBh
cHBsaWVkIHRoZSBBbmxvZ2ljIHBhdGNoLgoKVGhhbmtzIENvbm9yLgoKQlIsCkd1b2RvbmcgWHUK
Cj4KPiBUaGFua3MsCj4gQ29ub3IuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
