Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4AF606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cVHIHqm7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vDWmnVf5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y3Vl2IDh9/0skJUYOB0a3z1N741ht+4pEWK+zAhkrCc=; b=cVHIHqm7knO9CdKNItXw6+r97R
	M9Jv3zRpQsju0TN4RtDqi7kTExi8aTP1RgolPptuWbULX6O7iAXLMojw9aBhwKWKn2KY6fLAVGQAB
	pzQw7kp5hZ4ffnG7+pnA2NjRG85cto7QHKXKo4YQNPg8oHVUVXDh+qzWN2cJer9tWkdhnN+bjUHvj
	FZ0S6kRU5FiEU8/M1USpkWEPi/pryAw4y9Y9art876EioTVMuE9lD4mZ07hVYGOmFifF9pFg3FTSz
	vcbd30mN7tFF6r5JB7riZi4gTmYVwEBoH6aQoY4RubKHK5HT+qtw/wiVas9oPONTsb3+qhYRZ0Nvp
	MteYV2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThvb-00000009Mk0-2icl;
	Wed, 18 Nov 2026 15:50:31 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThvY-00000009MjB-3B1N
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 15:50:30 +0000
Received: by mail-pj2-x0a.google.com with SMTP id d9443c01a7336-2ed14ad20b8so3239175ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017028; x=1795621828; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=vDWmnVf5kiHkwTxS3pqDTbgE+fxPTIyL6ytej94GM6RbkJknUeHVFHeHZndsc4tUxg
         bo+sSDJS5HRlWASh6n3/jAVYWHBFUFTaDApoXHgbos30z1RZ8MjjYHo4gmO9klQbZDXm
         1IyWTSK7E11SqjV9mMCj1nhRzVI3PEYZbFAqfmYNJYXsk40Bwx766xNE70M0LdgM4pjt
         Z14TkppCm66Txfe0Dbpj9SfaIVHkqKX6e1XeqH5vm362G8rS1pWBHEBOpudGp5X/9uNH
         QqeJScTEDoeQGli3ZwqLJu90lTmYQUYgb9fI+bhxivuRR4t70ZlAPhes3T0ge+unKBqq
         zBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017028; x=1795621828;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=YaDgVE/a56ITyWSi2pKQS3FaK8LFt2y6fyVThRfC5oDJxc6PniXFKbxRN8Q3WEbTuP
         LGMjQWpcamaRGfJgUryLWsLa400+Az1HVkUHx5viPbAVJ7TIR9nB5sStSARMuDpDTuaU
         w6CVEReHwPI/RVWssn5mRUCGOBSWq+mR8PLS9cT+wq16SPwapMwHnZHecMxf1ax1WDzb
         dUgDETK2F640EDPYM5GQWAC95XwEGjhp0+YI4HobPh+Hr/maBih0mU3wj6QbEA0QN5Oo
         AbAzhy1z4goH6kmSqtLofnoyGYSBDJVrKJ+tMt1Aahn73PCKDFve0o2B1sVx4iKF0y//
         iQPA==
X-Forwarded-Encrypted: i=1; AL+hErGO3t39m77Q2HEKxQ/Qy42lZgB2STFr/7PDnQVuyNFD0J92IfEMTpKWcqwsRIUeHuFC+OKJ+Q9yX2Uj1A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZF/TBtvrh09H+4cW0pNOeuQ67ZiK+Nti/+z5kM/VLnitdGwTE
	qMx/BIzm6ee4e+eju9rSC/2bFzJbiG4mPAxkL3rXvSP/MZmnEXAggsvK
