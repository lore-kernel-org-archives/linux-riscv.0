Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8013C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 16:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AF3603E9
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 16:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66AF3603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NhZNkWHURpWJC0ThsGf01GAZprZiN+uGXuUO893onQ=; b=DRcS+VkosAbyZ3
	1LZ9fSA+Iq2BwAflyh6rBmPyFcanyjNCYBWVYZaIhTnZUBfhgbdi+YvcH9qXRdaBryp0xKLtPj5g/
	wFZ/4p9ttq4FywPAf6mk9cN1pYzt3iEI+BdJXL7UXjZUQ5tIbeX9LiKRPKFM4uTkyM6DZ5JHjoDOo
	+QFUzx+1M8D5jsJKdxpyFfybNqG6b6sG5vpyUPBkchT5d5wyOJBRTxjpuJ81rX1cnryuaq96ENuVR
	3aGQzAsJEDw0swXFpkF2h24MxVq5FOMj0kQxmBarsvBejaWERNwBVDdSRJkhOJRc/MJgn+orYkSCF
	nvoC4h79/QCa3yJdqWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfPAQ-002RK5-3r; Tue, 26 Oct 2021 16:19:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfP3o-002NME-3k
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 16:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635264741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/8qPSuga2nSdD4ObnPRjMzoPwBrPBTCysCx0s1aic4=;
 b=HXeh27CV8hJRaETDK6hQOpnP45k3CVN3SmEZGClNq7UYeHDti1sMQE40Q9KP2PP6tyaQ2I
 orJVQXxUk8U1XN2n6u+a3epp9C/dCkhT5MuzOp8x/Js6W5Za41+LrdIs+yGwZJjYq0362v
 79f1/BmEa6EFyJMmnSf2RTCKnOJQnls=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-_fBb2WnbN7GEthQvB_BA4Q-1; Tue, 26 Oct 2021 12:12:20 -0400
X-MC-Unique: _fBb2WnbN7GEthQvB_BA4Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 t1-20020a056402524100b003dd9a419eb5so1792951edd.4
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 09:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y/8qPSuga2nSdD4ObnPRjMzoPwBrPBTCysCx0s1aic4=;
 b=BnaNgMfBDULBN9okKooEHdNTGjiYumQPiz0wW3sCbbEYN77xz2iPABNdEL84PUT9IC
 q4LuCjS/9QJQANARSu0PohYiRv39YDlYiRGFpmQsuMlg7nNRRJ7em6MD2kIQsKMB4Egw
 TqQMxWh6xj6IfwxUsO1sEGWJ7zYtF0QYHMfjAGXwfyd6CCA63aGf6luL9dX17AIrGmOm
 nvsjjS4GCQS9gf8ESHdcjczrvqGd4mSfCzfGWCF9VCeJc8yk+KOi0CAGB8HJFt354W+S
 x0elR3d8BP6OSht6kWV3kkXZyla9+zn/HLn/18QZ8hmBCSv4RjplO7/F6vja16sU9CAQ
 u7UA==
X-Gm-Message-State: AOAM533MIufC7Sk3YKWJ6g29k0wt2Jys1SaHYlotT8Vh+9dgIL5kqA/K
 u6i1ESwDV2dkQbU0BhCNPAdyweY4NfndG9RybMV0LUKGbpy9hKqqHSnlN8nzlvqVrQjZioHQawO
 fzdSdcULCT8o32pdGCSuftNjwDm+8
X-Received: by 2002:aa7:da84:: with SMTP id q4mr36991781eds.371.1635264738791; 
 Tue, 26 Oct 2021 09:12:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwASeQAxYa4SVxx7fzZJcK2OTnFNOTNNHLf+PErJyPRemx/Rf7LwxYWqAfn33dB1Qf24eGGDw==
X-Received: by 2002:aa7:da84:: with SMTP id q4mr36991714eds.371.1635264738510; 
 Tue, 26 Oct 2021 09:12:18 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n1sm4753815edf.45.2021.10.26.09.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 09:12:17 -0700 (PDT)
Message-ID: <be1cf8c7-ed87-b8eb-1bca-0a6c7505d7f8@redhat.com>
Date: Tue, 26 Oct 2021 18:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out
 arch callback hook
To: Marc Zyngier <maz@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Huacai Chen <chenhuacai@kernel.org>,
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
 <20211009021236.4122790-11-seanjc@google.com>
 <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
 <875ytjbxpq.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <875ytjbxpq.wl-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_091224_272753_F1820C75 
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

On 26/10/21 17:41, Marc Zyngier wrote:
>> This needs a word on why kvm_psci_vcpu_suspend does not need the
>> hooks.  Or it needs to be changed to also use kvm_vcpu_wfi in the PSCI
>> code, I don't know.
>>
>> Marc, can you review and/or advise?
> I was looking at that over the weekend, and that's a pre-existing
> bug. I would have addressed it independently, but it looks like you
> already have queued the patch.

I have "queued" it, but that's just my queue - it's not on kernel.org 
and it's not going to be in 5.16, at least not in the first batch.

There's plenty of time for me to rebase on top of a fix, if you want to 
send the fix through your kvm-arm pull request.  Just Cc me so that I 
understand what's going on.

Thanks,

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
