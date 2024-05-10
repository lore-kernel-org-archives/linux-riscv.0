Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FFEC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 21:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DG1hkw56Qj+sSNOMYN4wOBgzqDAEQWIuIHRmLL38AQA=; b=UKo5nTKx8UTyRV
	nvSuAf6ERS6pJpwc9+qR1lELxzvfOdgDWYwUcVqGb3jmUfQxmOAZBrFhFXOG+Nj6nKd6sJRiVwTAd
	4lkRVMd+XIWa3H4tEZpqxXvLBRF3xl2wih0ntMtuw+s01xNH57FiZj85WfVuVhcfebLH1hH/QKk30
	T31t4xh20Qsl0gcjaTzZjt53l1sSvMSJUswNMbuUo0GIbmj397Yl2wbmeTVX7pCylDWYky9iPdPH0
	Jq6mm1FCeGZ3hyqIqEKPHr4HF5LB4e7VahHnzKzdb36EGlgEMTbkvYFCQY4maBAGKPw7ErE4p+dHh
	F2K/jvAxNTXpHVK+N6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Y5U-00000006a9v-4109;
	Fri, 10 May 2024 21:47:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Y5Q-00000006a7o-3W4w
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 21:47:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ecd9a81966so25758835ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715377647; x=1715982447; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hdC9JzZ0lCEDEfdvCSKJ054LE730kwHqEMbc1syn4Y=;
        b=ZsACVSvsEKuoylP12EgyFQ75tvXY7z/olVkjevkfWGb7kqn8vYfMTaWZtnKqZKG7O4
         c1EajUmkln6RZL9pgUr8Mo46ossg3XAc/j8KhP+HOH2Sj6jZSAMKhMkVXZKkIiK/okVf
         Db7Q2pgWASdWASgupCmLII2bQPaYEFTP09R68N+uE+J6lBREwLr0zBb6J7PB5R5/XL0T
         qzcG6E9mfQVkjA/xfmlGIuveo2uDL56Sj7j/7ag8Z2UMelJ/SBwzyQ65BSsf+8wNVEEF
         QkAb1701T9SHfba04HyqTvdvHgQqwY37yb91TJgFpyNrIhiYATGlccQMndpmxbEtgBdw
         NqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715377647; x=1715982447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hdC9JzZ0lCEDEfdvCSKJ054LE730kwHqEMbc1syn4Y=;
        b=ksKXa9TdTkhq15zhJR7o4knb6jP+4HfQv8LO/POnIYGLB1MGsPVLb8ruK8m4KfiQKv
         kdEHmWF8RxUuedk06a3kOJAbRuYPq7TjmJ+Fd5lmor+s9SbqEnHTkeJDT1snVRe6czSf
         97vkNPIAaEgu0eRshI/yT24cWOIlilO/BXxlWOleFJAFq++7Vas8Rb13D7kyy1m9uqP1
         KTY4DErnI22Ng+4oyw/0xG+0C0XdIlBVa3DdX2cU3LVza81qMf+Rs3GMs4qHZAX6kWMH
         JENFsMn7dk0m+yCO/7YqEpxERvKZ1YYy6BHyUSP1aXmCXawN6oO2xqZQ+uQX/H7QVB3m
         tcnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH0NXMrV4SelfRwzJytwgDn353o3YnjO3PJLSLBgO+zkWjv0Sr8GtYBNbsx6bYkaqv1RJj/oSdijV7a6j7JSSKxUHcCO6lxjfW+5McHwKg
X-Gm-Message-State: AOJu0YwMLDwidQy30mjo2NNuK2QFrbRdUq0MQOgANdgMhzOkXFaOaxla
	McHlH9OdrX9EQscg8P1WrYPUislnxw+IjmS5JpbkQ98Xx4iT6wG4BI3PENg/W+Y=
X-Google-Smtp-Source: AGHT+IEl8b0mhum+JV+b5DTSd1d3OjZ5PkTdYwtDqzJoyrI4CLabnHCiu4RAY/rQcDa9u2oMv/FfGA==
X-Received: by 2002:a17:903:234c:b0:1e8:682b:7f67 with SMTP id d9443c01a7336-1ef432a0c85mr53371555ad.29.1715377647449;
        Fri, 10 May 2024 14:47:27 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c038ce5sm36930875ad.195.2024.05.10.14.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 14:47:27 -0700 (PDT)
