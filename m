Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF9FC021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZYvABJO+TmQ2+DX94UXdGIUTdc/9RPzz+xn06mFdZE=; b=wRK5y4oe+GaKUJ
	QGLc2DaDD1lzNvTlGJDXjS1a2mK3xdhveo2wn0vm1sCF3GoTQLYjEwIG4jCZIq17BTvLcxT6cAweM
	EeTlxw/UPwMsuSgo3/8AmTiIm/IWVD1mg9iggou8ZqpoMBz4akCjoci6x2na47pDJXNtj8BiP822C
	RL2/Cji7j8e3LVpdKRoSMq8U5Wap9kO7VlsXVvlupdyOBZLGrlc6SzWgfQIzKrPJ6h4gkW91pt2jd
	t2aqGSN+IHnwfKE5HpM0OpYeie1ZyvnaGKMjzt6eKLmkq38VXMMQPKY9/2bHqrNLJuOICmk0A4OJr
	UHrYp2BwFACSoxGU1Mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlX5l-00000006PoF-27Bj;
	Fri, 21 Feb 2025 17:45:37 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlX5j-00000006Pni-1mF5
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 17:45:36 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5209962eefbso2004294e0c.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 09:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740159934; x=1740764734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVlYG/IbFu9Q/R+V4VeWK18IBK9fWtgJYvhhNDBjzKM=;
        b=tMXXFTJsSnBjOcN164D9PjwZlShf4tTv/ROl0SQVL3hiAER1zSnlkXVETwVnYxNGue
         l1d/biyt6UUMa3LTJoElwxoQjAm1UsBVfoUZEqUKdX8zSM/edR+OmC9pMiytK/VHPbn7
         IBksZy9zQdSr0WtTxfolfCvTm/5bB2tQAfdM38jQ/whIblLq7kZrBu8vGLiiqjrY/CyE
         fBJCh46SLeRTWcu+DtdzdnXZB57c/9Ki6GlTRDB0Rx+t3z98nx4Ll2TNhUwFttyjghpZ
         WC70FI+pmhZL8PzSdqmU0PZ+W0avC6JEfWn/GhC+wgju8vfHB6gTL9VArs7buQGp5c/z
         hqkg==
X-Forwarded-Encrypted: i=1; AJvYcCV41mCEuXrAVDLlCuBgN22mkWt2ITZa9yrbMsCUnqKLB3IASAkv9g8Q59BE+AKFodSJYTklurUqJqRBtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgyxmWdae7SDCFyyhcN9DM4H3rBGaK3w6kDofs76OGq7ZkQW9J
	alOIYcde+wk9LJe0Y0dnoV80zMP6hSJfZsEDfvJ0RqRXeQxNB8ekVD7WOneg
X-Gm-Gg: ASbGncshonlh8XsUDlKIDuQncfE2kVqvT0D9sUS/2V8SMA9g5bKGapHgL+8hp3g+BKo
	Fiok0+tgKz8yNcPCrvVD93nPiGHGS/GsyM6GOxl13uITDn2c5/Uzt+UUpFJ7C3YFknqA3JdCxsY
	bqwmpyKohd3awYxCyFv1atZP+k5QEVngCw0cG/fafnSwfA25EKRzYl1p+TghPfKQEhiwb/jWmlc
	37bDNAaqrKJAzybW6giYRCAOjkQLXwqX7+hdyRZ3vgZAYqZA4qkiBIk6FqtwHFXqBVfrcQeVOxe
	+Xrwk3rit2AbnFUHR0YnBHQoRCfc97yK8ViUDjW90KYCho7lcoJ/wVdNZA==
