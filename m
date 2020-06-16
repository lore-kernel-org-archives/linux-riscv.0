Return-Path: <SRS0=ePsx=75=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6F2C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2020 07:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1131A206F1
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2020 07:45:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="USZTcfFu";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bKS0uXY1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1131A206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IsyEWcYygbhjQ4E/M3Trk0mzbxlIEbyexF/crSFF0iA=; b=USZTcfFunbg8P6
	KYYPdlBqadZKWQXf+rmHKjziaQwSgIuIypUsFpqESPS7NAwwn/XQ5wqwPQkz9h8S7gM2UtlhPstGq
	mdIyehcSp9pbIa5/wwBjiigAL/g5QN45FnYjp4cISmcrRRMTzJsyaJzDZZn2P03kxQGVIm/jJeZul
	tSSUQxbUoFkMMHFoO48K3M89sxV0LtFQ8zNPZ/Q8hgjWGVlpKQS+yTS+tGQK24mWq7V/ltyXt+yLx
	ZalVDYnviHBRUPHh3yBuIx8QmXmoWXERtnLOvH+3yECV4etbMCQ1pf64RxBxaAQDhSokna58H8x+3
	MjkBQ2zIDAfMKJy8P99w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl6I8-0002W7-IN; Tue, 16 Jun 2020 07:45:56 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl6I5-0002VD-66
 for linux-riscv@lists.infradead.org; Tue, 16 Jun 2020 07:45:54 +0000
Received: by mail-pf1-x441.google.com with SMTP id b16so9085402pfi.13
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2020 00:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IsyEWcYygbhjQ4E/M3Trk0mzbxlIEbyexF/crSFF0iA=;
 b=bKS0uXY1RoPn89ss/zHIQJruMG6Bf8QIqELS9HFq7/KFGcTAE5BzxQ8ZoRK/ux+Rnb
 dYq0ky9nNrTI6Uw/0WVly7OLsjwBHVQx+gYDqM76K0k+7v5ktl7PQqoPENXCqXrrW1gh
 iO9jh6u5ycqQ86AWMcclHfwwmDRuYGN51g+/Wi4nwDBUAhMhkn2VpRJFOC3e6JLKu1s0
 //GRoqEHT2FQbadMA7dtHW2WpZhWvRSMvYwvmOlW6PDOhlrU/IWut4SezBjLqtMxNwj/
 eon5O+Sz79zBN8BGt4SKHqZaeLwiawhvu0rFzHtDyVRztLo9zs7dgipzzcqrZxsN8UnM
 V+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IsyEWcYygbhjQ4E/M3Trk0mzbxlIEbyexF/crSFF0iA=;
 b=JdmBzxntWojZ9x9f30+F0LY75gGhybylQcWizb21UR0rimipxIgRKxKm8LdzVOW6T+
 0WjTEiukFWwVZBS18WOvuveNaCBbOeOgoMvaC4d64+hIPCl8MnUk9M9E7b84nmVJ0Le8
 ouX36H80F60yyOzgA/PYwR8PZ2CixHrWwzj+KNM2MjSn2hWqxLJsFt5DLN8Howb9QnvR
 rw2L/Rd/E4rZjZQDKvinHKl3vv8B8Smv6tz2uyhNAMO/HbWlItWoVnCtrXguQ2NwtyZE
 vIUK1AeKJnwmN8uo87H7Mqd447HA2Yale7FcWbjecdvowxjxjR+vaYxkMICJ8FERPfki
 8CNA==
X-Gm-Message-State: AOAM531gF1sQhBUFdjHSqlUH36ljIErbO5dAZ4ZPq5EWU6ZSNO5Czz4L
 xMdO0eb162BgeqFjJkTcuJ0hYqLjAf0=
X-Google-Smtp-Source: ABdhPJxt56goaO/h2Hz84NjfzGjvHSDyvFR6s2yFLty0WmeiD9CrXWjxzh6OlSfuwJbCg4qHFtWGAA==
X-Received: by 2002:a62:1a0f:: with SMTP id a15mr1041057pfa.177.1592293552119; 
 Tue, 16 Jun 2020 00:45:52 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i22sm15948250pfo.92.2020.06.16.00.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 00:45:51 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add STRICT_DEVMEM support on RISC-V
Date: Tue, 16 Jun 2020 15:45:45 +0800
Message-Id: <cover.1592292685.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_004553_231845_AC70B933 
X-CRM114-Status: UNSURE (   6.35  )
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset include two parts, the first one is that register System
RAM as iomem resources, it is needed for page_is_ram API which checks
the specified address whether registered as System RAM in iomem_resource
list. The second patch is that add devmem_is_allowed to support
STRICT_DEVMEM, and it would invoke page_is_ram to check the addresses.

Zong Li (2):
  riscv: Register System RAM as iomem resources
  riscv: Support CONFIG_STRICT_DEVMEM

 arch/riscv/Kconfig          |  1 +
 arch/riscv/include/asm/io.h |  2 ++
 arch/riscv/mm/init.c        | 41 +++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

-- 
2.27.0


