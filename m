Return-Path: <SRS0=BSbV=3T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1A4C2D0DB
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2020 16:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA3920707
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2020 16:16:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hDZWikG/";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmE0JqPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CA3920707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nvHjRXEGTkNGn90tmlBbPTSgLpmuQC4sh+W3X4DsXS8=; b=hDZWikG/1diq1PfTH4Q7OnE+fj
	jvqoXs4Mx3HDcmhhnUhETI/7XKgbpTSPrDrYNVhRmmeUnzQU/Ph4BT7XRcj5Hn5z0pEBOks48OEHw
	a55jG2CoTgMg+ZgGQW8r8TYVz0jnKKDbo95oMtEvQ3satJTUu1DBd1GML5DYuLmCKvizvUf344vXr
	zdc6M8DHOcTS2Eb78EWgq/1X+7KRpCMr891BTSotdvs89mIe/HzaMUIXFdSkUlZsbzkyurN/3qysf
	lXPLGeN6aAwzWpc/ej+Vnpdgaspx4DnjhduYDzVIudER5CHQXOVeY/KxQEHpCQexsWTWTqq5WHwy9
	s2FMa2Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixCUv-00077g-A9; Thu, 30 Jan 2020 16:16:53 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCUr-00076e-Rk
 for linux-riscv@lists.infradead.org; Thu, 30 Jan 2020 16:16:51 +0000
Received: by mail-pf1-x443.google.com with SMTP id 84so1732376pfy.6
 for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2020 08:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=nvHjRXEGTkNGn90tmlBbPTSgLpmuQC4sh+W3X4DsXS8=;
 b=lmE0JqPtA0ZSrGZDzun4GQ/LTXUciuEA61NapcHxg9J2Zu4nHGS3oL4pmjM4FuIJ2J
 JvQtXT+r2dpRQK8s4WFheYE+VPHNlGzQlEeadl/TbH270FvfVVAvU6QfqB4812NL4NBY
 HHKx10GogWYnXQoVWyMs7xn/cK10lFPBfBX4ISShASvEOytZ2T4iC0lVCuxq227pZvg3
 m9qMabfd7p+QmcUhrrosdTMF3si5T49FaB0eT8u1x6aeg/Ox8cG+hDTHaZv4j2EOHGGU
 FZBGjt5ZA40L/wo+XotL9p3vbz6oGAxBZ9eu3FpLPNpxrRO9B09Cmo8vjbE6Itfnisk5
 /Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=nvHjRXEGTkNGn90tmlBbPTSgLpmuQC4sh+W3X4DsXS8=;
 b=exvgeYCGbVBpGkoD4Sz5kBwRzPMGF1E/o6lLEY30DPcQmQRyA3/gK2t+VmE6mVtgjc
 EWNv9YU1KZECEfIjhhmAcyLQY46to2FJjrfUfRxRC2p4iF51UpA05tXVQhIpxcQZO4At
 VVcOPeE6ot0EX/EsD4mMMR9gGPzQ9FzEqot9DyDZnuQTfCQL2xQ1TJkdfkQqcrrrvs1u
 G1yCEVIVWHT0PODIlrnulLKE5QnAj3BlsCNNYKJEOX/u/VyYqkP+kWsnK6yu1VHqCFkU
 yCaaF6c6KLvdWIG1XramRiyL7Ba7YOsRauhyM/fYeFO1MGibCNNT4AM6qfUkDPBrWamz
 /yEw==
X-Gm-Message-State: APjAAAWwr+tA9+NYkxI4g05Gec1lnS1TK7rcuvp5drx78qKkqdNazimM
 OQpD+LK3zlLsrZaRb8WKOtc9jVR3XyqRldX/RCf4o3kQaYk=
X-Google-Smtp-Source: APXvYqwLS55NAV1y6kpbRrxZYNce/mGXCrapi20Lel2h1dT5gRTNXyBDHQT7f+/u/A2wk6eamOxqX4U7aDvvMCUtfzs=
X-Received: by 2002:a63:6a02:: with SMTP id f2mr5550256pgc.219.1580401007847; 
 Thu, 30 Jan 2020 08:16:47 -0800 (PST)
MIME-Version: 1.0
From: JaeJoon Jung <rgbi3307@gmail.com>
Date: Fri, 31 Jan 2020 01:16:36 +0900
Message-ID: <CAHOvCC4y8x6_fBSAug3ecN+4QFiNJCooUt7Py9=J+NnBd4J8dQ@mail.gmail.com>
Subject: [bug report] GPIO & Hierarchy IRQ support for HiFive Unleashed
To: Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_081649_891851_0CBB4D98 
X-CRM114-Status: UNSURE (   5.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Yash Shah,

I am testing the your patch:
[PATCH v4 0/6] GPIO & Hierarchy IRQ support for HiFive Unleashed
from 2019-12-10 11:11 Yash Shah

I found out that you repaired the generic GPIO using bgpio_init(...) API.
bgpio_init() has 9 parameters, and the last is flags.
The flag getting to bgpio_init() is must be BGPIOF_READ_OUTPUT_REG_SET.

Because FU540 GPIOs have different input/output register,
If GPIO direction is input(SIFIVE_GPIO_INPUT_VAL), it must be read
input value(SIFIVE_GPIO_INPUT_EN).
If GPIO direction is output(SIFIVE_GPIO_OUTPUT_VAL), it must be read
output value(SIFIVE_GPIO_OUTPUT_EN).

If The flag is 0, GPIO output value is being reset and the value is
reading 0 always.

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 23d5e22694d1..1de1af452fcb 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -206,7 +206,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
                         NULL,
                         chip->base + SIFIVE_GPIO_OUTPUT_EN,
                         chip->base + SIFIVE_GPIO_INPUT_EN,
-                        0);
+                        BGPIOF_READ_OUTPUT_REG_SET);
        if (ret) {
                dev_err(dev, "unable to init generic GPIO\n");
                return ret;

Yours,
JaeJoon Jung

