Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACA9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 01:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AqDt5ZJ00USIxT/F4Ol7at4EwGlx2CIkrweqs7i4dw=; b=mWBOFUnMfscnJV
	BiCXHwxxqUAsbN2x9hAxuKvk5YzVUXYDQDasdO9jQKgI9DrzDNJgTZ6bKlT3nqPxfI/6Lo5QeUw0r
	otHzSfFunEfweIJZFPBT1X4mCd6IzqD06UEHCsnKEoegPism3npNoETeic3FtmNE7N49su6nA9f/e
	dU/mVwlhKRjKnGQ6mNRKRnM2wJrv6Gt31RjuE797vydSqcC0695iumQwJkp4ktFUBXSQFzj+qR5HP
	n58ZugnrgawjXU+c3WFA4IiYaikMGXTZSC0sNoPgLZ5ZHPB2g+4EKUmVYt+0SX+kh87gIWpIioaTI
	LEBiJ8u4+L2b/36Ytt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1s0-00D8hm-J7; Thu, 26 May 2022 01:00:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1ry-00D8fa-8Y
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 01:00:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k30so271703wrd.5
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 18:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=5TA2OkBhz4fpZ+xneLnEgQmjFfE9fpDr0ZbY4GJw0ZQ=;
        b=ngjsDrz/yXO+HZIkkuhS2JJUxmT3ktjUn6eljHR4XmffVXt5jrXCSTTSgsKbfi6Oe8
         JVBB11OTWoE93S5+sJxfHN82ZfWCnSjdakYKPMLRBcDEephAbzm6w/vAfCM6tvHou+bY
         vIlaEq3fftA4+gNfiQN2N51CUWAnT1lbgdCLfopkfG2HNhDd6SG6dASl41YkNbhGbZwO
         qbggID4XYAuShraxgUDiMdYtL9HgzC3hPzowZ2J4C0FC4oR8ZNwOk/JGzX1lvtMzvWpY
         FH5qoQSlqMMrUB3AyOY8r6RA6molqT2tOwvmPP8foHwZlMm2PwKcRSUKjwGr0KJalr7x
         c4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=5TA2OkBhz4fpZ+xneLnEgQmjFfE9fpDr0ZbY4GJw0ZQ=;
        b=DRvg5CO+lWA6Jovx3HbzbrDu15LZzeNFwWEk8whdKtgnhgrygYS5wHjGLSfCLmCjSe
         DURuqGXXxY6tgDiD3KMX497GOYrb2reN467s8R3gr1B/oO5LeWOuqMYMTRxQrcaIkWDG
         hTIMprtlNzo6Q5+f1IAOXFeiVyn0zO1F1v6yRQMgpJAgeoE8ONPXqHzdl+1obn8bo3XE
         Kv+xaCQBd23tWjcDLbkXAtFPXbVWxqgIWJ4/GD4FsWEBUMB7n2w/VO+zwZol0MtQ/VUe
         5Vk86+HMgZIQNBKlsbzNT8/ZaFiMUu1SPcufW+BNVs33/+lQreYI2k/KseDVnraTlMSS
         3WHw==
X-Gm-Message-State: AOAM530ecwI00oHwQqR/RP6UgAAdAuDsIDfz2dUezYFUd58YtAQlNhDI
	m98mmd5JlcEUIFl21p95uR0y0w==
X-Google-Smtp-Source: ABdhPJwrr5kdZD/ajpIquLCdox7ixE/4glrnxGMAf06db+1JZf7fpvikkIUX1ABOhaXULz4UbDL58w==
X-Received: by 2002:a5d:4601:0:b0:20d:53a:2f39 with SMTP id t1-20020a5d4601000000b0020d053a2f39mr28779139wrq.347.1653526850400;
        Wed, 25 May 2022 18:00:50 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id v23-20020a7bcb57000000b003958af7d0c8sm213205wmj.45.2022.05.25.18.00.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 May 2022 18:00:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH V2] riscv: compat: Using seperated vdso_maps for
 compat_vdso_info
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220526003339.2948309-1-guoren@kernel.org>
Date: Thu, 26 May 2022 02:00:49 +0100
Cc: palmer@rivosinc.com,
 arnd@arndb.de,
 linux@roeck-us.net,
 palmer@dabbelt.com,
 heiko@sntech.de,
 linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Message-Id: <EC36D0A9-AE06-4C05-A31B-CC348881937D@jrtc27.com>
