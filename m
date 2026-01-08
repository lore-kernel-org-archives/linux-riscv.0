Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569F2D1D483
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 19:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPh21DV+qXhfoeopAmhqTDyly3rRzBrx9dUy2qs2Atc=; b=22qu2+0JeSkSZ1
	UbW2vNrI+tzeZi6kHHL+MoKPSXd1E1nYsluRKutEX1OGKuNp2YemJfxmYdjabkWbDCM0bZ5qEN4op
	Asw4/kSoWUiEjgm9Pa1sbLu9seDWPJPZxYAHNA3jASvfcOgXuhG2G76KJndNcL3ShTQjjqLSdWAey
	LBp7KhYzA1fUPHhbpBMKD+53e1OcCpY9rvTrr2GoujxVsAKwYJtv7T7DZbqXeNTNPQO0625dD0Ip9
	BtVU7v1hRUbkMePrxd8TOx+JUAbnYKV1bfOdweUSknQAUCgcHAxyVp4ZTAcVWRIm/wfKJIWYgjbCf
	IEdHxZpOiid9VU3Bd0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvxH-00000000mI6-3Af9;
	Thu, 08 Jan 2026 19:45:59 +0000
Received: from mail-oa1-x42.google.com ([2001:4860:4864:20::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvxE-00000000mHM-3m48
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 19:45:58 +0000
Received: by mail-oa1-x42.google.com with SMTP id 586e51a60fabf-3f13043e2fdso1405758fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 11:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767901556; x=1768506356; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0eSk+8SweBNRYF6OiM3wD68xD/JtKcShoUz7XdjZrA=;
        b=KU7LuuiyDZZagQV1+tfbuG4wClBbT0uQRYNpjF/0/4RUD0ikiHeMqKvbGXeVfN8coT
         x5M1klX4JeIsGUSypfxnadU+txp1pRqvtxY4+3V+rQvYof4624evqiw2kSoNgXu41Ln1
         u5iTrjlh7zobqp99AQfx44LeE58OCo04OIyJzhkAtT74WeA7qVTb+WHW+oTUDhXXSPjP
         B0DftLq96QhQJ/+jj2j8BkOfp1rhSqAy95Wjj3vpqlJI1Txmpxt/oZ/B2AaDuyklFZgV
         ogml/YA4C16BOACsHKhASdYbqh5OBSSqa7YP+y1HRm7bMSlaDSm6oXXjZStCpmLbGLP0
         mAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767901556; x=1768506356;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0eSk+8SweBNRYF6OiM3wD68xD/JtKcShoUz7XdjZrA=;
        b=wMo8QNr5cWw2mB+z/qyBksOO+YEZuFX5EfavXzJ48wkQ2hDNmVoPIdAqoeTdQnSCSo
         XAtr0Y1AUQHfCTz/iJ7CuOdl04yZsM3wcpRvYRYcGqV2FTvQFykn/vxgIZJ0bav0NNXP
         GTZMyWRu+kEWbaCY4reu/O2YhdX9YTlWQy68V5vlPmwt+zSNXo3Pv8vsRfsH6UvIf/oW
         NnEaCmjoBJ/imZNIQkMAEpqKMkltYVH+00hhTnYdJGD4/z2ST7bTbbfuoFq7HNG8FEWR
         TzROo2CKh30iTxLYW1SQtZAxEZGfSF5G7slyhvs5ViyN4LHlsqNTg83s746lPBJFWlGB
         zhxg==
X-Forwarded-Encrypted: i=1; AJvYcCWgmF17UlC31WwZcEnRtpqVQEU3VOMu9ooLhnhY4iB99vj1fMuJp2ehgJRWVW31oOxHNSJutI6D+thYfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqwOUzOG7qgXTb7t1HZC0JbGb/vgBr91yCWA/GpDTeeY/ft6H1
	cyT4XJycLI3N+cI9zQ+Tbu15ROwL0Eu23PnEyVEehciltKxwtVugxIVFnxHOKNlRQ9E=
X-Gm-Gg: AY/fxX7jVUNvGJrjbWYR+Lc/j9FqH5vodbFYiNkHPM5e0f5n6pY2TKhTjs8IMOsAJAo
	2C/gMYcLuqlKhiwxEbG0k954zfuW43CVjM5nLAoKDJ1MjiPajCKteC/HxP0NYr8bQDn9hBaz6Oa
	Sf/jwpsCobKG2ZeILF31FFKYfM/vXiQI/+WKY/t0opoI0Ux98CwM9RoLD59exniC6UV2Ct42XM6
	TcdQ6TYBuUVh2+Ipdc6BJOHOhUn3rOetJOcme/v3nigGJNMxujF9lCrV7novvONtXBz17n/VM+D
	RKaiwe2vWZPKa74ba47Tn9ZGpb5S1zZZsfX9BbELUcIWL3M3tBpywXy0jISWLRdYqPMTxjJ62rr
	fe7NpmW3t7C8opxYvPHcI4qcTaU3nfSPVNabsuHHe+UfrsprFQDZ+Yl2lHtKb3M5B9xYTnjHNfB
	1n/Arrb8EsCEfZmygjWsLVvvzeaI8=
X-Google-Smtp-Source: AGHT+IEnGj7j78QZ6mRN19R9+RwSyzrulyek7pG3baJMhDCtKMbdCTrHEffeVpATRadsKRk6i4mUUw==
X-Received: by 2002:a05:6870:b3e9:b0:3d4:5a8:38ff with SMTP id 586e51a60fabf-3ffc09e5050mr3655803fac.18.1767901555789;
        Thu, 08 Jan 2026 11:45:55 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.86])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa507235fsm5688464fac.13.2026.01.08.11.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 11:45:55 -0800 (PST)
