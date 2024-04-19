Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD38C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 22:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cO62b+cABJBE/Xp/dCrqOjo0PYQ38rt09jgeIPopz/c=; b=Q6EFs6eXgbebUvQR4WXbK5BIiv
	DEbTCRK693CEt06GGpvS7nsxb/pg6JGIi0z6EiOH55BCkfJ26fpVf//Q+u+ZGyb0CfJ0c/QyTLFhG
	pt1r+d5EIYVTEe2PjfALvQJn7dHtQw3vVN48yrPD2nMM+ofYSEL9ZMcAngdXLGhpM5ljVbbXj/WyG
	CQnL3uoGM2ratwUq0bprvxBMezYqKrwmyAt3k7WHAVcdRLjJkb1fOBvYr3C92MOpMMhagyuP2kc4Q
	xyKuMQ5Fo5/o/0N2fJF6P+l+ETjlE03lWhw4/dqOD2VbU8MEorbaLgHPAbS3itqqbvcB/T+OexatM
	Z2gFdFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwLT-000000075t3-48B0;
	Fri, 19 Apr 2024 22:04:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwLQ-000000075rm-1kWz
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 22:04:34 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 193593F182
	for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 22:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713564268;
	bh=EyxFb8C2nMPXsJxRVXr8QOZVkvCYbC8xVHt8zrs9UZA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=YDtDqbq5zmnhnCpQJhBWbnHViy76uk2yQsYrIbh/U7+l84l5ss6tDuNVXp1UfQhP0
	 mCvh7R77EQmN0J6I1HtPx9wgV2nyE4MH9lVn5w514FESnAdIsugwr9jOeEDY5MJ+I/
	 UHjSOMi5CmW1veeRnTiDOuTysRTn6Camn/vNgokOKlHe/Po7apNW9DXM+0i0mjtJxl
	 wgZlnQBwglvG1343pnB52x7PgB/gm9RtOo17vMJZcd0qwLq5co8B8HUz9wOWjpOLrS
	 vz+qzk/+HTWbE6+FVfX0JNC71fE1XumEKYcDIaymiZ4HBYL+jQ18G/a/iRc7itRa28
	 fqMmtpfYEc4nQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-434e823ba24so29948691cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 15:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713564267; x=1714169067;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EyxFb8C2nMPXsJxRVXr8QOZVkvCYbC8xVHt8zrs9UZA=;
        b=iO/LWauFNbkfJ2AwrDwjUtWoDHHxfgQ9EdVvYbqyZA5qXp7nzhUpO5Xt+fkkpX/AON
         bmyCe6jl7hj2+0xCGUvUxj98LTUd8AuO6z/rh6lGyhGTjCNAJHltaXju3bMkp4MTuS6Z
         zcf8PxKlKcCco2QPDXok/shNHKQGZMvNFGFMcwQFDdIVDFisCAy7f4FL3l0qRsOh7P9n
         29PjTVGem82+LZG+60VChFGtDCDbYAz2d7goFufQsa43XF89rzNbdLKt1p3iAtw8sI9s
         UnvMkBA79fwxlYyFZbkTNEKY47GYCNQIEV+5px3kxR/XslCD1RUBwkawU879cHxNf7Ju
         pLeA==
X-Gm-Message-State: AOJu0YzZUddUb8T/HkQPU93qYFKGbjTDZF5F3OiTsB9gIcqB9WZgli+6
	RNDdyw/zngV8JVT8zb5NUAElSyXhDvVyNAhJJRs0hgG6aqoAZQyIamXxFy97Cr8Asqpvvx4lmVh
	ixPmOHMriwjGAhW3lX7mVdH75pSae0AZSbaABN6GAbSFtkQOqrcuJ/jYjBLNwCJcWO4TPFd0Ash
	Qo5VTSzYC3sD0/cZhOXJvQLKiGCAkj7gYtlyPnvJXD2lwK5udsCuuA3Al7
X-Received: by 2002:ac8:5fd2:0:b0:436:5107:d358 with SMTP id k18-20020ac85fd2000000b004365107d358mr3587634qta.63.1713564267040;
        Fri, 19 Apr 2024 15:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRXMVT8kEhNNrR5sTjDPD3IBV2C1MpWA60uIyzYlOJKirdgWffaPQMKlaHbw73PAg5rN0enmvsbfQurBKGXuI=
X-Received: by 2002:ac8:5fd2:0:b0:436:5107:d358 with SMTP id
 k18-20020ac85fd2000000b004365107d358mr3587616qta.63.1713564266754; Fri, 19
 Apr 2024 15:04:26 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Apr 2024 15:04:26 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240131132600.4067-2-jszhang@kernel.org>
References: <20240131132600.4067-1-jszhang@kernel.org> <20240131132600.4067-2-jszhang@kernel.org>
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 15:04:26 -0700
Message-ID: <CAJM55Z-i=JUavZ=GtY+c3ZfDQWChckCWXa8i_6zgmW9S9Ey7xQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] riscv: dts: starfive: add 'cpus' label to jh7110
 and jh7100 soc dtsi
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_150433_067891_9579D9B8 
X-CRM114-Status: UNSURE (   3.68  )
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

Jisheng Zhang wrote:
> Add the 'cpus' label so that we can reference it in board dts files.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
