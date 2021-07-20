Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9B8C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 14:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE9B961164
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 14:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE9B961164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3r6E1pHWfRUebX/1XjXLQsIMiTiUWhLdY9+jmSdvqAY=; b=qw1GiUQgNtPKR8kXFU+agCB1gS
	nUr3upIRA42PxtRFiqNxlXh/eWWI4BNYcPJ8Jbx5fJ5yUTt/Pv4qFJQ4tl3XPmJv7LALhNCpd46F8
	qfucR6dL1aAaF42+ifaV6BMzI8iztO9QmFzdFma9mfCRucz56brgNnEREg77N86CG8eGtACTG3z+c
	edSsbxWTjZzo8sc9be66+wvsiQin71hUfbeeWO95Dne3b0blkyWi4bmczQWO1/REgkAlDr5z3YZeH
	kV5t7zL0ZVE2PAKk4OExOcgIEGNHmhJTjgRQAtFZkLl4C7mQEw+DdX2AmkvXOlARCXdH1PMUEg0IF
	p6wUCDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5qbh-00D9pk-Cy; Tue, 20 Jul 2021 14:20:25 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5qaU-00D9Ig-Kd
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 14:19:12 +0000
Received: by mail-oi1-x22b.google.com with SMTP id w194so24667243oie.5
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PECglYF/astRcKoQBZXfhQKHo7bG9nuGojwlhCAqJRU=;
 b=qt1vmHgZVFIUb8yUuAVuL/PhwVmkXoN854BTWx/Y1AlEFKokKhG3PP0hwh41sss3I2
 XwgWtgQARV2+Oulw0bjYN91lrBSPiHxXpVR5JlCVV3dBt4K13C87BvAsj9Gowsn/d4eO
 Vxd7/9UQgztMdJkWQUa4xO4si0Ui2d2Dldwe+sawjLvvbPrbkGIgIIehxsobl/pVK8s+
 vLHhdudHD46CGhPjzNFj+VdVJNBxxTAxAADlvBPY4WyOfsyfT7qvkZBMIBOBaaCR6R4a
 7250uMRZIYIqa1rU+9VJw47+NWDNeozFJNcgw6Fqvil85MGpFvhzLrOKOqD4f7w6Y7Wv
 x0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PECglYF/astRcKoQBZXfhQKHo7bG9nuGojwlhCAqJRU=;
 b=HhbIuOSs3Z/s+GaOu5FTG3JhM+iSFG5WRoRK1FYJFhiQ0piQcWrPOgYSXuVrxCqLPA
 jYPbSdQH2yx0wtAo7gxPhvO26BcIemw9ADbhelKIApf4OPeWS7vhEz4Tp9cdfl+5m5Xe
 +uswlMn99dPNlbkUvAa+lEys7eo5fPOyYFqhEoCSkUwF2Ic6Lvwr6YXl9D9Y3m3dwJF5
 YHlkJJ7eNkAgd6MuNQi6FcYs7/n51i7DYhGq3G7P0TfCAUGv6JGn2nAsBzsYCJ/y40dI
 jYwaxlzY7ymRMJd2pPvTGRvtEV2nopjrFMmbXeAjjr1gF0CDUvfsuCqH0GaQhVfCraBm
 RUjA==
X-Gm-Message-State: AOAM531LiLA6hotI24bwhOrCh/73cppsEq2ApzsfTkppDM+3h4F2as3F
 /furPYp5B7AWrZIzah0bYPQ=
X-Google-Smtp-Source: ABdhPJwu8aSoT9Mdp5g5vQ2PkmuBoMKhlk/w73xNxxWWVcIwn8J40C//O1BZUjsxmD9Gv1GWNh2RiA==
X-Received: by 2002:aca:3987:: with SMTP id
 g129mr25172490oia.161.1626790749044; 
 Tue, 20 Jul 2021 07:19:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j30sm4253284otc.43.2021.07.20.07.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 07:19:08 -0700 (PDT)
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/4] __asm_copy_to-from_user: Fixes
Message-ID: <e959d084-ac32-7d39-41b8-151c2430db76@roeck-us.net>
Date: Tue, 20 Jul 2021 07:19:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_071910_717148_B47D830A 
X-CRM114-Status: GOOD (  14.35  )
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

On 7/20/21 1:49 AM, Akira Tsukamoto wrote:
> These are series for the fix reported by Guenter, Geert and Qiu.
> 
> One patch to fix overrun memory access, one patch to fix on rv32.
> And two more for clean up and typos.
> 
> Have tested on qemu rv32, qemu rv64 and beaglev beta board.
> 
> Thanks for the report and instructions to reproduce the error on rv32.
> 
> Akira
> 
> Akira Tsukamoto (4):
>    riscv: __asm_copy_to-from_user: Fix: overrun copy
>    riscv: __asm_copy_to-from_user: Fix: fail on RV32
>    riscv: __asm_copy_to-from_user: Remove unnecessary size check
>    riscv: __asm_copy_to-from_user: Fix: Typos in comments
> 
>   arch/riscv/lib/uaccess.S | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
> 

For the series:

Tested-by: Guenter Roeck <linux@roeck-us.net>

Tested with qemu for both riscv32 and riscv64.

Thanks!

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
