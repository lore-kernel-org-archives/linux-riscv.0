Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF62606D805
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dyNNBLas;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXrk+WSg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cCOE9F/sv+P7dW+dUX1g0K4v3iGukRggWGluJb3foSc=; b=dyNNBLasOS3/Jrujb2Po6vIiPl
	8Jt/IEcqQFmvTqX8kgVkKzejWA9dFQUfi7LtDe3L4AjYUDs48jW1Qm0GZAzXk/hh3lIZrNmxRBI0K
	Kxy57jTUXIzREhDLqnCYi2h6BULnjZcs73o3env5Avihem5+zFnYzxTqhvV2skEMF+CRwzt7MXVtE
	EbE5npyU0gnZAlYNHhONgUErPiVaN9b/niRVx1SGP/2AkhYP40PYAQXDb2cH8uAtHITb1xh4GDirm
	ZqphWkZM3FMYo3mSL/KBTRwCfIvLICSRbpCDJppxegNNTG/UyEwCS8PXOdep5At/TGi4UpzPjEXuT
	VlQddvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGeD-0000000BoyO-4Awi;
	Fri, 06 Nov 2026 09:54:13 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGeC-0000000BoxU-0cQl
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:54:13 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5bccecba199so427574e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 01:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793958850; cv=none;
        d=google.com; s=arc-20260327;
        b=Za6ftf05pb7TjtxSG+r1h9pmfFd6yrTLE1iIEbxv1AmkI85GaAu1mzyqKpanddB0eA
         ncHfNXgKeO4v3ksGgZH9pBILCecoMQ/baFQGD3ttLT4WehRiORiLznvvH5lGI3rz9Uzr
         5apIAMpAVJ3lE5VIwN/5oF9RAtLvgaF6e3ca4Dl/PT5VLWJOeeYYA7da8q10VyrR0jKk
         m3IbfQzC5Ni/zM1Aq7fOJAbeVhe0ZV3fKxMemQNX236BZ/cx9Dxec7ZzoZ+80SzEd/Tw
         qIyvNNP+dfo/nqixIKcBUdtnQOsUweu7D++2SzlAzP8hRddkdfrijCHuMZlMVjleO2h8
         12dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
        fh=qZFAh6x4iZL+nkLjEdTZzrmiUSR68XkBP9u1CX0oXnk=;
        b=nyBLmz6PArIbuuj5L0u9toU7JBQvoEZ3PA89eEyZ4VH1MF3LvXE3IluRE+yMnJwm7Y
         jL4xGbSMcD29Cu/m/s4D0qFpqgQNYvPi4tYUM+yZczX9wVN1oqkeEX47/02NhnSMlgOc
         L3ePF6O4EKTPi7o3MMy4PPxwEITJ7p5i60gqvBmcGb/zHIRcomQQcRCgVCn7luMh86Yy
         1ScTJ/71kOPyAVxOoIKq6bDUlgJSj+4a2obLGK0WgPWti2VEh/KAJTa0h8sBatjVCqnu
         RgI4V7L0KE5442hcBNFGvsI8VuP1g4QGXtDOlKtbC5dJWEgCMpQfPFJimU+rXspNlL1D
         VTFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958850; x=1794563650; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
        b=EXrk+WSgKNWOKEkW+MQRyiF24HK5JkwZ6yW7lIGLNetsk1rZK0/Kj4EUly4cETZ7Zl
         H8UKvCnO/RxhKPWTgW8WJnWzrjJHQUr+diNd7ncYh6UPJAiOmOmqvUDF1arNr2w94M0G
         dc5mnvb8Nv5M30LQ4/carJWt7yNr3KuQ7mCyQwc0uFAYycYQOwmHn/nw7F1HqxO7weAr
         sVqkLhSBRZGJFxVQxG/rlf9vln4MJiGTs6HIXa8d5bBn6GgQyrh34YQZ537PhUtKdF+f
         tUrPecTgmBSpOfTE2hkvKmTL59kCj0ai/3cwI/Vx4WE1c41BCT5Ms58uJK9WeJT5hQ1Z
         9TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958850; x=1794563650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qUBJvia8A4m8j44qWWCxqxQxXk2NNL+JHI+sUxPvXc=;
        b=CnZv9Y+cru7A6sy/rhn5UQfigRM9A6Tx5T8J7lLAazQ2FfamUf6yOUEnNsDGrk1rhD
         5VNBjhImHQ0qMUNcJK5Uvpu/3c+exWe1M0WHmza6Z494WF8vYS5R6ny/zQKm1Gut6fuD
         23D4bjAiuAHtCea5RXXXWo8dufyw4FvdwbAPDm7sWG2joEpv9c/GrElNznOUUbvTquaN
         s9KK6oD4rqQ5p5ojW3WL96oDZUNJeTQNtW5dU7qO5OVLY1fIn+ilv1A7FZJYZdu+/EcG
         aosF5Ce3uNwe1xZJL3ru4TcfxKKywQO560Ys4X1to4VqNB/1tPRNnQeXZPVLyvXktOb6
         nF4A==
