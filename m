Return-Path: <SRS0=DVE0=WV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7184AC3A5A1
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2019 13:26:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4120320850
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2019 13:26:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NfgfeQQx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHDg4LdF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4120320850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WA4zZp/5LSmjC5KsNTudMGs7+yJgNkYM8EnB9R+TqRk=; b=NfgfeQQxC6K6U0
	tkL3QDeiqUxtlCloY1UMqcdNF/saFAS404qe6dXHGOWDGISrns4yAwtEZ7QsFJ3faLVN0eWZjyQ8r
	JS5/GIyCmUguIIm9FdoUAEVl/IP/zrRCGUGKZHxp8uqmwdgXPTMjuEelFUUPuJ0glYX+9yTy5z4pY
	94Be5BmlPeIA/ni3NFgj/fU8mGLLrxhiHnkas+YpMgjIBJq7MGtN/uggBpbNB9Vx9dVInywYJ1krd
	BX71zQYypDpmbD8DQUJPHUiFYQV58YJSWnc7LzmrG5WksHPPRiplpZcbU/Lr4Tn/gRDozU7cG/zLx
	RW3VUpoBIPTNEKWKd2Yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1sXF-00063M-LO; Sun, 25 Aug 2019 13:26:21 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1sVH-0003A7-RE; Sun, 25 Aug 2019 13:24:21 +0000
Received: by mail-pg1-x543.google.com with SMTP id m3so8721304pgv.13;
 Sun, 25 Aug 2019 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZBMOYzu8UIu95lP7jXMjUUnVweWqbQKsr6KxrGRBejY=;
 b=sHDg4LdFrZLoGW/ZYspHbC6si5YKDLezCKJyEjDpI/sdIE9awBNr91t8Vhfot9Jkv/
 eY42rNW+4SWG7yComJVhrM6XBby3bfRflTU3gZKNvI3LyaamRH5OjwxcYHOm09dbfmNI
 t1ix14MoqSf120rnu5QbAzkF79vwWQKxhqXPBnXMc0lOXCWJtyvXsI0kTP/MMPNK1JUo
 cLZ9SKjeQoOaWjCl1i2knVrN+R/+widRkHLHIBuvg3Dms/8DumzuWQnRndvA3vlc2ra+
 VjSjvDvL9QH/d9g3AYDaj60J1P/SBbs+EHTE1BskRsNLdUgHaE7p93H+uAyK0UdkBANy
 EYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZBMOYzu8UIu95lP7jXMjUUnVweWqbQKsr6KxrGRBejY=;
 b=CqANQ+EREhlWoISfT1IP3YyP8YqptMq8TRhTO14Tyq66rE9DXqziWEDY01To826+Il
 2FObpQoW61yGebs+6nqLb2T8LbgKddF84ouqfIjJXfnFw5y/alC9ctsSk3DvFs62YRWV
 9a2K5Pzk+DZN5VfNt7rBxXouaLqAu8z9QJ6F/PWKCk0jKFGF4xCveLGEQ1b9igGvFVTX
 C9gOIh0QvI13nLrgSSJFaf1Hm5MD3zFEr3bhHsn/hUzqtNWUvGomhyGhK0GxArCZSRkE
 iNGz31KFrogK7QSDIPv9y++wHR0uOMBUUtmXjU0D+7rIUQ5+pK/wAxHNSh0cB+3rQmle
 LO8g==
X-Gm-Message-State: APjAAAU2KLctnuOlMkvC90pK6YWnHIpYqd9xxMJDMEMezH1bw9B5rDLI
 Eggo9+ZrWGB+cM5Z2AHlLww=
X-Google-Smtp-Source: APXvYqxpYPr/pKADhj70YxFWPqP5/wYXfBY0LpRYX2aLllbJNw9nnJFrJ+KG+/AqWzkmIcaviruEwA==
X-Received: by 2002:aa7:93aa:: with SMTP id x10mr15472120pff.83.1566739459240; 
 Sun, 25 Aug 2019 06:24:19 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:24:18 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 04/11] ftrace/hash: add private data field
Date: Sun, 25 Aug 2019 21:23:23 +0800
Message-Id: <20190825132330.5015-5-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190825132330.5015-1-changbin.du@gmail.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_062419_927744_8AF28E34 
X-CRM114-Status: GOOD (  11.25  )
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

We will reuse ftrace_hash to lookup function prototype information. So
we need an additional field to bind ftrace_func_entry to prototype
information.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 kernel/trace/ftrace.c | 17 +++++++----------
 kernel/trace/trace.h  |  6 ++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index eca34503f178..a314f0768b2c 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1017,11 +1017,6 @@ static bool update_all_ops;
 # error Dynamic ftrace depends on MCOUNT_RECORD
 #endif
 
-struct ftrace_func_entry {
-	struct hlist_node hlist;
-	unsigned long ip;
-};
-
 struct ftrace_func_probe {
 	struct ftrace_probe_ops	*probe_ops;
 	struct ftrace_ops	ops;
@@ -1169,7 +1164,8 @@ static void __add_hash_entry(struct ftrace_hash *hash,
 	hash->count++;
 }
 
-static int add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
+static int add_hash_entry(struct ftrace_hash *hash, unsigned long ip,
+			  void *priv)
 {
 	struct ftrace_func_entry *entry;
 
@@ -1178,6 +1174,7 @@ static int add_hash_entry(struct ftrace_hash *hash, unsigned long ip)
 		return -ENOMEM;
 
 	entry->ip = ip;
+	entry->priv = priv;
 	__add_hash_entry(hash, entry);
 
 	return 0;
@@ -1346,7 +1343,7 @@ alloc_and_copy_ftrace_hash(int size_bits, struct ftrace_hash *hash)
 	size = 1 << hash->size_bits;
 	for (i = 0; i < size; i++) {
 		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
-			ret = add_hash_entry(new_hash, entry->ip);
+			ret = add_hash_entry(new_hash, entry->ip, NULL);
 			if (ret < 0)
 				goto free_hash;
 		}
@@ -3694,7 +3691,7 @@ enter_record(struct ftrace_hash *hash, struct dyn_ftrace *rec, int clear_filter)
 		if (entry)
 			return 0;
 
-		ret = add_hash_entry(hash, rec->ip);
+		ret = add_hash_entry(hash, rec->ip, NULL);
 	}
 	return ret;
 }
@@ -4700,7 +4697,7 @@ ftrace_match_addr(struct ftrace_hash *hash, unsigned long ip, int remove)
 		return 0;
 	}
 
-	return add_hash_entry(hash, ip);
+	return add_hash_entry(hash, ip, NULL);
 }
 
 static int
@@ -5380,7 +5377,7 @@ ftrace_graph_set_hash(struct ftrace_hash *hash, char *buffer)
 
 				if (entry)
 					continue;
-				if (add_hash_entry(hash, rec->ip) < 0)
+				if (add_hash_entry(hash, rec->ip, NULL) < 0)
 					goto out;
 			} else {
 				if (entry) {
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 005f08629b8b..ad619c73a505 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -882,6 +882,12 @@ struct ftrace_hash {
 	struct rcu_head		rcu;
 };
 
+struct ftrace_func_entry {
+	struct hlist_node hlist;
+	unsigned long ip;
+	void *priv;
+};
+
 struct ftrace_func_entry *
 ftrace_lookup_ip(struct ftrace_hash *hash, unsigned long ip);
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
