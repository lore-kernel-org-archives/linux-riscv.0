Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1D7CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 07:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o4qgb4Hm1VDK8R5X3qNvP0KMpRi7Jpw/hcvm+pGuII=; b=sCxuGmDkq7d3oT
	cu2OWR622tFeWM0W9tonovRkgOwZWqWU/L5EcrA4Ccj6eu6QQcp3JPLo/txu/LGgRjLX2rASvkHHx
	Us2aKkPDLwTdsvSSdnSrCei1bapXm4eg3ofnjY3UFRjWIwnA+69FN2SlrTbqmwSjPcVOLaFiKkr5x
	9rco1HaFXQo5uV8oLmrR7kzklviXgoEQuXyWX8ox/DQeHG43c33xiNNTfboCYpoEVJg/+Sc/n1uKP
	b8WuqrB7QdzPJ/OZij5qnoTeMI7ovkXT0274Mf2CUK9DbmW3BBirP/41b9yT5QQJidBSj4gdcda6j
	WZg7WxKvi2FpU7kCfOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNiO-00GdHz-1v;
	Thu, 19 Oct 2023 07:45:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNiL-00GdFp-03
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 07:45:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40790b0a224so22239045e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697701501; x=1698306301; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5pmXZfNDgHWU97eVG0ao9ZDPxa8/NusQS8x4RuYWhWk=;
        b=pLacz2ZEVhDQ8GolluWHzjJdszYWz1C/2/FgQlZKHpFqbxYnx0Qup5Fnr1fXJUlWV3
         SYDPmt4HHQlwqiKEHKYW5Gjw01WC2P0jPUB4A/+eytOv6eYIpOQizsGyVbTn55/HSvvg
         tEahaw7mjtSy/uqz2JgwWN0JQoJsqKfsIzSi2qdN7QvIgFEexaKZJr5s8jvRwl+XsiK3
         5cdAqq3YnmSUMT/C8rZiqBgF8fgqi65AvG7o5ViqtHr7KDwedjOhvjUinG7yYSExPzIb
         ksbFFSJjOq5m9s6HNfjiCYdrJR7eTBfP4A8d0o50USACQG08FvVALgasMF2XRsxfZ4Hv
         0F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701501; x=1698306301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pmXZfNDgHWU97eVG0ao9ZDPxa8/NusQS8x4RuYWhWk=;
        b=HJJC7fzT+mX58usTxI8fcGumPzz1yqj7IcQEf0CVKK4TJloKMA8Nvs+vrKhE3BFtmi
         9x7fzoZHrjbrjS5pULsuOMAgsSINKmkGAbQ9LA20UNtdudKNNs+GENj/ykqHfbj9a63/
         qeV3scLzeLjINaZgFpxAPxEF7VKdiDvQxlG/HNaN7c9Jq0rNedjgqbwVkaknprVaYf+m
         +S+i87DKuNHYmdW6maAnBiJYM1ub7vByeCPsW6jDgJug2SNsL51vy9Y6HzTOOWMunv2f
         jPkZep+kqcMAEq0/kxzghOJ37lyi3sWyzVjBTckUPteTHPOU+xmr8sYUTJWK+lBr9ydq
         LrHw==
X-Gm-Message-State: AOJu0YztXxASHb5Tkt19za7brtn+ZTRecKyrpbVu+P8+Ll9Jhl8y1AHo
	ZPpeXqxD6D/EF4/T5iWh+PBwYQ==
X-Google-Smtp-Source: AGHT+IF7BQxJkgtIKhJz33b7TksgaeCJ/FKlTDLOVy2fY0p9glVw/wOjAaJE92kUJE4r9I59EYQnCA==
X-Received: by 2002:a05:600c:3b95:b0:408:37aa:4766 with SMTP id n21-20020a05600c3b9500b0040837aa4766mr1021340wms.5.1697701501064;
        Thu, 19 Oct 2023 00:45:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c028100b004077219aed5sm3630164wmk.6.2023.10.19.00.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:45:00 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:44:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] RISC-V: Add defines for SBI debug console
 extension
Message-ID: <20231019-5e24c756f19e98cd9d3f89bb@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_004505_052573_ABAAA540 
X-CRM114-Status: GOOD (  14.59  )
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

On Thu, Oct 12, 2023 at 10:45:02AM +0530, Anup Patel wrote:
> We add SBI debug console extension related defines/enum to the
> asm/sbi.h header.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 5b4a1bf5f439..12dfda6bb924 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -30,6 +30,7 @@ enum sbi_ext_id {
>  	SBI_EXT_HSM = 0x48534D,
>  	SBI_EXT_SRST = 0x53525354,
>  	SBI_EXT_PMU = 0x504D55,
> +	SBI_EXT_DBCN = 0x4442434E,
>  
>  	/* Experimentals extensions must lie within this range */
>  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> @@ -236,6 +237,12 @@ enum sbi_pmu_ctr_type {
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>  
> +enum sbi_ext_dbcn_fid {
> +	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> +	SBI_EXT_DBCN_CONSOLE_READ = 1,
> +	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
> +};
> +
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
