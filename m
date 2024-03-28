Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2294BC54E64
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOr95gCHwkIvwn3PZ2xIWLGDbRcpUr/YJ+MP3mxMg8I=; b=ybYFXhNm972/G7
	x+Fnr8Zwb3Zft5gBWXL62q8D6LH5cI3hv0L7sAbsyaHJqkhv5PWKzmWbYp/HQeFoY8GP0qlpKcgQa
	Neq4pzLFCpsLqq2eqbYJC9/1JE/wUzy0U3JnkAaOCfh0xF5eaoFvOjH9edS5ahIc0wSP3OW81S1K/
	mV+a9erb8hAqFN7dH/oAkfxmtGD7MR7YAjhlPGWjAAB/ljM5H62ZkE36KRySgkpq+DwvOWR5IQh02
	HNq7/ABajwFajSWLL+5H5wQQ38xjhIKb72V+guYCT0KvDzYZwOr2woBwttGLlNTGz+P4PSmaYW5zx
	hdO9tzyuZ+iQ1IFe3qFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkFH-0000000CsxL-2nDu;
	Thu, 28 Mar 2024 07:32:19 +0000
Received: from mta-04.yadro.com ([89.207.88.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkFD-0000000Csum-3K3R
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 07:32:17 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 6909EC0011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-04; t=1711611128;
	bh=/Rj61iC0oZxd7dGL2v5n+B0zL+Y+qY+UXJbpEedJLvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=hDEvtKWYhFo2AWZSmlNj5ja6wWfNlL51jNz7DCGFhB3Oiw/EurUXBEHYRWVN9+qHv
	 bWJGsm83AaFCb3RfhTEWCnjmasm/ww1uzvBBdidW1Ydai2aFVn1R7kv+Pphu8eYhwi
	 uf+5qKVpPfidLk066sQs0BZZzPdHiPNGEXO7OlF9KJLaUfEjmHiYc2UdKktwB3rA5N
	 vDlXtUCmdkpLCe7tMC1RRP2hHFAEljeAnh+CUMG32smpNVev0KQDfsAYtjwOZjo3rE
	 Spb4VpiFdesRzUBal8lDiTyVE2V/2epU4C53dvwcBL3t4unrAeFN4PAw/Ka0TQk5ls
	 MSQiKqVpIL1sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-03; t=1711611128;
	bh=/Rj61iC0oZxd7dGL2v5n+B0zL+Y+qY+UXJbpEedJLvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=mmVn94K0zC4przTgvepIALBY9SaSP2N+597VCWMcZV3Hx4tATYRfgRuhQVIYF+rH0
	 yr28VMLTqPDu+6XKr6RZMqdcDRIwTAnUFQl4kfGCP6dtgOTxN3K/A9E0/YzNItcNEK
	 a8qx6P+qgRBHQbVGph/jnNCk4riPjmHv0CaWGHGGIdcyP4JUbd+IUwxb5ezqOycs0d
	 Pr8DWmhVdYcsBlHtJDoFoYnIdXmLpeRjxljrAHgttR961f2GK7sC4LwrsJGqOB0iCo
	 9PbENpAvKyS9AvKRg1VbsrFwRT892defzSJR+IqwwfQugf2GWU9FHXyXyXcSEl2nl6
	 dTbXlez4LiGtw==
Message-ID: <352f8101-01c3-45b9-9d53-ef0021cc6f46@syntacore.com>
Date: Thu, 28 Mar 2024 10:32:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Check that vdso does not contain any dynamic
 relocations
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Roman Artemev
	<roman.artemev@syntacore.com>, Guo Ren <guoren@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240326113831.283025-1-alexghiti@rivosinc.com>
Content-Language: en-US, ru-RU
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
In-Reply-To: <20240326113831.283025-1-alexghiti@rivosinc.com>
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_003216_041979_2FC49A85 
X-CRM114-Status: GOOD (  12.13  )
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

Hi Alexandre,

26.03.2024 14:38, Alexandre Ghiti wrote:
> 
> Like other architectures, use the common cmd_vdso_check to make sure of
> that.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 9b517fe1b8a8..dd4877f25928 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,7 +49,7 @@ $(obj)/vdso.o: $(obj)/vdso.so
> 
>  # link rule for the .so file, .lds has to be first
>  $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
> -       $(call if_changed,vdsold)
> +       $(call if_changed,vdsold_and_check)
>  LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
>         --build-id=sha1 --hash-style=both --eh-frame-hdr
> 
> @@ -69,7 +69,8 @@ include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>  # actual build commands
>  # The DSO images are built using a special linker script
>  # Make sure only to export the intended __vdso_xxx symbol offsets.
> -quiet_cmd_vdsold = VDSOLD  $@
> -      cmd_vdsold = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
> +quiet_cmd_vdsold_and_check = VDSOLD  $@
> +      cmd_vdsold_and_check = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
>                     $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
> -                   rm $@.tmp
> +                   rm $@.tmp && \
> +                   $(cmd_vdso_check)

For some reason I thought that this check is in the common vdso code and just missed hwprobe relocation...

Tested-by: Vladimir Isaev <vladimir.isaev@syntacore.com>

> --
> 2.39.2
> 

Thank you,
Vladimir Isaev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
