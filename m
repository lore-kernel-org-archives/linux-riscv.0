Return-Path: <SRS0=Eoui=MW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E29AC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 13:51:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35ED960EB5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 13:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35ED960EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9HUohMMFxfHTmQFgQFhgIgGAl0hIwF+bT/z0YQgWF2k=; b=t7ntgfyEwf0nRb
	P+xW0bwcng7e61NUMmMgbSyHsjCyHkqJMdrqpAUw3pWdunOZIXc8RabjqZJzbew2dOwqUErmsXS2G
	NI4fLoQ7NkXfkb9gLAX+fchACJy2x479zJsnaauH6CyBX3xTqeIuiV90GK0uP6afbsBa5q2qE7jD+
	aZJ5wxXGctBNZBQXKLY2+joaBk3blbsvp1VGFzIBEcYbM9E5ZxWOWnsP8JyRt1wL8mH/AcZLd1RV/
	0nmS3kHK3yiE/RWNuhczdMm2mrhBNtN1Z+rSYd47mmpkmhhBWpLwtQqkf89JpK4l2KOrXF72lsgHf
	UvzplJKorPjmGCa70LNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Sum-008r0E-TR; Fri, 30 Jul 2021 13:51:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Suj-008qyU-OR
 for linux-riscv@lists.infradead.org; Fri, 30 Jul 2021 13:51:03 +0000
Received: by mail-pl1-x635.google.com with SMTP id t3so9053413plg.9
 for <linux-riscv@lists.infradead.org>; Fri, 30 Jul 2021 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Fg+J3oW692Mh3cj6C7vQfzGK/Q/IMQA26Bq+Duy+a4w=;
 b=VmcZG1GRWJrPQtzy+TCHvuVNPKTGa+BsqIntwj6ttKUN/bSbXgL70/Xodxa74Ma4p0
 rwxlQt0RRyaJZejJxeJi8BBKEbUuPiOrHslCY+HUINYp1SJ1iolaJkON0f5eGEMyYsC/
 9Le3jMLov9yMGz2bDatl71kjesThyRzy7wewQhjnsafaTOnUnYfbwd438/L0Nt4KgTZW
 4qC6zQI1wNFf7sWKkZnojJgg6pzBK8eaPLVoFKzn7plTdUfqYk/mAYEF6HOxS0z93kjj
 AFO9Vm2OULZA9T1QhehMkU7M6O8/p3OGEGYzj+dKxhpXYdHjwzpHkLvzGv3XAxEKXoR7
 cyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Fg+J3oW692Mh3cj6C7vQfzGK/Q/IMQA26Bq+Duy+a4w=;
 b=P4A1JK8jV9ZBCxiMpqJGKLgqbmvNPcOYPnVYq2ahqlG+CodxDx2VqxnpUz5lIWhD95
 7asrK/aqSVVIm0za2J142kkzq6vGBTAu+K5V+Dh3PyD8cRqnI0oBXc0c0pmilqC7o+B9
 UvyGlCtcc+lvmrahRBayMh0T5ThUcwqwJGBK/KEWRiKZDuNiykYhuzOsMc34GMuR9OJY
 gGauY7nNamdSzdY+aoebZL0H0yBJBaQmEUOs1TisTJPnBN9BrvR0qOdq+xp+Cme4QyYC
 HJZ42F7vJK53uWKx6/XE8+LzU+BulVTsmSMay81oKpO9PW51NiClYJJIP4sJER6mJqOO
 fasA==
X-Gm-Message-State: AOAM530x0nKgQWRURuuV6ceuV69D4IrDJMFIF5FGhrw+1N3QVnwuEGkC
 PomssORSl7woxH2jyszldnQ=
X-Google-Smtp-Source: ABdhPJw0kB2BBs33d+TllZbOUWcOrwfM9KEon9kLTtG4TWSRM1Sy3r6nfGeaiiH6RDmPosurY61KYg==
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr3212973pjt.14.1627653059822; 
 Fri, 30 Jul 2021 06:50:59 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id n5sm2534471pfv.29.2021.07.30.06.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:50:59 -0700 (PDT)
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Albert Ou <aou@eecs.berkeley.edu>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Subject: [PATCH 0/1] __asm_copy_to-from_user: Reduce more byte_copy
Message-ID: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
Date: Fri, 30 Jul 2021 22:50:52 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_065101_864061_1130471C 
X-CRM114-Status: UNSURE (   9.02  )
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

Adding none unrolling word_copy, which is used if the size is smaller
than 9*SZREG.

This patch is based on Palmer's past comment.
> My guess is that some workloads will want some smaller unrolling factors,

It will reduce the number of slow byte_copy being used when the 
size is small.

Have tested on qemu rv32, qemu rv64 and beaglev beta board.

In the future, I am planning to convert uaccess.S to inline assembly 
in .c file. Then it will be easier to optimize on both in-order core and
out-of-order core with #ifdef macro in c.

Akira Tsukamoto (1):
  riscv: __asm_copy_to-from_user: Improve using word copy if size <
    9*SZREG

 arch/riscv/lib/uaccess.S | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
