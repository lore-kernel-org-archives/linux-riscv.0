Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D66CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 07:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yS1fUxDI9PW3pRkOFVubWej+UwGhp8gly7biHUCL0vg=; b=bJAfREh7ZBAMFI
	TmLj0TqtdIscowbLlORNpV/qwzHsS3dZi5QMqg4nveqOrKtH+4VqX7UEmXMLJ9uvYY7/qICp8mqrL
	Jtnp08SnQVCVzm3TVdK8EKDcd60Uyo5M+CM2lcRX66EPgfzrMOZtM5WWoOggsrF0rR6rrj8mHEwlF
	1hYEPM0S2hcYquz9s9cAIiCAw/0Q37jzMei9kESZP4zGBw08M+1ZFibHaC6EzGBJ6Du9ysPBjNFa/
	/jLUUqOLv4AQTsqd1zU0PeSfDaxpJ5QQxl1MISEaJJXZ8urVipy67qkf1KRPnvlzcQKh0hbegRGmK
	Seby44l3mDqnY1ymH5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNjN-00GdTl-0N;
	Thu, 19 Oct 2023 07:46:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNjL-00GdSc-03
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 07:46:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so6831211f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 00:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697701564; x=1698306364; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeyvUx1rVja27wirLq4XcNrRcR3eqmAH3gyz1hpKoZo=;
        b=YJ8FSSWeRE+Ht0yusgYHDXfyfPYm1W0SAhp3h2gV+SO5P6OLuwXiyYvYULWzHKty3O
         gvJlQcYYw6agVoCt5GUlnZoAmMYT6Hb6ug8+Bc65IEY5XyuseQxXgLvhmU2F5ydUW9JS
         CapJFKqtXEqIevOWM7FRv1sVHY+E1OR15HGONPwbf++XVGANaQ5FB7DgNwYa8KnMcTuo
         VWYyijvgpKPBNXdh18Tsr6TPufcn+T8pQQBi+jPQo77rFwDdEKE9krb+yC8hp7lbv8Of
         CCqLqlqSE85W9bqXTCjincyjZqtaw3+G3o/MtbkYyffTFEvkeNly39c1vIXMwq435ykN
         It0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701564; x=1698306364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeyvUx1rVja27wirLq4XcNrRcR3eqmAH3gyz1hpKoZo=;
        b=g3RPLL6X2dWjTBouA3QI5bsHEP5/7/XuGUa33twZNVbrmGQfMi48mne+ykIkwjiugl
         cmijQ618nqlw7QQjnafaHHIAuxidCkSFxqYbAnbqcggCdhsoZ9mvXKawggk3SAeVP0GH
         eEVXpwOsJxia+GhE7P5GO0PnkNfVpjarXJpWF/5q888DSbctokwb72vAfIiUWgIF4bgQ
         uZwzF2i2h6D+a4RcZg+Ka8tnKx5giu/JWIaYYBFJ2t76UpxbNbYnKbMdUmE/g0O43qjr
         PrWPzO35qo22GNYsDU8NkIJwCcxEXf3fcf5Qy8WHsZu2ULGHAQm6o/hV5Z3meFrysHdw
         1snA==
X-Gm-Message-State: AOJu0YyixToUI/TJRgv5agpp+h7k53gqquC0kq+IcnmoSF3Ot820xUm3
	cEqbzMrZaSqg4P7hKiZzuRyzAQ==
X-Google-Smtp-Source: AGHT+IGLUlcDD7K55509EI9MCn7Lj/SluH9GT9R5OrexuSg3htFw/XSGrzpIAwUrw57WzavQkmaRxw==
X-Received: by 2002:a05:6000:1815:b0:32d:82f7:e76 with SMTP id m21-20020a056000181500b0032d82f70e76mr906073wrh.34.1697701563248;
        Thu, 19 Oct 2023 00:46:03 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q15-20020adff78f000000b0032da6f17ffdsm3846942wrp.38.2023.10.19.00.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:46:02 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:46:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] RISC-V: KVM: Change the SBI specification version
 to v2.0
Message-ID: <20231019-d6386d58125da87f5e4c5ff2@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_004607_055456_F7D10653 
X-CRM114-Status: GOOD (  15.58  )
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

On Thu, Oct 12, 2023 at 10:45:03AM +0530, Anup Patel wrote:
> We will be implementing SBI DBCN extension for KVM RISC-V so let
> us change the KVM RISC-V SBI specification version to v2.0.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index cdcf0ff07be7..8d6d4dce8a5e 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -11,7 +11,7 @@
>  
>  #define KVM_SBI_IMPID 3
>  
> -#define KVM_SBI_VERSION_MAJOR 1
> +#define KVM_SBI_VERSION_MAJOR 2
>  #define KVM_SBI_VERSION_MINOR 0
>  
>  enum kvm_riscv_sbi_ext_status {
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
