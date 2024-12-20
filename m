Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D699FE7718A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 12:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZgptNZUtpG0uVjWA6x5QjrYQetIrlAtdBBKoEoNp2g=; b=OQgdhwNkEhqHRg
	lShH1wDqborUL+DMNC/TBYf1HpY7nlWKEaVFpo/3pVaEXW5sk4n0NGWgsQrbd0G1nBcwp3QXsXVPH
	bg1Lw3q4AJ+r2aXWo48W1FB0MTXuTORx0Q77KAJnW5sheAe/IoektdgIZUG52XmC4l0uMziIU0Ck8
	ORh4LaOmrXUeUksZG7yH+51K4xymP3YzKI2uOoAbeNFtkK8E+mS79XCAPsOtPmTppEWmHd2cJbZTN
	I3baRQt9/me7vII23/ZKanMKNaSAfMmDudQsuaVnwNpJVLR+f3AUJBw8z+Rwbst4j11+jDPvwZgw5
	tV5j87+Rw0EyKZjftbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcFS-00000004u7p-0d4M;
	Fri, 20 Dec 2024 12:36:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcFP-00000004u71-1TJt
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 12:36:52 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54021daa6cbso1932297e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698209; x=1735303009; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8f9vgMRLuM9ELQ2kmp4Lw8evZk2VRstYiik4Pb7wiU=;
        b=fSK33wqI9A3Sj4jr11r3rjlLMnvpMOFi/MvyK8Ikz+e4TsAwXqSxFv6FAR9DwbeLT2
         y/3f3YYurNwaRIslGSaY9vZVFhIw70mkv/o4FBjj6wVDrfu/jJ8dqluPIecADUWYZNTA
         RhUarKZshdrZ/yy0Aw0zOVYVxeLfDFMfnZ453RbQxZO0Hs6454hDxQYEq3jg2opyguwM
         TisZVWRu+pSj63O44R7GqRKux0aoWYL0jnMVeDr8xTOiqy/5sYwyIeo2sXqxKK/tnEe+
         bkXveVCJmaGVoZR/txX5WRByfVHfgT5tl0xA8CJDLKO0zWNv/LqdJyoHpR9FPNbndtyq
         5jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698209; x=1735303009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8f9vgMRLuM9ELQ2kmp4Lw8evZk2VRstYiik4Pb7wiU=;
        b=sfgAetWqkTErXuFyBRZJw0poOnHC4fk4EHuAHYGf07TiRW4fkCQfWtcD5zIfKIYRQb
         8c/GIfUmRgU1JlUHh5SCYfb8y+ZxG8enmcL75LQaPztme1OSWayKClZPGRD2RJ5Pxw4E
         Oe+4l3KCE4IuK0lUzr60kfah3mXh/32z6dwgPMKIp4Je9ftphQaofQzvIotsa/wo8njk
         AYwsHCmmMJliH7v0iUaokGsg41oKeb7Z0jWK/A13sOXfOv5wyEAudKWJZ2wGEQhWLbDQ
         onsvjtjHztNmSTzfAY+3hy8QHyeWfvAa6MW9I4q86Dqb4pra8CWGB3qpbvDnMqXmX0FB
         KrJw==
X-Forwarded-Encrypted: i=1; AJvYcCWx7pmE07VZkkfOjwnse7h/hzpR4+nQl5m+zCtQaY4FZUI35FjGO1TuYhA7VeyzdyXBgNWug5QRThFDTA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy6pjY3SKoHiZdWBNjkAxXqLxxdRmLiBROQQ+e0yd2p/fAu+h+
	b5fjVYYl5+58dEvkwWNwfoLfGo9CGEcepp+VCHexUexjuebh+ferVHVdnyNIOlrSE5fA83pfq3V
	uwH38YehjKyXT/B3jBjp2Wh5Z8WJlPH+tGJPSBA==
X-Gm-Gg: ASbGnctb2fsAeDP8Gcdaolak7ea/zhL2gcY03kF3iaudEb6a9mGW0NlZThErA8gmXLX
	8WYvPyFZbPoqrKl2aUueJtdM87JD+hUGRyFIHvw==
X-Google-Smtp-Source: AGHT+IHrkqAX16ZypHFJngeb2Vh6RA26L7zYXfaVvPrwatjyxWsTOnLjJHT7Z28yQE1I26+KbzlTkeScYITmVM3w1bc=
X-Received: by 2002:a05:6512:3e22:b0:540:255d:42d7 with SMTP id
 2adb3069b0e04-54229533641mr832646e87.23.1734698208691; Fri, 20 Dec 2024
 04:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com> <173395636174.1729195.16129052745847104611.git-patchwork-notify@kernel.org>
In-Reply-To: <173395636174.1729195.16129052745847104611.git-patchwork-notify@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:36:37 +0100
Message-ID: <CACRpkdYcY2hgTzfPC1F3sdCPXvdrX_nQt0iWdLtGLBS3TTXopg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: k210: Modify the wrong "#undef"
To: patchwork-bot+linux-riscv@kernel.org
Cc: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>, linux-riscv@lists.infradead.org, 
	dlemoal@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_043651_407727_12591E80 
X-CRM114-Status: UNSURE (   5.67  )
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
YXJvLm9yZz46CgpObyBJIGRpZCBub3QuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
