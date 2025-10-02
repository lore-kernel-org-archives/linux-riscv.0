Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE6FCAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGE14rj6j7huDevriBNt9UlW9z7E0ynnYxbqh4RJfzI=; b=MVvDMLuczKTCXB
	cONHoooUYaTF3OeNNdekm4JYOGX/XGuUyGLnnU+O2J7dV+FeVciMzW3oGpCmWbMfD9bIDuwXedYRx
	Yd0+azohNfvppYZ10bB7bdzh8SHPW4NUp3xpFsZYCdO5ch28HXbxinB00IVV5tgA/amwYMUWQ/caE
	+3/CC/CbpDwEKomYE65IITEJIqsJq8t45V8z0UzmrAbSFOqhgPo1SQZB8SNoYMommVSWl9uEFmTPU
	RGVRwu6owCGqlHAcrlFfcGAWA+gLM+e5eFdnGEAUx/BPhTCX4zN5RjtSo6vgEdmeMn0fM6IV2FWtr
	TnUd5IWOAjtKveGPuhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Cm8-00000009j7s-48Xe;
	Thu, 02 Oct 2025 06:26:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Cm6-00000009j7S-3KAn
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B45144439;
	Thu,  2 Oct 2025 06:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DD5C4CEF4;
	Thu,  2 Oct 2025 06:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759386404;
	bh=IN5Xoo6ynmRa7LHQ4OoMu5qgHy4kkgfiKHhscIHLLGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/AUu82YtjB+tKa0eWLCJZ23oK0HvGv4tnzg6Etc05laTDdawViQrxEzaLmmEuZXS
	 xnl4e+rU9HzXQUaOvMV3muddBxo8wbHY36pm8skkpm1H69s+8iS3SRgS0RFa4kM6aM
	 umt1+XXCVDs0R8Uv3740jkOnL1+37ACDfGdpKa0U=
Date: Thu, 2 Oct 2025 08:26:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 00/11] Linux RISC-V trace framework and drivers
Message-ID: <2025100208-challenge-protrude-d6c3@gregkh>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_232646_880012_8797F069 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 02, 2025 at 11:37:21AM +0530, Anup Patel wrote:
> This series adds initial support for RISC-V trace framework and drivers.
> The RISC-V trace v1.0 specification is already ratified and can be found at:
> https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratified
> https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified
> 
> The RISC-V trace framework and drivers are designed to be agnostic to the
> underlying trace protocol hence both RISC-V E-trace and RISC-V N-trace should
> work fine. The discovery of trace protocl parameters are left to user-space
> trace decoder.
> 
> In ther future, there will be subsequent series adding:
> 1) Sysfs support

why does "trace" need sysfs support?  No other cpu platform uses that
today, so why is a new user/kernel api needed?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
