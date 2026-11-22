Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04C9606A33D
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 17:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iMZkRnIK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IU0cyVf3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hhAIIw5+gvAegXBMKj9yjNAzFBVa2bvjbqjo0WGcZfQ=; b=iMZkRnIKc2CrB4Q2E1X5kfeYY3
	QC0tSDHOQwmDy8p4UHD5ia6B83gi27wmXizXFmIZDN5YJheDfxk6fHGR9JfzH4CCsavHiZH4kMxL5
	WlN2beG7uipe5Zw2jl+i93BcD4y0RilLJjfce49VNNrgESovPJHZeqyCUqzNqLJrAMlfOZOqQrsXX
	mVOTTvvgNxfho6tqXnbFU/tPPejqeDTk5w+KGDoZZ9S5I18CjfsKT6FWzIQGLrrFsF0nRtrfOb4dv
	/+s77o3DXAgtQtV567T3QrjWqtPRPtqLiLDX8q/JCQroPXeQp4k6Ut7n/Ifm2XYk14Ih1Key43BFV
	+Ylbm2TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBGp-00000001QZI-2Zrs;
	Sun, 22 Nov 2026 17:22:31 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBGn-00000001QYA-1gXp
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 17:22:30 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3b402824d07so1695430a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 09:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368147; x=1795972947; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=IU0cyVf3T+UTdTzNbZcbQ8a1kWgqmhig62QgtpHbmU505eoTj6dkPMKXKEjqjNW/RT
         EOM/kSprluulV2Io9v4AHYgTsEM90yKl6udUtEAAr68YnKpOzR23z1pEhdEakhYHmpuj
         N6r4P8bBAAIX960gGRzhnMjI+tmTUt91u3g7vwU5BnrDWMFl4EHsZOWi4BhT6oRMDrLX
         R1JJ6VFzgxlGExyOtzGwg+niRXPFuLAw8OoaPmXu6M38SZODEukk1sK1WPwlZxQDvzOE
         8AI1g6Ha+rRJYKLy2RMkEOQdaPFF+TmRwIeAcfb1mDOgDsYmJbpD+/rdJN1d2AIiatAZ
         Rwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368147; x=1795972947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=KVMcVz57HRYYpLe2IyaZo7vYiOICh4b7FrSDoWvLNaz6sUCePho6s7WBcz+ZUfD7el
         oTrDBGNP07FLP6UBMFlWAbs0HS+0btfEVNM4tlBf5V0H/b7HjAkbSoSBwUf9EONi9BJq
         fl5AIdzsb7nUtoN9skCCx3qd1MG88Z8Un0o3rgpnBFYZCdri/k1IrXZDW/ThXdbS3pXn
         xud2vhEGupblVHfppEQvY51Bvfnr42hcpQT2W7fTbXfD/N4L/KLXG2nHgpITAKSxc4if
         iScsld3EPkRl/Ao8XR7gJQyVTC9s3wKd6ODSq4HoRmT0WwQKv5ULw5ejdI5bRK/wypc6
         OZ0Q==
X-Forwarded-Encrypted: i=1; AL+hErGOLp9QuNDcvXdsOHi31aXYCDkXmLinRfYzv9ByTkQPutLLc+EGp5dQjnlK3X97oAlcd23YR/udr6hNzA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8YERWNanezJH4FsUjpFls5rUfpW2i7Oe8iTq6Yb50sRF8Oj148
	ltb1W9Cnouh6fG7W4SnzoiFGJ4P4WRFfSERliTvKtP6fBnNWWCmmgOqX
