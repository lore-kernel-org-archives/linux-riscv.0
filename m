Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FA4D111B3
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 07:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCLtICKT1o6JcQFiif/dOwtl9EzpQBlZ8csvkip+ZuY=; b=R2anhmx40VZIy4
	G7K3UPrtIXQFzlJouIupiKNSqTVQohqV+w9QbepY6OEg0gHvLP8kD/MJtKG75pHFYxTo6fiDwiFX0
	t/zoYASYoEMHgfUJ8g5ROw1Dkbml9rr91rQpywMAumgx04RtRoSsXcYTOXjN/SD40IFCm9k4IdW0w
	qifac+2WhnLXzGOcKfUcKStwe6Z96WvD3HdnCotJDk+wWM1jAqNEBwRNKLM0MTIAXthbqspG/uqtR
	QMlPFD+N9HuO/kJu7ehM+paLv9rM1sDuAXi0CdurFjpUL8HctQsWRYIQpQ5XMxcn+nu+PDpdK234e
	scbd/I4lYKwwpjSF4AyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rHH-0000000CpW5-0T30;
	Mon, 04 Nov 2024 07:13:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rHD-0000000CpVN-1jBz
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 07:13:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso545618966b.3
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 23:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730704405; x=1731309205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oImu3BDF6/CvLBQLJIYfDXK8FedxePSyT6Ukp32htEU=;
        b=jCJdgR78pnI5NrFbT+wvA2f5yQgsmVyLA8O3iECVjouFeZEKGsMOWMIaZ+1YvaIwfE
         moTCn4SXeZWZVY/Rzz+VQhvMN5FGS5cAJlKpgbSEvL7j+J9dyPUiUIN/fVPqSnV7wtli
         a9WmCKwkzK/98erGPwyGEhkRTLjB46afYOqb9fcHoQs3zKqegv9eAwLlnKUeyKIK9PJy
         ifsZdjnjWx6Qx8yi2NQH/S+uW3udcIGM/BY5iN74ZvmmK3dYCZfLk+viwfg17WaXFfsS
         SEJmdtPwYt+i31d1X52tEtQHJVieMJq632Y65XtIw3ZLwMrevMOgQAlMGSIVTfRGHYRx
         YbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730704405; x=1731309205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oImu3BDF6/CvLBQLJIYfDXK8FedxePSyT6Ukp32htEU=;
        b=hg5dN9wvd0dYMQ5VykUNLQrWN8ky+uD0KmFiROjlRmc/ZlmZ4IKeREOO+r3ZcyGhQq
         v9uaeMar/DjXY+ueoeJeDMOnU1KIgBVsXVmd+zvRHujX57mvJhn8MMECsFvl52ur67e3
         UIl4GRvMyoM+07vOMx6JBHoC4emwyX9fp/xAA1jJunJS17zbjtBbGk418fWhapMQXUNI
         LyxS9WMextmHeq/84OtbnTzHttWWEMeSAnMrScWzVRCLEkirQ4BmxraCCvBEOVLkfwJu
         ZBfDWM+LtQVNJ4/QFEmi3FduEPcKN+NG4uy7yDcKUc8bIPto57l+qNeEenfLnzO14dCH
         mqwA==
X-Forwarded-Encrypted: i=1; AJvYcCVWB2BsVp+WnT42jgGeSfTAnIhp7xnUZzAw2qbJCHL2YTl3Xxwg7sHYZOs/PYwJwkvLyjsitA3OWsYTZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWnL7S27X7gMBEnOT9gIXWMsavayn4L+tzJF8juGK1eCYtDLzj
	YL293Wow9XXi97jlNABqyYFxb6btFwFIGLCIxF4WXZauVopH2IUc
X-Google-Smtp-Source: AGHT+IFYIQZXhx+OysSO0fTZLSwThb7s3X8HqjAw+0oYmWSu9pnc41l1DW5ZVPldKXfAb5lkarCoEQ==
X-Received: by 2002:a17:907:9815:b0:a9a:9b1:f972 with SMTP id a640c23a62f3a-a9de61cf153mr2820354366b.40.1730704404610;
        Sun, 03 Nov 2024 23:13:24 -0800 (PST)
Received: from andrea ([2a01:5a8:300:22d3:2aa3:fe1f:17f7:f982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565e09bcsm513885466b.126.2024.11.03.23.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 23:13:24 -0800 (PST)
Date: Mon, 4 Nov 2024 09:13:19 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v6 00/13] Zacas/Zabha support and qspinlocks
Message-ID: <Zyh0D9N8SgQd_zne@andrea>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_231327_473913_A7D2C783 
X-CRM114-Status: UNSURE (   8.34  )
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

> Alexandre Ghiti (11):
>   riscv: Move cpufeature.h macros into their own header
>   riscv: Do not fail to build on byte/halfword operations with Zawrs
>   riscv: Implement cmpxchg32/64() using Zacas
>   dt-bindings: riscv: Add Zabha ISA extension description
>   riscv: Implement cmpxchg8/16() using Zabha
>   riscv: Improve zacas fully-ordered cmpxchg()
>   riscv: Implement arch_cmpxchg128() using Zacas
>   riscv: Implement xchg8/16() using Zabha
>   riscv: Add ISA extension parsing for Ziccrse
>   dt-bindings: riscv: Add Ziccrse ISA extension description
>   riscv: Add qspinlock support
> 
> Guo Ren (2):
>   asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
>   asm-generic: ticket-lock: Add separate ticket-lock.h

For the series,

Reviewed-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
