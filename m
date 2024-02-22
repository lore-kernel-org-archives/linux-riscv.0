Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CAEC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 00:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4Tc26Ar9RgxkuUVX1CrpyJ2hMFwrk0+6iKi2sZSxTg=; b=BsGraXc529+/WjBf1a/vv55ghW
	OaUaW575PIp3HCw0H0ynyjsu6x/V2a+9zNrraj5la7VUzByU2yhd+X5lEXWY7iSY5K5ZVW65aBJEk
	9nRoRiiZImj/5zjiSeW1chHq548nNsM5LG+c2jaE55WSZQc054KnHjlyqi03ob39b5tk/K9nuJ8WB
	/q/IwWWubKLSwIrmLQu5DdTYwg+xR9HlSq+ALvrLqag1kAl5KXki0aOLgKUtvrVtfRBZTG7eRMx7r
	R2rwgWpT8gufa1hDEM3H2miWny5UWogW8rWc0mjSBn05Yb95fT2mnhyOMQBXxL6DSfKaajViId5yu
	vRbBkzLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx8D-000000034Ye-39Bs;
	Thu, 22 Feb 2024 00:40:09 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx89-000000034W2-3ZlJ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 00:40:07 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so5599246a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 16:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708562402; x=1709167202; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3cPh5EYVwGWaYgvsr8YLKJcb0/yJUuFAluKjFfz/1Eo=;
        b=oIO1U5/F2vnAp+NMuaNX3I2CgLYMtS8V968GaF0hIObOFH27j1/1e+50EHKVCW69wj
         3Q5wIKu+nlZQ4/HsfVS7fmkjRiqhNiydmwczvK8bdCzwpzdxhDXF9jIvEeKsGJdNr2sr
         URhbhZHoSFWNKTvUHRqvQ66kLE/c3Nv1e9uHHmE7QCcnfiRfycgTz01xlsLMhKktiFBL
         eiRgGgZM1jt9I3xrkXEw42zb3+dpOdPbPTzh0m4W3JXBC4CNoRSFMKjy8ZY8qCZrrmxu
         NOkxcHS4JXbON8A5mccOREKitHaByA3O1RFZkewmVopTejIWGynrrf1lUerQz2HRbmSn
         hhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562402; x=1709167202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cPh5EYVwGWaYgvsr8YLKJcb0/yJUuFAluKjFfz/1Eo=;
        b=mctUI6NRPBmBtGOv9YFhR5+K1ThlTgH1NBMz51c7T1k0ZCao5uIdt5YmXy2IwuWTFT
         xZ0rZOI0ewVeToL0t6k6ywevbEUvI+vi89m/ibuua+HgmW80A4DIkY349eTq+EdEhXAo
         TimVDBKHLkDYzFNoG5zHddK97WHk3WExm3Apf1pivFX0A+DGNjrE6CEI7Y6WaeZff22b
         ML+p5xUZroT1Ce5iQd8HH9MkJO6eyVQRRrKXIy/ODN7okkUVZWD3avV/gaplVwt7yJcp
         na6apwAegNGg7skbgximZTp1z9mK247sAGajn5AVTNR14dHVV4Ee/sZz+ZPMZtzJG5B3
         3Nnw==
X-Forwarded-Encrypted: i=1; AJvYcCXaLl2hYmH3i2SaIsyl8xWqxpT/iiQcZvoOGfSvxRhmFrGDe1N+0GR6UjSWQ3RW7cOlyGV+MjxNFRO3kKiQ1YJ6LEEl7HPRLw0EIn1pUVNF
X-Gm-Message-State: AOJu0YyOHDJ5g4TX3HCGnFwO6p5LXZlbR9KleY/2TvOVxVkGy6CCmL1y
	Qt4bHy+FttVo0hbI24ny/Q2xVcaQeTX5A+tKxhV2XeAtv3f2AGTw43lJkA4f9+s=
