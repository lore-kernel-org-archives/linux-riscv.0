Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D125C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i0rL9g5v8TW0nL1Q8UeHOkH0XQuxIhPX8D+njv+tE7E=; b=uVU/H4jnTU/D9yb7447kVOSQVd
	UDTTasaZTUv7hOBLQgWwiyWGMUDJ41wcCToCD3+Vxa2w/Ry4N51mSM37t7/B/cjYXoyLi3VwwDtTt
	QiQ7Bk6YtMFTREvZXYeFg/P9kazxUnXwtdgOVHydKI0hj/cF2k3V1JOFD31Oj05gQ7Z7BCOcNaFA2
	shMaZCSmdgG3iL74zG+rCkbCX0VIj2QrLLwnRpf6mhvJECCML5noLA0rsx3UXBICjMSd0SsgzRMiQ
	PRqoHIqJv3Ezucw62sukY91GK4tvdLbOTUEkdjoJxYiDn6Aak+WnvbNfJTl4l9GJEcvdqBP+QZrSO
	gS3C+N7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWy-00000001jkk-3mnB;
	Wed, 22 May 2024 02:16:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aN3-00000001Upg-128q
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3QBjORy9CCAcoNFplhmp+lv83AAPBVpYWXZaRSdbesY=; b=E8BffdyxKrZf8TRSRQibXxrIaj
	h/6NkoKYXp2jVPyQ/yxKSv5up34jkZKeXdupeGjWAIs0lkYX8ypB/X31FEihF0A9CT4+ascEETZQr
	4A1DI0cbbx8R7OLiHJ0x1HnjY/VnqdF5qwLd7WoO1n2xaqXN/Pdwe8fgx+xfOLWLixOlNu0L/1oyd
	0ufdAzEEjfUPrVferZJqNQzp5p+UloDVwCFtwJZhmxv3leZGKK4ZoD+HSEH7uYJiuGBnk6eRNEKWh
	a4MvhOOrnYxF0naqMmoELXisjPbKdM6QliuypcDvn7dRWU4rhNEOdeDkZ2nZ4zPCAK8P4kOEhPOda
	f0Gg2JIA==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMz-00000000BEz-3GWK
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:19 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-62035d9ecc4so259703517b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339735; x=1716944535; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QBjORy9CCAcoNFplhmp+lv83AAPBVpYWXZaRSdbesY=;
        b=uAh+rBjN2jm69w/u7Y43TuLkm9RtUZMipaqWuJ4f0DVo6KsRUpCYnFLnjTq1npz7J0
         hwOfagMNlpUbodJQrL/O2fOOXQcCNcUTJX+a5zFqIHhQ1wAilWJzzDC0vFNDgsik2Hng
         WV511Fs/kCCdLg63xaXz+Xu8fK2J5o0LBbNGq9kXnqRjdclDNCAp7Q+9OKyZOo594Kh9
         zKvK7BYT3x/YuqjlMHy0BZWlPn30dgvG1VMmsn35pbGCrxnPalOluKut6ic4ZXu5hE90
         GtrmTYx64iPs9XgFkPy3C/S6Pg94+xUJ75nLipUdPmtyhCYVED5rUv/HtLVwM34pltnM
         Wjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339735; x=1716944535;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QBjORy9CCAcoNFplhmp+lv83AAPBVpYWXZaRSdbesY=;
        b=PVHkkg/6ED2AlL4jutB2OOYRZWobbmMadUH54QK0UgEElAJdhmTW5nSx5HEftYflMB
         4EBIo93gClyup0feEXp4qPIAkxl7vDOFsIrm2am7ogfvbIRrEJ3mi60fdplireUZ/py0
         slUag8guqHrumSAmstJ9Mb/GH/kUp5hFauQF7UX76d3tBWtGHgQUFj5R+vMnciu5v8C2
         i+SfvEigwxjVRBLOkAVQcgPN7JYqzu4QuyzmYOCNxpkKn9jl3MLs8o3uVLl4SXoSccfO
         kjOjWzZnfwxrkYB67+EFZjLSM/RmB+g6KsN5W7x7D7FRf8JSJ6E+E0pQP4soM2OdSrbG
         v3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWOetnXDiS2TbrWAGGgjLbHAQ2nn6HYDy65GS9hi6aO0ac0BOF/F7Az32jQ1CIAJ652x6tqUoHeszCZdtyZLAd3J2tDfw006MsjJ3+KuKF+
X-Gm-Message-State: AOJu0Yx+Lai5pNM4gS6O86zNpAYX39DlOi8heHQocJeBMdzWX6y/N8ou
	bCakSlQ5aynnUg34hV4UxtUKTu7DIwUpjarGg4pw82/MUcEX1AdcoifCyBv2T8oRJz9aeT8Ys3X
	zYw==
X-Google-Smtp-Source: AGHT+IGZAosXDprDp/opSzocer/3U9rmGdxYzPmyOuGueK6WGHlw53mh3NJVeBX+ZfzcX387bGW84sonKH8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a81:4849:0:b0:61b:791a:9850 with SMTP id
 00721157ae682-627e4891fcdmr1675237b3.9.1716339735130; Tue, 21 May 2024
 18:02:15 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:42 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-57-edliaw@google.com>
Subject: [PATCH v5 56/68] selftests/sigaltstack: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020217_954884_106A948C 
X-CRM114-Status: UNSURE (   7.71  )
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

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/sigaltstack/sas.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/sigaltstack/sas.c b/tools/testing/selftests/sigaltstack/sas.c
index 07227fab1cc9..36b510de0195 100644
--- a/tools/testing/selftests/sigaltstack/sas.c
+++ b/tools/testing/selftests/sigaltstack/sas.c
@@ -6,8 +6,6 @@
  * If that succeeds, then swapcontext() can be used inside sighandler safely.
  *
  */
-
-#define _GNU_SOURCE
 #include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
