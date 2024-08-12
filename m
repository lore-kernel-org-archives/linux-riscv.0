Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B15C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALrd2Ws3RseuWyxE6952zMWSaxiasw2SZheNTSGF3ck=; b=qNUtorXypR3WRM
	ApbNB4c0OxysLDfuLkkrH+/DNNAEtUfDmEoc2V+llV95xprCvk++V4R7XxPFYQpQPHurz24tesNCT
	sBQmj/+ymmO3/PxLWBc7YqGva8O7aEqIil58W1P/HBXGu208hCKi/TcuQ7MKAnkQHWMTgDEmrWgE1
	DsXwes5y1tIpoNHt6zSHH6UtTKrR9DTFYnztNAPNfr+aJLrFGs2i4JFytYWxSjGSVj3axP5VuJdiW
	uVShUIWC0e4ZuXX5v7ql+cJgKS1hZ/YTF45Z7llWL/MoAWJqP6CWXq/XkgKPxwPMEF4eXr41qp/N9
	5a4U4mu6KvqaTOjCYwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdYCx-00000000vRi-1sRx;
	Mon, 12 Aug 2024 16:47:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdYCu-00000000vRD-3KWg
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 16:47:46 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fee6435a34so32176315ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Aug 2024 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723481263; x=1724086063; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1gGdvqcddohTVFT8kQob0xd7CgQ7ZF2Hz/Ht3G6YiU=;
        b=EWsEapCibXKxyNuRFYWqPYsur3wEtzY1RDVgbDR2pGM/vBmcbrM68B5PT2MvxI6yDt
         QJNA6rLgh3AG4PrwwX7ZxD4dBxpD6K5LhvnYlbc4JVLxsKbytpNU22na06bqf0ZH97ht
         r8laSFKM8as1XhEYYWPwWRvG3OMOXusnwA5Zt5GlY4iioS3Wio/bsyz56YuTvKX0+ugH
         V1gyUMMAbIvvCq7fd9hTw7GiGHnSUQxLao9JCe1wkFue4QBtCviWunOzzHKyBp452pNT
         8n8z/p5f3Q5WrgMedAj6HWKeY4H6Ij44aiCJC2p3eC5iedusmVDyVJpDe9Hlg1OgTEo6
         NASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723481263; x=1724086063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1gGdvqcddohTVFT8kQob0xd7CgQ7ZF2Hz/Ht3G6YiU=;
        b=EcNjaU0+Z9w1VPKJGxHTZBuuI7+OCF0Keqt+XmswK7ecFiBr+ISQWVaijzsRAK+frn
         mT9liTj7www0e1fvjRR/m0iSLlfjXBIBlgBgAz4AV61gMYdTADIR1WYBMbvjniTGa+u1
         f10pw64L53cz7X/Q8Sd9FM5x+BMqRUT9luwsfvl+UrAzMBBzlc7pwzLkf9HVTS2ijKZq
         qHgObpHJtrfFQK5+j7EDgJTfs3X1RCS0Je8PcoBc+JzT3X5zhJ4NviJwi2D2eOZ6EXdW
         yLtjiT7/gU39eFOWVAbfUCesaY4s60zc7NbHAad+QhSLUpB0l77hCbZlLFsSJOeJl4z9
         Up9A==
X-Forwarded-Encrypted: i=1; AJvYcCUebohtuxEnSSeqIVSdWAMpg19l/S6m955nO9Z7j4uVn57QvlqBUKCZRCFBTPBLtL6AwrAHi46z1bHSUGzOh+TrnS5jwW2OjuiO3ErMUaMh
X-Gm-Message-State: AOJu0YznPTpzIKHTwx4rjpb93YS9mACF7K/o/bv29LWV8clPIG8Zgcrc
	ckqzggqsDovFfivv+jGwoPm6hAoMhxKu0/bghxH26HQIndLqxu02Lbr38yzjLcE=
X-Google-Smtp-Source: AGHT+IE87fk8grq8YxzQ9ZqK4uANOdymebfW6zNzfLJz+Z6OjMVTMLP9gdbfzi43oiHSHopfRLN5Zg==
X-Received: by 2002:a17:902:e80a:b0:1fc:2e38:d3de with SMTP id d9443c01a7336-201ca120563mr9639125ad.7.1723481262725;
        Mon, 12 Aug 2024 09:47:42 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bbb3b2easm40030505ad.284.2024.08.12.09.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 09:47:42 -0700 (PDT)
Message-ID: <72e49c54-6473-413b-a4b4-4d0d67a41923@rivosinc.com>
Date: Mon, 12 Aug 2024 12:47:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: riscv: Add Zicclsm ISA extension
 description.
To: Conor Dooley <conor@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, linux-riscv@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>,
 Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20240809162240.1842373-1-jesse@rivosinc.com>
 <20240809162240.1842373-3-jesse@rivosinc.com>
 <20240809181536.GA976083-robh@kernel.org> <ZrZmTvJgyQ5nB70H@ghost>
 <20240812-rogue-enable-9194afe10621@spud>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <20240812-rogue-enable-9194afe10621@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_094745_017206_60C097CB 
X-CRM114-Status: GOOD (  13.16  )
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



On 8/12/24 11:56, Conor Dooley wrote:
> On Fri, Aug 09, 2024 at 11:56:14AM -0700, Charlie Jenkins wrote:
>> On Fri, Aug 09, 2024 at 12:15:36PM -0600, Rob Herring wrote:
>>> On Fri, Aug 09, 2024 at 12:22:40PM -0400, Jesse Taube wrote:
>>>> Add description for Zicclsm ISA extension.
>>>>
>>>> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
>>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>>>> ---
>>>> V1 -> V2:
>>>>   - New patch
>>>> V2 -> V3:
>>>>   - No changes
>>>> V3 -> V4:
>>>>   - No changes
>>>> V4 -> V5:
>>>>   - No changes
>>>> V5 -> V6:
>>>>   - No changes
>>>> V6 -> V7:
>>>>   - No changes
>>>> V7 -> V8:
>>>>   - Rebase onto 2d1f51d8a4b0 (palmer/for-next)
>>>
>>> Please also put the version in the subject. '-vN' is the git-send-email
>>> option to do it for you.
>>>
>>> Rob
>>>
>>
>> These patches were originally part of a different series [1] but are no
>> longer related to that series so I had asked Jesse to spin these off into a
>> different series. These version tags probably should not have been left
>> on here when made into this new series though.
> 
> I dunno, I disagree. I think the versioning should continue on being
> split - especially when there's been tags provided on earlier versions.

Good to know I should keep the version number when splinting a set.

Thanks,
Jesse

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
