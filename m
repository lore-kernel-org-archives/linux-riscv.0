Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78360CD4851
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJrQeF40sBnk+kBuFgvhNcy9KokYtODQYZBJMtDVngc=; b=MteTaMTk9XFNGZ
	17FKFDjrfChBIxnGHO7UFBqfvMsIGCHso2n5HxbMkqtNvruVc9ROF5uFsP5HrzT8NBvTpRranqorv
	n5SPmR7py2oJ7OaRQGx0sVVPB5PvClZ2CgXqRR4HyXTyraBOhAE5krCov6vFQ1Rmra52p2f/NNfSq
	SYBVitgtRsXlVJDhMEsITsv+U05bGnW1HTamqFMwBAI2q9LyRahcyjazzVf7QpSL2omLLJOtlD7dj
	o5h3XscJuJw49sDPP8fQSW6Io21zh7BjB87CnicgypLElV+lv+hNtbGLArpkUNZqhUP3gJtAI49RW
	sEJK1qO7hye7MGdDmYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSNP-000000053yf-109t;
	Thu, 14 May 2026 09:29:07 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSNM-000000053x1-2K6L
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 09:29:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778750942; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OUztNKNvxKx8BTHIAT0NVd/xlA5EkE7Cnrhe1KKRftdcSOy/6ubJTr4eEORmxjsGhDzPrN5XW6R4gzAhErEZVLUW3mGMDB1qrNgRkLQS3LiFh9Sqs1AUZ2ED7O46KHxO6n/9NviZi4WJVYK2kzn+u4WipgqaJ7CBLsOy3rl9eYE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778750942; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9LNCeu8aLN/0ZrXOBXKgi3APh74x/QlkzHTfwujzqwI=; 
	b=e+HGjdYnQX1Ro9oUmYiony9zT6oahREBvyL05Mj6bs2LuZXLbliLmjTxzHAYEJ+xbwlC0MaLBdVvrkhg/6mqGLj9zUVG0Yv9z+PJ5hBkZZa8/m4zpd4WnJK8KT8WgrLxxKAKY24KnWcUjXFLKMSbiOyJdTGrUYj0QBIQcVoqPFU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778750942;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9LNCeu8aLN/0ZrXOBXKgi3APh74x/QlkzHTfwujzqwI=;
	b=lGVr1PZSVyfHG0z3csYaP785oiV5ZlUTrIly+cSmTIDhPakN9G8NrwB2XnoGnoOs
	JYi0syYnWV2QClmHQJUkpJrtJLRMnp8fDRclyzv/XwmjvWwFSxJHSZEdrnEHiVoyDvd
	RZVxaHtD1bfzISpfXCpeJaFbiu+4XVckiQMeky8o=
Received: by mx.zohomail.com with SMTPS id 1778750941232885.290315532009;
	Thu, 14 May 2026 02:29:01 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 14 May 2026 17:27:22 +0800
Subject: [PATCH v5 6/6] MAINTAINERS: Add Anlogic DR1V90 CRU driver entry
MIME-Version: 1.0
Message-Id: <20260514-dr1v90-cru-v5-6-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778750853; l=912;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=3bKVlzCRSrUWEZ3gCwiFPOq+BkySOj+CH4yCIImMNMk=;
 b=eC16vayzbk3SlGcWQ+Jj6qjY7iw8dENwzpW8fCvLtkLSNLi6FaYxcxvY4MK/PhQTBDVGrnP5a
 Nbm25L6BBqKDCKyeZ7jVSWk8AFSqrK64j4EKygiu3xZ53J94fqiBaAj
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_022904_645690_592CA58D 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

Add a MAINTAINERS entry for the Anlogic DR1V90 Clock and Reset Unit (CRU)
drivers.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..4861bf96b996 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1898,6 +1898,15 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANLOGIC DR1V90 CRU DRIVER
+M:	Junhui Liu <junhui.liu@pigmoral.tech>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
+F:	drivers/clk/anlogic/cru?dr1*
+F:	drivers/reset/reset-dr1v90.c
+F:	include/dt-bindings/clock/anlogic,dr1v90-cru.h
+F:	include/dt-bindings/reset/anlogic,dr1v90-cru.h
+
 AOA (Apple Onboard Audio) ALSA DRIVER
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linuxppc-dev@lists.ozlabs.org

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
