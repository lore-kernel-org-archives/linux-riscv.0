Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C0A606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wjxdhS9T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nm863mym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=miywNJWadTufnMAbM3ksGk1TUoTMmHwsoBZE87AiqLE=; b=wjxdhS9TuuvaOigQ28ZHW+53M3
	wIzgeROyXQ/7B9fXwQo6aufmwzL0PGt86c8LXQYiBXxrG2AjvJAS3JA+WUV4qYejcSOOIftrdba4x
	8qssxvWRoCAN5kTFGZzuGw5DjaTGZsgmkkwidRhYju8ME8WgSPeWC7oujTb3ormvYA6YUlQ6gw5eY
	4vQGwxwOxr10z2QEhotVnl5aZpm3IdnoVQdwKxg1uVPgb09IRa55+EYtB9CkGkymjcTyF0CteSrfs
	vDTv/J+aneq1atqVhgcuCxVrKSZNpQrHdn6TGLDP9/VJAQRWrJGv7jOZA3a1M2J3XTBhGU2vGjMYQ
	aSyfMrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9qP-0000000DUeJ-1HGx;
	Thu, 19 Nov 2026 21:39:01 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9qM-0000000DUdG-3Iky
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 21:39:00 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b3402105b9so2194807b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 13:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795124337; x=1795729137; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=Nm863myme5pVdhXEBQVpHjGfbeuHwOiul9HMLJQqPgV4WCrY2REXIaROi2Fv8g313K
         eY5kRyv3zeTD773Ge7T8Jry4PJDpyFM30dD+orrA3bSDmIqtC9edu6iWiw0+tD+daJTa
         MmBj4aD7f3Sy8ftAhIX1LkUyn481jUA7hwGSCDwIVM8w7ru39PoxALtxCnk8mJ9e9R+2
         6dzwmOPoSQmtwsg9c5n8ylBtoqSk7eVC+vRHztCyOvX6COvD7hjBbHy1YQJGNpKFvJ/B
         mBHeI+nOkzksXQvK0mVev4LGjs1l7m1EfQnnm0IsWwv/VDR7TSZo0NwY+prM2TPJEL1k
         kGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124337; x=1795729137;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=VgO5xj101WRViYviQhrb+fSVlelx2BzB2cfxYZWshmzVC4VwvKce0xiNJZGsEvlkB1
         l8uE7zz/powCpgPJPsbrLfSLtYjaw0AUBCfhsqMN0Tg7ZOgo9/GxVOItI0PfmRE64Yw6
         ga4/2bN8batrnsk3SHWRcrewQKd7uR3URgCh696yBRaZf09q/kfh7GK91mHdkzmUyc2f
         8/k1laEF2AVP+B6XoN3FfpSeLQGAMwFaAjgzc/wqGCDaqwLwiaNdToiMD0bovZnasLfi
         3XoMjrl0nFA2rFBkWagfywLL4T+zpp3ruxl7GFCcp4QAkgrdobG+2Hzf/afPYV0lc9Jf
         MzDQ==
X-Forwarded-Encrypted: i=1; AL+hErFO8Bs2schCW4XXZvOzLP8pDi3yiddDD1gxI//nauJzwIWIDrsVbsb79wAZKKBW0kJ1eLy4pzlcJibjHQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Jlb7HKPmbfkJ8PoKwN5Sh/lcF6ozAGWU9ClSaV4gaxEwp50LC
	vhyjWA5VFhCd/ruWrY2631s2Dnx799jrOdMX7iXGcKNlv3BOVr8J8cuv
