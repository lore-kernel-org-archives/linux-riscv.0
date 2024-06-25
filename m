Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A82C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q821mp3PyLam7EcFZYJM6yK/EEmmPTXFpt/nRDadj2s=; b=4Q+UcDqNBWGwBe
	0kpZEZuJ9uddK14ag3E00VoGBF6cD2hnREBosq3Xg0BQjbeLugz2D1Znv3HbcjqIr+zEHgZR84U30
	lDMgSRqSpJJmClX3k6+PvFGzaLRsCnq+8905PGUntghdN0FlbkczOAS8zv+x3Xfxx/PKJ6yOs8GWe
	ogz/9X8g1v7DFGWZATmOv8Hf4dFAVD86PkhtsD29v5rn+KoL+GvGLYdms36VHQDI99X2u9X+7tkiH
	erYg/dTkbbLikPYVJcFL867DZbFMKFZvXf09cBJEZG9chLxcOuSMwGoaY1ceZERtyvQNY28bnQnZk
	HkJ4i1HSx00GLDVDp47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMD9d-00000004SVg-077l;
	Tue, 25 Jun 2024 20:52:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMD9Z-00000004SUD-1QxQ
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 20:52:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B758861781;
	Tue, 25 Jun 2024 20:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A63C4AF09;
	Tue, 25 Jun 2024 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719348756;
	bh=7Vk/57j6HQa3g+1KrpUCkV83IiE+PdNNhcP691viN4I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NSSPCt8y2S5moueuEEc+dT5eo/rJUoj3q1bkCikGiaZe0hzc4gOah0daI3hojxLPh
	 gHbUYh9kPT3G4MouuG+kVN2ljW30ihFCb0/XLTi7XEMAaIk4F9r9/YlDwr7DPl0SVc
	 oggO9jAJc7w3KLrFOQsqDeT7HG/dpL00Gh9d0ct0=
Date: Tue, 25 Jun 2024 13:52:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Edward Liaw <edliaw@google.com>
Cc: linux-kselftest@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, =?ISO-8859-1?Q?"Andr=E9_Almeida"?=
 <andrealmeid@igalia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian
 <kevin.tian@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 usama.anjum@collabora.com, seanjc@google.com, kernel-team@android.com,
 linux-mm@kvack.org, iommu@lists.linux.dev, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sgx@vger.kernel.org
Subject: Re: [PATCH v6 00/13] Centralize _GNU_SOURCE definition into lib.mk
Message-Id: <20240625135234.d52ef77c0d84cb19d37dc44f@linux-foundation.org>
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_135237_454287_BDE9A774 
X-CRM114-Status: GOOD (  11.01  )
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

On Mon, 24 Jun 2024 23:26:09 +0000 Edward Liaw <edliaw@google.com> wrote:

> Centralizes the definition of _GNU_SOURCE into lib.mk and addresses all
> resulting macro redefinition warnings.
> 
> These patches will need to be merged in one shot to avoid redefinition
> warnings.

Yes, please do this as a single patch and resend?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
