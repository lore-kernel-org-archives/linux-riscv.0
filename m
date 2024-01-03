Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1E6C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMeqc1wnmFL8sv53ud24ibGzAkQdTCEPIB0vUwenuTw=; b=RQRYVD4ezEfHX2
	9rqO55GxIgK4fbSbtMCQSkSZ95K4LwAu3ezs6y/z775R6Vadj4fSPSje6x/fQYve7GOw9i3czB9y2
	xngG+cTd6AkDzCzZprB2iusdOW6JM3v2UTH3Z6CZMdKUiC4jJ0EdaBbc25b4OWxNc2Q/xtm6WtCYC
	i9EiNM34/aNi0a8bWY6690hqJTma4h9iw92XudpILKEi/3fbfUPAS1eZ/PdLjKBleNSW18HYu15II
	Oq+gMVBAIulu/lNmfKitbz5WGLM3bVS2mJE8GVVDxnIUEBEuWY/xRPY5Doa1tio8T2fBsPKYSdeGL
	cbq9FZ74Ywh+3isUOrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL30s-00BESe-2X;
	Wed, 03 Jan 2024 15:18:34 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL30p-00BERY-0u
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 15:18:33 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a2888d65f1fso101916266b.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 07:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704295109; x=1704899909; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x58X07zwjYU7cKHRzjg4ENbbksPJOwVkc9czaYIAXnY=;
        b=AN16j1DzNm9yLpMwEiGVneOrKVMTiKDb0eCH3au1MHbfHXdEAU9mgmRpCz/Hmcru/c
         pgjFgNNiFX/Fli1RE/+KMUHHg2YEOX2z/zvQe/kM6ls0102ndpJEid3fEq8dhpyFWgKH
         2cpSua46D17ayrYK7GXv3jcfOnicxtELIfz8KushAz0O1TNpC6XKqrSEDP5/oRNDSsV1
         rFYimEn64ejwwNQ1J7kFyM5Lagfcf/b/fmlh1FlWzgZxrEaDhqIU0Vh1qXjSC5Bkqi29
         1luS9j+4jDJ5kxL1IxXogIR7oXuPJhklhfGTXSPw+PAWGCtTYSFVK4Ldvd/MI5+BL35b
         Psnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704295109; x=1704899909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x58X07zwjYU7cKHRzjg4ENbbksPJOwVkc9czaYIAXnY=;
        b=wHMpc147oHbCg0gzJpGQ80XruXjFo5fIiIl0reTBAWhxE5jSJtlTm9b6QWqMKLeKGz
         AI+ypSKvu/sTsnDXFGY6x4OTV+x3YPiuZkAJ9DGpZ1htuxUznaiSThBAySxZ/8O18sJw
         AjChtJMJHvZUpooSCqj1Hx1D6YFPrPSpeBuHqho+df7ge1fn+HOwmJt2AVnQrajgBDBh
         C427FEYAGAHwYfLakHcx6BW/9fWFigvVJWfDmvZp5dMvHuPt7bczBPSp9rKGcJPlfznN
         EAfs4xNJgSUOSJFk9fHWUbyCJfpuioUUjJVwgjVMiQQ1B0TV9WmomgTcRFHSfxSihPc8
         YbjA==
X-Gm-Message-State: AOJu0Yz0Y2mMowtIJYlsvrHSRj+oFqDHCzGmJWT6vzXNBRUeaq1rhNp0
	erHxwgLvsXqkxdj4F+4rUwF1Cycc2+aitA==
X-Google-Smtp-Source: AGHT+IFvaCr1M0YJt2eVUUY9JaIAd7GjOQgEzJfEemGQkJ002T1Rf88/GWTw0XzPMNRZwYC3tYhoyw==
X-Received: by 2002:a17:906:52ce:b0:a28:ab0b:fb56 with SMTP id w14-20020a17090652ce00b00a28ab0bfb56mr392021ejn.106.1704295108657;
        Wed, 03 Jan 2024 07:18:28 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ez21-20020a1709070bd500b00a26ac88d801sm12144793ejc.30.2024.01.03.07.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:18:28 -0800 (PST)
Date: Wed, 3 Jan 2024 16:18:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	KVM list <kvm@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: Re: linux-next: Tree for Jan 2 (riscv & KVM problem)
Message-ID: <20240103-d2201c92e97755a4bb438bc3@orel>
References: <20240102165725.6d18cc50@canb.auug.org.au>
 <44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_071831_333538_EFC77F52 
X-CRM114-Status: GOOD (  16.74  )
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

On Tue, Jan 02, 2024 at 10:07:21AM -0800, Randy Dunlap wrote:
> 
> 
> On 1/1/24 21:57, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20231222:
> > 
> 
> It is possible for a riscv randconfig to create a .config file with
> CONFIG_KVM enabled but CONFIG_HAVE_KVM is not set.
> Is that expected?
> 
> CONFIG_HAVE_KVM_IRQCHIP=y
> CONFIG_HAVE_KVM_IRQ_ROUTING=y
> CONFIG_KVM_MMIO=y
> CONFIG_HAVE_KVM_MSI=y
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
> CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
> CONFIG_KVM_XFER_TO_GUEST_WORK=y
> CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
> CONFIG_KVM_GENERIC_MMU_NOTIFIER=y
> CONFIG_VIRTUALIZATION=y
> CONFIG_KVM=m
> 
> Should arch/riscv/kvm/Kconfig: "config KVM" select HAVE_KVM
> along with the other selects there or should that "config KVM"
> depend on HAVE_KVM?

We probably should add a patch which makes RISCV select HAVE_KVM and
KVM depend on HAVE_KVM in order for riscv kvm to be consistent with
the other KVM supporting architectures.

> 
> 
> The problem .config file causes build errors because EVENTFD
> is not set:
> 
> ../arch/riscv/kvm/../../../virt/kvm/eventfd.c: In function 'kvm_irqfd_assign':
> ../arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
>   335 |         eventfd = eventfd_ctx_fileget(f.file);
>       |                   ^~~~~~~~~~~~~~~~~~~
>       |                   eventfd_ctx_fdget
> ../arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   335 |         eventfd = eventfd_ctx_fileget(f.file);
>       |                 ^
>

Hmm. riscv kvm selects HAVE_KVM_EVENTFD, which selects EVENTFD. I'm
not sure how the lack of HAVE_KVM is leading to this.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
