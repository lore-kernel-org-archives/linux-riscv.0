Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90573C25B70
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZwy0FBqR9iGeYtDTlgRbyJddZMBGE9n+Tcb83GFGG4=; b=3QybFuuauINMMX
	Ut+k1lwpF24+rHInb6s9tcXvo/uTOiOOgJbLX9cXjFCDtQUM1IHWsblhvFlJ+IcwTCmeUkFpxOr4a
	PYko/pCR4utvHtZJdVGf/XS/c+itlp2y55P7k8gT0SnrAIyPE7BkPEiAcERBpabor3kRPKRuGhHwV
	nPi/S8V16TH5+e8fZw126FtVBZ6LHJbALNby+4q+7a3tQeHvstDXL22GNLqRrZb5j6Vnjz9EGLnod
	L+HpM5bK+NJHQx28tG3mapmxmRKCb1lvAVZ2kzekksttnCUu2SuS2kYGceBGypNrBm96GLzZvTLtM
	rmV5A692avgwfkc481vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJCs-00G2MB-0O;
	Fri, 27 Oct 2023 09:32:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJCp-00G2IP-1k;
	Fri, 27 Oct 2023 09:32:40 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso23825066b.1;
        Fri, 27 Oct 2023 02:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698399149; x=1699003949; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TGQezb/2UwSSANsvO0wTZNbBZ1J9wDNV1NfnwhXP5Y=;
        b=T7ub8GwZOlde7wLtOxDRzcFzccPd3YppjhwKc+sFRxjBfqbdofdPPVUsXkqJF8ufBk
         Ce/jTrTBYotTO6qjic/Xoc2nrTzvQUXgbm01gKIBqTHqQP0mp9jcLaVTNbmD5TuHS1Wy
         k4aFVbxtCnptsx+UlxL/xvGql3VwJLijfAbg7CcHpBvtV8eYDK/6yqWWFyyvxvg8PwfX
         XYypa9kiRJ7XiOIUpXaoAXB43OLbVWISXf3NzSggay98NNB8BCZd+n3vT5Pn46jzA1Sg
         SdPf1Ybulosfavqi36URdq360WN08pgrySZ9Z+Y5m7QnALult51A+RAIhy7k3RrMs6Tc
         ddPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698399149; x=1699003949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TGQezb/2UwSSANsvO0wTZNbBZ1J9wDNV1NfnwhXP5Y=;
        b=IocUrPs2W6aWU+HIULfkU/O5UaSA2vU7MsOlz3u/yW8jB6Qa8wBZXoIh50Va2U6um7
         EKQODev+2CmeRbUnz3o2jA3JXStcFvxw8ezdn7iTYMfTznqsVk0pCLgI41Kg1+WfDupd
         CiR+YMv+xo3OI6cvShXko94YchFBFuA01F0acgxOmFOHcGV2NqAiZv7LAwXMP1m/khwy
         4CPNESAXwlr2kLJg3oy4Q9x1P+cUQ8su9jNmVY2iPPXAzm5i5CLSZgRQFKnTq/gwXVE3
         DoeKCYqY9aE+cJpgPZtKmBaztylUXZQEi5l65kPk/cKiiYKaalCdTJZnDcvtVCQ54uQp
         SXmg==
X-Gm-Message-State: AOJu0YwkM9HjBkYQQa2tWH/8KM6SEweuoJXE7+VD98lKmKujkxQh83d7
	XEB7hJL1RMnoFV4Gzx2xpJQ=
X-Google-Smtp-Source: AGHT+IFYRkZzQF178l+CBBj5nIhjyDKrHzuo7UGw35x0uc/25E+HLUFEyY65L95Wmew2k9xBvyg6eg==
X-Received: by 2002:a17:907:60cd:b0:9be:45b3:3116 with SMTP id hv13-20020a17090760cd00b009be45b33116mr1857989ejc.71.1698399148573;
        Fri, 27 Oct 2023 02:32:28 -0700 (PDT)
Received: from gmail.com (1F2EF1E7.nat.pool.telekom.hu. [31.46.241.231])
        by smtp.gmail.com with ESMTPSA id o26-20020a17090637da00b0099293cdbc98sm915781ejc.145.2023.10.27.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 02:32:27 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:32:24 +0200
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
Subject: Re: [PATCH v4 0/7] consolidate and cleanup CPU capacity
Message-ID: <ZTuDqCFL6uM3tqDd@gmail.com>
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027080400.56703-1-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_023239_587798_948D8642 
X-CRM114-Status: UNSURE (   8.50  )
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

> Vincent Guittot (7):
>   topology: add a new arch_scale_freq_reference
>   cpufreq: use the fixed and coherent frequency for scaling capacity
>   cpufreq/schedutil: use a fixed reference frequency
>   energy_model: use a fixed reference frequency
>   cpufreq/cppc: move and rename cppc_cpufreq_{perf_to_khz|khz_to_perf}
>   cpufreq/cppc: set the frequency used for computing the capacity
>   arm64/amu: use capacity_ref_freq to set AMU ratio

Just a general comment wrt. titles: please capitalize the verb, as we'd do 
in a proper sentence. Saves maintainers one more thing to fix when applying 
patches.

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
