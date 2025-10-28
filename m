Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956ECCCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 20:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/mFZZ2PCnBnqMLvDLasV5hrJlN4VXXzhK4MSVaL+MU=; b=ADMDhAy/wYB1M+
	yzKWZJbN85d7R6QVnKQMka3J/KtahpAc9LjoYOdVbSJ46Wn6FIrw9hP4Fj0KUk7Bs+1J4ygFZDV1e
	ygYTPPa7lCiU/Iof8bmqDIaFy7wdYAjkZOnqPa/fT/SvVKmO52UEr7nFCEVsNf0yrzob9A5bMxg7h
	qRXu3WEOSadvzep8S9gqDpOBM/VdanIX91lldegTSBbvT1F7IOL9q+r43SKxSO7RUHjwKazYevmOI
	vxh2O9cGxjThQUj2qV3VAL2qiYIXWTX9hzMAy/vDH4TSdpTZ9d7vy8umQJk9nm6Qu4cMYtALqt5zj
	H3QqXLvPFuSsXi8Okkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqdl-0000000Gdip-37nR;
	Tue, 28 Oct 2025 20:50:01 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqdi-0000000Gdhc-49zt
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 20:50:00 +0000
Received: by mail-il1-x141.google.com with SMTP id e9e14a558f8ab-430cd27de3eso28498655ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761684598; x=1762289398; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6TldsVLxc7ZpZ3BCidhfMeu0Nkd2dELKLkuMBzPbjk=;
        b=WPW7r5udEBsk+20QXbrdblhk/hZzVPmJxSukPZinEY3RDyiRI3lex/V+FzTWOHjTuI
         JJaPAz1Gbl9FltNkEOkhe1B1dUEv3W05U5hunXbs1k0APYQoJN3cW7yQktIcFEDxoqJu
         tn+vqAoNWw38SvaPZKtlsnfSIIY/lcA/isQhBvje4uTcDRC1NDzagnOet1+yk+M8dzg+
         W1jScBK0Z5lTVnXXxDvpsOTCGnfJIJfB3w9x33QBXer2xhLXP+UrYHzxx4J1oHEl96Sg
         Uz2O+sZwN9DWrah63ZW2cSi8XsRJUjfmgBv+8z/Tr5Z0GhfT1FPKS9+OYgXUF68bg/6v
         Hvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761684598; x=1762289398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6TldsVLxc7ZpZ3BCidhfMeu0Nkd2dELKLkuMBzPbjk=;
        b=Z2MkJzZHYDY/ZqPwl/HuUQ5C35+1R8YsZHmjRxqNVkcQpsspkaIzgWAKFkCJAIkNGy
         pFLEt2FpzUpXGiAT4vHxGxveAmq1MwXjNrjXE5vkfGDI7E0Kgtz/7B+dQekH1CWr4sHC
         GT5khm3I1TJwEqKjKDBGDhpuY8vnbmBKAAUaGVWlGGTnZZ10gH9WrxdxX3rqAGXuiUV/
         PayNld5xVjlbtQF7KNrd9Bl9OfhA3GCdnHWoHZOGhUixtOfib2wtCnyEB+UghABKk23I
         TsA7NKBOyh4p8As1ZFuo7oWqIdq3FfUTlT2FlV32szeD1HLuaiaKfLABHtt8GC6OUTIk
         MSng==
X-Forwarded-Encrypted: i=1; AJvYcCU+JBovgj81BMgmbV8dVpqKNbmwE9fU4oGajR/OKY0qJY2WI5EUSAJTR80TexNEMHx/YhvmqiIPBJkhpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YymM8Wtl6I4TA9yDq+pMXv9Z+B2bPaVXZCaV2B9jJ52XDIoFS8i
	JIqJrdiCVXKjZ5TAZRaAc6OhTV/uT2u5QbntcN44z/ESct8YDxuDJZ818nfHsTscmTQ=
