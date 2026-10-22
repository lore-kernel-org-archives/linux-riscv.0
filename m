Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A815606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dkDUZpso;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=dkXzrWF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+iiDxM6quUYREELpCgnf79z9X9WJyx/gua06MVGffM=; b=dkDUZpsoUH3hLx
	hMH1q0Bk3drPTMnLXShsy2iTWEqSQnbi3DOusg6vWUV9aNKYMf4Az+ZpIgGfVUUSpQ2RzFCqQxGyj
	y8IVPcm+JXg5ivspaAczp0ODE11nnjoH/j7Z582jLqFwmaiv9hiyop7jhcq9BmWWMU+9g2hTmFL2c
	cSfDwHoYWi//saUvzNGUwKiQAIwTpfYZi0u6+SMRzdBfoBIu0+0Ez2OsaJx4Gi78/z/kUI1rCyZMJ
	lLwR05t2D/Bh2w1kR0KaOS7BbhZ/EQDbGG8mw3ptO53Y+CQcK6yrrq7Q2Uvia9SnJ/urDdkAdSxJy
	QhBYWVTUTbUOtG9jDDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlfx-0000000DQ1C-48Pq;
	Thu, 22 Oct 2026 05:49:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlfs-0000000DQ0B-2DUQ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 05:49:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso877899f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 22:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792648150; cv=none;
        d=google.com; s=arc-20260327;
        b=Bk2P8XyU26zz7IFxrfeUCGnt3IM1bfaA7nsPcAy7ZsYemY60z4saQVe3gE6L//Apxj
         TMXlwkGAYnigc9zBhVrW0v72aB/WGsPC4jwu4XP0BB5psp6FK23RDyr2LPERAIogrwna
         WtdG8YStGrZwR4yitJjfOhKrUdrcKzsfIpqj34QkqBsvrn5jxMr1ta82CfVxJ0TFTiTw
         TurxNBf9WySf+CAi2VnHzsSA6dG1hHBkt2JIfG6whDyV+XMgDonqEHwbNVATmuBeSLaY
         9B7esVR8AWNCdzf6PjP8eTd24sa5sRMDJg4zHpARUVaI9uzBFapsuM6toQigkEYQqRpL
         /3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OLwqPe6nKylyfAeT1HYsvD0areP6du4KRg580T8M6Fc=;
        fh=PREuMNLDI5qUgLht/pSflVeNgpHJT/QDMkSD877d/Yo=;
        b=Gx8R0wjjUxOahUPjdZrDhFdqN8IWX5xLfAEzNV/A/xm6idh3oTHhjeUh51Vs09TO4c
         8NUnz8Ha1nBpEv5dRVwueTBhE9cy4YrIAeBbdsBiBuOjd8OQh21IsSwr6L2CvNqNkFJl
         /glRhgnxV6pWN5ODOXy5DoZ578KG0k0oo2nEtgyjBlljBM+tl6PnFggpsjbaNgYiXIAg
         uVIWZcrROlM6xmafw7YcEVpfobAXoZqpkJ3eezgCd1tjvrehVcTaL2ocbcSQpafLLZNg
         0iXglmpWeTkGbEugpGmHtsFkLT2L0UShHdH8BFhDrsuQh6VBzSfzrsPy4D0ksM4dg8HI
         fi3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792648150; x=1793252950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OLwqPe6nKylyfAeT1HYsvD0areP6du4KRg580T8M6Fc=;
        b=dkXzrWF1JRdlRmmt4905cJ9Ytf0kPNpr8wsvy9vqf5Gue0xN2R+LU31jCv35/nleZd
         wRKtwOoU5C7bdMzf6NOBcLpesAeO5OGs8xKiA4Fh1bL9H53OPVjUm8GCBNOELGfE0WUr
         psJxoNjpKTPE0QHWuIi+u0cs8Z+ixowTjfbmKC05t2Y+/bPhDAKg3u7PwKZosnKx1LZp
         74kNoT3kFI/4mTqYEG6AT88in6azrPwLPMIhhziDp0LYNBAbn34VJg+UuyJ1i96CiRTN
         qnfYtC9dUmRK2AsXMxyyjZy4JHzz8ACt5GZ+ES71cAyKd2DWl0wwg/pUqPdmxpAP4o8I
         NrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648150; x=1793252950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLwqPe6nKylyfAeT1HYsvD0areP6du4KRg580T8M6Fc=;
        b=vBoppt+cxONmdsYMaUILtp4/E6/eULDUusTX2nA2qR85K3AhHi5BL6QBVg5VBKQzeQ
         3N0J8HYp0AsxnH9RdExq4hJaY8T7uRu8t4Uz4qBJhzr1WgnsfJE+3K0aaYZYE0xyecTj
         7EmoN7IiFFAqIACTkuNcLDYubKksU4per4JWlMyULBYiJuMhzmJdLC6Sad+9ZEVSDd1b
         dFXzSPeWHVRgGz6+cZ+gTTfN8bXNNMEvhmpiQgvrwrBvo4K2DXqcyATLennGEVRyQVue
         pLQzfwt8PxLHTYkd+6xZgcYDj/OnOaBstMcqijnpo3gIgnHHNm9rEe/nhlwqE/G5fgLR
         zgvA==