X-Google-Smtp-Source: AGHT+IFQ4Z0Ct32yM1VdzJJvAxsTdPr+vwIc65K6jlIS8cnOdDk3Dnao3oE/5/LLph8k3TBPTwf1Yg==
X-Received: by 2002:a05:6122:4081:b0:51e:ffd1:67f3 with SMTP id 71dfb90a1353d-521eed1ccfbmr2357691e0c.7.1740159933614;
        Fri, 21 Feb 2025 09:45:33 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520b0092f4csm2675719e0c.17.2025.02.21.09.45.32
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:45:33 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5209ea469e9so2254595e0c.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 09:45:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW42/BG/mpSIEjKbE+qEyZEPCZWrolvaUDhg/Md8g5iMxnQBJari5BnhdSmualyGpF52MAqXY2Lcr6A4w==@lists.infradead.org
X-Received: by 2002:a05:6122:608b:b0:520:4d63:72da with SMTP id
 71dfb90a1353d-521eeced620mr2485638e0c.6.1740159932550; Fri, 21 Feb 2025
 09:45:32 -0800 (PST)
MIME-Version: 1.0
References: <20250221092523.85632-1-xry111@xry111.site> <CAAhV-H5_bKtO2mAFmfcZvD0pn9RhTA+UPjv7K574uPKxZbxX=g@mail.gmail.com>
 <f0c15994e7a79f6cd0c82930c0dfebb50458c941.camel@xry111.site> <CAAhV-H4rDXDnzJwUE6PXMyuNGTs1NwUzQDP5eAPMmaHpqftP-Q@mail.gmail.com>
In-Reply-To: <CAAhV-H4rDXDnzJwUE6PXMyuNGTs1NwUzQDP5eAPMmaHpqftP-Q@mail.gmail.com>
From: Fangrui Song <i@maskray.me>
Date: Fri, 21 Feb 2025 09:45:40 -0800
X-Gmail-Original-Message-ID: <CAN30aBEhnR1OJycVs+F43ocJ6Vyh=Et2r+wo5cWwrtV4x-+zcg@mail.gmail.com>
X-Gm-Features: AWEUYZkb8iSWdt-9kgykuTb5jDnwB320XaxMTtxedEnbug7aRKVRXx4OPfkuauw
Message-ID: <CAN30aBEhnR1OJycVs+F43ocJ6Vyh=Et2r+wo5cWwrtV4x-+zcg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: vDSO: Remove --hash-style=sysv
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, WANG Xuerui <kernel@xen0n.name>, 
	Masahiro Yamada <masahiroy@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_094535_464681_C60181A2 
