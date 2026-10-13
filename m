Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BA5CC6B03
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r83F7VI/CwNXbxZkhTBrE7tZX0FpSR/+iOgRqghSeOk=; b=cGHgfsucKZ9rMo
	aJ/pInl/6t0OIwpNA06ochg9muVn29H89mgyPwvcgMI5GxCrzc4ezeqqx1F4LZ5D3MLbvkWDl8Ltj
	OCdkRu+cnlrhJOjRar3cO36Klkr6RXQD+/9xVEmcMV9bptE7iGQZeQGcUqAPbt0YLXbENvmcQ0+AN
	BN/TRvcj/Ki/1TH05j0q2z7+T6ttTFWm1cRWUaR0tKQ64bfLHDH+y+UBCJKwVLRkykzEHgQcSLMzS
	FycC6Tsm9mTDQ5mVwH/68dzcE5Z5XIz2vjgMwcKivtfK4keBfXxxn0dSlfAnSxE35/OlPEVEcblnO
	VrEhP1DcWz4Udiu6iYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcCj-0000000CuYJ-2tOX;
	Tue, 13 Oct 2026 13:06:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcCh-0000000CuXs-35vZ
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 13:06:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0941743BCF;
	Tue, 13 Oct 2026 13:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F8E1F00898;
	Tue, 13 Oct 2026 13:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896762;
	bh=PBDIE7GzvCgmpzvw/ZsA/sK1+J/NGCAntQXTexS8NNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HtVuTxt5ErtMpkbGfGL1xLIGCDowIsKArOzts/S2GWDBpLTkyRokZua5XIMXtIyN8
	 joW/wMnxEDjwJ9Ql8CjM5dQ1hmqJCVRZdPrXeXIw8UAGd4Q/Ac5VnzFG0KRbzT6K0j
	 wBimQdDybAaZET/8ngiJ2W8MPVOlk4tL2F/GP6h3BY0+8KcwLLB9+2DPmnXtcNnf+0
	 wCEebhHPs6C/E6DwycpWYFa+I43PekwuhQadbpbXjHQS2GRO51zrwf3eJ7ikY7sEDc
	 gewbugUHTN2eT1YpuzoMfNMkytyFiUezZY4cS3IOWATp7/5XPTK7Pv2ZjnH6L5bQlQ
	 s0FnovQZYsipA==
From: Miguel Ojeda <ojeda@kernel.org>
To: gregkh@linuxfoundation.org
Cc: patches@lists.linux.dev,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	stable@vger.kernel.org,
	yongxuan.wang@sifive.com,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 7.2 046/281] RISC-V: Clear HSTATUS.HU on CPU initialization
Date: Tue, 13 Oct 2026 15:05:51 +0200
Message-ID: <20261013130551.12527-1-ojeda@kernel.org>
In-Reply-To: <20261013112856.169944981@linuxfoundation.org>
References: <20261013112856.169944981@linuxfoundation.org>
MIME-Version: 1.0
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

On Tue, 13 Oct 2026 13:36:02 +0200 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>
> 7.2-stable review patch.  If anyone has any objections, please let me know.
>
> ------------------
>
> From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
>
> commit 6694612317e5225086e39ca1ba97ada2b1942e48 upstream.
>
> The RISC-V privileged specification does not mandate HSTATUS reset
> values, leaving the HU bit potentially set after hardware reset.
> When HU=1, hypervisor instructions (HLV/HLVX/HSV) can execute in
> U-mode to access guest memory, which may cause unintended behavior
> if not explicitly controlled.
>
> Clear HSTATUS.HU during CPU initialization to ensure hypervisor
> instructions are only available in HS-mode, preventing unexpected
> guest memory access from U-mode code.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Link: https://patch.msgid.link/20260924-hstatus_hu-v2-1-7e970f5f1d8d@sifive.com
> Cc: stable@vger.kernel.org
> [pjw@kernel.org: capitalized RISCV_ISA_EXT_h to fix build; added stable cc]
> Signed-off-by: Paul Walmsley <pjw@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

For riscv64, I am seeing:

    arch/riscv/kernel/cpufeature.c:1189:36: error: use of undeclared identifier 'RISCV_ISA_EXT_H'
    1189 |         if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_H))
         |                                           ^

It seems it is missing commit

  0c5a9ab5192b ("riscv: Standardize extension capitalization")

Either that or manually tweak the identifier to match 7.2.y.

6.18.y also breaks for the same reason.

I hope this helps!

Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
