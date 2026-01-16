Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADF6D4A5FF
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 05:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFhsHiFWCa64fKrWXeJ9wKaQWjAmvYIAf6O7GMZMchA=; b=fivouwJTjvjQmD
	dll33ZbYYLL+cZAqBkgvBlAWL1UyG/+BdHMJHLnppy+T8Zq4zv1UUJxo+YjtJp+NnnSnzRVna7VdY
	6utPl2xtunxXHTRErc8eE0lUbpquFu39JjkXJv3+KkeDC4FCY6DBdqY59QjJxsWVAVNcHUDk4xGd1
	AFgMnaaWQzdAWeHfMchPnProEkvMk49BWfQZaS/GdWR77zQEkI7VAQs5YqDTpaR29amM6Wgb+E98M
	vJUHKLtbpAEktUe1ZHrCXwAV+2c4LoUhyi/9KUpQJfFw1MKFXs09el3Cj9PTxjP9TfPr72OTsHesw
	Vvdz8o7nyPpBFyDeW1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgc6H-0000000DbYR-2Jj6;
	Fri, 16 Jan 2026 05:10:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgc6D-0000000DbY2-0ryF
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 05:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E016C417A0;
	Fri, 16 Jan 2026 05:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1EFDC116C6;
	Fri, 16 Jan 2026 05:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768540215;
	bh=HZzHW7YHZPFUQKO1dKDsA0Pg/kpBIfBQhMpeukAM8II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Het7nqjiBCR4dN8g3EHFcpM9lAzrF60K0/j1XIY6YjUPMhPtRmD6t5xGxbngzHAV2
	 /RMwlWIc2Y6ZymJ73u4Lv3IaFocowX+CRqTyOkx8+Q52QoK1AN1tKprDXos4BXBH5S
	 rEmmXD5qf3HeTNQfgCn3o6gioZzNbEGkcJk4PsqlB53DAzVe1eB3Q25dEVDFqUX7bc
	 dfHhhuuqzXSxjvegYtSkfxiY5g2ZC11GXt4YimMK3vJiuOVlCYteH41RevpMgWvvba
	 m1DXZ5QT52HlbQX3zkfjbSwuczYwQ8wCRRzDPTJrb+BQEXiPSnI1airiKQbzelXmEc
	 14Cef03trdThA==
Date: Thu, 15 Jan 2026 22:10:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Craig Topper <craig.topper@sifive.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH RFC v2] riscv: Use 64-bit variable for output in
 __get_user_asm
Message-ID: <20260116051011.GB1452322@ax162>
References: <20260113-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v2-1-e04aba2e1f9f@kernel.org>
 <7bc39d4d-6e2d-f0af-9787-5fd2c92bfd4e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7bc39d4d-6e2d-f0af-9787-5fd2c92bfd4e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_211017_270227_AA4C0CA3 
X-CRM114-Status: GOOD (  13.54  )
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

On Wed, Jan 14, 2026 at 06:02:46PM -0700, Paul Walmsley wrote:
> I'm assuming this would be a temporary patch, and that we might be able to 
> remove it at some point (years, I guess?)

Yes, ideally this would be short lived but unfortunately, I am not
really sure what the plan to fix this on the LLVM side is :/ Maybe Craig
or Bill can comment on that.

> Might be worth adding a comment in the code to explain why a temporary 
> variable is needed.

I will insert:

/*
 * Use a temporary variable for the output of the asm goto to avoid a
 * triggering an LLVM assertion due to sign extending the output when
 * it is used in function calls:
 * https://github.com/llvm/llvm-project/issues/143795
 */

I will send v3 either tomorrow or Monday.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
