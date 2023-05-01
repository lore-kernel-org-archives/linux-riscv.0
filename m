Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDAEC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 04:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzWOStSmAngiMrupoW+/nRbqiw1d5zflTWVDOGpxdFI=; b=CeIV6RfAlcS3RO
	fJB0CxdgL/DkqJDiHYDMpgtnfuTUn8UkgYcIM6N23RX5hAG0cL00aAiBHAYUdon+7fXmzENueRfer
	Hje5vEcsneWC6ZOzneRt6IcJJQldDmVOixd/zj6laIgoLzZ65gOsAd4vFG7PPU31vB2cRPQ60AUyE
	u7/VxZ+aluGApRvb2Up3ECnPsP0krXPBWXdsQ50FydNDTQB8Lm+Zzkw7Z0510eEgYXSQqv3HJBI/+
	f31IOw+l9aWV73UlzkN1iCoKe18aKX8DEdX96Kl/10Z3tb7t8weakeWuwyz5zKlU0kJtval79vscm
	7aB09majs+GHKsrnKG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pthoY-0006kt-0L;
	Tue, 02 May 2023 04:40:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pthoV-0006kL-2V
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 04:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X1WHrGanmnNt8uASWew+y3h1eCxRyqChW0U1S7kwZ5s=; b=lbgv6P+ayn3bN0MVI25tIsx+lC
	1Q6Jx4fWIhbm7qz0SSgkc8hTbc4wBlAwS6vv0Y0gUrx0UpAzpAW/sG9iFHRYdFqfEkusXP7OVRTAF
	SxnQ4F7g7oNnz2v4DUF12LOLuabSPs+IkUwvazAkW9eqmwXsAtyHx7fsWvMdWB3FZM9Oq6ZdVv3E+
	+kDyT/CL7JFJB/9JDCtOZFPpS63MxaTCOrKc+watCtYBugDL7mYpHMk9IDupXBg3/bZ6lGC5cW6gL
	TQ3lizXvN6Pz5FrDszXNqm5rtSyFdsSSyPnolC21vAnhHWq3f1PGI359NGbiss5q2cYIYSyJgn29Q
	NFbevr0Q==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptcGT-00F2KM-2a
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 22:45:06 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-51f1b6e8179so2004874a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 15:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682981098; x=1685573098;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1WHrGanmnNt8uASWew+y3h1eCxRyqChW0U1S7kwZ5s=;
        b=11detkrEfL5rr1ljYPAAdxq3BuYmAJjReWFXB17Iyeuzhsehxpr9j6ExMoEw6f6mGz
         VnfYQcKNf05/7Zk+HZ+iKZiZS1aJWirivZ2nGhg7AcP7z9GAttcF8f0eb+YtpUusJUQc
         c2Ez3hS9zZcufRdKKJWy0Q0yXIwhqZPiVW5/qXmBiYDFL7qvYGukmDBmthRY4bpJbFTD
         2ZSRA4t/4vaLRO6RMehiAoUQ6BgOKgIfnAPoM5NTHszy2KbgXuLGXqUkJuNldz7w3ouc
         22HEgPCYMVNKvkopEkXVXVhL6VhjO5eU3iI78v62nocZJhZBytcDUuic4Qan25ZITVYj
         UqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682981098; x=1685573098;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1WHrGanmnNt8uASWew+y3h1eCxRyqChW0U1S7kwZ5s=;
        b=CqfNbNVJPCMkqDv7uMUlaPbBHzt0uq2TIgMCCcK1pTAByqgiPBpVwd9gYHBfo1kOCr
         d2AmmxmfPbJQ4SkFOEQqIyUSNbZmeR8IkD6XJ+KdVE3Sfu3HYejTow33iVOSkWm6Tt2x
         /eWNnxhH571+QL79hvvOKAnenrV5k87Pid+fSKIAiB12rJUB408h0CK6aCVfvennwej7
         E05KVGt4/VQqiHo5YEGImfOlPNtRj1i6gMx17V96Zzw9Pm67zsnpSzz6yMlUG0uoZHbv
         u/xkbXWtfCRohH7ZtwCewy1mkoVJZoONRlF3DUlGhQf1T8ht4uzyphbgY6nHHslyJqxG
         U/1A==
X-Gm-Message-State: AC+VfDwcKQP/9k9B8vgZoYRgcZXKp5T75xlA7G5MW6iRpIwcVzKUiYOj
	R6prr0fIH7c+zRaAdnhHPrarPjubqNjj794E7WU=
X-Google-Smtp-Source: ACHHUZ65+5jmJQGg62lzHtAux5EwaHGRV58fHKk5Z4NvG9vBphpWaVTHw+MJ1oesU3gmRXkqOxrFIQ==
X-Received: by 2002:a17:902:db03:b0:1a6:e1ac:ecb8 with SMTP id m3-20020a170902db0300b001a6e1acecb8mr20638813plx.43.1682981098628;
        Mon, 01 May 2023 15:44:58 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090322c200b001aad714400asm4573023plg.229.2023.05.01.15.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:44:58 -0700 (PDT)
In-Reply-To: <20230426100009.685435-1-suagrfillet@gmail.com>
References: <20230426100009.685435-1-suagrfillet@gmail.com>
Subject: Re: [PATCH -fixes V2] riscv: mm: remove redundant parameter of
 create_fdt_early_page_table
Message-Id: <168298107614.32296.13970329837227173007.b4-ty@rivosinc.com>
Date: Mon, 01 May 2023 15:44:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, alexghiti@rivosinc.com, heiko@sntech.de,
  Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, anshuman.khandual@arm.com, mick@ics.forth.gr,
  samuel@sholland.org, Song Shuai <suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_234502_351610_A020A27F 
X-CRM114-Status: UNSURE (   6.44  )
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


On Wed, 26 Apr 2023 18:00:09 +0800, Song Shuai wrote:
> create_fdt_early_page_table() explicitly uses early_pg_dir for
> 32-bit fdt mapping and the pgdir parameter is redundant here.
> So remove it and its caller.
> 
> 

Applied, thanks!

[1/1] riscv: mm: remove redundant parameter of create_fdt_early_page_table
      https://git.kernel.org/palmer/c/e4ef93edd4e0

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
