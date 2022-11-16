Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A014EC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Lc+PZkG2hbG2CsLikSNZpXAF9UPM98/hyVfkYMf19I=; b=VczS82XcagQdYR
	9EBxwHS6PyY8LVkyMUXF9ssp1C6jtj+5j8Cr3jngZrsw3vDcGh8eZ9HMldgNL8ZLWiRbQIsKeT2wt
	uqg6o2dzIvSeFYuboMJ/VRvc3NFujad7s0cdPTKzX3BuiA+B83g7Z+UpEa523tlS95iMmyLZMi2TJ
	XqLNX7jVgDnt5PmieWSNdhsioQRDETJyKG+vrSFr8fL8GANyujjyXKhM1kqec+SUeO4j4rFS4k53E
	eM4PYozOw7yZdefFzkLR2HEj+6KHazAgYv/LE8zHcSISzdazBvosVl4jLPsKaQnkPcU8HWOovaCOT
	RPWjwEQr34cW4bqF484A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDbZ-0018rG-Kf; Wed, 16 Nov 2022 08:17:09 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDbW-0018l4-2C
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 08:17:07 +0000
Received: by mail-ej1-x629.google.com with SMTP id ud5so42249564ejc.4
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 00:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eVDWCbwUloYH7tkRZwkH26cFTCBcLJuC57YrsOYdkkM=;
        b=Dq3EtISqJ2KUEd/SkKnOpMPCeJB4xDLNCNdG+3wTBDNBAEuUG7gE4eYXB0cfgPFsdS
         AVvGsvJruSvy8b2uLwSAxW6hr3DhN1hgkAFvrYOfOSzU+R8kUz6mKEZgzPpZm1o6X0VD
         FoEhHanTwJ7BBBRrtrSWeY+PDK65Yj8KBErsRrU7TPwXOUlySYCSbeB02B4q8oPYR+qN
         QF5Yw4CEt9kdCfazp5np8D8Og87eVHnVqFjt9TUIUqMh2jH7gObGWwnOxeixMloGv3CL
         eHc5Ic1j1vysW6rQjSvoR3eYa3tVE9Aw05tIqRmIvNwmiOuW3ODVkuVDfAI5WFvdGXUN
         ndaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVDWCbwUloYH7tkRZwkH26cFTCBcLJuC57YrsOYdkkM=;
        b=PavjRxAKaecx1dDDThR0idqa9kb4N/CPC4SdZW8WN/JjGDdll88FmRZDdXhnQzSywb
         BNNPOe8AP0ge6mvbah+jEw+Fw4Anx3cTv9QVXcDuCHRNP7mkN2Obi23U0pm1ct+QvHu3
         Huzy59bPG9f/H2uBZUpRATqkZLZsaTAAJWwDB4LQA+R0nZWiKnF3AjUmA7hzCadrxxhT
         my/QuozHu+vpaxSrJB1EVfxRJNql0YDQ3lm00EtBf6JZ9Hk0isnVzQEMHqMU328MjxAZ
         HHgGc6j+/u5NFX3JxUlN7JPhra+HpkpxZrLC2Fy3zYb65zyN152B4qWrJQfTZQYz7xd8
         v1tQ==
X-Gm-Message-State: ANoB5pmX8NT3RpiguxP7IpIeOn7d1+PQhPcpG9s1x7QB0Tm72IhN/ZpN
	7mqJNgfGOWJMiozUYglZ450bpg==
X-Google-Smtp-Source: AA0mqf4ShcdTDjjMd2AhCS5aBhkJ6kWeWe6hMUt0/PkA7HWkOb6S/WaLjdraNSoI1HutrBLtl5NtcA==
X-Received: by 2002:a17:907:7854:b0:78b:5182:7ffa with SMTP id lb20-20020a170907785400b0078b51827ffamr16491710ejc.244.1668586610971;
        Wed, 16 Nov 2022 00:16:50 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o5-20020a056402038500b004619f024864sm7140898edv.81.2022.11.16.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 00:16:50 -0800 (PST)
Date: Wed, 16 Nov 2022 09:16:49 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: conor.dooley@microchip.com, aou@eecs.berkeley.edu,
	jan.kiszka@siemens.com, kbingham@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH v5] scripts/gdb: add lx_current support for riscv
