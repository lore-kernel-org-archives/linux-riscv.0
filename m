Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E92606B93C
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eKO28kzK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V89I1NFh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A+UiHAnURBOwJ8AR+zyJo89SqPvAtrDhI643onWtB0Q=; b=eKO28kzKBVxCfYV4a3QJvqzCPX
	MAz+JgoDle26ip1lCRsDWa7QEzxoAgnrjAEbkHRKW1PxZRBCnzCoD51ooSikq60BtjnU/eSlsQU9Y
	IFSC9MjeTjDJFWYY7G55wy95D12ylPYAQF3yHi2Vxl1xnoUi6gBDFaYlN3v/Q3FKdizbqfV96EcDh
	Snxf1c0Q/HtBy51dxqe4y29teewpHINufuEo05WurEX/SF2674LGO4YxWo6pI93C7MLRxG1V4b7no
	QUkuUFhfldtSrgVgAws5e7dhLLqi7ASt6GgWyoaXKbgboDy5SV/p62DY59lhelSieRak3XCami9VE
	NE+sdlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNswQ-0000000GmbG-04pL;
	Mon, 02 Nov 2026 14:23:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNswM-0000000GmXc-2WIV
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 14:23:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e9d7791b00so24156675ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629393; x=1794234193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=V89I1NFhaPChoPwA84e+retgyflIcH9R+pQ62AmXx1uuSQIMpgPyUJeRJrGm8j4JKp
         tjkkAAJnMAr5JFWUhJX5pF/PJKEoBqeuYgHG8zxvn5L1m8LJ+89GkUeUz0/5xtAiUQMe
         3sv3MBL2agA0l29prcmVdgIIkgm2UiUTTb8B+k4xoMBax85d93C/WJ3mpUNtkRPbXpfG
         dD+wu8fFxLoR/wcgGlv89lnYH7RPiMNAFglNVoe6T8nnPFy16729ZV7UFgyaud5P2ZMm
         XSDFZ+Jus6LTovrbzNuUN/sky12QTFrX7ev0y8qPg+x/nWObqwhmrn/mN3of4nUcZqdh
         S2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629393; x=1794234193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=CdwJOvHOj/9Pm+e2Nnhs/Og/3SeU2mNyHSrJAe8FzyvL5TbBBg679sH7JKsF04PJlJ
         OJEwwtkdpEz0i1PGV64wZerMOUdFPFElRAm2aw3AAVN8kQ1tTU689kLnpHKDwozC3vh9
         duS/EEjTopRa2Px8owGlHADPSomj75J3wev+y4ByyNc3bA3I27KK6uCo6V1UjZNCBJB5
         DbEruIa3A7xv9NRAbCe/5uBchkAXK/D2Cq4h66Lf4JzciNTO7vUhGvTKLhXtDU7iKQJ+
         z1Py2sKJojZpxQ4BYblcTD+ZV3C8QaXT9QPOIXkDwKUiA9ft2LqjvL7gNCStWqXw5A4z
         Wr5g==
X-Forwarded-Encrypted: i=1; AKwUvBwvcLwj0amfQnXwa8EjSPq/mx4Qf34Wu6IKdj/GMzC1F+8G0ROIB/NX/1sYkCHUxVR1vEjifXSmxvpyqw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9vim76SUUzxhQgSUNlGSoD6yTNFSBxmbo7Y6yuwb2OLyxhm/+u
	vPfJ7q2jLluNAjKKGSiyHe5vVBiauIY9piBj3ENtCoUZut+YByP5xRUB
