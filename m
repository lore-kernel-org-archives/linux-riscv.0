Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D28DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 15:57:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310FB60EBD
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 15:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 310FB60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ulez+sOAvzHi1OPCZoqr5qANZIbdhw8w735QvSTMR+E=; b=yEZyYmki5JAFXL
	FPa5uPouAzP3DX+jplOMAwf+pT57pvbd00eezgq5VPsdszoMdcPUAyXHeaj5JL2zVlPaKx57IixpU
	SON0bBAOULtoDdusx35RRPXasQrhsUq/Cph0NQr3cA+h3UK6kEr+pABQF3SZyP/nTRZigGfDnG44f
	gJ5MTNrwI4MkHvCK/aJ+gyUf19YSFTtJp2Hx02T21lhcxZiILuzb9MvaDo2qi+tiMaysw0oKgXPd5
	a6jRfP8c9yaXiwWqnL1BOjFnXxbemJIhh/OpGACyLg+KRwhgPrfhlz1j0hxUYhEBx2cTPWDMoRO1y
	yXfjiwSryqso55+1469Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf2M9-00GwVN-69; Mon, 25 Oct 2021 15:57:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf2M6-00GwU6-FV
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 15:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635177465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCI+8dQa/U6UbsL5gbfoLfO4WAaUcQYsMls2gbgANLc=;
 b=d5fBTafVsle7rlJGdQNqsXio/F72LOo2tQDiG5d8pnwkxANT5JCfW5IUfmH6YSz68+2OF2
 lAqa8X9kupvqCKBQnpBdImbNZ51Ze4GOgRx9pIDgn+blDJGJf+IJq2SdetOZO6PUGA7yLL
 C/y2qcIGdg5S5spV4/4PRPahunXd4rs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-LPN-gly-O7i24YpzkyTusA-1; Mon, 25 Oct 2021 11:57:44 -0400
X-MC-Unique: LPN-gly-O7i24YpzkyTusA-1
Received: by mail-wm1-f72.google.com with SMTP id
 f63-20020a1c3842000000b0032a621260deso3666738wma.8
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 08:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MCI+8dQa/U6UbsL5gbfoLfO4WAaUcQYsMls2gbgANLc=;
 b=FbJpkDuUMT3v2JlrGi2i1HZJOHMl1BLFq/fXeuyD13dH1fwYHxF0rPQAFmT/r7kls0
 zlyK7ewUFmtBzzmho2b5M9BDQ/C7K5lFQcOUhfj3dCF7NlW6LhY80AIDNST3pZ0xLo48
 to6Fypb1F6TBxxKU8kdDLBpR4G88JX4RCsszDw6FtxfM8SGA3D5QgpMGNSn6bovK7ygD
 IgUrkpFcRtVaNrzJ5Yrvy+WQ7nNWsZEpLnK1gREfv7cue9hBPkEfRuWB0TEQFRMnDoQ+
 mTrj4LXzLkJkliGd+8WVE0bdQAo+QAEPLFR5BXKe0tYFQKFStbCdc6oo1WcjP/5sSzH/
 0RNg==
X-Gm-Message-State: AOAM530cCvjKEHdDX8TYJQqgKKOuRWk0xfb/ogMS+ddnzgJKwHbjObYv
 aUxKsiH429duXmDzUbvbWb1F32OmuysWSuONM39DNzDpsoeDTb1atobOlJw8Jc/I4xc2wv8CY/d
 4m92aoNDU81BI90U4nOGcMvibVn79
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr20601935wme.3.1635177462565; 
 Mon, 25 Oct 2021 08:57:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTyw0n0fr/6Esub1t61IkuBW8xshfxOi+C+/6mJQnqMkQEum3VdKMAAqawVcu+H74+uWZwJg==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr20601909wme.3.1635177462345; 
 Mon, 25 Oct 2021 08:57:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q18sm19326723wmc.7.2021.10.25.08.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 08:57:41 -0700 (PDT)
Message-ID: <e9509fb0-54f3-ca86-57b7-8b6d5de240b7@redhat.com>
Date: Mon, 25 Oct 2021 17:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 37/43] KVM: SVM: Unconditionally mark AVIC as running
 on vCPU load (with APICv)
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
 <20211009021236.4122790-38-seanjc@google.com>
 <acea3c6d-49f4-ab5e-d9fe-6c6a8a665a46@redhat.com>
 <YXbRyMQgMpHVQa3G@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YXbRyMQgMpHVQa3G@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_085746_682231_04A6BCA9 
X-CRM114-Status: UNSURE (   9.62  )
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

On 25/10/21 17:48, Sean Christopherson wrote:
> On Mon, Oct 25, 2021, Paolo Bonzini wrote:
>> On 09/10/21 04:12, Sean Christopherson wrote:
>>> +	/* TODO: Document why the unblocking path checks for updates. */
>>
>> Is that a riddle or what? :)
> 
> Yes?  I haven't been able to figure out why the unblocking path explicitly
> checks and handles an APICv update.
> 

Challenge accepted.  In the original code, it was because without it 
avic_vcpu_load would do nothing, and nothing would update the IS_RUNNING 
flag.

It shouldn't be necessary anymore since commit df7e4827c549 ("KVM: SVM: 
call avic_vcpu_load/avic_vcpu_put when enabling/disabling AVIC", 
2021-08-20), where svm_refresh_apicv_exec_ctrl takes care of the 
avic_vcpu_load on the next VMRUN.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
