Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D667AD10C11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 13:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=julw9471EyHNoZoK4eehXBuQAGKBtwUeH1EHLKc1m68=; b=HDe2z6tH3qXOnA
	/hDNS1KWeOXTu0AOzf9bK0s1Xo4uP70rRTQQwsBGe0OUuT1mJn0eobDjAd/iPRUtdoCVlEWnJ5ecK
	kJjB7Q80jJJpYJ9z1bTABbYNN+Wi8uabGc63VIDLZ33G5136sIehcqz4eDjDkTm1Z+RL5JfsQQItX
	/fuR9lxukWJ1x29fWbu2bZ+5WOFekuOcAuGQ6ReQdVKAQAbjIgBbX/o1bn2yPZAAR+ITsLZNU7QCA
	0WzmcOYTnOr+gjuXgX8DXq6Tili30mhABWL7YGy2ncCQ624qgkqg/3jSQuksQ6+mLLNQtuQn9jWxC
	A34xrMYazLTP9ebKHJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PPd-0000000AsSY-1HVt;
	Mon, 28 Oct 2024 13:04:01 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5POh-0000000AsFW-0yFk
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 13:03:05 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb51f39394so41331661fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730120581; x=1730725381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES/3wWXe3XmsnopHzfvpLs3+vjaLgh8prmQvw49/8v0=;
        b=PMJZCF4psCFXDF4vV3IeM/WJy9Pei7LzgGOQJzYLvZHYeavhtn5O3RMH7PLWO+VdQA
         bw/ZyQwv60+/4xxo2uhGb1FQTLLWDF+qxkdaiD94eu7/FQETT0WhfOumcqUtPdvd5lBL
         ooKX8LUQw9283x6GNMSEhM8m8K+tkEVXqWyszBshrqYUJdsydPD9cOvcb3RVAHUXz4d4
         Ah1oEmLrLv09WRjJqbgUSD6R0VTsXXwFoFuyZV+a76KnJPyW/+sxYdeb3BZJSjZCZayk
         9lFJdXsTRz/neMsj5WHBtkUYBZJFp1BjeIO8MG8BGSxODHa2T3tpjPeipVlYN/9PN+BW
         NRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120581; x=1730725381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES/3wWXe3XmsnopHzfvpLs3+vjaLgh8prmQvw49/8v0=;
        b=AKeEfdpQeP2gFgAIoJjQfSSuj6/SfzGtv5PBK6VlEWtKtQZA7m+jXwf285KxPZA/uc
         3OQ56ISJR22Yp1OtJdf4mJ4o+G+SJhujBxu2oceG7LlGj+aTtwHklFzPUG+hDh3bcggi
         V7I3PySQWFRKqdR5Hd/FgAxOW56uaarmwO0r39S1/ZW5+CW2gvrr6QO9QhqlFE3umgFf
         P5fUJ1p1WfPUD8W7PZC38Gc+Uqq03xVDBPV8SMOWkIiyGGNUeskAVWadJdtvthYR2Oaf
         Z+uoy13wULh1mGgzoZAf24CzhURstvexad38drwXqnFjg57Clu1NDmM0Fi1FnqR7+pnL
         5tsA==
X-Forwarded-Encrypted: i=1; AJvYcCV+2NNGnncjetAP8SXgwsgJhKLhxPatBN0vaWMLPibbTxFRqY8cS0T/xvd1iHIF46JUi8KSUisTsIagNw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4JcCYJQrG62EmZAsYcHbJ8xGGcegUYiQuYIRJSDIHWnxTOlPf
	WebkoWeuo6y27XIfkM2LNhR6bCqgB+UyC4nJP2iTHpEt8+1qBOlhYSiRtyxXY5TX+s4b/FFA7Qu
	U86/lPckqj7MQXZ/7AAzi6LKRZaq7AiU/2qDH6A==
X-Google-Smtp-Source: AGHT+IFQ2jWEabuLAHBA+snc2ktNpVjAxzzLMDX3og/hhpyaDNPJZ85//6hlPCUzYqpOHfjsDrUMI74wo85pww9rYsA=
X-Received: by 2002:a2e:381a:0:b0:2fb:3c16:a44a with SMTP id
 38308e7fff4ca-2fcbdfd85b8mr27232701fa.19.1730120580778; Mon, 28 Oct 2024
 06:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241024064356.865055-1-inochiama@gmail.com> <20241024064356.865055-3-inochiama@gmail.com>
In-Reply-To: <20241024064356.865055-3-inochiama@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 14:02:49 +0100
Message-ID: <CACRpkdbUs1eWgZCvxNYqpnUox2=4nwewBi5YPqSBO8UDhikyLA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: sophgo: add support for SG2042 SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_060303_295442_7168EAFD 
X-CRM114-Status: GOOD (  10.57  )
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

T24gVGh1LCBPY3QgMjQsIDIwMjQgYXQgODo0NOKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgoKPiBBZGQgYmFzZSBkcml2ZXIgZm9yIFNHMjA0MiBTb0MgYW5k
IHBpbiBkZWZpbml0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hp
YW1hQGdtYWlsLmNvbT4KClRoaXMgZHJpdmVyIGlzIGNsZWFybHkgZHVwbGljYXRpbmcgYSB0b24g
b2YgY29kZSBmcm9tIHBpbmN0cmwtY3YxOHh4LmMuCgpXZSBoYXZlIG5vIGludGVyZXN0IGluIGhh
dmluZyB0byBmaXggYnVncyBpbiB0d28gcGxhY2VzLgoKUGxlYXNlIGZhY3RvciBvdXQgdGhlIGNv
bW1vbiBjb2RlIGFuZCB1c2UgdGhlIHNhbWUgY29kZQppbiB0aGUgbmV3IGRyaXZlciBpZiB5b3Ug
Y2FuJ3QgbWFrZSB0aGUgbmV3IGRyaXZlciBhIHNpbXBsZQpzdWJkcml2ZXIgb2NoIHBpbmN0cmwt
Y3YxOHh4LmMuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
