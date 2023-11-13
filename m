Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5A4C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 00:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0f4GP4hV0BDo0a4qiXFUpmUo2+2aqxUori1sCU4WxUw=; b=XJzHyU3ckKVkdH
	1kSJkBJf0Q9RRYo/ekIGStQdJ+itEj3B2Bt60euzkOVN9fUHey4bQQeUSUqQn0O1liXs39NT4prVv
	/c8Vg0D0qX9joyqGmEliGhsso3RXY/YoV6mHO0tPbxwUiN0T3vmUK/Hb0KVqlLbRoVZmuSjbLqpsQ
	Bmdf0KDUy2NQumV7qp1eC2u3qoI4JoucDqI+oyIn3ZMvT2izmhlhM1v3ajjthgeXOVxk97NnM6/Sl
	Io1GAQSttj5qQ3SUwoBf9MZe8sWy/3KgKNJKL3LJIK4Tpb+gVmItdPdOWFsabrU4EwuZ2A4wcHI0g
	+J8SL8h5mHF5lp3JrZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KQT-00CtmO-2v;
	Mon, 13 Nov 2023 00:03:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KQR-00CtlM-0b
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 00:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699833810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZHIbA5dSDa0YFUBZZETUQKKTVizuf5JaF0jClraxRM=;
	b=d1f23R4z4J7igoUx6O4n+PBCHwLpONwfAsSnhIgC4GvGIowSKfk6qf6UxT80F9sjTYJzZu
	zcKuhjWoyb/e+4Y8YDWci5HlDbhlMNjvZNoNy2g4lJZj8ByT6vYo6XLB5znFJVYAcKpLM/
	yPWvUpsFCOLgfemle8hx1EqVVrxEumU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-tYNH8GNuPCOOCMhXht5K4w-1; Sun, 12 Nov 2023 19:03:28 -0500
X-MC-Unique: tYNH8GNuPCOOCMhXht5K4w-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1cc391ca417so43628995ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 16:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699833808; x=1700438608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZHIbA5dSDa0YFUBZZETUQKKTVizuf5JaF0jClraxRM=;
        b=Ugxvzbw/5EzMzqMSsApYA+o7DFaAXlxpp9FxftrZv1AohtYsnJLC8wMLdxSp57WvEJ
         1EsbdSEvTuy5CeKRXLFbRNwsNqebusjEJYmMkZ/YZlFjZwO/f321xA2ulxPQusCk3DE+
         Bz802p2qJ9vcI48w1Yoej7uTeMphoRUmJrMImZMP3JiIGAZpNmouYqh660VkjWnJS/fM
         KlrLk+N//Di/wjPKpTR+atY0+ptPWl7ZBTJU+k5IN7k2Gdjnx2dDeta7FMq5OsnCGAn2
         AD8C0oPAFxLeq+Rf41vGvOLaOcRLrJqsYT4kluzTzXpfI61L7cCMHOl6mTXX00JvlQ/f
         bqMQ==
X-Gm-Message-State: AOJu0YzwfHFU3XozrdrSAvboSAd+XP1tqQwIhhSHSbrAcbh/o2elS0C+
	HXhSZ/+Mg9P+ewWctp/3FMUFhmTT7gPY6nJhRgOad2WdV2NnsBxKM9jynr77r69FgENQdMhKD8P
	Dq1hxy/hStDA0/mJgpZq++duWtowv
X-Received: by 2002:a17:903:124a:b0:1ca:7f91:aa5d with SMTP id u10-20020a170903124a00b001ca7f91aa5dmr7816449plh.16.1699833807798;
        Sun, 12 Nov 2023 16:03:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECTuRNfb72TOfAtkV7pMmjD+8xBNsdITfj8lqsTmhB+HwPaZ/5CGTlMF5gZ/CbtXGVZnzltA==
X-Received: by 2002:a17:903:124a:b0:1ca:7f91:aa5d with SMTP id u10-20020a170903124a00b001ca7f91aa5dmr7816433plh.16.1699833807525;
        Sun, 12 Nov 2023 16:03:27 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id jj3-20020a170903048300b001cc29ffcd96sm3038705plb.192.2023.11.12.16.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:03:27 -0800 (PST)
Message-ID: <e4f752f9-3c8c-4d96-8efd-d9dc157cc976@redhat.com>
Date: Mon, 13 Nov 2023 10:03:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/22] x86: intel_epb: Don't rely on link order
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JKq-00CTwZ-Mh@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JKq-00CTwZ-Mh@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_160335_317095_093C72E8 
X-CRM114-Status: GOOD (  13.40  )
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

On 11/7/23 20:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> intel_epb_init() is called as a subsys_initcall() to register cpuhp
> callbacks. The callbacks make use of get_cpu_device() which will return
> NULL unless register_cpu() has been called. register_cpu() is called
> from topology_init(), which is also a subsys_initcall().
> 
> This is fragile. Moving the register_cpu() to a different
> subsys_initcall()  leads to a NULL dereference during boot.
> 
> Make intel_epb_init() a late_initcall(), user-space can't provide a
> policy before this point anyway.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> subsys_initcall_sync() would be an option, but moving the register_cpu()
> calls into ACPI also means adding a safety net for CPUs that are online
> but not described properly by firmware. This lives in subsys_initcall_sync().
> ---
>   arch/x86/kernel/cpu/intel_epb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
