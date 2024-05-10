Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AC8C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M0NF4a4WmIoqimZcsN6oj7JA0efOAN9sacw7usZVQxs=; b=XDM9kujCitnakGHoJAziHINoWI
	PND+4QU5Hdp8aW3svufsiPQ3/rxK8mrpOC/z1GsCOyCfW4Px/YiOyON+j+eQwhVZxxtJBnbnbNAZG
	mpLX9yRywSLNEZKkzWWl5CeTUiTLVY1DMmILzC7ivjrN3OqGalHQWazCDkx7oloCJKBAdjUnqHWeI
	S45LolhRajeOKSkJi6dOMXtkZoeBBAg9P/2QHWziFusuqodflfbt1+PmbOuDRMe+XF6NXFDfVGWCS
	H7ZjISXUZZuRjFax6FCFCdPaq6VSpVW+6B5gf0icMxLp9GRFRrOs3hkzAcidBV3x8EAnUUgpPYvZo
	3g8XFkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dsk-00000003PEX-26js;
	Fri, 10 May 2024 00:13:02 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrS-00000003OJD-0Axh
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:57 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ddaf165a8d9so1996218276.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299898; x=1715904698; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0WWgoFurwAg8h9SR6wezGd5h5K+Y3bRntTGdapCnYLQ=;
        b=i1mcbnLw+O6sU7ghqo/cl1YSBiq34v7EWG/5I2UXrdJXErzU8ycel4d4lqRdpC+DX2
         c7aiAsUkAJk1G1q1AljZ4mlUI9WGtY/6Hq3F4R4IXhJxlaBkHCNJ5Jyc+OOjUvBCDvtQ
         y5XMD8vFRcI5hbRBGagBWV/wNz6++WcLfN+TEBzYk5UwIE44IBVPd87IbNJf+q7LErwD
         QN2DmpNtPJ0CWqZO/7BZTC/LhuuKZDoWFzvFZV9yO4gwHb2PQ5/m5K6fUTIadEbvTrNf
         +nfyLMktt8FFWuhPmlJVsUAHwuhmgzWapZw200Q/KUVnuU3uyay5MtnyqCauaafLdRvq
         YPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299898; x=1715904698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0WWgoFurwAg8h9SR6wezGd5h5K+Y3bRntTGdapCnYLQ=;
        b=UHU72rHcrYoYJQoFdSl2zDSLUR0YvWL12iT7n3YWt3nyvUEYoDBPJwV1OR8vx9wEAN
         CJQJ47/zbLyHWyv2aYhz7txVNg2Mo5scV8/OeLx4GxIR+NpKrNlaLavKeFx9wco3MG3n
         c4VjGTszGVcfNfh6s+lmGMElSF789M5XJoLpL+nvtEK/fPJXhGKxZ1eB2Q3tdXPjrXbu
         9FbGUUoBSh7z27Qboj/wtK1PUzD/rMw6o1T2UaerO8RQIgj4QaysN422mVNjqWHT+zLc
         4xrNEHz4+dq59ORP3dUU7OmPAFp9MG8E09jerktZME2kG+Uq4BsE7lV711AdmQ818yv4
         Hw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgA6+Kt9BfeLrm1XmgGj11n7ABBroZRnxiG02SnLapsD93fBkmRdUb4w/Vm2EEs+7MD+kX3E/RpNH9yuCSd40Oj/ZuD3pldfGreb4mVU//
X-Gm-Message-State: AOJu0YwPRtN5bXJ3F1WD3UIOQx41p1+Y6Wdczm3bS4FGsMVIUqLncxAZ
	q/K9/Gkwh2z6AGXqZQMrnYhDO1ycWyz8mLp0CHZdTLORy4F7UG269W/8313WQcgj1qZsOaqhxPA
	TiA==
X-Google-Smtp-Source: AGHT+IHvqoyfuJd+zpWyzRtMJpM3tPkSIvIsjPanUafDlQuCX9siiHmpPTAd92EjaLgk71HiYZjK7/db9Q4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:b31a:0:b0:de4:64c4:d90c with SMTP id
 3f1490d57ef6-dee4f4fb5bdmr99366276.12.1715299898422; Thu, 09 May 2024
 17:11:38 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:10 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-54-edliaw@google.com>
Subject: [PATCH v4 53/66] selftests/safesetid: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_171142_378693_C31E130B 
X-CRM114-Status: UNSURE (   9.45  )
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
 tools/testing/selftests/safesetid/safesetid-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/safesetid/safesetid-test.c b/tools/testing/selftests/safesetid/safesetid-test.c
index eb9bf0aee951..89b9d83b76f6 100644
--- a/tools/testing/selftests/safesetid/safesetid-test.c
+++ b/tools/testing/selftests/safesetid/safesetid-test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <errno.h>
 #include <pwd.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
