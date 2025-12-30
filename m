Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9921DE92FD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 03:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApG+5dJx4Tv0zfRP8/PsH5pMrsAW0vRJMsG/8L9CVpo=; b=sTJmc6fODnlDGi
	MvfQaFEhsCn+Ej/zQtTf7yQ6fxutb0ZdEmpb9Znppc7+B1ER3s/wWTQ7gSgxb04FimlGPuVJm5Ld2
	KpwyuwJ+sjmMVTCT5sRWGghVayb7Zp8cVkEE/kllc3IBmII9gfcF9cnvg43QC6v0zWVaKslnbDeOb
	NgtlXQ8IoAawClPrjEfNjI+bMhQZzwt7Dcr+qWNEQe3Ly3O0Qg11biUzb8ABk0PD9/eUzFggPM4QX
	VD4owWcxfCiSbQ9H1E1ZMVydj1xeUjR6q3cKtwHzO/lwvtRHDchWzqEOp6HAU7TE/RXBeT6zcJZqo
	SPNntPvZAWAYh2YiIOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQC6-00000004Lxm-3Krc;
	Tue, 30 Dec 2025 03:14:46 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQC4-00000004LxG-0DOK
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 03:14:45 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so110448706d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 19:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767064483; x=1767669283; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fo+LCIXOkAwoygnwlPI9RcyCWfLGdVzpI0JFy2xEtoo=;
        b=jF0TyExg+3IJj8R4Oho2Lkj2Hxj3zXT/7UJKIL8sTTdpoDeSl4fjLRD3yHp5b6NXWx
         ET5oIxazKcuAzxZFSXAaqOBqB7uoblz1VmrzntcNb2CoVKwlX8FIzl1wQ+8gK55i1k6V
         n6v7Gz3+1+LfShY/0gTPtUV2ZH7Gnoz9ec6XQveTUFWpLE30FY9tifE8lppIiW1B8Qwg
         ppM7kYl4ac3+CCi8WvUIFFNrFtRQ9ZpvzEWIc6A0uNjHtP7RwKUicgSRVjxNfcNweK+H
         o0vLzhPWfmUd9/gDBiH01hIC48S4XnKMG2MsYAKWb65pby2F83cZj6OQXOAOobqMjKN9
         lIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767064483; x=1767669283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fo+LCIXOkAwoygnwlPI9RcyCWfLGdVzpI0JFy2xEtoo=;
        b=Xw4VMibLcOuk7OCy5AQThYy12Rz75kV8vjEebLtI6MQ0TsxJ37t8nLmO/yxALqP4Px
         GMH6E/1Tr9o3NM4PMNE5zDbp1aiSP5iP8e7I35c2gUo+3vtft3KNaPJJ/Olztw+UzX32
         KMU1TLfCMBvBnGXGw20CNDra2sKTyfB4UKKs16RiVf9k/ZLMPCs0E/TMJ5Pph5nVa1Ns
         zhbMQZUNVmcZDTmJcSvBeRpO9JHd1VMbV2ruPcCzcmOQnOENc7e0gzj4CWaptZjcf0XQ
         0T+lOiu1x4dgkD3qFTGvknDDUbEmcK0oBIZcxKKYFqyn3ITS7iCp5xvnvQsmpeLbgadW
         oBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuUipDKpLzEhn1tDYnfJAEuq7icP0KaFq9WMQ5Nmu0NI7DlpEWZ2V8UEj3xj/wA8pGWv1Fwws+TOxQ0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yydsghh4QORDE7M0pWRfQ57Q0HmPZnERtNmGmQkUxy6tNdHh2BM
	/GEelYqcI5517cEa5n0AZvuC1np1zsyIgoEc+vKlDNJsloDVFMEL0pZjuQMZr76vHDI=
X-Gm-Gg: AY/fxX4rtXFzq2PTMJIKdyBpa+/Mu8di4knfaFv+ZJHMt6n2pf1CA4OwbGkr/OGjxA7
	TUKdWJ2/3DszRgmANRKBt9nysh1qVVnr54aCw6S0Pe8UZEVzvzTL833bEudyjvfs+OhKQFIPTvh
	dsyznXXTxfcPcsh8Lp/6BuPs2mJUNHugBKhh0B0B8hEVSUcY6cBrojE4Luogv85/UB+HVo9dlw0
	qjvjAD84drD4DtPJjFM8El242sIH+5+fKvOXklW3UsSblZyfZ1gn7BZ++s+Bq4a6p49jeF6ECzZ
	efd4mKFRhAT0mDQpzt9JYQpfNxw7T2kz4ANsBgdH31lvineBzioVwtb8T8CmQz05n1KvTkw/GkE
	Zakk5g84unVRrzdDffM49jRfH95MKNi92U4OTU72lz9aQ5ah13kamam9CSK4j5LkYPdEPUE7i0G
	lHX23MoMVfyx/2FFQI2pdk0jNdWn+S6npR+DaZdjL2/k07HpQujE4=