X-Gm-Gg: AZFdTZexlUcZgZHDKQFcJY86fgT/OaAJrS4JPlRxJzkR22YnocMH9yr6senQP75nKr/
	wXGPPIX9q6S0dmCMAuZE3aZdAAnb5zb+a1FUZKpkDWdUhRtrAJXmO+FednZCacczboQXTBWTH7L
	dDRxEYJy4fKHxkQCgzDgwLBTryNtR1j3k15K/sRnXho4EjUD0s5FRCarVgUpsF7pRfQTFx9MNLJ
	mLDqwNH1gGpMFVHWqr7jhB/mB+bS9PU3uRq+AFCX+auMSG8Lsa7Q0ktg6StZSDUmveibnypfbuW
	VJ2hjeUnBiXvRXZNEpydBZzVhDhHGCO73vk8e5V7OTHbv2/tlj1lEbx/cN2hP2NwkbvOjQ0zigh
	aM6ahZACzxQJPuJNObG2MkSSkm4uHllBalpSRV7iI3NE5xOEchMbC5arXupzNyM71BPhZQ8pOwm
	Dfb4raYMZIELF2tIhN1otdZcKOajYVquaJD1G7c6ZFgpZRXNjbXnpiTSKQFpm4P/RMGN5WuphyJ
	KFrS8Ity1t2HA/b4CsxXoCDE/Jme9UnLERwhxMpnAvoND93pWw+5h/1rRI1vRzOIvvShfu7LASf
	9dg=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b3d07c9ca5mr3201351a91.43.1795017027692;
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534ae0edsm193214a12.21.2026.11.18.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Date: Wed, 18 Nov 2026 23:50:21 +0800
Message-ID: <aee275aa2ebf093d8518e53c5d264064.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
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
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_075028_820771_DE05A941 
X-CRM114-Status: GOOD (  12.01  )
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

SGkgSWNlbm93eSwKCk9uIFRodSwgMDMgU2VwIDIwMjYgMjA6MDc6MzIgKzA4MDAsIEljZW5vd3kg
Wmhlbmcgd3JvdGU6Cj4g5ZyoIDIwMjYtMDgtMDnml6XnmoQgMjE6MTQgKzA4MDDvvIxDb2R5IEth
bmcgdmlhIEI0IFJlbGF55YaZ6YGT77yaCj4gPiBGcm9tOiBDb2R5IEthbmcgPGNvZHlrYW5nLmhr
QGdtYWlsLmNvbT4KWy4uLl0KPiA+ICsJZHJtLT5tb2RlX2NvbmZpZy5taW5fd2lkdGggPSAxOwo+
ID4gKwlkcm0tPm1vZGVfY29uZmlnLm1pbl9oZWlnaHQgPSAxOwo+ID4gKwkvKiBLMyB1c2VyIG1h
bnVhbDogZWFjaCBEUFUgc2NhbnMgb3V0IGF0IG1vc3QgMzg0MHgyMTYwQDYwCj4gPiAqLwo+ID4g
Kwlkcm0tPm1vZGVfY29uZmlnLm1heF93aWR0aCA9IDM4NDA7Cj4gPiArCWRybS0+bW9kZV9jb25m
aWcubWF4X2hlaWdodCA9IDIxNjA7Cj4KPiBUaGlzIGlzIGZvciB0aGUgYmlnZ2VzdCBwb3NzaWJs
ZSBmcmFtZWJ1ZmZlciBpbnN0ZWFkIG9mIHRoZSBwb3NzaWJsZQo+IHNjYW5vdXQgcGl4ZWwgY291
bnQuCj4KPiBUaGUgd2lkdGggaGVyZSBzaG91bGQgYmUgYmFzZWQgb24gdGhlIG1heGltdW0gYWxs
b3dlZCBwaXRjaCBvZiB0aGUKPiBkaXNwbGF5IGNvbnRyb2xsZXIgaW5zdGVhZCBvZiB0aGUgc2lu
Z2xlLUdQVSBtYXhpbXVtIHNpemUsIG90aGVyd2lzZSBpdAo+IHdvbid0IGJlIGFibGUgdG8gZHJp
dmUgdHdvIDM4NDB4MjE2MCBzY3JlZW5zIGluIGEgc2lkZS1ieS1zaWRlCj4gY29uZmlndXJhdGlv
biBiZWNhdXNlIHRoaXMgd2lsbCBjcmVhdGUgYSA3NjgweDIxNjAgZnJhbWVidWZmZXIuCgpUaGFu
a3MgZm9yIHRoZSByZXZpZXcuIEFncmVlZDsgd2lsbCBmaXggaW4gdjMuCgp2MyB3aWxsIHRha2Ug
bWF4X3dpZHRoL21heF9oZWlnaHQgZnJvbSB3aGF0IHRoZSBSRE1BIHJlZ2lzdGVycyBjYW4KYWRk
cmVzcyAoYSAxNi1iaXQgYnl0ZSBzdHJpZGUgYW5kIDE2LWJpdCBpbWFnZSBkaW1lbnNpb25zKSwg
YW5kIG1vdmUKdGhlIDM4NDB4MjE2MCBsaW1pdCBpbnRvIHRoZSBDUlRDJ3MgbW9kZV92YWxpZC4K
CkNvZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
