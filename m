Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230DFC25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cOZlr84Qaz9XFwWjUCUmKiU3P43hdSaHQ6VLiL2JDjM=; b=T69FSYeZrCGqeWC0mRsFOCrE8g
	+5IOjY0nI+Yd6OV9Xd/hLkHM6zsKI1hwu3WzvyqW5+IlwrG+KsfiykemVpZ9bMo8IxP9Hk5I/D0mh
	m/oL7b/C8WFZsWdhqDyJCoeoWYhgbQvgQisQ+sgYl9HJVHnC7WJZL1jWPVBNzs3csod9Kj7IxhZje
	hByEgfahSfnt6ayG5ooVeQoxSl/tuoHjGqSC1DVz4dlzqgzTkHYvXJOLwcFAnZYpA4RuMXF1mFQDj
	EvgGAu0fGaVOfH/cwhjEoubY4/xdQ/qS6vgxQoaWGfNgla+VC52uEpC+3PiKxyU8bmQg6dtlk6orm
	pV3wwLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B86-00000002u7v-0IYK;
	Thu, 09 May 2024 21:16:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xl-00000002bVm-49zj
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GF53ZrlQPVOZxwMOBywpoMFIkR0/AwW24tB6FwevWMI=; b=RtjS27y9hktr94FtzzG4/zQDVC
	D3TxluK+q7y5DvBZu1vlFLa1xWsmaTow0QJAmsnEFdxa3p7z7ciM2SSvEg4uzRxEvl2u0z88qg4KF
	hpnTbu8qTNEGZnqI60cvhJqdFdCCM+FtxsKaenylXndBbXD8HP1uKAm9EBp3SSmSTyP92E3PLU/SX
	KYXBRadox8IO7UmqiMamGXT5U2xOMpB2b02My2Gzu+/Vii8jPvjeBk2GoG78nO5yI2OeDaUaLyekw
	nuYVwJmH1/tQ2Vt3F9DV08GuHnXecvJiNRwV9zI8G3SOLvmCCSyo/wIh3tuoBgefzD2dwdxM3VNsb
	BsEhm20A==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xh-00000002zwm-09Ja
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:56 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-de59ff8af0bso1983381276.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284908; x=1715889708; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GF53ZrlQPVOZxwMOBywpoMFIkR0/AwW24tB6FwevWMI=;
        b=U7PyXE2rhkMEwRdRqelgSSMmhgNdWN33uu7R8tyFGCLI+JuDaElaRxOh7GboAspkML
         W65GyeynSC35ROkAQeH9ZBeSNr1qEkGif8rojwupLkM6cyXMtEd7v+iXUuw36RHCpcEq
         Hpw0Od6JP/tAK6AFRc6oScc7mr0UzXKngjkPekYeYmatdTF/DPwRySmucHrIihx2nKI5
         GVZPLNVfLOvGiDXceiWPfv/Pg5zQfjtEPoC7e6x4gBRLGLaBsZL/eRvdtA00/Aa7JH47
         STmSSNvlF3G4sIXO/pH+OiOO6xcMBGaicl6w/EJc6aBIeNj1CoEQJB6/tY6sQpm8pAtw
         qxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284908; x=1715889708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GF53ZrlQPVOZxwMOBywpoMFIkR0/AwW24tB6FwevWMI=;
        b=MIX2dArn1NnZfpdPGOPTN3GeeXPLe61Z5CC5rPxCxG/LDRxAewphWq9XsQsofHM+W2
         Mj7Wpic8XECDQMvUGz8V6OQrxX7sMufAuF2X7qQI2+xaBN2Hgqp3uHBhV147xDgXGl0r
         s4/gdY3j+1NPIz/f3HtCEG+U11z9Ny/OgEIYP1LDpTmXJqbqfWGGl+szGmM/vuarifGF
         xdpcO2paPA8uZhUH4RmPTbxl0s36OAyPfJLO/m1J7gjfcyUgvehyLJ0Us+xjEQ7dsijS
         oUKURoV//lozlTDD4xPh5smrNzCQac+NTq4Y+2UXfCnb3K3GrZGvol7/BWnlJdoSskIZ
         85kw==
X-Forwarded-Encrypted: i=1; AJvYcCXcYWtLI8rrgOB7O46ddpUCmXFr6uYFbaR5NB4T1quUypUWeghWDzTE516ZOv1fI1v3sUEYN8BauLG/VzuM0l6jC6tqEJcsgRfLE4VLjEG4
X-Gm-Message-State: AOJu0YyyrY/zmp82oFNMtn4n/2YEU+/9eaRXeABl4Ih6B+rIg5aVe/74
	bYSByB/RESu6Xga01s6rhWdxfPJAOt4PeIVDU7xVOC4yAc1lCnfO9KmEoP/KK6F1iSizVaWF/rV
	e9Q==
X-Google-Smtp-Source: AGHT+IFHb/HuEhyDn1MIUx0fSYkl1rLs5xBYd/7U5k8UOq4+y5dsSBiAfEgu9kUMOF/OgV4z5gWzXa3nqdA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:2b0e:b0:de5:3003:4b64 with SMTP id
 3f1490d57ef6-dee4f1b28f1mr63511276.1.1715284908019; Thu, 09 May 2024 13:01:48
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:13 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-22-edliaw@google.com>
Subject: [PATCH v3 21/68] selftests/futex: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210154_455393_2F9EFEA1 
X-CRM114-Status: UNSURE (   9.47  )
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/futex/functional/futex_requeue_pi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
index 7f3ca5c78df1..8e41f9fe784c 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
@@ -16,9 +16,6 @@
  *      2009-Nov-6: futex test adaptation by Darren Hart <dvhart@linux.intel.com>
  *
  *****************************************************************************/
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <limits.h>
 #include <pthread.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
