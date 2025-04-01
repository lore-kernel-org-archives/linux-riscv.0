Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6533C36017
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PzSeyJZlc6ycNc3aGcj7ahyt11/wR+dsUGdysrpkEY=; b=xjCJT98wt5/9UC
	s7d9cPL/KSpW8A5nRnlsRjplWWdgD7Nv6plRQsI0YXjNfjz60p2l1hWa+F+nPRx688QDA48RPiurC
	ZTgEZax7uEWzlv8Jh5mPt47l5pF5tX5u3izpE9BwJPSCZtutHojbC4UA30VN4qhbERU+/VCAv5pk2
	UBtNshjJEx589R4A65ZyFd+xEr/Fxr+rI9Bj+DF6+oaVoYfA8wh09CxBMLQRxZzz+RZeU44jV+EaF
	V6Xq5VuHoWzinNyRzT63l+X7XWwwW1eH1wO3QgiePFoZSUvaZCQttWnHKsU86W9jNjA+v5EXw18cg
	D+XXKz0eSG21ktPMK1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzjvQ-00000004W6T-3u3p;
	Tue, 01 Apr 2025 22:17:40 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVl-00000004LIG-4AWF
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:07 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so10775229a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 13:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540425; x=1744145225; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5qKsANY9N47hjadaMZNM56aBAj0f8nczwxZTz9+A9lg=;
        b=j1lNkFG+qge8sZRlywaW/GQPPfM8It3trFuOd7MvTUpHPuv0QnC84CwlLRusISxcym
         Ea4TmqlVxGPIWQ43jlXaCKPM4YoI1Oq40016Y9uctbH9zWmAJSQw08dDWtiTCkUYVuua
         zxvbs5yecAESI16c7Bt6yBDieXznVYaAznumXw4XHM6+X5nbzd9TUcGBF2oAXIXLKiL4
         mN7rw3mLdHPJNQtSdtHPlUsmmhVjoX6UmbahSQej/gIfcQuc98Q5GyaTaCHlEmrhA9DI
         ACUPnbqsT4acG7pXIIp9lfGWmM9mUMbjRZgIThIe4cBLkkaJqcGLzAAl5g0zpIOK5qw+
         6vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540425; x=1744145225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qKsANY9N47hjadaMZNM56aBAj0f8nczwxZTz9+A9lg=;
        b=wWnYtjnMBP5y0YaF2GMh97MWWr0WNZOYizrip3/RESsA/xCyFPEu7zsAl2IvHiIuQ0
         PDW8MF3Im0kQB1tzzynrb2mvgFEAE5porp3YsYMVTfbbF9sxmejmwJVFDozhjv4AfnvE
         DBlJU4Yg2MCZF4ivyNlHwn4csG2mrPmwzs1lI18fhz7980/5ez30SQ2qEdic+6dXY9LS
         zemZOrAnPKvUrQYp5nEPi8r5EQUsvA3bbbGg495RcsqqSAGAo33w+kCmO5NlUB1lEol5
         LuABEoG3G84ptWKdOGFsoBS6Gz/s5AKcwMv6394A2xaIyc3UrdhlP/QFEpmgPnQ144W3
         Jd7A==
X-Forwarded-Encrypted: i=1; AJvYcCV1CceD/kCUcCIlfW64elMkxfRiFlMJpW7SpTZZWE9EVv7EknbqZFiU2DwsUY7Y/XOsIhGk+2fTR1hWnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ycUQTVYDy6euxnKLlJUoVZvZ449PXlcAG73KPCBC0gDBEQ6X
	s2IN7aoUe3eAVLhXbHvoSuAjmQ1pYkjtpkev6eTO8KgEyje+8519pF7qqPloFeFPhGszMS2Y6qo
	A/g==
X-Google-Smtp-Source: AGHT+IFGVv11dt7rUK+obI9Bx4C62kJ/MvcG+5bk3TDAhhA7vlmUxcL80d04RZFegq2L9eKJhwQmELWuf+4=
X-Received: from pfnz20.prod.google.com ([2002:aa7:85d4:0:b0:730:9951:c9ea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:84b:b0:736:6279:ca25
 with SMTP id d2e1a72fcca58-73980463170mr23448772b3a.24.1743540425095; Tue, 01
 Apr 2025 13:47:05 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:22 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-11-seanjc@google.com>
Subject: [PATCH 10/12] KVM: selftests: Assert that eventfd() succeeds in Xen
 shinfo test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_134706_109648_B68176DE 
X-CRM114-Status: GOOD (  10.76  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Assert that eventfd() succeeds in the Xen shinfo test instead of skipping
the associated testcase.  While eventfd() is outside the scope of KVM, KVM
unconditionally selects EVENTFD, i.e. the syscall should always succeed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/xen_shinfo_test.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 287829f850f7..34d180cf4eed 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -548,14 +548,11 @@ int main(int argc, char *argv[])
 
 	if (do_eventfd_tests) {
 		irq_fd[0] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[0] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[0]));
+
 		irq_fd[1] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[1] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[1]));
 
-		/* Unexpected, but not a KVM failure */
-		if (irq_fd[0] == -1 || irq_fd[1] == -1)
-			do_evtchn_tests = do_eventfd_tests = false;
-	}
-
-	if (do_eventfd_tests) {
 		irq_routes.info.nr = 2;
 
 		irq_routes.entries[0].gsi = 32;
-- 
2.49.0.504.g3bcea36a83-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
