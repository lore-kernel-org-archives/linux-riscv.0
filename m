Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2FD606A327
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yyLuVsQe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=dhj3qKPr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t0kR0sE58KOTVCAg6UFdFp8d45eyYuL0L71v3lDkcKw=; b=yyLuVsQeFNzfrddFhAr68v4eQz
	3XFCCFoJ7Evg4kjZX9ffr5uq/X2ZLXrrio3LlN1gKLqoK0AdCpRb7hC7av2WDg0EASfSiReXj1TtO
	VZTpD41h51jJTdDi5I8hFf/cR4R4U0okkomAu9ZltL+7/NQ4KE8UrxB0w8LiijpMkZOsMaP1ieHxj
	VdHOGPhmCuj97qXG3FYFbkfk43dZDGG2MeCprqhNDByahUF9I8lBs355ev48Wk4xtG3chVt+OGoyR
	+8r+n1Y56wLYqaqBDN88lywxEDpXMPzTEbhdrVQehb7DItnd5c4llWSrmKgpPpQvvpk9sW1qlBQMO
	t4C6Dffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHdt-0000000AzWY-0dav;
	Wed, 25 Nov 2026 18:22:53 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHdn-0000000AzT2-2iTW;
	Wed, 25 Nov 2026 18:22:51 +0000
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id C90DE120F71;
	Wed, 25 Nov 2026 18:22:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 2158E20028;
	Wed, 25 Nov 2026 18:22:27 +0000 (UTC)
Date: Wed, 25 Nov 2026 13:22:25 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Ian Rogers" <irogers@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <jpoimboe@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <tglx@kernel.org>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
 <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>, <acme@kernel.org>,
 <namhyung@kernel.org>, <linux-perf-users@vger.kernel.org>,
 <mhiramat@kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <bpf@vger.kernel.org>, <nathan@kernel.org>,
 <llvm@lists.linux.dev>, <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>, <ardb@kernel.org>,
 <linux-efi@vger.kernel.org>, <maz@kernel.org>, <oupton@kernel.org>,
 <kvmarm@lists.linux.dev>, <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <indu.bhagat@oracle.com>,
 <jremus@linux.ibm.com>, <wnliu@google.com>, <dylanbhatch@google.com>
Subject: Re: [RFC PATCH v2 00/30] unwind: Minimal DWARF CFI unwinding for
 user and kernel space
Message-ID: <20261125132225.00254c37@gandalf.local.home>
In-Reply-To: <DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
References: <20261125061523.1540234-1-irogers@google.com>
	<DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 2158E20028
X-Stat-Signature: bmxmyx7zbff3tj5wzgboeoe9y8ngdg7c
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=4.0.1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Cm47ggEMe5tkUQwuPIv9j4yoOc3+2FwI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=6qR++cFUSbUPUEmO+yBbsbTsqe4WGzx7vfqPrLzKD+Y=; b=dhj3qKPrnd5Ol5oStgJ72xjormeA1wf1DO/RZc9kjGarZplof6LxOCEYEKKVU+6U05bo+jnrn30dh3AQ2S2utOXzBrNDvJP6ChCp0OiNHXA0Mz5Qca51KujLnC0+gny5rgFtqYDHuEEGrRoB4ayAc52wJ7NqKJRyFXoq+87Y6Bg=
X-HE-Tag: 1795630947-362156
X-HE-Meta: U2FsdGVkX18ShW9pI+/3LezhiP+sfLyAz5bbFmDR0Cg79ArNrSxS4kGp2fzzjf2A8iMOExZ79Wjpfg5dnD2BuvcnWnPjmIUJbGqbBkLfSiaYUFYSqR7ZAyP5O5UzEvRDCN589rXn1aP6/jRut7zfB+DDsEhPmN5DqCQvkQ7ZfZK1DiZPYS6+dvk+POli+n6GtTpGQ+j2vtl3LmQVHr+SzbA0nhYCBgifjijh6DwBsiIDVGFv0Nn3Ybo7aD+vHLlpczM4CVbNSwTPAeoiNfZ1pIRQfuRQQygtba8VmRY7xWxfdUk9RhDQhUICoUNpPyMEpj3E7lFTHILx587J1If+CzVdP12M+SkIwx9akUq8SAeuSlUzaZ2IKhNYhFH5nvIw0f5ED6Ry586F6FXLp5r+/Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_102250_332124_CACD97CC 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 16:28:02 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> A quick question: how do you plan to get this working on 32-bit ARM which has
> its own EHABI?

Do we care? Isn't ARM 32 mostly deprecated at this moment? Or at least not
adding new features.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
