Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B993C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 04:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqY+WcyslXhTYT/jiXFWJ9MBYQ/yzyxmU3WtHNQZQ9M=; b=hR8uu2smNBezYb
	WqaeFenietXw2AVEUCVq7dnx70lgKrI4XUGE0HUEVyjawzuWHt4Av6mSJFqazc6g+XqW7tqKyb4Pj
	LztyG+VlTwSnCOOV3ZA+IPiddhGEZISRYglTKVtJAu3u9M5u3YzHZopSmvSfJSlt5+iDbq7qWXFsm
	J0GriEwfCOYNkEzWo8BXet36mSF4p6BUnz9gNNtALVaWYb7kFOk3ADJbfkr/cCFbfywi59tD0ORJC
	jQ680I2DbR1IYhWUb5XJLkrUVlI4YfTQ2Q8f15diywgA/NhalYmVVAqsReZ85r5mPFDurAIby1paJ
	4lvuEmPx2ca7TXcEbWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tin30-0000000DZZW-0fBT;
	Fri, 14 Feb 2025 04:11:26 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tin2x-0000000DZZ2-1U9d
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 04:11:25 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2aa17010cbcso1305741fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 20:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739506277; x=1740111077; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1KWHf++8W5fV1RbAwQTM4zcz6/lfxxSV1aIdBKY9Yg=;
        b=bvtP0PywqMK1zMmyzhRqWhRo0PojDPgfU5MyJju6p8m95nL2mwkdSurN4z4P98y3g2
         zDoL2AMpIgKKwXT7zZEE9JZbbPcUPw6p9RP5Dqgw7JPqnCbH0O/woGtEZ1pN6rHDpzUj
         FuGcR/Bh6LlwYBnW607OUDhuL8oYppjx81S4axMoiAAJ+iHMzo6WMvP9kJkbCiTGlalL
         KhtDpofXruYbUYI62mQtvmSfxzE5/1j4VLicFapFz1HvQO10DQDdhB5ODN2EJtwXvxuR
         kWCPh195J018LwoTxgyqzLps0Ze0sJHRI6faIWIKvdiJjQVTCst6du+qF0K8OzfBN3Vt
         KFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739506277; x=1740111077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1KWHf++8W5fV1RbAwQTM4zcz6/lfxxSV1aIdBKY9Yg=;
        b=Jq0YYtykdqK1teX61X+Ry985dGJQKWBwFAbEjWbP8aEjAk1JTEGchf5nZKZRl8RrTb
         EhNpsdAitKWc6n1G3l9TiDFUtTTU3jMGuKG0drdGdDpTMsdHVQeJb9v+0qFxJeW5uu/2
         DHcZ0YvjkOspGvH+4OCr0ugumpjCOR9giNXI9/koQQYr0nAxlHmU5OZ6Z+xDrq5MnXAh
         ffv6vNjt6UG6yYdHsZSPcv9CO2kqTmOnR/AtlYZS4UVyIdWXUeis8d/2PzTZ10YQS6P+
         WeYYBTRnCP8CET+JR15H21z0c70gySDU24hNgH7GiPBQsMxHDNU2cdwmNVyFhe4aAg4V
         prSw==
X-Forwarded-Encrypted: i=1; AJvYcCWdrrVNldVhN2Ey0bSoYwnhQzUd2jsidxtOoLxdOVyRkKi5wINYStPfRlCsNKZIczWLcwGpCOT7MjyQ4g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Azllcfp81Igrd330NSsuf72M2efyG8cM71FmphyIPLxqT8HQ
	qbDVIbNGUp55O4wBaxFu1okCzRIrV3dg2aHSm+eLHG5GmOIftK8d+z8HKZGDyuMf8bBYEcUcqCJ
	orryyIEN8wy8/P9tobI4uBif96YYVYziDPD2frQ==
X-Gm-Gg: ASbGnctLqj0rpoOicp29pNuMMdmXWlj76Og5CGZv9P5ZDcqLQDQPlfsaqGEiEHx7JUW
	JV2C+JfkFBI+UUxYSPPEVM+TdE16SdjfiVAbKnsbcBZPBatBvYohqoB8ByDhpz5xlv1/cJOCBhO
	mnPTLrQmH9fw==
