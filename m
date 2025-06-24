Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0603FC7EE30
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xagTTOZMml+R7didWFTgZUM+ytKuKiqN8nnkhkY+oY4=; b=RomjD0Pih+dNXq
	k6zDtNTLBFURlJkpBGsO1ZAmrsMiTJJ6uzSB9IFRzlgzXboP1fRRZbLKhwElTt0A8kbocTeVCtmrc
	o4mKs1tuG4yaVQ0H0Kpjvw1c751gKHSmimW0XdTy4y6cbYkK1MZ9FDBLY8EO0b0GdcB7+24zVzoCz
	ZY1r1AZgTR39zcm4sVLZ619hFWAeSXBAgOHHwHA0igKmJge878z+TNE64HsNnO6mlMA5ulZEf9Btl
	gkEyLFpytOq23XgOj4o9g3fkkR4SCC/8BR5lN9xm3TgaLkHT/jLWwcrF/WFwAMx2x9jMa4yuDTKya
	N9twb041aDWtyfKbGwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64T-00000006D7o-1yv5;
	Tue, 24 Jun 2025 16:00:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Lg-00000005qFm-2yEl
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:10:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45363645a8eso4402865e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750774207; x=1751379007; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQ7CvyZIlkZs87gjY0NM1qz59baVwPwR/W8k37uo164=;
        b=gM2pdsdhagcp/QNjInHERc0podCBCawoWJq533YKIQMFL/WGoVkxKeaDLvokRKBIrt
         Ym1iqGRWWX4CiYwW1K9/OAS/KYjcpc+Je9qieqZfPvDoN1iWwCDRYEKoTiKG6C2cOEmx
         Opc1RYxT1L8nZp3hPGiTqFtX4LnpkYF+qMrWrC879wc4nPRyZhIAoKXG149NuFNK2mMP
         l0HgnzYsfn1edPb9gowG7V7Tm5Uy4TKnwHWAF1XG/lS+GfpyTfTsbYv01LbVm+mafUpb
         PBJIOVxuJiw9H/WRoH6B/EhYaxIKFl8EH6GCjhngwZ8fE2f9QMuzZGv3trUWDjTqNzw+
         Lrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774207; x=1751379007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ7CvyZIlkZs87gjY0NM1qz59baVwPwR/W8k37uo164=;
        b=Sdr3LpNMU6KFDem1tGNE19DpH54mqlFjZ2PZKeMEdhMIBvcBlyE/95sv9vuIloZm18
         IVyyrI3MmRFG5JzPeABwgltkNGhqinrsYxzSQFdzIKMCWwr/JVtXpGLB+AhA2A0u9C7A
         sGwq9cwVlY4fBBnzQEkgfUEVEqHII/wR0U9uB/G3y0nwSMymR7aT+/3GhixwDezvJVmc
         SOgP/3HgShTQfvg5hKdJ66NtfTJ+47W4COusjSLXKv9ZR7Swq6eykV2j+K/VybIg3e9o
         0WMay2v57Ai4mygWTYxSRKLCvQ9dEd4E3sucYxbldtoXQonoWDOge5MmvknPAshcSZDs
         yaXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwidZaw4FIh5HnEAQV9QIUSt4IC+b2LIp1+0amyKeNGVgHUGVguf5QvNgfbhil9Rf9omXZ6I6UpyKQ6w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9SPbXo7rZ46jznmE9u75605jjHao7DCulI96+IOjCcJO3LEKT
	1+rhiMJZm4JwS655oXfTVUesa9M8+T3YBad+hboGzzxDB5eBTbjv4/tUDwsvPEIyKB4=
X-Gm-Gg: ASbGnct2lHT0HoxjTOJo9/D3Bt6cH4wmcTZD5B1h8TJNLtmBwPHEHNIlCzC6E/VVOSs
	TSu/8digc1k6+j0TQh9irbDk6qgaY3ZrCl5qTGgG2EKQ1m70biVzfHKbfIYVgf9U5Oq7+AHQdOP
	0gLaUSN+lrfjSxtS0myphPatHs/oebpQW/HqPR3WM5kNU1MtiwjuBi1dNVW/UoXWEeXH/Scx/Vm
	Ks8ATyuEeFM6qpnfo8yJGm67RjBnD+65IBsN9U9qhVgp38ZbAoCvD2rXMhea7Mjcwx3R3LgyWcB
	AUETlWCsPNiZ5f/daHo8QddEwOI79ASphnGbC0qdiOyz7N7ZZw==
