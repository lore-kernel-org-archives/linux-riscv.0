Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E8ECA9ED0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 04:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/M+ahLXm0IWPrVjd7DwSFbrjE5kC0Ldtx9/YiK1xDc=; b=CgShxzWxOmjUFm
	jLIkrw1piczZ70NqefcbWXNDoR5DcfPPY0+/J5ObnZOfpBmBxPBjIdMIBKHH5cw+K1dxZ/RWCAs1Y
	C2IsMD5zVDs9bwsY/twfFzYU6+ZPjIKBTARD/H4yZ1CohS36bqbSHfGclVM1jYOn6AkS9+IFtNZlx
	BkrF3Qnr6DmJ8lIVRpABwTV6Jtv6t2AcvVjriliqPR11AF0KADePqbsaxHOW5wsZ+EpOlwrXxhVah
	2wLE9P0EG1cJrVuSYLn75/g4Y50iAD+MlG5Tp7YJJdtE3EEqy+Si/rCXrxrVFxSlEjf6lAeS6ATQR
	JTV6DrCYPj+OBb59RM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGU2r-0000000BxhO-1w4H;
	Tue, 13 Oct 2026 04:23:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGU2o-0000000BxgT-3lW9
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 04:23:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20rRa302932
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 04:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tIWfgspxx4yLynby3ZQs1PnM
	reRTHqVlMg0z9Olk6BY=; b=YHpQvQCPqfZF1nBZx8vPKI+1i3dzN09Aillf0/C2
	aXW/AkCeJBshshO3wyeKJZx/WnpZNxOP88LUoGfPopp0/1IDO/NaKADVq6HC3msQ
	m0b/T3DpxLTE83HIloKjnaUgj16ORMSyT/P6omuoqnbv/14nUGtCbtCsrB4VIISE
	yLmerKoUcLvsnSEDlmoehOB6+xIdQecm7VkRQYSWP3nUyVVUVZOPDpr/5DyVem5C
	4HycyzpFEvjOWLwlzl4HHifH7WUl/SRQrXHIkUgsCdBwwp06csA0eqpyi31xD6WL
	Bj1FVDMIqdCgZnju841EMUSxRsO9yUUdouAKumM4Umesqg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq8xk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 04:23:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5199785eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 21:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791865391; x=1792470191; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIWfgspxx4yLynby3ZQs1PnMreRTHqVlMg0z9Olk6BY=;
        b=Pqw2wG7N8w1vNg3SHWrm3ZCvLoHYSNT73cvT8Id9O3v9kwn2H5MyKgOskzO7QcglZF
         ZGP+LZgC9KmtQjxhcHh63lGrqqqMfJdEOwSxYIiqdRoGzPhTvkeuamlXRY/sGfCP3D/V
         A7/BcwmRL4jsiJ6BFz+U/voncJaYFddqCCx7n8ErydpIBfkYb8aTMpCJiQl5ektMt1ss
         fIyaYs8LjyVxm+GQQS2SKlvqQfhaOR6IAJ0a+bu53rJiVRBsP5G9YTtQDj2NvJ9nzHNL
         w8th5gBURcqUCEs3T8MW7WdU7zYZPObSVb028v3apjpHaocoFupdgxpSBdoySkJIgKBB
         lEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865391; x=1792470191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIWfgspxx4yLynby3ZQs1PnMreRTHqVlMg0z9Olk6BY=;
        b=cgQKlpPJE77OM75Fpf6q+dEoovWT44O51bZupQ2afgvYYILccLt+p43ATbP4tsDPMx
         +jEFbU8KKWUsKqxuk3eV26K8giSfX84yliozacqyB3uq7y0+F9a2twF6rtgIV23fPgG3
         9U2Ssrh2wbi3+VcqNrUV1vu7XA2S/8Tjx6jPyycY5VRcoEuJlVLx+/o+kH9XJAm7r2vg
         H+E5aA8JGd8rXDLH4fWvZXPTeZpbCSkKaMYAC1g6W1BtybGFzv5M/5xCDN/cScC4qQ7E
         +m96i/IR27kmU/qL7SiNbnztxboFcm+RvjCZmgVAUzHGUmLwtJyujIjUXCWaOlcxV2p0
         H4rw==
