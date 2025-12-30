Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E671EE4992
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 18:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JB/vOZrdKGQO9JYeJ291XfuZuBkPoAhltcYHFdwaq+s=; b=3Z/LwFxsWXIfQ1
	H1b7J6jxvsEd95X9IWtPXFw8r1xlUsHMKXlX6l7A/X3ppNnLEe1Pyn71saXv67p9wp/SWqv54zHvy
	gDyR8krOvkAS5JmmCD5tHhr1bFr4BorAulBybnykmZmdlxBy7j7it3bDNUNaYasTGoceLZ7xuxp+d
	9MaeYHiGDGE+q4xS4++0ckYevMBf9ZnDMhl2GZ1eNGI4UENxrl9B83+VPWK4UtkpClMWN9M26sNkG
	ePeWmmFfOFC4jUoQOBBpTjsbL7JVHrieKcPuFSAjBoDXZ67n7MFQ8DwoNnKKs0ZwB2f0ycDZuZZve
	xC6EP44liIipsoZMAXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae7J-00000005AFM-1p3u;
	Tue, 30 Dec 2025 18:06:45 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae7G-00000005AE8-3nLp
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 18:06:44 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-88a367a1db0so171776766d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 10:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767118001; x=1767722801; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4yVj/w5JDZnyERJYSMulDshPdYjkZAshZuWaOUGklxI=;
        b=BPFPMu+MebxLbODKaBRRAD1kR6X68vB5YgJs2JKrw6HFOKDacHCcXqK0NhQykC//85
         zdx+x3IqcARCof7XOWopsuN8EAFprgjq0E4zX8bRnjpR8hcV9MmpqYx+ay5e6YflLvGQ
         0DAXcAvI6I/NCWb33Kbq2QL873ur+i8aQ8e2doC7Is+WxLgBuFcYmRmZAa9F0pq888ol
         retdqq1i3IMaJ2aXdJlVlMQDC8mGHMtrGSDV6AA3YnzPMifpVq+YQLic+DgwCIPTup9d
         kXp6/u2Z0h01V0M64+rx0ud2WirGzRkHCW3tV7zB0HqVW0zG10rR4eNFcWxPjd1qzaTz
         6v9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118001; x=1767722801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yVj/w5JDZnyERJYSMulDshPdYjkZAshZuWaOUGklxI=;
        b=gUMvegE8IcIpj4ziAGo4RzzMA2xYIfj+avBmjw6vbe0hGYppFP8CnuQqeYrliWDjo1
         8I9bMCRlahPh0aycOLtLgvYkMfo8M8vWQ4CbVwhewdmOh1vSx7/NZ9QrZ03MQGQgjJ8W
         mZdNdBvlb3VvpYBYe9gRaH5Xyb1y91IrHEE2Ccuo6LHjntRgyt+/BFrGNuHiHf7O+cLT
         yLmEVk6NKikANsneiE0ea03h7uWBKJ71jN40LYRTD0lo99f20QAF8vRd/pvjP26OL2Cn
         8T7NAoMyFDUKmGWZ5So/M5a+5vUlO7HmoGIjwngMNOcOJMrwR+PBIbQu+TwGWsdtuhBl
         B4vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhGM/dRuITmJVi286mcspOFve+jcOd8vh7x+WPLCAtS9yiKAk1IyNXyb2A+0ZCk+RhDxQtDMitW2lYGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwieePNxBq0t+k1KHmxd7C5T2VZwkKA53yPyS6XUFGqEKKkOodl
	PnBIJ53a3oWLx/K2tPcqSD0XwAZq2t5OiCTbqQ68wam0onGh4dAQnN4Yc3ssvK+3ZL8=
X-Gm-Gg: AY/fxX7llX0oJo1PW0+JHH+YcOYADAZTItF4xt0I7CNX48O/87YW9tjfVdJ/ts4zmOY
	eFWWFuksKmXd0Bho5j0FTseJs5YgIw6qU+e3Maw8m4teWv4FTDg/5P/JWL/khFE0DwdbbE/pHC1
	GHWFiveO3MaE3hO3P84//eAJKVmJ4ufZb339Cc0wBvpOIj4vZ9RrhP2Gcio2SBufab5XCWojC/H
	9NwX92uXxPlyglBHjEBknOX5k8UprQFnh8Azn6+xFBbpHe9iqGTa7I2uXh6tBJ/PO77kCwlA8wx
	igZDn2ZBW+mwFOkf0tZMEEGyXgp33QfuqiMtHmaXuwIU60GEqnMP4jQvnju85PA9CJdwzJFU/aD
	oXGePGGh+W1MGVeIrtSg0A2SZ+YIKmG4b1cm8HQsIXdxNxkRS0XjDWvpS0nSlwEHFnyy8rbVGgC
	Jt1mzCaG1qPURa2ODIvvLwcv9jhBR1xuR4Xo0wDc3Ek90s1GlHGKg=
