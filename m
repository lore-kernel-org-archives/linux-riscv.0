Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345EACA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 06:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjLwRHHEbhw8ORzNFd6l7QzhnUMFlr7Glt3HFJowCi8=; b=U/5HDfo3PIsJdz
	1QvFQrnusLIJaqY1D42hkNbIEFKTb3hTdch5Acl5LMbhv0jMVyJEtdM8OMXa7q7qOTtIPFwnsBVgB
	2+vLvDjagqiQ/ZrAWmk9HTd0813ebaxzt1OSWJnbpaWYGZdOnt72qB5/mq0Nau/hbh7A6g7qDEiQU
	7otzgRcXu55mwi082ir2UTUx4ryaKvCq1dy5IV720M1n3UJ/bc0onQ120+jzgqV92t84Y26xAyPix
	/V6brRFD0Ng7gzeESJdY9VIZ6iqSEe1Hq0w0wsSYuxFoJbJs0CTm2io3db93GgTNCkYcV0eZ7C7ix
	iPS817OJzYHjMVLLAkaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unt5P-00000006byZ-47Ha;
	Mon, 18 Aug 2025 06:11:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unt5L-00000006bw8-0NAc
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 06:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755497468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ilfNOSXpmB/eYq3cbXUlvKiZ0NGf6LLnNw90QesFLBE=;
	b=K142VYB3G4ZH0ezHECehIlIsYiw16SDKtrG37m7ZiJtHJ61lMEQfbkGq4sGCLC//AIelVU
	LZZa5nLynvr+ywB86IdtmEwNo7hTj7sE/7xoD9DUe4kmyky4cjY6AFZsCgXlDLbXkmEl0k
	ELYWizI7rKPgnZ9plzrLYMZPWK42TCc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-IIQqPDy-OSSYvAEEADRY6Q-1; Mon, 18 Aug 2025 02:09:00 -0400
X-MC-Unique: IIQqPDy-OSSYvAEEADRY6Q-1
X-Mimecast-MFC-AGG-ID: IIQqPDy-OSSYvAEEADRY6Q_1755497339
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b10ab0062aso104986651cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 23:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755497339; x=1756102139;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilfNOSXpmB/eYq3cbXUlvKiZ0NGf6LLnNw90QesFLBE=;
        b=V7HuY1lv+/dedVqLG6Hp/Clz0HQlD8zlX10n8TrzWB7MbMpafuT5kOS00y4+70HN6t
         EoW+qV1sn39c+t/SFZbPTlLjfkLkcYVtXx2v9NQansEHJGJphESCLyQK9xgp60n1t5go
         zr2ZUpcxp3Ha4LMJIt/X81TjrI8LUZ+YUgrTMZAxcneGTF0CLyq/Lq3MCD4IZ9jZ1JwL
         E016THC9AlQb2zBSlqAHNnVxtdC0E61yCJ2ZpdT7rfos36hToSOcixEmCgkqnE4PirtC
         KCdtufKEMm5T6mVvO1u45tfvz7Ug7Fg8u2UY0MwSkLzypX3xb1UHEDjQRkMZZvoNi4z2
         1iuQ==
X-Gm-Message-State: AOJu0YxQLRAfbnvt4UoLQcnDBXT4hDKgRoLkCN466S/nmYvjBpCpKlbb
	ptGe42sff2m27KHgoxKX7IxuEP9L12458w6iaThuqXCGMDguU1bYcdOzcbpsOS8Gd1V4wyYI3KG
	HlGyaIOTT+od3+WcF1QjWCwfVElrLaVBhMzrbSgxlHR1t9ExGBy4Hp0aL0UAoo4632tmjJg==
X-Gm-Gg: ASbGncsG8wY7Re0P9J5WzXecT6RKHAQRsK4JMH9aRv+OIKEQwyI2yjrFnL888M+sEkA
	1SdnPCGumk6gT9At6qEeCna/3o5GXbdcaE5euk5cPw9VvBF2g/91eoVQgmH57zBsGp2iVY5hAb6
	yVv4eJL2nOqrE/BL88BpRXfpwbf5RJUe13KYXEV/pcczFdXYsSWnbAcyCerqR21qkAzm8RfpDwz
	IJ1L+0QTRSURv0lguVzVOyEEGl/KNz1X73cHR0LGaYY6geV8V9v8NVl4E/8vS5plPTf1lFO3nKa
	QZ6zqwZjbOTbUYJdJdrkQ74V5ccVfMPZxliP5d/Yp0G3uHbrBuT1V34c3jCfv89X1YJOVloM3O4
	pZcc=
X-Received: by 2002:a05:622a:4d0f:b0:4b0:7439:4578 with SMTP id d75a77b69052e-4b11e2747c9mr137102461cf.33.1755497339473;
        Sun, 17 Aug 2025 23:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1I1mVyzHOHlHnpVFQ7/VLzhHJrTwCfwPwbcObGfoLuOQESoX7BOBqeE6GF2iKiWwcfgOk9A==
X-Received: by 2002:a05:622a:4d0f:b0:4b0:7439:4578 with SMTP id d75a77b69052e-4b11e2747c9mr137102301cf.33.1755497339094;
        Sun, 17 Aug 2025 23:08:59 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-113-055.pools.arcor-ip.net. [47.64.113.55])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc1aa56sm47525081cf.7.2025.08.17.23.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:08:58 -0700 (PDT)
Message-ID: <d1fe7fdf-b3da-4c53-8a5a-a87acd38d525@redhat.com>
Date: Mon, 18 Aug 2025 08:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header files
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 atish.patra@linux.dev, anup@brainfault.org, linux-kernel@vger.kernel.org
References: <20250606070952.498274-1-thuth@redhat.com>
 <175450055499.2863135.2738368758577957268.git-patchwork-notify@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <175450055499.2863135.2738368758577957268.git-patchwork-notify@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uPq26_hhrGr5V5jIN6As4JzCOVBI3cGrLfjB0E8NWw8_1755497339
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_231111_195195_6E0BE224 
X-CRM114-Status: GOOD (  12.73  )
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

On 06/08/2025 19.15, patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
> 
> This series was applied to riscv/linux.git (for-next)
> by Alexandre Ghiti <alexghiti@rivosinc.com>:

  Hi Alexandre,

I can't see the patches in the for-next branch ... have they been dropped 
again? Was there an issue with the patches?

  Thanks,
   Thomas


> On Fri,  6 Jun 2025 09:09:50 +0200 you wrote:
>> The kernel Makefiles define the __ASSEMBLY__ macro to provide
>> a way to use headers in both, assembly and C source code.
>> However, all the supported versions of the GCC and Clang compilers
>> also define the macro __ASSEMBLER__ automatically already when compiling
>> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
>> With regards to userspace code, this seems also to be constant source
>> of confusion, see for example these links here:
>>
>> [...]
> 
> Here is the summary with links:
>    - [v2,1/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>      https://git.kernel.org/riscv/c/c47963980ba6
>    - [v2,2/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
>      https://git.kernel.org/riscv/c/b5eb1f12a416
> 
> You are awesome, thank you!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
