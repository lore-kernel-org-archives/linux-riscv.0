Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FAFC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QJXb8tkdXXT7bIRuIvZjkL92yJQYfDfRK2miSLAU6+g=; b=FODoH0wHG9VIOiHsloaahmkKsR
	L5CIsOh0pILi0ajsfg6D78Dr8COYutHTUKWrs3eAQggVXT+mKhsfq2g+j883jVsUCLfEwLfKrKBYF
	ZTlf4EE+9OazU9uHpHqgIjdgjJU55VVJxLQs8+QY17dKxoSg7jFCJtAEOLUqk2NSR8xfLy0/TeQMO
	df0/1sNfRLd7axzPKoMb01SY4aBy5w6GYPSAa0AX+YnajkdWbnA44xkgZGi9XXgaZFOTx71yNzSop
	rJbnvrG9BuZXbGQqBnn2H+FviS0V6byRaIP0Jni6u8Zri9QMT8WnxDUMBvQzdXW7v0d/DpDPsznr5
	oynrz9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esp-00000003akf-1Rvx;
	Fri, 10 May 2024 01:17:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpv-00000003N4k-0HzS
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7gmE/+1tJ7Ep2oqmr2taMm5VZCwXrcQv9eKCkUAc/7U=; b=OkaCg/sdEKDaXmVRuZ63UE8dxq
	GUMDjA3sugxSYwbVmBIssGaCenowsAtyhkmIFOY5aiHk3DFzgqUt5e7csWLceSFLe7+H6IhwOvR8N
	7kl3CVfYRgnhjhc1rZwdyrxVfsPAgrIgdPbxmPgtEi+EgszRG7NVvVajo8xsnpCBu85HP/f0OTF9Y
	WNktqAN9iMqJuCe3mAVa5OIyRKoWKildD7aeifmzhpeQCNXv6KWLoY/t/WTQ7AicdyUhh0PQ2GRI6
	5Ebj09wGqBxSQIIKwNwuidMm87+xd1O9+zDVw+VFMLxD2gOSZzQaQX/ro4aInD88o6B+Wgn4RsG79
	EQxmFNHw==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpr-0000000360K-0quv
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:05 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61be23bb01aso28184227b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299801; x=1715904601; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7gmE/+1tJ7Ep2oqmr2taMm5VZCwXrcQv9eKCkUAc/7U=;
        b=BEVJX5cxYAm7KYLPOb6bGAmMCL6h4dwgO3qbe2isd6py5OCJq+rEgVo5mG8YX3dSlo
         quL48MGD7qDS1ENnUETNr6hbTV1FakImT22sbMDRRYO6Z+zQ2oO8C9A2fACbcVDkQFm1
         9M7UE+m3TOprw6jmngpxe9od/fM9AAo2GTmcZAkCBGKKmREab1aZP8ihC0P1q73/nSsU
         bVlPhGkrPXwb6nJFu6X6wkUxeaYRDl+o99FNMwgyRHn4QSYN9xWV+CPPRVoOFA+WjBwK
         KQQYNaAeOeE6JaqwffoYLG8QefYbyUu/h4kSVMCXnxDMgbD4S0bYpavvaqOiOTyd0HjU
         Iywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299801; x=1715904601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gmE/+1tJ7Ep2oqmr2taMm5VZCwXrcQv9eKCkUAc/7U=;
        b=pMetT6wBnhdjQyo1KxchjnZy06tzadL5lIUQwbDeVV1PP6s4bMDwY5Lb9Bbm5yEZJq
         JVne8DxsPLGY6viqH8oLE6MhSnkU/i7tJQ4TFmNDGiQCBL9B9lvJGzY8y+EhijEHDVOA
         wlf3BwbgnS4cEWng6P/gT0ZERKGvbVxDaefGErvhY2bPszJ9U/n9EJOkUniaksWajRx3
         qoSfQpCdBJJiDuAMcqL8aKPk/hR21A4rGFVMzn+WEWmDKboVcui7jS7/RRXRrh4ZBShY
         THtW9fhGulNLu1+QGVsuWRbDsbsSvVbfeNSAvOxYugLpmbiPprPG9/0ys1FAMcv9HIQm
         XOGw==
X-Forwarded-Encrypted: i=1; AJvYcCUoYQedHujE1qmolGXFPN+95azwGJOWNEfzWwnK6zbQOkssH4xk7EG6iUk8c/hvbUcC8EZQxBgNS+cAtMh15zvNTKjU0CwBvh1iP+s2/Cy4
X-Gm-Message-State: AOJu0Yz+Y/P8/vtpHQzkJuyaU7OJuJ/TPCmECKbLwvWbpGS+/z9K/AwB
	UI9OErPdgLbd3UYzQ8KyG9zDVDk49ULpYAU0U0ULi9l5iug3xbazP7IPboimR0FKvjAC03tYAnC
	khw==
X-Google-Smtp-Source: AGHT+IEoDu0ZcQdyPuiQJKnDncyGUY3Booo+z0EW8VBY1J3sHBK3DT/V9Dd5nwidmRrvGe1vHB9FlAyGRV4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1002:b0:de5:9f2c:c17c with SMTP id
 3f1490d57ef6-dee4f37bbfbmr289205276.9.1715299800737; Thu, 09 May 2024
 17:10:00 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:37 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-21-edliaw@google.com>
Subject: [PATCH v4 20/66] selftests/futex: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011003_559916_6B1EE414 
X-CRM114-Status: GOOD (  10.02  )
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
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