X-Forwarded-Encrypted: i=1; AKwUvBxvohztcfwY8vdwwiitrtMj/53kygz0lBR1faXWRqAWeJOuO/rUcHj9Lradp8DTkEI1ygrP1N9N/hPO9w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIuhmrTVbNF+4sBK47/1lHWdu4+KBbPcP/kEL3s+JJJSXex97gg
	arqURTqeqreMKUiGK9gaPJkknhfUyMlvaNEHoM7khC255BnovO1gU/JNiobLaQN379yZs/tUOkB
	mCV/LKC0+UKPJbdlGIQ6bAeGo5VhZYaJI6lIuot+LNA==
X-Gm-Gg: AYBFou3kESWUg44fYugTWdtYpBsidtwcVCm3SLxUOLChAliWKnXiTuRbu9FUNsrVDa0
	Qc2gf2OHk/p3wXxCXyV4GC3ztonv+h5pcOTqfNeI77oiszyGwIEBTgYl88kNQo5dwxJBRmopcam
	YWWfh7U7436/1RqA+5E0T1BE3sAYXF+TFg51ckHU+LRVUITSVUx1O1rEOdIQWfy+H+Yckr+JKbe
	M1ggP2XlDtmg3oGywnzyZbq4C2Vvq0m3o6kHEEcTm1DYthRcqT/07NGx2NSRxcLlgAF1nsKWgJ5
	TUuEIL1JuQIt5mh9n0WCR+tE/i/x2T+6Mm8Zv9gjWLjraUkbHgYsUP3HJryPrnM5YzMsJWob9RB
	UVCA3LwJPjosJfZNAuzcpHU8ydPw5oVw3NHSPS6BvgqSPkchB7iUoJQhP6swx9Evr3gO+Ij4yEr
	taawGCvpC+cqVWFwGRgiuRCrKoL3nZOY1MnGZT0L3cOk2NbUlxLiatVcYD
X-Received: by 2002:a05:600c:34ce:b0:4a1:dbdf:17a8 with SMTP id
 5b1f17b1804b1-4a1fd8a7d77mr86271145e9.2.1792648150526; Wed, 21 Oct 2026
 22:49:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260926055227.3678332-1-matthias.goergens@gmail.com>
