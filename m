Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DA7C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjLUiNX1uL93cEgA73axFq3Tb2N+SownSY6pspJKBxw=; b=nUdB7u4hzkJe/f
	L2YHYVagPOA+INw30oiKIjjBJSxDQXwLMT/N0pu6CUg6RBr3M76Qp3pcQq5xF9tro+uzbrxh8s5c3
	2+IoO0s2GFX2qmOZWLNtQqEj+wBBaltVRA9mL6Tdpckx3CRPPLQb9o+PzoGhEeGNmWWkk7YJEoDTf
	txS7VQxWAqEKoqrOIBwTVmTZAXwv6PMLf12HCz82bb9yFzeb1PCZn47X3+ctTvX9P0AfmJ36gUP1F
	KNwMy0CXuKjWWlUHDCiQVcd3X96b3T8rQni7rzxkfSEhowXdUhucIJ4jscSQjjqlOEtdCuuHYXUBE
	aY1P5u/DcwEmH0YDGtnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwfH4-005Y3E-3A;
	Wed, 10 May 2023 08:34:14 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwfH1-005Y1m-3B;
	Wed, 10 May 2023 08:34:13 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so66722964a12.0;
        Wed, 10 May 2023 01:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683707648; x=1686299648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0p9eN+ggVsgeu7VJetFmhwwW1D4ZwxzfXfjX9kMJRM=;
        b=aeJMh3kSstDe1tz2bumuhjkcM10fYPnNrpPFTf8YaH+43l4LdtxVqZKDDS6zar4ITc
         Hqyxpo3mhZi7S8O/stKHeIkPNQubDmKQi8SGpJkxKOFdRwNDNhH3LTiSZx73UID970SX
         013fKgK1EoMIFg0iEmRgbk7wzOrtA4JRBD3VzS6NgvmgOPdYGXf5Ygbz87M9CEQrZG87
         w98LSZC1YVvPzzi+1uODZ3QtjeZbPvjh1op9tN/oulKncSxqKt09CrFJHKxfhWftL6n0
         rwX5KAgGtkRzfriquYC1kaYGLT+z8RrY62wCWWEAo72iNN1rQv2ZBRYgnmhRbqe1njoH
         HVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707648; x=1686299648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0p9eN+ggVsgeu7VJetFmhwwW1D4ZwxzfXfjX9kMJRM=;
        b=YqWUqlN+D8x0Sh++8Kq4gYKU1EzmO5JvPH0N7DmOQXCHgeXTBNr2KbGfjMdcvuAlJ8
         72R8ldxUbsyXy89vA9tEr8h+CsC3Xm1SNvs2yTFfTiQhJJiK72naVrQl0mTv0CLvi7S2
         qZtBbomawXdYsk44oeEO2wytjSS1tS/SDE5TR/XycJF+ieZx1JrUc/GGmmBaWmVF0I2x
         K5VjH0FXyQhovXm0iBazpp2r+CMy9dVQCHiS6XWp6wnx9Or9p4SP1urA0aYWxTgJK+/n
         eSn9TSl1qL87S5IvqMekVrkAl4gDYiQ5t0p55yBarZtvUXEVPN6G7mC5KrWhDyrIachj
         Ig6Q==
X-Gm-Message-State: AC+VfDxG+gfylooy7xJbtdCcLu40JmsmpfSaDiOQNWEcsN8od01lU148
	O3Fm3f1M6nAbkYiq3CjxN4wU8O9mKad3/sQNUEs=
X-Google-Smtp-Source: ACHHUZ5LA+oyV/jkzhbvC/Oj8UgFvIAECULeZEfOx2nOpmbXWSiznXG43fIAKb5+pEqhaTHmHRKki6vY600b90D3Eyk=
X-Received: by 2002:a17:907:724b:b0:94d:e2ef:1618 with SMTP id
 ds11-20020a170907724b00b0094de2ef1618mr14022272ejc.7.1683707647722; Wed, 10
 May 2023 01:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
 <20230506232616.1792109-3-bigunclemax@gmail.com> <702d085b3b814759a344886364c518f8@AcuMS.aculab.com>
In-Reply-To: <702d085b3b814759a344886364c518f8@AcuMS.aculab.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 10 May 2023 11:33:56 +0300
Message-ID: <CALHCpMh84Q8RAh2Y+cHzAvsm4h5zBZY=9fPF6OVmtLNvX+ePxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] spi: sun6i: change OF match data to a struct
To: David Laight <David.Laight@aculab.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, 
	Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Maxime Ripard <mripard@kernel.org>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_013412_019466_6DEB9721 
X-CRM114-Status: GOOD (  14.90  )
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

SGksIERhdmlkCgo+IElzIGl0IHdvcnRoIGRvaW5nIGEgc3RydWN0dXJlIGNvcHkgYXQgdGhpcyBw
b2ludD8KPiBUaGUgJ2NmZycgZGF0YSBpcyBzaG9ydCBhbmQgY29uc3RhbnQgYW5kIGl0IHdvdWxk
IG1ha2UKPiB0aGUgY29kZSB0aGF0IHVzZXMgaXQgc21hbGxlciBhbmQgZmFzdGVyLgoKSSdtIHNv
cnJ5IGJ1dCBJIGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgd2hhdCB5b3UgYXJlIHN1Z2dlc3Rpbmcu
CkluIHBhdGNoIDNcNSB3ZSBleHRlbmQgdGhlIHN1bjZpX3NwaV9jZmcgc3RydWN0dXJlIHdpdGgg
dGhlIGhhc19jbGtfY3RsIGZpZWxkLgoK0L/QvSwgOCDQvNCw0Y8gMjAyM+KAr9CzLiDQsiAxMjo0
NywgRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWlnaHRAYWN1bGFiLmNvbT46Cj4KPiBGcm9tOiBNYWtz
aW0gS2lzZWxldgo+ID4gU2VudDogMDcgTWF5IDIwMjMgMDA6MjYKPiA+Cj4gPiBBcyB3ZSdyZSBh
ZGRpbmcgbW9yZSBwcm9wZXJ0aWVzIHRvIHRoZSBPRiBtYXRjaCBkYXRhLCBjb252ZXJ0IGl0IHRv
IGEKPiA+IHN0cnVjdCBub3cuCj4gPgo+IC4uLgo+ID4gLSAgICAgc3NwaS0+Zmlmb19kZXB0aCA9
ICh1bnNpZ25lZCBsb25nKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKPiA+
ICsgICAgIHNzcGktPmNmZyA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsK
Pgo+IElzIGl0IHdvcnRoIGRvaW5nIGEgc3RydWN0dXJlIGNvcHkgYXQgdGhpcyBwb2ludD8KPiBU
aGUgJ2NmZycgZGF0YSBpcyBzaG9ydCBhbmQgY29uc3RhbnQgYW5kIGl0IHdvdWxkIG1ha2UKPiB0
aGUgY29kZSB0aGF0IHVzZXMgaXQgc21hbGxlciBhbmQgZmFzdGVyLgo+Cj4gICAgICAgICBEYXZp
ZAo+Cj4gLQo+IFJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3Vu
dCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSwo+IFJlZ2lzdHJhdGlvbiBObzogMTM5
NzM4NiAoV2FsZXMpCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
