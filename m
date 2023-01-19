Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6A9C6379F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MuMxMA5FrE0PZz8gB8q1KaHr82u9l+qnkUM8wmdS04=; b=B0UObFbAspqX58
	JRh/kaKPi7xIcYUm6DHnucnj1IdZLxbK/ywx3vigoEvoariHW1MpJ6neQ/itAsgpma06+JTKxgs1h
	a6NsuCYirUeiISUzjI5yXogbN6MGCNXyiVH2hoRGpVSR3aPF55gY82ZhDtGlcchcI56QzRUTR4TR7
	Y1JQRSJHZRXsbyT+dDVoFSoUDit17gif827Mbe2aU40dzpyh8plYscb3tVckfCB40RoKjhGPbkXGt
	sATvMbOocLrJj+kasge2NAgbuSgKyQtZv65Co66s87nlyBEBNPiHjLD6Zv6Geq5vdxbgbEg1yn0yw
	HDPSGvE0QTILHN4KRYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZU7-006VvH-5E; Thu, 19 Jan 2023 18:17:59 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZTv-006Vrp-E2
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 18:17:49 +0000
Received: by mail-pg1-x531.google.com with SMTP id 141so2231243pgc.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 10:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T97gz6Bdfm+yNe+YRAHaCA8lPMcmr0KKDU8hjh4V/OY=;
        b=S62eIbGCR48HzJ0dxRt+FcY1H+wMEDIgps64urcsiB/Xc9UNElGPfDG3M7k3dXhjgf
         IC5/b7TPA5WN8B2zCt5l4+xmMaFP9NYLJK/lZmuCXs/8t+pmpeQvndT/TDDBr+7AJom4
         4pkvYO9rfSviaNIp2nYLbIFOYwSHuwxcCYcbKuCg3UatPoX1KOHQvANMvhPeXSzraKoZ
         wJ7ujoqoxRw++cokwdmUjITxy2xnHEMqWV+aLlcTduAxpgrCgUVkdbhB/vJmoBfElJ/7
         HKH7b5gqivDXkVuH5iLHJd1+y95HqWRJUApg9Cqz/NX8HJl04xAO3dA1YVhbAm6S3N6x
         ybFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T97gz6Bdfm+yNe+YRAHaCA8lPMcmr0KKDU8hjh4V/OY=;
        b=4qkvvQ73eYzQBHsGNHYtjrxAqwFYaaJnrvmGT8cNVuEW5thwyJ41ou2kEKuD49XQQU
         iDkAITh/s8cx0htJLsmosElSaKJ/yvQCiY++vx/lOtJHM0B5rlrC18oheks7vdQ81S85
         lG1y0u4F1GsuH3W1zI+NAoqX/cXvG7+xbcDOklyGq10CCq7T/QMB7x9kGG5O52WjE5Mx
         t71ve5vl/V6+88ISMntNAwkpFAsSqAh+/aJIsnWEBTez3n34yoRHf+0Wg8OJ7SQ8hH3M
         oxMoy3Oob2+LImKdDK3i4s7pUJx8QiDm/52OaHflJQtMCS0KT27+FNRGMWEj9QcHyKWJ
         FhAA==
X-Gm-Message-State: AFqh2kp1ouDNK9CVJaUWKbWdCyfn37WZMnvsF5gDkPQlrIByL1f4yaZq
	aWwPI4yyHNX0+a/UyEcst4DbDg==
X-Google-Smtp-Source: AMrXdXvE6V2XSH75DoWttX7FazNC7q5yK1/5LBnbOsot2oHEv4jYnuIT3ADTTrFdNA17lYqBgz1nVA==
X-Received: by 2002:a05:6a00:a87:b0:582:13b5:d735 with SMTP id b7-20020a056a000a8700b0058213b5d735mr3493507pfl.0.1674152261141;
        Thu, 19 Jan 2023 10:17:41 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id f127-20020a623885000000b00588cb819473sm19996079pfa.39.2023.01.19.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 10:17:40 -0800 (PST)
Date: Thu, 19 Jan 2023 18:17:36 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [PATCH 4/7] KVM: x86/mmu: Rename
 kvm_flush_remote_tlbs_with_address()
Message-ID: <Y8mJQH4VqC76sX7k@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com>
 <20230119173559.2517103-5-dmatlack@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230119173559.2517103-5-dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_101747_536716_7E0D3CC0 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 19, 2023, David Matlack wrote:
> Rename kvm_flush_remote_tlbs_with_address() to
> kvm_flush_remote_tlbs_range(). This name is shorter, which reduces the
> number of callsites that need to be broken up across multiple lines, and
> more readable since it conveys a range of memory is being flushed rather
> than a single address.

FYI, this conflicts with Hou's series, which I'm in the process of queueing for
v6.3.

https://lore.kernel.org/all/cover.1665214747.git.houwenlong.hwl@antgroup.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
