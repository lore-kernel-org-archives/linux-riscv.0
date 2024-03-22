Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF50EC47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JB5t4LHgEjRvUd7PXOIgUTljMcz7fKIhuovZwFOXEbQ=; b=arFznf050jT8QM
	602WxBXlYJkqcIOM7hLF+JlKswR/fiOSFRye5QG8tqDPBfBs20mzcYuBOi2q4W56U8aHBbAniMW53
	qWqMFDbA3dhFM5r+w4UhspGso0CnqzdcdYj0kwxEZbV6ln0/GQSJxAkkOeKbKwszAZKqIKJ/tKHw1
	kG6CS3aTN0V7H3FRmW5W6PUDEy/jmCE07KDrcVBTwNYjnis29c3LKxWRPooUIRCTTGbLR1yuzjNjL
	7BPDhFXthUfY4e/67zZvWBGDUM7xmBvAYqwtFfcjaXhRfE6A7lZJxEk3rzkNNQD5s4CPjwwYpa3Kh
	RrYQAcVvAx4OlnUqyawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnZyO-00000006JmM-3iIv;
	Fri, 22 Mar 2024 08:09:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnZyL-00000006Jlq-1pUT
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 08:09:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4146562a839so12882945e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 01:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711094991; x=1711699791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GE5LhZmpwjg/Vlr/58M0lzDTSb9NjpNMdXrf3nX1bH4=;
        b=f+A0RTdNEu7vfnWjh0ifSg+BN2i/dkFjUrSqDJrS+isazt39uAHIioYWh1PRMqpynd
         zT7m8BxX3mt55rSaGiESFuxBbtO+1Bm29OnduvXXMSXOdRewSYQvQbRYAVLneGQkRVpu
         pEHx8OdWFTbSL/RHa8UEEBqANBMMluJU3D889eit8Lyc08nvSEv3e0RQRj3j+zD2Ie9Y
         cQGeIZpeRhmYMIWCYH6l7LLR6YK/I4/xKNGfM/0a85X7LaaJV8RPp3+9SWYjpyknwCpA
         YS97xZ9tu/lcQo7YMNDfiwE1j7X926NU72pZD/tygXwRNxre9ptFs2crhA5al9EFUrzY
         dlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711094991; x=1711699791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE5LhZmpwjg/Vlr/58M0lzDTSb9NjpNMdXrf3nX1bH4=;
        b=Egb1DTvJ5XCQ6bAhN4jQ++SnrL4hTxem9P68l2OL09HlFgOTk9vrIzTKTZQ+uGpwCp
         aauYgqQh1bZa/gQz0DXBU5MQ1U/y2v4gK8aI1W/zOgZ6DNi2fp7ezxu/o7Uhl94CygUe
         86FXtze4pxAhKJSq0GnLdmiaZ3ICOHhlWd+4Pe+8ttI5aosNx1ySYhtNEsETRtKyvUka
         i0ZSwi5vuxPE4IDy4yChCW9A4Aw+XskNkhtiqb8A2GYcfbkmi3SIy+Sk4xTz2eWvzDlc
         OYVkdXTDai8nwnm/7sCNIQLnDfBi/Tp2A8wTfPjK3TXAVTTDiPEWMnOZ9CTkOIvmlgOZ
         FYVg==
X-Forwarded-Encrypted: i=1; AJvYcCXn4HpP+ddH8+SgySpb/RU4xtCJjx/4fhxuAD/09UNAPoIWdtWSbra5qx0eeYV+7xaE8XVXoEpLetE3hs8lLCX+LDd7XkfgIJRjCMLLnkMw
X-Gm-Message-State: AOJu0YxSw4weW02AK7os24UEYmdmD3Pl59GntBXP1WTuye8sC4CMoi06
	ahSpUP7r63VqleXBfrTP9wCUXZqEAQdYPd92AenmLTKByydy/IScjpronxy8bBc=
X-Google-Smtp-Source: AGHT+IHLQHBi7qQwYV/Vh2cMH5xV/FtpkfvFnaz2JqA5AbMTziv+62cDRdiytui2Ed6ojUwu7J0rsg==
X-Received: by 2002:a05:600c:1c26:b0:414:a89:3443 with SMTP id j38-20020a05600c1c2600b004140a893443mr902935wms.25.1711094990861;
        Fri, 22 Mar 2024 01:09:50 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id s16-20020a05600c45d000b00413f4cb62e1sm2291207wmo.23.2024.03.22.01.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 01:09:50 -0700 (PDT)
Date: Fri, 22 Mar 2024 09:09:49 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org, 
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Evgenii Stepanov <eugenis@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
Message-ID: <20240322-3c32873c4021477383a15f7d@orel>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com>
 <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
 <CAKC1njQYZHbQJ71mapeG1DEw=A+aGx77xsuQGecsNFpoJ=tzGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKC1njQYZHbQJ71mapeG1DEw=A+aGx77xsuQGecsNFpoJ=tzGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_010953_645795_C5DDECE7 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 19, 2024 at 09:39:52PM -0700, Deepak Gupta wrote:
...
> I am not sure of the practicality of this heterogeneity for Zicboz and
> for that matter any of the upcoming
> features that'll be enabled via senvcfg (control flow integrity,
> pointer masking, etc).
> 
> As an example if cache zeroing instructions are used by app binary, I
> expect it to be used in following
> manner
> 
>  - Explicitly inserting cbo.zero by application developer
>  - Some compiler flag which ensures that structures larger than cache
> line gets zeroed by cbo.zero
> 
> In either of the cases, the developer is not expecting to target it to
> a specific hart on SoC and instead expect it to work.
> There might be libraries (installed via sudo apt get) with cache zero
> support in them which may run in different address spaces.
> Should the library be aware of the CPU on which it's running. Now
> whoever is running these binaries should be aware which CPUs
> they get assigned to in order to avoid faults?
> 
> That seems excessive, doesn't it?
>

It might be safe to assume extensions like Zicboz will be on all harts if
any, but I wouldn't expect all extensions in the future to be present on
all available harts. For example, some Arm big.LITTLE boards only have
virt extensions on big CPUs. When a VMM wants to launch a guest it must
be aware of which CPUs it will use for the VCPU threads. For riscv, we
have the which-cpus variant of the hwprobe syscall to try and make this
type of thing easier to manage, but I agree it will still be a pain for
software since it will need to make that query and then set its affinity,
which is something it hasn't needed to do before.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
