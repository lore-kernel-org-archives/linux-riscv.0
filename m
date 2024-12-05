Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC240E7716D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfN0TtycU/szVu7mTz1Mc1aFaHCwJwRxivst00jjeo0=; b=qkBKHH00tBiZQ0
	8UV2YySGBRzDN49WvdSa/jFdvQsWc4bcGuOAdqHOvBJ9kGlw6Rq3+uv+dS7fEXt7JTJZM4FRNJgSF
	MRl0tr6bqceuSAvBB3t9q3KAhPySlXlO6N0N5OXVzoMYnuyoqHq2RwxJ+vMwsrPF8lhvnQ3xRwuTH
	onJZcJbXWOuVGFnB17aS5tQdVdb/MdAV2aPvWuSMm4yf4m35rHkku/OyOPxMo5FiFd/85tBcrIJDE
	hc9VyFxIDs6OSobetamAntN/akQ7YrjfVtadyDSzWs9O845bcNvqR6DvTpfru9ZY+pBMWfCz/j7Fp
	99qBEXvQBelhqkFuRKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDXs-0000000GUBE-10iJ;
	Thu, 05 Dec 2024 15:13:36 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDXN-0000000GU4u-03AK
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 15:13:06 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ffc76368c6so9190631fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 07:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733411582; x=1734016382; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoG8I2gOfAa1nhpr3MtzTH/bpYIZ43v6YhQ9f0tgVvU=;
        b=pEsJ0rrgaB5CpTVmr3pqtfIj1Sewx2aJnnJrtZiTbRUcgSQNEIsK/kDTYQAygmUh5D
         MDww4aggIL6QrSEnBkfGTCLzT2kcgbOR5LWzszX1nWhVN53DciMdbkI5mAQ8++Hc08kB
         lcdE6vp00xEJCK7cfbW4OblTuPTZARSrTj2rdtpYC3Xg9HzTRJgoBeE8BM+nU1AnIwBS
         rPXWimXXalM6HbJWsM3V8Txrb24yqQWORLVKC+87kAB3PEhnN0z/s3IKVCW+CiepVrhE
         lnC25GidW9VnPd+MSPqWeTA2GYLspHK0ZakQlcx+jHmR5TJ9eEs7eMl5NvsqWLwkOtZE
         RNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411582; x=1734016382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoG8I2gOfAa1nhpr3MtzTH/bpYIZ43v6YhQ9f0tgVvU=;
        b=BhOwcP32FtcwS+LxR+gUgxNBpY3nIRU5cUqZWJs5/6oB0JvC0suC6paZ1gIRbZWOfN
         knlNSgaRMjv9vi9lhAB9hO1ZMkQ8pJ+8gyept1rGQ8Lkka8jPcZARpVj+ebwJmKR4hjR
         CcooHMxfSpYz9c8uLOceF2oIjpHe8xdaXKGezHlC6fwVqbW+khp5JyKPfggHJJ6GE3Bq
         NBEfJi6OlGQu77E6QD6N1CW5iiHOL4eQbXZQ2DK1NqAfujinlqSHpqFET+2aKCiY6def
         lfK5xtcZ2fVZJ78e3iFPCAVIjF+pYEIYLBP5PqhUcY6B79QPUQA97DgaOnsI4BM6K442
         9apA==
X-Forwarded-Encrypted: i=1; AJvYcCXbXMwJh7uOLiyFyjVfiLsIC2lLoFXQtx4vXY3jXPDfPOHvkZzL6rSRQ/SfRKghQ8/1tentsydlz7pKsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1PewlNT1zAqs60rCQMl6b8qKh0qhZcWwzGbW2u0KoCEzWUJr2
	4Yzi5bwlwbe1e2dYsovWE2HAWshjJObf1/wCs2hetmBbzuRcypG4RLjAWEY2G04K73KfuVtoDe4
	gjmVPm2I4BEE4+3m2wR+zD64gugG4lp4hoKpY+g==
