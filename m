Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66A5C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xKLr8A46sX878WZ5o8xZejQyblPd52ssDo2gzaqw/Ko=; b=ot3UPMtuWvPA/x3VybM8pdXgDE
	uHl20MQ889WsBnxkdJu06jJAcpWfanujg7Hb3oU4LHDpU4roIL8b5/Pxu70ax0VgCUp3kph8VJ4PN
	Ga0bjf3TowzxZTgmnE2ZDiHzW/ulCuBNXuEUUwz+KTzlrwV9KZppJA6rQwvj/jfqzpUoprEWK+AkW
	yJb0Ye1ZLxdoarxpuGWTj5kK6jVYze5BJZ9QsV/ygn5aZSvWKNaigKri8Sx3AiT4WfP/D0kTRNHpX
	7crmfTgLnscluqfkIS9dMgQPWNzSPD8zkw4oJof1oB31UpnsscflQ/xzWVsCALwjd6hp46IENOOI+
	YWniuLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrF-00000003O9p-0nUt;
	Fri, 10 May 2024 00:11:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqx-00000003Nva-22uz
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bwoIN6qkNAvdiVIWhe30F/ZM8apUP9a8ewoMWfm8QMg=; b=ETFbrRuDuvDcKsFnSgFU075UwS
	GrE2iP88VfVmJXeUxsAbg+lGt0mSDQNhAXiwNhbr1RVblDehgO50U0u6J1oJKeTIC7M+MU0NqEg4t
	qYluWLMmoDk17+PeIFLjM1ES16YLoeNcanODpI98mleNu6YhDmJZFDbSojRQqlQWYRhHkMOPCCYsA
	wP1yXUi89Afem1OaatpfwR2YCzrxkWO1QY1LLSFy62Z45p8kW0Td3WcWjh//YNsbXEUefhSytMbSr
	eUXCl8cN8zDBEbKcA3CA1mcknQA6uhQU6oHZJzlUFvvUbLsvgfx8K0t1sqNH6d6nDXHygFmjtkQtH
	MZGMIJcQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqt-00000001m7B-4C6v
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:10 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1ec6de5fff5so13644705ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299863; x=1715904663; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bwoIN6qkNAvdiVIWhe30F/ZM8apUP9a8ewoMWfm8QMg=;
        b=l8tH56CfRHS2wviHqTsoFznqw6KdSmAjxAQTKTnhozmDhufPwhfMok2dOooDKjMkZb
         o9ZNuO/aoy80h0n8U8319zLIgV6M91w9xLcWeky6kyJIyjlTByXLp8kGyq4i2OLPP0Nu
         kIChtKr6IlVPzj8e7HZ/cdr7pFEPRJCL9WQA/Q9GwV7zbsxPQ3dvqZ6rYqt0kY7rudIh
         Dfz0iXBlJF5fKEWeLmscrOWM7xI4JFTF2uouCF3BxYw/2R6Qx0G9uzdD/ppl0gKs3C9g
         xeKi9joJw2D8LPok1kLOdPGpXQJNxbsLqgvUcbRUgpM1w8SKqSzmWqNjKvkI+fddaPx/
         aD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299863; x=1715904663;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bwoIN6qkNAvdiVIWhe30F/ZM8apUP9a8ewoMWfm8QMg=;
        b=te8xf2OkptkFbmweeUyz1xoROr479QrOR0QEta0lxaJJuQI/fXERlAshG0VzYRfZLw
         NquIKHEpFHRky213J42snPcf7UWcWOJI1z0KC1ApMjwlByeSNRUnmxlPpkCVZ6eKA3r9
         vmF8rK8FF3qqT523o3HAai+gKT9+KSgsJWEF7LLi5Yt4x1zKwp08/xLlOAGZnGI27WLj
         vTRjCVDYed8xHps0fjBjytTgKCsbUBabkuq/dApAcvvAyitRL0dIsPjB/UCurpQbENNf
         hPoOW8hwaVzmeUbS/MymDe+xo5FjP5y/SbNAC/WKuEI7h/rDnQR1XlIiPaNL2LmU/DXo
         Q2jw==
X-Forwarded-Encrypted: i=1; AJvYcCWAf0/yr75BrT/3WK2ATk3Rid9A2YK6hlB9NHhOgh7MpowRZ+YXpnzPN9M2eH3IIW70njQshtN6PrYzZEFFgkxnLHe1Ig5XGvGPa4FQlgFA
X-Gm-Message-State: AOJu0YxZbwg8uv4RqJNjfrNqfXaVvJ3XkXKMgaZnScG8TsR7K+c0cCfY
	0GtQkX5n1oild7/8mirL2ioRDTHkF/FMXj1TCW3wZr/IVlHiDcZyzfS9hU38euXdIF9GuxhoZ6T
	rgg==
X-Google-Smtp-Source: AGHT+IEbRaO3Ij2eSHkGXoI8SykX5P3OggNnx2FkEhJM98+CkdTeaw/WmnIfTcZIrruC+KD5ZR5dK9HYN54=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:e549:b0:1e5:e676:4b0d with SMTP id
 d9443c01a7336-1ef43f4b57cmr31935ad.9.1715299862877; Thu, 09 May 2024 17:11:02
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:58 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-42-edliaw@google.com>
Subject: [PATCH v4 41/66] selftests/pid_namespace: Drop define _GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011108_056221_294293D0 
X-CRM114-Status: UNSURE (   7.98  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/pid_namespace/regression_enomem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/pid_namespace/regression_enomem.c b/tools/testing/selftests/pid_namespace/regression_enomem.c
index 7d84097ad45c..54dc8f16d92a 100644
--- a/tools/testing/selftests/pid_namespace/regression_enomem.c
+++ b/tools/testing/selftests/pid_namespace/regression_enomem.c
@@ -1,4 +1,3 @@
-#define _GNU_SOURCE
 #include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