X-Google-Smtp-Source: AGHT+IFOhXxP+vRbGYo35IgATS71rKERSezvT7bJC7RWvfp19qLtfzZg8hIdvVdo0XYYtcZD2GR9bgJ9Z+G/NRzjAK8=
X-Received: by 2002:a05:6871:aa09:b0:2bc:716c:4622 with SMTP id
 586e51a60fabf-2bc716c48c5mr1595038fac.38.1739506277383; Thu, 13 Feb 2025
 20:11:17 -0800 (PST)
MIME-Version: 1.0
References: <mvmfrkv2vhz.fsf@suse.de> <173947144178.1330575.8179936961826705707.git-patchwork-notify@kernel.org>
In-Reply-To: <173947144178.1330575.8179936961826705707.git-patchwork-notify@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 14 Feb 2025 12:11:06 +0800
X-Gm-Features: AWEUYZma9x3xG5BVCVj1l1hGgrFkApgPF92BQSPSOpWUewA9V9CltP2eB1S4OR0
Message-ID: <CAEEQ3wmH9MCYCfLL4Q7R7BHWbiQso+xr=zjhizY+kA5xtNzEzw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv/futex: sign extend compare value in
 atomic cmpxchg
To: patchwork-bot+linux-riscv@kernel.org
Cc: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_201123_692795_46A4708C 
X-CRM114-Status: GOOD (  15.67  )
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

