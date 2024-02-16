Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED47C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 19:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nv+e3pPSrT2bHSI94HE2cKmK/bpUDj7BRqsBiRvXpwM=; b=dNXMGIcvbovEix
	Qy+3KvqC14PENEsYcJsT0jkR5cEwPxOGz9ed+drqVilDkyIDEVN9bbDlPlajE7/RC1uIC3ZbCX8/V
	9NvC6mtrno67sATj2nwbyGX0Z8ddRZP1lD/IYegsJhZ/Zj2v+6pnx5xhzyiK3oVazhq6yOrIWKlDU
	1tcIe0XjljvY7vqldmkRekifUnlR5PmNyCIYuxw0ysiv8gqZxaTFTGIhXt5n+czM8rkCT+0CNfU+k
	vNbfIIHPWPDypomicmMosrh8WkxKXJQOEgo02pMa4Uy1ALR7PrbbeK8HN69LNKrC0IpXM/XBxLAQq
	rRjlmmMFZp5WSZ+XT6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb46L-00000003WUW-13s7;
	Fri, 16 Feb 2024 19:42:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb46H-00000003WTE-3WC0
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 19:42:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34DF7CE2D12;
	Fri, 16 Feb 2024 19:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48F3C433C7;
	Fri, 16 Feb 2024 19:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708112538;
	bh=KVmXFaHE4oIqgJc2d6YPE7Mz/FJk0hdE88KLQxKmCPI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CovL0agAKpy5rHJIW7atRNSaUKxKl3AjzFkUG+xvtMeybgZ7TKafYEFnsRjM9tZU3
	 p9bl2Gph2fOIPs7k2Hgby6NP5H85CixK4wqPJ7rYwXlrpsFHZGrYvyjja1QI3/uOf0
	 A9Ct7waEyoHrLvDLwbsz5i5IphS888nXJVwkYyQ9Paf7afqnSKL9+sdxZjZkGP4VvB
	 Dmwft2BU214hO+zreW3L+UKVG57Kr2cfiUawPH/kHEo2thoMXz6TNHB+5cM/Lf8M4l
	 mE+7huLG6N0cNmzyG0RsFRUJ/xp1RhbEAlAfR00OXG7r0YquHz968gHxr8AfYV6Tk4
	 RMIpbJfGwdAjg==
From: Namhyung Kim <namhyung@kernel.org>
To: John Garry <john.g.garry@oracle.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Guo Ren <guoren@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Leach <mike.leach@linaro.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	James Clark <james.clark@arm.com>,
	linux-riscv@lists.infradead.org,
	Ming Wang <wangming01@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v1 0/4] perf parse-regs: Cleanup config and building
Date: Fri, 16 Feb 2024 11:42:14 -0800
Message-ID: <170811251451.2464880.2005329121787723704.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240214113947.240957-1-leo.yan@linux.dev>
References: <20240214113947.240957-1-leo.yan@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_114222_073006_8606557C 
X-CRM114-Status: UNSURE (   7.04  )
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

On Wed, 14 Feb 2024 19:39:43 +0800, Leo Yan wrote:
> Currently, the perf building enables register parsing based on the
> target architecture has supported register feature.
> 
> Furthermore, the perf building system needs to maintain a variable
> 'NO_PERF_REGS' and defines macro 'HAVE_PERF_REGS_SUPPORT' for statically
> compiling the tool.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
-- 
Namhyung Kim <namhyung@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
