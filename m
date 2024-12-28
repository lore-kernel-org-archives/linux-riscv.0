Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E30AE77188
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Dec 2024 22:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mX0mYe1AUnt1PRK3VQhj9XrAYmShGw/nnfj1FJNCrDM=; b=V4d4oRC55omnBo
	qjTLvqa0n+/ujymA2JdWp35bT9dHdKK76rEKff8X0hejuwU4bXXz1ve3WnRLTuAbp3O0dd9V9TVgY
	YxJnai0gVRFbuIGKpcMf7eSjD50wLBdN7krmn3eqSy3hQ+Zwj99fSNr5t3wQ8O6HESjaKnLwQMyWo
	anRy17i7+faz4BMFdqJT5PKX5UbNGs8Kbdpn5fxfUvFA3Ls6NIHs+SNvsisaMcFQ8tLReR8iKzCyF
	KfnGBmUYegDW9l+TfB06eiIHMi+7XqK+3ANk9H1yEmfJP/GjMn3/CYxjX1B8hZdTYu/uICUxXzUxw
	xTedjJ5cKYGUtxv6n3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRfkl-00000002Vcd-49QQ;
	Sat, 28 Dec 2024 22:57:52 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRfiw-00000002VMT-1kie
	for linux-riscv@lists.infradead.org;
	Sat, 28 Dec 2024 22:55:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e399e3310so9972595e87.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Dec 2024 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735426556; x=1736031356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
        b=dGTPaX8m62OzyCFzmHOiBKCnF3x0b5EL6UllEVXoQ3xL3cJSWmVesntHVOFj/Taeu5
         Yh2LH/46tlnpTfLt3JYIZZB2ZAn/SKFFw0eTRvRbwwC6my9rIWys7L/CRUU59K0Ay04k
         70fbhSgUDsYsqjWcq3XUkR7u4Fj9SZ2ghbj120+h5UMLZs2BufquWZGxEJfoGe0MnOWN
         9iT+0DmEAEXYx/j704JPpPA/ua6SlcZAKKjIh+VXBCPPL4bv4YKuAh2NPFMzBkSAeXkJ
         oKbaj2ayZIoV1+So4i7SeFJQHO6c3/qySzPKXEk+YPqBifmdeCFSVO0zdRgLKJC/geC1
         ktEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735426556; x=1736031356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
        b=ohtikvHSj8GnqgO/AHqRyGIeSLO08vGRVVoHuCpOOq9J8gsUm1YGQePY3gkaYxW5bf
         9xSN3KPRSfDJJDtzMworxCdioGppU9AyV8UaF8epKXfrtQ9BYzi+f/eXzElbpJN2Zj9c
         xDQ1dDBtVQHtxj9MnHYqbu8OLk7OCE1tfS+UZ9K3YWJrBuWN/ilBecyCzuV/cL2Hkdsp
         nBNCUexX4/nTEHBaUym3lZRtyn0olfm+7VVf+iKhg65FBzty6605vjcas8PshsYvJufd
         LVfq9W9Iyr+0HdCYXNRVwEyY25eMDZcbVBDS/jdz0QSenxQTirB8/tWCNLXBpH5txy7k
         sUww==
X-Forwarded-Encrypted: i=1; AJvYcCVos3Tj0wbU4y92xUtMEt7aZkRATzo4eoHjvu5YeSl2SgML68vewblfdW+WSEXfVC+/sqa8Tc30JRb85Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYTT+b8yxMMJcGpPk7Lkoc1x+5OfZAiO9EwNjEN1EBo8k0yJvF
	TxLP1w0fPQ9VGjcSh5XQ6CRpbAbkST/BBJiY1z3KDRypSjagakccmd2FOZpRc1RNEuJPy2B7h/N
	Ma6hgf8YyfW0niTnvhaX2Gn+Hf3E+avvXPdl62w==
X-Gm-Gg: ASbGncvooKsNygOLTVYnsn7SI+Xy9ZkUaxY1PtA3NHl2dqQrJeeBwsluPdnl4e1ln0P
	5W4vXjLqtXRe2Tunj9VM4CMEir2EMccw1Pez0
X-Google-Smtp-Source: AGHT+IEOcI/QKkD3AUBydUx80A/BH8Zb+xNHEVzuo3JP6PjvydFsYRRsKbYFCgVkNWvtDpuRPklRSeHgUyviYhKsrpU=
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id
 2adb3069b0e04-5422e04f073mr6848917e87.42.1735426556517; Sat, 28 Dec 2024
 14:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com> <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:45 +0100
Message-ID: <CACRpkdaTBSpk7wToj2TLS1Tgj2cshuSrYgEm4bj-WmFSVohYoQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] rtc: pl031: Use resource managed API to simplify code
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_145558_458897_8E87E9D6 
X-CRM114-Status: UNSURE (   6.71  )
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

T24gU2F0LCBEZWMgMjgsIDIwMjQgYXQgMjoxNuKAr0FNIFBlbmcgRmFuIChPU1MpIDxwZW5nLmZh
bkBvc3MubnhwLmNvbT4gd3JvdGU6Cgo+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29t
Pgo+Cj4gVXNlIGRldm1fcG1fc2V0X3dha2VfaXJxIGFuZCBkZXZtX2RldmljZV9pbml0X3dha2V1
cCB0byBjbGVhbnVwIHRoZQo+IGVycm9yIGhhbmRsaW5nIGNvZGUgYW5kICdkcml2ZXIucmVtb3Zl
KCknIGhvb2suCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4K
ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZ
b3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
