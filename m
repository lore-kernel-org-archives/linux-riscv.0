Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7B6C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0c3XMucmizZjl3WkcR+gDYNh55gjwQkWNKGqKtgKJL4=; b=meBRxsdxXfpBHJDxuQ+kOsgqLc
	HjgmEybehfT9DAR3UowfHIjWtKRAAHBKsa/prouT4Szki8W8tMp8sdbUwXe1wOdfTq0kchfFfg07t
	K/1rkAk5BuG/WhYalg5wlxRQALzXnWJJgNSlVOwF2UClhP7KabdyxVcltYy3xKnfHH6b5x/v0LExY
	sVhaCKLCcBFMlWkjAivrNhEdgx4/Iih1cT+/M5ZSy7ECScL+Fu1DU/QRyIKJHcs+/VCFFWrG7uDvb
	SVD86IA8xJEuTkFo2+B7lZtOHvKzIwXI4VqAJtg1HCvHj1mrH0vzbcwtlY8D4sVenufJnqyCDMekC
	5XKIm6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DtH-00000003Pgm-17Jp;
	Fri, 10 May 2024 00:13:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drv-00000003Oi2-1q9T
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AuBb56Ya/JVHt3ZPygn0bw49ZbbB/FQ8kpaCbLZgiyk=; b=pZjvhQkEU1aLXSvD8B9ne6S1NZ
	zMQm6MVuFk+IMgtIUeFwD8A8Xzju96KmdDfGsCTnnn+5Ecg4KmNXuybiaqgCx9GC8BtKXopqsTSM0
	CNlA8wgEpRY559J+JfcEMQH/nD5HUZqRJloFhGU9K78Dhr7zZwgRiwnY/GLs45u84rBjCCth7dVD+
	3hV8rB7ppfkIWKrjbp9T9nIGgzb+Xcns/DrcsPC6+Z1tgWxvgFxc8Ne92nhcYIRNGXqOneNNiCY0p
	xhZWNm+oz2xQ/R+BrfAhEBAeK8QulO/EzUipJrEL9wsJI3d0+V4A2rSHqg4Dq5iZ5s5+ivhLv3972
	bJxYCEGQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drq-000000036RQ-2Gf2
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:08 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b4348fb84bso1261586a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299924; x=1715904724; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuBb56Ya/JVHt3ZPygn0bw49ZbbB/FQ8kpaCbLZgiyk=;
        b=NldjvsebsLUwf7HK5t3/y61Vd3Ye7mCF9oHZkl0Rvr54kBBwjB8OM1khvIFcSZstyd
         JvgK9ZbipHqR6Aj+volizLH61XZCuGMuNsZxra8SLQrqDcXwLM1s2FtZStuZEiu4Rg97
         YsogRa4g++dUGZAtFADJaVqUlnRn1HfRMCidw+dm7K196X/FnOEvROK+bxbXZMln8rGr
         bntFJS5uhbS24DK5viHcNo5DaMLGDvozoHdW228JbLb6/SkGNiFE0mElsGF7llj2U1EP
         B2EmvprciVnMKr7sWPStDNZJ4YFyJ5megeBQftMi2Ph5Qshm/kTe6rlTETF9B64dA0Ld
         JLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299924; x=1715904724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuBb56Ya/JVHt3ZPygn0bw49ZbbB/FQ8kpaCbLZgiyk=;
        b=oVdrmL7k279wp132EYWi4eAd7deSonKuaKdVPDSLRKjg/4uI9nSe005PTNsjax/wWa
         OXMrgGwUelMw8zTs/B00KP4osCLE85CGkD5ntTStD3s+rRcgsL9lmQrpJJamj3+WKajz
         fg9uu518hVQM07c4UCYKbqVaTlYuHpRKxK5vqsIwapEAJVFng4mui5M+is46VymoicNo
         13g5pPbwk3GxAygE8uPOlIFcIggyAqLbUtBd6KsTrTlB+asLGDXdXKWE5XqNVkKDNkmp
         cdUzroZ9RLGXBnDIDuseRxlOj0tpgQMa3JJ45hNoadl3Lm2ysg8qYFaljVQu21QLQYF9
         cZQw==
X-Forwarded-Encrypted: i=1; AJvYcCXeheNxjmNTbCwzvJcdY0GLCyJ9750KPssknmcaBKIy+nG84BhUr0b61+SgvRVYtDW7BpCPkhXwFY68gME3Kjzc9czYGKg8JOrkZtU9vcrx
X-Gm-Message-State: AOJu0YxMM+cRK3ID2CgvcWZdgUHP8WLcj5XpfpSRF1XTu5sGU9Dy8a73
	vPq+/1glwXNjW8OB6tBIDz7uyT23rYI5R+CaXVoAZtD7CpKkB5bDcSbU7QgcxSj6scmk91rW7UF
	RJA==
X-Google-Smtp-Source: AGHT+IGDiT6r5MtSiTKtFOeh1TnvuA8iW3sg04Hs0Mp2HYr3hoUvchEofnYDdFYeElPPK8QwfKXlxZAkHMU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:903:32d1:b0:1ea:2838:e164 with SMTP id
 d9443c01a7336-1ef43c0cafdmr333715ad.2.1715299923621; Thu, 09 May 2024
 17:12:03 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:20 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-64-edliaw@google.com>
Subject: [PATCH v4 63/66] selftests/user_events: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011206_745579_BC53605F 
X-CRM114-Status: UNSURE (   8.49  )
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
 tools/testing/selftests/user_events/abi_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/user_events/abi_test.c b/tools/testing/selftests/user_events/abi_test.c
index 7288a05136ba..a1f156dbbd56 100644
--- a/tools/testing/selftests/user_events/abi_test.c
+++ b/tools/testing/selftests/user_events/abi_test.c
@@ -4,8 +4,6 @@
  *
  * Copyright (c) 2022 Beau Belgrave <beaub@linux.microsoft.com>
  */
-
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <errno.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
