Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE77BCD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLj5eMNymqJ9QX+ZRPjiQfvt/2aYMEvphltcYcnVCD4=; b=gsMERW+dQh8R1V
	7bg6PqR7jLzOBPaWCA6dUfDAbVeyQHt0bF0aPGdAC5e8Q52QqZw40SJM91FzW4E5oLX+Mzq0gj00B
	V8D6YOz0epRmEJ9lLDUQl3AVyl7uzF2gCYWAaIuQLFoLsjk2sZAy/0iF2kgZ4Olt9cUUSSZLTahtD
	Kjsmr4/w2YB5tStInbrmsPmSEuZ3iGmDeFumZ3Pt2mYgK1JJrLdFttOx2JSXR9UpeqavdAECfRSeY
	i3Gdnj9sr7gpKMhX0Nhx/3A6c68uh7/MP/7vWJiEhF6tz0LhrwL9pXNHnsRqRbHkfu49gwYY/A9z5
	/+dSGUkCQuWrmORnwjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZA0x-0000000EZ0h-3lRv;
	Mon, 15 Jun 2026 16:18:19 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZA0v-0000000EZ0M-1zIq
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 16:18:18 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3075ce9c05aso8897601eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 09:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781540296; x=1782145096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3MPPoX2HOZ1fi6+ZgFgHzOVUR8qos12VTmnYrcXYqIg=;
        b=fMVyGDglVextC0MyPintXhbGgjt60xE2H8acJcHfKWuFyIFPfYBfqwgSsVYji3/1c/
         lMw9ejKg73SGN0qae27IW0mbEIUkhvV+1+GpxOLisKosDMz0nAhorButlqkuMtzvGGhw
         MF7ytHF+OR7slLD690DCsmpwnSSJrezYlnbt0KTzIipIVFQh4/izzX3K/yujkHWbCFkY
         pePd+2LY5ndkmNzgtunkDHP8qyWhHwXsrS/miQrdfkaBbDNJmhuarztwgUpD5JPEy7g1
         P2kyPPGUpQOk4igNZolm43U4V0JTrVxXeDD9j5NIg6us/uT+LYB/27XxoUx0SFZ633DL
         Esqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781540296; x=1782145096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MPPoX2HOZ1fi6+ZgFgHzOVUR8qos12VTmnYrcXYqIg=;
        b=fds6rq50nSre5Yn41bvSrJNL1YMplrV3yuaLv2TRdQA1UUaBlvzqAwdo7tXqXWUBW+
         jjCWVHgy0HhHLdMQZl71QUQvHIgjFObUcrzdf5R7gPqXWz8ZnDFIiUCgEU2sHLLmfD3n
         hbaFceNC74JuuPRKoMDmQPaQJCMIdKxL1ijTEfML8UhQg9ezC4qcm74U2su+MEQV6Qom
         mn+yVdKN/ZrJxeID9SKNg+PyME7QAD5b9kVDdH2i+8TBAql4+R5qUlQLK4BjoaRIHXgR
         dcP/NJzvoI/0A2Sx2G4hfH6zk3wtP3ZRTELOz6MISTlPP18HXfxchDSj1AMio6DzUc89
         rqfA==
X-Forwarded-Encrypted: i=1; AFNElJ8VZcT4sgo2vbpzwo2WyvZ6EepwTMB1l8QEaiNA9uC451s26WFzzruhhcfpXlrqcXhOED5E6FwFD1Qd9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YygwKuzWRbIGIRr5iM5+20SRzLIReNb+RSmUuKEUf3Z8XXEC+cx
	2kav2Q+2P4kVA7xM+XU75+553Rs7NO84uH3cZ3w3mO7EgyGjLupUb3dH
X-Gm-Gg: Acq92OFAQ45H5QQJ7Gs/KHmo6nU94N0EAoj+YwEA60f5imSgmYHi+Rg34QeYeshuns9
	R5DihJjWC0HJRgkqGdUrnQm6nZGMu+uyb+YlmLHfkarEqSFGt28oq+KGZbgsvPnBx4CbwANcKxb
	1ZWHSwmq7iJgP6MAJbhHCmeOR2c2dPm+H/Mn9ZWMcv7r5KJy8X4cE9btVctCUYXe6nquo3N2hQZ
	LhGg4AEElge5CLmmvFKjlkyBN6R7y+pvakg39WB4+Xn+W3J/JFdlLxuTdNnEjowan3WY/9C6IJ5
	0541eLl6MSCveE7Xdpq4ungPqCrpB1fNCEphE/0kgKpAd5xEh+hir8GTxKdYBlceMknVjUVpKXN
	roaDaK4LgyvDglYCH3h/Nh8JYzrD3PJzgkjDdn0AU6/DXrVyE39avYaexolTuRACvWanushFoAX
	/aUmOF8G4zwSL4enYQhVwoguU=
X-Received: by 2002:a05:693c:42d1:b0:30b:5571:b412 with SMTP id 5a478bee46e88-30b5571ba3emr3834996eec.5.1781540295974;
        Mon, 15 Jun 2026 09:18:15 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5fefecsm15400189eec.13.2026.06.15.09.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:18:15 -0700 (PDT)
Date: Tue, 16 Jun 2026 00:18:08 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, luke.r.nels@gmail.com,
	xi.wang@gmail.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, alex@ghiti.fr, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, marscheng@google.com, bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 0/3] riscv, bpf: Fix signed operations and
 add 32 bit atomics
Message-ID: <ajAlwK990NFUAMwq@google.com>
References: <20260511221648.3251464-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511221648.3251464-1-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_091817_513259_13574565 
X-CRM114-Status: GOOD (  16.42  )
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

Hi,

On Mon, May 11, 2026 at 10:16:45PM +0000, Kuan-Wei Chiu wrote:
> Fix miscompiled signed operations and expands 32 bit atomic support in
> the RV32 BPF JIT.
> 
> The current implementation ignores the instruction offset field used by
> the bpf instruction set to specify BPF_SDIV/BPF_SMOD and BPF_MOVSX.
> This causes these operations to be treated as unsigned or
> zero-extended, leading to test_bpf failures. Fix this by checking the
> offset and emitting the correct instructions.
> 
> Additionally, we leverage the mandatory A extension to natively support
> 32 bit bpf atomics (and, or, xor, xchg) by mapping them directly to
> amo*.w instructions. BPF_CMPXCHG continues to fall back to the
> interpreter.
> 
> As a result, test_bpf.ko now runs with 0 failures, and the total number
> of successfully JIT'ed test cases increases from 843 to 902.

Is there anything else I need to do for this patchset to land?

Regards,
Kuan-wei

> ---
> - Add missing Fixes tags.
> - Fix memory ordering by emitting aq=1, rl=1
> 
> Kuan-Wei Chiu (3):
>   riscv, bpf: Fix support for BPF_SDIV and BPF_SMOD in RV32 JIT
>   riscv, bpf: Fix support for BPF_MOVSX in RV32 JIT
>   riscv, bpf: Add 32 bit atomic operations to RV32 JIT
> 
>  arch/riscv/net/bpf_jit_comp32.c | 101 +++++++++++++++++++++++++++-----
>  1 file changed, 85 insertions(+), 16 deletions(-)
> 
> -- 
> 2.54.0.563.g4f69b47b94-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
