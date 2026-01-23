Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830C6D74EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/40F2TDjJX4KH8gcEcniMZt4nYbEu7traR+cF1qSWHc=; b=i6e5rmXuG/3a90
	DZGGVGrYvxg5AG0sMp6Z+K4Viz+sEnJxH54PA3ebEKqdXlmUwsPQjxc/84LpzjQw23IVbnO5gsQar
	bPuML0ctktdvOlvz/kQed1hKCrWeVxTmULkZnC6YfOnKt+++MShHJGAMXvmxlU3AySVJzu0rTrSDB
	HhXQlUY5L1nvThiQiXCHE4cWNC8mOx9rdkMlLEtuS32vDl9S8xseBhwlovcL1b9tzAFwB+40PJ7Nv
	DwGea+h4goMNUEbOA4ByEbmWOhr6JjuITj0MyOgZaXZ6fcofwHDbDFSK0+MrXMfjrLoIyytlG/l6D
	6d2iwRtNCqt/r+HKBf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJoo-00000009Bed-16gm;
	Fri, 23 Jan 2026 16:15:30 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJom-00000009Bcx-0hZP
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 16:15:29 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-78c66bdf675so22840727b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 08:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769184927; cv=none;
        d=google.com; s=arc-20240605;
        b=Ldyg0KZpuG+CFnX4OfiXp3JawMFudvFYX3tF4gf6RGAYUXhOyjWuVrF3FVz1diZHmc
         713CeUdkYFPEa4C2zkYS+RzNxV/GVpamsXJQdmNIpj/hHaYy01smEI9xfarGQ4ozzXGQ
         K+bh70sw/sZ1k8W5OTa7bAH8l8KBxNFh3sciojzQehMdlrWEveL0MaLkzQbJmJ87h1cE
         TayRnUEXyXAVYCmT3xq4UJdQsjrmT7+ScLx1EkjcjWlYXKuuVh8lmpa0uEOCgcPb/Gwt
         uAhy/y+Q842ydjx0JCXgSyWdT39L2YNk6h3rDOKkMgmWi4wJZII/kFwB/lnsHqlXAUxC
         /7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+bZRUnNeGrRNpaGcouolNUcM8xSpXsG3h0Z9VUZ9+Rk=;
        fh=hl4xeIC9df635XrFI0tArJ404zG7f9Mhq3TgA55oloM=;
        b=ZVAdxZWFwZm29aXIMAGNb6yrfi5c7DS5T3yOZpojDMuf+gr00D33C9weZyVGF6OyW5
         u4Ih3gnQIzf+SJcWah5TxHJ1M7tofu/Ub/6WL3t4EOfDGF8Ik9Z3M0RLsqVOVwAwKHzR
         QqUnAPLFvxn+e6PTh/U5QJg58GzUVxQAYuX6bRreLw8twiDJ68xdsnZ0fJ2HBVWvcM1R
         g+F8kvxqLgZGHqbcX8CcZz1u9rMzVtnKpaHCJGaddsU0fCsXHaZgnLoC91LYTfs0bO/N
         y0x/mhTvlfhpgc82Vo2Lm2yjhA2r6yqloGdYFHL7K/HqdELyBr3DUxhc/Hx88sdgVxxn
         opnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769184927; x=1769789727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bZRUnNeGrRNpaGcouolNUcM8xSpXsG3h0Z9VUZ9+Rk=;
        b=I7o9WpVKz9mYhPE1fGjY2rEOy73eSJYYksMbYFSlOaPIYEclFhzlAUt4tBVPvFkXZ6
         fNC7xcFP9+tEka03y8DQwwbOLOJbd6dDhaBCrxT1BMmsVjqtm762F+Ec7fv9Sisu+RzM
         2ySW4+ikoGkLC507lR+JMPhJ4RFqp2qqW6AWMV9s8FL2oBOPZEhrsfRO+tkqNYWjzkzC
         zLFEChrIbS+GP8IC+vQwahlA5uZQzaZCl3Jzivbapy6yWNtLn6u4sodMa5p8RAI+8m6t
         TjL5/eFmMeXUhDgrEMAMpJvQzK+5rJvSqBfQ1itBfy89OLiJ++Oaxwc5mLYlxndY5aio
         Xyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769184927; x=1769789727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+bZRUnNeGrRNpaGcouolNUcM8xSpXsG3h0Z9VUZ9+Rk=;
        b=q/l25Uge9VlaA+onnYuoC7pWRlHzx7KU/uthhDUSrPRx24+IICy09XMr5Bdysz17Au
         A213furf8q+pvOc3OLGDb+axj7pcU4w07y2sTFI8Sz0URwbh14/9Zkyxwovun5gNFcIi
         puR+DoQoQxWpA6ajLgLhTUAvHh3TDqNDhPeMwkQcH8SUG9adR12CWS8HqlwOGwMg2McE
         NTka1di6cywg/w4gMGVnTkDZV1yigyU+T2eO1kLlIkVTTHnGabxG9GPywxufLoeXcOzA
         DYq1QC98QwXOszSKJ6YmnbB5ggLX17eAEpxEmcwMa8EV0wKCC8drT7B5R59KKvRYnVFj
         oI6A==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ss3FO1cPFIVVlPpjXxjZHJv1mrND/K74l2cL4HI05TluoQdsr7M/LhhpDaaEsvTvFWXIBuEd5xmvVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZON+QQ06fp9LsvLMaVomMrozOz/wyP1tsCXyXGiGIppowXR4V
	UlLPnWxTlBKT5BN1HNTumTE7O/i0EnZe+J8RmXEa4YyCiyE7MI6DHUcb/gLd778zzYiVxraYjz+
	XGL67a2DJ5zi1govVtWTE4c3pOI6mXh+GuqmFcjZXhw==
