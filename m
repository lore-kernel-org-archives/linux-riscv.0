Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11B8C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4Rr/dkgNS+SAnQ5V0lkwma4ccKLzNZ+VXKzAJZKus8=; b=dGUPGVorMFs3zC
	+XhYdTJdCy6KGzYfP4kQGgxaL1P3b33S0jtcrM6FwRX8Mp9hOTOxwt7f3cuAXdTawYi+a920jhFXv
	GCgpx08MWjlb+RXGdmh/NEZkVYokYbk/+zp16UuqG6hJoJ0NEkZ/AS6yKxGYQX3iAjauYSNS2ynNE
	pmNQcXxzlMnhPcNIsq6KGERxyAhXYeoB/PUR1wtHZI9m3L4iTTTCv0zIBuIahUsRRFOjfy3X/RDTK
	KQBQ72LzOT7r7/hAa+ufZAyIr4ziCzTrmafOSxXtDkboscMymv5LO7xkMekEn8994I4ZJ68k3ECUf
	2N7ZC/Z5OiHQD/coGoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFnX-00EaAF-0O;
	Mon, 03 Apr 2023 08:44:19 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFnV-00Ea91-0a
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 08:44:18 +0000
Received: by mail-ed1-x531.google.com with SMTP id t10so113988624edd.12
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680511454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bo4Kh55NPoZNDEs55iiMa2VaQMiKh1GEZppniETDTdQ=;
        b=DeVMQ+mqOgyHAFdWNlxlUKRQbmaWxS4oHLa0DNQNDHcuB9Aznlh6j73OLWloGV9bPy
         pH0HpKuvlzcTYF6wQXpfVJC2svpyUt7AFdCJF1MMoFSsvrr4TsEX/e3Z590Y1A8gOt4E
         Cr1YOVNR9ZA0ov5swgOWYbyKzoKmt1XJyGPMvX3p5RoF01aebn9R9AamX869Bm/+czTn
         qjUZz0UDun8aA633TUMSITrP3GWMMi51jVMunoHpnUZ99aBm6cxemR5Q5Zifc3LSsQjp
         abHJ9+ldNFn9bffRw03hxOs3t3yXETGXW9qN39qzpTXZqJWQX/TLm6GoslOePacVxKmc
         perw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680511454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bo4Kh55NPoZNDEs55iiMa2VaQMiKh1GEZppniETDTdQ=;
        b=W5i+UtpDS1CzfO+g5u7q+Pa1AVgLu178lvDf6rnjoLw+WIbQV0pM3/tVCenjZ//Kc7
         ZrrxQ/d3C0iHE41APBopN0wp9BVXoKRcub1Sao8PDnBNqrmeEblnXWiI0SrKY2oG1/RG
         dnqe5Py3lYcEmy0a/4xj1wpO3wEsJhagKYpI91t2QWRBKPcrh1jUhryRhf33dfb06VVm
         La8qOlzM+xPj2lChTvNplD749jYnfAHyWYIDlB5unSDAXuibvgVykocyrT1p+Xu/cCp7
         /+lIc7tV82aIcbJGL59sjCFOZFMT5ksAL+25CBJQpXU22YZh9zkBiD4inroExAmrx39i
         ibyQ==
X-Gm-Message-State: AAQBX9d+mVe4ubU8+66AvyiB3dczQsJae+nCDHunkYdiNKuwbMUTUcdF
	Nh0rmWY6v5LsR9wQXIn5/VFZlPvYU01Y7HJJBzc=
X-Google-Smtp-Source: AKy350aPFP36tSb/JUFTn4VSgkNpFvPQudYJMIYMT+Ui1cBMS3QuLwI4zlUJxHho1zodmQ2/OgzrLw==
X-Received: by 2002:a17:906:5d14:b0:92f:e7e2:b7b3 with SMTP id g20-20020a1709065d1400b0092fe7e2b7b3mr43452702ejt.5.1680511454672;
        Mon, 03 Apr 2023 01:44:14 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y20-20020a170906519400b00930569e6910sm4308835ejk.16.2023.04.03.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 01:44:14 -0700 (PDT)
Date: Mon, 3 Apr 2023 10:44:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Allow Zbb extension for Guest/VM
Message-ID: <mhrkfb5qtqlmzvivljo4y4o2ii4r6ucjdyeq4orn2gxpbrxzel@eemujnzws5xt>
References: <20230401112730.2105240-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230401112730.2105240-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_014417_222319_B8B1988C 
X-CRM114-Status: GOOD (  10.15  )
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

On Sat, Apr 01, 2023 at 04:57:30PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zbb extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 2 ++
>  2 files changed, 3 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
