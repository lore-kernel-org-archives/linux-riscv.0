Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242D9C44521
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amzo+Io30t0hHiEObBVucP9W/ht4TbLLxhXXxvbDPdk=; b=rZ0QCYlFshvS6p
	/uRoQvUEUurHlCrqBoqbo2rppL9khbrnNRhWjXbGXMSLpyzgRCiQ4NwC7Hyw7cpuF0f1QX3ap2VGF
	m/wyA/hykVwmfWvlQbaLENP7L1GZ/1dQL5/fNmi5eRXli1GMVi5WJbbGvjbiiDL8x6i199nxQTcej
	we1lkaf21iZRIvnDyOO4BUKELfIWsxHE3xs1EIRf+4l8VpAb7nSNXKrxCoIK7Jv3MD9vClKQsmmLU
	9fcHtCG+7AMAsnM5IP/ed8O4DwIC+gyCH/OXrOl78iniuxuyFJwxVJsU4ohDjfIQC0qmZayDWhQyB
	kHDBdH0XVoKN20UpHzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliMf-000000064aH-0r9n;
	Mon, 20 Jul 2026 07:24:37 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKP-000000063Eo-1U8j
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:22 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38df94d4dd8so4518878a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532137; x=1785136937; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6h8UJegFSpbzqcCoxFyjFcJzeX3Wy4pDkK5e8kjwbRc=;
        b=QlSJ0ReABa6DcyEbwVQjXaTSq8yAHvTsSAVz3cOR5We+SUl4pCMcz0Ia9Bh3Ek/ylW
         sjwPCg9+doywbfbB3JPRxGvx7SHPkoF+TwmIpJUrloP+Eijr8Ar/eXb8ya0xqHscicSK
         C41FUNifV2WzthsVu4TXx9iPlXXBI3ieOukoXHM+8z04pl9dnszj/LVGY0OkNB+QgCg3
         VRUGkpah2VIApZa8ihi8PUMNsg2dA5MCD0c0MxLW0Hc0tOhZleBk/7j8fub0ha/lYEU0
         VzMX4VAs1V9UMaIn46TYxvEV6CBPIoNNl4sfs/85PDpa15Jm9Q1UwSF+sDroSB8Fd67J
         WWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532137; x=1785136937;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6h8UJegFSpbzqcCoxFyjFcJzeX3Wy4pDkK5e8kjwbRc=;
        b=ZlY3xVhkT2KFpMlODlPWU1sqfAzEN2L1FumeyOIxVPXVC6oq1nAIPySadaObXzWUrc
         vOPIiY1sDJBIg/663QZrZJJaz8yw7aeupJbeF6vmItUbmk1+bU7GQVpkW/ljiWzPsZRE
         QMfQDC4B/ZGZH3RZZPqNVoxHW9l1cai3cY4qm2Hd8ay8rhk4Q9+VNmUEErhQGWSTWyrB
         wxlR8Fsp0G/v50YhQ3JnIAmFNtiN8DUbhUVboymsDRZC3no2rgd/bgF3aKzFKorHr0e5
         Fy3FJjhnlBNl3kWuIMiPl5TP7Slt6DZ2VQzfJMEqlVJ8+E8Ha9iB/dTRh2pM1RMM0xc2
         EtHw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2rF34jdMvznzRnFZxiiekJt6Qb/c80VTNhOQeIkStT7TyL77/q0f90YCDYvJSpfrRHtntzIv28P9O9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytqzt9v1MLWIY2ttW8spOlS9tC5yHL7oqxrIrFWFYtTF3q/Ehz
	hi/c1wBVT6vADvwEGb+HwPlVCtwUFfz46VpBT6SOgsuOVZFdazyZ6Tdw
X-Gm-Gg: AfdE7cmh72yJzoWb6DO4lRtt8237wwlK5eZG3pPepV6cwoijycyQY+Nfbdao814UqCT
	MxUmSCwGlJZA2AsuJvVmpEgC55yKZ5WfwJULmOWOmOQiz39R5s5CZEZKB/8GllfI8kLfI9WqDpn
	WhNEbZIBgz794myAcZjNedL3gtWBKoZ2TdmqSWJOqFgtkll82osKjcqNdiJe2REOXf/3+Xoi3fH
	tilgfDjlt5eBg0oN0YW6+L1UiI9TFBVY/ICGZBKUgnhAyp5pWB4vSqFF2ru0dwa99d45+AVDTN4
	5vBm2I/DjBofA98hdshgeXd03nk6CUca54Fa7tAWo0TD8EwIs8t5OfASd4UDqvjmu9ZooRMOFBJ
	TIpRZ6VVle3scEUiySpxPPIEyY76f4aMAPfbhaOqURmTNoIh/X+Iygi90+QUTLG0Kkpql7TR1pg
	zMDGq9aovLvrDbNORauxHHDQ2+KxlF
X-Received: by 2002:a17:90b:5605:b0:385:d033:d9f1 with SMTP id 98e67ed59e1d1-38e4b5058c3mr14013135a91.28.1784532136729;
        Mon, 20 Jul 2026 00:22:16 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:16 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 08/22] RISC-V: Add Sscfg extension CSR definition
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-8-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-8-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211936.543975.6345698898378707454.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=635;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=SzuQlKgKf+dbOdbZYvKV9a605QJD2/wh9qiTBlKZleE=;
 b=ugqoqQ9cmaF8JmbcwtjHFRt8KirwYYADAEAYU1QR3dSM8OO/c3BahtvSrl6cdO7FCzsfCm3Vf
 9NMihisQ3erB93I8FusSXEt1xutLF2NmPmGrBqXQG+Qpo45AYM3E74H
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002218_265484_56A6B925 
X-CRM114-Status: UNSURE (   8.81  )
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

On Wed, 01 Jul 2026 01:46:56 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> This adds the scountinhibit CSR definition and S-mode accessible hpmevent
> bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
> counters directly from S-mode without invoking SBI calls to M-mode. It is
> also used to figure out the counters delegated to S-mode by the M-mode as
> well.
> 
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>

Does this need to be signed off by you?

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
