Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53694C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=l8gPQGJxTQ7DP5XytNMIMvHQgn+We309qzI4fUXnY/Y=; b=QlNT2b4UCOGBQ3aFz73XiNAUax
	RcUYu+Q3/Y339PXolFGTgTWJjnT5XmCEF+3VGARtZHSclNw+lJCOatx10oESu92SMTE0pFbku06/y
	QhxQdoZR9R0DR6yu7FgOvruyrD9PPWkCNNFqGqmrcyxbx13X+MgSULGJVByhcqd8S1rG77o7KHxyt
	Z9ssgAdkX43FgMMW2ILJFKOWRZWq5rspjtQzeZpW2IBQMcNGu8uMdXcNMMsygMjpwLTISZXCYTZlF
	VJ9Fmdoo54lBs31e3P7p/EXWWxzB3DyfSRNiA9tENYbDkyUQUuFjtiRUvc/0/M1ZJlU9+BkdsdPG3
	mHHijDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk32V-000000066Jc-0KB3;
	Tue, 12 Mar 2024 14:23:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk32R-000000066Hx-0Y0d
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 14:23:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dd97fd66cdso18192185ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1710253409; x=1710858209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ixjDXdUDhwXI0JLFZkupTe/KFpB3Bws3seOjqAl5dc=;
        b=Nplh8swK6lxKJw1ev3UpQg0vIAg+i75kJ2CvnyzUXLMwUQdQGCPOdHxj9W6HRLOU7x
         soZZHNDINiYutdMiNrHHCRP688wpwsezqnJDDPeigfEW/NySJjNK5MFwyLZiU+QQWGNw
         ed+iHs1sC9bg42CkP/HWuWbI+twAPdNdzcdjNWZSGVtPo21wdC37xWvDfyL6rFlOGdKE
         KJoIF7fQS35e8FBU2ordduCjGcPfzimT5zgIu5Qa3/dsGVvBfM4RNOWpJF+6CSazlOsE
         lUBAxwzcWjeVtB37GA6Fv+cr35DegFs4vH5w4INTSHFexxcEQZ5YcVWApgoGQlvJkBGJ
         2Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710253409; x=1710858209;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ixjDXdUDhwXI0JLFZkupTe/KFpB3Bws3seOjqAl5dc=;
        b=OgjYuy/z4po4MvOcRd+Q+XT7JJenUcZfT+o05skeFhGa7Y3Ic5AjHnpG5fBXwnEGLZ
         vTbToCdpgFcfvuz3SUK1OH1/oM1p7A6wH4+Hr8h4ymKjaPm5etyB/Tvzb9vvCBJoU32n
         Sr9Vqfvrf9PoljKobVN26pktsr3O8uy190WtUOKC759VXveXhOp7aUBznDL+hvrzYFxq
         2lMeo+S6DLmsJ2JofDGC2lMl8XKKxHX/+GhFdn8uip4A6N/4QU3ySEgfrjjGnbY9CJHK
         um/aGm0R/eRXfzt9Lsku9TDmswdMwQaHeXTnrcXDHP6zzBQuWc+AVF3Fk3tQ0j8lmhzA
         klqg==
X-Forwarded-Encrypted: i=1; AJvYcCUsrVTUROFKai9iOpz0XVp05hH7z0Bl+gkPfFojtEH6HGRp4OpibtNzx0UzDK/WgtOjAgFjj1nG8zPVvXUvDoXUTS5hyQSyoCYoI11sX6ts
X-Gm-Message-State: AOJu0YytsOAa8XYe9cbbDGRSW6g40ofkIzI5HVTvjdcG/7hwout/EA2D
	eTmnI6uEejxyzc8YeMbFGOa64sEk8uulKZvyW+CRk/LUICtadur9QNcyI2zyR4M=
X-Google-Smtp-Source: AGHT+IF5Tdh4z8JQsHyW1PPsqQuYiflOdAu+RNp46pn6g+B0xVaFC5Y6Ggu7odCPQpbbShIDcpWR1Q==
X-Received: by 2002:a17:902:e74a:b0:1dd:a134:5680 with SMTP id p10-20020a170902e74a00b001dda1345680mr6869873plf.69.1710253408730;
        Tue, 12 Mar 2024 07:23:28 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id jy8-20020a17090342c800b001dd5806eff3sm6836433plb.306.2024.03.12.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 07:23:28 -0700 (PDT)
Date: Tue, 12 Mar 2024 07:23:28 -0700 (PDT)
X-Google-Original-Date: Tue, 12 Mar 2024 07:23:26 PDT (-0700)
Subject: Re: [PATCH v9 03/10] irqchip/riscv-intc: Introduce Andes hart-level interrupt controller
In-Reply-To: <871q93eehn.ffs@tglx>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tglx@linutronix.de
Message-ID: <mhng-d47edbdb-0a36-4adb-9575-8af094d80e5e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_072331_397325_040F621F 
X-CRM114-Status: GOOD (  16.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, irogers@google.com, Heiko Stuebner <heiko@sntech.de>, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, peterlin@andestech.com, samuel@sholland.org, anup@brainfault.org, unicorn_wang@outlook.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, randolph@andestech.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, jszhang@kernel.org, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, Conor Dooley <conor@kernel.org>, linux-perf-users@vger.kernel.org, Evan Green <evan@rivosinc.com>, inochiama@outlook.com, jolsa@kernel.org, wefu@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 23 Feb 2024 01:06:44 PST (-0800), tglx@linutronix.de wrote:
> On Fri, Feb 23 2024 at 09:54, Thomas Gleixner wrote:
>> On Fri, Feb 23 2024 at 09:49, Thomas Gleixner wrote:
>>> On Thu, Feb 22 2024 at 22:36, Thomas Gleixner wrote:
>>>> Palmer, feel free to take this through the riscv tree. I have no other
>>>> changes pending against that driver.
>>>
>>> Aargh. Spoken too early. This conflicts with Anups AIA series.
>>>
>>>   https://lore.kernel.org/all/20240222094006.1030709-1-apatel@ventanamicro.com
>>>
>>> So I rather take the pile through my tree and deal with the conflicts
>>> localy than inflicting it on next.
>>
>>> Palmer?
>>
>> Nah. I just apply the two intc patches localy and give you a tag to pull
>> from so we carry both the same commits. Then I can deal with the
>> conflicts on my side trivially.
>
> Here you go:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-for-riscv-02-23-24
>
> Contains:
>
>   f4cc33e78ba8 ("irqchip/riscv-intc: Introduce Andes hart-level interrupt controller")
>   96303bcb401c ("irqchip/riscv-intc: Allow large non-standard interrupt number")
>
> on top of v6.8-rc1

Sorry I missed this.  I just merged this into my testing tree, it might 
take a bit to show up because I've managed to break my VPN so I can't 
poke the tester box right now...

>
> Thanks,
>
>         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
