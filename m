Return-Path: <SRS0=FiNg=OE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F908C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 25 Nov 2018 22:51:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AAC2082F
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 25 Nov 2018 22:51:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9n2xgMp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="WpN5+ScJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30AAC2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yb3htWL64LsatPX700S78J+67Bzsv0wjZH3ai2//HQM=; b=i9n
	2xgMpcQ1Nz/DgOJa5Fxtw6lNy0pq1rLungU1DRtbmCLGLxcv+t8KvWFjETGaUjbCqECpYvFtRssmm
	l7Smp6R3GWB7eBOWtB3TsGJ9JHlkNgkyR/lljjFA2bJQGioflC64Z0y0oz5JDtnHPSpfgxNGvYKpS
	a0EVbHYiMAaxiCiCqJtzupnm1nzOFubJSBnVtXldIJqoFW7zvWY+zrt1Quv3L0zkkT7CnFC8ia1co
	dFQlUNgInvmEW/VkoMlNlFYsfPS2k9uzt8rDtZT5MZasv3aqQQkiGQx8mTcVb38moltycLPDJjq2I
	xIpC91+uHc2EDhd6aHqj7ZaOn4xBGXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gR3Fc-0004fI-EX; Sun, 25 Nov 2018 22:51:40 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gR3FZ-0004eP-V1
 for linux-riscv@lists.infradead.org; Sun, 25 Nov 2018 22:51:39 +0000
Received: by mail-pf1-x444.google.com with SMTP id q1so5609596pfi.5
 for <linux-riscv@lists.infradead.org>; Sun, 25 Nov 2018 14:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=/7jn2dY0eXpQ+H2jsLGd0VISUlAYwO5O42O0KxD/Mms=;
 b=WpN5+ScJ/QWbqhC3k8pZqkKvjC6Ixob7TBoCVCUJdk43LtXKK356ZjzXV2/q31xnTG
 6czyC99b7gpoW9AQJsNRPUbP45Fc9ESuUaULelhBe4qt41op8XrGLw0R64uOs+PVk/G8
 Bd9O0hn5VJnOVSyXMoFWHHWEFcKZBBaCc7HlT5TdgPCjfEXmtejaWAR7YPtNlbQNIt40
 JQMgxhaBbd4pYk8indEd6WqxDafT+FOTSOX+4D2OMy1Tg8zpi6wdtL8B6gIGLt/TgZNk
 ygrLNW1QeLnrIGDGmYL32+jtFsAaJqYg7RQZ0V1fw4qxa0vTc1aOw2U0qL5dXDzDLCzK
 cNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/7jn2dY0eXpQ+H2jsLGd0VISUlAYwO5O42O0KxD/Mms=;
 b=BaLqlFkUEahhn/xtn+OlgqNJmB/jf7R22RelBO0kDGaxWK+C4Jc5eb0j8khqSw2DLX
 39FSHOpDPPNJLU4uUWzXN4wnXfcHKw0haqgq3xRpDpa+I9dFtYW9yvMlBJwmqHRL5UBu
 CA9CwBqYX/CORoKUVy6NuSZxLTJkF9PtncRk4wnn+1lQTwOVO4ZcECBxuf9P0pEf1mPT
 fmHzrHPKkDLKNhMUPr/hHYVZWB5yBemSr9wnsgr5jvcYEVVAjitsW0uDh923nvm1zwGi
 TD0S2+SensBz20oT55PK7WDLkIwt7buvFNGKP84c29z2o5vo6LvK98maIHZacvfKEBmE
 atDg==
X-Gm-Message-State: AA+aEWYtc2AenXdlVZT/hW/o1qT34alxSMwZ3qj7Mps3CdHJgTz9FpSK
 S65lZv2AGXerxK9BPAk+eMKLVfuMAvzY6g==
X-Google-Smtp-Source: AFSGD/XDZQWkJ6veyCV7mKE89s5QRQmxAsv1HF0l5tkl8tIB45doidcERBK3jI+wzWViwlOygrGihw==
X-Received: by 2002:a63:4456:: with SMTP id t22mr23052921pgk.0.1543186287263; 
 Sun, 25 Nov 2018 14:51:27 -0800 (PST)
Received: from rip.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net.
 [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id u137sm88976473pfc.140.2018.11.25.14.51.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Nov 2018 14:51:26 -0800 (PST)
From: Olof Johansson <olof@lixom.net>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: perf: fix build warning
Date: Sun, 25 Nov 2018 14:51:21 -0800
Message-Id: <20181125225121.4454-1-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181125_145138_004001_1CD5E358 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181125225121.s9kjjNTRjyDonvB4nwc82Rvh28Au1214BriVgQNBsFE@z>

Due to the -ENOENT return, the variables can't actually be used
uninitialized, but the compiler isn't smart enough in this case.

Let's just set them before returning with the error for now, it'll be
filled in once implemented.

arch/riscv/kernel/perf_event.c:166:5: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/riscv/kernel/perf_event.c:166:38: warning: 'op' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/riscv/kernel/perf_event.c:167:39: warning: 'result' may be used uninitialized in this function [-Wmaybe-uninitialized]

Signed-off-by: Olof Johansson <olof@lixom.net>
---

I swear I posted this exact fix just last week, but can't find a reference
to it anywhere.

 arch/riscv/kernel/perf_event.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
index a243fae1c1dbb..81f3ba76f1dbc 100644
--- a/arch/riscv/kernel/perf_event.c
+++ b/arch/riscv/kernel/perf_event.c
@@ -150,6 +150,9 @@ static int riscv_map_hw_event(u64 config)
 int riscv_map_cache_decode(u64 config, unsigned int *type,
 			   unsigned int *op, unsigned int *result)
 {
+	*type = 0;
+	*op = 0;
+	*result = 0;
 	return -ENOENT;
 }
 
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
