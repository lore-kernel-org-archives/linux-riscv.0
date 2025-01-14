Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896A8E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 12:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOy7abvbrlVTwxDProIQA/rkEVemgJ1vp5o4j73Y7pE=; b=QNaFmWpW70rQ5Z
	bLm56nKngE0oZel7PXNSqteXFHOTjmYDKsLHz8DItyv4XcI9qe8/qrZfywCGTDN3WMGNtqRroctV9
	TwFNfLbSJZ6v6ZkXZxeWj3j64rM8IWimVHDgWCl+qx7MxVFQmxTtV3pDNsexo7NrMm/Tsqp8bC3Jb
	/4WACHEfk1TOeCKuWkTZV+n+BwXSo63Hg8DU5aK8cDjhQezpbOh121I8ydfWrFRpm8OKPeDUt6mUN
	gMNdMn5ONvlm/vUijoLY7q6o8k2DR4XJYfVip6esBvgMOc4T/nIyfuMF9SfwDL5ImjRlPbrvrVPZp
	cXgP4445YYO4IaYJp9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfrC-00000008Moo-3w9f;
	Tue, 14 Jan 2025 12:17:18 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfrA-00000008Mnt-439j
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 12:17:18 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5401c68b89eso5851170e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 04:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736857035; x=1737461835; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=C/iNPQT8ICeyj2uvvUxKfWYKkgfa6tYd1GEtUTQV3/5ZKpN8YM368C/vi811yuBGeh
         Ga1zWTH8y7ZAkzUfV4fJ20cCmIEnq2p95/vjTogsG1HUm9JFIqHzBciIkmw0SQxkDzgh
         CckT4Kn6estK8mTxrCtn/YhXmaY8VAqc+zrfw120sfJWyAunPvjNF8FhHtz6RrfLubZ/
         wTJZO7RIFJu6YSXpQAu8hP33TzZeWDb/QAxY86ZdeEL3x2EuRCqDgkGaFHMNsPze7AQ6
         6CBTSFyLTNWhA3xurMvBxfuNXpJ+Zf6ZW2dJ7AwwcL9YaA8e/dsNKzb57iDisA17A2ps
         SNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736857035; x=1737461835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=MxYxMEnyZY0i9t+ffahJgfRondCMgf2AwdE2uK2lTckMZ1Ft+2eEQkMo69lPyIaVnm
         XCOzi0kLkYiWiQjE5wSzX/I19lEXH9u8qaF+qDgSV8YvbQvQcqjKlCyLRPaAbSS3VeF3
         WpHEytcLkG4xqPaJMxtej8cDPO9hokh0JMV1qXOHbLEuifVqC+8YBsMi8zLx3xfwibUQ
         Ljud+uW/uTSfwiv3v9ilI2u4deI6wrp/wOFPWtUm5Jaw4tiwJU3AXuASXKSjDpzUVe9Q
         hTHumG5A+vGedoy1xq+dbAm7i1tslRQ4Nv07o3eNZz0pmPu0wwvrY+U80Oc3y7BiH/pT
         nU4w==
X-Forwarded-Encrypted: i=1; AJvYcCV+W5i1bDfUHJ904j513Ix/UooJSZBUeWrzJoGOot4+ZGSchY5uinVb236sgl/QLmJ5w6zAPo4E+ABb6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuF3kbsZAivgBwiZ44ir5cCjfINeQwZ+PHPCW3fbUZePY3SjpD
	lLUaY4uIuMpuGVWoqywZgJvSacfm4q2UJWarKgnk+ghr5vSg9iGbW7MXkf/AFIDAQf5D+kRV6bD
	SvN1ZviUf6IB7fbf3wsfogWPtISZEfOQ3/jTvJw==
X-Gm-Gg: ASbGnctIHxfLWlkEdPbSCwdgteiL4ijJ/VI3GvhOCyF3PDe2twBWa34BGF/jSdl1BS3
	eYMgN8g7+zHPi27kf6ilKjpM6LBExwq4gzNWk
X-Google-Smtp-Source: AGHT+IG/nVzJ4usllSB7WeL3esJ0/+hz1rQx2YNWDFn17mueoKalfz6Uj0tzGOzfhZRqk49pDpDqslNG3Jdx7c4EaqI=
X-Received: by 2002:a05:6512:b97:b0:542:986b:de08 with SMTP id
 2adb3069b0e04-542986be0a1mr3961478e87.26.1736857034594; Tue, 14 Jan 2025
 04:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com> <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:17:03 +0100
X-Gm-Features: AbW1kvYSSgagqOIiggVP1rEX84eySXcyOvS8Yel1NcZ50o6oIQlw1NaD7KnQIZM
Message-ID: <CACRpkdbFtLhGXwSbCF+v54eEdm0w=sDsseUPiRfc=xmak-DbhQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] rtc: pm8xxx: Use devm_pm_set_wake_irq
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
X-CRM114-CacheID: sfid-20250114_041717_013303_848FE28D 
X-CRM114-Status: UNSURE (   6.90  )
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

T24gRnJpLCBKYW4gMywgMjAyNSBhdCA5OjQy4oCvQU0gUGVuZyBGYW4gKE9TUykgPHBlbmcuZmFu
QG9zcy5ueHAuY29tPiB3cm90ZToKCj4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
Cj4KPiBVc2UgZGV2bV9wbV9zZXRfd2FrZV9pcnEsIHRoZW4gdGhlICdkcml2ZXIucmVtb3ZlKCkn
IGNvdWxkIGJlIGNsZWFuZWQgdXAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5m
YW5AbnhwLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
