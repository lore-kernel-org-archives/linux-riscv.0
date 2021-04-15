Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF0CC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 14:39:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706CF61139
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 14:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706CF61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=omddKTg5M+CsCDzPjtfrI5cvZVm1/dtplZKQypC1+Rc=; b=XjWU4Q9E3zWho84YTXEGtEzKL
	U3ncq1/znpvJRr1X4xo7xjWiEHQpknwkAxs9SWVtp70clVPoiKHXbx7J1ZYF0HnUQeOP9MoUQOCTS
	25z2MNxwur9KiTgspJ/eP16fDFICErtNOUKMuTiWj4Lx9xZ1mFN9QhR6qcjnQ/XT284cI1FjAGPy5
	3AcQWq/YfodI/uMxiQZgQCtKZGmz2+nGApWl3cHx11QSBEgqOq/NqIn7CO0kCJrqtuHfYEtYx059k
	Y5T4B8/Lz1LLNgE45a6InWlT95kb7zDMUiZBs7URK0t3XcdwI9NAdjug4VJTADxSdjUdrrPvuU45J
	sVtCyyZJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX39B-00GTIz-GW; Thu, 15 Apr 2021 14:39:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX396-00GTIS-Uo; Thu, 15 Apr 2021 14:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=47PdC+1x8pK3d2W77IhAOaJXzuG7NoVpwGQ66hUC/qA=; b=WAPjwV6CifSaNPiuOcump3BJ5A
 0EZN73buADJIIU29w1mZRhxR1uQ9p0k+rpfs8vs4K6Xv5D5THSeThbzdSr87R8ZVujL1/aP3iGOW1
 0EI4YtecM2EIxQ2IE66WOFMHEnyCI6YlW2T8+XzVeXp46leL/tUFmSSv3Hn7mNm5KRhmzeTdU3ylB
 wk2YzU9ef6IUJIlCAjyyooPnFo2LTxOuePF5KAQUsZEHlds0CEWp176Bs5PR8335cx1MNwTvcKaGT
 jydZU0yDCyYJtpyx02lNY6Sm7y0Ovm4IrOxjn5IutiMPU9MzsduJzF+OKdoarSx0t9+XddMi9RN9t
 F0EIqKgw==;
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX393-008eta-TI; Thu, 15 Apr 2021 14:39:03 +0000
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1lX37j-000708-Ga; Thu, 15 Apr 2021 16:37:39 +0200
Received: from [85.7.101.30] (helo=pc-6.home)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1lX37i-000EJ3-8n; Thu, 15 Apr 2021 16:37:38 +0200
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Jianlin Lv <Jianlin.Lv@arm.com>, bpf@vger.kernel.org
Cc: corbet@lwn.net, ast@kernel.org, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, davem@davemloft.net, kuba@kernel.org,
 illusionist.neo@gmail.com, linux@armlinux.org.uk, zlim.lnx@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, paulburton@kernel.org,
 tsbogend@alpha.franken.de, naveen.n.rao@linux.ibm.com,
 sandipan@linux.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, luke.r.nels@gmail.com, xi.wang@gmail.com,
 bjorn@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, iii@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, yoshfuji@linux-ipv6.org,
 dsahern@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, udknight@gmail.com,
 mchehab+huawei@kernel.org, dvyukov@google.com, maheshb@google.com,
 horms@verge.net.au, nicolas.dichtel@6wind.com, viro@zeniv.linux.org.uk,
 masahiroy@kernel.org, keescook@chromium.org, quentin@isovalent.com,
 tklauser@distanz.ch, grantseltzer@gmail.com, irogers@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, iecedge@gmail.com
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
Date: Thu, 15 Apr 2021 16:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.4/26141/Thu Apr 15 13:13:26 2021)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_073901_957868_C5D550FB 
X-CRM114-Status: GOOD (  25.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/15/21 11:32 AM, Jianlin Lv wrote:
> For debugging JITs, dumping the JITed image to kernel log is discouraged,
> "bpftool prog dump jited" is much better way to examine JITed dumps.
> This patch get rid of the code related to bpf_jit_enable=2 mode and
> update the proc handler of bpf_jit_enable, also added auxiliary
> information to explain how to use bpf_jit_disasm tool after this change.
> 
> Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
[...]
> diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
> index 0a7a2870f111..8d36b4658076 100644
> --- a/arch/x86/net/bpf_jit_comp32.c
> +++ b/arch/x86/net/bpf_jit_comp32.c
> @@ -2566,9 +2566,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>   		cond_resched();
>   	}
>   
> -	if (bpf_jit_enable > 1)
> -		bpf_jit_dump(prog->len, proglen, pass + 1, image);
> -
>   	if (image) {
>   		bpf_jit_binary_lock_ro(header);
>   		prog->bpf_func = (void *)image;
> diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
> index c8496c1142c9..990b1720c7a4 100644
> --- a/net/core/sysctl_net_core.c
> +++ b/net/core/sysctl_net_core.c
> @@ -273,16 +273,8 @@ static int proc_dointvec_minmax_bpf_enable(struct ctl_table *table, int write,
>   
>   	tmp.data = &jit_enable;
>   	ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
> -	if (write && !ret) {
> -		if (jit_enable < 2 ||
> -		    (jit_enable == 2 && bpf_dump_raw_ok(current_cred()))) {
> -			*(int *)table->data = jit_enable;
> -			if (jit_enable == 2)
> -				pr_warn("bpf_jit_enable = 2 was set! NEVER use this in production, only for JIT debugging!\n");
> -		} else {
> -			ret = -EPERM;
> -		}
> -	}
> +	if (write && !ret)
> +		*(int *)table->data = jit_enable;
>   	return ret;
>   }
>   
> @@ -389,7 +381,7 @@ static struct ctl_table net_core_table[] = {
>   		.extra2		= SYSCTL_ONE,
>   # else
>   		.extra1		= SYSCTL_ZERO,
> -		.extra2		= &two,
> +		.extra2		= SYSCTL_ONE,
>   # endif
>   	},
>   # ifdef CONFIG_HAVE_EBPF_JIT
> diff --git a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c
> index c8ae95804728..efa4b17ae016 100644
> --- a/tools/bpf/bpf_jit_disasm.c
> +++ b/tools/bpf/bpf_jit_disasm.c
> @@ -7,7 +7,7 @@
>    *
>    * To get the disassembly of the JIT code, do the following:
>    *
> - *  1) `echo 2 > /proc/sys/net/core/bpf_jit_enable`
> + *  1) Insert bpf_jit_dump() and recompile the kernel to output JITed image into log

