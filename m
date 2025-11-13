Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E77ECD4F3B
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZWqiEOUZoW0fMG0YXtSR7tn05an6JFTjyG48gcktI4=; b=NEorbtPixK8/NY
	rOI1MtS42SVnzBdVGE7GEvX/a1XkmEch1f4Eo7PMqED0P9pCIwea3p/bRkC46iKZxwCFYJsHa3ne0
	5EpKxR8JmN7HPqkDOlJKX+uUsY9Mm2SAVY7dTkjR/Ep9T9t56NJdMF//P5D+TVCUuoleM0Mc+DhRj
	PFqtZBqZjkqhBxFGQodLsYKI+xw4KE+CHGyYv4LJC11n+O5pC/hg8mkSDzSfVpQkWQQZvtdXsm7jo
	hfPigMS4+eWC5eEGC9dabcNQV9jvzsD+BxOqYO+6QXSGYYFNkJOXCqUadB85cVE7lDp3kelibulEy
	68GSZi4BwT7Pgr2Wj74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJNCP-00000009o5G-416R;
	Thu, 13 Nov 2025 02:36:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJNCP-00000009o58-2BCu
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Nov 2025 02:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wU6W1sOwNniOpGHk04oKlDXcIE9zKrR6PDF1cQwJ0Ag=; b=JjuXJnORRsePaWJMZdBhKv8shl
	5TV0p5f6nSDD8s54Z6SvD38mvKoCeCWmu6EZ7nijnZLLM7kX24zcF7Mfh535Xne70QB0vU4trXuV6
	a1kcya3oy0+lyuYKfTw+FEaizdCSz1lun95LVhuZEPecTdq+bJs5+bvOTLdckMJldQPKZ6qlS2RXX
	TrCEUb963TvA3A4CRwGPvxD+5vLYo3gGfZwdc+frxeSLMoVMOg6ALUa81zcm0nIkHbY7xNGN91z7l
	eIsPCY6N6iP2UGyrwj7CHN89yPzkVAxPIdAHBdLIqzKkqlemlETME1g+R7vqhXUwyy/9C0ZtskCDk
	Xd7GLUzA==;
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMKH-0000000Grk6-0ksk
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:40:44 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-9486354dcb2so14598039f.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 18:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763001366; x=1763606166; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wU6W1sOwNniOpGHk04oKlDXcIE9zKrR6PDF1cQwJ0Ag=;
        b=UUrDFD3Bgw+wqXpQGfq4W7mT+hh/1zmM/jteVc/jkdYGIhd4gWzdntAQXBzdxbss5R
         NOR9FbnjGN8rozNMiXD/nvlikM0rzqBQ/bPbUfjSs/HuDo5oEW2OjB11fyvNUdPjz5hc
         B1gVWaTH+eHGqaLfPIVg5sBM9GeUshDKmddA50oTRLsE6e63Mb0V2L4GnWLkXD0TtBl4
         ALqGwlWlh3QADZ+m3SamPIL26374r9G8Vduz4ON9MeCPxqmcBO5UFmdVNKTUgDuJjQfb
         a/7lTNOzMWN3J5VXpXwVXq77MhmrC42R+ueHI3Xil2GiN0qkxYC3hXj12GTmjkiycBsX
         V+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763001366; x=1763606166;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wU6W1sOwNniOpGHk04oKlDXcIE9zKrR6PDF1cQwJ0Ag=;
        b=HUshEhloF/SOEZ0WhVVmqlPoq3dKStO2Rvzps+BWEFJRTF6RemkEzLs6faV3sOPDGG
         mwG4ykcwRc64GH8fdI2rg+8Nstu2JEAslkPQy4R437LzMrzIGdsrGZQmZ40nj5eoJqTx
         hffmSEFJ+Ndlcw3OnkaD5vECk0gGEMmj2B/cJnPA7zYiPmGV0ohNYwc78ore6VwiU9q/
         fr8nDmCS1dMVHrFTTFBDMO4SM05+yiygbSkURXB51k2KcH2O10Re+7uYkz9wmIh1Cdxl
         UqlvH4Dsai7F+8vGMnPzfLUA0RsGVrXfPF4zh9DVG5UP/7x4zZqFj2mANxzDFXJO5lP3
         fBNA==
X-Forwarded-Encrypted: i=1; AJvYcCVkTRkk0/g0xZjy4Ix9lRPIxOg6V+wmMKfPNpuXaagjHPVVeVZpQHsVVv3QGD5h7W/bYHhQU/F/2/TuYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYM6a5KfKu47dU9gxLhuIPwHdc5O+7hDZ6+yjmGUKEM7wkr4DX
	GuZCDZxqimheIUqtL+/6YloqE1pBkPhy3ujIMZoZpOHRqdix/nhPJK+L1TqhQU4sWxE=
