Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933F2CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIdy4Um84r/OWOyMuFa94m/agnfn7dRFx/BEL4TZD2w=; b=E0jRrrym5HOA7ZsEPDGuCSTQfd
	rq9CjIQVbuXroD2ub63Kw4HdIEtO+AN9Qm6ZYWIDIBQN9GaB0P2Kd3X2BAnpEcddKewaAxODeZh45
	xgwu/Kf+tMakIPH93XPf/u1nz0TkN0r3ppIksvrlkuVchYJDTYIP2Dndw4yaUx9U3Utxk8S3Jnoy/
	mZ311izVlflhWj4PjvwLq7VRtxX7xJTdDhvcOEy0le6YrR8lCG0cI5deCJyAjE42Jn39/eaPNKi2C
	zOmhhOCG7911P0qxKeplTNCDQn3Q9hawBcwGvINJwZEzxsJYNFqlFZ7FWaQPxy0mgm0Q3wxfw4a8y
	09PP35/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUnz-00000004MPM-0yeT;
	Thu, 04 Apr 2024 21:39:31 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUnv-00000004MNr-1zBA
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 21:39:29 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e0f3052145so14195855ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 14:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712266764; x=1712871564; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPArP3ejLo3l+aX8ToKGJxurh8OEHx4iQxc5XkqOF4g=;
        b=xuC5eFKy/TnCpT19uEPz8v9RbGWJbCSK7eBy6VMMeBkL50m4tKI3YJwML7LytO92yi
         jsP6rnSEJvJkza/ktVs0J0Im1WQ5BzOZIAyGu9/MhctN4Czwm7I8Ba7e58NSc658qiX+
         YlK8yufr8eJXZPLJ/NCQPzYYe2YhmUjWgENXXwTz9C0rCM0vgmzYI7iMdcYmQA263gQ8
         HohfRv/cucOFo7cjxxW92QuKi7DmBzeOuK+9AIDhCMyvUos11KqxyZjEtz6bvL0t2LQu
         TAZc1IeHgeOgkjuJI+Kmk32P2/DZU5aOlc9NOtcyJ+FpuR7FHm7ggbe76TEHB/avvQt9
         SebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712266764; x=1712871564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPArP3ejLo3l+aX8ToKGJxurh8OEHx4iQxc5XkqOF4g=;
        b=jUvRrGJxJjwYZIZ0PYOghn/NZNqZ8qmHuJimSMjk89w9k9k/wJNeyawBsXBI0VnDe9
         jb33SD8V2vypTICoxld0NMZA+7soJut+bWdQj0NkD2+ampaRWzRFnh4FxznLc+os25F2
         5xjO5IfsQqKjA/KauSMak4aKsD9wRWnO3EMsz3V8jxe3xu0Rt5ClBvAvgic0MQRkBJRL
         9RnjpXXhJUTlg1UOJH6MJ04qSfgzoN8m1PuBO52dfrkwYQAj+85G2Ndn2It87+QH9hqX
         sYi9BTmZ3AibvdHGejD4Czv14bdD+VfP0w/GPIO2X5B+Oat/xAgbv4ZpYyfQKIimFNy2
         akrA==
X-Forwarded-Encrypted: i=1; AJvYcCXX5XUufdb+C8DXA3plgX7ISqPZMj3VAmWGcFiHobWxh8wW3QoXWGnUWy1L6V/k1KytWhLlHvgaZ43yrZGT8LXGmTex7oCcxNkAP/CA2JZU
X-Gm-Message-State: AOJu0Yyhz6MZm7Tub5ZLwo5li6xKjfyUTKBqjJ/TOnzNzp8+Dry2H9tu
	IZENb/WiHAjF0tDTzNtxusaCPKXxB0IKRq9nP7SgJZwmSxG+WhcgsZS59U6vX8I=
X-Google-Smtp-Source: AGHT+IFPYkwFkCWA+SA7mff7SB9WJfJBYnvlFHy9eSaPUSq9JIjSJtsLm/B02BDU1sUJv+HfqHd+4Q==
X-Received: by 2002:a17:902:f68a:b0:1e2:887a:68a7 with SMTP id l10-20020a170902f68a00b001e2887a68a7mr4103646plg.33.1712266763893;
        Thu, 04 Apr 2024 14:39:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id l10-20020a170903244a00b001e29833ada6sm89367pls.140.2024.04.04.14.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 14:39:23 -0700 (PDT)
Date: Thu, 4 Apr 2024 14:39:20 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: David Hildenbrand <david@redhat.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, catalin.marinas@arm.com, revest@chromium.org,
	josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de,
	omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 09/29] mm: abstract shadow stack vma behind
 `vma_is_shadow_stack`
Message-ID: <Zg8eCPJvmk93vKQK@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-10-debug@rivosinc.com>
 <c438ea3a-24bc-470b-a2eb-6e7517bd4362@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c438ea3a-24bc-470b-a2eb-6e7517bd4362@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_143927_629551_601B224B 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 04, 2024 at 09:02:17PM +0200, David Hildenbrand wrote:
>On 04.04.24 01:34, Deepak Gupta wrote:
>>  		}
>>-	} else if (!(vm_flags & VM_READ)) {
>>+	} else if (!(vm_flags & VM_READ) && !vma_is_shadow_stack(vm_flags)) {
>>+	/* reads allowed if its shadow stack vma */
>>  		if (!(gup_flags & FOLL_FORCE))
>>  			return -EFAULT;
>>  		/*
>
>Unless I am missing something, this is not a simple cleanup. It should 
>go into a separate patch with a clearly documented reason for that 
>change.

I tried that here
https://lore.kernel.org/linux-mm/CAKC1njTPBqtsAOn-CWhB+-8FaZ2KWkkz-vRZr7MZq=0yLUdjcQ@mail.gmail.com/T/
But at that time, VM_SHADOW_STACK for riscv meant only VM_WRITE. So I think
there was obvious uneasiness with that part.

Now we have VM_SHADOW_STACK pretty much same for all arches and only 64bit.
I'll try it again as a separate patch.

>
>-- 
>Cheers,
>
>David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
