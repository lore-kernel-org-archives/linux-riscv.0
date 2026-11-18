Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF64606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 15:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ndw5gysi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bVFtW+ZU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ue9xCVNzvzGTPVhkESSDu3wwFo1Xls0QA7LUCEJ688c=; b=ndw5gysi+8gamL/p4rXR5s/dKd
	4qW3Jc4EvtwOAhwIIfMa3xPtBBVk6+KrsJew2nl92cGP8E9PyN2DhTAS7eUhvzIBg9NEZVUzVvtRo
	hJ1EqnWnlDrMV9NPh5rBOxzkKE7NBQU8Kx1L1ptlYWzc/OY0+pXIc1+Os4ZzBz3S2JLMg99GKdQIL
	sIUkX2fJOmgIX40JU0IUIxlNtbcNvKi2V9CmiEn+p6xL3DGDwSP08/HOJtuo3Icnxi/Apw/TGLuS4
	Z4+WloeWoImVLWhRhq51tsq1fhY7fIm0Fr6tCnTujIvnjx+mIaVBTFauLhPuwVniXDtxU9mlMiP86
	bBeifjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThuO-00000009MWu-13Vl;
	Wed, 18 Nov 2026 15:49:16 +0000
Received: from mail-pi2-x04.google.com ([2607:f8b0:4864:3a::4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThuL-00000009MVq-2n2S
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 15:49:15 +0000
Received: by mail-pi2-x04.google.com with SMTP id 41be03b00d2f7-cdd8c1fdf4aso314138a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016952; x=1795621752; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=bVFtW+ZU8QczR0DnO87ajhVTMzMUdHGVq+tKbDbEveTPADG/aYRyZ9AANkv7y2PWov
         qYOHSvfLgVqxkC7uiosqKpZ6N8+CwYc4SWzp0NLjWPVNGGiLMp7/Z1V9wAiu4CJkvZg5
         LwblZe2GxLU7k/NJ7eGRZLT0zcpjPjI4QjsGUIS57N82R1OkT0JBCD0RDn8zX/m3hYYE
         6vn05JvB5yAAV25iaiV6HiD1EoMRYBrYcyZ8fK2icNumAFaetSpxnwxY5NLeqdCC8x4a
         pUpce7FqyPOyFXLnzCBX6L0QKKO7QD2ALT/t17Porpg1/HpyHrg5DXRN2703fUN046Z1
         at6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016952; x=1795621752;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=xIo1djHZTWsRL4nkRTFeufgm11DTZUI13akmgFlOU7AbKi15AP9NAzZKqBcZjkOMmI
         1cJx8mufUw7XwWS374RnDvC7EZ12IgJrZoPyAdyale3Cem5rzzdUSxYR7BwRov/PB1OH
         1RyNiPdjoE0ZgTz8XrCt31KqYVMVKMmpRsorscnd7C/5NIkhgfAkJPD87WRUUtULq+g0
         0/ZYq30vM0uKxRMSJUEkleKd4fb+g8oG7LBr+3N5HrnNUiTKhyitqv3PhXVN5kjfLWXK
         QClze4qpXgM4DbkhhN13ELH8A5jAGwZuZYunJT82uWevqFAi8Q4rAf6lP0/re+Aqafb6
         5Aqg==
X-Forwarded-Encrypted: i=1; AL+hErHwV8Nx3XNPJR08lkhAyeZEOjZW5kvsQRjLReNywmpvmOTud5qNRIwc9paCf44LkYLe1288JbaZobLwKQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z86gSJwlyhn+JMCrrg54SqCUvbyGLxvrM6V6D0yJJLhlPBPDwKY
	9bP1j12KMSZ62NVRE+HMj3rCcqiJdE9HeM5NWf7dCHlpj9B6QFVzOxlE
X-Gm-Gg: AYBFou2lGISPwbtFV562YaksQ0IE2osPj8MVK0L89IpwM8q3IQN89C2SWIqhqGKUBfF
	EU5CXiPpBiWmechxeukr+u2M047OjvLfRxY3H1d1wKveZZkbqGnLmO73Qrh32bMJqv8aXEcRsTW
	CLBvQ/NjIXB6ztqfuiic49oNpwtRH+SCiMXZiGWtWq3AzQyYeXw0XnisjodvfAG2jddmTVJ4ENu
	8CYJ+7rdP/mkvr4KDd2bBaJyE/o2NxYIznFHuUjO2NX63Wzm2H+iJC2aixgt3oskN9wHhj4bo/m
	Fyy4xBtelNdvqQkD9FVLnzp2B2JxfJCy3AxGX2fQNBfkpfOenI9qo9B6O/kvRCb023fM5lvWCpN
	eUvay3mFO8Fs/atTNvWulRNs6xWT7g9slcRtK4AufEYW+cbf5g+PmRrPS/tK4K88VK4SLqxUJ44
	o+ejwCwVhJPbz6eIzRaD/qnPT5HOyi1ZJ3RaqDOXdUPNZRZVbnHCu0BC9oVyZb1Ac7KDpSr1jqO
	4gcbWgv9CoLBrRhJWyPTb1/6it9WeSb+ooT8AtGOo/eF1eiNThqOEVI1NI8fO51m/64ntSWEVLu
	qY8=
X-Received: by 2002:a05:6a21:6e0c:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3fe8bdd7c38mr2965829637.72.1795016951931;
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1055183b3a.22.2026.11.18.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Date: Wed, 18 Nov 2026 23:49:05 +0800
Message-ID: <e4eb5f5b7ed8b3b6bf47d709e4344e0a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>, Guodong Xu <docular.xu@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
In-Reply-To: <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
 <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
 <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_074913_698148_B9F2EA96 
X-CRM114-Status: GOOD (  21.29  )
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

SGkgSWNlbm93eSwgR3VvZG9uZywKCk9uIFdlZCwgMTggTm92IDIwMjYgMTQ6MjU6MzggKzA4MDAs
IEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4g5ZyoIDIwMjYtMTEtMTfkuoznmoQgMTU6NTEgLTA1MDDv
vIxHdW9kb25nIFh15YaZ6YGT77yaCj4gPiBPbiBUaHUsIDAzIFNlcCAyMDI2IDIwOjA5OjQyICsw
ODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4gPiBUaGUgY29ubmVjdG9yIGF2YWlsYWJsZSBv
biB0aGUgUGljby1JVFggbWFpbmJvYXJkIGlzbid0IGEKPiA+ID4gRGlzcGxheVBvcnQKPiA+ID4g
cG9ydCAtLSBpdCdzIGEgVVNCIFR5cGUtQyBwb3J0IGluc3RlYWQuCj4gPgo+ID4gUmlnaHQsIGl0
IGlzIGEgVHlwZS1DIHJlY2VwdGFjbGUsIGFuZCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHNh
eQo+ID4gc28uCgpBZ3JlZWQ7IHYzIHdpbGwgc2F5IFR5cGUtQyByZWNlcHRhY2xlIGluIHRoZSBj
b21taXQgbWVzc2FnZS4KCj4gPiA+IEkgdGhpbmsgeW91IG5lZWQgdG8gbW9kZWwgdGhlIFR5cGUt
QyBwb3J0IGFuZCBhbHQgZnVuY3Rpb25zIG9mIGl0Lgo+ID4KPiA+IEkgYW0gbm90IHN1cmUgdGhh
dCBjYW4gYmUgZG9uZSBvbiB0aGlzIGJvYXJkLiBUaGUgcmVkcml2ZXIvbXV4IGluCj4gPiBmcm9u
dCBvZiB0aGUgcmVjZXB0YWNsZSBhbmQgdGhlIFBEIGNvbnRyb2xsZXIgdGhhdCBzdGVlcnMgaXQg
Ym90aAo+ID4gc2l0IG9uIHRoZSBFQydzIG93biBJMkMgYnVzLCBhbmQgdGhlaXIgaW50ZXJydXB0
IGdvZXMgdG8gdGhlIEVDIHRvby4KPiA+IFRoZSBTb0MgaGFzIG5vIGJ1cyB0byBlaXRoZXIgY2hp
cDsgYWxsIGl0IGdldHMgZnJvbSB0aGF0IHNpZGUgaXMgdGhlCj4gPiBEUDEgSFBEIGxpbmUuCj4K
PiBUaGUgQ2hyb21lT1MgRUMgZmlybXdhcmUgZXhwb3NlcyBzb21lIGNvbnRyb2wgZm9yIGEgVHlw
ZS1DIHBvcnQsIHlvdQo+IGNhbiBzZWFyY2ggZm9yIGBnb29nbGUsY3Jvcy1lYy10eXBlY2AgYW5k
IGBnb29nbGUsZXh0Y29uLXVzYmMtY3Jvcy1lY2AKPiBjb21wYXRpYmxlIHN0cmluZyBpbiBhcmNo
L2FybTY0L2Jvb3QvZHRzIGZvciBtb3JlIGRldGFpbHMuCj4KPiBBbHRob3VnaCB0aGUgSzMgUGlj
byBJVFggaGFyZHdhcmUgY29ubmVjdHMgdGhlIEVDIHRvIHRoZSBTb0Mgd2l0aCBzb21lCj4gbm90
LXNvLWVtYmVkZGVkIGludGVyZmFjZSAoZVNQSSksIHdoaWNoIG5lZWRzIHRvIGJlIGhhbmRsZWQg
Zmlyc3QuCgpUaGFua3MgZm9yIHRoZSBwb2ludGVycywgYW5kIHRoYW5rcyBib3RoIGZvciB0aGUg
cmV2aWV3LiBXaXRoIHRoYXQsIEkKdGhpbmsgaW4gdjMgSSB3aWxsIGxlYXZlIHRoZSBkcDFfb3V0
IGVuZHBvaW50IHVuY29ubmVjdGVkLCBhcyBpdCBpcyBpbgp2Mi4gTGV0IG1lIGtub3cgaWYgeW91
IGRpc2FncmVlLgoKQ29keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
