Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398A3C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BtNmN1LYjbn6hzJ0cmiOUGXO67HVPBohRIHumCNAJ54=; b=YWUOGVsnLb9LsYh7S7rz0Ahib8
	fjVg0XxkapQBcxEdbiUEGX663ThaIDxkK+Sac1sFYXA38VcJm7XwPjpYdAQ3PRLw6wh3UtMWbZdO4
	f8bH6XicKG/hQNwywIMSPLi1kgO2QZbl+1fQBpMR5LkWMKGxollg2YrezypE09l6v2JvoNZob1ySs
	ZCfrBlFPiDeYlmaYackK9HPOf3LirxCjQwN0T206qdj+lFyz3LFabTOoLByP6PwDlxhXAxlSROd40
	htrYKveBDDA9L+O+/e7x3lV+uFEAGD/GHMF90ObkmdO8C7gUakJSGFa4Et/XxlBD4RldZa7+2eY4j
	Hrr6SRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqN-00000003NR7-1nis;
	Fri, 10 May 2024 00:10:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpv-00000003N4r-0dVN
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1J+0R5KvELlP/aPzu5FkXVeIoXQ70u+fel7H+7dT5J4=; b=qe/bdaLap/PpuJJ9g1lr0KDt7V
	Y9RtnyMdj8615Jkkivmczx7nauTYEPbTvH3H1JnxReZ74gcuDdaEFWvuv7BX0F17bBKtSUstFEQWq
	KURNnB1Az7XzbB7IvaWajFol3FPuZGPZk0n3KQYloW79GIsBk3/u/2vGRC/119O1vBdUiLRBrYAdY
	ikkf+HjSE7GraccXRiBCatn2zODpX/TpboSR0WQ6OqiLZGxQK6bwnz619EXoTXkjJyuieE4MIImOy
	Mr8kflWXqNx82cHW0bgR/gMV/KiP6LqzyR41p1+pw84Iam6gwd51pf9KZPPAWktN/8mbLLpWTvg+k
	eVAByahA==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpr-00000003602-1e9l
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:05 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ee4e9a73a8so14667135ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299796; x=1715904596; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1J+0R5KvELlP/aPzu5FkXVeIoXQ70u+fel7H+7dT5J4=;
        b=1RwLE/4Le9hr07PIK3VunXz9h+1GWfGk603CFVXg9i4uZbUpGL2i7FLwCzE6oCO5FG
         QSMmmHl6hPIu85PipuoxDYA0ajtBMRnupdLgV6y8/gwjegX1H24acnJf/IQsx7oa3p8s
         5W61wArGbeqr7/dWQ19q08pnPJEJzBDypSfcyEexzZa9JBSDxnnKqdctQH4V/GjT3Ji/
         vgIFZ8SiJcdUvu+H3fKqVIWJRyCFSx3e4Tg7ZyLLpeonu0FaxW79z6QXXiGD08CRxOZv
         25Ob4V59z6FX0MV/Ls3ZdUMq0BecvMiXWDFFofcUwQ5mUxCw+UvJPr6N8lIgfbGntHnR
         oEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299796; x=1715904596;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1J+0R5KvELlP/aPzu5FkXVeIoXQ70u+fel7H+7dT5J4=;
        b=gQpLzNL06bnrN93SZkdYuSK6q+Lk/0RHExzxZe2JBbtYGvs7+c/3M0TkNTEAorP/c2
         vqrBTXjBj8bjWFjJfh4MbOQfyIZmgU3cl9nudCSq5eoIYvpgr+tqSCjCloeQsceMIF4k
         N632MKEOgekbh8AB2lQEiEYGMNwiNlke/6fIYf4bOFkKts0+pTeWMXQYiwkdXt+6DNzF
         CkPN/u+WJerOEqAxw7SEGJb8t3rPpldZlMwHLPAFt7fTERijZist27PwBlEQRHFVB9sn
         wKZnh/eH+FTGyk/Dqapqz9OmhGH8OsCsyr8JzLbCKR0EvKK7ZWRVyn/Y4CiOpDG+NocX
         90uA==
X-Forwarded-Encrypted: i=1; AJvYcCUfsRhzGyzxFT0ZmlrCju5GHuAZWRopC/0zwhxbvw7vMW7D3CTu9pM5vOBhNwkCg5ioPtYEU+QQxFp2YuVWgUvOTyeQ5CtEoz0rvweb0TKC
X-Gm-Message-State: AOJu0Yy7p5DreZPcEFPANdEOwEWZsIEpS3+jeL+49q8nwNn3Jgiwz/FQ
	ucEKihQnH1WmaDnYxQAKHr0eQiXDXw75qtJclE7sJhuhYniYJFONFefHkswIzwu0oSlb+qvuobi
	0zw==
X-Google-Smtp-Source: AGHT+IExd15gsRZwvkH+bNW5BEjwyjUFQ6oCfGLx0KBF9mW/GpX2KB2/zfHBHHKo03HMcQ/Fo0GVALLRwzg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:d4cd:b0:1e2:6b74:2bc6 with SMTP id
 d9443c01a7336-1ef433cef41mr38795ad.0.1715299796044; Thu, 09 May 2024 17:09:56
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:35 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-19-edliaw@google.com>
Subject: [PATCH v4 18/66] selftests/fpu: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011003_819988_E4D59DAD 
X-CRM114-Status: UNSURE (   9.36  )
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
 tools/testing/selftests/fpu/test_fpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/fpu/test_fpu.c b/tools/testing/selftests/fpu/test_fpu.c
index 200238522a9d..53a7fef839e7 100644
--- a/tools/testing/selftests/fpu/test_fpu.c
+++ b/tools/testing/selftests/fpu/test_fpu.c
@@ -4,8 +4,6 @@
  * module to perform floating point operations in the kernel. The control
  * register value should be independent between kernel and user mode.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <errno.h>
 #include <string.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
