Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF735C47088
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZlHSlvwY2zPZJWoYI83Li6grUjD2WlFo9KkGmju78o=; b=466Y/CnW7J0oDg
	PuRO9n5idvm3z0hGQd0SX8YNhzhuH9tenpmdESRm4dSvEYesnY9Rck2sLriF11abhdqVjACEmovdw
	MI0tCBewr6UNblLxQ7jLzgCkBIFRk1ljVxLjDsxQglpCKxx07rZcUkzPWsDU6mlbEm6M0EK204ACL
	SmdZ8oPTvZMysF9jijDirfHf8ZVmqutRzHPKS7wsiFyG2mekw3/ad6cgx8/jRs0tNx3+03i3Lc5dK
	c4+L3TG+xA3aSfOO78xZnM5oBjztJiUJ1tckPBxSgtC4bNotnzP+FoH8rFY8ojZreS9udkymO3ZuT
	YFlJXZxZD5Nekc7pRbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0W5w-0034ds-Ot; Wed, 30 Nov 2022 23:02:24 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0W5u-0034cK-AT
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:02:23 +0000
Received: by mail-pf1-x431.google.com with SMTP id r7so173659pfl.11
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nHOMyfsfvQkL/nShVDUzK82mKXXqJYsG0axSizIXaLY=;
        b=NnMo7/46lbMBrXBXQZRYVq3GggYMT+7jEJcq9CL/cSVNfI9/zGr929gpN24qaTzNDj
         EuAX3kX5hoFkykznYnPSEMhpqrvV96Ls6XOPXnZJFhl++LMNCZ1xBLhLYGuEyeIeBOlg
         1Pda6St2Grg/DjBtBU5P+snxis04vfL2wZmjtsQkvZDNryITBkJPcp25ppL/joru6uaX
         pdFAr7CPrxA89GBOBBQLxyhlYq8vGrdtF3rzEmU5z3DvHeLGy15BW/hWdiMul0LnS4v8
         aUBoc+y5QRGugr1owVbIQyI2ZzhFRbthIb2QpbXN2iQwGAYLSCnMYOTrkzCCC2hVImkh
         7vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHOMyfsfvQkL/nShVDUzK82mKXXqJYsG0axSizIXaLY=;
        b=RdWP7Wea5ef1Y/Hn/5eUIPNf1TXwmrnhtogSV4ch40+9vt8q8I8LAXxBCr0ZUxiZlj
         0lcoj2d0+FTDWkH9Yx7GTcrQI8chqFXZHewBcm/aJwiT4P+E3tO7bZ1lvrVHRYexmDRK
         SZQvRjUEp59a1tqrUUfw4GhIn9Fnc/NhZ1G2okONebR4fkBGIVdkOB059zRnRILw5hyo
         hkGe2FMSFl809eiYzcppOTqk2gCkTWFfnUomWw6JwX19UgfEEgvqN02II59cE7VRX8JO
         kcgkO2Ga27u3hV3DwG922JsvEkmi8SfCAF6CJMQxM66arTzzxPHflUl8n37K9TKJ3FXT
         ZBJg==
X-Gm-Message-State: ANoB5pmca57QPo1V38aoAs5igwNj4kGuUeRg4TKBggouV0LaMC3qhg4g
	vgigjLsW0/bfsKzxR0nwxNahAw==
X-Google-Smtp-Source: AA0mqf5Nj1181KAxR2A/WI368LXBMRYoBlCi8ORJRhPIy6nAs8C080UTF7/1gaOFg5Avl9sdvRAfNA==
X-Received: by 2002:a63:2361:0:b0:45f:f8df:108e with SMTP id u33-20020a632361000000b0045ff8df108emr37236360pgm.127.1669849341423;
        Wed, 30 Nov 2022 15:02:21 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id a6-20020a624d06000000b005633a06ad67sm509519pfb.64.2022.11.30.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 15:02:20 -0800 (PST)
Date: Wed, 30 Nov 2022 23:02:16 +0000
From: Sean Christopherson <seanjc@google.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 32/44] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
Message-ID: <Y4fg+MO2DusqMSZO@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-33-seanjc@google.com>
 <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
 <Y20r2NR9MaBbOGLn@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y20r2NR9MaBbOGLn@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_150222_391743_FA5E1E88 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, Nov 10, 2022, Sean Christopherson wrote:
> On Thu, Nov 10, 2022, Robert Hoo wrote:
> > After this patch set, still find some printk()s left in arch/x86/kvm/*,
> > consider clean all of them up?
> 
> Hmm, yeah, I suppose at this point it makes sense to tack on a patch to clean
> them up.

Actually, I'm going to pass on this for now.  The series is already too big.  I'll
add this to my todo list for the future.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
