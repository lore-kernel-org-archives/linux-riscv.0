Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B438C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qoPQs1SlhJscxEIgYlQyIdwIfzLRU6pF3s5LNoa22Zo=; b=SKOnemgNQX/r0+jSDVBHlS6GfB
	6nXG5X7Po5+BbylwW+wRiMD4LzHIBbT0JZrMZFO1uDBdlzJSxfVVkk/Nxlc9ZMx10pWV6s2dABEO9
	kM23xoI7fiNsjqiKugjeeqQk9Fa1KtcLK5VITbX4CLdY9MDXbWS2b3Ov7HPmQ7mP65ufKU0nadaca
	x/MWeyRDgpf9+GJoeBxdK78U/elibvisZFUrxbVuEAom9+u2IVa36PK0ksz9Qr/QKPTyE/UTbJ1D6
	EN4xR0FRb6xiCfAudj42ja+JliRjuhPNFfHfVtp7ww20g0wCcKXG3XZCLGHrHecllSEMX0rp+4kP4
	ydHQ7aiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGBE-00000003J1T-1P63;
	Fri, 26 Jul 2024 08:20:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGBB-00000003J0k-2uW6
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 08:19:59 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C19633F4A8
	for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721981993;
	bh=/puYacruPtS67r61Iy/obhcccA6V9gCxp2Q24bki4BQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=EBUElDxdmTgLSoe5qGjZt8vkbV3hOlz84pI1bIqhV17xvHfHg3yXtRMC26vqaj4h1
	 mMGYKdI9ic8vzimNNE7xK/Fq670lJCIagv5wi1GyxYYnsRnMuAfVSbzXdpcSTr3QQF
	 uK8nf/Hdtis2o06R0Wr0EPehMQaNPNpOtNjUf4CDBcvj6utIOg1IqmECQdj5ToxEPz
	 BicLMcLZ5kldtXlIhp61REOsTFnvttZWr3KVyrRALDQETb7V5p8Fi7C1eT6rwSL3nT
	 0I+NDEmycnkY58FHP6zN4ivd6vfM088ker7Uo40St8j8zJ2E3AzM4kn8dEHlKjzx6m
	 IgIRyhFmEhNqg==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-44fdd39f503so6219671cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 01:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721981993; x=1722586793;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/puYacruPtS67r61Iy/obhcccA6V9gCxp2Q24bki4BQ=;
        b=BHr/URUZrf+gAAJmBTT/VHJ9SE5uTUZIViMiICJ59GAMD/R9UMHz/BQaVbZMTufV8q
         dy3QLy3MCPla9b/YARCh9WFIO+E7V2ST2Cyn7AG8N+0/lB7oCSsmdxnTdnDHAgfS4F81
         kBvj6JwUQNr685gcda2QRRN4G25F8bqtlT97vkjDGhkgjjrsPTpmv6BzO8J+ju4Kedbw
         DHN8XtBl4dKYDassYXiI0Y36pxAEai6tVggxuMP+5bnrKns40kwoxCuJ86H3hbGCW/tV
         66Q3m29ZDAAIAtguKZA0OF9FJNr6MxddQdUJM8ctArUgZc3ovap0SfAE3M5BajAaXLKo
         bwPA==
X-Forwarded-Encrypted: i=1; AJvYcCXjr0+7gIqoW0Y7xS2wDFBBtUBMkUGZG2vNOEOat6e1B5oicg7c/2lH5B/tsSb8LaaINpRo1O7d8GA1nX3mhdcYqw2+MW1VsBvKkFWHLu3H
X-Gm-Message-State: AOJu0YzZwen4Pd5edbv56LFq7WPXC+eZC5YwDoruNZ+cS7mF+Ipsm+/G
	EMaYtL15BFbZsOIXrPr+ssPG9mB7M/4c0qDKIvE1ID69Fv6Aiv+5P5xD1dbphNa4nlMoIIrYlWE
	2fwbt6sK1X4mdUxgKzPOKyf0AZXqEOVy7ESYI3c1LZ3G/yxIMb+xpmyiErRgB06fwJEZkz+IU3K
	NsUS76OvfDZSwwxmMvDuYxWuUvirtf2nWneaCR3BT1sWx3VwYej07iEPim
X-Received: by 2002:a05:622a:5b94:b0:44f:e81b:75b5 with SMTP id d75a77b69052e-44fe81b7782mr57778801cf.16.1721981992716;
        Fri, 26 Jul 2024 01:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8qCEEvyC+WszzxwXuACFUSzr4cfPd8vim9AQL2WZcj216az/f/QtGrpD5fhoyMxIeLDZW45BC861YFQ0T+30=
X-Received: by 2002:a05:622a:5b94:b0:44f:e81b:75b5 with SMTP id
 d75a77b69052e-44fe81b7782mr57778681cf.16.1721981992332; Fri, 26 Jul 2024
 01:19:52 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jul 2024 04:19:51 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZqMdeTrV5GE0TVUV@x1>
References: <20240705093503.215787-1-kanakshilledar@gmail.com> <ZqMdeTrV5GE0TVUV@x1>
Mime-Version: 1.0
Date: Fri, 26 Jul 2024 04:19:51 -0400
Message-ID: <CAJM55Z9WFZJ=vyosx8LSUxBXs-Uftr76yKuWqGi7D_L+v1cKRw@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] Add basic SPI support on TH1520
To: Drew Fustini <drew@pdp7.com>, Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_011958_133341_7E4599A2 
X-CRM114-Status: GOOD (  13.22  )
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

Drew Fustini wrote:
> On Fri, Jul 05, 2024 at 03:04:58PM +0530, Kanak Shilledar wrote:
> > Implemented basic SPI support for TH1520 SoC. There are two SPIs reserved
> > on the LicheePi4A, one on the SPI Flash pads that are blanked out on the
> > back, and one on the pins. I implemented the one connected to the pad.
> >
> > It is using a fixed clock of 396MHz. The address and clock frequency was
> > referenced from the TH1520 System Reference Manual [1].
> >
> > [...]
>
> Applied to thead-dt-for-next, thanks!

Hi Drew,

Are you sure you want to merge this patch? It adds another dummy clock for the
SPI, but the next kernel should have your clock driver that actually models the
SPI clock.
Also the clock driver says the SPI clock has a frequency of 792MHz, eg. double
of what this dummy clock is set to.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
