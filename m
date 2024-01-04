Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEBDC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1nXrQXPpJZfRxcZWosUImQeGgFjBD9FZBYoACaA/NWQ=; b=M10WogAfxvh7ih
	aX8WvLVBS8gw8wuxj8t6+cZZbUG5N00qPdBWyyf6rbrfMhZiT/JhELw4sGy7tveJA8JEU/cFiZISY
	Yuy8jv+iYy0WzTCxsmkEC0xXbg/FkGYQLzDa5vdTA5Kp0nHmTlDn56JGPKAeJGNdXmnjgdZwQkC9L
	QzlmfN8D6dZ4TyqO6RF3yTWqeYvT9g9kn//3YvkUSUexNILEfeTLRvosHtIjoAlxsJ8I+6ZBtwwKN
	qsqblGeM8Srtpbgq8pKLVsXFqWupVNskglcCfAZGq4gj2y70wqfBT7h07hzbuIJZ/xfdgGsHLYqNj
	KSIcdZai096D4CNN1qcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLBz-00DYSq-1T;
	Thu, 04 Jan 2024 10:43:15 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLBw-00DYRM-2p
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 10:43:14 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55642663ac4so447494a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 02:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704364989; x=1704969789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dtLgJ10JUGu29gifzEIMC137KNsEgAPpefsYRRnI/LY=;
        b=WreHTEHp662/yqo7xR1Zqo/ync1dgkLk+PxRdajh5nynyFx1Hd2hrTz6NPTYsIFSDH
         hEBN6ptQY3jbsuDnoWWpVw0dwtvUZfxnABpEhqjIpeBEjdpWw7ngTxhilM+lokRuVYqg
         ign1MobcPVw6lcI4x5b1NTiJfMemrh1FZBwN0nWxoQggPI+LjaLej52LxlGCE+g65JY+
         rdO/0i9bgQw9D9wK1dZkkHDOITcXNFcDDgfmR92hV0jhtdCft5GSAH7zDwZy2tSPQjmm
         CpT0SJaCyLnhGMMARo929+2FnaqTTLLIhGc/iOZ7M4JB7OTltSc2qe/Whp6WEMJ117zw
         JCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704364989; x=1704969789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtLgJ10JUGu29gifzEIMC137KNsEgAPpefsYRRnI/LY=;
        b=UxPBdo70y3QKmqT4Q/xgIKI+wLEirPrKjs16F+DGh44UqOC67UBWywX6hrl6GwqliT
         Wpi6YhfbRcSMVzK29/VvfudcDj7hZz1MbZ+1rCTKgzG9zVZZoqHEd5VhhqRId14VdqTD
         a97A7aAuO7rzk+S4shG5cRvohfcOlAvS+yFAQyv9nSMD5pPjh6VRUbv9JMFmE1pycb92
         keXBRSEnKVscSzhKPG7NszHu6IQY0eIGyo26noTuch19pbb89KhO6TvAkMn6J/7S5LbT
         6RL4oToqG4MGnAW3v/roF4EAM8AMEVIrxn6UEFREk/nN1VVJHTuVWaOajhrHZ/Ig0aGx
         26jg==
X-Gm-Message-State: AOJu0YzdRCCHDQmdknAWy5kVj0om+Anbgvoyw9uPM61eIkMXSg5StE1q
	JLosjQr24BVhrFtgZcXnZbcU+7VoAUkUARyqBJa1zKAYbik=
X-Google-Smtp-Source: AGHT+IErP9SQJfg3eek7PNUhzNdrIRG39juNJVn3VmyuwSfWpv7iZgkPvVL31M+evfZIdAVUr/dsEQ==
X-Received: by 2002:a17:906:db05:b0:a28:dba3:3fd2 with SMTP id xj5-20020a170906db0500b00a28dba33fd2mr229850ejb.142.1704364988823;
        Thu, 04 Jan 2024 02:43:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709060f4500b00a1cf3fce937sm13664229ejj.162.2024.01.04.02.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:43:08 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	atishp@atishpatra.org,
	rdunlap@infradead.org,
	sfr@canb.auug.org.au
Subject: [PATCH] RISC-V: KVM: Require HAVE_KVM
Date: Thu,  4 Jan 2024 11:43:08 +0100
Message-ID: <20240104104307.16019-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_024312_936688_5626101F 
X-CRM114-Status: UNSURE (   9.91  )
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

KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
supporting architectures select HAVE_KVM and then their KVM
Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
consistent with that approach which fixes configs which have KVM
but not EVENTFD, as was discovered with a randconfig test.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig     | 1 +
 arch/riscv/kvm/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a935a5f736b9..daba06a3b76f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -128,6 +128,7 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
+	select HAVE_KVM
 	# https://github.com/ClangBuiltLinux/linux/issues/1881
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
 	select HAVE_MOVE_PMD
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 1fd76aee3b71..36fa8ec9e5ba 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -19,7 +19,7 @@ if VIRTUALIZATION
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
-	depends on RISCV_SBI && MMU
+	depends on HAVE_KVM && RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_MSI
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
