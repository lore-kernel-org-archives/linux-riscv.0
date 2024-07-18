Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46E5C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 23:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KabhJg8iIN38wWj0hDVYaxY07lZ1qQvZt8H6eJUOlWA=; b=iVWhdxUg6e7NAL
	ouB4u/JCIZWl5SBfbZF9qK/sgpkigB3ncqFrkhUDyarL8GM431IOO1hI329HNXT2NB6dj1PoOgy95
	M7und8VsVTRxItQ+bJYMYzN+Z0DxNXsxps4aFBI827b3/M+JCPCo9fiB3oa9adfdytW0VosudiWpq
	YXGmIxCTScVg7+yXr5lBF4GTtRgDuSAwb2sAhZdQIJ+QaJ7/1toUAkLqb4BpqF++MPpFcB5PrMUeJ
	Ra4OVS+pCjTUb+CJm3HTGSInZR+PmfMUNLeYK5wg/gHlX6A3yEx/0B2bpbwe/XzT/ccx+pnQh2jtn
	1ZMy99AkSpyV0DWrSfvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUai1-000000010Zd-2QbT;
	Thu, 18 Jul 2024 23:38:49 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUahx-000000010YB-3sN7
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 23:38:48 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-8036ce660e5so58354439f.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 16:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721345925; x=1721950725; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nvIns0vPchcCSpiwT/Cr//HZT6luVmkYPX5bZikjiSM=;
        b=YyyhGi4YrnAO/xHw/q3WYaryPt4Dd6oNROw8QCNb8wA3Ntn+ec/DotHmRdmqK/7NiA
         AKIXNqGEp9eWh7gWnFttGGC158faOmw/tbveLRt1AFg6YFJ3UjTidjlvrIqpYUhPX0Hm
         h041/n8aFyhzem5DeQ4a4BBVKxIZ1nKH9EBrl+sVGs+AamxOTekSFsluE0COHkEo7YMM
         Fm5ot2fPfSyRpb8GEDzs8PqmViCWdIW56yAhwP0HsaGe+wiXBSl1IHXkqaaL9B8VL6yd
         /70jTGM+qi3XzpyuWeuzjH6UlsDKOu1aO/kYIPjg956sYSOs4Uvphr2bs9SHVl8gbg7O
         ekAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721345925; x=1721950725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvIns0vPchcCSpiwT/Cr//HZT6luVmkYPX5bZikjiSM=;
        b=ZaF1MnDepOFHYbFdRi4uQHNEBSXtd3mPQLcZKVVGgSn/QjSisspZwGvxZDygrlME1b
         WzUuxwYbqn3BBT3AtezaSFr7lVnWIyIcapI34vJcE7g5fc98+sjvewW3vfyWH4Ap5YKz
         xXRQY+HrWJs5SKlMaF8CtPgEVpaOvKH27CF0QWCKp76OSS/cVkNR5GIjNtI0RdbJcgDA
         S/5up3uK+/3kjhPlVo1raBbQx8b6MugTg7/I6Ga0t4tYZ3md/pWpIOiWtJF0Y5p5f4f4
         Q7ERBVbA2vBoORydIQvrrMq7c08zXHtWKTQurHCq+kAkEOfdSbTCMEzEHMaYpSZP7f2K
         KMjA==
X-Forwarded-Encrypted: i=1; AJvYcCXB4M1T+5l6rrDKk2OGbvjFPJ6a4VYFpIpQZHaPNmgCJ19buAmvZctzuOSRFGRG1uXwphcTdVHBYaD/aRycNWF/qJ8NCtA204pEVKJ0X6qR
X-Gm-Message-State: AOJu0Ywn8jjss8rvSOUYLc3udwYJSroj+4cYzNLoTMVKbVbPwrpsMXdO
	Eyn6NPiYND6dqQ7JJ5D7OivKY5A9ahA0WTGDCB2utF0Au+s1np5EunC5YB4eAp4=
X-Google-Smtp-Source: AGHT+IEIoaaRXy0Um8nUPOglEs3ZnOloxeKDVGZgw8a7UQi1E33LPlNqKhP4N06l+qm+Tlu0m2n/3Q==
X-Received: by 2002:a05:6602:1347:b0:807:28a5:aa47 with SMTP id ca18e2360f4ac-817125e17eamr804148139f.18.1721345924786;
        Thu, 18 Jul 2024 16:38:44 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2342f15ccsm80150173.67.2024.07.18.16.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 16:38:44 -0700 (PDT)
Message-ID: <727b966a-a8c4-4021-acf6-3c031ccd843a@sifive.com>
Date: Thu, 18 Jul 2024 18:38:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, Conor Dooley <conor@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-3-yongxuan.wang@sifive.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240712083850.4242-3-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_163845_999691_A6346519 
X-CRM114-Status: GOOD (  18.12  )
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

On 2024-07-12 3:38 AM, Yong-Xuan Wang wrote:
> Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> property.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..e91a6f4ede38 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -153,6 +153,34 @@ properties:
>              ratified at commit 3f9ed34 ("Add ability to manually trigger
>              workflow. (#2)") of riscv-time-compare.
>  
> +        - const: svade
> +          description: |
> +            The standard Svade supervisor-level extension for SW-managed PTE A/D
> +            bit updates as ratified in the 20240213 version of the privileged
> +            ISA specification.
> +
> +            Both Svade and Svadu extensions control the hardware behavior when
> +            the PTE A/D bits need to be set. The default behavior for the four
> +            possible combinations of these extensions in the device tree are:
> +            1) Neither Svade nor Svadu present in DT => It is technically
> +               unknown whether the platform uses Svade or Svadu. Supervisor
> +               software should be prepared to handle either hardware updating
> +               of the PTE A/D bits or page faults when they need updated.
> +            2) Only Svade present in DT => Supervisor must assume Svade to be
> +               always enabled.
> +            3) Only Svadu present in DT => Supervisor must assume Svadu to be
> +               always enabled.
> +            4) Both Svade and Svadu present in DT => Supervisor must assume
> +               Svadu turned-off at boot time. To use Svadu, supervisor must
> +               explicitly enable it using the SBI FWFT extension.
> +
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware updating
> +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
> +            #25 from ved-rivos/ratified") of riscv-svadu. Please refer to Svade

Should we be referencing the archived riscv-svadu repository now that Svadu has
been merged to the main privileged ISA manual? Either way:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> +            dt-binding description for more details.
> +
>          - const: svinval
>            description:
>              The standard Svinval supervisor-level extension for fine-grained


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
