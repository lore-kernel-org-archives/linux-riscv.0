Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680EEE63C85
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 04:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyctAEmhboVjGw2zAAPvgnnHsa+YoONehoO2hZC7YJc=; b=iBY96Legzdh5vt
	7Y+IcFpxbJ//wBxLfUaGySYgdXrmF5Cg0ok0ypz+BonvbRUOyEvaXPtJbviOhzAYTN/L7xu9FZaqR
	v92dUY+vSPjrgnibYH9QIVbSDcIzNtgL/70Tcig7+3DAQ9XEAqcxdm19EyEVCCDYEkYQm6yPzAX+A
	O+DhobYHPscmtuiKWwbpcUkz9DGrY2tveuxJwlaiMXgwMWbNE99oqAB8bCKclwj3j+HGMRjJEVWZd
	avl4rZ6XFCfH7aa4BWG0/aO3HmWWlPZ6polDcoHrrT7ra3lrUxjMjQ6J7WvKqH97v9bIBWenVpHfE
	C0ee4+UJaoM+ARILkw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjraC-0000000Apb8-3N1j;
	Sun, 25 Jan 2026 04:18:40 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjra7-0000000Apal-2Q8T
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 04:18:37 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-790948758c1so34330957b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 20:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769314714; cv=none;
        d=google.com; s=arc-20240605;
        b=IrKTRiGYqRPkfAbxdz0ePRdRBJRg+Q7FCNJX1gTNIRXOb6JiRQAjWYKuTLG0jJ0C9C
         n8+JWqgG/qNIywSJtjwVgkdbYtrETTUYr2bbe1MeWEkEi6FoJDVqyMbCHTH0SQae6pvB
         VmzoV5JJaC58j6Yg4mGgP4P3SGfCLXCatZ2ADvBHus8jCpJCx6USoeNCepWqb0YU6A9y
         OuYeAPxPXa+xnIohTt9onSMLLnhjKSnTNvfQJETYlvd+pZmurEMfF78scBmBLnSo1Zvt
         bU0vmyAnyZwYCdihsQDKkQfTE44q736NYIDADjZ4RN9pSeWWa++fmvwGGBwa4J4qBPcl
         4EUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iBs58lRv+CFAVUT3Ztjx1vffOsaNZMmPIYlH0Ymka2w=;
        fh=YxfDPTZZZMtlLTo5STrBpnDaKk8+DWf2n8kvehK3vpk=;
        b=L38F38OlZ0L4pdEhCmVMzveEs1epBs9YcKS48zOt2wArV1ztW6i50NE45DaGspKOa/
         xeV4osFV6i+Wsn5uUBH3ucRTHcVuu4SZwC1V3X2/KGWzCD8kL57oeP5kJHZ5SBKq+s75
         SMchGKmpFaDvvTeGMUTLjxLp3taC9eRk4sqvu5Rsk0ooCOQ1AlNfPgood9dPKRoNpHXf
         ugTtEf4P3EntOMN5hAUaQ730tScvwoGx+9cxTm1VBJrbOe2c7vQWONhwhN3DOUg+KB4Z
         VjeNZLo8uoEL7UxuapdJnf8ZrN8VZuCXsmih0IU0prp74EUBF2Lvq+2IunGPumLdhqsY
         L5CA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769314714; x=1769919514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBs58lRv+CFAVUT3Ztjx1vffOsaNZMmPIYlH0Ymka2w=;
        b=GpL6tYZmZexDxmyDC8/5prA9sdBvRX052VxsCwgouHXk0VqJ5h9xqk3QRejznnFPh/
         WJWRkxXSj+JZrj1FCuPQVe4xcwEQ/g4FksYwpXTs53rRXHI9x1/U/E7Fn/aOIFrfzT0o
         QzSDbrdc6VRWzf8vZJdPKLSbHl5p8HJhyXYvYeIzlWt2ZsobmTzS19lxE5//UwWbA6Y9
         w9RzMdq39jpj6QKSBpdAADCjBjo8tKeWq9M5x0BvQVKSMz480NnxeunGr+7nWfczax5y
         W9qTEsOR+nnXKZaVg9C7yTWiyNHZb9pVBdNFb8vwzSHq2lRCbYR+o4W5YXeOnxT/WXJ8
         9gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769314714; x=1769919514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBs58lRv+CFAVUT3Ztjx1vffOsaNZMmPIYlH0Ymka2w=;
        b=p9DQSHyVjXm1xLucA9jjXz7pQhyEJoAX6+/wdczUPgNHyuGe2RfOg1CBhOEG+JJap2
         iGec5UOn4PlojMxqQCjwDPnKkBbzxMukZPb4VxruQ+hCBUV9gUdtbdFWcncZ3kLk7cWE
         sztHdwIYbdKBCnqkCLom1f6fINzqEpqBnRA2StEerg/bdfwK0icqawGmkI+i1H/EVvgd
         rMWSvfPC5TBckc1yeKFeF0oXTorsTYdPmtDvEzhRJAY77LRZ24I2eHXVIzCwtugRi2zv
         aom9/scdjQpDOut8HkTrve9OWKy1B18nJ/20rONGDrlQZp7WuCdZLlaeTrj8NMY6eIAX
         Uoww==
