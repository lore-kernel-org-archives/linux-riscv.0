Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE49D2ED0E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 03:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOa9x2zf7MEJTdESTgfV9uBl6WJcBXCWJdIVu8UNZiE=; b=Arcsf57j/6i2Ru
	zjJTuX7G3xRtYxWJ70iM8D4m9M+GsweqdclHXEYk6WRn5HBD0xMA4wqGegtuVEWu9xHaezubQGw//
	nMrNCGAiIB+WK9PWIvX5YzGg06x6lSMrfr1oRlOCBlClQqPMT/f9ChNdorcKbDjZOdTC7Vn7wg4yL
	tbV8ge/bprxX8n6kpefDw+zuqLz/i60FeF/R6H936/+iq07PcCnqwqt1QenJbBBaGlhuMKWeDfXTJ
	rlulbQbgeBAhgsoew9UyByiQxykomPduicqs5r4GrhcxNZwLseWsyjLviWmQ0AyCj8lszlwPMpLgd
	OoeUSwmTRPaqXGlpXtQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi23z-000000036wv-1N1Y;
	Tue, 20 Jan 2026 03:05:53 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi23w-000000036wb-0k2V
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 03:05:49 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-94130b88642so3051387241.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 19:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768878346; x=1769483146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv5G6VMcszifsvErGVwkIh6g0xPeD3R1+Dyj40SWmEo=;
        b=Umq+kzrqNXhaZ9Y2oM4nAnsV2omzeBkgdL8hnU779M0jjuO3vYZ7dgkvSzpy9sqeMY
         TVg8W9slE18fqW+7wZZae0dvn+ig0KOmidjg8/O3T4GmxtMR1EAKlX1nbRU5J4XH+mhz
         2xRYdsR9k3LCJGWxzSyjSoaIuQpJHSHXxHQj91xggiUI3AeFbQfXA1/TxX9hiDxRLF2e
         K9albWBCQOnVm/ZrARGw3vJdnbuZbL1xDAjDHaWL3ekKgExt7z+R3VcGCvRq3rVTT82k
         J77Qfu8GqeRkiwySV9dOniRgHZPMzDw2bL3DX16FXiWgTB4nOFAz07OHwxpgY4P1yG3n
         p6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768878346; x=1769483146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gv5G6VMcszifsvErGVwkIh6g0xPeD3R1+Dyj40SWmEo=;
        b=JIe59HH7Ydaf7cnd/6cw41VI3pNSzGs1hp48HEZy8/E/Kz550ayNykPfiyImndjRXD
         kD4aHDpXnEAE1ojQ7FwxSbh1fR8dlZ9YzOUDCi34jwPU4DLpxXABP8HXJiJaJ6s7/uuX
         a0ug611oL9hSgLWaP4Z3u0wuKv/rjdw+HkwxmIZQRumXqlfHftujpi8H3yyshetQ6w1c
         AuIeIZDf3X9wkmLV4Cg/B3xnp77LvpAwr9bAkVsmaWufcOKrougtPjTNAARZRjQkpwE8
         lWG5nNdCkvrHVu+RuJBa3+5I6cndHuv/piWDnHYduqghcxiRt7gNqfdK5RJ98qGfiGRP
         IEWA==
X-Forwarded-Encrypted: i=1; AJvYcCXRLcRrQEXpOpN49g/SUjV/SQfwcmMow7ut1lDnr92pJ0ACNvi7NyiqS+LN8E7lNaY4XfH222iZQgDs9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiHxUipFaNkN5/zEFDrc7PdI+sZ4r3eAVzjY9KRNYxadVkYxKw
	eIpXgI8uMJuosVa2vF07F96EdNBOq19+eW0Y4vVugFjgWe5OX5IOIRw5vbups8z2
X-Gm-Gg: AZuq6aLbmdLtd7sAS5kO/UYRsOz3hTuz5zFWD1ghXdGVN8CsAx+gAHSWgVtGBok6grs
	3f/m3ZEO7qXqHLXogAWNPT3eQbEEG2zvF2p1XqUlT8XoliM5fszW1/l+cQDnC/1KMnQdIfjulxX
	mkg9mfopyNNPaBulUv3F0LfSF7i2qtFR+USAdI/0QzuEJsPlDToGF5WGbqGR7iGcJDPAO3gETFW
	+SP+alITZrXQGrsHEWIa5P9XJl845i8v9uZLU5qacY/KaGU89YpmaRuxre7sCcplk0t0Rm/WIQE
	Csoc4G55r4pV7Gf9uHOdRBIQWEXoDFJ3dJM4NcykMa6hPlGNSHBqzAxvW8AzsGAlz2RnPpLop3P
	mMsxdmXibdg0GgJNvFLip2cFQReG0PAgL9FoeqQckzw4FqpW8fpenBb7BdAG7N0YGm3LsPYohuB
	PH8NCmNdglwA==
X-Received: by 2002:a05:7301:fa12:b0:2b1:7910:b0f9 with SMTP id 5a478bee46e88-2b6fd7c5909mr186113eec.42.1768871788943;
        Mon, 19 Jan 2026 17:16:28 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3503a30sm16787462eec.13.2026.01.19.17.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:16:28 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
Date: Tue, 20 Jan 2026 09:16:15 +0800
Message-ID: <176887176535.427065.12899087990982068409.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113023828.790136-1-inochiama@gmail.com>
References: <20260113023828.790136-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_190548_246014_56D605FE 
X-CRM114-Status: UNSURE (   8.80  )
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

On Tue, 13 Jan 2026 10:38:26 +0800, Inochi Amaoto wrote:
> As we have a separate CPU dtsi file, move the PLIC and CLINT
> node to the CPU dtsi file. This will make the sg2042.dtsi force
> peripheral devices, and make the CPU dtsi force CPU related
> devices.
> 
> 

Applied to dt/riscv, thanks!

[1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
      https://github.com/sophgo/linux/commit/5e6836e735f9c9c5e8e1d1dce02dfed5fe566e8f
[2/2] riscv: dts: sophgo: fix the node order of SG2042 peripheral
      https://github.com/sophgo/linux/commit/ebb87dd74c34a76e1e93041e9329cf9269be35ed

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
