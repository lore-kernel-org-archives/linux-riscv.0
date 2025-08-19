Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE040CA0EF7
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 20:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acUDf+bEVBtHTzWJcFvEL2gEENcSk39lKxzVtNrG3sA=; b=SwrDdt/ezoCRV+
	LaAMfvwubI0PHFkoESpRBjpSpEiaA2knvLl2tVvdqtro2sGGH194SmyboaH7VdlIZ1kGloccGqtNI
	GOpTuRvOS0rb2uDBSfmXXmrnN5cIJApTdpfAOU8uScfxecDbXmqd1pl7g3VENjNuY52MfXFKBaKoS
	68nmLs0Nw8RXvN2gdQdmu3exSDmTyRwjJCKtkPs8FNe0yNYME/ilh5qbkoGwqFKtYp9sVHma/aVmk
	F0ohStm9HkVeiI5WUr+QP0GT01DwpNL8DFfusN32r3R5SbQe5gFyCZhGip72ZwuPXwDu5pdwauMNb
	9WtDRBlArLKiF7UNfwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAM-0000000BYo5-46qY;
	Tue, 19 Aug 2025 20:42:46 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQze-0000000BHaH-0d4a
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 18:23:35 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-88432e31bdbso397902739f.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 11:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755627813; x=1756232613; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RMib1RNsLOZzveOKUcNUc71UDB3u2hrf5eBAgYUIDP8=;
        b=KvL1B8rPqPLylCgeG4NCg+pQBjUkLDwkp4nCyXpfqrwMfD4ewKWaEyG266lQ8lL5GY
         UX3jLv3r0tcCB6zn1XjX5G2AncjJsWSE1M2C1oqpxOs8yieDPhZoGivMMxEfzePeAzAV
         ff2r5JWVlmMg4UQ5BHBK7M/QKFyNQ/I8+8oU+oQLhNpmkXdxvwDtiDf8BxAJSmgGZATY
         p5Prouwe8SRtX/Fig6jXi21++G5IaeHTS1W4OLN2Re75rNSF3ptRIOK4XzqsI19+vfTP
         eZC5634IYDCaOlB89VqaA/eHgSndTwWfGM1zrTjQntBlaiqft0S2780IuHAeaJH6l+UV
         sKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755627813; x=1756232613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMib1RNsLOZzveOKUcNUc71UDB3u2hrf5eBAgYUIDP8=;
        b=iMmFTG27jeyCKEEejnFo9BE3SrRLj1ocFFYJfCStxNXV/G+rjv6QvwFcbWcF8d7l2M
         UQX7v4rJORnT0a714/merxmbquYH4bavOHd0fVD+KAflT9XJ1ClclezxM775rEVZZ4OW
         cRXxOkjZErqXhJ+JWTD4cXjz7gCmuzhuCWld5BZrHoQnyPgOv4Sa7KPGbAq4N4Y4hRV1
         WmBC5ccL/oo1ELZ5s5FnOSBgjiFIqeCI5m25cjiiSUgFQIjTOrXCrN5qlGYvcQXsyZ+c
         j0I/ir63+Fy/MClw/uhqxDVTs1z4RoXn3nw5tGKnva67V9TfHxjnVoctrCA0FoxVv7u6
         BEsw==
X-Gm-Message-State: AOJu0Yw+Mat7W23odJH3IC0NacEWR12GpLdAZtCJK5G2uqeyqxRjDakp
	uIbZkoGff5nsIIBcOh9qJMtFe6RAbF+3C3LlFw585hboaU23B3qlN1yGo0NGvOC0Ons=
X-Gm-Gg: ASbGnctktIEerem9GBiWI8C4z2y/DKPsARV/OnQkdaG0UW7VmfezHV3oHZZh3MsbGm4
	wWghxxJM+nNCJg03fcKVaEFjkhoU5adcgQn41C0m/o3qGNN4iV2Rqk+gdkK0MjEPGgOyYd54j36
	vO6BbnGwm+CwsynHN/vKwOHe9ThgklpMIyYpHneK+RGQUHxhkv10X1zxPmwJlerJziKii1IYVQi
	ERheZ5c8YrbaGqW3obIhFeoWOav4kpm0MOy0uyJi6Fp9EnOn0u/WUYdqm77UXV0sJXM7jZ25u5H
	zziF8u9yxKnl2tAIBwiclemFf0BQsobFwjPkc7jZYDezWKSqYCYaO9/j6kIqdHo1MQnVcBO8dqN
	dUy90m5tYuSsdJHNdlsQ8sddt
X-Google-Smtp-Source: AGHT+IGezg0FiA6Wv0CaeekJKLOj10bdJNcyHpwqlIH+/ZsWLwUEs9/JQbQ8Pzd+oEx+vnLPaxgYtw==
X-Received: by 2002:a05:6602:15ca:b0:873:47c7:6ff3 with SMTP id ca18e2360f4ac-884718e300bmr58966739f.7.1755627813157;
        Tue, 19 Aug 2025 11:23:33 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8843f7f9854sm411794739f.7.2025.08.19.11.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:23:32 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:23:32 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jimmy Ho <jimmy.ho@sifive.com>
Cc: linux-riscv@lists.infradead.org, troy.mitchell@linux.spacemit.com, 
	ziyao@disroot.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, cyrilbur@tenstorrent.com, cleger@rivosinc.com, 
	charlie@rivosinc.com, kees@kernel.org, ben.dooks@codethink.co.uk, jszhang@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: fix using wrong load type
Message-ID: <20250819-cf406b3d02087824245b5576@orel>
References: <20250819071318.21103-1-jimmy.ho@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819071318.21103-1-jimmy.ho@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_112334_192142_B0B545E1 
X-CRM114-Status: GOOD (  19.16  )
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

On Tue, Aug 19, 2025 at 03:13:18PM +0800, Jimmy Ho wrote:
> thread_info.cpu field is 32 bits wide,
> but is accessed using an XLEN-bit load, which might be 64bit load, fix it
> 
> Changes in v3:
> - replace space with tab to keep it aligned with code block
> - Add "Fixes" tag
> 
> Changes in v2:
> - add a comment to explain why use lw instead of REG_L.
> - correct commit message

The changelog belongs below the --- in the patch.

> 
> Fixes: 503638e0babf3 ("riscv: Stop emitting preventive sfence.vma for new vmalloc mappings")
> Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
> ---
>  arch/riscv/kernel/entry.S | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 3a0ec6fd5956..492ae936dccd 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -45,8 +45,10 @@
>  	 * Computes:
>  	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
>  	 * a1 = BIT_MASK(cpu)
> +	 * 
> +	 * using lw instead of REG_L is because the thread_info.cpu field is 32 bits wide
>  	 */
> -	REG_L 	a2, TASK_TI_CPU(tp)
> +	lw	a2, TASK_TI_CPU(tp)
>  	/*
>  	 * Compute the new_vmalloc element position:
>  	 * (cpu / 64) * 8 = (cpu >> 6) << 3
> -- 
> 2.39.3

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
