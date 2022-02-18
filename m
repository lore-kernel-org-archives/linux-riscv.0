Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DDBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 17:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2CHnsX00nEem8jM+d4K3U9Yr6oiaBVMByiCxrfyuVtw=; b=AQAl6b4hqXVjq0
	ISF/5GRineAkxd5b8XlPC2rAUp+nmX8N/d8ri96d/Pggd7wMvR//679d4Ji3aYomRuwC6/HOucU45
	awHSnpD9tGma+IxHCEH2gRFgE3MdaKLdsmrkpBH7PJQDJ4qBZaPF4kP6elQ0bTKjejRx87cfG2OqL
	5U2rbtiZFHwXNNFjxJtzyqzpfjCnyHco54q2FRkl2nd9TX3lIBaCqoKz54lWzCIbjx0QaJaVAr3xd
	89gs44+USpYmS9DnMsweNeFkvtAm5npisdF7QQ9ZNMlrb9P6l0GYOTpwo2Il48YC6WXVXhFFPhi2n
	tPmrcmaqpL/LwyhUD6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL7Og-00FQzJ-F1; Fri, 18 Feb 2022 17:50:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL7Od-00FQyy-6Y
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 17:50:20 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so12981385pjv.5
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 09:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=0Qt9aLRVk4goBTUwquuWJkruOHldgdUssfKiVNyRjBQ=;
 b=ELVfiqPh9ppAkt0PMnsaDcgHf9dr6TJTZx9jcxSn8dD8lROslE9gx+uCG3xPON3JIL
 nzHVZTyC12rV3QQhc/z6iIQz5FJxsgNfVA5U3/S3dfxwjl/Oe8MQzGLia/1RA7VU/V0Y
 VqcgPz2pHKc90EFevzjH0w6BQw9cbPycC84VHmDu7k6i3FAeqV1NF5P0Oo5588EvwZFL
 1wmwH+4WDywZdyLPB+X3ZP+Wm+KkOxTe9E6Nyj++EX+1KXh9D8gwWgwR3ECJN3c9FyFT
 3rBWEV8sGmdptAiulK619gvuB3lHRgHnMINsLG5SyjKYl8BIyyFlalWBRnWVE3q/8itv
 J72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=0Qt9aLRVk4goBTUwquuWJkruOHldgdUssfKiVNyRjBQ=;
 b=P9GvlLMZnl5VRTxyxsoUL7Mtv2idfDUf+Vms8ZNQf1rJETzgj+2n+/3w2Is0fttouA
 gemXI7LLYePOOJ59FigkROWnUQuIKCICcNasQmvJNJqy7u7KBGi9uVhBGdvFBZJx31Bn
 +d6RbWxHP0mHKUjJWNPHzQSnbiy9z8BsgRH0xZG85f5IOIxgYwf9WcYYcA1sLhLVuICM
 HbK+jz6XBYD4E3KxX+/EAxamUX4fb4zjGXKfonesDkpAc+LASjwmpoBK5hVNvJ6AlRqa
 5wpfxEBES3wMAmq4t5js8H9Dn8lDJjGHcav3dU6blKUVeXM6wGDoMbns5qMBusLURFMr
 Acgg==
X-Gm-Message-State: AOAM532A9e+ULEO4fFBxFkQtN9amKdo2vH3+/CDNIp5kmFuXNr38a5fv
 oyzPG1GhD4BdRoD6KQNPTdvIaA==
X-Google-Smtp-Source: ABdhPJwO6mvs5H5GQcZgPoP18sncryFhxTQwZ/ukf2jOdcU83CBOdxodUkk58WWfOmTighdkR3YjVw==
X-Received: by 2002:a17:902:b201:b0:14d:66b5:5d69 with SMTP id
 t1-20020a170902b20100b0014d66b55d69mr8420800plr.95.1645206617851; 
 Fri, 18 Feb 2022 09:50:17 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u1sm4081853pfg.151.2022.02.18.09.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 09:50:17 -0800 (PST)
Date: Fri, 18 Feb 2022 09:50:17 -0800 (PST)
X-Google-Original-Date: Fri, 18 Feb 2022 09:49:33 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.17-rc5
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f149d1ba-1f6d-43b3-8df0-95d27c2b89c0@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_095019_285258_011247EF 
X-CRM114-Status: UNSURE (   6.38  )
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

The following changes since commit 6df2a016c0c8a3d0933ef33dd192ea6606b115e3:

  riscv: fix build with binutils 2.38 (2022-02-10 09:17:01 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc5

for you to fetch changes up to 5feef64f4c67068c49f5409d43c67cabf2327f66:

  RISC-V: Fix IPI/RFENCE hmask on non-monotonic hartid ordering (2022-02-14 12:27:45 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.17-rc5

* A set of three fixes, all aimed at fixing some fallout from the recent
  sparse hart ID support.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      RISC-V: Fix hartid mask handling for hartid 31 and up
      RISC-V: Fix handling of empty cpu masks
      RISC-V: Fix IPI/RFENCE hmask on non-monotonic hartid ordering

 arch/riscv/kernel/sbi.c | 72 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 25 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
