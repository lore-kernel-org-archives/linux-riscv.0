Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E49CE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=drIHyLQQCy0Wn6+S/aFzc0XIBGkMa9UZjamifPSk4Yk=; b=WYWB1Jgq53T9wJ/RebukjuOPun
	V9OOjYNpWYeYpaG42pClXjmQ7Oz71Vgtzl5UJ95UaO+M40PVvffhWFNB/um+rSyX4zo/LTHgaCJR8
	k556rzvsRJzFiEvdPpkuqYh5/A7dEKOmGS+8WptVFnY4C1GHhLLggXhhvieImC4FAfNsohmG3Jemo
	RCSh40dyB/9QXm9TFGDLuaD7Zl2YRur/t++ZOHnCrmlVg8WPGavLzmFZx/0IHJAiVI3fy1Ti6Dk+V
	W2h/YjSZGObtismS3afLZinhXYBllk55n8Cds3vGULTaYWZNBYN536Pi3XSvcLkwZS1U1vqzGG+R9
	L+wsOHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qitse-002ViN-2c;
	Wed, 20 Sep 2023 09:52:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qitsb-002Vgi-1N
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 09:52:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c46b30a1ceso31819865ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695203527; x=1695808327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAjfxMNySxbXYDqqkQfkESLiAhRgg9f8YsCkiLb1kdA=;
        b=iwaLDsHrasiSAh0Hds/LuO8G52lTaSyoiqugsz1rJRqG01Z9l2Gjp747TZr5uh/07e
         SvxUVLI/vnFMcxGooU73cwVfkYnpWV9KImcfYb3TQrvzgjhz6+N63BMl9Fw6fkufZuCH
         0zlyCbjZg1EAE0gS1nr43YdqpA0no0BXJXKNw9MyU7zb36K7CXLyi7eoASISJqbZ7DfI
         Pu+lZcS4Xseru/X88GYoRDSJVKS7XBLH5mdBrIcF273mo3BzZHpDJ2p+iQUJvcmI2cFC
         KYSGtRm5SOhY0Vomsq2ftWXav5Wl0hIKZkAlzTulZAi3IiuwaUcmoLRRPKS+IjMddKm3
         MMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695203527; x=1695808327;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAjfxMNySxbXYDqqkQfkESLiAhRgg9f8YsCkiLb1kdA=;
        b=a8nDHyH35aC1vHMWHQiHnFIq87aMRJq5DOFMSV4sadtpyiOBj9Rb6wp6++/qvcjs5L
         Dqg5KdZP/A1lniGVQgf9zX2UaaU8+4YTdl1kDAIrqVy3vywC2m3UqHW2NjAYgz22W2tI
         WlTucBy3r9TTKpPXGcnPi5z6nlyuyU6/H3ebMvyYvhQC+D6nolh+/VaFWOIF0BlthzkT
         6PnDlPsstqiJllRxhnfee5QfHMzGTSbitiV0MYvc4RHMw79Mhu1gFT056TtgN6cu1t3P
         k887Y4h2lg6+DcnEJtJG5Q9IqMZ1CNF/ZQ5O2k7j7Ka/eyRp7ZZJxhYvIgGbn9ES9W3M
         DhLw==
X-Gm-Message-State: AOJu0YwgX90ht2vl2nLFJWi/a/R12EjaPh6DKcMtFWpqQPmi4eq+d8Jb
	eV140IaTDztmZ+3nsLXBUh//MQ==
X-Google-Smtp-Source: AGHT+IHdJ1h7Sz+AyI8DIB8o6cx1e67gDn44+qaRKDID9SW26w9vpf8dlDGScNFprNERzF01ovO2Cg==
X-Received: by 2002:a17:903:124d:b0:1bb:9c45:130f with SMTP id u13-20020a170903124d00b001bb9c45130fmr2077240plh.69.1695203527161;
        Wed, 20 Sep 2023 02:52:07 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id jg12-20020a17090326cc00b001b05e96d859sm1532139plb.135.2023.09.20.02.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 02:52:06 -0700 (PDT)
Date: Wed, 20 Sep 2023 02:52:06 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Sep 2023 02:51:50 PDT (-0700)
Subject: Re: [PATCH -fixes] riscv: Remove duplicate objcopy flag
In-Reply-To: <20230914091334.1458542-1-songshuaishuai@tinylab.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  anup@brainfault.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  songshuaishuai@tinylab.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: songshuaishuai@tinylab.org
Message-ID: <mhng-8cabcad9-a181-4db8-904b-3f7daa7621f1@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_025221_483384_8C64AA7F 
X-CRM114-Status: GOOD (  18.44  )
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

On Thu, 14 Sep 2023 02:13:34 PDT (-0700), songshuaishuai@tinylab.org wrote:
> There are two duplicate `-O binary` flags when objcopying from vmlinux
> to Image/xipImage.
>
> RISC-V set `-O binary` flag in both OBJCOPYFLAGS in the top-level riscv
> Makefile and OBJCOPYFLAGS_* in the boot/Makefile, and the objcopy cmd
> in Kbuild would join them together.
>
> The `-O binary` flag is only needed for objcopying Image, so remove the
> OBJCOPYFLAGS in the top-level riscv Makefile.
>
> Fixes: c0fbcd991860 ("RISC-V: Build flat and compressed kernel images")
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
>  arch/riscv/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 1329e060c548..b43a6bb7e4dc 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -6,7 +6,6 @@
>  # for more details.
>  #
>
> -OBJCOPYFLAGS    := -O binary
>  LDFLAGS_vmlinux := -z norelro
>  ifeq ($(CONFIG_RELOCATABLE),y)
>  	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext --emit-relocs

Does this result in any incorrect behavior?  It looks fine to me, but if 
there's no regression I'll put in on -next instead of -fixes.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
