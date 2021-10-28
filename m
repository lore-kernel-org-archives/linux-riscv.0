Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E94FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 14:08:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62B8160C4B
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 14:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62B8160C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9eycz3v1jVGxjml+uNNor7Avx1TaiJyfUI3gNeJmuHk=; b=hB+aSfxRvgM+l6
	N3p0hMI+i7UnX9deuNJcitRZceWAs22lU9M2YZ3EMs+VN1HarYq38g3geZww9aNcBaSYcMi/hkThd
	47sSMVzu29H/3NqCbnD8eJb5VWBFM9qdSIXGNpc9O58+xRYolG1g/0cpwnqRuODC6OKagE6mN7gC0
	hEmFDiyLqWTomiRVpAGLQYVt+wLVHUKLqb63DAofOVH5KENehO8YGdOcxvt6Y/8VeReJhXF+uQdBW
	8n/Oy/tyQLczgbUbFIfi3h9yHc1NndSwJzwwn8iKuRD2iz/2nZaawG+WflYJdxEFOehcSHzYSTAeW
	474MUf+lFtueDgR6AvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg64V-0084Ro-Vd; Thu, 28 Oct 2021 14:08:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg64P-0084Q1-1d
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 14:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635430072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/6u/2V3kbwOw+vCIQ7D9V9KhEUDROrBvfNcLoT9zUQ=;
 b=BMu8EbPMXBS/VroAqSNTvKel/ceTWErQUAdR0+Pt3N0akc0ySIqFRaiFU+LU7FW8t6j8rE
 yocdxDrZmooo9GrtQZtXR/ccJ+zQhnFZDvUBpbgOk/WjOGrEI2jiub0UBZnQFd4Y3bC41g
 nFHjxZimUKbxCJgwcRIOI4oicMtN7xs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-YfO--hgGMAy2_BlZaqMJJg-1; Thu, 28 Oct 2021 10:07:39 -0400
X-MC-Unique: YfO--hgGMAy2_BlZaqMJJg-1
Received: by mail-ed1-f69.google.com with SMTP id
 s18-20020a056402521200b003dd5902f4f3so5672880edd.23
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 07:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w/6u/2V3kbwOw+vCIQ7D9V9KhEUDROrBvfNcLoT9zUQ=;
 b=fGWAFKc8qm8F+jOSyox8GuCYQ1snzdv6PFHi2JGue4CXP0S5dwP4XFUyEnhxebK1c/
 cZwCOJ0cDt2umlPGj35cC8YSEplpff6oj/GdotZuBaTjh0Q2m75M6yO5BElkYe2icrIc
 pRtcRVlVwHVT0WEGnBWPFKYj2vLaSPzgQtH8zu/8kKAc7k7xsMAlFt8fbiTKd/FPCE6+
 57cKU4Dl+1qZyu7HbCQGB2lHjzH33x86kB75X+3X7kCPilXVqNEsX7oiMtV/8APbsXVY
 3ld9StJP6+EJ8Qdrqu5ZZZcv66pETlYibzhjLcxft2Z/ta3a5Fe/c1BfbwyoohTpTsNP
 TGTA==
X-Gm-Message-State: AOAM532Ij0kpBItS+vidpR2tM2SaIVgqa26rs/lXMp4AAXYf+U5snKXI
 0mvBh3gcWv+k74wsMve0Zb3HDZuPuXuhPsSqxnWTiiiNmzZUifFCN8yFnWj5ZWxUUNb9WFmz+AW
 JzAXi4as2Zo8tjxZgjPhQJxGhv+a9
X-Received: by 2002:a17:906:7b42:: with SMTP id
 n2mr5716168ejo.428.1635430058053; 
 Thu, 28 Oct 2021 07:07:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5XiquuYAH7SkWh2/xFy/qGlGMMv5yBFfuta79BJff+F3uPv7LPQF5rW36lriFN8dBTGu76g==
X-Received: by 2002:a17:906:7b42:: with SMTP id
 n2mr5716144ejo.428.1635430057860; 
 Thu, 28 Oct 2021 07:07:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gt36sm1448349ejc.13.2021.10.28.07.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 07:07:37 -0700 (PDT)
Message-ID: <62fe1c8e-abe0-5de9-5c00-3549faae1dba@redhat.com>
Date: Thu, 28 Oct 2021 16:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/3] RISC-V: KVM: Few assorted changes
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211026170136.2147619-1-anup.patel@wdc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211026170136.2147619-1-anup.patel@wdc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_070753_183435_5A8EC2F1 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 26/10/21 19:01, Anup Patel wrote:
> I had a few assorted KVM RISC-V changes which I wanted to sent after
> KVM RISC-V was merged hence this series.
> 
> These patches can also be found in riscv_kvm_assorted_v1 branch at:
> https://github.com/avpatel/linux.git
> 
> Anup Patel (3):
>    RISC-V: Enable KVM in RV64 and RV32 defconfigs as a module
>    RISC-V: KVM: Factor-out FP virtualization into separate sources
>    RISC-V: KVM: Fix GPA passed to __kvm_riscv_hfence_gvma_xyz() functions
> 
>   arch/riscv/configs/defconfig         |  15 ++-
>   arch/riscv/configs/rv32_defconfig    |   8 +-
>   arch/riscv/include/asm/kvm_host.h    |  10 +-
>   arch/riscv/include/asm/kvm_vcpu_fp.h |  59 +++++++++
>   arch/riscv/kvm/Makefile              |   1 +
>   arch/riscv/kvm/tlb.S                 |   4 +-
>   arch/riscv/kvm/vcpu.c                | 172 ---------------------------
>   arch/riscv/kvm/vcpu_fp.c             | 167 ++++++++++++++++++++++++++
>   8 files changed, 244 insertions(+), 192 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kvm_vcpu_fp.h
>   create mode 100644 arch/riscv/kvm/vcpu_fp.c
> 

Queued 2+3, thanks.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
