Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC67DE7718A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75c2mdoB3MyozlOcLSswJm36cZGXBcvEGBI0ocz+bz8=; b=vrqoRatMYd0Sn2
	98tqrFtxAUUwFM4dUkfX/DvVR0IxOLbvlNwAaaJichMUxuEruZVpc+nMt5QsnSDSDcEfptNYLqmS3
	efyiyq69RhgaSbbYgCpf1kyoLruK6RpZ49kkk4Ys5QQdiskbhaNaB34oaC7Y/CC3XjwyW9f59M948
	kSiu7dtbIWUWGKfvktEW1fpo8E2dfGWJdvuwTRBsE7nbSbIL5qjvj5j0L17OEKltuIWjMPGSQS6FL
	/avwOAFDJFm9GCuz1iNZgMSb999PsBzwpOyd4qUzxvXZQtgfUos/IHFkKzAdIvXQ09UkuR2E4jyxD
	KjQaXxAEp/eP072bve9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcFw-00000004uHx-39Ym;
	Fri, 20 Dec 2024 12:37:24 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcFu-00000004uFz-2FPe
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 12:37:23 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30227c56b11so19496821fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 04:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698240; x=1735303040; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F56erWhyzemwHU8vw/akXQlfDRYduu5pGi0XwRecqdY=;
        b=GZnuOBxLIfAKGFuu6fBx752vy3PH/JwpbJJVLGfmRItxmPN06M83K3auSOEfJnrJ4r
         FSyByR4Ju4xo2GCCywKhCMo3I0H2B+eOZWnjCgdXUSrpDvIyJfgUA+0/oUzclOMDxUjm
         7qahz3+kf7K/KIxOcu/qhkLjRAsnvnOePjIf/SxIRvQ1OieBBktZktU1b4GBN2xOyr3n
         jeV6U6W0ccYFYc2NbxvkRtZK35LcU3Q0qwso3CklXwji7HjntBRq+TfQ8BHVJH6xnTuw
         VgZVlJqzZuVbHLhxN3uNNMInZ7zqrdcp6fV6aSm3TM+bDYJvY/PTpOqNGnjV0J6dGuT4
         AlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698240; x=1735303040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F56erWhyzemwHU8vw/akXQlfDRYduu5pGi0XwRecqdY=;
        b=A76gk2qu9s14sDjbQYPUJCRHRTgL6o9RDCEvgBLCXP7EZJWqFBUniTWqy3P1Zvxcfs
         ClJV/x2SAXEMolxCyOz3GP4qAv4yV7aw/QamF+XC2ZZV3uj+IN3Y9MdEf70yIyBa+Jkc
         f/9r59ENCZ/5WADgeHVV3W9fxNeiAf3C6qH3GXt4CKO5EWu8KH8x91/5mAWTNXAlW0II
         uHx7zFQmNkAdi2GHE2xvZ5kjDNHIqqclz6kXFB2kZEAEw3CUPhLluqEjgQIxnhjhmSiX
         9CiBkc4wVhfGoL2dhOzoGxgFnNibsZxmhSVuZtBLT0+5nxS9vqktLgGxPJ2mz1fWEIAf
         JAxw==
X-Forwarded-Encrypted: i=1; AJvYcCUjgOf1eXWg6pO/G5KzaruBAhZhyxPgTmdi9+35bNpu2I0KYeinxVcxzeO8QPJ6Ua1QDYEM6xSX6v9ixQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoNEm9/N79lT14mz8IQ9sCGI87tHP6BEIYuwSDD8TKuDrixysD
	a12OZoUntbxiyq5j/YqbW2IUvoyLqF1J89D8Qq9Lit0OyJITjiQ9QkiSQf2FzWmcfaecs4kOuwF
	by0BqkdUHK61fGHOnzt3ahoFhJioi+LoXr5GU9w==
X-Gm-Gg: ASbGncu9qGYyswNmblkPnIBX5Edi8TFwxf+up7UYwlR4MNXukUDAqrCcYlTCUJIi1Ek
	dIhO8rzaP5IS1CgsPomflOH0KRBYQ9fjkqYIxlg==
X-Google-Smtp-Source: AGHT+IHCp3W+M7sJT1L+srRuX0Kp4s+0LXjvWsOz+ghi2I0EQRAFYWZCvKRhKOOaG7HRie6PeLlFXjjEC+YmGTT3AxE=
X-Received: by 2002:a05:6512:2342:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-54229562ab7mr813268e87.35.1734698240348; Fri, 20 Dec 2024
 04:37:20 -0800 (PST)
MIME-Version: 1.0
References: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com> <173395636298.1729195.9726718788225234944.git-patchwork-notify@kernel.org>
In-Reply-To: <173395636298.1729195.9726718788225234944.git-patchwork-notify@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:37:09 +0100
Message-ID: <CACRpkdZjda+ox80cycj6XY385H3=LeWps_W4uMdfStnf9oRkfw@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: k210: Undef K210_PC_DEFAULT
To: patchwork-bot+linux-riscv@kernel.org
Cc: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>, linux-riscv@lists.infradead.org, 
	dlemoal@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_043722_573658_338D6E2F 
X-CRM114-Status: UNSURE (   5.74  )
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

T24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMTE6MzLigK9QTSA8cGF0Y2h3b3JrLWJvdCtsaW51eC1y
aXNjdkBrZXJuZWwub3JnPiB3cm90ZToKCj4gVGhpcyBwYXRjaCB3YXMgYXBwbGllZCB0byByaXNj
di9saW51eC5naXQgKGZpeGVzKQo+IGJ5IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz46CgpObyBJIGRpZCBub3QuCgpJIGFwcGxpZWQgdG8gdG8gbXkgb3duIGdpdC4KCllv
dXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