X-Forwarded-Encrypted: i=1; AKwUvBwKl8fPHP5r9Xb5/4N0UWLDGHT0q/8FjLX5l+ir1nYg0FUNCY1E2b6WvRGTbjhm3S28KMr54RiMKqCi4w==@lists.infradead.org
X-Gm-Message-State: APuU4Z9KDsLjCVMhNXcBHrUJPd/AMeeBE4pLLUfMr69GjOHJnBbuMDOD
	QIGWp6KONk+3Xrtbs9vTE/WCZPn+Fn2IVT06vLgnN+4L8Zmd+L/4r6XTJgo7oBu3ByR6HJq3uEN
	8hX2pQqQu38UAmKfsDHLdh+RzOPIivIc=
X-Gm-Gg: AYBFou2/g4Ch/zvDQmpT8TcAuqMvzbybvi0/ZHUNCOB7G/5Fr5hCTFJjasLRaxsA5eU
	lj09wWiIjiv1JqxrL4OyNo7Pogwp5mqgt2UvRINE0KFLTW9RMohFpmU/77hXZ0bmHyF2M6a+z7F
	m0gviIX1AjFf2YP09yd8KZORBK2qZP0/jE5zkU2Xf7/9GLePUiJOPbKQLGphMhRwGObn2uKaGU6
	+61bmfBDzIuB2nkaPSiE+Hiaq3WQvetjxNu52pZP+vRGknRUVp1Oe+GPeEb8H2svMlUfQ8C8e+b
	G503BSJEIq0ddXkY0ABaIoGd6PsAQo3Pier5jhcDAgn1pe5grjfw/v5Kc232I9BU1xV46aDoO9p
	PArZ15yfy5sFGHHE3V3bCXwqVQlgyl3ql5Ibd8vfB9d//HmBJhaWxPAo313kpAAL3rcss
X-Received: by 2002:a05:6512:3f23:b0:5bf:c239:71ad with SMTP id
 2adb3069b0e04-5c003ad0afemr607795e87.38.1793958849775; Fri, 06 Nov 2026
 01:54:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261017030927.345454-1-suunj1331@gmail.com> <20261023115747.2545223-1-jinyu.tang@linux.dev>
In-Reply-To: <20261023115747.2545223-1-jinyu.tang@linux.dev>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Fri, 6 Nov 2026 18:53:57 +0900
X-Gm-Features: AclHuK9nk148RfY2GyVdkkH5dnZpSne9-B4ydq0oLeo4XvcO3mtFibrpLrfrSO0
Message-ID: <CAGwK=3r0LRuhYNWZ1Rq573qWFv9HNwHE_MxqXJa6Bfuc1QtWTg@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on
 host-writable leaves
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: anup@brainfault.org, atish.patra@linux.dev, tjytimi@163.com, 
	inochiama@gmail.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, andrew.jones@linux.dev, 
	pbonzini@redhat.com, seanjc@google.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, sashiko-bot@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_015412_214890_3C249A97 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgODo1N+KAr1BNIEppbnl1IFRhbmcgPGppbnl1LnRhbmdA
bGludXguZGV2PiB3cm90ZToKPiBUZXN0ZWQgb24gUUVNVSAxMC4yLjEgd2l0aCBhIHByaXZhdGUg
bWVtZmQgbWFwcGluZyBhbmQgZGlydHkgbG9nZ2luZy4KPiBBIGd1ZXN0IHJlYWQgZm9sbG93ZWQg
YnkgYSB3cml0ZSBjb3JydXB0cyB0aGUgc2hhcmVkIGJhY2tpbmcgd2l0aG91dAo+IHRoaXMgZml4
OyBhbmQgd2l0aCBpdCwgQ29XIG9jY3VycyBhbmQgdGhlIGJhY2tpbmcgc3RheXMgdW5jaGFuZ2Vk
Lgo+Cj4gUmV2aWV3ZWQtYnk6IEppbnl1IFRhbmcgPGppbnl1LnRhbmdAbGludXguZGV2Pgo+Cj4g
VGhhbmtzLAo+IEppbnl1CgpUaGFua3MgZm9yIHRlc3RpbmcgdGhpcyB3aXRoIGEgcHJpdmF0ZSBt
ZW1mZCBtYXBwaW5nIGFuZCBmb3IgdGhlCnJldmlldy4KCkknbGwgaW5jbHVkZSB0aGUgYWRkaXRp
b25hbCBmaXggcG9pbnRlZCBvdXQgYnkgU2FzaGlrbyBhbmQgSW5vY2hpCmluIHYyIGFuZCBjYXJy
eSB5b3VyIFJldmlld2VkLWJ5LCB1bmxlc3MgeW91J2QgcmF0aGVyIHRha2UgYW5vdGhlcgpsb29r
LgoKVGhhbmtzLApTZXVuZ0p1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
