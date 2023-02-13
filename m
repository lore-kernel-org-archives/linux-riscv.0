Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36450C636D7
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 05:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGZCz/YSIjvEuWVw4r9JiYR901kgPYyI0y545bU+kA4=; b=Xr6HxWPKdqdPOn
	P9hZow47Dov8Y+zr081jy8zE3IDRwQXE+675KYIhr4IxbHpZzJlh2dgSyEYH1Wmsl0N6kB6YMzoJL
	8HoYx+Pr9E842+s+1qqeJw9sg4JM9HSsnqp0i4Vun92YabqAHosWMi+ozsUNeJ8qRQqjKfX5KgGld
	ANcBhAanzJ7tcEm6M5/lkp2qwRzWhcaOnebqJcoXqGnR7M1QzUAkZVMJ3EaEfOKAgJV2cpNUzdQSg
	YDIniygGXqrWVJDK4EIMo6CKPlleg+2hCSubswM7AhA9mqLVD1/TGTmHXunOVoTefecDME9hp3y8p
	uCGfS7VXGgE/yAbk0Skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRA2-00DCz2-Qf; Mon, 13 Feb 2023 05:13:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRA0-00DCyY-J8
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 05:13:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id b5so12338906plz.5
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 21:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1/rXlbQZUiYssX0GWdtn60fAH8aeaRBmLehOaQBY1mE=;
        b=BczA9Dit8WldsIfP8UBgYlgc8TWJhovdzXsusWUlS+5qwERWfEecSRfNvw2jdkipTt
         FftWA7ruHlkUk3JVzZ1R2/G95S9ueaU75uXAfKH/d+o6Wvx4A4+tsy2UkZIZma/LHypW
         b1HtPzukBNiYeS0/OLsWF5NHpFKXqO/xMwlEYEGDKUzBZ8D91k9sx7/8fVBaxjddDALw
         /YCfRX/nPAgzOb51JRnSuTkMLiQr0ZQA5dXciGNdnFXKrI+gu84pYpUm/ENQNd65VC1s
         ugorSZLeiHIEBj3MNBjGdwfT2IeeGdw1kY8bm8vt05A2ZhJTkpwI5IEJNhKGy16PpfJv
         i99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/rXlbQZUiYssX0GWdtn60fAH8aeaRBmLehOaQBY1mE=;
        b=i55+s1x9QFZ8IXso/VQaH0xL+kpDeAH3g6LZjXA32f36MMyb1dzpyPgPkaYk5D1q+x
         ndFGAPyb3uy4mGeHc3vMJWIBWmQ+013Ilkd3vaIXko6ra5+YiQG+FnGZ66c7QFXTQnBu
         Jk3QHJYXqtrF5i6/IBAne1uf+XSWPiOL46v7NXXf6qUM32OfyMfP4JBYhufSlUITFnQF
         G90pcaa1qFZ8WMA7+mAB+Z7BmsC37P9PFuQ7S+5KBy7YuJGbq0MWwCzK5fNKLuFHAk7s
         Qw9gAHURIUjcPH6gkif265Zux15eV5SLGW7zH9OfPKU+C9nZHIMgh9Zd3JehBp0ummMv
         MNAA==
X-Gm-Message-State: AO0yUKW5fvWxrVINim2md9tkc4iCHK8wZO0vD+Y9BEMOSJ52Cofxlwjm
	0nX7+T7YzTl82gENQpM53dEIGA==
X-Google-Smtp-Source: AK7set+HBd/TKOpekO2R5ZNBdJ5nlE4W2Q0OVyhq7zVLBYibkTxtu4XeGFM4NuzAT9/O7iEzdrKiyA==
X-Received: by 2002:a17:903:24c:b0:198:a715:d26d with SMTP id j12-20020a170903024c00b00198a715d26dmr25510023plh.8.1676265231494;
        Sun, 12 Feb 2023 21:13:51 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902784900b00198f9fa23a3sm7079601pln.287.2023.02.12.21.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 21:13:51 -0800 (PST)
Date: Mon, 13 Feb 2023 10:43:42 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Robert Moore <robert.moore@intel.com>,
	acpica-devel@lists.linuxfoundation.org
Subject: Re: [PATCH 02/24] ACPICA: MADT: Add RISC-V INTC interrupt controller
Message-ID: <Y+nHBivfemYR2NGD@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-3-sunilvl@ventanamicro.com>
 <Y+P/BDbP68vNTOao@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+P/BDbP68vNTOao@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_211352_651607_728A0A1F 
X-CRM114-Status: GOOD (  16.83  )
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

On Wed, Feb 08, 2023 at 07:59:00PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:03PM +0530, Sunil V L wrote:
> > The ECR to add RISC-V INTC interrupt controller is approved by
> > the UEFI forum and will be availabl in the next revision of
> 
> nit: available
> 
Thanks!

> > the ACPI specification.
> > 
> > This patch is not yet merged in ACPICA but a PR is raised.
> > 
> > ACPICA PR: https://github.com/acpica/acpica/pull/804
> 
> I had a quick check with git grep, and as this doesn't appear to be a
> regular pattern in the history, so could you please make this a regular
> Link: trailer?
> 
This patch should be merged in acpica repo first and then we will get
this in standard format. Until then, it exists to allow other
patches get reviewed. I believe by the time we get all other patches
reviewed, acpica will have this merged.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
