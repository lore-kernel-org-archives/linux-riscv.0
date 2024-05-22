Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A3EC27C41
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+Qfm26FLxE1Fuss4v8ZmccdXruWYYJe87i2OyTA6MxM=; b=YByRAoHRq0fU+GKqNMjGzdvONN
	2PZxw6hRsuxh37MFgyhhOioHioTf/XmJk+Kz9pBqHIsuLkb3fx36Qo4hoMtvNnRfCOdovIDVVpNBa
	mQxJ5iGfn4gQ5SzPgEDHcRObA6/XhOq9bR9NIklcTxOqRDRhoAIB36CO+v/vLeEkFV38d2LIF8PFw
	PlDBbWETSs0oA089J0tl+YmqcO3ypdN0GWKWf0IcdCjCF4Os5DtZGOHrcotCCk9EbxMMgPwW8eoWO
	uuCBqBUE2Q6NHDyyblGGFmlHnZhYlw/KQA4k8iAIoIz1T5r2e272cBXvKZIeZJ2kzYwNO1vABggPt
	uBG0b66w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWc-00000001jS2-0Mg2;
	Wed, 22 May 2024 02:16:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLc-00000001Tm1-1chd
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XgrygNW8FFpQrXyNymzaa0urS9281wEmpt9DzZAFNUw=; b=opDN2kELUlK+b0oSUpQH7M4CEt
	PsGudyu3/R5rJQyN5MbNHpEH/A3cPJiK+QfQcvcFUU3LStuzVw/H3upe97Jr1Zp3zxW3A1n+Kx+S9
	57mGTCUIAlPqA+GM5PXcMXtN2LyPajkZDXjUNiixA/PvERMCzR4pPrGlfl6SxtqXJYMpQMByZWNWZ
	F0AxSCUW55Kt/tB4z12t2ORlhKi7DmUuT7zZwr2AfHi6JXIMBP1L4EWAyIs5hMqJNPeiJzggx7enS
	x4FkPsok93zZ/tg8pBnjLF4pY22ydCE9dsvq12aF0w3GivxW/ra3ZZE3uLQGS02MC+XPHnTY7uFHa
	P3wnSjmw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLT-00000000Alo-0fL6
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:51 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ec48e36217so112405935ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339630; x=1716944430; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgrygNW8FFpQrXyNymzaa0urS9281wEmpt9DzZAFNUw=;
        b=HrxhtPEBSRr9muy0CPok77/Jh1k+wPC1lnRq+i5yXyXRQAZXIkUVv6bmTzGe7w68AW
         u3UsotcGg90jO33c/6Hc1BC8O72O+TsHB4Mg7KiGF5Zf1P5a4quSthsXtOtPhsVfZT7a
         KjDJeBt+RHrFfW+9jP9mfU8yq5CHUyGXk5livB/UIZTKImsAxdGi6CYNKhRDYEvn5o60
         VRFGb6Q8GkGmJtoKSBI66PD7XXkPRYfTLlPxeYCB1FkoyedrAPJVgCADR2SpFEaI2DPh
         ekMFlzp1C0bx1BIeIJ7LE0l0FcMDlgnEaXw7/tPPlq2pWu+xvb6HDpe14XP6+/YwvMGN
         5WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339630; x=1716944430;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgrygNW8FFpQrXyNymzaa0urS9281wEmpt9DzZAFNUw=;
        b=IhMcJuLsV7q27gd2f/Qedbl3+GnZiC9cTBLrEOdPx/DXEh5NQJok34QlF5lXSj+nlc
         dB4vKM1juIyZ09SrrSCUIqnqAsjBLNX5G7ou2zBPVobmc/OYhhwoP/eSZ96Z/L3Hi927
         YXinFCmwJXVh2lv+aTo3KlD2vqd5DQWE7XGECRh6Zme3N5ehsGbfalg9WNx4E3lictm5
         NT5Bf8RoaPVLw/Yu8hy5l8jBo0NRVGMg1tK6UM+Ook6Luf6iWVJJDrlmZ4w7aps23hED
         djd3bB4cqCEnUzfM9cBScX3TYmLhW9k2Mq5Y9t/6vBB4nuN1zOvJ5p4KYRRiJuZs4hz6
         t04g==
X-Forwarded-Encrypted: i=1; AJvYcCUx85PCPPRfjAOAHqGln5rpQkF4mA9N1+xq2zaDAdjaDFw7tir2rF0xvJlXLbDmrORNYqKfkR49kD4yy1I/MGlrD1da7pOqS5j+UJgnMeWO
X-Gm-Message-State: AOJu0Yysdz3Otk2DmCZxQsH73voH1Y/V8BxkIQ+OYKtw/LJ6Q+FasGVs
	9MdDHiyHtOSLh2IixLD2oBRWm6lQUHIRO/ca/RVcTDo9IWblnqHAhtX0Nqvi55G9tU5djrINuSA
	h/w==
X-Google-Smtp-Source: AGHT+IGqHThcRUahWbcFDersReMiS//nm+v/RIRKei4uwQwaSYbb3yGxofUUHSGZKuMDuE2fmv9rxHnFGrE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:d4c9:b0:1f3:317:50f3 with SMTP id
 d9443c01a7336-1f31c7f68f9mr273175ad.0.1716339630262; Tue, 21 May 2024
 18:00:30 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:07 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-22-edliaw@google.com>
Subject: [PATCH v5 21/68] selftests/futex: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_020043_193322_8EAC3ED4 
X-CRM114-Status: UNSURE (   9.86  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/futex/functional/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index a392d0917b4e..f79f9bac7918 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 INCLUDES := -I../include -I../../ $(KHDR_INCLUDES)
-CFLAGS := $(CFLAGS) -g -O2 -Wall -D_GNU_SOURCE -pthread $(INCLUDES) $(KHDR_INCLUDES)
+CFLAGS := $(CFLAGS) -g -O2 -Wall -pthread $(INCLUDES) $(KHDR_INCLUDES)
 LDLIBS := -lpthread -lrt
 
 LOCAL_HDRS := \
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
