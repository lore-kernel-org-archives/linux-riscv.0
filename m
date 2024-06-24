Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A3AC2BD09
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 00:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aX6SdTtPoFlihOBItcvBHDnHenXXweLpRhHrCUpdQIA=; b=bvZ12CPRNsW5RbtlmjIVLX7eT0
	a8+SIYQzZEMiwt+ICbTj/G4VSOAVZY0Xr9e0TiQ4nNXc6FPqa8GCTRrz+tW8f/cC8wKluJp0Knb+1
	ujdcueyrLJ8PLcwEOX28uVkLYYrcT+KMlTJWNu5ESAS4GUArIP/jayFwvRsorODukI3qbCU/3HLpj
	gY4p7dAs5TBVbR8CDdcYI6gvgrO6nhdz+0Vt91Fl7RVRHi9zY13vDIlsyaGPNSp5ZYyAiKkOI6MBR
	hj7D+I/x4Q8DasmwIrbbS4/8mZHpIjHmRZ/VvVOtaM4fC0RSEMOgh6nlwEqHiCqpIX0sPpbx/mrmx
	BHud7uKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLu50-000000016ET-06iA;
	Tue, 25 Jun 2024 00:30:38 +0000
Received: from mail-pg1-f201.google.com ([209.85.215.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt8P-00000000yel-0E5N
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:30:17 +0000
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-70ac9630e3aso5433004a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271802; x=1719876602; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZG4i3dx3G3awn1LpAYu9cuCTYByH4EPhFHcmFTw+5I=;
        b=oCzRbL9ivwgeaS2GJ0Lu+eEXst5n7yaQwuwaPwnJFbwPRYv8t6vcr7e3TW1bYmNrHR
         X7qZNRBQCM8UnC6wMvHKzB/Y8bSrXrL3MqrtSP7VvioLIq7cAcVIFkVd6PeHJVr9jAMb
         jQj5vt/iTMUV8Z6NhUr8jCYwn46M0PlZuOKoLHi6AqlUjhtw2EYcmkDZmr+JbQLy4KZb
         66wHoQXlb+idXA1Fz0ZwpN2gfs8q4ca96YCM/IpPLMPlwGZFgKJMp+TKR0C6jM7hjooV
         /hWiA7wm+XxVE3ZD6x82TynLbPLdu0EjviVpdjrOOAFn5RI84Ix6MPm9aqPt87C585He
         8Elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271802; x=1719876602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZG4i3dx3G3awn1LpAYu9cuCTYByH4EPhFHcmFTw+5I=;
        b=b4Z0GD5+yHY7YI6Y4KbgJig/Eim8fgiOrhEVaMiMzSZB07W9QS4lIaGv5rW7GYol4B
         zJh8LZl38OjVHfKh1kdXxx8k4gE+XGsDQUSY5fyI8rD+dHzcqf0fkP4n3PTf0/IkJjpC
         1vr2nwGMVoo0YGz4gzEEJasZNSvg0nat1VOHaCRI5woxzDda9AOpC3sKyLeEIh2E+9bH
         U3RZlHCo+BdfhO9vyo5bDYLyRpxaTCn8WWB1DmTRX2XUBUdsIRIf4xEWRzyG623eyuFT
         bGPxznIVrvM8d2GcggAeWJ76uYDpTSsW6O4r1ILKDkjQos+qb83a+a50eNAqtG3WgdTo
         lOwA==
X-Forwarded-Encrypted: i=1; AJvYcCXjk3ZItVM6CjPi+tPoO8MFD/oLBw7aJqSSRNYiQVW7XNP9sYug6D/JDvx5n0mtyyvDAm+co3mKYPZKahqAM4b/e7Rr2UiwMZPTTJHJ64Oj
X-Gm-Message-State: AOJu0Yy4DgrdJm64yqZOpXRAncWvpMdbxa02rN4VkeXn5drtA36D8fw3
	TCgy9rBwoJK1w/3Cemndpmk6ZMtFKZJDqbtu5yGXjcMLIMPGQ4hqdJ0503OKuje2fCl15ce6HnK
	vjw==
X-Google-Smtp-Source: AGHT+IEfb9KUh1OpOD8DwIk/54klv7dSo/nLX1YPQZQ44FjQ7tb2FCGqwu/ay8BBa1IDIHl2DafOvSF/pwc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a65:654f:0:b0:6e9:6c12:3523 with SMTP id
 41be03b00d2f7-71acda64918mr19622a12.10.1719271802360; Mon, 24 Jun 2024
 16:30:02 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:21 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-13-edliaw@google.com>
Subject: [PATCH v6 12/13] selftests/riscv: Drop redundant -D_GNU_SOURCE CFLAGS
 in Makefile
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, usama.anjum@collabora.com, seanjc@google.com, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_163005_760743_A4D7C735 
X-CRM114-Status: GOOD (  10.94  )
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

-D_GNU_SOURCE= will be provided by lib.mk CFLAGS, so -D_GNU_SOURCE
should be dropped to prevent redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/riscv/mm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
index c333263f2b27..4664ed79e20b 100644
--- a/tools/testing/selftests/riscv/mm/Makefile
+++ b/tools/testing/selftests/riscv/mm/Makefile
@@ -3,7 +3,7 @@
 # Originally tools/testing/arm64/abi/Makefile
 
 # Additional include paths needed by kselftest.h and local headers
-CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
+CFLAGS += -std=gnu99 -I.
 
 TEST_GEN_FILES := mmap_default mmap_bottomup
 
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
