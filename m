Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A02C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqyaDU1lomcF8nV1tarRwNPMIjJtW/aS5puxupYv/kQ=; b=zpxeL/gZN42u0Q
	hsiq1s7iyuUxE6rxua+C7mvXxsxvqd+Qlu+DL3WUqfaFSacP+Komo3SNTO60vyPfy0gd1mbOZnul7
	O9X8pFE5N1X6FBqR2tEMYw3VsLrfDiRf6jwtJZEGqMgBgd8E+jYBpGYVBK/mnT9UDFvt6DAj/uYjR
	Ktk0CG9tj7eeCAKgXIWPLfFVbkdYO+KcLqRfEFqBC6W29hZUKfVKzKZyJfwENWeKlH9ZYOu49tvmJ
	sytlxxz8qgTZ1OZq0GxiIvaqSwrTcwHlekYgzr+wuvJCAIVokoxyxHceLntZzeoVNJfLXriCA3232
	H1YTj+fh4aUcpEzTiv2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBT2h-00Ej9Y-2L;
	Fri, 08 Dec 2023 05:04:51 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBT2e-00Ej8e-0s
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:04:49 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7c45fa55391so402791241.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702011884; x=1702616684; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCezDiITLYZlXZkoiENFPkRYgXSgvqAlJqwCHapkHlo=;
        b=itpp6h3ymOXlb602ltUkqqakb1sYcXf2FG+WKhOtx60hqd8gnkwJzeCT/NyR5S+7CU
         4Qh5OpgGfO6TewnrrwCZIcPGqO28HTi3hZv+YLAPIj4PK4wn4DL7Uj++gnCq8ZyTtBbZ
         uhr/JHSPPbWnAC8n1et2lwUH7epcQTR5GlTD3eQWHGcBpIARMWtrjFI16EhPROvbVFIM
         H3Sg5OvGZFXx+mGfCJuAXxqjmzSNv/pa7pPgWZhhdb+vz8X63/t5eShKU5nSz4oju5ue
         +tuXcNTbT+ZV6Jx0d5OGfpMJ8/5QaYxb6lHBMpP+JGCQncVqyVF8vzKkrTysrj7RfyQA
         ZasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702011884; x=1702616684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCezDiITLYZlXZkoiENFPkRYgXSgvqAlJqwCHapkHlo=;
        b=NSzAKkoiGDQYBOa1yhYVyk5KF9GrJFzh6rzSwY6wLQtMgUiocY7TYnDXJuv/jhnNTe
         Y5Gmon+UMpWDswDaxCre5F5UDj0kuotmItq8ou15YCk8P5KrsGaUW5ISlVPYAncWDpro
         KQPHCLgl/9mWrBaiUiZKdSo8M5LsGaLIgAvqSg252fqNhD520DDGBtd9pw5iX2CZNPPi
         P4iE+Qs9jupPReYFNsX5HaO6Rg1N3Y6fP6zwDio/TnEO8mJxRpof04bgtH43ys/RpMIL
         Y7Yi5lUmRQzkkKlH3dARDDQza+ajUzWRO4nPjYthvAeXod5PA5r+otVAhyAHTShd/HsU
         vU3Q==
X-Gm-Message-State: AOJu0Yzu5T15iZIsLWaeeUEYuI8vCHRkWWCOHdA7AF7nYTuFnu658AZv
	eASHJPIybWuU3u/ldp5sNjL/Rg==
X-Google-Smtp-Source: AGHT+IHd3xhGQZwcUIcLtaS/NPIhQH51OI4srkcBz6UdtbLizYUKJjw8nicEQTdHb0F/v/M3ROTE/Q==
X-Received: by 2002:a1f:c843:0:b0:4b2:c555:389 with SMTP id y64-20020a1fc843000000b004b2c5550389mr2948641vkf.31.1702011884531;
        Thu, 07 Dec 2023 21:04:44 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:41c5:bf1:860b:1e95? ([2600:1700:2000:b002:41c5:bf1:860b:1e95])
        by smtp.gmail.com with ESMTPSA id i14-20020a0cf38e000000b0067a33133420sm494592qvk.110.2023.12.07.21.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 21:04:44 -0800 (PST)
Message-ID: <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
Date: Thu, 7 Dec 2023 23:04:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, arnd@arndb.de
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231130004224.GE2513828@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_210448_335171_848FB872 
X-CRM114-Status: GOOD (  12.98  )
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

Hi Nathan,

On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
>> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
>>> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
>>> architectures. Enabling hardware FP requires overriding the ISA string
>>> for the relevant compilation units.
>>
>> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]
> 
> :(
> 
>> Nathan, have you given up on these being sorted out?
> 
> Does your configuration have KASAN (I don't think RISC-V supports
> KCSAN)? It is possible that dml/dcn32 needs something similar to commit
> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
> or KCSAN in dml2")?
> 
> I am not really interested in playing whack-a-mole with these warnings
> like I have done in the past for the reasons I outlined here:
> 
> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/

I also see one of these with clang 17 even with KASAN disabled:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:37:6:
warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalculate'
[-Wframe-larger-than]
void dml32_recalculate(struct display_mode_lib *mode_lib)

     ^
1532/2208 (69.38%) spills, 676/2208 (30.62%) variables

So I'm in favor of just raising the limit for these files for clang, like you
suggested in the linked thread.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
