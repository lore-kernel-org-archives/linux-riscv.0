Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D3AC5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lz/LpMqC+1bpP2fmmW90Skfvhb1FJs9Kj5N5LBoxP0Q=; b=FGX2cTta+8wBvt
	mrfBlfzVLkxarxRDu8UO1EVMbeXH2PmWYxWTWksLTPOxTPanZfgkHXYxSZH1iYRbTRBLJMA/hGfON
	RoycgagFjyT6obQZc2MIYkgL8PAY5FlRVZgX6aNjUhee43e1v8IY7DYsV7ADfKhuFb4rZxSjM/UzO
	H7H7j4LJTkctbpF3DJovUN2brLgPApiXpCflhja8ivXiK2ASe83LevFq63cPSzBrIYyYN69l92J7F
	dFuqaFXFci7r2DbwMr/DYDzmcjLv5P61hE21IxPkI40JL15Ychzv2+IWw7lISwafgEx61Bk1qqaS6
	HMa9sOtYViMxHlHsj/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXLI-0000000H1fx-1J9z;
	Mon, 24 Aug 2026 16:16:12 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXLF-0000000H1fO-2wHa
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 16:16:10 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso29739465ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787588169; x=1788192969; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=maqBVhQee0ygnsKuGXMla9Fm3bXmG5D3gh1nmD/er9c=;
        b=MBa0HC0NKRmwtrGkHXBgG6y0U5fmMQn6sROL4B0tQNiP61O+afypKEYB+O3pzTmNPZ
         C+Jjfoteknuv5SpAuwszEeHGI5qtsVD/vTq5/ZH2i5z0i3iz6inVhZmZfVFacLdpr//w
         auJGKe+KhfWPcHTt1bPEEuyk/pTyDbiF79r+vIKPepVaXV5MO6F/n98EqZSIFag0SCcC
         /O2cx9kVN7zGSHgaDNLnBk3FdGZrAr57zXhbPRn6AJMFPnfz+FPxG6pYTq5OHE3XDRUf
         FHZVe2+q7wYKybs4gtN0dM9MX3mLD9RiTRfJHIIy4mYTUDMloL66XkrBWHazx+tYnSku
         mS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787588169; x=1788192969;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maqBVhQee0ygnsKuGXMla9Fm3bXmG5D3gh1nmD/er9c=;
        b=mnFVvlYhalCorUN8+Yk9lSTyrnHefalGygRHXpsfwu8zSsXMiJKnEQeG0egRAmvVIF
         O654K6jfFRrMA2a5CR6VCLeiy3JE1OaZt4Up49loYnxXQbBtu9LLmAY3MnlGVrwdJL3J
         B2eavpDF9iIAKo1ojJnELwkLcHQKx/WZnZ9fP9x0fx2RqMTv/XRoxzgKPX+dm5/FAWLw
         f9WzFqO+eiC8W+LtiD4Mj6ohmJKZKYuPjRfCPCh6W/RWMjuijfOCY6Ye1j2OgBuX90he
         vV/7HxDYUrfUFwS8XRwLvxHMQ3jftAKmNIIseNZQHf6ZKrvA86dLG5svFtgelKuAobYu
         c3cA==
X-Gm-Message-State: AFuF++l3kdeE177F1Ez9mGBzQOrjNiMDwBD11n6OrntVxr4LFSFBW0dM
	aVLMwqQ5ucUluHo7DYjvqB9oVhmwAw8iXF7W+3pr14gk6y26BkgIkBo+Elamzo2wpFa0mYTYR0x
	w39xH
