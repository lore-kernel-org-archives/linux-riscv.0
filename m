Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29202E8538B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 17:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJ53KPpYg9VQjTRPo+LCT6avL2GkztWScKZQqE0Vw5g=; b=N/Klke+XLZS2bYCxKAMF5nZg62
	j1iLF9Y+A4CYp+7DhH/mU8qOWFiGX99ypsuy/Loznw/PuQpVLgGqBRHb+4dlUG9hW1Q+UsXXfPZ/W
	w8LwpI3oY+1+7UEjgXvheDYKRdFR5RLG1dJEg3p6iyvCvquw9H5rWfcnPuQMP2/pQievX9EfBpcDG
	75MqMbJc4JR5kw4EYO1X85gz9Ub5bcMlgqx5NYp6pvC0QSHeZ3ikSs3PyI0QWOKUikOtIa7yKavHR
	FSxj9JPuw9GK6ZRtM6ZMlReJmoqCChMgd1AgG6/AqGoIg/LHgZtnz5zdNKevjUbXg8+4hkva3dsex
	TTCfiAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ibq-00000002PCj-0b0I;
	Fri, 03 Apr 2026 17:47:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ibn-00000002PBx-3Bap
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 17:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E134943391;
	Fri,  3 Apr 2026 17:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89258C4CEF7;
	Fri,  3 Apr 2026 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775238422;
	bh=+VwpswqaaiwBaK6+QDNWGhUo7EoQ39AbAVV+PZHtYxk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QCGuCY3ehFpVJpwa1ZhKEVOkgLwnGiCvMIrF1lkS60M60cbRMiWSaXaKJwPxXMX+y
	 14v2lJTi1i9uzpYyzz0ye/4dLAmqHSPZv5L1Ztq2fVV0jX0vSLnzk1nezKF1oa5B/r
	 nReVNeIsB1fY96br2+OIpaoJVjEuzLt2DvZJeyXXCC1FRHEnfnm9Iu4e029cH0jgOE
	 0d9t9ClKNtPb+4dHTEZhBOUNPPA4K6nWuo+cNYu5NGj/K2rs/jsWdo7t4JxCyunJwD
	 Cm9uNRVfTrf1GINu+PdlHh4UbFgE1t16+9A2TtaEqoimM3eB/12USMTP7o8+ohe17D
	 exfqTgw6+tSXw==
Date: Fri, 3 Apr 2026 11:46:53 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
In-Reply-To: <d79b23d2-f8e8-b92e-cad4-5cbdf7690f12@kernel.org>
Message-ID: <34fbc75a-ae74-8337-3107-80957707bc8f@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com> <d79b23d2-f8e8-b92e-cad4-5cbdf7690f12@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2069827645-1775238422=:751248"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_104703_820120_3A4C8472 
X-CRM114-Status: GOOD (  16.54  )
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

--8323329-2069827645-1775238422=:751248
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Mar 2026, Paul Walmsley wrote:

> On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:
> 
> > From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > 
> > EXPECT_EQ() expands to multiple lines, breaking up one-line if
> > statements. This issue was not present in the patch on the mailing list
> > but was instead introduced by the maintainer when attempting to fix up
> > checkpatch warnings. Add braces around EXPECT_EQ() to avoid the error
> > even though checkpatch suggests them to be removed:
> > 
> > validate_v_ptrace.c:626:17: error: ‘else’ without a previous ‘if’
> 
> That's annoying.  Can't the macro body be wrapped in do { ... } while (0); 
> instead, rather than adding these permanent checkpatch warnings?

I guess you haven't had the chance to take a look at this.  Or maybe you 
took a look at the kselftest harness macro mess and just decided not to 
say anything ;-)  I did look, after not hearing back, and the way those 
macros are used would make it a big and painful lift to straighten out - 
definitely not something for the -rc time frame.

So in the short term, I'm planning to take this as a fix to deal with the 
immediate issue.

checkpatch.pl clearly needs to be patched to assume that these kselftest 
harness macros don't follow the rules.  Care to take that on?


- Paul
--8323329-2069827645-1775238422=:751248
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-2069827645-1775238422=:751248--

