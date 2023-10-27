Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5E3C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ofsBTTDZhvXxMDAaeRGZl/u44FTckzWsR6xlmfsODc=; b=rbF1555B1l1Dyy
	d4IWK6KmIq6+ew+27COfwmFNLdt44xQsRMVu0f8R+5KUzP8Tuefc2AwEMDm6cSsUmqm2LGYheeqza
	pY37qQgE98rR4ejFEtRpJy9fQBMgkhoL+frgbanU0gCGcH5AHsx/NNl7cPXF+EhpKzCzLGCaTqK9d
	9m4bHD8VqnZ6mJpGutaCWng8Jo1hA9ijy8swHQyPN6lidAC3yXldug9Xa4dKhFDJ2fHV2kcHupSzx
	L8NUOqVX8pGMt+0rQuMMwO0nZHpt3GeHNCS6xpK9Yc9koJ+JKOeDoDvuuV7StMtrz0knmneubou6K
	727QqFWQ2PWJrszNA1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJBV-00G268-2Z;
	Fri, 27 Oct 2023 09:31:17 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJBS-00G24t-2A;
	Fri, 27 Oct 2023 09:31:15 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso293398766b.2;
        Fri, 27 Oct 2023 02:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698399072; x=1699003872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4F8FZ57kpr13z/xUt6ki2x46rIiQW8y2N6vuceQyfU=;
        b=Gqyw3FcKObt4F8r8ac53xSwEKtBoe36ABMPn/FU2xXgBV0O1kwvhTj+qWWoWJE2CQ1
         5WL/TsFua1zChOasXV61UIPYMGp4NHMVtZHk8H7H8kKjg8MqGRsLlKWKuWKU4JxWACEf
         DFhbDHsXCKFgs5XNosbsIV8X5Jse7mZbsKD41sCdVE81OK4jYI00pYy132eBU+5ZdMUr
         0uFiZdpaezrraigvvGumqIGTtYMQIFppO9CPxl8kAQ0OVHiwobV5EjRTUwSY3M9yk5l5
         /Bz+FYSlxORT/Q/T9nle5tEM/P8kH5IgSonYCjV+NfaHgEZfrOo1hYaGzaMCID5MTevi
         J3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698399072; x=1699003872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4F8FZ57kpr13z/xUt6ki2x46rIiQW8y2N6vuceQyfU=;
        b=uLhhu66CQnQSBxs1zC45nhuxhNSM4uQSaKKUllPD6Q6lSgY5hEPp+AnUyE9//GI87f
         8lo/Is/Y/QeXfFFXcfgVavoPxlcE32of3JO34PPJpfK0j++lIwMmNW7vklJl5nRe1mfI
         K0YXNIrKr3foIGCgYp4j3QhQYgqmU6oNfEUZqouwdu5FKRinxDB/lEKA9uXzE0m+3WpJ
         CvxrAh/K8JsZY00+qpViRHwAgrlvhr1+7Ot+TpvjFgu2vPeKetml1VPH2Dbcr6ibxGKK
         Kch7NPhjodvEIEqkFI0L2/7RLDXHW0YMijgl8I7Te+2toMp7rlupVheADOny8xpgD6Dz
         QLhQ==
X-Gm-Message-State: AOJu0YyEV6wXP6a7XNuzR9qWeGZyK78sOMhJbwz4+NTwL4L6PQlyCV2z
	NhDBQ6BFJqitBVYK8ed5NzA=
X-Google-Smtp-Source: AGHT+IEq90WuJ/Nx+toJPSBjsozZ5oAnVq7Mga1dbu0u4J9xw/FfBUz5Aih0KpYN8Q3HBum3dpWhmQ==
X-Received: by 2002:a17:907:36c9:b0:9c7:187a:c60f with SMTP id bj9-20020a17090736c900b009c7187ac60fmr1683229ejc.38.1698399071840;
        Fri, 27 Oct 2023 02:31:11 -0700 (PDT)
Received: from gmail.com (1F2EF1E7.nat.pool.telekom.hu. [31.46.241.231])
        by smtp.gmail.com with ESMTPSA id fd10-20020a056402388a00b0053e5a1bf77dsm928729edb.88.2023.10.27.02.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 02:31:10 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:31:07 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com,
	lukasz.luba@arm.com, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linuxfoundation.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v4 1/7] topology: add a new arch_scale_freq_reference
Message-ID: <ZTuDW8lXZLQP1Ruq@gmail.com>
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
 <20231027080400.56703-2-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027080400.56703-2-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_023114_708743_747F76F0 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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


* Vincent Guittot <vincent.guittot@linaro.org> wrote:

> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -27,6 +27,13 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
>  
>  void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
>  
> +DECLARE_PER_CPU(unsigned long, capacity_ref_freq);
> +
> +static inline unsigned long topology_get_freq_ref(int cpu)
> +{
> +	return per_cpu(capacity_ref_freq, cpu);
> +}
> +
>  DECLARE_PER_CPU(unsigned long, arch_freq_scale);

So mind naming it in a way that expresses that this is indeed a maximum 
frequency? arch_scale_ref_freq_max or so?

Also, is there any particular concept behind naming one new symbol 
'freq_ref', the other 'ref_freq'? If not then please standardize on one 
variant.

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
