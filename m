Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D61C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 06:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMabcXyI/QULKnP7rguNRKHUbOw2aqxLL/JO4ua7Dpg=; b=XeCpb8MEtgQ8cP
	E/z4BJFs7TLMeUdGP/wu6wWYHqFFCM04Q9lx0uSEP2TopTFCz3RyS5zA7LAjlYqNqqY2XkCOHcRbF
	KBAgSRXIMtWJxBxWZr6pmyEkAdoVDdsgfZXD8fcQfs0lq5P/4H8j0kSQ8KCuCbj6arfsSvxV4KFww
	t14xg+ez5xixpENqvWOor5FNF/WOckQ4b7fxfjiDVV68mvwj6MUcY+q5ZnqTQpbYkKCuFBT8A8rx7
	GaVLKEiR5W6NV+oE3I51wnh/VEYO/warR4DzchO8AO7GJfnzRBT3wCjElJqunGm3pbtvcj/rQ3fzs
	T1Wy90FGgby+9rNYgCww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrw9-000000055Qu-030Z;
	Thu, 06 Aug 2026 06:50:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrw6-000000055QS-2Dof;
	Thu, 06 Aug 2026 06:50:39 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785999034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a3YEdpBzGJfCE9OG01zLjkQZVUUGB2Ok8wj7FV80Wpo=;
	b=IeOlfN+uUd41IzpnVVeFTGiSNJzEZiJDadZyDldZWHnQFj0Cjb+64np/UNsudJCXnfbDiU
	3Z1WAvs1jg8VgQQa5eZUNlDk/UrcL/KON9Zss9ZrBCkqEybinXlDr1rSneL8Y+hsrFwrZ/
	Zsk3Fe/WYyX8L/1k/uMPl67wN8yXysW5bIVpHQkfkpEjudbIBtBlJZ/QvnfiPMqTbgidzf
	4T7wHiyTZOK/ZZbdYXdrIUoAv3nfiNcI0+4z9cNwmSygyu869QOuXC8X29m6+82u2iYjj7
	9Kj0ksoNGpm2B2hsbY9lxuzvCbqzud31ryL3OuxD+UpTVCvvw29cGEfMuAPZ6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785999034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a3YEdpBzGJfCE9OG01zLjkQZVUUGB2Ok8wj7FV80Wpo=;
	b=JtCtLWZWHSsSUdkjhlr/qrdsxP8mDAZVs7eb0+pCe/dXM8MCf6cXP0BCZtYYzfUFx7e1LM
	czhWMq2Lo1n2JVCw==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Radim =?utf-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>,
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH v3 02/17] riscv: alternatives: Use generated instruction
 headers for patching code
In-Reply-To: <20260707-riscv_insn_table-v3-2-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-2-3f8e5f75ba97@gmail.com>
Date: Thu, 06 Aug 2026 08:50:32 +0200
Message-ID: <87qzkbd9on.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_235038_711843_0A75AE91 
X-CRM114-Status: GOOD (  10.15  )
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> @@ -78,14 +79,24 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
>  					     u32 jalr_insn, int patch_offset)
>  {
>  	u32 call[2] = { auipc_insn, jalr_insn };
> +	u32 auipc_imm;
>  	s32 imm;
>  
>  	/* get and adjust new target address */
> -	imm = riscv_insn_extract_utype_itype_imm(auipc_insn, jalr_insn);
> +	imm = riscv_insn_auipc_extract_imm(auipc_insn) + riscv_insn_jalr_extract_imm(jalr_insn);
>  	imm -= patch_offset;
>  
> +	/*
> +	 * When the 32-bit immediate is split across auipc and jalr, the
> +	 * constructed immediates need to be treated as individually sign
> +	 * extended numbers. Add the sign bit of the lower 12 bits to the upper
> +	 * 20 bits to undo the bleeding of the sign.
> +	 */
> +	auipc_imm = (imm & BIT(11)) << 1;
> +
>  	/* update instructions */
> -	riscv_insn_insert_utype_itype_imm(&call[0], &call[1], imm);
> +	riscv_insn_auipc_insert_imm(&call[0], auipc_imm);
> +	riscv_insn_jalr_insert_imm(&call[1], imm);

Looking at the old riscv_insn_insert_utype_itype_imm(), for auipc we have

	*utype_insn &= ~(RV_U_IMM_31_12_MASK);
	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);

but the new code does

	auipc_imm = (imm & BIT(11)) << 1;
	*_insn &= ~GENMASK(31, 12);
	*_insn |= (((auipc_imm >> 12) & GENMASK(19, 0)) << 12);

which is not equivalent. The new code is missing (imm & RV_U_IMM_31_12_MASK)
from the old code.

Or am I confused somewhere?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
