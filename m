Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490EAD2E9CC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDjCQ0r88KYzHC1e6oUeQfWXR7rbgsiaEbARNYGaZoc=; b=GHMd3uQsZpm4M0
	uO7oE87/MAeuoetl4N7KXUnnAmHx6BodEws+nPHP7D673AWrWZCPbVhXN6VMFHCBGdxOmyDPoJQOu
	aPDJK0CRucJnQV3fgXkJkrI66IBmgp1T6BCV4kBINtAugUaDWkywYcyQnHJjVDJkPxDbGRJEoBcIH
	ng1/4Sfu8r58UmCm2y+o7DtNUtDYLSgq6qT+Tzo+7IHUbALkqE6d3Qof3YrIgcTYEzKi0zlF0V+4Y
	nByt+2l6tAzP5xv1cTiMq8J5+8/ZAO+RaE9c67GCECreO6H9Owv8mx9hoqz2bBFshVlXK7mLUxup+
	3PKmR5ewtnLYRIFXBeyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQx1-0000000H9CF-3RlA;
	Mon, 11 Nov 2024 09:43:15 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQvk-0000000H8z5-0Duw
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 09:41:59 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 977841F38F;
	Mon, 11 Nov 2024 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731318112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UcW3XJ6RBr7sYPiVps5XbwDo8mGo2lps7pml0tEgRE8=;
	b=0J85s4Tb6TLfFK+PGfAYx5YGxHRgGuPs1mVdg1H59IkIetpYq98lSyZSHuB7NWwePVAYi+
	mvgNOvzVOLTHqLtqul0MMODopf7Uy9MBmDGp/qK6fFV2YnZw1d3IYcNFOB9fcsvlQTe13/
	PTug7oXAfejTqTG3ojrzvoWiQ6sV8uU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731318112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UcW3XJ6RBr7sYPiVps5XbwDo8mGo2lps7pml0tEgRE8=;
	b=HFqNBeb/niypMYyTBmrNfnFfbKMaqNxlpQgcimnxw1ZzyzBqMBoP4lzDR+dsaZHOo/d4KP
	k5Rb/k4FrHFj25Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731318112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UcW3XJ6RBr7sYPiVps5XbwDo8mGo2lps7pml0tEgRE8=;
	b=0J85s4Tb6TLfFK+PGfAYx5YGxHRgGuPs1mVdg1H59IkIetpYq98lSyZSHuB7NWwePVAYi+
	mvgNOvzVOLTHqLtqul0MMODopf7Uy9MBmDGp/qK6fFV2YnZw1d3IYcNFOB9fcsvlQTe13/
	PTug7oXAfejTqTG3ojrzvoWiQ6sV8uU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731318112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UcW3XJ6RBr7sYPiVps5XbwDo8mGo2lps7pml0tEgRE8=;
	b=HFqNBeb/niypMYyTBmrNfnFfbKMaqNxlpQgcimnxw1ZzyzBqMBoP4lzDR+dsaZHOo/d4KP
	k5Rb/k4FrHFj25Ag==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 3AF244A0564; Mon, 11 Nov 2024 10:41:52 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
  Charlie Jenkins <charlie@rivosinc.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Andrea Parri <parri.andrea@gmail.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: add forwarding header for
 arch/riscv/include/asm/fence.h
In-Reply-To: <d380fd10-ebc4-4d66-becb-13995372d41a@ghiti.fr> (Alexandre
	Ghiti's message of "Mon, 4 Nov 2024 11:02:14 +0100")
References: <mvm5xq44bqh.fsf@suse.de>
	<d380fd10-ebc4-4d66-becb-13995372d41a@ghiti.fr>
X-Yow: I think my CAREER is RUINED!!
Date: Mon, 11 Nov 2024 10:41:52 +0100
Message-ID: <mvmfrnyxg2n.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.70 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,rivosinc.com,sifive.com,dabbelt.com,eecs.berkeley.edu,gmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014156_266206_4C4E940D 
X-CRM114-Status: UNSURE (   8.19  )
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

On Nov 04 2024, Alexandre Ghiti wrote:

> Unless you have any objection, we'll try to make Bjorn's patch into
> 6.12-rc7 instead of yours.

It still fails the same:

In file included from /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/tools/include/asm/barrier.h:12,
                 from /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/tools/include/linux/ring_buffer.h:4,
                 from libbpf.c:37:
/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/tools/include/asm/../../arch/riscv/include/asm/barrier.h:13:10: fatal error: asm/fence.h: No such file or directory
   13 | #include <asm/fence.h>
      |          ^~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/tools/build/Makefile.build:106: /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [Makefile:164: /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2
make[3]: *** [Makefile:63: /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/linux-obj/tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
make[2]: *** [Makefile:76: bpf/resolve_btfids] Error 2
make[1]: *** [/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/Makefile:1393: tools/bpf/resolve_btfids] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [../Makefile:224: __sub-make] Error 2

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
