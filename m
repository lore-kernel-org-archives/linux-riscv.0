Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0423EB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=i1XLmA+ydCdqUS2jTm64uW660HXFarC2Jtk860hOmtk=; b=Z4cXA06PzVKgsZfoxI6SEir8Cr
	25OKhFT9pp16RqaigPVE5JvFE2lAucnnr2uI088mb/J00S/aAl8USPYCGgHe4pamPkbN7Ruta3RM6
	hRt6uHD+e6qsN7IC8lUTTd1UJJbZWoKf3Ff/pIdk4NDSWKgr23VW8NPYSqQPc5L780ZMZGtueQmDh
	iJFtf35o+3UBzXkZb9LYwOjpZDNlnx+DEOOXc/3inwfwcmvqlFqnuvQS8zUSMmhtr/u28FWA2KrRC
	g4XAnDPNGJgLchmE7RJAxQhSVGI7/OHAIsX3NbAG5HqYY81tO316Dg3cE9Y5wrEodq3qiqxpqt5ZU
	kJLiImFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCP3F-001Rx9-38;
	Thu, 22 Jun 2023 18:29:01 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCP3C-001Rve-2G
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 18:29:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-25ecfb3947eso4517554a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687458537; x=1690050537;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5pPpV6BAFD4TLifWvN0B+3IxsV4SDIF9ZR1S6R6SGE=;
        b=GOmTF2DlxvZqeQDfyI78OemXdjjQfH9Ilk9xRzUi71d/sCw8jLLoug968FmGh07Ltx
         Voh/jniYcRHtU/7LyIhjU1V1X4YWiQz0OqrC5aIc/dKhqPgwJ1vaLFE3QAnNTNYw3VQk
         3tGIHx5hG/BYPINBwTJzR12n3lGUp9YGUVcAonaJQU3U4pY+jR5JxMyaUBZ1x9BTcbvY
         Ib8sSgWv8cthmnaxHu00qSv3/+tH4Ld22o5PXyhysImm9YYTypP5+MWkPF7RHNU3Q6dG
         gfpN96h5zSZ1LPtCCfSKCNarzZFLbG7QmKt2/sXmxh8r5pyFWXqngliQqYEP37v60cmh
         p8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687458537; x=1690050537;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5pPpV6BAFD4TLifWvN0B+3IxsV4SDIF9ZR1S6R6SGE=;
        b=LXUgx/VDJx9TOSVrGHudtD11qH+W0Knc7J78kTG2IOHe/SxfFJh20lkTXYRCPgewUR
         258Ywo2otfCGdz4wC8l3ssP13PIRyjwbJeUOsiyvr44drHsOcLHEjB+NFsptJyG7rCAS
         y88oJj+4jZsklrGi+nUkGw2B79+TDNdq4XzVe+DKbHy47AMxp1VJhDSutRV7TscbRNzN
         gaBVPL2NPdrJeu2rr0Zv3/ymwijNKmhmHT1dpUsTFHpX/nOAP/5toIxWrKqMGrsrAAKb
         lIcGuO3aoALQx0wIY8uK33oWUN7kWeUBYrkqOYiAVHnEAXWJ3ignvyemWc1/a5HFq/be
         M+4g==
X-Gm-Message-State: AC+VfDy/Z2IJI/TtQLByVAS0hIPmtK9r7TfGJwaN05JpoZa/AaonI0My
	SRMAbh7Ix2YC2JtawzbYTOdPlw==
X-Google-Smtp-Source: ACHHUZ4oQkDG7Am9kGaWj5ODKkVsXUlKPHI5unROmVOojf7emxVsqdA3Lmr2qF5VVkxWA5ukDwCMug==
X-Received: by 2002:a17:902:c94d:b0:1b6:b73a:553d with SMTP id i13-20020a170902c94d00b001b6b73a553dmr1272775pla.58.1687458537333;
        Thu, 22 Jun 2023 11:28:57 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001a69c1c78e7sm5713586plb.71.2023.06.22.11.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 11:28:56 -0700 (PDT)
Date: Thu, 22 Jun 2023 11:28:56 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 11:27:05 PDT (-0700)
Subject: Re: (subset) [PATCH V2 0/4] Remove WARN_ON in save_processor_state
In-Reply-To: <168736259084.605458.4732376069158804322.b4-ty@arm.com>
CC: Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, chris@zankel.net, jcmvbkbc@gmail.com, steven.price@arm.com,
  vincenzo.frascino@arm.com, leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com,
  jeeheng.sia@starfivetech.com, Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
  songshuaishuai@tinylab.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <mhng-d670ba57-2c68-4d38-8ad9-795f8ca3b69d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_112858_744720_78342BDE 
X-CRM114-Status: GOOD (  15.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 21 Jun 2023 08:51:43 PDT (-0700), Catalin Marinas wrote:
> On Fri, 09 Jun 2023 15:50:45 +0800, Song Shuai wrote:
>> During hibernation or restoration, freeze_secondary_cpus
>> checks num_online_cpus via BUG_ON, and the subsequent
>> save_processor_state also does the checking with WARN_ON.
>>
>> In the case of CONFIG_PM_SLEEP_SMP=n, freeze_secondary_cpus
>> is not defined, but the sole possible condition to disable
>> CONFIG_PM_SLEEP_SMP is !SMP where num_online_cpus is always 1.
>> We also don't have to check it in save_processor_state.
>>
>> [...]
>
> Applied to arm64 (for-next/misc), thanks!
>
> I couldn't tell whether this series would go in as a whole but given
> that the patches are independent, I picked up the arm64 one.
>
> [2/4] arm64: hibernate: remove WARN_ON in save_processor_state
>       https://git.kernel.org/arm64/c/615af0021a61

I was pretty much in the same spot until I saw this, so I'm picking the 
RISC-V bit and just ignoring the rest.  It's testing so it might take a bit to
land in linux-next, but seems pretty safe.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