X-Gm-Gg: ASbGncu7rV9T991a8T238qravOGjsl/+DAavuwlp13UnOB9+2qJYEwYbj9zeDkzVn7S
	8PwLaAl++LwlCotEiCBIjuPBKpGbJ2xoHQQ==
X-Google-Smtp-Source: AGHT+IGH/8TdnaDUdGz4vg1jz4T+IjoxlkEVgzEnW/Whszlzb3/tE/OJ68+7OcMZC/v7h9xiQOOLAepDgrXh5t82PkQ=
X-Received: by 2002:a2e:9907:0:b0:300:16c0:9ba with SMTP id
 38308e7fff4ca-30016c00c13mr33128631fa.31.1733411582083; Thu, 05 Dec 2024
 07:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20241116-cpuidle-riscv-sbi-cleanup-v3-1-a3a46372ce08@gmail.com> <eee10593-eb0b-4660-80cf-3027d6a99435@ghiti.fr>
In-Reply-To: <eee10593-eb0b-4660-80cf-3027d6a99435@ghiti.fr>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 5 Dec 2024 20:42:50 +0530
Message-ID: <CAK9=C2W3uxt9aO7NbCfzi6zdp14W_MXvOn2MtGqfzwX89J5aUQ@mail.gmail.com>
Subject: Re: [PATCH v3] cpuidle: riscv-sbi: fix device node release in early
 exit of for_each_possible_cpu
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Anup Patel <anup@brainfault.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_071305_049619_32E1B105 
X-CRM114-Status: GOOD (  22.42  )
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

