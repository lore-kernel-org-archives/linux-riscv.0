Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83615EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pHAQaULIhycg+yPQTXoNbTib5O5YStjaLXFHFKdRXzY=; b=OTLr2FPLvOqEuD
	gz320FeMcmTGYbKR6YO6u5BlsZSqmVBF8T9ImcAmCezlgK4sz3QgoWmVbkTMr75gncevjzpohcC8V
	uf+NVYu3JFbKjSjdOp+Usm56MKTFsQrYEHI6R5H3AGbdqn/e8iJS4EpmZk+4l2zwezkJnLzVhCnCV
	yeKP3qWixg0lvdrCL8CaphpGD5sVDFh4jvQypl8aL83BtEgxD3PfGZF/AHmbPe3dlI2a1ykMiIGRZ
	RhYHhafKwZxsxJYT+GPGMQ8F2mYyUgexkTpQpG3CYS6A/4c+C3XphhGZlqntv84L6OBuajalRcVZ/
	3AqABW4eBkjR4Q9tOsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqnR-00BjTj-0F;
	Mon, 10 Jul 2023 13:19:21 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqnO-00BjTB-0N
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 13:19:19 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-78372b895d6so230135639f.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 06:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688995155; x=1691587155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xH3ktNM7F7ZJDvorWduQlndd7zU/N+WvOi1vVNgDJPc=;
        b=S6GR5b/fh22V6DUc+eaJm9KLbB9KJMjM+u8GweiC1T3ZW0QB6YtSeT+FPF7ZSm9LCe
         m5yUVrQ4bhDBxq4V8g5VbmldqewYrPZpOqAfaA8eaRCStf2f+gTkak3LtHoTao7XGQKf
         3N5IZZiZoCgr+ZtIMgA8UBwY8SJ2n1E5atMB/0sMFjU/f10sxS2y/MMmrp2T/xllmUPO
         geHIHSkholSDE3H7nWiLQsjS2+l9cjMN8KkbX1/v0JCmSsE+KcB7egGNDsCrJscfPk4o
         bOUyQvJqXv++Q9DcPt+a3ZhKNPcUgUc+ygZbMz5qx33IcHG+lh44JOLBGcpACT7/cWtc
         b4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688995155; x=1691587155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xH3ktNM7F7ZJDvorWduQlndd7zU/N+WvOi1vVNgDJPc=;
        b=iISuaDxPfBJZHE47Xl16BCyK8AQ4+1uE/1hYEVbgpmnorWlTK4OelJw0uU8UPeGrlD
         pX2K1hxHJuFBhKVBtLRdHB0MwhBNzP9N+PqJ6niuLYiaraNxP/25HsZD4RUBhnLMXjBI
         sy+6BoKe3KhCk+rcLRE0kQCdDB1mQsuVgXEvGzAYvK5/o5FRqDqy4/kyh6NqWFNQMAyp
         q6cS8lvRGO4+NcpEq0ru0CcgPJQqEWn5PizilSNATeDgqBgrIyR1zR8V0/zkQEb6OULQ
         8Uh1PEUI6c1l01fhReojl+0Lx9Kch1qX7THhN3O+P9s6XmfUe0uBsxmWvAW6JkTqHkkg
         XXAA==
X-Gm-Message-State: ABy/qLaDmeIHdtLhhgNkjqjlBj1nUMaxSP5l1HoS2Dghrf0DxSbpbi54
	s9ffKD2MNVoS3mlDRqi7RN7d+A==
X-Google-Smtp-Source: APBJJlFzb6oEXourW8KpAWTa+6yNySEnTYuIn7caQrPawjxY38DirN6YNvXeeEQRwP2GfqotSORIfg==
X-Received: by 2002:a6b:601a:0:b0:783:572c:9caa with SMTP id r26-20020a6b601a000000b00783572c9caamr11941055iog.0.1688995154884;
        Mon, 10 Jul 2023 06:19:14 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id q14-20020a5d9f0e000000b0077a1b6f73b9sm3643242iot.41.2023.07.10.06.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 06:19:14 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/2] Misc RISC-V timer driver improvements
Date: Mon, 10 Jul 2023 18:49:00 +0530
Message-Id: <20230710131902.1459180-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_061918_168966_4B6C640B 
X-CRM114-Status: UNSURE (   8.01  )
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

This series does two improvements to the RISC-V timer driver:
1) Keep timer interrupt enable state in-sync with interrupt subsystem
2) Increase rating of clock event device when Sstc is available

These patches can also be found in the riscv_timer_imp_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (2):
  clocksource: timer-riscv: Don't enable/disable timer interrupt
  clocksource: timer-riscv: Increase rating of clock_event_device for
    Sstc

 drivers/clocksource/timer-riscv.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