References: <20220526003339.2948309-1-guoren@kernel.org>
To: guoren@kernel.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_180054_389190_937B5113 
X-CRM114-Status: GOOD (  21.47  )
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

T24gMjYgTWF5IDIwMjIsIGF0IDAxOjMzLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiAKPiBG
cm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gCj4gVGhpcyBpcyBhIGZp
eHVwIGZvciB2ZHNvIGltcGxlbWVudGF0aW9uIHdoaWNoIGNhdXNlZCBtdXNsIHRvCj4gZmFpbC4K
PiAKPiBbICAgMTEuNjAwMDgyXSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPiBbICAg
MTEuNjI4NTYxXSBpbml0WzFdOiB1bmhhbmRsZWQgc2lnbmFsIDExIGNvZGUgMHgxIGF0Cj4gMHgw
MDAwMDAwMDAwMDAwMDAwIGluIGxpYmMuc29bZmZmZmZmOGFkMzkwMDArYTQwMDBdCj4gWyAgIDEx
LjYyOTM5OF0gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWludGVkCj4gNS4xOC4wLXJj
Ny1uZXh0LTIwMjIwNTIwICMxCj4gWyAgIDExLjYyOTQ2Ml0gSGFyZHdhcmUgbmFtZTogcmlzY3Yt
dmlydGlvLHFlbXUgKERUKQo+IFsgICAxMS42Mjk1NDZdIGVwYyA6IDAwZmZmZmZmOGFkYTExMDAg
cmEgOiAwMGZmZmZmZjhhZGExM2M4IHNwIDoKPiAwMGZmZmZmZmM1ODE5OWYwCj4gWyAgIDExLjYy
OTU4Nl0gIGdwIDogMDBmZmZmZmY4YWQzOTAwMCB0cCA6IDAwZmZmZmZmOGFkZTA5OTggdDAgOgo+
IGZmZmZmZmZmZmZmZmZmZmYKPiBbICAgMTEuNjI5NTk4XSAgdDEgOiAwMGZmZmZmZmM1ODE5ZmQw
IHQyIDogMDAwMDAwMDAwMDAwMDAwMCBzMCA6Cj4gMDBmZmZmZmY4YWRlMGNjMAo+IFsgICAxMS42
Mjk2MTBdICBzMSA6IDAwZmZmZmZmOGFkZTBjYzAgYTAgOiAwMDAwMDAwMDAwMDAwMDAwIGExIDoK
PiAwMGZmZmZmZmM1ODE5YTAwCj4gWyAgIDExLjYyOTYyMl0gIGEyIDogMDAwMDAwMDAwMDAwMDAw
MSBhMyA6IDAwMDAwMDAwMDAwMDAwMWUgYTQgOgo+IDAwZmZmZmZmYzU4MTliMDAKPiBbICAgMTEu
NjI5NjM0XSAgYTUgOiAwMGZmZmZmZmM1ODE5YjAwIGE2IDogMDAwMDAwMDAwMDAwMDAwMCBhNyA6
Cj4gMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAxMS42Mjk2NDVdICBzMiA6IDAwZmZmZmZmOGFkZTBh
YzggczMgOiAwMGZmZmZmZjhhZGUwZWM4IHM0IDoKPiAwMGZmZmZmZjhhZGUwNzI4Cj4gWyAgIDEx
LjYyOTY1Nl0gIHM1IDogMDBmZmZmZmY4YWRlMGE5MCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcg
Ogo+IDAwZmZmZmZmYzU4MTllNDAKPiBbICAgMTEuNjI5NjY3XSAgczggOiAwMGZmZmZmZjhhZGUw
Y2EwIHM5IDogMDBmZmZmZmY4YWRkYmE1MCBzMTA6Cj4gMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAx
MS42Mjk2NzhdICBzMTE6IDAwMDAwMDAwMDAwMDAwMDAgdDMgOiAwMDAwMDAwMDAwMDAwMDAyIHQ0
IDoKPiAwMDAwMDAwMDAwMDAwMDAxCj4gWyAgIDExLjYyOTY4OF0gIHQ1IDogMDAwMDAwMDAwMDAy
MDAwMCB0NiA6IGZmZmZmZmZmZmZmZmZmZmYKPiBbICAgMTEuNjI5Njk5XSBzdGF0dXM6IDAwMDAw
MDAwMDAwMDQwMjAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMAo+IGNhdXNlOiAwMDAwMDAwMDAw
MDAwMDBkCj4gCj4gVGhlIGxhc3QgX192ZHNvX2luaXQoJmNvbXBhdF92ZHNvX2luZm8pIHJlcGxh
Y2VzIHRoZSBkYXRhIGluIG5vcm1hbAo+IHZkc29faW5mby4gVGhpcyBpcyBhbiBvYnZpb3VzIGJ1
Zy4KPiAKPiBSZXBvcnRlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+
IFRlc3RlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+IFRlc3RlZC1i
eTogSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8
Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5j
b20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiBWMjoKPiAtIEFkZCBUZXN0ZWQtYnkKPiAtIFJlbmFtZSB2
dmFyICYgdmRzbyBpbiAvcHJvYy88cGlkPi9tYXBzLgoKV2h5PyBObyBvdGhlciBhcmNoaXRlY3R1
cmUgcmVuYW1lcyBpdCB0byB0aGF0LCBhbmQgdmFyaW91cyBwaWVjZXMgb2YKc29mdHdhcmUgbG9v
ayBmb3IgdGhlIG1hZ2ljIFt2ZHNvXSBuYW1lLCBpbmNsdWRpbmcgR0RCIGFuZCBMTERCLCB0aG91
Z2gKYnkgbXkgY291bnQgdGhlcmUgYXJlIDU3IHNvdXJjZSBwYWNrYWdlcyBpbiBEZWJpYW4gdGhh
dCBjb250YWluIHRoZQpzdHJpbmcgbGl0ZXJhbCAiW3Zkc29dIiAoaW5jbHVkaW5nIHF1b3Rlcyks
IGluY2x1ZGluZyBGaXJlZm94LApBbmRyb2lkJ3MgQVJULCBsdm0yIGFuZCBlbGZ1dGlscy4KCkpl
c3MKCj4gLS0tCj4gYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jIHwgMTUgKysrKysrKysrKysrKy0t
Cj4gMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3Zkc28uYwo+IGluZGV4IDUwZmU0Yzg3NzYwMy4uOTU3ZjE2NGM5Nzc4IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28u
Ywo+IEBAIC0yMDYsMTIgKzIwNiwyMyBAQCBzdGF0aWMgc3RydWN0IF9fdmRzb19pbmZvIHZkc29f
aW5mbyBfX3JvX2FmdGVyX2luaXQgPSB7Cj4gfTsKPiAKPiAjaWZkZWYgQ09ORklHX0NPTVBBVAo+
ICtzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyBydl9jb21wYXRfdmRzb19tYXBzW10g
X19yb19hZnRlcl9pbml0ID0gewo+ICsJW1JWX1ZEU09fTUFQX1ZWQVJdID0gewo+ICsJCS5uYW1l
ICAgPSAiW2NvbXBhdCB2dmFyXSIsCj4gKwkJLmZhdWx0ID0gdnZhcl9mYXVsdCwKPiArCX0sCj4g
KwlbUlZfVkRTT19NQVBfVkRTT10gPSB7Cj4gKwkJLm5hbWUgICA9ICJbY29tcGF0IHZkc29dIiwK
PiArCQkubXJlbWFwID0gdmRzb19tcmVtYXAsCj4gKwl9LAo+ICt9Owo+ICsKPiBzdGF0aWMgc3Ry
dWN0IF9fdmRzb19pbmZvIGNvbXBhdF92ZHNvX2luZm8gX19yb19hZnRlcl9pbml0ID0gewo+IAku
bmFtZSA9ICJjb21wYXRfdmRzbyIsCj4gCS52ZHNvX2NvZGVfc3RhcnQgPSBjb21wYXRfdmRzb19z
dGFydCwKPiAJLnZkc29fY29kZV9lbmQgPSBjb21wYXRfdmRzb19lbmQsCj4gLQkuZG0gPSAmcnZf
dmRzb19tYXBzW1JWX1ZEU09fTUFQX1ZWQVJdLAo+IC0JLmNtID0gJnJ2X3Zkc29fbWFwc1tSVl9W
RFNPX01BUF9WRFNPXSwKPiArCS5kbSA9ICZydl9jb21wYXRfdmRzb19tYXBzW1JWX1ZEU09fTUFQ
X1ZWQVJdLAo+ICsJLmNtID0gJnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19NQVBfVkRTT10s
Cj4gfTsKPiAjZW5kaWYKPiAKPiAtLSAKPiAyLjM2LjEKPiAKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
