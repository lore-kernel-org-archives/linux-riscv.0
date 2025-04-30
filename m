Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87877C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UleOP0WAmi8RrpmdNWp7703mjo4sRfAXOAzAd+BuWsA=; b=Ux7jUtzoxfiWHa
	ZbPKOAY/SuxeAg6JfCvlT1gMkvqq8rhNr6AMPwle3dgGmVsj+0E2Jr53190WqEFuhZrMjL+Y+FBSy
	sarsQxdiimCBq6sTpT4t/QqlxhiHKW2/KrJok2qccYbrcN8v1Oe+lj1xpL81AISiDK3mnCtr4ksKq
	0AkdANkf06ajHWGRdtaL92WVBfLQhezoC/OGUTy6Hcc18Prr9jx4qWLq9Hhz0hzCXb5dYG8SXTDRB
	xtNPVQTo8npg2RKVX+JCVlE454aP3NtONweV00fifXSeyghlvhivPhtQgIREQOa27d5uOF1VUmtBJ
	qAHd7SgWarGzTfFhxoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9ug-0000000DMbr-2moF;
	Wed, 30 Apr 2025 16:03:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9g9-0000000DKp0-40MJ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 15:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FA675C49F9;
	Wed, 30 Apr 2025 15:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9A5C4CEE7;
	Wed, 30 Apr 2025 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746028136;
	bh=EpdyxGfmIGM/4y2DbJ0OMYH/LxyVa4jnB71F6fCAjiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hV+RSHROe8y9M6TG3n4UqKL/GYMH1zRzLtVqgegLtW/9lsNUn95NlSrItfc+bHfEA
	 n6sO+hDAlFxcucIpRcjeVICiOWRHXxa49nhV+LMzqYVJmW33k+83cTJCT/wVz5UUgW
	 REjzRljhm9OKHR/UuT3XiaBKSqHiFO6CA7J8ulboqXfBMCpLjB8gUnwMEEl48iaOzW
	 Cek2zPGuf8n4TXhCcOTB710jnn8VmpCApsSFjPxJLIO2exXSmrIRFdtu3zbhJ4d+Dh
	 aIzN0U/QBkV/rGKqbQ4BvKQhunAMKyJtamk2Zh2ZknUjpueb6PBzNAqaXHEsYfBmy8
	 8XZI5WBXktHCQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: naresh.kamboju@linaro.org
Cc: anders.roxell@linaro.org,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lkft-triage@lists.linaro.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	namcao@linutronix.de,
	nathan@kernel.org,
	palmer@dabbelt.com,
	regressions@lists.linux.dev
Subject: Re: next-20250422: arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
Date: Wed, 30 Apr 2025 17:48:45 +0200
Message-ID: <20250430154845.795993-1-ojeda@kernel.org>
In-Reply-To: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
References: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_084858_033205_EADD450E 
X-CRM114-Status: UNSURE (   5.64  )
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

On Wed, 23 Apr 2025 20:15:45 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> build errors with clang
> ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
> '__vdso_getrandom' failed: symbol not defined
> llvm-nm: error: arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg: No
> such file or directory

I have also been seeing this too in my Rust-enabled builds for a few
days at least.

Thanks!

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
