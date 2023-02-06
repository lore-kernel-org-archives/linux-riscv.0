Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591EBC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glFOw3B1aoMh/O+1M/Y9Hg3s/DOEvlVmVoMmEqVqo2w=; b=qeIMc83nYcBQNY
	6zK4bZiC0p3+A5dSMuck9I8OvN5WkVE5/0qOvlIMYLpb0EgCG+CEimBimFq21qIaTbtA8EVHxn51z
	be6WzFS0ZVavBNhU4c50wseAjAeEztqOWibzGhDaYIQJ1LhL4Qyr9wfknlrabm2o84L5xfBu5RkwV
	eVQECdL0qPhqtLXgB/5plVqQTfu8LeoWIy2ey/QwOntM05Ufx8oHGnJSnVSgTx3W4DId2xOLB1sQG
	c+7+yoyTkL1Ip7+cIP9d0KW6DXERfLleqx9ZbHnPzlOCwFqqvkek+2xEJof2mgB3uEZ6ahN9GrhCV
	NIz/VzzfLELOj0POJEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0Ev-008PQR-EZ; Mon, 06 Feb 2023 12:04:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0Er-008POx-Si
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 12:04:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so10601365wmb.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 04:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hga6+jXWGD3JgwJgRFXeH2zeYgheW8Avd9g0cfccau4=;
        b=SocYrnMChbn1Wrrg0A4ZJNO8ixxNP+C7S4MwlhwE5d5xTpwIlUAkGv9ABfVYysfgP2
         4i5NWzTlvpC5BQ27M8A+pMpAReAT1Aaw7bSxWmdhG3crlYgOJNHTl3znnib1+Z73lxPn
         /lT95gJ9FRS0SjkKpdliROt+Uyly1sSYfWwWoGI/3QGhZLdY95KGTlhrekyIRigyzD2B
         uTwv+6DrbZohixJdZxUPFA4mJbaS8pHxAlrUIO8fI+uWpw14DQX/ncXU2kw0a7oznUo7
         kl9VGlvaEW9AIqJADvrJq4864e2lblyoLNmxvnj/YaAnFY0Zbh9CNTjFIJYWoQIcDfrj
         FEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hga6+jXWGD3JgwJgRFXeH2zeYgheW8Avd9g0cfccau4=;
        b=K66uKG5tFHveBmhy17dsRbAFtCpLUzffdqpGhY8EVRVBy7WlT0tdKiOBXPzxeNJG/a
         XSxIDDmNp8BNASCJKWIyGt/JT1qiUesG5IZjEfQ/JcGiQ41oKlXIWs1NvWGWPa2EoaC7
         OhFUJgB9Mb03w1R3ENVhziV7nG1oLFWn9B4RQWS7KaXYHc8N5tknHntFQY5wIQL1PxHe
         oZTfiRQylB9zcqkSaduq22uLU4oA+Wdscy9s11AVFUQWHE+UOPJP3Vh6UmtqPGF+a+Ub
         7XUqiUsaNYkCuJ0hozKB4vk+JLYg/8fDbIssF2i341HJyX55vUKppI7wGvbwqHQSB6j7
         hZ+Q==
X-Gm-Message-State: AO0yUKWdvXwR3rb4/fLeSpvLr6uRpmE2HnUo444aOsl8MU1bjO51xF0G
	sgUj8l9lIEH60oc7OuoZb278pg==
X-Google-Smtp-Source: AK7set/7yaQkxD40Vvi6D7UEvw2RxA5hFBCrhMU2JH60e5v603guyRgl3iQqmUqEY/9LgDZ82G8vAg==
X-Received: by 2002:a7b:cd17:0:b0:3db:14d0:65be with SMTP id f23-20020a7bcd17000000b003db14d065bemr18464580wmj.34.1675685086178;
        Mon, 06 Feb 2023 04:04:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x7-20020a5d4907000000b002c3e306d3eesm4347131wrq.17.2023.02.06.04.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 04:04:45 -0800 (PST)
Date: Mon, 6 Feb 2023 13:04:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 13/14] RISC-V: KVM: Support firmware events
Message-ID: <20230206120445.6tlsvy5fsawn475v@orel>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
 <20230205011515.1284674-14-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205011515.1284674-14-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_040449_950769_93A4352A 
X-CRM114-Status: GOOD (  11.95  )
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

On Sat, Feb 04, 2023 at 05:15:14PM -0800, Atish Patra wrote:
> SBI PMU extension defines a set of firmware events which can provide
> useful information to guests about the number of SBI calls. As
> hypervisor implements the SBI PMU extension, these firmware events
> correspond to ecall invocations between VS->HS mode. All other firmware
> events will always report zero if monitored as KVM doesn't implement them.
> 
> This patch adds all the infrastructure required to support firmware
> events.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  17 ++++
>  arch/riscv/kvm/vcpu_pmu.c             | 141 ++++++++++++++++++++------
>  2 files changed, 125 insertions(+), 33 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
