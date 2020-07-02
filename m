Return-Path: <SRS0=rvuQ=AN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E97C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 15:51:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C362E20885
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 15:51:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DNZPpw+S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YaP4dmNZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C362E20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SYgb8PHX0ZvoKFFmwaG5z3s6p0yJuryt4IW3veo3FMQ=; b=DNZPpw+SYiMf047FZ8wypITbB
	gzKhGObD7J/VvzE9JDHR+rEBYMQY1YLqI+PusFHWDBSqFwliGmJTAA8nh7uKatH8/7iuWfyyRbFmI
	8FbKHGWaW3KTF+K79UzgdfClqqxwz55QaiHxa9ObxEey1tnvEgv6HKYz6RJ0xo/t2IwMMFRBfAU/1
	6P8zy4wfZU5w4oE137sTzwowAntnNaLYiuFDB2ziPza8u+FlsE5u50CIKLoETMZQR8fxQ6Ws8Agt7
	OvgYvRflVA3TpuBj0jF1SyznLri5QXlhDyVNsZ65eq0RDIj6oYYWiRDw9cTbzXKeGLDaCIaqLyw2z
	xShijjyjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr1V7-0003Je-BH; Thu, 02 Jul 2020 15:51:49 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr1V0-0003GU-A9
 for linux-riscv@lists.infradead.org; Thu, 02 Jul 2020 15:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593705100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3VZY2zDbwBbzLtxgPU26SXjP7JkefPkdEkB2jqODvmQ=;
 b=YaP4dmNZYc1ydmqOTfmrIsfGzWiK9xzfcDp4JUgQhwSn6i2yCIW69Zph6mCXHczEqeP4yn
 KekRX7wX3T5pGnIB39oIQWqeG/ryVx3nO/lvJ5ry7jp3JUZBm7no0DD3rFJCN8e7hdm4AT
 UW1OmFxKJxxsSbEaGqO2afRZ3TQ+l98=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-_03Yv2RhMoSBYq1S-3oC5A-1; Thu, 02 Jul 2020 11:51:36 -0400
X-MC-Unique: _03Yv2RhMoSBYq1S-3oC5A-1
Received: by mail-qt1-f199.google.com with SMTP id h30so19582127qtb.7
 for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2020 08:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3VZY2zDbwBbzLtxgPU26SXjP7JkefPkdEkB2jqODvmQ=;
 b=LKTf0cVQRdH8H3L775fN5D9o0BugB+S1shjlfXVozGm+MRXq95nnBZyfRy9+uG4t0Q
 zVraUeEHidtoN+Zq7TyAE4cBOhy7u66oAMNz1PjnlLHjs8ODddQE3zVwbtnfgjxCk7jG
 skFQ3UdcpMVEjK1AkTyLYflH9XovMeaC5/vx0hIKAAAzaCfS5OXZu7ZgDueomPzWhYlF
 XYFjuIWY/+8dwzCFVCnHpmm90EvCRQPFVih+EPcH42vS2XrUAe9lqF1RS4ljRoJAIXsC
 wW73iaDP1LhG5fnkLFhVscu/AFT0utLQvYCst6dpNa/8zcPEk3qZmGd1AMXCNjei3pNo
 cDaQ==
X-Gm-Message-State: AOAM533j8neGp/mav8BqoZR4DyPafwYsT7qEsqDVtN2PVTQ3luMTOGg2
 wEtfId4JNXwoYe0GOPlJqvGJI6jkf+rQyEuK5Dzn5dv9RtUZhpUAKHiGBh60bBLrtkMQt9Zbt2k
 zpC2w/Sv0p4nIWM8UIaOmUgig01pg
X-Received: by 2002:a37:5bc4:: with SMTP id
 p187mr31620567qkb.166.1593705095716; 
 Thu, 02 Jul 2020 08:51:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKAr0yUH8hYYhDsr4DruYkVLRU9FgSh469c3MauYeix84ykqUuFOOZU7bgix90YvCz9q//0g==
X-Received: by 2002:a37:5bc4:: with SMTP id
 p187mr31620555qkb.166.1593705095513; 
 Thu, 02 Jul 2020 08:51:35 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id x13sm8044078qts.57.2020.07.02.08.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 08:51:33 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:51:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Pekka Enberg <penberg@gmail.com>
Subject: Re: [PATCH 17/26] mm/riscv: Use general page fault accounting
Message-ID: <20200702155132.GJ40675@xz-x1>
References: <20200626223130.199227-1-peterx@redhat.com>
 <20200626223625.199813-1-peterx@redhat.com>
 <CAOJsxLEYHzjgMtXgbkoWYvU+Lf_08GPkMAFqibnEwARNzxJZxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOJsxLEYHzjgMtXgbkoWYvU+Lf_08GPkMAFqibnEwARNzxJZxQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_115142_527069_DC3D61A0 
X-CRM114-Status: GOOD (  10.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 LKML <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 01, 2020 at 02:46:24PM +0300, Pekka Enberg wrote:
> Hi Peter,

Hi, Pekka,

> 
> On Sat, Jun 27, 2020 at 1:36 AM Peter Xu <peterx@redhat.com> wrote:
> > Use the general page fault accounting by passing regs into handle_mm_fault().
> > It naturally solve the issue of multiple page fault accounting when page fault
> > retry happened.
> 
> I sent a patch to fix up riscv page fault accounting some days ago:
> 
> http://lists.infradead.org/pipermail/linux-riscv/2020-June/000775.html

Yes, this is a valid fix too.

> 
> However, your fix is obviously even better. For the generic and riscv parts:
> 
> Reviewed-by: Pekka Enberg <penberg@kernel.org>

Thanks!

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
