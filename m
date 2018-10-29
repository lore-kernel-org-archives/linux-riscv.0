Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BD9C2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 19:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE5C20824
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 19:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUbjafwn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="egboowhQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DE5C20824
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Message-Id:
	Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xg0RH2+oi+JiJG4a5c+UiP6EZT5AZpydLU4dWciOk54=; b=KUbjafwnfWnhUO
	tG67v8jo3B5XKz4tOLQH5v8NNBV1Ciky8/FNWwZDvMo7uZZTR0Bx1TgHwxphdTdqcRTdFhnxC3Qo4
	KnsjHlGRmjWXBW+UHzJpG6UFq/sv7PNnxzJjYLdBUIdhqPcE04CYsYZQrLbsV9M2xBDxvnB89JmLo
	DHEfT85R8CWhEBd6sr4us0rLKxnUgpdX26bceXiZUr5kHICZBVB16ooRpuZwRaS1VKbQ3uaDa1s5g
	+xGSHchZ3lqOlCpPvAGFsdBkUB/AmNSeE79jOkunzaMSBHtNYMTdYxYsBTriy9lWOTqcOgvHgGKPU
	uuE77FFzzhT+X9MXY3Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHDBs-0005T8-3y; Mon, 29 Oct 2018 19:27:08 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHDBo-0005HS-I2
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 19:27:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id j23-v6so4535775pfi.4
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:cc:from:to;
 bh=pTB2FPEP/cbXv24IRgwE++5m4C8hjjPVi3Qm7qpYKCI=;
 b=egboowhQL4MN7q+NC5Rlcw+vul2juzm+EU8mNW82/PGTGhfoYaP8Fiaq+7i7Yy/8SK
 mZkK5eqetZJAZR6vQFjIV5paVFqD5TKMA30ELQb3P0Y/TKW6XCRB4Dx0UR3vGr5OfXVo
 Nabf0dkBL9BUk+FCQlSWyPKXE+ACaMtdrtrgHMZlG43lwcNLLheWmQrF+JwJgaxQaxBH
 zy6gSkQ56nz3fCeiDuI3zDUUW8kytYZcKJiUUOoKq6mn0acrLvmQN1ViD0gyZnjifCI0
 DTRBd/AuxLqDveTmgG/Wx1zZQk+urkgEXORI39XOfFV52gy+9WSvtrt/KfKcLGnIbLeU
 v7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:cc:from:to;
 bh=pTB2FPEP/cbXv24IRgwE++5m4C8hjjPVi3Qm7qpYKCI=;
 b=gj6DDEfGJo+DHL6Eylf6VMUmW38Z3cwJwE21ef79r/3xeyERf20KckFkeOm7EkdrhD
 tZDmOfarkq5MEuaFFT5gMdaK0wzzwh5V84EZTVGc3W4gMWh3391GT79XOje8MKShSysI
 ILJIus8TOwmgSxPY4X1akmm1WNmmjEG85cKA7204kCKoIsi/ejBl3aJDGVZjukRjJYYF
 YldvU8jW1ZxwSJhWIezZj3TY6ay77R6sWcBliSGkIlbIurRSQRZQ7Wk8abBXNlJH/UWq
 ZJNs7Ff1dUSnzb2+XDbVeLmqtfRTmQavBmjXLo2QZ2UUCBGFa7+GL5aMKHsWBEEdSNSc
 9sgQ==
X-Gm-Message-State: AGRZ1gLcRYLvTiOiE+Zk+zv6t22cYsrKlejMuv4Afou8ZNCqs+qaegxO
 +S8jks1WVpsqwBIL+R34Pyxqgw==
X-Google-Smtp-Source: AJdET5dIQlolQFOmcfU1Q23HJy6EYUF7A2eThgS5t5oiv0bv9MzKQo4JmsoyKAlxmmptD6Vw5pKrzw==
X-Received: by 2002:a62:8f:: with SMTP id 137-v6mr16287743pfa.24.1540841213019; 
 Mon, 29 Oct 2018 12:26:53 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i189-v6sm4472808pfg.156.2018.10.29.12.26.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Oct 2018 12:26:51 -0700 (PDT)
Subject: [PATCH 0/2] Remove umoddi3 and udivmoddi4
Date: Mon, 29 Oct 2018 12:26:32 -0700
Message-Id: <20181029192634.30078-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org, zongbox@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_122704_649671_8DA33435 
X-CRM114-Status: UNSURE (   5.90  )
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
Cc: robh@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org,
 matt.redfearn@mips.com, alexander.shishkin@linux.intel.com,
 Greg KH <gregkh@linuxfoundation.org>, bigeasy@linutronix.de,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 willy@infradead.org, colyli@suse.de, boris.brezillon@bootlin.com,
 ynorov@caviumnetworks.com, yuanzhichang@hisilicon.com,
 akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
 linux-riscv@lists.infradead.org, khandual@linux.vnet.ibm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029192632.kPFXlMKRgm58G7gTIfMbglkYgCWkNd0tXTCaEnePvxo@z>

These were only necessary for an out-of-tree driver that has since been
fixed to use the proper divide routines.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