X-Gm-Gg: AR+sD10+oOW0Jtxkbh5yTkVfHiHDA3fEGd+VHVqvSd47NxAOevdlo8P4oMIwuCFUVif
	hr97hf2ipmfKkPonVA+dradSgUXFRJaj7k9eUE8SizbNbJpBDgdhnaPbykuj/DO3Fr81Diy1m77
	A3sfInvoP8RGDpyMowRvtbWmEguWSDGzy3ozdUVMTx7xSZiLZvoGdq73wrXRxdoM8kU9tJaMoKF
	tpW41iezTqAvY9sBWNJqgAXlEEx2F2Xq4drqGcyXPRPiIlpKGkrJAEQbYrWJTMyExuitKvAz3TF
	IorIQAffjh2FUmvyOs/Sai5zbYvM3SSMzhIOfcOWUlRPRNCkm5IEu1R2DXuV/8q5WAKwRXQ9pq2
	6MC/IEDHLCIWhhBGiuS5B3LBGzRbo2Pesq3xKkLHEuSAaJ9/aQdE5tBo2WaOTr0ifqpayX21GSV
	Z+jwF4zzytOGBDZTkklGEXPj660fF8K4WXCnDLXdbfbhaxqX4171BtNmQHvd2rJYxoEt/+7O9+/
	3hUTYpJ0A/VjA==
X-Received: by 2002:a17:903:1850:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2d6dca57bebmr6918505ad.1.1787588168705;
        Mon, 24 Aug 2026 09:16:08 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676792dfdsm19647135ad.26.2026.08.24.09.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 09:16:08 -0700 (PDT)
Message-ID: <fa61b3d7-af9f-4fd9-813e-848242f70d27@sifive.com>
Date: Mon, 24 Aug 2026 11:16:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: riscv: abi/pointer_masking kselftest fails on ZPM-capable
 platforms (test expects PMLEN round-up without PR_TAGGED_ADDR_ENABLE)
To: x jys <xjys2017@gmail.com>
References: <CAEi-r96d2vvZVX8pATt0rDPu+jbBumNos81HQirNziZEAqHEkw@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org
In-Reply-To: <CAEi-r96d2vvZVX8pATt0rDPu+jbBumNos81HQirNziZEAqHEkw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_091609_769128_F727FCCA 
X-CRM114-Status: GOOD (  15.73  )
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

Hi,

On 2026-08-22 1:08 AM, x jys wrote:
> Hi all,
> 
> I am an intern at KUBUDS Tech, a RISC-V International member
> organization. While building a local KernelCI-style testing pipeline
> for RISC-V (QEMU virt -cpu max, kernel v7.2.0-rc7, riscv defconfig),
> the tools/testing/selftests/riscv/abi/pointer_masking test fails every
> "constraint" assertion for PMLEN=1..16:
> 
>     not ok 5 PMLEN=1 constraint
>     ...
>     not ok 23 PMLEN=7 constraint
> 
> while the "validity" assertions pass. PR_SET_TAGGED_ADDR_CTRL returns 0
> for every requested PMLEN, but PR_GET_TAGGED_ADDR_CTRL always reports
> an effective PMLEN of 0.
> 
> Root cause appears to be a mismatch between the test's expectation and
> the kernel's semantics, both present in v7.2.0-rc7 and current master:
> 
> - test (test_pmlen): sets only the PMLEN field (without
>   PR_TAGGED_ADDR_ENABLE) and asserts the effective PMLEN is rounded up
>   to >= the requested value;
> 
> - kernel (arch/riscv/kernel/process.c, set_tagged_addr_ctrl): when
>   PR_TAGGED_ADDR_ENABLE is not set, resets pmlen to PMLEN_0 and returns
>   success. This comes from commit 3033b2b1e3 ("riscv: Reset pmm when
>   PR_TAGGED_ADDR_ENABLE is not set").
> 
> Why upstream CI does not see this: on platforms without the ZPM
> extension the kernel rejects the prctl, so the test takes the skip
> path. QEMU -cpu max emulates Smnpm/Ssnpm, which exposes the mismatch;
> most real hardware lacks ZPM.
> 
> Questions:
> 1. Is the intended semantics of PR_SET_TAGGED_ADDR_CTRL with only PMLEN
>    set (no ENABLE) to remember the rounded PMLEN, or to reset it to 0?
> 2. Depending on the answer, either the test should pass
>    PR_TAGGED_ADDR_ENABLE, or the kernel should keep the rounded PMLEN.

The test is correct here, and matches the original kernel semantics. The kernel
should be fixed by https://git.kernel.org/riscv/c/e2715cca37c2.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
