Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A90CAC5B8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ete9QfDle/b5iwg2h++IcgM30BJ1Q/LxGDDnRzu4+Fo=; b=GhjTXM1W0DOFPk
	Ky95kdLuBsEWgcHsWo3PZJu2SKnOtbJC7bYuq15iRcu5eBROIGdfyLn5UXTgLdJn+1Ka3qUY0fidb
	jLlk1LJhMnKADgykrk3kzin+vbp9edGTwYyK7zdsheMKRKBQ1OVC9bi+BImxHWXyLUE/yQFSN4HQc
	hEHHaCQdkZltnCrP4hUppYeVHwSq2j6a5BLUeUc/X7qjLzTeiV3k4esAUvueah3KlscwFyWUfvTDe
	zMvLuXjxkQ79DjnAZ0yNd7aTmapNPodgwe78o5ZrD6RQ9RZ+T5Rk7o7jWuKOIyUUpY7n1kkpv67a5
	rte0YzjuX3Gkhlo2mERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EAL-00000003xwZ-3Mvi;
	Fri, 26 Sep 2025 19:31:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EAH-00000003xte-3u2r
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 19:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758915092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qJkwxIyAJhe7Z2sYVZyMCylwQN+VGhF0dp+d12hJfX4=;
	b=iDW4J16G8YcHzOEpMct16z61O7dTNg9dOXwte4ELDjogEon4JcYp1NtfWnw6BYFguJeJlh
	+giT75B7bfMdT9/xYOdHmaW7+zXDN/xmbxd52a7t9efljI2X49A5zJqaiMVxWmaC3zOqb+
	KhzhYoKSuAMw5WqEE4UcrEWB11ALkSU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-281-OaejFLB4NsC5vBb4BATwog-1; Fri,
 26 Sep 2025 15:29:53 -0400
X-MC-Unique: OaejFLB4NsC5vBb4BATwog-1
X-Mimecast-MFC-AGG-ID: OaejFLB4NsC5vBb4BATwog_1758914988
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EAFCA1800365;
	Fri, 26 Sep 2025 19:29:45 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.22.90.77])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 572901800115;
	Fri, 26 Sep 2025 19:29:34 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: pjw@kernel.org
Cc: Liam.Howlett@oracle.com,
	a.hindborg@kernel.org,
	akpm@linux-foundation.org,
	alex.gaynor@gmail.com,
	alexghiti@rivosinc.com,
	aliceryhl@google.com,
	alistair.francis@wdc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	atishp@rivosinc.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	bp@alien8.de,
	brauner@kernel.org,
	broonie@kernel.org,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	conor@kernel.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@redhat.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	ebiederm@xmission.com,
	evan@rivosinc.com,
	gary@garyguo.net,
	hpa@zytor.com,
	jannh@google.com,
	jim.shu@sifive.com,
	kees@kernel.org,
	kito.cheng@sifive.com,
	krzk+dt@kernel.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	lossin@kernel.org,
	mingo@redhat.com,
	ojeda@kernel.org,
	oleg@redhat.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	peterz@infradead.org,
	richard.henderson@linaro.org,
	rick.p.edgecombe@intel.com,
	robh@kernel.org,
	rust-for-linux@vger.kernel.org,
	samitolvanen@google.com,
	shuah@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu,
	vbabka@suse.cz,
	x86@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Date: Fri, 26 Sep 2025 15:29:19 -0400
Message-ID: <20250926192919.349578-1-cmirabil@redhat.com>
In-Reply-To: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
References: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_123134_087642_9113CF53 
X-CRM114-Status: GOOD (  27.49  )
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

Hi - 

Hoping that I got everything right with git-send-email so that this is
delivered alright...

Wanted to jump in to head off a potential talking past one another / 
miscommunication situation I see here.

On Wed, Sep 24, 2025 at 08:36:11AM -0600, Paul Walmsley wrote:
> Hi,
> 
> On Thu, 31 Jul 2025, Deepak Gupta wrote:
> 
> [ ... ]
> 
> > vDSO related Opens (in the flux)
> > =================================
> > 
> > I am listing these opens for laying out plan and what to expect in future
> > patch sets. And of course for the sake of discussion.
> > 
> 
> [ ... ]
> 
> > How many vDSOs
> > ---------------
> > Shadow stack instructions are carved out of zimop (may be operations) and if CPU
> > doesn't implement zimop, they're illegal instructions. Kernel could be running on
> > a CPU which may or may not implement zimop. And thus kernel will have to carry 2
> > different vDSOs and expose the appropriate one depending on whether CPU implements
> > zimop or not.
> 
> If we merge this series without this, then when CFI is enabled in the 
> Kconfig, we'll wind up with a non-portable kernel that won't run on older 
> hardware.  We go to great lengths to enable kernel binary portability 
> across the presence or absence of other RISC-V extensions, and I think 
> these CFI extensions should be no different.

That is not true, this series does not contain the VDSO changes so it can
be merged as is.

> 
> So before considering this for merging, I'd like to see at least an 
> attempt to implement the dual-vDSO approach (or something equivalent) 
> where the same kernel binary with CFI enabled can run on both pre-Zimop 
> and post-Zimop hardware, with the existing userspaces that are common 
> today.

I agree that when the VDSO patches are submitted for inclusion they should
be written in a way that avoids limiting the entire kernel to either
pre-Zimop or post-Zimop hardware based on the config, but I think it
should be quite possible to perform e.g. runtime patching of the VDSO
to replace the Zimop instructions with nops if the config is enabled but
the hardware does not support Zimop.

However, that concern should not hold up this patch series. Raise it again
when the VDSO patches are posted.

> 
> thanks Deepak,
> 
> - Paul

Best - Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
