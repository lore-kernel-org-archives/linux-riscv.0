Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6554C606A331
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fNmJXavb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QmnFdQbw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RMJZ5olS4qaZ5tJRuD96R4tK+DMLMhNN+QhN5iTtmUs=; b=fNmJXavb8NSbrVeUCCs747Go/V
	+0YZWpi4r/91P/JPkKThhiU7K2i/bUVrOA2UakFI3OdQEm7cQbPLq53SqYMKOUfHvQPMGyAsv88F+
	iiVi5PgEcvX+TOZQwNJMAZc4DP4Ua5NonV8sNpP4w09cRwYRxzhP4rRSQ93Spfmf1Z06fcfJb2WrZ
	YKpBNNvm3+nVQQ0VsU7lIyKCm0Dbx4gFICQWVXGnIZ5cd+NW6cs2JBHmlBuXauJLy5nDGUF+3AmDb
	BTlxdB6cKewumeENBR5yt150CDLP006XYH4Eskd7WsGm8V4jSuzPbeoY+95/5JXaV16NMPQsWNGy2
	2Mvha9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIkm-00000005lru-1s83;
	Tue, 17 Nov 2026 12:57:40 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIki-00000005lrE-3jgb
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:57:38 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-36dbde64409so6800378eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 04:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920255; x=1795525055; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwQPpTaL2c/wj1OEDa9qNdi880oheLkZqVlpuujln18=;
        b=QmnFdQbw/MzL1i5ojeJY9fuHJJlpGWo1G8o+FmYkkCMXGj0AtOT3JFQYZLPHwusyqa
         dbVaMyepUyf9hwsGMw2OYt6ZSRlbJYe1OOZI+WtZETk4Uzbm2RlTpAQ7nAzONjkWcDNi
         nZBy2sb3N9oIQbWCNDYPyahPFRe6nVtFOWhG27JHU0R36VXYULSVuB1QC1YRvrMLWdK7
         F2ABrOIZ0FBaEyA6t6zuO1n7D6AXXDbAEzd3NvVHWSgT+O71x1MxhbvH2R26ICf6OAxY
         LVwQLwRgRsh5Mej3JjxDiADuNXea0fE6pVNRpkFdpZDf66sPixLcjpJvacAPY7BzEPdT
         wkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920255; x=1795525055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwQPpTaL2c/wj1OEDa9qNdi880oheLkZqVlpuujln18=;
        b=qQ2bgpm46+MkgB5XWj2IsEv6eXyh8zUMxtHRt0JrZVzWSql69YfPd+HsydlRLzGK+v
         h9U5V9dpzVJjO06bVkge+nSgJlnNIOV3i6e13KHYqSCxNvJPcCXhxoAD0CGdmRtAaMBi
         7O0VUuipkGildoCynLSRfOGBrMNaXFmW4YUX2O1Pb4huXMjfFVpqIDZ3TTUcMGI1mCEq
         ukdw3y6aTpswYoCwAolmYS4Bbp9O6iAMuVgkQf0a0U79yfjdDrzfWcpxAzvWvTEPoPZP
         OdQ1p02kpTSPoi0xwaUe5vWfnNaeSVEsZzeLGfMKbxYA9+TUiuJrEKaMYAkIhME9Uwhm
         0D3g==
X-Forwarded-Encrypted: i=1; AL+hErEGuk+Kde3G0NtCSXxjK9r8zDCf0k1gbdkvC46nAmdT+K/EzYEY41ggfdNldnfyWDc/lnTay63U+Y5Dxg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9EaVmiBiNE0BGnYB48IcJojPNU51ioqg+hvEOs8obSxcsZHBG+
	GkA608oDd9ZEwW2cSWW/VPg/ozgeYe1um+Iwtze7ejrKEBsugitUtpKbhW4Knx0ueo2pp2lj4n1
	OqtYP