Message-ID: <20221116081649.yq7cy7isxj3nmzr3@kamzik>
References: <d65bddf3-c58a-1420-bff9-8333c10edb56@microchip.com>
 <20221115221051.1871569-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115221051.1871569-1-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_001706_128769_0A97F48E 
X-CRM114-Status: GOOD (  29.44  )
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

On Tue, Nov 15, 2022 at 02:10:51PM -0800, Deepak Gupta wrote:
> csr_sscratch CSR holds current task_struct address when hart is in
> user space. Trap handler on entry spills csr_sscratch into "tp" (x2)
> register and zeroes out csr_sscratch CSR. Trap handler on exit reloads
> "tp" with expected user mode value and place current task_struct address
> again in csr_sscratch CSR.
> 
> This patch assumes "tp" is pointing to task_struct. If value in
> csr_sscratch is numerically greater than "tp" then it assumes csr_sscratch
> is correct address of current task_struct. This logic holds when
>    - hart is in user space, "tp" will be less than csr_sscratch.
>    - hart is in kernel space but not in trap handler, "tp" will be more
>      than csr_sscratch (csr_sscratch being equal to 0).
>    - hart is executing trap handler
>        - "tp" is still pointing to user mode but csr_sscratch contains
>           ptr to task_struct. Thus numerically higher.
>        - "tp" is  pointing to task_struct but csr_sscratch now contains
>           either 0 or numerically smaller value (transiently holds
>           user mode tp)
> 
> Patch also adds new cached type "ulong" in scripts/gdb/linux/utils.py
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> ---
> Since patch has changed a little bit from v1 and I didn't include
> changelog earlier, here it is.
> 
> v1 --> v2:
>  - added logic to locate task_struct irrespective of priv
>  - made locating task_struct agnostic to bitness(32 vs 64).
>  - added caching of ulong type in scripts/gdb/linux/utils.py
>  - added more descriptive commit message
> 
> v2 --> v3:
>  - amended commit message and source line to fit column width
> 
> v3 --> v4:
>  - amended commit message and remove whitespace in source
>  - added Reviewed-by for reviewers
> 
> v4 --> v5:
>  - changing the order of changelog and sign off/review tags in commit
> ---
> ---

Everything looks good, but you've got extra ---'s here. They don't hurt,
but if you're still ironing out your workflow you may want to keep in
mind that you don't need them. You only need one, which goes above the
changelog.

Thanks,
drew

>  scripts/gdb/linux/cpus.py  | 15 +++++++++++++++
>  scripts/gdb/linux/utils.py |  5 +++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 15fc4626d236..14c22f82449b 100644
> --- a/scripts/gdb/linux/cpus.py
> +++ b/scripts/gdb/linux/cpus.py
> @@ -173,6 +173,21 @@ def get_current_task(cpu):
>           else:
>               raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
>                                  "while running in userspace(EL0)")
> +    elif utils.is_target_arch("riscv"):
> +         current_tp = gdb.parse_and_eval("$tp")
> +         scratch_reg = gdb.parse_and_eval("$sscratch")
> +
> +         # by default tp points to current task
> +         current_task = current_tp.cast(task_ptr_type)
> +
> +         # scratch register is set 0 in trap handler after entering kernel.
> +         # When hart is in user mode, scratch register is pointing to task_struct.
> +         # and tp is used by user mode. So when scratch register holds larger value
> +         # (negative address as ulong is larger value) than tp, then use scratch register.
> +         if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
> +             current_task = scratch_reg.cast(task_ptr_type)
> +
> +         return current_task.dereference()
>      else:
>          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
>                             "supported with this arch")
> diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
> index 1553f68716cc..ddaf3089170d 100644
> --- a/scripts/gdb/linux/utils.py
> +++ b/scripts/gdb/linux/utils.py
> @@ -35,12 +35,17 @@ class CachedType:
>  
>  
>  long_type = CachedType("long")
> +ulong_type = CachedType("ulong")
>  atomic_long_type = CachedType("atomic_long_t")
>  
>  def get_long_type():
>      global long_type
>      return long_type.get_type()
>  
> +def get_ulong_type():
> +    global ulong_type
> +    return ulong_type.get_type()
> +
>  def offset_of(typeobj, field):
>      element = gdb.Value(0).cast(typeobj)
>      return int(str(element[field].address).split()[0], 16)
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
