Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D37C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 11:41:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A501020645
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 11:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="An01Hd2F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jjo8/bzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A501020645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HEBusD4WTSDDbYdUjudjdjVTH1lDBuGPdtSrcu28VKw=; b=An0
	1Hd2FIWpx5hNdtDVkQ5GzeogDVMj6RVbz/nVc2Vuln6Fhv95m/IB4E9E31jfens+dfGq5OSBtLOwV
	OFEYwdhzmmXYdb4wFKwkfvIZ4/xqddcAD53By5tAX6+nRQOyWX8dmAGZVMSD7ZLdDEcHVPzw9yMf2
	NI/Gh+yVM2sdsXWHMsRxctWr2/eIud7Z0cP7XMDUV4BR1wrCp3DV7VZL6mwuygeyyMh55v22w90q8
	Id+HtbNPe9zKfeEiSBdhyQhK2l6zKBUJy0mVPcSjumIq6JzpfRhhs2UoWdhY0IKVf4cxIGqcs0OPK
	ULAyrt9PbKpqbSkyhm6bjVYrOY0O2Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFzzO-0004wB-N2; Mon, 15 Apr 2019 11:41:30 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFzzM-0004vo-6D
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 11:41:29 +0000
Received: by mail-pg1-x544.google.com with SMTP id g8so8467104pgf.2
 for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2019 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=9vAsjj4wH0cq3m3qpVkSYBnwOxwjBpDvsPJW0c5pFjc=;
 b=jjo8/bznAfvwZ9+Xcy6VY23GYfv8XoI/ScoXsSDVX/xI0csb5RA1gUIQpTgMfDffLf
 08H5gttNVgjmUGOhJ/R+tWlxLe0tCxBkDmYOfxnROA4UEpU08bOhnBdTKQX2BF+djS8e
 JZ0eaLUMtYTN606fMdufSySDgGQfLu4amDdZwN6DgBdAg5jbNmNzJAt6zAddVIlOux5B
 EHvBDs4KBI/tXMj5GtVPnp+urM4r4v7/B7+7hguTIZ7MncP49poortFok/kCTSI1PuWz
 7NgiKBucZD92cCi9D9/pKfo3JtLBPV3RLLabmWXlj2jHlpDrFNnMezY3XI+xZV/bw0ae
 N8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9vAsjj4wH0cq3m3qpVkSYBnwOxwjBpDvsPJW0c5pFjc=;
 b=qP0qCDBvopvfwif1qHJ/WSEnZZbuJnDKpyU8W1xeFiHMxVj/ei8CIvVmSDrRAGFZJJ
 zPBjM93BNpUUECM40RpoSF13uvRY31Imyt6RJrFl/vrR4Y8I7avcPvuIKU0kECipkW07
 0/un6WEhtXvcl94hEwXlqsrNRF1kF8sbibZZxmeZ9+qYQ0ninJrC7du6X2NGYS+X0qb0
 eEX7GZjKLTNh6t2UwSs0ZkB/KfrwoN3O+1PJgMhUzmId74dJK07k02kuQiy0hDILSW+h
 eAkzuIitjvwD4v1omqxpsE/Dvnw9sBtEbeworjcA2VNS38pku7XiHHHPmsCR/NbEiE4p
 zl4w==
X-Gm-Message-State: APjAAAWjCRIvs1isfmq+5/5l7jYqDtY3jIpegQXt0oBASVNrYelZo4J0
 jQxLljcJb0AjT7R7tcuav+6Tiw==
X-Google-Smtp-Source: APXvYqx4SVLlNI2m1S7EfnifBaaXSVCoC3VOJ0YAalvRiTkoqXpmx98l3ql8ZpwotOJc6pya6B+new==
X-Received: by 2002:a65:6410:: with SMTP id a16mr56340566pgv.315.1555328487201; 
 Mon, 15 Apr 2019 04:41:27 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id l4sm32317273pgh.17.2019.04.15.04.41.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 15 Apr 2019 04:41:26 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Subject: [PATCH 0/3] L2 cache controller and EDAC support for SiFive SoCs
Date: Mon, 15 Apr 2019 17:10:40 +0530
Message-Id: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_044128_260342_C1CA873A 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: mark.rutland@arm.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 bp@alien8.de, paul.walmsley@sifive.com, james.morse@arm.com,
 mchehab@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds an L2 cache controller driver with DT documentation
and an EDAC platform driver for SiFive SoCs.

The EDAC platform driver registers for notifier events from the L2 cache
controller driver for L2 ECC events.

This patchset is based on Linux 5.1-rc2 and tested on HiFive Unleashed
board with additional board related patches needed for testing can be found
at dev/yashs/L2_cache_controller branch of:
https://github.com/yashshah7/riscv-linux.git

Yash Shah (3):
  RISC-V: Add DT documentation for SiFive L2 Cache Controller
  RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive
    SoCs
  edac: sifive: Add EDAC platform driver for SiFive SoCs

 .../devicetree/bindings/riscv/sifive-l2-cache.txt  |  53 +++++
 arch/riscv/Kconfig                                 |   1 +
 arch/riscv/mm/Makefile                             |   1 +
 arch/riscv/mm/sifive_l2_cache.c                    | 224 +++++++++++++++++++++
 drivers/edac/Kconfig                               |   6 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/sifive_edac.c                         | 121 +++++++++++
 7 files changed, 407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
 create mode 100644 arch/riscv/mm/sifive_l2_cache.c
 create mode 100644 drivers/edac/sifive_edac.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
