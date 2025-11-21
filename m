Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE53CFA758
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCVMIm8FbBY9pybZwO5e123/8dWX+f6JJ+M88cM5Ook=; b=kpjxNncr+nBLnU
	DAYfF/PBcRfT6HN8woUuuCZty3m90FV4K7C32kXp8UJjfOuMsGZYzCFzG0isQ/HL56TY2NRX7dCYk
	I5i78DmInNjUU/k3KxB0jg5GXtTZLLf4jPHsSLgACd7a7SpIf0Bmr5+3gea6ZZIgnRI/SaNVhKXK3
	gEUEchUIUzCgvxy7dNny5mhegrTG6BAm0+MBX5QJPVSe+ngVrOSbj3BhT+kJF5BR+VPscRIF9bEi6
	Y1Whh8uHzBz6gKcOY75uTivxCeOr57zqv7V8qu0c1gDpeh2hhk+XMc0vPAZXRANE8sg59aBTIUBZ8
	4pTeM6WWbF/D73MSsg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMN2M-000000087Fi-3mOD;
	Fri, 21 Nov 2025 09:02:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMN2L-000000087FM-0SrN
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 09:02:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A9E660224;
	Fri, 21 Nov 2025 09:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB723C4CEF1;
	Fri, 21 Nov 2025 09:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763715756;
	bh=IXP4XPZRsObPrl0yKG5Kw2GKPTvWVm8sTwBxaHRfRlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSs9yj0DWwmoHYi4NgWzdQZOqTmwZGy3JFvwOv627sWRLK71siMd+1ZbpdKK7Avll
	 Ui/fe9CHM/LrbtYrQxPcFdgz1vuEkmoSbbEupw20zwdbmWmoLFubQks1U8SnGyBegX
	 Lx9mGAl29lcUmLoXVZEBsPtw+b7++agvO8ZwtCYupXIIKCttNUvBYfoZZUycQ6vNrB
	 blSCqlcSfFbhrA2310cQeSdz3zzLSsw9xYVm7cqrKR+j+cycu8aulU0hpF/hRJWpGj
	 JBrDEC0Dxm9qjxoWowHRE2CBZv/LnaU1wJesra9ewKk/qRWF5/Z2YmiFpkCuV/7QTU
	 k6Sy7YZHjGmCg==
Date: Fri, 21 Nov 2025 10:02:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: cp0613@linux.alibaba.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, guoren@kernel.org, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] perf vendor events riscv: Add XuanTie C930 metrics
Message-ID: <20251121-bullmastiff-of-spectacular-inquire-2988b9@kuoka>
References: <20251121063439.2545-1-cp0613@linux.alibaba.com>
 <20251121063439.2545-5-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121063439.2545-5-cp0613@linux.alibaba.com>
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

On Fri, Nov 21, 2025 at 02:34:39PM +0800, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> This patch adds XuanTie C930 metrics, including topdown and some

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
