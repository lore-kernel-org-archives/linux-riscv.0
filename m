Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB6CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5NUSBLAwNSR8r03s4uREn/cGt31mw+t8bxdk/mX7ZM=; b=ul05VmOQy+2KFn3o8WibdDVA9x
	bgq6zPVJSguInJO2JNrbNE9p2MSFBnZFqbaoxR3/m4xxBhgIPDC4kouBRIS/mdOUpu5/NdwQAxHse
	YFEg6k5SjX2/LWbM3IABmonr0rNrFJdP13ahbi93coinc+k8/lqUXyx7mPG8JbMfyXy9QRscQOWeB
	A+cjmgGTfDXqeTKYYRCWeIOuk/rT6gZrgmQRkp3aOKkW8JxJeTz9HFDqQuFU5WO/P32bbYSsBLPXB
	S0/cpyDQf31IiL3IeJozlkoLMVNOpVlFv5dMIksI1E6GZaihoGeCq598O/hX+xMWZjdrs14Km5LSu
	IwTs6s8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8CY-006she-GA; Thu, 24 Nov 2022 09:07:22 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8CU-006se3-Rw
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:07:20 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 6so1075617pgm.6
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 01:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpL02dGcoTUalThfsMc31KdRPIILnilJbSOEG5Kb9y4=;
        b=xuOWLB3Iz4pLV8nX5PJJwG5wnnDiw+8nv1bEH0tn67EhN3Qn9j8udQ7KhDgolwrhog
         5q8qP9nBckLfPqZZZOAdlVR4Av+Ss86Bt809mCKDiP4x62zuyW4NPQNox/o/VPl+eFd0
         I/tu3n4zSJASsbLouZo3Fzo6nBp7rLnzAL7SqVaPid6Qi00PB+8X/+KYLsaUrURweUtx
         VENIRuByfidHHg5PIn2M79yzDA99P5zcVQ+VeYjJNNKlgMCjZcewq9xsWA89guIN7IAC
         mQCinBYiEsFZAjGhjfOVsNyuAsmPPLaA2blFXFq4ZKabk0+XanY32bRJ6yZXZSux0+68
         97aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpL02dGcoTUalThfsMc31KdRPIILnilJbSOEG5Kb9y4=;
        b=Wi0zkOCpn3EvsgZA4+kD3g2MwyzfjEnSJjGfysUCyJKiWYl4A7t8jJT1gS0xGDrCbS
         dhFJuVmlBW66w0S1DP1WmiOwToF7Sr3LbI6TIM6tQQ7JD1YFHD1/qrvPey1H3YbZuG57
         M22UwB2jmgIfPefTGOA22f3TTqYflPvyiVs/tWZzMh5sOjjuRgnMI6+9jM6xOl7BuLh4
         Qi3XaosXl/mGUXwNzgggQ8+KNoR4aKOkeuhsuXNhnsKxEpJwDnvL/uPQ5GM4inI2GMug
         ulXUdvGjRx8hQcK2tSh+26SQJEE/1VKN8CSdeBpf7FO9hEJDlyR/KkV00PKEEp4esmGB
         0CkA==
X-Gm-Message-State: ANoB5pmMGGaXi2TE5UlMXJC9HnnO6BG7JiNH6wWvRI5laPFfTPDj6B4+
	bzTEqZ0GpJcBA6tFuLQrtkF1w6ceeWdVfA==
X-Google-Smtp-Source: AA0mqf6si1IGznSHWnZ+h7AWUXjrfpg/7ui/LT2s/cqluG2WdGIoszugXSSrlm72tGWOuAGPIPa68Q==
X-Received: by 2002:a05:6a00:99b:b0:56d:3de3:c401 with SMTP id u27-20020a056a00099b00b0056d3de3c401mr12958411pfg.6.1669280836701;
        Thu, 24 Nov 2022 01:07:16 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o13-20020a63fb0d000000b0047791c6cc10sm633506pgh.93.2022.11.24.01.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 01:07:16 -0800 (PST)
Date: Thu, 24 Nov 2022 01:07:14 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: VMAP_STACK overflow detection thread-safe
Message-ID: <20221124090714.GB1896875@debug.ba.rivosinc.com>
References: <20221124005006.1788315-1-debug@rivosinc.com>
 <CAJF2gTSwMZQvSNxb2_5GNrVG0pwfXWsHmp8zZG=gFHnhc95bjQ@mail.gmail.com>
 <20221124082612.GC1149630@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221124082612.GC1149630@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_010718_919409_05B39FB8 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
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

On Thu, Nov 24, 2022 at 12:26:12AM -0800, Deepak Gupta wrote:
>On Thu, Nov 24, 2022 at 09:32:19AM +0800, Guo Ren wrote:
>>>+.macro asm_per_cpu dst sym tmp
>>>+       REG_L \tmp, TASK_TI_CPU_NUM(tp)
>>>+       slli \tmp, \tmp, 0x3
>>>+       la \dst, __per_cpu_offset
>>>+       add \dst, \dst, \tmp
>>>+       REG_L \tmp, 0(\dst)
>>>+       la \dst, \sym
>>>+       add \dst, \dst, \tmp
>>Another tricky asm code of using percpu, I don't know how the percpu
>>maintenance guy thinks.
>
>On this, if you can point me to someone, I would like to get their feedback.
>While discussing this, one issue that comes in my mind is if the shift 
>of 0x3 is correct or not on 32bit systems. I don't know what's the 
>size of each entry
>in `__per_cpu_offset`. On 64bit it's 8 bytes and thus 3 bit shift.

Yes this would need a fix for 32bit.
`__per_cpu_offset` is an array of `unsigned long` and thus shift should be 2 bit
on 32bit systems.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
