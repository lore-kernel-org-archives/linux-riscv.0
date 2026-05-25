Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EF8CD5BCF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPaSqV+rYI4EyaZjfTXu2IYi7u/t9wz+GARXZiGVXkE=; b=DkHl+5+VYgidVH
	XRFTw2qZmnflng94/nuucEsGT8obyarVDa/Tg1iGSwUGv4cCDfbKyZdMH8IztCmS9LP/GNeblqPaO
	NocFTy7r7BPjbfonBOHOvErJpH3BDG7c6wjfNJfb/Fg6JWnXs9BqCDI76S9VyrWwo5Zkk7a3YTaT6
	s4PGFwpPIxp2aj69aImA4e8wK4LzaDgEMsJP9yiVH0OSSL3X8zArLP9IJYErQZAi33twuq18SYv3g
	ih8PrxNzkXDG0J7P75lw40Ej1i6KkkD5lh9DQp0Z8mdPHYrJzfCsLlRG7g/3ariXrxllcgyxk66BH
	m3dhHXhtgLnhJBgmCSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQzc-0000000GhgA-3gHp;
	Mon, 25 May 2026 08:49:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQzb-0000000Ghg0-2S9z
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 08:48:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BF63600FF
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 08:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73B91F00A3D
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698938;
	bh=gtQuWTSxUSwTe1rnC1Bxe7ukjpoKqS4f+Z5r70b6Peg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MJppW/ydAq4+aqbVWJ3CYNAA1e8mfTFUs4rHAg+D6tuYfnBbo269TIKSLc78Znv8l
	 XkQ7JF33YPTSl7ljzMih/o8YDPcegQa2AEqrf8JMDeTfwUdWphgP5ksT5C0v2VTSuR
	 2sZYBAjGwanSXsAEZW7FGsJr5BE1nAC8fBpmxkjK+oiURk0jf7ZDIN4q5A/MKHMjmq
	 6EbUgDeH80ir6/+elbZDpIF66HysTHPc3Wd+V1pgE9Ml4t4Vj5NCpoSzIGsyeA3A+n
	 sl+v7do+xzv4lVucgQ7Ww6m0r0eEEdmLT0C6KSOs/r0htGp0U8mcT3J3YvLp5Lrd3m
	 WP+kmMmLyb1fA==
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-479ef2b78f3so8653699b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 01:48:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Y1CqmFK4fdJbr/+rn6ThATJwlWwSgvBLMsaLbOQ/AnEI7pijAx/FrjCfQLCgH/n+yJ/X2Q30PZcnCtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeJyRLhHWxrZHKy0dajXKERq0Ktjzvbe+kJddvciNQMgRhtDHK
	TiY5lSpGPJ00H88SYaIPrbkk3GfTUbeKdm56AQZkStnQkgKYCcsQw99yq2wWuqSTnrW/Ta1lRdl
	zMn6Qs5xkqRcXIlMUe+FyMSp4mxJHPO0=
X-Received: by 2002:a05:6808:4fe6:b0:462:aa0f:4375 with SMTP id
 5614622812f47-4854a3afb48mr8047575b6e.39.1779698938186; Mon, 25 May 2026
 01:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260519164007.122574-1-gaohan@iscas.ac.cn> <20260519232154-GKA3708537@kernel.org>
In-Reply-To: <20260519232154-GKA3708537@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:48:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
X-Gm-Features: AVHnY4LjkE1u72Fg4ldi4cz_SRmret8T9tX1fPLbCSOaUNt9lHK5p1Z2W56miXY
Message-ID: <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in spacemit_pin_set_config
To: Yixun Lan <dlan@kernel.org>
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
Cc: Han Gao <gaohan@iscas.ac.cn>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMToyMeKAr0FNIFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwu
b3JnPiB3cm90ZToKCj4gQ2FuIHlvdSB0YWtlIHRoaXMgYXMgYSBmaXggZm9yIHY3LjEgY3ljbGU/
CgpPbmx5IGlmIHlvdSBjYW4gcHJvdmlkZSBwcm9vZiB0aGF0IGl0IGlzIGEgcmVncmVzc2lvbiwg
aS5lIGNyYXNoZXMKc3lzdGVtcyB0aGF0IHdlcmUgd29ya2luZyB3aXRoIHY3LjAuCgpZb3VycywK
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