Message-ID: <4ebbe14b-2579-4ba6-808d-d50c24641d04@sifive.com>
Date: Thu, 8 Jan 2026 13:45:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
To: Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Rob Herring <robh@kernel.org>, Alex Elder <elder@riscstar.com>,
 Guodong Xu <guodong@riscstar.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
 <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
 <20251230021306.GA3094273-robh@kernel.org>
 <80e18a32-543a-48f5-81f2-4fa64cb8bf8c@riscstar.com>
 <CAL_JsqK8hRsVWV6WfbZ6hF1PwFfOJhyOrpWwoOhviAgv5ZxKUw@mail.gmail.com>
 <20251230-budding-dimple-c34636b0ca4d@spud>
 <05B0AE03-E7B1-4DCD-88D0-DCB9053F30BA@gmx.de>
 <20251231-grew-abrasion-dc1a9d34e632@spud>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251231-grew-abrasion-dc1a9d34e632@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_114556_955860_8A5D2874 
X-CRM114-Status: GOOD (  25.47  )
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

Hi all,

(Also replied to the v1 thread:
https://lore.kernel.org/linux-riscv/9504b2f6-12f5-46c2-ac74-826dba3fb530@sifive.com/)

On 2025-12-31 6:08 PM, Conor Dooley wrote:
>> Should supm be handled in the same way? Add it to the device-tree of
>> RVA23U64 devices. If a kernel does not support pointer masking in user
>> space, hide the extension in cpufeature.c.
> 
> Perhaps.
> Samuel opted not to add supm to dt when he introduced the other relevant
> extensions, so the rationale from him would be helpful but I'd like to
> get more opinions on how to deal with supm specifically. supm doesn't
> really describe hardware capability, since the privilege specific
> instructions are what does that, which makes me question if it should be
> in dt at all. On the other hand, it could be argued that supm describes
> a combination of hardware capability at the dt consumer's privilege level
> and is valid on that basis. Some wording like Zkr will probably be needed,
> specifically mentioning that having supm in the dt means that corresponding
> version sxnpm for the privilege level that the devicetree is provided to
> is supported.

Supm describes a combination of the hardware capability (Smnpm or Ssnpm), the
consumer's privilege level (U), and the software at the next higher privilege
level (M or S).

If the DT is targeting U-mode, then I can see a case for adding Supm to the DT
either at runtime or based on the known capabilities of the
next-higher-privilege-mode software. So it could make sense to add a binding for
Supm. But we still shouldn't add Supm to this particular DT, because 1) this DT
is not targeting U-mode, and 2) this DT is not bound to a particular version of
S-mode software.

> Either way, we are going to need something in cpufeature.c to imply
> supm so that it appears to userspace if the privilege specific extension
> is detected and supm is enabled in the kernel. The kernel already does
> the implication internally it just isn't reported as an extension to
> userspace IIRC.
> If we permit supm in dt, we're also going to have to turn supm off if
> the Kconfig option is disabled, but that's relatively little effort
> since it mostly (or maybe entirely) reuses code from implying supm.

It's currently exposed to hwprobe() but not in /proc/cpuinfo. This was based on
my understanding that hwprobe() was the right way to check for availability of
extensions. I'm okay with adding it to /proc/cpuinfo if there's value in doing
so, but I would recommend that the extension in cpufeature.c is _not_ parsed
from the DT and only enabled synthetically.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
