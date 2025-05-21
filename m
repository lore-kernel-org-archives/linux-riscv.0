Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C49C2D0CD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 06:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfHGIlg6NHw+Ql0DhvVkoKxCRDO9dlJhnG8D3H/QXcM=; b=W1/lN4jfDScDcT
	ZWacVKFazrkpbycntRB8e05olX7FLYtQp2nTKyNh2z7/5vtLzsy07PWCW4paXhrfzB9OHHWGy851y
	9TkTd0IHT/Cv65PcY3mc6Sp8nZSr20FwCmOx6seINWu7crFZGXWMouFnLYNFgXpbuJBc/pmMBVr+u
	urZCtuYMfOp/i1K3OrSQxaDxjR9trCWf8p94o6oGB9sK/EOAMfggDMUGdEaJG2kFY9k3kklso8k4H
	6My60fEw87pUBnzJvBo1o2zp8rYssvCgd/Sjii5YyIPmLVqju+yFMmDFVNAL5Uim96eaS0zq3LFI8
	3Dh0/iIdfaLQXgWGC00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcdW-0000000EuBt-2yWx;
	Wed, 21 May 2025 06:09:06 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcdU-0000000Eu9x-1U4v
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 06:09:05 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-32911d04ff7so28676031fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 May 2025 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747807742; x=1748412542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk7tve0D+1Pg7EfOZteEFafimD45UzCXl3cwN1jHuNg=;
        b=FptGsR+RIJW2Aj7DvUVR4GBTLeNx+iXY0v3/LnuspXeQjCrkDhIzdybkrp96kuoBZJ
         j4QioywWFwW+63f0/UklGeEDteUZilVIUqQqtp8AI5wYBmuxCQXwgwWXlw2Kqfrxji9L
         mmNSHocbmYEO6YeSFDJ6znC8FQA4i99bH9dxlT85Bd29XRwniAzBKHByTjKINOQByX1P
         PJo0hl/eqkMJtoQknPmuHL85FSFvulKkVxxF0OmtEv/Jl8fT5zPGeGVSBryuOOc2IiQF
         /mfw3DA1vXXBsgmGZjLN/F01ohKbsMXMFeudaARfmiF+UeaRg5y2xz6GOtujfn3/Fnak
         K3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807742; x=1748412542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kk7tve0D+1Pg7EfOZteEFafimD45UzCXl3cwN1jHuNg=;
        b=dHj8Le4Ed5LZedNJv8/4ytX0SSttlhPZWz0qsFa5g/FaaaQ6DWav2xf+dv5zGg8Hz2
         Jp66bSaTLWVKJiZHHC4DyFSMY66KYf0tY4GocGABZa855TMA4ctat6eTmSNbr2XPCsHk
         MxBhpP7Wgg6V5g+8pYlLK0KB2oOhVPiIwCcyPRCIWFsZWM6mibFPduais87+jsHIhWdB
         egfI59G74+upE7DBN+HUsW4AI23vsjmUYz/f7hxVSckQvSvx9KESApfP6F6TR5nrD6/r
         y0ugRBiLW8KoXsY8oJVENvOb4OAmBDE4CTYiQRgQQJGWsbk72onTM+P5xX8eJIbdFDNY
         fe6A==
X-Forwarded-Encrypted: i=1; AJvYcCWJkDjTRDklpOIRYdGDxR/lbZnACEfLSjG688PwHScEpgS+VG3G7be6DNOYsawS6hl5YG6+XJkVdptCig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3OovxNPkpCSkDh/LRkTo0EU5J6h3gS3Va1Py2EDlqLgNE8nGp
	MOkZ9hjJMGDZVBLoO4z7IQgk2OhkdjeZVfwcnYR1S/Z6hVTQI6dRi79FjgVj+Nyi5rcnqVtVlT2
	eHsNREu1fuHLH15XXJyKFFyVG/1U2ETC5hzLWInxEvA==
X-Gm-Gg: ASbGncuENtUOBThxRBnvPQvbJJwmF9gYJScOQpWV3YXFgOfKsTUxpL8UxOlPQGQMWLe
	CZqi0NZZX0n0DRwXudUeclnYgp3+C0w8JdBmkGRVoFc/2Mf4TDFeSHzs1RyI8ef1w2nnEV+nSpA
	VSkx4NzUoHdHGTkLIQ6qVAiIJB5DL6GM3cCA==
X-Google-Smtp-Source: AGHT+IG/ijYmqO23QeZ1aE3WFzSnbU9SjPJREE5AAB9eJlu7O6h0wLI3eFr8ZVc9F4TKF98L9DEYFiwBk2o9Z5nia5s=
X-Received: by 2002:a05:651c:f09:b0:30c:1441:9e84 with SMTP id
 38308e7fff4ca-32807712dfamr55578621fa.13.1747807741824; Tue, 20 May 2025
 23:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-8-apatel@ventanamicro.com> <8734d9lkww.ffs@tglx>