X-Gm-Gg: AZuq6aJ4TU/AH2GlStzWi0lf0uFVWH4mdy4MUDkVOXQno9H/p6+48thczZ4mMP51T7T
	Na4w6LpRZtjmA7RM763ZwPmy1u9EPmrRL0nUl1EXS7nwZV/rWpo+WLhKvF8QKLs+O652v+kMwA9
	jxzkIBRBRh+8LumRc0lep4xNC4zn2FflqUN55UgoTzbliS3eXB/Cwo7/bI6Ya1pPZ6qJYTeWsqW
	QT5rld52eA70IMo5v84PotS+V5m92zhXIHAE11ezA0jV+SXQsEu6LrUYKm9PVer8Bcs/eJNZ4HG
	vUkZ7w+ODa7PqOu8RmSWuhZW/jXvrWojbu0/Tj+3ny5AHeXueRwK0zv61RbyJUa59/Qs9bE=
X-Received: by 2002:a05:690c:39c:b0:793:bae9:9295 with SMTP id
 00721157ae682-79439925edfmr27856807b3.31.1769184926791; Fri, 23 Jan 2026
 08:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
 <20260122-atlantis-clocks-v2-2-c66371639e66@oss.tenstorrent.com> <1adc068bbf1a15b1b10651f6ad9385415f6d4227.camel@pengutronix.de>
In-Reply-To: <1adc068bbf1a15b1b10651f6ad9385415f6d4227.camel@pengutronix.de>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 23 Jan 2026 10:15:15 -0600
X-Gm-Features: AZwV_Qi6CqkCPOD14PwEW74h_hED-jEGhbBNZe3VbRvLaoqSVWwFH86aFXA3uP0
Message-ID: <CAEev2e_6PePu3omq-Zf1R-8TYikgz9V1cp6cwn0nZ8LaPHaJ2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
	bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_081528_211355_A284A73C 
X-CRM114-Status: GOOD (  14.81  )
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

