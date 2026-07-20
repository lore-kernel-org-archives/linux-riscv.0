Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559AFC44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bsz0l/zKok+HHzDOqHlwljcnYwvz8fLDFvkgqg+3gHc=; b=kvhMAPKDbaKEPO
	LLp9ydE+4y4dxcOZdqtAp1QApqEgZVZWuRBhyLIVc5c0N3KAq49LnXCnMiLIT0vJAMOoEiMZR2D8x
	vgUHLXFJuqZzQQCOql/Ln90BSm04ssRjVRDx1JNjS3b7u6j3gSvEwHdCi2vo1+FAzTYYsB4vnAt9c
	7JQ07ybx1h8JG5dhQbJbcQ9jyRPsnmNqwffLvNht081GsdLZ9yYuALC7X9HNGRFSNrDUpzKmQWB0+
	zqkRi3v4s9Zt77HqAEsz/A6u/3ThsA7SGoEXr/pGX/O5wRD8X8WnaeMm673uhUVQtBBjKgJruumOe
	mm6742kvjww8C7RZWN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliLy-0000000649h-0TWW;
	Mon, 20 Jul 2026 07:23:54 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKV-000000063HQ-2tQy
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:27 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e347638adso4853866a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532143; x=1785136943; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nEpkUtKIjl+LLb7gWLja03h8AP/aK+y8njduXSgGt0Y=;
        b=RkdY+xiJIEu94l3Ok5rmY/ELxmR8GPpzD5O+bibJAq8wnI8cHAgmeMUqQm6dR/Ni/7
         IUw9KXTSZDIN68+K8XdQndk+HLDJ3JBVg3UDzLmaguzLaeVjWHI5Jv5HEvr0truK/pC4
         Jz/f0k4IKqXvUMqCclnuMLqPXxt9B8tXpmFQBUO6lalK0+pns6GaBqvf+a3Vent39Byr
         iQmX5PbzcZejK48tWm2WFOgeKUvR/TCWnrnpxRzr3OQaAsGeLhNlrlFbN7oFNh4PIXv7
         6m5ohmHaspRu6ez+Y8Mh4VN9IZJBcuhzRvMazIsQPZVXKtVk18dW8O03ZZWLEk4bz/rB
         yIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532143; x=1785136943;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEpkUtKIjl+LLb7gWLja03h8AP/aK+y8njduXSgGt0Y=;
        b=Afvibl0tNqcsWDg0VO2hZyR8jbbMzNS2HezUNQahvn/VRjWlAXoYBSIc0umitZJISr
         a1nXTkyZDWaZD4Sl9rpnx4QU8tiGr1/MDquJr/9UcdIbaO0LMJ/cj4ffoo4P5QImt7tS
         JiAEYDWMMZrBCv7GLsD195phCdMwJz0NCHLkJLsrKJ8Mm21bG1xkCbykfPQn0u5i1bKm
         s6O+SizL5G2g05seUQ8tD2ZBihzwbN8Duca11paiN6ZeXWbkZpO6E0Va2ySJxDJBuhBV
         Bdk/XWQ7w8x4OgTgXtAYpKYwq0Jq3b/FjGMzuhxHHaSAgwhjouwyZMOOQs62RHwySOxM
         C8Fg==
X-Forwarded-Encrypted: i=1; AHgh+RpbRx5LBPZXBZ9zphG2HZCj19bR67ygYsQ+WkWadB1ahvkvamkXpOGRdMpr2RZ3w5aMSOvO3bJMUNoaCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6W31AsOclM7M+zINnqv0pa2HSIBM0zK59zKAQGwSLicxS9IxG
	xSTqQ5mGIMgN+fLph6EWnCOQSsiRumBKLvRBLZmdS0F4WOdNktCbCbzv
X-Gm-Gg: AfdE7clrS2YoYm6A1aTkkwzdw1wGP1qo1J/yVAjSKSlHiViiRsE74ohxvM7TU7FAuQV
	heVvJGoh0IJnAbfInqDocfYvq2M/JTlhUTnwy3MJ9WNPG8ZJ8cWHrGwMelqLnoJEONuTSL7GRXJ
	SgpPbsxjBAhFxt1ghl37Qi+30gTORRumj/pqO8kYDTm90nYxNTJyhVOizJvBkB4JsANYFmx80h1
	pSaDdgpnmp9FxyKGBAaUKvoQx3zv3oDwgocj1cw/PVuUz6kxlYr9iMkGDf9l1wA4uBeoBqeXm+A
	brRpT4rUunM0hoOBg+nKhVANXno/y8bebCka29u+fjzJoLtQRz/uN/A3cqevEAZCVeAkhacOnMo
	sPZ6zOo939QQSwKeTJkTn4/DpynGakP1pAalroISJhttKQRh41n8iBS/fC95VQuQd8Vie3MaLXI
	b+MHULptOmRTlIJkRhNtBEJZBTz9Fl
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr13633934a91.23.1784532143064;
        Mon, 20 Jul 2026 00:22:23 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:22 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 13/22] RISC-V: perf: Add a mechanism to defined
 legacy event encoding
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
In-Reply-To: <20260701-counter_delegation-v8-13-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-13-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211939.543975.5882607179348590229.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=570;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=1XyajoagXXF1cyqoxgWIfkPGgjkmx65YQW1n9q1RyH0=;
 b=/MLFbEGJ3IvpPk1FcJeLIXZiS0wo7JcDujhTqTtOlA+FU5IZmLeIwq10e5fvUIQgKvN3oOFa1
 ueKKBNO9KuQC2Cd5dsoxEo+onzv+Zm5J6b8itUxDO/M/Am3bOLROYHJ
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002225_435822_2C1160D4 
X-CRM114-Status: UNSURE (   8.97  )
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

On Wed, 01 Jul 2026 01:47:01 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> RISC-V ISA doesn't define any standard event encodings or specify
> any event to counter mapping. Thus, event encoding information
> and corresponding counter mapping fot those events needs to be
> provided in the driver for each vendor.
> 
> Add a framework to support that. The individual platform events
> will be added later.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
