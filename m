Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2C9C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 06:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVQa6T2lr/5Qn8/XvmkJMHUhOKQwBVpTSqchwBBbFdA=; b=m8XCq7f6jeomNY
	tNIwq5pwUdAL/1v2YR14pvUI9Yc+6bkbYcv42IqWOSiW0NY4UOkGj/qegzvJjhNAkcL7JKCrGpi1r
	ygKE2D4IiBQAwVSFW/zBp8m69A5AXbvH3sHb5DliK9q6vTFYMBOe7UYbqa9Ha+XK8nXjDzR9D7n05
	PS1AXlu1nzk7PlyNIYBI+anO1qoIDPokdMB6vD9S+KCcf/aL2PEsqxVddNRac7UJOTuQFyXj+Aozr
	lZPb+aDJxYdZEZGzF8ZSLo7Po61b6yWEMxAWRGLSeUpfvBIz3tK/llh7yXz2pJ+WvdDAGjyyhwhBu
	YGIvidNPTis2NhXMp6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRva-00DI3L-Ji; Mon, 13 Feb 2023 06:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRvX-00DI0s-F4
	for linux-riscv@bombadil.infradead.org; Mon, 13 Feb 2023 06:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w7d4Qtypw6ksd0rXUCdfOWzkU5LDKwcQ9sGuN3ONcAw=; b=k5Jk8JhzYzbnok1c4Zb7WJfAt1
	gsGvQQvq91MNDmmxJDVRKoQVzlRLgMehHk/iBMxm0hM2ooLBetQE0XF/F5IWOclBI0aMvXoP8gjgr
	+dVa2cr38T5BVqRd1QgjISorSUVh0Ma+zkVoGx8Xw19+as+E7rRQZzmiNxkp6OFpPgINNMuQ9XOoy
	56EvWtZjFxmdhNnpeXQDeX2IqpO9ARYjgOzQBDKlXETu55VHVzNEmpndrKZjg75pJtqniFYj2VSrm
	Jf2E4jXNgkz4CF9LZTC6D1Hns+mxJc22MKHdCTonmPEKytOH6TZ9FyRIgRRhrg6Kd0dXbMdEEqQSu
	6WSE12yA==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pRQqc-009BQe-0J
	for linux-riscv@lists.infradead.org;
	Mon, 13 Feb 2023 04:53:52 +0000
Received: by mail-pj1-x1034.google.com with SMTP id bx22so10759987pjb.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7d4Qtypw6ksd0rXUCdfOWzkU5LDKwcQ9sGuN3ONcAw=;
        b=31KnFLQ1jXjMLjTchl1w4moDo9CD9TiKyNs+4OObUXS/bu6U2VBl4731Df6PD7Y9/g
         2XNYNTjZyG7bXyvHEUioI3gERdD7LvSkrCK98xrIHVYmvA5asSACcG8DzwHY9Elw91gc
         KrYDDfbQ0WGQKLe3OQqMCXoSdQognrXbgKTQeLFi2du2ewZSoi8M3yoq4iVIAUO0iC8j
         c+HEm7ay6XzwKJD0dg054Mp6qh6jGMCArVxGFrAxDUUDqIrGtX7IhEKyTa8tCMlq6uPJ
         YpP8FzRMvT6ihcXz/hH1cCXAqlBEJCSPIWcmpziCZgstPBhZ07n1DnUYd6pvHpmuIT8C
         lNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7d4Qtypw6ksd0rXUCdfOWzkU5LDKwcQ9sGuN3ONcAw=;
        b=JOqvR9VykCk1Nwy0Z2/ygusWrX9csBvacep3zHR3iqF0c2JaXhmdrJ5lfHdC8p/KFS
         MhwODG71ZFMhuJWKBxautiEx1fUSSX6f4qQ//Gt6GsEmFY0rMMRnknCERNREACNTPfjk
         m8ZYlamuNgku/nByUzy3mu4zw4eXENh9+SK9i9VXz4i9EGdFIXSQ9mn580VPdgzSkx9w
         d7I1eyQ28LsTogpzboT1LW/iSWDvoSK8urASQlLi41+amHAkVGUpfkXDN9J3R8j3+e08
         otsTa0nMpiu0tsEZ2FWew6QEXfUn90odwEUISn1vx35RurGyQ3VnixEDf+cqeVDU1rKM
         EIdg==
X-Gm-Message-State: AO0yUKVaf8jZAqing/HZw96ZjVoUnCncZmM8jenxzah/F2ylsDWERvD8
	mf0F/BsHJSBt/kkeF4hOW4rhi/QuUZG5KaaN
X-Google-Smtp-Source: AK7set/LsQt20km3cdR/Kp4fADKzzPOahuIH182d8bTSETTWkRIjfVk2zOeUnxJfWQP4yrfUrjZ6+g==
X-Received: by 2002:a17:902:e843:b0:199:2a89:f912 with SMTP id t3-20020a170902e84300b001992a89f912mr27069676plg.20.1676264070858;
        Sun, 12 Feb 2023 20:54:30 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:30 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 20/20] riscv: select config for shadow stack and landing pad instr support
Date: Sun, 12 Feb 2023 20:53:49 -0800
Message-Id: <20230213045351.3945824-21-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_045350_629167_6C2E0982 
X-CRM114-Status: UNSURE (   7.38  )
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

This patch selects config shadow stack support and landing pad instr
support. Since shadow stack support and landing instr support relies
on ELF header, this change also selects ARCH_USE_GNU_PROPERTY and
ARCH_BINFMT_ELF_STATE.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..9a39ada1d9d0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -132,6 +132,10 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select USER_SHADOW_STACK
+	select USER_INDIRECT_BR_LP
+	select ARCH_USE_GNU_PROPERTY
+	select ARCH_BINFMT_ELF_STATE
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
