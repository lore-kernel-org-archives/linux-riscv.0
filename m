Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E58FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 11:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ibk/KGbIT4ElRCRialxLclUwWW6HkHJ+pY1COzzRKHA=; b=16aKwfDeFREZ9b
	6zoeF8UJjdbeqRPPng01jbgUgkhlayrxt6odiuJYmSXHzVn8J2vanG4pSoFpxA1RkOly18n8sTc1p
	UQWWJqdwk6yW0fIB8g0oFLoFOT1/hixjTT2Mt3gXRHiJVCn5QRyMIe4pBvcJLoZ1l/eCIOfOxTtm8
	t6nSh/Qk3yvLbLyrrm+grGJ08eUyB3Y4fBiNXrtR6lfDU0eA+gEvnU6SXWkbEK76XGgn4Upg4Z9eH
	ty+Tj7PAW8+mx4NL03W2vywFTggN7o5pGn1VeMM2ggKQ5NStfjxwtru3W21sYjSeoSK8SsovDYfl0
	AfzG4LdWFtacsuc2Xm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuYp-0035b5-1M;
	Thu, 13 Jul 2023 11:32:39 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuYl-0035YN-2V
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 11:32:38 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-977e0fbd742so99970266b.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 04:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689247951; x=1691839951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eNKkvXVW1sthMJRNqYMNGRFlFZb1M91hFC/q+puE6Ik=;
        b=n+N153ZahhRtO6YJoWCv6JsN3zC7IJ7QdemzoZhSrpo0a4s7XSfHOnMy+OzsWlaQjn
         BLdgIRouGm5RgGddFnd+UBAqx6E2c58E71jmDhWxbr+NEyu/oslQ7epG6hKSSCZLA3RU
         Wp6ina2GVyU1UYQcB5tk5w8HOFEtZ9ulsmTR4sYIPxxRr/6cD8JfIvlwBkqzTTjePILj
         Zh7zlgbmdhGkCd1C0ajUvlzasqSNM8Gu9sH6izLzrkTcl50KpEoTLXhT/x2r+EIJg11k
         bP30DN68paLcfU0b8DQnwIW72HqXrqiKeRKulCKC9ukTdnlPrh5DWTQ4XUI9T8a4jKIX
         IhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689247951; x=1691839951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNKkvXVW1sthMJRNqYMNGRFlFZb1M91hFC/q+puE6Ik=;
        b=jR+OX2APp0rGahhjN2M+4Nx+yYaTgSDYG7/LXWQJ9cThyr19PdLhJu3vFNJTRvRFHA
         wbAeijKgolJrJ+thl8q081EEiokoZVU2JOKEHQH/EeQiZgW4k0zVInjEAibqv3WIZo90
         VrBwitEe3jxeUOWIlH3HXZ4uyrJlF6///jUsmYVsAUF0Z/eTwSdaVlvAucP4cua5kmgJ
         wmi802ieHfAzTe5VULZAVih6bHtevfKE609JzWwNsMu/GoIJZtrZdcmhcV1fBV6Y0Pfs
         8b3UtrHBxaRTkDew8R4U+YS9ub1nLFSpzFHUo3AH4MM5ENAgFQlatSmUOoN8lBFkhPk+
         OyYg==
X-Gm-Message-State: ABy/qLZXTVfhMoWahyGLcvOEnh6YOPSw0ozuhiWSp00uzNFzzlztwcw9
	rXBreix4M/6nTWOhPf31R98eFw==
X-Google-Smtp-Source: APBJJlEv0v+ZpKSZl9+bieRO2mmmwa+e/d1XEwqZ/2OSLJQFFFxirJJFUUKCqYFW75geQh2AmB9TdQ==
X-Received: by 2002:a17:906:5a45:b0:977:95f4:5cca with SMTP id my5-20020a1709065a4500b0097795f45ccamr1301033ejc.54.1689247951165;
        Thu, 13 Jul 2023 04:32:31 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n25-20020a17090695d900b009927d4d7a6dsm3904142ejy.192.2023.07.13.04.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:32:30 -0700 (PDT)
Date: Thu, 13 Jul 2023 13:32:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Ortiz <sameo@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] RISC-V: KVM: Allow Zba and Zbs extensions for
 Guest/VM
Message-ID: <20230713-edec78d8a36c3c84618f159f@orel>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712161047.1764756-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_043235_844764_92EF56C3 
X-CRM114-Status: UNSURE (   9.77  )
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

On Wed, Jul 12, 2023 at 09:40:43PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zba and Zbs extensions for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/vcpu_onereg.c      | 4 ++++
>  2 files changed, 6 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
