Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AB4CA0EE8
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIGJ2f6Z+EQFvxHNlMLGUrnKz0BRpGAzXmIRdXt3QhM=; b=Zr+DQYGkbO0juj
	ZlrBZCJ5ek92kuFLm6fRsADvthZfRldMNtoeVT+zYSIiF+pmp5N4CXSenV6i53rYFCz/glOB/Id7u
	ztjG0e5ozKxjVRQT9KQoHggxje93flx6JMVa0F99wvCjdwSwUjWv9YVLn+EVKibJB9QCKSyOMNVst
	ymLX0tkl7JmmZmc/MKJq5Y1iZAicY6D6ctrvhc6o12umeZzibLEpMmiEuHXngGS9Beli6zdA1Yftl
	b0FU5pL2TiZrZ26itV9Gi53E4y5wOR3I9/9xwDa8XIBO30YPNIBDdXhcVPXJr2/t2bUymwK0Ci3GH
	aw8alX+DILSzbFhc0NNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyr2s-0000000BFos-2vTm;
	Wed, 17 Sep 2025 12:13:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyr2q-0000000BFoA-2xpY
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 12:13:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 65D0043272;
	Wed, 17 Sep 2025 12:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81EBC4CEF0;
	Wed, 17 Sep 2025 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758111236;
	bh=LqRWtS1sP7B5lAKG4NiZ4OwXKCQ+4DM+sFwKGhKBCRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anfGVJbOjccq4Um5w31gTeSe2q+k1mtc9hK52Rk/DnnU3iR7mJKWHevRLTD9q2bA+
	 y3AkCLwlN+iVJf06RPZKbyAM/90+HsIZX+qa3+P9+39WWaOV+ctXR6vPRwZG1rxWRQ
	 cE/gB6y1bFQzGBB1YGgGLOsdztotDEGSjTxMqDGhoE7JaG+e0/H1IaOBWpQds7O29n
	 AKQ/ifGr1FIdGpMfo3t99pj98NdLTK1mflMPcL1BVWzd9v/KK8W0M3pc1TS6JePV3l
	 lbScKLDL3b0kEYwlVx6tx5nxRDHvS3zNt/MFPLv3Q+s3JXCO0CNAdTri9RGuibpLwB
	 N5QXp0J4te1Pg==
Date: Wed, 17 Sep 2025 14:13:38 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Asuna Yang <spriteovo@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Han Gao <rabenda.cn@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
Message-ID: <aMql8oB4GuU87lie@levanger>
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <20250910-harmless-bamboo-ebc94758fdad@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250910-harmless-bamboo-ebc94758fdad@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_051356_773057_A897D996 
X-CRM114-Status: GOOD (  18.76  )
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

On Wed, Sep 10, 2025 at 03:27:19PM +0100, Conor Dooley wrote:
> On Tue, Sep 09, 2025 at 06:53:11PM +0200, Asuna Yang wrote:
> > Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> > + Rust builds for RISC-V due to differences in extension handling
> > compared to LLVM.
> > 
> > Add a Kconfig symbol to indicate the version of libclang used by Rust
> > bindgen and add conditions for the availability of libclang to the
> > RISC-V extension Kconfig symbols that depend on the cc-option function.
> > 
> > For Zicsr/Zifencei special handling, since LLVM/Clang always enables
> > these two extensions, either don't pass them to -march, or pass them
> > explicitly and Rust bindgen libclang must recognize them.
> > 
> > Clang does not support -mno-riscv-attribute flag, filter it out to
> > resolve error: unknown argument: '-mno-riscv-attribute'.
> > 
> > Define BINDGEN_TARGET_riscv to pass the target triplet to Rust bindgen
> > libclang for RISC-V to resolve error: unsupported argument 'medany' to
> > option '-mcmodel=' for target 'unknown'. Improve to output a clearer
> > error message if the target triplet is undefined for Rust bindgen
> > libclang.
> > 
> > Update the documentation, GCC + Rust builds are now supported.
> > 
> > ---
> 
> FWIW, this --- breaks git, and anything after this line (including your
> signoff) is lost when the patch is applied.

FTR, there is good documentation about '---' in patch mails:
https://docs.kernel.org/process/submitting-patches.html#commentary

Kind regards,
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
