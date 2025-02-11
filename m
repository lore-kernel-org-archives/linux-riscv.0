Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAE3C021A2
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAr8dB3J6XHfpG0tRr1Y6tM91fiBXv+Nf1MpbyGZaQE=; b=3Z+a0bRp7n2CdaqXq3R815BYzR
	J2N0r6jEFiwSGYz96omMpmC5QP4SpoLvFAKea5oS4uupHsmqFeq0lZFcIXk4qYcIuAqh4kfNFBrao
	OxYaEk3fpm0evuM55bJlz1ntYBVC4D4uMc5teVk59qj5ioGZ/2Guxag6CWCUZIuyPoKQ4HwUGM64E
	+I60vCmGbYl1xwgWy/MqYxlYacOBOjV/aR6fUKaSGGCPfVJQg63H5OlK5mwct5291gPmdyjtMhoJD
	dH3LM0m/UCCIhJkxOzAhPK+Glf7BVGzofmnOyZA/MLzauAybxb0pLmhFoUa4xTQx1F7jidizg1E3u
	WebiLjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tht4C-00000004UZq-2IQ2;
	Tue, 11 Feb 2025 16:24:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsok-00000004Qb7-1FEi
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 16:08:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f48ebaadfso97202035ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 08:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739290137; x=1739894937; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fM6tMWdfzkcGZeMu8sbljrtpDaDJ3qlk57x3dLx9yP0=;
        b=qFObyTMrjb5UH893h+bE7YUQMt5eE7ynv6iwQiXJaWGzKBVfg1H/epXaQzZw/rKrmW
         nFcLXHWjbo82UPnwxK2shMwJUInAL9aWs/EHUMa1k8xuBu+/H52jU6FuOppv9dr71yQh
         UNwKS1NUQD0yP2F4rC82EjXwj0Q5WH3S+xCYoW5lZVDhrnBhuL+YkR/QM5gV4PGTtNHB
         AYAkdlhlhkORJ3Mpcd4gXJnZGpoqWhelLFJjnQoSy5NoOO61QeVRSFcOysD/m66RkXUS
         p04inYlW91ey/JC82pKNC5jyl1+KJZjr+/nEz554UMHP515Eueu3J/n9j31WXErMB3nO
         Wl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290137; x=1739894937;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fM6tMWdfzkcGZeMu8sbljrtpDaDJ3qlk57x3dLx9yP0=;
        b=fjZ8tCbuyddaydrl3BViINDJKSIgKszPZoKlvOwMM9oG1lqQ2A4aEXuWsCPRbvkpOG
         5nx3EwOvEjbHZf6tWGIXRxiptvMFmv14XlfiOlS1Uc8BYaOOnJ0iddKfvW9svQcpmCuM
         UUDeflpjp/YnjysNuIW8nuzgogWEporivbugQa1WPGkpRwlp2IdSt3d6Ir1edFTLC6dV
         MemMmt46R+3XD75TrOkia/nvZEE0OfbKL4rnWXXVT+mR64jOH5rp7HRiTVi2Xdb+rboY
         juPRBze+xoCmv40vTu62JcfYtM9BdYEInKeNjBgwD//IQt432oFtKmHHGm1BLaGhHoeo
         +sFA==
X-Forwarded-Encrypted: i=1; AJvYcCUQXyCXjRrTSccFY6M+NUraCEXkV9IQEIAR4l1WEvEcMsTpTOdQASe6h52BUVMZveDTwFHmbZJQIj6r/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiX0a1KEGAoVyTbK5Z0Q19BNHtug3GhkSNXKtvgaWeCQ7bNs3y
	23Sy4GEHNTL30VdKP1oGdP8FciXJo+/ZeJtMo31ZveyfpZaa16EQY73r1uj5/5E=
X-Gm-Gg: ASbGncuWiqhl8uWGIRGTA6DPHJpwGz6QWuvdHYL3IsfK+h1qEJwo25bRzHy0OixHuUP
	3ZelE0Uw3UTCuB9kt4VsMnLMqOZM6YfiXc5tzZiuwfUpKLOq5MeU7LiYun63SXmlaC9BmcPYG4B
	Q3b7cyl0+7/MOI97CIqm9OhCAaEDpJZiOfefyVNo7Vo+2Edc0ptw6q6X6rWRf3C/UuMVz3nLmJs
	cBLoaOK2K674FJD4RwDFrAr1ziXVovV9cgIj5svxENtVWbSe8JWOty9gGl0BBstxmrwT5cAjAvS
	A1s19xG6nDFQmW+egaM67wsTeQ==
