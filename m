Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C8EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 15:05:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04A260D43
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 15:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B04A260D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXlc8ewUUEsfEVy8c8QJ8Z32QKHSWPqsx/nBrq/Ovpk=; b=S/1eQG8EyjQG7d
	aScLAFLfoFVupzvs+DwC5LNDb94OkOG+7M88SkHxPq+N9kFX2piSY5PHB5FOYW90TNInWL+2DTqmH
	IsMdkFTf7qUgRs8Y0uguaiqiA8ed76ISclRDRGMTvBvhC1X2HCkGygMsmmQcvGATfdwRcfoz6sLSl
	zFY7c2awyLYSp5AXKol1PDkBT/ajGyI6D0tGx25tSDirDIfxlyPbyIpqak1DbYOSnu45w4Q5sbmbL
	kTBeA6kPcn5xahCZD+imkVrULAUHc1mj4PMDp5u/3ztJtlCeCelYi/hQFdeBKuJ1S/JAt5UQbP3pr
	PzHfwGgirq/sH1X5biVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf1XX-00GqHr-6G; Mon, 25 Oct 2021 15:05:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf1XU-00GqGX-0l
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 15:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635174326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17YKkfI8G+c9Iih6iy4QvMoudnAtBOzRU5Sn0sW8tZE=;
 b=aUowJOSEezruPAV5aYjmQ+lYK4PnUPZm2rdY0GZqKxlRyLjdAP8jYom4/YgWe9sjL8zZ+v
 L3KR9DA0JY8x+SfbqhPtmpp/557AsSNAybKVKckopLoiKnXSjsfAyqGfRwkyfSg/iN8ynJ
 R8xOs0MQVRjRt5Mnl0wbHjoPgnBwGg8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-hHT1j1Y1NVqHoY0KTLdDfQ-1; Mon, 25 Oct 2021 11:05:25 -0400
X-MC-Unique: hHT1j1Y1NVqHoY0KTLdDfQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso3328134wrc.2
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 08:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=17YKkfI8G+c9Iih6iy4QvMoudnAtBOzRU5Sn0sW8tZE=;
 b=LGRqReT0g+UDixoaWXaTAfXe3FzFTxF4R7Wke4NXP+10m/K/FuruoG6d+cXMkOi8Q0
 NgSlUaxXiuaSnzZzwDWUfpXgPiUvcx37qGlRKhB17yWirzXEF0NJcPsWgx9dTpKFjry8
 Lxi5vwsH5bQoYBqg4Y+EVRwFIbqeNeqt88hJNrMSWOLJnifpGg6D7pLDmH1yUoZqYf/J
 Ww8gsQxiooXgsm3zzLlXeKyq3woGQupX3Hv0S9YtraTWL9jWE0j0qn4PktxCEId+pJKq
 wjKsx9pmy0+wCWKFeBUUqizs7dNQYmoDQPHxwhEmLPBNCN+/dT/TwWLtDoGYHb8mvHVE
 TG1g==
X-Gm-Message-State: AOAM531bakrMG2KwAh0McQmMmOiK6kdUPIjjB/FUAkB6I0KP1fyy1Ed0
 MSn6XOWcmGaXmNYS+GDeHGk0ouPOwuW6oW6tX7eltDUYZd70rO99kWLJ/LMv2st5G0enO2VUvE2
 5nLcYByfWO1CgZCZc89ZWfwVrcJDg
X-Received: by 2002:adf:b1d7:: with SMTP id r23mr24328038wra.145.1635174324219; 
 Mon, 25 Oct 2021 08:05:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNexQuzHRq+jpnX8KTr0omvqAmOMBdWB1dnxyBAmmWnxN2QzlfyX1PUJV+JR7ASMMz0R8mMg==
X-Received: by 2002:adf:b1d7:: with SMTP id r23mr24327978wra.145.1635174323914; 
 Mon, 25 Oct 2021 08:05:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w10sm9256784wrp.25.2021.10.25.08.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 08:05:23 -0700 (PDT)
Message-ID: <a2a4e076-edb8-2cb5-5cb2-6825a1a4559a@redhat.com>
Date: Mon, 25 Oct 2021 17:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 40/43] KVM: VMX: Wake vCPU when delivering posted IRQ
 even if vCPU == this vCPU
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
 <20211009021236.4122790-41-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-41-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_080528_184999_95A4DE60 
X-CRM114-Status: UNSURE (   6.19  )
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
> 
> Lastly, this aligns the non-nested and nested usage of triggering posted
> interrupts, and will allow for additional cleanups.

It also aligns with SVM a little bit more (especially given patch 35), 
doesn't it?

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
