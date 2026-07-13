Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF37BC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1F5I/ZE2+Om8PLaJMIJIl/rI9cYNk2dzL/UKl7A6FQ=; b=ZG6W5pJCBJFzwv
	5sDEBjmt0QdY+scLSRvogLVAjvVX4KkxtgVrm3b4gr2ULlpu8RXuzMrCAsjCHhPh55y7hhmHqIorZ
	liaNljRhKPcGnHYNVqMtpnSxDOCdQuFx9JU8HodYro4UR/V9ufC/bAP6qnBKgdtKBhPlzigjbfCEm
	OmWscXJlB20qqOW5ccQzMWxt7ToeP8D0ePATXk0oP6kiakeeLOdaGH/M51FdByv1c5iTPYNDIU64l
	hFIOfv8HUhH2Ixv3ePkaUrdlXCPXjVDTWOfbt8b7sGK55GH3beVHGhqkxTf8PeYYxA4ju5MdvwavD
	KvnaZWTBQ0cRWa9Jgvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFNm-000000096tJ-1pDh;
	Mon, 13 Jul 2026 12:03:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFNj-000000096sB-28DK
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 12:03:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493ec555a26so19986335e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 05:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783944209; cv=none;
        d=google.com; s=arc-20260327;
        b=IEseVqxgqf02QhIyvcHa0XhySgLbQJBtm9gLfBBtzRCIi6C+QypOi0HLIXFmI6StKg
         T5bq88a0bM7l5cpIS/de5M36/+5leWPY/0OhvzBxcJ6a6Z5g1O/scyl8qFbhU8pqdCuk
         RTJttIdtLoAIHqCkgV7IiW7+s5oVM3T1fNK0ocUYa/hXoz/UeKbslds47+aYbjdBKWbs
         k5lp6Kh0P/SYLqY6B5gdZfoW99yasCgWye+axddGuqa+xDOy+xs3dbntl5lcKPrX6+R+
         QbkoRJf7IVKHwTgNVKBR45TQkK4gm+HOTTgmUQtbnfGxK6L9Eorx2LgMe858s8yBe3p7
         8xVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oozs3eFC1FFs/wCU61IvN3QW98PJylYyvcgjFAJyGPk=;
        fh=eGnAexGyhhYmeuppqYworjJiwxyl/7wcPH5PM4a7TwY=;
        b=lBN+EqLc7XdPJ4j6B5/WZZwbQJtJUBt6SHlSByKsCkHcwlSgcdDPD8G86sUF8YE8Et
         BQ46h2bueNpLR9DjAbf28uw6CcTPN9nbD+GB9jyRXKp5yhlcDd803X/xMV4pV9t+VU0P
         ee4+stUZ9NcS8HXp0vzI8i+KhoTu45EyZeem0Swxtb74zFnrSJ7dWl2Csb2JYCJWdfrr
         NAf0T6rZ0ayIjHOVm8WR8BO+7ZLWzlEOPrCnhEk9gVXFxezwS5+KscPRpExwm6hz7nrt
         6A87h9SxWCIiVLnOId5n1FLwsN+0Uj0O7nt+eyCkkTKSFzTBwyp8K442lNZH1QIzCaZ/
         QV2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783944209; x=1784549009; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oozs3eFC1FFs/wCU61IvN3QW98PJylYyvcgjFAJyGPk=;
        b=yuLVZ9l9g9IkC0kkWoFyQaVKQWqP2RofP8FcvCp2Heo/JpYkpk1ydFoMnoJG1A/F+g
         wzMFWKz3au+IHxsEKu6ckhrmduNMgE+yyA0rMBfXZ04dHQwzBqqvcWWOvd1RRBGIw8rj
         j7p6RAxSfaRoqzLiii8JGByDQ+HWw7LOZ2CftgjuWymCOHTdYtQoZUsFx/17UtNVKeQL
         /9iAfOPFHQBXR9vNffsQCqYUJFrFWboxLxzyY+4S9PdpwGCJxeQcv6cEBvMKgdAcRD+O
         SfPdky6XFgCjSIoHnc7jCXufKx9YRjKML12A4WYJh7DX06Y3v8o31Y6ahSbE3/lebo0p
         +EYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944209; x=1784549009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oozs3eFC1FFs/wCU61IvN3QW98PJylYyvcgjFAJyGPk=;
        b=iMrOeviLk19grgvdxUmmugFwSyQA2/dEC0B+cE4ZGgRa02yEiSd+iq9FzOuuIzB/F9
         SyFYTY+kVaNjB6HsTRRNcgG0nB5GFUILC1j1T33b6s/+Boa+C1o/IWHesqdZQegqqd6+
         xXwHi8IZf85Wsr7JvxAcdbn4zHtMoGcHViQ5bqQUDZ8gZbcAZQmD7+voYkzXB/P8rziB
         E2n2BJJamk57GX7xQqBHm962fK1usVctuUNFs1L8ejFJavpSZgRHABKK30Jtw7IyCdwn
         Plq6ZzJ3flVh+SWFljsONfCJkVzCgMCOLlpe996XfSVukELbD3Y4gbqOYkL7XOLYelL4
         IClQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOKDbIsnfWrFtkcb/89Fn2AktBaxkwEKQ4YFdDZRhnebK5CiuCGqILg1xSfQj0z5IoNbXuGPTl1c+V8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKV7I792syQpuoG/7Y6JstJbVjOWI+K4uF4aQnvZmoHg1QZ38A
	UA/EIARHD6WWHnlNBJcectKI2voolCrbWqyWxVGvhzWz2cv5f3FyhEODOODyJ7acmeBWkI+kcdQ
	x8CDoFxvBt4G4WyQ16EuJAzbOUxYsca5hsIiL/MYkXlYbulqBtc/j
