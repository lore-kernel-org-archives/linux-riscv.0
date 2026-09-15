Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596C3C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 06:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1fBfwNn4WBgeEbYwisOFmzUJrnUfGv7Axphz0r/11I=; b=hqERfECMU2DNdF
	i9Os08N4s3P0ggJOZtCQ2o+Auoe03K+aZ75iNpwSCWTUjAZfDrYNBDYNxRGR8PNkDyvGRANWUSmSs
	f4qxychE7cVIsT4lqOzvdXfscOWAIrDzwuUGmrjProHMn+Jl8kER1+d5eWZYSS8o3JXpoy8/S8h3k
	FMDaCZpNTLlNQl9E73sTjF6a+eWN3ZNsRKSCrR0b5DQPS1RdJJrQWBir1v/6XSOsIMIxX1AoG0b17
	xaKogxl+bz6x5gUqFEKPCMa7BpsSggQLTsA/wqU7pI3xkx4+zCttlrFkRPCWIrL7AeR04htpKH3KY
	UgeT1pjzFNdpf5q/4lKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MWt-00000005L5t-36Xf;
	Tue, 15 Sep 2026 06:20:31 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MWq-00000005L5T-3Y7Y
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 06:20:30 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-398a5aad413so4051876a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453228; x=1790058028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lvj/QENaps3fa980Av3u1jYrzQua2MT1zXpRDbfcu0U=;
        b=O8vMrgM7wCTkN8k8QDFuwRvCXNKykzzZGmFJbN9YY2jsLd2qWHBRl+5m5SIPUSo26c
         2k0wD1B1fRFlzkxXE3taTBeImokihr/SSm0JLAyqmtSlMAPdX3jtF8d5uJBQ0oICz7xh
         vGi2DgKZ+GC9pyLrDI9QVJXV4E2Ol+Qj9bIrLgejWdI/PcpBFrFnyU+IpXkw+xlMUBTE
         ValwZvv9XFYrrB2EXOXH2BIfbubOrQqbr7tRvuY6esGg5otbeiBk20ET8WGAFp80zt30
         M0J8OUzmdI9pjtFRbjuRsLBRpP0ZKhCuw/CFhEujD9c28vjH5G86ORrMc3DFkAi2wQhk
         2l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453228; x=1790058028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvj/QENaps3fa980Av3u1jYrzQua2MT1zXpRDbfcu0U=;
        b=m9K6SWRKqNKGd+hur0C4gT0teOcLvwdokgu6b4PshVDJzTS/TZhA9mltVJ2IivDPMe
         sjReYWgxugWPa6g2MAgnyqN0ijDI+CYkXugwDQ5KBnJdf2egw3t5F53bMYvP/rBcgcbJ
         oFmQ34C/gmzflX7oSfFnv6t+RT8501jV9sbpqq84I+4vqjDOJW2BosapvG8xd9pcVCRH
         BL9RhUJ627tK78/ADL1MTVBMy+mXxOF+82VYkXtmXALeM5tVKALktI+LAT/RKdHofyb8
         Q50viN8YBXJmaWQLrsXfO/LWoBkg2Gafwi0Ki5da2zxVsh8gVMXzGmq9oNg0JmJhtdt8
         cgzg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ0aMI5zlgRcbHuNAGx8N/L+B4TCDjUJLVUWR6VPyzM4dluqe6rC+CavyYpUVy+EtgqbLpDW2z3Z8WFg==@lists.infradead.org
X-Gm-Message-State: AFuF++m8x1nT1A0N7x/N99MQRJh2EzzJFfD11zKFGcRDwnTq0WaO3EL6
	qtAwR+GK3J/9tNNNj5EduA+aywJ2zvy1j3/Hz6HpzX4t+ua6eMt+EAzT
X-Gm-Gg: AYBFou343msS4AOxhS+xNTxt0oeJH57xPrDoR08ng7Juz9ALH0nyhP2AibZ8zE6ThCO
	XSpQmUYCqdFgwrYw0y4MyDfojGaEaJnq3S4f9YYJoa2LNr4DD7BdxAuD3uPDkkp28iP6wlaUXsj
	dXeSgLfMopeUvPfF2m10XmhuSDFLYU42Orx24e9vEOAMnS7QQqgLMCaBXiFwhkN7XOv6QZD7NFG
	eb2+PaIa6XBcZE4g8AK31+8SjXnIB8aT1rUyYZ90B3PVpnkRmgKMY/f7WE01mTZ8OAABCd0KulF
	LfvlxHLYIP2PgoX+H5BMRVUsuvvHIkBNbcKK2kHhOFLK8Bh+FD0gjEQaYjHLjK4MjeknNShJuEr
	RrXf47xtEpHwn7QM62pMteRZLF6CPrbVFKl03ZCPpEhWkqQCEotptnOUoF3QgUZxbykGzO29NQl
	MZWniIr6Hc1ICTifIijNnpiSAwIAH21/vUnLfWsUF/9aeeNtKMLcnnCS+OdokypIgPGl0IMLlQH
	ujZF8MT31S9fnGecQcEgLc/edZoZVOKp+ncSMz9b+8=
X-Received: by 2002:a17:90b:17d0:b0:39d:c3bb:98e7 with SMTP id 98e67ed59e1d1-39debfa60f6mr11787559a91.6.1789453227707;
        Mon, 14 Sep 2026 23:20:27 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm3169047a91.10.2026.09.14.23.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:20:26 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:50:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, ynorov@nvidia.com, ecourtney@nvidia.com, 
	joelagnelf@nvidia.com, fujita.tomonori@gmail.com, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH v4 1/2] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqji0ILj4gkDnkry@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260912065902.24017-1-mkchauras@gmail.com>
 <20260912065902.24017-2-mkchauras@gmail.com>
 <DLDJ7TNEH9MS.2I386V2SZ5QDR@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLDJ7TNEH9MS.2I386V2SZ5QDR@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_232028_891764_0311537F 
X-CRM114-Status: GOOD (  10.72  )
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

[...]
> From the current implementation it looks like making "1b" a parameter doesn't
> really help anything. The fact that it internally rely on `2:` as label is still
> hardcoded.
> 
> I think you should either make the label custom too, so you write
> 
>     "1:	twi 31, 0, 0\n"	\
>     _EMIT_BUG_ENTRY(2, 1b, file, line, flags) \
>     ".org 2b+" size "\n" \
> 
> Or you should just hardcode "2" and "1b" and document them.
> 
> This stucks in mid-way and is arguably worse than either option.
> 
> Best,
> Gary
> 
Hey Gary,

Yeah makes sense. Lemme refactor this with labels as an argument and
test it out. Thanks.

Regards,
Mukesh
[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
