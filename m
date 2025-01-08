Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F2BE77199
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RmYy+8T5BWjrTEXKJ0HWf/8t+kRrk3LqGmvCUaoWh8=; b=ca82w3GYybd5w9zu2oM2EBxQhK
	+Z8/bgSFsNY7GRIrrJJ9NJpBjrFl7f9aFzhBeeqSqflfVvTrimLqOeE2HLAUw2tJ3r5d6Wmus2nIv
	PsNCUCk/Yg7RpF3jcFPrRLJihrRpe2oYQYi6o+e0zFbShHrCJ1FSc1PDlhxrnJGt9nXA9yeUwmQ0I
	qE43M1XfsdJBiTAFaFyf0hTUm1L0yZUP322pG6rYenZiezCe/yB5gRjLXRdQGY/f0sC6M5nnkUxSc
	5RczPqLb4TMPafQ0gFlFPkdMsXt/NeRfVowmgMNnsNfzPpUhSiRGDJUhKMb6wyyfLiGBP6o/Q3CAN
	SkKWLZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSZm-00000007pzp-1VQN;
	Wed, 08 Jan 2025 09:42:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSWT-00000007pFg-2Fvs
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 09:38:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3862df95f92so7246660f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 01:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736329124; x=1736933924; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mDL559tBrr/c+O7uNT1qWo/LHQ82r4NDbguV4lcJTVs=;
        b=BBHXHmfOrxFoJeq6qv52rwK89OyNhHzB0GvX7GhJyyM52MZ6x3ryDywaorfxtXRuyP
         QRtzp98v7O8gfHffzPfNwnOYz3Ldw34ixUkW5+E91lS6G2eKJEXXSf+LDfYq0XfF/fuE
         s2CW8WvatUND6KoFQ71C2aVykhN/7k23pCfHI3SMRvmydDgf5Vp8Kjv+wQ26pO+760cx
         URc6lryGfreKTtEpuJABzDRCOTkpElDe/z6SSYFHvzvZhYHhc4dWxZJpycorEvEBRniv
         NisATRcdGaSRH5dVHYz5x2/uxp/1ck1+KKg5r6fCdL3NdsxMdz2iaAHT4cZOD2t56jx2
         48yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329124; x=1736933924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDL559tBrr/c+O7uNT1qWo/LHQ82r4NDbguV4lcJTVs=;
        b=h0EsWCMUya+ewdu0t4muDcXDmT4NHf3PXNGCqC9OHMNJocECxrixfenXtA3QOq0qUN
         jI1oMSsqfpmLG+jvXNfFgbsigzVZlG0qkByqiuei261WT8qbOOZuHlBi8NrOIsIzoGlO
         BHnvi32oQeiBw9NeS7LXs5DlAskK8vpLgbDDDY2q2RWWj8jSg/w0XU6j9xlkcufNN7KP
         FjmlIkJMsfFRdLNJP2L7veNPkwysKB7hBpvxOG0OCcaYV0PKkXD0l4RcNxY3MbLDcmnR
         WPMBdxtfszR/ozfa76lV0XyD78eeWV9XBVIIK3A553mqiU+n6wJ/i2N3dcPWyVnBLwZh
         V6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4iY+3Klsy/vV0bYjIdQV7W4jMXZW5W00bJU6vcSiQlCF3vHQfm3eMYVUcWV4zwHK8gi877p+XSjMAiw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw61SbO57rEpj6HZTpH8at3RyhqDxQCwUZzmCDiDzFa8OWNu9On
	+lSSHknD/svz/jIgzq2g+YtohD59nAlmk8A0qaMUFtg5oDr/PzqvnqhScZM6op4=
X-Gm-Gg: ASbGncuSz2jUQNmfyndFh6VmE8wUPKppl/8OCdqgfUFHI/dp/gx4aG5Qu1zne7OQsY+
	E8w8W1dCCwAn1XOdWFk8LSP9GYxebnFNLRs3ef+Bwhayy03TIc8jDhZ+wF+9gCi97MSSuRdbSSx
	AlWZKzcPM1WQBKiBUe09nUYTzfO0gI6IUAF8tJfnI8biNSJgeEEG3JS0TevLOQbr9Q3RXF+CcO1
	KN5Tm3YpTnL4nAqdP4jjT031zdUgjHstC83T+TUT4/rkkjgl5spaL71GmDzKFt1pmSvknmk5qL6
	RzCAvEz47tdTy6FB7sLH
X-Google-Smtp-Source: AGHT+IEYud8HXrnnBRfQKSjaBRvM+YCl9Bp382tGy2B0NHlzlfFxJe7Ru+DWxpOuAvFe6cE/t2KRgA==
X-Received: by 2002:a05:6000:18a3:b0:385:f0dc:c9fd with SMTP id ffacd0b85a97d-38a8730dcf2mr1495919f8f.27.1736329123722;
        Wed, 08 Jan 2025 01:38:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8a636asm53864908f8f.88.2025.01.08.01.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:38:43 -0800 (PST)
Message-ID: <71aceba7-d610-4550-a8a8-352c8dd4b44f@linaro.org>
Date: Wed, 8 Jan 2025 10:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: timer: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_013845_574378_44C794AF 
X-CRM114-Status: UNSURE (   8.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDcvMDEvMjAyNSAxNDoxMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBEVFMgZXhh
bXBsZSBpbiB0aGUgYmluZGluZ3Mgc2hvdWxkIGJlIGluZGVudGVkIHdpdGggMi0gb3IgNC1zcGFj
ZXMgYW5kCj4gYWxpZ25lZCB3aXRoIG9wZW5pbmcgJy0gfCcsIHNvIGNvcnJlY3QgYW55IGRpZmZl
cmVuY2VzIGxpa2UgMy1zcGFjZXMgb3IKPiBtaXh0dXJlcyAyLSBhbmQgNC1zcGFjZXMgaW4gb25l
IGJpbmRpbmcuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGhlcmUsIGJ1dCBzYXZlcyBzb21l
IGNvbW1lbnRzIGR1cmluZyByZXZpZXdzIG9mCj4gbmV3IHBhdGNoZXMgYnVpbHQgb24gZXhpc3Rp
bmcgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gLS0tCgpBcHBsaWVkLCB0aGFua3MKCi0tIAo8aHR0
cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3Bh
Z2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4g
VHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
