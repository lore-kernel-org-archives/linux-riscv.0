Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403D3C83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 13:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcId368zMrzQYtgFcowFoS4yRk/nr8a76Gnee8Nxd+0=; b=HP67n5A5xffSBv
	t13KN3M33Qio0aG31qj/IXj7bydvcN/5q0ZEDtrRWJqe81pVlDMV+1VwXPYhvmhBrBGRCynFD28NU
	B5kls+525JhSMkHNvx0ABEqwxabY+OjRKxplk60cajhjxb0G1wozUQAAoOMiXi90wMS8JkEC01xPU
	VbL3jgYWvUk7sfZGgn2dM8jKqXzy6G2jMTk5iC3Ak0s5fvS2GnTfgDzg57DCrvy8fmwd83mj3cCFR
	zPHRAriJnMKPPuHAio5iglkjr4eILYj5XuU7VfPYcEQlkEyJWQ5MWYOjCsLDg74sXZ5wJP4ES23s5
	m0TWWH1OgK8BlZP0Uuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOU5-0000000AEev-3O0L;
	Thu, 17 Jul 2025 13:17:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNSj-0000000A5E1-44yM;
	Thu, 17 Jul 2025 12:11:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F613601F7;
	Thu, 17 Jul 2025 12:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663D5C4CEEB;
	Thu, 17 Jul 2025 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752754305;
	bh=u7SEQClQAB7gDVI1zZ2Aqc9od3vbr6CRMh/fPM8fFwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Qt6Z4X11YhogWwmPVhJNTezRMtYrXrmvZKzpaNeXXzrRKVkm27yaCiy5/7CxAvjd
	 YkN/PYtnuacWtPoixP/hG2zdXON89AXUdXcpob0TSY8888tb0EIehkEW0RBPkmwf/I
	 5rwizpj+UPQM+PsLiZ95EScAmEzGwG7w2hBjdInI=
Date: Thu, 17 Jul 2025 14:11:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <2025071716-phoney-object-1648@gregkh>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
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

On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> Something that's been bugging me over the years is how some drivers have
> had to adopt file-scoped variables to pass data into something like the
> syscore operations. This is often harmless, but usually leads to drivers
> not being able to deal with multiple instances, or additional frameworks
> or data structures needing to be created to handle multiple instances.
> 
> This series proposes to "objectify" struct syscore_ops by passing a
> pointer to struct syscore_ops to the syscore callbacks. Implementations
> of these callbacks can then make use of container_of() to get access to
> contextual data that struct syscore_ops was embedded in. This elegantly
> avoids the need for file-scoped, singleton variables, by tying syscore
> to individual instances.
> 
> Patch 1 contains the bulk of these changes. It's fairly intrusive
> because it does the conversion of the function signature all in one
> patch. An alternative would've been to introduce new callbacks such that
> these changes could be staged in. However, the amount of changes here
> are not quite numerous enough to justify that, in my opinion, and
> syscore isn't very frequently used, so the risk of another user getting
> added while this is merged is rather small. All in all I think merging
> this in one go is the simplest way.

All at once is good, I like the idea, but:

> Patches 2-7 are conversions of some existing drivers to take advantage
> of this new parameter and tie the code to per-instance data.

That's great, but none of these conversions actually get rid of the
global structure, so what actually was helped here other than the churn
of this "potentially" allowing the global data variables from being
removed in the future?

So how does this actually help?

Also, small nit, make the function pointers const please :)

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
