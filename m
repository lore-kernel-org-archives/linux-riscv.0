Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8512FC3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 07:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8slwLF5AeEAC/8p+IpjYRJimocW9xxuugeiDcoWKWw=; b=n2MqH2fRTIHhgl
	k7N/U/qN6haOPrtX/TJ1GHDcLDa2ufB2GgDtlS6czMYF2z7GjOC3Jbql7W+XY6StTiemEAONwaglM
	M7Z9R00BMQb6rtKhBsw0PA/E2r2LxamsmRU9Zo9bRMko/1KjFKI1FPNt/iWZueYLpUzKONPa0xC0R
	z410yIzG8iTjC+7v6FhJxw3mA87cSm9NIfKfAoW2ksf+UAIP1VHZgKlq9Wn4AvokGyYEH97sT12lj
	ku8H/ZCDK8vYsbIcqO9U2frM+QSzxqni3AId7bLLdLFDY+33DGEVKMiGqKQMZuBnU3qbnjRWdj5wr
	J5I7bvYNLZPCp0TngI5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6bx-0000000ELYo-1NGL;
	Wed, 14 May 2025 07:33:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6br-0000000ELR3-0qCA
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 07:33:00 +0000
Date: Wed, 14 May 2025 09:32:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747207975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QiAs9qwZxdaMkFWgaAX5QHub300Q9rn/dWhw8ecB5i8=;
	b=zZ1Y+KR3f9reK0e6AWlIM89ueIKeeUriQQhjXuKfC8Fohyt/5xnZbw4hmi7EwhCOIR1Ilp
	Z8pf+jBdP+lRhQVzIhM4POPP/hYFmBwxBWyh6pugFc1hcGjCknGme/eNDcjv1EfRhhCVHl
	Izp79zClj+KsHodDeyLV/5qpbL2onQaM1kzIbS2vykmDdmaTADgWUHCCNsIWf0itxJXynz
	WtvrNcI8gxZk6MunGdr4Zcx8u5rqV/T8I7rxMxnkZB7QL5MYeDOqZrcbgFR4JPb4mjJctN
	dpOe9rjl4sY6qR6mVcDCj+S6CcakxIj8kYzscZ+DkKbOMgRlab7moUX0uzaLJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747207975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QiAs9qwZxdaMkFWgaAX5QHub300Q9rn/dWhw8ecB5i8=;
	b=a95thXnBNsDM7TEDzhWYa+hVUnNxG9pTzI1bAgsXPxKhIT+Ux4o/V0jzYHfy2QI++ecUro
	iAWGawF2SDtzG6Dg==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
Message-ID: <20250514073254.p4PBBQuh@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
 <9b528d3c1de5291d1540b3617e63d40b9889c88f.1746997351.git.namcao@linutronix.de>
 <602a2de6-3b6f-4fc9-b50d-90539361c50b@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <602a2de6-3b6f-4fc9-b50d-90539361c50b@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_003259_379375_E5A093E5 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

Hi Alex,

On Wed, May 14, 2025 at 09:24:55AM +0200, Alexandre Ghiti wrote:
> > +#define RV_EXTRACT_RS2_REG(x) \
> > +	({typeof(x) x_ = (x); \
> > +	(RV_X(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
> 
> RV_X() definition was inconsistent across multiple files, so I harmonized
> RV_X() it in this patch https://lore.kernel.org/linux-riscv/20250508125202.108613-3-alexghiti@rivosinc.com/
> 
> So here you use the "old" version, would you mind rebasing on top this
> patchset and use RV_X_mask() instead?

I will do that. Thanks for the info.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
