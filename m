Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7BEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 21:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XVYfW+UeM0flVRTqnelwERTl1bZgBahtv/HSxqlVBg=; b=cC9D0qTlREkLzZ
	EHmlx+iX6ktJsmgsJZOKKJijOVOAAph3Y2s2bpAnM8N7mqu32a0gwfNK6k1dleEhvGwPCivdTV2zV
	r1A1unXSXWeF1/3Lz36/5yogNqMNKK4vS9Cg+I93N4QFaOF2Z05vRSlM0ZfmblfwPZMFlI1HJ0Hae
	W+J8ANXYrfBmqHMI90stUnx/dX976D8GCPDnyT7oTgojdeDYyHLtJKPjwr2CeuwnVzWHgBP6GkZyR
	zeLQVh5t+KQah8zv9DfESTMIXUte4CDA6jLzyhvZ6GzNGUHCSEHB55cRMKF85pwjhpnnG4rTGXEN4
	MEL4QMCTTO2wiUENZGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxyJj-007fxS-1A; Thu, 16 Dec 2021 21:29:35 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxyJg-007ftr-9e
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 21:29:33 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so458523otu.10
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 13:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oClQu/XAnqP12EjWnF0/gb703c+sK8qST1QKHwTbW4w=;
 b=47V4S73cO/p+BTOd+tC35up4knFrECvcw040A01i4hm4UhCzgvDzhISf7VCuq+s0pY
 rYQZOKhApQeYYXVGs6rtLQINzh7zko8rWXVEtWdvbmwEJJ9/NWIj3GzruYg6I+8fD5GY
 sKCRjfbm86eTt5A7uRq2LS+K44qX6U8eUrS3iWBQox4x1gThX/H2MAXbehXIR1ZSOBiq
 NVIvSUysxlFjO4m88JUgxpeYg2w/ReXvu3RYAB7eiSUFipEGJnH0hUKYhFPT0JzfWIPK
 CBAOf1VkN8583yfJJjEJOR+l6Ug6q5XjjVIDGc7yOdakCaFdSkO3pkdC6TSU8LltOUZD
 80jw==
X-Gm-Message-State: AOAM531cEEejWDzmOJ4B0jncX96ZCELIUXBcXp/DLUso7ALRDezX+W4p
 BQTInegtw+yGeqqf1B4qOQ==
X-Google-Smtp-Source: ABdhPJz4C9513V1E0wQz2hCoepwe2jn5kkYcmLFvK45y3aa3NlqqO99pTl57rYzU2cZpj/Gtj/biNQ==
X-Received: by 2002:a9d:6a15:: with SMTP id g21mr28980otn.221.1639690170984;
 Thu, 16 Dec 2021 13:29:30 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g17sm1207408oiy.14.2021.12.16.13.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 13:29:30 -0800 (PST)
Received: (nullmailer pid 797576 invoked by uid 1000);
 Thu, 16 Dec 2021 21:29:29 -0000
Date: Thu, 16 Dec 2021 15:29:29 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Sagar Kadam <sagar.kadam@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Fix number of interrupts
Message-ID: <YbuvuVUx3xOhGf1A@robh.at.kernel.org>
References: <cover.1639661878.git.geert@linux-m68k.org>
 <41942eec41ccdf9831648c600d149af5e5f652a2.1639661878.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41942eec41ccdf9831648c600d149af5e5f652a2.1639661878.git.geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_132932_362125_3750B122 
X-CRM114-Status: GOOD (  16.24  )
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

On Thu, 16 Dec 2021 14:41:21 +0100, Geert Uytterhoeven wrote:
> The number of interrupts lacks an upper bound, thus assuming one,
> causing properly grouped "interrupts-extended" properties to be flagged
> as an error by "make dtbs_check".
> 
> Fix this by adding the missing "maxItems".  As the architectural maximum
> is 15872 interrupts, using that as the limit would be unpractical.
> Hence limit it to 9 interrupts (one interrupt for a system management
> core, and two interrupts per core for other cores).  This should be
> sufficient for now, and the limit can always be increased when the need
> arises.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - Split in two patches,
>   - Improve patch description and document limit rationale.
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
