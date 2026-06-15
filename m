Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93623CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 05:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/45e2frdVC+fakCyYQKXhMYpf7UrrLQQt/m8r5znXo=; b=JMZMJYyVANxe5W
	RNKPcmhDKEPhedRpyA+KJUsBJyywPvmjBqJRPYZtkrgCM/Q8gzvjtiBDxe2XM5q6/qKpzSmN/iPZS
	iyxERcFVfmKvJdcJd3mo5wtXgIzqMIh7Qceo5cvgP6c01s8NiJgAJ9lbvlBp0aj1sT4VbkGQKXLnm
	hqbccJL/TqLs9TeW/vDEBXOd83l4UgItVfjfTrOu6Jt+be73JfRKUBxirt1f7hsssMc1jWC8WL+27
	MBRfffE1sUjh5LcRvIEC5ciNKi2dx9vZSPLV8ved7yPUdD2LdO3dRHJxYS8xcdGy1/As+37fyixSy
	DhqOaIAkqSqSRt0uzWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzoT-0000000DcgI-1sRS;
	Mon, 15 Jun 2026 05:24:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzoQ-0000000Dcfx-2ViN
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 05:24:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c0c3543590so19528105ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jun 2026 22:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781501082; x=1782105882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpcf5mhYwCy+kQj8P5K4qfITxeMqEuvewMFhwML0GRs=;
        b=hRwcZZD/yKdxj4s5QlhtDyO4GebBR4cyMioLKmQAVAFQh+r3Hay1g9gSWrqx0vO1CM
         v8YtQ5VrkSZYejRZlmu1ynKsB6ZFdQTQdqLlO81DAzEoHvJdMz2RsNhHK0xV1jtKdGRT
         wCNyZ0H1ONoLO+Dc/PmeyxRJRdozqiq8AD3FXYRxVrUvrOkmn/q+szL7QJ5GBmKO9HHg
         HumqNLJ2maF9uKUhMUHD/4yOQjj5O3lkP1gyS3eoy+8WrBrL7zTdTAUAX3t72t5LaEgh
         UDUcoaQq6f9v9T/cKHMivWhsfYy/h6G8lv7KB4MZB1bHC0maz9FVP1nti0EYst/ckfDE
         JInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501082; x=1782105882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rpcf5mhYwCy+kQj8P5K4qfITxeMqEuvewMFhwML0GRs=;
        b=DbDAUkwzwx7WnF372sJtensvcmTYsqwf7cVm/8Njm2p436fqs9JjE9bvAunyLatBNG
         /ahAgnuK4GS73+kuj47uz4woAS2jIHVcE5EY9V8NRodtoG3qVo5XCWHAxWMgsrnmKglA
         uyxcrmPofuVOSchb411toYApg6qwwX9Z5bAf4mGYuTfubi9lGupoYD5CQI120jcwX6LK
         ZBSWJv4asnzlsykqfLjvD/03qADqFhkOtzVxcOK4fJeyM4D9CphiYtw7294FlKABAh4R
         et94tnQFQ/MegGcdJLZjWtq92xFIVGgDpwbtkMPmclUs+wSrjYI3YmSHTNkNJW0JGM09
         iehw==
X-Forwarded-Encrypted: i=1; AFNElJ/TpNvM0GkMISNZnX5/6Idctsf7IbELGtbQABGbMRc7oprVEuFyY9dt4sM8VHMk5Ma6RcrZb5ZNyQys7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfMoz4McgEXwrRw5KfYxvF7PxlBahWC1SaqBacqjc8agV2KFXL
	Muko/1H2gJi/p615+ExUSQduiSZAOsus7FAxUrqYzMGb5VY1Mz5kwu42SHgAzsNf/Uc=
X-Gm-Gg: Acq92OGOSW/bY2UouA4hOtvhwPjb4fEYYalWarPd85w7PHQn0ztQTilG3+4D8ubcWgX
	2RIZwtKFln0bADjyklptrDbU8FZbXVdzlX9RmsmzK5YLvS4J0oqOAxbNWxyIOM6RVwlXC+u6GwR
	6ptcjDjm3nghRCl5xXqF258JTRBAHFTgiQ4uJkHTr7dn3w1b2YoD0vw+NKaRXvUMt0J++HylMiM
	O5y1kaUSth5D8TNOdUATOosKRZJIzQqE1f++av2uRLsDcYquj+MO015KLN/2xv/xwYE2TKZ3c88
	Cl7pdYEkV1M+h0hHJMEoChlztNUlo8gQHddmxXKm9NLDxoFvUqlbXPn8Gr99+eby61XhbnIz5Am
	NIgsrVjOBXPVq+eyLZ4ppJM/HL10Cd+V8NHmb1IhcKUZRERS9WuZNcERDIGEtrY90RxZlI8V1BL
	/C5eBXaaDUidpodKDOOdFhR+g=
X-Received: by 2002:a17:902:fc8d:b0:2c0:c0fa:1659 with SMTP id d9443c01a7336-2c413dbe166mr150322135ad.33.1781501081641;
        Sun, 14 Jun 2026 22:24:41 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327aca9dsm87824995ad.50.2026.06.14.22.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:24:40 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:54:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
Message-ID: <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_222442_995315_7FF703EC 
X-CRM114-Status: UNSURE (   7.89  )
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

On 12-06-26, 17:51, Shuwei Wu wrote:
> K1 has two CPU cluster clocks but one shared CPU voltage rail. Use one
> cpufreq policy for all CPUs, let the OPP core handle the shared regulator
> and the cluster0 clock, and update the cluster1 clock explicitly.

If the clusters can do DVFS individually (as they have separate clocks), this
should be represented as two separate policies. Isn't it ?

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
