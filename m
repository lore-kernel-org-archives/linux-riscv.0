Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C284CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:29:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C95460EE5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 06:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C95460EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYTwAfjQ5P1XmqaAp6z3RmzpFpvJvmzBY4EVNIChNZk=; b=gvw3x0/ZhsU1S+Qw/L3jArRpm7
	8xtrddAjMKJh1tn08z6kGTG6D3KEY25C3DHKiqFU5WXTfRcqGyQBMElUljYUrEEHo9vFeEsBRD823
	yAZTqqRuOOAgrn1L3bz+ok8zYOXM7furnOUiQBLJcXinxiie0QbPGyl6kSmwU090p91R92hDhKB/b
	naeC++vZQavWcfgAsNCBN13xeqluMm27nD7Uw8j3sHp56BI1ZWN/jzn4q/XNPmbJfBl7F31tmusTM
	9pui3KDarJDQrn9sqBrgHJBVNJ7j4zpouxYUC7cc38NF/bdJXMCyNUsr/ZyqSANP4zezZU7gm44mC
	qQFOJ8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSvkq-00736t-Fj; Wed, 22 Sep 2021 06:29:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSvkb-00732O-2u
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 06:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632292139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJ7mY3KGJnt0GGObf9665ZCn7DQvGIxKlz9Hgzfe7VE=;
 b=VphQDZrWgRkSUxYbkIRDJ0JXqa2y5hC8WCe6/aFxI7TfyoGqzt2sVbPMKyHzaGAKYXi41M
 Il9flX7m1T7O/fvFIjs14x2V/mNCoo8ftL0bPqVSrX6fbdhWApDj3ridN9sl4rry9hM5oZ
 ZaqBtWnw/jnwZGQPLpHTIx7crPx+jQc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Av3iFoVsPEW3f0RXUyWIvA-1; Wed, 22 Sep 2021 02:28:58 -0400
X-MC-Unique: Av3iFoVsPEW3f0RXUyWIvA-1
Received: by mail-wr1-f72.google.com with SMTP id
 u10-20020adfae4a000000b0016022cb0d2bso1114647wrd.19
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 23:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pJ7mY3KGJnt0GGObf9665ZCn7DQvGIxKlz9Hgzfe7VE=;
 b=MvsUeVHriI8cW8T1p0NkSB3jNXcnOiFU/XKIJTWEwLplQHgHi2HMxsFmLykxSDYLxl
 O8ml4NMlJacirIMWK2jzgwEb4uNMThx2kcieZv19mV/2NKN9/t2hilcMvUM5+Rv0gx+p
 oE6gNyhtFqDbAHNFE2TAmKpKtruWfVg+eOQSTsQYWoCvqVnTaQwYdOGMBJLYOwDj6G8p
 L3nhOa7bPviyc9RgScRjuuxRUjCHpKSCBO+K/NIeQJ1qnL0Pz6GUR0XdvnIyIDPYWglr
 GhdPZCDOdUpbHKUr40249zfhZZJlGriIH/1qGS3B3TJiBN+gJ30Ptb8ng857KgnfDGOi
 fRJg==
X-Gm-Message-State: AOAM531Y1lvHhH0a+h4HmbGkIqHggu0G3orOfPzEVjA98G0kNcqK2Yjy
 KpIlHl6d4HJPZIXqmpSDc9f8l2YC+gn6lIcN/0TdmvfxfT7iNGidzHJ2KhtYO6SvX8nc/KAKeA+
 FL8xOUwtHyMlEVl4/FJi0WhzSdXXc
X-Received: by 2002:a05:600c:3ba4:: with SMTP id
 n36mr8722446wms.35.1632292137447; 
 Tue, 21 Sep 2021 23:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGUh0clwu4unN1cIXXPNEQKf8qlYc4JIONnRibnq73sMmW8cPrqysrS+MXk+0qjWI0DZnAvw==
X-Received: by 2002:a05:600c:3ba4:: with SMTP id
 n36mr8722395wms.35.1632292137204; 
 Tue, 21 Sep 2021 23:28:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i18sm1136021wrn.64.2021.09.21.23.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:28:56 -0700 (PDT)
Subject: Re: [PATCH v3 06/16] perf/core: Rework guest callbacks to prepare for
 static_call support
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-7-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6636ab49-e21c-601f-9d2c-34e681c14faa@redhat.com>
Date: Wed, 22 Sep 2021 08:28:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-7-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_232901_290340_FFDE7B6E 
X-CRM114-Status: GOOD (  10.40  )
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

On 22/09/21 02:05, Sean Christopherson wrote:
> To prepare for using static_calls to optimize perf's guest callbacks,
> replace ->is_in_guest and ->is_user_mode with a new multiplexed hook
> ->state, tweak ->handle_intel_pt_intr to play nice with being called when
> there is no active guest, and drop "guest" from ->is_in_guest.

... from ->get_guest_ip.  Code-wise,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
