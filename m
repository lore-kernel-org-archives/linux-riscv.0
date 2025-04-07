Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F51C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6I//uwiJzbJDZayff88izfrrlhSmuRPSBO39HCc8vvY=; b=C+nuyXt2aDBO46
	gsMUF/+fZK1N5OR3v9+phfaE83QNolKPmCyWgwnyOdQuoteyJtnDo/QYz9Jt+79Gh8PgE1AykiTmx
	0/GR3sgzQpxVXjT/SN+x6GwY+qdBr2uaF4ioZlnGf0cWbV/b7yZVB0wqJPPj0K93W/ULMhETCDM3d
	tAN1vsGwrtZkEvFjamp1bLLfZ17ezi+gkrbyTln4e4P7CdWCHEevyaV8pzd9myFMQFGzX9jPzBYYd
	MEVY2tpfxQkG/k32A4jJo1kBeUcUvqhLOYrKQTLNgn+MRkvwqBucYbEv2bSxfrDoJCcX9lhTwdTzj
	dGqxXDP2J+LPkBqRsAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hS6-0000000Gv6B-1ZXH;
	Mon, 07 Apr 2025 08:03:30 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hJ3-0000000Gse6-4Bux
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 07:54:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3913b539aabso2258882f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744012448; x=1744617248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWxLTEfGg4dc1Gy9lnOUuyFlka68Uiuevn5CcOM/QrM=;
        b=15591xss0W4vPp9rWXJlwb549YiO44XRnNjULcFpNXrV0M0L3nEQ/SDBfAqCw+ksjr
         u2oCl19amU3bFNu+YmK/zNW7CI6GiiA4AindoUtqEDCU56uH4fq+/uskiqyFKSCpbsu5
         AjsWPx2N5vJ3pvPLhDMSBB/RFUymnRbuOeifTYiaAkGAVTaddONZhmW1Ifb6tcEHQY6J
         BknXnLUodcQc6fR+33lOdNSFmB8GlIdZk4MJZrl7Ffa0xTOZO5w8Ii1hLtPIXCeKJqLM
         dZSwpBCERBK6bFJbFGNeuxEngEMVdHP8H8e8qOEybUVGanGe2qATAaCsko7Po+UNrI2r
         hDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012448; x=1744617248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWxLTEfGg4dc1Gy9lnOUuyFlka68Uiuevn5CcOM/QrM=;
        b=ZmggktcHm+Bix7yKZM4J0H3jsQXRCb4MnHCIv2CWdC6DRz00NAarzVIHYohxK3VTfw
         0y04VABSbL5GwyZZvroUzWK1QHhmI6Jvn656nAj6XeTaV4z3J5n38SZRaDiyI9AgENTs
         lmT49R3+11jAg6vdPom1TJRJEELZP0Ear4ebuSZNHAZm8KZY4TWmXFTueGPBlSkY79li
         bkK5bdM5rV/GdsESukTu6ZBAWJDOReaKZ/W7yu15DgcE2BCARwehkRg8I51gCSWasdkp
         vZ8W2HCe7EYIolMscVcDwk2crNXE1EMAK3/b0Wtzlycp1NTwlv7ql1mqY1WoyU0pgRJ/
         FVVw==
X-Forwarded-Encrypted: i=1; AJvYcCX9NruTd4l3f4FTQKknLGXATGGwzv4NqSN5vZs+nSSccRrq9cdyJrTElMZAq/sW6z8TZ1SbWTJm3GR2TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMuWpWW8v01/gEyAjai1gVAPOxMwuYPHihCOmAz3y83giGWWT4
	hmjAu9DXAGZgOVW40xTJjP/GK42FkJbQZYkypD5k+DTALf/YVtRYZvaoTR93YUE=
X-Gm-Gg: ASbGncv94GCrCMyGaq81N32Ab0+JzbFpwZ2cgQJMDI2dQK0dlhvQemswyIyTxKWLDIB
	dVgCAat2DZdmVRE3QXGEqvZB4p7tz4i4XENoMDS02mzzmvaU2rAq3MjOlmQr/izuynnHueeuwtE
	0SNa7XLNGwJxf4XkXKk4+Gz3IZb3IPSUrPwNBv79yE8vjp5oIXIDD5E+NuPErWlIOOoJcJXu6DS
	06qyXpmMVapy3FsQNZrmDYqZbfuEUZOubzp7MnwK2Qd9ElPI9xMvfirLlhGxBmoQ0PVaeoERJT3
	7FXyMtvgxXfCNmdmarhyQ7OKeonT9G7BG19uP5W0XzJv
X-Google-Smtp-Source: AGHT+IHuTVRTtHbtmx6FjkvlzIbJVnydF8KMECgaQSarUJ94LjdvsgdrKIpoRqGzKFTua17ynl8uDg==
X-Received: by 2002:a5d:5983:0:b0:399:6dc0:f15b with SMTP id ffacd0b85a97d-39cba93cd69mr8684049f8f.48.1744012448217;
        Mon, 07 Apr 2025 00:54:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a9bcfsm11494514f8f.33.2025.04.07.00.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:54:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS example
Date: Mon,  7 Apr 2025 09:54:05 +0200
Message-ID: <174401244312.28249.6012698269615129555.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_005410_040547_111E9B2C 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 24 Mar 2025 13:53:26 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Correct indentation and style in DTS example
      commit: f4271a891dca46ecf6813273ed63e502862f45da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
