Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAD0C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 02:23:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEBCE22525
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 02:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEBCE22525
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=F/9pn4YN33x7jgAzq95zYTmUOSoRgJFUU86H7Cy25VE=; b=yysZkpokV2QjvtaZaEdGWCwau
	h/kiVW6X4bBDo8kxQZriGKqJFlxi58sQqlHzt00IUI3wR6TCQv+FeERE29jPtqF7B87JYBgd4avhA
	12jPGx72oh/mmu6wgMEKnYwO8UcdrOOW2fu+9Seq2o6SrO5Zw/g23nE+unKoctav1r+4vrtF4cBXm
	7KZOK5y96k05VIdESgpBIbFJVWeRZ2O0fzC5EbuZ7euYoRg2Jo3szyt9IlS6+Nzrhj6zibyeaDZU0
	vHz0phF96PvkK+DuWtjz4T/KGEXHbmkNqgC1aDDNrJoTAWb/Ejie2FKDQK884TcMRy/NVij/OHQk/
	3lJAam1vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krXKQ-0006Zl-3F; Tue, 22 Dec 2020 02:23:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krXKO-0006Z9-AH
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 02:23:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id r4so6623003pls.11
 for <linux-riscv@lists.infradead.org>; Mon, 21 Dec 2020 18:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=RxSpVNtkVXcE4uWbxK87WcLmAH5zgIvp8SPN3AGUvwQ=;
 b=omoCxMrTOG8AugFL5AfUd+fAt07Nb31B40wkYudccxqa6GsjR0ZLKaTYhlypuYolyb
 rJ8IfqSmhj990BFfO0m3HNq8pbK+gH0IGsjYuDQMAJDkKQ9n/QEFJ60suc17TLWiseX7
 sJ0uCqFAMzceewH5fFKTKnCYQPt54s6Wl8vQEGEhzoQklUeirrOnlOoJ3bW+MuZWMBRi
 fDEt9jRWyer9FgYhTkvjcTJBplV5X+R/cKMpO0Ye88NePbtpGhk1LTPM3KlYb+l5RfwP
 WMMlM08o/XjGjs+AeyaXANfz87DoreZo8kt6Y4UUg8EKmVw9/8y3yJpnhZGx/prTXGCg
 KIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RxSpVNtkVXcE4uWbxK87WcLmAH5zgIvp8SPN3AGUvwQ=;
 b=MDb7EnP3k8RiFrLYw2/LjlsIFebxH41f0Cfv0e+I5w6hC76ShrQuflhyiyVZGMvfMn
 jlXYPFCWV6ZvvV0W3UnIghxSK6eQekSoSj8H4dIRDiM/9+X6uZraEjKPWCqjOBFBsoBu
 c5MjUT/vqos7Bbc+38P/2UnfTfFtUa2AdqtVwgN1UTKsecLOU+9Fc+DlRE5VuM3uG9gL
 ADm6NADV3m5eNZhf6qVlOojPG6L7BBQoeY7zgSlfDwvM/FbLH1nJA5oLHIgl/VOUFW46
 NP4sLJwjiTx3+KZ4eFWEq7BwnrjUFjWFf3V59u03W6FoI8pac3z3an0rSEpsY430fvhI
 BLAw==
X-Gm-Message-State: AOAM531GTpD3CFivyEFrrRTeyb4i6prQppX3butJMcHAht0zIM7iGZw1
 KD2yYOdb5I/YGWP7y4FdWAz9rw==
X-Google-Smtp-Source: ABdhPJyzw9/zFd4t5Dq587wVtQYYVA72W+OgRG+vrUG19nurazG2tIKa9+h9PW4+Q+jv43jUXCnT1A==
X-Received: by 2002:a17:902:b904:b029:dc:18f2:9419 with SMTP id
 bf4-20020a170902b904b02900dc18f29419mr19081331plb.66.1608603783765; 
 Mon, 21 Dec 2020 18:23:03 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c24sm18182738pgi.71.2020.12.21.18.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 18:23:02 -0800 (PST)