In-Reply-To: <8734d9lkww.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 May 2025 11:38:50 +0530
X-Gm-Features: AX0GCFu61i3AUthehDtL9xq27qbaFkv0eH6gSaBfv0P1Z2ikn1u_-esbTNLJB7I
Message-ID: <CAK9=C2VJ=qw+F7Q0y-6ZMMyJUaM3Aw7o4zFL0n_h=hAOSJaQKA@mail.gmail.com>
Subject: Re: [PATCH v3 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_230904_391144_FC9B7BF4 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMTMsIDIwMjUgYXQgMTI6MjTigK9BTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1heSAxMSAyMDI1IGF0IDE5OjA5LCBB
bnVwIFBhdGVsIHdyb3RlOgo+ID4gKwo+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCBtcHh5X21ib3hf
aXJxX2V2ZW50KGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiA+ICt7Cj4gPiArICAgICAvKiBXZSBv
bmx5IGhhdmUgTVNJIGZvciBub3RpZmljYXRpb24gc28ganVzdCB3YWtldXAgSVJRIHRocmVhZCAq
Lwo+ID4gKyAgICAgcmV0dXJuIElSUV9XQUtFX1RIUkVBRDsKPgo+IEkgd2FzIGlkbHkgcmVhZGlu
ZyB0aHJvdWdoIHRoaXMgYmVjYXVzZSBJIGxvb2tlZCBhdCB0aGUgaXJxIGNoaXAuCj4KPiBUaGlz
IGZ1bmN0aW9uIGlzIGNvbXBldGVseSBwb2ludGxlc3MuCj4KPiA+ICt9Cj4gPiArCj4gPiArc3Rh
dGljIGlycXJldHVybl90IG1weHlfbWJveF9pcnFfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRldl9p
ZCkKPiA+ICt7Cj4gPiArICAgICBtcHh5X21ib3hfcGVla19kYXRhKGRldl9pZCk7Cj4gPiArICAg
ICByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgbXB4eV9t
Ym94X3NldHVwX21zaShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgbXB4eV9tYm94X2NoYW5uZWwgKm1jaGFuKQo+ID4gK3sKPiA+
ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IG1jaGFuLT5tYm94LT5kZXY7Cj4gPiArICAgICBp
bnQgcmM7Cj4gPiArCj4gPiArICAgICAvKiBEbyBub3RoaW5nIGlmIE1TSSBub3Qgc3VwcG9ydGVk
ICovCj4gPiArICAgICBpZiAobWNoYW4tPm1zaV9pcnEgPT0gVTMyX01BWCkKPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiArICAgICAvKiBGYWlsIGlmIE1TSSBhbHJlYWR5IGVu
YWJsZWQgKi8KPiA+ICsgICAgIGlmIChtY2hhbi0+YXR0cnMubXNpX2NvbnRyb2wpCj4gPiArICAg
ICAgICAgICAgIHJldHVybiAtRUFMUkVBRFk7Cj4gPiArCj4gPiArICAgICAvKiBSZXF1ZXN0IGNo
YW5uZWwgTVNJIGhhbmRsZXIgKi8KPiA+ICsgICAgIHJjID0gcmVxdWVzdF90aHJlYWRlZF9pcnEo
bWNoYW4tPm1zaV9pcnEsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1weHlf
bWJveF9pcnFfZXZlbnQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1weHlf
bWJveF9pcnFfdGhyZWFkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBk
ZXZfbmFtZShkZXYpLCBjaGFuKTsKPgo+IEp1c3QgZG86Cj4KPiAgICAgICAgIHJjID0gcmVxdWVz
dF90aHJlYWRlZF9pcnEobWNoYW4tPm1zaV9pcnEsIE5VTEwsIG1weHlfbWJveF9pcnFfdGhyZWFk
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBkZXZfbmFtZShkZXYpLCBj
aGFuKTsKPgo+IGFuZCBiZSBkb25lIHdpdGggaXQuIFRoZSBjb3JlIGNvZGUgd2lsbCBoYXBwaWx5
IHdha2UgdXAgeW91ciB0aHJlYWQuCgpJIGRpZCBub3Qgc2VlIHRoZSBpcnFfZGVmYXVsdF9wcmlt
YXJ5X2hhbmRsZXIoKSBzZXQgYnkgaXJxIGNvcmUuClRoYW5rcyBmb3IgY2F0Y2hpbmcgaXQsIEkg
d2lsbCB1cGRhdGUgaW4gdGhlIG5leHQgcmV2aXNpb24uCgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
