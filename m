Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DED2C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Apr 2022 09:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KWFK/TLK14L2rX/Q13Y4i1lXqrNIo+D3bNo0Nh9vhuM=; b=p2vWjMKWIvHWR+
	hixJdlomn3X+5/5HUt3gUoR4JIfRoozJv4xP6cGmOhxtdW0cCpgg3BY2jCjxWgrYvbR/iImvFVnOW
	G7SqgsmuHLqfJJR2AXrlePc/WOsYjzGD4JLt7bjyZamzPLfnCJ3VMc8sdu8Ax1UM0JICcShib6vZ+
	HtuxHMvUUdaGlGWLyu1iBbjzlT2ZYXCTfkF0rULBeesec/MoB4E1GDrvggKia9m+wnr0cI6CWqLfU
	g3HL4TfdSr0h+1sM4QeAQRwF7lkY1GQynlzZ3qvGpSM66baXbjt2MRdIpBcoD+Ntwc5UdFoijYL4D
	3gEHqTt3N8blWS2iXKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niY8v-006DuX-BO; Sun, 24 Apr 2022 09:02:57 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niY8p-006Dri-N7
 for linux-riscv@lists.infradead.org; Sun, 24 Apr 2022 09:02:53 +0000
Received: by mail-pg1-x529.google.com with SMTP id z21so3299445pgj.1
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=BV9JaFxWxt3f6KW7lUOQRsmo/82cFawRilKEJX+ukp4=;
 b=LyrBnaxw/8c4AsN+VZv7LMYf7K+CBkTeOF/6O67ynX08WgBWiEm8R2Vi90uHFhfftg
 9BOTQoM/AXOqrpSqv4lZTqrkxsEVQIcAAQ2f79gEM9Ko2RT0x/BmXzNo4sBg0xfhU3ci
 s4My+bc3v/8n8RPWpYxpOq7DYHvV/PkG9M2Nf+gXxm9Ml9mskBmPBa83AZ6SDB8A3wNp
 oh0Lkyk3SfG18At4p9D3s47sNe3dL2c94gJhqOzZtCvzeckQR4ZlNB8r2b8leWBej0Kl
 7B2dWrGq+K874yL3ojJ1Iy/qn4c/AbpziHKhabSCMiIiEZptU+Ac+lacrqWETmaOYvYC
 CXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BV9JaFxWxt3f6KW7lUOQRsmo/82cFawRilKEJX+ukp4=;
 b=zJmqB/oZO/AWJ/mIsEm3u1uX6KDeqN0HOVo+B+SRU0xbqiMl5aXYAURmMgz+M4TNRq
 4SLc/ZQpJoDhHJMGbS+D3Ngk3QnCLdoYww3T3w4yl1NZTNHzI/+lUjuksNKWNYRo06RL
 ykWFR0Ca2NbdWbvWfhmLuDhW55PEHfQzL7xxsZp0qZ3FmericTI/dTydRsau2+AVKG7H
 XqKBW0U3/l+KpdwbM0eSV4uEoNE1JuFTXRz6oGn1xiudlS2JbpIGPXtVXIaECTNkboN4
 QReXeRTdtqZ9Xx+RHPBAcgX3940UIT4QelaryAc8075q3PUsy4RussGVLZ8IG4RW/ZM8
 VvuA==
X-Gm-Message-State: AOAM533kqInaG9tS4w5Elkd8xyJyzFlQLJRM7bibi1t6Xq63QPZI3A6m
 GtO1n3hec0gDcrn86Hdrsshqag==
X-Google-Smtp-Source: ABdhPJzGDx5pO5r1tAJNopv5Nxnjjf1KlYMliWI6T06kKO2+OxpOyOtUtkWyqWLDnwze5Si35DXGQw==
X-Received: by 2002:a63:200c:0:b0:3aa:4d00:85b4 with SMTP id
 g12-20020a63200c000000b003aa4d0085b4mr10491896pgg.271.1650790968168; 
 Sun, 24 Apr 2022 02:02:48 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.86.15])
 by smtp.googlemail.com with ESMTPSA id
 n7-20020a17090a73c700b001d9682ad948sm628090pjk.0.2022.04.24.02.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 02:02:47 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 0/2] Risc-V Svinval support
Date: Sun, 24 Apr 2022 14:32:14 +0530
Message-Id: <20220424090216.21887-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_020251_827055_04BBA1F2 
X-CRM114-Status: UNSURE (   8.34  )
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


This patch adds support for the Svinval extension as defined in the
Risc V Privileged specification. This patchset depends on:

https://patchwork.kernel.org/project/linux-riscv/list/?series=632984

The feature was tested with qemu from latest master branch with
following additional patch:
https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00142.html

Changes in V2:

- Rebased on 5.18-rc3
- update riscv_fill_hwcap to probe Svinval extension

Mayuresh Chitale (2):
  riscv: enum for svinval extension
  riscv: mm: use svinval instructions instead of sfence.vma

 arch/riscv/include/asm/hwcap.h    |   1 +
 arch/riscv/include/asm/tlbflush.h |  12 ++++
 arch/riscv/kernel/cpu.c           |   1 +
 arch/riscv/kernel/cpufeature.c    |   1 +
 arch/riscv/kernel/setup.c         |   1 +
 arch/riscv/mm/tlbflush.c          | 116 ++++++++++++++++++++++++++++--
 6 files changed, 126 insertions(+), 6 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
