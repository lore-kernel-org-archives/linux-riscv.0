Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C71C4743C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 12:38:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E34FC61075
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 12:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E34FC61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D5IZ1IblKtnMkY7w0lLd+GXoBDBh/XSIKo6Mkk+OZ2M=; b=3lo4Z2kXUMNlWT
	Kvw5On19KrlosA6TALZO8inw8zHwDd+qetpOLxNsYJxK6OQQmhF9RE2I6mGuZutgF42vbiBVymx4P
	u60DVXxuYxJ4J1jeNUBcbFK+KyG67lkbspVINGx6QC4gN0ypLBoDdlajhV2ZuTeBlBclpaiZ054MW
	qymdYXmKPi77FbVJc8/YFBAafErKgKqMJekl3lJdYtJOneWoPuKBrdQ54K2np8gdOaYf9K7Hw8UUr
	DDCxddz8uWVjmLYpBmId4+Cr5j6zdLqOWOBTrn2Wr2X5nTme8rYldfE8FG5U3/zTP6x78KpYKNVuJ
	ipr5hxPct6Geij+eZZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw28T-00Acyq-4j; Wed, 23 Jun 2021 12:37:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw28L-00AcyQ-5X
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 12:37:34 +0000
Received: by mail-pl1-x633.google.com with SMTP id b3so1119578plg.2
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jun 2021 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=U04a5tKuI2TL7VWt3DNjqjVOlpJsLXPvw3dwHbV38YU=;
 b=QRKbOJAQOGptx6D4nH4buhWTbi4uyjuVaH4qly/uJCKsR5qlLn05eUzoTgEVDNOsYx
 piPr7B8KGzG6M4W3azpDMIf9UZq66UMYq6EtUmiMy8UAomodk/yc7lyJzkR9EVgWZ2+l
 Hdpj67YrSEapItSG0jMcGugfinzbZtIjPPIQnHmUM5kAgasf2lz8DS3M4jUYvLKgGExX
 qPmgi7jF8rronEqhU0X/X/N0StT13RGR4Y22aB9/RV44rqIfhyv2EubmNvG5n20Y+hGQ
 s82pjgZb2zPh8dvy/gBcvLHvxjXuDvDqINsYgOo+1wgrUYWb+Z2upPr2EJwAi1A2wZj1
 OijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=U04a5tKuI2TL7VWt3DNjqjVOlpJsLXPvw3dwHbV38YU=;
 b=tzWB10i9ksVJa3bh0aiDRY39R88iKOlUVV0RHuoN5yhAKG2gIGbDuLclDdpWv1n1C5
 u0LlnGv/5UpgZn7ASycPco2JYo2KCWPGmNj6oH7A4bsN0HHSazMZUeCKpumbCiJslSi7
 T2CD8r+TMkLQwqrfjKra7CSLNSrnrwj6Y4fA6SQIGzreEJWCS8i8z4cAhCLe6wZLRNOL
 Ekge6zZHFCJXUM8l/3xVdzlKgvRYgyYbkNQvsZsXx0LX6fg7LkbdYEUg1s35lxjitmUO
 eBRmJfyXWBaVNqASgeu0KynBjENXNMfuCnyQ+Fx8r9wCbUqbbZ9roY3KEZG5TbLSVV2E
 +pdA==
X-Gm-Message-State: AOAM532ZWm/FRlaIc+fAjghujx7lIWvPklfFQElhGEC5rof7OIfYyzth
 VdpVUqhh/RykAIne4dWV98E=
X-Google-Smtp-Source: ABdhPJw8J8V65q0vN9d5Dfise1pt+61c3pFshmQCSeBDrD1wE6zL4lAbzDt8PDJ2TudwXgGaZBs2Eg==
X-Received: by 2002:a17:90b:810:: with SMTP id
 bk16mr8750049pjb.2.1624451851537; 
 Wed, 23 Jun 2021 05:37:31 -0700 (PDT)
Received: from [192.168.1.153] (163.128.178.217.shared.user.transix.jp.
 [217.178.128.163])
 by smtp.gmail.com with ESMTPSA id j2sm2522114pfb.53.2021.06.23.05.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 05:37:30 -0700 (PDT)
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Subject: [PATCH v3 0/1] riscv: improving uaccess with logs from network bench
Message-ID: <3e1dbea4-3b0f-de32-5447-2e23c6d4652a@gmail.com>
Date: Wed, 23 Jun 2021 21:37:27 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_053733_270736_7C60DA4D 
X-CRM114-Status: GOOD (  11.59  )
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

Optimizing copy_to_user and copy_from_user.

I rewrote the functions but heavily influenced by Garry's memcpy
function [1]. It must be written in assembler to handle page faults
manually inside the function unlike other memcpy functions.

This patch will reduce cpu usage dramatically in kernel space especially
for applications which use sys-call with large buffer size, such as network
applications. The main reason behind this is that every unaligned memory
access will raise exceptions and switch between s-mode and m-mode causing
large overhead.

The motivation to create the patch was to improve network performance on
beaglev beta board. By observing with perf, the memcpy and
__asm_copy_to_user had heavy cpu usage and the network speed was limited
at around 680Mbps on 1Gbps lan. Matteo is creating the patches to improve
memcpy in C and this patch is meant to be used with them.

Typical network applications use system calls with a large buffer on
send/recv() and sendto/recvfrom() for the optimization.
 
The bench result, when patching only copy_user. The memcpy is without
Matteo's patches but listing the both since they are the top two largest
overhead.

All results are from the same base kernel, same rootfs and same BeagleV
beta board.

Results of iperf3 have speedup on UDP with the copy_user patch alone.

--- UDP send ---
306 Mbits/sec      362 Mbits/sec
305 Mbits/sec      362 Mbits/sec

--- UDP recv ---
772 Mbits/sec      787 Mbits/sec
773 Mbits/sec      784 Mbits/sec

Comparison by "perf top -Ue task-clock" while running iperf3.

--- TCP recv ---
 * Before
  40.40%  [kernel]  [k] memcpy
  33.09%  [kernel]  [k] __asm_copy_to_user
 * With patch
  50.35%  [kernel]  [k] memcpy
  13.76%  [kernel]  [k] __asm_copy_to_user

--- TCP send ---
 * Before
  19.96%  [kernel]  [k] memcpy
   9.84%  [kernel]  [k] __asm_copy_to_user
 * With patch
  14.27%  [kernel]  [k] memcpy
   7.37%  [kernel]  [k] __asm_copy_to_user

--- UDP recv ---
 * Before
  44.45%  [kernel]  [k] memcpy
  31.04%  [kernel]  [k] __asm_copy_to_user
 * With patch
  55.62%  [kernel]  [k] memcpy
  11.22%  [kernel]  [k] __asm_copy_to_user

--- UDP send ---
 * Before
  25.18%  [kernel]  [k] memcpy
  22.50%  [kernel]  [k] __asm_copy_to_user
 * With patch
  28.90%  [kernel]  [k] memcpy
   9.49%  [kernel]  [k] __asm_copy_to_user

---
v2 -> v3:
- Merged all patches

v1 -> v2:
- Added shift copy
- Separated patches for readability of changes in assembler
- Using perf results

[1] https://lkml.org/lkml/2021/2/16/778

Akira Tsukamoto (1):
  riscv: __asm_copy_to-from_user: Optimize unaligned memory access and
    pipeline stall

 arch/riscv/lib/uaccess.S | 181 +++++++++++++++++++++++++++++++--------
 1 file changed, 146 insertions(+), 35 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
