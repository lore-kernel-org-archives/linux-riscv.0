Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C20C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/ZH/AXht33W2wScvjOKXvUF+Un6eAzhJSYAxL+DBBc=; b=sUrCTMNS+NHKMq
	oyburl3fstndzX/1fwd+OeMqeMIxxSen2NImQJpldbo/gXQFrahycKIHEhU6Bv3tcZwBze+ilVd4j
	QrOLXEYvew/YEcP9QIQFK9S5Fyw++9fYV23YsojanBHjbFeImv+xE7wT4vhcmhHq2xOQgaCLN2kKs
	O+LI4dJVLt6xGqo+1Jmb2pwh0YI1T8MNdomu6FiJuIJow/5MiwBWVQlVVglVrRba7eg+uMhKzeXyS
	8ITdDIaPLllDF6o2/dqDkYmLzacsWz7JtM346agOUZ06hG6pVoLnCLPkK3X4qRwyEb4VVViWzPguM
	7UXKDm9+npsYijU6yq5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn83n-0081OO-1Z;
	Fri, 14 Apr 2023 01:17:07 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn83k-0081ND-1X
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 01:17:06 +0000
Received: by mail-pj1-x1030.google.com with SMTP id v9so22329072pjk.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 18:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681435019; x=1684027019;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/xFbhdfGbvhRzWNEiCTRFnrjnSlOCJrbe6wqyR9o+g=;
        b=QXtiP/ByEYzceemUsaq/VFt/95tjAPbukG/yJU1BYKDXLWY9JnBb1qFjjKQiMHuZc7
         KDBm2KxxV+1sy0gvosuwTh3uNFazeNd0bGrOCthnPeEskRcS1VZYaisP0KOoX8SbMx6N
         g/Ob5H2SICItoT0eTy+MWCi+v5vTDmfR+uNJqVxZcogn9Es4b2fkJQryFIE3G4FhKgYG
         VLib+0aHObAPKWXU5XH3QIYW3cELcsfxTiMJciaQXS4Ir/1GAFVMKTkflXAOgd2DnlU/
         HGzXygSGG9WL/hqHHeELmmFqHdihBZRYc+oqamxIGrOK5boj9Pz89krRZwLrfUXzeA6r
         seSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681435019; x=1684027019;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/xFbhdfGbvhRzWNEiCTRFnrjnSlOCJrbe6wqyR9o+g=;
        b=RM9HTtVcnyWuqysvWsZfYLmwLcl5x19M9uRq/7xFe/iaKhHLCoNNPjQUYqGkVC2+2Z
         hvyukupRmTuEUAO0GZ4l1hk+3aBAw+tnKn6howLYGf3YYlaPRoFKYm5OjQpNUMwlaUl6
         JM4cAX6kb1wUGa6qBEce3cXqyYztaNnxsaiey3hDVHEeQgxmotg6k6mWw0zuxFtga+gR
         8gkYUphqROLLqm2GwUU2FLZ+r3M7uSbuaXx1jDhqW3fY/HS9FxWxWUO7zAR54dNHbNnX
         AAwfqSpb6f629GAVqJx14W7EZgwxO+3Fg78zmt0MHvwUsQctti5rwpDUCwsCTpFQzEzI
         PZhA==
X-Gm-Message-State: AAQBX9cTRGjIrWCw/2GJXYhQgOoyNP77GldapWDcECqnUFDDM7A31dFb
	r8wcLaduZCizWQhq3BC2IiF4Tg==
X-Google-Smtp-Source: AKy350bQ3oqWllwLgBEegjI4WfroCRbVOlwhljc9x8NRdkj9O1kPoiELl13X1u2kGURDIau8Rwelew==
X-Received: by 2002:a05:6a20:2795:b0:dd:e6f5:a798 with SMTP id s21-20020a056a20279500b000dde6f5a798mr3211242pzf.6.1681435019394;
        Thu, 13 Apr 2023 18:16:59 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l13-20020a63ea4d000000b004fb8732a2f9sm1932694pgk.88.2023.04.13.18.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 18:16:58 -0700 (PDT)
In-Reply-To: <20230329081932.79831-1-alexghiti@rivosinc.com>
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH -fixes v2 0/3] Fixes for dtb mapping
Message-Id: <168143480593.31161.4075805306178598424.b4-ty@rivosinc.com>
Date: Thu, 13 Apr 2023 18:13:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>,
  linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_181704_736655_FC86584F 
X-CRM114-Status: UNSURE (   8.86  )
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


On Wed, 29 Mar 2023 10:19:29 +0200, Alexandre Ghiti wrote:
> We used to map the dtb differently between early_pg_dir and
> swapper_pg_dir which caused issues when we referenced addresses from
> the early mapping with swapper_pg_dir (reserved_mem): move the dtb mapping
> to the fixmap region in patch 1, which allows to simplify dtb handling in
> patch 2.
> 
> base-commit-tag: v6.3-rc3
> 
> [...]

Applied, thanks!

[1/3] riscv: Move early dtb mapping into the fixmap region
      https://git.kernel.org/palmer/c/99a289623453
[2/3] riscv: Do not set initial_boot_params to the linear address of the dtb
      https://git.kernel.org/palmer/c/becc32e1f2ef
[3/3] riscv: No need to relocate the dtb as it lies in the fixmap region
      https://git.kernel.org/palmer/c/585da9dacc9c

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
