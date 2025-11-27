Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3144CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFedSEezf9iMka4escSUmHOLQX0WslaXGSi6zxGF4g8=; b=Pr6yPRa1i3FCd5
	6OSTumiG6zKz/dHevSMaN3Oxf/fgJO4L+CLDVJZcEey9WiFOke7eMug7zI2UaVQCVm66f2NKKra4v
	XpAGin8xLX2oMS2vgrC5Y5qqoFzGl8VP2PaPmtCcHhv6NKvdJMC48ff19cVwnsOxZKa4+TrVH9JiC
	EEHXeBwujSStqDq/nPsNPlspvP31hWUMIzQTvimwaPXSgT7E2mmJWsmxf5aFw10Mf7Hz3hbmf8eha
	+gl2rQpI4/JPGIaGy1oCaGjhLIFchogxCaWih1Uhxj7ftXeANZBdh9DlQf9mEJNJwapa02BG6DB6x
	t2Nri6zf7r5naXCv4F+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZcS-0000000GP8z-46PC;
	Thu, 27 Nov 2025 10:53:01 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZcQ-0000000GP8I-0RqX
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 10:52:59 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7B48433693;
	Thu, 27 Nov 2025 10:52:54 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0C7F3EA63;
	Thu, 27 Nov 2025 10:52:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xrDGJ4ItKGlFNgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 27 Nov 2025 10:52:50 +0000
Date: Thu, 27 Nov 2025 10:52:49 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Oven Liyang <liyangouwen1@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Matthew Wilcox <willy@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ada Couprie Diaz <ada.coupriediaz@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <v-songbaohua@oppo.com>
Subject: Re: [RFC PATCH 1/2] mm/filemap: Retry fault by VMA lock if the lock
 was released for I/O
Message-ID: <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
References: <20251127011438.6918-1-21cnbao@gmail.com>
 <20251127011438.6918-2-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251127011438.6918-2-21cnbao@gmail.com>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 7B48433693
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_025258_351154_364D883E 
X-CRM114-Status: GOOD (  22.35  )
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

On Thu, Nov 27, 2025 at 09:14:37AM +0800, Barry Song wrote:
> From: Oven Liyang <liyangouwen1@oppo.com>
> 
> If the current page fault is using the per-VMA lock, and we only released
> the lock to wait for I/O completion (e.g., using folio_lock()), then when
> the fault is retried after the I/O completes, it should still qualify for
> the per-VMA-lock path.
> 
<snip>
> Signed-off-by: Oven Liyang <liyangouwen1@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  arch/arm/mm/fault.c       | 5 +++++
>  arch/arm64/mm/fault.c     | 5 +++++
>  arch/loongarch/mm/fault.c | 4 ++++
>  arch/powerpc/mm/fault.c   | 5 ++++-
>  arch/riscv/mm/fault.c     | 4 ++++
>  arch/s390/mm/fault.c      | 4 ++++
>  arch/x86/mm/fault.c       | 4 ++++

If only we could unify all these paths :(

>  include/linux/mm_types.h  | 9 +++++----
>  mm/filemap.c              | 5 ++++-
>  9 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index b71625378ce3..12b2d65ef1b9 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1670,10 +1670,11 @@ enum vm_fault_reason {
>  	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
>  	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
>  	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
> -	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
> -	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
> -	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
> -	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
> +	VM_FAULT_RETRY_VMA      = (__force vm_fault_t)0x000800,

So, what I am wondering here is why we need one more fault flag versus
just blindly doing this on a plain-old RETRY. Is there any particular
reason why? I can't think of one. 

I would also like to see performance numbers.

The rest of the patch looks OK to me.

-- 
Pedro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
