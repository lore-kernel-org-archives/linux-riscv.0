Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95634C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 15:55:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F97A2089F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 15:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jDnCm6Ff";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dfKpbJB0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F97A2089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=nVpgRD8yDbeAJmPeMbaaceMsbOi0FDHTUSjBLTdp6co=; b=jDnCm6Ff0RriKDCVFsGYhB41L
	R6Yil6WTohNMnH62rPC2WbT+brxdzoHYVvauQIEVCLoAAj3nn0f2Q4OOMxut7+jnQX3Spofp2i4zH
	CWzUZEXwmwz8NRKmX439ssyntD0yd6uCkArpU1fD1s6EKe1PiPO7G8KycmjSktbl9jRK2k3KiKiQA
	HW68/OrB1AsqnN19SaomhlUecEjCrhBY4k6TioMjmR5qJoUnCoqxLB25CRJsoLluhLFKC6iapVeem
	0srV6IJugnYQhdVsHQiMGCLO5nMWV/5oZieG6aYdUpTgqSwnOzhm8bRLfBDgEh5ElzE2HKfehjnER
	Vtj0sT4VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggXFf-00086H-FE; Mon, 07 Jan 2019 15:55:43 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXFc-00085u-3C
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 15:55:41 +0000
Received: by mail-pf1-x441.google.com with SMTP id z9so367103pfi.2
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 07:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OPMQr8aaoOHYBIhSdwhB1FWqmPYBcFocwfFc22MwB58=;
 b=dfKpbJB0JEtTZ+PkIa/kOEdWFRrmVQo9XD0v5SYmbDYrcxVbmWBaB3IcoaUuHKCgkm
 dESH3/4amQVbPaZTPG4Pbc7HLQrzO87vVgLO2pr4ThKMPEwz1wHucRhr9BpxaL1e03kf
 eEU5oErReBIRTKnSrV6G2+zUGOVdgs6PUKifErsVOV+7DN0xqIpHw/t0OntdyXcv6aiw
 DvTPSB6NIBfAlRaEGMHifeOMgIexBYULKi6r77OufTUKCsBTqCSru5OegRti2ob1nrcl
 njZf6ztwHv9dI/AkrnzYiyXcH376KK3bbFHcjitwd/1auRu86Dy9hxD1KPMC5idJNMWe
 unyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OPMQr8aaoOHYBIhSdwhB1FWqmPYBcFocwfFc22MwB58=;
 b=LTtWGesn34mm/UmqN4rhIeiJ2pHsJXEa/pj+IyeZk3N4Esb1A9hXrjWN9o+EmMzxch
 E9SHdPWiw+A2xP1Gyu/ziqYVTmrK0YRuOznmW6DzBnjeY7VjojZZMU78nI4oLZmFqNjC
 W2botyx/IVb0nyfTDLcpcVFSBnWO5TMZI83GKXvSy93Irg7bjSD9T6K1+UG9LIX0kYdw
 VLd6T/mFE37wIEE5Y+U5PigCtsdHfileHSQSyrrPp5vqXCFpoHkKee5c9QV8U33duF4h
 hS3MzXBxLngIn5MH19Qnw6aRd2ynWxltK7oIvwXqsQMR40HZOXI+Rr6RYyEX0U5WLkEN
 3GQA==
X-Gm-Message-State: AA+aEWZCw1KLTVY4k+OpN9ZcWJArSiPzAorajR2I9S4g/ARR45iq0v+O
 ywBjvNJ9aAHmvifcNdO7lojUfQaIwvI=
X-Google-Smtp-Source: ALg8bN5XIlmUgXuXee/8GVgxb3qpUMVq1+sidov53gy0yauKNtmudigmsT6zemrWttxV9xGDJsEGOw==
X-Received: by 2002:a62:5f07:: with SMTP id t7mr63068960pfb.108.1546876538017; 
 Mon, 07 Jan 2019 07:55:38 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z62sm115069986pfl.33.2019.01.07.07.55.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 07:55:36 -0800 (PST)
