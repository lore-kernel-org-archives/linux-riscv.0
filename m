Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC10C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iizIlP13p2TIOzgs2pD71ZR5YrfkP4S6blNEAZyHM+k=; b=h3yhltd4+xk9Xf
	baqRcaVHO2kkZE8fgAFpICGYYAhWOY1MW8dkv7B2GQBEImDmFvmuVURUhj6knHBsFsbg8qXY7M2jL
	EZa1KVJoqxSwA+jmfoql/SDkgRt0HyW0C2T0dfh5caTghQEHwoaD159/Hv4SZnPd0bxhYYsboFyEv
	rCp+/XZp6Y0ty0OYmsfhY4B80cutngLmL1fzR5W+ev8l7eqy2BsrMgiC9LXwxetvr0AZcD1T6f/Ha
	JUL9Xcwpwb6p9OtjyXn5Ojn11pB8xFFI6cJ7IzOa2CQrwUFWmAbQ7ILc4RP912isPy8OV2JmLzRDY
	UUp3QanomU1OP3MWIS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxyK0-007g3d-TL; Thu, 16 Dec 2021 21:29:52 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxyJy-007g1u-7M
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 21:29:51 +0000
Received: by mail-oi1-f179.google.com with SMTP id w64so751094oif.10
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 13:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U23U7mY8KPLC85hut2VPiBNKK+Lf3eiI8eYPXHpTL1c=;
 b=7jHQR2/6miNly3/Jvr5jvCPyAWNG5ZxeET4oXM4cX2jhblyyI/8DNkGik/VnoTo1+U
 j2NWWQ6e9OO0aZd3ic6BkABWbzgS0GB6YrPDHYeOKOzGilLgGuxn30uJUGBODMIxSa+v
 7m7zDNjKKdy8KSmZETmpiIDgdoHkmqngNZfzRkwncr19cwqJcLSJ7wAYUsmrWmHarCnQ
 D28/0LRAoLAx6jMY3mz7Z7FQePl2MP4hljG4qv4PgBEBMTvzZw/t7kRnpl8poUwJFLHE
 Ot7SNrI3G1pQSNNxe3SWlOHLsZdqN4bNJYKaLO4hsfRj8cYbpVEzTQFWEfMgk2h0o5ND
 Udbg==
X-Gm-Message-State: AOAM532ZYsLTQUlkfqlN/yhFoeJpHj06wJb/8NOD6eRFVs2XX5EGb6s8
 qlyLkyetLwNJzzuQrk0tBg==
X-Google-Smtp-Source: ABdhPJxMXpJ8fB9M0+KuYWwf3c5Sh8Zjc4EecIQ1JBKZrcOdt8LRF2BOc65beZQt1vfzNEz/Oo342A==
X-Received: by 2002:a54:4111:: with SMTP id l17mr5656905oic.127.1639690188952; 
 Thu, 16 Dec 2021 13:29:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l23sm1261667oti.16.2021.12.16.13.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 13:29:48 -0800 (PST)
Received: (nullmailer pid 798137 invoked by uid 1000);
 Thu, 16 Dec 2021 21:29:47 -0000
Date: Thu, 16 Dec 2021 15:29:47 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: interrupt-controller: sifive,plic:
 Group interrupt tuples
Message-ID: <Ybuvy+YYImEtDal0@robh.at.kernel.org>
References: <cover.1639661878.git.geert@linux-m68k.org>
 <2f1894def1ab4fb4151357a7a0b2f66760165d72.1639661878.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f1894def1ab4fb4151357a7a0b2f66760165d72.1639661878.git.geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_132950_286527_B77A1D11 
X-CRM114-Status: GOOD (  11.02  )
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

On Thu, 16 Dec 2021 14:41:22 +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "interrupts-extended" properties should be grouped using angle
> brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - Split in two patches.
> ---
>  .../interrupt-controller/sifive,plic-1.0.0.yaml       | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
