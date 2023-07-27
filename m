Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA382C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 03:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8pT8+EmEBcM+MPvUQHZUhQYmyZWrDILKCOkDslOsqY=; b=r2nQVneW1fzCCu
	YOklHlkVgMLs8cWBN6/gXUE379yyaEE2kqWqH3xLa0/GTak4krasm1mrQisU+7VuqRGQToD/5djTY
	CkWreB7GV/ql7pWYUdmE3QX9dJJRDYqygwOXu6P3PLaIFJN+VncNezRSlovTc5ESnMN2/ydW6/srF
	2B+O4XhnR2/Bq7XYW+rSJy51+t4zBgS1ceICLphLpAj5Clr2AczB8nyzJDMKCPQYHpkN75b960MuV
	sFXlYXHt3DeaGyAZKMNHD8cojWVoklG9dCRzEn5G9jPMjyQuap+eMuCU1WxQJOeLFEHzQwvjwCKhg
	ZoEdo0CMtX73bbgzbidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrf9-00C12F-0K;
	Thu, 27 Jul 2023 03:27:39 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrf3-00C0zf-2k;
	Thu, 27 Jul 2023 03:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690428453; x=1721964453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zZw7shzyeqWcwUz/3pXk4wTr0ManqzTTZSighI1zgHU=;
  b=WPwS+60fmomx25jFTQlaB/m4bncJnKBaz+TbTq8WhmsD0pjQX+3yQxiF
   8CIzpXCoFqs98X0DV/8OLWh4FSLMwPG629QLo54GKej8re5SZZtorW0vv
   8k3+O/CZocEjvNjJ0Eq81Ixg/2gyJfXJtxMwIwk7AldDkFQiySp9Ka/QN
   lasFpm0IYI/RdAYKHsqYo4Vr3p5bNHGkoR/wWs+yacr1QMuwMNPU7tHew
   h6EBLkhi5TY+Fvp3HeAuoMIiSHVsoZmM3gL8uhTFLVH46UzLczvXaCRhE
   bgHwoz/ANL6T/Go8oWlxZAqcL+KrLEeUphVt0afxECs44X0A283mdqEEU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347799008"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="347799008"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 20:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870179046"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2023 20:26:15 -0700
Date: Thu, 27 Jul 2023 11:24:22 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
Message-ID: <ZMHjZvcmzxMhTyM3@yilunxu-OptiPlex-7050>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-9-seanjc@google.com>
 <ZL4BiQWihfrD0TOJ@yilunxu-OptiPlex-7050>
 <ZMFC+V6Llv1JWLEt@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMFC+V6Llv1JWLEt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_202733_919025_F9FDF58D 
X-CRM114-Status: GOOD (  12.63  )
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

On 2023-07-26 at 08:59:53 -0700, Sean Christopherson wrote:
> On Mon, Jul 24, 2023, Xu Yilun wrote:
> > On 2023-07-18 at 16:44:51 -0700, Sean Christopherson wrote:
> > > +	if (WARN_ON_ONCE(start == end))
> > > +		return -EINVAL;
> > 
> > Also, is this check possible to be hit? Maybe remove it?
> 
> It should be impossible to, hence the WARN.  I added the check for two reasons:
> (1) to help document that end is exclusive, and (2) to guard against future bugs.

Understood. I'm good to it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