X-Gm-Gg: AZFdTZc0od+bZ1851ZbkeE79XYSXcP/+YgnbGS4MjpTfniDWUAlho3yyxmrCdWzF+tK
	ihf8XG9+hlhmkkhMo09yXBEaYy0nkoG3rItCuu05KI6Slj5cLsYK5fQie4791Z2ODOYuBqq6Ynn
	mYf1Ui0uc8rBuIlgFjXmOVgqxxvVUTQLmnPr9uINxq24L3/XRlHjpcsflgnxfqmadr0iNiP17Sj
	xblHzwgZvOnRhGDXHu/W5hrQduHah8Tnj3nSUIBLXeMXtq8TTKIP+HCoa8iIIm4ruDqtoAKI2w6
	FFKapxGgZDlSw3oGdEEJjFUCBLLUA+gseN9ALBfQLjv05D7AaSiTxb5xmX70piZm5Lh+M7kGfpy
	2YHq4QhYE5e+Sl3SR5hy5oWXO4ZMXboCqJb4pZwVm9dDCg1BMjPAi2aZCJecgW97BPIHvwF5+QL
	ZUqMdKX6pJsCsrquTvJa5cHrxYl1KTfjKVTtn1Z6oYR2yXQVqQLqpzQMlNhTDYtkv7liClzoKtY
	3bTd8d1ojUSm4rmy7G0kH2MU6KHCqPV9gEHqgu55/mivQ20RkJ8iksJ3PX7cUJIcdFHysrdSFWo
	JH1/Y+PdTwA2PYCDii5PPhqCCzzETTHElq5IiC1l5evv0ZeeuQbGp6jr235MHnvVQkmxn1Hk7U9
	cqhE=
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr8081661a91.27.1795368147033;
        Sun, 22 Nov 2026 09:22:27 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm13471136a91.4.2026.11.22.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:22:26 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Mon, 23 Nov 2026 01:22:15 +0800
Message-ID: <20261122172221.3552455-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_092229_433584_D1B21D56 
X-CRM114-Status: GOOD (  15.35  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCAxNSBOb3YgMjAyNiAwODozMToxMSArMDEwMCBKZXJuZWogxaBrcmFiZWMgPGplcm5l
ai5za3JhYmVjQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IERuZSBwZXRlaywgMTMuIG5vdmVtYmVyIDIw
MjYgb2IgMjM6MzM6MzIgU3JlZG5qZWV2cm9wc2tpIHN0YW5kYXJkbmkgxI1hcyBqZSBIYW4gR2Fv
IHZpYSBCNCBSZWxheSBuYXBpc2FsKGEpOgo+ID4gRnJvbTogSGFuIEdhbyA8Z2FvaGFuQGlzY2Fz
LmFjLmNuPgo+ID4gCj4gPiBBZGQgdGhlIG1haW4gQ0NVIGRyaXZlciBmb3IgdGhlIFY4NjEsIGJh
c2VkIG9uIHRoZSBBNTIzIG9uZS4gVGhlIENQVQo+ID4gUExMLCB0aGUgQ1BVIHN1YnN5c3RlbSBj
bG9ja3MgYW5kIHRoZSBFOTA3IGNsb2NrcyBhcmUgbGVmdCB0byB0aGUKPiA+IGZpcm13YXJlLgo+
ID4gCj4gPiBVbmxpa2Ugb24gdGhlIEE1MjMsIHRoZSBzZWNvbmQgZGl2aWRlciBvZiB0aGUgMjcg
TUh6IG91dHB1dCBpcyBhIHBvd2VyCj4gPiBvZiB0d28uIHBsbC1hdWRpby00eCBkb2VzIG5vdCBw
YXNzIHJhdGUgY2hhbmdlcyB1cCwgYXMgaXRzIHBhcmVudCBhbHNvCj4gPiBmZWVkcyB0aGUgVUFS
VCBjbG9jayBtdXguCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nh
cy5hYy5jbj4KPiAKPiBEbyB5b3UgaGF2ZSBhbnkgdXNlciBtYW51YWwgZm9yIGl0PyBPciBhdCBs
ZWFzdCBCU1AgY29kZT8gSXQncyBoYXJkIHRvCj4gcmV2aWV3IHBhdGNoZXMgd2l0aG91dCBhbnkg
b2YgdGhvc2UgcmVmZXJlbmNlcy4KCmh0dHBzOi8vZ2l0aHViLmNvbS9SZXZ5U1IvbGludXgvY29t
bWl0L2JiMDYzODBiYzJlNWEwMjA0OWNkMDFlMGIxMGNiM2MzYzY5NGI3NTAKCkJTUCBjb2RlCgo+
IAo+IEJlc3QgcmVnYXJkcywKPiBKZXJuZWoKPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gCgpTZW50IHVzaW5nIGhrbWwgKGh0
dHBzOi8vZ2l0aHViLmNvbS9zanAzOC9oYWNrZXJtYWlsKQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
