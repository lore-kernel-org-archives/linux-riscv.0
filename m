Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C21D2ED11
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+nCvMOwz0i5c+aBKCEW6q2fRx9F2orH8WepRoCeRrQ=; b=jYMjvWu59MTPIS
	6TjgcNRYvrDL0fZSPHDzvbgweK3HQPUA9pY7cPVaBQn87A/tNjJUd/P1P4revRm9vKJXg8d5aDxPm
	76UL96K1EvEvUz9/ivsb6hKL+1tW+eiG9LeLgXzk/Mvq1MBlbXy9CbRYq/62j3VwZCe6QY/UhUoBI
	tReZ2t5ISHgJMdrHHH+PqoyP3doJM9cmuSGl33K7FZgnLvuGs6SjYo3pVHrPU1T5wMHEeIadC0Ife
	TrHw9tJ9RNkmf5Rrpd5B881ZrISKUaFW87pSL/buEm/aW4qxG2wouGS69Ooz5lDU6mGmJgrQJYmj5
	v0kLD+ZFhFzCxkSj3tHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Tq-00000003C23-2Uj5;
	Tue, 20 Jan 2026 04:36:38 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3TZ-00000003BzF-0LwM
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:36:30 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7cfd2be567bso3031103a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 20:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883780; x=1769488580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=VOi7xXj8D+ZdgAqRwDN864H79Rm1wd1E3pn5QgWLEtLTepqJUCtEXDHuIiGoFPneiK
         3ShJ7G4X9bjuhQ8s7qjop+ds6f5RcTWVKS4VqQnzgNIrD2mXoZXSZaRfuwbwVIegngme
         s6y6Q2AR5Kr/jkhJeRuVwn2gab//wiNJJOorpEg9VsFfW4KD22aRP0nQmiAs2WAjI9bs
         FZiC2Ei8CuGGy9jXnPKHYURSWxiYkHezAvJ2bCe9BK5msragjH+hRykHLXWgGexh4tnv
         KBpjHK0gdhXs5q5UBruGkftOYVyNYc8sHHm6vDFmW4A4EuvEmSuNg7QNMNZjcrfamOd+
         fkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883780; x=1769488580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=C2S4h1WtKxW1BJcXn40CUmMAppnAQv9Jqz6A4316a1bHjH985uUBQhqI+hYMvBsVv5
         x8KEXorC/1ODdXJehtZ6hba2ytaSYBa4WooBhX6qTRvBiGqU9NlDUmiTACq+nVENC1Mc
         ShicT94NJH6D2mhQTEE36HZz1mhRxtQABOgilP9yb9sF+EGQlF4kaz+djarfL1Tpxjo4
         CdkexyNfEOHhWCNZUyBEzOdfNUvXJ3E0dDkSHsk8k8wUcuhas69PIevkyP52sLzf90wd
         elWn08a6evEmK78kcDQvq9u60bIkhVhCxZDcuRzrat8wWO6MRx3o/IwfJ9xPoVgUyRyI
         HmJw==
X-Forwarded-Encrypted: i=1; AJvYcCWD/BLz4Cwi1Jv3Fr9hqz3BC7IFgtBNHhBo+A4yLF4ajalrMD+z1k1MgrgdvLMC5FYC5qredVD4qlxvzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGGqC+j8CsdLHoEqEsg1aPr2DxhYwN+dvciXEOA7X8A4XPQ1pq
	1ta+myaOM2nf+GO7rCl8TAD0ztivlCT8sB82dUbgceI8i1IoM0xGEfJGc2KyfEiV
X-Gm-Gg: AY/fxX4be06J7TbJy0/bGtvGNE4v4D+hf9Rhp0FVk8TSnCzx7nJaWDdnV8RA45wC1QP
	mttI3MB2vOi1Uh9x42c5RxtcUSI11OFbUfY7XQdiF3y5VXnr5bgYqu24jLyViNfb3QtuWMwqxgP
	cJz/44K/GFSbTihyS5Za0/zIccWwFoXlm5AwoCLfSuM77/0JmZRQupJzK+7uIRaadTTvp6llEtb
	GJAIAW73/FO6lMzOObTSUq4l3nVH64WdWSiCvhPZ6EsMmIgZvA5Y15Xh8mOyztrIl4299MkAdue
	YTGs/Aepdm4pJB4fkyQhxYlHyIBEZTQCBlfnCjwd47rQ9ESGdXtccbGFAQ6kYo3yst/ApgfLJXt
	Z7aenLp4jvwRBf2jnBOebCBsdCbgF/qTSVrzuAS2yr3VDvTHpna7tStYg8RZqA+Vt7v4xdmFmm+
	MyNQNpuNOR4g==
X-Received: by 2002:a05:7022:925:b0:119:e569:fba6 with SMTP id a92af1059eb24-1244a7195b4mr14136099c88.21.1768877353611;
        Mon, 19 Jan 2026 18:49:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac585a9sm16856206c88.2.2026.01.19.18.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:49:13 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Tue, 20 Jan 2026 10:48:55 +0800
Message-ID: <176887176536.427065.4468747981087466363.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_203625_693614_C62E1ED0 
X-CRM114-Status: GOOD (  10.23  )
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
Message-ID: <20260120024855.kR6DBze1o7SJuFZMCxsIB5FaMyKQhMavwcSfQSV6Qrk@z>

On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied to dt/riscv, thanks!

[3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
      https://github.com/sophgo/linux/commit/f16ae81b80ca4e721f4c4ed1f28390115f7721eb

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
