Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D676C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 02:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0UGIqxPt+UoQPDhHUhSvrRPp7lknLQziEuCRNpaMPHY=; b=ukopEKC/CarGRr
	f5P06SkZvgZczXX0q04FwbtAF+idhoM60UDSPzPy0v/CQCBmLZHRpJNDIdwExNAjbc+8A6yre983d
	EXMnaazuY6qWNiUUxzqEUFI8HxUXU9HQay7x6yeEdS8jI+CJ6/wVtwJWc4Dd+yBi7VKypB/k2tkgg
	j0krVYAIcjSqzXDfvjCyj6ADdF8b0ZKrbN6kN1FgsCYI82FNQeNwuLQAomsr334K8shnK4At4W6i1
	/xe/6p8EWKZcc4gowSrPvVeaXP7+LtTUwglHT56FytoR2blrkBogoECe+Nci53nNi610BOOkihxQO
	XG0Xg2y8BDP9ZEOHwHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPElh-0016Wf-Tk; Wed, 02 Mar 2022 02:31:09 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPElc-0016VF-NW
 for linux-riscv@lists.infradead.org; Wed, 02 Mar 2022 02:31:08 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so553392pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 01 Mar 2022 18:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=z7RwLGF4oUjyAJRf1LSqK05DHyJU1lNlC89zU7WA5ZU=;
 b=P1I65NU5o7FBIZ5b/e2dLoz2MrimW3ykFGPnvYb0Ftg4QR1uyUrPWjIdZcez5vkd2D
 qwjX3mN24uEk0SwtcqZZD3LPviAPcSjzIZ2auP5t8vnGZREJkFYe6hTbK7hea8+u2ENw
 9MT1AgmRNUbdAcekSW7chHLmUpBB1QeiJSUouY/I6bpe6PqrOtgGfxD9hVymnffR+jxe
 ITCmpQiF+1IpQOoJc6/7eC+NytSqByIPJy1JcMIPDXRU4u7nOwUW8OTFvyfWFlnfRhuB
 ntmCeS02hR19Mj/6zs4syFhhxCDPH27NVTtfrv89QsQeTxDxofRDVzTEpeQUHc0JY/dh
 wW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=z7RwLGF4oUjyAJRf1LSqK05DHyJU1lNlC89zU7WA5ZU=;
 b=cR4xxZcIP/4mVO0NUYld/qa3NFR/pij4MeicTtfd6iacHlUfdkmF80sKOYafCM9AmI
 UDIIwx6GGZQw2qmmy/cY0rShbLl54SqW82PTvqc9KeENL0aa56Xk1xuQvbQUxu+yf2Qd
 qQ5hEI0ZEUtF6PmNiDLS+msuihPtAEbArqqeyBdhZHrp2BAiWCSQx0VueT88mrRkQc5D
 45IS3CgPdsPeH5h1NgHNBlgmPbIl7YYKJCnF1EYVBUPsgedSs3YiKquXvHKsnKAJO7QF
 kJExDh9sper3HE47sdLcjk6XSmA+JnZz6sqxiPRizIc4HsIK033brorNtSdvSjPmzTeB
 VFDw==
X-Gm-Message-State: AOAM533DThE5B6/OcNP1OGMd0mwRh+q/4tEXWcpnU3am3XE+SpKLQu+3
 y5n/ZcbpwcR52whlw4v7nw71Fg==
X-Google-Smtp-Source: ABdhPJzfAYy1HgPknUeRf+zNplCJPWa8YCXipo0BrcgRogstzsUoVx6hw7/gB+1czemjnyxH/AwXmw==
X-Received: by 2002:a17:903:22c8:b0:151:87f5:1e61 with SMTP id
 y8-20020a17090322c800b0015187f51e61mr4809593plg.0.1646188263224; 
 Tue, 01 Mar 2022 18:31:03 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (36-227-186-14.dynamic-ip.hinet.net. [36.227.186.14])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a056a0022c700b004e11d3d0459sm19376809pfj.65.2022.03.01.18.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 18:31:02 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: palmer@dabbelt.com,
	mathieu.desnoyers@efficios.com
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 0/2] RISC-V: add support for restartable sequence
Date: Wed,  2 Mar 2022 10:30:46 +0800
Message-Id: <20220302023048.6140-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_183104_822916_CCDDB926 
X-CRM114-Status: UNSURE (   8.39  )
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

Add RSEQ, restartable sequence, support and related selftest to RISCV.
  
The relevant RSEQ tests in kselftest require the binutils patch "RISC-V:
Fix linker problems with TLS copy relocs" to avoid placing
PREINIT_ARRAY and TLS variable of librseq.so at the same address.
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=3e7bd7f24146f162565edf878840449f36a8d974
A segmental fault will happen if binutils misses this patch.

Changes since v2:
1. Move rseq_signal_deliver() after syscall restart handling.
2. Add rseq_offset_deref_addv() to support memory barrier tests.

Vincent Chen (2):
  RISC-V: Add support for restartable sequence
  rseq/selftests: Add support for RISC-V

 arch/riscv/Kconfig                        |   1 +
 arch/riscv/kernel/entry.S                 |   4 +
 arch/riscv/kernel/signal.c                |   2 +
 tools/testing/selftests/rseq/param_test.c |  23 +
 tools/testing/selftests/rseq/rseq-riscv.h | 676 ++++++++++++++++++++++
 tools/testing/selftests/rseq/rseq.h       |   2 +
 6 files changed, 708 insertions(+)
 create mode 100644 tools/testing/selftests/rseq/rseq-riscv.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
