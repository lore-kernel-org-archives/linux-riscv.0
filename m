Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05124C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOe35rqcSZLa7ytkm1p+qd2EEYsFZfuxkl88Ea2bIT4=; b=RnDEGl9kpC+egX
	TvgePNfNOtt6w2HSvOG0oYNB/8k5xqHe9AX0jSfmPA1ecuJPlqtf/XyK/7LYNle1dnRTvWXUVzZAQ
	OzZC0JtsOifaoczdQT78caJIyP591mID39F0/Mvaz/ebX5du0ZcMTq1NJDLd7tQr3hR/idC2WN+J0
	nlPqysTIHskElYqIpyBT75qQrsaKrqMqlXSf7aJgHcqK8As72SyApo++St5TUJACfNyHzeg74rvmp
	tRXdsHUfN2JPSUF4RltOjfth7cEfkHjZfsSeRiJd2esxlNU3w3Q5W0XJsViO3Y5CBrPl2Kf5Hx7F8
	Bgf0dS4BSBUKN3AWMXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9NHM-00E3Hc-OE; Mon, 17 Jan 2022 08:22:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9NHK-00E3Fz-1a
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 08:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642407731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sg8p8AHi3UJdK9z4yX9nhx3FRx/VOIBzKvjT8S0Q3JM=;
 b=VDZe+7bJ5BOAtg2F7y0yTaWLLq1EouD/R40JkIE2ocVflTbfagko55sbIddpL1zzkXjP/d
 Hnk8IghaDUHQzWqrqAVGBAwXIGife460vFqimaEh4Qpj5+mGPGV+oPNotSal6FAeJFLZlA
 ur+KHelQ7D8V9JSTvQtpm+QraU2ydT4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-BvtRagcJNwKlKEFD9OdJPQ-1; Mon, 17 Jan 2022 03:22:10 -0500
X-MC-Unique: BvtRagcJNwKlKEFD9OdJPQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso10521246wme.5
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 00:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sg8p8AHi3UJdK9z4yX9nhx3FRx/VOIBzKvjT8S0Q3JM=;
 b=EgHCgNaYKClLJiiVuo7LpgkcLAIuzuBTASABNE9GnBcvRWQb6a3XN0jPnOQ4d77F1x
 JJqmAsqELFqvvbhRhBztflNHBMv3/YFnawHMM7Qh35/bm6llV8vG9euRuq7hERqotClH
 e2QwiF0TuUwrusLkaSZtJnNDy86DrBdpfBo/rhX8EtujRfX/3hxOnkuK6zXnQJFQPtjL
 9Zw+GVd5voDHvWrGJulFFU9XJoxN5snmeUIMpC9GY0vjqSb30Ebr85ua1y5Z2Xn2MaAj
 cy068aIBiWbzxT/HrFlhVy5DIkv0soLj7CW1iriS47yPawWoSPYiYq3HUQ8Qo1vjvj2h
 t5Mg==
X-Gm-Message-State: AOAM531ZP9e7LQhxZDL14MChKnZmedfZwEiTdNhF/iaTWWq/Ppb1oZzv
 ZOnw9cszM/rtK57h8+GZWPqDQQ0jfv+0ZJpRcMnisZ/pHi+5CUe18ODP1Y7isP6lX838Q5YjgUa
 ABUFORQjCJaaeu36ij4+cEycmD5CJ
X-Received: by 2002:adf:e78e:: with SMTP id n14mr18512281wrm.631.1642407729386; 
 Mon, 17 Jan 2022 00:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfX6DyGdjNVfeccUpaF9Hfqtqa45OuD18xrFo42Uf+iDexJ9TwGxZgQm8IYyKvOJYF6w6HHw==
X-Received: by 2002:adf:e78e:: with SMTP id n14mr18512267wrm.631.1642407729203; 
 Mon, 17 Jan 2022 00:22:09 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id u1sm7671679wrs.97.2022.01.17.00.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:22:08 -0800 (PST)
Message-ID: <b8c2663b-69df-913f-8da1-de6b7bd189ce@redhat.com>
Date: Mon, 17 Jan 2022 09:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: linux-next: manual merge of the kvm tree with the risc-v tree
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Walmsley <paul@pwsan.com>,
 KVM <kvm@vger.kernel.org>, Atish Patra <atishp@atishpatra.org>,
 Atish Patra <atishp@rivosinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20220112114024.7be8aac6@canb.auug.org.au>
 <20220117085431.7bef9ebc@canb.auug.org.au>
 <CAAhSdy3gEW+SC1GCH0V4iVA9h1sxeVV-V=x4kG7w_9tcVTtamw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy3gEW+SC1GCH0V4iVA9h1sxeVV-V=x4kG7w_9tcVTtamw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_002214_212545_F1C88FAD 
X-CRM114-Status: GOOD (  14.74  )
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

On 1/17/22 05:13, Anup Patel wrote:
> The commit c62a76859723 ("RISC-V: KVM: Add SBI v0.2 base extension")
> is already merged in Linus' tree.
> 
> Since you are yet to send PR for 5.17, we have two options:
> 1) Rebase your for-next branch upon latest Linus' tree master branch
> 2) Send "RISC-V: Use SBI SRST extension when available" in the
> next batch of changes for 5.17 after 5.17-rc1
> 
> Let me know if you want me to rebase and send v8 patch of
> "RISC-V: Use SBI SRST extension when available"
> 
> In future, we should coordinate and use a shared tag for such
> conflicting changes.

Palmer should just send it to Linus and note "enum sbi_ext_id has a 
trivial conflict" in the pull request message.

We'll sort it out better in the future, but it's such a minor conflict 
that it is not even a nuisance.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