In-Reply-To: <20260926055227.3678332-1-matthias.goergens@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 11:18:57 +0530
X-Gm-Features: AclHuK8thstWF5FcOG66PqU0xPPPqsryWezn1ub_Gddpp_AR2RhbRXCk-tq945k
Message-ID: <CAAhSdy3ongNF4xkLXYjEc=jNyn+=KT1soH-kPNY=5wZdoad0RA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: name the kvm-riscv/linux riscv_kvm_next branch
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_224912_581074_081EE1FD 
X-CRM114-Status: GOOD (  16.89  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBTZXAgMjYsIDIwMjYgYXQgMTE6MjLigK9BTSBNYXR0aGlhcyBHb2VyZ2Vucwo8bWF0
dGhpYXMuZ29lcmdlbnNAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSBUOiBlbnRyeSBmb3IgS0VS
TkVMIFZJUlRVQUwgTUFDSElORSBGT1IgUklTQy1WIChLVk0vcmlzY3YpIG5hbWVzCj4gZ2l0aHVi
LmNvbS9rdm0tcmlzY3YvbGludXggd2l0aG91dCBhIGJyYW5jaC4gIFRoZSByZXBvc2l0b3J5J3Mg
SEVBRAo+IHBvaW50cyB0byBicmFuY2ggbWFzdGVyLCB3aGljaCBtYWlubGluZSBhbHJlYWR5IGNv
bnRhaW5zLiAgbGludXgtbmV4dAo+IG1lcmdlcyB0aGUgcmlzY3Zfa3ZtX25leHQgYnJhbmNoIG9m
IHRoaXMgcmVwb3NpdG9yeSAoTmV4dC9UcmVlcykuICBOYW1lCj4gdGhhdCBicmFuY2ggaW4gdGhl
IGVudHJ5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgR29lcmdlbnMgPG1hdHRoaWFzLmdv
ZXJnZW5zQGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjQKClRoYW5rcywK
QW51cAoKPiAtLS0KPiBUaGlzIGlzIHBhcnQgb2YgYSBjbGVhbnVwIG9mIGFsbCBUOiBlbnRyaWVz
IHdob3NlIHJlcG9zaXRvcnkgSEVBRCBpcwo+IG5vdCB3aGVyZSBkZXZlbG9wbWVudCBoYXBwZW5z
OiBvbmUgcGF0Y2ggcGVyIHJlcG9zaXRvcnksIHNlbnQgaW4gc21hbGwKPiBiYXRjaGVzLiAgVGhl
IHBsYW4gaXMgYXQgWzFdLCBhbmQgd2h5IGl0IGdvZXMgb3V0IGluIGJhdGNoZXMgYXQgWzJdLgo+
Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkyNDAzMzIwMC4zNjE1NTU0
LTEtbWF0dGhpYXMuZ29lcmdlbnNAZ21haWwuY29tLwo+IFsyXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjA5MjQxMDE4NDQuMjQwMzAwOC0xLW1hdHRoaWFzLmdvZXJnZW5zQGdtYWls
LmNvbS8KPgo+ICBNQUlOVEFJTkVSUyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwo+IGluZGV4IDE0MGVhZmNiYmQ3OC4uMTZmNmIzMDZhZGYyIDEwMDY0NAo+IC0tLSBh
L01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMTQzNTcsNyArMTQzNTcsNyBA
QCBMOiAgICAgIGt2bUB2Z2VyLmtlcm5lbC5vcmcKPiAgTDogICAgIGt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gIEw6ICAgICBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
IFM6ICAgICBNYWludGFpbmVkCj4gLVQ6ICAgICBnaXQgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1y
aXNjdi9saW51eC5naXQKPiArVDogICAgIGdpdCBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2
L2xpbnV4LmdpdCByaXNjdl9rdm1fbmV4dAo+ICBGOiAgICAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm0qCj4gIEY6ICAgICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtKgo+ICBGOiAg
ICAgYXJjaC9yaXNjdi9rdm0vCj4KPiBiYXNlLWNvbW1pdDogNjJmNGM5OThiMjk3Y2YyMzM5OTdh
MmI0Y2Q2ZmMyZDJkZjAzMTljOQo+IC0tCj4gMi41NS4wCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