SGksCgpPbiBGcmksIEZlYiAxNCwgMjAyNSBhdCAyOjMx4oCvQU0gPHBhdGNod29yay1ib3QrbGlu
dXgtcmlzY3ZAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbzoKPgo+IFRoaXMgcGF0Y2ggd2Fz
IGFwcGxpZWQgdG8gcmlzY3YvbGludXguZ2l0IChmaXhlcykKPiBieSBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHJpdm9zaW5jLmNvbT46Cj4KPiBPbiBNb24sIDAzIEZlYiAyMDI1IDExOjA2OjAwICsw
MTAwIHlvdSB3cm90ZToKPiA+IE1ha2Ugc3VyZSB0aGUgY29tcGFyZSB2YWx1ZSBpbiB0aGUgbHIv
c2MgbG9vcCBpcyBzaWduIGV4dGVuZGVkIHRvIG1hdGNoCj4gPiB3aGF0IGxyLncgZG9lcy4gIEZv
cnR1bmF0ZWx5LCBkdWUgdG8gdGhlIGNvbXBpbGVyIGtlZXBpbmcgdGhlIHJlZ2lzdGVyCj4gPiBj
b250ZW50cyBzaWduIGV4dGVuZGVkIGFueXdheSB0aGUgbGFjayBvZiB0aGUgZXhwbGljaXQgZXh0
ZW5zaW9uIGRpZG4ndAo+ID4gcmVzdWx0IGluIHdyb25nIGNvZGUgc28gZmFyLCBidXQgdGhpcyBj
YW5ub3QgYmUgcmVsaWVkIHVwb24uCj4gPgo+ID4gRml4ZXM6IGI5MGVkYjMzMDEwYiAoIlJJU0Mt
VjogQWRkIGZ1dGV4IHN1cHBvcnQuIikKPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgU2Nod2Fi
IDxzY2h3YWJAc3VzZS5kZT4KPiA+Cj4gPiBbLi4uXQo+Cj4gSGVyZSBpcyB0aGUgc3VtbWFyeSB3
aXRoIGxpbmtzOgo+ICAgLSByaXNjdi9mdXRleDogc2lnbiBleHRlbmQgY29tcGFyZSB2YWx1ZSBp
biBhdG9taWMgY21weGNoZwo+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvNWMy
Mzg1ODRiY2U1Cj4KPiBZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKPiAtLQo+IERlZXQtZG9v
dC1kb3QsIEkgYW0gYSBib3QuCj4gaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdv
cmsvcHdib3QuaHRtbAo+Cj4KCkkgYXBwbGllZCB0aGlzIHBhdGNoLCBidXQgaXQgZG9lc24ndCBz
ZWVtIHRvIHRha2UgZWZmZWN0LiBUaGVyZSBpcyBubwpzaWduIGV4dGVuc2lvbiBmb3IgYTIgaW4g
dGhlIGFzc2VtYmx5IGNvZGUuIFdoYXQgZGlkIEkgbWlzcz8KR0NDIHZlcnNpb24gPj0gMTMuCgpm
ZmZmZmZmZjgwMGU4N2UwIDxmdXRleF9hdG9taWNfY21weGNoZ19pbmF0b21pYz46CmZmZmZmZmZm
ODAwZTg3ZTA6IDExNDEgICAgICAgICAgICAgICAgYWRkaSBzcCxzcCwtMTYKZmZmZmZmZmY4MDBl
ODdlMjogZTQyMiAgICAgICAgICAgICAgICBzZCBzMCw4KHNwKQpmZmZmZmZmZjgwMGU4N2U0OiAy
YmYwMTc5MyAgICAgICAgICBic2V0aSBhNSx6ZXJvLDB4M2YKZmZmZmZmZmY4MDBlODdlODogMDgw
MCAgICAgICAgICAgICAgICBhZGRpIHMwLHNwLDE2CmZmZmZmZmZmODAwZTg3ZWE6IDE3ZWQgICAg
ICAgICAgICAgICAgYWRkaSBhNSxhNSwtNQpmZmZmZmZmZjgwMGU4N2VjOiAwMGI3ZjY2MyAgICAg
ICAgICBiZ2V1IGE1LGExLGZmZmZmZmZmODAwZTg3ZjgKPGZ1dGV4X2F0b21pY19jbXB4Y2hnX2lu
YXRvbWljKzB4MTg+CmZmZmZmZmZmODAwZTg3ZjA6IDY0MjIgICAgICAgICAgICAgICAgbGQgczAs
OChzcCkKZmZmZmZmZmY4MDBlODdmMjogNTU0OSAgICAgICAgICAgICAgICBsaSBhMCwtMTQKZmZm
ZmZmZmY4MDBlODdmNDogMDE0MSAgICAgICAgICAgICAgICBhZGRpIHNwLHNwLDE2CmZmZmZmZmZm
ODAwZTg3ZjY6IDgwODIgICAgICAgICAgICAgICAgcmV0CmZmZmZmZmZmODAwZTg3Zjg6IDg3MmEg
ICAgICAgICAgICAgICAgbXYgYTQsYTAKZmZmZmZmZmY4MDBlODdmYTogMDAwNDA4MzcgICAgICAg
ICAgbHVpIGE2LDB4NDAKZmZmZmZmZmY4MDBlODdmZTogMTAwODIwNzMgICAgICAgICAgY3NycyBz
c3RhdHVzLGE2CmZmZmZmZmZmODAwZTg4MDI6IDQ3ODEgICAgICAgICAgICAgICAgbGkgYTUsMApm
ZmZmZmZmZjgwMGU4ODA0OiAxNjA1YThhZiAgICAgICAgICBsci53LmFxcmwgYTcsKGExKQpmZmZm
ZmZmZjgwMGU4ODA4OiAwMGM4OTU2MyAgICAgICAgICBibmUgYTcsYTIsZmZmZmZmZmY4MDBlODgx
Mgo8ZnV0ZXhfYXRvbWljX2NtcHhjaGdfaW5hdG9taWMrMHgzMj4KZmZmZmZmZmY4MDBlODgwYzog
MWVkNWE1MmYgICAgICAgICAgc2Mudy5hcXJsIGEwLGEzLChhMSkKZmZmZmZmZmY4MDBlODgxMDog
Zjk3NSAgICAgICAgICAgICAgICBibmV6IGEwLGZmZmZmZmZmODAwZTg4MDQKPGZ1dGV4X2F0b21p
Y19jbXB4Y2hnX2luYXRvbWljKzB4MjQ+CmZmZmZmZmZmODAwZTg4MTI6IDAwMDc4NTFiICAgICAg
ICAgIHNleHQudyBhMCxhNQpmZmZmZmZmZjgwMGU4ODE2OiAxMDA4MzA3MyAgICAgICAgICBjc3Jj
IHNzdGF0dXMsYTYKZmZmZmZmZmY4MDBlODgxYTogMDExNzIwMjMgICAgICAgICAgc3cgYTcsMChh
NCkKZmZmZmZmZmY4MDBlODgxZTogNjQyMiAgICAgICAgICAgICAgICBsZCBzMCw4KHNwKQpmZmZm
ZmZmZjgwMGU4ODIwOiAwMTQxICAgICAgICAgICAgICAgIGFkZGkgc3Asc3AsMTYKZmZmZmZmZmY4
MDBlODgyMjogODA4MiAgICAgICAgICAgICAgICByZXQKClNob3VsZCB3ZSBkbyBpdCBsaWtlIHRo
aXM6Cl9fYXNtX18gX192b2xhdGlsZV9fICgKIiBzZXh0LncgJVtvdl0sICVbb3ZdIFxuIgouLi4K
CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