X-Forwarded-Encrypted: i=1; AKwUvBxKjb5nI7LcIZbCHKpKGZOS2Il75TCCvWmoN3LLSQLJRTNMYQvF7clXrGBhJwaIYGZLA9gzMPd69FmvgA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLk2MbpatYiv6T9Il3ga0oD9bhKxxBNLWTvazX/FJnhIV/1q85L
	j/iibb7rjxSHBIZfbydcq62yrmDmIgzI+5m7A1ntoHPZOdIPbBjn1Bz+qRc42OKXfIhcS5kuJMj
	OxL64DcR+wpUjrHfUNPOl2al2EJ6+PLomDAh2zY2TV7zlOerBk3hQqQWMQJ4Gj1mmiASOGgM=
X-Gm-Gg: AYBFou0Cqz+qASAVUuthUvEN0wqII6auZRaqfcFlLRWXojZ7xFRLO8tnFQwa/Irg+Yw
	8QOxqZ5LmAbj/WCKjMe60vAZSKtTAvghTFd7qJa9e493ZDxdPR9UV+MKia7H4h307jB/oc0Llol
	u4Xjochluk8ti7uCQu4S+VHgn0CC6J+uDj+gV4frEvfg+RnYfwzQPnSK7pKZgf9/OonEYXTNkj+
	3S8PQ0CdHuIGRGmxBSxRqn2vyvgZMPyRSfBYj3J+6R/wfgKqSArwU8AfYh3tkbczT0Ojs6arCb5
	Bd87NZsFoBJRD41Jvmnss+heMSXDV65d+eTphBhtDChPqIOs2wY6agqqhWBCu6kcP6lvMMbfj9F
	T1CpFYU6ActqfWPlfe+2oIdTasSXhaPTRM12d+MD1UE5HiV9rd7oTH3iIkciyrVwkqsiP0Lrn2j
	WQHFnbjbcN9AiFhOgG2l8z6WA=
X-Received: by 2002:a05:7301:a27:b0:35b:e6a7:f925 with SMTP id 5a478bee46e88-35be6a7fd77mr2695272eec.11.1791865390834;
        Mon, 12 Oct 2026 21:23:10 -0700 (PDT)
X-Received: by 2002:a05:7301:a27:b0:35b:e6a7:f925 with SMTP id 5a478bee46e88-35be6a7fd77mr2695237eec.11.1791865390214;
        Mon, 12 Oct 2026 21:23:10 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm1999530eec.23.2026.10.12.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:23:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:52:57 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>,
        =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
        Yuanzhu <yuanzhu@bytedance.com>,
        Yicong Yang <yang.yicong@picoheart.com>,
        Susheng Yang <yang.susheng@zte.com.cn>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 RESEND 3/9] riscv: sse: mask events during shutdown
 and kexec
Message-ID: <as2yIcM4YJlbvMPu@hu-himchau-blr.qualcomm.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
 <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAxNyBTYWx0ZWRfX5/0gjtX51W2W
 amq1UXDHfrGrLd/WBBPOIhHk0oYgN/hW42utDihrq0sPAdN4eUt0JzZbvK0LzufMz94HLuiRgc9
 wh1yRt6NnWEO1YXyM1E/b22LMzsRWPAl/6ORkA5N484MN6N6Jau1Rqig4EA2OOoVXgUg06dg8oo
 iJ5z5qnE7qZZTJd5UZ0QCUmZ2cxOvyii3ErlisrUCvu4gShKyvXB/Q2q4mHxf33ml+CpORyXIHo
 +OiB2+wLjaWmASkswp/7QQUDhJCHPw0OisPA/Z4QQf/zBX9+mrxbwEx918ULb2Y2EBRBqN2XeDW
 g9A/OCUhbNyaSOiqByndrU1+zSd3KlXRsaFvUZsMhlkSQcA8kNQggE3xR+KREMyeu1hAI/G6M6p
 z6XPKFDofliQmsDsOxQ0P2jnQn7/06n4cYksjTtSGzcZRet8NJvslI3D/wAs5veH1R3FhV2E7t3
 EhOkGmyz7okLyXB92cg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdb234 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=a_nq2awA8k5mFBtTUooA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAxNyBTYWx0ZWRfX+VLYEAKm71VS
 8EFZ5YpqiCd7vKkaKZliOCOYAemBfngKIJxni70j7my5hhaOboDv4yGWWY5Pf1wpvhR7BPJX4ZV
 gT2Ou8WYmr0fE8Cv5WvDes0VBMhBDrw=
