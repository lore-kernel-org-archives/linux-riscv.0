Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74523C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gj28blf8XI8OCiNRW2FRVIC6iKegJej5heocJO7Jm1Q=; b=UAISdQOqIgpziV
	1m4Cku19Z0YrGTI9ou/HAReY7pxEb7wqSEcO6sl32sMiFCfEQypUZShwaA8txc6p/Ljpdm14aJJPE
	cvTMaWmCnHTvC2H9xw3sEk6x3LTNzkAw7pEyjpQavtk61ilu+JxTHUFFjxrDybnftkZIYsUwL659y
	+yE30WXrVP4aBLeZSfojtfDZ/Ts/9OsLJGXA9yLZwrsNYhYu8q3Jp0G4TnO/lGs++/42HRp9kK67N
	ZFr3p9yOKuIhH+t7iEVcTOYaVPUh5j9CScnPn4bvhDSp0K1/rrkeqzIgV6nBeiAMiCI8fqb9s26S1
	+BbrLZnxjNg8a872MNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvkN-003HwS-0C;
	Thu, 13 Jul 2023 12:48:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvkJ-003HsU-0t
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:48:37 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9891c73e0fbso137778466b.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689252511; x=1691844511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp4jrD0ygkJDJFkWGuFutfJdRI3HLTanG1V2Pol42Cs=;
        b=EOfdCr6iiOuuTNeK3CwI0fjcEzCrcjSEMhZxpmDwTAsUYUGRmEbN4J3P/KWj+lbnRV
         H3H5LgYWFSq8LpQAFrnS11hWAMu3jThEZYt1uEjysR4lE8hZvuiScxPUTY1JBowIa1sH
         VftqMEF/Yo+psGZPwo2ygzyJAfyX6/YNU5gqD7PwrjpSC/q2Jj7Hh7OeyTIzz8v4Gre0
         5ayG8V3a8n93aKvEbAUwe+GRycP79O7hwW5BbRHfoWtH+/e8CbrsjG15Ty9jiOAg0ZqV
         J3cKYSb1nQMioih/tQ08tz5SmCDZQ3tEDX52Gy7VadWkcvkw+PQR74HWTkSQywXYs4u7
         WF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689252511; x=1691844511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp4jrD0ygkJDJFkWGuFutfJdRI3HLTanG1V2Pol42Cs=;
        b=DmnHSRi9EnLzDV6gCjcsZMebVQ7lOTUNVURWXcyngnEYpOPmCWSyEQeqPCO7hlyxCF
         5NhfH5I8REsMW8PzDtZnSgM9Qrri17PHdgyJUMD4NA9cCuqywpFsEj5ysOGvxpWCZW+H
         gtDUsYB8slUF9B5LSYB0zIiBnLHauaewVvN0gjmYslsO6l0t0Uq6LLyKC4bHbURNHpxl
         1ZA8YleOZdMjVt7keX1H0qK/WMvAFGVM+4BS92DeJ3PbFM7FVs6D3Rm5hnMO2of/K2O5
         cWVdX8Oyxw80lKXw3VS8vURsxBri+JDHe9UVU5TaYjx5Xf2sEn1EsO9SBaxGFmZLqrt0
         pM/A==
X-Gm-Message-State: ABy/qLax9YDf051ZGT/f+9WTRV6PaFGovfdi4wVXIU7n1JT7NoIMHVcX
	BwEU0Ubm6ehUYQ5/TqiDiMG68w==
X-Google-Smtp-Source: APBJJlFXhJzEW2rHuTuVDvIaDHf/V6o0OrzDtrKElPkDaTyWkk0l1GjBgS7jdgy/ld4Qg5h+QAf4TA==
X-Received: by 2002:a17:907:3fa0:b0:986:38ab:ef99 with SMTP id hr32-20020a1709073fa000b0098638abef99mr7436157ejc.9.1689252511508;
        Thu, 13 Jul 2023 05:48:31 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709066d4a00b00992eabc0ad8sm3958509ejt.42.2023.07.13.05.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 05:48:31 -0700 (PDT)
Date: Thu, 13 Jul 2023 14:48:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Ortiz <sameo@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] RISC-V: KVM: Allow Zbc, Zbk* and Zk* extensions for
 Guest/VM
Message-ID: <20230713-bf041a3bbf91d041db3bd623@orel>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712161047.1764756-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_054835_329830_9EDB2EF3 
X-CRM114-Status: UNSURE (   9.63  )
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

On Wed, Jul 12, 2023 at 09:40:46PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zbc, Zbk* and Zk* extensions for
> Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 11 +++++++++++
>  arch/riscv/kvm/vcpu_onereg.c      | 22 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