X-Forwarded-Encrypted: i=1; AJvYcCX7gI8OwNIWUmSP0f+vk70a68JNUyIbFcPJH0IPOqi5p1BBytgNxlInskjTGaUX3TJ06udamkwGullrmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7D0eLHj0fr1VbxmJyVNkNklEZGpiK2OFIiNTjZScLS4+9H2AC
	tsVWXU6u8vWKLt7iInFd1oNCSj1dxQRhXcgJWImb2NQ+hNn53eP3VlLbEaFkzvSFPl9qjHTrHoe
	VE+oz3ulHjWV18meAIq94twsSMWqXaC+7EshSs3mHtQ==
X-Gm-Gg: AZuq6aJtMdFz2azHiqq4WfRHlJxiD+7e0M8chv6GSnqckQp3F9AxTPNnDm/W61RnJo4
	NeK5jcG7BwGDyY1F8jkeJr0fu9HgxuQHf9ii7Bvj3LIBb9pgMjV92UxuJmqsf4pxWfTuHiRIm09
	FapZRIUPtQfcyqeQsIMuGEnEDGOWs38aJP/TrZkwMfCuMQxw1Zvzn41puX9bRvmrmhPI7ov+bxv
	5BUjEQZzURDyu1Reg8Gnw7N5c9GJZ5PhWd2lsqeiZjJRZ56QJYVMLIQzwme3rq2O9PwYvqwnqvG
	FfBKvQszEPT/Q9Af+REDqZcGdqSGe2fk/Dbx/jH2ckQ/
X-Received: by 2002:a05:690c:34c1:b0:794:ba4:37ab with SMTP id
 00721157ae682-7945aa0d1d5mr4627237b3.60.1769314714172; Sat, 24 Jan 2026
 20:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com> <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
In-Reply-To: <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 25 Jan 2026 12:18:23 +0800
X-Gm-Features: AZwV_QjGxwCPzpLtYSF4QmRJP_WFZqaZPqsFostohF7SoLsMOdNcX8p86IQQwtU
Message-ID: <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_201835_894600_441D7188 
X-CRM114-Status: GOOD (  18.12  )
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

