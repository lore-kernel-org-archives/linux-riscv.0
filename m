Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0EFC636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=omFFxoruKWu/XOvRbZWHdJ8TXFn3W7pCfpnrErE6mP8=; b=dmQq08kwLZduGzmc31dZdEcxPv
	rqXTBLz5JMHpNG8LhqWLNRoUkckzx8exqRec37l0oV6pacp/lrhpBYGyFcIndiAQpywtON0r/7jrk
	rDIeLl9YQ4zvm197aT0TwZqECX3jBH0dwHw0SuypUUYDTAp95l3nAACh/jUqnc9XOy1fJPV84moY5
	dnbea7YjrnBnNas+hY5JNVXnnhUjUkKmNDu0cMvgWkkv7JBkStURE+OnFoLed/nZr/hCRwjkdS3Bd
	J5FLQ2UurO4WymWSiXEObVcutXhAQL4sZMOJkptwwaatNPsLjOaaAbIHqqwgat5QJfXTzBPluXVOC
	DX15E18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmk2-00G8M6-9h; Wed, 08 Feb 2023 15:52:14 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmjy-00G8LW-Gi
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 15:52:12 +0000
Received: by mail-pl1-x62a.google.com with SMTP id u9so15465424plf.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+FaVvlkf1fokiUkD6crWPxq8LiP8ntxsNttWWvlWpg=;
        b=kbIfgnUYsxNqwxFYXUkYWUU2QKlp5zCjx8j0T/4aIskIHMBGJ16yIexQ6AVfUOi8pZ
         mMj9uuGkTmjvbVihWkWRJ8P4NJuMNaeQkmBMtJ5c9NEnQXfYLbmcC7XHemIwZbYXAwEn
         p5BDvtUdrH+VHZSJKbobfB8NyNdiEqGz0eGSgwKHagfMYSlcEOwkEGpL2YMUYFyPo3JT
         EAxBKpySZRE0297YIz5UpQUxZb6j4fYwdN9VfWm/ktg29uty7T93G4LQeXiPgmj0348o
         +nBc0ETK+qryj8ZstuZN3JSGayffgeXYo0RD4hI8X78xPtrARoYi3WYjNjUjIczDAsDF
         ntAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+FaVvlkf1fokiUkD6crWPxq8LiP8ntxsNttWWvlWpg=;
        b=m25TtDB8V6lJyUAEoxNwNPF9RYv/8n0JPU7IhfMTeUHi18BXSnZ1A4GevtIxKBS6tv
         AnAYCRYxoAWdMBTD3trtBKoTK/mxHyVWuHoSTQtmNdPox28ScnkkuTndzcicMF+S2o5a
         gXnX9UaN1Von9sxIOdPEDRyObe5w3f7DFrDtfsF7P7w11HT5mtq5MQvAM+MWuiDmFpQM
         3sbOdId/HK3ho93eD2laUlxvE7GBpiHm39FRdKgEfOQcq/Fk4Wl4v/Dl0mNLQT9hLQXR
         uLQS/dfwHLWcueI6v9E5++bZdpC9CoR1CxnWCKhvb9CqHngqHwTtfFdZeqMh/bNL9neC
         KRCQ==
X-Gm-Message-State: AO0yUKWMloMjg5n8ebAMAymi7jPtPVbRvvFSDVVz6Xe6ITyD//pgC/+E
	r/y6zzZCIKBuPEz8hb4xRU9ypIGQNFyC1w8N
X-Google-Smtp-Source: AK7set82cRktIMbmxtP/fGUfsawg7jCQ5RXL+XLenoYuG0L3XUcrWjblJJiSesRdlC1YFO8vMQ7ETA==
X-Received: by 2002:a05:6a20:3c8b:b0:bc:e785:5ad3 with SMTP id b11-20020a056a203c8b00b000bce7855ad3mr7223687pzj.29.1675871527068;
        Wed, 08 Feb 2023 07:52:07 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709027e0200b00194b3a7853esm11169500plm.181.2023.02.08.07.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 07:52:06 -0800 (PST)
Date: Wed, 08 Feb 2023 07:52:06 -0800 (PST)
X-Google-Original-Date: Wed, 08 Feb 2023 07:51:57 PST (-0800)
Subject: Re: [PATCH] Documentation: RISC-V: Define Xlinuxs{s,m}aia
In-Reply-To: <17CF439E-8933-4358-987B-85352DCAE4DD@kernel.org>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-474f7ecd-65b8-4cfa-8b75-e51b896cc58e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_075210_773788_A22816DD 
X-CRM114-Status: GOOD (  20.66  )
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

On Thu, 02 Feb 2023 23:32:47 PST (-0800), Conor Dooley wrote:
>
>
> On 3 February 2023 00:12:01 GMT, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>The AIA specification was only partially frozen, but provides no way to
>>refer to the subset of behavior that has been frozen.
>
> Ahh, wonderful.
>
>>It seems like
>>there's not a whole lot of interest in the non-frozen behavior, so let's
>>just define an extension that only consists of the frozen behavior
>
>>
>>Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>---
>> Documentation/riscv/extensions.rst | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>> create mode 100644 Documentation/riscv/extensions.rst
>>
>>diff --git a/Documentation/riscv/extensions.rst b/Documentation/riscv/extensions.rst
>>new file mode 100644
>>index 000000000000..c12bd3780520
>>--- /dev/null
>>+++ b/Documentation/riscv/extensions.rst
>>@@ -0,0 +1,10 @@
>>+.. SPDX-License-Identifier: GPL-2.0
>>+
>>+Custom RISC-V Extensions
>>+========================
>>+
>>+* The `Xlinuxsmaia` and `Xlinuxssaia` extensions coorespond to the standard
>
> Typo: correspond
>
>>+  `Smaia` and `Ssaia` extensions as defined by version 1.0-RC2 of the RISC-V
>>+  Advanced Interrupt Architecture (AIA) specification, with the difference that
>>+  chapters 5 (Duo-PLIC) and 9 (IOMMU Support for MSIs to Virtual Machines) do
>>+  not exist.
>
> Perhaps this document needs an intro section specifying what you expect to go in it.
> Is this for any custom stuff, or just places where Linux has to work around RVI?

From talking on the patchwork call, it sounds like 1.0.0-rc2 may not be 
what's going to be ratified.  If the plan really is to remove the draft 
chapters when the spec is ratified, which does sometimes happen, then 
those might just solve the problem -- but sometimes things marked as 
drafts get ratified, so we really just have no idea what the spec is 
going to be.  It's going to be pretty much imposible to get everyone on 
the same page until we can see the spec that's going to be ratified.  So 
I think until that gets sorted out, there's not really a whole lot more 
we can do here.

The other option would be to just properly commit to moving away from 
ISA strings in the DT interface.  We've sort of soft-forked already, but 
we're at least trying to keep things looking similar.  Properly forking 
would really make everyone happy, as we'd no longer need to worry about 
the specs getting the details right.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
