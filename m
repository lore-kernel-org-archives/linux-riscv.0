Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75ACC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 03:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TX3ZUeByDQ1M8AfT3Y6m9JG/XRo41ZtJH5FfTVtpxoM=; b=rq0bq92rIlzPET
	lCuqVgzgV0i/Axb28pjpw5omuWcZhGvWZC37RlmLwvLFNTounLJ593Bv1pXVraHHyGXsXs0FerFFX
	3Y5GpuHEqCx5XFftnj5gAiMFLiRO3f3tAGq+2DZNdzoJXGU9e0YYkkuM5/L88N1pE8QCI22mf4tXE
	ncb9TEnWkmTjwCJtcbQrFymvDxkTQd4hilJzJ8fLTrwWbd9dL6RuFSMBpRypJChbDgTKC+v+lLNrg
	fAH/T27N+5isrRuSjaxEafkKd0DHuk25M7N1zsTVKWOx1g3syZ6INddKWEOgvNjOUX5fusQeRNT2U
	LkC2IfzehNg3KOTaRxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8uVC-00CXk2-24;
	Fri, 01 Dec 2023 03:47:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8uUy-00CXf4-2m
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 03:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701402447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Q5xYcnLhhl5wab+9SUNf2YG1+1AQAaLiKPAT2IR83M=;
	b=UP3MBh3shXUPVy6C6AbKCR+eTR8NqSI4CwZCF+6Kw5J2DSDVaEv0fSwLN90wQW7LbbqOT/
	DXCBbHmymPz3H7SpUQQgPgaiB7TSfibtjs6JqW8FckbZXKB6MU2T6wdYjs1M8SIPnfsi9B
	r/YP7vrSNLsC49JlP+QJ6zKgcozF6MA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-7QBbSLc2MtWgu3qx1sHV-w-1; Thu, 30 Nov 2023 22:47:23 -0500
X-MC-Unique: 7QBbSLc2MtWgu3qx1sHV-w-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1cfd77ffcb2so1466045ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 19:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701402442; x=1702007242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q5xYcnLhhl5wab+9SUNf2YG1+1AQAaLiKPAT2IR83M=;
        b=PBsV/21pZv4pugz7ahqv/GIIxfqrh3LtqPMcbh/Mo0TMHHrjN2jXTQ9E8mTxsQw2cE
         UDOx6sZ9RsI+xV7N5cl7Jk+PpH6GfeZ51fAFF8/SE6dVZ8ajoNaJogpB0HSTMY6WvVXK
         JR7goQznU0ZCgcb5uK+E4ad27u+5QaX2gn5dJWrNmVJeSsxlEWPAwzb1SEUFK8pu80AY
         UjQO9lhryEdJdcl/HHE+LaRXmNx/E5wvU3AAhBDn9I+OrBzm/rSd9yq/7s6zk/Gna3dC
         LJUya0IDiGOWWxUFgKP9gNE+TISupmkZU+KhQ6mn4JW+rQH1F15/QuWaXkk3bBjvJLPh
         fN5g==
X-Gm-Message-State: AOJu0YwCFpayqXn18p0NE4JO+l0fEkgpGU6DjKzYTZ0BnpUxXZcODHgl
	dacz9cwCD9p/mnraB+RWfIgPXTmGo7DdMdQl2t+0obqw+mNv97bwEm8eMOhc2rh24yS0xL5TKth
	SC2WdeBscf/V+0PPX9dLiATKIP5vF
X-Received: by 2002:a17:902:d2cb:b0:1cf:de3e:e4c9 with SMTP id n11-20020a170902d2cb00b001cfde3ee4c9mr23769887plc.29.1701402442607;
        Thu, 30 Nov 2023 19:47:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFc/FRI9UHJwfBJxYeFRAhPaME7NIPXUpzMmMZaQsrSUZaHXjj5IgT1PfH3h0ARxutVZDmxg==
X-Received: by 2002:a17:902:d2cb:b0:1cf:de3e:e4c9 with SMTP id n11-20020a170902d2cb00b001cfde3ee4c9mr23769867plc.29.1701402442296;
        Thu, 30 Nov 2023 19:47:22 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e74500b001cfc1a593f7sm2185691plf.217.2023.11.30.19.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 19:47:21 -0800 (PST)
Message-ID: <8c3ca6c7-fa5f-4f45-b36d-1c7d9d94c918@redhat.com>
Date: Fri, 1 Dec 2023 14:47:11 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] drivers: base: Implement weak arch_unregister_cpu()
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3H-00CszC-2n@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r5R3H-00CszC-2n@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_194728_971257_AE3E62DB 
X-CRM114-Status: GOOD (  13.54  )
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

On 11/22/23 00:44, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Add arch_unregister_cpu() to allow the ACPI machinery to call
> unregister_cpu(). This is enough for arm64, riscv and loongarch, but
> needs to be overridden by x86 and ia64 who need to do more work.
> 
> CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> An open question remains from the RFC v2 posting: should we provide a
> __weak stub for !HOTPLUG_CPU as well, since in later patches ACPI may
> reference this if the compiler doesn't optimise as we expect?
> 
> Changes since v1:
>   * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
> Changes since RFC v2:
>   * Move earlier in the series
> ---
>   drivers/base/cpu.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