X-Google-Smtp-Source: AGHT+IFB7LZkmRzeqkhHKLp45e4MyeYxB7bz7JU2i7yTBStrvqCCZV4IuhRIFy1YvcIXrLmRgcwS+A==
X-Received: by 2002:ad4:55e6:0:b0:888:4938:49e7 with SMTP id 6a1803df08f44-88d859bfbb5mr348817656d6.71.1767064482735;
        Mon, 29 Dec 2025 19:14:42 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aef2esm238379696d6.32.2025.12.29.19.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 19:14:42 -0800 (PST)
Message-ID: <80e18a32-543a-48f5-81f2-4fa64cb8bf8c@riscstar.com>
Date: Mon, 29 Dec 2025 21:14:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
To: Rob Herring <robh@kernel.org>
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
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
 <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
 <20251230021306.GA3094273-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251230021306.GA3094273-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_191444_350464_E2DD4701 
X-CRM114-Status: GOOD (  24.59  )
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

On 12/29/25 8:13 PM, Rob Herring wrote:
> On Fri, Dec 26, 2025 at 03:28:47PM -0600, Alex Elder wrote:
>> On 12/22/25 7:04 AM, Guodong Xu wrote:
>>> Add description for the Supm extension. Supm indicates support for pointer
>>> masking in user mode. Supm is mandatory for RVA23S64.
>>>
>>> The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
>>> state") of riscv-j-extension.
>>>
>>> Supm depends on either Smnpm or Ssnpm, so add a schema check to enforce
>>> this dependency.
>>
>> I have the same general question on this, about whether it's really
>> necessary for the DT binding to enforce these requirements.  The
>> RISC-V specifications are what truly defines their meaning, so I
>> don't really see why the DT framework should need to enforce them.
>> (That said, I'm sure there are other cases where DT enforces things
>> it shouldn't have to.)
> 
> Does the specification have some way to check it? What happens if a DT
> is wrong? Are you going to require a DT update to make things right? Or
> the kernel has to work-around the error? Neither is great. So having
> this as a schema makes sense to prevent either scenario.

I'm really glad you weighed in.  I actually have several questions
related to RISC-V extensions and DT.  But for now I'll focus on
just this...

To answer your first question, I'm not sure how the specification
is "checked", or what "it" is that you're asking about for that
matter.  Also I think we have to be clear about what "wrong" means.

RISC-V is defined by a (large and growing) set of specifications
that are developed through a well-defined process.  When a spec
is *ratified* it is committed, and it won't be changed.  These
specifications are ultimately *the* definition of RISC-V
compliance.

I assumed the "wrong" you're talking about is a DTS/DTB that has
been committed but somehow does not match what a RISC-V spec
says, but I might be mistaken.

Anyway, we can flip that around and have a similar problem:  What
if we define the DT binding in such a way that it doesn't match
the RISC-V spec?  The (ratified) RISC-V spec is right.

My thought was that we should have software do the verification,
and recommend the software (e.g. arch/riscv/kernel/cpufeature.c
in Linux) be updated to verify things before committing to a
DT binding.

To me, C code is more general and more universally understandable
than YAML rules, but I'm biased by how well I work with C versus
YAML schemas.

In any case, a "wrong" binding is a problem no matter what the
reason.  One way or another there are things expressed via DT
that must match the RISC-V specifications.  And yes, we do have
tools and bindings that can verify things related to DT.

>> And now, having looked at these added binding definitions (in patches
>> 07 through 11 in this series), I wonder what exactly is required for
>> them to be accepted.  For the most part these seem to just be defining
>> how the extensions specified for RISC-V are to be expressed in
>> DT files.  It seems to be a fairly straightforward copy from the
>> ratified specification(s) to the YAML format.
>>
>> Who need to sign off on it?  Conor?  Paul?  DT maintainers?
> 
> I generally leave this extension mess to Conor.

Sounds wise.  Should I address my other few questions on this
topic to Conor?  I don't want this particular series to get
held up on unrelated discussions.

					-Alex

> Rob


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
