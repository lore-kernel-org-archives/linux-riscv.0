Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595A6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 07:56:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1074260FE7
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 07:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1074260FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddsHN8uGDuL/wn8OQx4oSHxdl8AvFYyBR5HxBEXUXCs=; b=lcX0a+f2fBG2kA
	FRtwTgu8keiOi8Pk3IdgejoN7xgRNCFNb9ttwWffG9v6OZQgbG/Gp+YT3HSYHXox44BGR637fRbru
	kf1ur1MZDLVqKWMSGmi6g4ebqT57ZxeTCxtAmKqDPbkprAoz8bg6RpmfNnlyGW4IVpN12gUP4JGEc
	UxpBljSrVp6X3QcgKKx77aKkLoP5hWN8VgmRmlPYXKjlleXXbQDWFHvKZgz3DR3kgnHbPz+0H8atS
	qzEemiTPF9FGW2dY1r8/iwUeQJMitZ8/iNZyxO0eireQf27MoORujMAE2FGAuU6Zdpe1w/+oLD2YK
	JflTQQQrjHsaXZCw92ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlRPd-009dKV-DH; Fri, 12 Nov 2021 07:55:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlRPR-009dI9-1q
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 07:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636703740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lF7lzRoeZrlEIt3gHEFyVsRoWpbej1ntDFwYNAiQdJI=;
 b=idJU5KzXqQnzThBVK1r8v2xTTYjlvHqFV4WeJikBoUTfau774u9MhOp87uNWVEU5QBN8jy
 dM+kZBY3rRqNAt5Ay4ARUDnHqtcVTozodtUuighFESarf0v3XFx9ScFUyBx0Dquax9+Qm1
 Kevo+XJMoBHrTAgjMUT8TeDMfoepxmE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-6eylRC9sPea5bHbprWhagw-1; Fri, 12 Nov 2021 02:55:38 -0500
X-MC-Unique: 6eylRC9sPea5bHbprWhagw-1
Received: by mail-ed1-f72.google.com with SMTP id
 y12-20020a056402270c00b003e28de6e995so7543855edd.11
 for <linux-riscv@lists.infradead.org>; Thu, 11 Nov 2021 23:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lF7lzRoeZrlEIt3gHEFyVsRoWpbej1ntDFwYNAiQdJI=;
 b=k0yMEfumpHJYoURMJOyWsO91Y/u3djExIvM/RyHUE8yxeSTxmq1ypya2GQnLScgqbg
 OmPw3C8LLBWqmEPhRBufTCjKEP0EJVSCIOYzeJkML6R+I8be76tk1xEdyaGLDtlwUF6j
 6ZKkl34xFAWZEoZxoufWw0OFWk6JgpLPYE3jU4Sn8HcmU49yOejkGZnq1xVoqQQf1cUn
 xFm6nwvpWsfDaSq+/fRHXfDc8FkYgIJh2OG/dHyMhg+GH+OK45hRJv/jGsMJqPz/ArcR
 W85P2/wC6ZJI5ECaaJq43sclXs4gwNva+VkLbtn0lv9fL7zJHL5UmIvNAE6wORX+LJix
 mLLw==
X-Gm-Message-State: AOAM530H92dXCOA53zMM6fXV9N94Hmcvlb/e6MqEoXruuQMkkpchE76N
 dg69/MwpsUJEoqjrKhc5bSYvu6QbUVqru12/ENyRZSmWzrPttqDeTGn+BZfjIhziIpMn+TGQnqW
 607kyibBGapKoeJDZisQXudmsU7YC
X-Received: by 2002:a17:907:6e10:: with SMTP id
 sd16mr17768012ejc.158.1636703737498; 
 Thu, 11 Nov 2021 23:55:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVTSyaI9bwf+cK3HRTYkkEGrfXsl4Cvt+Fkmz/7JDyaorMKEA4Mec75P9Nt6V8a8edl3Ld8g==
X-Received: by 2002:a17:907:6e10:: with SMTP id
 sd16mr17767982ejc.158.1636703737318; 
 Thu, 11 Nov 2021 23:55:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n1sm2700678edf.45.2021.11.11.23.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 23:55:36 -0800 (PST)
Message-ID: <016d5b91-6910-2aca-0db1-a65079449454@redhat.com>
Date: Fri, 12 Nov 2021 08:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 01/17] perf: Protect perf_guest_cbs with RCU
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <20211111020738.2512932-1-seanjc@google.com>
 <20211111020738.2512932-2-seanjc@google.com>
 <d784dc27-72d0-d64f-e1f4-a2b9a5f86dd4@redhat.com>
 <YYz03fcDRV9NZnyA@hirez.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YYz03fcDRV9NZnyA@hirez.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_235541_179341_734CBEE9 
X-CRM114-Status: GOOD (  12.43  )
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

On 11/11/21 11:47, Peter Zijlstra wrote:
>> This technically could be RCU_INIT_POINTER but it's not worth a respin.
>> There are dozens of other occurrences, and if somebody wanted they
>> could use Coccinelle to fix all of them.
> I've been pushing the other way, trying to get rid of RCU_INIT_POINTER()
> since rcu_assign_pointer(, NULL) actualy DTRT per __builtin_constant_p()
> etc.

Oh, that's pretty cool to know, thanks!

Paolo

> There's a very few sites where we use RCU_INIT_POINTER() with a !NULL
> argument, and those are 'special'.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
