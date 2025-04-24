Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88655C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqG7NHrHuwcsFVu+4koGUbILdREpEjD/BxNAWejDLa0=; b=VAvUXD2+G5vyVZ
	kZ1y9bg4B8xZW6Cx2MB9q7DDEjMnITeJCull0QNZ/NR/n8Wu/0xdU4Y175JoOWLEcYt3tblrIYr7t
	FsAAl/hzgRoNk36kLG7Wxt1uO6a9IHp7X3HOrWFks2iDUpnC3mSIqKlWgYixj8N0SuKqFGPt6lOR4
	R6XFRVFMkT5Cb3TWkb8veTcwPyBR0rjthFSRaZZKcNWOInVzgmMBNF/dRTgokAy7hsYo+U+iCp9Ol
	p3TQueKVRlFlmxOrzAWk8ixP5HSqKw9MTNrxm5MS7pP548f4X59e7WU3MYwz/y4RBxhP6iknE1M/K
	AXTJ3GLwTv+wO96iPTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qjK-0000000D64x-3N1F;
	Thu, 24 Apr 2025 07:10:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qiQ-0000000D5wl-0fxK
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:09:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22c33e4fdb8so6558405ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745478585; x=1746083385; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3EUZgQOVtgxwPj0Cm4KzOqZ3U97D0/GKNyUNvaflq+g=;
        b=FH6+FwqPv08LDNNJmAOvl5RGcrexEyagSbfdrGMmncloyLtkWJ6gIGJVZpefxpiQgt
         O36fkkmuSjKTFigDOqMUfuIU3GoVvU3KMRoXUXeWBnvjA11YDzZGqIemF3PWwHMka3TO
         kNhLYAgkME4ZfN3enwkDTkLdD3C1NfkL0n/T9ikxsxowkp7TAYLQvS8BGRjYzRaqf4Cz
         wu33avdqqxqo8+pnoR8ptdgudA4n6R40Ef6nk/TYF3c24so15cGWI8wfIniwuuUr/Zul
         3LIM50aGTND/oKCS0wcvNvWmusJq7efTmd7jG1cDklNJM87dv97CGDCEsVNIb59JHp39
         pkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478585; x=1746083385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EUZgQOVtgxwPj0Cm4KzOqZ3U97D0/GKNyUNvaflq+g=;
        b=cQgCR4V8oxXsZ6Q9a6pRFP5bgL/ZGFGtplrE5ROHHnmBnPJeeOIjeC7No1d39gaMi2
         tSJM9AZ4NKHkAFkl/JsHSx3g8IyRQ19qVL3vHTmpYlF2hsZu9YZMw/RW6lxv4tI//y3l
         NxwMYexWHmCREHIXFBDjPHROJsAQ+tYKp8Zfshm5tb5ddm9dlGOK2D95sfQ5vNZuO1Rf
         PxahNRUbyEp23x/1vOiy4pruWaobXR3UmKneNBnel3kW7PRevDFV5BUtuUX6pF8xr/oO
         6Ty8HMddPM9rMxtYH7OV/2NM79wzGDBUz3A2aMMGYTomm43HogKUtD9eJN32BALXxf3G
         XIPw==
X-Forwarded-Encrypted: i=1; AJvYcCU4WJ1o9rAneRWihyCuD6PmCUnaxAd2MOfCNBsbYusOWBXhDwvaudBIzv88HVCeaimQvy4Zyd8y+HXnJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4KxN3Bs4GcxhjQT3YDhktiM06nXLCopFuVz2xP7oMBD3y8C/b
	y9JLUW1wpD7ny7ib/VXDrDmJfeS8WPE4Rhmd2YNeLLd35TWcyBWi
X-Gm-Gg: ASbGncv/FFG72lRNI+iiaJD+6jBFV3NlGE0MzNyazoT8F0DbyizUgGWyXSj4laX+ikO
	BHPvAmU++u1p57vNTwuGZVJh7LuTHV0VFrZ7554r42jOEMVrCj6URfIeI6/RXlLRNSCyEd1fd5G
	i/WR8pjnFwPQqw5hxFI6vjyFbYGffuD2jj9qSdMMBPaAdmpO1ho89y4M5PF9P44pq4/cTwWjYGF
	VOmBF4OEV3dkwWTZG7KjSr2IYEtiAAyPK0MF5N8asBZ7kfeJyO4SdEH2s5lzwg8+5+UY2Rpw7ek
	QYvqGRUmzOoayL1Rj14N+u8SQM4MrUjLRdRzcubZZw==
X-Google-Smtp-Source: AGHT+IE9LsCk9tmFZI/PC5UZGmINwk24jJUeXSF+9kMM7rkzh8Y23OYpJUYh4V8Tdm5IfIlvZOU+AA==
X-Received: by 2002:a17:903:1b23:b0:224:826:279e with SMTP id d9443c01a7336-22db3ddbea1mr20093095ad.50.1745478584913;
        Thu, 24 Apr 2025 00:09:44 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22db50e7cf2sm6038875ad.154.2025.04.24.00.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:09:44 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:09:42 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
Message-ID: <ikq5pa74pk5e26m2vinye4wanauyzwqlxrgyx7hwr27k5dk6dt@ibv3o476jrpm>
References: <20250424012335.6246-1-looong.bin@gmail.com>
 <20250424012335.6246-2-looong.bin@gmail.com>
 <20250424-bright-vague-finch-57fc38@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424-bright-vague-finch-57fc38@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_000946_210449_A2258B0F 
X-CRM114-Status: GOOD (  18.45  )
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

On Thu, Apr 24, 2025 at 08:47:38AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 24, 2025 at 09:23:26AM GMT, Longbin Li wrote:
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

I will pay more attention to that, thanks!

Best regards,
Longbin Li

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
