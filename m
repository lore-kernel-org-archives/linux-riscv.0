Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0698EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DSYhqnphpjdW9N/dyr8UK/coo1lk/NJgxu38RSwpOg=; b=YVu2cPbC1P9QtL
	aVYEke+5Ow5HFyzXPLCSSfXuN20dJIKjrAVPXPK2X3vZP1WhxRM77mm1nKuErHtJWy8uigMuXMMZA
	VJ5UPF8XPpjsjWWXEsyZqC8+YzkL4qN+QIWkU/Fm9PoEE3MGmg0jGrM4EpcP8FHq9B71WAKone/X3
	pnxfcZ/hCC6K0g0hfCTc0l8nMdmtD2XiyweYwyGhOXmgnGxp0Pzq3a5n1OYyfloJCAvLJOOyaGQ5k
	6QUZLWj6z2AB0amsJxU7GiVsmDCWvGPj+ak069OfTfsCjd03HGA/f11RTfb61I0wqsW2wMSxQkYTu
	Fa+Ki1yzRorxUOV2r+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMluL-00DRVZ-0A;
	Fri, 21 Jul 2023 08:54:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMluI-00DRSx-1e
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 08:54:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so14047015e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689929673; x=1690534473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4AwRpP9JVKZ9fB4g08XqDZ32TSekpzgxbFdK0x/d1Y=;
        b=oq4Rg8yi/FLuTskck3zBQnNtTSwqIktu6euSEhJygwTB03eYPspGLmFkAddF1YUtok
         Dt85upAUWCb0mEMHgUv6VuMNwThDjl88x9qUHo4eykHlfOPItqN9uqwVDp+pHh1cmp8g
         /V5Fv79GBsYAGg4UFi9211TS4xed/9wwjiqJqUc9x6UZL3z2+JTGx9TQWlq8gdfXZjf4
         jJlyJ9ZtTt1ZHqsWGDIzSQsWKRo4Ehmrih/yZZD1f5y5s9y7yrw8PiDtPWxalFOJ8CD8
         ERCCxUlFr1yNXsvO76Cyw/QxyRHTaMDc4t3LkxDnpRqHaoG12qsV6aTdcMk5LwHuke4M
         3uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689929673; x=1690534473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4AwRpP9JVKZ9fB4g08XqDZ32TSekpzgxbFdK0x/d1Y=;
        b=eKKZbitxEiSQxL8hMmEsOhbQToIHkL3t2kjflVsryHgbXjvS8NAkU1rBwt1zAUKmWu
         S6oWuW65sbBgTdtdq+ag5mvfTgNjfOvDETWqg0mCdG4MIE3UtmWIaZoBvv2uWGfkNbCW
         i8QlHXUAHv+3/pi3JwYqPCrlThBpw3suaVtpfBlWc/2i7d1ruTyY+BH1pvU14SH4gVi7
         b8Ue7X0Hg/+gnP1RH0DzCns64XM4MzxnWuG96TPa4hmJVC2+HBmTtCfJE87dJA22yJ6n
         xh7Rc8U/mh140wsRTh4L9J+ShymqjByTLty8GswezQfHqgzmYUtybe+FqB4wFKC8fqYk
         gWFA==
X-Gm-Message-State: ABy/qLbCfDkaqsyi/WNcxDFYeyrvb+WY3xx5gSquZPGrNVqTDrUOUmcE
	jbMGLanP3ZxHrBC9WL4xHvTnwg==
X-Google-Smtp-Source: APBJJlFH0FvpaZD4+DLXxPAGRYR/IP+lWXv1t/PY6XQ9nQCczvsqUErMPXt6qXGbWDU1HkKc7synjw==
X-Received: by 2002:a1c:f702:0:b0:3fb:739d:27b2 with SMTP id v2-20020a1cf702000000b003fb739d27b2mr888551wmh.8.1689929673300;
        Fri, 21 Jul 2023 01:54:33 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p26-20020a7bcc9a000000b003fbc0a49b57sm2999078wma.6.2023.07.21.01.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:54:32 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:54:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/6] RISC-V: KVM: Enable Smstateen accesses
Message-ID: <20230721-06dfa28577ca906d6aaa5951@orel>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-4-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721075439.454473-4-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_015438_558109_2D818CF5 
X-CRM114-Status: UNSURE (   9.48  )
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

On Fri, Jul 21, 2023 at 01:24:36PM +0530, Mayuresh Chitale wrote:
> Configure hstateen0 register so that the AIA state and envcfg are
> accessible to the vcpus. This includes registers such as siselect,
> sireg, siph, sieh and all the IMISC registers.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h      | 16 ++++++++++++++++
>  arch/riscv/include/asm/kvm_host.h |  1 +
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu.c             | 16 ++++++++++++++++
>  4 files changed, 34 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
