Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B47C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOEYRQBDMBAn9RY+0mDx52nfvEod+x2hRLSVnbsers0=; b=sGxyMatSapQTNJ
	PcXbdFH1UVd9j8X0ZlZEkEgdE+gfxMToKYOugeUKmDYlTcxmaZML9G+l9d8V/o1ayNiYM8M7f+kYM
	R5NLC26y1S70AhxYG7W1P2t1/PM0FQej8gaiNmdtq51C+B221z4tp0kOLHX+z6pyCUgG5G7ek4PM5
	3I3ff4LxLkceiZk4Eu1Qud2US/5WWNIdK5K3oAkiPQKRlUo4iTJwCCBARJqYyYxW82FuW7yWPaZ0b
	JG/DeBVlANSf1flQ8uoWywRemGTTxyQqvu1Ms+M2uZO1KMj+WCscewsqQNmVKRh05VETGHj7FhqS4
	0wX2AXTQ0lLl2ake64nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPKX-009VVp-26;
	Mon, 15 Jan 2024 15:56:53 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPKV-009VTZ-0M
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:56:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-555144cd330so10935722a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705334210; x=1705939010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjUTYBPkXCa7XWbbKGG7vPNvPFoPanfB3aOFNe3Yut4=;
        b=aT1qK0+UD0NXqP+b9Xaebd/UZNUS7xlVntwyNenxoLvgVBQQL9o6rO3fH56DdSWAm2
         CYW9cXgFNjKPNZmeFMw5pEwkfMHlurj6AaIbtNL3OTOGidQeKnA3bootRzwRZbOYDqBQ
         oQ6XLPv9m9FVSYMZkSn9jJFDitJn1TrQZtwIP/Ih+uHImFer58ix1ogl6/UIQc1h90pn
         3omsEvWzxkcXteFTo24fuQPmhO6qG+qEPEgcAPlhCjvscYoewtO8lxzY1UIFskdc5nz8
         ZWkx74XfVBKTprTD5r7mgahHdg0zSl6jfEMpAVCuy3V8lS1ixDZEyBxgf5dXrx1+y/7a
         /TSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334210; x=1705939010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjUTYBPkXCa7XWbbKGG7vPNvPFoPanfB3aOFNe3Yut4=;
        b=kT33mtI0D1WXSey1vf1F2YIAGy++hzbDrzgGgtkNEzGw1DLcQqHXP5gKugAr6uurrL
         CO/DyV1Qd2A75GeuvffzjY1Mp4uZwiMsyyLVBCuBLk9MLtu46kOjk9XW2m4tsQRYLyQE
         78djtTLg2d5KG0qvYai4Mxpu/UmR0Y83IbcqkDocjVbq0EtixaakcZ9r2VzV9xO1CwMf
         A0LFb8NusPY1WO7sw7NT1qhl368U29IOAlrbOG731UQ/AgpR8KGr1uUYLrjAEfBfBzLt
         +93km07B1LvhHcws3uAERUrFrYOq4dy65IF7Qgu8SSu1+QWLoHdR2p2PzGf/+vvqIyXh
         gNGQ==
X-Gm-Message-State: AOJu0YxK9gHFLpglSYL0Ok8w3RcUzxU6p+aOOLQkJ1yIOBwrlBYah0k7
	xCksMSyG/xQSwAP8SoK5DY/1PISrjh/Bzw==
X-Google-Smtp-Source: AGHT+IGsBQi506iCN/EypiMhdRtPrpz7QX4dvGNrnRHaLGW9vy/fghBvzgHOu5YJwCvgL7dkcuGZCA==
X-Received: by 2002:a05:6402:7d6:b0:553:83ca:60be with SMTP id u22-20020a05640207d600b0055383ca60bemr2985978edy.4.1705334209869;
        Mon, 15 Jan 2024 07:56:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h12-20020a0564020e8c00b00557aa8d72c9sm5549635eda.25.2024.01.15.07.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:56:49 -0800 (PST)
Date: Mon, 15 Jan 2024 16:56:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 14/15] RISC-V: KVM: Allow Zfa extension for Guest/VM
Message-ID: <20240115-572f0e469dc54dd3c42a5313@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-15-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-15-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_075651_147108_75C127E5 
X-CRM114-Status: GOOD (  10.36  )
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

On Tue, Nov 28, 2023 at 08:23:56PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zfa extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
