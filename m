Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C246CC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bpkwj2VWzguW5w8wFhec1caHap9lccilaif3dQuijfI=; b=H+m1a+BUh+NQRv
	IMdZl4B2e6LogYgz7kueRAQp1rg6WDWI3edkjauQvMNNXr1JE0IOXl+2DcnjIMKO/S3/dzXK6Okee
	GlJKtsG4mtR490O397dsNFJZme63OyCUQ6Q7M1rXKK2hSaBcc/ZabHqQR8K33yo33rjTDB/74W4iC
	ynPzSEV5F/zFxped8qk+rbaKqWmwDmnqQbzjhu+1I9v/jEe1R6+ZrKrjrrO6tAecB/zdZUESdXtiZ
	8FtFhwW3tCvqWvQccZrBBHg+0UDbuzZFYGS2tahPKIyFp9pUStakykWO8XKvESeYrhlbI8jI+3BRu
	7jhJxpxA1hny/WBTHT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWfN-00BZgq-1L;
	Tue, 21 Mar 2023 07:44:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWfK-00BZfl-2s
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679384657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mj0oFAW0m7xXhSCASi5GFfWqVoO56e5EuRP4JQnr2U=;
	b=dNPbFtJiDKqADb9n9me1spZsx5H8Jx4rwSO+TbOVYNVv0Qyvax4otIrFBZEInKr9k0uI0N
	EmclXJSGwB1i6BQqa2SAsWykE8m88NUiq+BRJK9XyaLzpqBTjeGiRdRBHrNT6aIKqMaC3B
	uZ3V/j+SjvYUof6/dgHLXMyujLjHAm0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-pyLf5SqaNn2Kr3NFWiCi_g-1; Tue, 21 Mar 2023 03:44:08 -0400
X-MC-Unique: pyLf5SqaNn2Kr3NFWiCi_g-1
Received: by mail-ot1-f71.google.com with SMTP id 71-20020a9d064d000000b00697e5dc461bso6752312otn.7
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 00:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679384648;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wFMCkdwb/gHudPYJPKuUV3mKfXn/whPMD3aT6HDnwA0=;
        b=kco13uelkK/vUA2+jQK79ToCQCKsoe92VT2tZFb1zjAiGlj8qQPt+jRpa84MOhwEQS
         Q1e0UtL3tAgMBYouE62i9RrOhYf4DtBeT0+ZHRMf428MBi62g/KqCWl5AgZQUjNRjmcr
         PudDboPJU8jASwknvyIIxbYN9veHKDUAWXgyFigJ2K6UCe0K6ITCrcumnyPWZfz479Pp
         oPbwN32Rrqk/dVxHWtjnIRc0CM/7Pi9I1uKSfGFK1Aj9WGbfHHs0wu9H1bW701g0tSJz
         LLFTtEcP8qTN3wqHjtO07oLoq/qdsFFyUg52pwOxpv/CiSCokauiPJ1XOOYLGprYHbnV
         WAEA==
X-Gm-Message-State: AO0yUKUyPOcG0obO1tRYpZ2QOYQ07bF3kKWX3RYG5xD7niLV8c7uTH/J
	AvSjQgROW1bGuSXT07b2Mq2MAzW2zOVGIAUpxuD500URdU687GCdWMSWQLJbdxdGhTpXIyBwoR8
	YYcOVv16X2HSAeXaDbIwZId8+O639ovjEGDr3oE8=
X-Received: by 2002:a4a:2c4b:0:b0:53b:5518:bce9 with SMTP id o72-20020a4a2c4b000000b0053b5518bce9mr562439ooo.1.1679384648104;
        Tue, 21 Mar 2023 00:44:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set+f0OAojAIqMUZciV4xEytZ4fL9bz1L0cPgDGOY+LCNYqJVyk0c6lUzNU3/abQTUvMslZ23bw==
X-Received: by 2002:a4a:2c4b:0:b0:53b:5518:bce9 with SMTP id o72-20020a4a2c4b000000b0053b5518bce9mr562431ooo.1.1679384647881;
        Tue, 21 Mar 2023 00:44:07 -0700 (PDT)
Received: from [192.168.15.177] ([179.111.176.145])
        by smtp.gmail.com with ESMTPSA id v13-20020a9d5a0d000000b00693c9f984b4sm4788041oth.70.2023.03.21.00.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 00:44:07 -0700 (PDT)
Message-ID: <61ee85961cbab30f9e7e56771bbe8f9b5b7753b8.camel@redhat.com>
Subject: Re: [RFC PATCH v2 0/6] Deduplicating RISCV cmpxchg.h macros
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
	 <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 21 Mar 2023 04:44:04 -0300
In-Reply-To: <20230321063430.2218795-1-leobras@redhat.com>
References: <20230321063430.2218795-1-leobras@redhat.com>
User-Agent: Evolution 3.46.4
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_004419_008584_2FDCAA66 
X-CRM114-Status: GOOD (  12.84  )
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

On Tue, 2023-03-21 at 03:34 -0300, Leonardo Bras wrote:
> While studying riscv's cmpxchg.h file, I got really interested in 
> understanding how RISCV asm implemented the different versions of 
> {cmp,}xchg.
> 
> When I understood the pattern, it made sense for me to remove the 
> duplications and create macros to make it easier to understand what exactly 
> changes between the versions: Instruction sufixes & barriers.
> 
> I split those changes in 3 levels for each cmpxchg and xchg, resulting a 
> total of 6 patches. I did this so it becomes easier to review and remove 
> the last levels if desired, but I have no issue squashing them if it's 
> better.
> 
> Please provide comments.
> 
> Thanks!
> Leo
> 
> Changes since v1:
> - Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error
> 
> Leonardo Bras (6):
>   riscv/cmpxchg: Deduplicate cmpxchg() asm functions
>   riscv/cmpxchg: Deduplicate cmpxchg() macros
>   riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
>   riscv/cmpxchg: Deduplicate xchg() asm functions
>   riscv/cmpxchg: Deduplicate xchg() macros
>   riscv/cmpxchg: Deduplicate arch_xchg() macros
> 
>  arch/riscv/include/asm/cmpxchg.h | 316 +++++++------------------------
>  1 file changed, 64 insertions(+), 252 deletions(-)
> 

Re-sending, since it seems to have not worked with patchwork properly.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
