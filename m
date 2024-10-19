Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5551D3C91F
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Oct 2024 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/vSWpUej9WT/KDDi/AaFwkSb6cEAkegfJXvb+gNFb4=; b=2Xa1qQ6SIQuTZ5
	4dwYx235PTFzcL0xPOK7LdKZ04Csk4D4r1mDuvcPaMjwr3JQzQXrRjzTz+ToKV+POLSyXZBqQjkW8
	or+qvAdUlhKBPs7aQZ1k29f2HEsQ65w80oU7j5X11L5iJcINR70zjti11Pa7aXO8o273Ymhkqyof+
	/8CdEi1LUHS4XkELvU0k5DKDdkYGzDu0h+3KfQch5M6DytVAGG2nlHRbofANwyeekYz2THGsJIv5g
	Xf82Dcm8RJpm2vIerJZGhneOJ/yrlx2TVkGoxX3NyOD763VFS7mDS46MxIt7lRw94FGqeUaw8QFTA
	190rV2XSbNLVoAFTOTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CFx-00000003alh-3RYp;
	Sat, 19 Oct 2024 16:24:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CET-00000003afg-3Nfh;
	Sat, 19 Oct 2024 16:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19D2DA40B29;
	Sat, 19 Oct 2024 16:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A9FC4CEC5;
	Sat, 19 Oct 2024 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729354991;
	bh=mcuO5wxNXqpn40QCC+5ATBwUwZ6THwiREuzChC5wZhg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ONVh/KVYXZcbyCX/rGFoDGAHAX3cUfatQe9BIzEkW+srF3i+8XT6QIvCdSwdNzqEz
	 MbZOTgy4C072BCeXEi4Wfu/m8yZtoGKyDfdOnvm3H0LaTuAybHagzmeMZ+CFRU7JWY
	 pEqPPi0nN/lCLuWzZPfl+xIb3U/Q60wlGIE1V266vBIgYCRvgfpuUOJMg7JNhhz87H
	 DNTdS/m4JXnQyl33iR2w8kR/VZrXqzJa2/6J6rVSZksA0cUPjQEwclbMwzU2gCLFuA
	 cBgXefQujb3z7+czO9JNqnzMR7vkM1ETIMHbDb45LRDR1axbTB9bHrWm648TMQh1gX
	 OVzrGzTyPOqyg==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nick Terrell <terrelln@fb.com>, 
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
 Changbin Du <changbin.du@huawei.com>, Guilherme Amadio <amadio@gentoo.org>, 
 Yang Jihong <yangjihong@bytedance.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, 
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
 Atish Patra <atishp@rivosinc.com>, 
 Shenlin Liang <liangshenlin@eswincomputing.com>, 
 Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
 "Steinar H. Gunderson" <sesse@google.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ian Rogers <irogers@google.com>
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
References: <20241017001354.56973-1-irogers@google.com>
Subject: Re: [PATCH v3 00/11] Libdw/dwarf build clean up
Message-Id: <172935499069.2388898.6689149497765145884.b4-ty@kernel.org>
Date: Sat, 19 Oct 2024 09:23:10 -0700
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_092313_945061_292EB760 
X-CRM114-Status: GOOD (  10.33  )
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

On Wed, 16 Oct 2024 17:13:43 -0700, Ian Rogers wrote:

> These patches were originally on top of:
> https://lore.kernel.org/lkml/20240924003720.617258-1-irogers@google.com/
> where it was pointed out that a lot of the libdw conditional
> compilation was due to features that have now been standard for 10 or
> 15 years. The patches remove the conditional compilation assuming the
> features are in libdw where the feature test is expanded to check
> there pressence. The patch series is now on top of:
> https://lore.kernel.org/lkml/20241016235622.52166-1-irogers@google.com/
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
