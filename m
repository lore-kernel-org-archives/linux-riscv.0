Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488EDD5AE6A
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kwfpNYxyrGTNvzkz47rSk58P6iqRzQoEg8XuyshUKc=; b=Xop5jS7EQlTTvV
	tItgWw6xw8UhA3SzQ2xFNJGF+LF7xQyRvORPe1du9SUFvW/WF7sEBsG7AF00g9zqW/QEd0sv2oIqE
	16KaSfECJq+Vx+bjiM2FctTgvkf8lWDEPypyV8eGTCPBy0Rlt84wL3YXEKLb1PhzNW0AAABq1GK0f
	4mg0dIllJ9V9hE2vpY6VXXxkrru2UOCsSgx3Zqpb+kazkPc1+/7x1P21jkBGPaIX77zaWSSkmEO6Z
	xfLN3uJ1zJ6dvCRm3sN9BWr2fzLm7lQ3i+C5wZdMwgimJvYMEvT+eRzBpvGueULevnYDQWa44DjqK
	15btlvL7DyqEH3D8oegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8w7Z-00000005r9k-1LS0;
	Thu, 07 Nov 2024 06:35:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8w7W-00000005r9G-0lxZ
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 06:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D349A5C41E8;
	Thu,  7 Nov 2024 06:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20E9C4CECC;
	Thu,  7 Nov 2024 06:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730961353;
	bh=BVm5VeByFaDDVeYK5MYQLd1E5dIfWp+N9ad/3n19vZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5PtJax/osC2JUpX3KoS/uhLi8zLFMwnIcwckAOfQdmRpunLbmAZEPUlLUtW6UCW9
	 26sVN7wuIB6qvULo+jabRYG+qeVYVAhDAZVrC+gqf6kXdi4Qx8jkuuBRtcDDlrR2/U
	 0qaoTA6xT4s8tMTXpjgEwBtyGtSwPINwMG7+32as=
Date: Thu, 7 Nov 2024 07:35:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Conor Dooley <conor@kernel.org>
Cc: stable@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Jason Montleon <jmontleo@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [for 6.11 PATCH] RISC-V: disallow gcc + rust builds
Message-ID: <2024110724-sleek-emptiness-24b3@gregkh>
References: <20241106-happily-unknotted-9984b07a414e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106-happily-unknotted-9984b07a414e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_223554_285641_DFF16981 
X-CRM114-Status: UNSURE (   4.98  )
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

On Wed, Nov 06, 2024 at 01:11:29PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> commit 33549fcf37ec461f398f0a41e1c9948be2e5aca4 upstream

Thanks for the backport, now queued up.

greg k-h


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