X-Proofpoint-ORIG-GUID: -eWhAyzvnkb9mEAIXfYtmQEboaZOjN2i
X-Proofpoint-GUID: -eWhAyzvnkb9mEAIXfYtmQEboaZOjN2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_212319_060075_84A9BB6F 
X-CRM114-Status: GOOD (  29.82  )
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

On Mon, Sep 21, 2026 at 07:15:00PM +0800, Zhanpeng Zhang wrote:
> SSE delivery is independent of normal S-mode interrupts. Firmware may also
> retain an event registration until Linux explicitly unregisters it. A hart
> must therefore stop accepting SSE events before Linux stops servicing the
> registered handler.
> 
> Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
> and crash shutdown paths. This prevents firmware from entering Linux-owned
> handler state after the corresponding CPU or kernel context is no longer
> valid.
> 
> A crash kernel cannot identify or take ownership of registrations
> inherited from the crashed kernel. Reject a later normal kexec while such
> SSE state may still exist, rather than transferring unknown firmware state
> to another kernel.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>  arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>  arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index 738df176ff6f..24e7affae70b 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -14,10 +14,13 @@
>  #include <asm/set_memory.h>	/* For set_memory_x() */
>  #include <linux/compiler.h>	/* For unreachable() */
>  #include <linux/cpu.h>		/* For cpu_down() */
> +#include <linux/crash_dump.h>
>  #include <linux/reboot.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  
> +#include <asm/sse.h>
> +
>  /*
>   * machine_kexec_prepare - Initialize kexec
>   *
> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>  	unsigned int control_code_buffer_sz = 0;
>  	int i = 0;
>  
> +	/* A crash kernel cannot tear down registrations inherited from firmware. */
> +	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
> +	    riscv_sse_available()) {
> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Find the Flattened Device Tree and save its physical address */
>  	for (i = 0; i < image->nr_segments; i++) {
>  		if (image->segment[i].memsz <= sizeof(fdt))
> @@ -127,6 +137,7 @@ void
>  machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> +	riscv_sse_mask_current_hart();
>  
>  	/* shutdown non-crashing cpus */
>  	crash_smp_send_stop();
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 14eb08a6db85..fdab37e7ae52 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -6,6 +6,20 @@
>  #include <linux/efi.h>
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
> +#include <linux/smp.h>
> +
> +#include <asm/sse.h>
> +
> +#ifndef CONFIG_SMP
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +#endif
>  
>  static void __noreturn default_power_off(void)
>  {
> @@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void machine_restart(char *cmd)
>  {
> +	riscv_sse_mask_current_hart();
> +
>  	/*
>  	 * UpdateCapsule() depends on the system being reset via ResetSystem().
>  	 */
> @@ -30,12 +46,14 @@ void machine_restart(char *cmd)
>  
>  void machine_halt(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
>  
>  void machine_power_off(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index fa66f9c97d74..7f0d4e7332f1 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -23,10 +23,13 @@
>  #include <linux/irq.h>
>  #include <linux/irq_work.h>
>  #include <linux/nmi.h>
> +#include <linux/panic.h>
>  
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpu_ops.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
>  
>  enum ipi_message_type {
>  	IPI_RESCHEDULE,
> @@ -79,8 +82,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
>  	return -ENOENT;
>  }
>  
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +
>  static void ipi_stop(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	set_cpu_online(smp_processor_id(), false);
>  	while (1)
>  		wait_for_interrupt();
> @@ -91,6 +104,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
>  
>  static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>  {
> +	riscv_sse_mask_current_hart();
>  	crash_save_cpu(regs, cpu);
>  
>  	atomic_dec(&waiting_for_crash_ipi);
> @@ -254,6 +268,8 @@ void smp_send_stop(void)
>  {
>  	unsigned long timeout;
>  
> +	riscv_sse_mask_current_hart();
> +
>  	if (num_online_cpus() > 1) {
>  		cpumask_t mask;
>  
> @@ -301,6 +317,7 @@ void crash_smp_send_stop(void)
>  		return;
>  
>  	cpus_stopped = 1;
> +	riscv_sse_mask_current_hart();
>  
>  	/*
>  	 * If this cpu is the only one alive at this point in time, online or

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

> -- 
> 2.50.1 (Apple Git-155)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
