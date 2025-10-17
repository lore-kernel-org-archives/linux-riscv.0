Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DA8CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NL9kUS79XzlS4xNXLlVBSWdpaZumujpj+cD4xIjYUIs=; b=LuYN8DK9sjKCXV
	XxcecJDmSC6/xvdBjUXlHhnL9fEIldk9/7j9gkFPmuo0y2q9zMhn0McB6L8eAkp3zoKT7Tfv989OL
	48/UQMocMUOKaSmGkzxrB6WKSZCvvJ5jv1AlN/NmVPHn3eQuT8VxXpWB6G7OLZDJnA+bdmvwbgj42
	POnxtnw/9vNBlA8hnQ28c7aeTbBXIhSjJrw4lU4+WW1FP1gfHqZSa2WvpPmgI7YmjaWQeghE3Kqf9
	PQiCyWemZLN1ZyFZ3TogXxzR6y5CQFsO3gKu+BRk3AYI9Gz0/iyx8cMIDInYpW8wpKvabKuYYrzcA
	W4NDysLT5cNdz2scVmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCC-00000008Q0H-21pa;
	Fri, 17 Oct 2025 16:20:48 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nC9-00000008PyE-3YxD
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:20:46 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-4259247208aso14983855ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760718045; x=1761322845; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uHcp/aWTKuBzfOH84Xc834di52qmuKsQVMyFNNeyUD0=;
        b=EoIqaHJG7m236vlk5PH4op+h+ZHfwTBEWUttMj7d52LdEytdhkEL2n4JhVWLVrQZHT
         9CKn272aG2MHthF9k7f+cXE2z069mQ1Lbeg5LEy30eiWbvSPzx94iEEArenJBhU57PU2
         skoe/fncztIQKkAOqsIsK+SxdFTaZHESmM1nycWjmB6s3xqikhAuxRLTDIPVe0nCoICe
         1Bdgk2Kd6W4kSqM3f8nDp7Gk4mkWgGFTuvwkMxKyecEoAXR88ChqVA0H5N8hvbThaWm5
         nNSCAN3++62vD+2XedlersU9sIyT/gReKYZI0CzMxvCcoCH5gYuN//wfEdDYFKBwmxNR
         jsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718045; x=1761322845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHcp/aWTKuBzfOH84Xc834di52qmuKsQVMyFNNeyUD0=;
        b=iLZIXY6Lx265yD8Tk/UCvQBe5iQyKF4EnQ4ytxUubslEtHbv1u1b8WNmCBRiEKD/fw
         gUD55VM+ZwYHHmAb+zJbFVE+G5ZScy6/xtM/UsOWI65ILeWI2j76UJM40+U6Z/I9tb4T
         ZWD2tQqyBHZmPEU6xqQZITUtpM1Tl2Hz4GVJU00pZXaoS3TVnVXcD+cbVH9nkVN5mbi/
         nKQ9G34418EM6wAfrqdt8ppgItz90OsDkhImfg5zboDIC49E+krrAdSg8oskfr2QUH3o
         lwqAPEBJNyOF5//650S6Z82K7VOu1zg1wp+G3cviCWg8Ig9/Y/hKpZBJLnaZm4FvJ9Hk
         XYng==
X-Forwarded-Encrypted: i=1; AJvYcCXqoblIF5EZHcXNTfWy0+kyz4mL9BQ3zow1emyk+TYBkywCTG/RGdpa0Q5Izgxky3DZGa6W1ULa4Ce35w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKUmgnN4qVcGQKAkrS8I6M+8Jn92oYfG2q+Q2eaxAkc2qUvHGY
	Q0UmsXz5o1VQhkabKNFVMxrNZj67ZqLrGBZDKv1zWkUARuEoY+rSlhP58XClCrHshE8=
X-Gm-Gg: ASbGncuujgKV8nI2PllLn3zzMv73HwpI5ityza47jM2ca7N7lKPo41Crjoh+poxWZaF
	Hz1GzJWWfKWsJ3LvdpvjHApG6xHAjJ2SRegwMvE0HSK4/1n1fJrI6FLZ9I8RWuzpM2W44gpvqNV
	FHmhMu/Aumn1iwJ3b6riXZ8de5Xpwx5ekCrVoF5cgeS+IDMrTKcPEyFt5VdjwxkUu5OJ1eXT9eJ
	3W5h/9/u2s17J52Mwe6yDRUT8NOSdt21KIR9LDNGunfsVFEy1nbWQhNDD5Ihs44TLYbA2tAzocA
	pgouEqtyOR7TXKgkWiwRPvTz+e9GJ0CTH3GOKfPDvkoz0Ykts2KdXcouHSfkYIlTBB4EdtPFIvC
	lLEp5vZ4EgeQ+Tc2pPrUvpG32ypZtjGmuC3MmMfPBQrDE0U2xotzPyileD7Ey2/kMJzhj/RX1Q/
	IEsg==
X-Google-Smtp-Source: AGHT+IGb7WVIYEXYDolygsCFth05K0mPGRPpQvAMXm74hPFwBGeILraMt8hiRJ5jXXj3KN04uw/DDg==
X-Received: by 2002:a05:6e02:1905:b0:42f:9e54:76d0 with SMTP id e9e14a558f8ab-430c52ac0d8mr55233645ab.23.1760718044856;
        Fri, 17 Oct 2025 09:20:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d07a874csm804025ab.19.2025.10.17.09.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:20:44 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:20:43 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Add SBI MPXY extension to
 get-reg-list
Message-ID: <20251017-7e149a197ad3d9d99bd45a4b@orel>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
 <20251017155925.361560-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017155925.361560-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_092045_894558_ECE1919C 
X-CRM114-Status: GOOD (  14.12  )
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

On Fri, Oct 17, 2025 at 09:29:25PM +0530, Anup Patel wrote:
> The KVM RISC-V allows SBI MPXY extensions for Guest/VM so add
> it to the get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 705ab3d7778b..cb54a56990a0 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -133,6 +133,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SUSP:
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA:
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT:
> +	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_MPXY:
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
>  		return true;
> @@ -639,6 +640,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SUSP),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_STA),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_FWFT),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_MPXY),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
>  	};
> @@ -1142,6 +1144,7 @@ KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
>  KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
>  KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
>  KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
> +KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
>  KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
>  
>  KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
> @@ -1222,6 +1225,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_sbi_pmu,
>  	&config_sbi_dbcn,
>  	&config_sbi_susp,
> +	&config_sbi_mpxy,
>  	&config_sbi_fwft,
>  	&config_aia,
>  	&config_fp_f,
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
