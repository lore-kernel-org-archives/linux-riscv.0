Return-Path: <SRS0=Lzn7=D4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D795C561F8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 07:39:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2537222249
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 07:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L5hfpqLk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l7kbINg6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2537222249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PKlMedNT8vqWt5LQCxnaXPCSCbDtz2G6fSTCXuxJrr4=; b=L5hfpqLk5y7CJ76h1ptOI0ToMx
	9wf9A/uuExr3oritzo6HQ0ckDlnIEWUR8yfiShEOOescjZ/8ZH5pFvVsN+9jr06NOUMVZRJyRdGkF
	eOfmvs8TFYLxzSbokql840Vs4RfBvEtfHpFdTkkhxpeceQuOGbEdowpWlgDiIGMYYdKSn3J+MBHgE
	KBC3QHTrJ9F8Acv9o9QpH7mbkGycv71sGcODXH+3d3aHUNQAa4qMiKeEfllmEaFHC9k6BcvapqRmc
	BAhTvQ2W4Nni675e9m44if7MB5t/6dk1odKxV/OCzN6bxL+B8qqUOwSHPGAfvCH+YbPJevakir9ei
	RH/h5ANw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kV8ht-0001sX-R1; Wed, 21 Oct 2020 07:38:49 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kV8hr-0001rz-Qr
 for linux-riscv@lists.infradead.org; Wed, 21 Oct 2020 07:38:48 +0000
Received: by mail-pj1-x1043.google.com with SMTP id lw2so705585pjb.3
 for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2020 00:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eKb/Frrmvnv/33KqdsWJeWab+iCRIkq7ieYQ8AwTtF0=;
 b=l7kbINg6T/rz6Keu9fmDlCMWTmG1/+08mJYH8VriXgDUtnBz482eOAJUIWtzmtlYz0
 PKDHIC1+HgplcztSUfW2klaXGDBR41YyjZnx+JPC5JJwQawrxGiBd0OTFKupsmtDaDLq
 PGVdnixhhvZ5xMX79Z30zeDrgO1Ci+QetOhSnLTnUCMk0MoMdfxFTkqZtI3p0IlKIsZh
 mv5712Ma76EeZL2y5EKdpqFcza3faHEOozzMrj53xDEEEwTsQVUIYTWRmVyd8N8J5Ao7
 HYf4RNjbRfdvHDQ8AWEz6FWM86CAOoQLdyN9GmC1VJ0wQy7KgLnpv2BVbdQS2bqJTwEe
 IvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eKb/Frrmvnv/33KqdsWJeWab+iCRIkq7ieYQ8AwTtF0=;
 b=kYiuUmwST2gBIwtZ98Zw9grP84qv0uFZALxtVKc7tm6fds+D39lEmDZWOE5+NTtEW1
 jBfCAeJhy4+Vz0MRtyOz25XrxA2YzmdPfwXkdZyliyV2Aooh7gj8LB2iOgjNHOCeCimh
 03i1Phsi6lEA7ICfdtSyY7H2HQ3vJeYfrrD7n9zCyfx5Tr4i8CmHPnwcmvEfSz4FfcTD
 QgUhnjQAaOQXqsNVthDq/3ajniJwL96UrEw+RDRG/eX6wqxQr3k21862rysA4l3hogbL
 HcBOQ3IJ+p8d4t/+QTLlC5wn+4X/kc+rnnNceeiUmISEq6vh8mjYd38CRFsVqqdDA4qt
 hGeA==
X-Gm-Message-State: AOAM533+ig8mYpHHa3A141FkQ84H5EFSiixdRsazs7Pgod+D8oKtNRQP
 b00jjVp1bW2ZQr2sbGcUCohh4w==
X-Google-Smtp-Source: ABdhPJyzrXm1MLbJMUQ0FC+foLeuohSmfg6Akqt9RLeeEZrF6HQJPb9ipKyS0GVo68plN8dHtSIl1w==
X-Received: by 2002:a17:902:ba96:b029:d5:f36b:44af with SMTP id
 k22-20020a170902ba96b02900d5f36b44afmr1927407pls.51.1603265925314; 
 Wed, 21 Oct 2020 00:38:45 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id s20sm1131333pfu.112.2020.10.21.00.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 00:38:44 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paulmck@kernel.org, josh@joshtriplett.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
 joel@joelfernandes.org, vincent.whitchurch@axis.com, tglx@linutronix.de,
 paul.walmsley@sifive.com, palmerdabbelt@google.com, guoren@kernel.org,
 atishp@atishpatra.org, mhiramat@kernel.org, greentime.hu@sifive.com,
 colin.king@canonical.com, rcu@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] stop_machine: Mark functions as notrace
Date: Wed, 21 Oct 2020 15:38:39 +0800
Message-Id: <20201021073839.43935-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_033848_090217_295574E7 
X-CRM114-Status: GOOD (  12.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Like the commit cb9d7fd51d9f ("watchdog: Mark watchdog touch functions
as notrace"), some architectures assume that the stopped CPUs don't make
function calls to traceable functions when they are in the stopped
state. For example, it causes unexpected kernel crashed when switching
tracer on RISC-V.

The following patches added calls to these two functions, fix it by
adding the notrace annotations.

Fixes: 4ecf0a43e729 ("processor: get rid of cpu_relax_yield")
Fixes: 366237e7b083 ("stop_machine: Provide RCU quiescent state in
multi_cpu_stop()")

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 kernel/rcu/tree.c     | 2 +-
 kernel/stop_machine.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 06895ef85d69..2a52f42f64b6 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -409,7 +409,7 @@ bool rcu_eqs_special_set(int cpu)
  *
  * The caller must have disabled interrupts and must not be idle.
  */
-void rcu_momentary_dyntick_idle(void)
+notrace void rcu_momentary_dyntick_idle(void)
 {
 	int special;
 
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index 865bb0228ab6..890b79cf0e7c 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -178,7 +178,7 @@ static void ack_state(struct multi_stop_data *msdata)
 		set_state(msdata, msdata->state + 1);
 }
 
-void __weak stop_machine_yield(const struct cpumask *cpumask)
+notrace void __weak stop_machine_yield(const struct cpumask *cpumask)
 {
 	cpu_relax();
 }
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