X-Gm-Gg: AfdE7clFkXpRG1vGdPDjKpwK6wWaNf4a+SQ5ema/HsSUd131XBLYvN440hUI5Wtzuuc
	hZ2Ey4sfxi44v8qoM2kbkdTOmsjAioO44ozu+zQ6oBA12JLxlo2DWstVwjA+MKSyQPqL0UQJW/u
	e9LEK3eqPa47WG92bzUhZXNM9DNxax4TXzTr3zWN+lnpCCXtTWefa2ligHvyOb3EO3siq7FiHmh
	8d1Dw/haRTbnfBfDqumJ9oKOHmY8Aj8wuMjO+6JjhP4ZsQhfQDn+WI8xN5py30chyQPbeJw5ZYw
	6AuA/7WAn1gu/IUvB5h9rLiE58NMf2ZbGY0Pggf05KXBNHBbP1a5ATPX6p0KwIOiTdH0qlUl2/n
	+AXXpC6WsschoNHOYip6uSBzGUA==
X-Received: by 2002:a05:600c:468f:b0:493:df1d:7488 with SMTP id
 5b1f17b1804b1-493f87e5b4cmr96665755e9.16.1783944209169; Mon, 13 Jul 2026
 05:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260626054051.3360865-1-shengwen1997.tw@gmail.com>
