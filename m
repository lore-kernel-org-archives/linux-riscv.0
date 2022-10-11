Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61C0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GPR9HqRsOhlJQPKVenFGVot+O0KkQKt4MPSqQW7PjU=; b=dwbc3VjEeY6qxB
	BTrJFuKrzKTvE4CsreqhlY26UoFjbn7Tt2qJDPSBDLTTksLQHChBOVBpRaApxSvCFczJt44Eszico
	I/0tAIz0RlVRggI32LZ8FPCxr4QIOE8e4ZMQ07IShd5b2uE8phe0yYtKuetwxrD7nFLwAXKfgbnt3
	Hq5+r620a8aw5E6KgqDeZ1oDj6HE2qX+LMFoHgOmwreZdo7blmj5vEXkvmbzqFveK9cvwVefBeJ1z
	t6EBEX8SzN3W8Lab0FxEXdT8+3njDz4LQ6SxSKAMppsOX71r+X8an3zqDDnQsjdwUDYLi+AhTqBIo
	cSD1PCD2eqNIhZ/1YE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiHqG-0055Ln-Iw; Tue, 11 Oct 2022 16:10:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiGlq-004dEh-55
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 15:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665500531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ti1NCFCTzr5YPwBHvg45c+mfaiUwrR60uA7ep6lLZuA=;
	b=OJpsu0oiqO/4x8YO39vX/PdhqG3YhOp5vJJ+FXxmqN7tf3kb05bF1gvNGfXlKQJ9GA1JLh
	Y5r5lR54sQg2QT4K6YvXMCgkE5uN/kLm0l/qZPoIZq6AQO1AmWlmITZ2rQDJ9gqIW8fuXq
	zfcQSR39NLvs/0nAtS5EryTWtBrpk/c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-523-CucDy_i_Puqi7tKCnFv_Kw-1; Tue, 11 Oct 2022 11:02:10 -0400
X-MC-Unique: CucDy_i_Puqi7tKCnFv_Kw-1
Received: by mail-wm1-f72.google.com with SMTP id l1-20020a7bc341000000b003bfe1273d6cso3824573wmj.4
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 08:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ti1NCFCTzr5YPwBHvg45c+mfaiUwrR60uA7ep6lLZuA=;
        b=MhF6hUe/A+kuyv2HQYyKtNVnejCCyrkbXBXX1iG5rmzK8JAo4Kld+nrIP20UETGOcI
         1jYJcyz920uGgISJG923Ihe9XlLGCGvMPQtuGlstbOTy7yy+SGAGmdt6VBlGpF1Q7Gn2
         UO/ju5/BNkcWNvjOBgTAN8NiEMnYUgDPD/FlM/nah6jOS/AxphgKdPsJA3QKnAy9leMk
         3FrQH5C98CwfCM3Gc4P6EwjqUPe5wDqOkH0aE8o+PIH5LEWH3I1EnHr7BeutLCgmCns9
         k9rBNmPFy0e+OgY9eqQYALfrVeLBcAcqtTuRio+V2gWLFjb8IlGPR9kKXXSgcW9PnZE6
         Lj2w==
X-Gm-Message-State: ACrzQf2B8k3Ft1TI29etZtCgvI2LJXChlwX71gFQ/FFmxlcZ0URl5Gos
	k1ExBv2U/eGNmNioIGUQyekGlvdNVdSudJ1bwsqZZ9pDBLKbKYGlBQpQN40beQMLtSLyZhNRYlF
	5VnSPAlcrevwhvOdsNYkcb9nnqyWq
X-Received: by 2002:a5d:59a3:0:b0:22e:4b62:7ceb with SMTP id p3-20020a5d59a3000000b0022e4b627cebmr15699224wrr.90.1665500528851;
        Tue, 11 Oct 2022 08:02:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7srUgXRaEVg4Pb59BUs0ShAt8e40s56KQw2lU0G4VdN3sOMR/0VHio2//G+OqnLs1Wx3l7Vw==
X-Received: by 2002:a5d:59a3:0:b0:22e:4b62:7ceb with SMTP id p3-20020a5d59a3000000b0022e4b627cebmr15699160wrr.90.1665500528495;
        Tue, 11 Oct 2022 08:02:08 -0700 (PDT)
Received: from vschneid.remote.csb ([104.132.153.106])
        by smtp.gmail.com with ESMTPSA id bh11-20020a05600c3d0b00b003b49ab8ff53sm13552403wmb.8.2022.10.11.08.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 08:02:07 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, "Paul E. McKenney"
 <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Guo Ren
 <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [RFC PATCH 4/5] irq_work: Trace calls to arch_irq_work_raise()
In-Reply-To: <20221008153442.159b2f2d@rorschach.local.home>
References: <20221007154145.1877054-1-vschneid@redhat.com>
 <20221007154533.1878285-4-vschneid@redhat.com>
 <20221008153442.159b2f2d@rorschach.local.home>
Date: Tue, 11 Oct 2022 16:02:06 +0100
Message-ID: <xhsmhlepmflox.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_080214_326167_B15416E2 
X-CRM114-Status: GOOD (  15.11  )
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

On 08/10/22 15:34, Steven Rostedt wrote:
> On Fri,  7 Oct 2022 16:45:32 +0100
> Valentin Schneider <vschneid@redhat.com> wrote:
>>  }
>>  
>> +static inline void irq_work_raise(void)
>> +{
>> +	if (arch_irq_work_has_interrupt())
>> +		trace_ipi_send_cpu(_RET_IP_, smp_processor_id());
>
> To save on the branch, let's make the above:
>
> 	if (trace_ipi_send_cpu_enabled() && arch_irq_work_has_interrupt())
>
> As the "trace_*_enabled()" is a static branch that will make it a nop
> when the tracepoint is not enabled.
>

Makes sense, thanks for the suggestion.

> -- Steve
>
>
>> +
>> +	arch_irq_work_raise();
>> +}
>> +
>>  /* Enqueue on current CPU, work must already be claimed and preempt disabled */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
