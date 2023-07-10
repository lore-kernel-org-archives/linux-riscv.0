Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A216EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnBmkDw3oinLO5PrDeKX3lCo6CmMLpmUUhRNu8YRwpI=; b=eBYasdmb1xdic0
	BNJm1VYrK9tbdyqgUpIiDrL3cjqki6wLMuRc+QrjWH0tnbOvbQNqqVyfSc58jXhPVwc9OcsSL+CtK
	oPOBSCsIHzO0CJn2ukKQc+SZncPvO2hpi1+Zy5kU3AGh9anhLdJxLS4HHxedNqyqNyZks179lvv+m
	dbpPMURORkOJAFaS9KErXTutf04Dj+Lbhlf9N9xAq/400EQJZcHACKfQaLE1d58zkjD51VRonk1fV
	EVmogpCsGPFhNNvO52PU2FKOckh/DFwZBcUaomv8A9QfdXjOGmVg0TtX7rFtCAWknBE2Hpx+gIUjW
	TCbdCosynrw4JbXsregA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqna-00BjWR-1G;
	Mon, 10 Jul 2023 13:19:30 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqnX-00BjVJ-2q
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 13:19:29 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-78625caa702so142891539f.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688995166; x=1691587166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1gRBue3D63AcisS8ZRrKq/nAe8+ybrtdsVfAzlr1PY=;
        b=pA+OZj+6VRBv5gS74DBiOVUTgwvqM6wfhrRwlQNZG7tF+0mRI9MD1owZvdSX7ukimh
         k8suDBs0QgKceGAu3WuWnG43cRnQhiCgUbXPnkIEICLi1FX3T2OtPFwSpBDYcJqYySgt
         8mew5dOHk8HZ5c1QM7tS98XYN0MyH0n0xs+ZuFNgCNoZPS0u8LbWovuZ4i9/NUmQyg4n
         fbtlVo8iSDEAMIIdt218mawBd6L7r00CCJnYonLgqo8KA3BEgoQ3XASlfTOPoyfp3UdI
         pJThRWHkf8gbMgSucIu3KeJySWz3zR+8VUhz1cFP0/2GWDgOPQyx09LmmXuGwk7LWPuD
         qXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688995166; x=1691587166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1gRBue3D63AcisS8ZRrKq/nAe8+ybrtdsVfAzlr1PY=;
        b=E7gCZmqprVfgMzsUBRxi5SE+Pef92qeAvDM9yeIjSly43w/uOWuBTxGkO45bTH7xiu
         jp/Z27dDBOyPXbR1ScFCv50yNgVBOw8zuI7rRoPFXWFubZjJ83vVBvZwFlUF1BspbpDW
         2nwisYDz649D7tt7wkbLbCkdoEoejYLO/hUGq6tnrP5hm8t2/wjn5Pf52z16rpi+S9N3
         09c3ZHEc+eWGykL+4Ls5n5Pu9fP5BhW1M3mo9PbqOt7BHL0lodf5gkxtThrq95UIBV9t
         n4xv9m/g84UfGUt45RmLiiMUM806WlF8FeQKHpn4cXZb3DxAmP4CYkUhlIXTyIcEJYhp
         xS2Q==
X-Gm-Message-State: ABy/qLZry3OW0Uj1fkdtjAjRrz1yQcC9F0CxsWwj6tsloB7uU+u/HoQQ
	dlKp6c7tZnuS27RLpwuBn/PUuKsjLhhfwXtTOnn5QQ==
X-Google-Smtp-Source: APBJJlHvGG/zjHslHAxhLRw47sOr0nUaUNS7C7K4tdHJPkUEe+8zgZyMURiUepQv7N2eA4R4IfmuUg==
X-Received: by 2002:a5d:9451:0:b0:783:72b9:ed67 with SMTP id x17-20020a5d9451000000b0078372b9ed67mr12562805ior.10.1688995165630;
        Mon, 10 Jul 2023 06:19:25 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id q14-20020a5d9f0e000000b0077a1b6f73b9sm3643242iot.41.2023.07.10.06.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 06:19:25 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/2] clocksource: timer-riscv: Increase rating of clock_event_device for Sstc
Date: Mon, 10 Jul 2023 18:49:02 +0530
Message-Id: <20230710131902.1459180-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710131902.1459180-1-apatel@ventanamicro.com>
References: <20230710131902.1459180-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_061927_918187_C649D9E2 
X-CRM114-Status: UNSURE (   9.16  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When Sstc is available the RISC-V timer clock_event_device should be
the preferred clock_event_device hence we increase clock_event_device
rating for Sstc.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index f2ea2b3d2d43..9c8f3e2decc2 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -105,6 +105,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 	ce->irq = riscv_clock_event_irq;
 	if (riscv_timer_cannot_wake_cpu)
 		ce->features |= CLOCK_EVT_FEAT_C3STOP;
+	if (static_branch_likely(&riscv_sstc_available))
+		ce->rating = 450;
 	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
 
 	enable_percpu_irq(riscv_clock_event_irq,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
