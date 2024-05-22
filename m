Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ADDC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wL+jvhqyXod21AgoptyTV60xsFuOKmpNLJ/3TcWthMQ=; b=cNMplMLIfSWUE/m9hkWk5/8dPZ
	kJGSh2MSIJq0pfL1eLROvcbxHQTHMPeJY8MoKITM2KuszOd8X52xMixvCQU2pdsB0twZDZrFQ/HYl
	s/0l9ugJvIJllwY+YMWRwahW1aAVAV+EN/Jk2PAS7l4GBefWDjtzfBTJaDsuhkyYxiGIpsgJHlyLR
	gMLlG4ZSLnP2+bMI3+y8s/uKPbWKybrqO0YyRBc6LiLQRiRMuKdqc60qwrmrhvsqKc33y3V33FEyx
	40nGRKGKhKITVlq6W2I9ISqNZGz36TeilBSWrUy7RRztfyNErXeexbuP8GMOsuEmTTFYAmq/lwAg6
	2pJU2ybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWn-00000001jaM-01qi;
	Wed, 22 May 2024 02:16:29 +0000
Received: from mail-pg1-f202.google.com ([209.85.215.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMm-00000001UcD-3zbc
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:18 +0000
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-61cb5628620so13301813a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339719; x=1716944519; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hV5vKaIDliigP0PvfdQCKt36xDKqbqkdCLWM1sPsWPk=;
        b=Jip2N6a2NuWyfu2/9BnjWWCjg5uVtQgp0oGvPGgNL/EanmE5evf2cXsXytGaWCDqUJ
         sRKOUvYa4JKgPODMhZaiwTItlZihaT7nw++8CDDsUvjexQLzYANM9+F3S2xyyMowODUz
         2Y5/5eqoVZ4dz6Fy+fxiVsk9auNNKv0o0pLljfifB7JkdZEuDJsMGBT066AXvmh3mi+i
         bW4L2e81X3HHxpk4gNpKuqg/iIE5+gE1ZsbgfT7fF2tfSHPpkg6Z0R2+v9h0dd/VrZ/y
         Spztj85PF3T9yKKWsP3xWxhDYh28cEHuOjbqYcZY9YmYbxS9QTXg7ABVxE0QOYG1/rfq
         fE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339719; x=1716944519;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hV5vKaIDliigP0PvfdQCKt36xDKqbqkdCLWM1sPsWPk=;
        b=Q7+d8Mx1Re4OBYvzLAjNrN4KaDWhwB5BqQNqlWEVQg45RhOwRYUIAs/KPEATJEzduY
         vJZefbFHpk4giLhb+w30ZqvRQSwh+Qvo2IROEysf7Syp1qkX0jlahmMXPheeLB6vtR+f
         4XqNZTt/ciOpBoBS9u6gECsR33/RAFcYG8996UXvMRvt1PYiHf2Lnt9yJ9/t+ejemQrA
         Rt4gASaBFUw8NFsRokcxJkoHpsM5MRtCvSLkK3Ps2nEkQpShg4tp2aajvapj2pLg4QXZ
         Ssp2CnQnae3tPw6DZU6Oa9thQ2x+z92gL9p4yxitm7U4g8QFwMX2Mf/QSiR2tBGgPmzv
         H8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXPbRcRruj0r8nztQJfXzVWqfRWGS68bsDi4f7AteLi7PDBOhRg+vNAwF512Xm5dqSs+9CGCnmJO3JuSaUcUh1cV1id7aNZ3B3VD+DxJU66
X-Gm-Message-State: AOJu0Yz5JD5Lx+Gng821z6LsBMoCL+45wjVNrbV1LW5DaTUCnLDf8YXX
	JqXAuXwq/Ewd9kW8GpDVdUvg7no0Z2lmgCP2Wh5coeCB3SXUvvnNx9LjxbYOZN4ou0tw7LbogvB
	w9w==
X-Google-Smtp-Source: AGHT+IHJf7XnW8l3uCaIbtKOYrd79j1um0RYB3UjOWToEbOM9Pm94KWZLjHWmnPYbuyo6Pe/x0NBJ7rbzlA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a02:90e:b0:650:17f0:94e3 with SMTP id
 41be03b00d2f7-676492dc647mr1174a12.5.1716339719405; Tue, 21 May 2024 18:01:59
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:36 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-51-edliaw@google.com>
Subject: [PATCH v5 50/68] selftests/riscv: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180205_606663_852AB20C 
X-CRM114-Status: UNSURE (   9.18  )
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

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/riscv/mm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
index c333263f2b27..4664ed79e20b 100644
--- a/tools/testing/selftests/riscv/mm/Makefile
+++ b/tools/testing/selftests/riscv/mm/Makefile
@@ -3,7 +3,7 @@
 # Originally tools/testing/arm64/abi/Makefile
 
 # Additional include paths needed by kselftest.h and local headers
-CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
+CFLAGS += -std=gnu99 -I.
 
 TEST_GEN_FILES := mmap_default mmap_bottomup
 
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
