Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08B5CA0FEC
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 21:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJQ5MZm4fbepM7X0aHj8Y0Ikro065oBUPYxrahx4Da4=; b=xh8t3bQdws9NgC
	DjBcEhc5sasxWFTWOqNqsZCERpsm4nvQPnEMdfAAxcFCDNO72xujPNQpgdl6tji8NQ/aoTApEaSWU
	DSf5iyxI46MlCwEWD8mA79IEzg7UpW3esIGa/auINd4e1DKBiVQxzBFzC5a9+vieepUb5QzeJIMW/
	m4rpvOUO8NM09BfvaudhjAb/xnPPScKJZeeUlYeih7fis4tISfTXzAPdLrnEq4YlZ8nJHH5VsUWTv
	nMzqUxK7XmYJUhV6RUKgDOyF6XpbHE8APe2wG4p72/Staip+x8K8U7bUTY2W/G8Sv5qgEe5Kg3jdJ
	j9yHFVtxD5QISHNoo/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcBLL-000OXl-0n;
	Fri, 01 Sep 2023 21:06:15 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcBLF-000OW5-38;
	Fri, 01 Sep 2023 21:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693602369; x=1725138369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XHxocslFLQU8xD6gE26XwrfQlSg9WQxfvtoRwUmoXd4=;
  b=cy846qCJjJZvvdxrpE3UYOOJZsTYxM/7k+BGkKMoytmDreWw5mZ/V42Z
   7ojXGFjo6jQ5C32RRnPlkeQNiJhZCJoiPbTul+lpr34gNEBPTHLcGc6xm
   0GTsFNVshQHvs5qfhKRWD4MN2tBUyIAJz4Te256IO7kXWth8QMZxYJEZ4
   yZ01X0dOG6Yd7IqwX3txCZuazzJ0JIeOGv1ca28cCQ7AdyLakznzxFkSX
   ds8Pd+J2VGDNLDb+hYuNniEbAsp9tkiksmCWuey58lUdoBVKSIsrZYKBm
   Lko2b3UxhaaplttS35kQXSDqmjMROWcPH1Gczs4LQLXwPA9wkCEVZ2pkW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379031044"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="379031044"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 14:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070871974"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="1070871974"
Received: from jroorda-mobl4.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.32.118])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 14:05:58 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 94702104994; Sat,  2 Sep 2023 00:05:55 +0300 (+03)
Date: Sat, 2 Sep 2023 00:05:55 +0300
From: kirill.shutemov@linux.intel.com
To: Vlastimil Babka <vbabka@suse.cz>
Cc: seanjc@google.com, ackerleytng@google.com, akpm@linux-foundation.org,
	anup@brainfault.org, aou@eecs.berkeley.edu,
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org,
	david@redhat.com, isaku.yamahata@gmail.com, jarkko@kernel.org,
	jmorris@namei.org, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	liam.merwick@oracle.com, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, mail@maciej.szmigiero.name,
	maz@kernel.org, michael.roth@amd.com, mpe@ellerman.id.au,
	oliver.upton@linux.dev, palmer@dabbelt.com,
	paul.walmsley@sifive.com, paul@paul-moore.com, pbonzini@redhat.com,
	qperret@google.com, serge@hallyn.com, tabba@google.com,
	vannapurve@google.com, wei.w.wang@intel.com, willy@infradead.org,
	yu.c.zhang@linux.intel.com
Subject: Re: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
Message-ID: <20230901210555.j5d5a4azmkxzlnn2@box.shutemov.name>
References: <20230901082025.20548-2-vbabka@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230901082025.20548-2-vbabka@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_140610_059085_90D7EA4D 
X-CRM114-Status: GOOD (  11.86  )
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

On Fri, Sep 01, 2023 at 10:20:26AM +0200, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable - it is the
> case for guest memfd folios.
> 
> Also incorporate comment update suggested by Matthew.
> 
> Fixes: 3424873596ce ("mm: Add AS_UNMOVABLE to mark mapping as completely unmovable")
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Superficially looks good to me. But I don't really understand this
code path to Ack.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
