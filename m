Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D11C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dsme88M12EHzn6pU7OgMvzP8a5POwwm3uyYm5WNpe90=; b=mk6jYJ7qzXLVKS
	0xQOH5hiDLtwoRNL1E1Co8/A4EMnXTTki/9cNevlD4p1KeWZCAxjbSsrSzIDU9UHAY++jL3wuRGtv
	clQ7lnCtyYwzyiQKR6Bf9a2CNjyuVLEHSa9VS23K0bLWQQgmMbRg/PYKoTHxvGJDUzHmOCnCCf5/a
	i1vAUVSfXGyiItO/QpvdtN8aNWjDS1+ICgvI/BIBFCe8oRLXfJGT/RUaR54rAs4mQXt2erhBRTYFU
	Rm8QACzuu88dtoMhZElIyPLa4RnqFBwOvfkVvRB88tYBB6NWpfA3dAtJY8MV9LX+E9yIVvzWe9Sf3
	B4K15rZqr3Uk2+9nLYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxuDC-006o7A-4R; Thu, 16 Dec 2021 17:06:34 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxtyf-006k76-OS
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 16:51:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j9so13199644wrc.0
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 08:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JNyiABbzSh1geCiJi1HXfzVfSuW/3LT7bKbOspfg3Io=;
 b=IP08B9cjRg3l3tiMqtzsy1+LkMzeYqqFcIgf/QFO6gbrflGDDnx6+9PWZzUQk+Qso2
 A3LTngaUpXJXE5zsmokpwswk+qsAYiDProcjE6t3nsNYyQ9k2SD7SR1BfMKb9N74mWy5
 glzI/HEHBwCt3fBL9uF/2E6UFKIthk64V6r+Ug4NLjP0pdZtWLa+3qUt6f7b5vR7PwNO
 9aWP7ZKgqaNlWjYSlQwIyWm7KGaQghQ55QfzhZnaBJBogks1ccliH+ti1Ct58kSJ791+
 BfFmIgoo5iomFMHzsW5rqociw7+uA2xU+cjnOGtb8W9Nw/cnlbwH64vZuHDuYQggKbAd
 6zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JNyiABbzSh1geCiJi1HXfzVfSuW/3LT7bKbOspfg3Io=;
 b=nY0Wh8lYk1CIOx7xj+kSQIZv3XjJHOgQH1CRCyqvsKOxPhdsv2XZZefyWSoX5JgoVH
 0ZcqsVvzNvRuJcMxyJi8kI8dgLNCBO22AYXxTu9VSdKmp62uIPLCcre4vHmwuzDAgQVI
 FQaIz+Qh1IjWhs67a+YE4pwyX7sXX5XJ7WnZV4AVLdL3uQeBpu3hPDmzqJ7zMH0VSu8d
 X6nzUbE4xkH1ad7QCjXhEbQFWiZs0lVnP+OYvkUfaAmDSp8YRWfTgQ9HfMyLc6w91Rov
 SJ/ljxE3LuqvyJEKQYern843HupOrpZwVSioRmNcOmvhGsNokDRSLtyKAkH2NcC1LwpD
 LDJQ==
X-Gm-Message-State: AOAM530se0xVnwBpTadMSfyQAT46qAL1fIkPivhzHD7GCbP/5QoGvK71
 Qgknod2MeAVLyz2pB4Hxs1Blig==
X-Google-Smtp-Source: ABdhPJwM8mGDoUjiTAKpbtdjkv5P7+B0j1Ym/aW/6YMZqlUg2MTlhmRICw/BK8uDkoc6ZTlXbihJaw==
X-Received: by 2002:adf:c182:: with SMTP id x2mr9933874wre.646.1639673489408; 
 Thu, 16 Dec 2021 08:51:29 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id u13sm9300804wmq.14.2021.12.16.08.51.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Dec 2021 08:51:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/1] riscv: default to CONFIG_RISCV_SBI_V01=n
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <fd40010f-f2ec-b32a-6850-1e054af43725@canonical.com>
Date: Thu, 16 Dec 2021 16:51:28 +0000
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <150C4E84-2C69-45DB-AF27-1E0C223D8D7A@jrtc27.com>
References: <20211216123538.175087-1-heinrich.schuchardt@canonical.com>
 <BC1B38E7-1170-4C05-948A-D18E80AC49E7@jrtc27.com>
 <fd40010f-f2ec-b32a-6850-1e054af43725@canonical.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_085133_848543_8597D583 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

T24gMTYgRGVjIDIwMjEsIGF0IDE0OjE3LCBIZWlucmljaCBTY2h1Y2hhcmR0IDxoZWlucmljaC5z
Y2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+IAo+IE9uIDEyLzE2LzIxIDE0OjQ5LCBK
ZXNzaWNhIENsYXJrZSB3cm90ZToKPj4gT24gMTYgRGVjIDIwMjEsIGF0IDEyOjM1LCBIZWlucmlj
aCBTY2h1Y2hhcmR0IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+
Pj4gCj4+PiBUaGUgU0JJIDAuMSBzcGVjaWZpY2F0aW9uIGlzIG9ic29sZXRlLiBUaGUgY3VycmVu
dCB2ZXJzaW9uIGlzIDAuMy4KPj4+IEhlbmNlIHdlIHNob3VsZCBub3QgcmVseSBieSBkZWZhdWx0
IG9uIFNCSSAwLjEgYmVpbmcgaW1wbGVtZW50ZWQuCj4+IEl04oCZcyB3aGF0IEJCTCBpbXBsZW1l
bnRzLCBhbmQgc29tZSBwZW9wbGUgYXJlIHN0aWxsIHVzaW5nIGl0LAo+PiBlc3BlY2lhbGx5IGdp
dmVuIGVhcmx5IGhhcmR3YXJlIHNoaXBwZWQgYmVmb3JlIE9wZW5TQkkgZ3JldyBpbgo+PiBwb3B1
bGFyaXR5Lgo+PiBKZXNzCj4gCj4gRG8geW91IG1lYW4gQkJMIGlzIG5vdCBkZXZlbG9wZWQgYW55
bW9yZT8KPiAKPiBTb21lIHBlb3BsZSBtYXkgc3RpbGwgYmUgdXNpbmcgYSAwLjEgU0JJLiBCdXQg
dGhhdCBtaW5vcml0eSBzdHVjayBvbiBhbiBvdXRkYXRlZCBzb2Z0d2FyZSBzdGFjayBkb2VzIG5v
dCBqdXN0aWZ5IGRlZmF1bHRpbmcgdG8gZGVwcmVjYXRlZCBzZXR0aW5ncyBpbiBmdXR1cmUgTGlu
dXggcmVsZWFzZXMuCgpCQkwgaXMgc3RpbGwgYWN0aXZlbHkgbWFpbnRhaW5lZDsgaXRzIG1vc3Qg
cmVjZW50IGNvbW1pdCB3YXMgMjQgZGF5cwphZ28uIEFsc28sIHRoZSBhbW91bnQgb2YgY29kZSBD
T05GSUdfUklTQ1ZfU0JJX1YwMSBhZmZlY3RzIGlzIHRpbnksIHNvCkkgc2VlIG5vIHRhbmdpYmxl
IGJlbmVmaXQgZnJvbSBtYWtpbmcgdGhpcyBjaGFuZ2UsIGp1c3QgdW5uZWNlc3NhcnkKYnJlYWth
Z2Ugb2YgcGVyZmVjdGx5IGZ1bmN0aW9uYWwgc3lzdGVtcy4KCkplc3MKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
