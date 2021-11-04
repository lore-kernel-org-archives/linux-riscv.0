Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCE6C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 14:19:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AC1C610FD
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 14:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AC1C610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3/2Ons7WJxIdc64nIP5rRQ3gFphD6thm94LFrRmWwY=; b=P9xSLz/dYcY2E5
	e5P8XHw4JqUMp7fPm4zeRPlHYa14MXPbrTG93DDigJwM22W8enAWueg2Goe62NiRLy8A5PxblBZbw
	Q7lFsaMgFFLsn39X/dKG8iWZPEveXlju/eLn+DwCuo8jx7aWlC3GSqmr4HMpVv5HrgeGv5Zlh6ZbJ
	J570WBjqu1TJdf1JMgXPnxVFwItVc7WceC1EyQJWTypmCeLOWrXbfW4Ds6xFnTXEeqw251BU1scgF
	D+zlZvI4ZcPzVUfBmIHl6dpIAp6Pr3Jyu0GXa56kOcemx8h+Y+A6E85p08hDm+SDcyBMavl5Xxl09
	eVOz5I56GWkO3KgbjhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1midZq-0095t8-VV; Thu, 04 Nov 2021 14:18:50 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1midZd-0095qg-IE
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 14:18:39 +0000
Received: by mail-pf1-x42a.google.com with SMTP id n85so1500582pfd.10
 for <linux-riscv@lists.infradead.org>; Thu, 04 Nov 2021 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GgU1oUsck/kv7V8rA9YPXtLGsU5UGF/lzeg6fggjKVY=;
 b=RTR1r+Ui0w7nUSHbbKl234uth/uzF1T7qF0sliOvvfsRTTb+Ux1LBt/ffQdTAY+/ec
 E1O0cYaxUcP9JJO91gsHWRMciPl/F1cyjYk822jBCR9TBPiuByHH3wQyg8CO0RsG69s3
 xxzxbxhqtVhFtR1IL3PwpUwYtMOSHDPFnwjUBiz3EACBzoEuXHLTOpHAkW6OfrqPvopQ
 XlcXyGEUw7b6wzkLr4K8OvDzbhOksbBNbi3EmpkiMJmFBXoGv87f+9auU+g0UJJslfkq
 YHd6yOra6jxs1gpwYkmD3+RM+zmhPNdO2qhY5Blp/Ql4/z42+YEAbgjAkELLYFLa2Wdb
 1tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GgU1oUsck/kv7V8rA9YPXtLGsU5UGF/lzeg6fggjKVY=;
 b=QOr0wmUWCdkj6hp4AvBqin4IsVaOg7RlN5XdupO82td1WJ7y9yNtalhUGQYi/ILYlm
 yqLY5V2g/5wrsiGb+JvHtr6IFD3nV+3kCRJyh8Lf3x1wva2z9d1buPHptzNR3Ibh5B5I
 Tu3gxAsFJo7/JG+6CG3NV2+wVNF6iuO2kTwmlC4kgv9zR2xf7udOIcakmaMQqkMagqB1
 vZVOfamIvey9914xiKAAd1auhE8MPlov4ZzNYAkwtGR5VGAUFLUh9vVHcIZXWgU+XZsy
 QyCXNKDhoWEkvcNT+0Q+Tbt98Samv/24OPu6nRTLprE5deWw3Fe3rp142XdH62jAriu8
 hodw==
X-Gm-Message-State: AOAM531zZPqzAPPuYHi6CJPPgVtQ9iyKwq4pO3f8jBx+l9evwLqvbmNR
 R+hy3JJfe8M+M7lgD5lIZRAEOg==
X-Google-Smtp-Source: ABdhPJxdt1yraCn5ATAvpc1jCPrfM/2fIu0pWDknNbK+x2XDbxsbKhM1gzBOeaAuduFP4pk+NDgWGQ==
X-Received: by 2002:a65:5b01:: with SMTP id y1mr22260090pgq.451.1636035510920; 
 Thu, 04 Nov 2021 07:18:30 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id c9sm4061004pgq.58.2021.11.04.07.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:18:30 -0700 (PDT)
Date: Thu, 4 Nov 2021 14:18:26 +0000
From: Sean Christopherson <seanjc@google.com>
To: Like Xu <like.xu.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
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
Message-ID: <YYPrst2CUBXLYc9h@google.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-2-seanjc@google.com>
 <77e3a76a-016b-8945-a1d5-aae4075e2147@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77e3a76a-016b-8945-a1d5-aae4075e2147@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_071837_636362_BABA754F 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, Nov 04, 2021, Like Xu wrote:
> On 22/9/2021 8:05 am, Sean Christopherson wrote:
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 464917096e73..80ff050a7b55 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -6491,14 +6491,21 @@ struct perf_guest_info_callbacks *perf_guest_cbs;
> >   int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> >   {
> > -	perf_guest_cbs = cbs;
> > +	if (WARN_ON_ONCE(perf_guest_cbs))
> > +		return -EBUSY;
> > +
> > +	WRITE_ONCE(perf_guest_cbs, cbs);
> 
> So per Paolo's comment [1], does it help to use
> 	smp_store_release(perf_guest_cbs, cbs)
> or
> 	rcu_assign_pointer(perf_guest_cbs, cbs)
> here?

Heh, if by "help" you mean "required to prevent bad things on weakly ordered
architectures", then yes, it helps :-)  If I'm interpeting Paolo's suggestion
correctly, he's pointing out that oustanding stores to the function pointers in
@cbs need to complete before assigning a non-NULL pointer to perf_guest_cbs,
otherwise a perf event handler may see a valid pointer with half-baked callbacks.

I think smp_store_release() with a comment would be appropriate, assuming my
above interpretation is correct.

> [1] https://lore.kernel.org/kvm/37afc465-c12f-01b9-f3b6-c2573e112d76@redhat.com/
> 
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
> >   int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> >   {
> > -	perf_guest_cbs = NULL;
> > +	if (WARN_ON_ONCE(perf_guest_cbs != cbs))
> > +		return -EINVAL;
> > +
> > +	WRITE_ONCE(perf_guest_cbs, NULL);
> > +	synchronize_rcu();
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
