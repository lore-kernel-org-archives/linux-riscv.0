Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE9FC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 04:36:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1FA22A84
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 04:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA1FA22A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=lmrw9tQMl7NbPWUSOEXHxdERr+rL/beIP377zcUyveI=; b=QX8yD/7T1sbIGcYnZ+yzjUnDv
	lWo+dem4ge9ScqQg0wUaBPdpwH5xvwih6wEBPGI2HrbEansHuuAqDcM2JFkWrdE1V1MSueK0VqgMv
	V59YwgF8ThGMlOzPDXIy06uvHTS9xSzt2Ny4o1AQf01fZ/0D4vAD7coQL+WrmnPA1VYVHRDNMpJ+u
	OBX6Sh06uvHsfRHy0fVw6Yr/2ONp0H/K6rdD4731qH+VuYvuLvUs5YBWlWyzsRG+pHq9a32qDhayN
	MK9K80Ukec4Hn99cfd1gdcHhODXI+40Y9Ry7gvlnHRRkJ2z28h2a1GZzMqhS0Tm7M18ENKrOXSm6Q
	dISLPExCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzXtc-0005YQ-EK; Wed, 13 Jan 2021 04:36:36 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzXtY-0005Vp-BS
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 04:36:33 +0000
Received: by mail-pg1-x52b.google.com with SMTP id z21so701109pgj.4
 for <linux-riscv@lists.infradead.org>; Tue, 12 Jan 2021 20:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=W2DTFJctevO80Wxiy22I5eLvGa6N2Q2gSn+izgPeWUc=;
 b=tIqQ6gZJJFZk6/Xx106xzUhWnMRicG4nVSUz6WCgW8rzlYJfTK1drm+H8JxIMw7zKM
 gXOhsEMrxYmmA7pbpW7lITrSiKAnWLWuaH+PjSyRZkK5vL7U4BlPATruoxrNKJopMly0
 FAUdZmyZAEP4+8cDiWqnMbAmLt5z+fn/4fo++aB+85vE2AIUiXk5Bv0Y3ajHvhD5L0tn
 HDyryJIICLWTUkR1BBNGW9XQYT0eq5wGt0MT+w82W16H8UKbFcisRDWXgYW3Tg7aaJup
 1loscuOCcKO5n4q5uGV2Vmzg8NcXX3N4/Uly1jgrc56a0JCHW4KJ6AO+ywjkBgHtApde
 50wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=W2DTFJctevO80Wxiy22I5eLvGa6N2Q2gSn+izgPeWUc=;
 b=N8tcHEsMY7rXL/LW5tZfZmrLMKEf7TrKBmxuM6MDbqwzh63XFeJ3FyAy+Lm9akDVzG
 A/y4dKp+3efl0y1wtaW/oRH7xlzwvYrSivt30sj2cqzCsek+dhK3bjGhjr02ECYZi40x
 voW1uyOJ+SHUzG4wAeUNmjHDh3tDpTjXJB28bICEi2EEm47q38lhaHfaBZcyeKHwmCik
 nG7Xq+cmI51D/eQ6ojbImVos6i/ddjIMrfDSj1Wp44noWnHB1h8CJZmeh6r0LC6ZHhWl
 pRGWhXi4NMsqM3fVEaoHds942Po6iDKunb26tZF/y+4n7l09Nl6kAKl+WA13sTG4eC5o
 lWww==
X-Gm-Message-State: AOAM530B6BVt6eCwlrk3ftqZRDxeJj1zeupeF/ThzWdCtK7igmlRchHQ
 czsj6hEkPgv5l31y3KjX87lJLw==
X-Google-Smtp-Source: ABdhPJwRQpy1F4tqIHhuToOWLrzd50514xkM9r4W6T6xrab908m3RIfCwXHp9cXISTgxfDAgReRTsA==
X-Received: by 2002:a63:100e:: with SMTP id f14mr341352pgl.102.1610512590060; 
 Tue, 12 Jan 2021 20:36:30 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gc20sm686135pjb.49.2021.01.12.20.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 20:36:29 -0800 (PST)
Date: Tue, 12 Jan 2021 20:36:29 -0800 (PST)
X-Google-Original-Date: Tue, 12 Jan 2021 20:26:16 PST (-0800)
Subject: Re: [PATCH v2] riscv: cacheinfo: Fix using smp_processor_id() in
 preemptible
In-Reply-To: <20201222160152.180981-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-c05e1b40-6218-44a4-8742-fb7d3d07af0e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_233632_456933_C3C6BE75 
X-CRM114-Status: GOOD (  17.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: wangkefeng.wang@huawei.com, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 22 Dec 2020 08:01:52 PST (-0800), wangkefeng.wang@huawei.com wrote:
> Use raw_smp_processor_id instead of smp_processor_id() to fix warning,
>
> BUG: using smp_processor_id() in preemptible [00000000] code: init/1
> caller is debug_smp_processor_id+0x1c/0x26
> CPU: 0 PID: 1 Comm: init Not tainted 5.10.0-rc4 #211
> Call Trace:
>   walk_stackframe+0x0/0xaa
>   show_stack+0x32/0x3e
>   dump_stack+0x76/0x90
>   check_preemption_disabled+0xaa/0xac
>   debug_smp_processor_id+0x1c/0x26
>   get_cache_size+0x18/0x68
>   load_elf_binary+0x868/0xece
>   bprm_execve+0x224/0x498
>   kernel_execve+0xdc/0x142
>   run_init_process+0x90/0x9e
>   try_to_run_init_process+0x12/0x3c
>   kernel_init+0xb4/0xf8
>   ret_from_exception+0x0/0xc
>
> The issue is found when CONFIG_DEBUG_PREEMPT enabled.
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> Tested-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index de59dd457b41..9b5a8a347434 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -26,7 +26,7 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
>
>  static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
>  {
> -	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(smp_processor_id());
> +	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(raw_smp_processor_id());
>  	struct cacheinfo *this_leaf;
>  	int index;

Thanks, this is on fixes with a comment about why we need the raw_.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
