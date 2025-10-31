Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F5CCFA02
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 20:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUWiV9032DuRMVIFlosuRjTr5g2tH4GcUiULCqf9Xfk=; b=lQYZNXCu/Yno0a
	O3jAyc8MY3ySTc2T8LQXoeYHUVz4uuT4YdwJYXLeDAcUd/kHVxg+YqgeNO+iDWAlHYg3fi1kl5c6j
	ygXz0FTF5/IgE26NuIwxzf+K1Ok7gpdQU/PiTTDIMezzRlNf4R0qQ6cnHeQcTzHcf/d4hk0/mpG3x
	RTolsJO1BMTGmUXpuRuTUHunggvXdsRnkADt6oNiwaazLQe3q6enjz0eNUAgSnDqxYLrU5uNrsCzk
	n/LPMmrdCnnNQvctTt6vEHDMnuR2PhHNvBbVSBP6OAu3zekzIXY2frJAHqQfblA2t13Don/T5wVGd
	P6hjHSJj9JYolCENtzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEviR-00000006m8d-472g;
	Fri, 31 Oct 2025 20:27:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEviO-00000006m8C-2Big
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 20:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D26E84326E;
	Fri, 31 Oct 2025 20:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A41C4CEE7;
	Fri, 31 Oct 2025 20:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761942435;
	bh=uzQfovvW/jkcgZT/o1AXK4X5cICS7Xt6pO1Aj9cYQ6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elc116YLJ+U9gqeEgBBKoraeUPU0m7OubR7/DAVS6GqQp/XQpMhTKy1cEWuJ+wVHx
	 jqmIlvabTP23S8s4yU6zwpXZohol+W3wqdVvejzNy3LxQUZxt+6joA6/HI1rQdnuLS
	 Xsq37ui/dLYjtDiwdQ6YztWllWSE65WRqY+sUzX3ApvlNo3IXCln0VnITPfsOMfvJ0
	 6EgSkMzN53ug3rZVJOOeegdMNzPcKLUC3TC/j7jK/ryWpJboPryyBsWu5smVBew8lb
	 nNHDFhHlGJNjk6zUMbUwoHZXIjI9VpCe30wchvJS+kPPtOYaFcpqV41oAh5k2ViPid
	 VrXybyYxCOWRA==
Date: Fri, 31 Oct 2025 16:27:11 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	macro@orcam.me.uk
Subject: Re: [PATCH v3] riscv: asm: use .insn for making custom instructions
Message-ID: <20251031202711.GC2486902@ax162>
References: <20251024171640.65232-1-ben.dooks@codethink.co.uk>
 <20251031031009.GA2891125@ax162>
 <20251031-980f37fdcb94d15b02945fce@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251031-980f37fdcb94d15b02945fce@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_132717_456800_72BE1A1C 
X-CRM114-Status: UNSURE (   8.76  )
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

On Fri, Oct 31, 2025 at 02:08:33PM -0500, Andrew Jones wrote:
> Or we can change the test in 'config AS_HAS_INSN' to use the hex encoded
> input. We'd completely stop using .insn for LLVM older than 19 and GNU
> binutils older than 2.38, but that's probably better than adding yet
> another config.

Yeah, that would obviously work too. I was not sure how tolerable it was
to lose the use of .insn altogether for those versions hence the split
suggestion but if it is not that big of a deal, might as well check for
the extended .insn upfront.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
