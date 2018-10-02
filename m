Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CB1C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 15:03:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2850F20666
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 15:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OJ+rjw+1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HU71PMl3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2850F20666
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=LSRP9E4W3As0sw63ob/UEbQJmF1DkG2BcfxixoVGRBk=; b=OJ+rjw+1sJg5mrEo8jB3+puVm
	ode5KYjodbXL+vnzIbYuqw+b7mgUjmzdkLUsCB4+VO1AItTmkYW6tZj5lQdR3G4988MkmiELhtpMl
	drWWCkQ0rwFzsbd5KwDF6icOng2JUok0s4K9VkEV+GTpe/Ari/xJsB5qRxqmsHCAtXsi3/LsSln5M
	KTcKWxqT2PxQoSG5HaeibhCQwEAaqIuxf7pZJD9vh/8ogY/2dE51fMsmpXkipfj6JwHbVMjLnk79W
	JKwGVqOayAdKW98BXEXr7zuzO4/a1kWglt/WsERbXwKPFcgExgYxPngUMnhY+Ln9B8IPVEBwCZZvf
	ITyoU2ncw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7MDA-0008Mz-Ak; Tue, 02 Oct 2018 15:03:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7MCT-0007zH-Pn
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 15:03:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id az3-v6so1843165plb.4
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=d2CF0k82WvxlhQY1DrC5bSUsm2VCZF/3wkDQIrTo6sQ=;
 b=HU71PMl3Wri9ctt6+i3RPVSSh3glZ2Cm6Pvwchek4UgHdFe5kIjVVa6uVECKNSuwnN
 rWFx1/rhovlA3d9tXQrIrO92iwa7/UnYjrlmLqT09kLXnOkJY2lYH4rGj8reOyYCHlyU
 XZcSlLW9zjZCsP+woxXTzEOdkprY2nOEC8tQmh+hp/285HQcU1Isa3pcQRmfZqDFlRqQ
 HYZGSBDjWexLRJFQ+6kqIr4ApKD1OnEJLonPOEeTxImcOxJOaalRgY5+PkTxHURgOPQc
 1HkEKzumbMyrO6xbLDV135H2q+i2xwgTeie5zT4y/TY9b8szvqWRW+4MxdpXcqLhR+fu
 yF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=d2CF0k82WvxlhQY1DrC5bSUsm2VCZF/3wkDQIrTo6sQ=;
 b=X54yj7IO710q+zLwHoQAk0Cm7g3kGrLfAKRQVS+rYx88G+rS2ZRivnzqVhbwgc24tk
 0G8Kayxs+0ny98ZkqisgBTwWFyih16urwaIB6ABQBu47b+YUI7P6Mec9ELIYlsPe35gg
 FMOiWDQdPzV6zOm4z/osJK24O1OiEg5aqXHAHiMIZsplEWP9Df9l6wW2Q0ai9LLBVHM/
 VHNkMUL3d8vqkFVpJ4Ae+u+cAx17CFQvRH2LNZPOo3cnXofg4GSNB0/yitVJEUTW74eE
 bDe91LF+20w7IE6fQZl6k29chto5fdznJutzHUbrEZJ+UNwMwio/aQIIdqtosIaM17+e
 vewg==
X-Gm-Message-State: ABuFfoiyfoXE9XIJ/VEMyrdtEqCXYzvBw6rxUPlvcpSB1wgvlLPTOwX7
 zK/KQIF70dNiIgLZahlaNEK4lBy10NQ=
X-Google-Smtp-Source: ACcGV62EwD4y3SBd8pwUOyD33jtOAiS4o1ikoySfClbcM6K097toJJ2gI6ii95BlqwDJpEP74IFhUw==
X-Received: by 2002:a17:902:784a:: with SMTP id
 e10-v6mr17044577pln.197.1538492569681; 
 Tue, 02 Oct 2018 08:02:49 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p24-v6sm20376372pgm.70.2018.10.02.08.02.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 08:02:48 -0700 (PDT)
Date: Tue, 02 Oct 2018 08:02:48 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Oct 2018 08:01:58 PDT (-0700)
Subject: Re: [PATCH v3 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
In-Reply-To: <20181002145041.GC3889@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-2b0c98e6-298b-4fc4-842c-809002de3451@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_080301_885505_280DE18C 
X-CRM114-Status: GOOD (  20.77  )
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, zongbox@gmail.com,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002150248.AOa5SfOTxy3QApYdjScEr20QVk61KEMcKIrYqhw9avs@z>

On Tue, 02 Oct 2018 07:50:41 PDT (-0700), Christoph Hellwig wrote:
>> The udivmoddi4 and umoddi3 are copies from libgcc in gcc. There are other
>> functions use the udivmoddi4 in libgcc, so I separate the umoddi3 and
>> udivmoddi4 for flexible extension in the future.
>
> Can you please mention which exact version of an external projected
> you imported things from?  That will generally help if/when someone
> has to dig into diverging versions.
>
>> +++ b/lib/udivmoddi4.c
>> @@ -0,0 +1,310 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see the file COPYING, or write
>> + * to the Free Software Foundation, Inc.
>> + */
>
> The SPDX tag was supposed to replace this boiler plate.  On the other
> hand I'm surpriced there is no Copyright statement here - the FSF is
> usually very good about having them uptodate in every GNU project.

I suggested he import the gcc-4.2.1 version, which has a big copyright notice

    /* More subroutines needed by GCC output code on some machines.  */
    /* Compile this one with gcc.  */
    /* Copyright (C) 1989, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
       2000, 2001, 2002, 2003, 2004, 2005  Free Software Foundation, Inc.
    
    This file is part of GCC.
    
    GCC is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 2, or (at your option) any later
    version.
    
    In addition to the permissions in the GNU General Public License, the
    Free Software Foundation gives you unlimited permission to link the
    compiled version of this file into combinations with other programs,
    and to distribute those combinations without any restriction coming
    from the use of this file.  (The General Public License restrictions
    do apply in other respects; for example, they cover modification of
    the file, and distribution when not linked into a combine
    executable.)
    
    GCC is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
    for more details.
    
    You should have received a copy of the GNU General Public License
    along with GCC; see the file COPYING.  If not, write to the Free
    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
    02110-1301, USA.  */

so it looks like something went wrong here.  Zong: did you go back and 
re-construct this function from the GPLv2 source?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
