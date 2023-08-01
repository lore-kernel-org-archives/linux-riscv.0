Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D459C0015E
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTqW0yGaNyHt/AJVYizVQ7rV+w7NmDqxKW9Cvx7IW/o=; b=tE/YpYTKpyISJh
	XLBPwbEGByfJj2/fA3U9e1eOrYS7n4ZXHBqrXQ3ihdvZsFG/jtdZgGqFHxDV5Q/cqyZblhneNv77D
	d6HaD8viMVCvci1ffZn84RGo9/6yOap2BdEi9N8zOplxVI+gluHGZPAf2OpfqMyRKTy/OVXbeU968
	LstAZBYp4est7yTxlguN9mycs3nPi3pcWsrQRJbcSMtraP7ODgoXvwAwCUM1ky3aJ1YA4WfxsQJgP
	zRsIggHQzeYsW63R7c4/o7vEetfVSdaXJyCMIbt36swTOQxlK57ebRSCrvObk5y3IEYWzu+SnYau1
	6+kfnDcsurjQD0A+HnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQq7w-002Xlv-2o;
	Tue, 01 Aug 2023 14:13:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQq7u-002XkQ-0V;
	Tue, 01 Aug 2023 14:13:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 995E0615C2;
	Tue,  1 Aug 2023 14:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C215FC433C7;
	Tue,  1 Aug 2023 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690899209;
	bh=NTBwd29Dbu+ECP276LsKiM8HBDKaR00BKAB6CRCf3bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abqS+G0uERa7fIKrH4hSw9IDBy+zR3n2e2RncQqAqkzlG6NQHu8J5iIFlkwrB657I
	 oJQ0+vDyHimf0Zzmz13ZMAyco3wCnDXoFSci37voDkjQr4SVseAsIyVJ06v3CG1ZKX
	 wA4zk4L/vjGB4EVHMfxhGACjxWZzRWGs+AESTu3SAB7pEpFPTu5QyCSKsYrmv6ocyz
	 STvBOLI5/v9lmw1IkmkGMiZootxRVm5BrSrS3Z8ppbrLm97hcIZG9bJiqDSG26raqx
	 VegkDKaNPneU+4IvGTtTT2RITGdJC90YBsdQ0YM0USvoHqq9xrcZJCf7t4mwUrCzhT
	 F9wsepVvvxiMA==
Date: Tue, 1 Aug 2023 15:13:20 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 00/36] arm64/gcs: Provide support for GCS in userspace
Message-ID: <20230801141319.GC26253@willie-the-truck>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_071330_235952_C14ABB20 
X-CRM114-Status: GOOD (  12.12  )
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

On Mon, Jul 31, 2023 at 02:43:09PM +0100, Mark Brown wrote:
> The arm64 Guarded Control Stack (GCS) feature provides support for
> hardware protected stacks of return addresses, intended to provide
> hardening against return oriented programming (ROP) attacks and to make
> it easier to gather call stacks for applications such as profiling.

Why is this better than Clang's software shadow stack implementation? It
would be nice to see some justification behind adding all this, rather
than it being an architectural tick-box exercise.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
