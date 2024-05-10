Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A807CC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Rbxkey2E8h47BCVRHxx3URKSe+X7lp0/458xzsg31Yk=; b=NgnT+uZmkmoTadgKOUZYXu5sfy
	aoTXc/0fu9zc35rtBi7uujJ8pq9zr5Gv9CMJnJFWoyQTgb0vm5dcLrbVv2Gi+2wiQurwFSB7getKF
	HCZK3XcFPYAEsqL9Rqfye1hkrRjGAWz//1JAAxAi7XkuNLQB57gIIpIphpjDTG37/W6PqLa1xPCZT
	0Zt3O5MulDhCqg2vvwlXQ0IZxznwIxbtVZegPm2XsTJ4UkktuzXMuVe1qHOakPvvCXbJp3AmM83nM
	3wB11uZ+QxvD4oTmyefLEwX52+WLZH7ZzuExKaDKEsuaP7UeO101qu59Q+gG9uHiaJx4jMdjCWCR3
	kek9MN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DsR-00000003Oz9-0Ue8;
	Fri, 10 May 2024 00:12:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrO-00000003OHs-2cBB
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gqJpZ06+qwlYgGDMURIHtEZ0g2cp0HVan8txW5tNeCQ=; b=EtGHmWYvsBdbUyChEdbEWNgjex
	FItjYuzT3rM2cv2tTA3vJPVTwltUc3UOuFzLpI6zdM9gwupvy/QJAw8O+ylo9RzswEcMeaOPJzsMO
	lBICep/u8YMnP48/VxNBEu3CoarqXljq+yd3RYrnIf09CVLqf3xppLsFiJlXZapWRslXjIYvkaLEw
	29KWuQw9XNurkfeV1aUYtS5+DiTzkslWUWSRdwGwgzNE2MoSJzoS/s7poL+WcAVEKqAajGTOcdHQF
	d8Wg6L0UAPMZmo9fodgdKh7Vs/B6WoWbcdvvyxVXxhvOb8UrGNlaMsYj7TCRYQ4AuHGUHihUNsWvn
	8ZJ0BHmw==;
Received: from mail-pg1-f201.google.com ([209.85.215.201])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrK-000000036KS-3fgM
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:37 +0000
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5cdfd47de98so1452318a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299891; x=1715904691; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gqJpZ06+qwlYgGDMURIHtEZ0g2cp0HVan8txW5tNeCQ=;
        b=xc7XMQRdJ5xqhTSGSuBQNGl46rALhgvqbntniTplXl5pD3gFVRi0iW/JnkQF55bdGg
         7+XhYoO3W7iD+nwy9bACoT+Q7q4NpROLAPxnK3vHXJWgUj5VRQT39rRxPvNU5FKRWE8j
         5QPhfxD+rFz1VGuyJlsUj4eIyqWJu+rjiYcwTWe8M7gCUuQ8fed2i5e6WpNkqs9Pww9L
         oe4FoUMokhJpEK34Tdumsu0+PblsLwM0haBk8u3zVp/xNzq3x6yFKeBcnkJMrpSWe5gF
         E6AqvK6WOFL5EsBgyTprjnytJhFrkxOAUgact/ag6s4XU43WoWPhgqjPwcmaqAVn7Oju
         /wnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299891; x=1715904691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqJpZ06+qwlYgGDMURIHtEZ0g2cp0HVan8txW5tNeCQ=;
        b=cZnN8Pw3WLvg5LVRQfEqSkBpKalGrFo2C9Yw8Vs3lgyECkT0Z2kHdNFZs7uAvCLv4/
         kR/NS63ms5+jIothZKt6X9vQBBfJ1TKFkrMbOwYghD4yDglzUJak7bedIbrgLVd+RKBu
         RXLzFX7yZILPgVx1MD65lqZ3aLWL99btdEYM6y0rSUXcIUDeIUyuiMAzx/acrkB5uBqC
         dnTRyEB+XsIT1nqXXif1dS+DFfT2k0JFCTgmdJ90MOAvhQgIEh1rSMU6tKYd1xVA0wfn
         nHVgDuETiJQWWrTvsEI+XGDWwTgrW8l1+SDrdDVZD4oo9yR08c4dAiGTyau2x7du5L3A
         pi/A==
X-Forwarded-Encrypted: i=1; AJvYcCUj6jxgs9hamuIPpIX3qKDdA85fZOw6WHIJ4HPoT+lDZgkvuRBDI4k5ljNQTbyO6gkFHzkh+CD5tGQa4uQSf0bdOJkuQV3u9DYQ07tLnEo4
X-Gm-Message-State: AOJu0Yz/CDF+ox0Dyzt7rNRIyIwU4yH9754imgOWCpFRTfdpX2yVm5e1
	VIOXHSzhNkUJPBhxaKRKZCdyu12OZmGOdGYUYHhWRai0vq/DeM5x+B4VXRTHyCNCTw2bNjEyy0y
	R2g==
X-Google-Smtp-Source: AGHT+IFvnYt0ucR3iNwRUDByJjohutRzVbgCY1noF4/O8GrePk6IXOBinafk3bQLpiFMVdhzNUfEhUzwTzU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:ac02:0:b0:61a:9ce7:90ea with SMTP id
 41be03b00d2f7-6373f599e9bmr2257a12.5.1715299890660; Thu, 09 May 2024 17:11:30
 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:07 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-51-edliaw@google.com>
Subject: [PATCH v4 50/66] selftests/riscv: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011135_039887_8DF19D90 
X-CRM114-Status: UNSURE (   9.12  )
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
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
