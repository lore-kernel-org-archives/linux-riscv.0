Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED13ECCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1ZONPQTVmY9YdfA9cdq2G7SaXaM/iIc4/ZZCqpLdLI=; b=r3CD9Igr2oarab
	TQHzcjTlXe7uCpTATZYerBKEn0x5cDv/sPevyG5mkYmMxvI3ZvRO5TGg1qXoPvx0Ty7GqnrKGDcU9
	FLD/EZoptVqjkm4Oq25N1/mhbXZgU1YbxmC1nV0qUH0+vGwAr7zSsAnO23Zg5hPki/2pAH60snLRq
	kCGUQjbATFL8un+brK3m6Z/oPWEaS+nImRLjTkX50vvS+CnHghqeehcVEPdKmoKCF/wVzQ5KPODoW
	BsCtvC3G5wo+Z2eF0fssi9ByZJUBcbnlx2MdGuPkgngHbwd7laVM4U7kfEHGacW8bDH4lZauvoZlO
	1OrAyCKEu3MhjpEYQ4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nBj-00000008Pqn-3mQW;
	Fri, 17 Oct 2025 16:20:19 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nBh-00000008Ppg-1FX9
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:20:18 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-430c52703b3so12853215ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760718016; x=1761322816; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GLnYMiGE1i6wdt2kWbvCEK+VTfi2UEFuvCxtEUGWUPM=;
        b=PvoA/RzcF1MiYd1WPC7JiWkbl+ao/1n+Ub+HD9FMLiGdq72JtPp0VH5dSjwZ/4LXa7
         5NdJhiAHWCu0n3qDgkd1wIYV4oJSKs/s8O6ZGSWEDc+2KA/rCyGhVhUZbL+BttEGOdP0
         6C5JULeuhsAF10/+pqWSv/Rzf1P5wkqS2355uqyqbOibbC/9dhdv8DRRITJqzZuRI3GG
         Z9v7H4xYrNuFr6rkoN4uDZTAA0zVPpim29/XOINDe4FkVoi6oHSXdt+Gw4aEmM98LJnK
         v5uo0722G/zNrBfjf0x7PDE1NVNgCJiJg1w9KA1ANH9ixbhZ6IB4r0p+Iq2RKBu6An6V
         QVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718016; x=1761322816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLnYMiGE1i6wdt2kWbvCEK+VTfi2UEFuvCxtEUGWUPM=;
        b=AhWGbUQCGENed8y8+v7d1GiIAzX+iMEy/sLU6Dgfb+THR1oUxgYyMRULMdvfCSFTAv
         pslgrrOFnbGWWNM1de9NNLB2NCzs8Bp7U5n0pph0+qU6IeSUQpFVBbRXszTffctANoQe
         fNs4WUHWTAichuSGy2P1haypGt5rYr1KWYPpZ2FMP97XSc3ZmYz6t0+u/0YpKgcQQ0RA
         nzsxNur9c2FCl42WImb542NjhVTjIjWvZ0k1ir9qaCQWoDS88J47PaV0JpAgl0UhXky/
         ihoiMfZZZuovMJ0oG1SwDr1ONG8kGv1bGhx39rUc+tvapfJq7gQC7GjXz6Rp9MNtkSGe
         Z8ag==
X-Forwarded-Encrypted: i=1; AJvYcCUKpHZAZ3AyAIG09Zghx6TSSxmjJocC8/kTv8bNq8Rb/Xm6DwUnpT7xNWimSKu+Sd7saJkqj4BoIA+fNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz8m7SKfFNnONH2Wqs4lRJJ5bR7pQ8ZMSoKMRarwtlT+DAT3j/
	L34E8yEGRf9w5gAQxlFam9e6mLcMQXf/zhqFtuU02NNIW/ZWIt8FL6qm/70PBorQTdg=
X-Gm-Gg: ASbGncua/Phrv6HXKxTgcrPlhN0AGrETHtB+5zuikQPTCbSmbqHpTODFoS4fVXlk8C6
	MZ3Iy6h3MZMtb1tTVOjsl95xz8f9D1f5xIlzK7PDxBzNclFgNhlhVSWX/ukKx8FjDE4auF+JLiu
	CjngrqQKKaTeZ1gaE+HMWOSn/oWfeLmUmqoh5DbbIsualSoRyFVK3ruWiLmwrxvSVKGuXofoWWW
	Peqnf1FrZdz9TJBXB+Q1BWVR5dYUeydERws2MIGuJk4A1lWKTW110F1HydzNAPEZ1gMkTdMs5T3
	TbfBKzTvZKlPXqcmjAtexCEeRIugjlzwL8YhB56GJbATruN0HoUai9ONFoRUYVvuBJ2AtJAUvHu
	LAhC70VznNAln3WMRc3ia2OZ/pi5mnGVb4EQdjDVgT/IpO3qJTyJFupAm4xooUMPTCs/ej8bh5K
	CcU6o/w+Iaq07g
X-Google-Smtp-Source: AGHT+IGx0p/Murx0/nwCjsggRoQIsfWi9xXyoIzQDYLWIYmSzYKlABJ6zEfQQ5rWYKVGG7cg4jaAGA==
X-Received: by 2002:a05:6e02:1a66:b0:425:951f:52fa with SMTP id e9e14a558f8ab-430c5275304mr65365645ab.14.1760718015987;
        Fri, 17 Oct 2025 09:20:15 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a95fecfcsm22608173.13.2025.10.17.09.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:20:15 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:20:14 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/4] RISC-V: KVM: Add SBI MPXY extension support for Guest
Message-ID: <20251017-cfdb6c77b74b87b784a3bd35@orel>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
 <20251017155925.361560-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017155925.361560-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_092017_331260_A8170889 
X-CRM114-Status: UNSURE (   9.35  )
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

On Fri, Oct 17, 2025 at 09:29:24PM +0530, Anup Patel wrote:
> The SBI MPXY extension is a platform-level functionality so KVM only
> needs to forward SBI MPXY calls to KVM user-space.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 1 +
>  arch/riscv/include/uapi/asm/kvm.h     | 1 +
>  arch/riscv/kvm/vcpu_sbi.c             | 4 ++++
>  arch/riscv/kvm/vcpu_sbi_forward.c     | 7 +++++++
>  4 files changed, 13 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
