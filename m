Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2415AEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d8CydtAUeGAyTbeon8fkO1TQuwp61VFCzREaGNn1q1M=; b=fGItpnwbLwcnFt249x8uy4ZVHQ
	5lTQ9wa0LYO/loe2IFbSXcWd3X08k1AWid/UtduHlUdZJJGqxShLL+hzBwmmSEA5LqCwisEdgwJ7s
	x+XYTJ2RqN0q0ItHGbE+BNXyqJVh6UjV1lLvDt3r3i+Qhjj+I/HWpSL0bpKhG3mV00JqStLCS6VFw
	ePrewXrGjDCtRQRZpppsimIlfdgTPXV5sI2oz6Sd4ffFwzplC+C3et3ODx8lsDMoa4vONrdleohqx
	WrRzMTvjgM0pG2NnIkn0JabiQPOpBaGC4Rv1eRTeV3Z9j6tuZra017b39W7rPVmAdNGph5U2pzPlx
	ieVDBRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMuGa-00Emjd-2B;
	Fri, 21 Jul 2023 17:50:12 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMuGX-00Emi2-0N
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 17:50:10 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bc68c4e046aso2045231276.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 10:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689961807; x=1690566607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGq520d0DqyrCnCF7s5Hdb0rD6NYwtkYzvVScy9HYVY=;
        b=lZQ3ytVABaMbgeRDyRyj2Y4aroG9rwZE4tos1KIi9+yVur8kHjUJfNDjBsWbA5klWv
         TLcM88saeccS8fNt+F3rMDPeeLUphdScBaSRyrIwijc1R9havyOwlUNE/IQcuJNK+B8L
         fg4nRh9mVWUewpR8WoS4y2UShReGqGQI/p2sPXI0/xi9S/4bLyRSoR+wjHm8ngFldPX/
         svRbdc4YBfOK5kZ24vC9n3F8L7Li2/2X6A5zsHfs5DeCFBQGgpDd6R/Lv+3ONLhdKh+D
         zucg4UeBA4sEAN2XLHlR2RolIKqE8NS9aws4SoQANyJbQckavpkDoby1VzLjItanYN4z
         z0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689961807; x=1690566607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGq520d0DqyrCnCF7s5Hdb0rD6NYwtkYzvVScy9HYVY=;
        b=hpM1ijL3zOkayUg7bCxz5eUhT3S+XuUModMLMpGXFQGk9HjNZVHCLyLPvIKPA0hPRR
         X6uANgGJ096uy54JLhWoy9f85NlsMqgFlR0HpS/oo0CxBdxjO9f/22iYucXdXJO+ovhP
         X4TTtJOz5l4Pvw6y9y6cclRQkqNpiicn5kNP4jHaTTP9bYG5NBu0iT50nlwwMvszubIz
         aWOJV4gBHoNJGPiEr6VBjD0hzoiKYF6Elrp1+aUgIXwo8rAhdCRwvrNVPIQpKuqdhzvx
         BHbDnDUEI768eqL5Rq1bIf20+2isHa0ZN9xqpA4rkRXsE04+Kz15IgcbBXarv96r31RA
         XKbA==
X-Gm-Message-State: ABy/qLYJBEs/H5ySISuvyRI6Rb2rtS0GMqeNGkBwxmFeqYfOxRHzW6lg
	DqI0B3OmazlFtRCO3X0pG6DManZysyk=
X-Google-Smtp-Source: APBJJlGQVjm5RzrpH36bdluvnqR1OmovIF/Mv2HtKZQ0PUD+Zj6xyTxIa85gQ91Vm5Bag6YHDA7hXUEb4so=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:10cd:b0:c1c:df23:44ee with SMTP id
 w13-20020a05690210cd00b00c1cdf2344eemr19769ybu.0.1689961807734; Fri, 21 Jul
 2023 10:50:07 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:50:06 -0700
In-Reply-To: <8ad7a846-64e9-a3f1-4bf1-731a994d62cb@redhat.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <8ad7a846-64e9-a3f1-4bf1-731a994d62cb@redhat.com>
Message-ID: <ZLrFTq2f1NXtlJWd@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_105009_597493_F13A48F4 
X-CRM114-Status: GOOD (  11.85  )
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

On Fri, Jul 21, 2023, Paolo Bonzini wrote:
> On 7/19/23 01:44, Sean Christopherson wrote:
> > +	inode = alloc_anon_inode(mnt->mnt_sb);
> > +	if (IS_ERR(inode))
> > +		return PTR_ERR(inode);
> > +
> > +	err = security_inode_init_security_anon(inode, &qname, NULL);
> > +	if (err)
> > +		goto err_inode;
> > +
> 
> I don't understand the need to have a separate filesystem.  If it is to
> fully setup the inode before it's given a struct file, why not just export
> anon_inode_make_secure_inode instead of security_inode_init_security_anon?

Ugh, this is why comments are important, I can't remember either.

I suspect I implemented a dedicated filesystem to kinda sorta show that we could
allow userspace to provide the mount point with e.g. NUMA hints[*].  But my
preference would be to not support a userspace provided mount and instead implement
fbind() to let userspace control NUMA and whatnot.

[*] https://lore.kernel.org/all/ef48935e5e6f947f6f0c6d748232b14ef5d5ad70.1681176340.git.ackerleytng@google.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
