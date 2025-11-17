Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A68ACE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 07:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RPOni27NuGfETUYzYDjpK2e7bKbiKs4D30BCs9zFI8=; b=Ohqy3rP33fLRgb
	KP8xvgHTWzumkqbCO/XJeYNatS2GSqJx180F3dNd0svXhhGXakr65YXhBwiIXWOmCKewRI4oaSV2S
	wtnt41NGh2je3/HpX+nfRKsR5FEvv64V4iliGZwcXVlGgHFOv719oXiQUSs/AEq8qQg6VGrxS6JxN
	+RI27O4zXZrSSGdSOSIHbd5PrsEq1sLSyq2u2AmAmInaMRmr6g3fTUbeFSquFNeQQRFPrTv4bBAFL
	3XNCzd8h6tsXz1ZAT0JPBUrPTgcKR5DC5xCScPsvmtI770sHBS8bjTk68FekgNO7T27rElIDhhQvB
	oY6jfvBrX9Xyzt8IHNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKu4I-0000000FeLm-27nF;
	Mon, 17 Nov 2025 07:54:34 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKu4G-0000000FeKa-2ENr
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 07:54:34 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso621824a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Nov 2025 23:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763366071; x=1763970871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJFYXjrZqLDFgZC57MuR9/7D9zTgqgt6RRzSRexdHss=;
        b=bCZmrUCyQ3B8GQyI5q/ZC811LBgyd04WLrkHX34VTOi2trGjnvS3BHYuE82n7V2H0I
         SZ+XaTNH6jHUS14Qf3BoZHS/pfTYpf9YpEyt+fQrhn7DGPOVfQNT+aSu/exG5BFvC11I
         1+OuWEMl5GPbXUqo/mJoOeOUdrltpXHMG422RTOErinchldJTcL2vp1vk8TyOLdDmSWD
         gELWyMB3iqPZcUoqaQa3PrOGJxduWZvFj8m/6oKqwNgGIo6Xo4ZMdJGelZDiDugYJMIM
         EHec5fCj3G49GawAlL4pGd4z5cs4yazZb8g/68b1hcIGsXyUJ3sHF5wXltg09RkOEWeo
         g2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763366071; x=1763970871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJFYXjrZqLDFgZC57MuR9/7D9zTgqgt6RRzSRexdHss=;
        b=P0Mv/19l048rBFYMIwg+RhVcKiB/HEscfHas6vVGGA/tzycIViHTdJLebNZwdPaT9g
         7Q9H5vJQTJfatJ+H04LTEIL+x17dNNote3WEWL13R+t2cpU2xMeVYefm0TdNWdpbxsJY
         iXbbmv4OgIueO8zapZlMmKP5fLY1alxQwZ7hykRNNmRFFXrwrVl22PR7vgLX3rS1m3bF
         Igg5UVoXdy2j+hRn2dW7uD0YEt1VBlOCQimzCd4g0czRpRriYeZzSMRPYm6Es0/4igMY
         F5HS3l7Hmx6bNtrzoe03T77AMmW5uoGz2JJDFpjLIoelRXmxWX1ptgO2NvHjU2klptOG
         QBFA==
X-Forwarded-Encrypted: i=1; AJvYcCVtPjQ6/6GUsgZYfqrqIvZ5iZ4ebhh4x3qoV8z5D/frlfnpwPXq/r6wWlnXL2Z1TCIbIwKUNklrtZvM8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeJwOkCp/SZPlC5PJxe3JmiKAE4mYoFOYf20Cyr2W5eKyCNXhR
	yVSBzzZziZea8F1/szN9yEjBarL5IMuDRSuNt5TuJacwvdHn+l0ZKt80
X-Gm-Gg: ASbGncuqthYWvvzuDYLbxr4fpDnxSeM375ek2TQH3c7r18MmdE//FA1kutAM/+rTbdI
	GhCG1UFYBU8LZeRaHo/A1J7RKo0jAVM+DfQnFxtKso7RJWWkY5lD9R59Il5a1U1IaKQIHcvn244
	BXfU8xxxofqB1NJZTCHkDSxFTKBJkpEdElVwU4T/uweGkydYbMkueHBTo8ShpsqV0YHAqhLILU7
	7YgnaqDMcFuwmAENqKBfvwzIxg2maY1kVxDqyTbyBZ3VazSHN1Fv1CF3Jl4T8pYv9eNXUOCBgIf
	EIMBNMzRj0UeoaRphXjTkYkah1tQ24YP2m/mIUGtKOwFrhy+vJwrveplbbPjuC0daHIMVqfV158
	EK8KPHeBnt8hwpmdJxmgNOVMVXRf/dwXke73JayrSCRv2mgkADEnPi8STJo4ps1jP7aoVcogzh3
	c=
X-Google-Smtp-Source: AGHT+IG9sGqvuDwl6M8wyl+rjAQw7Vc6OPhJaA3ppAqLpuVnEaDJYf6M8j/2uygP8YUk8imuBKovyw==
X-Received: by 2002:a05:693c:60c6:b0:2a4:86e5:6b2a with SMTP id 5a478bee46e88-2a49af801a3mr4018516eec.14.1763366071370;
        Sun, 16 Nov 2025 23:54:31 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm57344385eec.1.2025.11.16.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 23:54:30 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Longbin Li <looong.bin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Mon, 17 Nov 2025 15:53:57 +0800
Message-ID: <176336602776.743994.11109487529493161809.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101014329.18439-1-looong.bin@gmail.com>
References: <20251101014329.18439-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_235432_571787_A3CFEFBE 
X-CRM114-Status: UNSURE (   6.40  )
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

On Sat, 01 Nov 2025 09:43:20 +0800, Longbin Li wrote:
> Add top syscon device bindings related DTS change for CV1800.
> 

Applied to dt/riscv, thanks!

[1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
      https://github.com/sophgo/linux/commit/565c450124c105a0b4f4ff3265e19502d44bf23b
[2/3] riscv: dts: sophgo: Add syscon node for cv18xx
      https://github.com/sophgo/linux/commit/126a1b3c61cbec15ffaadf141adb9c4163da1757
[3/3] riscv: dts: sophgo: Add USB support for cv18xx
      https://github.com/sophgo/linux/commit/e307248a3c2df4432a7bbbde306ffcb33ec55898

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
