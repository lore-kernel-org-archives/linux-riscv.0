Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86781C982E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 05:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPvTI8fV+p+KQQbC6+N1a9cR893fm1HZvGTi99GkCzc=; b=ByEYDpLwUfLZTx
	5ncxflNjE+aQ8K/FVy8k3+loIW7d0uob4CFGPSPLayOW5EH/YUkxxdQcozKpD8tOFyCDg2Th3xyU3
	tv6+6aCzqut1hdogmkXfQRDYbpMv4ChoYW+F9FRuXjEgiaolSNOeRpCfNBUflNI1HyTmtdKSRTdJr
	1URiGdOUELvy0e1vaXLDFuC2JVpzTy92lqu+H2Vm/LE10TR2+k5F++RuljvezonhWTB81ZNe+I/iO
	ilSyyXTiQ8EKsD7EOkulmJfwR3DBbUX0mMF0vzUdZckMSLrKNzUfViWz98dNy1vH+VUSwiNqqunB/
	d02V1pcRRLUCiaOsZzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WOT-00000000twd-0PPp;
	Mon, 21 Sep 2026 05:16:45 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WOQ-00000000trs-2qnT
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 05:16:44 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so2170433a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 22:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789967801; x=1790572601; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7srlCwAy1xF9AsQpfjjd9v1D7/IGjTVIP88iEg8tDSk=;
        b=PUXHtBsuGSlhj0OSCQn7d9cI4mpjmGNhUJ2r4/c9H1i+9QiaQq/evtnBby1jgJpkUH
         MyqDY5VdSNR11x8LgREMBjD1rG8u2j9PW4HP9sNq9psjynfVHGRM3YiQ9mEFq3d5fCJo
         7/7jBV+z0ckBkzyMYFTyBDzw60t7ICXF2XajDky1NvzFcss2cJ2pBaS2VBdOVcz9MYcb
         DMc/t5CQ04aSmfq5HAXrXTTQ4EcZqzfaIkaIcJadGSRYfvVO+NPePbQuvL6Wil6hbi4l
         GWK7QxOt0SwvDUvOUKPKHRM9LD4V1683a+Bta047j1ECwXV82c0Pn1cOZFvYf5vDSLqY
         RavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967801; x=1790572601;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7srlCwAy1xF9AsQpfjjd9v1D7/IGjTVIP88iEg8tDSk=;
        b=sGhwaMIshLazG0/X5ky3A2CG0kIfQKGc+EeWHSXJEbFYBAyco7UJMsJ0vvrG0lgGhj
         CjC1AO+FO0U49+etZ14qGpiq19urZeVSi9zU7CxFmkMG5rJ9wo1h8OiO7w5sT3cX6iN9
         l/FV91u8OSdQFKnrFz29QKHNy2U8JN3lVPv6X+Bg/5N/tYtB7bX1R62WUcJpiDy+WPua
         JmXf+YRvmdDEX4f+ZvEN5ALOXoDA6go/ZvRCu2LyKINzE9AxISVYCafCc5mPUz0OEuMD
         GrTrOvEaq0/+SXl7U+jSn8fDkKlasj7Rfo0CLWPIKEFJnegAh3Tad0X4O6kjcKVCH/Ma
         jXIQ==
X-Gm-Message-State: AFuF++l9DvJDK8uq/od2AcGzh0+RAXp6hJjSQSCcouop9ur2CRmALUCm
	s3rdBY/evYslwPOhb0MAdUN8wkkGBtl/clvcc67Y3EjfoRAZ84/TreaQ
X-Gm-Gg: AYBFou3UaydstCH5Rr9CnpixFsZiU0MgOyGuz4Tv9EphNXQTDTZbVreTwu10IKHpc39
	9Q2zilh8SVByawxIMqRSl1ujEitBwygSVimonuTwsrm0XpRoHvuyH4ukItOmv6u8lh9k6nFcj9H
	gMjtes9wi94hS1Z2P/42a36ECFQymXgueFGw/Z6x6MGg+Q/pAiIYPXsCB7tOk72bTItvKRI6Pet
	lUz/H4J/Qcv7+beBFqU2Ju/dZ7raQyr5bHBU1yAf3n1cHwPWrR6GcYFlpQPE2Bt48nncd+lR1BR
	30/g3qGPnqrwEWe6BjnX51XpNPORUlKOyzXHdwMRS4klFjLLko+HYleCZseMwE/rSB/trHkEbDk
	OU2slbBIDifvB8qQCOsIWDBwU8JCvMXFPXaWtAHdupUbhe5iSFRTtAfkowVVlz066mqk3RyRVIC
	yXa9kmev/UGmi9kvq+X1XFzpK7QE029Zpwxwd3/dg8aO9piR1CXpTFx0DGaJQaf4UeQdMXzTItJ
	bPlhB3nawvxaKvrCFzXhnWZhYIj1FJx0JdTAIxoI0tfwe3ZGcS5y+U88A==
X-Received: by 2002:a17:90b:4a43:b0:39f:b29d:ba3e with SMTP id 98e67ed59e1d1-39fb29dc1efmr7820384a91.2.1789967801423;
        Sun, 20 Sep 2026 22:16:41 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17dbdsm17114682eec.1.2026.09.20.22.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:16:40 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 1/2] clocksource/drivers/timer-clint: Add ZICNTR
 support
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Jesse Taube <jtaubepe@redhat.com>
In-Reply-To: <20260625134752.3107959-1-jtaubepe@redhat.com>
References: <20260625134752.3107959-1-jtaubepe@redhat.com>
Date: Sun, 20 Sep 2026 22:16:37 -0700
Message-Id: <178996779709.23212.17122297709908983835.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789967800; l=835;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=IJXE/AAwLLrhFbKeRc/sXWo84V65ddEh+TuCXP7dNpQ=;
 b=jcGPQvSH3J4vOJoQCuoWYGp03/nekB6xA5dqhb48baZTTERwaQyiyfyQtOVApCGjcF3r3hDCG
 5sSrzSSY6+4BODWmvljyUyZr79ekMF6uxiyH8PSgWUnJyf1oCrnOvE6
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_221642_741889_2FB44822 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <Mr.Bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> ZICNTR allows the CPU time to be read using CSRs, which used to be the
> default. If ZICNTR is supported prefer using CSRs over MMIO.
> The clint MMIO is covered in the RISC-V ACLINT spec [1], which has
> not been ratified yet, where as the ZICNTR spec is ratified.

It's actually stronger than that, the ACLINT spec has been rejected:

https://riscv.atlassian.net/browse/RVS-3645
https://riscv.atlassian.net/browse/RVS-4913

> Using the CSRs also used to be the default, but was changed in
> Commit d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> for M-mode systems") due to K210 not implementing rdtime in M-mode.
> 
> [1]: https://github.com/riscvarchive/riscv-aclint
> Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
