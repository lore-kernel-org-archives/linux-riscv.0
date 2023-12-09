Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88BBC4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Dec 2023 21:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxlI2p1o2NjwXYP8AW8becPB0+SpU2lkfd5vyZHjWsI=; b=vta3tYN71oTTrn
	PpkhHCRGxqqU5SEUT97bw3uj8+S3PfuGZS0XcHhC/o4tWQ3ztmvThsZ1YTNJkYv/0TPYTJHEqGwCr
	9wLuIXwwIPAEl+Vd3W1y3RBGCpQUb+BTaViTSBDzxwbgfVIxNtJYUgvqbPYeTC0Mv9xdAUzG8FtnH
	ayLeqUAKlQ7u2G3ghrZTqRkov4fo1/K01DxIrUaFFLWlMnU5Au7mOSad2InM0ll5wBmdixQSHaE69
	9jNgoahfuSbuCwKoBZ+6cnLAmwljgCvG62fPtOe2ms7qbU4l/awjnJ2HygP8g11i6yEr0rBWfTXy8
	Zx/rmY1oTyCJcE2aD/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rC4tX-000Yqq-1e;
	Sat, 09 Dec 2023 21:29:55 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rC4tU-000YpK-0w
	for linux-riscv@lists.infradead.org;
	Sat, 09 Dec 2023 21:29:53 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-77f5b3fa323so69799385a.0
        for <linux-riscv@lists.infradead.org>; Sat, 09 Dec 2023 13:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702157390; x=1702762190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFEUFFz09hiRyS0qcoPsXIF6VUSImKjj5WbLQv8dS3M=;
        b=bwn9e/BJDQ7Esv5GnTZNyEybXOpVSEAZCTVxGU2+7+al7l+frIsAq4FptZYgSG/HiT
         ZpiLm0jpEael+pdkMxk5e1w5jnFlvoPqHfL6GZKrpkDh4uwFr21Ltxn7yUAkCo3FXscB
         7C4/kBc/i/FwzJeIBo39cyC4xo2Uweli8GVzuXEb8gX9awPYxx2M2Ef+kt2aqwD3uJDZ
         R3zcHnurTGuEYSp87mAOaYArFqrXRgRkn9w7wXOkkRcIBSEeB9XEUT2Ok3/Aq9KMMCIG
         i032HFIAI5CrhZaF0dJ4E0gwBMZMFFS4T3FhlnbnivPo9s0LRJf+QpvFwxgfT9BvblBI
         mkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702157390; x=1702762190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFEUFFz09hiRyS0qcoPsXIF6VUSImKjj5WbLQv8dS3M=;
        b=R6prlv1aPFKauC/eqMKhtOin37y4VhDPIznAPiSWIGvlX1wHzln5CIlbU3RQc+94HS
         3BPUqG80VVKZHJRWIH/wedi5I3s0WlHWDCjTLxaT4C0Ceqcax72Q3Wxwg8oxwVC7fc54
         FVAPLYl8PGaMqa1qBexQyBomPn5hMGn9eHI7UEJ8qZj5byl/vQDSfCiERrvjV1tmapeh
         OL0j+7wohQXmv038qU0c+8N7flg7/0MUFznHCM7ysHvU4IR8BVmtHOTUzMYscxnWQJ80
         6ll3I6CnJYJwkeAzlsM66/qzOIp91unl68B+EUdZAQZ+FPflJ49xAQwAgT0dHhU6FdMt
         /0hw==
X-Gm-Message-State: AOJu0YwxwBSJ12vtY2olxOP7woj+K8jVfURJRtqztk1gRvQMDwWoaXhS
	3d2XFQh5wGc0n8O5ADd3ZlXYsbuLr8/M3L7diJpUUg==
X-Google-Smtp-Source: AGHT+IFocs3LkyA/Jt/FCqhjxzgRz8AgbQ0brbt26sXxD73qHkqT5u0QLdYWPcmh/VTk8arvnDsjzw==
X-Received: by 2002:a05:620a:8112:b0:77f:61d3:734c with SMTP id os18-20020a05620a811200b0077f61d3734cmr1598295qkn.43.1702157390147;
        Sat, 09 Dec 2023 13:29:50 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f559:1d79:8a5d:590e? ([2600:1700:2000:b002:f559:1d79:8a5d:590e])
        by smtp.gmail.com with ESMTPSA id tn24-20020a05620a3c1800b0077f052fa73bsm1662198qkn.15.2023.12.09.13.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 13:29:48 -0800 (PST)
Message-ID: <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
Date: Sat, 9 Dec 2023 15:29:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
 <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231209_132952_366691_7196B7D2 
X-CRM114-Status: GOOD (  15.84  )
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

Hi Arnd,

On 2023-12-09 2:38 PM, Arnd Bergmann wrote:
> On Fri, Dec 8, 2023, at 06:04, Samuel Holland wrote:
>> On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
>>> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
>>>> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
>>>>> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
>>>>> architectures. Enabling hardware FP requires overriding the ISA string
>>>>> for the relevant compilation units.
>>>>
>>>> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
>>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]
>>>
>>> :(
>>>
>>>> Nathan, have you given up on these being sorted out?
>>>
>>> Does your configuration have KASAN (I don't think RISC-V supports
>>> KCSAN)? It is possible that dml/dcn32 needs something similar to commit
>>> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
>>> or KCSAN in dml2")?
>>>
>>> I am not really interested in playing whack-a-mole with these warnings
>>> like I have done in the past for the reasons I outlined here:
>>>
>>> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/
>>
>> I also see one of these with clang 17 even with KASAN disabled:
>>
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:37:6:
>> warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalculate'
>> [-Wframe-larger-than]
>> void dml32_recalculate(struct display_mode_lib *mode_lib)
>>
>>      ^
>> 1532/2208 (69.38%) spills, 676/2208 (30.62%) variables
>>
>> So I'm in favor of just raising the limit for these files for clang, like you
>> suggested in the linked thread.
> 
> How about just adding a BUG_ON(IS_ENABLED(CONFIG_RISCV))
> in that function? That should also avoid the build failure
> but give a better indication of where the problem is
> if someone actually runs into that function and triggers
> a runtime stack overflow.

Won't that break actual users of the driver, trading an unlikely but
theoretically possible stack overflow for a guaranteed crash? The intent of this
series is that I have one of these GPUs plugged in to a RISC-V board, and I want
to use it.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