In-Reply-To: <20260626054051.3360865-1-shengwen1997.tw@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 17:33:16 +0530
X-Gm-Features: AUfX_myWpn2AvfXbvMGkjx49S1JKE-8WzmOZBUvjQKodn67rqUdZl1K_Gwiur7Q
Message-ID: <CAAhSdy253v97ivo8rx9ftnAdYaQs6zmjaJ+yRnk6x-Kt7Xm_XQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: PMU: Bound counter mask scan to BITS_PER_LONG
To: Shengwen Cheng <shengwen1997.tw@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050331_828695_2AD4D584 
X-CRM114-Status: GOOD (  19.03  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMTE6MTHigK9BTSBTaGVuZ3dlbiBDaGVuZwo8c2hlbmd3
ZW4xOTk3LnR3QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgUE1VIFNCSSBoYW5kbGVyIHBhc3Nl
cyB0aGUgZ3Vlc3QgYXJndW1lbnQgcmVnaXN0ZXJzIGRpcmVjdGx5IHRvIHRoZQo+IFBNVSBzdGFy
dC9zdG9wIGhlbHBlcnM6Cj4KPiBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX3N0YXJ0KHZjcHUsIGNw
LT5hMCwgY3AtPmExLCBjcC0+YTIsIC4uLikKPiBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX3N0b3Ao
dmNwdSwgY3AtPmEwLCBjcC0+YTEsIGNwLT5hMiwgLi4uKQo+Cj4gd2hpY2ggbWFwIHRvOgo+Cj4g
dW5zaWduZWQgbG9uZyBjdHJfYmFzZQo+IHVuc2lnbmVkIGxvbmcgY3RyX21hc2sKPiB1bnNpZ25l
ZCBsb25nIGZsYWdzCj4KPiBUaHVzIGNwLT5hMSBpcyBhIHNpbmdsZSB1bnNpZ25lZCBsb25nIGN0
cl9tYXNrLCBub3QgYSBiaXRtYXAgYXJyYXkgc2l6ZWQKPiBmb3IgUklTQ1ZfTUFYX0NPVU5URVJT
Lgo+Cj4gT24gUlYzMiwgUklTQ1ZfTUFYX0NPVU5URVJTIGlzIDY0IHdoaWxlIEJJVFNfUEVSX0xP
TkcgaXMgMzIuICBVc2luZwo+IGZvcl9lYWNoX3NldF9iaXQoKSB3aXRoIFJJU0NWX01BWF9DT1VO
VEVSUyBjYW4gdGhlcmVmb3JlIG1ha2UKPiBmaW5kX25leHRfYml0KCkgYWNjZXNzIGJpdHMgYmV5
b25kIHRoZSBzdG9yYWdlIG9mIGN0cl9tYXNrIG9uIFJWMzIuCj4KPiBMaW1pdCB0aGUgc2NhbiB0
byBCSVRTX1BFUl9MT05HLiAgVGhlIHJlcXVlc3RlZCBjb3VudGVyIHJhbmdlIGlzIGFscmVhZHkK
PiB2YWxpZGF0ZWQgYnkga3ZtX3BtdV92YWxpZGF0ZV9jb3VudGVyX21hc2soKSwgc28gdGhpcyBw
cmVzZXJ2ZXMgUlY2NAo+IGJlaGF2aW9yIGFuZCBhdm9pZHMgYW4gb3V0LW9mLWJvdW5kcyBiaXRt
YXAgcmVhZCBvbiBSVjMyLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2hlbmd3ZW4gQ2hlbmcgPHNoZW5n
d2VuMTk5Ny50d0BnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBhIGZpeCBmb3IgTGludXgt
Ny4yLXJjWAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5j
IHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfcG11LmMKPiBpbmRleCBiYjQ2ZGNiZmIuLjIwMjViNjY0OSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dV9wbXUuYwo+IEBAIC01ODYsNyArNTg2LDcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9jdHJf
c3RhcnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYXNlLAo+ICAg
ICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gICAgICAgICAvKiBTdGFydCB0aGUgY291bnRl
cnMgdGhhdCBoYXZlIGJlZW4gY29uZmlndXJlZCBhbmQgcmVxdWVzdGVkIGJ5IHRoZSBndWVzdCAq
Lwo+IC0gICAgICAgZm9yX2VhY2hfc2V0X2JpdChpLCAmY3RyX21hc2ssIFJJU0NWX01BWF9DT1VO
VEVSUykgewo+ICsgICAgICAgZm9yX2VhY2hfc2V0X2JpdChpLCAmY3RyX21hc2ssIEJJVFNfUEVS
X0xPTkcpIHsKPiAgICAgICAgICAgICAgICAgcG1jX2luZGV4ID0gYXJyYXlfaW5kZXhfbm9zcGVj
KGkgKyBjdHJfYmFzZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFJJU0NWX0tWTV9NQVhfQ09VTlRFUlMpOwo+ICAgICAgICAgICAgICAgICBpZiAoIXRl
c3RfYml0KHBtY19pbmRleCwga3ZwbXUtPnBtY19pbl91c2UpKQo+IEBAIC02NTgsNyArNjU4LDcg
QEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9jdHJfc3RvcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHVuc2lnbmVkIGxvbmcgY3RyX2Jhc2UsCj4gICAgICAgICB9Cj4KPiAgICAgICAgIC8qIFN0b3Ag
dGhlIGNvdW50ZXJzIHRoYXQgaGF2ZSBiZWVuIGNvbmZpZ3VyZWQgYW5kIHJlcXVlc3RlZCBieSB0
aGUgZ3Vlc3QgKi8KPiAtICAgICAgIGZvcl9lYWNoX3NldF9iaXQoaSwgJmN0cl9tYXNrLCBSSVND
Vl9NQVhfQ09VTlRFUlMpIHsKPiArICAgICAgIGZvcl9lYWNoX3NldF9iaXQoaSwgJmN0cl9tYXNr
LCBCSVRTX1BFUl9MT05HKSB7Cj4gICAgICAgICAgICAgICAgIHBtY19pbmRleCA9IGFycmF5X2lu
ZGV4X25vc3BlYyhpICsgY3RyX2Jhc2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBSSVNDVl9LVk1fTUFYX0NPVU5URVJTKTsKPiAgICAgICAgICAgICAg
ICAgaWYgKCF0ZXN0X2JpdChwbWNfaW5kZXgsIGt2cG11LT5wbWNfaW5fdXNlKSkKPiAtLQo+IDIu
NDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
