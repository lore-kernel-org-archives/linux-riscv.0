Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6E3C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 17:37:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DBF52145D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 17:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S+VJo3IZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Qy1q0UBg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DBF52145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=tdDJHBtoggug6H6hKxnf1W0pU9DEiPIIcE3E9ebon1Y=; b=S+VJo3IZ29uzriAm+iLL+nHig
	JOrUTwPHH7iAWpQe2DxU59ZdC8/dWj70TijnKR4tuCNRI36yPgPuv+rS/Cxm9rqVDq+XNXhm0rfaj
	0bpC8gCwlWlol22CY5FiLPJx0efikhP/933mt+EMEpZ46E+Zd6zHFeVLWQEn5BrjE4kwJDTYcyPLR
	oRa0g785NCTHJ6MUXW0r8OnZUvoieCJIjvqS3sYvOqtCr2TZ4cgUzxKtsXTIEaEuXhneTaM6KxXTM
	DQRZ060w6jZILjCad7NsdzvtnscMUFEmDqALPzvrQbnGzYqvw1ds0sHSnmdB+Z9DFeKMhOty0k+Qe
	zhmM06a2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOnUE-0004lt-SX
	for infradead-linux-riscv@archiver.kernel.org; Mon, 19 Nov 2018 17:37:26 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOnTZ-0003wl-0B
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 17:36:55 +0000
Received: by mail-pl1-x642.google.com with SMTP id z23so3673882plo.0
 for <linux-riscv@lists.infradead.org>; Mon, 19 Nov 2018 09:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=H5owF+wMf79EVakKmOx7q+3qQUQfzmV0sdtOMq5KHco=;
 b=Qy1q0UBgrto8oC1sUXTq1sEixAFaT3JVdkkLf3wT5ngnkF0/nZEz0Stx0phskKD135
 vrHRJIyyc1TDeE+4WwFzTFCdYCz0eNjlT6S3ZLsHinu6LPPpJLRAT/Naz/uk0GA+qLLW
 EM/lsXwHGrWw+JcmREivEP5OylK7SVULEz+b/fmEqPLK+/u8iyVrocrTL4NOQZrTG+vu
 LuWwsdkpITdY4qO29SGyuFmpjdGQPJn98oVyhA6xcxufU4URMerimvGsobISOJVmQrMf
 P8Xmy94k0VjpAMBowKAFawpFq+ELUivOTu4CVeNKY0w85bmrBwvxZZcWWEo37QpbpFB/
 0SGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=H5owF+wMf79EVakKmOx7q+3qQUQfzmV0sdtOMq5KHco=;
 b=AWVQHU/MYe6xxhaopJMyZTLwSjd1YxpV0Vym8Aktqww3utt5sL6Z2bRCcOpZ8TF3rj
 5l2JAV8JE7zfWLit8Q+b/btB1oI+k6T5Cg6AzEZlyfedbJkNLkd/Hz2yeFULiA3chXOm
 Uk4XvcTCdwQcn+3O3eSHUiQrTQPeDFmPMCsdjSb1n7XH56EFaQxsa6PyIUcWCpZR5FZg
 aQto5jcDeb4k0pvWWxb0n7oJ7/6x5VnQmhgoY5sPblUjV226NOuSbgso4hgIXVBz+fKP
 1/fWANSJLKCXGROSQNtkUjm0DpekD5Mfc3/GPz2iIRyxRqYElxBVgePPF//ardVaZL58
 OJFg==
X-Gm-Message-State: AA+aEWa8V3lGDm+iyePzUOekfWaCsVmO1xWjDRZ9Pr1U4LveiIrSARLq
 +T0X0njenidMgig90NNm+KNMxw==
X-Google-Smtp-Source: AFSGD/V4iNdu82z3NfQh85ggl1zqJFIrcRFH1/n4wLwvtkzT/WBY0iO7DPwAenx5lYq9ny5WQRy3lA==
X-Received: by 2002:a17:902:76ca:: with SMTP id
 j10mr6890679plt.144.1542648993894; 
 Mon, 19 Nov 2018 09:36:33 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d8-v6sm48404462pfj.106.2018.11.19.09.36.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Nov 2018 09:36:32 -0800 (PST)
Date: Mon, 19 Nov 2018 09:36:32 -0800 (PST)
X-Google-Original-Date: Mon, 19 Nov 2018 09:18:07 PST (-0800)
Subject: Re: [PATCH] riscv: fix warning in arch/riscv/include/asm/module.h
In-Reply-To: <CAOesGMjzOkPNv7v_uMMsCw=20NuebPvkLBS5b5eaS9Z6=p1qKg@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Olof Johansson <olof@lixom.net>
Message-ID: <mhng-37d3ed08-3bb9-420e-bb62-3bd555d141dd@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_093645_092691_4B4BE90E 
X-CRM114-Status: GOOD (  18.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, david.abdurachmanov@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119173632.90cJS6uIH6mAIrDUE9awRULatPCEr9uCUXzGlEvxhrs@z>

On Fri, 16 Nov 2018 19:09:36 PST (-0800), Olof Johansson wrote:
> On Thu, Nov 8, 2018 at 11:32 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Thu, 08 Nov 2018 11:07:00 PST (-0800), david.abdurachmanov@gmail.com wrote:
>> > Fixes warning: 'struct module' declared inside parameter list will not be
>> > visible outside of this definition or declaration
>> >
>> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>> > ---
>> >  arch/riscv/include/asm/module.h | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
>> > index 349df33808c4..cd2af4b013e3 100644
>> > --- a/arch/riscv/include/asm/module.h
>> > +++ b/arch/riscv/include/asm/module.h
>> > @@ -8,6 +8,7 @@
>> >
>> >  #define MODULE_ARCH_VERMAGIC    "riscv"
>> >
>> > +struct module;
>> >  u64 module_emit_got_entry(struct module *mod, u64 val);
>> >  u64 module_emit_plt_entry(struct module *mod, u64 val);
>>
>> Works for me.  Looks like arm64 might have exactly the same issue.  I'll roll
>> it up into the next RC.
>
> Looks like it's still here in -next. So, patch:
>
> Acked-by: Olof Johansson <olof@lixom.net>
>
> (and it'd be great to pickup together with the 32-bit build fix).

Sorry, I must have managed to screw something up here and drop both of these 
from my fixes list.  Not sure how they managed to make it into -next without 
being in the list, but it's been on my TODO list to fix up my workflow scripts 
for a while anyway...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
