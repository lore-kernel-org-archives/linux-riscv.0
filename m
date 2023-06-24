Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41772EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 06:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h5Br+MKju3Ii9xCeOOSu6lqyUQfQT2fBed6lVKDew/g=; b=qrO/6e+TJtOIVB
	IZJqTdKv5DOP91zvwsAoJakk0XX4YIMaJp86W/QIkief6htgMH6e4VI99E7YxYt269vOy3U5MUtgN
	FUTNGdL2Kp7gfE3zu5F3l4EJQRjyyYG6Jzg/H4s6Xr4HwYaSZMBrY4U3iq0vEhFrt78zZQceOPIMC
	/ZDntgfLevxCzTjccqf2nvQdQqZMfc+OOj+h6ufh/TD3XcPNf0XuLtrfLtmhXBNEKZGTScX0WRPNY
	eJxUMFFHOJ3QExUdsMinNQE6WD7FuEIB+sgXBKwZ689BlBtFi0sO3NvXOvt/pgLlyE4PIcvw76fhQ
	ILk+RgWbds+WmHB+rvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCwLj-005KUU-2A;
	Sat, 24 Jun 2023 06:02:19 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCwLe-005KTS-37
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 06:02:16 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6b5cf23b9fcso1315167a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 23:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687586524; x=1690178524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=csp/Ru/rsPdrsyLLiC9Gguj9U+Fgh5fKjxfjDtdRMQc=;
        b=gS9kbMULFiG5NJj1EiFPcDYOOAup9/tIYjoErj5QPwPUKfxlRIHemxYeuuGkT5IQ7O
         c7q1PnCnFxwmLm5wqs6wVNDP5EQtrHa797c31u61Sgb85CyTExELo6fgumeVKtazTkyK
         Z0tONjwKKfwuqUa0VYa6gAf1NOYJjIRLgduxS9PxrqNq74VKXp1RulJr+WnM3zLjPrG5
         Zo0uawG94qyB46FVOaEEYDmgx1l4uSMAuNQUM1KfWD+PiwXcUnlLfyYnt00jtZp34JhC
         q175zRHArEOYlIBtL9cu4uFsnh1rrh3BGoc9HuBWEuyyP94jOMRtugS15V/YXnhSUlNG
         xi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687586524; x=1690178524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csp/Ru/rsPdrsyLLiC9Gguj9U+Fgh5fKjxfjDtdRMQc=;
        b=FB4+Kv0wf5sDlKDGAWEVe32QbpuLuI3plwu+tjUHkPKwNm4mZEw/Mn1Li2LdSNPQXG
         TJ+xVnwoVyiUgW9gVH9Mch6eq6CHM6UxB2tkVdt9tMHdhAHiQVaxxF5Yeb0yvpvvv2dK
         zmKXnavAzIiZR6N4WxZPmopLifSlXbiKfyZvFYQH31wDbVf/HrYqHVrrqsWSOkrBid9Z
         3DEi8jLGg4jjkQEKIfBcA4tXtlCx39SWj/Iu5IxCJbwV2tdgHlLz26mpwbk2sHT9eLrc
         1vUncVzh/2yVqgE9w4lPBEMWrOSqD4sLlVMf2vCMRNaohbbrMVzO2Kxd9xnIGXzWefrT
         nd2Q==
X-Gm-Message-State: AC+VfDymbFBR2NE0AYq+npPgMAYn5CgJd/6ITirqrhZRnXjwrgxPdYF1
	iVtOQ2I+1hh4n89Y2eKuUVyBew==
X-Google-Smtp-Source: ACHHUZ4VWeUnMU1s0UNjPDk6IpqAzSQZeQ6tdhcnWHwHrt+4vWuGVhE3lrk990AA40VrSim2Lx43JA==
X-Received: by 2002:a05:6359:622:b0:132:ddc3:ebf5 with SMTP id eh34-20020a056359062200b00132ddc3ebf5mr3656158rwb.28.1687586524069;
        Fri, 23 Jun 2023 23:02:04 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id u4-20020a634544000000b0052c9d1533b6sm571594pgk.56.2023.06.23.23.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 23:02:03 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] serial: sifive: Fix sifive_serial_console_setup() section
Date: Fri, 23 Jun 2023 23:01:59 -0700
Message-Id: <20230624060159.3401369-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_230215_065981_6252080F 
X-CRM114-Status: GOOD (  10.73  )
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

This function is called indirectly from the platform driver probe
function. Even if the driver is built in, it may be probed after
free_initmem() due to deferral or unbinding/binding via sysfs.
Thus the function cannot be marked as __init.

Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/tty/serial/sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 1f565a216e74..a19db49327e2 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -811,7 +811,7 @@ static void sifive_serial_console_write(struct console *co, const char *s,
 	local_irq_restore(flags);
 }
 
-static int __init sifive_serial_console_setup(struct console *co, char *options)
+static int sifive_serial_console_setup(struct console *co, char *options)
 {
 	struct sifive_serial_port *ssp;
 	int baud = SIFIVE_DEFAULT_BAUD_RATE;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
