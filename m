Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF14AC3ABBC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 02:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMvN98OnjShaMs8JCRVP8GW1UZ+nf/x8GTxy0XsDcgQ=; b=Yr3aYVFnCoLvr/
	RsHMX26ctAehgSe3Ea8FitFAlVjUxEdixu3Fek20eXUxMzc4QbqQbjz0QGldKjAG450g1iTqdoxLT
	AK4NUEWJ1JysTexc2V58XCQRP470oqCa3POfpIxQ4mGHS/cnF8Dx9vgnLc9xLCfv359GMJxW+JsOD
	gf7UMtfvXL/Wf2+70eD9+NcA+cLpci8dqoNLv/Genw5UJTxLpVQXMS67M4eruEDm33vDaZc64XBxq
	+rgdMv6T1pmd05aTHbyDXN4tdj+i75jykp8vLzOTpca32+NH4Uf2L+LapRYb1iAYCu8SLt2Rzh+fz
	j2LJd2zzuv9vpF5hC5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUct-0000000DycQ-2CGe;
	Wed, 07 May 2025 02:35:15 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRzU-0000000DjTj-36NL
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 23:46:26 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c597760323so652910585a.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746575183; x=1747179983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNpUQ6GumF9/TU6uK+pRbTYeJUeB4xU1u30e/GuoHLE=;
        b=IFP/8WV+EnhB6xuUNf7wpAbcNSemzZYZ/0pOooC+ScE4b5P9FZWzL9W4U1pFMp17mK
         qSMSfad7vGS46AIakbK5SJf50tGoJ0CxPnFCQF0xWJrB0NMuzxeiU0eMDbSExrxRDO+9
         7676/Oc8pzyjpiUmvrc0pSGb96fKxf0fsGgCsP+8SPfANwq1eRqEWsX2gErUw/Vl/NTc
         lfkmcJ9wXcApxXUqemrHjN8LXEps9TqFEMv4W3XE5og3XwwPyRkF+19n6jXc59w9car1
         gjr2DOU1etbp0ZVRNF9XQ3Hno5EO17mpOo/zGThxdOVhssVEZyPiQVLK9BcoawNXw1UE
         Ainw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746575183; x=1747179983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNpUQ6GumF9/TU6uK+pRbTYeJUeB4xU1u30e/GuoHLE=;
        b=hnDwNSbrfVMxkUj8Z0ZSparThh9Yw2bLzZlv1/KGU/5LK8T6LF5ij2+hmF4+3LZIXR
         wwa7xL9XEJIgu/9PdDRziqntYr/VRp/5Dv043uydp1kR6bPhd/5v1Vy+TucUJaWXSXLZ
         N+t2NShSRGLQZPnYoyGMuKWpGlgqUiz+Wk6VD2BvAaSIEWBnB66QzJGSCZe7z5QYqUis
         M8iaL42uiYMfdiKrTtYNT+68fzu1p+wro788y428koHXKz0IAZj8cOuBQ3Lfd8uixjbj
         yzZ6REmqT5CfL8EcEH/rmaa7Oe2WA2joh0VbuZZApg+HI686poV96ILV1z3C/ogaG4N0
         HYbw==
X-Forwarded-Encrypted: i=1; AJvYcCUOTxolOXBfT7wLIg6HihyiC7LZNL0w9y7gUgUc8bPvsVFGcrLZS9tNo3kZHR4umWzCq7wcKxDXknWO1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf2YYQBMKcHPN+MDQRM5EfNhA+eJKf8mtXckSCc3B3d2S8d6ay
	gOoQ2KJElkkUXXZPeEF9AS1qhE5OOz0cVgcq/HYQHsiIjZ+lfwT0
X-Gm-Gg: ASbGncsACTALzR7cDaNLYZ4z48DI/V17jcUlYCEt1An0aiy7P4IoIsThDooF0fvDdjA
	K8iM2lcHbCADafpkBfxY2tUNbCMUJfx5VsH5KeljWQ9pCIOJ0EUmXvu2LbkC7xsI7YT9FYQjho8
	sTTd/tkgaiEjIMhh9NCJCJ1lP8C0gOD8vHvBWzEuNwCLtLnPEPzrFLL0x8RE+8Xj4S33ngq7KSA
	lBS6SI2q8u/66COqS8GioPj+AaWK8P/YlEG2qlDyd8Ho92SliEmKccx6Hhi+nbjwvkT1Qij7/Qm
	vJ9UUJuL8j5XRtnjpOiY/lapnx8=
X-Google-Smtp-Source: AGHT+IHeDbXh28cKEU2lNRj30EE82yC2TAKjYla28J2iicvKZY5F7e3fcCLy0NDluJznncuzGWfCsw==
X-Received: by 2002:a05:620a:1724:b0:7ca:cd43:e46e with SMTP id af79cd13be357-7caf73fa4bfmr266382985a.36.1746575183537;
        Tue, 06 May 2025 16:46:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7caf75b87casm46952985a.74.2025.05.06.16.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 16:46:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Wed,  7 May 2025 07:45:53 +0800
Message-ID: <174657514013.201370.6246239358631068735.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_164624_778540_C99CAF40 
X-CRM114-Status: UNSURE (   9.84  )
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

On Sun, 04 May 2025 18:45:49 +0800, Inochi Amaoto wrote:
> The part 2 of dts rework replaces precise compatible for existed clock device
> with old wildcard one.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250430020932.307198-1-inochiama@gmail.com/
> 1. patch 1: reused sophgo,sg2000-clk for sg2002.
> 2. patch 1: mention sg2002 refer to a real device, not a wildcard one in
>             commit message.
> 3. patch 2: fix wrong data for sophgo,cv1812h-clk.
> 4. patch 2: remove compatible sophgo,sg2002-clk.
> 5. patch 3: adapt the change of patch 1,2.
> 
> [...]

Applied to sophgo-clk-for-6.16-rc1, thanks!

[1/3] dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
      https://github.com/sophgo/linux/commit/6d880961f5f9b84d13fb4a0208c7405966bc3489
[2/3] clk: sophgo: Add support for newly added precise compatible
      https://github.com/sophgo/linux/commit/dd8bbae9fefeead76f20cd410a5a8299fcbad220

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
