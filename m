Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5994AC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 18:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLnPp0GyFaPMqMiLSRdLjW5jONpw7yiCjeQ+PU179eY=; b=uvtL/V1+tPXWTK
	aHzt/jDcpijxNlGaUREeLVEdcs1C25XhpQhXxgW7fifQ7Z1ufl7ij3i+Qbnmq0x/mQyyBUAxRbAZz
	UQwyAg78WasRCxrsXkhsrSnLtyjDbPHuk1hwYsPADwowE88Grn7Cb5/mA8Sm90oBnyDIzkzGAwM8K
	ameCBB4ldkLdT1KhCVwFyuVMtTesYtZPWvMvdEFP+j5bQhGasek7uG3jdM0jcTMiwIQwgOru4CuBR
	nDzqMvFf8HAYuWy1mwwIstzCxf5xkjgRH/Tj6n3Fy0sZM5pJydYJiP93edpH+Pep3LOgUNeDQ/jWm
	kKxSjgSfzyqLozN3+FNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn0It-00000000a2k-2OKX;
	Wed, 20 Mar 2024 18:04:43 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn0Ip-00000000a1M-1M4S
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 18:04:41 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-609408d4b31so848327b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 11:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710957877; x=1711562677; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TmgB7TOmDIH1+NUxCse+KiCTmMgVy8/EkD7jAnjwO8=;
        b=g4d8RXopMsnVjTeSEr9q8O3Qfevo+sgkvffZ7t+tcDq1axoexvui4tDNLIvpPOTDu5
         jFMBmmM7i/S43dx5/sECfgVQM7Qx6KAqpUNzmYYmJLthyEqnQYs99mZ1K8WkWnjFy92O
         ajpne9AhWZXH3GXybCm0sYj4dqesIxjcTOGyaBeclVrMDhIylesBhhxIE7UEbtwpCQw7
         FNGpxt5En1fGEUE5tWeBF8OGirPVEfc4rPh2JeJkuvBT8slF/PT0iQCbuin6ClTDJG24
         oKgB2OgvEYIM5GZmCaliNbvfN7QJaOJmD4eVMzGhmsX+iVjXc4IvWg7UwmMYW/qXA8dN
         GmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710957877; x=1711562677;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TmgB7TOmDIH1+NUxCse+KiCTmMgVy8/EkD7jAnjwO8=;
        b=gJqMzYKMy0Z/wEo06Ux/69HlwSXQX5APxIPOeQ/u6QXWWC+TOfRJJA2w91AdSUdZbV
         cuLwDGIgRBdLnikysb5F6hOn+K3uTzzfIjwmlLuefebyFkUQcLgatgZZIiDscrvwKSk9
         zFfHW31lReOBWYPeC/mr8vdqmJlmeq3imQRe55+sNsZQxGv+Advvl5P6WcU7CzUxxSWl
         HqepZkKNU5VYghVVCbq/4SjyzpFN/5bYmul2ulBzcA2Gg24CvEWY6B4FiOA1aXQN/N3p
         ytjnWsBEzbmchy0DMGfaWyEbRyxqiM1w446CUP0O0AKWMPfEJbGPlw09+LG66NlKysbr
         Nt3A==
X-Forwarded-Encrypted: i=1; AJvYcCVZIWABvUFuuX5+93vQAx5KbJgMWz/HcUp51ZZ/x3C5wxMiu1bsgbviJBHa96UU0ViOjLhkbh6IuYoaxnJbn0GTYkkKhXH5G1TpOnubVtNz
X-Gm-Message-State: AOJu0Yxgiq9gG/3saaLOkRz85Ma3qK29/lTnCEy7nqteyTC1SYpfI/p5
	ueiceZHBKLul3rAsOtYKtxedty20VfWWSecwL/HUO1Wd2bz5+H43kAbjC9TRJpw=
X-Google-Smtp-Source: AGHT+IEjNFRrCRHpqrhxdo3V77FEmF7Rpc9yb5igu4d1kI5oiVdJtqEevCyIKfRdNiyO251T+F0HDQ==
X-Received: by 2002:a81:a50f:0:b0:610:c904:842b with SMTP id u15-20020a81a50f000000b00610c904842bmr2791022ywg.46.1710957876657;
        Wed, 20 Mar 2024 11:04:36 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id o1-20020a81ef01000000b0060a304ca3f4sm2832865ywm.19.2024.03.20.11.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 11:04:35 -0700 (PDT)
Message-ID: <1ffad954-63bb-497a-af10-0b319a0831b7@sifive.com>
Date: Wed, 20 Mar 2024 13:04:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 9/9] selftests: riscv: Add a pointer masking test
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org,
 kasan-dev@googlegroups.com, Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <shuah@kernel.org>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-10-samuel.holland@sifive.com>
 <20240320-handpick-freight-ec8027baa4d1@spud>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240320-handpick-freight-ec8027baa4d1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_110439_709647_0F023D03 
X-CRM114-Status: GOOD (  12.97  )
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

Hi Conor,

On 2024-03-20 12:21 PM, Conor Dooley wrote:
> On Tue, Mar 19, 2024 at 02:58:35PM -0700, Samuel Holland wrote:
>> This test covers the behavior of the PR_SET_TAGGED_ADDR_CTRL and
>> PR_GET_TAGGED_ADDR_CTRL prctl() operations, their effects on the
>> userspace ABI, and their effects on the system call ABI.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  tools/testing/selftests/riscv/Makefile        |   2 +-
>>  tools/testing/selftests/riscv/tags/Makefile   |  10 +
>>  .../selftests/riscv/tags/pointer_masking.c    | 307 ++++++++++++++++++
> 
> I dunno much about selftests, but this patch seems to produce some
> warnings about gitignores with allmodconfig:
> tools/testing/selftests/riscv/tags/Makefile: warning: ignored by one of the .gitignore files
> tools/testing/selftests/riscv/tags/pointer_masking.c: warning: ignored by one of the .gitignore files

This is because the "tags" directory name is ignored by the top-level
.gitignore. I chose the name to match tools/testing/selftests/arm64/tags, but I
am fine with renaming it to avoid the warning.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
