Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDCD1099B56
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 00:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgl1sKnW6KNSSQZPFtnGlCAvFsH3hJ88parH932/4e0=; b=eQUmFNRtjdjaHJ
	/Zifl/17jke5Xrp1FKrmg34yV8t/tkAwVZxcDjnf6q23pGbJNsCyQm2TlR7IbNOMbD3yb63ZW/zE8
	MzKfTmjA30nQs0S5F9sTOEldOTOaLLqSnCobCs/ff/9gnisU+JXYXQ5xEoSJ+foMLuGitcNfahD6r
	mgeWJqur8kqP996SafOIps0p6w146tZ9Q6smJb9EgeMz9KGuZgvdUXXD25IBn8DBDN6e3c2Xlu4Wp
	ra4mDW7C8csoNRokVafSs8rG4LfepgDiZCtsvImg771h4mk7VKNdSeXx32BHpqvIVBAsLrm6b6k2b
	i5w2cvQvq7uwEL34FRGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3kVu-0000000DqVe-1EZJ;
	Sat, 21 Mar 2026 00:48:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3kVs-0000000DqVI-1N8l
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 00:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B84B40800;
	Sat, 21 Mar 2026 00:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA342C4CEF7;
	Sat, 21 Mar 2026 00:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774054103;
	bh=lyiNmQ1nmfSsERwQpaon3tU6nzQcQ+tqsZc3Ole8Wvk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WeFA9TXeJTyvLwYeqoaThnp8I77vttkpGEH6ts5AJeNgvlV6zPnXa1BDO9CiexMIP
	 I9Tfn/8ydYamt9bTxsHhryErTUk+NP9PlduQoWGwaO5e5Ghzg2IZy7GA5A0y6H1tL7
	 6DY8Zx73pNQBITUdyhZEbiwNJAh4O0g7pgd9EmFa20cn8+H/j6Ha/uCj6HPWnkFDGQ
	 7rtXLPT1hYPzCQzb089iQ1QmpAW7Zb0zn+yPwDWekGLgXyBIMLJXZA3+QWpVH9c8zE
	 OWfgUqvqs1TZMbMvMnlnwOUuWTjKdl1i+NBgXosg6r8bkvLnrPl39gcnlnaN5eBJwj
	 961DVVEFo7PSQ==
Date: Fri, 20 Mar 2026 18:48:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Sergey Matyukevich <geomatsi@gmail.com>
cc: thecharlesjenkins@gmail.com, Shuah Khan <shuah@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Andy Chiu <andybnac@gmail.com>, Deepak Gupta <debug@rivosinc.com>, 
    linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] selftests: riscv: Add definition of BIT() macro
In-Reply-To: <aa_T3_IySAj4_Xwo@curiosity>
Message-ID: <b1f21899-ab47-6380-a320-770c3089cd7e@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com> <aa_T3_IySAj4_Xwo@curiosity>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_174824_408400_8F7F80AC 
X-CRM114-Status: GOOD (  14.39  )
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

On Tue, 10 Mar 2026, Sergey Matyukevich wrote:

> On Mon, Mar 09, 2026 at 06:52:10PM -0700, Charlie Jenkins via B4 Relay wrote:
> > From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > 
> > The BIT() macros is used by the validate_v_ptrace() test case, but not
> > defined. Include linux/bits.h to pull in this definition. To ensure that
> > the header in the kernel source is used, add tools/include to the header
> > search path.
> > 
> > Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
> > Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > ---
> >  tools/testing/selftests/riscv/vector/Makefile            | 7 +++++--
> >  tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 1 +
> >  2 files changed, 6 insertions(+), 2 deletions(-)
>  
> Reviewed-and-Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks for reviewing and testing but please use "Reviewed-and-tested-by" 
next time so I don't have to fix it up by hand.


- Paul


$ scripts/checkpatch.pl --strict 0001-selftests-riscv-Add-definition-of-BIT-macro.patch
WARNING: 'Reviewed-and-tested-by:' is the preferred signature form
#13: 
Reviewed-and-Tested-by: Sergey Matyukevich <geomatsi@gmail.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
