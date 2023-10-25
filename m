Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D67C25B70
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=12N2CqZKrs2zwp4MEwIbysxuGqRFmBgGxufIe6lkibE=; b=sSVUcz1tzwdvvS
	+hOJq26jJMuyD5RsoA7qSV1fboSziqyDlXexUqTI1Oi4DerrMTX/s93HCGzYTNOlzD1vDf1zKQfAe
	OamdHIc88UGO4X/1gM9RDkvewRINw0lIhbrheAaRRsMXy6WbNz0BFyVtTKL+fyi02NVM7rl+H6TL8
	kDTqtdC8BVcTGWLWsvb7jCmnBQ0ScPiHGfI31DQ7hWsNpnI73ZriaFsRK15QxWQjjtTu1LE0ERuS4
	JlI53P9ewS59M8YDaR2XXgZv0mW0+07ND9H4vcavan00kMrpAKDyNUqNW3ZnNYyanG3BUqzxTabeH
	+XAQREFgm0cLg4fkcfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3c-00CuSR-1b;
	Wed, 25 Oct 2023 18:56:44 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3a-00CuRn-0E
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:56:43 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F0C1C413B8
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698260196;
	bh=mHXboaNJIGHxi+UlmtLed78yOAC0VPZ0YehEIDaxN1E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=mSwJTRqPUDuB9Cbsm/H81//bvmf/MJkQ7U8itZO/UsQGJHT9gID2S9tVyOfsgBHa3
	 fY7P50OjPshUVa1xcDHLcdSRWCb2dykVgzBql5N3lzmFHllnunf+1+IYqGhaDgmzz/
	 UUsTKo7UpTWblDlIvmC8UJj0lojgEdVTuIRb4Rsc8BL2DOMBw/ydE20eupR5Nk7v33
	 2rXSQVe9GQBmpLy4AVzkHmFc///qMG84hmFXEVkJAX5F9crm757cx/Cpu9FOj5NZiH
	 Sh6jByraasPa/ZNPavtWtFbqVIuGKJaCJicNUUFOtQ96M41BfKa3BKrJyM9MxzdxJB
	 rvUdAddropy7g==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41cca916954so1180401cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 11:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260196; x=1698864996;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHXboaNJIGHxi+UlmtLed78yOAC0VPZ0YehEIDaxN1E=;
        b=qbvWH6063CH7hbvfRjdIhO2Fc34IwI6/deeT0eMQnvlSo/QIFJ5iYXhRiKU52lqvfa
         Xvmvb6VjBhSen3Crd8VSzIQOhoNwzTMp1UzbHABGRfH5l2s2QDdHZEO3Gi4Ub5XB3wxl
         tt+5Nbt5WFPSTbpmcPDskW/7cLpKqzCA4yBZrz0i5P0EsUMxgr0qHhaayAmZ9XAHc3T8
         NmqGtoMQN54oIJUNxPUC0+90ILbdM0mqNJ+sHijVMzHCUU8KhsM1k1LEv7e1ZrGmvDeP
         0E2v1MQLcVY1c66ot0G5vMAfB6RdR7o98rwtyBIbOKKXCTAFIs7XWeXOmSnD94DtmmYd
         xmrA==
X-Gm-Message-State: AOJu0YwpUA0EfAGBUaOCHjJ/EdhYj+RxIST7fCfAasWyrxo8JcF7o8SV
	qHVkrmSw7Xa7B8ghLOrIyLlZTpcIW9EavuydKBtplwFVZDJe/R40U+7a97ylbO2wXuigVMyadW1
	eH5kMWXJH6KaHsk6uK9J01ZUUuEaJsPAOJjGVgla6hYe9t/nQ3gPHiWr1vLlk8zkvkN4+jA==
X-Received: by 2002:a05:622a:58f:b0:41c:dd0f:7fd0 with SMTP id c15-20020a05622a058f00b0041cdd0f7fd0mr16782240qtb.33.1698260195963;
        Wed, 25 Oct 2023 11:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE4M1NetKOJlGLn7AZ6e2f6yRI6UKMiMDq2jGuECMu4wY5zIvO7J/wSp3z+d2ubuRtJQGpZkpSUkWzhyn4AYY=
MIME-Version: 1.0
X-Received: by 2002:a05:622a:58f:b0:41c:dd0f:7fd0 with SMTP id
 c15-20020a05622a058f00b0041cdd0f7fd0mr16782228qtb.33.1698260195765; Wed, 25
 Oct 2023 11:56:35 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 11:56:35 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 25 Oct 2023 11:56:35 -0700
Message-ID: <CAJM55Z_pdoGxRXbmBgJ5GbVWyeM1N6+LHihbNdT26Oo_qA5VYA@mail.gmail.com>
Subject: [PATCH 0/4] soc: sifive: ccache: Add StarFive JH7100 support
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_115642_464937_25762BE0 
X-CRM114-Status: UNSURE (   7.47  )
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

This series adds support for the StarFive JH7100 SoC to the SiFive cache
controller driver. The JH7100 was a "development version" of the JH7110
used on the BeagleV Starlight and VisionFive V1 boards.  It has
non-coherent peripheral DMAs but was designed before the standard RISC-V
Zicbom extension, so it neeeds support in this driver for non-standard
cache management.

Emil Renner Berthing (4):
  dt-bindings: cache: sifive,ccache0: Add StarFive JH7100 compatible
  soc: sifive: ccache: Add StarFive JH7100 support
  dt-bindings: cache: sifive,ccache0: Add sifive,cache-ops property
  soc: sifive: ccache: Support cache management operations

 .../bindings/cache/sifive,ccache0.yaml        | 11 +++-
 drivers/soc/sifive/sifive_ccache.c            | 56 ++++++++++++++++++-
 2 files changed, 64 insertions(+), 3 deletions(-)

-- 
2.40.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
