Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BEFC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 18:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPGC3MpITnBXKybaw41ZIQEilHM8N7Bulq+IKijIhD4=; b=nSWUCqQfQ33TzC
	n4YBSu9EcSjPCg5Us48UUHVpC9OrodVHm/ryLpDQDlyY57PIdsSXuOBONV3dAg7KF9ZLTKQa0NQNJ
	INo8kPldvSX2ajBW01tv84SQi4C194STxyV+cX6LOm2K5DwiyUJXebcS7Pmwrj1znpvIhbxB0/3Dp
	UlhZdpKO8JwkiARt7ExeQlSOHRI1ieSeLXg/5vmDfDwQBz7Y+0Amd7qEbIDcc9vqgDgIcyUvXADyr
	g+HrN/UKULC3u1TTbASMGywwpko13GNuI+J61rCqYHtHTiEARkgrXps9RGQkf061acJKg4qtW1uFW
	Dq8xcw+pgPpP6jV4kdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7gkp-003GQ8-0g;
	Mon, 27 Nov 2023 18:54:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7gko-003GPh-1b
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Nov 2023 18:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6Ctn2a29hvWHMa1mL/vzo2aqwSUADQ4/Xt8Q4DjTnQo=; b=EK2qr+K+Ovt3nh8aQrap8k0+cr
	tVKuNxPvaNawk4KX65lNAYEFIjvXPeplwu2OMvAHpVeeqcDO54eusR6UdCyPUDe7gb+N79J0nH0Ri
	Z6LaA3M7/bvbJm7EeHPx4qqQQJwNtk1ykhHuEE7vixcUQxussFIK6E+qHoWTn1A6rg0rSdPjgUy3E
	ESjBE7U5CDM3Ak0zhOaQduaSUHZwAnjIJaUoFBPEUkG3JXRxyGKLeGtZCCcEh6+chmOwrhJFc+i96
	Rz4c2hqsY8r46rw3sbMx8Fyk3eyRizQjkM0RSdjeUzqqdUeTUoJZZDJ2aSBgfnoE8eFuoKxork4n/
	Lm0OeiYA==;
Received: from [200.166.87.243] (helo=quaco.ghostprotocols.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r7gkk-00G8kN-19;
	Mon, 27 Nov 2023 18:54:43 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id C74DD40094; Mon, 27 Nov 2023 15:54:36 -0300 (-03)
Date: Mon, 27 Nov 2023 15:54:36 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Guo Ren <guoren@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Wei Fu <wefu@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH V4 RESEND] perf vendor events riscv: add T-HEAD C9xx JSON
 file
Message-ID: <ZWTl7KS26Frvwm8+@kernel.org>
References: <IA1PR20MB495325FCF603BAA841E29281BBBAA@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495325FCF603BAA841E29281BBBAA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Url: http://acmel.wordpress.com
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

Em Wed, Nov 22, 2023 at 08:41:06PM +0800, Inochi Amaoto escreveu:
> Add json file of T-HEAD C9xx series events.

<SNIP>
 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Tested-by: Guo Ren <guoren@kernel.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks, applied to perf-tools-next.

- Arnaldo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