X-Gm-Gg: AYBFou3MxHEcVnBWmaXhfkmpb1Kg2SXGfgLQRq0jm9ItkmnAllVhLQHOaqsnZYBrfhh
	upGkOdrlWHP7n9bhIa/rX4cRJKjWI3iLo9o0Sx+s9jK0OfreF4Lz7ZYT2mHI0ZhRJDwo1GK6TS7
	swvuig4T3WuYeTYDd6tN+tKVSfoZSabIZihetRxF0VoYUXoAnPauQIkV97ZPShUdXLnZDXJCWDD
	UYCwho6nBEuycqgQPiCzOXDDmCD17J199JmB/F19L3TC6/0WGpthMHGA5fQzLf/Adtqf0OFZKeP
	CarqdFw69dphdyfOzdjftlohNzVwacxRvkhx8YB7mATXPnA2G85HZ3Re5bpTUd2H3YCSpjRVEe8
	16J+HL/8Wt40C7LebgLgdqQ+ghbk0gqldpDE6k1qRTl7LQEt31e5y0a5dOEQwxtO2hN7R11Y2sd
	DbyVG4wIekB4VxOUy22YkT4QLvM5rh3CahMlkG/CH6ewUVxxViYHgqks4KwGEXVkuQ0htMrq3Hv
	qk28JpmRCo4CY4pwVTF6njA/x3sj2cJSMHUYn0KefwvRMdD+O3M7y8B3bEJ1hcOO00QCcZkeV/f
	MI53iIJKxrayw+DEy/NczeaZQXkZFxNeSA1ZKcw7UdiBhvG6hwNm5nTlvw==
X-Received: by 2002:a17:902:f70c:b0:2e9:5829:9b3b with SMTP id d9443c01a7336-2eb364b55b9mr86204895ad.35.1793629392936;
        Mon, 02 Nov 2026 06:23:12 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392486d5sm29700245ad.29.2026.11.02.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:23:10 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Radu Rendec <radu@rendec.net>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH 17/18] riscv: defconfig: enable A210 support
Date: Mon,  2 Nov 2026 22:22:53 +0800
Message-ID: <20261102142300.3784622-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-concrete-rebound-593001f1ac18@spud>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_062314_643972_DD9093AD 
X-CRM114-Status: GOOD (  16.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 19:50:51 +0100 Conor Dooley <conor@kernel.org> wrote:

> On Thu, Oct 22, 2026 at 03:53:37AM +0800, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Enable A210 platform drivers and reserve ten 8250 UART ports.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/configs/defconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 04ae305d5511..b9b3bca12089 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
> >  CONFIG_ARCH_SUNXI=y
> >  CONFIG_ARCH_TENSTORRENT=y
> >  CONFIG_ARCH_THEAD=y
> > +CONFIG_ARCH_ZHIHE=y
> >  CONFIG_ARCH_ULTRARISC=y
> >  CONFIG_ARCH_VIRT=y
> >  CONFIG_ARCH_CANAAN=y
> > @@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=y
> >  CONFIG_KEYBOARD_SUN4I_LRADC=m
> >  CONFIG_SERIAL_8250=y
> >  CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_8250_NR_UARTS=10
> > +CONFIG_SERIAL_8250_RUNTIME_UARTS=10
> 
> Why are these options needed?

The A210 has 10 UARTs and the TH1520 has 6. With the default of 4,
UARTs beyond the 4th don't get a fixed ttyS index and end up in
whatever slot is free. Raising both to 10 keeps the index stable.

> 
> >  CONFIG_SERIAL_8250_DW=y
> >  CONFIG_SERIAL_OF_PLATFORM=y
> >  CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> > @@ -167,6 +170,7 @@ CONFIG_SPI_PL022=m
> >  CONFIG_SPI_SIFIVE=y
> >  CONFIG_SPI_SUN6I=y
> >  # CONFIG_PTP_1588_CLOCK is not set
> > +CONFIG_PINCTRL_A210=y
> >  CONFIG_PINCTRL_TH1520=y
> >  CONFIG_PINCTRL_SOPHGO_CV1800B=y
> >  CONFIG_PINCTRL_SOPHGO_CV1812H=y
> > 
> > -- 
> > 2.55.0
> > 
> > 
> 

Sent using hkml (https://github.com/sjp38/hackermail)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
