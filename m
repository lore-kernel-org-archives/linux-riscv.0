Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84917C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 01:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmlf8Sfo7k4exRGiaVAkIxuwy21nwqPIw9dCSl9TilM=; b=Y729jnYftNv6a+
	XzIQtwKyzn1ZPPKuKTi866ydaTchtT8fVTmHRMddJaEtZ54QN4AAN0pknc+xIw9zM9w7nGA0K1jU+
	n6sTkU5rgw/jWbn38u0htJwtnimY6QgkQZZRSmU7H4CRjo2s9PObCaCge51ay72p5hSCYgiQs56mX
	PkyA+/Vd0gLL33S0Bmidirf9Fy8umarGvSfWA8jVvD8JQem+QwTPiPb+sOy5+zlPB6+tf/gHyR/gd
	UfzWg+LH7ja3JL/oTahUF/FG52t7vXCMzVmNdPw3hiJlXeWn2RAPmZqSfLR1IPAJlX3ddRZPo+dlh
	l0G8CuM4OWZAd1wWnGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF40E-00DvWI-QL; Wed, 02 Feb 2022 01:00:06 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF40B-00DvV7-Kb
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 01:00:05 +0000
Received: by mail-oi1-f170.google.com with SMTP id x193so36976369oix.0
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 17:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FwmA6JKPlfYdb8O53eG4VPOnrHtZJfiTdm/qzeAbUSI=;
 b=UUg/rnEIxE3iwVKBGNoE6gJuWdPjXYqB0/xW+yceVW1pOWqqkp2xhCDWhSE6KfjHrz
 hyGC2zAyf+zhbmdCSMHebVbl2cmKfaNkRjNCV4uAWSNZ0QRsgbL8CoPk0oqoY2aHACID
 Wf9Mayf+s7gKvavB3yMhX0ycEbDYCmb5wSDUuony7srS9UV9ZHeduzx0MTm+tucmEURr
 LsshWlBguO8mmr5TbNlQERQUMPOSDMPA6SlzsB752glc9HeCcFjjBxgEZYP04dkYguC7
 iZHPHPPhsLq8m4nA0KP/UVvncJ5IYvS44foeaOzqm7bon5lzbcT7TXpZWiFoydSzFpC1
 Dwig==
X-Gm-Message-State: AOAM5338gJAlj9DaxEVid9I5CYyrnziRVjWNMVY1FJbN4230sYXjEZuC
 uyAbqJSAMXazh0U+QT694g==
X-Google-Smtp-Source: ABdhPJx94mzW80s1AVWpJttUhCzADCAhxdp8POgQUBSKTXkKjvBSI6IyPsZx17pLj82OsvpC+Wqtxg==
X-Received: by 2002:a05:6808:1645:: with SMTP id
 az5mr3359794oib.313.1643763602315; 
 Tue, 01 Feb 2022 17:00:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bc36sm5100831oob.45.2022.02.01.17.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 17:00:01 -0800 (PST)
Received: (nullmailer pid 1101236 invoked by uid 1000);
 Wed, 02 Feb 2022 01:00:00 -0000
Date: Tue, 1 Feb 2022 19:00:00 -0600
From: Rob Herring <robh@kernel.org>
To: guoren@kernel.org
Cc: anup@brainfault.org, Guo Ren <guoren@linux.alibaba.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, maz@kernel.org,
 tglx@linutronix.de, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com,
 samuel@sholland.org
Subject: Re: [PATCH V7 1/2] dt-bindings: update riscv plic compatible string
Message-ID: <YfnXkO98mpm9O0zH@robh.at.kernel.org>
References: <20220130135634.1213301-1-guoren@kernel.org>
 <20220130135634.1213301-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220130135634.1213301-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_170003_726499_F96BCD9C 
X-CRM114-Status: GOOD (  10.61  )
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

On Sun, 30 Jan 2022 21:56:33 +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add the compatible string "thead,c900-plic" to the riscv plic
> bindings to support allwinner d1 SOC which contains c906 core.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Samuel Holland <samuel@sholland.org>
> ---
>  .../sifive,plic-1.0.0.yaml                    | 21 +++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
