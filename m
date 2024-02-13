Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A37C4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 20:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5g0+zQ2Qd6Bz46gr8JIV+uUQe79EW3Tgb7yzQdkk/w=; b=2pzd7TKlk1Z40e
	zRG+aCjoK5hnhBH2GolJF/5mj2H3ZulVFcS0e1hMfsjhRgJixuAnybdzbIi4Dlh2YaEvJtfKAOKcX
	mecGmlaTYaPwunPQTV3ISbZr5PMJA8x+T+JvzaSc3+nrYl1AMdZlzUztjYLeFjx5r6O/bIEZvEn1c
	OaGX7M8mFYzJ8/T7uioG8zfRuFTJ0iAt67LmEE7CArOlxJvtwYlcpYWaNL7ou0O0ZYH7iYZapdXiW
	j9XnyvsbACh8TM0ANdAiw/rENvnZGlpl8HDN0wkBJLZV/fpwj8r8FZ6cAjc1D+NPAiiM9AduXdgNG
	R5F4LRH+PAUK2zstunBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz5V-0000000AZpV-0bqK;
	Tue, 13 Feb 2024 20:09:05 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz5S-0000000AZn2-0sGf
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 20:09:03 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-51171c9f4c0so5719150e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 12:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707854931; x=1708459731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpamOG71/GOjbb277hAjAxNKP85thTjz3Ni8mu6y5O0=;
        b=piJJ2ImddkUxSIz/d6S0swaodJ3wTzOa6Y/oSwZTsnOfdfOWxaupCPHTS2GPA9Kjdg
         pWOLj6PSHXg55ig+BUNLnE1Nic0CZ4UeSfF7LPYKNIKo5FoykrCZtXTDHSOdB4JQaSAH
         X0HESY+LcswEhRqvYdAfldhw95DybVrZ50NRCSsDHiT7jE1P612UUWj2Hp8WA7MYakk7
         jZg2OUpTrBNzh/fTWKsLsGZPs2lHuO7miOG4Cv/Uv7qa/k7dGZqLhyo1QWod25Ho8wms
         u3IWgJDQ2uFTRRFcg/4EUcBwWuOU5Tj2sBacqNFVbcCaxgbUkM+fkBf6SBhQhylcj+7G
         sVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707854931; x=1708459731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpamOG71/GOjbb277hAjAxNKP85thTjz3Ni8mu6y5O0=;
        b=KHtKewHWpPIeZmL6EATDa+JrLF+8QfMupwtULTuXx4jrX3LASEn8H03tMRHLb4lmJA
         1A889yrUaZL1PYFfQYh9Srr4Hxf9EZJ56LJrpICPSPbXTIbqVKyTNuYlN9yqSvYzXXm5
         WrcSDSOw8bLxPOT2H4y/BKfAQGlVNJ1gehPdcnVx8DgBSS9XmT9GLbMPWC4SbiKAPbeC
         E1pKHUCvCXZNS2XZQ+CXEHJ2bCq+QpjjIlz8ma0xM5wpRIpmCVtRivd7FSzRUxUI2LBn
         WXWcMzCvQctrD/YRUF25QPOJhXUzvrtFSBmLmK1na1F1qe9IasT/e/Z2kVC4uUijSV2K
         hQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRmGAjgo2OJb8mNNgK4XMtA9fJxD0rRj3XdUiFBHfFfc/LTpiPVNsfzKq93XeYERJfCTZOZQvPxQq7fq1Zm4plrenaRct02h0Bb3w3uYAT
X-Gm-Message-State: AOJu0YxM/Qlevk+mav4p+9EbJ/0NOemCkdTTI3GqywcapsmV7JV9aeEb
	+lwRxIKCGoYTa6EbMO04L/6U/S/u06dDrQ2+QH5ZC/yRqrcj+qhX8c4Jxitd/M0jPM9k6DZ1bq2
	FkaAtH5s1y5HdbwLNHYKn0xE4kHir1Fu7oqPB
X-Google-Smtp-Source: AGHT+IEksRyiaHyX94m2jOEP9ui0B6orCI/t9VG5pKeC7bcLR1MRBQFg7mMD33nHbUDo0Wqb4aI/q/lCjH6E4TshwlQ=
X-Received: by 2002:a19:381e:0:b0:511:9f0d:633f with SMTP id
 f30-20020a19381e000000b005119f0d633fmr342293lfa.14.1707854931315; Tue, 13 Feb
 2024 12:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com> <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com>
In-Reply-To: <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com>
From: Ramon de C Valle <rcvalle@google.com>
Date: Tue, 13 Feb 2024 12:08:39 -0800
Message-ID: <CAOcBZOQMF9_QqPvTPoRa=uHw11o74-hm=YdjtDCTj-yeq4nwjg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Trevor Gross <tmgross@umich.edu>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_120902_282670_8F01FBE0 
X-CRM114-Status: GOOD (  12.35  )
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

T24gTW9uLCBGZWIgMTIsIDIwMjQgYXQgMTI6MzbigK9QTSBTYW1pIFRvbHZhbmVuIDxzYW1pdG9s
dmFuZW5AZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAxMiwgMjAyNCBhdCAxMTow
NOKAr0FNIFJhbW9uIGRlIEMgVmFsbGUgPHJjdmFsbGVAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBTYW1pIG1pZ2h0IGJlIHRoZSBiZXN0IHBlcnNv
biB0byBhbnN3ZXIKPiA+IHRoaXMsIGJ1dCBLQ0ZJIChub3QgQ0ZJKSB0ZXN0cyBhcmUgbG93ZXJl
ZCBieSBwYXNzZXMgdGhhdCBhcmUKPiA+IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyAoc2VlIGh0dHBz
Oi8vcmV2aWV3cy5sbHZtLm9yZy9EMTE5Mjk2KSwgc28gd2UnZAo+ID4gbmVlZCB0byBhZGQgc3Vw
cG9ydCBmb3IgUklTQy1WLiBUaGVyZSBpcyBubyBhZGRpdGlvbmFsIHdvcmsgcmVxdWlyZWQKPiA+
IGluIHRoZSBSdXN0IGNvbXBpbGVyIGJlc2lkZXMgZW5hYmxpbmcgaXQgZm9yIHRoZSBuZXcgdGFy
Z2V0Lgo+Cj4gTExWTSAxNyBhZGRlZCBLQ0ZJIHN1cHBvcnQgZm9yIFJJU0MtVi4gU291bmRzIGxp
a2UgaXQncyBqdXN0IGEKPiBxdWVzdGlvbiBvZiB3aGV0aGVyIHJ1c3RjIHVzZXMgYSBuZXcgZW5v
dWdoIHZlcnNpb24gb2YgTExWTSB0aGVuPwoKcnVzdGMgaXMgdXNpbmcgTExWTSAxNyBzaW5jZQpo
dHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL3J1c3QvcHVsbC8xMTQwNDgsIHNvIEkgZ3Vlc3Mg
SSBjYW4gZW5hYmxlCml0IGZvciBSSVNDLVYgdGFyZ2V0cyBpbgpodHRwczovL2dpdGh1Yi5jb20v
cnVzdC1sYW5nL3J1c3QvdHJlZS9tYXN0ZXIvY29tcGlsZXIvcnVzdGNfdGFyZ2V0L3NyYy9zcGVj
L3RhcmdldHMsCmFuZCB0aGUgTGludXgga2VybmVsIHdpbGwgZ2V0IGl0IG9uIHRoZSBuZXh0IGNv
bXBpbGVyIHVwZGF0ZT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
