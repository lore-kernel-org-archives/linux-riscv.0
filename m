Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76FFC433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:08:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7026761924
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7026761924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8ygwZcVtnb4CPyf20Q837h4ldxIBYk88Z0CyLlhFfNU=; b=MYo/iYYId5WAxnRB4BCxLxUh3
	dzdqcbkTpUp9OJi/gnlHijDhf1gZ2vydSznqpjLGhUen6qMw+4/xZJ4RlBW6t7UqcOgj4lXyPFCKs
	c0axktFlJHN/FAz25eHZDGfkSheTYeDoS4C2yki2bjUWpj1yd1SXPlywnho4W3fsUIL1YNhAuB2pO
	3SFjDt3wGoi0t4RjF6n4nLNoQa++U67DXZD5DPEeX9UAx9ALek1E3NZPuCeQ+KlzD3ZoH/4eUngEw
	bO3e0FL+QF7V9XUO2Vu/vn8AnVWYmBe1qUWRrRXYSxgGP5mA8EtolHsvB5C9xK9+tsSjeBENneZbV
	+kl+YQ3wQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR6bc-002ifY-2Y; Tue, 30 Mar 2021 05:07:56 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR6bX-002iej-5M
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 05:07:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so7058250pjv.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 22:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=D6RX73L1stgYWvYfUjXfH9nUeLArVwqYEE8k8Kohk2o=;
 b=vkS7yzx2kUSiFhvokAA1TDF14aAab2V/mDJlC2TZsgk23EIfFsTIzjVcpgHXHqJCcG
 dDK6hxbEH0IstblMbaJlDhEmizAHw5+BWEDd1n5U9FItcfCa5IIvsEmtUJG7uBywpO6s
 pCpm8ZetvZeKBudaxEX/3IF5JJ35tDgDBrcbGsm4oD89xexggremJbrr7A2L77KD1dZf
 17HhkWMFOGoR+QJz4FnhTClV+AlJePmMnzBsc1mP+z8HUW6jtjZbA6HIE1Asl4bn6ef2
 B6re8AplkYunj6whhPQa3XKW5nzoYs1qPKQ8J6Y09sMdzlEaAfLPXhft+3pu3MwxUYTo
 2sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=D6RX73L1stgYWvYfUjXfH9nUeLArVwqYEE8k8Kohk2o=;
 b=Tg3BMSbG3uSfyK9WMglY+n4rHlwqi88pr4UugysqBzTOe7hSRxklr554UrLtwWxbnM
 Lj+anJgMP4RSx8m/oSgacvpVxF7Mj1IYCqOfUWn0mEwCBqCIRoasOGH23pszYkUbomi8
 kzEgZbpoLUR/hf16y2lY4O7CB6rimtMlDKNdo1xzUKbXY+T8OPQpGwTnMH9PHO0lhX5c
 E6oGRY4xltHnQcIxpHk5ZdIGzpBUktfLR4eDbjNNRtjTygpGqXPEFR1UVt6k6iWmpjxx
 s4GOfLQrfg3UiAOXd9jVCvxx5KUsqEoU8egJoVL+ePTAW+9QNPU6ALYLbJlzogE8ArQG
 AA6w==
X-Gm-Message-State: AOAM531dFgmMl1BvvfSJ3Bx6fPTkbgXhMpX+e2qV42WEYRou1jYw0mU6
 LgQFe2UpKhLQLnKeyPyI4enf3w==
X-Google-Smtp-Source: ABdhPJxOMS/xpJureu44VvyywEZSKLnMsvLurrdxGN3jowDiWSfuDfYkKiBEfsNsSwdLBIrKIu1Uhw==
X-Received: by 2002:a17:90b:16cd:: with SMTP id
 iy13mr2675534pjb.46.1617080867717; 
 Mon, 29 Mar 2021 22:07:47 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 25sm19101666pfh.199.2021.03.29.22.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 22:07:47 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:07:47 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 22:07:38 PDT (-0700)
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
In-Reply-To: <20210316193420.904-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, dvyukov@google.com,
 linux-api@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-885e3a79-49cf-42fc-8561-a52c7b7e1ac6@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_060751_315419_7DE5002E 
X-CRM114-Status: GOOD (  17.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 16 Mar 2021 12:34:20 PDT (-0700), alex@ghiti.fr wrote:
> Increase COMMAND_LINE_SIZE as the current default value is too low
> for syzbot kernel command line.
>
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/include/uapi/asm/setup.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 arch/riscv/include/uapi/asm/setup.h
>
> diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
> new file mode 100644
> index 000000000000..66b13a522880
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/setup.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +
> +#ifndef _UAPI_ASM_RISCV_SETUP_H
> +#define _UAPI_ASM_RISCV_SETUP_H
> +
> +#define COMMAND_LINE_SIZE	1024
> +
> +#endif /* _UAPI_ASM_RISCV_SETUP_H */

I put this on fixes, but it seemes like this should really be a Kconfig 
enttry.  Either way, ours was quite a bit smaller than most 
architectures and it's great that syzbot has started to find bugs, so 
I'd rather get this in sooner.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
