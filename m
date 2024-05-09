Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC90DC25B7A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yM7f3psuW9F+45uXj8Y2bGajqYzXB01Kfo9eEEvovPQ=; b=NZKYAH+OJvIWErz/lOPfW+KXx6
	+kTbBKX/p5P3AxSO3TbzNf2MPtLbKlg/1/jT6LnybajRvBH3M7v73rBNjuTvjaL4UjcF817NEqPn+
	8tpR0UJNVfG3bjSdJvbmPPiK3vm5wkb6Yu/U43senm89DbJFCuzB6rhmTlurHGjuNQmpHq6H94uYO
	UXGrRwRI63KvYFbYv71SWo0b1j1Z8ENMbmWE4Lhafx5o84HqWbYe7TY9fKkhjdX06uxgPN4uUmNsk
	hx6bDDVT5HZXs/icRScrSRVrrPWU9bKda0K0L5yax2zG9cd2XbUbiYEvyLkk7lgi9y9IESQIhjoCd
	Ouzq4MYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIm-000000036JD-02me;
	Thu, 09 May 2024 22:31:48 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zM-00000002chE-0LXW
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:40 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2so1896888276.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285011; x=1715889811; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5k6MfrHn5zAXreDA+C7cs5PpXHJQO9KnwpSZ9g5UlI=;
        b=WzSbBOjVMIXYau8BQCNJWa+XOJ8GyplG3A8Z7p6B4Ja+cvEivE8NycLf6QN8Z029kt
         FsU9Uw6zcnWrVbelIPlpbe5Zjp/jZcpboJvu/d8Fb8M20lrIMZl8eCUOvH1iVlMy4E5Q
         ZqkC582yoRiyVhN33fEwFjDk1WmUlx0+jshf7Z5ZlfZD96qS0U7QGWPNDd4AvZ22+Snf
         g/WNRU81GYZETBqatmrvr3c1lfPnrtFzfBuYIyfTdp2qdNWJ2lqQAthYNxa/1XccEDqW
         En8PmRwlOOgWG6snGtSDLpk6XtWRxgrnF09I4JTD+Uma10TX7ZlsbrWFltnWWE5AOp8A
         6AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285011; x=1715889811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k5k6MfrHn5zAXreDA+C7cs5PpXHJQO9KnwpSZ9g5UlI=;
        b=k9kQaACQZWtRmhnJQg2xkm3CmIlQRel0sNpEQyNG4nJGfLrocDH5Fv6SHMXEnbcWJw
         dhrvH3BLj8eTZZLKysTmznr6QKxEb6YvbizkL47c4MWPtY2QrhYO8p7R4NH8dxe6zCOo
         3TA7b6EVPbqTikuHdF8zHjHPRTeY5i4pAoTe0lMZqIdQRoanGPZ/7BkFZ6AuGuLjM9lB
         7h7Ekq2uJormP45dvkQCy30g2d9HeyygAuclM6tEoYGA9ntZqt9gskgIC1z4WOFSszHH
         gpy6WzaN2RaxmeTujmOlEp8No42aoMWKm+Waax7u6HrCKa7zvmUL0a5iau1gspHDxYyv
         104w==
X-Forwarded-Encrypted: i=1; AJvYcCVLu2IByJYAOQYsoL1Y3tkFrrGgaPULLhx5lpnuxubIOMcXqgL/1s/QyQLduzs7sIeGJRg7OBSLVNjiTA4r70cf8Ct9XwLtYHCCgStgbFuU
X-Gm-Message-State: AOJu0YxQirtMIQhf3hGg0b7Dl2kdwZXWomTrftPyScjLMGPSkO37tedW
	hgEX3EFkEkzJsAVTa7s/cGxLTxDy1JVTzV0r3J/01tVzqyTKhUDXZ6/Npo46KJrmGdkigPiDtxb
	Erg==
X-Google-Smtp-Source: AGHT+IGb4ng9OJg5Fp+YefUa4FZNwRQyl6/nmjKMnKC/LgTLkL3Ns0/OurcHg47bBiuW1FC3zvfiy+ei/Po=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:c09:b0:de5:5304:3206 with SMTP id
 3f1490d57ef6-dee4f52d715mr61724276.11.1715285011299; Thu, 09 May 2024
 13:03:31 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:48 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-57-edliaw@google.com>
Subject: [PATCH v3 56/68] selftests/sched: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130337_871521_ECDED166 
X-CRM114-Status: GOOD (  10.34  )
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
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
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
