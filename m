Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1A5ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ia6p5GP90rYL6reXrVOxzY6ZktRG+5UUp2ESr6eclbA=; b=jHmG0YTLGtPnZ/
	q6Hbpdk90wSh1P9q/TYHY0LKkWWGHR5YwWo7CwLS5omVF2TqtjbJzO54PaHWU5qPRyOZnp75CBC2L
	9Y+F9HZLxu16S/ogOpHyYerFlmnKRVW9sdZLYKMKLUhk5ithcd6m07/Rzb7Qavk8/8gdpU/1SSd66
	/KV78Z+JsmuI7BG6OjzpL4GSfzQVeBPIWxYbXdN5ydXBGmztsOEOlAOMHtt4VtvOMsfqsoxH7tQ21
	7oWZ++25QmCJ2RaqtAwuJLd8YPQhdQtOrfe8s2/uYx6C8mPiTX/EH2h71xqqnBA9PqvizQfIii34+
	LqJDj+pvDw47vjuQhFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5aa-0014nc-Pg; Tue, 30 Aug 2022 18:03:52 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5aW-0014jJ-2h
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 18:03:49 +0000
Received: by mail-ot1-f51.google.com with SMTP id m21-20020a9d6ad5000000b00638df677850so8622184otq.5
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 11:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=E/aVLvibqd/b36Ng45UDa0e8w5QaN31zCJl6Jumumq4=;
        b=g4V30hPTt12QQqV6gLQ9NjSYFjR4lvkwklSJhFFG8sptomDnDa46quM+P6ayb+f0Wi
         GDrwjTs/s4/XTVD+T9DEbIf4JllKotfj2uP1XoxyWD9jMxMvjWyv22ibDPCTqpVcCiIT
         gIAWgaI6RnaWvxzimvLOgoNAKOtFLCVaQNVZ6VuU9Ots8pIPbor4Tm+lWSWF6BC/AfNC
         goWcyKBAK96sEve0Vco5H11srczfCQ/9BTmTB/VocGM0DzDaYedXfkozncuR8daBlWiT
         BGiGjSktxdhJNcJISxlHnaIE9YMY1QYSCjIkHrd/DpHOFGoJjHOHLOaVrMplYbJL4PDd
         A6aw==
X-Gm-Message-State: ACgBeo0JKxWki8Bx0/7asH5u/nA6Tkc9/HzU5sKWdDT/mmmcn/WLSMDW
	FSM0e5lE2WIw0LSO3xnoCA==
X-Google-Smtp-Source: AA6agR5JGLNMerqnzMNRFokwD0kYQMtWsTMxX51+yE5oIJHMl04sDutLbVBGC7lLaqgSJK5sj75chQ==
X-Received: by 2002:a9d:72d0:0:b0:638:e9cf:3e75 with SMTP id d16-20020a9d72d0000000b00638e9cf3e75mr8732407otk.289.1661882622846;
        Tue, 30 Aug 2022 11:03:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x19-20020a9d6293000000b00616dfd2c859sm7579226otk.59.2022.08.30.11.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 11:03:42 -0700 (PDT)
Received: (nullmailer pid 1769934 invoked by uid 1000);
	Tue, 30 Aug 2022 18:03:41 -0000
Date: Tue, 30 Aug 2022 13:03:41 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marc Zyngier <maz@kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: riscv: add new riscv,isa strings for
 emulators
Message-ID: <20220830180341.GA1769896-robh@kernel.org>
References: <20220823183319.3314940-1-mail@conchuod.ie>
 <20220823183319.3314940-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823183319.3314940-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_110348_147798_80802480 
X-CRM114-Status: GOOD (  26.79  )
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

On Tue, 23 Aug 2022 19:33:19 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The QEMU virt and spike machines currently export a riscv,isa string of
> "rv64imafdcsuh",
> 
> While the RISC-V foundation has been ratifying a bunch of extenstions
> etc, the kernel has remained relatively static with what hardware is
> supported - but the same is not true of QEMU. Using the virt machine
> and running dt-validate on the dumped dtb fails, partly due to the
> unexpected isa string.
> 
> Rather than enumerate the many many possbilities, change the pattern
> to a regex, with the following assumptions:
> - ima are required
> - the single letter order is fixed & we don't care about things that
>   can't even do "ima"
> - the standard multi letter extensions are all in a "_z<foo>" format
>   where the first letter of <foo> is a valid single letter extension
> - _s & _h are used for supervisor and hyper visor extensions
> - convention says that after the first two chars, a standard multi
>   letter extension name could be an english word (ifencei anyone?) so
>   it's not worth restricting the charset
> - as the above is just convention, don't apply any charset restrictions
>   to reduce future churn
> - vendor ISA extensions begind with _x and have no charset restrictions
> - we don't care about an e extension from an OS pov
> - that attempting to validate the contents of the multiletter extensions
>   with dt-validate beyond the formatting is a futile, massively verbose
>   or unwieldy exercise at best
> 
> The following limitations also apply:
> - multi letter extension ordering is not enforced. dt-schema does not
>   appear to allow for named match groups, so the resulting regex would
>   be even more of a headache
> - ditto for the numbered extensions
> 
> Finally, add me as a maintainer of the binding so that when it breaks
> in the future, I can be held responsible!
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Palmer, feel free to drop the maintainer addition. I just mostly want
> to clean up my own mess on this when they decide to ratify more
> extensions & this comes back up again.
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
