Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D435C02198
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHUhf8EZOeLMu6evyBxwwk5n7OlGxKrXQK0Xlpf0QtU=; b=iH7mYPQgOWsTlG
	dA2Yr3rWw4S+wSlyQBOoXdnXI3diKjbqUB62lFiaSvcB0sfUKxsjodpebNkaUmoZ5W1lKoAZf6R5m
	rrUuKeMCZG4b5KcOVjMeGoRAOTZ29zWFGQGULcmcsHu2PKeeS2zokvlUhSci/2YPv7JWx5LXMxNyA
	1Cw+Vrk4DaHcVd/JhKkPQjb+1SvCbp0kTZg4tK++sOAUBjV/LVOUPI0nejHmlOyo7LiU7VW2HHnL5
	rVr0ebWGtchtMsMACy75xdgUCfAUV3lr1NvhcCOuHhrpCbk3/V5l1uppSj5EbLTW/IbScklhHZ0OA
	NH+L2ti8wzKfe7QaYybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKo6-00000007jzq-0ynB;
	Tue, 18 Feb 2025 10:26:26 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKg8-00000007iRr-2Tat
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 10:18:13 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-307325f2436so44314351fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 02:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739873891; x=1740478691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3zZKi7KyqePBjsPprnaXEopvwTH/GsVqiLJf8W3hiY=;
        b=dbWrAZlhk09yvxbMMHSjGFk0cA/vpktcUr1wA+EtLkDJXqXOiT3By0+jzMxbeDJs2Z
         ayaDDI5v/KjYs2vmnAeDTr9Ev6J5E5/ljMqYO1fwGYtJaVfRLhk++jthk7YCJSEu5IAG
         CJoeN2U/BA8GtzFir9HcN09hJ0iDO0K/995Ya/U4FPx6eLl+F4c8VP5gM4SBUeRN4nCB
         OWTAjALr4cWgHczUP8e6bBEW3K4xw+S96ldTtnXwEmh3RjtXQFWqlTGhNvshwpNOaJ6M
         PYFupdc/fKzKM8hunJjn4VV5UEMLKjYZlkBAkXxFf6jlSCj/i8iAE4nrm4tyg0+ZPglY
         +CAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739873891; x=1740478691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3zZKi7KyqePBjsPprnaXEopvwTH/GsVqiLJf8W3hiY=;
        b=k9YMVRsCsWKkTPtNMn2uOT80OHeYDzOhoCBg1SEuKKlkIJ8LGFYRlEnLvkSJeShdl2
         bd4rO7sUUzql7B5GhZzSl5+4bFNSu+/4rECu+U6fG0UTZExvlGqY6B63Vh4VvzxmmcAO
         VOgZkRigD+32tQDG7Gh0WAc4COIp8lp2QHLoMsAcEXCKPDXLmaGGq1psCzRQUejUOji+
         8+sky87p1hxzxqOXEKaLwrOobUJclSys6+Fm5fSS9eJy6etvkCkm1uVgNGDIGVGCH3pd
         I54KS/8+6C2wjhPfw50mM8U5zNmVVbjTZltyQckKG1uwA6XKGbOpe/lm8bwmy/tniPYi
         obpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf706EWVAq9o9rq7nylc8ATztZqZKyQTpUe88EMTUqD+m/wVoupEQSM439c5i0vwubTuH9ygEqnxcm6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS6/eAyqIxXU+Q3gOXhRXPjSv2sNvviMgAM0X+7TI8X5kQhMjf
	pZWvN+Zwdu6j2nfxZd4/2Z5yZ+T6sI3YMtPR/k8Os0TyXgjkqmHiFECu6TqVttYZ1xfW04/hg8N
	uXDmpULZNplRv1MNGyiUuHS+boKdXaroI2r1J9Q==
X-Gm-Gg: ASbGncuV1qzFfVqRLnyw3lOBbB8n/KPfvLFlLoAZzfPz7zdbhn3eQNzL+p8mkcfFmaa
	3Ic5TmwOY6zkVPsRqdqmWcwXhAms5dJ4pJGwcuNQLNQEweBq9URe3Yf+s1pd7xxVBuEuz85dG
X-Google-Smtp-Source: AGHT+IH2phiht3fTcJfb8ofTkI1v/FLe+lY4y9euuHGDawBqpbQ+TlXpkQ41TvHsqZg8ubAlV69gCmhAwRsjaZoaReA=
X-Received: by 2002:a2e:9f54:0:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-30927b1b22amr37848241fa.30.1739873890696; Tue, 18 Feb 2025
 02:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org> <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
 <20250206133156-GYA5687@gentoo> <CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com>
 <20250214115410-GYA21743@gentoo> <CACRpkdaQZ5wJ0S=FfTzBkZOfCE7zvTPQ-wn53rHcZztbHLC8xQ@mail.gmail.com>
 <20250218095540-GYA29065@gentoo>
In-Reply-To: <20250218095540-GYA29065@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Feb 2025 11:17:59 +0100
X-Gm-Features: AWEUYZlziirybpkwfa2SwWJtaw_DWEb5S7JJMmpNsPZD80yNPZD4D4NQeN62kvc
Message-ID: <CACRpkdZiD7LRAk3hhvWdnf9DCuQCWGLoE1xd_z9ddRKZP=uvLw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_021812_635771_8BF06FDA 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMTgsIDIwMjUgYXQgMTA6NTXigK9BTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cgo+ID4gSSB3aWxsIHBvc3QgaXQgcmVhbCBzb29uLgo+ID4KPiBjYW4geW91
IGNoZWNrIHRoZSB2NSBvZiB0aGUgcGF0Y2ggaGVyZSBbMV0/IHdoaWNoIEkganVzdCBzZW50IG91
dCB5ZXN0ZXJkYXkKPiBpdCBkb2VzIDEpIGltcGxlbWVudCB4bGF0ZSgpIDIpIGluc3Ryb2R1Y2Ug
Y3VzdG9tIGFkZF9waW5fcGFnZSgpCj4gdGhlIGdwaW8gcGFydCB3b3JrcyBhcyBJIHRlc3RlZCwg
dGhlIGdwaW8gaXJxIHByb2JhYmx5IG5lZWQgbW9yZSB0ZXN0aW5nCgpBaCBuaWNlISBJIGhhdmUg
dGhlIHNhbWUgaWRlYSwgYnV0IEkganVzdCBicmluZyBhbGwgdGhlIHN0dWZmIHlvdQpuZWVkIHRv
IHJlaW1wbGVtZW50IGluIHlvdXIgZHJpdmVyIGludG8gdGhlIGNvcmUgaW5zdGVhZC4KCllvdXIg
ZHJpdmVyIGFuZCBiaW5kaW5ncyB3aWxsIGxvb2sgdGhlIHNhbWUsIHlvdSB3aWxsIGp1c3QgZG8K
bm90IG5lZWQgdG8gcmVpbXBsZW1lbnQgdGhlIHRyYW5zbGF0aW9uIGZ1bmN0aW9ucyAoaWYgbXkg
Y29kZQp3b3JrcyBhcyBJIGludGVuZGVkLi4uKQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
