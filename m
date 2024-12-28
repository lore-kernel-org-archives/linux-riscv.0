Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA0BE77188
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Dec 2024 22:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oetbe2fN2v6OjXfeP+gorlWMs7b3JWVicf0XWezbC+Y=; b=EnPglQVaflAp0t
	2/tnMBoNDwnMpOXRMHBLJyrC96zuEiZMk4FtDFcgnn9MYHycUoSCRQnrf1ZPl4dyNl+UlpZYxzK8/
	kqpxNMoDiQYe0vQ1GcNthmPYKjlI1ga2RV484vNRM0UE8TcDCjr1m3TZfqRxt4P/t1+4sexdM5BD2
	EpWAvy0hDzzmYoC6cGwb4lXN2tXAJSKIUVGbsfAiamIHP9/ACI8BK6YTEX3GBeZRrdkCn/Gaz7IIE
	0oKqpyC6SBiBeDUfhixTgE16g5keb0/n57BrmC/f9gxcp3Dx9gvhmPtgYqnap0FCSV3QyEaKYdB/5
	9Mq5YH+Z0MEk/wqLhNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRfja-00000002VQm-2bDw;
	Sat, 28 Dec 2024 22:56:38 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRfiO-00000002VHt-00ue
	for linux-riscv@lists.infradead.org;
	Sat, 28 Dec 2024 22:55:25 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5401c52000dso9482039e87.3
        for <linux-riscv@lists.infradead.org>; Sat, 28 Dec 2024 14:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735426521; x=1736031321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=taVdMpreIowOn9rP+LLzCfFQRF3k6nQ86UD2mrPe4FUPLR02QNosTajQmE8YWGgYwt
         5j98K3WIX5TqDUAcsEounGzk4n0/JO4WcVEXcZXa7q0dX4sXTWtFjG+9RJS1t+bKwwuL
         wteN22QJMz2lvqBzU/IVWvxcK1Q2BC+V2UTXI6BHRnybGDjNV1ty/U483Ab0VQ6QHUCX
         pm1/1/oWl7MoUNYmupEPUeyvXv0SwmaweY6xzcXA4O+qR8HK7+moXIa6fbOXJZS8GZPo
         /jXVqjwRwnRLdSYN7ptnhPdldMTvEJe6Ilf1AxY9O960lBFu728YVZw6pUE/YkmdbCkM
         ap/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735426521; x=1736031321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=g0TMjZD2CpTnYCPI/matafq+c2PecUZUJ+xHn5iDF5QdNgGMIy8A64qXCUtz2Vz4A5
         tDZqcSm2mjSspZGuw/hW2ndwgBydMMit7HpkaBa1zbXXb9H8zfE2xmjIvZKrXnutMiDS
         fdeGYbkNWFjlDHGRhL4gYgwdpuQDFDtJwKUfHSYfnJQZhzw9bbVRZnSzJLPKh/KOluBX
         mvO3yTkvuh8SCLmsswG2j/BeH42NRzlJi7PuD7jf3WyD61vxf4ufiOqhCHzpCj5fU+kN
         mKFXx7OnzF9R86QkkXwEJAjDteMk/DD7uS9Kk8cfSGhPXpvm7uhpcLuD4wJM1v3xFs3e
         uGhg==
X-Forwarded-Encrypted: i=1; AJvYcCV115anj/ViWcgxLmjHnqKY6/p4+gqn6lgCDw9Rx47EOrM4n+XNIYj5lW6Q5tLl31T7ABw0/topuMRsyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvHgoX5ErCea7MpXfCVAVqdw9fEUFq7eb3TIWAEahpJeZFzgXo
	vr1HB+uksIfBlci4bwcym3VPy6FxTDVwQ4KMPjql7nqUZUhzhaLE+eQ14sowfnSJukhVi44uOyj
	SFnGNu4aWMyhZ0+hls0JyGrw8mkV2/OpB1C5ZXw==
X-Gm-Gg: ASbGncuLF0LdW2zTqM9hgUzKj9eE3JpDkQWANxLJuiUZ9N/7vaWiPFjpiEZefZiwcur
	u5SYL9Lt8HF8dD9L+/oJNjJXuv87CpvYZUzdZ
X-Google-Smtp-Source: AGHT+IEeHS7qBCOkGJkLci2K1l4MO3cQjjPsp4mJA4mp2Fct0kochwX6HgM8ASkaZLPLeUe5QHN30KZL6jeoExuit3I=
X-Received: by 2002:a05:6512:ba6:b0:540:2160:ade3 with SMTP id
 2adb3069b0e04-5422953c19cmr7875781e87.25.1735426521162; Sat, 28 Dec 2024
 14:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com> <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:10 +0100
Message-ID: <CACRpkdYaWTdOoLXcpWG92+OyRwsPMxMbhQ6djdzO07x0sPz4oQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] rtc: ab8500: Use resource managed API to simplify code
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
X-CRM114-CacheID: sfid-20241228_145524_043060_5DB6454C 
X-CRM114-Status: UNSURE (   7.05  )
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
ClRoaXMgbG9va3MgdmVyeSBuaWNlIHByb3ZpZGVkIHRoZSBjb3JlIGNvZGUgaXMgbWVyZ2VkLgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
