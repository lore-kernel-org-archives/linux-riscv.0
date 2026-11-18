Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C3606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 23:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gEauk2b1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T5kFSU8q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=eZe+igugiMlGHABYnjpmepkwPnrjRJGbAZlBhv875Xw=; b=gEauk2b1lQEGN8il5jR1/ZeCsD
	DuRPk7pMr3MnFKfhRydjlAKUXrAVfRMTcAGtYRCVIuOb6/xIe4GOqXmk0ys2pibSH1EgbbpJSqP72
	JJDAzmgjqvl/bvDJ9aDj+zx+tTWlhI2MChAhL7M+BmdG0gt6KxkBuvkSKQ2vO3LPnqRFcy2xDkXx8
	y15Jvk6OtjdzBUkQEkSsXJBjDTsANHNeFNp1hjVSv4NJoT4MZZfW9dMebvuNelKi7WxvAWZgSVyXZ
	LslApaB+zl6F1j1oJbB2kpmW4ggDCI2+EGSsal4BpvhPkgCdxC2n+IbpJtmXqqM0moyF653HPCs+T
	4hElv06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp0M-0000000ATW5-33UV;
	Wed, 18 Nov 2026 23:23:54 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp0H-0000000ATUd-0kKh
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 23:23:52 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-49034831bb3so1053325f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 15:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795044227; x=1795649027; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BNtN55GYuVsPPt5uRpwb+HzLieno6rlFAiQ19PmBpDM=;
        b=T5kFSU8q5eDxCSACXYjkbbo0A2nLYNDnUPHeM2a3uGRvcfWoE9Wfpl8xpl0B2KFvSZ
         ulbS3vLshCDy9xygosd9y9R2EhruJjWzyCuvQgg+hq3hdTS70Q7uMNk+qzVG0AIs49ch
         p7GYVlTEjkLLMPyiisKQd+W89VDiePnrcFBXPL3C4lESjtvaD90/G3ic5ZFrvXF6S95t
         ZSPY/wOciE0Zeeki8cAkSrnOCJ1O0wNTadZilF5PTPabd3FwWuMTV97NU6aL4etS69Kw
         0A0dm9ZTgzYdaBplhAftwg4/uCSMIQWO+qybYso6Hurt6dqDs2iOzg+Mcgmbzm66LYyF
         wY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044227; x=1795649027;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNtN55GYuVsPPt5uRpwb+HzLieno6rlFAiQ19PmBpDM=;
        b=RD1al9GLHkfH8NU0ZyEtrCwmI5Wja3ZI3PHN7AuBwv3doNkJFESqaVx0+3/USjqFo3
         Rrv+FjyLMORyk9bvnC6N/dX7LtiRa2XBI34auldVqhvb1weN5KBAopxg8veOHAHUqiUT
         5O+omIeMTnjpeub+ZTbMExJjRGyTFG4HQrbZ8x/NIeFZBGatZw1puENrMbfpZDRAwrXt
         PGCdRTwHLkywQMKfXuLPua5Fcytuv2cZA5VxHiX8X6LncZ3K6KJVryQZ4B0ipxFeic7J
         GwmrNn1vfpCSi+eYKj8MkK+DN0frFZ5/X66/2QMUrbuCstsm1D46qwDZWFYm+/eE/GUw
         Tnqw==
X-Forwarded-Encrypted: i=1; AL+hErEbnf9Pcmoz47H/dPoONF3CQZbMWjsksUPav139hbO9je4TtQ02SRW9IbiWEZ97OLUoNRYGBWS8XfH3mQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/etca8Hneoyjg+1t023KnLTOuv/UljCxRSDBTvUjTf5y2WLdGY
	mqTJeR5tO76QBcICvGIZnruAgQgAus7HIww6DLDI8kMKrljrICOxt8EBSW/fgdeIEpGuOTgGbF9
	otn4U5QFRsxg3ObJBgg==
