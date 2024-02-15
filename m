Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46023C4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 06:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKOp0qcEfOTtAdH2/R9x6OFoJKLC8roi1fraCbVzk88=; b=C9DLtYK2KS3zrN
	OlZN8ZC+APYyOiX8mNmZIPv3fJ8yfu6XprnkKWVYhG7FvV3OjJLiPxaoyby/d+/mUXl/hfttuBnok
	rmBW9B6Jp2MYXPQ37EqQmqeyyBx5SZAxKnTmUx02kh9PUTGY6bbygUfmdWQvwXR7HtFTu9eAYfCa2
	g2eiiHiL89VPOf5WfqU59CSTFSVrph90A0GrUhigCeHY/TlVO0+eItz1FGhwipd2FbaANsbgFoIjE
	l6obuLtlwiRzRNwnENEQwNoQoNRo0MZmJufGeYtE6zkaNXvRuIqFpafqbahyotombEc3k0fqed3Uw
	Mw+hZKKal3alMuyKPE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVIa-0000000F6Cp-3nYu;
	Thu, 15 Feb 2024 06:32:44 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVIW-0000000F6C1-0iol
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 06:32:41 +0000
Date: Thu, 15 Feb 2024 14:32:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1707978754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QYgsrze2ItFZa7cOnhg+Cy2fQUPDqBnyOLxWMOv/dbA=;
	b=WjNBhrruJ37CnbDrPB/DQF+EHQIh+YeVP6uuJhMCtGcBqLgeKoifzgtvDXQAGPGuHJ3XlD
	PlHPu7w1cjEiqMVmDTlKZrbW81U3vgp1TrIyWvpdoS9tuMOFQQuMXaxxZs47Sf4GeLR8sO
	xji9sz4Fvy98M937HyjxU0rCkWKlqbY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leo Yan <leo.yan@linux.dev>
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>,
	Kan Liang <kan.liang@linux.intel.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/4] perf parse-regs: Cleanup config and building
Message-ID: <20240215063224.GA99827@debian-dev>
References: <20240214113947.240957-1-leo.yan@linux.dev>
 <CAP-5=fXqdFrTDY2a2dXK1ehP2AbwPfPF8vYWXgeSMcKh4mS+ow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fXqdFrTDY2a2dXK1ehP2AbwPfPF8vYWXgeSMcKh4mS+ow@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_223240_589562_2DABFAAE 
X-CRM114-Status: UNSURE (   6.62  )
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

On Wed, Feb 14, 2024 at 02:42:55PM -0800, Ian Rogers wrote:

[...]

> Thanks Leo, this is great cleanup! Series:
> Reviewed-by: Ian Rogers <irogers@google.com>

Thanks a lot for reviewing, Ian!

Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