T24gVGh1LCBEZWMgNSwgMjAyNCBhdCA4OjEw4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdo
aXRpLmZyPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAxNi8xMS8yMDI0IDAwOjMyLCBKYXZp
ZXIgQ2FycmFzY28gd3JvdGU6Cj4gPiBUaGUgJ25wJyBkZXZpY2Vfbm9kZSBpcyBpbml0aWFsaXpl
ZCB2aWEgb2ZfY3B1X2RldmljZV9ub2RlX2dldCgpLCB3aGljaAo+ID4gcmVxdWlyZXMgZXhwbGlj
aXQgY2FsbHMgdG8gb2Zfbm9kZV9wdXQoKSB3aGVuIGl0IGlzIG5vIGxvbmdlciByZXF1aXJlZAo+
ID4gdG8gYXZvaWQgbGVha2luZyB0aGUgcmVzb3VyY2UuCj4gPgo+ID4gSW5zdGVhZCBvZiBhZGRp
bmcgdGhlIG1pc3NpbmcgY2FsbHMgdG8gb2Zfbm9kZV9wdXQoKSBpbiBhbGwgZXhlY3V0aW9uCj4g
PiBwYXRocywgdXNlIHRoZSBjbGVhbnVwIGF0dHJpYnV0ZSBmb3IgJ25wJyBieSBtZWFucyBvZiB0
aGUgX19mcmVlKCkKPiA+IG1hY3JvLCB3aGljaCBhdXRvbWF0aWNhbGx5IGNhbGxzIG9mX25vZGVf
cHV0KCkgd2hlbiB0aGUgdmFyaWFibGUgZ29lcwo+ID4gb3V0IG9mIHNjb3BlLiBHaXZlbiB0aGF0
ICducCcgaXMgb25seSB1c2VkIHdpdGhpbiB0aGUKPiA+IGZvcl9lYWNoX3Bvc3NpYmxlX2NwdSgp
LCByZWR1Y2UgaXRzIHNjb3BlIHRvIHJlbGVhc2UgdGhlIG5vb2QgYWZ0ZXIKPiA+IGV2ZXJ5IGl0
ZXJhdGlvbiBvZiB0aGUgbG9vcC4KPiA+Cj4gPiBGaXhlczogNmFiZjMyZjFkOWM1ICgiY3B1aWRs
ZTogQWRkIFJJU0MtViBTQkkgQ1BVIGlkbGUgZHJpdmVyIikKPiA+IFJldmlld2VkLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSmF2
aWVyIENhcnJhc2NvIDxqYXZpZXIuY2FycmFzY28uY3J1ekBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
IENoYW5nZXMgaW4gdjM6Cj4gPiAtIFVud3JhcCBsaW5lICgxMDAgY2hhciB3aWR0aCkuCj4gPiAt
IExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEwMzEtY3B1aWRsZS1y
aXNjdi1zYmktY2xlYW51cC12Mi0xLWFhZTYyZDM4MzExOEBnbWFpbC5jb20KPiA+Cj4gPiBDaGFu
Z2VzIGluIHYyOgo+ID4gLSBTcXVhc2ggcGF0Y2hlcyBmb3IgbWFpbmxpbmUgc29sdXRpb24gd2l0
aG91dCBpbnRlcm1lZGlhdGUgc3RlcHMuCj4gPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNDEwMzAtY3B1aWRsZS1yaXNjdi1zYmktY2xlYW51cC12MS0wLTVlMDhh
MjJjOTQwOUBnbWFpbC5jb20KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1y
aXNjdi1zYmkuYyB8IDQgKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWlkbGUvY3B1
aWRsZS1yaXNjdi1zYmkuYyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4g
PiBpbmRleCAxNDQ2MmMwOTIwMzkuLjBjOTJhNjI4YmJkNCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiArKysgYi9kcml2ZXJzL2NwdWlkbGUv
Y3B1aWRsZS1yaXNjdi1zYmkuYwo+ID4gQEAgLTUwNCwxMiArNTA0LDEyIEBAIHN0YXRpYyBpbnQg
c2JpX2NwdWlkbGVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAgICAg
IGludCBjcHUsIHJldDsKPiA+ICAgICAgIHN0cnVjdCBjcHVpZGxlX2RyaXZlciAqZHJ2Owo+ID4g
ICAgICAgc3RydWN0IGNwdWlkbGVfZGV2aWNlICpkZXY7Cj4gPiAtICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wLCAqcGRzX25vZGU7Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBkc19u
b2RlOwo+ID4KPiA+ICAgICAgIC8qIERldGVjdCBPU0kgc3VwcG9ydCBiYXNlZCBvbiBDUFUgRFQg
bm9kZXMgKi8KPiA+ICAgICAgIHNiaV9jcHVpZGxlX3VzZV9vc2kgPSB0cnVlOwo+ID4gICAgICAg
Zm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkgewo+ID4gLSAgICAgICAgICAgICBucCA9IG9mX2Nw
dV9kZXZpY2Vfbm9kZV9nZXQoY3B1KTsKPiA+ICsgICAgICAgICAgICAgc3RydWN0IGRldmljZV9u
b2RlICpucCBfX2ZyZWUoZGV2aWNlX25vZGUpID0gb2ZfY3B1X2RldmljZV9ub2RlX2dldChjcHUp
Owo+ID4gICAgICAgICAgICAgICBpZiAobnAgJiYKPiA+ICAgICAgICAgICAgICAgICAgIG9mX3By
b3BlcnR5X3ByZXNlbnQobnAsICJwb3dlci1kb21haW5zIikgJiYKPiA+ICAgICAgICAgICAgICAg
ICAgIG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJwb3dlci1kb21haW4tbmFtZXMiKSkgewo+ID4K
PiA+IC0tLQo+ID4gYmFzZS1jb21taXQ6IDc0NGNmNzFiOGJkZmNkZDc3YWFmNTgzOTVlMDY4Yjc0
NTc2MzRiMmMKPiA+IGNoYW5nZS1pZDogMjAyNDEwMjktY3B1aWRsZS1yaXNjdi1zYmktY2xlYW51
cC1lOWIzY2I5NmUxNmQKPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4KPgo+IFdpbGwgeW91IG1ha2Ug
YSBQUiBmb3IgdGhpcz8gT3Igc2hvdWxkIHRoaXMgZ28gdGhyb3VnaCB0aGUgcmlzY3YgdHJlZT8K
Ckl0J3Mgbm90IEtWTSByZWxhdGVkIHNvIGJldHRlciB0YWtlIGl0IHRocm91Z2ggdGhlIFJJU0Mt
ViB0cmVlLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
