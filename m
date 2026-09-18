Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F93EC982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PWa/kODD9aF/khqXa5p8oFypv9eaxQj0ZAuBltfVWg=; b=kvgTSCg+Us8/Wr
	qSKKZXIoif93UjN37FsOX1x6DZoKVxrEM/HlmyuRGLipRtMx6KKvl+FiMvdKhDbSFDImzbt9WoWH1
	sLpgVxwyF7MoCeM4xovnDjkiCXM0oN6uQdS1qpI1lZVE3nyPdxLx0UKmOKmirZ+xbWkaSc7js+Jb8
	Xb3Ne70hLlrpsLKuJj/BK8c/Zdqn/+K1ms122GLPDpRW86DsKG1AYWYkrXykopfVjIb55sz2iSs0l
	ke7jzkiypv32aqhBjYzOzKTLOz3mwoiOOuinE0q3vROeBrcR5ZxCIQoa3MaLKivkycd9kQXqFJVVH
	3k/fiBfGsCL+ZEkP7UmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cZs-0000000FCxB-1V7E;
	Fri, 18 Sep 2026 17:40:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cZp-0000000FCwX-2KT0
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 17:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789753242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtUsYSimD6K1xLItLoYKB1WWd1TCjyyOy2jIzUuov2s=;
	b=KuBMhv5UoWq/btEbzcpWvOCJ0J2G4jTk5YVFWjH2n0V41WAP2ce4T9FWmifKoi9BwpxQoe
	c0SHrASpCHAAKG6ZHApVagd0myDQRQbW4FckxCjgfspZ/lxSIHOcvIfpIguNFCL+0qfc2o
	HysTn9BF2OD3BCymu9XHliL4Fw6RCIY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-B-uxa2VKPF2C46FEUD95Og-1; Fri, 18 Sep 2026 13:40:41 -0400
X-MC-Unique: B-uxa2VKPF2C46FEUD95Og-1
X-Mimecast-MFC-AGG-ID: B-uxa2VKPF2C46FEUD95Og_1789753240
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so18936841cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 10:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753240; x=1790358040;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtUsYSimD6K1xLItLoYKB1WWd1TCjyyOy2jIzUuov2s=;
        b=qW01VkZ2Yn+7dZwTFUjIxOJkf5EvtXeKU7NRbKNb5K+EBaA0YBZM04ecvwhMW7nWH3
         sBnCyesyDhAUeDyZqAxieIRAMJzFk1PeibFZGUmgRhGrnVOiux4Z0DsLQEJorx4GEiRq
         552T91nySVpc0lzqbXgaym1T3VZELnI1CObslWJlljPwIugEZ3PnC6ysovqN5go/m6Cf
         HvDjng95nwIJXlVVGxfw7rJngyXJyOqBuuXnjdOqxhl8RjrCG2cTWlxIUDHGMgwQSUfQ
         ++Ojpw+K30AhZnoE0kFO3MIObqm8atiYIcXF/2fzbO68LRQbILhQSLTcALqC/M9ggPmf
         bbzg==
X-Forwarded-Encrypted: i=1; AKwUvBzCbvkkDFop6IrXy71W5DNF/tylG7Hk3WUgCC7vLXfIqB0k4YmFTq4p8A49n4alt65NEjsbl5zlYPhGYA==@lists.infradead.org
X-Gm-Message-State: AFuF++k04sw4+PkTetUye/26+Yb46Zma8n9fvpxFDkKUpGaZcYmJh8SJ
	jSqA95qowfJLkEyh3dhdJyv2DTa54bIbiURLs9E0fpyIY/Ug5MhtYPpbyx74C138tLGhqRZT0A6
	V8nbnUFWvkkTanhTmUy64eqJC9rRc9MuSLH9maLZuJ8s/g3PPmJQU0vgz8Xs8h2n9RuSToQ==
X-Gm-Gg: AYBFou19Myol7cDJ5lCmrik78QJN9Jj6eXxdIb6C4z8OW+SmXdb4xF0veamxE0euf2M
	9hGWL3Yq/SdgBVEyKhv2d9duo6WMxBay4iwV96S0jt4W1pOPAKPUPAyCH76m514nLAFWInnsmYl
	/jJimQB0VsqzNcfW+CfOZUFNXtAcEexYORUqmmdVBcG9yYoKErKcKH4/gFHx0o1i9RRHfAaX3bU
	lT02Vz2BFYiao8ZXBOxiwy/XradzuJUOTJgcurBDc3E8TGFo9fe1Jk7uUiHYwn91i4tzwrmqNxA
	lleeWdHxFAk/401t22aCZBY6uHVANJZLIfbHBuJnQQIgdidgYr7/TYC42nI1+L9VkT3meRVqNE5
	ibfn5x5pYRLwz23HjQOqxDYQDf6YbDCX++yQ=
X-Received: by 2002:a05:622a:8cc:b0:532:9add:cdda with SMTP id d75a77b69052e-5329e3d11b0mr50950941cf.63.1789753240031;
        Fri, 18 Sep 2026 10:40:40 -0700 (PDT)
X-Received: by 2002:a05:622a:8cc:b0:532:9add:cdda with SMTP id d75a77b69052e-5329e3d11b0mr50950411cf.63.1789753239363;
        Fri, 18 Sep 2026 10:40:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae730a9fsm2075781cf.20.2026.09.18.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:40:38 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:40:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: spacemit: Fixes for v7.3
Message-ID: <aq13lDqmJjfDn4zI@redhat.com>
References: <20260915004456-KYC0593228@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260915004456-KYC0593228@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mLynlX2PgHBU1GXnE65u_PHjwYwLXhcYFYIfSGYIBBA_1789753240
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_104045_669515_BCA97B22 
X-CRM114-Status: GOOD (  12.08  )
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

On Tue, Sep 15, 2026 at 12:54:54AM +0000, Yixun Lan wrote:
> Hi Stephen,
> 
>    Please pull SpacemiT's clock Fixes for v7.3. This solve an issue
> that will trigger PLL clock closed due to the frequency not available
> in kernel side, a shutdown of PLL will cause the system hang.
> 
> 
> Yixun Lan
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-fixes-for-7.3-1
> 
> for you to fetch changes up to d558af8ee0bb1b2e88e696be84adb93cf2b7be6f:
> 
>   clk: spacemit: k3: add CPU PLL rate tables (2026-09-15 00:09:55 +0000)

Pulled into clk-fixes.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
