Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD50D1118B
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 17:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sH7rW49V8YHxGtX6/KtpWR/aZU9oYS7/8mbDibxTqJw=; b=slBoMvJeGIAPAW
	eQKe1uwYz6xaavr5v+GrSzWrwq20xJao6rJvZEIx9jeDU3IE4zwfW9O2QxX/m9TUUaN4rDk0lOe1Z
	DXRe0y8nHPUBaoVH9CMeDDlu6T2V/2o4aUe1Bc2DjEfL9If+LpOLkjCwnd0Z2tPPeEAUDbVm0VSt1
	KGlv0u4zoaW3E3jC8UhU2oFBXhuVxwuKg64nIYxbD4LmVGMSvsCZRu8R177AcfNKh8WFOfnaQPKlL
	U7ONBBDI1DZkUpE8Hs4LfGFRdb/q+s5rjGa6dW/i14q1T3lCFVhsAtY/E+bZF/qb8TDdyNKSVUfY1
	8vq6hkn/1lK6/yY2Jl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJnS-0000000FSaA-3NFq;
	Wed, 26 Nov 2025 17:59:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJnP-0000000FSZl-2tvm
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 17:59:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1354742ABC;
	Wed, 26 Nov 2025 17:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF0FC4CEF7;
	Wed, 26 Nov 2025 17:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764179954;
	bh=sg7NBwz1aZkzxUCOqukiMge4OdzUmxVy6rn4f9CoMP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KupS65j56O+AwX7I5MA/zxdTivvpPaDSXgT6biSrkVI31Z0bqs7sFSVh+2AKTR4S7
	 Eu+csty9DcP9SdmXS94C9xM+etNHT7LNCvOuwlM6J4XFR2WZhSEd7hpdFEPVKShZnz
	 ZKqxtC+khzi6W9zeQGnejP086Dy/g5F34K5BRMP1wYsC3Ap6iTtalhotLLcpVPPhov
	 qU2qRCpedGaiWVZjwhQ9TL3mIULocec9N/0BNTAkQimLqlAGXBcJYs8k9vGNJSG99a
	 7MOdktnvZJnsXwXiFVAGbPS1fw62WiFC6fJbMIIductD5WIi9+hb9qmUJEFIZRU51R
	 x+3UrpL+c5eBA==
Date: Wed, 26 Nov 2025 09:59:09 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Eric Lin <eric.lin@sifive.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2] perf vendor events riscv: add T-HEAD C920V2 JSON
 support
Message-ID: <aSc_7dGgKKPzxo9K@google.com>
References: <20251014014830.613399-1-inochiama@gmail.com>
 <ac26535e-01c8-d8c4-9f25-f5716065b37f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac26535e-01c8-d8c4-9f25-f5716065b37f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_095915_760836_8703E0FD 
X-CRM114-Status: GOOD (  12.42  )
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

Hello,

On Tue, Nov 25, 2025 at 05:52:10PM -0700, Paul Walmsley wrote:
> Hello tools/perf maintainers,
> 
> On Tue, 14 Oct 2025, Inochi Amaoto wrote:
> 
> > T-HEAD C920 has a V2 iteration, which supports Sscompmf. The V2
> > iteration supports the same perf events as V1.
> > 
> > Reuse T-HEAD c900-legacy JSON file for T-HEAD C920V2.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> Would you like to take this one, or would you prefer that we take it 
> through arch/riscv ?
> 
> If it's needed:
> 
> Acked-by: Paul Walmsley <pjw@kernel.org>

I'll pick it up to perf-tools-next, thanks!
Namhyung


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