X-Google-Smtp-Source: AGHT+IGutbAgelJ7VpLiqCRVpc5Qslt27XYYdm9lZscZshp31OHqvrlSlOewiedfwdLZdpnsi4JpGQ==
X-Received: by 2002:a05:6214:5b85:b0:88f:e9f0:77b9 with SMTP id 6a1803df08f44-88fe9f07bd7mr289091346d6.58.1767118001338;
        Tue, 30 Dec 2025 10:06:41 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7e8d4sm261620256d6.41.2025.12.30.10.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 10:06:41 -0800 (PST)
Message-ID: <13ac4110-5ef9-4469-9fcc-4168479758dc@riscstar.com>
Date: Tue, 30 Dec 2025 12:06:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
 <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
 <20251230021306.GA3094273-robh@kernel.org>
 <20251230-outing-discourse-723547cc14da@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251230-outing-discourse-723547cc14da@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_100642_963679_5D2592EB 
X-CRM114-Status: GOOD (  23.66  )
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

On 12/30/25 11:22 AM, Conor Dooley wrote:
> On Mon, Dec 29, 2025 at 08:13:06PM -0600, Rob Herring wrote:
>> On Fri, Dec 26, 2025 at 03:28:47PM -0600, Alex Elder wrote:
>>> On 12/22/25 7:04 AM, Guodong Xu wrote:
>>>> Add description for the Supm extension. Supm indicates support for pointer
>>>> masking in user mode. Supm is mandatory for RVA23S64.
>>>>
>>>> The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
>>>> state") of riscv-j-extension.
>>>>
>>>> Supm depends on either Smnpm or Ssnpm, so add a schema check to enforce
>>>> this dependency.
>>>
>>> I have the same general question on this, about whether it's really
>>> necessary for the DT binding to enforce these requirements.  The
>>> RISC-V specifications are what truly defines their meaning, so I
>>> don't really see why the DT framework should need to enforce them.
>>> (That said, I'm sure there are other cases where DT enforces things
>>> it shouldn't have to.)
>>
>> Does the specification have some way to check it? What happens if a DT
>> is wrong? Are you going to require a DT update to make things right? Or
>> the kernel has to work-around the error? Neither is great. So having
>> this as a schema makes sense to prevent either scenario.
> 
> The reason this whole mess exists is because extensions got redefined
> after the kernel port was merged and the bindings defined. This is

Redefined, or just new extensions defined?

Was support for any extensions added to the kernel before they were
ratified?  Even if so, did the meaning of the extension change
between when support was added to the kernel and ratification?

> almost all a hedge against there being future redefinitions. For now,
> and hopefully forever, this will just be a list of extensions with
> citations to their relevant documentation so that we can say "this is

Yes, this is good.  I think the bindings should, where possible,
just refer to the precise definitions in the (ratified) RISC-V
specifications.  But I now agree that they can also encode
logic to enforce things.

> exactly what this means". The added bonus is avoiding messes like people
> implementing development versions of specs and claiming support, because
> that just becomes "your devicetree is wrong".
> 
> The dependency stuff exists because it is far too easy to miss something
> in a list of 30+ extensions and dt validation can reduce some of the
> complexity required when checking what extensions are supported.

By "dependency stuff" do you just mean the DT binding logic?

Anyway I've come around to the idea that DT bindings actually
should do validation like this.

>>> And now, having looked at these added binding definitions (in patches
>>> 07 through 11 in this series), I wonder what exactly is required for
>>> them to be accepted.  For the most part these seem to just be defining
>>> how the extensions specified for RISC-V are to be expressed in
>>> DT files.  It seems to be a fairly straightforward copy from the
>>> ratified specification(s) to the YAML format.
>>>
>>> Who need to sign off on it?  Conor?  Paul?  DT maintainers?
>>
>> I generally leave this extension mess to Conor.
> 
> And generally I do without that much back and forth, just so happens
> that a couple of the ones in this series are the less simple cases to
> deal with.

Thanks.  I may have a remaining question or two for you but they aren't
that pressing.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
