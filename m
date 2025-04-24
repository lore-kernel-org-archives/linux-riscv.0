Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F35C369D5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4NeoYAVlV6KUscoQg+XyVCZq7aG2Fa9umGIH6UxSpk=; b=WHuEPF5PslaC2f
	ftszYDHHfDTdSNyr0UwP2Y6+KYEFGp4fI80mphbgGbsWz95VMvfZRjlSJNCPGfqg1OD/h1E27lSPE
	MzGAeaY9vWIf+rinVBvVW3v1/uugZeBnFkQScuirchAa1njAcuADnT1BmQCq03eBjXZrx/n8huGdf
	593fDUyof9GCkxOmnnQDrP1k0zeLClh24RdvYKb05P16Kq8cXRHXivIn8JAUNGiH1kghOQQqW+z0E
	+SuFMuOWchRxt2zlUBmvmqf9DSwLpv7W768y7bKdTdzy43MIiBCu8KRem0nhptot3tUIw9BIrxB5m
	mSztTp8B4LkgSAKyi16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wxp-0000000EFt4-1SIT;
	Thu, 24 Apr 2025 13:50:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wBB-0000000E7Tk-1xP5
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:59:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d0782d787so6318055e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745499588; x=1746104388; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pq4MolfPNd+K5bSXscDIAMqQ5BwEg88636RxK2hmqJg=;
        b=Dm0M2hme6FbO9aazc3JXDYFHmQl7zTL6mZ8/IYq2An/9GqzV+rj3vJEhk8W6Lbodi5
         K0hMOl36gvPi/rAlxpWVmVfAvW/gMKw0SNu0oBgVwDBhheCu9gDT7RGoFCOza/75Obp1
         x+i4QvU5gJ2e7f/L0aRlmSZKTdzywmlCzb1oMWW6X/lScy9LnPrtwaSxpqq9s6+zH2UB
         kqMJLr0pOkrBDeOpRxo6aPrkSnX1N83fdAkW+4V+YIJJsPxVOAUUMXkhTkYDusN72/R6
         9g0WEQhz6WzAcWg/c7KFjLvUG1psaR6aLzsaKruHUHwqUv1mRGw9eOlnF107tPbGrmnk
         qAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499588; x=1746104388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq4MolfPNd+K5bSXscDIAMqQ5BwEg88636RxK2hmqJg=;
        b=XkL0gYrR72xOQ6AJXws9SUSuNm51b138oU+AAg2lwc8PCcLNXiCraasj6JMxMZ/WG3
         zastGPlGZR/fv68tVG5ozrz6dHJobPmDsxQd8ltIv2mAHJLCQ7lD9DJ8YBfxEPBtqN2i
         OikUs0sQkJGnnNrO2G2IyYutAqzU5TA8GFdRk1BWp1iGmORnGjVzZzJemt6ZHw7Q9j0/
         GqTYabAoxextFpEfxl6LtKa0XA2i34JBBOPapb3Kp3z/1e4G8L9GK5F7OXFiwXcdcPMl
         I4bEgpgXfGWz/2zsuzMc/aUinFxPhNhnTao8VS/5dCpJh7GljNikVBHi3BcGU7XR1vGa
         JYig==
X-Forwarded-Encrypted: i=1; AJvYcCVyiilh7xrrdHlGXoIFsI+MeQ0E1i7ncJLOam9Y74CQgHK1Fl34u1+e0Bx+lrnEyJeJQXMzooVekkhyTA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1zuwtxB+1yqAKY0iIvhRD8kzq9YwqXz5tnqV4xOxR7v0eKSC6
	Li90II31GN+YmaLSAgYWUbLdCRNCqcevoJ6v5BpMguJPYZbKgoYlOJr4k6NLozM=
X-Gm-Gg: ASbGncsXhwQbCjsUCTQFgr+CzE53DdgwYwdvH06GVXMZ5cYXmthRHBqI+uN19UqlPSj
	ECT//k55UJeTVd9zuzyO4ZucV05sj3REEpYL9MgNdmcL2suzLrA5LnooiYyFw+NTgBPAVoH1TD4
	E+qTFqWyHwjXS/+wKkZuDnkluob6dXwX2kEbLBovm6pyeVO5pzwwexFF7iswaWIBR0iKjhBcIkt
	BnMjyvPMpdtrMiOzei5X3Uhew1HBna6Qh2IvOLiTHF8qZ+thTNxzBdZ7P+TGtNjegHroFBsxxS0
	Mz/JKhgJX22nPy2/HA6bjAEoHYSa
X-Google-Smtp-Source: AGHT+IFsbpbMlf/oHa4o+M5HvcWy8tOY+l/DnXhzIG3RxZPMjwPTQ6efidUI/BlzMjp/KIlBUhnJsw==
X-Received: by 2002:a05:600c:3b9b:b0:43d:db5:7b21 with SMTP id 5b1f17b1804b1-4409bdaf8fcmr14760305e9.28.1745499587910;
        Thu, 24 Apr 2025 05:59:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac26dsm20167525e9.21.2025.04.24.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:59:47 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:59:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
Message-ID: <20250424-27a672c1da15353051b52c59@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-5-cleger@rivosinc.com>
 <20250424-c0700f89bcd29438d6d8d65c@orel>
 <f6c5c92d-73aa-41a7-99bb-f95e388ea294@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6c5c92d-73aa-41a7-99bb-f95e388ea294@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_055949_502700_B6AF5046 
X-CRM114-Status: GOOD (  19.79  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 24, 2025 at 02:35:02PM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 24/04/2025 13:06, Andrew Jones wrote:
> > On Thu, Apr 17, 2025 at 02:19:51PM +0200, Cl=E9ment L=E9ger wrote:
> >> Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it =
is
> >> provided as a separate commit that can be left out if needed.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> ---
> >>  arch/riscv/kernel/sbi.c | 20 +++++++++++++++++++-
> >>  1 file changed, 19 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> >> index 379981c2bb21..7b062189b184 100644
> >> --- a/arch/riscv/kernel/sbi.c
> >> +++ b/arch/riscv/kernel/sbi.c
> >> @@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct =
cpumask *cpu_mask,
> >>  	return 0;
> >>  }
> >>  =

> >> +static bool sbi_fwft_supported;
> > =

> > At some point we may want an SBI extension bitmap, but this is only the
> > second SBI extension supported boolean that I'm aware of, so I guess we=
're
> > still OK for now.
> =

> That seems reasonable to have a bitmap rather than duplicating
> *ext*_supported. If that's something that bothers you, I can take care
> of it and use a bitmap. SSE will also have a sse_supported boolean but
> in it's own driver file though.

Up to you. We can always do it later.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
