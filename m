Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F9BCCA46D
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 07:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnucNe/ZkuqBSMAVonBUgkDRRqBSI8dGqG7lR8izskY=; b=xNaH6hV8e0f5qN
	dpGDo4sUzwoKWkm/iKn+nbTx7C1W8X54+5SDoq2ztF4+Z/qP2TasfubRdHvtApTH9MVdm+dX8iPHg
	YXHkizWdpTeDMMmR+rAdQe/KY5nT38VRWXtT58lP167NbibHNy0x88niuRf8DtdzTv0xXdtP44Tfw
	3XM8CJAowZeGxQsy5S9zam6Zd3Fo/BWbV2Kq4U5yLbTAucF3LEG6fMd8Nl5ZnKHWGeVyuGj9DzXuB
	gxEk4wXeFb/go2CwwqWCrbvLxE05l/Cug7jjH2thAn3vP91M1DPaJk9ib6fL6HFfBkaH6peLBHLg5
	2pZiFAHIHdnWr5tlCM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHby8-00000002BUb-0Rvr;
	Fri, 16 Oct 2026 07:03:08 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHby3-00000002BTq-1qht
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 07:03:05 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-35d0be18c71so733948eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 00:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134183; x=1792738983; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DITAd8sokIpEZqxKzLD6oRYcPlhY2SkHYx/2OjgX5aU=;
        b=Ngdeo37GwrTiRMRsHb536Uxm7/EOLWFfiz2ukpMRDV8EAp5sdLMWx3+refOPfdbukh
         kb9mfTaA440qIxYoJgaFnkJ0hwvJWU/+IJ057mEFQP708ERTE6LIKUE3UhAa/M+M5K5O
         CCI3otr9DQK8bteXhVB1o1TST+5tTXLgmvJg2XYK2jmySbVh8NL2zsdiX/Tha0TvTjEc
         Y+CbYefI+AkFl2ixL+jmDjAD75nCanXiDXWhdIYBPJg7SMsdoHBISXFVLhVBMyvQdta0
         9wpdocqNJsiYVC07QVp1M2PkBQg1FPdYi+x3js++XUTAt++j3qffo7gZiQ+AwlMP5Iq7
         49ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134183; x=1792738983;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DITAd8sokIpEZqxKzLD6oRYcPlhY2SkHYx/2OjgX5aU=;
        b=VluyXQb89rHLIyqo5Pv6X8XOR3cASh/syMRgWW2Dzd+kM9BASdSGiZzKWGXJS9SAIU
         ysy6Fzcisj5yEm2QHejCmABUBemZg5ajfoeCFiNYHXxBzJVC7o4qgQcRPK8BAmBw5LMC
         0f3ovN/SLnnaR5IJrpcCGRG1pgh4o8GutaOVLEAYlqNskADl6SLRDr/Tbqe0UODHhvgX
         pJE8xJB2QgbaV2OIfnzzWn98Xwg0uqmkdIyd4d+E2MKNOkvHSlo/rbqKJuO8cY3ZxAtI
         k/7JEcw2MpK7QsLPlB92HuybPopyFGrIocrG6s1Kwemz6aHpHIuf+gMpHe0sv7MG30Ok
         gazA==
X-Forwarded-Encrypted: i=1; AKwUvByj6pv1VZWgeL3zgWGD+mwAJdLygfeWYQHF/Kouu9Simexn+DdPNkyiqppbf/OwOUHSLh/gNHweGRUJAQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJtUh/jPuddeIimOva+7E61sY5iNe42s7ZXmqEIYdJOIxqJH2X0
	ZH74OJFZgY9YcaVlczw4i4zCQ+PjMz+PbupVvSfPq30ICrFoeynB1UMO
X-Gm-Gg: AYBFou3dDW6lgK5aukrnPU16yCdvEI77yGLbRICHxdpOPMc2hjKWCi90Ml4kwLUi4nD
	HZYMl/jborJnD8pCZBnMoOCWbrnTN+kEUgoy9WICfLxExgikLcHM4YZr3I5G2XUQGXgQu1ktMoz
	OzXO7CulVVusrQLf5lWnymE9mqjkAUPXaOMuIu02CxhTwXMe0q/PXPYT1XPVUVBIeaV8xTioiP3
	0F8uGD/3meUaqfrTlSWSu9Iv6LZgcWaMKpCE9Xo2onDdm3Bjn+Ebb9sgftW5zDj4SMwj8J9CU8E
	hkJ9Zryw/WG6PB6AmiK8tMaP5eVHxnFtduNh3Y5HdUDnTdcg7WAlmpf/hz23lyGenJggOyok+74
	nUzcz9erE1x6jWwsB+NjjbCP+MHUx60nBYEs1EdxACWprX4hmYR9f8siEijRsAS4bWqx6Oxwg1V
	aoVzUDqzM+ijJX/oxQAWPcorLiflycvL1HbGzKdZXjR5DGbEzcoZ+C85U9iahp/FfqiKxn7d5F9
	+kEasVYjEiHc+mYfn9v6sULrP2OMbPcz8xX1kmfXc33JGU=
X-Received: by 2002:a05:7300:fb17:b0:341:c383:9afb with SMTP id 5a478bee46e88-3602ef82f4emr3051628eec.20.1792134182616;
        Fri, 16 Oct 2026 00:03:02 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm4668641eec.6.2026.10.16.00.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:03:02 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] riscv: traps_misaligned: Avoid redundant unaligned
 access speed probe
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <aa5755142537d462a9e3d2074d82ad4eef6774ba.1780002199.git.namcao@linutronix.de>
References: <cover.1780002199.git.namcao@linutronix.de>
 <aa5755142537d462a9e3d2074d82ad4eef6774ba.1780002199.git.namcao@linutronix.de>
Date: Fri, 16 Oct 2026 00:02:57 -0700
Message-Id: <179213417713.1857356.17322425034198785818.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792134179; l=614;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=l7ixmSx2DBQFSzy/TM6rDTUYrvkCKYbQUoHkCMBcAJM=;
 b=cQTyZ7Ys4LFHfVIZ6SP4v+tT90fnia8py/XU77akat7vRmrGMf2vevh5WFJNvWKEWTuEss4A7
 7SmfXUvRg8bAhVwhLrHj7w68dMvCfg2ieECT+0UndKI7Y64rs6qjwfu
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_000303_485066_81444693 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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

On Thu, 28 May 2026 23:12:31 +0200, Nam Cao <namcao@linutronix.de> wrote:
> When a CPU is taken offline and then is brought back online, unaligned
> access speed probe always runs even though the unaligned access speed is
> already known, wasting CPU cycles.
> 
> This is because when a CPU becomes online, the following happen:
> 
>   1. check_unaligned_access_emulated() is called, which clears
>      misaligned_access_speed if there is no emulation.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
