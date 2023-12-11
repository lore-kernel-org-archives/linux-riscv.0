Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCED1C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5T+fw5nvnHlaP1Zdl4d9WBqQReqRQgw13HqMyZ8AdWM=; b=VLQs515JfJ91CI
	fvfTFq9dLwUBNRwAjfrkraKAf3PiLALDfhoAIXrfczNkbfgQzlyL84t7K53dOh2V42+B3gPhy8fX1
	NKYK2IdgY0PbVzv1C6CrTUJgFrYMXzavaVFg/GUfCQAnYwGk8lepTj69leDq8K+RyqAWlpPzsc67g
	J5WwQFAsyxVzjCOUCQXCSnySfPyK/1anOazA4idLe/SlNoTjGXwvJprQ8q15WocEwtYGG4dIpHwmc
	jys9g3lUDKkki9Pde//4YO+GjuCtA8Z9XRBrWO12ppVj46MSswXTbf3RME27qrF/ZYERHl9aGn5iE
	YuHQvRXkMQmgC//uRhqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjXG-005zoN-3B;
	Mon, 11 Dec 2023 16:53:38 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjX9-005zir-0X
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 16:53:32 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9f9db9567so53708061fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 08:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702313606; x=1702918406; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oGddqI5Zh7BKNJ5lQo7xaF0k9wunTr0qscdYg3vG1Yk=;
        b=LGEJH8xGsEq1DwvASft0ucN0yef8M5s44xK36bbpSmg8kYBhlgjEJRnnVH3y4SzJPf
         R5+RTdt7+BcwuDO1AOcOki22oMrsvevJW6ucgOFX08eAQ+MgX5zGAAM2/jMD0CnOleZF
         qtZ2j1HjSbMb4/sMv7z6icJi5vN6PblXeFPcaPcVPA5sGD+jHZ7Eh+/LsSMwddzfYq2x
         HNTs8jPrmE3trr9eqYql03VY28hXb/OhTfhLlp1ElmGDgiC+souOKEk8ak+YG2OJQ782
         FAGeDwhGOxLSoi0YgVZgrXOBaJt/Ro2Ms3EtXeZCoXXpd9y4bBPUriEG80fCJxGRtAlo
         xq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702313606; x=1702918406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGddqI5Zh7BKNJ5lQo7xaF0k9wunTr0qscdYg3vG1Yk=;
        b=QXGx/LVLFDgqYhcyID/Ijn0Ooq/qeZM5XYF0oTX/ecnYXBj0b3+tlKCBFw60/3hR1i
         VQvHEC9zy6C7quCnVYhEcH+Rug9Rl8JEkYtgpEFpmJ4Uptoy2EQvXmSrnT0P2NA3YLfO
         dvf+wmB66drhaVrE3yLudEDXcjR1SAQ0veX5IbXP98Mlrdn8Y8w/Q1DYjYG1snxDJluB
         PKcgS5gvS2JgOzpkhBMutOyLUDXGar65P+r4gjERjM+aV4L3dfonDKa00hisFxatlYcY
         TykpHFOf4rczpOQ9Ske7HUZuwEGaYzxPkjo/mW2CLoRTk3R/a+Afh6BKg9rYMgrANH8R
         BGiA==
X-Gm-Message-State: AOJu0YyHAYaWdDdCikFvqB08/22wgX/m/srOTbSpcBcSyL4AOInA0VAw
	eQWUsPuUhCwEPzyyn9F/PFI=
X-Google-Smtp-Source: AGHT+IFw9eceTa6fAq9hZRAsUzYF2zlfoHj4if+mUWNeRnKU/BkEdLUV/C4WR9mP+X2DQyTjqME3Bw==
X-Received: by 2002:a2e:930c:0:b0:2c9:f83c:5bab with SMTP id e12-20020a2e930c000000b002c9f83c5babmr1837720ljh.65.1702313605201;
        Mon, 11 Dec 2023 08:53:25 -0800 (PST)
Received: from andrea ([31.189.124.152])
        by smtp.gmail.com with ESMTPSA id l12-20020a056402230c00b0054c7aee67acsm3822084eda.97.2023.12.11.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:53:24 -0800 (PST)
Date: Mon, 11 Dec 2023 17:53:22 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/4] membarrier: Introduce Kconfig ARCH_HAS_MEMBARRIER
Message-ID: <ZXc+gpayQTUT22t+@andrea>
References: <20231211094414.8078-1-parri.andrea@gmail.com>
 <20231211094414.8078-5-parri.andrea@gmail.com>
 <8132d732-b9e8-4a52-be5d-74db7a159136@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8132d732-b9e8-4a52-be5d-74db7a159136@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_085331_210735_2BEB5F3C 
X-CRM114-Status: GOOD (  10.11  )
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

On Mon, Dec 11, 2023 at 08:34:21AM -0500, Mathieu Desnoyers wrote:
> On 2023-12-11 04:44, Andrea Parri wrote:
> > Architectures supporting the "private expedited" membarrier command must
> > select the Kconfig to use the command.  Document status and requirements
> > for each architecture in a single file under Documentation/features.
> 
> Sorry for being vague in my suggestion: I did not intend to make it
> optional (not ARCH_HAS_MEMBARRIER), but rather just to have a central
> place where this would be documented.

I see.


> I'm not sure where in Documentation this should land though ?

Not sure, perhaps a section in (a new) Documentation/scheduler/membarrier.rst?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
