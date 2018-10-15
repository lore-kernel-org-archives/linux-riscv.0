Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59475C04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 15:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEBCC208AE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 15:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VDXXFEsG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MB4yRy18"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEBCC208AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8LEcThaa4b1vBRMO1d4OXeYjnWfGyvh1QCUNrmYbjQ=; b=VDXXFEsGedVs+I
	5if8FWPb9QL10zpsUNWy3ZL8Goimn/dOAOczA7E3zHXAPimAnkcsV4W651fU9n/v5/GSKtPWN3VIp
	JxmBIwJH0RWgAyZipB1K0qvtoOfClNDEpXuGxRsdPo7a0YhGVObVPrGV627tcXfd5Goz4kVojphan
	Tlgoj/2jsncf5EB0suvO6y7fEtOEsEy9DjMmzNPYMrcH0I7vjIrEyliI7CHOkWNEflORDKq8KyMj5
	yWljlFgS8fDgwTRJx/wEf7qYiCWvE4ug5uVbawfGQ3uISFBbUoMMSlziBhTX28Xil06bF+Yz43a90
	jWj9tr4sWXzo2HJSKImQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC5Ff-0003eM-0V; Mon, 15 Oct 2018 15:57:51 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC5Fb-0003a9-6O
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 15:57:48 +0000
Received: by mail-ua1-x942.google.com with SMTP id c21so2190022uap.7
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VPUnXoD49Y9vevktWec0UrKqnhJ7hh/uC0NM5FvJIYg=;
 b=MB4yRy18jhI9yxlyxVDfG+O39z6GsuCxQeUYoLWuTMRzM+woxPuXF4ZDxB/l3klNbd
 aZeqR6GfInGMbO7dL0H9VBj4erjP0jbcwq8x2dMGRbMnswfLok2mNSAbZTPOl1Q3T2An
 jaBMJbsEFRiPstcfeYwFXFhen6XTPCqHkiZ0PDyeepjbitC8yLmwhn5JINKmhYSydWHU
 R+ugGCW8ELK7nV23yahfT1qrKcTfC+XxY3tLJ2sNpx0taFLqf3h/mOA3smFxg3wPsVzV
 sbbUhCkP0fVMHv7bdgz2lG/CsHcrhH6TcaRykNVUZR/3G66R0f+pb1tmjCb7D05vQs6j
 9ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VPUnXoD49Y9vevktWec0UrKqnhJ7hh/uC0NM5FvJIYg=;
 b=g+1bxlP5PcJLJq3FscbZd6y008v1UkrcYdO/ZN9TY/tqBL5sas+1Kike035V6nkhwz
 JMIjRA+ZRQ96ug8erjDvgLLXA3MgyjDVi5zeEzkt45Jfy2EgYEus7T0krjJknr0QBL32
 YoMZq3hcjhXSga4zTX/CSaO4ljHwmu+gEz4use2KC7F2jF83xgmbz03rzoDN3mXbJxa5
 wiSZr7I3DNdn25LyIPvt27ItYlkkxP5iGU1BABRRpQoooeGcihkPqG5DhbO/g/Itd+NX
 u0iBUPSowo38FxFKPODSaNF0UwR+2SoLhIJwtKfIa4E08cocOsHbCdlxY+QAx9IN0+Il
 XSAw==
X-Gm-Message-State: ABuFfogWRb6dQGmr2oK+CvE30yDKOadCv4ZXPmkxpphl6N1i4TWlKvP2
 k/P5yhmnZr9Hx1asWvbdWqKAugI+Fww7hroQvvnp4g==
X-Google-Smtp-Source: ACcGV60kLshukDzeEXVOqH7MYw3xJFBkEZ4hbgXavxfQrZ4hgam0K193wWSEjeUJVQKB9lkKhpqr3p23s8kqe6CiKeE=
X-Received: by 2002:ab0:24a:: with SMTP id 68-v6mr7636845uas.25.1539619055568; 
 Mon, 15 Oct 2018 08:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20181012200350.5258-1-jimw@sifive.com>
 <20181015083439.GA11826@infradead.org>
In-Reply-To: <20181015083439.GA11826@infradead.org>
From: Jim Wilson <jimw@sifive.com>
Date: Mon, 15 Oct 2018 08:57:24 -0700
Message-ID:
 <CAFyWVaZaXd8GZYSrMqZh+zQ+3CDghpumjo2ETezXcR93OXXSZg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add futex support.
To: hch@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_085747_291517_2DC21310 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015155724.PVzAfUCYVG0qpvYp3j5Roh4-bO9QRLz0WD0pMknQcWU@z>

On Mon, Oct 15, 2018 at 1:34 AM Christoph Hellwig <hch@infradead.org> wrote:
> > +#include <asm/asm.h>
> > +
> > +#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)           \
> > +{                                                                    \
> > +     uintptr_t __tmp;                                                \
> > +     if (__riscv_atomic) {                                           \
>
> __riscv_atomic doesn't exist anywhere in the kernel tree.

__riscv_atomic is a predefined macro from the compiler.  It is defined
when the target has atomic instructions, e.g. -march=rv64ia.  It is
not defined when the target has no atomic instructions, e.g.
-march=rv64i.  The idea here was that we only used atomic instructions
if the target has them.  I didn't think to check for a more proper
kernel solution.  I see that there is a CONFIG_RISCV_ISA_A so it looks
like I should be testing that instead.

I will work on a revised patch as per your suggestions.

Jim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