X-Google-Smtp-Source: AGHT+IGotfMmm5x9Xi19DeFfmbyjknJKTAh4y49q6+Q/YPgYYL/De9ObYQYYyxWmR72uNSf6FbQ1Zw==
X-Received: by 2002:a17:90a:72c6:b0:299:4fa7:71e5 with SMTP id l6-20020a17090a72c600b002994fa771e5mr11324761pjk.8.1708562402076;
        Wed, 21 Feb 2024 16:40:02 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id qc17-20020a17090b289100b002993743e4a7sm2480570pjb.20.2024.02.21.16.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 16:40:01 -0800 (PST)
Date: Wed, 21 Feb 2024 16:39:57 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>,
	"josh@joshtriplett.org" <josh@joshtriplett.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"gerg@kernel.org" <gerg@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"bhe@redhat.com" <bhe@redhat.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>,
	"david@redhat.com" <david@redhat.com>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"panqinglin2020@iscas.ac.cn" <panqinglin2020@iscas.ac.cn>,
	"mchitale@ventanamicro.com" <mchitale@ventanamicro.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"revest@chromium.org" <revest@chromium.org>,
	"mason.huo@starfivetech.com" <mason.huo@starfivetech.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"baruch@tkos.co.il" <baruch@tkos.co.il>,
	"waylingii@gmail.com" <waylingii@gmail.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"ancientmodern4@gmail.com" <ancientmodern4@gmail.com>,
	"mathis.salmen@matsal.de" <mathis.salmen@matsal.de>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"shr@devkernel.io" <shr@devkernel.io>,
	"andy.chiu@sifive.com" <andy.chiu@sifive.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"vincent.chen@sifive.com" <vincent.chen@sifive.com>,
	"greentime.hu@sifive.com" <greentime.hu@sifive.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"willy@infradead.org" <willy@infradead.org>,
	"zhangqing@loongson.cn" <zhangqing@loongson.cn>,
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>,
	"cuiyunhui@bytedance.com" <cuiyunhui@bytedance.com>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"ruscur@russell.cc" <ruscur@russell.cc>,
	"shikemeng@huaweicloud.com" <shikemeng@huaweicloud.com>,
	"jszhang@kernel.org" <jszhang@kernel.org>,
	"jeeheng.sia@starfivetech.com" <jeeheng.sia@starfivetech.com>,
	"alx@kernel.org" <alx@kernel.org>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"omosnace@redhat.com" <omosnace@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"evan@rivosinc.com" <evan@rivosinc.com>,
	"bgray@linux.ibm.com" <bgray@linux.ibm.com>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [RFC PATCH v1 11/28] riscv: Implementing "PROT_SHADOWSTACK" on
 riscv
Message-ID: <ZdaX3ckwaKO7YB2Y@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-12-debug@rivosinc.com>
 <2914cf78e47010e195d963857b37807e8446e3be.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2914cf78e47010e195d963857b37807e8446e3be.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_164006_144517_1D3F0ACD 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 09, 2024 at 08:44:35PM +0000, Edgecombe, Rick P wrote:
>On Wed, 2024-01-24 at 22:21 -0800, debug@rivosinc.com wrote:
>> +=A0=A0=A0=A0=A0=A0=A0/*
>> +=A0=A0=A0=A0=A0=A0=A0 * PROT_SHADOWSTACK is a kernel only protection fl=
ag on risc-
>> v.
>> +=A0=A0=A0=A0=A0=A0=A0 * mmap doesn't expect PROT_SHADOWSTACK to be set =
by user
>> space.
>> +=A0=A0=A0=A0=A0=A0=A0 * User space can rely on `map_shadow_stack` sysca=
ll to
>> create
>> +=A0=A0=A0=A0=A0=A0=A0 * shadow stack pages.
>> +=A0=A0=A0=A0=A0=A0=A0 */
>> +=A0=A0=A0=A0=A0=A0=A0if (unlikely(prot & PROT_SHADOWSTACK))
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EINVAL;
>
>Are you sure you need PROT_SHADOWSTACK? Since you are passing
>VM_SHADOW_STACK into do_mmap() directly.

Sorry for (very) late response.
In this patch series since VM_SHADOW_STACK was an alias to VM_WRITE.
And that's why I needed PROT_SHADOWSTACK to disambiguate.

I am updating my patches and going with ARCH_5 bit (and thus only 64bit sup=
port).
So x86, aarch64 and risc-v will be using same bit position.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
