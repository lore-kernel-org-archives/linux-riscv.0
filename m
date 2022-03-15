Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA4BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 21:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxdyLJAs9feykyaKS+TyO5AudEw3qF+bVT50RYBt8C8=; b=q0sVnRPLL6UGxW
	UXbmm+djfAO1s59iGTFjsI+8iu7PPdeTv8NazfB/K/Mz9K1+9WeBFtel9XLch+k5i9DinuIPY7GHd
	HmxRB1aln56pSdqtCmtaUz6CjtTlj19oEIWl1sEJgHImzXwnte+zXAsKp6NPe8rL8ebRy0TH/WKEn
	ceiL48Mv8bxoItqnD6m7lzX4W2DlY2NpVpwARZYlOCUkS8gHNuporapZ2fKEZC94NKhV+VA+OvJfV
	DSlvcVfEWKYejwZbBjJunupc+4nH29COMcRuwyE+MXd5VLFpeyxs7cQgzBaMNddU2hHVG45w0M8AN
	kzljOXbhY4PE2ez7ZTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUEcE-00AeX1-BF; Tue, 15 Mar 2022 21:22:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUEc1-00AeMh-Hc
 for linux-riscv@lists.infradead.org; Tue, 15 Mar 2022 21:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647379306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXuCGWU9zewjDGKsl7YtKtE7zLqAQ3xKq0SzE1COLFI=;
 b=hhB9nHxLQEwtWL62R+4m6jiOygR4V0/IZUWg88fHyxe+0wCqhT1C1rrpNAHlNd6S9QoLMN
 jI4Lq5jlEF0uBB2iXFgTa74uD1XnC4yB7PbRWiUiG9SogA2TGL5xrBMmUk5z1l7a+B735z
 W7EO4Etv5T3Vu4Xxkm+Yd1PDng04GWI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-NpIaI3KvNq-xnyZZpKpMnQ-1; Tue, 15 Mar 2022 17:21:43 -0400
X-MC-Unique: NpIaI3KvNq-xnyZZpKpMnQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b24-20020a50e798000000b0041631767675so159741edn.23
 for <linux-riscv@lists.infradead.org>; Tue, 15 Mar 2022 14:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NXuCGWU9zewjDGKsl7YtKtE7zLqAQ3xKq0SzE1COLFI=;
 b=5S9BfnFBsY9Tw6upHeyvkay4MnfBQfpV/trPmRdVdmgdIQAfMKSFMuO4cUoM7ZkJF+
 7hCtf67sHzzoHiorqJvYurT4jLfpA7o38WV8EuJlUzY+AGAjiYFy59O190GTg8q4nBye
 hq4vjGR4avMkQ5ZQBXDK2HWlI+63smnFjUWiDV+tNEaMCZhoy05166Wo6Gwts3sF1AVz
 25fRwlZcsSmK0RR5K5+8lhpt9so43o+eqHgcIBLGQjC365o6IGLvHILiB1JDyKl6VbG3
 w4btNkV/W08Fzj1ECV7/gKrsvF8hkuJ2/LrxayaSlVjWASfYsoiWlrA/oXJMUD2kOGi6
 9S0w==
X-Gm-Message-State: AOAM532hQo+fxa6sU2Uihvd0fqcDYsvp0fobMGwZPX8ZaapTbxo+N4v3
 Hk+0H1/rt1SQSrvxxTQ3q0R2oR+bPBBcQho8Nv/DTMV87uSDwgsWkMFsWUigVgeCE7xVG8Grq7v
 RZb+bLN0Trfqf6uo1O7s8wIgbSCLA
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id
 i7-20020a1709064fc700b006da92b2f572mr24103918ejw.184.1647379301826; 
 Tue, 15 Mar 2022 14:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye+k2UJTgNQv/poK+0J3x/pPcB5kz1U3x1hR6oTFFyJZjNE3X2xHxa3ovb3ZV592gAJ2VXfg==
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id
 i7-20020a1709064fc700b006da92b2f572mr24103902ejw.184.1647379301596; 
 Tue, 15 Mar 2022 14:21:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 q15-20020a1709060e4f00b006cdf4535cf2sm77812eji.67.2022.03.15.14.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:21:41 -0700 (PDT)
