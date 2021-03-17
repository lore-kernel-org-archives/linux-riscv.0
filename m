Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289A3C433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:21:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B74D764F9F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B74D764F9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ZoTH9wlDJvMu3jzybFHc7n2FmQhX17Hrthmk2c/pPh4=; b=EBkAeYKS8P8xkZDNiAiyB9BsL
	nLn7PKmjwuPOM95FMc0PTFeJaRsJTM7C833vHMztIkk2YlhRuWGxdJNHOcsgwcH+DHapoUyQNSR9+
	ZOny6+JIiioYizglCGck92DJwpDDtilkr2eTYzifRW93l5cu4es4jL2uZVFjp+/DqJAmpXLzpsqpn
	NEbeGnhzDBYJfkitdHo8Y38k0m0CE3L7yS6TGcEr0pJtvH8O19c+kwxWOSqovvg5UidB3TaLdkqZQ
	Kz/9Bl/a/o7IDwJJ/3IdTG/NXeI7gebt1OBSsktuB0icPzo9XS88sHiDWxZjFJRmU9Xkd/f/ehEaW
	rJGCwl8Mw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMNgJ-002RZ6-NI; Wed, 17 Mar 2021 04:21:15 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMNgE-002RXj-0x
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 04:21:11 +0000
Received: by mail-pf1-x42a.google.com with SMTP id 11so228005pfn.9
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 21:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tqygHtIF9C1t29D6guUTjM28SV0efTFg8Sgvi9tq11E=;
 b=J0Ymz3qqRL/XDEColeHiskhkUudo7yCDzTrMfSli/8EJ0MyWbKw0dmPrQV15VgoqrN
 z6cmsFBhCAZ1vpXc4gbFeIRLPpmOPNtDesOJwKVKM3JJrPseT+t7CX1mhofT01A/pSW5
 reO1Wd4CHcxUuPrs+fKjk2FvCWrA/Z3oFSdiIkbjAs9QbQ+AXppXNIFTibNw/oWe4ZVo
 7p/l/nfJEvu4yslpm6sj6CRpHfKaLkIZFQBqxcUzsKfOnw7X4gd/vJtaBHuyyvsfBiOB
 0VNSZuQtmJl+RMoQ49XacSpRl46sV46eGn4NFy37zXgBTLTR+q6oI9lOIR96CY734DRK
 Mi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tqygHtIF9C1t29D6guUTjM28SV0efTFg8Sgvi9tq11E=;
 b=e1hn6DKKa7Iv8+WcDOAMCGvOLtZkwYzwClWk4R5lRvYVm1UnLVFjlMa0cMp55nE/RE
 41Y/B8E7zNurOdM+nctwUnLuDPFAVcACEbSVpnaeHIdEBUXjQabr7cgeo336x7XgtgZ7
 878u2kjw4+L3TyVBUnr1vSz5W8L10I4MihT3CHQQyRPk/f5nx65rzj/UEhmhpQ03XT78
 xKFgYJWEfD0R46j9GdjL4KlQaMajg8XIVNfyEUjQr76aMLOSrawkAutLLwg0s422qu+/
 amhXOKUPw2vP1cLbx4ZuDHUtafA9pKnjeV6/p50azZVvNYTi4YhQ3HsI/9s5X26AI/6I
 /NWw==
X-Gm-Message-State: AOAM533NfGAiDI3QfsYKM2q6qT05qfCjUzpR6bC30rUCnDNCCUrhEMFH
 nbnJY2EpV/5AXBVui4lj5Ff6fQ==
X-Google-Smtp-Source: ABdhPJyesXfARSvCLvmz8y7QSMQQJ0byeO/pyhC6hJcjwk2HlOZbgELJgKE99SMicIv/QiBfvRGBuA==
X-Received: by 2002:aa7:9ecf:0:b029:1f4:f737:12d6 with SMTP id
 r15-20020aa79ecf0000b02901f4f73712d6mr2614833pfq.8.1615954868646; 
 Tue, 16 Mar 2021 21:21:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s22sm835188pjs.42.2021.03.16.21.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 21:21:08 -0700 (PDT)
Date: Tue, 16 Mar 2021 21:21:08 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 21:19:54 PDT (-0700)
Subject: Re: [PATCH] ftrace: Fix spelling mistake "disabed" -> "disabled"
In-Reply-To: <20210311094022.5978-1-colin.king@canonical.com>
CC: guoren@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, 
 hpa@zytor.com, rostedt@goodmis.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: colin.king@canonical.com
Message-ID: <mhng-9cd288c7-8f95-4e86-9b2b-bb405e3f74fe@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_042110_282144_F97DCCA3 
X-CRM114-Status: GOOD (  16.53  )
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

On Thu, 11 Mar 2021 01:40:22 PST (-0800), colin.king@canonical.com wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a comment, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/csky/kernel/probes/ftrace.c  | 2 +-
>  arch/riscv/kernel/probes/ftrace.c | 2 +-
>  arch/x86/kernel/kprobes/ftrace.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
> index ae2b1c7b3b5c..ef2bb9bd9605 100644
> --- a/arch/csky/kernel/probes/ftrace.c
> +++ b/arch/csky/kernel/probes/ftrace.c
> @@ -9,7 +9,7 @@ int arch_check_ftrace_location(struct kprobe *p)
>  	return 0;
>  }
>
> -/* Ftrace callback handler for kprobes -- called under preepmt disabed */
> +/* Ftrace callback handler for kprobes -- called under preepmt disabled */
>  void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
>  {
> diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
> index 2dfb33fdac74..17ca5e923bb0 100644
> --- a/arch/riscv/kernel/probes/ftrace.c
> +++ b/arch/riscv/kernel/probes/ftrace.c
> @@ -2,7 +2,7 @@
>
>  #include <linux/kprobes.h>
>
> -/* Ftrace callback handler for kprobes -- called under preepmt disabed */
> +/* Ftrace callback handler for kprobes -- called under preepmt disabled */
>  void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
>  {
> diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
> index 373e5fa3ce1f..51c7f5271aee 100644
> --- a/arch/x86/kernel/kprobes/ftrace.c
> +++ b/arch/x86/kernel/kprobes/ftrace.c
> @@ -12,7 +12,7 @@
>
>  #include "common.h"
>
> -/* Ftrace callback handler for kprobes -- called under preepmt disabed */
> +/* Ftrace callback handler for kprobes -- called under preepmt disabled */
>  void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
>  {

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
