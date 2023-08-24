Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DE1C3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 01:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ElVvsl8PRqWsR0ZU5dMxNWR+M9Xkfl1xE7aCWeO0QQ=; b=kJOJ4RThhUK+QT
	dA43Hsm7tF9WN4Bep7Mh45omi7mxs36HkbLSiPZNO2LjB2BHNzVQUpE96zJ9wVxYJDe5TA93xR1sL
	GvT8Jk7o1udvhxZyFxy4e9soD9XjhLY4AOhp8Nf/eN0QQU97vUJSqb2E9iXKzrQR7CPMkOuTHD4z0
	FXjgH/I7DSCzAPMi7LCW6NDI9x0ERpvwLANgVJBgY8ieXQrVnL6f1adLsS7wRAua3b10ByIMnCqCA
	ZpfKSUHPHoYrcrx5HcD0YowJ/bwwKtzsEwbzNxuiwV+JaWcqB2CQnbcXH1cuATz/ra9rLJyHV/Fgu
	Btu6KgCApd+37s1IZvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYzXx-001vCQ-0l;
	Thu, 24 Aug 2023 01:54:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYzXt-001vBs-2u
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 01:54:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC8B961345;
	Thu, 24 Aug 2023 01:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255F3C433C7;
	Thu, 24 Aug 2023 01:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692842038;
	bh=dUjRC96Y34euUDSaNA/h1pSNeZPTmkLzu7c2FEi2qA4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pbk12ZrmqI8Ci5eZuW+fGynBf6JIzCY4Q3k6ZB/HU78f2Jdkaz9ZN5xraaI3HGsMP
	 pDJIYewooAbY+9jxcNTA5wpiyUPFF/es9Izng350BdxnNrYf2zxn3v3icKa38RRTsP
	 mSCLqHG/EfmUURRhWnoRta6McKOGaIsEOJsNmyj3cexzyIboKmoUvWkOziY5RK71OQ
	 o+OrQZ8qJ0qS55rkPQtoefygY5aMAy/qx60L99qjRrBo8USvU1VP8FmETEBrXUY1yu
	 DWMXlp9qcUZ7bnJ3unE+cN18tQsrJn2O56YMlyvIEHql0MYoWbDeqIjwtMGoRi+/cH
	 tfOw2YjmXN9WA==
Date: Wed, 23 Aug 2023 18:53:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJu?=
 =?UTF-8?B?IFTDtnBlbA==?= <bjorn@kernel.org>, Yonghong Song <yhs@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xu Kuohai
 <xukuohai@huawei.com>, Puranjay Mohan <puranjay12@gmail.com>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v2 0/7] Add support cpu v4 insns for RV64
Message-ID: <20230823185356.0db6cc1d@kernel.org>
In-Reply-To: <20230824095001.3408573-1-pulehui@huaweicloud.com>
References: <20230824095001.3408573-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_185401_998639_803F108B 
X-CRM114-Status: UNSURE (   6.16  )
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

On Thu, 24 Aug 2023 09:49:54 +0000 Pu Lehui wrote:
> Add support cpu v4 instructions for RV64.

Please make sure you fix the timezone on your system before sending 
out the next version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
