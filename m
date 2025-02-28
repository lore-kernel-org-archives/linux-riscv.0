Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532FAC19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6++W/IvvVslQ/bbq3ztnlS5BCfKpXhp0pyoIV7O6iE8=; b=SNL005ZO90iZSa
	OmL3YWX3z1+omizbL4W+YiJqEMPm+ik/RDg8mpfrguyjRPo2KYJSX7Vs8A7sz2qnzw5CF/lfeW+1l
	y19Cs2eznfFOm7mKO9ZhmwTGRrPl8Pb5E1CjafG1E6YQAdCQBhs1QGpKESAU0e+iHaRMlkL4WgXWd
	1YV13APmQH4vOxihLXWmOHxliMYjbTcJ9OaWrCzRdyuwy5t1nsF22mDpz4gVP0tmCJzGYyVzrcAFX
	vtuGyf/16ZQdS6OYYwRrcP1GkmuUaWVkzlLnBhJLSAgOu+Xx0xu0ncCzp1hUTLcHikEa26Cm7++3Y
	BePukvs8DinKefiDdfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvzF-0000000AEJu-1NCG;
	Fri, 28 Feb 2025 08:44:49 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvzD-0000000AEIq-1Xwv
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 08:44:48 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so16234001fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Feb 2025 00:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740732285; x=1741337085; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY06bAcZIeFxZq+rVVGy8xdQWazfVF+gu1V9CdHTqzs=;
        b=DC+iw13yZSHvL9zVIcKM21/YEtfKXNknuinxd9rVTL9gCV6wIA3BuMecdy8DLBhEz6
         57twXbRs5H7t3SD6dKliKYyzc0EFpDX8neGUm44ey85U7F4q8CYjNat/ZJOp20bHmJ7d
         QwBemZC3mXQkUGuCrJp3x7s/TMDjbhipSblYBIpOEGtgY8pkKDRSPYxpTnlKq1mLD3ek
         5ZwuDnbDC4RtDHoO3qTL0QV4Rli0xTxtL/DLwYeAdR7hEghuaazkUAoIRSAdHi0Fuoo1
         3awVW3m5Yp1DCdoQuR7tojpXEjDyslJJLu/AIrVjjuHJcEt3xL3P+eJ+f2zgVk+aYlLt
         du+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732285; x=1741337085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kY06bAcZIeFxZq+rVVGy8xdQWazfVF+gu1V9CdHTqzs=;
        b=gOsc1bDDwruOSnV2zChdyrAYfFc0tYFZSkCgKjI8uPyarpFxF1GOb7bH2A9AMQQ4zO
         RbnNoVc+D4ubTMpuvDtdp9PJmCyMnPx7Rw7ZEEzVe5oNOuini1Db6r1/FTJJIUaZVo8F
         ZYULzcL5LZue+4FEgw5Tly/W0eR0pi/UWif48HL5Gncrw87zRE87VUgCrOsAcrXUEDEC
         ksK5iUxncPQjw4W7Ets10VOYSYeMElUhaLB/+52sa66tx8uEVQn8BSXsZvJx8TPGI/AP
         S6s3XGCDNipT6/8SVJZic1j6CmI/ljiHf5XYhf6CchMcfmtbkv+SLQ+DDnJ4lOk6UAVz
         VUyA==
X-Forwarded-Encrypted: i=1; AJvYcCWRQqmW7m72iAOhH/5T/1R2eJOkeFskrVNF4N5Zg+NRUpwf+u1CZ6Tc0dStcLoQuMKuiGQy2dD2ajOI2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXtVXCn71VyQddl47WbXsUNvXblYdSBN9NK6Avn6gRGTKqJCLa
	l9crglWcMTPW0S/KQ7yTtVXvpr1qOX05GEtsDhaXzh8DSPKd/qW//rQBkqW1VbzJZjSUEwdFDXN
	DPUxY2g+Dq+SlqCtVQbtpWPZoJwj9OIqXMJowZw==
X-Gm-Gg: ASbGncsgnAZU/wPMBlp/ehvS5fdM5vSIbUNJiwYNFTR/qpuczfubUcFvLQDyImMWRn0
	+iVeKo/ih1Z+enKBL+vO/gTJv+XS+wNL5RFvnfBUBJoEEzsBLF1d4iepMhi2HB8/WyqZ8E8D/zD
	GS426x00E=
X-Google-Smtp-Source: AGHT+IE62towVdCnTrudnvaIoU1TJ6pTFTYV/chtSrCWTC1Ko1AEApipZL64MrBly6WJNXyhwZwLLXLgsny92LECsFE=
X-Received: by 2002:a2e:9fc9:0:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-30b9330f13fmr8612541fa.25.1740732285416; Fri, 28 Feb 2025
 00:44:45 -0800 (PST)
MIME-Version: 1.0
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
 <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com> <20250227204155-GYA51171@gentoo>
In-Reply-To: <20250227204155-GYA51171@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:44:33 +0100
X-Gm-Features: AQ5f1Jo79JYnCkWBYG5UqJJb1LGSJ1JmSW8NVl43VT942aaOGBkJP3E28SChE-c
Message-ID: <CACRpkdas4TsMQx2Cvu_JR3kTStqWaOt1N+Cmq7nFesMzpGnZ+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_004447_406350_6A4853EF 
X-CRM114-Status: GOOD (  12.17  )
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

T24gVGh1LCBGZWIgMjcsIDIwMjUgYXQgOTo0MuKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gPiBUaGlzIGZ1bmN0aW9uIGlzIG1lYW50IGZvciAidHdvY2VsbCIuICBU
aGVyZSBpcyBhbHNvIGFub3RoZXIgZnVuY3Rpb24KPiA+IGlycV9kb21haW5fdHJhbnNsYXRlX29u
ZWNlbGwoKS4gIFdoeSBkb24ndCB5b3UganVzdCBjcmVhdGUKPiA+IGlycV9kb21haW5fdHJhbnNs
YXRlX3RocmVlY2VsbCIgaW5zdGVhZD8KPiA+Cj4gZ29vZCBxdWVzdGlvbiEKPgo+IGl0J3MgdG9v
IG1hbnkgY2hhbmdlcyBmb3IgYWRkaW5nICJ0aHJlZWNlbGwiIHdoaWNoIEkgdGhvdWdodCBub3Qg
d29ydGgKPiB0aGUgZWZmb3J0LCBvciBtYXliZSB3ZSBjYW4gcmVuYW1lIHRoZSBmdW5jdGlvbiB0
byAqdHdvdGhyZWVjZWxsKCk/Cj4KPiBJJ20gbm90IHN1cmUgd2hpY2ggd2F5IHRvIGdvIGlzIHRo
ZSBiZXN0LCBpZGVhcyBmcm9tIG1haW50YWluZXIgYXJlCj4gd2VsY29tZQoKWWVhaCBqdXN0IHJl
bmFtZSBpdCB0d290aHJlZWNlbGwsIHRoYXQncyBmaW5lLCB3ZSB3aWxsIHVuZGVyc3RhbmQgaXQg
OikKClRoYW5rcyBmb3IgZHJpdmluZyB0aGlzIGNoYW5nZSwgbXVjaCBhcHByZWNpYXRlZCEKCllv
dXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
