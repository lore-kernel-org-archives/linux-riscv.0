Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8D8C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93QYDItPzqDmwPvIB94TJ39V+o6xllzllq/uNLjzXes=; b=q79DHAQSyAvktk
	H7aLvfppIGvhA4YfTG2h8VF8dg72cfBqdX2XjEkndo5vdQ471uZkp/oHKus/jy72D6Cx6k7/lyhI7
	LttauPBCBzWlwtcBcSMh+zuBWeHUUVcfBaul5ztVG8eBHqn1wNn6T9mkEDc97nltLIi8KNP3UibCx
	Fa+olQqEF+o3A82rwFMZpAHAf0+AYlk/aIFHWM/VfMl+gclKW1SeVzPtpUxsaAXLUALDiTZWoEYf+
	VCS/JLCtWq0ko+OjqkcfQ6bO1+iJvb9V36iHyWt0ZH8or3KJQbHJ/qUsHlEwIVxnHPqchHv0nIMh4
	GDkMi/2UaNfLFRy1iKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvlD-003IGi-2E;
	Thu, 13 Jul 2023 12:49:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvlB-003IES-16
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:49:30 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99313a34b2dso93978066b.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 05:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689252565; x=1691844565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YrA/e2Xt+yiDdhusSJAHLQMGqpj6TyRlVXIacek/Fro=;
        b=ciNnKzjCiYv0jh3eJrwmt8LDzo/2k6qXNKe5KY6vR7x+9Zx71QOAX2LRBEE7iDR5se
         LvDM9fpVZKYvlZAWDzYlORm+/Q/2AlSwGSNtoykaltdbMVtzvYV4QRRBLxQC4LPpdz1V
         smTy5WU7ZKoQb8JYtaoLCyTIozClZ6RPucKxWl1dUcucSG7ebZqWV5aETggrjJV4EX+x
         ODoqnFy5SRfg5x0eIwucj4n0OBsz7A1nC8mN6u8T6iTl7sfAdzp4G2ZWeBh/xLOE4zbu
         XfEcmrjL8k7mZyznIsYmnfcLFP64M/umfrE8DgmuC9shkfMQJpG6mfeEKK4XC/UAMu7Y
         /GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689252565; x=1691844565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrA/e2Xt+yiDdhusSJAHLQMGqpj6TyRlVXIacek/Fro=;
        b=E8bvE0bKmj/lVfbcUer2A/nC+yDC8zUC6mvHsCMFhvLDFLYKQV2vxrD1xIZY+/JTzY
         QCresUBSHbmJmYO9W4cCyi3E00+66ISETzKCXXOJ1Cqz4CYuR+EZ+Uem+04i/V1fDWss
         XuVd3RUi/jjajeA9VyBCrX3bP9KKdfPIniLaY9NEab6fQas6hbIQfnmdgQnENQjMbBef
         myPXoErO5esowodkJDNsIVYtorPBvXZNIIpL5DHhYkVnN2dOMGIEEvdma9+1IQhYNRT6
         H4iEoYOOkU4B/9FUGjLm/osSK9u6gnSO6Dt4rCRjs+OiYPIxF+E1nV0vxSVuz/0zrmAr
         UcvA==
X-Gm-Message-State: ABy/qLar5mMVlr3QKqeQx/RUenfgDqIEWri4D7LdsjFEJcAqBDANUfqv
	2V3Rw32xPj/v/BbyVjHXyBLH8w==
X-Google-Smtp-Source: APBJJlEZ6Jr0bgLMvUCUN1AElE230Jcv/LdQS84CgWB4o5VJnhjzvzvecIoBpLiC/Oq8h7YW4Uqy/Q==
X-Received: by 2002:a17:906:11a:b0:982:caf9:126 with SMTP id 26-20020a170906011a00b00982caf90126mr1713829eje.42.1689252564905;
        Thu, 13 Jul 2023 05:49:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090636ce00b0098d486d2bdfsm4026815ejc.177.2023.07.13.05.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 05:49:24 -0700 (PDT)
Date: Thu, 13 Jul 2023 14:49:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Ortiz <sameo@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] RISC-V: KVM: Allow Zvb* and Zvk* extensions for
 Guest/VM
Message-ID: <20230713-6b5fdd7fbd6e76c3d6291e8a@orel>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-8-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712161047.1764756-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_054929_380014_A2107BCD 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, Jul 12, 2023 at 09:40:47PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zvb* and Zvk* extensions for
> Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  9 +++++++++
>  arch/riscv/kvm/vcpu_onereg.c      | 18 ++++++++++++++++++
>  2 files changed, 27 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
