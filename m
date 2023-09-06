Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C33BEB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 11:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeEImGVgDoWHknMCTdyJMlfs8Y9+X+3+UJY5D6zeYeE=; b=BtqjwyRcvWlIC5
	1gia6jMuZoLMJ0V6DjQKiPLuhpKEiDfx1cAenClkENavaSGmKt7cu9FGb+R59dr+PGMEzjniPqH+j
	/tQmlNBKKS2LVWQhTmNAWmKKLpp5RJRIPmxFCvKPBZv20T7gEKVcsqPgV06thcTsyrk8r4gpt+dm1
	BuXrFwc0kN9mjQ9ekP/x5rEppUNAbr69twOdEQvz6CYyN6Z0YekIGSlUcDncjpMWO+R/Q2G/mtuCf
	yn4PfflcX+yf9V3gJnTa3zsOWDkUcsn+16T5I3caZTKg+z8+JLXzn8aJLg1lSWfdUmbvJ2vXaZJsD
	wdm7xsq8ALurceBkpfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqVl-008aOe-0v;
	Wed, 06 Sep 2023 11:15:53 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdnTE-007c03-20;
	Wed, 06 Sep 2023 08:01:08 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9201222407;
	Wed,  6 Sep 2023 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1693987258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Th6i3Ci6XMV5czHwHHRQpy4WXZpYK1vSc4mKPzvASOU=;
	b=Pb4lNhvGotAuMduqcxpX1veGfBW2fSsxbs9Pu7MCDvZuKYqbhIBY10E+hTUliKOLBUS8xT
	IScFwkZq92rxWtvku6iqGuFuVgR5lDAVbkoOihu7XH0KTBnfaYqyy4A7lldnkADZSSK6sy
	waSNnkdND+zVot6yoT1DyeMpgGyp2zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1693987258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Th6i3Ci6XMV5czHwHHRQpy4WXZpYK1vSc4mKPzvASOU=;
	b=8aX8Ngai6ZtyQlD2914oRoaCD9456/pp3O+p6YtiEHc05I1uh8Iu/T2mBUnSMDxI5k/fIo
	p/VLTw2WkzUAHvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8ACD11346C;
	Wed,  6 Sep 2023 08:00:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2QG0ILkx+GRiVwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Wed, 06 Sep 2023 08:00:57 +0000
Message-ID: <bcefb739-b45c-8349-8010-ac137ab61c29@suse.cz>
Date: Wed, 6 Sep 2023 10:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
To: Sean Christopherson <seanjc@google.com>
Cc: ackerleytng@google.com, akpm@linux-foundation.org, anup@brainfault.org,
 aou@eecs.berkeley.edu, chao.p.peng@linux.intel.com, chenhuacai@kernel.org,
 david@redhat.com, isaku.yamahata@gmail.com, jarkko@kernel.org,
 jmorris@namei.org, kirill.shutemov@linux.intel.com,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 liam.merwick@oracle.com, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mail@maciej.szmigiero.name, maz@kernel.org,
 michael.roth@amd.com, mpe@ellerman.id.au, oliver.upton@linux.dev,
 palmer@dabbelt.com, paul.walmsley@sifive.com, paul@paul-moore.com,
 pbonzini@redhat.com, qperret@google.com, serge@hallyn.com, tabba@google.com,
 vannapurve@google.com, wei.w.wang@intel.com, willy@infradead.org,
 yu.c.zhang@linux.intel.com
References: <20230901082025.20548-2-vbabka@suse.cz>
 <ZPfAL0D95AwXD9tg@google.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <ZPfAL0D95AwXD9tg@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_010104_806262_51060BE7 
X-CRM114-Status: UNSURE (   9.71  )
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

On 9/6/23 01:56, Sean Christopherson wrote:
> On Fri, Sep 01, 2023, Vlastimil Babka wrote:
>> As Kirill pointed out, mapping can be removed under us due to
>> truncation. Test it under folio lock as already done for the async
>> compaction / dirty folio case. To prevent locking every folio with
>> mapping to do the test, do it only for unevictable folios, as we can
>> expect the unmovable mapping folios are also unevictable - it is the
>> case for guest memfd folios.
> 
> Rather than expect/assume that unmovable mappings are always unevictable, how about
> requiring that?  E.g. either through a VM_WARN_ON in mapping_set_unmovable(), or by
> simply having that helper forcefully set AS_UNEVICTABLE as well.

Yeah I guess we could make the helper do that, with a comment, as gmem is
the only user right now. And if in the future somebody has case where it
makes sense to have unmovable without unevictable, we can discuss what to do
about it then.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