Date: Mon, 21 Dec 2020 18:23:02 -0800 (PST)
X-Google-Original-Date: Mon, 21 Dec 2020 17:48:49 PST (-0800)
Subject: Re: [PATCH] riscv: Cleanup sbi function stubs when RISCV_SBI disabled
In-Reply-To: <CAOnJCUL+Mkyy7D6mUFr0GiT9CGbXg1aa3jO8d0Hrzan=GdV6PA@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: atishp@atishpatra.org
Message-ID: <mhng-49df2890-5271-4952-964b-8e10339fe1b9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_212308_401833_73BEDF24 
X-CRM114-Status: GOOD (  22.80  )
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
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 15 Dec 2020 17:35:40 PST (-0800), atishp@atishpatra.org wrote:
> On Mon, Dec 14, 2020 at 5:23 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>
>> Hi all,  any comments...
>>
>> On 2020/11/26 10:40, Kefeng Wang wrote:
>> > Fix sbi_init() function declaration mismatch between RISCV_SBI
>> > enable and disable, as it always returned 0, make it void function.
>> >
>> > Drop some stubs which won't be used if RISCV_SBI disabled.
>> >
>> > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> > ---
>> >   arch/riscv/include/asm/sbi.h | 10 +++-------
>> >   arch/riscv/kernel/sbi.c      |  4 +---
>> >   arch/riscv/kernel/setup.c    |  2 --
>> >   3 files changed, 4 insertions(+), 12 deletions(-)
>> >
>> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> > index 653edb25d495..99dc77ba8e43 100644
>> > --- a/arch/riscv/include/asm/sbi.h
>> > +++ b/arch/riscv/include/asm/sbi.h
>> > @@ -89,7 +89,7 @@ struct sbiret {
>> >       long value;
>> >   };
>> >
>> > -int sbi_init(void);
>> > +void sbi_init(void);
>> >   struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>> >                       unsigned long arg1, unsigned long arg2,
>> >                       unsigned long arg3, unsigned long arg4,
>> > @@ -147,11 +147,7 @@ static inline unsigned long sbi_minor_version(void)
>> >
>> >   int sbi_err_map_linux_errno(int err);
>> >   #else /* CONFIG_RISCV_SBI */
>> > -/* stubs for code that is only reachable under IS_ENABLED(CONFIG_RISCV_SBI): */
>> > -void sbi_set_timer(uint64_t stime_value);
>> > -void sbi_clear_ipi(void);
>> > -void sbi_send_ipi(const unsigned long *hart_mask);
>> > -void sbi_remote_fence_i(const unsigned long *hart_mask);
>> > -void sbi_init(void);
>> > +static inline void sbi_remote_fence_i(const unsigned long *hart_mask) {}
>> > +static inline void sbi_init(void) {}
>> >   #endif /* CONFIG_RISCV_SBI */
>> >   #endif /* _ASM_RISCV_SBI_H */
>> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
>> > index 226ccce0f9e0..bae6ffdc6e7b 100644
>> > --- a/arch/riscv/kernel/sbi.c
>> > +++ b/arch/riscv/kernel/sbi.c
>> > @@ -560,7 +560,7 @@ static struct riscv_ipi_ops sbi_ipi_ops = {
>> >       .ipi_inject = sbi_send_cpumask_ipi
>> >   };
>> >
>> > -int __init sbi_init(void)
>> > +void __init sbi_init(void)
>> >   {
>> >       int ret;
>> >
>> > @@ -600,6 +600,4 @@ int __init sbi_init(void)
>> >       }
>> >
>> >       riscv_set_ipi_ops(&sbi_ipi_ops);
>> > -
>> > -     return 0;
>> >   }
>> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> > index 901ac0c680dd..ef4f5c076d61 100644
>> > --- a/arch/riscv/kernel/setup.c
>> > +++ b/arch/riscv/kernel/setup.c
>> > @@ -104,9 +104,7 @@ void __init setup_arch(char **cmdline_p)
>> >       kasan_init();
>> >   #endif
>> >
>> > -#if IS_ENABLED(CONFIG_RISCV_SBI)
>> >       sbi_init();
>> > -#endif
>> >
>> >   #ifdef CONFIG_SMP
>> >       setup_smp();
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> LGTM,
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Thanks.  This will be on for-next when the merge window closes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
