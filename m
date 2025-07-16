Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59F0C83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NuF7xcG1vLh9NTkNjYfruitSPstBN7zkUTXyFXKoR8k=; b=0hpJr4HxZ7YlQMl2cqToxI4636
	eCk/1htZeVV1XzLKHYv0Xh8VkYiM1KERimaL/WeRbyBv8cdqgC60AushKDeN7QAPelI0GBB3dIzGA
	0aVmJeLMAZaeuDrixabSA7S90lUapohblzSQQ5moeJdMndPNFdNErQ64y3+UbMFreiPJxMCc6K7Se
	LUswqLvsyGsk+QzNJl04vSJHYJMUS1FsSHOZpdBiHKuqIGzKgYixKBbt2oFCx7CLS1Bmir2nXcvGG
	/jAY8A+IRpwsJWjpnatrPRHGbMqYuJIiN5baoUHOLkWXPBVD8zyx+iaBMSTD3mWfD9Fk8qTDaTgoT
	88QTIxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4ew-000000088w7-2zpZ;
	Wed, 16 Jul 2025 16:07:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4eu-000000088vW-3dxs
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 16:07:06 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-237311f5a54so58785275ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1752682022; x=1753286822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+XCvO0u3cHuFAFfq6wKl1phJJacAwKdgv41YK28DDc=;
        b=3fbRY5UakHjaGd0e07PNsFpKc/+EdcDFJprYh4HJcKPn4V4VlgFzSOXdxyELjRP4+H
         sl0DCPZ0bB5j2neFXNYZTdAXcn9ED2Vkl3BDphEd76c02scze5E6S191nXwSWyj9YuCL
         pu/t5iO1QwGAkpOSYSR5uWguuZBtPAktWi+p/EuDk2Q7SAlsFD3uezozYUZvCCqDZeD1
         wLupfgTd2vaSV4Pn1S46T8SILBCXYJsca1zDCjJwtYTGIRnsW4Yr7TsFi7YtCdeFLp18
         zl8ZvpgvJ/OUxBBVkMJwh2fBjuol/MEw18F8AsKhpYaGggj03Il+dh5n9GyZcpGHCEMm
         WBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752682022; x=1753286822;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+XCvO0u3cHuFAFfq6wKl1phJJacAwKdgv41YK28DDc=;
        b=ruoA/bN4LIpxyuhsRKEY0lNxIXcTlLDHXrAR+kdPiNgPtQQxuJG/o61T16XpoFlqVA
         7/OM7rRPgkfVLvwUGfAsCr4+O0UNeJs4v/NQ/qFn2yoJqsU32yg5ZMgfKe7lykXfmQCh
         S7XF7pHbQol4WJQzoFHmS5KgM/P0dFXSLxivqDFnlZLCoj5uxskw+zww54AF9DJYiW50
         cJcZoJqw/1S0YQ7cmDii7x21ViIAoOPVqCAUyrcm/TCTpG7IKyy7iF7SzE44w3BuFPV6
         RBGvZ9QHgAMcyPKa4OxeWzVhVbJP68sn9i8HXWwbzGAqSa++itpFX6p9sj0uFSHWUq0c
         7Nnw==
X-Gm-Message-State: AOJu0Yygk6aN+pkvLi3Vy5DHzwXShiohR1LAvGOM4s1Oo1VNykOf7P5O
	EiNGfUL74T1SbVUY7vLxco5irijF4hDbDylIg6tGh+clRdamVbx2pSquKvNJqXy/uSmFR4glT8w
	WhJadea8=
X-Gm-Gg: ASbGnctJ6iUeXt9N18VmrtxkH1iITMUrTzE75ccRA7WBEtsOVg9O5FfrHEG9MPuCCrl
	0o8VsAXiab2ZVvMrqElXtEUilfNdKvLZ5UPehr760D+lSydSAHpQhZSk/INzq5+7tA86Bhuie9X
	7fBev0KN8FN9QBYSCxxDwnYjBlYKkFTG0zLJ3jtJ3+dlDiXA7cY+vMDcPIjrFgO08T2DwIGGN5j
	2lViBvs7mluQb88sGMn10vk7Gq4byXc+Wpew19p1DXd7wHSpYQnJEULwudxTzKMIbGFGU0YJszP
	q3aOC4Yi6Z24/vglTApZoMmO/U0lasU+D2QWukyRbV/oLlhpiKl44aCXdoMd3EeLIawHSYyxf6H
	qDdnc5FRVdAApFqeCoPWa
X-Google-Smtp-Source: AGHT+IGg7Xm2u9sipO24qbEfSD58B7twW2fHnVayXVhctjlQlOHobMbfXjG6V2yacM2xTz7oQV1O8g==
X-Received: by 2002:a17:902:f644:b0:235:f298:cbbd with SMTP id d9443c01a7336-23e256b84a3mr45624945ad.21.1752682022373;
        Wed, 16 Jul 2025 09:07:02 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:b02a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de4285a22sm127660425ad.22.2025.07.16.09.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 09:07:01 -0700 (PDT)
Date: Wed, 16 Jul 2025 09:07:01 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Jul 2025 09:06:54 PDT (-0700)
Subject: Re: [PATCH] riscv: traps_misaligned: properly sign extend value in misaligned load handler
In-Reply-To: <mvmikk0goil.fsf@suse.de>
CC: linux-riscv@lists.infradead.org, damien.lemoal@wdc.com, anup@brainfault.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-6AB327E0-0510-479D-86C1-C68399F1C62F@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_090704_904877_13D83E0F 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, 10 Jul 2025 06:32:18 PDT (-0700), schwab@suse.de wrote:
> Add missing cast to signed long.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 93043924fe6c..f760e4fcc052 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -461,7 +461,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>  	}
>
>  	if (!fp)
> -		SET_RD(insn, regs, val.data_ulong << shift >> shift);
> +		SET_RD(insn, regs, (long)(val.data_ulong << shift) >> shift);

Thanks.  I ran into another assembly sign extension issue recently, I 
think we need to scrub through the port for these...

>  	else if (len == 8)
>  		set_f64_rd(insn, regs, val.data_u64);
>  	else

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
