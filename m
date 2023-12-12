Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A09C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNSmXJUZkLMENkBYOLHhVphx0s/5fUGbNNx6sr7CR/o=; b=A+tsFoU/poG1yZ
	by+nK/3URC7Om7UfV90pcqJd6twpsdSes4ZpHLEe33HBMuCYbnWkoySf6ydbeEprzbhanWvhLqC6i
	bBY8PwlKuKzjaaqSXwucgWP4pJ5w5uIPPBF5Wuu1w7POkDYT+xY93bOye2bSDUUTDTJfxnOwNJjKe
	zhK5FhrM1hlK7DXNQF5dWNWH4pdhvxwm7OrIFXenpJnsd4+J2wWlGq3xWfOeSFOdHvcjbMvQvuuqr
	4icGqjvgZOcjtluwq5slnqfPaQg7EvtX1Tn0v2BZuriYb1ZpZVvgSeuuYCvmhTAVyLFQyGVcFifYY
	Wg+4CQx+3QIlFstm+rZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6mc-00CQ0G-04;
	Tue, 12 Dec 2023 17:43:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6mY-00CPyS-3A;
	Tue, 12 Dec 2023 17:43:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 412CECE1B01;
	Tue, 12 Dec 2023 17:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912EFC433C7;
	Tue, 12 Dec 2023 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702402975;
	bh=+h9Hy/o6qPUoywDyWEUPYa0LHvbEAwTr1e24Paq/tos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDcLxHelMIzPI8uabqZaj/J1ptw8Bbp3/fmYDq0ra7rMT0PeFkQ90OOZCAPFaUb6A
	 Pf1xrFjFQDntjBJ4litDwDD96rI7P1hbXkHlQbxzfymZPaWqFcP3fJIKPQdbiwgy5V
	 BZJhfu7qQSK2nEpGdAWBr/1DJIdxCNhkDvpMPJNKnZReAND+JosLQhQEoKLVyhjNHY
	 7QQIjUTZ9p13DxnOVCRkam5wdQ9+3tPoCM9vtVV5SAZCsuMYJISitUvT7/vXsbJMJc
	 Qmgwwdb2RgC0munn2yFEdl9n2A/m1gqB5rjiOmGfk/xWixe+wxrvaEF4X8ZUEXoRmv
	 Bu4BZ7fKxNpRQ==
Date: Tue, 12 Dec 2023 09:42:52 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231212174252.ycztjhgyhtcrffur@treble>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <ZV2+f/yu3C6xTVqn@infradead.org>
 <6d4cecd5-9083-4d68-a7e2-266dae9e3952@sifive.com>
 <ZXgH6un2uLdjQ48X@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXgH6un2uLdjQ48X@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_094259_206838_BED86C3D 
X-CRM114-Status: GOOD (  11.93  )
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

On Mon, Dec 11, 2023 at 11:12:42PM -0800, Christoph Hellwig wrote:
> On Thu, Dec 07, 2023 at 10:49:53PM -0600, Samuel Holland wrote:
> > Actually tracking all possibly-FPU-tainted functions and their call sites is
> > probably possible, but a much larger task.
> 
> I think objtool should be able to do that reasonably easily, it already
> does it for checking section where userspace address access is enabled
> or not, which is very similar.

Yeah, that might be doable.  I can look into it.

-- 
Josh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