X-Gm-Gg: ASbGncswJcjQQJlEAdApLPZqDcVYvIcTEUh3p3/gku3baCY9+3KRckGIibtJtrj8bKh
	0iTJM8Q3Se7NYwWZmhExSMYtHQQPRhV5jiY+xk7SckUcwgWj40YGu0D3vOO6b7GSw2w6KT5+0zb
	+MAZ91OFt5IWadyF+1edveDzyfYH+X7P4q57vCgtG1jC/NwbN187jg5q5ZeYPRKrkxy7S41vBBt
	ozTDDKm0vkJEWmqUpzhNDLIEN5rD58Nt92lP1eY+dtUdqYSTv0W1wr+kWkM90xsqTsAhAt6xSOb
	7tzZUHTRxk2stl6417Fouly7SyDghHwDWyAcuzABMgUoi7oZ719su5oBRLJTgitlaVSLVscuGUO
	NsW3wnZYBzCyrKbblOZ4IvL+xGhKEqKoSFGd+MUKisU+rfz2gkxrpjdEYruq/zvKurnj1yUXy2+
	zNnOQCTznEqbfBJMYJUVAa216HTykVXzIr2Q2pa47w
X-Google-Smtp-Source: AGHT+IEqrqUPdxyh6nYJQcfD3zvrLobFkCBCdnIEdI/83k2YFCmj2OXCJVPDfmu5Z5HhIeTYWdj2MQ==
X-Received: by 2002:a05:6e02:154a:b0:42f:9399:ce93 with SMTP id e9e14a558f8ab-432f9028b73mr8923535ab.20.1761684597966;
        Tue, 28 Oct 2025 13:49:57 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-431f67eb4b3sm47212635ab.12.2025.10.28.13.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 13:49:57 -0700 (PDT)
Message-ID: <a836c200-e079-424c-9fad-600f802e5220@riscstar.com>
Date: Tue, 28 Oct 2025 15:49:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: Johannes Erdfelt <johannes@erdfelt.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
 <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
 <aQEElhSCRNqaPf8m@aurel32.net> <20251028184250.GM15521@sventech.com>
 <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
 <20251028204832.GN15521@sventech.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251028204832.GN15521@sventech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_134959_154252_5F7973EC 
X-CRM114-Status: GOOD (  16.15  )
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

On 10/28/25 3:48 PM, Johannes Erdfelt wrote:
> On Tue, Oct 28, 2025, Alex Elder <elder@riscstar.com> wrote:
>> On 10/28/25 1:42 PM, Johannes Erdfelt wrote:
>>> I have been testing this patchset recently as well, but on an Orange Pi
>>> RV2 board instead (and an extra RV2 specific patch to enable power to
>>> the M.2 slot).
>>>
>>> I ran into the same symptoms you had ("QID 0 timeout" after about 60
>>> seconds). However, I'm using an Intel 600p. I can confirm my NVME drive
>>> seems to work fine with the "pcie_aspm=off" workaround as well.
>>
>> I don't see this problem, and haven't tried to reproduce it yet.
>>
>> Mani told me I needed to add these lines to ensure the "runtime
>> PM hierarchy of PCIe chain" won't be "broken":
>>
>> 	pm_runtime_set_active()
>> 	pm_runtime_no_callbacks()
>> 	devm_pm_runtime_enable()
>>
>> Just out of curiosity, could you try with those lines added
>> just before these assignments in k1_pcie_probe()?
>>
>> 	k1->pci.dev = dev;
>> 	k1->pci.ops = &k1_pcie_ops;
>> 	dw_pcie_cap_set(&k1->pci, REQ_RES);
>>
>> I doubt it will fix what you're seeing, but at the moment I'm
>> working on something else.
> 
> Unfortunately there is no difference with the runtime PM hierarchy
> additions.
> 
> JE

Thank you very much for testing.  I'll try to learn more
about this in the next day or so and will resolve it if
possible before I send the next version of this code.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
