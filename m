Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ED3D68B35
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUzemSTjgb375iBbsUBLfpCTMrJ+d0QTCuJvx3AYMvw=; b=E4GrmqjQP2tJv3
	cXTidWnjQsS4zuOcq/eAmjZSCGHIoXXeEQ+xteVr4weZBoLQaQzx+fhR/tEWjI44sRyFLMYovPFf+
	QWu7joNZqyBLXmZx64gFKJYMFmbLtRk9oZF5jrmJGzh+6vSKz+1XBI5mnIuvrMy4l7TN/BUZBqeZi
	AyOjuDHj4B9U/GdPkDtXFqOv0p4TH3UMz3NkyyjGrgo0BQBemKFXBkgv8akYEvYbut8FDmDSHMH7Y
	2yfGHKLatxUm1Q7x+A3BJhtGVaQz11GRurbUKUvctOf4X4uUdU2ltJ5qkE93LjQlVrEqpY6wYBNJ1
	EP9XwlVJC9z4Nm7R9I5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYm-000000005E5-0vQM;
	Thu, 14 Nov 2024 16:19:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYi-0000000056u-3Qzk
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:19:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43152b79d25so7238445e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601143; x=1732205943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ylj9cSUnN7lZBYMxGOa796BuugfVNbbIfct9OAjDsOY=;
        b=k0ODFfxVvx65QOrV4ZnnbbQ5i9fOE8Vb0bkytojJ0XLI0vEOFH8DND/gpaxUVRPGCJ
         M+8PxEhRchdTaGb7t8GpaMWUXmRYwqcTpbxLFLMUgTUMpf9F2t3tSI49oRkmLmDoyhxu
         ewo7OUey3ojkYg0dXR67f9wnVxcXr0wpnkxr8uwIeZJgU7UAckvb9MReh451VbdfeuEI
         RvOLlKj2HcRP1ZUpXmJRH0LRSZzFugMnNcgpWxtY3AdOo9l0+9BYc8T/acsln+R9GgbD
         NabHtcTiwW7t0kH1NjUcxwYwz1D3e1Uwn1QuV2xwII827cUwa4zQM/BzjaerXdNb7PA9
         yQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601143; x=1732205943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ylj9cSUnN7lZBYMxGOa796BuugfVNbbIfct9OAjDsOY=;
        b=xNwng3qWcbdafGk9LL5FOieCH0+glko4jpQwj362ZjB0+Q+0ba6oiK33WfOsX7LoxH
         2tyHK6pw+caLPXcjZfQ8eyfj/gKlQbUDasjWVHgppsH9TjswZ4yRAnnGpiLhDCOf5cf0
         442AnaMAgTw1VHqkBSCJ1j5af06kJWhDDOE0oKHuzYb8DRlEYwBxHaZhBk4WY4JRPEBO
         8pM7hXjHug7WDsjYe8YnXfHutcKDKbstAUbfEafpQ/6n89w3L3I1fJERaZrl4SD8yprf
         A+1oz9X8ipZBzmraubbdEp71CKbWqhP5Hn5aR2LnYuvHo6uOPGIYiYWr4xh2pYQNq/C6
         0IcA==
X-Forwarded-Encrypted: i=1; AJvYcCWByNyfmX1U2Gf9pmnipnfqBy+nn7EFynQYCQazpv+4i39jlA7KY+sIwJ0QoB0tu8EE/9JxUI4pAN2EwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEu0KqDoyeYpOPXZi/cyDFpa1XdP1E4e00iZO7pFbhAH6ONeOl
	dkqmrUbLu9fc0s476qvTNq47EHySI4vA55FOyACUp1/uuAiJSkB74gKkFRgTli4=
X-Google-Smtp-Source: AGHT+IGWufmtM+epbPX600D1VFEI9w8hjUWbvA+ZtsTOBkgX8kbCaXoJN+2t/PgDnUc4rlU+m8h9BA==
X-Received: by 2002:a05:600c:3114:b0:42c:bd4d:e8ba with SMTP id 5b1f17b1804b1-432d4aae479mr69854575e9.8.1731601143362;
        Thu, 14 Nov 2024 08:19:03 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da265ca8sm28719625e9.14.2024.11.14.08.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:19:02 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 09/15] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Thu, 14 Nov 2024 17:18:54 +0100
Message-ID: <20241114161845.502027-26-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081904_889449_ED278B4A 
X-CRM114-Status: UNSURE (   7.79  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 0c3cbb0915ff..333d95da8ebe 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -29,10 +29,12 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_VFIO
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_MMU_NOTIFIER
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select SRCU
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
