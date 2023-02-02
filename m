Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E562DC636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEXygwQEMX5+QPoNZWOQUDYb1Tso/cO2ypTqUkyCoeA=; b=CjsuJIxy7SVDai
	6jFLcVZcByZavJOfxxM1yRmNcvruEsjHzfaHfpDip+PbggusUbLAVJ1hZQqVXSYF8t2lFgxJobqUf
	i+bIIQjZHUniu5uDxp50SewVNKMViFxdLmYV2BGxmToC9mi78o2aBZeMubdsvjIua9pRZ/iXoaI6b
	Xiv+YC/il08X1qEKm0VD7m0zIAddhmDI4s0mrMpyFW4vlEpP+QKmPpZ30KSSnR3nYJhET3yr8l7WT
	FjX5PVDsGHCkK9i5IwRY0fKdGg57a3Wv21gcjW0mP4in/MyZnNSMMwftCtgDEc1Cj0v4VSquBN2B6
	T0PdXo2MjRRqjqlVmWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNb45-00GDlY-Oy; Thu, 02 Feb 2023 14:59:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNb42-00GDkY-UW
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 14:59:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id h16so1942487wrz.12
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 06:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VJXuWjYMjwbPFa35qXTKy9wFE4zpb2ewjJThLel4jN4=;
        b=hEKVsotfgGwf8yGzpusX0UAczutUtO5B0oucd0f+sO6U22rwODuHT4QkfqfwXvXhRg
         ho/hVYSxWsOOI4MtY5IEwid4NilUewQPoJhgCscO6YQ1sJs2szr9Vfl9+JwHnnMoGJNP
         1LLz+f5X6JBhw3vRAg97eGYG3skaaB/QLtYEgEFTor0iQUkZCIJ5GaDMOCcsCS+G6+CX
         LwfZW+gRluBew25jNu+y4Wr5Jn/yYcRYi5bQF8bxIutnZgPQwmO+um5AhF50V9Yg+YT9
         1VYgRWehKaYWvqFxyiCKaljmDjrlnf4hBStjS75iDHDtYNajiXE+a+5nMZljdsrg5HxR
         NL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJXuWjYMjwbPFa35qXTKy9wFE4zpb2ewjJThLel4jN4=;
        b=68gRk8+y1RegCQ0vbHKojAmMh+5KjLH9MUvLJT3I96R0FnHDA2Kzz6DmRToFvIfbb/
         C6eOCd0XLUMCY37QhhKqhX4H/YiVS6JDTgML+Ono4ie/9/lUbJaK04aFqtlOhSZKioeQ
         VNbx9mlvb8saT5PP9oNk5hFAxMTxd0Z0tPoskdDsgapOw023JVi+vYE/txyCmfGndibO
         lah0/gnjI4pCfB1QH1qMGz0wvEGg6JUfuYM9KkNYtJDd2cKX39FaFRPdn31rs5aAXibB
         OQhk8gm96jAZw6QWOeoJqlgA7yngw75uFv4Ae07th+CLp5s9iUlz8w6jgva9Y6z1wWKK
         NHGQ==
X-Gm-Message-State: AO0yUKXh7NxF2UCwZvRcI/SsS9aemTcAvWFn0fMSTWsfCMcNbX0KVYms
	i/SeeyEppQAbnSAN6wE0PeEOLQ==
X-Google-Smtp-Source: AK7set+ScVRXdqzlp1+dJn9JBWeb9vWKiXkVq/8dz7Cx+fQgfPHbJR8lRGbMgjKGu92H6umfh9m2Lw==
X-Received: by 2002:adf:f702:0:b0:2bc:8074:b702 with SMTP id r2-20020adff702000000b002bc8074b702mr5883218wrp.19.1675349989348;
        Thu, 02 Feb 2023 06:59:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t16-20020adfe450000000b002bbdcd15e44sm19646402wrm.37.2023.02.02.06.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 06:59:48 -0800 (PST)
Date: Thu, 2 Feb 2023 15:59:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 01/14] perf: RISC-V: Define helper functions expose
 hpm counter width and count
Message-ID: <20230202145948.jrgjc27t2tbney2l@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-2-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201231250.3806412-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_065951_010715_99101AE4 
X-CRM114-Status: GOOD (  15.60  )
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

On Wed, Feb 01, 2023 at 03:12:37PM -0800, Atish Patra wrote:
> KVM module needs to know how many hardware counters and the counter
> width that the platform supports. Otherwise, it will not be able to show
> optimal value of virtual counters to the guest. The virtual hardware
> counters also need to have the same width as the logical hardware
> counters for simplicity. However, there shouldn't be mapping between
> virtual hardware counters and logical hardware counters. As we don't
> support hetergeneous harts or counters with different width as of now,
> the implementation relies on the counter width of the first available
> programmable counter.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 37 ++++++++++++++++++++++++++++++++--
>  include/linux/perf/riscv_pmu.h |  3 +++
>  2 files changed, 38 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
