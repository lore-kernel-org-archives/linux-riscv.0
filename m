Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D11BC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 16:01:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8BA760EB1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 16:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8BA760EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLtBExcsxPnnI6QuK1+3q0RwBSLBgXgW52GyFOMTs3o=; b=HcWY1NnIPfDu/6
	9CQeoQgPyWYFplLoTSsP4wqDOQeTzyuBscUvRfJdZ/zCOS1V8dSDAORTuXoOkCsZSvubmByQBCuLC
	B3EiW7u85xn0JICmP3kbynHs7kZ4hcCA7lN8lFF7MC6NWBr8+79DYaWGfXb5NkNjarDJFE60+A9NN
	wUzEPFVklIIKyn/XFhwXZD7jVLBM0+Nwki7AcGVvSoPxKQjp+wBwUe1rie5Iyxc3VYgRC9yL4gXE7
	1spk37+EjELCOxWCX89RQ/CaUxD8QUKm/qp1rLibkII8aUI5CgbBvfBCamTsLnw44oD97mSREoKTy
	Y5E4k0nK3xYi3PHrU/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf2PL-00GxUI-H8; Mon, 25 Oct 2021 16:01:07 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf2PG-00GxQs-2d
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 16:01:06 +0000
Received: by mail-pg1-x536.google.com with SMTP id l186so4931485pge.7
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=x6eNl6O1fSvFYqdMcRuePT95mvtM6NDjKvqXNkc5pYY=;
 b=W66VdzQAiFa1xER7EM1CT10+Eh4wcd9TMpOSeNztU9mQ/b+ICWh6L1ynZPC3b8cWCA
 wuqZ3JuK0JGehSxVwtqEbTHwrBlvK53p1U6E/+mtZAETvvOLRtbYFjLFwI5UloPxv8BN
 XlYir//YmeaaWdnkVyW1uxNuSu55EoKM4Sw+NhmN68wnM6lSDD7jC6Cq+yKsA+BDT9S7
 LYFfhy6YQg08/t+jqQY9xY27FLq7qZME+IYTw4bo6b7p4vRP0wxorg/00RAZqr4kWqI+
 VviR3lssvu74tKK3FhhWMgst1k6Zz5l/r1ahbN8uJfV8tyf6Q1Oq93E9u1/e6tuuAmnW
 0NsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x6eNl6O1fSvFYqdMcRuePT95mvtM6NDjKvqXNkc5pYY=;
 b=C54Yhsn2hbhXc5SXjQ7LVD21t2uMagP/ZFF3qZycPmpfKDFeK9520W3zt2XI9tertF
 x9xuoI7xctWMG+jh95tkv1v/7LrLdJJZYpBFLdM4KYdT7V1yuJKadc7YA2TkoSscOnKs
 LZiUvKmclLG0MawTvd++32U/mpdNUvYd2LdfPObJqz3eHXnx85nP279xb6NtUFsaXTnw
 T412FNJtPJO1S6qDd3k7gWlkXN0NrToNdQvCYYyMuCTxjiE4g/PkocgKg0vDQ5I3dh7V
 jM4pGbZPWmcD00YO+7ZtvpEv140DWQ8Y6n90f52j+xWQWI5tw/jCrWrwDdh3s4q4cqT7
 /lVg==
X-Gm-Message-State: AOAM531UAfaXWvKH6CXv1ys6QLUZljkzfm9K7gBWjXoF1RuiSTTw+XJV
 dfWqCfxBx6nIoHOeGio0vXnOcg==
X-Google-Smtp-Source: ABdhPJxfd0U6TdkD95vRyewvEnv+pkmAbt8gRM1KdKD5w9N0+9AMKZEnnSCWoZvj6xIN71v2dvngIg==
X-Received: by 2002:a63:e613:: with SMTP id g19mr14679139pgh.12.1635177660627; 
 Mon, 25 Oct 2021 09:01:00 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id a124sm2589630pgc.15.2021.10.25.09.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 09:01:00 -0700 (PDT)
Date: Mon, 25 Oct 2021 16:00:56 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH v2 37/43] KVM: SVM: Unconditionally mark AVIC as running
 on vCPU load (with APICv)
Message-ID: <YXbUuLD4yAoNxCH4@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-38-seanjc@google.com>
 <acea3c6d-49f4-ab5e-d9fe-6c6a8a665a46@redhat.com>
 <YXbRyMQgMpHVQa3G@google.com>
 <e9509fb0-54f3-ca86-57b7-8b6d5de240b7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9509fb0-54f3-ca86-57b7-8b6d5de240b7@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_090104_725849_73BB0783 
X-CRM114-Status: GOOD (  14.47  )
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

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 25/10/21 17:48, Sean Christopherson wrote:
> > On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> > > On 09/10/21 04:12, Sean Christopherson wrote:
> > > > +	/* TODO: Document why the unblocking path checks for updates. */
> > > 
> > > Is that a riddle or what? :)
> > 
> > Yes?  I haven't been able to figure out why the unblocking path explicitly
> > checks and handles an APICv update.
> > 
> 
> Challenge accepted.  In the original code, it was because without it
> avic_vcpu_load would do nothing, and nothing would update the IS_RUNNING
> flag.
> 
> It shouldn't be necessary anymore since commit df7e4827c549 ("KVM: SVM: call
> avic_vcpu_load/avic_vcpu_put when enabling/disabling AVIC", 2021-08-20),
> where svm_refresh_apicv_exec_ctrl takes care of the avic_vcpu_load on the
> next VMRUN.

Aha!  Thanks, I'll work in a removal for the next version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
