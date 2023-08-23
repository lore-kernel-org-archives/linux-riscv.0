Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC7FEE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPdKtGvUBGAkTD8igmm+RqTT6UcG3jPPcH3eYax3ZdM=; b=XIRdM633sQ4+JS
	5+mdqkW9W8pCiDSlrtxNoZNnaIzqB6jaQkxML8BIzOohKqbmEcyi5JK87IVHuiFPuZO0XqgPEiyZk
	3ljvk1FSf3r+NW0Fl7/JimtRMP3Scy/ouLvcTkZi5rw4mRf4JFkP7yRyGDOZJhT5U+C293+sFQJJB
	XkPe8q3m+XdsqtvA0bOZ5ZoEqtxb6tWT5m01YDOdQ0Lc6iMMDyEYpM64H4HY1w7HkxukA193aZrFL
	CJCvjxYRRdT5Jb0VUOLf2OrkVy1Izb8J4C3pH9YF82+Ldxj2KXcbyrRMpIkajoB2lO0utA3v8667a
	FqxVL/QMVeCSL5TCbz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYqUS-0013I6-33;
	Wed, 23 Aug 2023 16:13:52 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYqUQ-0013Gs-07;
	Wed, 23 Aug 2023 16:13:51 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso89407271fa.3;
        Wed, 23 Aug 2023 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692807225; x=1693412025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l95LCr0GMnr5YIrvqZTvdFeVvMdsvoY6X85sEcfYdiE=;
        b=PlQI+RDkk1NVSZGlQ84IghRbiWgml+c5nhCu6EL9Adlzg+YYBScfkWOJMK5PjQ7GGF
         rVvJ8SUfT72W+q2h3rTCOLrG1ZCh6/SLHp69P/pGMWGzivp4jQP2BaO1ibeoDDKTG98h
         jlcrM/dUGy/NeTDagNToM3Ob60wtBQAiiADwEErEaJHxuXFlzGdMdL+WCBkI2ULyOMiy
         fZJKWu0Azt7io9ky45aGIZDbc1SyTe6raDeR/VZ+PAhBzrVq2NeW0avh7AhIZikbmka3
         HAp4IgTwRJAmgKiAsz7uh+ThJyLgH47ymSGVJY+Ok6so+/bmu0w5iOT7qp52I9vCn9/2
         uD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807225; x=1693412025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l95LCr0GMnr5YIrvqZTvdFeVvMdsvoY6X85sEcfYdiE=;
        b=Rx/hogYklc5oTz2NEF+b9ohNpUL3rbp67od+WDZ8MMVJ9+rdx49xleXZe38tAVDU/f
         OkZCFuNhQZDcqXf4ns83IGjl7ERFrMwooLojCAxq2BdPjAG3NHO/V/ZN+8t0cdnif3L9
         9XNd/whCEcIKBSWiha9GrzQoIz6rumej+2uEvonVB65e7MLvmCtZaZ4ZgXsI3JPPQ18K
         r7dcdA4bV7C7daVwyq93G4a21OEHzyRLI7Z7jmeIHwP7VLYSqLW9NhWkbdSFvPCB3/a2
         Yy8iZ/Za+UrMXyJ+6rX3WQotqX8QP/vpOF0aq27Y+UrPJi9pct0/wBzOB0sYRPh2cLGy
         3bvg==
X-Gm-Message-State: AOJu0YwrD1EFTmKPQAgT7DAwqEb/cfrIWrZ5cvGIy4i/ousuId+tHH8u
	NytTT6OK4Bpu9Px8LAB4pwxiehQV1cRwn7ACca+b7b0GTsalZA==
X-Google-Smtp-Source: AGHT+IEg3+HoSNgWCsU5nKzt+RBMxv37klHp8t/UlohBP0GSJi3Ntpjq/Fb5EwAahM5Tl0nX9STzlX0dMhXv7HMOebE=
X-Received: by 2002:a2e:9dcd:0:b0:2b6:e105:6174 with SMTP id
 x13-20020a2e9dcd000000b002b6e1056174mr9882353ljj.47.1692807224549; Wed, 23
 Aug 2023 09:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230805180506.718364-1-bigunclemax@gmail.com>
 <20230805180506.718364-3-bigunclemax@gmail.com> <20230821154739.GA1720453-robh@kernel.org>
In-Reply-To: <20230821154739.GA1720453-robh@kernel.org>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 23 Aug 2023 20:13:33 +0400
Message-ID: <CALHCpMjoxV+sUh6KSVXfEcWgc_ETBHWo2a7xHMT-nKS2xBYOvQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for "allwinner,sun20i-d1-codec-analog"
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_091350_097994_CC93CBB0 
X-CRM114-Status: GOOD (  15.95  )
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

0L/QvSwgMjEg0LDQstCzLiAyMDIz4oCv0LMuINCyIDE5OjQ3LCBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPjoKPgo+IE9uIFNhdCwgQXVnIDA1LCAyMDIzIGF0IDA5OjA1OjAyUE0gKzAzMDAs
IE1ha3NpbSBLaXNlbGV2IHdyb3RlOgo+ID4gQWRkIGEgRFQgc2NoZW1hIHRvIGRlc2NyaWJlIHRo
ZSBhbmFsb2cgcGFydCBvZiB0aGUgQWxsd2lubmVyIEQxL1QxMTNzCj4gPiBpbnRlcm5hbCBhdWRp
byBjb2RlYy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYWtzaW0gS2lzZWxldiA8YmlndW5jbGVt
YXhAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2FsbHdpbm5lcixzdW4yMGktZDEtY29kZWMt
YW5hbG9nLnlhbWwgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAzMyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hbGx3aW5uZXIsc3VuMjBpLWQxLWNvZGVjLWFu
YWxvZy55YW1sCj4KPiBMb29rcyB0aGUgc2FtZSBhcyBhbGx3aW5uZXIsc3VuOGktYTIzLWNvZGVj
LWFuYWxvZy55YW1sLiBXaHkgY2FuJ3QgeW91Cj4gdXNlIHRoYXQ/Cj4KSG1tLiBZb3UncmUgcmln
aHQuIEJ1dCBsZXQgbWUgZXhwbGFpbiBteSBkZWNpc2lvbiA6KQpXaGVuIEkgYWRkZWQgYSBuZXcg
ZmlsZSwgSSBhc3N1bWVkIHRoYXQgc2luY2UgdGhpcyBpcyBhIHNlcGFyYXRlIGRyaXZlciwKdGhl
biB0aGUgYmluZGluZyBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBmaWxlLgoKQXMgYW4gZXhhbXBs
ZSwgSSBsb29rZWQgYXQgdGhlIHN1bjUwaS1hNjQtY29kZWMtYW5hbG9nLnlhbWwgYmluZGluZy4K
SXQgaXMgbW9zdGx5IHRoZSBzYW1lIGFzIHN1bjhpLWEyMy1jb2RlYy1hbmFsb2cueWFtbCB0b28u
CgpTbyBJIHJlYWxseSBkb24ndCBrbm93IHdoaWNoIGFwcHJvYWNoIGlzIGJldHRlci4gSWYgeW91
IGFkdmlzZSBtZQpqdXN0IGFkZCBhIG5ldyBjb21wYXRpYmxlIHN0aW5nIHRvIHN1bjhpLWEyMy1j
b2RlYy1hbmFsb2cueWFtbCwKdGhlbiBJJ2xsIGdsYWRseSBkbyBpdCBpbiB0aGUgbmV4dCB2ZXJz
aW9uLgoKQ2hlZXJzLApNYWtzaW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
