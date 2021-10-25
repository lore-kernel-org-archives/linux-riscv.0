Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD974C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 13:48:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C6056058D
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 13:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C6056058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiwOGjvATe7srF79NQCZLHjuv0peD7LkMaDZMM8k1kQ=; b=GJsohQ7pjWscM7
	nlSTsNsMSFUBCjmB9RlQDmib2Nk7gNYQBHcIcMim7hgnM4bhdDE/Pv7xZJC5Aoo0qCGJMhZxE4SsF
	KOfcdYi3d+yWVI4jS4z11Mlblg5MjYFleJQZj3nmOQ9uQWXhTdS2lUtLORbS5dpFe96WIfI/0/swp
	B8hgJdPeNpwyWSbjcuIOV1GF3B67SdCmGLbB+oyaDxW0YShi0OSjOMSgL1lqpMjvSmuo59ds24TvT
	UhbTL84yYsoozJ9NQywImtE1OB6TSL2cnvOcmYru7f3drfBAGxDZOgCy/1U5V7YPJg7WrfuU16pCW
	CB8CeQ3bQzb8CDwIiZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf0LB-00GaBC-73; Mon, 25 Oct 2021 13:48:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf0Ky-00Ga86-DD
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 13:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635169706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAI1rvJIZVwx71e91km04CwkX5jtmNRsQSKYM+y4LQM=;
 b=RcUN7h3/KVcwB6CG2nyXxa0de24df0g3VfDOZrfqH/ynGLyLyDFmXnYkvZkf3l/Xy192Bw
 RupD1Y+KicOlz2O5kjHiwx3bttaThZ8ePhvcgYr++8Hf/XUpwmyXUFODZ+DX+NCwXtd/Hm
 eQB4dxnagmpWvuZtwsyzT1JmL8TEMXs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-ldtTqyYMP2WzpNoe2TFQpg-1; Mon, 25 Oct 2021 09:48:24 -0400
X-MC-Unique: ldtTqyYMP2WzpNoe2TFQpg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z17-20020a7bc7d1000000b0032cafafaf79so4893wmk.5
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 06:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rAI1rvJIZVwx71e91km04CwkX5jtmNRsQSKYM+y4LQM=;
 b=FFZNtOesmD9yZDDqyW8DAQYIfGSgoHecbk3eQb89hJm0FaG2asquD0yfbXg+j+iaje
 yBkxYHC4tWPPQru2G/4xwaXGW+J36fZtGm+dXwgMC582UjOT6qUlp9X6hieFodULPi8A
 nCv4uUExI/PN7TbLzBWE0Q9YbQeKzBWoVG45cc0YZIM1jotbJKBVHO6k4dXCSxElV7cF
 9J6YOsYnmoov0dUsSqW+d95awrCuTAGlN2CjmZ2E/NBmPHEV01e+d2elCQl/i8/nSyQH
 wAnMJyqhqvn4AOmf5Rggsc92PI7N0jTJh8lWQYLaWsXSqZfVW0lgsvEjnnWbEdo2CA0m
 ZAgQ==
X-Gm-Message-State: AOAM531MQRc4nYkNBEvy7NBkFS10yUP3rjoTcF3mSD010TvdQu/fVei1
 YfbBpwC1emSQuqy2bUomDAFKJSc+u5SgGoI3l0bQzN52B4rgGOtFRwI3Ia/LTMq/ALmLpbclzAJ
 3NOLlWp+2Rt9aX6aYAwvCS4xYRB+g
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr24355619wrd.264.1635169703585; 
 Mon, 25 Oct 2021 06:48:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvh4UiZag1iqCL0Yxmhmh7ghHaPzeCY1G7nZe+NYuublJxNb7HJYi3GJafbpt4P4VqHirR5w==
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr24355558wrd.264.1635169703285; 
 Mon, 25 Oct 2021 06:48:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m12sm3661638wrq.69.2021.10.25.06.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 06:48:22 -0700 (PDT)
Message-ID: <1537b693-80ee-4f9e-2c4e-6e1c62ccca92@redhat.com>
Date: Mon, 25 Oct 2021 15:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 20/43] KVM: VMX: Skip Posted Interrupt updates if APICv
 is hard disabled
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-21-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-21-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_064828_559565_BF084843 
X-CRM114-Status: UNSURE (   6.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/10/21 04:12, Sean Christopherson wrote:
> +	/* Nothing to do if PI.SN==0 and the vCPU isn't being migrated. */
>   	if (!pi_test_sn(pi_desc) && vcpu->cpu == cpu)
>   		return;

This does not quite say "why", so:

         /* Nothing to do if PI.SN and PI.NDST both have the desired value. */

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
