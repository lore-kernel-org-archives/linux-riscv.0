Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B376CC5472E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNlufYx+lm84bpq4LgLMS5ubX7RyY6aowZaNr2MGgO0=; b=358I4iPnS0oKqc
	eK2QU8dlmZJj95gWZga0CZU6OfMtK1fdM4dFXITyi/TKhKkqu9KkcJMVtoZ3WvyM0mevmyVPSS4Ry
	htyzlBD5UXGfnEHIYTAHrxEDQs40y+6++tr+fOqOTSB3Nr+QWzQbaLu6JVSanLl1bPc7auiRQqCWq
	bR+akfrJhu2InTIMUnQAmcWzQMJIoI+2ja2GBYDvyp74PLB6GC/dbOWRSvDfVkbGdNAN0OKoHV8aq
	n/uBDxS+RSdXfgDPwW5H5BX0g6EVDnSIgCRqV2AU5FLpruXpI7hXPPr4Ltx/t0lGxWd1v+it7wzCE
	r0qM17o5kTHwNuKvHTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sifVa-00000008VvO-2kkD;
	Mon, 26 Aug 2024 19:36:10 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sifVW-00000008VuW-4AQU;
	Mon, 26 Aug 2024 19:36:08 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5bed72ff2f2so5831287a12.2;
        Mon, 26 Aug 2024 12:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724700964; x=1725305764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=24/d++V0Ue74kmJqvS/DavXrN79WZ4nLqogv72kXKno=;
        b=T1ToLoox4nS9NletOKoahKxNIs4POFc3IE1cE3mO3uNP1tU9Mu9RaUb212PYMpUwwF
         0OzU68TdeGvupeZpENvqqhb6ki4f/X0jATarolgZKVm9IwJFx2c6j/4o2asey5QTULNf
         11A+1aSi6LYqU+Bsf4Aq0+tZhTiOZW1Ua+o4XnMml+UEXiV4yUMXXgLpJ9SnMdyz5dHH
         RbT2OCKEUBrthBg28bbBSE5/w0W1JYNoaMrV1Te2rpB+bTLsPUPgKquXnG7YXA5C7pIQ
         UpU/K9hU2Ef4lAJT5ZYv8QaibaZiABgE1msvB1eqO3XepdLAd3L+OPeYlUAnjo3U3smp
         Ta/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724700964; x=1725305764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24/d++V0Ue74kmJqvS/DavXrN79WZ4nLqogv72kXKno=;
        b=N0BggptBm4zQeuvRi2gGamaJg2FCRyx+QZ3Raborg6BqH7b9Qh0FKBSamk2XeZD6b+
         KYJGI0UJXlWLPby86wW5/ms8j7WNVx51E3RyKRofRZbH/c/Qi0RyLLn+/OBMW9bRtZhA
         pREIt2OnnwOBZt+/Z5ICi9BhH4JQeN772Z6Wubmapm7+FAjqUpvsOvBC3trGDH7fQ1WG
         bfRK01c+d+j9MXK2nSLQfEM/E0cor3AKhf9A2tfTT7clUmHE+4Vec0Lf5DUonc7qScdy
         AFbuEezghVCRb4C2c/zydnH0+LcevDDqSdFRFCy54b1VkwwXF3dznnHQB6E8DDd2ETrw
         KYYg==
X-Forwarded-Encrypted: i=1; AJvYcCXElHq+9xQPm/O1Xeh35ofDkN23l/gqI6fXmp94j4QxrWjl+6m3nsXVjrUJDF1nR4grENtGR501RpfnytE=@lists.infradead.org, AJvYcCXIjEtpM+C5s9whDhEcqjLPgMWysCNz5OHjLRyeCMr/jWVxL9rC9e6V9dnBN8YSP5ddbf3SQuVLvPkecLqqPD15@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbjp4QJInatg6ly5Uifr7izaw5laTxUU96RJzqXOB6pWDJFylq
	3qH+vwLzJbJ4ajgyX9jAcy2yHpwZQEKA7u/KM6W3y4xb/sh5TuJk
X-Google-Smtp-Source: AGHT+IEfycb5iiZymuS6/A5r7fPYBasvja3rpLa03Kr7wKm7iGMzy70e6xac0xoZKfX+K0CcjGzenw==
X-Received: by 2002:a17:907:3f88:b0:a86:74fa:6a6f with SMTP id a640c23a62f3a-a86e39d5140mr38126566b.23.1724700964028;
        Mon, 26 Aug 2024 12:36:04 -0700 (PDT)
Received: from andrea ([2a01:5a8:300:22d3:89b9:c5da:b451:c905])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e582d448sm11026366b.126.2024.08.26.12.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 12:36:03 -0700 (PDT)
Date: Mon, 26 Aug 2024 22:35:59 +0300
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH -fixes] drivers: perf: Fix smp_processor_id() use in
 preemptible code
Message-ID: <ZszZHycX31dGeP4O@andrea>
References: <20240826165210.124696-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826165210.124696-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_123607_051606_C65A48A4 
X-CRM114-Status: UNSURE (   8.95  )
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

On Mon, Aug 26, 2024 at 06:52:10PM +0200, Alexandre Ghiti wrote:
> As reported in [1], the use of smp_processor_id() in
> pmu_sbi_device_probe() must be protected by disabling the preemption, so
> simple use get_cpu()/put_cpu() instead.

  simply


> Reported-by: Nam Cao <namcao@linutronix.de>

Reported-by: Andrea Parri <parri.andrea@gmail.com>


> Closes: https://lore.kernel.org/linux-riscv/20240820074925.ReMKUPP3@linutronix.de/ [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Tested-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
