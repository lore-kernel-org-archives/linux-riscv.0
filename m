Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E94DC3ABDD
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIVpDxzKORY1R/GHe9xE9PdwkF6jML7xsk8hm+Q8TD8=; b=xzsTakRRXCXPwO
	JLerD7q6yRaHNCXVlTn1vMx4cad5iLNDn/fMok5h+AFltuX9pJxMMo2VrPSJiVTuhNMMFX3c83TXg
	rc/oGIZyEM8Y0KGUJMLauVSn6qOK6NJlelarM9VNw3hMa/7GvavCLv4vjZEE3lK1g5USZMTLLOinf
	kGOpszOMORo1ujTWSOKA+t+bZOXpMcVpsi+LZCMlt9xt+R737lt99SLT3nj3FMCS+Kh5eI0FfTeBY
	fChXwFb637o9vQUCw4KU4DE2LQOdM0Rh7Nti+ND7xaCO7qZpKaqg/+2KfcrEtgFwumRiQML4hdRMd
	cEZfI1ToKnVBWh0VhKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEfY-0000000FggP-1hmB;
	Wed, 14 May 2025 16:09:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDv2-0000000FZVx-1gfL
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:21:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so8168165e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 08:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747236075; x=1747840875; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KSC7AS1sDT3kiP+IimhJbkxckYibl8Clt4YmfXjLex0=;
        b=XXXns9a4kNgMOl+qCzDYNM/m+ah3Voh4RzFOVb3XItNn4LPBLXaDgrd9+l7zS5K+0Q
         twg4EoHZwXo1jeAekfls/LA592HwzkvjFPW3JhrxfPlMQK1pRpsfWxjqB/FYySoW85j0
         b6GHqF39QePOFAgnFUjpDh1C7qaFIoW78jxFMGBr1UgF45+YPtyQSVmlsBXQiQKTFISP
         u4d4srkt3gQI0ENPHRbLljMtIZedJ2FVZdCe8b8s+l4hU16FjQuwVxhJFSazT4v8HN9V
         LtHUTZjoiA2ip/tE+Nq96GcBy3e1WeHaxslAJtvah+IvXYpBDifrLrU09WhuUpu8GKZN
         tJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236075; x=1747840875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSC7AS1sDT3kiP+IimhJbkxckYibl8Clt4YmfXjLex0=;
        b=Szed+D+ynf1fKyDFMrm5IJD/G61YBT0+xFOPhkIySiKUJSipgcYtrjG9czN7mZxG3I
         hiK3ks4Mwwu6BISnvBjZ3lj4S4trsUQ2FTw8S9IEuW2IWVVDd9IeetEGypiyAfQQ8RNt
         BDro0m8KelaUEtr4G34bLCQrYbBPOxVVaHBoz9c7pPEmkNHtDdgtFBu14NytUuQeFRsV
         b/O/Qq1Xg0l8lK8+a4BwW6hQxkLhsmjP60wTYQwvIvD1JIDtT3kySzK22/1GwOl3ITR4
         MIPJs00g6h5TrQTgdpWp9Wpi7euhQVDlmvlYLt1uk2oRwRpIFvbP87wOaQSoDUOvhuXX
         IoAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyAS/pJRlAKD8OJa9CQjXH88vHxvMTlbRbLMnsXr47q+odpgc7VP9ZEgse5fbEVH2ROQj8U7i3DtgmdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHar5CUTy4jycEpo12SBcQmq5wAiCY1UX9lVLksRzromTCuGM5
	eQ2rsMyw057SjWJV1Yj21apudzW4tf8XPrlKCIf8tK9wYvEgIgvOuXEGoq0V7CY=
X-Gm-Gg: ASbGncvgKssa6dgd0MtU8OV43wgV/+Nqs5xp7aS8eKvrr/pWd1zJkMY1p3IT9TzeB34
	VrX7HYJdlhE7Jz5Zn1R7grE7ceLryifhw7uO37Id1xH8LdwBijk/Nw7gbJaGUHBQw4SLhYimU8+
	DgFoXFQaMm86K7XGdOeWQ+WD4EPeiZcre/T9JhkCRht7K5cyjIkTIwUNBYFkZ5VKgeRiTj7iP8M
	klY2P+bikUFHsxoeaMwJsZrPzDe+LQ7tGytd4pdM7Xfr2UQsuUlAy1u94zo4TFX+VZZ3Wwlnend
	ZyJypR/WJr14+9a1izQJHwmfXBEzYRfhqZPF0LHfMbZPX0s2ixS9L9hgox0au219+G4b5KFf7Jj
	m3Pavdshe3SNQOQ==
X-Google-Smtp-Source: AGHT+IGe1ne4Td1Ml7Z+Wncf1fBtA4hEtl4bvauo0/AxKZED1m8DaHt11KVpSSf0ZkBUNpGoY5FUfQ==
X-Received: by 2002:a05:600c:c0c3:10b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-442eac9f98cmr49562565e9.6.1747236074746;
        Wed, 14 May 2025 08:21:14 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef81csm33273325e9.34.2025.05.14.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:21:12 -0700 (PDT)
Date: Wed, 14 May 2025 17:21:10 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 5/9] dt-bindings: timer: add Andes machine timer
Message-ID: <aCS05j9ZYqga6dIO@mai.linaro.org>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-6-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514095350.3765716-6-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_082116_442305_AE700F29 
X-CRM114-Status: GOOD (  11.28  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMDU6NTM6NDZQTSArMDgwMCwgQmVuIFpvbmctWW91IFhp
ZSB3cm90ZToKPiBBZGQgdGhlIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgQW5kZXMgbWFj
aGluZSB0aW1lci4KPiAKPiBUaGUgUklTQy1WIGFyY2hpdGVjdHVyZSBkZWZpbmVzIGEgbWFjaGlu
ZSB0aW1lciB0aGF0IHByb3ZpZGVzIGEgcmVhbC10aW1lCj4gY291bnRlciBhbmQgZ2VuZXJhdGVz
IHRpbWVyIGludGVycnVwdHMuIEFuZGVzIG1hY2hpbmVyIHRpbWVyIChQTE1UMCkgaXMKPiB0aGUg
aW1wbGVtZW50YXRpb24gb2YgdGhlIG1hY2hpbmUgdGltZXIsIGFuZCBpdCBjb250YWlucyBtZW1v
cnktbWFwcGVkCj4gcmVnaXN0ZXJzIChtdGltZSBhbmQgbXRpbWVjbXApLiBUaGlzIGRldmljZSBz
dXBwb3J0cyB1cCB0byAzMiBjb3Jlcy4KPiAKPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4gWm9uZy1Zb3UgWGll
IDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KPiAtLS0KClRoZSBwYXRjaCBkb2VzIG5vdCBhcHBseSBv
biBteSB0cmVlIGR1ZSB0byBjb25mbGljdCB3aXRoIG90aGVyIHBhdGNoZXMKb2YgdGhlIHNlcmll
cyBvbiB0aGUgTUFJTlRBSU5FUiBmaWxlLgoKLS0gCgogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+
IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93
IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29r
IHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3
dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
