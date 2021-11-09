Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD888C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:44:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98FEF61104
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98FEF61104
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQtvTDbS/JKvecvaodFAFsLb5ud2GwClxnlt9xIOvVs=; b=r1SkFZ8H8zmfRS
	5EHXcUTSk55NV91bjzCBmGBKQOQFrGDfnLFUxzzLi3kTdULKYSTUTZEQHZWkEThmy47D8JPSEQu9/
	xCkeY6FaeBhbRsycAVbe5gy2phowuHnMc/YPQZaUOCRddGzH53EZ3mcF3OpphiibcUbZmuqapGEla
	tHcQywRmN/SrVzyswSOmUgrkDgabTQQbAZpMOuAQ5TmoJqcZoB2QXUxi3Jyrex3azMUzXeb7buscL
	OM4cqtIGbUoTQWvAIbny9RQm7CpiPTblXSksWF+s4x1n6j1eghBU1fMX8A9ISOpPSrpURPikPR14m
	X63NroqPIxT7YtYl/V9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkGAy-000RZE-LI; Tue, 09 Nov 2021 01:43:52 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFp3-000ITz-Se
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 01:21:16 +0000
Received: by mail-pg1-x532.google.com with SMTP id e65so16849666pgc.5
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 17:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xrX5PIQ5N2CnAG0B54w4TYQMlOw3gRJk552Ipp+ebKw=;
 b=Stz43RdVom5q6hSvN+LnhdAH1B5D0RUDmznyrJp0pQFRjJeWUrzR/udLPaY2tilNCt
 XcgrdLFIIf2+mR8m54M6dT+Dbrc35be5RRM9b9uL9pOdJ4j7hQwoxKcdUZiCi2W8rFeo
 mmXBUYtpY4TQWJozh8/OxpMOOMnVYCLM8GwnYcFgDNGHVKOZqBpYEqqfKv0BxApaEO6w
 QHgCpUm2hA6iGp0NqZEk59gkrY4Hh/+mLGmE93ORS8+YVRoDiSXYWhEz8HkG7mLHejSo
 f65DHHDi9o/I209K1+WG4QDyN4k9mmBRl/VShVuSsU+pG0yGr+qfqYoTiN2J1n0hf0oV
 3pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xrX5PIQ5N2CnAG0B54w4TYQMlOw3gRJk552Ipp+ebKw=;
 b=DAtycpm/VCfit1T5eR87tYlx1ximZDEyrKQXFfDSmfbW9Yj+5nIm4XNnhlu6/xriLT
 hHlLBfM2mG0irVlf580MQ02ZETvXJrEBFFZF0oVQQfrVZdviSBqUwt81GyYei1lTXZLA
 SAyoxbehnD2m6iHsdSnBcfdROtrbg+f+oOKGpUgbJ1q0lSWEcjQFGIs0tQrYBy6fQ7Yw
 DrQtCjTUNVPbjvjq0YfnumieEs3PRGeErk5YVue8NBxk2Xq/PLGSg9fSJzPxXTQHyaK+
 ljOO68RfHXxFFRcp7dIZFceztKLMHrXLhm/7PeSJHF3f1V9ZCbRfKVjAdAT245ygkzbK
 4gYw==
X-Gm-Message-State: AOAM531Pm2S4xJuud7M0U0MtDVP2Jokx44D0CXAGhRgcXJlWOhEiaG+2
 HXZwhi9LJp0M6H3m/Yhg8dJi3w==
X-Google-Smtp-Source: ABdhPJzT4cwDWE/OiPQTr+XYp5T2lNnL8iaG9fSc3ur50OFq8TyJ/z2y4+XiWK6EYq8MqHpQV5QIIA==
X-Received: by 2002:a63:8a4a:: with SMTP id y71mr2992478pgd.378.1636420872463; 
 Mon, 08 Nov 2021 17:21:12 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id t13sm11751282pfl.214.2021.11.08.17.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 17:21:11 -0800 (PST)
Date: Tue, 9 Nov 2021 01:21:07 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 00/30] KVM: Scalable memslots implementation
Message-ID: <YYnNA5lZNXXdX/ig@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <cb4f5d6e-9535-dd57-d8ee-3b593a81f3a6@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb4f5d6e-9535-dd57-d8ee-3b593a81f3a6@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_172113_984879_3FFE6474 
X-CRM114-Status: GOOD (  10.42  )
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

On Tue, Nov 09, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> By the way, do you want your patches and my non-invasive patches (patches
> below number 23) merged without waiting for the rest of the series to be
> fully ready?
> 
> This way there is less risk of conflicting changes to KVM being merged
> in meantime while we are still discussing the remaining patches.
> Or worse - changes that don't conflict but subtly break some assumptions
> that the code relies on.
> 
> For this reason I am strongly for merging them independently from the
> more invasive parts.

Merging them as soon as they're ready would also be my preference.  That said,
I'm hoping we can get the entire implemenation queued up for 5.17 sooner than
later.  I'll do my best to respond quickly to try and make that happen.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
