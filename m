Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20655CAC58E
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 06:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=It2qg8egcG1t4JUI/v50LPnutzYi/1gpnlgzGa2o5CM=; b=NmwRFgceJfgQVt
	TGyCn8UM6KQqWlEgLVgf459XeK4BoDO+5Bb/9TEmZJcepxhn1xQX8+n6styL30mG4ZDe0rC/6SbY9
	UUCB0eKQQzu/5Vot1Niqu36PccN16nVwsLhbEQfs17KhPIoAKH03r9iQ5ix393NRgT7gA+8FQzsWI
	oCNPwGFaiBmHLx8yj723I/DcCrSR/X9YztXqD6xe+S980jIHVvQqIlClox75SpLH68QYlOnZS4pZg
	fxXMbLposSv/i+jLBkyW+woT58Yq7G3nZligSqrCjfPH1AlUT5h4qvZHaV8F4F5okGxxv4aJhrn/H
	9oanQRBIuhhwXXsfyTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJRs-0000000DTH1-41F4;
	Sat, 13 Sep 2025 06:09:24 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJRq-0000000DTGB-1o6H
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 06:09:23 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 066A550666;
	Sat, 13 Sep 2025 08:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757743761;
	bh=e+IBdPHcalkLVr0ILXmN6MxTFPHTEVoUpqfQoXNQ02c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hyiM/gT9z2X1FnjL1mKyYYRxHOuklAHJHmK3jom3ihph6Bu+zQ6TH+5p4QXgiB25N
	 ezP0e9SRPGYH8HQ+EUjqeJWs34cev5Lj1kcxiThaaip1zyX3y8Gd5gD/Yqp7hlitqQ
	 ZrhNt3+0jnZZqDKf7mh4tpAD+g/sbJ+e9yZqOJ1xB6sa2yG5T15Q4yPcnxNjqTd6Yi
	 2kRaGRN0RJFV5q4l5lsbhMz2nGCSgo90Bncu6VJ8F219SMaTOOTQv1B8ebUl1AfrEu
	 dApyBRiNAqndSiHBK2VeFOdYgR+Bg9CX7isS6cIQY1RSPo1p9DFayUuUM1h04nLbRI
	 XqgY7XakV4rfA==
Date: Sat, 13 Sep 2025 08:09:19 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: linux-riscv@lists.infradead.org, tjeznach@rivosinc.com, 
	will@kernel.org, robin.murphy@arm.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Subject: Re: [PATCH v1] riscv: iommu: Fix irq failure due to idx mismatch in
 icvec
Message-ID: <fpyenwjlw4fc3z6xk3jvra6qxvonu2qfvyl3g4pzvnlfmjuatn@jzegah4d2omz>
References: <20250910095430.93868-1-guoyaxing@bosc.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250910095430.93868-1-guoyaxing@bosc.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_230922_616507_8144CDD7 
X-CRM114-Status: UNSURE (   5.49  )
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

On Wed, Sep 10, 2025 at 05:54:30PM +0800, Yaxing Guo wrote:
> In icvec, the idx of civ, fiv, pmiv and piv are 0, 1, 2, 3
> (According to spec 5.27). And usually, the interrupt-names
> property in dts riscv-iommu node also follows this (In qemu
> virt machine follows this) which will cause hardware irq
> number errors (Especially when using qemu virt machine to
> start Linux).

This sounds like the patch needs a Fixes tag.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