X-Google-Smtp-Source: AGHT+IEJeX4diRkZ29kEnrmPsfhU9TcNr2AZ9X1Thlmc1YkCR6UEhFhLrNxHaOV0+h9u10fRDQFJlw==
X-Received: by 2002:a05:600c:3b24:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-453653cf416mr150568745e9.5.1750774206936;
        Tue, 24 Jun 2025 07:10:06 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e81106b8sm2090841f8f.91.2025.06.24.07.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:10:05 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:10:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Add common supported test
 cases
Message-ID: <20250624-d7b4b9ba702fcaf2f42695b1@orel>
References: <cover.1749810735.git.zhouquan@iscas.ac.cn>
 <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_071008_753077_1A114E91 
X-CRM114-Status: GOOD (  18.29  )
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

On Fri, Jun 13, 2025 at 07:30:13PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Some common KVM test cases are supported on riscv now as following:
> 
>     access_tracking_perf_test
>     demand_paging_test
>     dirty_log_perf_test
>     dirty_log_test
>     guest_print_test
>     kvm_binary_stats_test
>     kvm_create_max_vcpus
>     kvm_page_table_test
>     memslot_modification_stress_test
>     memslot_perf_test
>     rseq_test
>     set_memory_region_test

Half this list is already build for riscv since they're common. See
TEST_GEN_PROGS_COMMON. If the other half can be built and run then
please send a separate patch, not something tacked onto this series,
since they're all unrelated to the series.

> 
> Add missing headers for tests and fix RISCV_FENCE redefinition
> in `rseq-riscv.h` by using the existing macro from <asm/fence.h>.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/kvm/Makefile.kvm             | 12 ++++++++++++
>  .../testing/selftests/kvm/include/riscv/processor.h  |  2 ++
>  tools/testing/selftests/rseq/rseq-riscv.h            |  3 +--
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 38b95998e1e6..565e191e99c8 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -197,6 +197,18 @@ TEST_GEN_PROGS_riscv += arch_timer
>  TEST_GEN_PROGS_riscv += coalesced_io_test
>  TEST_GEN_PROGS_riscv += get-reg-list
>  TEST_GEN_PROGS_riscv += steal_time
> +TEST_GEN_PROGS_riscv += access_tracking_perf_test
> +TEST_GEN_PROGS_riscv += demand_paging_test
> +TEST_GEN_PROGS_riscv += dirty_log_perf_test
> +TEST_GEN_PROGS_riscv += dirty_log_test
> +TEST_GEN_PROGS_riscv += guest_print_test
> +TEST_GEN_PROGS_riscv += kvm_binary_stats_test
> +TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
> +TEST_GEN_PROGS_riscv += kvm_page_table_test
> +TEST_GEN_PROGS_riscv += memslot_modification_stress_test
> +TEST_GEN_PROGS_riscv += memslot_perf_test
> +TEST_GEN_PROGS_riscv += rseq_test
> +TEST_GEN_PROGS_riscv += set_memory_region_test
>  
>  TEST_GEN_PROGS_loongarch += coalesced_io_test
>  TEST_GEN_PROGS_loongarch += demand_paging_test
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 162f303d9daa..4cf5ae11760f 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -9,7 +9,9 @@
>  
>  #include <linux/stringify.h>
>  #include <asm/csr.h>
> +#include <asm/vdso/processor.h>
>  #include "kvm_util.h"
> +#include "ucall_common.h"

These should be included directly from the tests that need them.

>  
>  #define INSN_OPCODE_MASK	0x007c
>  #define INSN_OPCODE_SHIFT	2
> diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
> index 67d544aaa9a3..06c840e81c8b 100644
> --- a/tools/testing/selftests/rseq/rseq-riscv.h
> +++ b/tools/testing/selftests/rseq/rseq-riscv.h
> @@ -8,6 +8,7 @@
>   * exception when executed in all modes.
>   */
>  #include <endian.h>
> +#include <asm/fence.h>
>  
>  #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
>  #define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
> @@ -24,8 +25,6 @@
>  #define REG_L	__REG_SEL("ld ", "lw ")
>  #define REG_S	__REG_SEL("sd ", "sw ")
>  
> -#define RISCV_FENCE(p, s) \
> -	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
>  #define rseq_smp_mb()	RISCV_FENCE(rw, rw)
>  #define rseq_smp_rmb()	RISCV_FENCE(r, r)
>  #define rseq_smp_wmb()	RISCV_FENCE(w, w)
> -- 
> 2.34.1

tools/testing/selftests/rseq isn't under KVM's purview, so this should be
a separate patch CC'ing the appropriate people and lists.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
