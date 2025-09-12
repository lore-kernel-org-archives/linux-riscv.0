Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2FCCAC58F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNEXoYUvNaNFBjVTom/HnQMFjmtZKnsANyhEOn9Don4=; b=zrEfAmMYpSf+iC
	EAHJXRaeOADtQlYsC/xpY8jtN0H3DBzlUZPXX9VyyqONG8IO3a2jLDryFjKc7zWm9p5gCLNhxt28t
	Zkodvlu1xBWuWhfm1q346rMRBorC7a6Xqe5FTkjaiuCZMT5sOMvvLyLBbJWJk7s5DsF9ypqMET/P8
	I3vubXkLtPdKQYLsyeuNBOPNJ9Tv111VcVtxuAdvciju+hk+Jssj9T/kyMRW/ykBOVpvGZb0+P158
	G+UagcFl+EjUnNf0bA2N9/hIs1FLOCsJcGPtNbwB69qGJGWLgvWUpixrxc0mzjo1ynqN/7Ts3Qyt+
	6VKdTSVleY9TnFsnjyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1KY-00000008gHE-159D;
	Fri, 12 Sep 2025 10:48:38 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1KV-00000008gDV-02y8
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 10:48:37 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A1A220760;
	Fri, 12 Sep 2025 10:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757674110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWphaHK8OZGZX1V68Y5uJkPgW2mcaEuIYhBomIwfjhY=;
	b=pIhrbsz6PFEg2rsKfYIDk9LSisUudy3RRRF+vPTEdTVNBEc/IYjMGMRlHJPMd81a3PeAPQ
	enViOBHkrPb/ixVfVxnLyPU7+6VjTklFYkyeXlsUfBRq5C+jV7UXdmEmLyAdx4Q3d4ezXR
	1O/cIWn77hOKnup2fdLIdwqygTz6oOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757674110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWphaHK8OZGZX1V68Y5uJkPgW2mcaEuIYhBomIwfjhY=;
	b=3KzBQV3sfhI2xmW0tXlMKSTmNI2mUbzMU7tkf31yqUEPagskAIo4a6mTeoFEttV9DasuS1
	kLhxxYyMXH7/23Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757674110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWphaHK8OZGZX1V68Y5uJkPgW2mcaEuIYhBomIwfjhY=;
	b=pIhrbsz6PFEg2rsKfYIDk9LSisUudy3RRRF+vPTEdTVNBEc/IYjMGMRlHJPMd81a3PeAPQ
	enViOBHkrPb/ixVfVxnLyPU7+6VjTklFYkyeXlsUfBRq5C+jV7UXdmEmLyAdx4Q3d4ezXR
	1O/cIWn77hOKnup2fdLIdwqygTz6oOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757674110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWphaHK8OZGZX1V68Y5uJkPgW2mcaEuIYhBomIwfjhY=;
	b=3KzBQV3sfhI2xmW0tXlMKSTmNI2mUbzMU7tkf31yqUEPagskAIo4a6mTeoFEttV9DasuS1
	kLhxxYyMXH7/23Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C11E13869;
	Fri, 12 Sep 2025 10:48:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RcKSHnn6w2gcWwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 12 Sep 2025 10:48:25 +0000
Date: Fri, 12 Sep 2025 11:48:15 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Roy, Patrick" <roypat@amazon.co.uk>
Subject: Re: [PATCH v6 01/11] filemap: Pass address_space mapping to
 ->free_folio()
Message-ID: <2w22wsqar437lyp3w4bltyoql4ksn3exppkyaia5ogtnt2ttte@6nptj6ed4qnm>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
 <20250912091708.17502-2-roypat@amazon.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250912091708.17502-2-roypat@amazon.co.uk>
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amazon.co.uk,quicinc.com,infradead.org,lwn.net,redhat.com,kernel.org,linux.dev,arm.com,huawei.com,xen0n.name,sifive.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.ibm.com,linux.intel.com,linutronix.de,alien8.de,zytor.com,omnibond.com,zeniv.linux.org.uk,suse.cz,linux-foundation.org,oracle.com,google.com,suse.com,iogearbox.net,gmail.com,fomichev.me,ziepe.ca,nvidia.com,cmpxchg.org,bytedance.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.orangefs.org,kvack.org];
	R_RATELIMIT(0.00)[to_ip_from(RL1bpf5rdkmpo98mj6oa9xanz3)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_GT_50(0.00)[89];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazon.co.uk:email,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_034835_347262_B80F45E6 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "surenb@google.com" <surenb@google.com>, "brauner@kernel.org" <brauner@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "trondmy@kernel.org" <trondmy@kernel.org>, "martin@omnibond.com" <martin@omnibond.com>, "david@redhat.com" <david@redhat.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "song@kernel.org" <song@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "shuah@kernel.org" <shuah@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "andrii@kernel.org" <andrii@kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Thomson, Jack" <jackabt@amazon.co.uk>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "haoluo@google.com" <haoluo@google.com>, "seanjc@google.com" <seanjc@google.com>, "anna@kernel.org" <anna@kernel.org>, "ast@kernel.org" <ast@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "willy@infradead.org" <willy@infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "mhocko@suse.com" <mhocko@suse.com>, "jack@suse.cz" <jack@suse.cz>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "yuanchu@google.com" <yuanchu@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "mingo@redhat.com" <mingo@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "jannh@google.com" <jannh@google.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "weixugc@google.com" <weixugc@google.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 12, 2025 at 09:17:31AM +0000, Roy, Patrick wrote:
> From: Elliot Berman <quic_eberman@quicinc.com>
> 
> When guest_memfd removes memory from the host kernel's direct map,
> direct map entries must be restored before the memory is freed again. To
> do so, ->free_folio() needs to know whether a gmem folio was direct map
> removed in the first place though. While possible to keep track of this
> information on each individual folio (e.g. via page flags), direct map
> removal is an all-or-nothing property of the entire guest_memfd, so it
> is less error prone to just check the flag stored in the gmem inode's
> private data.  However, by the time ->free_folio() is called,
> folio->mapping might be cleared. To still allow access to the address
> space from which the folio was just removed, pass it in as an additional
> argument to ->free_folio, as the mapping is well-known to all callers.
> 
> Link: https://lore.kernel.org/all/15f665b4-2d33-41ca-ac50-fafe24ade32f@redhat.com/
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> [patrick: rewrite shortlog for new usecase]
> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