X-CRM114-Status: GOOD (  19.51  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMjoyNuKAr0FNIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2Fp
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgNjoyM+KAr1BN
IFhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIDIw
MjUtMDItMjEgYXQgMTc6NDcgKzA4MDAsIEh1YWNhaSBDaGVuIHdyb3RlOgo+ID4gPiBIaSwgUnVv
eWFvLAo+ID4gPgo+ID4gPiBPbiBGcmksIEZlYiAyMSwgMjAyNSBhdCA1OjI14oCvUE0gWGkgUnVv
eWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gZ2xpYmMgYWRk
ZWQgc3VwcG9ydCBmb3IgLmdudS5oYXNoIGluIDIwMDYgYW5kIC5oYXNoIGhhcyBiZWVuIG9ic29s
ZXRlZAo+ID4gPiA+IGZhciBiZWZvcmUgdGhlIGZpcnN0IExvb25nQXJjaCBDUFUgd2FzIHRhcGVk
LiAgVXNpbmcKPiA+ID4gPiAtLWhhc2gtc3R5bGU9c3lzdiBtaWdodCBpbXBseSB1bmFkZHJlc3Nl
ZCBpc3N1ZXMgYW5kIGNvbmZ1c2UgcmVhZGVycy4KPiA+ID4gPgo+ID4gPiA+IEluIHRoZSBwYXN0
IHdlIHJlYWxseSBoYWQgYW4gdW5hZGRyZXNzZWQgaXNzdWU6IHRoZSB2ZHNvIHNlbGZ0ZXN0cyBk
aWQKPiA+ID4gPiBub3Qga25vdyBob3cgdG8gcHJvY2VzcyAuZ251Lmhhc2guICBCdXQgaXQgaGFz
IGJlZW4gYWRkcmVzc2VkIGJ5IGNvbW1pdAo+ID4gPiA+IGUwNzQ2YmRlNmY4MiAoInNlbGZ0ZXN0
cy92RFNPOiBzdXBwb3J0IERUX0dOVV9IQVNIIikgbm93Lgo+ID4gPiA+Cj4gPiA+ID4gSnVzdCBk
cm9wIHRoZSBvcHRpb24gYW5kIHJlbHkgb24gdGhlIGxpbmtlciBkZWZhdWx0LCB3aGljaCBpcyBs
aWtlbHkKPiA+ID4gPiAiYm90aCIgKEFPU0MpIG9yICJnbnUiIChBcmNoLCBEZWJpYW4sIEdlbnRv
bywgTEZTKSBvbiBhbGwgTG9vbmdBcmNoCj4gPiA+ID4gZGlzdHJvcy4KPiA+ID4gV2hhdCBhYm91
dCBjaGFuZ2luZyB0byAiLS1oYXNoLXN0eWxlPWJvdGgiIGFzIG1vc3QgYXJjaGl0ZWN0dXJlcyBk
bz8KPiA+Cj4gPiBJTU8gd2UgYXJlIG1vcmUgY2xvc2UgdG8gQVJNNjQgZm9yIHRoZSBhc3BlY3Qg
dGhhdCB0aGVyZSBhcmUgbm8gbGliYwo+ID4gKGdsaWJjIG9yIG11c2wpIHJlbGVhc2VzIGxhY2tp
bmcgR05VIGhhc2ggc3VwcG9ydCwgc28gSSBwcmVmZXIgdGhlIEFSTTY0Cj4gPiB3YXkuCj4gPgo+
ID4gTWF5YmUgdGhpcyBzaG91bGQgYmUgY2hhbmdlZCBmb3Igc29tZSBvZiBvdGhlciBhcmNoaXRl
Y3R1cmVzIChSSVNDLVYgYW5kCj4gPiBDLVNLWT8pIGFzIHdlbGwgYmVjYXVzZSBJIGd1ZXNzIHRo
ZSBvbmx5IHJlYXNvbiB0aGV5IHVzZWQgImJvdGgiIHdhcwo+ID4gImhleSwgd2l0aG91dCB0aGlz
IHRoZSBzZWxmIHRlc3RzIGRvbid0IHdvcmsgb24gRGViaWFuIiBidXQgdGhpcyBpcwo+ID4gcmVz
b2x2ZWQgbm93LiAgQWRkaW5nIGEgZmV3IHJlY2lwaWVudHMgYW5kIENjIGZvciBkaXNjdXNzaW9u
Lgo+IE9LLCBtYXliZSB3ZSBjYW4gY2hhbmdlIGl0IGZvciBSSVNDLVYvQy1TS1kgYW5kIHNlZSB3
aGF0IHRoZXkgd2lsbC4KPgo+IEh1YWNhaQo+Cj4gPgo+ID4gLS0KPiA+IFhpIFJ1b3lhbyA8eHJ5
MTExQHhyeTExMS5zaXRlPgo+ID4gU2Nob29sIG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNo
bm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0eQoKQWdyZWVkIHRoYXQgYXMgc2VsZnRlc3RzIGhhcyBi
ZWVuIGZpeGVkLCAtLWhhc2gtc3R5bGU9c3lzdiBjYW4gYmUKcmVtb3ZlZCBmcm9tIG1vcmUgYXJj
aGVzLgphcmNoL2FybTY0L2tlcm5lbC92ZHNvL01ha2VmaWxlIGhhcyBhbHJlYWR5IHJlbW92ZWQg
dGhlIG9wdGlvbi4KCigKSSBwcm9iYWJseSBzaG91bGQgYWRkIG1vcmUgaW5mb3JtYXRpb24gdG8K
aHR0cHM6Ly9tYXNrcmF5Lm1lL2Jsb2cvMjAyMi0wOC0yMS1nbGliYy1hbmQtZHQtZ251LWhhc2gg
OikKKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