Hmm, if we remove bpf_jit_dump(), the next drive-by cleanup patch will be thrown
at bpf@vger stating that bpf_jit_dump() has no in-tree users and should be removed.
Maybe we should be removing bpf_jit_disasm.c along with it as well as bpf_jit_dump()
itself ... I guess if it's ever needed in those rare occasions for JIT debugging we
can resurrect it from old kernels just locally. But yeah, bpftool's jit dump should
suffice for vast majority of use cases.

There was a recent set for ppc32 jit which was merged into ppc tree which will create
a merge conflict with this one [0]. So we would need a rebase and take it maybe during
merge win once the ppc32 landed..

   [0] https://lore.kernel.org/bpf/cover.1616430991.git.christophe.leroy@csgroup.eu/

>    *  2) Load a BPF filter (e.g. `tcpdump -p -n -s 0 -i eth1 host 192.168.20.0/24`)
>    *  3) Run e.g. `bpf_jit_disasm -o` to read out the last JIT code
>    *
> diff --git a/tools/bpf/bpftool/feature.c b/tools/bpf/bpftool/feature.c
> index 40a88df275f9..98c7eec2923f 100644
> --- a/tools/bpf/bpftool/feature.c
> +++ b/tools/bpf/bpftool/feature.c
> @@ -203,9 +203,6 @@ static void probe_jit_enable(void)
>   		case 1:
>   			printf("JIT compiler is enabled\n");
>   			break;
> -		case 2:
> -			printf("JIT compiler is enabled with debugging traces in kernel logs\n");
> -			break;

This would still need to be there for older kernels ...

>   		case -1:
>   			printf("Unable to retrieve JIT-compiler status\n");
>   			break;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
