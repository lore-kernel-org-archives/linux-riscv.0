Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545CFC433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 05:23:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F8F0207FC
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 05:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kSn2ruEi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="FIoT6aAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F8F0207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vsPCTg5iNJzMrEwgUKIa//APpdbunSrqyFodPlhvUbo=; b=kSn2ruEiPiQ5/cg085WlnBRNV
	OYtjL3GEsj1a3k9JZ8NXXRNlUv8Wse2r/tSagoXWGzj9KkIMzV4P7v4clH397JQfaqawKOOFNbnnY
	IY/324Mcox89zEIDoc+2j+IdPEbR/4P8PoYUGOTf7YiE0TQf2pSr4dfXdyKjWC6VujaEorFOXfQcX
	kR9eMiDtByMb6pVfkPTQzPEBZxH0FBoQIpmQ8VReoc3v5EqNMtR0MwUvxYgAPJ+p2mr4HPn1kdIcD
	z9Sz2NZX2mOm9ddQWKfWUylyUYMsm0V92USuooXfsjDzrl1s2ZmkjOZBrDRMEF07QZXjocDQY3OP0
	UfwRaYXbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp3Im-0001MN-J3; Sat, 27 Jun 2020 05:22:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp3Il-0001MB-19
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 05:22:55 +0000
Received: by mail-wm1-x343.google.com with SMTP id t194so11270769wmt.4
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 22:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7AXXNOWHbOB4YsE+gGbm0DhspWaDMJardrMNWldaKw=;
 b=FIoT6aAYhjIKnPklzActCQEoy89frtnfayVOHJGkkfxK/573XHauEPodqKwlI/BPuD
 2KpsC1k/xf0Ow1PXWomx2D+fbqeiemGUfmE4GNciGI/27e8BSkc3Mzgz5O8yLgob+hvJ
 QYXJbSP3ZqCgqRWujeXX74wyE6zuD4B+65o1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7AXXNOWHbOB4YsE+gGbm0DhspWaDMJardrMNWldaKw=;
 b=bnn53fJ5WVBNsBaeEpnyVYoU6jZXgVdU8IXmjwsxbnuydAJuwXmoJzx4zMCwL/Tf1S
 soDOEi3USt1M6ou9vU6R5T+/LCnuMSvc5SdItqFZrQNbAcjvOXqFrC8U6UbmPUjV1mqW
 vKTUlug7h56jSvNjL2SRScc34clpf+WegqveVH8aYwznW0ISv/rmXUVCh2uHCJNXmGM1
 l7lYFzVz347cJVqcuNLBVi0ZnHNr69N6Gy8IKqzIrrJJSNNe2lu23S8Weo9VabjQyWTg
 mUiXTiQHrG11holk1I08iNaV0fRFgDwMSh6NtuSOZ6ktxSVlxWPIJ+sKTBg+zfEmbTPk
 PkmQ==
X-Gm-Message-State: AOAM532Y22rnM2Rv0mMv91WOvrt4GtXaCl2WO/jX92t2dLhwwpTNOocu
 go/ivRXNGgD7oYzv4YlyOQTJTSzMHF5c9dHdUFbe
X-Google-Smtp-Source: ABdhPJxIp6n1Ld1IUVsil0d8DUhHGoIb4Q9fPEEOEQutmdpodbw3l6JJdAdyzEY/7JpMIg1gCVesl100JIGLSDwRA60=
X-Received: by 2002:a1c:b103:: with SMTP id a3mr6656921wmf.186.1593235372166; 
 Fri, 26 Jun 2020 22:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4M_BefktQdsD+2SKC6jRU-CfVSR7LDgNpdwZm2r6C-HwqDQ@mail.gmail.com>
In-Reply-To: <CAEf4M_BefktQdsD+2SKC6jRU-CfVSR7LDgNpdwZm2r6C-HwqDQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 26 Jun 2020 22:22:40 -0700
Message-ID: <CAOnJCUKrXOfAPFofr6yi0BjwkVgUSL4eYAhZLNT6UsNWNCUv8Q@mail.gmail.com>
Subject: Re: Linux Plumbers RISC-V microconference?
To: Drew Fustini <pdp7pdp7@gmail.com>
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 26, 2020 at 5:09 AM Drew Fustini <pdp7pdp7@gmail.com> wrote:
>
> Hello, I did not see RISC-V microconference accepted.   Was there an
> application made?  If not, the CFP is still open.
>

Yes. We have submitted a proposal for RISC-V microconference. It is
still early for micro conference acceptance updates.
I hope it will be accepted soon.

> thanks,
> drew
>
> [1] https://www.linuxplumbersconf.org/event/7/page/80-accepted-microconferences
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
