Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D452C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 00:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZgd0Yqwdt+OxmK+q+JVP7991m5+jVfXv/LvhQLwsqk=; b=rzXywnJVrY+lr1OXmCbSDvPoyy
	PMX22N6pTDemt2mrAmmhUlc9XSY2IiXDogcd2PQHvFsdx34IMCUq/Ry5cfQsCK4ytIMemsg5QzZ42
	7GFPwLsqoEd6S0B+quJ/qhuTLUOouxdp+hMu+EZdjF36Oq3A1bYcFBH9r88+8elzJQzz1ujCs0zyx
	JWJe8kj0PyMSl6T/nUSSN2zoWQOZ5Y/alZ2Y/uyuooZbnxt/oSP6rtFsYshptQn02vQDT4+rCKz9a
	4cI4P6F5u8YjLyoMJoObMkjef1JQV4uk9AVmKckvlyonoO4XoDMR+UKzfhUCkw8MiTvaG5GvLxUBi
	3wH8yAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcxIO-000000035xX-1Vzd;
	Thu, 22 Feb 2024 00:50:40 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcxIL-000000035va-3oe0
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 00:50:39 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e435542d41so2798792b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 16:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708563035; x=1709167835; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ne/cwIuCR8FyBAFcmxTad9FZ51QKgKQ/8n60a6xKD8=;
        b=cx6UTCOXtWIhF2jfRI6rlM+n6m8554Xe8PakNk/evQ8raQBziWJFiheNnsM0B+qIVN
         KrljO1g0b3F1dvrK+O0uYcNR3rkfg01HEVo4xIrtZnkeWB4mo24xqprjD+q8OHnrUGjH
         hoe3kf9JtmvLWmnCFlmuQHyrTerE7daJjHzMHJgU6F8ktdyIxhnb86ANmxtqqbD2gQiz
         aHqo9BwHssmt281BJWUrvWYVRUh5uxy9q7xwJRkelAqioQIhHN5y1q4OQxAatEbtrfCo
         VEk9DWAl+z+KqUSpQkyXoCEU3l3UfDrt56zLwOMLWz8cXuTXUa0rp37gET1WWKCd+GsG
         v/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708563035; x=1709167835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ne/cwIuCR8FyBAFcmxTad9FZ51QKgKQ/8n60a6xKD8=;
        b=QwtLqrIeNx6HYYbt3A3iJ2srFSkriqQX9zUSxLHl8yk+FfBrvKqQSMIwK7uB9MREfe
         q61JJBil5LoexW8XmvBickl/qlwlwgUaDb+qujQN3boT/8mI+NMXsCjrqrXfV6OqzARv
         n3RCjST7xVL2OlVIQMEdY9xlIcc+QE4DpDf8QJDVy9il/KFDyE3J31t5fMwoMlUrRakw
         BmkYNZMqH+E9g2pJutJ7e6W9tJSjONvxNUNktMpdfoa7JJFBTAj/ktA34k/KntNpoLMs
         G3f+VU3a0/mjbrlX7kmsufI/7G9SVx6RfeuSiO9icnDYnAk3b16f3F2FvaPgrYp55DB/
         tcBA==
X-Forwarded-Encrypted: i=1; AJvYcCWZVyBNmF2PWI+q6Mj2VX66JB7Q6T2R/SFsX2Itzw/FKHIKCQBcefwDgN+3Kd6lxpJZ7/yQPFajCYPbARpfB+bdOkYsUytHCgzr5WHOw+5+
X-Gm-Message-State: AOJu0Yyl6+pELqlX4WdNYPAJCLpdM2T9/9NYwkb6qlJdvzOq7CVOuT7K
	J4Xk3WJLcvXkMLA5Bci46qh1WIp56ySNDvIZpVQYW58hwSQxTkYrEYhCDx4xm7s=
X-Google-Smtp-Source: AGHT+IHGf00IBRZ94uXhy3F/2SqhItEAHmbVU+XM+K8PgG8OtyyJ9+JfcyGA+LZi58DTqhZ5nGjLug==
X-Received: by 2002:a05:6a00:ccb:b0:6e4:7b26:3f28 with SMTP id b11-20020a056a000ccb00b006e47b263f28mr7902748pfv.21.1708563035154;
        Wed, 21 Feb 2024 16:50:35 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a2-20020aa78642000000b006e34008d0c3sm8898152pfo.100.2024.02.21.16.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 16:50:34 -0800 (PST)
Date: Wed, 21 Feb 2024 16:50:30 -0800
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
	"chenjiahao16@huawei.com" <chenjiahao16@huawei.com>,
	"omosnace@redhat.com" <omosnace@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"evan@rivosinc.com" <evan@rivosinc.com>,
	"bgray@linux.ibm.com" <bgray@linux.ibm.com>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [RFC PATCH v1 15/28] riscv/mm: Implement map_shadow_stack()
 syscall
Message-ID: <ZdaaVhM9Yb9Zuj3J@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-16-debug@rivosinc.com>
 <ba45e69f69851721419b84f1ff8b66a490f92c86.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba45e69f69851721419b84f1ff8b66a490f92c86.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_165037_985599_3A1B36EA 
X-CRM114-Status: GOOD (  15.16  )
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

On Fri, Feb 09, 2024 at 08:44:53PM +0000, Edgecombe, Rick P wrote:
>On Wed, 2024-01-24 at 22:21 -0800, debug@rivosinc.com wrote:
>> From: Deepak Gupta <debug@rivosinc.com>
>>
>> As discussed extensively in the changelog for the addition of this
>> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
>> existing mmap() and madvise() syscalls do not map entirely well onto
>> the
>> security requirements for guarded control stacks since they lead to
>> windows where memory is allocated but not yet protected or stacks
>> which
>> are not properly and safely initialised. Instead a new syscall
>> map_shadow_stack() has been defined which allocates and initialises a
>> shadow stack page.
>>
>> This patch implements this syscall for riscv. riscv doesn't require
>> token
>> to be setup by kernel because user mode can do that by itself.
>> However to
>> provide compatiblity and portability with other architectues, user
>> mode can
>> specify token set flag.
>
>A lot of this code look very familiar. We'll have to think about at
>what point we could pull some of it into the code kernel.
>
>I think if we had an arch write_user_shstk(), most of the code could be
>shared here.

Yes it is. I'll think a little bit more on this on next set of patchsets
when I send.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
