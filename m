Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BC2C5472D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTNhlCO0N1A+l5w/965oARKX+FESLVmyl1imGE02Iio=; b=xBCsg6replsM4C
	LaOevzLhC9KJuvgazkamK9291PPuQ2Ga4CxMUzefrdwFPqJ2z27ZKjZ4CJtVyATzgKUBo/BiVzclr
	EBfeKtSvtK0EGc9MDblg4Tx5zXdTXIrY5Q4uP1kP54lm5+m6AtRiLRQtJVjnnkcoz0WxpJCf5TUtJ
	PNt0mx6FFaGgxFcSxr5XCKphnfBaxg9fynU/9jsYZ1ROu6WSBm2I44NloFdBXSy6Lwv2sAUDGm8Yg
	B9NIVQWL+dkibvEq2sGXAsf2/ReF1ong44l5VqwZB3OsQCEiR3Txx3zckWZXpNsVAzehVhOdx6VC3
	sRDhzc3lAZsbAMkRzDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siddD-00000008FQu-1pre;
	Mon, 26 Aug 2024 17:35:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sidZJ-00000008ELv-2mRv;
	Mon, 26 Aug 2024 17:31:56 +0000
Date: Mon, 26 Aug 2024 19:31:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724693511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AkZcASK4ZhVjM72PRr7wbPEwfXLYJAc1hlsf/gSb5Wg=;
	b=GlqAxXBRPQBeqRIdp7YEFkKGSYyjuJ95hzkSmIq8lVdpmRgSdpDAHvFFHTphEHIF7FHTDM
	5PSz07IXyHDeDZ+Y2o6QF5z6Y+A9eOCKTlRVTYuvpDCxqslD/1ocwKqQCh+Ot66v2HcfEN
	PbuRXrTyzdJSOiCfA7xVbFpUW+TXGmFG5s/1d3+R0BWB6DRAovv3+ZvIPBSQFu/VTTu96g
	QGoPH9I73b7kwAlLkRk0xk0o4j3dNIPj9nbGr0jY7yJuxyh3iUl2ELSfIC1IIP7y5st4dw
	dMFt/Ke/hDrZSr1oc/Wnv+oC+Vg/OHokmAw8mrlbwSPRGfibdNx0eJdwDq/qFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724693511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AkZcASK4ZhVjM72PRr7wbPEwfXLYJAc1hlsf/gSb5Wg=;
	b=SqSvGkEU6QOjP5krxwFS/EKg/yysjqLKhkJPWnYHRP++vjK9SQmcVSs4lwYF4azefHCQPb
	dw2acvrVcW6ZA7CQ==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] drivers: perf: Fix smp_processor_id() use in
 preemptible code
Message-ID: <20240826173143.CxUkM4j0@linutronix.de>
References: <20240826165210.124696-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826165210.124696-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_103153_859673_43789FDB 
X-CRM114-Status: UNSURE (   7.21  )
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
> 
> Reported-by: Nam Cao <namcao@linutronix.de>
> Closes: https://lore.kernel.org/linux-riscv/20240820074925.ReMKUPP3@linutronix.de/ [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Tested-by: Nam Cao <namcao@linutronix.de>

I think this also needs:
Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
