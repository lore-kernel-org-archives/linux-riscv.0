Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA6FEB64DD
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6l5BRua43ae7Ch0cl3FgIqWTHWdspLl0fKoluLgV1II=; b=vZ4Sz+x3DRnrJS
	odNvmvl0aHdWS0fudRQ8ik0iESy+gnfULNtSX15Bow/u8DP2G3FB4hM7B8UZB77iLIggAMiZb5QmK
	0yUqb3BRDQXR2JBHg9idit7g7ENrSIIMlQ5dcdurz9Rm1jURQbEJGxciyBu4AUUSf/ZJd0UqVU3tX
	1XtfPMZKEz5TSdS+4NdNvcevsy4pl08c0gkE05st7TRrPgztYNB2rsTRi5DIo8WA5/ro80nGW869A
	TGMgn2qA6i5DePgqeTL3IWADKDnXA53e8mpOOahXDXdhaUmwgew/+kCt67eg3zOhPfJvgnJ8FdHQx
	vBFBEhHfTa0J4rI1/Owg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYMO-005jGs-0i;
	Sat, 01 Jul 2023 11:01:48 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFYMK-005jGQ-26
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 11:01:45 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-992b66e5affso296821866b.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jul 2023 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688209302; x=1690801302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iUgkxYj4hDdaeULOykMIAMiTYI4q7YAWRcLFU1vSbps=;
        b=Hl6PE+6tbQAK3mCvx+YO6XTFLzapBMm8lxpT/1mcQfSusfpxU8+WUET6DNyDlb9gG8
         tYNvNPt8I+LTE58jZu3BrFuSpW3vvVraNpSu+Jpl4S4ELRffi/YrwE/3b5LQSXuJjdyW
         ifHY4vY7etvbXXNEgHbvmWOL368iaR8tvZdn0DDuHJ338jSWzHaq2TX53R4OexKYDUoK
         10Qj/oj/1RBrC9bj45Lv8C1pWw05ejDbivtz8ZP/8XqTrjYHN98NiWBFHG+4fMjX3Mon
         TE0gKszRbjVhL0hqjesgen/EEUGk2UkdcGfZTNBbNiXC4qV1UuUpe9tEEln2IWWcvu+Y
         KcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688209302; x=1690801302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUgkxYj4hDdaeULOykMIAMiTYI4q7YAWRcLFU1vSbps=;
        b=MZdK//afzJikP0ek0xCRlUHE31dXh6NX8//QJNKFUOqV2+lTtwvbxy2fowB7uk3uZV
         MDJgwBg6u6xN7XS5iJ08CfLs14YIZgV5G1qQrebTgIwtFULgBEgrMnZtxLZj0N2L/O71
         7tsP25ZecFF+bEL4gLgn/YJGvSLzxS2yPz/uK00v4zEK9ccylozT8+BFKh6sWxYJYFbg
         02uvOxCGqhK4Ns/ObFEKqvybXckqewbYthAQt7tHiHQaEaTV+RW+QJf2O5746vHkMSeR
         9Ck962S4TXgMr4ZUHFICYmh9TIrujN6wJg3fRLrRX92/k/+kHp6MC9cr20zZ1coJkaJM
         gSsg==
X-Gm-Message-State: ABy/qLYexIkuyoJIEV45Vu3QT3ni0J/y+4Jj8ghJJg7zsYoc6WDv3uVr
	cF1KNFZjrNt1fP7p1DZp5rfgHg==
X-Google-Smtp-Source: APBJJlFkK8StAK5YsG+2ZcpOu+kBMm85tO+8fKQBITtMoynDzvNSvGndfZtNLBSou1PvXBWQdFIuWw==
X-Received: by 2002:a17:906:7a0b:b0:98d:cd3e:c18f with SMTP id d11-20020a1709067a0b00b0098dcd3ec18fmr4312746ejo.72.1688209302131;
        Sat, 01 Jul 2023 04:01:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x6-20020a170906710600b0098e48ad11f2sm7705332ejj.93.2023.07.01.04.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 04:01:41 -0700 (PDT)
Date: Sat, 1 Jul 2023 13:01:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis <alistair.francis@wdc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>, Leo <ycliang@andestech.com>, 
	Oleksii <oleksii.kurochko@gmail.com>, linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, 
	u-boot@lists.denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230701-b348653e432924f090c513db@orel>
References: <20230630-very-greedless-16522d7b7830@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230630-very-greedless-16522d7b7830@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_040144_692856_5AFFAFF1 
X-CRM114-Status: UNSURE (   9.15  )
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

On Fri, Jun 30, 2023 at 07:04:04PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
...
> +oneOf:
> +  - required:
> +      - riscv,isa
> +  - required:
> +      - riscv,isa-base
> +

I guess this means a DT must have either isa or isa-base, but not both.
What should QEMU and other platforms which want to provide DTs that work
for older kernels, but also start using the new schema do? I'd guess
they'd like to provide both, where they'd expect isa-base to be used by
newer kernels and isa by the old.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