X-Google-Smtp-Source: AGHT+IFZ7zG8kNq32XbGzHizA+/obYPBTcZQNtVCcsm+yZBTBiOP0hgDR8QeXXdRboljfbChEW5/qA==
X-Received: by 2002:a05:6a20:6f9c:b0:1e1:c054:4c58 with SMTP id adf61e73a8af0-1ee03a22be8mr33720540637.2.1739290137163;
        Tue, 11 Feb 2025 08:08:57 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730887b0fa8sm4433085b3a.8.2025.02.11.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:56 -0800 (PST)
Date: Tue, 11 Feb 2025 08:08:54 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 14/15] RISC-V: KVM: add support for FWFT SBI extension
Message-ID: <Z6t2FsP91rUNv64D@debug.ba.rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-15-cleger@rivosinc.com>
 <Z6rjkk5JlMlqbl2j@debug.ba.rivosinc.com>
 <a8af5d3a-e739-4f65-9e2d-d92978be9a3d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8af5d3a-e739-4f65-9e2d-d92978be9a3d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080858_591934_B6C91789 
X-CRM114-Status: GOOD (  17.40  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2025 at 11:31:28AM +0100, Cl=E9ment L=E9ger wrote:
>
>
>On 11/02/2025 06:43, Deepak Gupta wrote:
>>> +static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long
>>> feature,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long *value)
>>> +{
>>> +=A0=A0=A0 int ret;
>>> +=A0=A0=A0 struct kvm_sbi_fwft_config *conf;
>>> +
>>> +=A0=A0=A0 ret =3D kvm_fwft_get_feature(vcpu, feature, &conf);
>>> +=A0=A0=A0 if (ret)
>>> +=A0=A0=A0=A0=A0=A0=A0 return ret;
>>> +
>>> +=A0=A0=A0 return conf->feature->get(vcpu, conf, value);
>>> +}
>>> +
>>> +static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct
>>> kvm_run *run,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct kvm_v=
cpu_sbi_return *retdata)
>>> +{
>>> +=A0=A0=A0 int ret =3D 0;
>>> +=A0=A0=A0 struct kvm_cpu_context *cp =3D &vcpu->arch.guest_context;
>>> +=A0=A0=A0 unsigned long funcid =3D cp->a6;
>>> +
>>> +=A0=A0=A0 switch (funcid) {
>>> +=A0=A0=A0 case SBI_EXT_FWFT_SET:
>>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D kvm_sbi_fwft_set(vcpu, cp->a0, cp->a1, c=
p->a2);
>>> +=A0=A0=A0=A0=A0=A0=A0 break;
>>> +=A0=A0=A0 case SBI_EXT_FWFT_GET:
>>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D kvm_sbi_fwft_get(vcpu, cp->a0, &retdata-=
>out_val);
>>> +=A0=A0=A0=A0=A0=A0=A0 break;
>>> +=A0=A0=A0 default:
>>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D SBI_ERR_NOT_SUPPORTED;
>>> +=A0=A0=A0=A0=A0=A0=A0 break;
>>> +=A0=A0=A0 }
>>> +
>>> +=A0=A0=A0 retdata->err_val =3D ret;
>>> +
>>> +=A0=A0=A0 return 0;
>>> +}
>>> +
>>> +static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
>>> +{
>>> +=A0=A0=A0 struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
>>> +=A0=A0=A0 const struct kvm_sbi_fwft_feature *feature;
>>> +=A0=A0=A0 struct kvm_sbi_fwft_config *conf;
>>> +=A0=A0=A0 int i;
>>> +
>>> +=A0=A0=A0 fwft->configs =3D kcalloc(ARRAY_SIZE(features), sizeof(struct
>>> kvm_sbi_fwft_config),
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 GFP_KERNEL);
>> nit:
>>
>> I understand that in next patch you grow the static array`features`. But
>> in this patch
>> `ARRAY_SIZE(features)` evaluates to 0, thus kcalloc will be returning a
>> pointer
>> to some slab block (IIRC, kcalloc will not return NULL if size
>> eventually evals to 0)
>>
>> This probably won't result in some bad stuff. But still there is a
>> pointer in
>> fwft->configs which is pointing to some random stuff if `features` turns
>> out to be
>> empty.
>>
>> Let me know if I got that right or missing something.
>
>So I actually searched into the kmalloc code to see what hapopens with a
>zero size allocation and it actually return ZERO_SIZE_PTR:
>
>/*
> * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> *
> * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
> *
> * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL
>can.
> * Both make kfree a no-op.
> */
>
>Which seems like it's not really random and will fault if accessed. I
>think that's enough for that commit (which will be bisectable if needed
>then).
>

Awesome. Thanks for looking into it.

>Cl=E9ment

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
