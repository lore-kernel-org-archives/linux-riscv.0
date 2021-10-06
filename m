Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BD9C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:52:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3563610E5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3563610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQ7YonY7iswaatSXUVnWWUzqAXCLTy2ymiFJCPvVqLs=; b=fqYizs11Wu5/+F
	DGvqZ6tSXH1Bg0R4dTLZtp9WktegmhyhzHDwsIAYtMlrLBnpzr7t+mjpaSS/NyJLwf+FXRxdm+tlS
	I6HMU3zwUhCHt66N6TrVHE2lmxw5VTzg/+yxAr44crQi1xQmhrXcYLFz8h/7oaZR15ZIKhSeCEGzL
	zXz4THAVYlJ+Vbg8oguCzMTk0Ha2AFGhZHF211TBaiU/jZ2cS87m1qbyBIV/8JxS5jnLA5AljDfAa
	EDSIXL3cfuv4FQL4u7WXFI9D6Oa5+GXxEucOTwvkwgIynhNJn+dEKihiPILE5pvtKsPtIORbM1ak+
	JNqItmONx27wcYGHcwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA9R-00F6nt-1l; Wed, 06 Oct 2021 16:52:17 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA1P-00F2Cl-2x; Wed, 06 Oct 2021 16:44:01 +0000
Received: by mail-oi1-f176.google.com with SMTP id y207so1680701oia.11;
 Wed, 06 Oct 2021 09:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDUPVdWmFpBgvCkQTCBoljrAdHSMkkZBVQWsyUTyf5E=;
 b=GvZ5Fy/iFeGNvSMYH1fVc6erd7JIgAKmhL6VXkuRrKpdnxjPzFusLcZFt7t5cLnF+w
 /45JrZwEboWkgcVWHjeVfDHg9ppmLgbPlYnS/8rIrEa2G95YHLUXNPtFToRAT+QoVatz
 jvDvHlWjxJtZb7BIgvwyCWbaaWx1w4BfFbVjoOseoz7Ofy7uwDi1K1ub9HM2OASYiwtR
 jkQ0K06rztmL3eksq53a8iYd1xe67u79ZkhpvO079R6uPs56BmipEEn2sswNxVYIz6YF
 /Eb2FgHZOkGm29f7Vf/zD6E/SqiP+674XtktvSvoCguyrjzTejUHdGoN1zEu6nF+cH1G
 PfOw==
X-Gm-Message-State: AOAM533h5THYG/3jgFRcTO1VD2uMNbX51pjjvHDrJv8xxlS0FtyO+1fw
 N9y4jwcuyRC+UusXewMznw==
X-Google-Smtp-Source: ABdhPJzdKu+vPdU6QOPaibRhZZ8V3BXWev73rJIyB9NkWGThVarWr5zcXuesMdXl3XDSlz8SwXuIcg==
X-Received: by 2002:a54:4f8f:: with SMTP id g15mr7727342oiy.178.1633538636692; 
 Wed, 06 Oct 2021 09:43:56 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:56 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 11/12] cacheinfo: Allow for >32-bit cache 'id'
Date: Wed,  6 Oct 2021 11:43:31 -0500
Message-Id: <20211006164332.1981454-12-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094359_188629_CA39818B 
X-CRM114-Status: GOOD (  15.34  )
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

In preparation to set the cache 'id' based on the CPU h/w ids, allow for
64-bit bit 'id' value. The only case that needs this is arm64, so
unsigned long is sufficient.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/base/cacheinfo.c  | 8 +++++++-
 include/linux/cacheinfo.h | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index dad296229161..66d10bdb863b 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -366,13 +366,19 @@ static ssize_t file_name##_show(struct device *dev,		\
 	return sysfs_emit(buf, "%u\n", this_leaf->object);	\
 }
 
-show_one(id, id);
 show_one(level, level);
 show_one(coherency_line_size, coherency_line_size);
 show_one(number_of_sets, number_of_sets);
 show_one(physical_line_partition, physical_line_partition);
 show_one(ways_of_associativity, ways_of_associativity);
 
+static ssize_t id_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct cacheinfo *this_leaf = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%lu\n", this_leaf->id);
+}
+
 static ssize_t size_show(struct device *dev,
 			 struct device_attribute *attr, char *buf)
 {
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 2f909ed084c6..b2e7f3e40204 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -48,7 +48,7 @@ extern unsigned int coherency_max_size;
  * keeping, the remaining members form the core properties of the cache
  */
 struct cacheinfo {
-	unsigned int id;
+	unsigned long id;
 	enum cache_type type;
 	unsigned int level;
 	unsigned int coherency_line_size;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
