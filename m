Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20402EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYGGSTcFlsTcQ28wAMKr0fls0kY75iU8upinZt04Nkc=; b=lQOXY7jsTYZ9gg
	T3vUJ8S1eciHTKk9SNolWAvGxmsHlvO5wI96Yz6onzmO3yIipjoINIS+VgcqfZPDgIDbbJRt6bvMY
	/I7L9cQYUk+JLO/MLk9w6ug0whanNnt2ZDKDMoiv2P/THBqF6ZTqQqjMP4pjaVkwBYd/x0ck0Y1Cq
	X6lGTBr09dY0I5hPLHZb54TY6UhT7mZA7IALfcH01HVVD5c/Z2kCyS6KclSCuN0+9UnJd9x1fhi0k
	+9FfcQQ2KvCtCrTXKjbJlzCJG8sisfsnG8App5o/wcgBlzmRcqChIy3/l8VByIc0VmlxDa4SLT9M6
	KJ/0r740wsPyKewPu1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInNX-00B4No-2y;
	Mon, 10 Jul 2023 09:40:23 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInNV-00B4M2-26
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:40:22 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-783f17f0a00so1213864241.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 02:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688982019; x=1691574019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAyMQWACMiu7k7xvqQEAhqUIaKa81XxMwdWjQhOqnc0=;
        b=W3/SmPlMMBSFJMpfBbmWrrbGV5s2XxXcD5z26av+mGtwMfYetVOdgeR5zsR4/o3mSf
         tRxoITf6/dqCqz9dtK5ihB+46DlRhA0f/c4qAyoE4f0U3chS86j9PBaieFsS3K16v9/h
         R7SazJIdmjsAH95TgyQ4aVztxFjE+m84vg4C5x32HGcaHMB0j33uchSGK8UTLQSUmtiV
         b9u9I1/qSah088TeMcSD4g74khDVSoWgFGc4B50A34BW/NZMWleOqck+r1cO8CNNzNYG
         CviC7QWzyrQont5dDDdIyoL0wEEghN/gSDK4v7qs7u0lDqoH2kmqS6xf3wpDfYEkHGC+
         wYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688982019; x=1691574019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAyMQWACMiu7k7xvqQEAhqUIaKa81XxMwdWjQhOqnc0=;
        b=l0yj9VaWa7alxtbnY1FOj8tGjzc8/RTw3s3HWgM9ZHl07feooYzqokBepC1/w3wdSA
         RqFE2GZKr22Zid89KmIBzajNLpVpYl1vyczCrVafmLjyHsgaC9hb/hyZ+As6nQARkG4E
         qj72pXm80RGUVfBRoQ4ktJyn7PzS8YADP8KuEM4fE++4EWNpUVVYI52Io4V1mHrEVmu3
         +DVTJrUr5pY23dyupqbIt2hqXY+XVuKdNz33VKr3UBRXvVpN+7lWJ07yI0G/WNaR/oB3
         t74bGzyo2HWhSvnzAn5oKlYX1m8rSKmLp1UtYJtebqijxhytGnWGRCi0C5ynx7jKIHbC
         QpCA==
X-Gm-Message-State: ABy/qLZaAH2IJ1cNtQsNUJJRW0NFZh0tOcLFy4g9lCZi8+x+tcXK04qL
	O8ZbdhKYuSgzZ/ySwzjb5yaeg158HAtTWJni+zY1Jw==
X-Google-Smtp-Source: APBJJlHx0SLN86EAAud2RiAr+LzT0y/R2/hQ6x5hh6eT2hO4ce0zhRokqsYDgEGjfUfQcAHKR1lxxGw/1931v+4bU3I=
X-Received: by 2002:a05:6102:2845:b0:443:874b:7d60 with SMTP id
 az5-20020a056102284500b00443874b7d60mr4973244vsb.26.1688982018888; Mon, 10
 Jul 2023 02:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230626172608.2978505-1-samuel.holland@sifive.com>
In-Reply-To: <20230626172608.2978505-1-samuel.holland@sifive.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Jul 2023 11:40:08 +0200
Message-ID: <CAMRc=Mc6vWmvD3=Z8-eBWT5a4BF2_OoYLvOT4TwH+TAxsY17-w@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: Support IRQ wake
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_024021_693549_D120BA25 
X-CRM114-Status: GOOD (  13.57  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgNzoyNuKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEVhY2ggcGluIGRyaXZlcyBhIHNlcGFyYXRl
IGludGVycnVwdCBpbiB0aGUgcGFyZW50IElSUSBkb21haW4sIHNvIHRoZXJlCj4gaXMgbm8gbmVl
ZCB0byBzZXQgSVJRQ0hJUF9NQVNLX09OX1NVU1BFTkQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11
ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJz
L2dwaW8vZ3Bpby1zaWZpdmUuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYyBiL2RyaXZlcnMv
Z3Bpby9ncGlvLXNpZml2ZS5jCj4gaW5kZXggOTg5MzljZDRhNzFlLi5jMjY1MzMxM2YzYTIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMKPiArKysgYi9kcml2ZXJzL2dw
aW8vZ3Bpby1zaWZpdmUuYwo+IEBAIC0xNTAsNiArMTUwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBpcnFfY2hpcCBzaWZpdmVfZ3Bpb19pcnFjaGlwID0gewo+ICAgICAgICAgLmlycV9kaXNhYmxl
ICAgID0gc2lmaXZlX2dwaW9faXJxX2Rpc2FibGUsCj4gICAgICAgICAuaXJxX2VvaSAgICAgICAg
PSBzaWZpdmVfZ3Bpb19pcnFfZW9pLAo+ICAgICAgICAgLmlycV9zZXRfYWZmaW5pdHkgPSBzaWZp
dmVfZ3Bpb19pcnFfc2V0X2FmZmluaXR5LAo+ICsgICAgICAgLmlycV9zZXRfd2FrZSAgID0gaXJx
X2NoaXBfc2V0X3dha2VfcGFyZW50LAo+ICAgICAgICAgLmZsYWdzICAgICAgICAgID0gSVJRQ0hJ
UF9JTU1VVEFCTEUsCj4gICAgICAgICBHUElPQ0hJUF9JUlFfUkVTT1VSQ0VfSEVMUEVSUywKPiAg
fTsKPiAtLQo+IDIuNDAuMQo+CgpBcHBsaWVkLCB0aGFua3MhCgpCYXJ0CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