Date: Fri, 10 May 2024 14:47:24 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
Message-ID: <Zj6V7N96odmFk4ni@ghost>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
 <20240507-divisive-swoop-c2737a2d9a9f@spud>
 <20240510-childcare-outlook-d18e3cc5ccb3@spud>
 <Zj6QxisrBZSWq7ax@ghost>
 <20240510-unexposed-desecrate-e30674d4530b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510-unexposed-desecrate-e30674d4530b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_144728_906421_D4D2E2DB 
X-CRM114-Status: GOOD (  30.06  )
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

On Fri, May 10, 2024 at 10:32:19PM +0100, Conor Dooley wrote:
> On Fri, May 10, 2024 at 02:25:26PM -0700, Charlie Jenkins wrote:
> > On Fri, May 10, 2024 at 09:50:32PM +0100, Conor Dooley wrote:
> > > On Tue, May 07, 2024 at 06:03:19PM +0100, Conor Dooley wrote:
> > > > On Fri, May 03, 2024 at 11:18:21AM -0700, Charlie Jenkins wrote:
> > > > > All of the supported vendor extensions that have been listed in
> > > > > riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.
> > > > > 
> > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > 
> > > > This seems fine, thanks for updating this interface :)
> > > > 
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > Hmm, actually the automation on patchwork is complaining a bunch about
> > > the series, but I think that's mostly false positives except for this
> > > patch. The nommu defconfigs are prob the easiest way to reproduce this:
> > >   /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:41:55: error: 'struct riscv_isa_vendor_ext_data_list' has no member named 'vendor_bitmap'
> > >   /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:42:60: error: 'struct riscv_isa_vendor_ext_data_list' has no member named 'per_hart_vendor_bitmap'; did you mean 'per_hart_isa_bitmap'?
> > >   /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:43:60: error: 'struct riscv_isa_vendor_ext_data_list' has no member named 'bitmap_size'
> > > 
> > > Cheers,
> > > Conor.
> > 
> > The false negatives always throw me off.
> 
> Aye, it's pretty frustrating for me trying to report anything. Any time
> a bunch of headers change produces a bunch of file rebuilds and
> therefore warnings. That should in theory be caught by the fact that we
> apply the patch & build, jump back to HEAD~1, build that & grab the
> "before" warning state and then jump forward, rebuild the patch and
> gather the "after" state. The idea is that that is an apples:apples
> comparison as the same files will need to be rebuilt for both but it is
> falling over somewhere. Maybe I'll have time to look into that soonTM.
> 
> > The errors are also offset by
> > one patch.
> 
> Ye, that's my bad I think. In a rush off to another patch before the
> thought I had on it left my brain and just pressed reply on the wrong
> email. Sorry bout that :)
> 

The error message in full is:

Patch 7/17: Test 2/12: .github/scripts/patches/tests/build_rv64_clang_allmodconfig.sh
  Redirect to /build/tmp.OCcmyhkGEw and /build/tmp.TsjyVLqMfy
  Tree base:
  fefb1e9ecc34 ("riscv: Add vendor extensions to /proc/cpuinfo")
  Building the whole tree with the patch
  ../arch/riscv/kernel/vendor_extensions.c:41:42: error: no member named 'vendor_bitmap' in 'struct riscv_isa_vendor_ext_data_list'
  ../arch/riscv/kernel/vendor_extensions.c:42:46: error: no member named 'per_hart_vendor_bitmap' in 'struct riscv_isa_vendor_ext_data_list'; did you mean 'per_hart_isa_bitmap'?
  ../arch/riscv/kernel/vendor_extensions.c:43:47: error: no member named 'bitmap_size' in 'struct riscv_isa_vendor_ext_data_list'


It knows it's on patch 7 but then it prints the title of patch 6.

- Charlie

> > This was actually introduced in the following patch "riscv:
> > Introduce vendor variants of extension helpers" because I accidentally
> > fixed this issue in the patch "riscv: cpufeature: Extract common
> > elements from extension checking" instead of the one it was introduced
> > in.
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
