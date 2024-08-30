Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD52CA101B
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 22:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QQHBFDtdIP7/qN7UcQokLjIaCVP0V4q0357PKXPGdc=; b=33B3Zo9I+qdWOv
	vEep23xqITDnSyJtzhkkx2XdYrZolDWDBjP6UvAO45PySeuZO8xkMDu5EaDrQjehizwLu1qhpYQlg
	6HjfTTz35IU+kYCr+KTDiBlb2HIIdWe0bjWXvu8OLka0tgfCAE5UbJELCoowZNxVToBe884OUgjOc
	/lu9YuIXwXvxnf78uywkSs0rfp2sB6KLUneWezymn5Ubve6yoxFh+PvjINztuJROmrxk7KzSTSTHc
	jmaEVu8J9PGXxT2FBRfl2/egxb88PTIfBf7wnj8mJmXN/YtnaJHcXkKBQCcFS6qB5BPV2pLSrp/P6
	6KizcegI3ZDex7DVIZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skADU-00000007ufv-1XTs;
	Fri, 30 Aug 2024 22:35:40 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skA9C-00000007tdI-40NH
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 22:31:16 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6b747f2e2b7so22261377b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057074; x=1725661874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUblgEFG+0OPCJUw0oaveizC+h3CWD0I+O0FLcExw4c=;
        b=OPsJKDHSGTbdpcU0gZqkU0/o5awAzBEY+S3+vdgsD1ckXyxhEElKzHMXwR1eGBu4OO
         nuBiAkJPssARAH8nsuk9238IFcd+troSoaXEQ7nX5uj92WreQPwcocBAwVFCgcSPwjw7
         K4NLgGelD3qnPghB9wEv+dn8y8mWtaUIqENG8ziAWEVBROtY3zlqwBwA+qrkYd9Vkova
         stW+SQZCvkqzmJRe7VQ8DZ/l+D6EqvNJA2ALBMvvIveSBO0o9mWr/4sOFnZh2X3QpAmM
         pS3oeuNHsI9/h1IKUd/ibFvhJRNWWqzaxZi+e6IVgnYMX6PaK4V0/T/aKYRkOXrflvk7
         hoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057074; x=1725661874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUblgEFG+0OPCJUw0oaveizC+h3CWD0I+O0FLcExw4c=;
        b=t0Fy6R7pRXE/INHIH1++uaAPl0YwtvFPHUW+OaMoULYAgtHUAclP8lReC1bHldRORp
         iXYHg1j6rxKJgLsIJSMppc4qdlaUkMUN1DnVcOsOO3/mEgiEdLzpknmOwbui09pfqiw/
         YdrOoDkxDn3EFSOhV2W6Z0y9MmQ4dt8uT2WhIZW77eWF4ygHw2jpAD/Ach3/iC0qvcA6
         OMB+V8Jbvwx8YyrHuSKWjDmkkjDBuLN2BrF2geIC5OyuCqHmrSfn+DvMqhJlOcXsRj2K
         MCO6buHeieQ4c7rfc8Vul761aqOelUkTPbCkP2xtE/f/jDyChdGrAb1vdGL5u/lQQxFJ
         a1vw==
X-Forwarded-Encrypted: i=1; AJvYcCWUO7hSxvRigfL5PZT5uim3Nd0CWqNEFkkIbPRcB8dch/tXMc2W7VtUgO51biqAaFpQEw36zJAN5w1yXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YydP16+Qg6voaO6vXa82Vir5pPa+EZd7qOrIhnRKewQlaKdxOCR
	mz3VTACrxeFwC4f17uptrEomXFHOujeS7Qq5lVIgRVNFY6zlqosfKILx3voXsnFNXItY75sOwiK
	lFwISon/q3mdKkwNhTUW45XnzbMwBtcKWPPOi0w==
X-Google-Smtp-Source: AGHT+IGyK2LRKMFmPldiXpQts0hWvnKTRelfsOu/wi3UPmzSoWa0k2vOUkkkzaMv12N7NZDZi0YIQcRKHgMku4EEaXs=
X-Received: by 2002:a05:690c:d89:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6d40eb66aadmr39432397b3.3.1725057073718; Fri, 30 Aug 2024
 15:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:31:01 +0200
Message-ID: <CACRpkdaaxCgMuC4YzEm8NjKqnL_9MwqawYigBkp25GntWc40vw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_153115_048664_17D18C9B 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBBdWcgMjgsIDIwMjQgYXQgMTE6MzbigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgY29yZSBzY2hlbWEg
aW4gZHRzY2hlbWEgYWxyZWFkeSBzdHJpY3RseSBkZWZpbmVzIGNvbnRlbnRzIG9mIG5vZGVzCj4g
d2l0aCAiZ3Bpby1ob2ciIHByb3BlcnR5ICh3aXRoIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZSksIHRodXMgdGhlCj4gb25seSB0aGluZyBkZXZpY2Ugc2NoZW1hIHNob3VsZCBkbyBpczogZGVm
aW5lICJ0eXBlOiBvYmplY3QiIGFuZAo+IHJlcXVpcmVkICJncGlvLWhvZyIuICBNYWtlIHRoZSBj
b2RlIGEgYml0IHNpbXBsZXIgYnkgcmVtb3ZpbmcgcmVkdW5kYW50Cj4gcGFydHMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
