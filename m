Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86001C55160
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 01:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HizaH8fPKmhz3G/HSooCz2ZVc3cPZGVXHj1DAovzx5o=; b=u3A6eolHRTDxv5
	d7ePiZULejSSRfMD+I4WKwK8ypbEGr9Et4zMzWPffIXcjsSjkOixkAeW5xhoUhBbmpC9g8jBVak4X
	4gsBAbORe8Nz15CFFFsupb2nmRKDlHGxfvXembewDdnPH4y0RS+PXKb+Ws/Is8g9dmoNf4ZVijwXB
	/dOwPKafxNZPEnMFVMQggCHPuMkBWBHuTK52C9bRfawDJAFtlU6WAl1Of2h0E8fIikeumECWqvlDp
	+BSZ1FtoJH4TIx4Y8USbCLEShc78sF2uqtEE8AnBRTB8wKJcM5KRcHOMOIG/gdOTL029WN5VnyQ1d
	z5W+xtDmJ7LDMJBah2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFnz-00000009HeY-0B2w;
	Thu, 30 Jul 2026 01:43:27 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFnx-00000009Hdy-01bS
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 01:43:26 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-668c1b780e5so2342491d50.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 18:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785375804; x=1785980604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mZFvilolEPcJsZBCt856hM7K+hVSmGldnUoUJCZFhgI=;
        b=GAi0ay2HLu5FAVwS1pooRsAqmWBfeJW/xpW3mPiiHdvI9ginawc3DVqUM3qSMeTfaA
         ci9xtSowiIwEorwOugRITqfDbVmH2KQg1TCnwjKMioQ2IRO6wvoLPhQECugsqiiQ+tbT
         OkvMT5u7FIG+o7sZgVN+nsmKDury0duHNM4Ev5jY9qLa56EPi2YS4fAySBDW5zH9UvQ5
         BIGloYMdTopr48MrRyRkezg1cQCmuF5NPSCocJvLL/Kdv+xF15HXVGF4e+RitqZCIvQM
         7zXE0qjA3TJYrrG+dgrXpzpWDJWEMqDoIvTmJYnuIo9PYcQeClTDwtPLthggK0G5KKWv
         KYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785375804; x=1785980604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZFvilolEPcJsZBCt856hM7K+hVSmGldnUoUJCZFhgI=;
        b=I9YB98XCfyRpMogL5XaSB2ePYMcWJLm7K4fS//yCfnTBjH/O1mPhSe4UTfShNHTkSq
         +Fr1YBctfIdp7CY9ABY6aTn4jWOQjzaQKOZWYRttpE4yYyT86dIECuspnrQYuLfwuBqd
         k82JAWWWXbPPioS5GuOR+ZKcNTyDED+P4f4liW2lD2ofJr5uPnabMfaalbzQ4HDweZXs
         g8lv1R22mY5GKPuUbJnRLbX8bP4CC02QF2p0hXD2SAqUl69wXd+55xZ++3D8o8dwV3/t
         kaGJ4lmGgM75p/+HQl/0mXg25VKEUg5crtpMVQsbWKxWn5IbwL+ECDj9GbQR9Kb0/XYW
         LFFw==
X-Forwarded-Encrypted: i=1; AHgh+RrvSgeyQ0bolWRR3jx6NIiBgNwBwEvZgfcaEiCsx62CExptniuM/qiG1xVB52qp8Sc7NgJ+Mu9T9I/3ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs6OcGeggHpGOxK7ZBAbAW619LU6puKgE8xjlPf1XtIvI8JrcE
	dgPkMdSKLbZwc/MCGJBn+P+ZEyxakyjoe+9emc9hHnUrW/Q3BK4mn4ue
X-Gm-Gg: AR+sD12lKnNi9DVD0uH8CQsDhXu9Mm0EtA72or41j3rlcmNj6AeHMnU7NILhYFI34O+
	tCqF1JliUFGGYAndU1NH4IubmATj/AWWBkLdkX5cgoHH0W+u7rIJ8csG7uBnWQTpZYVxHIp/CAO
	5lf7hC617w9zcdY3EshNteXeIwO9lYb8284TJUKCVmE3CChg9zYgu/2qF1Ok94sXr2oNKR2M4Mg
	SrWH6sSdC3gAW0NXt1RRYO3U0clV8xJbuMEGQgCcq930J0wft7Y+j5K0n1W6vUq+aNsBwiVTYxc
	xCGc3OX2vJvmJK2TnbBskYgIlSsEB0D8He2GYCBf/YIjgCzu/CoRKz77EGAhtd9hYxIy7fI21ON
	EYHarPKNL8LeGK8sbuI9tSZ4sc988PtGrNaSRbhcIlQOtz2aVvZh1MbdXePcVR50fzJRrcnE5ZX
	hKcExSUyI8sCGfK7zYEXc7g1dTY1e6Rdwgagu5mdKG0oWcod/vHeNMBhQXe3Ye01ZCOq2AX03Uj
	INZr5obAYiF0JSwcS7G6KxG
X-Received: by 2002:a53:c0ce:0:b0:668:9f36:5484 with SMTP id 956f58d0204a3-6692f76adadmr248588d50.87.1785375803719;
        Wed, 29 Jul 2026 18:43:23 -0700 (PDT)
Received: from got-milk ([107.198.84.185])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c7479c9sm386842d50.7.2026.07.29.18.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 18:43:23 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:43:20 -0700
From: Paul Sherman <shermanpauldylan@gmail.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: smp: fix non-SPINWAIT secondary hart rendezvous
 for fw_dynamic platforms
Message-ID: <amqsOI7Pdg5uH-bO@got-milk>
References: <20260729083414.39339-1-shermanpauldylan@gmail.com>
 <51f32966-86a2-456e-9e45-c9bf8add0676@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51f32966-86a2-456e-9e45-c9bf8add0676@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_184325_079792_BDF97538 
X-CRM114-Status: GOOD (  16.21  )
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

Hi Samuel,

Thank you for the explanation and the pointer to the boot protocol
documentation.

On Wed, Jul 29, 2026 at 05:13:56PM -0500, Samuel Holland wrote:
> 
> There is no need to handle SBI_ERR_ALREADY_STARTED because the contract for the
> "ordered booting" entry method (see
> https://kernel.org/doc/html/latest/arch/riscv/boot.html#kernel-entry) requires
> that only one hart is in the STARTED state when the kernel begins executing.

I agree that the documented ordered booting contract requires only
one hart to enter the kernel initially, and that HART_START should
therefore not return SBI_ERR_ALREADY_STARTED.

> It sounds like your firmware implements something closer to the
> RISCV_BOOT_SPINWAIT entry method, so if you disable CONFIG_RISCV_BOOT_SPINWAIT,
> it is unsurprising that there would be problems.

On the SG2042 platform I'm investigating, however, that is the
behavior I'm observing on shipping hardware. My investigation so far
has focused on making Linux recover from that situation. Based on
your reply, I'm now wondering whether the more appropriate fix is
in the platform firmware or OpenSBI instead.

> Why doesn't your firmware do that? Can you fix your firmware?

Is your expectation that platforms exhibiting this behavior should
be corrected to satisfy the ordered booting contract, rather than
Linux handling SBI_ERR_ALREADY_STARTED defensively?

Thanks,
Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
