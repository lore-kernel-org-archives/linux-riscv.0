Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F65C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:36:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B7060FBF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9B7060FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYH7+2RdkfQNlVSzcRHY/AwF6Fqn2oJr/TGEPv/Pqew=; b=CtDdpDUEMPlfoO
	NRKtIRyWQiiWRJGD8Hchxr2wiBH5tt+zELd9fGza2NPrcLLdZFRidCm13L+k7o1JdcG09xajdS2Cc
	ltBruJGtaAIbbELPc8Uo5g5uT+Mqrtgx3+zuyLVJWFs4qiis3ZBQmEb9Hs65PRM984ujJ82x7KrBU
	8NTrCsDFxuCA04HGCgDLGwCXYv53oGIsXKpt1BdYseFLSx3b9VeCu09aiZgwNHXDS+sc/Px+CD0z6
	ILRzkMdkGUwTgK9/HqjtHvLJALqKWQbpXjAz6ZHufxLVjjH+KvIFh6otWDGZmSLTjbEGCRMzSpJ/7
	jG39pVuidqyJZOiQz8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfkyh-005L2d-1a; Wed, 27 Oct 2021 15:36:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfkye-005L1T-AG
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 15:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635348991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5uRyMZIN45jCj2VKDrWR2a9G78BQWuHGJKl7OtHJZ6k=;
 b=e2dR+en+X1RDREBLLt64xZsmtbn2gJbApYWO5LX8Vut55CfpXVAk81mSZdLNxqHu/Ho85b
 ubVa4Dq6esUrtQxHn2He/jDyHvGeNyRITA+GUK+2vIMqB8clziqaw2gtKhvjWKphvPlBXg
 387CZYQIr/IItEkZlX7eLGEgp9R0xts=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-SCxL3jOxOkam23n4aekwrQ-1; Wed, 27 Oct 2021 11:36:30 -0400
X-MC-Unique: SCxL3jOxOkam23n4aekwrQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w7-20020a056402268700b003dd46823a18so2663146edd.18
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 08:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5uRyMZIN45jCj2VKDrWR2a9G78BQWuHGJKl7OtHJZ6k=;
 b=dzLYNdKwpCj693UsnS/aBGL6tyEYojAL8ioipKyJv+qvvR1saCzfaZP3dicH2+KPkm
 Jo1xfUKhVHz8Sc8R1MoqpSv4vUIo4c4W0u+V4ftW9yeEK6n295SECHYmlAnf4RY70VZ4
 qJXiKgW+0p9eo2RdLSDXwVGzyFkIUUST3lLJWfHm4a/XcdtG7drMDR0ehLq/nUU8xXeI
 4spkLDJIv48I/kMQvenS6KyLjKY42ZwXe2nQ6cJcmCIcKB/dKSwKcBSXOmTyCWbzJC06
 D92Cjvkz8R5trbw/0DNbVznh6aB6V3sRuy9urkvtDX+1NOEc0tDy1t2X9P7KHm7uSHu6
 myYA==
X-Gm-Message-State: AOAM530vC92rCc+8hJgzZWGO9k6Kjb4UPJZqgnbS24CjJ2u8GXbqfU1T
 8QKX7j4SVTIuyfZMqWhwc+iprhPHnL3euBzhX+k1f8C091aXUTVvDXAu/7bCUeIuuXHHAsZf6no
 /aPVvjfmRS8pH2silbs+bqI9bJ6Lg
X-Received: by 2002:a17:907:72d4:: with SMTP id
 du20mr27123528ejc.324.1635348988851; 
 Wed, 27 Oct 2021 08:36:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlnTQW53CgmXIn8to0kDTGFp7NuPe5vIqIt10aS0tdUzKBzxmlSrEKcMCaMlb8sNDTKtez8Q==
X-Received: by 2002:a17:907:72d4:: with SMTP id
 du20mr27123484ejc.324.1635348988605; 
 Wed, 27 Oct 2021 08:36:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dx2sm110885ejb.125.2021.10.27.08.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:36:26 -0700 (PDT)
Message-ID: <185502d7-861e-fa5c-b225-419710fe77ed@redhat.com>
Date: Wed, 27 Oct 2021 17:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
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
 <20211009021236.4122790-36-seanjc@google.com>
 <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
 <YXlrEWmBohaDXmqL@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YXlrEWmBohaDXmqL@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_083632_491568_9A295438 
X-CRM114-Status: GOOD (  11.09  )
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

On 27/10/21 17:06, Sean Christopherson wrote:
>> Does this still need to check the "running" flag?  That should be a strict
>> superset of vcpu->mode == IN_GUEST_MODE.
>
> No.  Signalling the doorbell when "running" is set but the vCPU is not in the
> guest is just an expensive nop.  So even if KVM were to rework its handling of
> "running" to set the flag immediately before VMRUN and clear it immediately after,
> keying off IN_GUEST_MODE and not "running" would not be wrong, just sub-optimal.
> 
> I doubt KVM will ever make the "running" flag super precise, because keeping the
> flag set when the vCPU is loaded avoids VM-Exits on other vCPUs due to undelivered
> IPIs.

Right, so should we drop the "if (running)" check in this patch, at the 
same time as it's adding the IN_GUEST_MODE check?

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
