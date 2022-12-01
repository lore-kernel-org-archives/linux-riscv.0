Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C876BC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P1ah5Vc9GeG72KJutkD4RzfNcMMDANmMfHAlYbaUsjA=; b=G8a7D46nh6KT6z
	GU63KgzcSP/wPc580gpY8/9w+aRF/+9vdgoDKP9+u2tRQsfstqNEQa11ACpEYuwE7iv7tig4iYHxi
	/DtBNAyyKlKQnbOG6x1w06O5X9zV0NZtkNHMdDbq+Vy0Se5d23u0UM+yitV+Bh87XdzG8rbrSfsxy
	xr5Hz4aAZi84nP3WuQeo5Tbyj86r0jKCy2ZW/FYtJV/KLYdRCMMf8AukmUbQL3f5S4wMCMnfrAf55
	64ZqI7WTQmYf0vNtSu809zMGQhE0RAeTy0WnqG5vGeuxaIrS9jyn8t1P/SIeGVga/UmeJUxDRT++c
	PqAvf1E7slF7YIZ4RHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jzL-007nF2-Ce; Thu, 01 Dec 2022 13:52:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jzD-007nBT-TX
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:52:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso1577495wms.4
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 05:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOrylymYjcUxwPoIjc41bfSu8k4HBK0lJeu4zajRIls=;
        b=k9Diy66l17Fnxfg7aQNLZ1KX8aTf/tpKeM0E49LxuGb0Bi1Zqhpn4atF7GN7zu7nn9
         HWzEtYDAwaqGI1uglPAT/UZ5gAY9pRxFt72l/ADMFuctBM++Wrp4/KfuPpmmYOegSB73
         iXIR7ZwIPfwgVCIpc6Q7/c3tQl3ngtczrOJoRGE5441R7KxrH7zEtfmyNtlV9o9X0mc2
         6QPkPJNnQNKAok6WWNRZPvdViEo/X2BvpEAiVxcxQqC3IbXZy+xAnU9CdYhBg2p1caSk
         +Zz5Sgnfs5PB6n18WycCx2+U/Wnu20UgVbrKCDgEvdshzhwrTlZ52dlEMHxsYqPKwiyu
         vhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOrylymYjcUxwPoIjc41bfSu8k4HBK0lJeu4zajRIls=;
        b=JqReOwXaWphGxdIE2/CafCV9hsU5U8sSQdfPys6sZUxXvXqOTPZc8HOuJwLwBMMl2z
         n5GfxWYQ0L05k5wRT20dVbzdrxlU24C0bJh/h7FBe4U4RiFPW1heQoGjBUVnCwsnez0v
         Ev5f4nJqDstaAUuJOznJJ5MuO7pG8dt7Z8uSEL/fWiarl+4biFMju1Ip9BWYp/khXESB
         4gSYUsDpORwzUGhwO1xHELGpV8ByudVKdd9/VCkiMvUvUt5ga0MauIf8w37zuwQmehgh
         s/ZbcDsgrMOmA4uPj+L1N6Od5NY5JfYWp0od2B4dAN1xsQFtN8J2w4lMESjrdpmkK3Cn
         B9RA==
X-Gm-Message-State: ANoB5plEfyqBTNpsbXGcMgkev5Qj3h5LOGs1JPeMwsyS9Rr4XD6tROZ4
	XTFf64CxzQMLh5v/FFFSweunOA==
X-Google-Smtp-Source: AA0mqf76JQEnN0ISZaDcT2aZuKhMzGd114XgVhZ/taHM0DIN/Tzeik0zg5UpwWoF23zTi5ZJ1VssHw==
X-Received: by 2002:a7b:ce09:0:b0:3d0:6b76:4e67 with SMTP id m9-20020a7bce09000000b003d06b764e67mr8141476wmc.147.1669902739370;
        Thu, 01 Dec 2022 05:52:19 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-gre-1-201-46.w90-112.abo.wanadoo.fr. [90.112.163.46])
        by smtp.gmail.com with ESMTPSA id n12-20020a1c720c000000b003c64c186206sm5194538wmc.16.2022.12.01.05.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:52:19 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/1] riscv: Fix P4D_SHIFT definition for 3-level page table mode
Date: Thu,  1 Dec 2022 14:51:27 +0100
Message-Id: <20221201135128.1482189-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_055223_964462_2F2D01DB 
X-CRM114-Status: UNSURE (   8.67  )
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

+cc linux-mm since I'm struggling to know how bad is this issue and
if this should be picked for 6.1-rc8 or not.

I tested this fix on an Ubuntu kernel in sv39 mode without any issue
but the version without the fix seems to work fine too, either this is
not a real issue or I don't exercise the right thing to make it visible.

Any help appreciated!

Alexandre Ghiti (1):
  riscv: Fix P4D_SHIFT definition for 3-level page table mode

 arch/riscv/include/asm/pgtable-64.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
