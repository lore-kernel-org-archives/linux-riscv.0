Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9B8C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 01:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Oz9KYI7+F4rco+hwuN1AR4VSXR74EsyX+2BpXbExO7w=; b=t1XjOWH+V8D6yKkTK+CFdECgVm
	OZeBu1UwWde62iOF2MM+07/0wZUwhy5YxmqsO3+OfPeF+rVUx/aj3s7q6oJ49dU9yO6yAmLbWWbuK
	F7W6g4zxBa6ANH/IXb80GCy9gDpqboCVT9/KhM6VT5cgSJzRpnAZAnA2Z6BezthZvql3SbaW9nd/P
	19VvtgkziaDhW41kmaVQo3LxMWhTs64xVoHH9AdhvjQactJcKP9mAHta2DPfa6+yJy6N7gG9FB+Pz
	WAzKsjEXBIRdIM4du8pA0GJxj1j9yQc0xe8tiw85gdOrKTGmqnpo7DwyfBWT18N1ES4e3A29QmuFS
	lr6cWoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwu78-0000000ENpp-282w;
	Wed, 17 Apr 2024 01:29:30 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwu73-0000000ENp9-3HHv
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 01:29:29 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ed01c63657so4535537b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 18:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1713317364; x=1713922164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjuhst609j4ImBXLka66K2BgKWqdoWcRbFtt/DCN7yM=;
        b=VB+Xc4AS/jwL/bW06hIJwd2p6jzvukZ74u+tDtDG7+2hOqGjdcqZ1IxEmOmrOmvU39
         3dW3CnA1wqag4dL5qRgUN4d8RoTBMAhClv6S6cIfRBDRm8p4FrjEIyylWgPmfqDyWaaL
         CXpoQ/PqYJkyjh9LSnm3NwaSg0FAA6A0gYjQn56+80tOrEqzCROJgDUgtIImRUpXoau6
         3NT28X3wazi0KAYi+TnU3yCkwFpKYf3EN3bN+00n1qH0IHM9A25lB79OBt7gJj1+RWds
         iXpv+R4KrPgRiJVRrACXnx+DN3iedxnfyCsPPpsodmwaI3S/R3vKT6eYYuntydua5pZR
         HfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713317364; x=1713922164;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjuhst609j4ImBXLka66K2BgKWqdoWcRbFtt/DCN7yM=;
        b=qKSlV5ajJ93j5TDt8rzYJwck7QFa94NITO8y9GFHalIXUfBRcg8Al896uc9jYDitPR
         smh+GG4bCJjCT4MZTaOJbjwb8DdVVBcRApGL/Wf2pm44sfix1acwMJ4wFKRZoIyYb+iA
         bOZBzVno9IYFC1oeyizodBNjnTR0UA+owXgm099uw95s4F9tlye8qiAVh+shcVsN80Xa
         ou6tZqVC16sOBNV9M82RPdtIXy0GggBOCMgUYJHK67mX0gK0R+VmQnAukQcGSE1AVfFW
         c5PGsCTQnhMikOe6jzTwtmTj9Bp2dNLE85aEzcP+EnDPjr2WKdjxH0uSgOqRPfrKIPM8
         ZbLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwdDI8UD2z67O8NvLZS9YUkyDtfDdSmbZvZjU5VXiq0rztS8rL5g5/Hlfuq+16yKTG/EsbhS6fruNYgrocVAR6dvrCdvfXEa8XuyqbOUNq
X-Gm-Message-State: AOJu0Yx3XPmhewrCTae9b0g+nJQ7uJKYG9N/zwdMaGifutnETIdxY2SD
	laj/ujW4evJI+Go5zEI/Wpv/IcVoopSORYSK5lI2Xz8cPfaHNeedc4VU47nw+E0=
X-Google-Smtp-Source: AGHT+IHI+wCzl78CeqvUChLxQhdF2cffkJLj8Y9hhcpgjt77nMQDWk74rPpAZoZWqdPfe8nd7iHbXw==
X-Received: by 2002:a05:6a20:b923:b0:1a7:57d9:9358 with SMTP id fe35-20020a056a20b92300b001a757d99358mr11408064pzb.16.1713317363589;
        Tue, 16 Apr 2024 18:29:23 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id w14-20020a170902e88e00b001e2a408df30sm10342463plg.273.2024.04.16.18.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 18:29:22 -0700 (PDT)
Date: Tue, 16 Apr 2024 18:29:22 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Apr 2024 18:29:10 PDT (-0700)
Subject: Re: [PATCH v3 1/2] riscv: Remove superfluous smp_mb()
In-Reply-To: <20240304-aptly-surely-ab9ea7d82337@spud>
CC: alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Andrea Parri <andrea@rivosinc.com>, samuel.holland@sifive.com,
  anup@brainfault.org, rostedt@goodmis.org, mhiramat@kernel.org, Mark Rutland <mark.rutland@arm.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
  parri.andrea@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-493ab98f-27df-4576-ab29-90254bee34d0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_182926_036499_29331B8E 
X-CRM114-Status: GOOD (  19.27  )
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

On Mon, 04 Mar 2024 11:25:33 PST (-0800), Conor Dooley wrote:
> On Thu, Feb 29, 2024 at 01:10:55PM +0100, Alexandre Ghiti wrote:
>> This memory barrier is not needed and not documented so simply remove
>> it.
>
> This looks like it should be patch 2 in the series, not patch 1, as it
> is cleanup rather than a fix that needs backporting.

IIUC neither is actually a fix, as the other is only exposed by the 
IOMMU driver and that's not upstream yet.  So I'm just going to pick 
these up on for-next.

>
>> 
>> Suggested-by: Andrea Parri <andrea@rivosinc.com>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
>> ---
>>  arch/riscv/kernel/patch.c | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
>> index 37e87fdcf6a0..0b5c16dfe3f4 100644
>> --- a/arch/riscv/kernel/patch.c
>> +++ b/arch/riscv/kernel/patch.c
>> @@ -239,7 +239,6 @@ static int patch_text_cb(void *data)
>>  	} else {
>>  		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
>>  			cpu_relax();
>> -		smp_mb();
>>  	}
>>  
>>  	return ret;
>> -- 
>> 2.39.2
>> 
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
