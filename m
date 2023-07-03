Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC3BEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+v4YDtCjFMNibntlkFPTUnCNjWZRSds9l2kAC/rZS4=; b=2ncgOcj8m/3qy1
	gCV1gyDICe6ZFHoWRrcoiwCtxn0CHq8OurcuI1zFgX0tk6mtD2Mcj9JMRlgoNbnwFevSBYv6OskJ7
	WlK3nn0j7DU838wFRlWJ7PsEG2EQgOJBPoOam85igeR5JHRtsYSZGdM0KMoU6vNK0BmixacE8OPtf
	v6qh5Hs+PgoWnIL3Kl4WqViUTovFwI+ZOCCX4Qla4BBGJoYTwo+HT4gfKbevFt//hfp41UC3aRSar
	JniaDLEjIIIm2orzWZCR8LHbsRQ8SKL5m7ryAlyIidRSj0cJwYGeON1Qewe6PVCUA/HhB2+eoom8j
	ogdMcIfGyfM+jiQ35+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGElg-009j8g-1c;
	Mon, 03 Jul 2023 08:18:44 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGElc-009j5p-2l
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 08:18:42 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51d7f4c1cfeso4803469a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688372317; x=1690964317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f0AIPmQjwEPFU9S6QPuv3kXAJyYa7R0ahvO9uqbNsw0=;
        b=CTXm0Evd7f9xNERgFGe8Kgf2dIrXOUMZPOBGhEgXQdvIjRhhrv5Qh3s5ENWJ09z7ev
         5wm7FiXz+iF/TvW0dDpczV2RwoT7ClRWoiG7fSddWKzNyBagcc/r7pNw84OiXN04lL4z
         wC0LmC5S4SY3KJKOoKwf0war+sU1MsM9XTZc+Scp7fmMYsS9QJtvuv34rKr0yMZAysn8
         D2fh7In8mMCQM9+yNYsq6aVEQIOZzk4aw7h/eGK/mN535gJJ9Vny0AUFRXYlZM0dEbQr
         O8A0Ma5CFWhzbHzM3joBe8qmF4w64d0CQLFSC5gbL99qho7IZPwuRlOOued1WUV58MLW
         eK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688372317; x=1690964317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0AIPmQjwEPFU9S6QPuv3kXAJyYa7R0ahvO9uqbNsw0=;
        b=e9gY+aVRZxSrNqYfjviBGmGrovlRKFKqUgmKX3yZaaYhFVJouNo0VMg3DWR0BiqU0l
         oqFlRO6BpCtlvf2vTgr2XMzTde/j+Xmqvl3VdWCsttMRjyx+exXQYhzmhV28Kq/+r3jZ
         UOdUnhi7C1e8SLo5A4ymPNmlUK2MWUbY/+/Kjfe6HfbR3eW02BSDeoCyaXG3y526fohC
         1nJuBe8EpB5KqawQ5WV2smN2nIfJYEy35RosAGjxY8pI03mYlhHXkVbJ12T/VBaPEB/x
         m2ZxiLA4epL07QUaGdMgrXWEXrlPD+YjUqVbx6ZrEZuFBJfZUU9gEXAm5KMtbUtcg+Gn
         rfSQ==
X-Gm-Message-State: ABy/qLapqgoqSy+M3ygnMDd+HCrIr5F+3Nl9Jb5R2Q92jTx150SlEJIe
	R65yvPYAbFq8ldlSGWGbH8zhWg==
X-Google-Smtp-Source: APBJJlFjFKFq1EVk2plu+5SIDoHMMxjYDFXuQ8UHkU0hLQGKGPcjw2PacRkzpqFIW8QfcigNzutaAw==
X-Received: by 2002:a05:6402:4497:b0:51a:200b:d8ff with SMTP id er23-20020a056402449700b0051a200bd8ffmr6795812edb.13.1688372316835;
        Mon, 03 Jul 2023 01:18:36 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id n22-20020a056402515600b0051e0f100c48sm1171605edd.22.2023.07.03.01.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 01:18:36 -0700 (PDT)
Date: Mon, 3 Jul 2023 10:18:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v5 10/13] KVM: selftests: Only do get/set tests on
 present blessed list
Message-ID: <20230702-49c5545eb1ae2d0cf11c7b95@orel>
References: <cover.1688010022.git.haibo1.xu@intel.com>
 <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_011840_888901_78D00526 
X-CRM114-Status: GOOD (  15.88  )
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

On Sat, Jul 01, 2023 at 09:42:58PM +0800, Haibo Xu wrote:
> Only do the get/set tests on present and blessed registers
> since we don't know the capabilities of any new ones.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/get-reg-list.c | 29 ++++++++++++++--------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index c61090806007..74fb6f6fdd09 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -49,6 +49,10 @@ extern int vcpu_configs_n;
>  	for_each_reg_filtered(i)						\
>  		if (!find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
>  
> +#define for_each_present_blessed_reg(i)			\
> +	for ((i) = 0; (i) < blessed_n; ++(i))		\
> +		if (find_reg(reg_list->reg, reg_list->n, blessed_reg[i]))

I just realized this is backwards. We need 'i' to index reg_list->reg in
the body of the loop. That means we need to write this as

#define for_each_present_blessed_reg(i)                                         \
        for_each_reg(i)                                                         \
                if (find_reg(blessed_reg, blessed_n, reg_list->reg[i]))

(Which, in hindsight, makes sense since we're replacing a for_each_reg()
loop.)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