X-Received: from wrqk2.prod.google.com ([2002:a5d:4282:0:b0:4a5:9a8b:7c4e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4029:b0:4a6:d298:832e with SMTP id ffacd0b85a97d-4a6d298857bmr7425526f8f.45.1795044226494;
 Wed, 18 Nov 2026 15:23:46 -0800 (PST)
Date: Wed, 18 Nov 2026 23:23:45 +0000
In-Reply-To: <20261118224826.2491684-3-tomo@flapping.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118224826.2491684-1-tomo@flapping.org> <20261118224826.2491684-3-tomo@flapping.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118232345.1511641-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: Alice Ryhl <aliceryhl@google.com>, fustini@kernel.org, guoren@kernel.org, 
	ojeda@kernel.org, ukleinek@kernel.org, wefu@redhat.com, a.hindborg@kernel.org, 
	acourbot@nvidia.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	chenhan0017.work@gmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org, 
	m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_152349_221636_F8B069DD 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMDc6NDg6MjZBTSArMDkwMCwgRlVKSVRBIFRvbW9ub3Jp
IHdyb3RlOgo+IEZyb206IEZVSklUQSBUb21vbm9yaSA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNv
bT4KPgo+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yIG9uIDMyLWJpdCBBUk0gd2l0aCBD
T01QSUxFX1RFU1Q6Cj4KPiAgIEVSUk9SOiBtb2Rwb3N0OiBkcml2ZXJzL3B3bS9wd21fdGgxNTIw
LmtvOiBzeW1ib2wgJ19fYWVhYmlfdWxkaXZtb2QnIHVuZGVmaW5lZCEKPgo+IFRoZSBkcml2ZXIg
ZGl2aWRlcyB1NjQgdmFsdWVzIHdoZW4gaXQgY29udmVydHMgYmV0d2VlbiBuYW5vc2Vjb25kcyBh
bmQKPiBjbG9jayBjeWNsZXMuIE9uIDMyLWJpdCBBUk0sIHRoZXNlIGRpdmlzaW9ucyBhcmUgY29t
cGlsZWQgdG8gY2FsbHMgdG8KPiBfX2FlYWJpX3VsZGl2bW9kLCB3aGljaCB0aGUga2VybmVsIGRv
ZXMgbm90IHByb3ZpZGUuCj4KPiBVc2UgZGl2NjRfdTY0KCkgYW5kIGRpdjY0X3U2NF9yb3VuZF91
cCgpIGZvciB0aGVzZSBkaXZpc2lvbnMsIGluIHRoZQo+IHNhbWUgd2F5IGFzIEMgZHJpdmVycyB1
c2UgZGl2NjRfdTY0KCkgYW5kIERJVjY0X1U2NF9ST1VORF9VUCgpLiBUaGUKPiByZXN1bHRzIGRv
IG5vdCBjaGFuZ2UuCj4KPiBGaXhlczogM2MxODAwMDNkZmZiICgicHdtOiB0aDE1MjA6IEZpeCBt
aXNzaW5nIEtjb25maWcgZGVwZW5kZW5jaWVzIikKPiBSZXBvcnRlZC1ieTogQW5kcmVhcyBIaW5k
Ym9yZyA8YS5oaW5kYm9yZ0BrZXJuZWwub3JnPgo+IENsb3NlczogaHR0cHM6Ly9ydXN0LWZvci1s
aW51eC56dWxpcGNoYXQuY29tLyNuYXJyb3cvY2hhbm5lbC8yOTE1NjUtSGVscC90b3BpYy82NGJp
dC4yMGRpdmlzaW9uLjIwaW4uMjAuNjBwd21fdGgxNTIwLjJFcnMuNjAvbmVhci82MjY4MjU1OTkK
PiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xlaW5la0BrZXJuZWwub3JnPgo+
IEFja2VkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBGVUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFp
bC5jb20+CgpSZXZpZXdlZC1ieTogQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2dsZS5jb20+CgpB
bGljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
