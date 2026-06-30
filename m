Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0153DC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 06:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbS09VWaB2eRAsSQz69gLJzxmnweGNdb1Mxpg0rWuOg=; b=4n02kWIURY13BG
	xk+7DayohX/R3G87wWSjx5OHPK09vGOR4HuQNSxoLbmvHbJLQIuuKET9INa+pRGn9wkMTFtEkG4h5
	WZO5L3xQxSkOZi9njASV97bbbFWeFBRjahNUdUhQJMKRT08r5F3k2OTsDTYtHBNSCUb/Z0GYSsiGM
	wHIan52tHsHUZ5cTHtgYQ+sOEo7aiZd5f6ueKxFHg9q7Favog0pFrF1jSEkEam1svt8nTrRkym1RL
	wqU6oELfqvU/sv45ajAnDusTcM0nblZBQxd2UmdGhyc3FaDLmStdAXH7EEjgXgTqiLsGlFi/Qo8HU
	I6mOJcO3kc83CZ5GdR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRpT-0000000FumZ-3dFq;
	Tue, 30 Jun 2026 06:20:19 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRpQ-0000000Fulk-1Q5Q
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 06:20:17 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-139f3eaaa49so1766284c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782800415; x=1783405215; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGHO4HPY6x7p5Tf7iovHkacr8DByArufqIExC8CB+UA=;
        b=cAvlGypTdBvSsM+cjzxWxEKncyFeCakKdcoWaPJDqjSmS70g9G8iqf2gstMnkrdlXE
         MMNVxQMtcbuX1uffCJaq6U5xrcCiSQY7ILM6t7s5O4PsKmMjORDBPLq0uK+Jv3r6XBER
         oEXR9oDUs6O4qkorLKIeem+ZAH/p1MtD1Tvjws9u5xJwgNLAWHc6OC80k5sEmrQyKkZZ
         amlxk8iZAdUNDDvb8LNOFS3Mohr0rL+AxC1Jr2eFMXUZO/9k+0JgOQFQ7yq4/UKo8mGU
         Fc7b+e1FzH5jISnxZCwbujUpSsbjfOPM+MTHzyWB75YQpFb6dAx7pX1pakkAYtCEuNfE
         46xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782800415; x=1783405215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGHO4HPY6x7p5Tf7iovHkacr8DByArufqIExC8CB+UA=;
        b=A+5IhrMR7XvOJ6VdEQonnAkcu9gIVTcsFlSxD7oayzhd8d29AWBtFkZztEQs9AOMg/
         YuhaO7Oqz/cBhgbXYXvNrgeR4lXiwWc4WOdRyDCAmHRkhgTInXS/NAtveIgqPCP9Pzq1
         uGhxmpxnjeM1Gvzdn2OzAxC++XlaGPYTIG0c2aQsbriDzXOPdBP0qsJB638z5ZAI4rIb
         aW3EycJSMQ6eR7cUq67faxmemJNfkaUd5000j1CvXsnvw4jtiotqgN76CIEU0HWro/ej
         M6RZDYaQr/IKQ3ZlsrSGXjMw5+iN5x/n8dQbk5jel1CH7tVxDTZ+bW9lIVtUnQ6pCjeK
         Sjqg==
X-Forwarded-Encrypted: i=1; AFNElJ+FO9GxsSfRcLF8dgrsKDUMbGF9UMV2EWfK6KyLd4kmyUQ+ffBFLHvv5Jurkl2cQ2qNFawv8wdvimIc+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxzog3tYpqJ41g8UKsqNn9jmIq1S4LXMz4bCOpWofdZMG4RDIQ
	+J36Co2sW60YlQcs9jl/rPwXn/AnM+sOd9bnSi4LoQRjPkYPccQtBH7v
X-Gm-Gg: AfdE7ck+/VzW70BcVvVH4Oc2zl2WD+dTkc3US5ZZau09n0AfhK3X+ZwiSE7iXo3Cidd
	D2augT4ddSc/OvWWbzFl3cSiOKZFNjqDt/jsjYQWskz11FNi5PesbsH5y9YjDMmyLQwZB0gDKGa
	XKZYDnQRiQbuk1G31ssGxPCWiTUvr9bGBhbFA74MoFVXmLMKXqVGtN9BsSePLuYTHqQd2XSn8Vh
	XDO/UgNiusVZM/HyqQUXRqPecAPpXcJVLHShk6udisrp2c56MBUHMY5o1x1sDg9vkWwYdOYq5Kx
	bYfy1Cj8REZYawwhrBXQcgvsY2Kw9fdv+pTy764f0GMNTUsi1opsXLw9JZ0k2inMy44PVsrv5aF
	L5Gl2s+8CiGRLubdJG1UDQueh1eGCCU0DNdlD2Tfy9Q3I+9k1DF+aN6aYJebi1vqgytLyIjbKRo
	Gcy4AIhstrgtNXxRd12t9H1op7YrWEpUmi
X-Received: by 2002:a05:7022:690:b0:136:6883:c4bf with SMTP id a92af1059eb24-13b2a159f85mr1439960c88.15.1782800415264;
        Mon, 29 Jun 2026 23:20:15 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2e0e3sm4132472c88.7.2026.06.29.23.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:20:14 -0700 (PDT)
Date: Mon, 29 Jun 2026 23:20:12 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Xiaofeng Yuan <xiaofengmian@163.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: probes: simulate c.jal instruction
Message-ID: <akNgHGCfa7SoFOVq@blinky>
References: <20260627001939.3847-1-xiaofengmian@163.com>
 <178253409654.105999.9483335947060007692.b4-review@b4>
 <878q805jvd.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878q805jvd.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_232016_402128_E5CD75D8 
X-CRM114-Status: GOOD (  17.97  )
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

On Sat, Jun 27, 2026 at 12:59:50PM +0200, Nam Cao wrote:
> Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> > I was looking at this recently trying to figure out why this hadn't been
> > implemented and couldn't determine why this one was special, it might be
> > because it is 32-bit only.
> 
> Yes. When I looked into this, I had no idea how to test rv32, so I skipped it.
> 
> > Since it is 32-bit only, can you put ifdefs
> > around it for riscv32 (#if __riscv_xlen == 32) ?
> 
> Except for slightly bigger kernel size, it does not hurt to keep. And
> #if stuff is quite ugly. But I'm fine with it either way.

Yeah that's fair it's not necessary. The thought was for
"documentation"/ just letting people know that it's a riscv32
instruction but it's probably better to just leave that off.

- Charlie

> 
> > Can you also add a test case to:
> > arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S?
> 
> I already have a patch adding test case. Let me send it.
> 
> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
