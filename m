Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B61C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F29fuajiPDMO3FdvBnZUi+o+ZyAKfoT4juLwzX36iwk=; b=LpFelpyTIAKIHIUv2CQQYTd6ZL
	adnOOnVSqg4nLqAaU+1oNlmF9H914Vq8kcN3YdeLzvxUl+2uhn9FVe1KyT0K6erErtmckMCvHGXLT
	a1a/q23rj1cHwxcfJpdUm6Bm8ARm2Cr4fie5YN5bP3fuWRyREL38yVWWKyKPm8eDE+TkOEnsyMcn9
	YeBCHJSBT4OLYOS3X7atgja5FW9UsWKibxcIYafLN5ejLFn0r/alzi3UsXQYYexFwgOtYeFpe9j3T
	25d5yeYuMeJ//bwGZ1reRx3o37QZodJGHTJIo3ZSIMd0b3JMS4wxsDOA5rwit261n9MiOJPLQzmDC
	JbS4BCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWv-00000001jha-2dDq;
	Wed, 22 May 2024 02:16:37 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMt-00000001UjD-2s7I
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:20 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-649731dd35bso7971774a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339730; x=1716944530; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9fXSc6I7YRPoBA8Qsdus0HRtiChwdWQfuChuYoJ2sTo=;
        b=mdTYecGeUQ4ENA5Z7w2LMRB9n1NeNNXx0ng2bjqLfpEzH+LLLhl7bNbJ9C2z8a6csc
         u7hSeOWyvWBVEStrQ5FY66mH9E8AwtK1zNKW0fEyZWakMZdWmoSxdhAgpyMEmnkGE1wj
         oFL34mQxpq8Sz4XVtNre4T8d0X85mRhmwWSVNjbsMkGbUyhKqsepHHV2PeT4q96CzaqU
         H+yYD9CvpKnDL1tosRolLOPax8SoUPaxzkDeCr/+V7JifCMt/gVvxkyuk1iaOUXVRzyv
         gYXWaHTA7MNLfj32p5UbDKXopvG77rpRyJcLemWr/TzwYGX2UYbBLMJE4WoOp/UoGAqh
         ZIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339730; x=1716944530;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9fXSc6I7YRPoBA8Qsdus0HRtiChwdWQfuChuYoJ2sTo=;
        b=iY4ZdOvVhTfMehhGX3Zu0uhqxX6wYl2xecoLz7Ff2pJCor9teIpsm+PI3HXprhmA41
         zJriZRp7GwTUC/VRXYrtncwKhctSNvyipNYwSs7TTlc4zozZk6YheO8LXr5EM/gxxVLR
         di8dxse9lN2ulBv4xpnUygBSVRiUV9zn6MDysh4wcgZKwDxuWwoRWbeChy+jyhn+/rpH
         vom9KsATgeGl3ew5VeMNhcsZAZFg3oIMluWXsL/G7E7kMu8Tf8SdD799PVAr912xZ/A8
         QkPM85IQntD24r5FzYIGrIekld6i2/RAHnU82IfRBIOYwH0rf8MoUe8EylVlDeBO1gQn
         iqqg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0tueIJXrgblTI6ef7EWFOl/wv+iTnl7zXb4Un7YtG+Kwhqxj5s4i9VJfOfZ0q2l4EtwFsLuALcYmyM6DfpZvR4QQkuLVkP2dmU/VGSee
X-Gm-Message-State: AOJu0Yzp1AnEeeFPzwCITk90eN0g6VGxQN2Y0ELfZGyIBZHhIHwQyc0P
	Bfv80WwzaL1X0nckYJ58dYcg+tqrtGtVIfFUwpnwq9cqZCYBLC2rR7ZtN2K8+tsiQ3aoJP1lnLv
	Lqg==
X-Google-Smtp-Source: AGHT+IHRMV7k1LU0lDtq57tRvT7lk2XfR2s4R9nKcPSkC/DgzGkI8VQdGVam1DqlKbogDEXoBxPpDW2FdZ0=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:9250:0:b0:673:9f86:3f1d with SMTP id
 41be03b00d2f7-67647ae60abmr1189a12.3.1716339729367; Tue, 21 May 2024 18:02:09
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:40 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-55-edliaw@google.com>
Subject: [PATCH v5 54/68] selftests/sched: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180212_196952_DBDC633B 
X-CRM114-Status: UNSURE (   9.21  )
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
 tools/testing/selftests/sched/cs_prctl_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/sched/cs_prctl_test.c b/tools/testing/selftests/sched/cs_prctl_test.c
index 62fba7356af2..abf907f243b6 100644
--- a/tools/testing/selftests/sched/cs_prctl_test.c
+++ b/tools/testing/selftests/sched/cs_prctl_test.c
@@ -18,8 +18,6 @@
  * You should have received a copy of the GNU Lesser General Public License
  * along with this library; if not, see <http://www.gnu.org/licenses>.
  */
-
-#define _GNU_SOURCE
 #include <sys/eventfd.h>
 #include <sys/wait.h>
 #include <sys/types.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
