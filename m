Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB8BCA0FF5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pMWPJnSTUvx8pElT+qNME0v7S9uytcqoLf/3rTrepQY=; b=Op1YYBfeStcWW6Fsr5J5ghX4uw
	vOeBDJe5vxK+CVqDHOydu178MxanPlwKAWV5oOdux7dEPx8/Ed76RLUSK4+89meV9g/D/YPMkwVPo
	ib1dgHxtqQNO/Tw63P3rDXsBF6WkH4Q0X3xKtifCI0XCgquZUxG28pizOaL5orZHKpONFXEfOYpnA
	iniXgjgahmKgDAxfvC5W6HPE/kNdj1HrN4m5x0hlldYwXaf7E+mgm0zTc09zYA0cIDC+rd9SGAUht
	5lwZKvG0qtruXcOvEHwSCuAN1ikXJ6A4f216jQvc4CPRh6/xfzsG+rVGNqID9azt2zWxZnFgzl9nf
	RDSiJaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk28i-00000006VgD-3DFk;
	Fri, 30 Aug 2024 13:58:12 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk27p-00000006VOD-3irK
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 13:57:19 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2021ab2b5e6so16634365ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725026236; x=1725631036; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=58CvTL6COAyoekWQp05GB8r3Lb0Xc+vxoLW2O7LrDWY=;
        b=AwFOKSpMSZovR+ojYucpvxyT1ZmLu02mqTlp6FSGifrj/s2ooI+H7i8FuepVMRsrhM
         09GlUDm+Xwla3Pg8YqEvom9DyAaSyvIQv2ZWMmqdA5ETvb7qlGA1tQ3KNQmMpkeJcIHg
         gti6xbdbvTbO4nz0D+85CA2DPNC2TZH9KV633y9A40PN3oPL00Ee4CFWtGylUNz2i3dQ
         uPFWQdtPbkfnwrJWhABSIFm6bc+V+A64rVnsXt4bSJh189Cm9ry+uJhFw2RepFdJjh65
         K8xyE7EShxoZj6ZxDyS/WNz8BluXqbdUqvJPmHgwvntC8J9zjMLP5XUvqstzb4Tj0WNR
         h8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725026236; x=1725631036;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58CvTL6COAyoekWQp05GB8r3Lb0Xc+vxoLW2O7LrDWY=;
        b=UkpFzbx+KpAxBg3r7z8q3lgNGZap+Gtp1SjqJVKbGau3vOEkFiipYO04BpuLqhvU+3
         palYA1JE+gTPuouIUwvfZmej/irz4NzbRc44TQH3qYT3m2S+VXGt39wUhRd5zvKpjgQc
         2TTn5HpwhKl2u5EkWMFA9x3HkPKpS0COuKPfby249Cks42q0g46B4p42gxZzBUyWQulo
         H0+eNVl0eU+PB1swhL7po6038wH5zVWd1SJZNoQD8GBIx9xF33R3K6AuE+nbInyPLDNv
         ZYx9SHpZWGsY3A3kmOfv3VOEzo01vbzMPIdSG3XLoh9bV4ZiHmQJ4D5w/ukY2jxbZMQh
         DHdg==
X-Forwarded-Encrypted: i=1; AJvYcCUuWdQCSd1/Nrz0So5Obu+xvlI8Qb31OXYVKzcx3wpU+pAjUXRwssgDxHuv8yCAWb2GKxq9aa17f8z2AA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbWQMzAyxhmppGjncMxz5AZqRsIeA4XWrABRWStoC3wDAPS9ac
	kXsn1DJ6UpAT18KvCuPZn2gfXlYUJyqJ0DWOJTrqyR0+zZRSu188+gYraeZdU3o0mSEGHRrGuB/
	Hng==
X-Google-Smtp-Source: AGHT+IExGR2RCNKu/4M4z4IiNUcplAydPr67v3iYUD8ZfSJDuu52D1tVexWQwhZuKUP8XxVYEYjpc6MqNEc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f90b:b0:1fd:9d0c:999e with SMTP id
 d9443c01a7336-2052857ddfamr344725ad.9.1725026235523; Fri, 30 Aug 2024
 06:57:15 -0700 (PDT)
Date: Fri, 30 Aug 2024 06:57:14 -0700
In-Reply-To: <1f037b5604deb5f83f05e709b2edf3063372518f.camel@intel.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com> <20240830043600.127750-2-seanjc@google.com>
 <1f037b5604deb5f83f05e709b2edf3063372518f.camel@intel.com>
Message-ID: <ZtHPusyTNkQ_a1Y-@google.com>
Subject: Re: [PATCH v4 01/10] KVM: Use dedicated mutex to protect
 kvm_usage_count to avoid deadlock
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"anup@brainfault.org" <anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Chao Gao <chao.gao@intel.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Farrah Chen <farrah.chen@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_065717_932196_3258C318 
X-CRM114-Status: UNSURE (   9.73  )
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

On Fri, Aug 30, 2024, Kai Huang wrote:
> 
> > Reviewed-by: Kai Huang <kai.huang@intel.com>
> > Acked-by: Kai Huang <kai.huang@intel.com>
> > 
> 
> Hmm I must have done a lot for me to receive two credits (and for most patches
> in this series) :-)
> 
> I think one Reviewed-by tag is good enough :-)

Heh, indeed.  b4 has made me very lazy; I just `b4 am` the patches and let b4
grab all the trailers.  I'm guessing something went awry in that flow (or maybe
you acked a previous version or something?)

Anyways, one of Paolo or I can clean this up when applying, assuming we remember
to do so...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
