Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CEAFF887E
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 22:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eecqhbpeN23M9yT1+0scjdCYgR5oIwezRcYZTfwpbJ4=; b=UTmqRpNETA9vZq
	JqohG30+ndS+2c13NKj6XBKLdV9hxU//M685X9LkjTkfpSGOZ+j1wM0ocfygMqezAmDSiFCMMfnJk
	S9gwUXKNAI8ECyG1HiLaYPmdFADO0YNF9II9YLQU2FiAI/W4O3zi+sEv1UWZweY51Sp5tRO7n5c88
	EZnDgspxkxrp0l1fuOU9NcEefAkm7wyuCebnS8fBEtC3zowxHoJbqx2cGvp+x8SJPHigVo9Zcw5cX
	E+6pB7H6lnppZsET/s2kEeBpOPQWJSIomsTLIneu+pQHevp/H71jp6tMuMdcmXcyHtnEGymoK2K2T
	P6iKcuDxUEjleWOwbiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDYQ-00000004HY0-12XM;
	Wed, 29 Apr 2026 22:38:50 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDYN-00000004HXn-404I;
	Wed, 29 Apr 2026 22:38:48 +0000
Message-ID: <bae95436-6685-4fe7-b795-feba4192cb58@infradead.org>
Date: Wed, 29 Apr 2026 15:38:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: riscv: cmodx: fix typos
To: Avi Radinsky <avi.radinsky@tennr.com>, palmer@dabbelt.com,
 pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, corbet@lwn.net
Cc: linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
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



On 4/29/26 3:35 PM, Avi Radinsky wrote:
> Fix typos in the dynamic ftrace section: atmoic -> atomic (twice),
> pacthable -> patchable, derect -> directed.
> 
> Signed-off-by: Avi Radinsky <avi.radinsky@tennr.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/arch/riscv/cmodx.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
> index 40ba53bed..cbfa812a1 100644
> --- a/Documentation/arch/riscv/cmodx.rst
> +++ b/Documentation/arch/riscv/cmodx.rst
> @@ -21,13 +21,13 @@ call at each patchable function entry, and patches it dynamically at runtime to
>  enable or disable the redirection. In the case of RISC-V, 2 instructions,
>  AUIPC + JALR, are required to compose a function call. However, it is impossible
>  to patch 2 instructions and expect that a concurrent read-side executes them
> -without a race condition. This series makes atmoic code patching possible in
> +without a race condition. This series makes atomic code patching possible in
>  RISC-V ftrace. Kernel preemption makes things even worse as it allows the old
>  state to persist across the patching process with stop_machine().
>  
>  In order to get rid of stop_machine() and run dynamic ftrace with full kernel
>  preemption, we partially initialize each patchable function entry at boot-time,
> -setting the first instruction to AUIPC, and the second to NOP. Now, atmoic
> +setting the first instruction to AUIPC, and the second to NOP. Now, atomic
>  patching is possible because the kernel only has to update one instruction.
>  According to Ziccif, as long as an instruction is naturally aligned, the ISA
>  guarantee an  atomic update.
> @@ -36,8 +36,8 @@ By fixing down the first instruction, AUIPC, the range of the ftrace trampoline
>  is limited to +-2K from the predetermined target, ftrace_caller, due to the lack
>  of immediate encoding space in RISC-V. To address the issue, we introduce
>  CALL_OPS, where an 8B naturally align metadata is added in front of each
> -pacthable function. The metadata is resolved at the first trampoline, then the
> -execution can be derect to another custom trampoline.
> +patchable function. The metadata is resolved at the first trampoline, then the
> +execution can be directed to another custom trampoline.
>  
>  CMODX in the User Space
>  -----------------------

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
