Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32B5C54F52
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cg69XKaFQ4gjdB5jGZTJtflDaXeW8idecw3QlHkLtAI=; b=IdkfoHgKrAQwwu
	sdiVzyQ4ayKNPgtY68IOvTyIqb1tqY99hYrBLpXoUlIapjGBTsXXNdNW1d1uLZm9jjBFhU3+ySCFa
	SGYEy7LojBr2ZY9QvXQ5qsuLdy1k4MQFUWiVVsAxKF3JVqZ8H1lkBZ+gtPIzqGcghHnLU1cu+cMgM
	4kbgUItimNddNyijGefNMJl9LBHwZmOn5QvNIaI7yMD8YB+qTrsLf0qzmXfVGQCM5IIsW3Sposj99
	7Rh+Dbyt0viw9o9yhMS+4eDwaGG+KxYwRcVzwQPCdgvOuQRuVJOPy7cIDdrLAVyOqtImUjuutEQUV
	7eLj86LgY//oSoOJoKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotVz-00000006dx3-0v0U;
	Wed, 29 Jul 2026 01:55:23 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotVu-00000006dwY-3jsi
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:55:20 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cbb7926836eso213487a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 18:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290118; x=1785894918; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OrC+WlvYaMqsFVuQdS37eVhGU/gaCtUqZoAhWL5YwZI=;
        b=NhdsqgdKlfChlcaPNWOT5GXDpmp+8Tx+EI96qJNB+TNHehGSvcA+c+spcovaoS6vzg
         uVjS6tpnDcuJKMz28M0FbC9qUiRegQR73jIH26I5Md6vlDpPh3X8UfmCxddgu5+jn/4Z
         MvHxT007qpz9EA+wyEZHgHgMPvgaU5aAxy2JeTKvesp4PANimMmu8twIYI8h3IeSmNsM
         P6JejTz7nLdmfgF6lVPh5IsRGIofPl4qvu8TZY8Hp6T8m6f837PwMazzl5sg7Xl4xMOy
         bB/mL+9r8ZeJHv/vHx41i6E7pZoPzKcxrh4evZFcXZ8SrQi+PjjgShGUKt9k2z8nkoch
         Z3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290118; x=1785894918;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrC+WlvYaMqsFVuQdS37eVhGU/gaCtUqZoAhWL5YwZI=;
        b=sGNii7XokHGMTfwqFoosb8r0bBv36xKepgbvCbMFTFb7GkDqZJeLvj61CeN0p7h7ON
         wzJYZveeTKL81DjNP0Xmr3JB8CWCm+paRxzji6gTYWrhfum791uXBg/wgLlTjLKWUMdV
         op8/a55CFcpA69f/G3Q4BKyl8MT6Mvf+cbBKkRsbNHwpOb0i60Pl904odlz0qWwLryEN
         qwRMq6tVYBVOd30csQrntqqUoqvNPSGgRJHpvlLrNZ5X4mh/144X7hdC79TxgEUZ982a
         awSAeS9/nqRFexi76qgUcdeWK120kYh/C1vkn2qyTnBN6Jj6X7YrPqiEYTCs0Ebt1L/L
         dVvw==
X-Forwarded-Encrypted: i=1; AHgh+Rpr1JGCM1Res3SGqXf3PQh9S3v07K5poprmBEMIfsUkFnqlxaSURV2IOniCquHccsYO80EsHOdJPgEp7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHqINYzuYAA5l2zczjoJu2K//fAOHL5jLJVTsK/iot49mcyRod
	WF98zMoYv23Ik8GdGCLJIlJAQDNdx62GoQPIzWCHCMCdLf/yqpta8KYk
X-Gm-Gg: AR+sD11d+9pFWxItwhvt3pL70uvlXyxjEkK/fPEGSEc1ZZTswL1TH42zu9Rz8dIJQpd
	UoUn3woiwG2paz0NzESgKQog2c+mEP+CPz2Xh0d6f8iVEtabqMeh/4Certr3YbC0PH6g92yCQyu
	HzXGL9ukIzsG25na+UDZAJoKItd20ZqNKr40iyzYFVYfa1imBTjJlafimUTAcVtsp36BRlLHkAc
	72ymQH4BW+bCm8UmfftonDxPe8lRLRJm02OfncFbZMSLyTZsNCF0TiA6kTSgtxCJ3W6t8h2f12x
	JlYiJ6KV3LIxXmgNr46s444XiaAkD1gUqrmUvIbNPoZczuji2X2iuKwMdpbzgoNSY7V7h3LMng1
	kVZhZaWILcmgOmajG+7Yq2dJ6VEErneFS6mJkeE55SOkzmxeet071zdS0Firb09f07D0/spG1wu
	PwqLdyQte7ZA+kbbo/6qIbtBPHv4UvheKiGMO0o+OBS9FZ6hmGEETyg632Uho=
X-Received: by 2002:a05:6a00:35c7:b0:848:700d:c950 with SMTP id d2e1a72fcca58-84e93330d09mr4806240b3a.37.1785290117708;
        Tue, 28 Jul 2026 18:55:17 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa4d4sm590717b3a.38.2026.07.28.18.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:55:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v5 0/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 29 Jul 2026 09:54:57 +0800
Message-ID: <178529008851.164571.15038866333557612176.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_185518_959799_FBCE51AE 
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

On Sun, 26 Jul 2026 01:53:42 +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M is a small form factor development board based on
> the Sophgo SG2002 SoC.
> 
> This series adds the board binding, the PWR_GPIO controller node for
> the CV180x/CV181x family, and the board device tree with support for
> the UART console, SD/MMC, USB host and the onboard blue status LED.
> 
> [...]

Applied to dt/riscv, thanks!

[1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
      https://github.com/sophgo/linux/commit/623a0b16bc3a822742c2793266128f59ba4f847c
[2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
      https://github.com/sophgo/linux/commit/a625117e6c58cd77e88295e5470a3cc9578e4ad4
[3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
      https://github.com/sophgo/linux/commit/11881041b745b444e4f6c87a2748f1951cf02742

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
