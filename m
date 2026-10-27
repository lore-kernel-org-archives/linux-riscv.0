Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC54606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 06:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yBTiTKV0;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Snx6N9ZQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IIIK2eJ1tc+PxSNixg5LPm6dzLhHuOG6i734o1/7wAk=; b=yBTiTKV02tKSZjS2h+kV+QJABk
	bjCekEh+khUO1hbdhoIUpDoITlNWiXsdm/XtOMw+MDbBjLgW11X63XwMMs4//lAWHZk8cMBKsEc8Z
	5ZsbHnwoUwWwSDI/61/AsGuefsOGgy2/i6qHwSKogtRbCNdOJQgHygtH+nbysrBLH/C3Xzy3kNkft
	NenUqWpHMHrpAG7tXaYEZ6Ckqj6Kh1CQF6Pqk9h0ISG/kEpZTXY9ORJ/8S8lepAC9a82oYdacN7jB
	mcuFLnCgihMIj/7xtKEvvRqBPPYiy0WIBr1nSZlLzFVYRZr1+dcoKEoGN8BMvNz3YLIicGa6G+lKi
	ncCWBGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLanV-00000003qWx-0hex;
	Tue, 27 Oct 2026 06:36:37 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLanS-00000003qTR-0Zjy
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 06:36:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1575788a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082993; x=1793687793; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=Snx6N9ZQGxKyEHSSMZidInOfCCOMXC9++AAQLVaGiKsdqMDSchtYDwLY9oFnpbtKqO
         nu8C7gEqQ991flGNolG3v1c8YbX0lLJHGFExjWMCftCTE192+XSqQpYvczItUpZILODy
         XoC4uQ49M1KDVzXY8hSfVoUMXX2RcXe1Qm/3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082993; x=1793687793;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=25lJwODfbd8xw45S6+lhT6uw+Tat2B5Ueau8m0zryA4DN8TyoVBZ/hq3+Ae+GA86lI
         /z2XdLlcRVuakz6y8mDkZqp1bxZqZsfrPbv5DJU6W6qRvCqQrDn1EoDMPreJ2O95r1tJ
         0eriFMQXZzPxdTw0K8VhSxUUYcqacxzI0ueOlLvIwX9kUALa0KiETmoK1A/iX1PRBszl
         xaqxgKDELfE0KOWaIo5yUOrfz6fOTq+fLjZEnKFgEo1Oyn6SH2V/s7kNLHX3XURXFZrV
         WpR/OWQgWsUpu0l2Rx6GYsJQsCn9TaILYtP1Oq3jpUqH6ExIhJueHI1KjLq5SvVzK2yP
         IeRA==
X-Forwarded-Encrypted: i=1; AKwUvByRIorsJt5fUMqQeEQAO9oq8iEXfzCj7G5VxDD8rwG7ZKXGHDMcrIGHlYslNTCog6KDzCZmNrpZN6M96g==@lists.infradead.org
X-Gm-Message-State: AFq9FYKBK+LKBOxMDLHqGTgdwRtLRVcOFK/uorZEwXC2wLjF5aSNJrwb
	NnazITbCqTN0d2AoGi4xDdRwDFD3J7ddawrUjNveGUsy6/ZeoFw0LP34yGlSZ1cufq8=
X-Gm-Gg: AYBFou25+aDQNvIU+hq0xPHa5NgDkbW47p24AOYmDEMUXsSv3+MzhQyyGfy+d5+sjem
	2WN5QUqtTJQpZD4w/nwfmassF/M1SffJ95yFoisF5x/fw5lbJzaDq8UjGTgpy/SoI5LQUkNILKM
	f1FpaWzn1h/Dg3eGxMXgDvyCD/UJynH6TV4RvX2JGe6ZQw/dy92Klu0dDstZ8GEXXsAjzbYhWmQ
	74vkIzsA7Go8EAWpTWCO2RGbQzS25rGDuSp5axmuDKzRCNEao7Wx7jSwj0gX5+XaETnGAVMNi2K
	+BlPeqgOlnoo+fmRxY1HfxzpKmzQEFawwSjfWll90ublJhH1Q5ee0uOQ9uljGqxxyrSdUk8M6g3
	jbA8IZTvNxwXSR8SauG1RRzwnxiPDemXwX25JmN1IZPEKKAzm0d8oLZBGoFWMItrHHjbjWbssA6
	vN8ODrTbLFA0pKStTbWuL2UNVEu8/ZmFhIPF+RnS7k0bX836KPUUSmhhPBpFCR8NJAZJvgvn8wh
	TADP9Q6GAv2DwElgRAYDnqQHBVD4SHfYpKkKeNG+VI07sEoujKHza/3bJCQSMmM3ypJ6N/Yudqi
	ZrCR0LJBxlnVWieoU4a22hfgmUtEgnaXvT65yEzXCEEBCk1cdA8thfCFu48SMlF+VHsi+JaKcV7
	ubPGBDKx16+0ZoeNmKlClmVI=
X-Received: by 2002:a17:90b:3ec2:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3adeae6d30bmr6210081a91.18.1793082993200;
        Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40456f65sm2331529a91.13.2026.10.26.23.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:32 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:28 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 3/3] lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler
 stack end check
Message-ID: <7c4627a57202b505bc03837680f6b43c2683bc07.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_233634_197067_749B65B9 
X-CRM114-Status: GOOD (  14.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's no existing test for this, so let's add one.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/misc/lkdtm/bugs.c               | 21 +++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 3eca2ef64aff..929a60db00d6 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -215,6 +215,26 @@ static noinline void lkdtm_CORRUPT_STACK_STRONG(void)
 	__lkdtm_CORRUPT_STACK((void *)&data);
 }
 
+static void lkdtm_CORRUPT_STACK_END(void)
+{
+	unsigned long *stack_end = end_of_stack(current);
+
+	if (READ_ONCE(*stack_end) != STACK_END_MAGIC) {
+		pr_err("FAIL: stack end magic is already corrupted\n");
+		return;
+	}
+
+	pr_info("Corrupting stack end magic and calling schedule() ...\n");
+	WRITE_ONCE(*stack_end, ~STACK_END_MAGIC);
+	schedule_timeout_uninterruptible(1);
+
+	/* Still alive, so let's restore the magic so nothing else trips over it. */
+	WRITE_ONCE(*stack_end, STACK_END_MAGIC);
+	pr_err("FAIL: corrupted stack end was not detected by the scheduler\n");
+	pr_expected_config_param(CONFIG_SCHED_STACK_END_CHECK,
+				 "sched_stack_end_check");
+}
+
 static pid_t stack_pid;
 static unsigned long stack_addr;
 
@@ -854,6 +874,7 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(EXHAUST_STACK),
 	CRASHTYPE(CORRUPT_STACK),
 	CRASHTYPE(CORRUPT_STACK_STRONG),
+	CRASHTYPE(CORRUPT_STACK_END),
 	CRASHTYPE(REPORT_STACK),
 	CRASHTYPE(REPORT_STACK_CANARY),
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..2d856ed77a64 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -10,6 +10,7 @@ EXCEPTION
 #EXHAUST_STACK Corrupts memory on failure
 #CORRUPT_STACK Crashes entire system on success
 #CORRUPT_STACK_STRONG Crashes entire system on success
+#CORRUPT_STACK_END Crashes entire system on success
 ARRAY_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 FAM_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 PTR_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