SGkgUGhpbGlwcCwKCk9uIEZyaSwgSmFuIDIzLCAyMDI2IGF0IDc6MDDigK9BTSBQaGlsaXBwIFph
YmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIERvLCAyMDI2LTAxLTIy
IGF0IDE2OjM2IC0wNjAwLCBBbmlydWRoIFNyaW5pdmFzYW4gd3JvdGU6Cj4gPiBBZGRzIEF0bGFu
dGlzIFJlc2V0IENvbnRyb2xsZXIgYW5kIGF1eGlsaWFyeSBkZXZpY2UgZGVmaW5pdGlvbnMgZm9y
Cj4gPiByZXNldCB0byBzaGFyZSBzYW1lIHJlZ21hcCBpbnRlcmZhY2UgYXMgY2xvY2sgY29udHJv
bGxlci4KPiA+Cgo+ID4gKyAgICAgaWYgKGRhdGEtPmFjdGl2ZV9sb3cgXiBhc3NlcnQpCj4gPiAr
ICAgICAgICAgICAgIHZhbCA9IG1hc2s7Cj4gPiArICAgICBlbHNlCj4gPiArICAgICAgICAgICAg
IHZhbCA9IH5tYXNrOwo+Cj4gICAgICAgICAgICAgICAgIHZhbCA9IDA7Cj4KPiBUaGUgfm1hc2sg
Yml0cyB3aWxsIGJlIGlnbm9yZWQgYW55d2F5LgoKQWNrLiBXaWxsIGNoYW5nZS4KCj4KPiBzdHJ1
Y3QgcmVnbWFwOwo+Cj4gPiArCj4gPiArc3RydWN0IGF0bGFudGlzX2NjdV9hZGV2IHsKPiA+ICsg
ICAgIHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlIGFkZXY7Cj4gPiArICAgICBzdHJ1Y3QgcmVnbWFw
ICpyZWdtYXA7Cj4gPiArfTsKPiA+ICsKPiA+ICsjZGVmaW5lIHRvX2F0bGFudGlzX2NjdV9hZGV2
KF9hZGV2KSBcCj4gPiArICAgICBjb250YWluZXJfb2YoKF9hZGV2KSwgc3RydWN0IGF0bGFudGlz
X2NjdV9hZGV2LCBhZGV2KQo+Cj4gUGxlYXNlIHVzZSBhbiBpbmxpbmUgZnVuY3Rpb24gaW5zdGVh
ZCBvZiBhIG1hY3JvLgoKQWNrLgoKPgo+ID4gKwo+ID4gKy8qIFJDUFUgUmVzZXQgUmVnaXN0ZXIg
T2Zmc2V0cyAqLwo+ID4gKyNkZWZpbmUgUkNQVV9CTEtfUlNUX1JFRyAgICAgMHgwMDFjCj4gPiAr
I2RlZmluZSBMU0lPX0JMS19SU1RfUkVHICAgICAweDAwMjAKPiA+ICsjZGVmaW5lIEhTSU9fQkxL
X1JTVF9SRUcgICAgIDB4MDAwYwo+ID4gKyNkZWZpbmUgUENJRV9TVUJTX1JTVF9SRUcgICAgMHgw
MDAwCj4gPiArI2RlZmluZSBNTV9SU1ROX1JFRyAgICAgICAgICAweDAwMTQKPgo+IFdoeSBub3Qg
bW92ZSB0aGVzZSBpbnRvIHJlc2V0LXRlbnN0b3JyZW50LWF0bGFudGlzLmMsIHRoZXkgYXJlIG5v
dCBwYXJ0Cj4gb2YgdGhlIGludGVyZmFjZSBiZXR3ZWVuIGNsb2NrIGFuZCByZXNldCBkcml2ZXJz
LgoKV2Ugd2VyZSBjb25zaWRlcmluZyBwdXR0aW5nIHJlZ2lzdGVyIG9mZnNldHMgbGlrZSB0aGlz
IGluIHNlcGFyYXRlCmhlYWRlciBmaWxlcyB0aGF0IGFyZSBkdWFsIGxpY2Vuc2VkLiBJbiB0aGF0
IGNhc2UsIGlzIGl0IG9rYXkgdG8gcHV0Cml0IGhlcmU/Cgo+Cj4gcmVnYXJkcwo+IFBoaWxpcHAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
