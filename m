Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E468DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 11:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8990261205
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 11:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8990261205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyO9Ukz4LIaYX/WWX9ow15UkBxnzrk/TXQvN4TmghCM=; b=0VxS8/kEjy/2QO
	dYUuBrIVF6FuY/BJabH1h/uP1qQN1ILRaTW4sEdMh9isX7nSnjJ6+EPQqhmwIpCia/8vi1kelZHD6
	CZH9eGjcTcT7oOMWsic2hZh01MhcLVFBSV9lkKpeWHQmTED+HOXKqvlmuGZDWpU6pl7veCFSU847V
	dwqbMuThZJv/hSLELTaXln2YTgsQfoYWyEnDsrlQPR4lwnrPrLNWR1VO/TIYcYCqHIlvLVBSP2YbA
	4wKdP9mB3lgFcWsyIy8hM6Il9ecA467NB0i14r0Nix9i09ndYCMxlaX/9oaziVZPtVt5YuEB6J9vm
	pQudPHDT05RdY55d07aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mklSZ-005FaP-3m; Wed, 10 Nov 2021 11:08:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mklSW-005FZ0-4R
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 11:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636542481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48dRn8RRnq7Fx6Bqaf9CAoNN40en8LqbHxW41Xnziw0=;
 b=dpWL7meooMgtBAmdDfRcE8M23Cvi9RojMiz0s6vfwne6xMgsHhy5yvRUBJSzSbnpT+vZE7
 UtCi2D18EuXvv1RNmj8iYDIBbQ1c3dwPweBTrUq4Kyiep81DMsIqjoi0EQBaFMqGXHjyw5
 9ddfqP0gd5Ejvqk0mMic57gjbIsJyWo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-uD92VhVXMb-eOZH00ntJww-1; Wed, 10 Nov 2021 06:08:00 -0500
X-MC-Unique: uD92VhVXMb-eOZH00ntJww-1
Received: by mail-ed1-f71.google.com with SMTP id
 w12-20020a056402268c00b003e2ab5a3370so2069588edd.0
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 03:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=48dRn8RRnq7Fx6Bqaf9CAoNN40en8LqbHxW41Xnziw0=;
 b=X5rWlBov+uGFDt4IJXjNjtO4sdc6t2KRf+vvkhlYVftxd9nDTumy5Mnq5sqGtBbG2F
 xTjs88w3sJD0OG6AQNQ0MDwbR9zLx0hofk8OuBOef/jRyMGF6QFo0+vFC9wRSAxJNfak
 UAbX8wQFbhHzb4t7V8DR0K5dpiOiPdCoBO2g1AK8P0ZT8TzyWX4RrdB5nJnMoeAV7aSr
 WlBt1TfDMOv5WJ1tIhTlhLvUqW6jSu90+uPtDEYYBOJWPF0NV2hAR7JB7PfmQbqobIHS
 qcFYGb5Q20TUBErMt/KK4cIic3DUl8twZPkBTmXF/zTKHtjSws6XKEKSqoTtwdIIQadC
 U3aw==
X-Gm-Message-State: AOAM530mrACqMCQAE9XfxiF6U4n9hjjThDKtcigYizuFurP9F0vOgAdy
 iI49dF2V8Xf9lUxE3dgKKLyLIECT/pZiwghyPA1vKxTtG7mepYWaintPu2ZYIBBuuQhxrwHG7ec
 hLpKGHQrTk1935iJAqmrnSkpiU0QH
X-Received: by 2002:a17:907:86a6:: with SMTP id
 qa38mr18779911ejc.286.1636542479505; 
 Wed, 10 Nov 2021 03:07:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIY9E3GGXDTMKNhG94s7x2qpu4nLPlWqmcyoHulhCMNs+PGo9+5ZlP1mG10EA68G9ox4DyaA==
X-Received: by 2002:a17:907:86a6:: with SMTP id
 qa38mr18779839ejc.286.1636542479231; 
 Wed, 10 Nov 2021 03:07:59 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id g21sm9257171edb.89.2021.11.10.03.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:07:58 -0800 (PST)
Message-ID: <f86fe9cb-bf4b-1c10-e0da-276fbb3f62ee@redhat.com>
Date: Wed, 10 Nov 2021 12:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 01/16] perf: Ensure perf_guest_cbs aren't reloaded
 between !NULL check and deref
To: Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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
 Zhu Lingshan <lingshan.zhu@intel.com>, Juergen Gross <jgross@suse.com>,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <green.hu@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Marc Zyngier <maz@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Guo Ren <guoren@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-2-seanjc@google.com>
 <77e3a76a-016b-8945-a1d5-aae4075e2147@gmail.com>
 <YYPrst2CUBXLYc9h@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YYPrst2CUBXLYc9h@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_030804_309810_FA18997A 
X-CRM114-Status: GOOD (  11.43  )
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

On 11/4/21 15:18, Sean Christopherson wrote:
> If I'm interpeting Paolo's suggestion
> correctly, he's pointing out that oustanding stores to the function pointers in
> @cbs need to complete before assigning a non-NULL pointer to perf_guest_cbs,
> otherwise a perf event handler may see a valid pointer with half-baked callbacks.
> 
> I think smp_store_release() with a comment would be appropriate, assuming my
> above interpretation is correct.
> 

Yes, exactly.  It should even be rcu_assign_pointer(), matching the 
synchronize_rcu() in patch 1 (and the change can be done in patch 1, too).

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
