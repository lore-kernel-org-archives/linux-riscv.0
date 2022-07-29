Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9F7C00144
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jul 2022 17:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YbqTXwGsv9HHmyG2MxurbHBSFGqLJJx+ftmKqw6trUU=; b=030uxRPoBwINPA
	rN0boZM3tEh7cNb0g+jeTs6gKCcpjECL5YrjzeGlKDJvqRiGKDuuhGnb2ltXIcCudzF8UaDinsZLQ
	eHMeZRIzdrm0C79I3tMaSP9ltEAeeeCV0iYf7Tg2EPh1uDxY8cqs5oXgsYllrVEcghItO6l98Np8z
	28R2VGXLm8xIACiCAgRP7kaKFSTslt1cnlB7sRNtXi1wG6LQ1a5DXUqrq9SU2qKUTdm+F3NcVN0ZS
	PfguOj6Iq0I1MnP1Ix3vxmpCM9nQlp5YLaU9OzTMK4pOdMGnrDYH4wM/hy0Mu7q6p8Q3trmkJv8XR
	sBNIhdaN4xnWTa58BlaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTwD-008Y8R-MN; Fri, 29 Jul 2022 17:38:13 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHTQU-006w8g-39
	for linux-riscv@lists.infradead.org; Fri, 29 Jul 2022 17:05:27 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso8974779pjo.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Jul 2022 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc;
        bh=/3BdWYttn03VGR4fwCuRJmzCnEYtlhjvSmUfc+xUaAg=;
        b=AbfEDD9zPqfj25/856E5WxuTS6BHzNWjlH65DEm/Wf49Pog1AlvEwqlH/JQQsJARnn
         7wbbku7SuNgR6/VJRMDDzHyNxkO/oqA0KaVG7NM3T9IuPQKlARjFhEukX39wDY84mqkL
         xkcNF7NDiwLGQci48SdCnk5nLN8etTD/tIKiX8Jza7ONVSyyMkuo8cOR9RaNZqF1qZ1K
         KhNsSqNMiCjji8q6tS6H8Tzy4it+WxBtZmAVwhETPtyMQi+AkzrnKxJhqpc/Bv1LUbvK
         pEi+bVoRPggLJYEkZePtbpSnUbvPF2AKcx/Wvnzx6Ml4RP/NlPoWQ9YY0VwGUTlyRWi/
         Bjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc;
        bh=/3BdWYttn03VGR4fwCuRJmzCnEYtlhjvSmUfc+xUaAg=;
        b=RbDhMt99eA7lMBa121VWAyqPs41uc4pYJQtL/mFBcZNLWVdEohfJ+S6Rq91Kk2Cqou
         Iql9983Y/NS0VoPtMggHykGOMnOPrWGGX2EA28CDFOfM3IHqfc3SByLftRou9y8cSXYc
         TN/BaMEtQ48soZkkI2YzDLbimqpdFt9+SPZAwpsXxU6ddTwfDlDy0DANBHR1QPvhC12S
         vAZNep12FLtHy9vqCSkI9280U4n83iPK/2ex9h7ewRbBGLVh3e9lcC+4/K9JLvVx64QD
         ttxc4Vr7sX4Pf28yt+UGc6sOOpJzHflpU6cuziRaARF1fIM1ZR7O9KE+54cW1vk8twwZ
         /dVA==
X-Gm-Message-State: ACgBeo2PDRAc0m3PQASbOmmumFIoq0NgNeHDzABTEoJqcwsXH41A3U+O
	OAQif8P3KctYIEe4hbrLMDVCqwotIkBvbA==
X-Google-Smtp-Source: AA6agR5BxLWeIzE9fX8MvX4co5THji4842WgX+WlF6UbFnHK7wEbUrrPvOfdDsgaSArpV6mX9k+K7w==
X-Received: by 2002:a17:90a:9315:b0:1f1:fea7:5899 with SMTP id p21-20020a17090a931500b001f1fea75899mr5646182pjo.123.1659114323013;
        Fri, 29 Jul 2022 10:05:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902f7c400b0016a6cd546d6sm3777919plw.251.2022.07.29.10.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 10:05:21 -0700 (PDT)
Date: Fri, 29 Jul 2022 10:05:21 -0700 (PDT)
X-Google-Original-Date: Fri, 29 Jul 2022 10:05:10 PDT (-0700)
Subject: [GIT PULL] A Single RISC-V Fix for 5.19
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-b20f34d5-a1cb-4254-8cc5-d3c7752b3908@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_100526_394108_B608270F 
X-CRM114-Status: UNSURE (   7.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit c1f6eff304e4dfa4558b6a8c6b2d26a91db6c998:

  riscv: add as-options for modules with assembly compontents (2022-07-21 12:09:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc9

for you to fetch changes up to 88bd24d73d5bfa1b7b97a9221ff320fc44ef401a:

  riscv: compat: vdso: Fix vdso_install target (2022-07-22 12:23:14 -0700)

----------------------------------------------------------------
A Single RISC-V Fix for 5.19

* A build fix for "make vdso_install" that avoids an issue trying to
  install the compat VDSO.

----------------------------------------------------------------
Emil Renner Berthing (1):
      riscv: compat: vdso: Fix vdso_install target

 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