Date: Mon, 07 Jan 2019 07:55:36 -0800 (PST)
X-Google-Original-Date: Fri, 04 Jan 2019 15:01:01 PST (-0800)
Subject: Re: [PATCH] tools uapi: fix RISC-V 64-bit support
In-Reply-To: <20181226201314.GA6513@aurel32.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: aurelien@aurel32.net
Message-ID: <mhng-983dbfc6-a39c-48c9-be85-52da0228d375@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_075540_146402_3E5FCC3B 
X-CRM114-Status: GOOD (  24.79  )
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
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 26 Dec 2018 12:13:14 PST (-0800), aurelien@aurel32.net wrote:
> On 2018-12-26 09:19, Palmer Dabbelt wrote:
>> On Tue, 25 Dec 2018 06:46:24 PST (-0800), aurelien@aurel32.net wrote:
>> > The BPF library is not built on 64-bit RISC-V, as the BPF feature is
>> > not detected. Looking more in details, feature/test-bpf.c fails to build
>> > with the following error:
>> >
>> > | In file included from /tmp/linux-4.19.12/tools/include/uapi/asm/bitsperlong.h:17,
>> > |                  from /tmp/linux-4.19.12/tools/include/uapi/asm-generic/unistd.h:2,
>> > |                  from /usr/include/riscv64-linux-gnu/asm/unistd.h:1,
>> > |                  from test-bpf.c:2:
>> > | /tmp/linux-4.19.12/tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
>> > |  #error Inconsistent word size. Check asm/bitsperlong.h
>> > |   ^~~~~
>> >
>> > The UAPI from the tools directory is missing RISC-V support, therefore
>> > bitsperlong.h from asm-generic is used, defaulting to 32 bits.
>> >
>> > Fix that by adding tools/arch/riscv/include/uapi/asm/bitsperlong.h as
>> > a copy of arch/riscv/include/uapi/asm/bitsperlong.h and by updating
>> > tools/include/uapi/asm/bitsperlong.h.
>> >
>> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>> > ---
>> >  .../arch/riscv/include/uapi/asm/bitsperlong.h | 25 +++++++++++++++++++
>> >  tools/include/uapi/asm/bitsperlong.h          |  2 ++
>> >  2 files changed, 27 insertions(+)
>> >  create mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h
>> >
>> > diff --git a/tools/arch/riscv/include/uapi/asm/bitsperlong.h b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
>> > new file mode 100644
>> > index 000000000000..0b3cb52fd29d
>> > --- /dev/null
>> > +++ b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
>> > @@ -0,0 +1,25 @@
>> > +/*
>> > + * Copyright (C) 2012 ARM Ltd.
>> > + * Copyright (C) 2015 Regents of the University of California
>> > + *
>> > + * This program is free software; you can redistribute it and/or modify
>> > + * it under the terms of the GNU General Public License version 2 as
>> > + * published by the Free Software Foundation.
>> > + *
>> > + * This program is distributed in the hope that it will be useful,
>> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> > + * GNU General Public License for more details.
>> > + *
>> > + * You should have received a copy of the GNU General Public License
>> > + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> > + */
>> > +
>> > +#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
>> > +#define _UAPI_ASM_RISCV_BITSPERLONG_H
>> > +
>> > +#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
>> > +
>> > +#include <asm-generic/bitsperlong.h>
>> > +
>> > +#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
>> > diff --git a/tools/include/uapi/asm/bitsperlong.h b/tools/include/uapi/asm/bitsperlong.h
>> > index 8dd6aefdafa4..fd92ce8388fc 100644
>> > --- a/tools/include/uapi/asm/bitsperlong.h
>> > +++ b/tools/include/uapi/asm/bitsperlong.h
>> > @@ -13,6 +13,8 @@
>> >  #include "../../arch/mips/include/uapi/asm/bitsperlong.h"
>> >  #elif defined(__ia64__)
>> >  #include "../../arch/ia64/include/uapi/asm/bitsperlong.h"
>> > +#elif defined(__riscv)
>> > +#include "../../arch/riscv/include/uapi/asm/bitsperlong.h"
>> >  #else
>> >  #include <asm-generic/bitsperlong.h>
>> >  #endif
>>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> Thanks for the review.
>
>> Do you want me to put this in my tree?
>>
>
> It's not clear for me how this should get merged and get_maintainer.pl
> is not that useful here. If it is possible to merge it through your
> tree, I would indeed appreciate if you can put it there.

OK, I'll send it up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
