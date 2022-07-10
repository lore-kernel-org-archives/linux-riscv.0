Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB0C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D04AvUtJSrA+UjQln+l8CQkEnn1T3gQzJEXvrzUkfMo=; b=LFGMIhZWpEqAGe
	jUwqD7lERc+YuFD3tP1nqhteQ+AJ8BzoVqtrLMD46FHYLsm7n493OWlOWzxYYE2yLRtzdObWR3rxB
	xGXn1e/edyYme8zFNtETZBhD6M0i+4HnnxjM9CzDq9kcYGzq4HvjpuPKKcdroR/0SpQ81yT1p95Ro
	rPCmy17FjmFTHN+8zbAV7UNseyH9M/ns58+ME7BBjS5VCA3FpthICXH2zrFGZOoq57LlimhchC8P9
	thC4zOSG2B8jOZlrz4CEtPT1uj/seBvfVaHX+up5xzH9dr4V4uwshT79CvyTSQHSsr6Cczt85b1Mt
	7VFf41MtqxWeLQBBCySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAUsm-00BWQa-S4; Sun, 10 Jul 2022 11:13:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAUsk-00BWOr-Ec
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 11:13:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id q9so3697020wrd.8
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XotajasaTrzcTphALWuHODKAXkdmyWSL9rWt7XNu2Y0=;
        b=NpNCp7YzDhHzBQkNzF1dgxKIZ1CUcACxYBSLYsIO3p6Vrvj387ObeLen/xteZGTKPo
         j0iZifZwvpsoT+YvO61cRsJYS0FZdtK0fT6uXUGDoIc6HH6cmznDgcZxmLAGHif5n+b4
         4BS8NNQQUhYFEcKVf8O/bwvDBNC9n74Xq8IKu6aivcvlf5bBEMKDY6f+8gB+T65YyfBv
         X82L3GVoqYPuC8ANp5EWfOAlFguKkyhfuN0odNMZwgTG+oYcMxS9eqbBqRRJ15PYBwQj
         EV2aLvlYCeudETTyPqADzRfogEgBnaFSeGVb1miq50McX8jllPwFM5z69mgjp5Nz3fh1
         pP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XotajasaTrzcTphALWuHODKAXkdmyWSL9rWt7XNu2Y0=;
        b=EILrjhhQ0CPXr5V1icXxKrjr3E0KiJWJGIBXMelZTWenDWIHSKRKuFqt9aizRZjLQh
         7cCMBL8KyUi3rXdS7oJVIxIf97tZh4b5wkIuET7BCDlLqnlrsPuO4xN/lMP/FGfqm7Js
         ptL1oJwDdo7B/gtCWW1wzYAIT6QROU44TcH54hpnah7F1JqYoIc/X5kUuyALjCFNrn8o
         D88WxGkWXgcof329SDVhfjNzGRKWphVZeiVfN9HwOOenkNkGsRaqGpH6wcE/JA6uU3/Y
         Bmip6rFS0vCmfUp+Aw5M7J6lrlpcowJAnWQGsjv0YVSI9ZGEO9X9S/HDuToaDPnQU38i
         1sIg==
X-Gm-Message-State: AJIora/BnWtwrm4+kHBqitSuAlnzuQ3ioNLro3OSPzgMXO/1v5+y5eXJ
	n5sq/saj5xEY9v2798nsLaifpyI9vdBIG6Gu
X-Google-Smtp-Source: AGRyM1s7b4YgY+LVmQ3Ji71Kha0HiLbKxdeCIyehbJyPzsOfVHGPRrHXx/xGa7tzKUbr8t/ad8fgMg==
X-Received: by 2002:a05:6000:885:b0:21b:a423:172c with SMTP id ca5-20020a056000088500b0021ba423172cmr12040395wrb.98.1657451622648;
        Sun, 10 Jul 2022 04:13:42 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id c8-20020a7bc848000000b003a2e7c13a3asm61219wml.42.2022.07.10.04.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 04:13:42 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 0/2] JH7100 Monitor Core
Date: Sun, 10 Jul 2022 12:13:28 +0100
Message-Id: <20220710111330.3920699-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_041346_519765_D657B85B 
X-CRM114-Status: UNSURE (   7.71  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey Emil,

Had a go at adding that E24, made it an RFC b/c I am not sure if I got
the cache setup anywhere close to correct. I had a look in the SiFive
E24 docs & in [0] which said "16KB I-cache with 32 Byte cache line".
Didn't have anything else to go on, so I kept the same ratio between
lines/sets/size as other SiFive monitor cores, but since they're not
32 bit I dunno if that's correct (IOW it is a wild guess).

Hopefully you know better than I do..
Thanks,
Conor.

0: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf

Conor Dooley (2):
  dt-bindings: riscv: document the sifive e24
  riscv: dts: starfive: add the missing monitor core

 .../devicetree/bindings/riscv/cpus.yaml       |  2 ++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      | 20 +++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
