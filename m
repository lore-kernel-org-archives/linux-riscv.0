Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10810C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 00:09:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C947C610CB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 00:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C947C610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWz+Pfw6zSNt+xFhbUvw5DaLEVVqoQfrr88+egtVA78=; b=31KvSc2YrNJmvw
	fCBA3u3DtigC5vIpYzVaJryUgyDMyNBmets0fw5XvqXQXaQQYWHsybaz5gEM5jDzEb9SHzpL/J/qV
	RAOpEoXX7W1DX8KPCpib2DAtr6qEu7NESufDDGRhJAZYW6oMpkCpsFyPzPao1TgNhCQzBiLNFcF50
	vrE6hYbIuO0Mr/OOyFExaHtrDXM+S+SZqZfa0SnbwDJeDcF08J4t1TGeXmrlHNRX/OanDuQa87A9b
	55pencRT9K6GZ/f0+54tIXinDcEzbYfyDbrZC36jqrqOeiQd/eE6yN3MtXBUb/eAkykNC/kpJ1QtP
	5CdZrxYSUCAFNGB49SsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkbBR-0048zE-37; Wed, 10 Nov 2021 00:09:45 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkaon-003ytn-J4
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 23:46:24 +0000
Received: by mail-pg1-x52d.google.com with SMTP id p8so521987pgh.11
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 15:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6chuTYfgRvTDMG+7/4r5PAEJkXMffm8xsv4fOhQYrHg=;
 b=padV+5xbNxU2BtdwvYLqgobnJgC7jdztrJVhn7K2+WlRuLp3u+7Em538emsInI8ZW0
 EzZn9v91Us4jfHf9Lmmw5fjJNJZXyPueYr0bLHlmaEwNiw9/mnseW7q3iUQMF0MSrqY7
 fh/rdp+bFUiYM2Q6wMsioJo1q+LB3h94uhn4IoA8l8Oi2FnmukHc/WcnpMyQdwGZgNcX
 quegTOwOZXl16pimaWjp8HrU55UW3cRaxZ+73lXvIy+5zw7YWqG84GnZJq4QA8qj+lfZ
 30vSgeoxKWa3Pm11ldKt4T1NH7NtZdcF3NNQhyDYYMuoCBmAmEhAxO9jY6+vIZP5JAti
 sSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6chuTYfgRvTDMG+7/4r5PAEJkXMffm8xsv4fOhQYrHg=;
 b=sNZ5cS9IAEkhH49svBowDcm/CunUa13gJlbrr0rULL58ckl+XauT7pTgno8ipaqRP8
 8EAjDu7TaRF/EmlmZ1Dg7/7aJ8J/NeWN9/4e2BM8E1ydXBLKOWGv9qfOonq1axpULs9O
 5UTRaqRfgZjMdZHGSsytF4lLqaGAkrBseCQgmbTvCxx89BocIPNrVyN4IaSGylK7ALrk
 +YZKBtXQizwFi7tOD8vv0Qy4ZFu1Pz8UjMyuy/92PLNJrQUUIV4ff68n+6AsTwTamPPc
 WTOq4yahtkXPZ7Wgvths1MaDFwrVhp8AMQqH68V0CFxq4pSJPAyUbjW7xenySJcuQFgk
 Km8g==
X-Gm-Message-State: AOAM533nlW6AxBk0w0o26rVERh7NIDsT+QIlap4EYS6BW3T6Pfv2RaJ7
 UdMxoVY4jggSG7wxyICJeaLmSQ==
X-Google-Smtp-Source: ABdhPJwm4B0oaMVW7WsgOG0J14c3t+T/mSfRgwMmqW6RiSnYPS/pCOwWjFlWP8+tiDx9Ql84OwTCuA==
X-Received: by 2002:a65:6a47:: with SMTP id o7mr8900284pgu.439.1636501580110; 
 Tue, 09 Nov 2021 15:46:20 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id y130sm14619421pfg.202.2021.11.09.15.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 15:46:19 -0800 (PST)
Date: Tue, 9 Nov 2021 23:46:15 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
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
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v3 08/16] perf: Force architectures to opt-in to guest
 callbacks
Message-ID: <YYsIR/yEYm2nAz/p@google.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-9-seanjc@google.com>
 <f2ad98e2-ddfb-c688-65af-7ecbd8bc3b3d@redhat.com>
 <YUtCWOYJwCUYDYtW@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YUtCWOYJwCUYDYtW@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_154621_686777_CF54B592 
X-CRM114-Status: GOOD (  15.57  )
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

On Wed, Sep 22, 2021, Sean Christopherson wrote:
> On Wed, Sep 22, 2021, Paolo Bonzini wrote:
> > On 22/09/21 02:05, Sean Christopherson wrote:
> > > @@ -1273,6 +1274,11 @@ static inline unsigned int perf_guest_handle_intel_pt_intr(void)
> > >   }
> > >   extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
> > >   extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
> > > +#else
> > > +static inline unsigned int perf_guest_state(void)		 { return 0; }
> > > +static inline unsigned long perf_guest_get_ip(void)		 { return 0; }
> > > +static inline unsigned int perf_guest_handle_intel_pt_intr(void) { return 0; }
> > > +#endif /* CONFIG_GUEST_PERF_EVENTS */
> > 
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > 
> > Having perf_guest_handle_intel_pt_intr in generic code is a bit off.  Of
> > course it has to be in the struct, but the wrapper might be placed in
> > arch/x86/include/asm/perf_event.h as well (applies to patch 7 as well).
> 
> Yeah, I went with this option purely to keep everything bundled together.  I have
> no strong opinion.

Scratch, that, I do have an opinion.  perf_guest_handle_intel_pt_intr() is in
common code because the callbacks themselves and perf_get_guest_cbs() are defined
in linux/perf_event.h, _after_ asm/perf_event.h is included.

arch/x86/include/asm/perf_event.h is quite bereft of includes, so there's no
obvious landing spot for those two things, and adding a new header seems like
overkill.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
