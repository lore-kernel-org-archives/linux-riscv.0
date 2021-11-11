Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87944C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 00:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C8166135E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 00:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C8166135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Zr/MbLzDximLwjvHTbCUICxHYUUO2fVmxYHovRbncQ=; b=e4kRmbuBM6d/hB
	FsScwI/OoqGzm+3JgxYJlgixsZ8oyBcGBIHTrEwLrZcXUXe65EdVlK0JCFMFi8A7F4Zofyp53rk1L
	nYCa2kHlrDt2SSsdOPJkp8sAsE6TuMI0i1cHazhoVxySEevqcdrScTPhWYaH+t1n4tSuDI9UXdKhb
	IyhqaKKPlojFaqumYC1rkc9cWoP++aWmVooccQqkdFEn5SqYZFgFESzvThOwYYBSgp+HzBenHQQrc
	htu3XdZF7n6EG96MCak4hkKlu+dhNaov6KQze+/+Ne30n1nHsDyUiNTyMNmLlENpPvzJVMETnlEhs
	XI/kENHhUcOFzGKz7wSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mky8R-006gFW-LE; Thu, 11 Nov 2021 00:40:11 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mky8E-006gD2-B1
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 00:39:59 +0000
Received: by mail-pg1-x531.google.com with SMTP id p8so3652257pgh.11
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 16:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GCvgNnriUarmCbicpFHHYqZw6hipmqUHqLUNYcuQ5mQ=;
 b=C/MSXc16d+vnyvPXnpHvWobOFVkGiZtvk8Fqn9KlAR5wdGaXHNSYYEqouCychGdG8p
 5qAR+o3QR3qaB0TDQ3yAC+dSCwOdKvfiEZ3Kln4q4atLvJqPKPRHW1o5zq6Ns5xwkOtC
 ik1lkhQwf39tyN70E9VZseTQvLWw0Txmbjd6Pu8ATSLAClCUTw6YIKKav5QdSu46fQ/5
 +e5c/wEbKgc1jOnG5VvHUJ9ey6iGYkWAk7F4ceZqKKEK8rilWv0ZFkZJXl5cjnWfQIx8
 55tsEZ8ESYtzoMLt6c2A3hOaXpTct4C6eIipQoqRcDMTUY4c5FxHvAnMIbgpRMgbfXry
 LjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GCvgNnriUarmCbicpFHHYqZw6hipmqUHqLUNYcuQ5mQ=;
 b=1iyoKUfz4A881JcPUmp0bLJ+HvLlLXiEGUEuwcCdeaDTFp070u1zkUjcE5AGk1K9xq
 EOMRwnO8PBOwcYFn0KtZG8LzQg746R9PPkGJ4WLfaatRnSaPnZ0vlHfS7QpoW5zs0v7l
 aQr2MVxzlIMBRUBTvUssHZxTW8oT67P3eN0qT9JBsjgGYEUNAwk6dAh93k1RYpfKrnMH
 NYc6cYDjDnuiMND7/97w8QhO7IfgQr4S0XqlvqzNt5gGKnZJBtsFb13iqaEq/w8QCcBQ
 F8djy+EXBNtrE/oBOLpLSmEa1hU9UQExGv5F8enIwwNwfAK9YU9m0STXhV98qR/mncTg
 VQDg==
X-Gm-Message-State: AOAM533bqAMFXkR3KpAPPlzOl+FkkbB5rFqMeVE0JY0BQ0rKiRZFwoqU
 GjqBDv5OE1m4ScgIdjslYJVnxg==
X-Google-Smtp-Source: ABdhPJyzWkgci9VXixrCRz+lgwFJsP+1qd2jH9xIE5pUKSl6Qej6NdegD7xki773sUR8p4Puao3+lQ==
X-Received: by 2002:a63:6302:: with SMTP id x2mr1983608pgb.5.1636591196936;
 Wed, 10 Nov 2021 16:39:56 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id h194sm750078pfe.156.2021.11.10.16.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 16:39:56 -0800 (PST)
Date: Thu, 11 Nov 2021 00:39:52 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Like Xu <like.xu.linux@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <green.hu@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Marc Zyngier <maz@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Guo Ren <guoren@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH v3 01/16] perf: Ensure perf_guest_cbs aren't reloaded
 between !NULL check and deref
Message-ID: <YYxmWGB6IUwEu4VZ@google.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-2-seanjc@google.com>
 <77e3a76a-016b-8945-a1d5-aae4075e2147@gmail.com>
 <YYPrst2CUBXLYc9h@google.com>
 <f86fe9cb-bf4b-1c10-e0da-276fbb3f62ee@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f86fe9cb-bf4b-1c10-e0da-276fbb3f62ee@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_163958_432310_D66BA77F 
X-CRM114-Status: GOOD (  15.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 10, 2021, Paolo Bonzini wrote:
> On 11/4/21 15:18, Sean Christopherson wrote:
> > If I'm interpeting Paolo's suggestion
> > correctly, he's pointing out that oustanding stores to the function pointers in
> > @cbs need to complete before assigning a non-NULL pointer to perf_guest_cbs,
> > otherwise a perf event handler may see a valid pointer with half-baked callbacks.
> > 
> > I think smp_store_release() with a comment would be appropriate, assuming my
> > above interpretation is correct.
> > 
> 
> Yes, exactly.  It should even be rcu_assign_pointer(), matching the
> synchronize_rcu()

And perf_guest_cbs should be tagged __rcu and accessed accordingly.  Which is
effectively what this version (poorly) implemented with a homebrewed mix of
{READ,WRITE}_ONCE, lockdep(), and synchronize_rcu().

> in patch 1 (and the change can be done in patch 1, too).

Ya, the change needs to go into patch 1.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
