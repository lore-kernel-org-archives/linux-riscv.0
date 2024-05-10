Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAAAC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HWz1qDbURFcE6pF+Hn/b6id76pndePPxi4pD9wAtmJc=; b=a6wrxhMZWpC83/p6+dWtdFc0l7
	q9G3yraY7OkaxaF724sT0YTol1SIlRP9fAoTUU8eI0Qpkf2JUkqFiIhUMMyGNKvdxNa1KmsBUNTjL
	b6HiJqDhAW8086g60SWJ2eUXvsrSxDKo20lI9kEp4BAfWszKIzAhpRgrLadRemBB1UHPVohzyxb7B
	jgHwTTY77BIILCw3qZRtWgGF0Nstuzs/ENolDcDOMqJ6Psbtks78DrzgSJ7C8yvl3tKs2sQDNOWre
	OkhekjqOPCawdZqbK00Be501+zU6Qr3u2mnTQh/0sb72oD980UlRyqQPornDrMh8KTyLMPK5dKF/f
	da1ArYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DsU-00000003P1h-16jC;
	Fri, 10 May 2024 00:12:46 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dr9-00000003O2Z-3inf
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:41 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6b26783b4so2009010276.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299879; x=1715904679; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsiI/uc5MiF5hVrzWysDwKaH6OKN5b01GtVR6T+4Ou8=;
        b=ZrGJKdXBMCjt8fK7/9B2EYUHwJkHC7DxFe5ko6l6oy+CSaqDNFu+W/5odkGRqAFd2q
         7Tok1AHa6YH4JB2AcJvzABjJwL7ukhvJbKBYwraN8FRQ1ypTTIhMMTiVh24RjdbuGJGr
         7BZGtLHY9djkJUJWXks06Zwrz9EfLCLwoQuJzNECEnWW7vn5ZRpYxOpEdHg195fxXzpX
         j1r718EVEhFJl+BczQVh3JBnLt2jnHk6tU+eyNuJExbkyM11k0By0qFa92d/PeHdS9j4
         tZqtam6dAW/Il1sgu0fgdA7EWHVkS/C1Z86U+YIf3cdBk91W3v/njHbu2PJRO/lRqfBD
         +UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299879; x=1715904679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsiI/uc5MiF5hVrzWysDwKaH6OKN5b01GtVR6T+4Ou8=;
        b=dPLF/7UC8Mb5jKyyUhVaS6wQbzN5tVLq2Oltg7tLgxxVOmjJbngdYSrR473YwVYjK3
         srP4rx1WOvKwsfGZTZlpEQjqfvX3r8qnv/UkAe+lNFH3FGxnLNPB7lcg20UtDxo6TYYU
         8e86aRN+H5XtyM3+TDm4u2f6FbHiPRhLNBndKGCPMgNBvdd05ZI1XnLIxMAhVkpq0v/d
         VTBYsCwlF4jjNBhZ2O2zuMxXg9AGYmwuWHOlDD31X8VAgdpnPJEzLA+OIsm5LGsfpdFm
         aH8T44OLQZIs+S43nNLn57hSffzAzA5Lsjjp32kCCCVhMSBfJt54iIXLfA+k/X51ueBL
         cGgw==
X-Forwarded-Encrypted: i=1; AJvYcCWAZn7dlVkhJ4zo3oZChAn2dlTNttzb9U4BmdB1oE0B4/9iYxLStYzh+dFSvTsyT46GS1Yq/A7pa9RCAPmD5QZsdi2zNE7lSi6+8hAnrB5G
X-Gm-Message-State: AOJu0Yz79htT5uNaDaXAbB6RQB/zMUFhumMd4FB94VsZpCC3sjUFfHdN
	z4LwlObenOLizNmVn+n8mjoWhVQL/RVzO0cDpQ0d1B7CNU9zVmx9smdhXTDR3vF3AMf90LacwFh
	ULQ==
X-Google-Smtp-Source: AGHT+IE5lK4O5tKmIABh+/0fZfzUGpesvK3r0yQsigzHVYkbLRrBgnWaOZUctD25gmyF5UaK8CUOK4LhdqQ=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:a1e3:0:b0:dda:d7cf:5c2c with SMTP id
 3f1490d57ef6-dee4f365eb8mr105581276.13.1715299878998; Thu, 09 May 2024
 17:11:18 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:02 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-46-edliaw@google.com>
Subject: [PATCH v4 45/66] selftests/proc: Drop define _GNU_SOURCE
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
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_171124_078656_2D6EB534 
X-CRM114-Status: UNSURE (   7.94  )
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
 tools/testing/selftests/proc/proc-empty-vm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index 56198d4ca2bf..f92a8dce58cf 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -23,9 +23,6 @@
  *	/proc/${pid}/smaps
  *	/proc/${pid}/smaps_rollup
  */
-#undef _GNU_SOURCE
-#define _GNU_SOURCE
-
 #undef NDEBUG
 #include <assert.h>
 #include <errno.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
