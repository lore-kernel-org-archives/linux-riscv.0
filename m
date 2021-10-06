Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2962AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 20:44:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C514061152
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 20:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C514061152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voUZwZyhrIzhbomQKfei5tEhVzglnXRN4TFyK7ymdiM=; b=E5M79JS0892zvt
	cZoHD9zV3/F6vSWci/zup120Ra+xIZ0dHvJm1wICkEABRPuJubhNpG337YOikBEQu3lhaAgdNkEpv
	7Ij/hv59lKa3nNWg4WKOHBkPKW78ycniAD75Vsx34PJeCjx6swH6zTdtI6vQ/Ay3iFu/Tlul5RDwY
	YEqkJkKdv9I1V3N07zqMGdC2rsFJ9Cp4wbsvGDZnGNayjU0ocoX4vlK8tNGbzN6wtdCVxanhGTqc0
	QsHpejDQ9C8+NK3YIGkHnl0l39oEv/7sldHJnjnw/9WVCQhgPoSQpgEUn04vfntFdEWucLgGhS0GR
	Xac123X00nvpxp6N6/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYDly-00FVW5-Uy; Wed, 06 Oct 2021 20:44:18 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYDlk-00FVUl-UI; Wed, 06 Oct 2021 20:44:06 +0000
Received: by mail-pj1-x1032.google.com with SMTP id oa4so2434613pjb.2;
 Wed, 06 Oct 2021 13:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uukXjZUQ/w+EOWxXqSK1+sdvRdmpSRZkmYypGawzIsM=;
 b=QT+moIpptwRsvjJhH6SoVjzQTZZ76DE7Nw9kqS29J/CEKIqSBkKNAPsy0jT6+cMT5r
 0B+0+QxpzmLLa3r7jEXnwxbIQgJkwMi/us4S+81A070jhHgCr7uQ+fbqDmEae7tJyZrW
 KXcNV8SnxYIgrHqlro0WODjOtXLW8X88ZHdiubGxyQ6s4VSefvMST/UT52GjNmBirP7J
 vPJrn4/h0HeMwFA9oFdn+ECv8WDQE4jLb4GwOzBBu4isPwb9sn2ye3J8U1vaLKqwIt6z
 g4sBC+3kK0eokeo5x1JO49TmdiQsp14FxekFKZ6n9Z+Jk+BJ4arhTM0CkIcl8c56mqWF
 a5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uukXjZUQ/w+EOWxXqSK1+sdvRdmpSRZkmYypGawzIsM=;
 b=W4ocunwgwwlhhjMY9mIbHv/NOnWKqEa/v6GNLlMA3N6t0ddwy7w6sQyTnhHszv6zaH
 UdXGkOdzMDyEuvQ7mDelCLSh90XChiMIxMSgjFm6KNVH2ai2KNz20T+tlspGysn8/UPu
 dlmtstCzi+ckqhPCF4csPfTczw7OoeNyT01PebzM2TCWtTns+fYqHE6df09wEJcOz6ll
 4j+hQL/P/MfNgzZQx/N/lzeMYCBkV0CjvdIC7NHcIvhtkLLMuFwW7ZgHjAlHQ4ppghmv
 VqECgHP67VEEvWBxPE2P2/MxNBAiH7DiPsw+2bNc0PlYvBX065D7dikKRyDaSVQtSpvV
 +kTg==
X-Gm-Message-State: AOAM530S0MgZuTMg/nQRWp6Q8dx3PSa1VFfRO8ulRHi4wux4oMjOJyei
 QzCtMuZot47V2VO3h22YK2U=
X-Google-Smtp-Source: ABdhPJxbN+u6234S13N4970pWpeBYhU6hjO3nALy/nZjNDvGJdvqZ+ABgTpyG64/0LL2Z6QM8DUU9w==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr328965pls.17.1633553043180; 
 Wed, 06 Oct 2021 13:44:03 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id q8sm5806904pja.52.2021.10.06.13.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:44:02 -0700 (PDT)
Date: Thu, 7 Oct 2021 05:44:00 +0900
From: Stafford Horne <shorne@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Message-ID: <YV4KkAC2p9D4yCnH@antec>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006164332.1981454-7-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_134405_035963_A3E4407A 
X-CRM114-Status: GOOD (  17.91  )
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

On Wed, Oct 06, 2021 at 11:43:26AM -0500, Rob Herring wrote:
> Replace open coded parsing of CPU nodes' 'reg' property with
> of_get_cpu_hwid().
> 
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: openrisc@lists.librecores.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/openrisc/kernel/smp.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> index 415e209732a3..7d5a4f303a5a 100644
> --- a/arch/openrisc/kernel/smp.c
> +++ b/arch/openrisc/kernel/smp.c
> @@ -65,11 +65,7 @@ void __init smp_init_cpus(void)
>  	u32 cpu_id;
>  
>  	for_each_of_cpu_node(cpu) {
> -		if (of_property_read_u32(cpu, "reg", &cpu_id)) {
> -			pr_warn("%s missing reg property", cpu->full_name);
> -			continue;
> -		}
> -
> +		cpu_id = of_get_cpu_hwid(cpu);

You have defined of_get_cpu_hwid to return u64, will this create compiler
warnings when since we are storing a u64 into a u32?

It seems only if we make with W=3.

I thought we usually warned on this.  Oh well, for the openrisc bits.

Acked-by: Stafford Horne <shorne@gmail.com>

>  		if (cpu_id < NR_CPUS)
>  			set_cpu_possible(cpu_id, true);
>  	}
> -- 
> 2.30.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
