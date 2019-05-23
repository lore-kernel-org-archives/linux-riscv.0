Return-Path: <SRS0=tx4i=TX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578A6C282DE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 21:19:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD322175B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 21:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tHc/mOYX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lb3Q3VCg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CD322175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qCN12y8NQcAcN0fhU3PeBZdThhdf63cPArIgD8HViqU=; b=tHc/mOYXv+G5B5aV0+JfAB+Rf4
	bicE43dqInhxgZ4xYqv3vp4Q3Zk5DBTXQkxR86qkdet7EOLDLS0cRJn8unkUofLuP5w/HTNA0NK1n
	/HFQ+xxs0CRhLcUp1WBsT8jfoTl3H36mKpaiHUgjKZWUO5TwRvNeRg3FFxTkUBcslSYmhNOLLS+O6
	6NyHLueT0Tya4YbsrrNR0AxdLu/KO5nRSmpc3ot6YbzEE5F+ewC5FUo74sO/70NYH47MNxIYLmXaK
	3gJEvui0IwXAQPIBecfaj1URc3VnrSkA7DO29IvDhUJs0Q1B64gmU/S2zrCbFNZ4fzXGom+mzhaGO
	ydDTIp6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTv7Q-0002tJ-8l; Thu, 23 May 2019 21:19:20 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTv7O-0002r5-8d
 for linux-riscv@lists.infradead.org; Thu, 23 May 2019 21:19:19 +0000
Received: by mail-pf1-x443.google.com with SMTP id y11so3921337pfm.13
 for <linux-riscv@lists.infradead.org>; Thu, 23 May 2019 14:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3mPZbZy5W6TvTMZ2rRqZtQoG8zcRtTAtXl0w7I9OmsQ=;
 b=lb3Q3VCg/m5117JLuMa++JSdLvUGL28gMgBpbCyPzainZo4R3yf4FezR3ton+QBWBw
 qbeUryIWnJ9EGSDWTVYxazT+GKhtA4PQ8IkI88idnCrVl9ABOgf+CprD4PwCxIY/PqkG
 dGeRnERPTtsc7zs8hF2gN4WFv+YtuuI3kpCPAUMO8JYEfqtKOyf2xL+Aa/kMTW2MqPZJ
 LDjpO72fc3/0lYdTAynbfbGvjsfyZjkr1iqa5UcQCwQGfe956GQR9J8QTyqisW7eQygv
 irTUjf7y5dKeCnUj+QeYsppmE/YYlpufepBl+z44jiWSRr5kzZvrIqj+3ONbJggMDFLp
 KAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3mPZbZy5W6TvTMZ2rRqZtQoG8zcRtTAtXl0w7I9OmsQ=;
 b=hqthswIioydKo1N7VZC4bbcNiP8TvguHUQ2iZD/bF+HJc83J78x4M4iVecOzP/Vdoi
 X/egZ1hnIxBFwSUmgYomECZjSWqFnc78CHEjlkwHOBTJbQ9uQFeLxqUYOPVUfGLQ/ZY/
 wRZpSW2EfoITK0iI6kREwQ2kWQFjT5qc1R66eg8jr9OhzT4q0D3aYlUeVXnGwXxdHyCO
 xucT47wu/T78ZblSvD0Y8aG4Yf1upzPRtCx1Mh1IKHy1U31o7aZLwZNhPLlxxjjNSpNC
 ki4rkoZPZseo2pTtLGjK5Y7QBxyZ4MrQjIQoNu5B8l49QqcDCszD862HyxUmOG253q66
 D5aQ==
X-Gm-Message-State: APjAAAWWJ6H5JKUf7bbekQ6CbJdZeCo0He3yYYfB8FUOzKljWZX+5Jdk
 GqLwbwe76GepU6Aj/5IjHKsu8w==
X-Google-Smtp-Source: APXvYqxQNjLfbHXgT+sdqJIbUkJkB8mHB9tn8FD82DR8EhIiruAY6NJjRaQU9tkKBoJLN+Z8vmgFzw==
X-Received: by 2002:a63:c64a:: with SMTP id x10mr99748450pgg.195.1558646357415; 
 Thu, 23 May 2019 14:19:17 -0700 (PDT)
Received: from nuc7.sifive.com ([12.206.222.2])
 by smtp.gmail.com with ESMTPSA id t5sm234092pgn.80.2019.05.23.14.19.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 23 May 2019 14:19:16 -0700 (PDT)
From: Alan Mikhak <alan.mikhak@sifive.com>
X-Google-Original-From: Alan Mikhak < alan.mikhak@sifive.com >
To: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 lorenzo.pieralisi@arm.com, linux-riscv@lists.infradead.org,
 palmer@sifive.com, paul.walmsley@sifive.com
Subject: [PATCH v2 2/2] tools: PCI: Fix compiler warning in pcitest
Date: Thu, 23 May 2019 14:18:01 -0700
Message-Id: <1558646281-12676-3-git-send-email-alan.mikhak@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558646281-12676-1-git-send-email-alan.mikhak@sifive.com>
References: <1558646281-12676-1-git-send-email-alan.mikhak@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_141918_302564_BBF28892 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: Alan Mikhak <alan.mikhak@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Fix the following compiler warning in pcitest:

pcitest.c: In function main:
pcitest.c:214:4: warning: too many arguments for
format [-Wformat-extra-args]
    "usage: %s [options]\n"

Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
Fixes: fbca0b284bd0 ("tools: PCI: Add 'h' in optstring of getopt()")
Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 tools/pci/pcitest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/pci/pcitest.c b/tools/pci/pcitest.c
index 6dce894667f6..6f1303104d84 100644
--- a/tools/pci/pcitest.c
+++ b/tools/pci/pcitest.c
@@ -223,7 +223,7 @@ int main(int argc, char **argv)
 			"\t-r			Read buffer test\n"
 			"\t-w			Write buffer test\n"
 			"\t-c			Copy buffer test\n"
-			"\t-s <size>		Size of buffer {default: 100KB}\n",
+			"\t-s <size>		Size of buffer {default: 100KB}\n"
 			"\t-h			Print this help message\n",
 			argv[0]);
 		return -EINVAL;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
