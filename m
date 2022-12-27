Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA43C10F1B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2J7+c4CDydt7uPl62iAA1XzvvcEdiRY/b8g+uU9cj0=; b=rwClZXLsQJ9TLo
	kP3/7ZogN+1UeZZ/K/5Jc0/80QpTgJ0LogEPAy+BrK6PqtXaXc7PxXKILhGbju9lPnW+ilt8tMWY7
	yflGGMA2K1hTURn1MK9K05IrHHsf/T5HICnh1LDpmqNnWksOTrTP6nuxkd0T02GRn670a4THEwe0y
	LJlIDV2m21TVFh/tVrGryZ/ZgqMrDpfEQvWdweOdLlotL76vXcJbmP6zKP4EXAG/pcu/SL39iA3u/
	qLPmd8WqLavmqj7U6ZZSWPgLWYsLk161iiqd0vMLTaYaDN7qcnN4J7DzR10RgZZYlDH9qzvtYj+Qs
	mnPIokYtdfVSA0TuL3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA4qr-00B8h3-0K; Tue, 27 Dec 2022 07:58:21 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA4qb-00B8YI-PM
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 07:58:07 +0000
Received: by mail-lj1-x236.google.com with SMTP id u12so9338175ljj.11
        for <linux-riscv@lists.infradead.org>; Mon, 26 Dec 2022 23:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+G/BwEPrVr7kfmXq62oK9q5XBGcDyHuv32x7f8Pzz0=;
        b=TdMOqT/WbdxTC0C3myt7u6Vzj07cRGNtTV5MhtkEDtv8Vv28iOoZrFpR4Ih9GGlxnb
         UNtlb9kRgKh27VqVsnrtzE+9BofIPAZfE9wX4dLbrgFQkixGsBfFt2pPG6H/uLEJLzMI
         b1uJXEMX9fpQL5jtX+jI7UnCgoNElREap3EecJroFBpa9gAK3s2Q1Yf7WxJAot/AmiKy
         JdOj73K5I8n5aohgk1UHH6qsWdxQ1VU933YJyq4jbH8PNhXAwze35Nmm/M/QMB6iKOSv
         mVWqKelmPaac2E1mQd2FzTK0JPlfllKUN1jGBZLW03l1l0hUr3LpkdtnIea4hSJihCpm
         /t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+G/BwEPrVr7kfmXq62oK9q5XBGcDyHuv32x7f8Pzz0=;
        b=aJLFVG1cXwNeqHuPUa2RY1c300W3yMb4tzrKEBIlrTQQHhFIa7U1Uw+W8hB4Yo9Iqk
         Iqu0GoLgQnKTyBhME4ybHAJ4/1TyaiQIwAZUMLJ1J7Hxx859puRU7y642lQJ7c2Vgm2/
         TXmq/a++6bD2kzsBMJCEYzAt41SXRQTIowl9GpajTYFc+KQ1xhGRlcRZ/GyL6lrUUTjb
         7Iz9iy5gRIY1nbLILzNykWGHS2QHNgtumGt/r+xr0Is4lgq/YQRGgZP7Q/YSYyf1YcRS
         vBHKoOLdHbSTZqskA+cQsgaPISQZgTPZ8UA/yCqxyYfDoe4Usp/yHjTbQ9lYBfTu0hn0
         SoDg==
X-Gm-Message-State: AFqh2koE0OD7RmQCYDVfNG8AkbVEVtVjO57h/KyKS33ZW7eLalqCfbvV
	W9LjtBbTZIq87SylAuYuuN7S2w==
X-Google-Smtp-Source: AMrXdXuHCaNuAEieKb4FdTEY/qPfC0zFtnG1so9DeugSmsD70B2SP0LyMVbYvK/Oo5RCW08JI0AhKA==
X-Received: by 2002:a05:651c:510:b0:27f:bc6c:c4f4 with SMTP id o16-20020a05651c051000b0027fbc6cc4f4mr2144837ljp.9.1672127883564;
        Mon, 26 Dec 2022 23:58:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r26-20020a2e80da000000b0027fbc128189sm677945ljg.131.2022.12.26.23.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 23:58:03 -0800 (PST)
Message-ID: <7cc1078e-744a-c68f-98d2-6c68d2784df2@linaro.org>
Date: Tue, 27 Dec 2022 08:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/7] Basic device tree support for StarFive JH7110
 RISC-V SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <Y6on34WC2u3PSBHl@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y6on34WC2u3PSBHl@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_235805_961513_055B2123 
X-CRM114-Status: UNSURE (   8.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 27/12/2022 00:01, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 09:12:40AM +0800, Hal Feng wrote:
> The DT is waiting for the clock/reset & pinctrl binding headers anyway,

Which were sent with build warnings/errors...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
