Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C3A606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 19:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G94HQEvt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvH/VhjH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8uO/gcZ894iZQVdFzFY5z2kB7LzFZ4fHN3uEzecGdJE=; b=G94HQEvtjXutD5yC/A2kcA6J4r
	3fWaIBSTErEXdb5nOYnZCplj7AWPCfp+cplaRSu1A/cFSAf1okRRdON864lfB4Iw+4Tv6bkxNuyl8
	pMzelwg3wrU6B4z89C3ctvBj8ch0JGnTBErwdwmaKpQGv2hWNJvyzRSDM4s0zsAtjKm6kYr9447sZ
	vaWAVS2G2EJmTFZ/W2D0ZgxG2aBXSZqtsi4BBFfXzl/9uZkcDjIIFWREEDc72TrNSUseJ8/qhBnNv
	6Mtm8C8+OkJC2qTnUq7ru8qPMSy/+4JST0P9MvH9BbgBm+aVAfYPo4wx7x1N/tb/P9kQpCIlMD7zX
	tJlsq8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIRF-0000000B6EA-03Be;
	Wed, 25 Nov 2026 19:13:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIRD-0000000B6Dt-1TW7
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 19:13:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BE9F61F9F;
	Wed, 25 Nov 2026 19:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57BC1F000D1;
	Wed, 25 Nov 2026 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795634030;
	bh=JzqkgI4XKn+2Xg9CKdw/pLeS+R2Pa6tQ/U34hWLaem0=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=TvH/VhjH69e9gw1c+LupLN+HPd967kQUHhrw1v0Zc9vLptLFZtyy+4/lgQP6VOdcp
	 PCfMBIb1f/59Z3pNuhLw4xzbuA7HPJJcI1B65RWurLsAS1Ku4CUTHkgVreoxt3L8GD
	 prVbGZdiA87FLx4qxmReydkILok12JQ2bjYtskB/VThxbzrB2AhRetUWSpCog1Z6M5
	 aVxJqCZaSxyVZ6RO6Has5H4aL366bI2Nt2Wtenm4gNV1iqdJvD3CdxwID32mQbajW7
	 SUJU6zt/ivfaa9twCHdZf0FQL7wV9AynS1z/EBrYkfQJ4AV5LeOFyH05ih5xgvIdK4
	 xTpVa3t25YmmQ==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, 
 Shenlin Liang <liangshenlin@eswincomputing.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, lirongqing <lirongqing@baidu.com>
In-Reply-To: <20261102091809.2215-1-lirongqing@baidu.com>
References: <20261102091809.2215-1-lirongqing@baidu.com>
Subject: Re: [PATCH] perf kvm: Fix RISC-V VM-exit duration accounting
Message-Id: <179563402794.1738553.15078250246991180255.b4-ty@b4>
Date: Wed, 25 Nov 2026 11:13:47 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 17:18:09 +0800, lirongqing wrote:
> Use kvm_exit as the start event and the following kvm_entry as the
> end event for RISC-V VM-exit statistics. Keep decoding scause from
> the exit sample.
> 
> Before this change, RISC-V measured guest runtime as VM-exit time.
> 
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards
Namhyung



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