X-Gm-Gg: AZFdTZco8LxDtFhtdduti/dtCWccuStt9cjR0lXWJ6bEBp7jKCfPbkH9K8Wv7SiRf1Q
	TX0hKdxk/3K5DEMzKZw7I5MYwj/rOyxGILlmg5gmkPdpswyseuMNtZILV9h3R9Sk5CY3klJi0hh
	eJG/EdKTMtC68ClT2yxN6OO1MW2aqjA44gdbgzqHLO2mdniTUT8L3l1iVESli58hH7TsjstvNbG
	Uh0EIvPtHKb3egtn5SY2+ZALZeZvFlKdie/WSJKZERSWYL7KrF+rJPDV9xyCY+K3EtT3npr6WQ9
	/rthsKNkQtMAs6eUE/gEuO7prBS4r6LYfd1b1/W++2L2dTyAG0GB04y/ejb+7ZTfpJ0qAtN98Q/
	RYiH8loZJXQFmYxi5kZOY0yNs80nT+CV3R4WG1GvbZCxlyJQAFF64ShNbbMBpvJqhnPvn3YMfA6
	JtGxLCpb8yXsA7I6lyz/iYK4pBaUHWC6HcNVZvh5JlSyVGH3+i7eyaY/j+L9bNU9dxk0K94cAtF
	mv1IgVq6oobutArfCn0Olk311VBVgT21GMYspOGVwgRuTkDevLypZrsDuBlkJ/yegnZ3jefWKvQ
	kl0GJR3gxMiokOQ0YHUmRG9cfQgH1KYU/tVxB8oHwN9mVTYYOdnK6VFOcoyxRkk2xXbP
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr12249938eec.32.1794920255453;
        Tue, 17 Nov 2026 04:57:35 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:34 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Subject: [PATCH 0/3] Add PWM support for the Sophgo CV1800B
Date: Tue, 17 Nov 2026 09:57:12 -0300
Message-Id: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3dzMnOwy3ZTSfN2C8lxdE6O0pGQjiyQDM0tjJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAKwV+flxAAAA
X-Change-ID: 20261104-milkv-duo-pwm-42fbc28b0693
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045737_220475_1060C5F4 
X-CRM114-Status: GOOD (  14.78  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the PWM controller of the Sophgo CV1800B,
the SoC used on the Milk-V Duo. The same block is also found on the
CV181x and SG200x, which share cv180x.dtsi.

The CV1800B has four PWM controller instances at 0x03060000, 0x03061000,
0x03062000 and 0x03063000, each with four channels, for 16 outputs in
total. The register layout is derived from the controller already
supported by drivers/pwm/pwm-sophgo-sg2042.c, so instead of adding a
separate driver the new SoC is handled by a new chip_data variant in that
driver, as suggested during the review of the previous submissions [1].

Compared to the SG2044, the CV1800B differs in these points:

 - PERIOD and HLPERIOD are 30 bits wide and PERIOD must be strictly
   greater than HLPERIOD. A 100% duty cycle is therefore not
   representable, and the period must be at least two input clock cycles.
 - POLARITY has the opposite meaning: with bit 0, HLPERIOD counts the low
   part of the period and the pin idles low; with bit 1, HLPERIOD counts
   the high part and the pin idles high.
 - A POLARITY change takes effect immediately, even while the channel is
   running, and does not need PWMUPDATE.
 - HLPERIOD/PERIOD written while the channel is running are only latched
   on a 0 -> 1 transition of PWMUPDATE. Toggling PWMSTART must not be used
   for that, as it restarts the counter.
 - When the counter is stopped the pin is parked at the level selected by
   POLARITY; emitting the inactive level would require changing POLARITY, so
   the driver switches the pin to input mode while the channel is disabled.

Patch 1 extends the DT binding, patch 2 adds the CV1800B variant to the
driver and updates the Kconfig help text, and patch 3 adds the
controller nodes to the shared cv180x.dtsi.

The hardware behaviour described above was verified on a Milk-V Duo with
a logic analyzer (GP4 routed to PWM, i.e. pwm1 channel 1), at 1 kHz/25%
and at 0.5 Hz: polarity mapping, PWMUPDATE latching with a running
channel, and the pin state of a disabled channel.

This follows the earlier CV1800B PWM submissions by Jingbao Qiu (v1-v7)
and Thomas Bonnefille (v8).

[1] https://lore.kernel.org/lkml/20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com/

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hiago De Franco (3):
      dt-bindings: pwm: sophgo: add PWM controller for CV1800B
      pwm: sophgo-sg2042: add support for CV1800B
      riscv: dts: sophgo: cv180x: add PWM controller nodes

 .../devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml |   3 +-
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  40 ++++
 drivers/pwm/Kconfig                                |   7 +-
 drivers/pwm/pwm-sophgo-sg2042.c                    | 201 ++++++++++++++++++++-
 4 files changed, 241 insertions(+), 10 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-milkv-duo-pwm-42fbc28b0693

Best regards,
--  
Hiago


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
