Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36CAC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 19:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ufknkn9pZxy5jqN3urZV8qp8q//CGx79CapPvcyohY=; b=OJ1B5E614/E+A7
	Aj3OIdRay4AeAq0DEpkRGE3QDZ24m1e+GniwY5XDjEa4lOhAMn4oWnDaNrdMTB3sBq7TEEhnhjJEn
	NBV+e3CtLky363ea7BfQlnGPL8PVn/6R5UsZIa6OPMW+bzY4P2a5Sn9jpCVgyEejuitMl9rO2uJX1
	dAm6P6MOHOApyr2rvXUASEr+P/bqIMreveQ9kO5UrpBpOKGdh5yzmEhDK8ACYW1NYpNB6WIqSCeFd
	5WlJq7nST7wSaBMtmfZXMoDs3wzSbiJ0szHxjM86sETmTZOsBNG1QRkhtUKj6Eau5xOyRqpqFB/r0
	EQjA4xyL6ycCtSAJM6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfQG2-002nXh-13;
	Thu, 23 Mar 2023 19:05:54 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfQFz-002nVh-1L
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 19:05:52 +0000
Received: by mail-ed1-x529.google.com with SMTP id eg48so90945485edb.13
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 12:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679598345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DYOjt7Npq6o0MM5f+M0/agbMbbVqpJG+xs65zXpOoc=;
        b=Zjm+HRUmUtcJqBUnZCiTJcrEqJV/Ys/IMiQ2p6t53ezM9aRKn+huyw7g6pp1FGhXu0
         jlgzD7UttUIsRGB8HdZXt2NwlXp0bZas95oW+ktGRPAm8wLT2BxHOf/cQ6d60chwbbos
         mrkY7mI3a0I12WJGufKnpO+BN+C1YDZgJEteddb4ubUdUmr+v1rEKGNd3226vzrEMrfl
         lQ10+31Q+XNVXorkF4rblBtYUai8CHrm8RYOs9h1fzTWAWGBR11Dcbl/v4BfNXknqqvV
         rrtnxVWUARbzQMrn/ZRE82To8DiVgoFsswBQBhpzgXy8F/VYirdkp2ADvnuIPWdYhRVS
         CBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679598345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DYOjt7Npq6o0MM5f+M0/agbMbbVqpJG+xs65zXpOoc=;
        b=jX+Jl/RB7InkpLyoNIyFLUHoDsKgDmqHJ+fLkK1im4kMmtBxftiWjQDed3g4Jlju8g
         V0W6qqzTcHTm8NlzaWJuDgBbapLq9FtzfswqnE1e18kCFIittrWCKqOwhL7dGtOUhNXM
         hUd3alOJojSCWlBYbFhOwdkZKrT9tJx/CXS1NGgQXJJcFrJD7iq+PCRclHSbCIc3uSJn
         Jl3oVFWrsSVe2JUPjz1geaJ/WXcjWh+NqmSSjz1gEI/6SpoAfWYAY3eEuuyEPclrIFP1
         wYN8G/pNjw2IDTybCJZWbYCGJq9gCZF03BJmEsXP+ZVBGfShXvjfSAJ8aV1cFmz5owh4
         ZYTg==
X-Gm-Message-State: AAQBX9e4O72KJ5zY8E7koCOQ/WyUMn9WZljr3QAzudJCWvvFrYNBZRUP
	+0NUlIocG9xNvPO/JPjwMrvsBg==
X-Google-Smtp-Source: AKy350YuC538qa3su4Nv9XC3coyXr+oWAT1U9eFaVgDrwOieK5A1+1tEGN2o1PRcuWBlcplYHN843A==
X-Received: by 2002:a17:907:10cc:b0:932:2874:cc5 with SMTP id rv12-20020a17090710cc00b0093228740cc5mr107442ejb.16.1679598345384;
        Thu, 23 Mar 2023 12:05:45 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170907985300b008c327bef167sm9033877ejc.7.2023.03.23.12.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 12:05:44 -0700 (PDT)
Date: Thu, 23 Mar 2023 20:05:42 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Require alternatives
Message-ID: <20230323190542.cubyq5p7tm2lzzd3@orel>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
 <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
 <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_120551_481486_DDBD5B9D 
X-CRM114-Status: GOOD (  18.95  )
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

On Thu, Mar 23, 2023 at 05:57:14PM +0000, Conor Dooley wrote:
> On Wed, Mar 22, 2023 at 07:40:14PM +0000, Conor Dooley wrote:
> > On Wed, Mar 22, 2023 at 08:28:56PM +0100, Andrew Jones wrote:
> > > KVM makes use of riscv_has_extension_unlikely() to check for the
> > > svinval extension. riscv_has_extension_unlikely() is built on
> > > alternatives, which means KVM should ensure alternatives support
> > > is available.
> > > 
> > > The first patch takes the opportunity to cleanup KVM's select
> > > list. The second patch selects RISCV_ALTERNATIVE.
> > 
> > Reminds me, I need to re-submit my patch doing that for the top-level
> > RISC-V Kconfig...
> > For the pair:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Actually, I would like to take this back for patch 2.
> Per the discussion on the other thread about XIP [1], I don't think
> that KVM should be selecting alternatives like this.
> Would you mind if I picked up these patches & submitted them as a v2,
> alongside a patch trying to make sure that we do not clip the wings of
> of XIP kernels by selecting RISCV_ALTERNATIVE?
> 

Sounds good to me. Thanks, Conor.

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
