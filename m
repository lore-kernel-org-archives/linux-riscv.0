Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A49CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vK4gtbh/hakYguoOeBTLeaLGPT35sf/4rrzmVQuO5OI=; b=QXxknItMd6mRLZ
	hF4zkjQp576w3bPw4G8qxVU4j9+u2dDJduEagKnXguU0eZTf04moJq+DY2KmGZVw8VLEuxv+HFUia
	0t722DIQi3HwrWAxjElyQ4wDQ95B9D/a1RRP57lcjTYe4vHUz4BVYTm5VDlLF70Ms4qxz15m0eZDC
	8Iqtt4kEq7fI/9ERuUmgOKKYeaiB6TVOjbV1NHnTOxbiEdhMMdML07scv4m14EyVUAo9e9JRop6b5
	S5YyVikEtl68oNMQhxCQr5irOlpQM25fPwLKiZ+tjvfKX5yfFN3+HYFooYaD95f7t89Elc3vvFsXJ
	7OBW1bTemd3slzbcPg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbJi-00AJBc-Qp; Mon, 31 Jan 2022 18:22:18 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbJf-00AJAa-LN
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:22:17 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 j38-20020a9d1926000000b0059fa6de6c71so13806543ota.10
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cfu91ED7nMYsdGJsGmRKK0mjbCW2X1OHhuirg8wEvSo=;
 b=pjRAWmYLG0dJkTiGdZm4iCOSEVzXjZRzPTkHcUf7n2L9hbs6S3Bqa3hrfRqFDVjTXP
 hm8qpwRgjGKK+Bq+BRfmqXoO94K9Bfm5Gs+ULcAhD08S+Uxxm3OGuGpRhpFkyvEd6SAW
 qfV209FbF3cjuW8j/Y8n8RxP0tZqxhLeDP7evBy70vY/ztM9Kd4uAZq2yx1/mCIR8OCO
 lCilLiig0dYg4X2JVCBFZAPjPcCes4NRm1o26lPNwRfNYT1p+cWmAw23oJJNJ07NxF4h
 Mcu8BnjFGP/jyyp1MBdGR6VrgzHBfg0cAQu7Zi1zU4lUgFgkZ87sV7f4NBG5A9KpgBZw
 PnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cfu91ED7nMYsdGJsGmRKK0mjbCW2X1OHhuirg8wEvSo=;
 b=q8U2LDGR8KevGWAqX51QUYcvvKV/2VxzxcPD1Iecn9O3B/gZEwQ3K+BvzA6B6d7rSz
 t7f8ZuVSbV/EOUmd40l3FOAmD5BxMZ7vRAhfUFchjwcl7j+A+3549bYWaSo5iL1UuCKg
 uONKvovdyR8XGLezUERrXwfEfVkpEIizOCevqN+YMO+eJ/HI9tRdnlEyPMug6HdzYOAD
 MURDXpKYXjIhdhT5U+4RXKcXLCF2Pvg/94/jXbCVCFFpO8YfDnxiPqjpztd5bBDzOrL1
 yXYI74Y2QrcpuIu5OmYqKBNPwjsxUONz2pJBgCkrmQBJafGrQnlnXsDrMoGM/tkLidaq
 autg==
X-Gm-Message-State: AOAM533DFdLpTcRI0XubpjhPxT3UFc5Dosup/nryA2B8BQlJR1XBqWct
 f/1VGm7Dz+FxmQWZ1U/Sog+RsqPiUCY=
X-Google-Smtp-Source: ABdhPJzQdE+2cpMUX04bRQ9sdblJf+SpfAeCDWlFvQWJArEom0X2jACKe+FwqljHc8vqN+RnXMy1xA==
X-Received: by 2002:a05:6830:40ab:: with SMTP id
 x43mr12207931ott.132.1643653334335; 
 Mon, 31 Jan 2022 10:22:14 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id t4sm12986340oie.14.2022.01.31.10.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:22:13 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] Module relocation fixes and asm/insn.h header
Date: Mon, 31 Jan 2022 19:21:38 +0100
Message-Id: <20220131182145.236005-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102215_757191_30BFFD8C 
X-CRM114-Status: GOOD (  10.01  )
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

The first patch removes a bunch of code from the asm/module.h which is
included in almost all drivers through linux/module.h. Next are two
patches to fix unaligned access when doing module relocations and do
proper range checks for auipc+jalr offsets.

I'm a little less confident about the following patches, so consider
this more of an RFC for those. The idea is to consolidate the RISC-V
instruction generation and manipulation similar to arm64's asm/insn.h
header.

/Emil

Emil Renner Berthing (7):
  riscv: Avoid unaligned access when relocating modules
  riscv: Fix auipc+jalr relocation range checks
  riscv: Add asm/insn.h header
  riscv: Use asm/insn.h for module relocations
  riscv: Use asm/insn.h to generate plt entries
  riscv: Use asm/insn.h for jump labels
  riscv: kernel/modules.c simplification

 arch/riscv/include/asm/insn.h       | 121 +++++++++++
 arch/riscv/kernel/jump_label.c      |  12 +-
 arch/riscv/kernel/module-sections.c |  27 +--
 arch/riscv/kernel/module.c          | 326 +++++++++++++---------------
 4 files changed, 276 insertions(+), 210 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn.h

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
