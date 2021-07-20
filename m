Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E529FC07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:50:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA5C861164
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA5C861164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pQVkk5Lh+ZmjS/EV0SRqINYZnssu6bfT+yJLGkui+9o=; b=ZuJcdohBzATInf
	LeOwlIoMjieE61Oe29RvX1gOwHODVUQS6jHpjNe58Cm6CnqMtlETjfKQFgVfbZbab7S6YIwYFgE+p
	B7fyOYbe/VrvYnkwCWU3qnb2orXPZIH2TJEqkwBBIlScBGZBHT8QBbVKyZIGNXj3XJh26PLP+AP5K
	EMrbo4lYNX1U43ah2MhjJG4crqePAytlhQkoiPo673JbboAoiiOtk0NHbViANILI9eP5BREfBUuh7
	PH59c7ZHZrhIZy2acpc3IoQdKRn3b1ERTFLzzyjqoF3McPmXYNa43Fc1/TDXcM3zd7XZvnHK36Ywq
	qnI6MclKRM26ubygAA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5lRn-00CHNS-VY; Tue, 20 Jul 2021 08:49:51 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5lRm-00CHMm-1k
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 08:49:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id j73so284244pge.1
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 01:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=/1BmjzMq7Dia3dSS0Ypp2zIpetpQss4HMpALBUnlA2s=;
 b=fcKNBnRWQcBqixvo6hoTKqYM/1TeepOTwTBWSK3uMM/Z+ltndAN7bcBTFW797CaTEl
 UVfKysaU78AEx36ZSNaNPRkP9sfrzkMKNM2/IoaLmNvJ9wPE/5WfB6O+bQsEH8ifYsc2
 i18myaTv4s542Ad4V8arIGOv7nHZZKxTYaPuor78jAo+cRuNIEu/RP+LJk6/OOWxJz39
 8WSKt2/jcHJJ3RwMaNBtmn8ZwWiLu7UaAGKnGu1TDaWZ8tyUVcn2/KRQ58d17YTon15K
 x4jC/alhny4aoIsyKt8rERDexv1egqwN/DL1peZlG7P7TQgUKda7sAiUzAaEKqyYYEbQ
 rsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=/1BmjzMq7Dia3dSS0Ypp2zIpetpQss4HMpALBUnlA2s=;
 b=d02SsgvrKBky1QXKCz8YA0flf1JhnTQjymGl1Nfj9iqbqcV67EslFrlklWr347L/YD
 01Nbnx8Bp+gczdH8OQ97LPWKn1+NEEwemHHiVvX6NVAccrgXmEjtHBknauHMbJsGEt2O
 NMcndCstb80UQTxNyCilqh78PCGnphwdXUsre9vazoJlzDL/3CDrYCHid2q3tuse4Cvv
 QYe7XrhD188u9bpIVnmYe5Ic3QHyl3AWCM63YQU5ZSJhVHVZLZBwTCaUbrw37I6VXa4m
 Z1DdJOPVsXdWzbnrDvKluw5lx5ke3bHACLAFdPTpTMDsqWc+ZPjk9bMRC02gaY/63kM+
 XVJQ==
X-Gm-Message-State: AOAM532pAhRXkZXJsYhZCvVa8w06IboYa74AnaTRivADr1vAM2QU4nqj
 8yGoIjFZLT4nAvZeg3BVFVQ=
X-Google-Smtp-Source: ABdhPJzDdxa3bqQIwB/IQOPYu3smOyBxEZHVt5I6QQqOo66tRJ8cH5CdG7+j7lZ6jipt5wO3euewDg==
X-Received: by 2002:a63:5616:: with SMTP id k22mr29506544pgb.211.1626770988933; 
 Tue, 20 Jul 2021 01:49:48 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id d1sm13778298pfj.24.2021.07.20.01.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 01:49:48 -0700 (PDT)
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou
 <aou@eecs.berkeley.edu>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Subject: [PATCH 0/4] __asm_copy_to-from_user: Fixes
Message-ID: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
Date: Tue, 20 Jul 2021 17:49:42 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_014950_155635_B7810B18 
X-CRM114-Status: UNSURE (   7.10  )
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

These are series for the fix reported by Guenter, Geert and Qiu.

One patch to fix overrun memory access, one patch to fix on rv32.
And two more for clean up and typos.

Have tested on qemu rv32, qemu rv64 and beaglev beta board.

Thanks for the report and instructions to reproduce the error on rv32.

Akira

Akira Tsukamoto (4):
  riscv: __asm_copy_to-from_user: Fix: overrun copy
  riscv: __asm_copy_to-from_user: Fix: fail on RV32
  riscv: __asm_copy_to-from_user: Remove unnecessary size check
  riscv: __asm_copy_to-from_user: Fix: Typos in comments

 arch/riscv/lib/uaccess.S | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
