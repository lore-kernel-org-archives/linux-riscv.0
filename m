Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1459EC07E9D
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 12:52:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB5B060FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 12:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB5B060FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fnCl2frWQS9xyVgaLhhAKeSaHtcOaxuVY3Ln9Uuzu9s=; b=4waCupm0tq/Gfa
	Hglb4+RI/FA/Us6/se/TUQNdLeJJxrDiI/P3+bZrQtt8oR45tXWHogU18Nrxok1d4y0L2jNHy5qdS
	yYAEvDFYxx/BVo4ZQAJNjnl8j8YW1UnO3KeGOmfpxk81zjGpyY+OLQfsspBxl6CgxODuLsi0bzeSD
	B+DSJ4/TmQ7htNGLTehla8Fs44TnC2D591LKvxAOB2aBZx7gzRR10Bg4CBsYHjp9VvW79pwud06Kv
	LcrBRKsJptf07n/ouszs0fDeVihOJL7gcqL2EZ/NPGhpFpsR1Gi6UbTnrTSY+g6sFz5OFMcSlyYox
	gMusJJdJ1PmM3ZkV3tZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5SkV-009gY6-CX; Mon, 19 Jul 2021 12:51:55 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5SkQ-009gU6-BX
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 12:51:52 +0000
Received: by mail-pf1-x435.google.com with SMTP id d9so5188981pfv.4
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=CZEGhNq+WhK06in660whrcqCiBpcL7TqJd20Aa2w9Eg=;
 b=QVf9+hRGzyRK/JBZm8moySqhZOnydLEjx4OmMiZoHZoZPkGYtt2oPJqB5cVHBq/Fca
 R6JoHf2+Dih8j/xsh17TJ2MajC2saeAdKwXlM6NmnfPZysfe6BnrUQDLVd5g+wXu5KJ3
 Y30wh/DznmIqd9t+OrnYQ/YhctShCfO41gIl/T9muxGeAkEn/ctbRaf90PhQbczvn1Mi
 W7vV5O4/cn+d1H9DbyvIcQ7RP4zHyjgKrGrcuCiD+fMi4De0ehacBfywS3xdPOJ4Lqfr
 9RKQryHPMqNf8o8vJYLe2oVWG9e9MaJF1lyBixjjPuouQHIZJO8031YCL0Y3vEkpv9CQ
 DIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=CZEGhNq+WhK06in660whrcqCiBpcL7TqJd20Aa2w9Eg=;
 b=FOD27GJE2NSqKt2sTwuJdkq46ZzwBxvWUYMay4rxRqX5LUpEfqSQYzr4Jt77pzS474
 oURubyF/TRC/+k66BJn5z3BWs7thQFHYFkLuV6nVecgDmPaC48VPTWVxD1gCpfo3eK6W
 CGbHsI8hm1mmSzhMzrmfN8T7rLV/uGswbXT62dMFY2r71Lp6hUNgYuc4xYAo2ZdhOWfL
 eEGQtGs92hOts8aHEYm6DFSEKKMqo1p8IC2g4tkSfDWRLDmGRq7ixl1U4YDLG278M2nn
 oPx1xx9cxu/n4uQfZ+PVccUi/c6qh75ZIb9LdTYRL/bLG+PrDL8dqrU7Ubkf7FWY4OGG
 URgw==
X-Gm-Message-State: AOAM530bhc7ox0yAR4/H+DwNFEBZaX0n9RyHfZgr1mxSyNKsgYGhw0Zj
 /lqME7IEUhCntGMCowjjO2Y=
X-Google-Smtp-Source: ABdhPJwyA7jgHBHBxda/DWSD0A4x5BFrWvSS1IH7K3F0wBD+fdp6FRynHwTXyZnMqPtX+UAhBrCPOg==
X-Received: by 2002:a62:dd42:0:b029:330:6bf8:b02c with SMTP id
 w63-20020a62dd420000b02903306bf8b02cmr25445710pff.67.1626699108669; 
 Mon, 19 Jul 2021 05:51:48 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id x3sm10046513pjq.6.2021.07.19.05.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 05:51:48 -0700 (PDT)
To: Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Subject: [PATCH v4 0/1] riscv: improving uaccess with logs from network bench
Message-ID: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
Date: Mon, 19 Jul 2021 21:51:44 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_055150_506864_2C0C40C9 
X-CRM114-Status: GOOD (  11.07  )
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

Hi Guenter, Geert and Qiu,

I fixed the bug which was overrunning the copy when the size was in the
between 8*SZREG to 9*SZREG. The SZREG holds the bytes per register size
which is 4 for RV32 and 8 for RV64.

Do you mind trying this patch? It works OK at my place.

Since I had to respin the patch I added word copy without unrolling when
the size is in the between 2*SZREG to 9*SZREG to reduce the number of byte
copies which has heavy overhead as Palmer has mentioned when he included
this patch to riscv/for-next.


I rewrote the functions but heavily influenced by Garry's memcpy
function [1]. It must be written in assembler to handle page faults
manually inside the function unlike other memcpy functions.

This patch will reduce cpu usage dramatically in kernel space especially
for applications which use sys-call with large buffer size, such as network
applications. The main reason behind this is that every unaligned memory
access will raise exceptions and switch between s-mode and m-mode causing
large overhead.

---
v3 -> v4:
- Fixed overrun copy
- Added word copy without unrolling to reduce byte copy for left over

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

 arch/riscv/lib/uaccess.S | 218 ++++++++++++++++++++++++++++++++-------
 1 file changed, 183 insertions(+), 35 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
