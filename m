Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1EBC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:19:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 795A860EB6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 795A860EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OYf/ucHrxsnTPMMdnSDmD1HHJIC1qPLepyWI5dzHPU=; b=NwjC1ZGwlvr2pDffvazvnhR6Rk
	NLm3Gj9nV3FiReRFuWCmNKi0OW4YJzhaCgHv2gYP1B5IqBzi4eCMSo4cRmFkYVJertMojHq9cONT/
	Pye2BbxdPSWEqimrdBbYYbPJ3dpBEEH753Zg8zh2SrdcIK+Q0LNRfsp17SNpQ9Ugzlr63HHvflmlp
	WlLc5EPDxA2wGrIUCBtmUlkj7rPt9rdZTX9uoi5wW1jcapxvNMD7IVSDQl3Pe164cOSfiw3Jqi9rg
	xpdGrHpgc+Eo8pxQ91kT2rt+AB+z1hTAzcS8kXFS+h82lIqnOv8OeCsy6mlVXtotFjj+O06XAUs/k
	R+HYw16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSJC0-001kRo-6t; Mon, 20 Sep 2021 13:18:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSJBt-001kQu-HZ
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 13:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632143916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZbiHti4vCOqgWKM54l6a3juvV92A2baM8UIqCN0ZRQ=;
 b=gBUs1cCExa5AwU18pM/5jF6Axf25NmtDAir8l1/5EPd+yjKEzXkPTZJy7jfhrLmKfv3DuP
 LNPOA/KIsr4f1c97q+3Wz2SVFHfZSNPs50Ktup5c1sXY4Vcqk/HCMAoLHu6Ag8Uj6T1Gdb
 ttj9umuCWYVoOVuZQmVrWyHGxBCZToE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-gWF6uuVnM4OXcBLRuZZYug-1; Mon, 20 Sep 2021 09:18:35 -0400
X-MC-Unique: gWF6uuVnM4OXcBLRuZZYug-1
Received: by mail-wr1-f71.google.com with SMTP id
 r9-20020a5d4989000000b0015d0fbb8823so6036400wrq.18
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 06:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XZbiHti4vCOqgWKM54l6a3juvV92A2baM8UIqCN0ZRQ=;
 b=x4Ui4E9mqTV7YEITmuIa+zaaJq5i4ID8rsKRoYKMH7h1aVTZwrZxxcRe9E6YvMPwzg
 vXSziuBC+tuG1fCKhds9ZmvbFm6Pef0UxTv199+Tm5tKnGQqU5pyCWL5jVWZabntptm/
 c61ADSwqZSBHFVUeg6KbPR4L7GfGRJAt9/XUpQBxFcTRmSvZyRpJ02QvpVSFJPeDZIgY
 zd2BiaSNmAt38FrPEqvAbseri2A6hrXWR84Ylrus9etgVlVMk6p7CTHVBPySRRz0Fkxm
 eNWslO6+9wRQKWmlDorwNZy/tSN42Bz0tbLwXqJs6p3clygchdzp5otWrhqbE/gwSBGz
 O+Og==
X-Gm-Message-State: AOAM5321/tiTxnoUlJiXzTv4hi0q0fN/XLhhY64Y7zbtqEcG4w2fmvO2
 IRqZOVTunugv1qr/5FTdtjwIdmz3uFHbs/ngPmP+wHfYwW8JiM0B9HaJwy4CNJaj+eu2BV9yrMv
 WyZ5QWAVhdeI7wl08RK/dg2FQ5rcJ
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr13376904wrz.439.1632143913678; 
 Mon, 20 Sep 2021 06:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7N3hxz36qRlOw1/rL/DwL4aDROJ8XxG8xzFR2ylC3WRZ+AXi5MycER2AoBKQtMUNziJuirw==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr13376850wrz.439.1632143913429; 
 Mon, 20 Sep 2021 06:18:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm13359543wms.15.2021.09.20.06.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:18:32 -0700 (PDT)
Subject: Re: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
To: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sean Christopherson <seanjc@google.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
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
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828201336.GD4353@worktop.programming.kicks-ass.net>
 <YUO5J/jTMa2KGbsq@google.com>
 <YURDqVZ1UXKCiKPV@hirez.programming.kicks-ass.net>
 <662e93f9-e858-689d-d203-742731ecad2c@redhat.com>
 <87tuifv3mb.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7a5825d1-d6e9-8ac8-5df2-cce693525da7@redhat.com>
Date: Mon, 20 Sep 2021 15:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87tuifv3mb.wl-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_061837_710308_C1DF8B52 
X-CRM114-Status: GOOD (  15.84  )
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

On 20/09/21 14:22, Marc Zyngier wrote:
>> I think that's only ARM, and even then it is only because of
>> limitations of the hardware which mostly apply only if VHE is not in
>> use.
>>
>> If anything, it's ARM that should support module build in VHE mode
>> (Linux would still need to know whether it will be running at EL1 or
>> EL2, but KVM's functionality is as self-contained as on x86 in the VHE
>> case).
> I don't see this happening anytime soon. At least not before we
> declare the arm64 single kernel image policy to be obsolete.

--verbose please. :)  I am sure you're right, but I don't understand the 
link between the two.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
