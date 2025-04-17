Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4EDC369C2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLzYhcvLuVnoeiG01U3d0IHtrAkR/JnntlzNO58caDo=; b=hXNi26OeUQ9xTS
	/ok0PyvIkCadWaS5zbKXKLWxnjLrbCzLjDHif7GNclL4yuowTV4KT6gGEhFlKGufIs9PluYz4fl7g
	0moOkbtOQFE10m7eUdkT4Kz5PwEE1RErC8Ntv944BNs2tjCi60gJP2CByCEspHIaup3wUAzXOIc9x
	6jhW9mImEv10upZ7LVPerJ4cA775r+jzQfS6a1ldaUVURmRvJI5tkGjxrvKTx1/f3hgT8W75bTwZL
	gIPsIcEKmSb5N8NnjkFekkOvJaR/SztnVz5fN+TlWZCp8/2TuTtO9d3GmwfAfajOiNhsY3VDNYcCp
	8v3REznIB7qvSCa3p6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ObT-0000000D1hw-42mh;
	Thu, 17 Apr 2025 12:44:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OST-0000000Cyio-0kB3
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:35:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso4630835e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744893307; x=1745498107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTuj486eMBPlCuVzE5Ghwv5ENmZwB8uFg3Tiow35Sbg=;
        b=xqS/AaojW/kytKQ7Im13HZpSY7u7XRtq50Cu1Q5e0K3qFPH+b8k62JBHniRMAlmY66
         ZnseXwNgBYNH6SzGVi9exX16nHcLS4/tMW+zM42VxbOUjRsAVi/Lx1DMD8lSNv6LfCL2
         2pe6HJCLDqBt07yKFzUYeyxOAKtJS+xklfmvFxCzQY1x6kYc/2Q2VJFxr8PZbgubGnbB
         rwtra0xmXCcWaLmrhkUX0gdCz4PUw5C3O7jWtSUY443EPny/x3xWUCPEorM+ETMxXnAV
         5jycoenNM42/KmvOkAVRsYrYEIJfr3f2+cz2hn0DZUGgARpz/d5s0NfTRKEGQOYcC2b2
         ItIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893307; x=1745498107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTuj486eMBPlCuVzE5Ghwv5ENmZwB8uFg3Tiow35Sbg=;
        b=Eli9Hbf4s1P+S6W3dGs7sAsGJ4rzLu8wXn+xBTUtiKvd7q3walayGfO93ufbRw/o+U
         ws0FyfaavBXcj2sEd+m/awNMsZBvyn/QVMCQ9WBlYhCPtNpcBU0KjFVsnT0VfkaJWZ5I
         TKVAiCNbhSWeUKyS56PJYPdkxzFphUUYiRVLhxLSfyxOq1hRgEmrhDNgNcWHm/ioRXNI
         1j4GuEDCrDkSnSxOJttOMoilFNbwONBH/fLBd9SC4ntF2uZCYwHZyRO3gVXMgC05fm8y
         z84xuC1LqT76CNXB/fsDgXf2OFRwgiNFKGaxPhXV3X7k6JIx4iMUwVx4iaW1pcV23+nI
         NX9A==
X-Forwarded-Encrypted: i=1; AJvYcCXRwVUJ9Qdq9cZbCCBIYGnfeSDcgcOURyJg/yJlBCJEznR8jnwaDabDzOpBs22ZeBRJCdudza8rXrDrDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzO8wadIbRO8c8JY0nRQG228fXw7MmP/rFqnI00TvbUj8+VKBv6
	IhMBYLzwUDFVh31kSKjdEs/OQlE2CCmb3WETW3UYfYzwKgyQLwkXatL/8TU+DQo=
X-Gm-Gg: ASbGnctP3Ng7BY9fYB3LdLK0/WfQqw27o0BX7akpwvQZFoM7z/sio8lEZtycmw19JI3
	E8yN1NGBcs6kq8D9HvsVgB2HrtB8OX0JHm49pzGqGTlTmkxI6re5ebY/Obhx3nY96ooA95R0fUd
	RLMLp4faTRi7IPxXNtuqYXvM4uLGOrhGFkzoqtl3AUtDJ0sUS3XTIVBHgjZNzX8impe2ldC/PY3
	cjYBMGCSmcrbghV/z05YnBEWewqXIs04LZWDQ5hclomJ0Hn/5qKGYwpn5WO6ERp4Jsrp2aefnyu
	LzFm354ym5pshtVcFSoZ7krLknX0YeRkhBOsPG0ux8mlHA8Pe6U=
X-Google-Smtp-Source: AGHT+IHsx+KpPXNauX7YJ1CpF7I0pEn6OThh/kiz1Tij3RGxo6jg5fZyTZOC2u0bvjB+NaEYetVrHQ==
X-Received: by 2002:a05:6000:402b:b0:38f:3a89:fdb5 with SMTP id ffacd0b85a97d-39ee5b13247mr5200859f8f.11.1744893307325;
        Thu, 17 Apr 2025 05:35:07 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9b49:d51a:4244:693c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440666705c5sm14418765e9.14.2025.04.17.05.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:35:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: (subset) [PATCH v8 0/5] riscv: spacemit: add gpio support for K1 SoC
Date: Thu, 17 Apr 2025 14:35:05 +0200
Message-ID: <174489329731.7849.17910336598453828998.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_053509_226768_27CCBC7B 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Sat, 12 Apr 2025 07:31:27 +0800, Yixun Lan wrote:
> The gpio controller of K1 support basic GPIO functions,
> which capable of enabling as input, output. It can also be used
> as GPIO interrupt which able to detect rising edge, falling edge,
> or both. There are four GPIO ports, each consisting of 32 pins and
> has indepedent register sets, while still sharing IRQ line and clocks.
> The GPIO controller request the two clock sources from APBC block.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: gpio: spacemit: add support for K1 SoC
      https://git.kernel.org/brgl/linux/c/378ce04c79d14c730fcee6db9f3076da4078b65f
[2/5] gpio: spacemit: add support for K1 SoC
      https://git.kernel.org/brgl/linux/c/6149376c9ad1777aa4214e13d844f12f88e22dea

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
