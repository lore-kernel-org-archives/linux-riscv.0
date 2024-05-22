Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CCAC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5MbHjOHQL7NRurgJJCNmcUH6LLyrlrjH0VmI3G83Rmg=; b=ZkiYI7kCDfVgpPKNZQssDMkm8R
	ugEoHsOY35E2+/fwbc2u0XY/g9a651gc2UY8/G5WYy89zDFmM2A/NVQtF+U9hcDnScnARdWzfiy1F
	OF8VBHw8CKR1uwziltIAyvTNZrWA5+Vycfv/WE4Jr/WS2jZG+MgqfE63T50uU0kcyPJwCyiYVwXDt
	2qH/B93Nb4ahVHqusQCEmAUfnrYMn2SwADqNM4aZ1EamOg4H5cTmMfdqNTR9ncn4URjmwM2BZmiQy
	hrkj4clGwCRr7mZBOw1lkLTpU0Yo7m+3j5E7J7SkgFki9B62qjkSIxe3DJHXEyeTcrMlXdUR3eg/n
	uwrcJLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWl-00000001jY5-2vwe;
	Wed, 22 May 2024 02:16:27 +0000
Received: from mail-pl1-f201.google.com ([209.85.214.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMg-00000001Ua6-2AW9
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:11 +0000
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1ec620ccf77so96539835ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339717; x=1716944517; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CdhZH2VylrS+6EeGuf6ae6S+DzMPS8o3sFjSdgWRyqU=;
        b=CC6AnToiDHJg5HywXuWHBkVef5S8MrYFC/y3bk2b8guwKrC/SW6xlqraUQTq2oL5SR
         7hOLx5w7e1ilaslFl5459OQSiao8WBFd1Xk3xfxsJwaOpP1q4vESGEeKOpXK4o7SfIpX
         9W0N4ezRE7+5STiMQSqVHsXH7oekEJT/7oi7owZx0MuZ7A8/3aLwPVqxOsAK2990+fCU
         1KMMTmh9rcT3dA4iJRWg3M04XJGphSoN8HGl5sSzQKEP5A2jbfztvnlv7ct4o9f0Zsp1
         rM8k2naRi2D4se0aaoBKlI7P1xMR76sc+ykxfZe6ztKgQnl+uDcXCxDBW/SNnXQKf/IW
         IlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339717; x=1716944517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdhZH2VylrS+6EeGuf6ae6S+DzMPS8o3sFjSdgWRyqU=;
        b=E0DXTthuEIHeXSYkbZe6xumvs9iNCgrN/ifw9dXjG4zZB79qfHQ6rTWkbXQBpvXEgl
         Wu3YAM8euxOuDQx/F2EgaLu+6GkPPwThqNdWHbjuAgiasMrxNSd/VEGOl/DKZVpeunrE
         0zyUfTC6saHmDtL0s5gBkS2eIB9702omMOx9wOFHmwSWFJG1fd8cH4u+2pRsliT6Faly
         ec2mttegvmzy7DLt3R8lBucDeYVpvqqFtuGsEty4ZYT6DqWIydEmILd4ZyRgejhiHK5Z
         sCAK95O9DHNSdQ6mlMb2jEC3busBvL9Ozh8wFD22tVO5zKO6txhWQVe4Xt7sqWVnn0iu
         pxrw==
X-Forwarded-Encrypted: i=1; AJvYcCVLa49aYrrd50p3Oq04FknH0boEbQgFQwmRj4mv0cFjXaKlMo9YaxG1quJcNKEAVXOGf9vi4QZKscB/sDq/pkWX5z5UG9KhAZPWNY4xeEf2
X-Gm-Message-State: AOJu0Yz9OjhRYrTJ6g9MkYY7K24tThtC8xsqTkqAiKrBDeMcfFRe52BJ
	fL0phbgV3ORo11Q0AZePnIem/V7jEWS5ULRt4I6jU5J36J8E9K0Bb3DLjGM6QuN1HJyJEhMzDa/
	OvQ==
X-Google-Smtp-Source: AGHT+IFXkW29jWSmXKYdgVJioCSYV7fU9D+QDgsIm3BIsuSFmV/S8sHX1eOFRDsg9MXg5XjDONxLYS9KAdU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:ea0b:b0:1f2:fb7a:19ac with SMTP id
 d9443c01a7336-1f31c9e7df6mr65215ad.12.1716339716964; Tue, 21 May 2024
 18:01:56 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:35 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-50-edliaw@google.com>
Subject: [PATCH v5 49/68] selftests/riscv: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180159_024488_FF8EA3D6 
X-CRM114-Status: GOOD (  10.91  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c        | 1 -
 tools/testing/selftests/riscv/hwprobe/which-cpus.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index a40541bb7c7d..4de6f63fc537 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -5,7 +5,6 @@
  * Run with 'taskset -c <cpu-list> cbo' to only execute hwprobe on a
  * subset of cpus, as well as only executing the tests on those cpus.
  */
-#define _GNU_SOURCE
 #include <stdbool.h>
 #include <stdint.h>
 #include <string.h>
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 82c121412dfc..c3f080861c06 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -5,7 +5,6 @@
  * Test the RISCV_HWPROBE_WHICH_CPUS flag of hwprobe. Also provides a command
  * line interface to get the cpu list for arbitrary hwprobe pairs.
  */
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
