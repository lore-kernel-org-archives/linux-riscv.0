Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D70C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 23:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+TFhVuBIUSbFQ5vMasCbnBtpqgrqTVHMoP6sE1DMvo=; b=tgV2/OhWwhPsYt
	cIlkepYZmhpjDreG9/Q2dpabB0c68dtENlQRqg5R1DrD8gIRhGRgV1M4KKJaseLrd56WyiX5OmQ/x
	Ka3j6VL9DTBbxZr6RMEWO3uOxiKK/nUUVPlvGWdIbH8wf44FHigoFikMauwfhIAQh+Hbf9Lu6Leb0
	UMocJMFAS94hYj9bKYv0PWBgrX6R86YNVRW0dcMHa/j8KIse0y80YQK8vtPlQAPrYUTQbzhT2Lmiv
	mWLq6ivw4WQh5F9N/claqdApW9rmrOLsxoAlCE3rsE9wo/92lPhMwDXIZDezp2EEXqO/07tIjewLN
	+zfga/FhMMHa/XVMyvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oikmD-009eof-Ry; Wed, 12 Oct 2022 23:04:38 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oikm9-009eng-8D
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 23:04:35 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 70so371091pjo.4
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 16:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+CYJzVycaEsFkGCt88IczHMehAb1ARiy1GxzzsLTM/U=;
        b=3tT6zkHxVOiIBOTcABQ0KgziaY4/aNbNYBvxsfDt2lWWiOlzVRD9iT4ZqVJudvhmgZ
         vSocne1MV7a6HWjsgMM5Es/LWqr4XMdQcD0guLs+hP9ay4ib29kon5I8Ya3/1uRDuMG6
         aW/oJpMbs2gP6Q9WNGTUem4QtIJVotpcaHaiAyWgJxjIjld6UjepQfIFtig4V/FqfyCV
         +2umjzMA+zKuKnalFqaFdkYqpCv7F+pCRPFEuQxoj+RgCUcyxHutPzCYzXPhz7HGQG19
         HBPlg65ORUOVpsibqEp7ZgNnJ2vis7NW7bm96FybUptdoQpHt6ZZWIfdkkF2Jcu1CfEa
         nHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CYJzVycaEsFkGCt88IczHMehAb1ARiy1GxzzsLTM/U=;
        b=TkTPHw7jjEeM2jtjXgjka5U9vOvVzFxejkKZ1dD7ZcLnBBBTxJaxeeNUnKchXQqe8m
         mAUL+GG1pdUCJJyXchse5dB7V9LCqlxsPRUzU1iU6tZ/d5Ser/iMZzwfjJsgjn7cakgY
         hCfsR0FQinMlUIgFTVwLJhhk3NntM5m7mNYRkm9u4FIPI4SrpsWV4pSDpGlvQv9PQe9W
         7XSq/1B0xajc5KPsZHWEDeh/YRBms7cVtSAniDMI5yBZz2QBMamWgoo7a8zuSU+1iKoe
         /f/edKTg+idfcHlsLkajZYHyg/T6nca71TQiTvwgeBJQiBYN8mZ31bUrncBrAuoUJ8Pv
         VcJA==
X-Gm-Message-State: ACrzQf0FgibpN3pTsm1YXmu5EDfQPpyFvSwlmvp6VqSGJR6Wc/WRkSxM
	MqYWxZC+z37lcQVeJ7HFaYJRjCoZU6fpnQ==
X-Google-Smtp-Source: AMsMyM59R+9C2F/d6DBkh8ADw7t46I3Jc99Mv7fs7oWjYLQBWaGcbIsu0LeZevJ2a91Q3q+11TodWA==
X-Received: by 2002:a17:90a:72c4:b0:20d:51af:3fc4 with SMTP id l4-20020a17090a72c400b0020d51af3fc4mr7848905pjk.38.1665615868733;
        Wed, 12 Oct 2022 16:04:28 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090264cf00b0017b224969d6sm11118671pli.76.2022.10.12.16.04.27
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 16:04:28 -0700 (PDT)
Date: Wed, 12 Oct 2022 16:04:28 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Oct 2022 15:54:52 PDT (-0700)
Subject: I'm using b4 now
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-2f315bd7-91f3-471c-a715-c9a8c62c9b57@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_160433_494480_F5C6C028 
X-CRM114-Status: GOOD (  10.71  )
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

I figured if we're changing workflows to include patchwork, I might as 
well get with the flow and start using b4 as well.  It's super nice like 
everyone says it is.  I think I've got it working to the point where it's 
better than my old flow already so I'm going to run with it, but there 
might be some rough edges for a little while.

I've kind of just picked some arbitrary settings and it's in the middle 
of a mess of scripts, so if anyone sees anything weird then just point 
it out as it's likely just a mistake on my end.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