T24gU2F0LCBKYW4gMjQsIDIwMjYgYXQgMjoyNeKAr1BNIFZpdmlhbiBXYW5nIDx3YW5ncnVpa2Fu
Z0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cj4KPgo+IE9uIDEvMjQvMjYgMDg6MjAsIEd1b2RvbmcgWHUg
d3JvdGU6Cj4gPiBbLi4uXQo+ID4KPiA+IE5vdGU6IFBhdGNoIDMgaW50cm9kdWNlcyBhIGJpc2Vj
dCBicmVha2FnZSBieSB0cmFuc2l0aW9uaW5nIHRvCj4gPiBwaW4tc3BlY2lmaWMgc3VwcGx5IG5h
bWVzLiBQcm9iZSBmYWlsdXJlcyB3aWxsIG9jY3VyIG9uIGV4aXN0aW5nIGJvYXJkcwo+ID4gdW50
aWwgUGF0Y2ggNCB1cGRhdGVzIHRoZSBjb3JyZXNwb25kaW5nIERUUyBmaWxlLgo+Cj4gT3VjaCwg
dGhhdCdzIG5vdCBhIGJpc2VjdCBicmVha2FnZSwgdGhhdCdzIGFuICpBQkkgYnJlYWthZ2UqLiBB
bmQgQUZBSUNUCj4gdGhpcyBpcyBzdGlsbCBub3Qgb2theSBpbiAyMDI2LAo+IHNlZSBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvQUJJLnJzdAo+Cj4gU28gdGhlIGJpbmRpbmdzIHdv
dWxkIG5lZWQgdG8gYmUgY2hhbmdlZCB0byBhY2NlcHQgYm90aCB0aGUgbmV3IGFuZCBvbGQgd2F5
LgoKSWRlYWxseSB5ZXMuIEhvd2V2ZXIsIGNvbnNpZGVyaW5nIHRoaXMgQUJJIGNoYW5nZSdzIGFj
dHVhbCBlZmZlY3QsIHRoZSB0d28KSzEgYm9hcmRzIChCUEktRjMgYW5kIEp1cGl0ZXIpIGluIHRo
ZSBrZXJuZWwgZ2V0IHRoZWlyIHBvd2VyIHNldHRpbmdzCmZyb20gYm9vdCBmaXJtd2FyZSBhcyB3
ZWxsLCBhbmQgdGhlIHR5cGVzIG9mIHBlcmlwaGVyYWxzIGVuYWJsZWQgaW4gdGhlIC5kdHMKZmls
ZXMgYXJlIHZlcnkgbGltaXRlZCwgdGhlIHByb2JlIGZhaWx1cmUgb2YgdGhlIHBtaWMgcmVndWxh
dG9yIGRvZXNuJ3QKYWZmZWN0IG11Y2guIFNvLCBJIHRoaW5rIHRoaXMgYnJlYWthZ2UgaXMgYWNj
ZXB0YWJsZS4KCj4KPiBEcml2ZXItd2lzZSwgYXQgYSBjdXJzb3J5IGxvb2sgZnJvbSBzb21lb25l
IG5vdCBmYW1pbGlhciB3aXRoIHRoZQo+IHJlZ3VsYXRvciBzdHVmZiwgbWF5YmUgd2UgY2FuIG1h
a2UgaXQgY29tcGF0aWJsZSB3aXRoIG9sZCBEVFMgYnkgYWRkaW5nCj4gdGhlIG5ldyBuYW1lcyBh
cyBhbGlhc2VzICh7ZGV2bV8sfXJlZ3VsYXRvcl9yZWdpc3Rlcl9zdXBwbHlfYWxpYXM/KSBhcwo+
ICJ2aW4iIG9yICJidWNrNSIsIGlmIHdlIHNlZSB0aGUgb2xkIHZpbi1zdXBwbHkgZGVmaW5pdGlv
bnM/Cj4KCldlIGNhbiBkbyB0aGF0IG9mIGNvdXJzZS4gTXkgaGVzaXRhdGlvbiBpcywgaG93ZXZl
ciwgaXQgbWFrZXMgdGhlIGRyaXZlciB0YWtlCmV4dHJhIGNvZGUgd2hpY2ggbWF5IG5vdCBiZSBu
ZWVkZWQgb25jZSBhbGwgLmR0cyBmaWxlcyBoYXZlIGJlZW4gdXBkYXRlZC4gVGhlCmRyaXZlciBj
b2RlIHdpbGwgYmUgbGVmdCB0aGVyZSBmb3JldmVyLgoKQlIsCkd1b2RvbmcgWHUKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
