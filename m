Return-Path: <SRS0=DVE0=WV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9208AC3A5A1
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2019 13:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6761C20850
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2019 13:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MPQim8Ry";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g03zkfsq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6761C20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsvtOWdgpafcA48cZd69zXiIEkn3iMexBnIOcy6nZcE=; b=MPQim8RyTKuFWD
	FaZfIY239zi7ppkCBHgQBCt1DiGflaIUCYlLsUV6LBLkgwFF+ujnfanBMDWy1JCARpcaPamnRBdAT
	NJ3JPCBqgYXVUXTXAg3sjcGpuDheNzAsUk4H9CsAJygH9AYsK3xbdnomWw+FMkA6J2DzyYPwQjbKX
	YAtRFB+fU4SjVd1KTsKXN00pklP2PiRiBemid6u97QSpqKys+417qnGBO9+JKnvuAfDsgT23nRU2L
	Gxsg7N6+ZDaou363kCyM1T1ZHwqIcL7M24mN8H8wsIpURqQ9NVyMndz3RADkr5/4eqBocXtZ4HCcR
	fQRpMXuWAMiZHoW6X9+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1sZ9-0007vZ-Ph; Sun, 25 Aug 2019 13:28:20 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1sW3-0004DS-0t; Sun, 25 Aug 2019 13:25:08 +0000
Received: by mail-pf1-x443.google.com with SMTP id g2so9845157pfq.0;
 Sun, 25 Aug 2019 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NnHjdka8q9MM1nbcRBaxfkCGVCCjsDG70zM+YYdNV3E=;
 b=g03zkfsq+c6M14xC3btV7g6IPmWaG8X+9s5nY7dD43zw7K8+Dl6zmdV/meLJmfcsMD
 /XzawISKOMxF9+tzCwu74cViPpHxmr/GarsoBsTn/ENQVJNySASP3aLxbeDN7HAHeP7x
 5AqjpbMw/SWUexnfZkPSUIB379U8mtrc4sNHcxkuWU4mRUZg6at+EX63IeNV5JvMSKsP
 dwxVFHi7nznxJzkCv1jujm1jXMieR9Eb+5viooHTscZhT58A5U5DAPY7JJfRziAsgBjm
 JRivX+QMRW56PFrMRP81NpX/zHCaOTF8BBRZ+789DiMV5Tbs37PC1YPOlEkouAyarn5N
 J2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NnHjdka8q9MM1nbcRBaxfkCGVCCjsDG70zM+YYdNV3E=;
 b=hv6IW8p7dvubaM0HQwf9+wn7DQeclS/zUg9sw/CH7X+4HZjFP7WJvZJxxT0eqgivJL
 hLtKSX/zXxFX8zTFNvQ8H9Rm7HtEHmbtoGEJ8Ev4PfjLs2q+QysfoaL2E3M9uU+ndYzV
 hH+CbAxueUe//olKOnSj5MzKPRMXByvKVCkW9wyQTBo1+1uJ9w99mOaujNiuy1AAVngX
 KLO7KDf1tIGStCMiiw3tpKiqm0tyItivUMAtFWfWUUxnd0UFKoSy9ezOIDTqX0C7PT2L
 gIn3l2Z2BUfDI/fnC6a8ToFwvMyQPBZR9sBoRDAeV977vFm1lpkeuMcpNmkfGSUQahrv
 G3eQ==
X-Gm-Message-State: APjAAAVrZAlv3F/QVR/BdDHy/9hGqlvyO3nXmjjOvwt16fwxQDFbp6dT
 boLtZwjyJfk+swJQ6vVjvhA=
X-Google-Smtp-Source: APXvYqyz1vAktHcdxrCebWGWWISA04KQUpd77awztbV1MU/g3rutrKQ4McqGMrzQW2zfpUUXANHC4Q==
X-Received: by 2002:aa7:97aa:: with SMTP id d10mr15293204pfq.176.1566739506119; 
 Sun, 25 Aug 2019 06:25:06 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:25:05 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 10/11] ftrace: add doc for new option record-funcproto
Date: Sun, 25 Aug 2019 21:23:29 +0800
Message-Id: <20190825132330.5015-11-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190825132330.5015-1-changbin.du@gmail.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_062507_567462_02C6D2B5 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Just add the doc for our new feature.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 Documentation/trace/ftrace.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index f60079259669..c68fbbedb8bd 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -988,6 +988,7 @@ To see what is available, simply cat the file::
 	nolatency-format
 	record-cmd
 	norecord-tgid
+	norecord-funcproto
 	overwrite
 	nodisable_on_free
 	irq-info
@@ -1131,6 +1132,11 @@ Here are the available options:
 	mapped Thread Group IDs (TGID) mapping to pids. See
 	"saved_tgids".
 
+  record-funcproto
+	Record function parameters and return value. This option
+	is only supported by function_graph tracer on x86_64
+	platform by now.
+
   overwrite
 	This controls what happens when the trace buffer is
 	full. If "1" (default), the oldest events are
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
