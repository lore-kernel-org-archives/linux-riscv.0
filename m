Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10026D715C7
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rrQcCf4Rdf6BFgZSggyLPl3rURT3bdV6Q4YBiyIrd0=; b=nJun8WVs/gmAqv
	LjqfhK88Cpl1NdKNam8kf/xmqfa8eOrp0aWLkgXgwWbO7SWZEQOcyZIqLH4kSgRqHrsd2X7nsr9my
	3f8YlPgJB095FJzpZP2J8YM+N8SCl7fdfDDFZnEDiP+fkYg18IxnApj9QApdFeMr7gbUw6RQU2XNw
	ANH/jod2zpqLL06uMQX1o/FDZKCDVnd3SoT3cBSusWcxPARUHdNCx6IQjfxakSTJov5O686M+qM8p
	end1dg8haamNPWaOqyYe2L+npgkLII4FEl2Fo3csiLVk/wBQU8Y8I30t/WGHV15rOghERaEWvFVS9
	tNTG2OZPTUNGI9M700SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYMq-0000000A4VW-123b;
	Sat, 24 Jan 2026 07:47:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYMo-0000000A4VP-211i
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 07:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14A6160018;
	Sat, 24 Jan 2026 07:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79FAC116D0;
	Sat, 24 Jan 2026 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769240852;
	bh=cRhYEqASoyGXvv4wFRlJyoAFgB1wB4v+V+7SwqQAphE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PJ0RtR6lxginyXgC/wWOq1PMCQqJtrBUuSSzp/J8zAW+hMSaBttoj7el3UIRvGwOn
	 JJNrpOxF6gaqtNWer9O66JBK+EXrzLJR04mmKvqrTJoM+B6Eprwh3m60XamLfuGHOx
	 Ygi2e7mYPlEuCYGL/Z9sD4dBSbsgzPn2e3ywqABJJ0J86BGWJMFlEmLS98lqG/wFl+
	 8Lfo5dkLTfZ7JGgkXtYMhbVTsUazD/bqi6Qfd4nA1e+pxvFUNL9hPd36fkj7qzy3BL
	 ChEdKHzDghh82z0477fb9eQjqGOFMlqrgzQkF/H3fZ3qW/tlcMB27o3iDPY/6goisr
	 NXIu0menLU07A==
Date: Sat, 24 Jan 2026 00:47:26 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
    Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Danilo Krummrich <dakr@kernel.org>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>, 
    Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>, 
    Vivian Wang <wangruikang@iscas.ac.cn>, 
    Jason Montleon <jmontleo@redhat.com>, linux-kbuild@vger.kernel.org, 
    linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
    llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
In-Reply-To: <1b0943c4-b1c5-460a-8944-c8d9c868b085@isrc.iscas.ac.cn>
Message-ID: <47d1dab9-a379-7b3a-d06c-03d674cfbb76@kernel.org>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn> <1b0943c4-b1c5-460a-8944-c8d9c868b085@isrc.iscas.ac.cn>
MIME-Version: 1.0
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

Hi Asuna,

On Thu, 22 Jan 2026, Asuna Yang wrote:

> Gently ping. I think this patch is ready for review. Is there anything else I
> need to do before merging?

I guess this should probably go in via the arch/riscv tree?  If you agree, 
then from a maintenance point of view, it would be good to get some acks 
for the first and third patches from the relevant maintainers.


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
