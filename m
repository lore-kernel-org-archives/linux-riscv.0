Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F305AC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5XdjMhKhC6Dh6mF/YEeAC3Za/5yOsxleLGjPQDry034=; b=jpbckPEjvVTRTSL+59yPPZU1a9
	NzTQWxmhSZlTl4LB0oiMz6W8RXrvlAZ1dTRXqBdR713BNL/VHi5YoYKlFyQdLyUUKeVhuCrVSTR5G
	RYSLqNzxjA6NkC5Yg47brou8iQsO5X3lv4rPxCpGf1xD8md3Ob7nyjUfqy6pH6hcWjS2mjI81oKqX
	qjvNuyYaPs7F7JHAlR/xfGdlxuz5yNVfdtMAv/71ZXvfXAdhP/LWiYEGcmsKvfhBuSzzihrlfRkSo
	jjAyzULLb4Ivn0vkvwEdB3YTu24KcFcn2fgrNjWJzUt6YAKB+MfKKIJym3bTzqriTiXDdyjs5jody
	dgug7LHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrI-00000003OCu-1OvC;
	Fri, 10 May 2024 00:11:32 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqf-00000003Nec-21ti
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:12 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5d8dd488e09so1543571a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299850; x=1715904650; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bektZwrY6X7Dpw89yPQbwlH2LMGiwkQluDbu3J3hz3c=;
        b=jJmgGeZm5T6tidqgt0I4R5z3gZmy+yg9cBlvob1mBO3vQNcrOA218I39aRYN7cVTCS
         z9TD4sOQ5pY29323wUL57P4USi9VkhGWvvoO3eL1DykhnDZNKsAtWwcfREG2PaIqV5sg
         wK84tQ6GokZAEnuGJqglf7P6D+hBuNcJpb7Ftx38dQOTbHZ4weQKc4kQaWCfEbxc9Wru
         WmXb3M568/e+imr3dwUIyzOHrzrg99qkZRvX3bDphEh2Jemz/4GecArH+AthufwvuPdT
         0Fm5zroXCD7rPy1QTrNcLjdYYyOmTQSTCeIBY2TfC4uITqG5fe6I5xz0PhpmZjN10Z8E
         jl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299850; x=1715904650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bektZwrY6X7Dpw89yPQbwlH2LMGiwkQluDbu3J3hz3c=;
        b=C3gk+JQTH0SDwoBx4rZEM1ngTBcJlubaurSq4xBK2Be4OoGcGgFbeKYvn73blPeCxp
         sizqtWmnI/uHLysC7zygTMf4zlch+v+AoBOuuclqc7d2cXQWLg+AY6cWoqGGymP+rv9m
         5zwkAV+/w4P7awcQnK8PhrO41E4ZwZL5IP+n/IhODG7dRaFjLWDkEmZ4p0J/ak0MUyBg
         89J5G8f8rrmTpVd/YlLMWqOUxl4NplORKoaOO9Rsnl1P5YQ2DtmSdUnyDhgpWW8PCf9l
         DU3dCCXZOOMG4s02Exx0B6KxGN1TYMvVL66ZzGpdDx0dWm3HHWIL4C4lRV+U38T1ZNv0
         Jojw==
X-Forwarded-Encrypted: i=1; AJvYcCVFBhT76SKCbfRGGhMZXrhXtLs4rAZznIbLlHEa83/JNj0dssyuhtO7rAKX5E90Xzfm9xteai3eTUdnGYr2AbBsiSZsPW0ruknjxbP+iuJK
X-Gm-Message-State: AOJu0YwDRKkL/8aam+JD9XMxnwvn1iH0aJQwMFgzwhzMBzD/3R31ZIot
	fauFozezwnDjPk5KSUw6eYwd+dCuSoWGBo4687jV7fAb3/KWw8x7Sw8zXiiHFkrCJn52QKJe1Db
	P5g==
X-Google-Smtp-Source: AGHT+IFR++Zjt53C83A0ZTqwu8l54Ivkf0uoSk3K8zVOgmN6xwNzb6wjdLB/lVbnRF6C4M3ptYxz3Wu0FZs=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a65:4504:0:b0:5db:edca:d171 with SMTP id
 41be03b00d2f7-6373ce415d8mr2316a12.6.1715299849968; Thu, 09 May 2024 17:10:49
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:53 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-37-edliaw@google.com>
Subject: [PATCH v4 36/66] selftests/net: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_171054_200581_5BF22004 
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

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/net/tcp_ao/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/tcp_ao/Makefile b/tools/testing/selftests/net/tcp_ao/Makefile
index 522d991e310e..c608b1ec02e6 100644
--- a/tools/testing/selftests/net/tcp_ao/Makefile
+++ b/tools/testing/selftests/net/tcp_ao/Makefile
@@ -26,7 +26,7 @@ LIB	:= $(LIBDIR)/libaotst.a
 LDLIBS	+= $(LIB) -pthread
 LIBDEPS	:= lib/aolib.h Makefile
 
-CFLAGS	:= -Wall -O2 -g -D_GNU_SOURCE -fno-strict-aliasing
+CFLAGS	:= -Wall -O2 -g -fno-strict-aliasing
 CFLAGS	+= $(KHDR_INCLUDES)
 CFLAGS	+= -iquote ./lib/ -I ../../../../include/
 
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
