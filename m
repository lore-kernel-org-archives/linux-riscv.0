Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911A0D3B7E5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdYGTJViU2fsEgLB/Fc9Y3Xfxhu2ZXflWozXDJnECOY=; b=yxpYSLnHyPE3da
	h2C5H+klUCsv9x/pc4x8A8jw+WJd8KxwdimwcOU5vxiAnJTopuyk3u+5kWIaxelRx2f+K2nCs/YkF
	DOyHoT4cGRe+MNdhEISuWYDRqgzUekKnept55my/rrAIXM3bqlNqW/jU8WApxyRDH695TMhjJb4Fp
	rjKoGLdk95iSqvP/l35kXjOFtU5FyHcQa/2/mu349J8s626QLMztxysp+3MWExOmvBTaQ0B8Cttb3
	0cKZMggCYuS2rxUB67ObbWx/iTb3kljYyXeXTmyO0XHfBywBBZMndI7swL8hTZ4NwWyaTmdPFPOFr
	y2LRIzz/Qze7A9MTwhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZlbz-00000002aNu-04Rn;
	Sun, 28 Dec 2025 07:54:47 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZlbw-00000002aNT-2rAM
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 07:54:45 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso7331836137.2
        for <linux-riscv@lists.infradead.org>; Sat, 27 Dec 2025 23:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766908483; x=1767513283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCyx6Mqpzdar9VYEKGCLb4kdS1Mp74Ev7TEjgfeFuw0=;
        b=jqt6Mp6WyL/MZl0Ixk8ogyGBGf2iUzlXvM4ZAfkdOQ+A4CkeuO3ldq/T5+vXORj4CZ
         +W2YUOgXOUHnujyv5pztVtCPgreCkNJN+4GwRmmW5YhBitJnv1yN1QQ48jp52vK3EhL7
         7DkW18A5Sn3gCo7x7Uk6aEuSQoPCwv+w8YWor+X6WL0pHESeSx67hY7S0VUGvDoRdJCB
         ZPOaIWHxGo2VP9oNcolE+p/cVaXWF6oRDWdwxTcDxtcqv0Z/Yf7K1DYJ3Glvm+yAWlk5
         Q71GFIS6pTcLKc5Of4Id5GQWDcEyShbepwKY9fmqRuCvOh2wO5DllbIBHLXILr3XWMK2
         b59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766908483; x=1767513283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QCyx6Mqpzdar9VYEKGCLb4kdS1Mp74Ev7TEjgfeFuw0=;
        b=iBV/zj+l4hrgDVhgx88tI35rQt3VVq5M5yOcHrFyAwY0qTQqsOPOeURvjgZd4KMy4K
         1e9nvIybP1Xu5LxGRrwUXKGOhgCrKTpaJ5cpGybIaJ40P/ijsVfPEmoWl27qflua3XSy
         6AujH9ukIXOLMVfTC3hJ8twgZ8eJteW1RggVn2DDGQippXHY3lBfNqrFI+nup/FDoIYW
         eQ32AtP2jCVpM74dy7IlIIHrMhBB+qbV2qY/JrM/rys15DJs+uLdy2Xh/QHRSBPZ/KF7
         /B/w9/cK/q4PS4sYFbS+LSWz2jXRIMpojM97nhE3xDYZg3WKiuEuIuwhotw1uBh3otNB
         Gp9w==
X-Forwarded-Encrypted: i=1; AJvYcCW6xIkvT/xRCBET397CwM7AEXtfqNthCuGSC6GIlmb/UhzWYqPQjl6fWA4LMpXodmCFsR9H1PvdUlu2wA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3J4Ch1V/qnooIHr02sPy4Mo+po2t2Alom0DddoBCRIvaWhNxQ
	X0SW+v3aG6zYVzw1zYi3vad1N68u+CG2JwfsR7OETDU+bFzd37PqC0WYEQTmWG0Nd9epPXWWbC7
	7xIk4LkWt+z/e7mxKVcBL/YJ7JTzyQvU=
