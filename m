Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB030EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjiGVHSUDnhK2jh8S0h031DTXmMIBvbq0K5uhRFkm9Y=; b=ALdBY3iIdOrsGn
	3iVfKxa3SCKme3ou/V4IqI3vQVjgoG3ku1HEvWxV/jEJ0eHVFHBgD6Z/qGXhuUqwM4RXgtm4DNhh9
	hQvgVl6woNh/F+U8R1l/LpYLMk9jTbQe4sCsj1XQShhV0g/43HxSFNEaOnU+x9Ij88cFUy8UhiHvF
	kWQf3AOSUSbXI+D/NZ9QUkM0NWf2W+huM8MoV3yKG0ilY3dkZCA12atCVtTWM6cgUQmIuG5dMdBfB
	dfMzlnNRL8SqfNuTbX6sAmyca+8/kwnBm1IBnhFkg8iDOHDEC+G6/3bdzvjgdLNQgYV/UcLNssnoP
	f93zx/9608sMih4T2FzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJXjE-00HMp2-2h;
	Wed, 12 Jul 2023 11:09:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJXjC-00HMoY-19
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 11:09:51 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-666ecf9a081so6026060b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689160188; x=1691752188;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbKFLGGxnO5TsvoMTajzHD0NXptuvXCtrTMuAdwT1mY=;
        b=XXLfuSnhT9hjGYE+SPfEcjSdPv40QUS+tTjfpr6MX/dToYh9QpBQ/kyZv/5PnHxqRG
         AzwfrV87nVqIpApe8T+59F5ngK1reElykSPE0NVp46eTotAVpfcpxnZfGQ8NWjNXVPi1
         No627XMUFrkD0+FBRViBI4zuRa9wOezxXq/qI5EFJgd5LZXuwjWgNjBx4JqoaHvvLIMy
         miVDRnNK4LRl+SmdevpV69x5nGiH7sU9UxlYxaAfIKEkfY3WkmhBpGO4GRSCTwlQhGUA
         EBPEp9+jxMDfmMimgIMUVCQqdDDSA/2Jx9jQhmgEpaIZ7pQXnGh/6aZInncrG32LM+5p
         Yxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689160188; x=1691752188;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbKFLGGxnO5TsvoMTajzHD0NXptuvXCtrTMuAdwT1mY=;
        b=LdYNQRuvw+ImeQ01mMqM/ewTteEX7NUqlLhQXJg0nOz6RFmy+Z5E8v/lCAyzOo1zTl
         GDVJo1d14FGBZMnEzFHXbQ5ftQ+UXluyOoswT8yxsKl9/YTIBXsMAZ9e94MGG/xD+/xc
         HowXxyben8DATrX1fNCzsOU0bRUayAGJbRfM0edwdnBQFHSmfUS0MLVmRBceconi+mQh
         /+WOsGiNc1UEsa+47APthlnuWBXZrpXYzhnkJsN7E2Lr495SpaaekZe5vS1ARAn1qtLM
         Zbhz0m2fF6ndnoBpWLrA6Fid2dUc7mr+6rm5QLtm2UiE9Vmo8IQteZ532H+48v1S320v
         nu/g==
X-Gm-Message-State: ABy/qLYMeKET8STGoahY8yn8VahwzXGSfL+mwNbasY4rNP5dQrbynYqa
	xhBrzv1khLGY3HYIx6nNOGLvYA==
X-Google-Smtp-Source: APBJJlEkj+4MqB2CPiTfqApDhEK6QrNrJLvp3vE6L50wX4eg7NswLMhoNs9Gwav0qsQEF28PHRA1CQ==
X-Received: by 2002:a17:903:11c8:b0:1b8:3601:9bf7 with SMTP id q8-20020a17090311c800b001b836019bf7mr22217656plh.24.1689160187849;
        Wed, 12 Jul 2023 04:09:47 -0700 (PDT)
Received: from hsinchu16 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709027b8f00b001b9df74ba5asm3674375pll.210.2023.07.12.04.09.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 04:09:47 -0700 (PDT)
Date: Wed, 12 Jul 2023 19:09:43 +0800
From: Eric Lin <eric.lin@sifive.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dslin1010@gmail.com,
	Zong Li <zong.li@sifive.com>, vincent.chen@sifive.com,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Message-ID: <20230712110908.GA23216@hsinchu16>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-4-eric.lin@sifive.com>
 <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org>
 <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
 <8c9ed2d4-83ab-ecc0-a300-e6bc8e2047b6@linaro.org>
 <CAPqJEFqhmxksvEgvC61cJcRGR0DrSWDZxJC3J7tdgcG8UY+sFw@mail.gmail.com>
 <f5275617-d68c-c76b-d799-106f67cc2071@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5275617-d68c-c76b-d799-106f67cc2071@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_040950_441215_9EADC012 
X-CRM114-Status: GOOD (  23.14  )
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

On Sat, Jul 01, 2023 at 10:22:25AM +0200, Krzysztof Kozlowski wrote:
> On 28/06/2023 18:31, Eric Lin wrote:
> 
> >>>>
> >>>>> +      - enum:
> >>>>> +          - sifive,pL2Cache0
> >>>>> +          - sifive,pL2Cache1
> >>>>
> >>>> What is "0" and "1" here? What do these compatibles represent? Why they
> >>>> do not have any SoC related part?
> >>>
> >>> The pL2Cache1 has minor changes in hardware, but it can use the same
> >>> pl2 cache driver.
> >>
> >> Then why aren't they compatible?
> >>
> > 
> > The pL2Cache1 has removed some unused bits in the register compared to
> > pl2Cache0.
> > From the hardware perspective, they are not compatible but they can
> > share the same pl2 cache driver in software.
> 
> So they are compatible... If they were not compatible, you wouldn't be
> able to use the same match in the driver.
> 
> > Thus, we would like to keep both. It would be great if you can provide
> > some suggestions. Thanks.
> 
> I propose to make them compatible, like every other piece of SoC. I
> don't see any benefit of having them separate.
> 

Hi Krzysztof,

Sorry for the late reply.
The pl2 cache is our internal platform IP and is not part of any SoC. 

The reason why this driver is compatible with the hardware "pl2cache0" and hardware "pl2cache1"
is that it doesn't program the different parts of the config register
However, our internal software (e.g., bare-metal software) will program these different parts,
so it needs to rely on the different compatible string to identify the hardware.
  
Additionally, we would like the compatible strings to reflect which hardware is being used Thanks.

Best regards,
Eric Lin

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
