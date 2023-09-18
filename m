Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF58EC46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 03:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZ63nQ8MZ0Pb7G5Go6vwuY7g9wHwNoAfS25tiTav66E=; b=CUFSHMwwG3kUZS
	ZjYvqTGzaA6Xkg1mxCI092B9HoH6seNxpP8IzZNx/A3/UMeXU9yOOppSoYTzrrzFECB9AgZXi7HqS
	EML51dNFxvp223FbeJyFuZ3UoB22cs/ns6AafQOTpD6mQGhn0ksjaKYYvOLc4vjdQb5nXTH34SSpr
	bXczJWQa2ZT99LExxNLuQCWMiwj8d/pYesvrJkrKhE3EDuyQZZMS8RWZCxNNqC4LakneHZSM9cDEe
	d/LZc8i9ZpbUtZ7ext1QlAIeY/Krl8WoiD/oK+U4zymKMKh5lJUgiPLuWrGJh4QjDAJTUjR7QmbCh
	JtPGTf52c21ZqpKKHD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi5Fs-00EJfR-0i;
	Mon, 18 Sep 2023 03:49:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi5Fp-00EJek-2v
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 03:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695008937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tf1afM7/bTwRaF6MhWk6NmsY4pxpFUisMFOko6iFoOg=;
	b=RmK6mqbqchmt5lYaE+aVLfYL3xLWUS5jHqRp7sAXOyajK4bn8yEjvdkSQRbq200WYSv/KO
	bBIFn/skeIo9ifvzbcFkn/E8WL6FZ/lZcgq+OJPKoXI3dZJorf2HNqQu8Eb/n2SOYe5v6a
	GPu+fXxhXzeYkPBXQ/qKMm5CWax3iPk=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-0plRiEArMWeKbj8gnLVe0g-1; Sun, 17 Sep 2023 23:48:55 -0400
X-MC-Unique: 0plRiEArMWeKbj8gnLVe0g-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-57769a3c0c7so2906212a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 20:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695008934; x=1695613734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tf1afM7/bTwRaF6MhWk6NmsY4pxpFUisMFOko6iFoOg=;
        b=duk3gnAQCgNOFVFwQtU/mrTC0mSW0UhqqWstDcbFJAyyNE6mWBypM8UHis8E8XTmKj
         9oWl58xjuZ+0qurUaxQG3VEHOOlO1AdLCFOWNwaO0OdtlQgwpdNF3E/LZPFfgxDbIWPM
         v0MBXteMU835V/Qcz/hcCIMq4gcx8yqP7DJd586FKDwUpI2PcWXEm4R+FfZBc5igZxNb
         C9AGDNGd4yGnVzav45uB5M10vJZuZnsE1kyBOhsJZFIKo/DdGuRcF2FhXjhAHcQIPvw3
         a9Gs2htq0IdEqdxHU6YnvDnQpb68m9Z9QhZHhdBU33e7rmIE/Ns4PezpQS0ipbyhAkDQ
         T10Q==
X-Gm-Message-State: AOJu0Yz0yRru60aWNYY+mkwckoMa7zqQIzaTARoY3fr/gBNn7WlP4+SR
	OeVPJHFHDJQ74kGsQLm784m+MF7fClBzL0ub4fCzxKBOCw5rkaSA1c6sAjpPpAe0teOIcjUbZ7r
	pBY19mme93RkAirVwYRS5FzWvZzvh
X-Received: by 2002:a17:902:e551:b0:1c4:16f7:d95b with SMTP id n17-20020a170902e55100b001c416f7d95bmr8120386plf.63.1695008934602;
        Sun, 17 Sep 2023 20:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU+J6/1r/Ic+5ZZYMQ4fGS+99Vl+z2dkdnv17BDJt0rP24HSwlnxKPxSwy3c72dz81jLm2Bg==
X-Received: by 2002:a17:902:e551:b0:1c4:16f7:d95b with SMTP id n17-20020a170902e55100b001c416f7d95bmr8120381plf.63.1695008934370;
        Sun, 17 Sep 2023 20:48:54 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902d2ca00b001bbf7fd354csm7284723plc.213.2023.09.17.20.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 20:48:53 -0700 (PDT)
Message-ID: <4f368470-83c1-4140-9d0f-e64db3402865@redhat.com>
Date: Mon, 18 Sep 2023 13:48:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 07/35] x86: intel_epb: Don't rely on link order
To: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 Russell King <linux@armlinux.org.uk>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-8-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-8-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_204858_009961_FF581940 
X-CRM114-Status: GOOD (  17.79  )
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



On 9/14/23 02:37, James Morse wrote:
> intel_epb_init() is called as a subsys_initcall() to register cpuhp
> callbacks. The callbacks make use of get_cpu_device() which will return
> NULL unless register_cpu() has been called. register_cpu() is called
> from topology_init(), which is also a subsys_initcall().
> 
> This is fragile. Moving the register_cpu() to a different
> subsys_initcall()  leads to a NULL derefernce during boot.
                                      ^^^^^^^^^^
                                      s/derefernce/dereference

Reported by ./scripts/checkpatch.pl --codespell

> 
> Make intel_epb_init() a late_initcall(), user-space can't provide a
> policy before this point anyway.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> subsys_initcall_sync() would be an option, but moving the register_cpu()
> calls into ACPI also means adding a safety net for CPUs that are online
> but not described properly by firmware. This lives in subsys_initcall_sync().
> ---
>   arch/x86/kernel/cpu/intel_epb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/intel_epb.c b/arch/x86/kernel/cpu/intel_epb.c
> index e4c3ba91321c..f18d35fe27a9 100644
> --- a/arch/x86/kernel/cpu/intel_epb.c
> +++ b/arch/x86/kernel/cpu/intel_epb.c
> @@ -237,4 +237,4 @@ static __init int intel_epb_init(void)
>   	cpuhp_remove_state(CPUHP_AP_X86_INTEL_EPB_ONLINE);
>   	return ret;
>   }
> -subsys_initcall(intel_epb_init);
> +late_initcall(intel_epb_init);

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
