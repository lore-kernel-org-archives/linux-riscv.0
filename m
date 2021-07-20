Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94BBC07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:52:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C46061209
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C46061209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wm0qzHi5rJb9ilR5PFjAHO0aGcGtR7KdY7NpsDNMLPU=; b=ZSk/SLHqKtfsxouUUemCwKQR9g
	ChCHxzXeDT6rfmJs+2Zosx8SJl8GwzG5PNnYRrB3n2TEdddtIzZhI6Ixy/lBnYj4xYgssTfkD7LU7
	zUZXZAa4qOVZrhCBuZZMMpVdiZwRw19Vyh0gNIiUY17MqQLxAixs6vsSa5BZDOFQJ/gYhFuk2+nFe
	y+jlngB3HhEXj5XVIegHRn6LdYj+aMI0s6d5VNKh0RNqS9U+FZKMsD6R4FiXKK4BmVJbBMXBT+2k9
	ZjTePEbqIkAO9lm+sloZkS7TIkxXMSXXrf66sfkGRrE0MzDkLY2dzbOj/6gJc1ERkac4Eaif8Bd+Q
	3qqVo1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5lUc-00CI1n-QC; Tue, 20 Jul 2021 08:52:46 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5lUa-00CI0F-1V
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 08:52:45 +0000
Received: by mail-pf1-x42c.google.com with SMTP id u126so11275895pfb.8
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 01:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=neBt+345X0N5pli5WyJQPDvAFg6VejoZfkgDTygaWmY=;
 b=WFzVlBxJfFJmdQwW3MeqB8pkEgcsPE24Lo8VfUrq1KnWREpx/3uZNT7zDLu79GZl2d
 Z96qv/hLA/MGTILMdJR77VAsy2lythcah0SF5i5yWe2UQX1N4arLhq0b9vU+8zNaM1ly
 V2qoChJ09NocNMFgJEOBcaunPEmZiqg1tDbakPHsq9TZ3Xl1s/8fYMWsVOwMYkA3cW52
 zbaB8FwnHTVz5G6VkcxaR/RiyS+Sr5z0ehYWcPmKWaatwNxMuOd0q/1tYIHzQwXusgrf
 at/mQZwHGu5/Q7BrYXzrWf0NU3ps4M5P9hfydVZBOnLmFNonFnWdWOCfKTtjooh5vchd
 0QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=neBt+345X0N5pli5WyJQPDvAFg6VejoZfkgDTygaWmY=;
 b=hQQyUMiuAqDvJoCiHXVoXXIAhBNBSoz8KmQ+jasqnYzHmPMBfpZLak/yl0JgSI2mZo
 IvsdFDPyK310FebNwe63E8p4YEA8oQWQeoTLHDWAULMS6FIoBiFc8y0M7d/Wf4vhULGw
 wLMQtTRoshvJK/WRccrXKF2+8VFBZqXqRG1Imtx7nJeGiMo/Mw2rgyeCubaAIa5K7frC
 9I6KMiXu9hZDbn00MWoFSDeVTHkjW6J09M1DzqC/iuCwR9FRO4WcCl/OeNx7XvWwS5g+
 7ApcyHKV76hVj53vuPQXFoPAUtjYNlxeuvVd/Lt1RcJuzxEeqBmkbhu/CXUS8Zs+SYI9
 1Z7Q==
X-Gm-Message-State: AOAM530HEKbGafA1ZFTEYL0ZftfYmoFC4ifBWbTSsWQ2wrVeaCpc0LUk
 1b5z900LPn6VpiDgU4hPJIM=
X-Google-Smtp-Source: ABdhPJxOmVRYcAJYPBUAwlqoDVHc2s48l811SwUXYECZw7ET/6/Yv9yG1V3cLT2ITW2OkAYGi4gm9g==
X-Received: by 2002:a65:63cf:: with SMTP id n15mr4668241pgv.392.1626771161295; 
 Tue, 20 Jul 2021 01:52:41 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id i6sm17126099pfa.44.2021.07.20.01.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 01:52:41 -0700 (PDT)
Subject: [PATCH 3/4] riscv: __asm_copy_to-from_user: Remove unnecessary size
 check
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <94d4ec76-a987-348e-71ce-473511d44787@gmail.com>
Date: Tue, 20 Jul 2021 17:52:36 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_015244_140662_2AF6AD17 
X-CRM114-Status: UNSURE (   9.22  )
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


Clean up:

The size of 0 will be evaluated in the next step. Not
required here.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 279876821969..54d497a03164 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -30,7 +30,6 @@ ENTRY(__asm_copy_from_user)
 	 * t0 - end of uncopied dst
 	 */
 	add	t0, a0, a2
-	bgtu	a0, t0, 5f
 
 	/*
 	 * Use byte copy only if too small.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