X-Gm-Gg: ASbGncsDZXYoNXLgHAJpyAKsrZ+LAmbrWB0pbyB/13AiJuaizQNwOPrUWr5RIMiU5aO
	mZISccXzNd1nE1JYMcS5/53V6L4Otr09KTVgGUFauQ+5JxnfPEjjeXSGgznRUkSA8+tI1h8D6uD
	kVQLPOiNLXBuPUNvGSNwECkae5GzCkP+FdhGTwnpTPtFUnPa4QzMVmHEvv7biKSjor7dWQ7jd2s
	bbyoT6NS6p8zhn8+twmC4coe1fe2ekN9eFCSv0O327SpBWBmA3BxHi4W7d+txb0ed7fxNWRlew1
	UiXsWpxHJF0JWREX579tQiS7oF3T1KlTIFLLTGGL8SIQwzdSX/pOTkZYQeV0TijU5TKnbWkZcIV
	hHDLT49dkPK6zmpuFC1OQZI7z4pD3jl/LsNTJk1n+k/TOJU3lom73tYOjbt21UxFEKCZBh3zGFG
	dmAJVaQcCuj361Bp/d
X-Google-Smtp-Source: AGHT+IGraeE/bIFHpoWCxTBowHF0q/OZirZ/vsZdNcApHxPGLPbWrFtEzHUR2rGHxEjy2kfVThP5Xg==
X-Received: by 2002:a92:ca0d:0:b0:433:330a:a572 with SMTP id e9e14a558f8ab-43473d52e46mr77508645ab.13.1763001365760;
        Wed, 12 Nov 2025 18:36:05 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.171])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7bd26ff20sm267252173.23.2025.11.12.18.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 18:36:05 -0800 (PST)
Message-ID: <a6e7a571-91d2-4e66-bc86-ba30f624294b@sifive.com>
Date: Wed, 12 Nov 2025 20:36:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] checkpatch: Warn on page table access without
 accessors
To: Joe Perches <joe@perches.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-8-samuel.holland@sifive.com>
 <1dfa1e3566cafbe43a1d4753defef9c82ddb3b64.camel@perches.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <1dfa1e3566cafbe43a1d4753defef9c82ddb3b64.camel@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_014042_556620_A22247BD 
X-CRM114-Status: GOOD (  16.02  )
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

On 2025-11-12 8:21 PM, Joe Perches wrote:
> On Wed, 2025-11-12 at 17:45 -0800, Samuel Holland wrote:
>> Architectures may have special rules for accessing the hardware page
>> tables (for example, atomicity/ordering requirements), so the generic MM
>> code provides the pXXp_get() and set_pXX() hooks for architectures to
>> implement. These accessor functions are often omitted where a raw
>> pointer dereference is believed to be safe (i.e. race-free). However,
>> RISC-V needs to use these hooks to rewrite the page table values at
>> read/write time on some platforms. A raw pointer dereference will no
>> longer produce the correct value on those platforms, so the generic code
>> must always use the accessor functions.
> []
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
>> @@ -7721,6 +7721,13 @@ sub process {
>>  				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
>>  			}
>>  		}
>> +
>> +# check for raw dereferences of hardware page table pointers
>> +		if ($realfile !~ m@^arch/@ &&
>> +		    $line =~ /(?<!pte_t |p[mu4g]d_t |izeof\()\*\(?(vmf(\.|->))?(pte|p[mu4g]d)p?\b/) {
>> +			WARN("PAGE_TABLE_ACCESSORS",
>> +			     "Use $3p_get()/set_$3() instead of dereferencing page table pointers\n" . $herecurr);
>> +		}
>>  	}
> 
> Seems like a lot of matches
> 
> $ git grep -P '(?<!pte_t |p[mu4g]d_t |izeof\()\*\(?(vmf(\.|->))?(pte|p[mu4g]d)p?\b' | \
>   grep -v '^arch/' | wc -l
> 766
> 
> Is this really appropriate?

Other patches in this series remove 277 of these matches. But it looks like a
couple of driver systems (iommu, dm) use variables that match this pattern as
well. Limiting the check to include/ and mm/ avoids the false positives.

> trivia:
> 
> izeof is really odd looking.  I'd prefer sizeof.

I agree, but my perl complains "Variable length lookbehind not implemented in
regex m/(?<!pte_t |p[mu4g]d_t |sizeof\()\*\(?(vmf(\.|->))?(pte|p[mu4g]d)p?\b/ at
scripts/checkpatch.pl line 7727." I could split this into two patterns, which
would also solve the false positives with multiple variable declarations.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
