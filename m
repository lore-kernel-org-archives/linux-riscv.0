Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C20C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZSOoCCLkPxDZVPi/mIlKBQRfkhKV79oZqWesdZirO0=; b=FCz5AeES+NQnPF
	110ifSlGU1Zt5n9Go6Hveed+tvksGXw0+l9w+r+c/D6KsUsx2cmvVWn2LfxhEYJLsSTZezELRblxB
	ytwB8yVsh7pZshTCPDdLPQn97ec7KJllw+hs7c8v2bK4DLGjZRVg13AoF3duRrc0glx7NeAPDfyC3
	G2OjejABfoa4w7OG51u/5dSaQ7JcsIjZWWfGeIDF2PPmiaeEooshIopOoa0MCBVrHezKuZU+WsmyF
	zE+bRieqcsEYqV5tq2osMBP3oeCPt2duBYlIDz4hKOfhniANUMNLMImHQt3qVVHOH8UHcfJu+oh5w
	I+IyiT4c/k/frQfttVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhhP-007oaU-Ae; Wed, 25 Jan 2023 15:28:31 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhhD-007oYG-KA; Wed, 25 Jan 2023 15:28:21 +0000
Received: by mail-vk1-f179.google.com with SMTP id c21so9364932vkn.10;
        Wed, 25 Jan 2023 07:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoOZ7GrVDWL5GTrsJaPsMKv/w6eYLsmHBJwN603oceU=;
        b=yfSX30vo/lqXh3hfTkurrTBD9xIPgcW1NZmwcoISdUfXsbTs9wAzyZEJ3jxbZ97WEy
         BFFrARNPVw3cGIHg01rxh5Y/UOMAel8sU6tFHb/ZAV0Pyp/NCz9ScgtnuXomYn0pqIHN
         o+Ibq6yLyWNaO7ZTaLK+t1jktFPB7Phm2fzyGy05282CQw/CNfBKOil3Hl2FhRxEtnbZ
         2r6u/nDKN+V3DO75H8zfcC2LYSAvx+lYRixTDva3li1lSqeXIIsXkmEsz0QOuhZR5Sou
         2LoqNwrfmaUccH6Q3a9kD1E9vxFuavBc4F343RwtO5huc4vLtJiPiTYxQ15kq3MfKtvP
         mj6A==
X-Gm-Message-State: AFqh2koN9dtNLJIWqlMJGFHj7xm8HK6tvYpQO4MjsN0/enbJo8t94rOP
	mgUGJGdi5ns/bkZIBEN98iZsCtbCdVSfxQ==
X-Google-Smtp-Source: AMrXdXtmzfBqVpt2x7+qUPfjJEI6426jcF6JBGlMmoYC9PNLzC+id8KWXasW9aJknryPsXZCIILtbQ==
X-Received: by 2002:a05:6122:2086:b0:3dd:f28e:ca49 with SMTP id i6-20020a056122208600b003ddf28eca49mr25064351vkd.7.1674660497196;
        Wed, 25 Jan 2023 07:28:17 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id x14-20020a05620a01ee00b006fa9d101775sm3667075qkn.33.2023.01.25.07.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 07:28:16 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 123so23420770ybv.6;
        Wed, 25 Jan 2023 07:28:16 -0800 (PST)
X-Received: by 2002:a25:e650:0:b0:80b:8b72:39fc with SMTP id
 d77-20020a25e650000000b0080b8b7239fcmr400699ybh.202.1674660495879; Wed, 25
 Jan 2023 07:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <20230104183033.755668-7-pierre.gondois@arm.com> <CAMuHMdUjgxgOXf5He1x=PLn7MQTjZgFQUHj8JrwbyweT4uOALQ@mail.gmail.com>
 <20230124140420.4srnufcvamvff77v@bogus> <Y8/tl999NQwbPL/R@wendy>
 <20230124144839.2szjjv256j3pdaif@bogus> <20230124145541.2xwtr7ro2bjnsjd7@bogus>
 <20230125145423.pid3hsstswzuez73@bogus>
In-Reply-To: <20230125145423.pid3hsstswzuez73@bogus>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jan 2023 16:28:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZ+_kdMp+0VfYAJZRHBWiyobQQJwEM_kHN6yeVVGxSvg@mail.gmail.com>
Message-ID: <CAMuHMdWZ+_kdMp+0VfYAJZRHBWiyobQQJwEM_kHN6yeVVGxSvg@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] arch_topology: Build cacheinfo from primary CPU
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Pierre Gondois <pierre.gondois@arm.com>, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gavin Shan <gshan@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_072819_675061_3840E7CF 
X-CRM114-Status: GOOD (  21.98  )
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

Hi Sudeep,

On Wed, Jan 25, 2023 at 3:54 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Tue, Jan 24, 2023 at 02:55:41PM +0000, Sudeep Holla wrote:
> > Geert, can you please try with the patch Conor pointed out and see if
> > that helps to fix the allocation failures[1]
> >
>
> Sorry for the nag, but did you get the chance to test -next with [1]
> and see if it fixes the cacheinfo memory failure you were observing ?

> [1] https://lore.kernel.org/all/20230103035316.3841303-1-leyfoon.tan@starfivetech.com/

After applying that patch, the issue is gone.
Thanks, sending my Tb!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
