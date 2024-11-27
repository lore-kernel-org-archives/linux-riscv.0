Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2294BD6ACFC
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 18:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoNPYGpxoCVTXPIYKhv+hu1bNMIHtHjXsjiEXgiFULg=; b=p9cYXRDuHxRK5R
	0g3JEXwvACRrpF/3vK1/TCOj7tqBkV69/+km9Al186rjuCuOM3lrIuS7kRJuH1OvS17udRKNYUJLr
	uX29v3zZGRnfJtQNKQgpmjT+NYwunBeYWGlMqdKtzXl9/XJVKqXClw3K2vMydiFNXCDTSmOZzbynQ
	VtnoGEl3sFyAJI0qMyVTfXX4BledXH6CQcj186rLcXibN0x37vUO1aKONdQ81Jc5gyDpp5VkcU+rg
	/kvmuYVxr3zTkUYkgTLuQFD54OJxeJb/xDRxoyVrurphgLTqpYkAFRGwkEJHUjpk4eTsvd/J+Gxld
	hhGG1GlZvA6q6uzIJRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGMuG-0000000DqNO-0LHB;
	Wed, 27 Nov 2024 18:36:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLru-0000000DkgN-1aNu
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Nov 2024 17:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bdAeGv9r70I9AKk6TiTHcOSKMA9eOfxpzpLIhOQV/Tg=; b=qon9q409VFeV5im5FRD6ngQEaY
	fNOLBSjqMd83Ouudm3WwwKrm0IpdB+0TO9zqdIES7ofbEN2q9ZN3DMJM+X9X3aMbIrH70AHlRsyzd
	Egh6E6CtWkETb+t+4Bp6jrLjUes/JvoW47H0nnscCkSXenb6c62IrAR3z7w7T99SeyyIhHvAccbEn
	vIGdc7IMIyqeKYhmPqhrkbv/Chac1QWb530iMnJTdQznt2YGTka0/wbAoqVMO2bKMC0MnT1CDg08m
	7X7qFJt1udSfcpgTLe9G5u8/EBUmTQZRif80Xt8XVD6bTtCybIcVyjoKR92kpjubDjNPvgapw42TF
	a4PP6UiA==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrr-00000001Rii-1Xmi
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 17:30:25 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso4788526a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 09:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728620; x=1733333420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdAeGv9r70I9AKk6TiTHcOSKMA9eOfxpzpLIhOQV/Tg=;
        b=ZTmJQWS6RtZqK2BIMTl+p/iUIb8ojTKC27moED1Th0h6cXKRbOd9qYB1sJBm01+DjX
         jXVRmfle/qaVXX1ePiWALk7B5le47xdnFFqy70UXe0qAqsoPTc4B4GcreSOXvOrdpspv
         fkOYrYWxzKC9qUmjyOQ4iYyoiPO6DxM2E61IgJWhUGNb3IvMOvCa2VQyop4QjKIVw7+u
         z4sWdgcm3tpJMptSSPizMIYJ1nChAUUwN3Fx9ZnRKuK2jXX13vqBhmr9l6vLsZEo/6L3
         gOUhluP6ivwKVj5TuowqYl0lgJ6S9LeGdwCNjO7AdWdy2N+a0iuxQ6ZPztYMZ5tNaxzq
         zbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728620; x=1733333420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdAeGv9r70I9AKk6TiTHcOSKMA9eOfxpzpLIhOQV/Tg=;
        b=VDuEHPl5nq44a42r+UX+u9K2YLWZqGXyv7OAJkn3SmiZwtFq0x83YJX9my8GMLXSPh
         xoOflMTlICRKqXBOJKWNF4+T5vFYrXsvmdOtXB53BevpmTt7kESydCQyh2iTzBA44eRn
         wQq6uxUPqJ1kHzZzW8J0hRu4JBSDHkcWMS86/6L9CMF4CXIqywj0l/xfJXy+Ff2fFGg0
         nxekzBo7D8wpBY0RHovqnImE60IwHrFXc+TLeMIxSIr/FiyUQeOu0LwEkotJ0M++A5Y6
         4OR4N+1I2dnV38x5ZLHt2lF571/UfjmUYVJ0GzCjCvFxB2+DuRxcV3hVJHB0RaWxgoiT
         j0Pg==
X-Gm-Message-State: AOJu0YxBT4EqfMzFCv+TS8Ce9zvMv1ORVmyCE70EPUDUOuLEbikNkP4u
	7ekL1Me/yXly69E9TrVUDfb1eKpjLj2iOVDuSHLY152S1ik4wzDW
X-Gm-Gg: ASbGncsJt7Fi57lukxEVTm9RU6tgCacflt3lmGVbeqMWjNLXjOMYy003+M5xHbGeOB9
	Sjqk+0TMD4Fc8g5tAymEXyzF/TXYTzjJeGMHX04qwZYr6mWb4/1mddP0KXAqogJdtLAL42wxxND
	/3pfyfoZ1eOpxpPFoE4XaghIL3d23vY+mNYvlXjGNjdlgxQ4Lipd+cJk+fXU/2VzRzQCWjt0ykp
	z0Wws3pdGdQxpqV1yyf7A3eLA3eVrUd/IyMvMh3X3dSS2DX/oFIzslTNOkA0H+aO1DbjkKMjrbw
	6GmlegEgxdAS2PxpfJKuxVzMwYyH
X-Google-Smtp-Source: AGHT+IFBuiAY3Y5+T9rXhE/jtMcxIwZT/PZK882Xa9jD4xmTITkIiWYoAEUJevk5le6u0m/B/dND3Q==
X-Received: by 2002:a05:6a20:6a09:b0:1e0:cb94:d3b4 with SMTP id adf61e73a8af0-1e0e0beb9b1mr7629311637.45.1732728620072;
        Wed, 27 Nov 2024 09:30:20 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.30.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:30:19 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 7/7] riscv: ftrace: support PREEMPT
Date: Thu, 28 Nov 2024 01:29:08 +0800
Message-Id: <20241127172908.17149-8-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_173023_499354_44B949AC 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Andy Chiu <andy.chiu@sifive.com>

Now, we can safely enable dynamic ftrace with kernel preemption.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 75a5ebde4427..554e4e363c54 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -148,7 +148,7 @@ config RISCV
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
