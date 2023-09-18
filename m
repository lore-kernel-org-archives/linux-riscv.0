Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61423CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2op90jM93BVuAoOK1uHQX+w9H56ouXenij46XKCTFE=; b=CkJIvS9cP9vf9f
	uu+I69a/BlKT5/1zUd6gcd/bxCz6JvkSlDx09ph1++yDH+tzByMRyyYyNFgFdXTPYL86ykTGrRUYE
	IuhfKpfMajyXIdNbFi0nRvxUB53YP1bw5SevE+d/rPb1WPV5jjsOOMhHajcBCxlOzk7ogxa4jrJQC
	u2Pe1mNkAwl1nPczBBTY6vNavr8YpJUtDiTO5vq13nXPywZrV3wmSJr3W0oele4mfmtqRZYwqdnhC
	/FsyPMEvYnkvsLF84PgwC7dhWINbnQWLLu+vNT7YTRjr4MXcVaw/XExLxnp55TLqbOG1idlJzGfOI
	KCrXR4CB3QrkVhZKhgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGwf-00Fqi0-0i;
	Mon, 18 Sep 2023 16:17:57 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGwa-00Fqfr-2o
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 16:17:56 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-572a7141434so2821637eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 09:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695053871; x=1695658671; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2rBowV5k7lk2ieUe+gHPEvDWhBOkpthR4x1/BaQpS1E=;
        b=Epa2pKISxT5USiddc99qQ1/hQ3hXGO/q0IswQtcUSlSobwO+1lPTqvOKlmH03C0sB1
         YNvJyyB2lauOq3kn3jk2XjDcRD55G50o9XkiErNRyS0hHRTekP4S3LuFkY/0UjJ9S/Vy
         Itql8vtm1eKFDtMKBuRWSX7Ox1SHVOXBmUj+HuxSmwCy1VLoP7Bt/KXgIV0lNNF24/oB
         YKhcVgjv2TD8tqAlug+ycAivPCTZF53r57xMsDHLPQUsOEMhMpuz2Mzx6PwUa7ucKs7K
         0L9soNI29IZFRw/NeMw/oPkpx9uOKu4KlZdO8b/FE950W+uwmWGS+QHEZe12rS54jD6m
         eFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053871; x=1695658671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rBowV5k7lk2ieUe+gHPEvDWhBOkpthR4x1/BaQpS1E=;
        b=Jt/Q4Ciz2tZEjPCNaQx5CmvpBmo77+ZhfwXPU2Qr/RCnhPXnIvvk2dj+MDZP0ms3d6
         Ztt0Xjf09Vt+C1dQJKYSwIkDtyIpBP814QhSbTosJa6xBRNqzrOHd6smk5CSLYdhnDYN
         SP3fWXMza3KMLUK1yPaxOsnqKzsr8/wwKwyQhUd59W7Pz3pkf+M7EUOQjgd35LNDHtKB
         9/AUW72E4Vs2sZGHAKcxcpjPT95Zl8hXsuIVlfdQYWUaOQCOJQk7N9zGcUerU3URn3H5
         ycMWYOcpOmQu4tTvY/d3GxbPN9fjKAc+WwoG3haqEmpVCt0fvCrAVsDQW431zP3PDBWw
         h2Ag==
X-Gm-Message-State: AOJu0YzhgOgQ/PwfgSvuEb6AXGJPt2p/06NbctQBN/ZUWpzwS4WKK/A9
	AXN912nUrwPQ3y88MiUByDtUiw==
X-Google-Smtp-Source: AGHT+IEIIPi01LMzDkzmjlUBhug1qKaxU6nRjVuZ+XGbMUgkxm1Qfw0TLzJDUPnbwFfEuT1QKajmag==
X-Received: by 2002:a05:6358:7207:b0:13f:411:c1a9 with SMTP id h7-20020a056358720700b0013f0411c1a9mr13490229rwa.17.1695053871422;
        Mon, 18 Sep 2023 09:17:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id pz10-20020ad4550a000000b00656260e67afsm3340834qvb.115.2023.09.18.09.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 09:17:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiGwY-0005mj-Ao;
	Mon, 18 Sep 2023 13:17:50 -0300
Date: Mon, 18 Sep 2023 13:17:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, kvm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Anish Ghulati <aghulati@google.com>,
	Venkatesh Srinivas <venkateshs@chromium.org>,
	Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 06/26] KVM: Drop CONFIG_KVM_VFIO and just look at KVM+VFIO
Message-ID: <20230918161750.GM13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-7-seanjc@google.com>
 <20230918152946.GJ13795@ziepe.ca>
 <ZQhySMjmuyW2Czas@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQhySMjmuyW2Czas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_091753_134318_335ECFDC 
X-CRM114-Status: GOOD (  15.69  )
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

On Mon, Sep 18, 2023 at 08:52:40AM -0700, Sean Christopherson wrote:

> > I wonder if we should be making the VFIO drivers that need the kvm to
> > ask for it? 'select CONFIG_NEED_VFIO_KVM' or something?
> 
> I wondered the same thing, if only to make it easier to track which
> drivers actually end up interacting directly with KVM.

There are two usages I've seen..

GVT's uage is just totally broken:

https://lore.kernel.org/kvm/661447fd-b041-c08d-cedc-341b31c405f8@intel.com/

It is trying to use KVM to write protect IOVA DMA memory, and it just
doesn't work. If we want to do something like this the core vfio code
should provide this service and it should be wired into KVM
properly.

power and s390 have actual architectural "virtual machines" and they
need actual arch operations to install VFIO devices into those
things. In this regard having the arch opt into the integration would
make some sense. I expect this will get worse in our CC future where
VFIO devices will need to be passed into arch specific CC code
somehow.

This arch stuff isn't cleanly done, the code is sprinkled all over the
place. Some in mdevs, some in PCI arch code, some in #ifdefs..

Maybe the CC people will clean it up instead of making the mess bigger :)

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
