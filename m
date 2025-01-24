Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E96C02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 03:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aki7Is+kC3XytmUrrNtPPYo7KiOr4mw13S6t19Wnl+s=; b=1BYO72CEpQWZ/o
	Bkg+cpB+o3sShL4Ohy9bjtcvxEAiW8mxkSJzgxs2ObDE4QA8UroonODCuQ5Y07f6/pp8cgFmODo9e
	mSohlOTmA9lPT0F22FEtwn57NmvggbjmVEKSHHxgeqPbFrjxi2jbcbJxzzcsykNqnb2yEwcnYV+49
	DSkF9HsRhe2sBkBDjvL49bOGUJubwwY8wmMtqx/5WjtJDx3o+ORpCS/5FL0BCBdj90nBc247VWd3s
	1Aggdf4arlGLKqoz2BEPN09zNFyW/+aB/jM+AP3eguF0fyiKkJoss7ij66d9pqH7GH4x3L8pYPtUr
	am1Fa0mg7YiB2ZI1W65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbALM-0000000DoAK-13hO;
	Fri, 24 Jan 2025 03:26:52 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbALJ-0000000Do9S-1tuh
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 03:26:51 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-71e565708beso884646a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 19:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737689207; x=1738294007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wYF9SYVPXBWNDoppVRqkp4GObHclaiBorKPLUibZhw=;
        b=a6Ypzh9CVQtSITm0FPF7DwTAOrpOqhk50hHH1utB02QVe23n1JBdCMae0ltOwB1Xzy
         qF3vXQRAdwwW6/S05Qx86ozx5QIHNf605rQGbPrBeHg5nGIGR6TwjspuTjOVewQy8K4S
         9sMfKxw/oKtGJk9iU+VQbd1k/Pzgh73tgXg6t3ewOR1iYkRb09ugCZIFZmMNSTZhHmwA
         5JyJSaho0Jlsjabz3FrosJuovRWSBqjBfoNOtm7NZIJcgWvJS0XJR+IxLtgQ+wEpoWZp
         n2Ug0vUeEYfm3Uo652pkXXksRYMsDN+D1VIVr5Ti8uZbAKMkj3R3dY9InVYKYFMqUmUT
         zpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737689207; x=1738294007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wYF9SYVPXBWNDoppVRqkp4GObHclaiBorKPLUibZhw=;
        b=j/khuq24wa8j0a0Xc6bE6cPOcQU51KpsbPISQS8XvPA/8ABiTzhXtgC2kkzfrUeRRz
         K/U32zX6HDpADkBAAkKKmESmyiHBsx+YW2/IGBqSYXvl2BjSYzzqyhLWBo3AWGPPagDo
         ZLB4tbY7ShrrmQTbDR8xH0FSDSshFb9RFixJH3+bCOdBwEz4uvHSMVtgLI0RzJx+6wP8
         2TMpw9cfTXifsvm/0FInVqXOTyR3xVH2wuLt4I5TqvKk8Clm0PpWuCrZi2UjPeSQrDML
         O0j7482CbQjFI8guhSJsAmz0pqVIU+DY/szrpBGKJWXiQqrJvJSHCx/3OWeNq9I9YGe4
         jzYg==
X-Forwarded-Encrypted: i=1; AJvYcCXhHV2Bum/PELwcqw4mqLGNsHROt14u616JazOWreB8R3tI/U1NggdA074GSWmwQ+mQIZz/tv9OE7mgaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHFXOHDiCfEyrfjw9LwF+NbZYl84tL413ydID3AUXppW+rfQT9
	WKLg6xPcaPQetZd+C0B8Wx2KMw7u9dVmNQPeikRPiCvWbwp+hpYuALiVeuR7bfO8Iy7SkwB7XYs
	vq2WhAVl0Q0Cx3bXmctvSqgASwFzIOSvl9hacvQ==
X-Gm-Gg: ASbGncsbXjJOYbODs+PVaa6NopRYyF5wobJsecJvDuFmJ3+J+7xTeLJW6Q+TOQkD2qC
	iJI7mRkWBYl36/n31ZSw7K7HSGT1nhnMMIfBconHiBveGpqfLqXtcgPg1BPE26ijz
X-Google-Smtp-Source: AGHT+IFGnKLva7FD+LaCZWDZWwF1THCBFHRVpsQutJS5kXSNOriJYKOl1H7ykN+A+qzX7nta9YxDL/rzI0cKEjaNzAA=
X-Received: by 2002:a05:6870:2f0d:b0:29e:5522:8eea with SMTP id
 586e51a60fabf-2b1c0b6cdc0mr17604012fac.38.1737689207038; Thu, 23 Jan 2025
 19:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <20250115024024.84365-3-cuiyunhui@bytedance.com> <20250121-4990d96a861a4ddd304abc33@orel>
In-Reply-To: <20250121-4990d96a861a4ddd304abc33@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 24 Jan 2025 11:26:36 +0800
X-Gm-Features: AWEUYZmWZdjm8pzj4zzIf6rTTBzAFecQ8H3gVQ0i5poz74_c15zJ4cOjObQZY58
Message-ID: <CAEEQ3wnZK2xkQ0+pnNCEvXJ6TUVnCHrkL_VNfhK=9Duy0yKNoA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
To: Andrew Jones <ajones@ventanamicro.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_192649_814433_D2DE2145 
X-CRM114-Status: GOOD (  14.86  )
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

SGkgZHJldywKCk9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDExOjI54oCvUE0gQW5kcmV3IEpvbmVz
IDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAxNSwgMjAy
NSBhdCAxMDo0MDoyM0FNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gRXhwb3NlIFppY2Jv
bSB0aHJvdWdoIGh3cHJvYmUgYW5kIGFsc28gcHJvdmlkZSBhIGtleSB0byBleHRyYWN0IGl0cwo+
ID4gcmVzcGVjdGl2ZSBibG9jayBzaXplLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBD
dWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDYgKysrKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od3Byb2JlLmggICAgICB8IDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oIHwgMiArKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMg
ICAgICAgfCA2ICsrKysrKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4KPgo+IEFzIHRoZSBib3QgcG9pbnRzIG91dCwgd2UgbmVlZCB0byBh
ZGQgdGhlIGZvbGxvd2luZyB0byB0aGlzIHBhdGNoLgpPSywgSSdsbCB1cGRhdGUgYSB2ZXJzaW9u
IGFuZCBjaGFuZ2UgaHdwcm9iZV9leHQwX2hhcydzIHNlY29uZCBwYXJhbSB0byB1NjQuCgo+Cj4g
VGhhbmtzLAo+IGRyZXcKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+IGluZGV4IGNiOTNhZGZm
ZmM0OC4uNmI1YjI0YjM5OWMzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19o
d3Byb2JlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gQEAgLTE2
MCw3ICsxNjAsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9o
d3Byb2JlICpwYWlyLAo+ICAgICAgICAgcGFpci0+dmFsdWUgJj0gfm1pc3Npbmc7Cj4gIH0KPgo+
IC1zdGF0aWMgYm9vbCBod3Byb2JlX2V4dDBfaGFzKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVz
LCB1bnNpZ25lZCBsb25nIGV4dCkKPiArc3RhdGljIGJvb2wgaHdwcm9iZV9leHQwX2hhcyhjb25z
dCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywgdTY0IGV4dCkKPiAgewo+ICAgICAgICAgc3RydWN0IHJp
c2N2X2h3cHJvYmUgcGFpcjsKPgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