X-Gm-Gg: AZFdTZcaIHvYQALg9NCLuWR1dTslR+sbtJS3o0ZO7WGekNSMBcmxYjKkvsiP1NBVWAf
	Vprz98SHfMC8euDwpWSwLFM/d2ojOWLG7MwCbFG7RmbjRNTMlMr250w7UHLQ+8n8qU+yWsuNlaw
	njGQL/QjXeQmghA8wmhGnfdcWCSQffNqQf1bI55yf0awGh4U2r2QhoauYizrbLDBMDBVwdUUoFX
	Yu8kZ6Y/vqWGGYkgJRikRCF9CgmkqAziwh8btqScvbraD4Gq4UJ3CAHk6y+ZMhbtM3MZYGXl80I
	X+oJKrKnqDPaP3ZQ8iEHtC+YkbFMvEWIgR2viDC/csm71GwYMhA6slVd1eYg8KpECQVZ/MKqn5H
	5ZDRkgiJXMNow/LrTDiF4iQTTyKDUrjfoSZwo1pAwfN9TLsJa0PbSMgQL0y+2Zk24yE+nJOu5Do
	S0uR/qlr6Py1c65E4tLDF7mULH/6Im4dTwOQ94apDCiSWwq7qz7Sy51vM3kapHE7K06i1vSMmSu
	6zaB7NGJkep7AKXTFOHWfbeQi9d3femCDDsP9fyz0sK/s8LEgZ55rR4XucU5RKax9jwx7tIH3CX
	kFl8XUPQOXmCQD4BzoZ8fyc9
X-Received: by 2002:a05:690c:c9e:b0:8b0:95a7:37e2 with SMTP id 00721157ae682-8b5204ebe00mr4585427b3.80.1795124336861;
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b7502sm663093d50.20.2026.11.19.13.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Date: Thu, 19 Nov 2026 16:38:52 -0500
Message-ID: <7072ab495239e6bd28e2e9ed75244e24.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
In-Reply-To: <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
 <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
 <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_133859_208036_5DC44C5B 
X-CRM114-Status: GOOD (  12.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSWNlbm93eSwKCk9uIFdlZCwgMTggTm92IDIwMjYgMTg6MTg6MTEgKzA4MDAsIEljZW5vd3kg
Wmhlbmcgd3JvdGU6Cj4g5ZyoIDIwMjYtMTEtMTfkuoznmoQgMTY6NDggLTA1MDDvvIxHdW9kb25n
IFh15YaZ6YGT77yaCj4gPiBGb3IgZXhhbXBsZSwgdGhlIGJsb2NrcyBzaXQgYXQgZGlmZmVyZW50
IGFkZHJlc3NlcywgYW5kIG1vc3QgZmllbGRzCj4gPiBhcmUgYXQgYSBkaWZmZXJlbnQgd29yZCBv
ciBiaXQuIEluIGRwdV9pbnQuaCwgQ0ZHX1JEWV9DTFIgaXMgYml0IDQgb24KPiA+IHRoZSBLMSBh
bmQgYml0IDUgb24gdGhlIEszLCBhbmQgdGhlIHVuZGVycnVuIGJpdCBpcyA5IGFuZCA4Lgo+Cj4g
WWVzLCB0aGlzIElQIHdlaXJkbHkgZG9lc24ndCBjb25zaWRlciByZWdpc3RlciBtYXAgY29tcGF0
aWJsaXR5IGF0IGFsbC4KCkV4YWN0bHkuCgo+ID4gSU1ITyBhIEsxIHBvcnQgc2hvdWxkIGFkZCBp
dHMgb3duIGNvbXBhdGlibGUsIGl0cyBvd24gZmllbGQgaGVhZGVyCj4KPiBXZWxsIEkgZG9uJ3Qg
dGhpbmsgZmllbGQgaGVhZGVycyB3b3VsZCB3b3JrIGZvciBhIG1haW5saW5lZCBkcml2ZXI7Cj4g
bWF5YmUgdGhpbmdzIGxpa2UgcmVnbWFwX2ZpZWxkIGNvdWxkIGJlIHVzZWQgdG8gbWl0aWdhdGUg
dGhlCj4gZGlmZmVyZW5jZS4KCkZhaXIgcG9pbnQsIGJ1dCBtYXliZSB0aGF0IGNhbiBiZSBkb25l
IHdoZW4gdGhlIEsxIGlzIGFkZGVkLiBGb3Igbm93LAppbiB0aGlzIHNlcmllcywgbGV0J3MgbWFr
ZSBzdXJlIHRoZSBmaWVsZCBoZWFkZXIgYW5kIGl0cyB1c2VycyBhcmUKc2VsZi1jb250YWluZWQs
IHNvIHRoYXQgSzEgc3VwcG9ydCBpcyBlYXNpZXIgdG8gYWRkIGxhdGVyLgoKR3VvZG9uZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
