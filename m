Return-Path: <SRS0=95at=7O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCFDC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 03:40:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A35420738
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 03:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ssx5+0Ys";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EwJGNMp/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A35420738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOcDnv7hzdo3sm1Ws3sgeoTUJcZ9vO2MwFxGDprhyas=; b=Ssx5+0YstRukUb
	U9sCRZO+b4mev3y+qY2ETADAKk47FnYz+fzD3Fi5NZzK1EwutS2BzuDgYHa5xAew4ZURn2dkGUvLl
	jsrvIqDoqZDDyNNVVf2PGHwb6M2cujhYDInSelcNVaQPB76ksWksdlsQXxfAgCY48bYkqL2g8/zZp
	LRFXrHl1SuP4BvwTFOC0DvyO0lm1hHBokgPnpflmgy8vHJXDnwEPjLkgfpNUl9MZre/qE7+eoMSAw
	HjlDf3pMhmz/8eqY31N7FkAuS6G0eM/Ksg0VT7eN28+FS/4T8Sy1YJlZjN3WRyOgrt9EGQglJi6vF
	/Wl8gRmNMNNmteqExxYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfbIv-00079O-0u; Mon, 01 Jun 2020 03:40:01 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfbIr-00077T-J8
 for linux-riscv@lists.infradead.org; Mon, 01 Jun 2020 03:39:58 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 5so4327729pjd.0
 for <linux-riscv@lists.infradead.org>; Sun, 31 May 2020 20:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VOcDnv7hzdo3sm1Ws3sgeoTUJcZ9vO2MwFxGDprhyas=;
 b=EwJGNMp/r6zUKSwinf/LZl4fdKCFyw7OFv+Op4LD8DVjO07yERN9f0HUA5j6sDWuRU
 e1avHAZomkvQJcINzt1QxFvIwg//uR6Fx6ko9vvExp2ft4pARaIWGES7QJQo4yFK3j5A
 OdBATrBAmg+tLHX7Naj3oq6UkyQ1XVwgUqqTQmRjXWuJ2iJefIE4JoWWdbfG8PsYkqB5
 2Z/Yn54fsRVOJsuqF5d2CTXRmnrTaJ29yUMuaSoLNw/UrY/rZ6D8XD4SJm9TaggaGoz5
 PkK8sdPFBN+QXPbhvLKi64IVzSUvcrt+EsbQ6gremp+vhkvxvJAfFsgFDYruqe+d4VLr
 vB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VOcDnv7hzdo3sm1Ws3sgeoTUJcZ9vO2MwFxGDprhyas=;
 b=Vh1gg5Ts7ubFrZKbP/2ls516y4C3AnZlnlgltU/JcB7BgPnxs+yEF6z039ATc5oHA2
 uWSebTAD7apHETTYWzhSybtdHz1aQUsyDIxfNKvcT7Lxw4Key2TGwarjUBeBOfBXmkha
 KHTFqXSFOHOJJNVTY2vfHaWJRbz1Eh3fnKU8yH+mAlwnxFRNvKCkm4wIb6xhYiBfJS94
 vF8Z6+LgQmpAnjL8F9xDB0uLIB6m2v3KTv971LV8PT7KS8YCOhF4/jgApS7+zpqTUlP/
 7+yoWhq6d8FoOlCJR0LgSqpBxx5mj9mDM7DDyxU/QiXYaAXn6y92J2yddCxkcnQkXsbb
 ZyAA==
X-Gm-Message-State: AOAM5311VUsRVGWrgIhbQZgyB6EJC0NgSrjZfV/nCW1ruRt2MzLbsgFg
 JpLD00Z6lvIukkWTJFqVQxY2Ig==
X-Google-Smtp-Source: ABdhPJwyOuOaRg2pwGJdZshQqIGXq+EDKjJqWI4FQhq2tsaol4huk2XOrxhzKY+0wXBBDKwGTpZemg==
X-Received: by 2002:a17:90a:e016:: with SMTP id
 u22mr21329552pjy.28.1590982796823; 
 Sun, 31 May 2020 20:39:56 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (2001-b400-e3df-96c7-30f0-f751-b645-f4e3.emome-ip6.hinet.net.
 [2001:b400:e3df:96c7:30f0:f751:b645:f4e3])
 by smtp.gmail.com with ESMTPSA id a7sm13102527pfa.187.2020.05.31.20.39.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 May 2020 20:39:56 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Subject: [V5 patch 1/6] kgdb: Add kgdb_has_hit_break function
Date: Mon,  1 Jun 2020 11:39:06 +0800
Message-Id: <1590982751-13401-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
References: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_203957_630696_DB9D9EEC 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The break instruction in RISC-V does not have an immediate value field, so
the kernel cannot identify the purpose of each trap exception through the
opcode. This makes the existing identification schemes in other
architecture unsuitable for the RISC-V kernel. To solve this problem, this
patch adds kgdb_has_hit_break(), which can help RISC-V kernel identify
the KGDB trap exception.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kgdb.h      |  1 +
 kernel/debug/debug_core.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb1fd78..03c64aa8ba36 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -311,6 +311,7 @@ extern int kgdb_hex2mem(char *buf, char *mem, int count);
 
 extern int kgdb_isremovedbreak(unsigned long addr);
 extern void kgdb_schedule_breakpoint(void);
+extern int kgdb_has_hit_break(unsigned long addr);
 
 extern int
 kgdb_handle_exception(int ex_vector, int signo, int err_code,
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..01bc3eea3d4d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -417,6 +417,18 @@ int kgdb_isremovedbreak(unsigned long addr)
 	return 0;
 }
 
+int kgdb_has_hit_break(unsigned long addr)
+{
+	int i;
+
+	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+		if (kgdb_break[i].state == BP_ACTIVE &&
+		    kgdb_break[i].bpt_addr == addr)
+			return 1;
+	}
+	return 0;
+}
+
 int dbg_remove_all_break(void)
 {
 	int error;
-- 
2.7.4