X-Gm-Gg: AY/fxX7j+UUvM2CY+AHdc7f8YxgjG9GW7B3/0EhQIn2qGWkuMfbFp6YGLTSFnJbC42A
	r9E3grrNbaTnkkjMnyxxFSXiY9ZHARAJcB2Z67hypiqxBbSMnrzRlHPdfYyppYXwudPC3mfVVTW
	da3CaUIZuXqi5cdZ2Tf+XcXXE1RGh4yqxUAj3GHNCebJXPgzAQAVxAeLJcIeGHnPLDmWyqJyIW9
	Ks4hyWdf6YBezxYcD6lV+RFkrbScAwk5Rzc7A39m2JUAB+jOIYAmTUpzMNoCysWulJFf7mTP0KH
	w5Qj1bLleFzB4fJT+3FplfQ54+1IrOBCYpxdvbIdIBWR0+D2XYUZ46W1Dv/E
X-Google-Smtp-Source: AGHT+IGVFw4oN6vVpsJvVT3zYapZ4PgCC6CBlt/bXWp1hbVF3nJvyRYFG+o8Vhg82iSdQ8egqcYOxboHJROhnTHc1mg=
X-Received: by 2002:a05:6102:9d9:b0:5df:b7f3:5875 with SMTP id
 ada2fe7eead31-5eb1a6259a2mr8916658137.3.1766908482707; Sat, 27 Dec 2025
 23:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn> <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
 <20251227-gigantic-handsome-falcon-3c31bf@quoll> <CAAT7Ki9m+MD2_EntEt=-2ZPFxbMNt6LV_kZu-aAvGZ70e_SUhw@mail.gmail.com>
 <27c89053-ea11-4165-9a85-9dcfa093c56a@kernel.org>
In-Reply-To: <27c89053-ea11-4165-9a85-9dcfa093c56a@kernel.org>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sun, 28 Dec 2025 15:54:31 +0800
X-Gm-Features: AQt7F2rJ5Jy8N41aXl0xe_8wJa_GDgLM1pD4NXthJd81_UcUbDbPnhm9CA4Evis
Message-ID: <CAAT7Ki_BxdC8cS7Qs8qVhJJXPPf8ma9MROFLA22J1WOOSgj=dg@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_235444_743152_042054AE 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBEZWMgMjgsIDIwMjUgYXQgMzo0OeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAyNy8xMi8yMDI1IDEzOjA4LCBIYW4gR2FvIHdy
b3RlOgo+ID4gT24gU2F0LCBEZWMgMjcsIDIwMjUgYXQgNzowOeKAr1BNIEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBUaHUsIERlYyAyNSwg
MjAyNSBhdCAwNTo0NTowMFBNICswODAwLCBIYW4gR2FvIChSZXZ5KSB3cm90ZToKPiA+Pj4+ICsg
ICAgICAgICAgICBkcHVfb3V0X2RwMTogZW5kcG9pbnRAMSB7Cj4gPj4+PiArICAgICAgICAgICAg
ICByZWcgPSA8MT47Cj4gPj4+PiArICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jmhk
bWlfaW4+Owo+ID4+Pj4gKyAgICAgICAgICAgIH07Cj4gPj4+PiArICAgICAgICAgIH07Cj4gPj4+
PiArICAgICAgICB9Owo+ID4+Pj4gKyAgICAgIH07Cj4gPj4+PiArICAgIH07Cj4gPj4+PiAtLQo+
ID4+Pj4gMi41Mi4wCj4gPj4+Pgo+ID4+Pgo+ID4+PiBUZXN0ZWQtYnk6IEhhbiBHYW8gPGdhb2hh
bkBpc2Nhcy5hYy5jbj4KPiA+Pgo+ID4+IE5BSywgbm90IHRydWUuIE90aGVyd2lzZSBleHBsYWlu
IG1lIGhvdyBjYW4geW91IHRlc3QgdGhlIGJpbmRpbmdzLgo+ID4+Cj4gPj4KPiA+IEkgY2hlcnJ5
LXBpY2tlZCB0aGUgcGF0Y2hlcyBJIGdhdmUgdG8gVGVzdGVkLWJ5IG9uIG15IHRlc3QgYnJhbmNo
LAo+ID4gY29tcGlsZWQgYW5kIHJhbiB0aGVtIG9uIExpY2hlZSBQaSA0YS4KPgo+IFlvdSBjYW5u
b3QgInJ1biBhIGJpbmRpbmciLgoKSSB1bmRlcnN0YW5kIG5vdy4gTXkgdW5kZXJzdGFuZGluZyBv
ZiBkdC1iaW5kaW5nIHRlc3Rpbmcgd2FzIGluY29ycmVjdC4KSSB3aWxsIG5vdCByZXBlYXQgdGhp
cyBtaXN0YWtlIGluIFRlc3RlZC1CeS4KCj4KPgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRv
ZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
