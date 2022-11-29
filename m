Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B1C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SIdNGuZ+65yf1cAgDURmJkdl0RE5rD3mk0YQykZetCI=; b=bB7n/z30zONS/kEFw+weKZt6AU
	DRNr3aaAHTZKe73Aw5ifaXgtYW84KcCbBgXPpgNMLQSfYSOxsCdOooB8EYF8oBA9NGM44xDlYZwLb
	ixnhLlwwlxBlf2iqIzDxMuG7ofxscvRjEBzSlNpzPjIXCJUrLJnDoVqYsGd7h5/8H60kRGZDmTKy7
	S+3YsDsFe90Gw8dEFmIVFi5xTP9EpyU+TdnKq53fChI4ZywEZ6TU7lC6ABgkfnxW6i6PUBrJrdLGn
	hRQcNpb4IMTQRFMEsxOkjUCVrs5KXr7pYJR81Nwx2CL7YtuJ11UV+2UAWdhSXnpjPP7jrqdu7rfae
	Dcvh0xIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p05aG-00Artg-Ed; Tue, 29 Nov 2022 18:43:56 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p05aC-00Arro-G1
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 18:43:53 +0000
Received: by mail-pj1-x1031.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so10014833pjm.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 10:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8lGntM4kOktmfQdUaeSjevYi4oUpuqHsLPXR1CgAwY=;
        b=obeLgfkyGkMKWKCrw/Erz/5BArpTueSCf8bT3iUEDi9Ish/XAzXxW4Xa3+d6AM2QAp
         Xd6xBZt79tvTggr2GJ1u/dfQrlCmbUvNY2KN7OBfe1kCvhTuHNjwCBkHMNBxyZ7dVsa4
         fy96fIKU0cjhMj2TgII5L6v8cu28mpTHapAb8pviJIyjbRSL/qbpcnDRKf70+vf0eB9B
         MiPAH8P7D/5gV5/SOf+MNhyh6vteQKpH0i9QWE52nXmWosRsA1fPUEGo9Y2LuJTRQVGB
         8/HFAF+4qdPbOLPSUvGnxnYjjYo8ksyeQrO6UfZwiLFlQMKHhLHQJkXsnAxmDcJ+tdpL
         rMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8lGntM4kOktmfQdUaeSjevYi4oUpuqHsLPXR1CgAwY=;
        b=ZrwIw/RGq9TPKw9rVqML39PDgl3S/26iNk89W19Z9bOKi4R/VckPcA1WNVdE1ttDmR
         +bjtL6itBxcOu+k+HYLmbZicsJVBjJwoTyrfSYqIqBZOwOlYIIrZR8qMrMtjwC6aQbvy
         D4fUpIOk6z+qn+rPUdjxarHn1fKEelRoh+CfE6Yx7TwJlv2geMwWTpaZUox1SaHcycjD
         JJKvVhjgzDdV0czIcaoyhpjJUp2LNuIITkXfoUbNcthNlrQyHMNk7yr428x6TCbJqQUB
         brh5OXzsUlvdC3KE1fI6LrG/Y+uKM/fK2cKsc2mxtS1ADEIZDFR8s/zfN0cJiiXcQJno
         2bSQ==
X-Gm-Message-State: ANoB5ply73TXrtPmVbmK1nyig5ty+o/fq03MMdZGBsJdJvnkRNmqfabX
	5AMZkLaTYS+0Kr9XjLPIxXn9Ig==
X-Google-Smtp-Source: AA0mqf7cbjoYVp0R9RTwHGzuOaTXMkjf1daC6uT8wIT0jRdIISiBqQiw+C5KaLxr+2dyYMFKxbUmkg==
X-Received: by 2002:a17:90a:8b03:b0:213:16d2:4d4c with SMTP id y3-20020a17090a8b0300b0021316d24d4cmr61926206pjn.70.1669747430925;
        Tue, 29 Nov 2022 10:43:50 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090a890600b00218abadb6a8sm1658684pjn.49.2022.11.29.10.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 10:43:50 -0800 (PST)
Date: Tue, 29 Nov 2022 10:43:50 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 10:43:40 PST (-0800)
Subject: Re: [PATCH v4 0/3] Improve CLOCK_EVT_FEAT_C3STOP feature setting
In-Reply-To: <20221129140313.886192-1-apatel@ventanamicro.com>
CC: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, daniel.lezcano@linaro.org, tglx@linutronix.de, ajones@ventanamicro.com,
  atishp@atishpatra.org, samuel@sholland.org, Conor Dooley <conor.dooley@microchip.com>,
  anup@brainfault.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-767f0a38-40c9-4090-8341-ec0c41dc502b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_104352_550968_E28EEE91 
X-CRM114-Status: GOOD (  16.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 29 Nov 2022 06:03:10 PST (-0800), apatel@ventanamicro.com wrote:
> This series improves the RISC-V timer driver to set CLOCK_EVT_FEAT_C3STOP
> feature based on RISC-V platform capabilities.
>
> These patches can also be found in riscv_timer_dt_imp_v4 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v3:
>  - Rebased on Linux-6.1-rc7
>  - Replaced PATCH1 with a patch to initialize broadcast timer
>
> Changes since v2:
>  - Include Conor's revert patch as the first patch and rebased other patches
>  - Update PATCH2 to document bindings for separate RISC-V timer DT node
>  - Update PATCH3 based on RISC-V timer DT node bindings
>
> Changes since v1:
>  - Rebased on Linux-5.19-rc8
>  - Renamed "riscv,always-on" DT property to "riscv,timer-can-wake-cpu"
>
> Anup Patel (2):
>   dt-bindings: timer: Add bindings for the RISC-V timer device
>   clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT
>
> Conor Dooley (1):
>   RISC-V: time: initialize broadcast hrtimer based clock event device
>
>  .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
>  arch/riscv/kernel/time.c                      |  3 ++
>  drivers/clocksource/timer-riscv.c             | 12 ++++-
>  3 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

IIRC the main issue here were the DT bindings, though, so I think we'll 
need to make sure that's sorted out.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
