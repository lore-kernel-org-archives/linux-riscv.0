Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53294C001B2
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 23:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fralanRkOgLnoUcmeSoRo6Ug5ytpAWkUi4on2huxvyM=; b=d5mS7uaF/WliYy
	KRSNAfKcBnGC8Msa5GzssG5FUDqkhapgSAkJE9uMFuQfZN2in2nBFIiEUMxtkxvE9aweMwsDj3f5D
	jccggcspQy0PHwmN0GO5lSI9VEYlDIw8ytUufisZg8lExCbzWtnlzcOLme4a3PErYRSdGuxm3e8Jm
	TPKcp2Fu56gmrJP/Xw+OY+FoOJH4mAwPYHHF8kDLPPgSnt/opWpwt9GMAbecV08JhXC8kqYFrjYR+
	lTmvLDqE7nSPAc4Kh+TI2TiThN48nYmly+xDJzR6l3DTa4eX09kaFSFIUyWZw9tXcJYYvga8CjTth
	CMEHg0dgfympmfT2ZZwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3QYC-00FQey-LT; Thu, 08 Dec 2022 23:43:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3QY9-00FQVB-62
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 23:43:34 +0000
Received: by mail-pl1-x635.google.com with SMTP id s7so3107723plk.5
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 15:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9b7+DfIZYAZCKS7KrI1o9B1zMBxHX7xEOSBgU1nNaKM=;
        b=uL19ZsGOUMhPCblwO2whI96WEkxqmFAJsxuGwp9fGaoK/PE7Yfg11otPIFsG3r8FCL
         jZANyH4juMEQmPnYx5D5hjeHPg1s9uPCVyoLPJMveJ17RsrnfNlsXpoj7wRH5Zqd3CCf
         d+rVaZBk1TnyswKZgFNNjzsGJXPZufTnQeKuQp7t8I33NHzQ5vpao+5mGxdD/CXo5EqC
         HZd5GYEJEn7+borpGc/gsrkR4qTSqW0Rq3ppv/dESt0Grni55KmMBNLmk1PUsSQRqKRq
         Wb2GplLJ5ruGn71mxUgzl2aStjsws2NJwtlE2V8yVdNbUiu7uBdwW2ByWM/zBEBHRkwV
         BaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9b7+DfIZYAZCKS7KrI1o9B1zMBxHX7xEOSBgU1nNaKM=;
        b=HZMbZFUv+a9im4bAxhsOHH2SfuYNxiv5uu29BPxnXyAJSUlPvaSRkiYBPdj02b+ObA
         2W1Ap79bPCQDGMMYtyxHh7kmo6k03sQ/hd6lRT/jYyyK4ZQ8vH03IgqvgzYO0FlShTIh
         +75/w3OI+V1B0Vkj5+y5rNrD0dxR15qUsfilktz+bfYzgrw/7m1fcckMTlxXnNvSpHMT
         PP5OsW2QOufz19ZcKzoVU8rnfjlnDRfu2vLNuXWigD8q5ilRDLA4TtV3/1wzlHhxr7mD
         HIzkamo4cTkuSkv970vEwl6PdLHcrPe8q1t6rOQkjKxpGl4ZVpdEOVa2w0e/vyJFsSwK
         lCZA==
X-Gm-Message-State: ANoB5pkmmzGEAwMNm61q4m/n7ZLMEn981S2bGSo5NdXkecQmKL7zzH88
	FttmcqeSGCKxqputAqxAgCBZTQ==
X-Google-Smtp-Source: AA0mqf4pnJCHELQ1vkRdNPoLn/TUUUwPuyBJ+Iqm4Ct51Tbk/qApTXmOzSwPdB5XxVjfuf2QEuzvOQ==
X-Received: by 2002:a17:90a:7c4d:b0:219:e9e9:ea0 with SMTP id e13-20020a17090a7c4d00b00219e9e90ea0mr3517911pjl.3.1670543011147;
        Thu, 08 Dec 2022 15:43:31 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090a3b0c00b00219f8eb271fsm152919pjc.5.2022.12.08.15.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 15:43:30 -0800 (PST)
In-Reply-To: <20221111223108.1976562-1-abrestic@rivosinc.com>
References: <20221111223108.1976562-1-abrestic@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path
Message-Id: <167054299652.8453.17062801658432513942.b4-ty@rivosinc.com>
Date: Thu, 08 Dec 2022 15:43:16 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
  Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Andrew Bresticker <abrestic@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_154333_254913_7C4FCC80 
X-CRM114-Status: UNSURE (   7.90  )
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

On Fri, 11 Nov 2022 17:31:08 -0500, Andrew Bresticker wrote:
> The return to userspace path in entry.S may enable interrupts without the
> corresponding lockdep annotation, producing a splat[0] when DEBUG_LOCKDEP
> is enabled. Simply calling __trace_hardirqs_on() here gets a bit messy
> due to the use of RA to point back to ret_from_exception, so just move
> the whole slow-path loop into C. It's more readable and it lets us use
> local_irq_{enable,disable}(), avoiding the need for manual annotations
> altogether.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path
      https://git.kernel.org/palmer/c/e1ceb0964163

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