Message-ID: <47f64c5e-fa36-9e87-763b-4e7385713e76@redhat.com>
Date: Tue, 15 Mar 2022 22:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] KVM/riscv changes for 5.18
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy1cBkGqBLN7iZY-FUx2BFGoXmxd4WZJemPSRKz6my8cZQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy1cBkGqBLN7iZY-FUx2BFGoXmxd4WZJemPSRKz6my8cZQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_142149_693223_C3B37BD2 
X-CRM114-Status: GOOD (  13.66  )
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

On 3/11/22 18:02, Anup Patel wrote:
> Hi Paolo,
> 
> We have three KVM RISC-V changes for 5.18 which are:
> 1) Prevent KVM_COMPAT from being selected
> 2) Refine __kvm_riscv_switch_to() implementation
> 3) RISC-V SBI v0.3 support
> 
> I don't expect any other KVM RISC-V changes for 5.18.
> 
> Please pull.
> 
> Regards,
> Anup
> 
> The following changes since commit 4a204f7895878363ca8211f50ec610408c8c70aa:
> 
>    KVM: SVM: Allow AVIC support on system w/ physical APIC ID > 255
> (2022-03-08 10:59:12 -0500)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.18-1
> 
> for you to fetch changes up to 763c8bed8c05ffcce8cba882e69cd6b03df07019:
> 
>    RISC-V: KVM: Implement SBI HSM suspend call (2022-03-11 19:02:39 +0530)
> 
> ----------------------------------------------------------------
> KVM/riscv changes for 5.18
> 
> - Prevent KVM_COMPAT from being selected
> - Refine __kvm_riscv_switch_to() implementation
> - RISC-V SBI v0.3 support

Pulled, thanks.

Paolo

> 
> ----------------------------------------------------------------
> Anup Patel (6):
>        RISC-V: KVM: Upgrade SBI spec version to v0.3
>        RISC-V: KVM: Add common kvm_riscv_vcpu_sbi_system_reset() function
>        RISC-V: KVM: Implement SBI v0.3 SRST extension
>        RISC-V: Add SBI HSM suspend related defines
>        RISC-V: KVM: Add common kvm_riscv_vcpu_wfi() function
>        RISC-V: KVM: Implement SBI HSM suspend call
> 
> Guo Ren (1):
>        KVM: compat: riscv: Prevent KVM_COMPAT from being selected
> 
> Vincent Chen (1):
>        RISC-V: KVM: Refine __kvm_riscv_switch_to() implementation
> 
> Yang Li (1):
>        RISC-V: KVM: remove unneeded semicolon
> 
>   arch/riscv/include/asm/kvm_host.h     |  1 +
>   arch/riscv/include/asm/kvm_vcpu_sbi.h |  5 ++-
>   arch/riscv/include/asm/sbi.h          | 27 +++++++++++++---
>   arch/riscv/kernel/cpu_ops_sbi.c       |  2 +-
>   arch/riscv/kvm/vcpu_exit.c            | 22 +++++++++----
>   arch/riscv/kvm/vcpu_sbi.c             | 19 +++++++++++
>   arch/riscv/kvm/vcpu_sbi_hsm.c         | 18 +++++++++--
>   arch/riscv/kvm/vcpu_sbi_replace.c     | 44 +++++++++++++++++++++++++
>   arch/riscv/kvm/vcpu_sbi_v01.c         | 20 ++----------
>   arch/riscv/kvm/vcpu_switch.S          | 60 ++++++++++++++++++++---------------
>   virt/kvm/Kconfig                      |  2 +-
>   11 files changed, 161 insertions(+), 59 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
