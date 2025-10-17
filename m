Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE13CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7OJIIeCdokWrlcZd5UuNMPYLAk0W8BbJ+PE0bAt+xU=; b=0MVDrZIaPtdSTI
	mtKXxwEZzH59lLyYfyyytefzuhKAw4+kUk9Qv8OeEd16iNS5Le8r0IccoEDeHnvDh4+2XOkYA84Rt
	hs3326lM064y+skOyLWcKP6ZwltygNt1mQTnp2fz85IIfXbxo/EQjSejjFVeaMdXM1emsqLDYg5dv
	T2d55jL7k5eEnoz10aYkuymIAMZP/XkqxTCEWo/AMmpa3H/DUgSWT2jFHEy6R5WDJQnxhXpwVSZbH
	X01B81K9OMZ0Xd0Hhyn2bkMt/E5fRvRz7JOts/uRZUfD4z4ii/F++6KZT3zBWCsIBFNeuuqSn8VsL
	nKidN49mA20Ix9BDueKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9p8p-00000008gIw-49GA;
	Fri, 17 Oct 2025 18:25:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9p8n-00000008gIM-0HoE
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 18:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65DA460574;
	Fri, 17 Oct 2025 18:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6BEC4CEE7;
	Fri, 17 Oct 2025 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760725524;
	bh=lft1y0RXmNLJsqTdOvmIoFpx/IQvGYsVoxWR67nkQis=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ixbGDgUj7i8yEjKKQkJR/Tc7wRHlDFvaJ4GBuqpls6vWPIHiJKls+DF3SkG9/+HRD
	 JThtI3b17c1mioCcD3dTOfQCN7uaTFXw4cwvrKGrJyspYbASIO50c9TsD0E6Z9Cpvv
	 0c+2bveMzoeNwyc3RVi6ycWnZ9JdGd7OLWcgHy6w+u7Fnl8hZXxJtO7H+DOJNRblMB
	 z+h0aBMg8/ymqsBhCk2QFcQJwRaCmLaP4RNXBh200y2i7sM8ghvewSEt92tNHB8QGY
	 Bzq86YRR6heZvrNID2Wl5DebqHVYzr2mdUwKToz3fqgCm05JbRJLj9mYdXGQe/Pd/Y
	 EuUhEMPEvm3/Q==
Date: Fri, 17 Oct 2025 12:25:20 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, ajones@ventanamicro.com
Subject: Re: [PATCH] riscv: asm: use .insn for making custom instructioons
In-Reply-To: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
Message-ID: <857ab359-4eef-73c6-0085-7c3bd5dba687@kernel.org>
References: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
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

Hi Ben,

On Fri, 17 Oct 2025, Ben Dooks wrote:

> Using .word breaks with big endian builds, making something which
> is not a valid or worse an instruction or pair that does something
> which is not intended.
> 
> It would seem sensible to add an ASM_INSN() wrapper for anyone to
> use for hand assembly of instructions.

Looking at the GNU as documentation for RISC-V:

  https://sourceware.org/binutils/docs/as/RISC_002dV_002dDirectives.html

it seems that RISC-V .insn supports several argument formats that .4byte 
wouldn't.  So it seems this is only applicable for opcodes specified as 
hex bytes?  Might be worth adding that to the macro name in some form.  

Also, looks like this is missing the opcodes added in commit 
1d4ce63e338fc.  If you update this one, could you please add those as 
well?

thanks


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
