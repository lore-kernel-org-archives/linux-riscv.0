Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1CB1099B56
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 00:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTdDsQ1jjy73BafSZ+xeI/5TsmYY7ul7RsQtiLFUnU8=; b=pGySXG0NVuiFQvqG8tuYIjfA6u
	vTbG4z2vxzg8fslmd4uu3TkeOXfoT9wN8DOaX3KlMy9SNsq09QeAXZgNirRboTfMxaj+geWMcDGMh
	m3bfo2vN5YfPwg0SWIduEi8xu+tMNhexy8SJ88Or7HkEzkhdlD9yAEC3fgZ1PkDbQgGsbSDEVxjfR
	0d0zhmd0uAUvDBZVdYRRGF4ESni0zc00dJcSFExpG/pGHi1lsVP2UAE57xBmlZ8MhIUCjr/i8P9US
	HziqwM3wxI0x24VhyQKLqgqMSmN9wpJ8YT2IHcwzdCX28v6xlXvh1B713t909EHfulnmw/lR8+to4
	MRgx/rYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3kb0-0000000DqmL-1QiM;
	Sat, 21 Mar 2026 00:53:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3kax-0000000Dqlq-2cfc
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 00:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCF3E440B4;
	Sat, 21 Mar 2026 00:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE55C4CEF7;
	Sat, 21 Mar 2026 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774054418;
	bh=5SupC/QboNW6HtcGYgPPKzGRtNz7S166REYF09l7I0I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QO+4LKwdMhwOM+/UH0bS7idbp4v3HJsD+kWCXOaX3a6WIWp+8LttKKtahNcoAYmbb
	 H7mdJAuLi1bUNOuEA9YRQXWpYRDb8lubmP2NDImGNR21E+105Vjy5eDjzciNztm7lm
	 nG3e9yJNvWcknkfJ7toBfbIEEh7Q9xVGFkAMbqENfRP849QH7eyi31Dq3KFccmck3T
	 3AmFLfwKzcZEz+5ZyM6iOusJd+RRe55mJkatsj/g+ETTbJntbSiWQj9EcjHHso0OkG
	 t3jCQvMO4kkrvERmkFYnjUYymuYkTDlOoxU8ChgEQyeHXdsqxOaq1fatJdWn4LcL1f
	 pFiB5LyLvDzag==
Date: Fri, 20 Mar 2026 18:53:37 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] riscv: ptrace: Fix BIT() compilation issues
In-Reply-To: <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>
Message-ID: <d87c7b4c-5849-6254-8e85-805c752acb5b@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-680884709-1774054418=:243157"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_175339_687508_3212F220 
X-CRM114-Status: UNSURE (   7.73  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-680884709-1774054418=:243157
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:

> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> BIT() is being used in ptrace.h without a definition, resulting in
> compilation errors in tools/testing/selftests/riscv/cfi/cfitests.c:
> 
> cfitests.c:101:60: error: implicit declaration of function ‘BIT’ [-Wimplicit-function-declaration]
>   101 |                      if ((cfi_reg.cfi_status.cfi_state & CFI_ENABLE_MASK) != CFI_ENABLE_MASK)
> 
> Include linux/bits.h to resolve this issue.
> 
> Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks, queued for v7.0-rc.


- Paul
--8323329-680884709-1774054418=:243157
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-680884709-1774054418=:243157--

