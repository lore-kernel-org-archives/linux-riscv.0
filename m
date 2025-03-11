Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3709EC2BA1B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 16:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4czwi1q5yoRVTjW4zGWBLd/pcrK15rpGvtE6ewv/pU=; b=ZGyXclaRSWGIwE
	jL0myXqlqzwoeaNUCxt1pTDIwnc824CUn0ElLDBnxN86klcCP6PoVMclcvzBym8EfQJmX+CKg0QXP
	Cs/NgqpBXdBFc6HuGh5SMIr6Itg20pBnMwciFAoZWnMl52Qw8HvgERtlCxWUTJ7yuygEQVByMnUr0
	4u2Xhc6nApQQNTyedM8QTyWyJMI9K9h0fh+xn3Z8Jy8AP3IkbKqq00r0cy1yPyrkEf5pYuvnnOnBT
	surW26INn7fOuWff/dtvnM8KKDqQOLC1cklfFrUmNu0k7L2C9n31/cEGd4/LaEv1U89kJeC7BZWS3
	/Vn23A2owY3sYmgIqaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2Cs-00000006J7d-23bB;
	Tue, 11 Mar 2025 16:11:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2Cp-00000006J61-2Dpo
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 16:11:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EB025C0E0E;
	Tue, 11 Mar 2025 16:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297F6C4CEEC;
	Tue, 11 Mar 2025 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741709506;
	bh=hQH7oJ6MRqrIdYzce2+AkH7d/jjxpTKGeJgZhRE7DyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NRtwASaL9TBNZX4A0S/9cCblBPSC/6ahhIDJO1UBaaRGUgolfIHFzYkfL1a+kZvCT
	 HcZyO4xC4Or7Jk3dZbgFdQneqgSqyuL0uclJ6xvrgNhN3p23WJfYZQ/oTnT7V55Yt6
	 LWe66yf6gRt0p2p0PS1aOFFyFClH/2Ezfgn6Kj4PjSvhh8GiHa+cFRVbhBI8/QA8Ab
	 4htKnQmkxj8ogfNqIPz9NSov6WVCXrbSTrKABghjNsoK1TB/mKq4Oy69Qm3jyaVs4b
	 9YpZVk6klfldGh5KaXI4YQI5aHFGB6D3Bdo5hNSX3cF2KR321K1HOeIo34RsUrbSVc
	 k9doRF63yAxXg==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Ian Rogers <irogers@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>
In-Reply-To: <20250213220341.3215660-1-samuel.holland@sifive.com>
References: <20250213220341.3215660-1-samuel.holland@sifive.com>
Subject: Re: [RESEND PATCH 0/7] perf vendor events riscv: Update SiFive CPU
 PMU events
Message-Id: <174170950613.2288726.10364923188574435865.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 09:11:46 -0700
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_091147_625454_373F14DD 
X-CRM114-Status: GOOD (  12.59  )
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

On Wed, 12 Feb 2025 17:21:33 -0800, Samuel Holland wrote:
> This series updates the PMU event JSON files to add support for newer
> SiFive CPUs, including those used in the HiFive Premier P550 board.
> Since most changes are incremental, symbolic links are used when a set
> of events is unchanged from the previous CPU series.
> 
> I originally sent this series about a year ago[1], but received no
> feedback. The P550 board is now available (and I have tested this series
> on it), so it would be good to get perf support for it upstream.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
