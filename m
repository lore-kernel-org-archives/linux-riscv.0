Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A1CEB2C9
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 21:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIwO3vyFi+j/fuInwIoloEAmuc1MY2zeXf1M8lkqS1o=; b=LFnori1GT01nzi
	u5ihYICRc6AX8Jlcjpq8499Vkuy0pEKzXibJ782vXS9pD0iNq8JBvTPzvoKRNm1HK8xx5XDbDxpTW
	CnmtWBTu9sw6X2QUcEH8Vnx9beHj7+HdI2ofIH0ySUOZXRg1gXa04YFUb5V3nVzVY2N8omV60/FSr
	fI0CzdTOJ+bH4+92TvLv9A/aPG9mUFdxG+U8Lz1t8RbVM/aXqgN24ztaaBBZXOUeS2HD+q75PsJyw
	WcCVNLash8/QQoF6IsbgUBZabRprGr+/7ftu36yj5oP4yicVuQSI52i4npYTPz1wyzEopxYhSAEvM
	MNNdKsIv9T5O2oWYtCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svOO0-00000000xzf-1jEL;
	Mon, 30 Sep 2024 21:56:56 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svONx-00000000xyO-1OLl
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 21:56:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e0a47eb73fso6008455a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727733412; x=1728338212; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PntPBodbq4krAqAL/kXN8N5SHx+RiWW9dX81Z4mrKcI=;
        b=lGWrbJWP0OTtld+ZPEcP/tv+5bu9mD/zWWVcwuBjcChL4Y/pSAm//ms4Kvm58ZnvTK
         hq8xbgmcDcJgd/GUi7Rg2Ny2W/QD1MWSCWq8ek0glFEM9bkJTpVMNWci7SxrGyds3Jwr
         6dNmhQVPSZQrpQAKkWd49PdDuqV+NobJWdmgLLNUc4MzdlZL5lZrZZzfh84AkMFSavrk
         Z5XSGchTfrEhS/Md5JW7gMqhl/siY9tYO++6tANiLnxcrqdGKzMRUvjy4aZDUnu42bNv
         pxPSZqOZY9L769yh3O5Ar5ykPcg2xbSg7Sf31wEpOr8uDqP1jQc0T/x87FFNuVxQ8oRD
         GthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727733412; x=1728338212;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PntPBodbq4krAqAL/kXN8N5SHx+RiWW9dX81Z4mrKcI=;
        b=b+M9cyCvCjGDQzX5ak4i1zXi1QYsH5zLXbRPsxB99xn0ux7DiJGEExB3cv+G6mp8MG
         N7nuJePAOr7UWxIZycvNvcMnNL6+fVhex9HU7tFD75Ki/pZYWk8RIFJHk2nOSG+0w+NB
         T7hrxpxiCeeNxpkGwUi++t6cQViuAGVCqAu5n40wAS5++2b29GprQVWDPDSeEnRNifCv
         ySye6M0asM/pksrd3lfFntf5lvUzedb0vf7Oa6T46H2iQxKD66ujPN2r5yyuaLjbpzkT
         tpvdmO6Ieto/HXMfEDnpasj45a1v9pxJlH/J53R+9tRaI57rhY4ZyqFZBYdj+PU8RJA/
         9QCw==
X-Forwarded-Encrypted: i=1; AJvYcCWGZro2dRbnSYuBjd98eC9FSPOL7wMN+eWUAQQrP/kGGiRHVScEhP0z9BEC79Yr3Cm5otI+Iem9DTSZGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YydlfVGJ2c9pYGSGPRZ3/jZDBqY7z15AoTNLWQ0VS12sVzS2hdo
	ECYR6crogxn8loDj6cVqEHFkTQwSVvhJe9AApFSEyQ3ByBaUF9jTAnQBl3s4nm9o5/0xKu5qVFn
	d1g==
X-Google-Smtp-Source: AGHT+IFa/3NUudFCuE72HcCwi+hM+UVm+5oAl6XGWfqHgohNP2i/0xjhJQmHwp45qjEiLZEOk9HWi9na7w8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f691:b0:20b:aed1:bf77 with SMTP id
 d9443c01a7336-20baed1c097mr62225ad.7.1727733411419; Mon, 30 Sep 2024 14:56:51
 -0700 (PDT)
Date: Mon, 30 Sep 2024 14:56:49 -0700
In-Reply-To: <20240911204158.2034295-4-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-4-seanjc@google.com>
Message-ID: <ZvseoZLzmaS4MEbc@google.com>
Subject: Re: [PATCH v2 03/13] KVM: selftests: Fudge around an apparent gcc bug
 in arm64's PMU test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_145653_419864_30DD07F0 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 11, 2024, Sean Christopherson wrote:
> Use u64_replace_bits() instead of u64p_replace_bits() to set PMCR.N in
> arm64's vPMU counter access test to fudge around what appears to be a gcc
> bug.  With the recent change to have vcpu_get_reg() return a value in lieu
> of an out-param, some versions of gcc completely ignore the operation
> performed by set_pmcr_n(), i.e. ignore the output param.

Filed a gcc bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116912

I'll report back if anything interesting comes out of that bug.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
