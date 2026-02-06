Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C43EE2091
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpMA3aQ92v6tFmGHEL14HNbsnYDTmY8brWo4eWofA8I=; b=swod+lfPdMtCnI
	+2FabYmN+CffWQemYWUyX81NLGYIXIlCSEp+7ZqORDKbTXW+Ph23LhddUHgH35g0GnGE4iC1+zXG5
	1hdlU5iXtoZDBYormLhkVKKEFpLn+hOAWzl4sC9fLwKoHKeQMD4PocPmu20JjDg599N7VLx3/iFWn
	lN3tUYPY1oIGFOAkTLZ4vVxkoJTjTLFVt1YAau5KQDx7+MHTrd43C9vuGcZvE0koAF9U8QSs+R/cj
	9bTj9A01vy5SXYRFuY38NPcBaz3Bx5p6WgfDX9YAfMyr0S85gedSKQsmhJp7IukVScVlN2wsWa9d2
	gOBOzr/dkXafXcffIzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKsr-0000000BIry-3Lbu;
	Fri, 06 Feb 2026 12:24:25 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKsp-0000000BIrC-0XCR
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 12:24:24 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B3BFA240027
	for <linux-riscv@lists.infradead.org>; Fri,  6 Feb 2026 13:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1770380656; bh=U+Pf4h9M3YEQg0wRE4TDVLhds2dAi1ljJ/3l0LMHbzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=NmHEMIcoerHjzuD4tJMyvxsXu9zwDiXUTVm/LEGhC8+I9Ssm8IEcX3p/fpIQqzDhI
	 +hGqZvk61EpnBPX45I4KE0MQAENUK3bA1RmGtJLEtlekWDwWOqyERmJlHDFIaRY2DS
	 Lccl46s+Tc1RjhTQayH+mTu39OlRxE2bdHlqE/Gjjjm/6J3o8xEjxZzqD+nhGBxGdh
	 D9MBSNchx+HlNaM4jNlh3H3dQRolnzWG9e/IjZypcEAJK911ajBH/QSF0EJKENjDVh
	 5EBI3kinb27Nmh9rgH13fXL2Q539V0/vxhKn7V/cfMwYj65vHOUctzBW7YVjY6u2Dk
	 mPbITL76tJr7g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f6tYh12xGz9rxF;
	Fri,  6 Feb 2026 13:24:08 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Cc: Nathan Chancellor <nathan@kernel.org>,  Nicolas Schier <nsc@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <lossin@kernel.org>,  Andreas Hindborg
 <a.hindborg@kernel.org>,  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross
 <tmgross@umich.edu>,  Danilo Krummrich <dakr@kernel.org>,  Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>,  Bill Wendling
 <morbo@google.com>,  Justin Stitt <justinstitt@google.com>,  Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Jonathan
 Corbet <corbet@lwn.net>,  Conor Dooley <conor@kernel.org>,  Mingcong Bai
 <jeffbai@aosc.io>,  Han Gao <rabenda.cn@gmail.com>,  Vivian Wang
 <wangruikang@iscas.ac.cn>,  Jason Montleon <jmontleo@redhat.com>,
  linux-kbuild@vger.kernel.org,  linux-kernel@vger.kernel.org,
  rust-for-linux@vger.kernel.org,  llvm@lists.linux.dev,
  linux-riscv@lists.infradead.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
In-Reply-To: <9323714a-b15f-4616-a525-780accf33b52@isrc.iscas.ac.cn>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
	<20251230-gcc-rust-v5-v6-4-2ac86ba728c8@isrc.iscas.ac.cn>
	<87v7gk8r5x.fsf@posteo.net>
	<9323714a-b15f-4616-a525-780accf33b52@isrc.iscas.ac.cn>
Date: Fri, 06 Feb 2026 12:24:15 +0000
Message-ID: <874inucb6g.fsf@posteo.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_042423_483975_73CCC4E0 
X-CRM114-Status: GOOD (  10.63  )
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

Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn> writes:

> On 1/29/26 21:49, Charalampos Mitrodimas wrote:
>
>> I'm under the impression that the `!RUST ||` guard here doesn't
>> actually prevent the `$(bindgen-backend-option,...)` call from being
>> executed. `$(...)` shell expansions should happen during the textual
>> substitution phase, before symbol dependency evaluation occurs, check
>> documentation at kconfig-macro-language.rst lines 228-229.
>
> I suppose this is unavoidable if we decide to probe options rather
> than rely on version numbers.
>
> Similar issue also occurs in `cc-option`, for example:
>
> 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
> 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
>
> For 64-bit builds, `-march=rv32imv` will still be probed; for 32-bit
> builds, `-march=rv64imv` will still be probed.
>
> I agree with Nathan that this trivial waste is worth it for the sake
> of simplicity.

Understood. Seems not worth it at all.

>
> Best regards,
> Asuna

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
