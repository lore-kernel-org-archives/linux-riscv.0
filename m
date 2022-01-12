Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A948BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jan 2022 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtYUm6xWoJSXlvMzfJRZiiUVpkyVw23WxGazEyFenAQ=; b=YXxFWVbPIyOf5F
	Hlx+KmyHU8m+F0pw5yfaNtCkpc52wI1iivj3xVK8VXDSIUEm9hEn4lxdz+WTd3gVZ6WhuLjWo2mMp
	3wD9kjMigosh9JO7lR2WkSdpWzSE7+9zao8e1jZ8nP1xkeZmE40/Xar85YOWahYgmVXa94xGG6JPD
	7ZdV3pKh2W+6DRxt0+8mb2tQHt3wXKipq5PrLav6afMN8x0SjYKtyZ2oetKAX6B/JFoX0D8sTNTUG
	Jyn+NrNsr+8L4dK5j4iM+3MiTt/vp871/jxs/O1jWcaR9UXSCWN4p0iLVb+KJhck+4h1kM1QaW7jU
	ARQjnHhpMkBRHcSmYOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7hIr-003DgT-Mw; Wed, 12 Jan 2022 17:20:53 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7hIo-003Df9-6I
 for linux-riscv@lists.infradead.org; Wed, 12 Jan 2022 17:20:52 +0000
Received: by mail-pj1-x1035.google.com with SMTP id pf13so6412929pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 12 Jan 2022 09:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QRCI1RlLdVZvt5lKUzeK60PXJ4E91izm9CxbrCuYWiw=;
 b=iD4ax0W/ZQejkpiTV+wC/BTGkgvydCG1+oy9k4x41xcYsxdOIrYBD3Jg5pNLFotLn3
 4lS1DP/A5h5rWv9t8jIgjAfIWRHyWSXlvlM7IaIgxX7hDAUmIgxXIoU5b+8CgT0R9dt0
 iCbsvCcrQj4kpbl/NpitUUKIbg7rTypIFxqdxfB2feMrGc8niiEgwy4Jncc/4d2meNQg
 hKQ5yFTrProqxoFW6AG+GqRq3CQHFwiDeSswlB6x17ayzfA94e4NsXmAcxNN0/DUQR5b
 DQXQiXIgM3bNMe/5PUo8aj95UIBHAUjKy79FkjU/HbhRpV61hkglUgnEV5dHn1QxLypF
 YTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QRCI1RlLdVZvt5lKUzeK60PXJ4E91izm9CxbrCuYWiw=;
 b=Wpoqqgen/EwwlJM+uucQr1fefTr8e/OG4Bz67vEGKhMeHPlBVvWOz4Ut4VNaFtvqTm
 1zO0ABP0JxkA8x21OPYFBOhWFV2FBu8bvwdilod5Pfuz/NnWpjY4iQ6AdxZhxiZOAVf1
 VcUzkmp9rrl9Z5yrw04CV3Nt33B067SO9jOxdIioCC2YqnwA+piGKloXLnjcGvT1ksP/
 Czt4wrWW44Eg2TP2yOyFrZJYSzGZ6XRRapfftY8/DN9uuuhQlUHui5LyzzAJbR+Br8yw
 GdxcGiQMTTfnJNxnIUxMXskhvZcTf+j9xO/4Rs6oJyebHSHQQGVaNyXKkC/5p01N/4f4
 8oVw==
X-Gm-Message-State: AOAM533oXZauAOj/kipfODpiCwuG5z9/ROwKN9QMqidaoMSAe8MvaXTT
 vtT7/jMcc8hgdN0kGu03XF/0OA==
X-Google-Smtp-Source: ABdhPJzSQE5HuAs9ufGKv8GVZpWcgq8Jooiv84LWQSj+pdxhdpdaB4H7DHBA1IqNFc1FS00InVj1vA==
X-Received: by 2002:a05:6a00:2442:b0:4bc:e7ac:b5aa with SMTP id
 d2-20020a056a00244200b004bce7acb5aamr553091pfj.56.1642008049112; 
 Wed, 12 Jan 2022 09:20:49 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id kb1sm266614pjb.45.2022.01.12.09.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 09:20:48 -0800 (PST)
Date: Wed, 12 Jan 2022 17:20:44 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, kevin.tian@intel.com,
 tglx@linutronix.de, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 3/6] KVM: Remove opaque from
 kvm_arch_check_processor_compat
Message-ID: <Yd8N7PFqZbACzh2r@google.com>
References: <20211227081515.2088920-1-chao.gao@intel.com>
 <20211227081515.2088920-4-chao.gao@intel.com>
 <Ydy8BCfE0jhJd5uE@google.com> <20220111031933.GB2175@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220111031933.GB2175@gao-cwp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_092050_305760_2ED699C6 
X-CRM114-Status: GOOD (  13.20  )
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

On Tue, Jan 11, 2022, Chao Gao wrote:
> On Mon, Jan 10, 2022 at 11:06:44PM +0000, Sean Christopherson wrote:
> >On Mon, Dec 27, 2021, Chao Gao wrote:
> >> No arch implementation uses this opaque now.
> >
> >Except for the RISC-V part, this can be a pure revert of commit b99040853738 ("KVM:
> >Pass kvm_init()'s opaque param to additional arch funcs").  I think it makes sense
> >to process it as a revert, with a short blurb in the changelog to note that RISC-V
> >is manually modified as RISC-V support came along in the interim.
> 
> commit b99040853738 adds opaque param to kvm_arch_hardware_setup(), which isn't
> reverted in this patch. I.e., this patch is a partial revert of b99040853738
> plus manual changes to RISC-V. Given that, "process it as a revert" means
> clearly say in changelog that this commit contains a partial revert of commit
> b99040853738 ("KVM: Pass kvm_init()'s opaque param to additional arch funcs").
> 
> Right?

What I meant is literally do

  git revert -s b99040853738

and then manually handle RISC-V.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
