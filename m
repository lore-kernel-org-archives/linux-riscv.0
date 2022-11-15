Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23176C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8elX0MU/Ux2e8Bmaogic0F8U3aIlLhkbN1f6MtUWxk=; b=Zn0qJARefRjdbH
	+4zAJnrRnAYW0zzugPMsrG4tNW61msnC/NYB+7WcnK2xdHaBkd1CePtKl1AbTbfFDBW81OxTAj2Jb
	/goaW5QlzVqtytfNyQCicYR9tkdTksa7FOatMSf8DhQ7OU53V0OwXSeb8ZjATZze4Z8ZSjisbBUBc
	bfFfM5kRBraT3hu6rGunranls6+Z967rpEcg2PqGE4kYE4TonoQzCvkp8XcVMl01S035RYO+ll8AY
	wpA9YOWn7o+jTMyDSE3VrhKxvzdC3eTyM/qu7Mbc/Uk8v+ubaMcQAqge1Mwdq+B82um3s9mkMDhPx
	MTOoNswevEgeR82rNK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oux5t-00BxHa-86; Tue, 15 Nov 2022 14:39:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oux5K-00Bwns-Jd
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 14:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668523127; x=1700059127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5v0DP53feCYo7PgTo+QK93dELwfjr9wlhPwVR8nosZo=;
  b=rp/M2QQRCGxzg6yHphn2oYSBvqKpIlB0+By7CZPhv2BaNDS3PGRibhD2
   gZ5tKw+0Uy89jR6TIGUC+cvL0uMt70E2hyIwWwggoyGoJLZvMUwdRduEG
   T+5r6NTABI8XbY9WpR6vgciFzW7yIAHKKJY1khGTPq1IbTkAWmFVXDSjt
   U0SccAo6UNhKDhawtQ8Kk06dyLf8VHL8dfo3TWFq9Ix5TLsF0/TI+TkKv
   fWg2Uhs8gnCABcm+MUDK4yqjDWxvoHpGKQhsMrywtvq1/kbS1dXpAfm1a
   3amJkWQrBoCn5S1Q0cjGzP4bW1kXK64Qg5rqU8iJ0yoRr6bpsqUsk3mXK
   g==;
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="189059446"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Nov 2022 07:38:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 15 Nov 2022 07:38:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 15 Nov 2022 07:38:44 -0700
Date: Tue, 15 Nov 2022 14:38:27 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Deepak Gupta <debug@rivosinc.com>
CC: <aou@eecs.berkeley.edu>, <jan.kiszka@siemens.com>, <kbingham@kernel.org>,
	<linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3] scripts/gdb: add lx_current support for riscv
Message-ID: <Y3OkY6myfea00BaK@wendy>
References: <20221115012917.1781185-1-debug@rivosinc.com>
 <20221115084923.1822572-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115084923.1822572-1-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_063846_680740_7A948B71 
X-CRM114-Status: GOOD (  25.93  )
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

Hey Deepak,

On Tue, Nov 15, 2022 at 12:49:23AM -0800, Deepak Gupta wrote:
> csr_sscratch CSR holds current task_struct address when hart is in
> user space. Trap handler on entry spills csr_sscratch into "tp" (x2)
> register and zeroes out csr_sscratch CSR. Trap handler on exit reloads
> "tp" with expected user mode value and place current task_struct address
> again in csr_scratch CSR.
> 
> This patch assumes "tp" is pointing to task_struct. If value in
> csr_scratch is numerically greater than "tp" then it assumes csr_scratch

nit: s/scratch/sscratch/ ?

> is correct address of current task_struct. This logic holds when
>    - hart is in user space, "tp" will be less than csr_scratch.
>    - hart is in kernel space but not in trap handler, "tp" will be more
>      than csr_scratch (csr_scratch being equal to 0).
>    - hart is executing trap handler
>        - "tp" is still pointing to user mode but csr_scratch contains
>           ptr to task_struct. Thus numerically higher.
>        - "tp" is  pointing to task_struct but csr_scratch now contains
>           either 0 or numerically smaller value (transiently holds
>           user mode tp)
> 
> Patch also adds new cached type "ulong" in scripts/gdb/linux/utils.py
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>

I noticed when looking into patchwork complaining about checkpatch
errors in v2, that b4 had actually downloaded v3 but I could not see
this patch on the RISC-V list. I don't see a changelog anywhere here
from v2 either, nor did you pick up Drew's Reviewed-by.

What's the story there?

One really minor thing below. Should be able to fix it up trivially up
& submit a v4, CCing the linux-riscv list.

> ---
>  scripts/gdb/linux/cpus.py  | 15 +++++++++++++++
>  scripts/gdb/linux/utils.py |  5 +++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 15fc4626d236..ca5215a660c7 100644
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
> +         if (scratch_reg.cast(utils.get_ulong_type()) >  current_tp.cast(utils.get_ulong_type())):
                                                          ^^
extra space here?


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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
