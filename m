Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ECCC5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 17:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tx7/1R5lgVLrxHKJUopxbi4SxKs5L92ztPnUa8gAfik=; b=SL/HUuidrkpQFe
	pfWRnOtMcYiAWahmMuCdWM8OqwQ7XtnHvJEUl+FkLzaGKxACNg1o5RzTCoBRGfInSCBHH8HRr2gvY
	hyravDhJ9e3mN5BP4hbFpnpBEaOX6gnG3N82GTxX1u7N+TQH+XcAqmrnuXgV+tGBzmTJX+WerJK+a
	qu4NoGqznUGynbD53CBK4Bda8ZmUtuiFQavRQvkInExtCqTRE+ZT0inqI10VP/Ox/f6S35mSvttny
	pYy0UPCnJzQ/GobVuKXOOo5jlX0cfwtvCi8XgWL5zcvs0i7LMA/OQXNArFZ7BD08+yOb6SBxM5Njp
	ce+wsCX46MqY0UNsnKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVRl-0000000BUmu-1rGa;
	Tue, 03 Jun 2025 17:29:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVRi-0000000BUmB-2P92
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 17:29:08 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so100162b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1748971746; x=1749576546; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=emD2GiX9yA4xw3xj3nRBUq59hfmTp6ROZD5K3uZ60mc=;
        b=hZeKDCw/ezJbCYD++qw+7J0FO2XMEjC/POSDnFulTzEgFu76S/KR83JySjN+s1yU8l
         vmot4irVLdK7se1GsMXpBdH/WVGSzmPH9r9zqXMJNVFstv/tcNP7+yinGeFgLmoMWn6q
         7ILIPobjRWuvRa6UhTjxHJ6+IQOzpmQW9S9RE8FmJN1TTyIEezmg6QdJAaEVFij538CP
         ZyCyzhfrvrGtGV4vPC74N7QW7vtwNYbrXO59V2zoIjt+M7gE5xqBUlPcEn/33GVC8+ly
         GtKKt6HKThHhLSNAeU7kfv33KR1QAj1yCSy7kIIT2aAsaXQIeXYN68i3WcY8DJhfTWSC
         5keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748971746; x=1749576546;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emD2GiX9yA4xw3xj3nRBUq59hfmTp6ROZD5K3uZ60mc=;
        b=ssIAiDpCoOa2GzZiJ8zP9Ak2l19R6doTRpFV1+rxu0qkMUUWRdBYjYPzNIxCfv1JgA
         kjassFGBA+hyqplucnyFhVXc1tP9ZdeWuUQI3M03VOgecv07tP8ZPDPLAh13wtohUEhE
         RlOyXcZmOQ0Lq2F+4F4wOmitob9ZQzHW5s7cLsqfDTgAWRuTjlUOW/S2AdaBzCXtgwYs
         3Rqd1DYb1smAeoHWxSguAhbuswzihUmzlw3nAmmP+Yc23Xhi2jMxk6/+tb9L1pApAK7C
         p/ZhoybYq7Vfv9D/yyRphiEriaouei90GYpd4+NBPOg/vzWucZ5TX44JIluOF2OWhznb
         wAKA==
X-Gm-Message-State: AOJu0YwEoWHM+Dj4+q3L75F5XnorjackU415osWu9NtaWnv2F3wQOKs1
	jxm9J9PQGWzMU2/LgnzY90Gwz/z4PqMRlz9LjdmuBNhNUk9Z8VpH2u9ojSxsvC1ADrVXhgtdFFY
	cRw85
X-Gm-Gg: ASbGncvDWHB07SzJumCIOaEVc7Iag7nV2mLP/It2dH46YpP7F/jrKFEpLx+/B1kpYLD
	JLP7bcMe1eOrKP3ZE2TperXt72xkNusq+HDcqrOVTY+WTnxLrVW7uUyKThldG7KIrx8zigf8qIh
	haBYqvUxBnwp82h2ALqHHgOIUsWDNkXpGALSC0YDNHpc0qFErdbPuWlOfpxdLRsKZL73yNd9WQU
	kairbgJHRLNhA2cHRDm4Rrr8pFceIWzybJWh5jEVc39S1r5hu0IJsoiKVAHGdrQpnsNfycPFw+u
	c7bbHvLuLr7pnDyPWMY63Kp0J/4WubqL9w/yeamOePrHD+1foCh4JRJHHn7w
X-Google-Smtp-Source: AGHT+IEwSSr0fZM5svfNaKhPvBm2LGA9JeMEWyV42LaOOwiHGsak1NuR5cBgdbb+myxcHfZfnBD+CA==
X-Received: by 2002:a05:6a00:1a88:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-747fe0592ebmr4437669b3a.10.1748971745519;
        Tue, 03 Jun 2025 10:29:05 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:5fe6])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-747afeab6c8sm9650343b3a.39.2025.06.03.10.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:29:04 -0700 (PDT)
Subject: [PATCH] RISC-V: Documentation: Add enough title underlines to CMODX
Date: Tue,  3 Jun 2025 10:28:57 -0700
Message-Id: <20250603172856.49925-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_102906_713713_915F5D31 
X-CRM114-Status: GOOD (  12.61  )
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

This reports as a warning in linux-next along the lines of

    Documentation/arch/riscv/cmodx.rst:14: WARNING: Title underline too short.

    CMODX in the Kernel Space
    --------------------- [docutils]
    Documentation/arch/riscv/cmodx.rst:43: WARNING: Title underline too short.

    CMODX in the User Space
    --------------------- [docutils]
    Documentation/arch/riscv/cmodx.rst:43: WARNING: Title underline too short.

    CMODX in the User Space
    --------------------- [docutils]

Link: https://lore.kernel.org/all/20250603154544.1602a8b5@canb.auug.org.au/
Fixes: 0e07200b2af6 ("riscv: Documentation: add a description about dynamic ftrace")
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 Documentation/arch/riscv/cmodx.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
index e009873b2d17..40ba53bed5df 100644
--- a/Documentation/arch/riscv/cmodx.rst
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -11,7 +11,7 @@ program must enforce its own synchronization with the unprivileged fence.i
 instruction.
 
 CMODX in the Kernel Space
----------------------
+-------------------------
 
 Dynamic ftrace
 ---------------------
@@ -40,7 +40,7 @@ pacthable function. The metadata is resolved at the first trampoline, then the
 execution can be derect to another custom trampoline.
 
 CMODX in the User Space
----------------------
+-----------------------
 
 Though fence.i is an unprivileged instruction, the default Linux ABI prohibits
 the use of fence.i in userspace applications. At any point the scheduler may
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
