Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C6CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B8892087C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QgXgjmYo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B8892087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bNbKv9odvRfVupccvjX3EPJg5Fi3+IQLHZx6Il32GPo=; b=QgXgjmYo6I6ARb6HFEph5SAhKF
	FdUWN4Craq8+5ejAoTszTcDW3kZUYQligxmj+Rl4hi2G8LXrx/Jft3FdOkKjriZTMd7iUulLvN5/I
	Nq+Mx/1nuMXgxLSGv192yTuJSA5156Z30etmssxseW0noYVZSuY9ikU36iC7h7CHbWikYZ7M69O7P
	SsMxBTpuGSliSnsWbxvy+HmctemxKc4400xjKE/QiDMwShBAqNx8Qh23Ztc+MDQgyvPfwAIwDTJJB
	iuY7aArqv6k/drDLjJIxjbZzzTlyfYAywu2jxvqgnnIkjTSuDJqcJH6yqAiv8WV2Z5V7SSQzyjdpv
	HLmT3utg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2EsA-0005ec-3w; Fri, 08 Mar 2019 12:45:10 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Es5-0004k1-7P
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 12:45:07 +0000
Received: from orion.localdomain ([95.117.97.241]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MkpOZ-1geygB0CQp-00mHtV; Fri, 08 Mar 2019 13:44:56 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] Makefile: rules for printing kernel architecture and
 localversion
Date: Fri,  8 Mar 2019 13:44:20 +0100
Message-Id: <1552049064-32044-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552049064-32044-1-git-send-email-info@metux.net>
References: <1552049064-32044-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:+ixOwLE+asB1gu5KRcJba3ZH6tn0P8p/UELGgM50mCP40lk3VeI
 GKZ9QDK2s+f8m3Ah3aDaWOw4T4JtMaBLkb7JBxD0Rg9kn7ql7tOpmnjavKihaIXuiQ8YYHE
 Lt65GwcFTc0jV3pYDy7e8iwANSCrKz/7tTR9k+lG+6Z4DByebo+772xXEChCPEM1rAooED9
 OxPvxZE7hhSvQN/ksyB1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:byOpdQzzR6c=:wZ5M0Pv2bS+7hixhgm9M0e
 UGh0dBe7Em9HsXAsbvLjTSdKGUB2cTtRCFx95JcxkPRbK/vcc4/ToJ3wuPdn7pro+IdzY+qMY
 Oq556zVtK/SydgkbcUJEufKS9FjcVS4pqcOKEoz3bAVWBOfxqEqguivy1JikAwAM9YwOeu8Gc
 CB0jhk54YWBJ2chxMrsCQvkxhP3jIkZB43hmIEKQVvTdPcKsuOzTwCncAWKKP9x1jr3Tdcjnl
 s62WPrDIg1T7URHmBQ/kTkV5mZzSKFBt/l/NHbQ4BMJLWT550C6BWQHWMuy0BQcUWTtry3GOW
 frFGvCyJQV3CDmy+aKDdbJMHQM8xqW9PqCtubtBJzUXRo/ocxg7vQsK8VR18z7/kWySvqULkG
 LbLVJ/1MS3Z3YwNObl5yr+aN9huVhalYgxbEeXhRh7ZccDOl4arQntWyowVRKSUs9OOvhdyrU
 96sDXlrF4MKI7WwyTrFJUyNy5Oq5vZVgBjM+9D5/be1/1LQzCJ0zhGFZ4MfWks56S+Z7YZ/+P
 3OvkhNY4NfO6N7/n8DjiUtA50CQCo3FMk9t7MFy3PM2qLE1/uekt0tGZ1jkFzL9+8PQlKaMdl
 jXqoqsWqqMP1oBo4cTa2qZM+lhnhkrL7gsrkh2HvN4MKkaJPqhrNhuptG5q8/2XWTc5ThrPMP
 HD+AQBhpFx5OYGDDNuF2Ec5h9W2fbO1X1Pwb7dmQkTjm3eXBSGnjWUJfFm61w/IJUXYBvePJL
 3Un3nXhWIwGDgId1AWN8+e0e+i4CyzZH7prJnA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_044505_558387_252AACC3 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
 yamada.masahiro@socionext.com, apw@canonical.com, joe@perches.com,
 linux-riscv@lists.infradead.org, info@metux.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

trivial rule to print out the kernel arch and localversion, so
external tools, like distro packagers, can easily get it.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index f070e0d..95b50f8 100644
--- a/Makefile
+++ b/Makefile
@@ -1664,6 +1664,12 @@ kernelrelease:
 kernelversion:
 	@echo $(KERNELVERSION)
 
+kernellocalversion:
+	@$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree) | sed -e 's~^\-~~'
+
+kernelarch:
+	@echo $(ARCH)
+
 image_name:
 	@echo $(KBUILD_IMAGE)
 
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
