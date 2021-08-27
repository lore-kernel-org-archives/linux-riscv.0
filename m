Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BFDC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 17:23:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9684360FD9
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 17:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9684360FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3Zt5YOC+3wp1eKbYf4Aghw2xMLYilfRmhBXT/CcB0Q=; b=g27xT+PT6a0z6Q
	NqxkQ3f8cmAOaeFEMSGE18j6UQGsICbf8OIDJlRt7ec5UX0hmcQ4RK040tq68pHR06BayS9EnZk2w
	WfI7tBD9HTbbH1VHoNI4wH59MUeDmgfYwxIGLYZZeswl9y7PbSeftIMwlM/IKRRp53at+lldMdl4b
	WIVc1nuJdi6iTd64MDkCipiUYIje+2ZAzMgXsn0fU2VUJPFQ0xx6RLseA5joaOc0dDxj2SHcy+srX
	bnsJHDQ0ZwxdktbuSHSz0199yrGjcqsLfBDhyWV2Afr+avC48PpsTClYIwKLLZydKFsBN2rWc/kdn
	SOMmCc9+/UU8U+ZHCz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJfZS-00CsaD-9S; Fri, 27 Aug 2021 17:23:14 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJfZP-00CsXw-8j
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 17:23:12 +0000
Received: by mail-pf1-x436.google.com with SMTP id u6so5615504pfi.0
 for <linux-riscv@lists.infradead.org>; Fri, 27 Aug 2021 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pW2KRXINIECq2UqrMAjVuApe68m2StZHA9v7va6qTiU=;
 b=rYBmoVs975N+yu2934Kl7Ag8dNi2tkW5MPQBPsQWMJceqaAUViMJX5p8VTsmrLat2L
 1kJT1N4rNPJvHYN4v8xV4LZQQiN0gVYVxxZoK0AWZMQtgbtlsholocVLBSLsdQUjTc7K
 EO/n6pcBnNhyHknntLRnjl3c7dPZnYup1ZY4k8dYXcB6+XwMELnSDRN8GScTXVD9wLYw
 72HE/X1LKTlO7T9MyRzf3/jBybVrYz/zMXfVi26QTtQIvfOSsE3Kyet1JW3IoRhxG7Z4
 s9RsOEhsC/QREunQ94/foNgn4vxgTRk3Re13QZxXDPqu5Xx6dQ43rKJdU90h8PsbIabZ
 TDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pW2KRXINIECq2UqrMAjVuApe68m2StZHA9v7va6qTiU=;
 b=ckhQlrbbucIQEVZOIQt4ujtFTC5EIdtw9e0WzkS5p0iFbClM8xSnV8f52tp3UwRW4t
 u7smxj0zoD34oCvTYKhXsVBTGl/adwk0Gu7zSi5CGGwr9anEUU3SN/5sx+JqQzFydQSW
 qYi+eKsw449PUGeGMXJ5w/6LwO9YsttGTFo5V5bXD4znB4vnMMMiNlA33jRsviUrFI9c
 f9z+FD6Th3v8TgwIg8/vNG2NIIWd98HlsAzMYUKBS8DINo+XvJ7GUhunz5UZqeaIyXTa
 pwjIcgugAiKkAb9R1mNbrpr8BYzsqwJBL1IyOQyJH+haXgWLDY5dhYBEibxO2YIRKz7O
 IatA==
X-Gm-Message-State: AOAM532GbL2HQ3SwSbHjtqrw88p9TnEMeZ/aH6ofxYsEC1TvdDLDyCEO
 1k/T34fglijx+mVQds1xQSqp4Q==
X-Google-Smtp-Source: ABdhPJz+T5dgH3sIVem/Dht2xu+EGET8qPyEg43yvrgPII1mSQTEgb7AA1JRyZkdBQMuVGObTA+XjQ==
X-Received: by 2002:a63:ef14:: with SMTP id u20mr8773852pgh.13.1630084990019; 
 Fri, 27 Aug 2021 10:23:10 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id n24sm7386923pgv.60.2021.08.27.10.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:23:09 -0700 (PDT)
Date: Fri, 27 Aug 2021 17:23:05 +0000
From: Sean Christopherson <seanjc@google.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: peterz@infradead.org, pbonzini@redhat.com, bp@alien8.de,
 vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
 joro@8bytes.org, kan.liang@linux.intel.com, ak@linux.intel.com,
 wei.w.wang@intel.com, eranian@google.com, liuxiangdong5@huawei.com,
 linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 like.xu.linux@gmail.com, boris.ostrvsky@oracle.com,
 Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V10 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <YSkfeXcd6nUT3AOJ@google.com>
References: <20210806133802.3528-1-lingshan.zhu@intel.com>
 <20210806133802.3528-2-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806133802.3528-2-lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_102311_327150_EFE55AC6 
X-CRM114-Status: GOOD (  10.87  )
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

On Fri, Aug 06, 2021, Zhu Lingshan wrote:
> @@ -2944,18 +2966,21 @@ static unsigned long code_segment_base(struct pt_regs *regs)
>  
>  unsigned long perf_instruction_pointer(struct pt_regs *regs)
>  {
> -	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
> -		return perf_guest_cbs->get_guest_ip();
> +	unsigned long ip = static_call(x86_guest_get_ip)();
> +
> +	if (likely(!ip))

Pivoting on ip==0 isn't correct, it's perfectly legal for a guest to execute
from %rip=0.  Unless there's some static_call() magic that supports this with a
default function:
	
	if (unlikely(!static_call(x86_guest_get_ip)(&ip)))
		regs->ip + code_segment_base(regs)

	return ip;

The easiest thing is keep the existing:

	if (unlikely(static_call(x86_guest_state)()))
		return static_call(x86_guest_get_ip)();

	return regs->ip + code_segment_base(regs);

It's an extra call for PMIs in guest, but I don't think any of the KVM folks care
_that_ much about the performance in this case.

> +		ip = regs->ip + code_segment_base(regs);
>  
> -	return regs->ip + code_segment_base(regs);
> +	return ip;
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
