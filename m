Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37532FD0045
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 21:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fS9T/dmqQkumZrkjHVp45J+cpLLzcjFYl1fJP33MK10=; b=1r/pfwJ82P50nn
	zSqXwftzvN+xVrjOnCEzV8w2ig3vsKzYEldePeSoCqXEZ3dZGVMkZDWbmIo2OBgCJDXfZ/S4w40Yn
	ABWt0mhHEoNgXmX9lQ8ZBmv0+uEgoObLthd7X883Z9KrFUw/H/g4XUy+uxYTlhgNEzPzkzYu/dbt8
	f5qUHXwDfaQTs6jiiX5wp2M93O4TgUn59btqqtKFiLdbX2xwIzuRGkdiD9Y1CK/4/ipJEY25zU0dD
	0t1De8kv4CRDq1P5KuAs2FTphic7/MsO6zimi4nMVA5hC996SiCFAqfSlYRPGmoXzgS9v8ScRHt+A
	eep9WlgSxAyWisuXt9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSL2-0000000AJD4-25FQ;
	Sat, 28 Feb 2026 21:59:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSKz-0000000AJCk-2Z7q
	for linux-riscv@lists.infradead.org;
	Sat, 28 Feb 2026 21:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A084240C42;
	Sat, 28 Feb 2026 21:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E9CC116D0;
	Sat, 28 Feb 2026 21:58:54 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 4/8] dt-bindings: iommu: Add spacemit/t100 features
From: Conor Dooley <conor.dooley@microchip.com>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Yixun Lan <dlan@kernel.org>, 
 Jingyu Li <joey.li@spacemit.com>, Zong Li <zong.li@sifive.com>, 
 Yaxing Guo <guoyaxing@bosc.ac.cn>, Zhijian Chen <zhijian@spacemit.com>, 
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <D8CE6E5B1001D797+a6f36da0272ac18fff2a992976b1defc3bb01af6.1772289741.git.lv.zheng@linux.spacemit.com>
References: <cover.1772289741.git.lv.zheng@linux.spacemit.com>
 <D8CE6E5B1001D797+a6f36da0272ac18fff2a992976b1defc3bb01af6.1772289741.git.lv.zheng@linux.spacemit.com>
Date: Sat, 28 Feb 2026 21:58:42 +0000
Message-Id: <177231592262.848068.18080490567217057666@spud>
X-Mailer: b4 0.15-dev-38bf1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_135901_676169_9CE56C73 
X-CRM114-Status: UNSURE (   7.06  )
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

On Sat, 28 Feb 2026 22:44:49 +0800, Lv Zheng <lv.zheng@linux.spacemit.com> wrote:
> Adds device tree bindings for SpacemiT T100 specific features by
> introducing spacemit,t100 compatible. T100 contains distributed IOATCs,
> each of which exposes pmiv interrupt.
> 
> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> Signed-off-by: Jingyu Li <joey.li@spacemit.com>

Patch content here is fine, but the signoff chain on this patch is not
right. What did Jingyu do? You're author and submitter so either Jingyu
did nothing and should be removed, or is a co-developer which requires
attribution via the co-developed-by tag. If the latter, their signoff
should be before yours (the submitter is always last).

pw-bot: changes-requested

Cheers,
Conor.

-- 
Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
