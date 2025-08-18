Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3072CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZNbtDI6r0AX8En6e7D1eQtAXFRgJj0Qu/EuGcoAsY0=; b=ehaDbToInirhl2
	h3aXTUDzstMxYhvMEoMmp+U8Wv7gyayTM0MRvUI7FP9gdyWHU+WZ8iKTNUwIuus2f9KuYjAGqvfzk
	8eZphcgf2wwAWsHaIzWE0qdcU4ET11eRr+W7r1OCLTlRKhZb1MIiftUt+p9hXiii61rMTrNoy+2NL
	2pTIVVJG5EiqrQaMTGXp3LJnzO1usP0zlStSkzJkm7KP9LIxShm9xE52uP0d0XcexMHkAgcdBwPwp
	OSrRh7ZHdmezG6Wm58SAf0ikH1GScCQQNb+RCUnXyzESGpDyn9My+Sny5ZLVvDX2qnzLxLF9bo65o
	vuHnbsHI+CQ8YV+kx1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Oa-00000008j7M-3qjO;
	Mon, 18 Aug 2025 21:28:00 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6YM-00000008dYw-11Ns
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 20:34:03 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e56fc0f337so29660415ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755549241; x=1756154041; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wjJrmy2stspTCrvdXY1WIU0SYuKr2K0lvsiwRgTRkkg=;
        b=O906q9GOSs2YmflroXXGZtVfqHJD9ePDowWynUo/mx3b+9r5sjpMKu4bqW47kBf8aD
         ONUZWhjJPR24oR+wG116z6OTF8DAdqZc4T5HlT36ZIGXCQpt1P65LkQx9u3X5ruXorLU
         HVLDhnsoN8Jr/YIMOJAxobt2Qz74W1adpwTNzElfBLdjW2FfT0qlTk3KjBkG0Gc2FIEB
         yjDRejWNyAcysBzwKCOXr2ADUDza6MObRJLNRuKy3bnuBtHtRCTbNFSfATdZabrGRMBq
         kQ/w6vrrgSC5Mii2SzxgWa0DUpmw95Qmg6aX2shDhWatX8ii9Di/QrfXhdEcsyZrLZDU
         Uf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755549241; x=1756154041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjJrmy2stspTCrvdXY1WIU0SYuKr2K0lvsiwRgTRkkg=;
        b=INTWkUJJlpq1J+qIUEcT513otxrnx1Ca/X+SyvocyIbNWwh9fL1TATA0wI7TNEF84/
         Q+fht9F0PnpihFIUlGomPgv0xrNpCPA0itvivKi0KAy8DQ3aqs3Z94D2m1L2QFFPpBEC
         EYxgUclWWelyFSoQ/2RaYDxN3iO4xAm78V5AeAFvvWdJDAFjjjqMN1gsaLF66ux2+nYN
         Y398kfrPWiz/+wQAIgr+nbCQnBcpLxXgrGy0gBJ4hACxyFpmMy/3RzOMrbH1/mu/kdan
         OpcW4x/ucvlTo+tZyyJfs23vEHS+vURZAe9geaNzT7ZK9Q2R+gybX+ZTaJ8W7ISFtZAy
         r4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7YLiJYyQt47j+lxdo8MHV8PUkN5Ru4qVhM3LZ8YcrlhYnoQZhSP0INMemGBaq68yYdhR9fJ9kxb/FRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9wq61JtG8cwL0ALg6XLqtf/PP6O0s7Ya1GL8E8KzWzqsqmVxn
	OHmtYKa7hcGPjSuSrbjqmqJzpyMGV9qjEuuLE5PBLVAu8/E/euHihcdmmG4i8eOvdTXIhI3IhrT
	Af3k0vE0=
X-Gm-Gg: ASbGnctMoqYTeeSBuSbS9DF9evaGqQbpzOR3CloBHWIpknudUyCEdxnygFZto8uIoaU
	/Fhu11hVAdXFn0VjNC2AIWsi9uuIoBv6ci+0g2gqQwSzPbOV7ngA3+tbBR72s0wjACoWFBLxtPo
	HWK9YXuvWvZH+ZKkltRBk+7ZvCiodO640Ve91PnpPrWm4xzQ+e3byjwlOHlH+uvZcYu98O5yJX4
	IKtgQlxclw22y88qM/E+AcWLuO36u8+kZvm877GxWm4voEFx6C33s2pE2UAaDKvrnmVBWesDVK4
	2Rqpc6LwEe00q+D8TpYv6MoZGHcsDBIg0FnVEr4NDPcy5236xnKbzxp6REJz3N4MeowTQVVqZkd
	W8jVSFnXUNPVxG/XL58+xZX+d
X-Google-Smtp-Source: AGHT+IGRTgu1GwXkFLnvLr28LEmoS61swGqzhfNvkiuvx4bYf7qu9UcnEVK45d2zFEeHx8uZ9BB7/A==
X-Received: by 2002:a92:c267:0:b0:3e5:70b0:4f9c with SMTP id e9e14a558f8ab-3e674fe559cmr16147595ab.6.1755549241100;
        Mon, 18 Aug 2025 13:34:01 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e66c6b0b12sm13099125ab.25.2025.08.18.13.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:34:00 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:33:59 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] RISC-V: KVM: Provide UAPI for Zicbop block size
Message-ID: <20250818-8beeedd83482f6e618be2ea0@orel>
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
 <befd8403cd76d7adb97231ac993eaeb86bf2582c.1754646071.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <befd8403cd76d7adb97231ac993eaeb86bf2582c.1754646071.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_133402_282146_DE849F20 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, Aug 08, 2025 at 06:18:34PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> We're about to allow guests to use the Zicbop extension.
> KVM userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
