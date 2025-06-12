Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D03C71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 00:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=62fzdwRr7W1HLgNN7Cf7gizpEP7gJhpF0P6hvYmvpoc=; b=Ot0HvemqUyPbsD
	BcgHGs/mzG0GvBieq32mvBBao068l0OcGKCFVYa/SQ2iGrqF9zRBozG3uDTnfLpW/FVQHzuB4IM2X
	KJxRWLWQrbJ+3ux99cX7MLDO3RR8ATSfKS8lED86A4aDu0IjG2Zt7H41sOiBtUrInXaQzclO45RVp
	ujWgavgIiVylPDV84IHPgXhXJBlutSrU9LBqYEnGunz0NlR0bPgxItnOlfh1vGec0VXNq2yyQsf6o
	OrImkzAX0BcX0+/zXiY8HP5rZQx9I6mDe+PqKnam4hMWqWQE2zMnppy3UYXuxXOyq/RQVL01J0g2K
	N+Aiv347eNpd4FakVdbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPrz7-0000000EvlD-0VRc;
	Fri, 13 Jun 2025 00:09:29 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqqV-0000000EpHc-2ryB
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 22:56:32 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3dda399db09so12529045ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749768991; x=1750373791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIRR5bCoil2FaR591vuDwUpsGCoeLZpb18iQYK0axhg=;
        b=SzpQHAjYkH/rXFvYr7uAlMSg8ZjTXk/kcWK48iXwnkmNNqpInbbzbazn3yrL5orQ84
         4iHjz+BlcTMHe3aRqnSGsIM33Hh1u/xb9jM8iloCullKhUbnC4cjYuBeaWQiY2gBU0lb
         EzUbNcHp+RFu2qHwfaqbG1tH4kq6JxcaOL00+vuc6alB9sGzG6ehNyQOzI41P2N/fXrG
         OqwcfOfhM6oI4UiVkoOEriiHsJb/k7KjS8D4/kqeZlM3jrkADjSptso559epOap7UNx6
         Yft7klnCjR/Mve06slS1SvOPtnWGoi/rTV2T7YM7Cwxt8mG8IHDsSmeU3kSTgj0rorwE
         lbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749768991; x=1750373791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIRR5bCoil2FaR591vuDwUpsGCoeLZpb18iQYK0axhg=;
        b=NsmNtNPG02qxULFMZWFrIXA5Rn1Kfr74tmmSGw2X8BgaPat+zLpoOYqT4f/TUx1iss
         XVqmnA60zzmMjfYuYJRNOqTlXFzKbHgWbd35HPC++XuX81hXdVrGC1sCVaB7+9cMnMRh
         aR8eWWwf6OMqq14ofeHwtzoiDQ371+1k1Z1M0SQpMyg/GzUfWXu7YWMYSmW2RmC5pDZv
         +KHq2OzOyxk0RgTD4F36rkNwYlTTxfi551w7nDhNyRJeH0ZHGfnBLAFlWmFMrTYgvWoy
         xVpLv18BZr7nzQ0kXpvYgAZVYRtvO6jj91wP0UbaddFhwTm02yX88Ha4NWQ3jSEJWlqy
         ATNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU808QTEap7hN8m/mIsMet/m+bZwduy7/DEndWfax9kqimg5tb3YSHl76Oggc0kETjVdXynrmhwZEw/Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVRq8yyiqfzSj+JdshgLBmpK/d+bT3WRAZ6N0+se+caM0eyIbk
	MROyFgypECnZ7nIEpOPnlPcz3QuvGRmhtPvayBSp+sgDgmGLaVDeKQ4ePIrFbyIL/Pk=
X-Gm-Gg: ASbGncu2OcfuFN1h757XZAL8Mnf0TtpQrcVMqMUqqzy25N/csoihgzmNHUiFADFJ9a8
	TDGcn18vj4o712SLEtlNcPyEfL+iFx6IU+PjdLNUzQ9fVpJpv5kugEAiCX9B/leO9GbJkVgUOGQ
	zPRmegeFuRQNwGmv5gvpr/svrTqPrtlq+5hqKxHfWZvtGMcCHX2KI5emXVyPifnEPGxcLCf9MW4
	/87KiYlWTuSV5feV41lsC388MhC9rNX6a8JEBBgMwjXMTVr9n/cOP59AWANbomRsLjfPKiBT/YR
	Zbz5vGhdXQKIOEXrQnbk50eiOI9yLSPv8MdiGUQ4v4DIBiXnjwpsa+a1LiksEHDX3GgrgW/sqD7
	u3Zenr2GILSkD/UbhHvwtSJu269SFdPMJnX4RvI9kOg==
X-Google-Smtp-Source: AGHT+IFl/qtFDEOg7fq5AKLUPKjkJzQ1QBSvDDw3zCkODT+b5Ce6LNmP5J2eqcw2VDryqjSPHaqh3g==
X-Received: by 2002:a05:6e02:184a:b0:3dd:d6c0:cccd with SMTP id e9e14a558f8ab-3de00bd309amr7524375ab.13.1749768990866;
        Thu, 12 Jun 2025 15:56:30 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019d0c4bsm209125ab.28.2025.06.12.15.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:56:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	linux-i2c@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: k1: check for transfer error
Date: Thu, 12 Jun 2025 17:56:25 -0500
Message-ID: <20250612225627.1106735-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_155631_721350_E56699C3 
X-CRM114-Status: GOOD (  14.41  )
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

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
---
v2: Added Troy's Reviewed-by

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
