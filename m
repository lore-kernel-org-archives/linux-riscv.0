Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D552FC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5sLAwYLf3CHB5H26OuxF59lbmXrwVuC7IsL2tshMuws=; b=CG6x9cjxqmYUmrecGtTkhFBdH/
	Q+oXkx1z8J+bCjlYn24ZXmg0HJ1BL3k3xXG0SVnu4N0OxnrRpX6PoM4SOMMTwcGlSZa2zlQZZ1dd2
	q4WwzApO4J5jAI5tuJUm/UxobBxM+gdP8nQuLWYCKgov0yYhp3jxFyB4Lu3zVOLQFy22GJPXoxFtf
	1oro77nBlS25I+ISFnDm2hiu6My/4RRjtcQkzGS1jayMdMXXm39SJdfgKVFqBCJJbtl67mFC/vksp
	f+nZD46ajlbTrK5IHeDOR01lG8llrVl5MmkMN2oodTcZSI9i0mE90wOd55j2PtN7OEuXteoag3bYZ
	dMwDXSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esq-00000003am0-2FmZ;
	Fri, 10 May 2024 01:17:12 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dq2-00000003N6f-2pjk
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:21 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dbe9e13775aso2496205276.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299810; x=1715904610; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1JirhXYvbIsfalfItEFO7rXY7kH5rekU7f7+XKnP28=;
        b=IqFY07LBSZZId5Tc4a5pri0RWDeOZjdIisTd/UsyxFValNbcxUK63ZjwGOTbAIkCKU
         kuLKAz879LJhSxrpEORTsI5aSpaWBTi/oYo+sPrirdAPjw0Nc3wyiV0jG5op9DaHBlF1
         X6iu3HfwNfJqDc4uvMHtWD4CNGn1ydTvXzZTEdCoeySizlwh+NpauB692ci+xAgsjsqf
         LmksV0NB62AiQUeAqffKhp8FrZjQwvy9VAOfFJR91xLkXqby4uqeBtMlGmTTV/Vb2cQf
         55vJwk3UWRr0eaEAMiXjCm0EqYJoZ6gLyky/uzFo2uUh0Y+CR7HhBwYxoPrk/DbM7jZF
         QXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299810; x=1715904610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1JirhXYvbIsfalfItEFO7rXY7kH5rekU7f7+XKnP28=;
        b=c46CXhnY0UJu4HVatGTPTOj97F9MMBxPcS8ha16tdMtEy59bFfunjw2HmL1kp2wpSo
         KaN+kscSkjg18TPvjoW/v+PXr8eYcze3pyhdm0eR+4vY1KiLoGqJVry2Hqs+o8b2Q3Ja
         AFVRNJzk1XJPrqk/zI9U+HbEcH0+teIVb2Ds/QpimouwHC6o4s2jSV5GJGOCp6ZcrFMv
         wY48fxbNC2KH1mlC4NiDB9281fEqQYAmNnvmkCGlW+wT8v9ghaevyr7U8nMJAtAcqwKo
         UAO5dcjlKmi6wfrQhdCMaK2y+18QX9IRlqUcJdefxC0u+FnyC3DG56sbNhdq7kgAVxWE
         GOXg==
X-Forwarded-Encrypted: i=1; AJvYcCWVckbhHTIPr1mW+4Y0rU/SSMPaLkIZnMMcYVR15aas5lESMywmQN5UohggwBvOnRwugZT8uU/9aLeyzyBS8gs+niWOBlVCNu060XtVITqM
X-Gm-Message-State: AOJu0YylQA80HpbGMLQDylcvmMUhRBXVRVdGHabiFWd2e3ZylAXe7F1B
	A4HUnn7EPPCllotzdy7NzS6UbE3nizgrNH7RuGlZPEsfZorinXkeEAtrME5HMVkFeveS7puInYm
	50g==
X-Google-Smtp-Source: AGHT+IG/RWyFjoRdfpBoeWuBwpsoREtw3fEGHoJsuZVogrcMqGX9XXGJ9mAouAKS6OupGTFj8vQ5m6c7k3E=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:c01:b0:de5:2694:45ba with SMTP id
 3f1490d57ef6-dee4f104643mr309828276.0.1715299810434; Thu, 09 May 2024
 17:10:10 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:41 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-25-edliaw@google.com>
Subject: [PATCH v4 24/66] selftests/kcmp: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_171014_942663_C1A445DE 
X-CRM114-Status: UNSURE (   8.62  )
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
 tools/testing/selftests/kcmp/kcmp_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kcmp/kcmp_test.c b/tools/testing/selftests/kcmp/kcmp_test.c
index d7a8e321bb16..f0e356139e1f 100644
--- a/tools/testing/selftests/kcmp/kcmp_test.c
+++ b/tools/testing/selftests/kcmp/kcmp_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <stdlib.h>
 #include <signal.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
