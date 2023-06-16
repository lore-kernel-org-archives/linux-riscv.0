Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7D7EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HsvKm/h98KLRJnWoStyEj6hT7gExk1W4W7MkWv2iFNQ=; b=NyJFnY29fjI3P2
	uE1L6gtBDI2IU0m+dS+Ks4RJNjCZKakrfz+USqHlbAfAuu2wL5t59NaAw08xYk8XMYmB9wHPYxMnt
	IBhirbfLhfKMRWgd03vfVl56QYKnzsXJfnN1ut5ZnR86G7nZ8CakcuO0roxGShTZBESGhPWVglQmK
	cCNJHIGh+C5dc78RRGCeu1/mN6gzEx59smembmtbR+8QoIi81wED37IYmKx/rZjLlQhoplx8dkOFI
	d2RU2BGDVs93qQlcMhFpgTY41C43pJ2a43WwikmQQE+x/PmKd7QhoZI+BBPEV3Ta8b11NEjtLHt6g
	cOyrcJR5pwWN4xe/Xyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qABle-0011N3-13;
	Fri, 16 Jun 2023 15:53:42 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qABlb-0011Ld-0J
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 15:53:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b50394a7f2so6055815ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686930816; x=1689522816;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgfV+5KO3Uf8SSxMlMaKIkFpl9kYZ91ZmMdAQxENxOg=;
        b=2F21qpxJcutuLQ/jgylm2fCqjyxYzKNus6Hgvb80quo6TcA0cW1tAAdPcyMZcltBJ1
         CkQm9aE1mPmurnuSKPpRYYJhggiaG1JUAPFI/3hTMh9t+cwgFe0Q1FIUa92k00GOJ9U3
         RiJiFmtRy7IXrFwO+zxB0GkY/WByYoQrq9DuW25x0PN5/bFvCt5gRyfFjU3gHazUntiz
         lVR41p+RVM0aGPQ7KbnyO2U5I5wUfK7jD1CkhXP711TnT6x55DDwxmLKISp+ZeHGd+ZD
         wibaaUl0831HwnDVQ4HKlvaLFlFLqXotpJ/18Expx020GA3czb+1X8B4/U0eMZDm0eQb
         LT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686930816; x=1689522816;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgfV+5KO3Uf8SSxMlMaKIkFpl9kYZ91ZmMdAQxENxOg=;
        b=iej5wcVSkPzQRwNXkwcUEwfq4aFxb8yIRnbR6PQCwJ8QjGTx27kdKIugy4bhun5Osh
         vXkSzJd2WG2lPrDemjpeqnvQ3vSTucmeTA3FUmAwQUo7sRTnY0wzUWfgCGVWLEgqjFof
         U4/TJCFG76vd3ZXifiMEjSJVvBqq44lyMV51L2ZMPJH8it5Xg3cK7TSXgGWvQDcu+Twj
         YY+y7tWP5CeCUYmkRoS5HcVGZE4oC1zhbrw8z4dpsYM4zvRr9aUBulB8ijuYcNCd61KH
         oG/0FVCKCowM0ubXsrHeqsPt4SJ9qnkc7RsY+uJvSvyjHbbFautOWKGqGhe1Vm/9nAGs
         DLbg==
X-Gm-Message-State: AC+VfDyeb8vemsa02ei59ryeIikb1YUD6YUXhHgC9z+Ng4k45M3WMFHs
	BL40n6lLfFA2JuDFfhhU8r1g6Ae5XlcxZ+9PI0g=
X-Google-Smtp-Source: ACHHUZ6T52dvH3HhRt6C2aR9b9HeLHn+DIBhCZBUZNFukDA68Vh+8yVVogVpqVo/HBpl4XbeW5JzOw==
X-Received: by 2002:a17:902:e84e:b0:1ae:2c87:f771 with SMTP id t14-20020a170902e84e00b001ae2c87f771mr2587533plg.20.1686930816367;
        Fri, 16 Jun 2023 08:53:36 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id r21-20020a170902ea5500b001ac8e0ea157sm15906783plg.144.2023.06.16.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 08:53:34 -0700 (PDT)
Date: Fri, 16 Jun 2023 08:53:34 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Jun 2023 08:53:12 PDT (-0700)
Subject: [GIT PULL] RISC-V Fix for 6.4-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-7c3e3b18-17a7-4bf5-a977-f287ef6d18b7@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_085339_351091_E78515C8 
X-CRM114-Status: UNSURE (   5.34  )
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

The following changes since commit 99a670b2069c725a7b50318aa681d9cae8f89325:

  riscv: fix kprobe __user string arg print fault issue (2023-06-08 10:23:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc7

for you to fetch changes up to b104dbedbe61d89a933479f8effce6409037ef73:

  Documentation: RISC-V: patch-acceptance: mention patchwork's role (2023-06-14 07:44:11 -0700)

----------------------------------------------------------------
RISC-V Fix for 6.4-rc7

* A documentation patch describing how we use patchwork.

----------------------------------------------------------------
I figure there's no reason to delay this until the merge window, it's not
technically a fix though.

----------------------------------------------------------------
Conor Dooley (1):
      Documentation: RISC-V: patch-acceptance: mention patchwork's role

 Documentation/riscv/patch-acceptance.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
