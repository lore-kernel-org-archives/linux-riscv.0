Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6E4CAC5A7
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 23:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/96z7yuOf42GUW4Y61hidF1D1hfp+wBHdRf/EKj+dws=; b=LTPtUjc4bjHnhn
	LCv8+3XuOgxlMUHAAYsJ8fZUjiu+/kIXfTyOS5AYkcGGS4f/o2OqXE5SPm/tBxk8uAF5bY9yObXLa
	nES9EP6CRu4jmxfpxaUiH8x07MRdMjmHMiGBDSHaHynCDPI7a5CrBh0+m2kWFi8stYqOQp78aRdHk
	d1Txpos251xNkfshIVX7ghVH5yP/b1PtYlu7YQVvktUSV3Y6UFqQ63Qvm5ugH37bhMbBAn2gpcdK6
	SJk1xg7JKQW2fvLBGsnLlXzWLFnjQL/sBB61lOfSZb3ldi0pjcXyxM8HzZuM0V0RjWWntuuXe7Dkt
	s9sBC2Tq0c93/G2cXfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06kR-000000063Gl-0vVj;
	Sat, 20 Sep 2025 23:12:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v06kP-000000063GP-29Ww
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 23:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6661F60144;
	Sat, 20 Sep 2025 23:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77AD1C4CEEB;
	Sat, 20 Sep 2025 23:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758409923;
	bh=Xz0ZO8Amtu9KkICAzIlfDkm862T/8+/a/0h4CNym7TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSGJRckdldKLlEis/93BetnOjwyxMW19G3O1dui2TpdtDhX1ZokF/vQNqxPkr1EBS
	 EUjmr/u+5ggVDPbHclssDZkifMJiasT84Urxw8tZ9MmKluiPyWNT3Vg6LNpf/+8l1T
	 1WimfKmfFmM27WWQ0W3Gq/FZ7VGS5OpPiJI1CXKn6ubETezfAaF8PWOxPEEPDe0ugs
	 sMWPsBjd38bpoB3kP5kAY/U+las7leL4YLwrZkg11qSgG6CU9H/MEmfSpU6XVzPsXi
	 vlrbVJSdY4LgmIKhueVlPD3TWN/peseWpkCEsXFnhpMZyWaYMSqO/sacIjqY8TQivT
	 EgDxHkFieqD2A==
Date: Sat, 20 Sep 2025 16:12:01 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] riscv: dts: thead: add xtheadvector to the th1520
 devicetree
Message-ID: <aM80wXloinEr6srH@thelio>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
 <1ff3fb07b24fb375fcf9d3067aa50583f47c35fe.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ff3fb07b24fb375fcf9d3067aa50583f47c35fe.1758228055.git.rabenda.cn@gmail.com>
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

On Fri, Sep 19, 2025 at 04:44:47AM +0800, Han Gao wrote:
> The th1520 support xtheadvector [1] so it can be included in the
> devicetree. Also include vlenb for the cpu. And set vlenb=16 [2].
> 
> This can be tested by passing the "mitigations=off" kernel parameter.
> 
> Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-4-236c22791ef9@rivosinc.com/ [1]
> Link: https://lore.kernel.org/linux-riscv/aCO44SAoS2kIP61r@ghost/ [2]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>      

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
