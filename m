Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D740C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLOXE7iH4edY+EEC9WK4Cb5vis+6+xOFsQHGOolzC00=; b=gH3coB+SD/skWO
	Fq0/+5rHr+Ha3eUSpGJ2scinU7Z6eXXz9eayO68mA4tzRh4h4j8xCUdb8iTOKgcltu9VfaEyXvCQe
	DP7J4xlqlJahHTJ0QyFRBq+TcwqURx1cdEVMUyL4aaKGWD32PVguihX0KidJXvCkDKej1WKj3b547
	wfCQuQGhT2ZLctX0/mdImbjTmRZs3Vk03U8pSbhxnb17sfVx7uwoLbcupT92Fr2KCkccGk/TISCV3
	uh+e8xtSla3azX+ARFHTMEorqongP51YIdPugujgWIkRPH3lRGzdqqsu5UNx6xVzuYvIdIEqHHEWe
	KvaBn0ceRM0CSEOpcACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdEO-0000000FrVP-2IXQ;
	Mon, 27 May 2024 16:29:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdEL-0000000FrRh-1rG1
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 16:29:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42101a2ac2cso35455705e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 09:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716827387; x=1717432187; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H2zB37FLsCEU3qcA1K5WX2J0t5s2Si0hkv34drQge/E=;
        b=RQkmwtT0261/7hRbiR7Kx0Db7OwCuXO/3ahe1KkjVLZL2sMfBJZJlXRq8w58/B1wja
         Zyidti9j7B0VFRCHykip9viCSEpcy3Qc0gkeW3ogPGeHuZFkYD/KTdMnuoeeK1fbqqby
         AT8w3ncIQvF6mlUCmq0hq9tddi1kVGHvY1vlCroMX9z6LW8cMepG38zI78DLvx3ckMkR
         +4ZhyLhxyfC3GOW8i3GAbezLE/Nru5wpx4lkAlk25U1vXhvWNIpacmFvI65Fhr9768m7
         OaASgra14+c1HBkJcaXAGFE/Edkpb6L1iXF1vcchAfPDirI0OcIx2QfhYkFYjTSb/u8t
         dYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716827387; x=1717432187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2zB37FLsCEU3qcA1K5WX2J0t5s2Si0hkv34drQge/E=;
        b=UeNej9Xo6316zEm6U7EpQmYTqAfSTb3a5DR8ya3F9wYKoybxjscjOsHMUgDPWrggmw
         ylTgdJhLI6hXvuXkWwIPoZ7dJrfteIOY4VhJ8/qZBoRyaADJuhjwS1SPAFe0WE3QVgUw
         GzjvZobSrDApVhwj0OXt9tzuBUTvfyEtYquTtTHrOCKU4EqhiH0fevlpMCV7w/5V9oey
         kUhM535I0zy92qbVGp6NfIZ8TUKbBVLMcQXM2VN59/u6idpwHifymwV1H9RMVdNWFbIa
         2gkc2nt+ZWBZN9o2VS9eEQLjr9vSWpEbqs5TQpmLODpT/imAC7PairI0+6K8ik7vmB3n
         4jIQ==
X-Gm-Message-State: AOJu0YwkNtjq6bzfPUu4tIkTgPunofMKX53fJlnHM48Yoc+bsiI+TPX2
	4gh9Vp2/EHsTl6o8U81yrf7qR8lSvIPClHc9Hit1xMYeIrYz/h3AY0IyP382tr1nvHilK9SYBiS
	0eTo=
X-Google-Smtp-Source: AGHT+IHINXCkiw2NUljFrgeUFwhaZdwQ+fb2vuaNPpG8uSuGOg50lvCQavB66BSGklf0wD2Hp15QoA==
X-Received: by 2002:a7b:cbd8:0:b0:420:11cd:d302 with SMTP id 5b1f17b1804b1-421089d7682mr64769185e9.9.1716827386761;
        Mon, 27 May 2024 09:29:46 -0700 (PDT)
Received: from localhost ([176.74.158.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210896f442sm113388455e9.11.2024.05.27.09.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 09:29:46 -0700 (PDT)
Date: Mon, 27 May 2024 18:29:45 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	cleger@rivosinc.com, alex@ghiti.fr, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 5/5] KVM: riscv: selftests: Add Svadu Extension to
 get-reg-list testt
Message-ID: <20240527-e9845c06619bca5cd285098c@orel>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-6-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240524103307.2684-6-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_092949_519088_97EA0186 
X-CRM114-Status: GOOD (  14.56  )
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

On Fri, May 24, 2024 at 06:33:05PM GMT, Yong-Xuan Wang wrote:
> Update the get-reg-list test to test the Svadu Extension is available for
> guest OS.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index b882b7b9b785..3e71b7e40dbf 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -44,6 +44,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADU:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
> @@ -409,6 +410,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(SMSTATEEN),
>  		KVM_ISA_EXT_ARR(SSAIA),
>  		KVM_ISA_EXT_ARR(SSTC),
> +		KVM_ISA_EXT_ARR(SVADU),
>  		KVM_ISA_EXT_ARR(SVINVAL),
>  		KVM_ISA_EXT_ARR(SVNAPOT),
>  		KVM_ISA_EXT_ARR(SVPBMT),
> @@ -932,6 +934,7 @@ KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
>  KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
>  KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
>  KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
> +KVM_ISA_EXT_SIMPLE_CONFIG(svadu, SVADU);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
> @@ -987,6 +990,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_h,
>  	&config_smstateen,
>  	&config_sstc,
> +	&config_svadu,
>  	&config_svinval,
>  	&config_svnapot,
>  	&config_svpbmt,
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
