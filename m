Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D37C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 09:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3B2610EA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 09:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F3B2610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxcjTZWCN1c8g+Ic48KQ1tFELHZn5yhSSws1EGYLRYU=; b=4EHzxYd8TmInsC
	yD7WPYz5cDsZqb7GPD+2KVxnOETGSGp4vgQxK8C6nOjQ/giVLwttkr9B8OPGpzmy5pBDYTetVbCRs
	DI5cu7Zc+P+qS1WFzW7OvgnBXHqAlR8AhiDV4Wrwl+b9xnkcEp4OO+huq72jsriZRqO+w/K6cK7ev
	6odLg6OqSQCtpoEy8MWsBBOBolwMnQt5pc4oY2aW36CyEB4ljptQ/r7LgupgATTh2jb+uf09+dg6g
	jpyo6vFinb/H3Gf7B88OaLUe/OdSyQybSBcXnm0s4y3N/ftdkZuWnXLdMsvDpG+LGg1EuzcVo91QT
	eFRtK7tMJGu1c4TuE2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdrFS-00ASXz-Ss; Fri, 22 Oct 2021 09:54:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdrFQ-00ASWg-Fa
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 09:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634896439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Svcww2HXJ5Z90IHHct3Hd2SAA6KMakvPsfgwCnVHrjU=;
 b=Mw5sgO2cQTPLYt+6g35AUCx2VqnW7SuhlxKOi94W+o0V15rmvN0Pc1CaL1EoCsNBhKZA9Z
 RSf3OsZMvQOcy/83LQ9nlw70WqXEr+5ZlwXi/yRnZrnpG02RlQKVg9q0YKe7RQo5xQPKsX
 p9+6NOs6EGeQ1Ge2L0t1E/Xwxj+hFaU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-WwoLFdKuMgCMCmzFQMibWQ-1; Fri, 22 Oct 2021 05:53:56 -0400
X-MC-Unique: WwoLFdKuMgCMCmzFQMibWQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so3161941edi.12
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 02:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Svcww2HXJ5Z90IHHct3Hd2SAA6KMakvPsfgwCnVHrjU=;
 b=qzuyQv51LeYng6mpZHCE5GKHjgYgH00GFgffGFTu9a0oBx8XWMk1hU3Es/7/NGXOWF
 DfsAaJZB8dDIKWKAyQBs8edEreLlHtEl5fo5Xuiv7uZt0HOXakpQ31byG7xMLY67Z58v
 2vhL612EFglKv9V7/+GKPK7+HQIqVFUXiXnuIzEO13dTtbQGb3iNbnBjAEWgzMUu4uOz
 EgHcqLkWscQVAK3uxvZyWnvFHYSH9fTrTki1KfelyC5gWk5rvdOxbqRt8u61yyhuKglu
 QzgucLQRspADgO0RYJJH2tMNcR8SBSYw0JBrcBM6xaiu2mBovwyMqZ7vKFZlkE1met1u
 QoLg==
X-Gm-Message-State: AOAM533CnjHw9XU0tA4BLUewfYeUP+jZPqvMH3vCuY5O5IJyq5hG2pjL
 AKDkhLwae8oESE3o//oZxYr8uHkX7RK4ZSfXoxQMHVXPaPIYQgYXizXHng2KHeghmaZtNf9U0To
 VcL4cP4k17eafrxzpm6jPAKOvKd8M
X-Received: by 2002:a17:906:a986:: with SMTP id
 jr6mr13981289ejb.520.1634896434995; 
 Fri, 22 Oct 2021 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWgET1HDP+lFcbcexfVgy0T8C2XgMQaHEGdNmRe5CZHTYPQrrA5lyEdy0UpR2CcqHWmfbDAg==
X-Received: by 2002:a17:906:a986:: with SMTP id
 jr6mr13981259ejb.520.1634896434764; 
 Fri, 22 Oct 2021 02:53:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x3sm2155892edd.67.2021.10.22.02.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 02:53:54 -0700 (PDT)
Message-ID: <5c27a2ff-b7a2-99d8-bdc4-7f2b20092500@redhat.com>
Date: Fri, 22 Oct 2021 11:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] riscv: do not select non-existing config ANON_INODES
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211022061514.25946-1-lukas.bulwahn@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211022061514.25946-1-lukas.bulwahn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_025400_614258_4AD8DEFE 
X-CRM114-Status: GOOD (  13.31  )
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

On 22/10/21 08:15, Lukas Bulwahn wrote:
> Commit 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support") selects
> the config ANON_INODES in config KVM, but the config ANON_INODES is removed
> since commit 5dd50aaeb185 ("Make anon_inodes unconditional") in 2018.
> 
> Hence, ./scripts/checkkconfigsymbols.py warns on non-existing symbols:
> 
>    ANON_INODES
>    Referencing files: arch/riscv/kvm/Kconfig
> 
> Remove selecting the non-existing config ANON_INODES.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>   arch/riscv/kvm/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index a712bb910cda..f5a342fa1b1d 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -22,7 +22,6 @@ config KVM
>   	depends on RISCV_SBI && MMU
>   	select MMU_NOTIFIER
>   	select PREEMPT_NOTIFIERS
> -	select ANON_INODES
>   	select KVM_MMIO
>   	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>   	select HAVE_KVM_VCPU_ASYNC_IOCTL
> 

Queued, thanks.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
