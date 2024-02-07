Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99168C4828D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 01:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=aLv8UOLl5b1MTKx2m34WkMiSGwPJGSt3q8Z4AVWNpVg=; b=t0KfmIBoBIymgelWLla+Jwlq7b
	nkNQeMnNTJQByBf2n1RDrNHmOnIZYrClYgebPR3IvVXWMQcUYtJCQF5voQf9rYnKXznKiJbv/Qxi7
	CMQF+ANbWmFd0VaaCfVOMh0eaE/1yq6qcsjGHlbdlS+Xr7k+4vj2p4ceAN8+6DZfeJfsZkxiHrrJw
	4mEpxR6a2ERf9d1MPXFYkGfwECuJN4B/soaxU1XRvgHR2Pkz1wjGRvg8GblGXBYHoPPEmUmx3ELl5
	zoda66AC2oobsPaic+8tRnqwcLMmvKU1sHPuqjmDj5Xh4JkqdF1a8yYbOkP0eGjbliu2HLPkGB7Jd
	atpZtyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXWMo-00000009JqE-2dv4;
	Wed, 07 Feb 2024 01:04:46 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXWMl-00000009Jok-1gAN
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 01:04:44 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso46148a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Feb 2024 17:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1707267873; x=1707872673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KSJRZP7YuqNoUD4atd7Qd4EMeXnFCJPyzasdn7MfZzU=;
        b=cffcbnjCv880+rSomGMANoikaw4DsocaHHNK/OyV0MHKi3MI6qwtq5TgcHKhBfLg+1
         HCgDLmnuA3MEo0euebtOxP6MQKxWMHKDx7oJ0+78mKWe6KanIzUSVBtiVOon0bFDqpKX
         ouKsqGyD0CCfrkDXQJ1E6SegG5LmAgRnNxVmfYtW7C0X0kvinIP79OFWpu1yeh5SF0jZ
         Bo085OPJeghdj23VihyYCvO5cFOGoUhHwTrC+neqeteXTUgp4OnSpHkAxfvmzJHy+q1f
         9+eufK+SsIPkL5H8M93Rb+Y2r/XDNUY7LzagCKwPCaxFSJg1jibZmLtUpe+kfo7XLVST
         rpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707267873; x=1707872673;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSJRZP7YuqNoUD4atd7Qd4EMeXnFCJPyzasdn7MfZzU=;
        b=iM6DjIymzqwBeuDXsYYpklwz438p/c3FVOfBN6D98FGj6eRGXifRDZVDM2q/pMv+HC
         cqx+wqsJWMIsSGhE8kN7TARdHmXLKIpwG7ZkhZkLszUlZG8er8ZIHy6lj3WglUl2Fhiu
         iIgtItB698InYQRW4QL2vzmWpYYQJn7HCtSWlh9RZ5FY2Ek/rrvL00f7epv4hSBv3tJE
         kYctVeuBQm03dsVaymEFm1s+2uYSXceDFdn+ztoMCGjc2rsvsOTyAhaDomMfOQrCj494
         nKU7GG4YVHH6PAI/ByXDFjlsDVbCc0+Zef4hSKvf7kQ07LjpQt7dYUoPhBHo8Kguep4y
         nAsQ==
X-Gm-Message-State: AOJu0YwL2vNezXBlBQUqzTO0aK/cw5sAZv9ipMLp6vS2de+lKApxzgPM
	woo58NAeI1ASfONQgOsHxK75gOFELQ+cBQomQgiPlPvI4B5eaFkfp2ir7ucepWU=
X-Google-Smtp-Source: AGHT+IEbcsyeWOp+4JdYTl/w+FCuX1Fsyymvn8fUUJUcFSijmo5iCTzMDxF6FQorXgjWWXOLARcisw==
X-Received: by 2002:a17:90a:b898:b0:295:2a35:13b8 with SMTP id o24-20020a17090ab89800b002952a3513b8mr1261301pjr.0.1707267873057;
        Tue, 06 Feb 2024 17:04:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUStYCrR4F6SLcGDQdilqCjiTl+isSJhk9msycAA9AIFOWfBGH7nLE+EP2Q+9bM0HYvysrMJbEuMAt1o4RmLLsAKKqmNiqiO4W9flKqxUsq2W6CiOG3uayyvxdtGWkAgDXi7L/5EHgxs6fDwJ0T17FYXXxM5b0L3Vl2EiVoGHQx2eu8FHmGlmgb8nFLuybkfRJWbAexLNK7WB3ADW1DwAQRp5/23J+d7C163DWM1XGwnTHQTi7dqv5JHw==
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id bb1-20020a17090b008100b002963e682f6fsm2404918pjb.57.2024.02.06.17.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 17:04:32 -0800 (PST)
Date: Tue, 06 Feb 2024 17:04:32 -0800 (PST)
X-Google-Original-Date: Tue, 06 Feb 2024 17:04:31 PST (-0800)
Subject: Re: [PATCH v2 0/2] efi: Fixes for EFI_MEMORY_SP memory on RISC-V and ARM64
In-Reply-To: <CAMj1kXEQdGKzoZjaZwa-SRhnwTwvaR_-SY7YtfKsUfEBc952_g@mail.gmail.com>
CC: abrestic@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <mhng-9698541b-6a15-437d-94ff-3f9e277209ad@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_170443_458572_323E47BC 
X-CRM114-Status: GOOD (  13.26  )
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

On Fri, 02 Feb 2024 10:28:54 PST (-0800), Ard Biesheuvel wrote:
> On Fri, 2 Feb 2024 at 19:07, Andrew Bresticker <abrestic@rivosinc.com> wrote:
>>
>> Two small fixes to enable the use soft-reserved/special-purpose memory
>> (EFI_MEMORY_SP) with dax_kmem on RISC-V (and ARM64, I think, though I
>> don't have a platform to test it on).
>>
>> Patch 1 fixes a trivial integer narrowing bug. Patch 2 prevents adding
>> memblocks for soft-reserved memory so that it can later be hotplugged by
>> dax_kmem.
>>
>> Tested on a RISC-V platform that presents a range of EFI_MEMORY_SP with
>> Bjorn's MEMORY_HOTPLUG series[0] applied.
>>
>> [0]: https://lore.kernel.org/lkml/20230512145737.985671-1-bjorn@kernel.org/
>>
>> v1->v2: address comments from Ard
>>
>> Andrew Bresticker (2):
>>   efi: runtime: Fix potential overflow of soft-reserved region size
>>   efi: Don't add memblocks for soft-reserved memory
>>
>
> Thanks, I'll take these both as fixes.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
