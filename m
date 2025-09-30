Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381B3CCA470
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 11:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYXRJKx0Hp6ndaYezWlfjwryHIBjdBNs5yEpPqf6mzE=; b=OpowcqHtXEJ85e
	bhBgGOBS31pP5J0b8Wgcc0i7vwRuhd26ijoUPy2ViGYMkoSVh7RORIm+yMQT8WlYZIcqwt+oEjDaJ
	PjGLfwnWoACbAni6FGOEv9wJdRyXgfeDpma2pSkaJeiORv+NOhYrS6bCUmP6aXtvd/z9OBLVrNWJC
	KQJyRsw5bjqJ/f60lNh7TBKl3oKIbxaTnImmujbt2yhod6GaDCJZ3eh5RWzRJ4azw0wjAJSHJrx/9
	5D9wz3jcGIpqbHO1tiCPsAn/rqGhD0XNypKNnAESxBBr693JxKoUHEiUGV+tyd7VOvrqJUQG01S7h
	HWZi5m5AAH+SVjT7q23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YL2-000000057Ei-372u;
	Tue, 30 Sep 2025 11:16:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YKz-000000057Do-3CYJ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 11:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759230964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEOnnvfg2VP9jFylWLMcLAcGpm2F4oh7aBv+d9st9Ec=;
	b=DvoR1Cy/j7btiKHjzLRtPLx6mKmgh5Rfys2qjl0AaWbY5hqmUJDQgl41vrEJ/SNgYkhnXW
	vXZn/gR7wFGHbincknJFFM3E3Nm/gk+QaRqUVmgrjGpjAEklq/73j0ZLjP2zIlDb/GRqpF
	TSjayJe96gR5iGxEjaiEfIlEn4rIkec=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-355-rJUdj_0aOK-QG4zQjk5sLg-1; Tue,
 30 Sep 2025 07:16:02 -0400
X-MC-Unique: rJUdj_0aOK-QG4zQjk5sLg-1
X-Mimecast-MFC-AGG-ID: rJUdj_0aOK-QG4zQjk5sLg_1759230956
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EDB9195609E;
	Tue, 30 Sep 2025 11:15:55 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.33.56])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 018161800447;
	Tue, 30 Sep 2025 11:15:34 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>,  Thomas Gleixner <tglx@linutronix.de>,
  Ingo Molnar <mingo@redhat.com>,  Borislav Petkov <bp@alien8.de>,  Dave
 Hansen <dave.hansen@linux.intel.com>,  x86@kernel.org,  "H. Peter Anvin"
 <hpa@zytor.com>,  Andrew Morton <akpm@linux-foundation.org>,  "Liam R.
 Howlett" <Liam.Howlett@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,
  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Conor Dooley <conor@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Christian Brauner <brauner@kernel.org>,  Peter
 Zijlstra <peterz@infradead.org>,  Oleg Nesterov <oleg@redhat.com>,  Eric
 Biederman <ebiederm@xmission.com>,  Kees Cook <kees@kernel.org>,  Jonathan
 Corbet <corbet@lwn.net>,  Shuah Khan <shuah@kernel.org>,  Jann Horn
 <jannh@google.com>,  Conor Dooley <conor+dt@kernel.org>,  Miguel Ojeda
 <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
 <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Benno Lossin <lossin@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-fsdevel@vger.kernel.org,  linux-mm@kvack.org,
  linux-riscv@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arch@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  alistair.francis@wdc.com,
  richard.henderson@linaro.org,  jim.shu@sifive.com,  Andy Chiu
 <andybnac@gmail.com>,  kito.cheng@sifive.com,  charlie@rivosinc.com,
  atishp@rivosinc.com,  evan@rivosinc.com,  cleger@rivosinc.com,
  alexghiti@rivosinc.com,  samitolvanen@google.com,  broonie@kernel.org,
  rick.p.edgecombe@intel.com,  rust-for-linux@vger.kernel.org,  Zong Li
 <zong.li@sifive.com>,  David Hildenbrand <david@redhat.com>,  Heinrich
 Schuchardt <heinrich.schuchardt@canonical.com>,  bharrington@redhat.com,
  Aurelien Jarno <aurel32@debian.org>, bergner@tenstorrent.com,
 jeffreyalaw@gmail.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
In-Reply-To: <aNQ7D6_ZYMhCdkmL@debug.ba.rivosinc.com> (Deepak Gupta's message
	of "Wed, 24 Sep 2025 11:40:15 -0700")
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
	<f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
	<aNQ7D6_ZYMhCdkmL@debug.ba.rivosinc.com>
Date: Tue, 30 Sep 2025 13:15:32 +0200
Message-ID: <lhuldlwgpij.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mr9QuRuo4g6ZOI11MBeXCqtBMVXXCpwd-s-gRIYICC0_1759230956
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_041605_868133_AF36122F 
X-CRM114-Status: GOOD (  19.17  )
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

* Deepak Gupta:

> Any distro who is shipping userspace (which all of them are) along
> with kernel will not be shipping two different userspaces (one with
> shadow stack and one without them). If distro are shipping two
> different userspaces, then they might as well ship two different
> kernels. Tagging some distro folks here to get their take on shipping
> different userspace depending on whether hardware is RVA23 or
> not. @Heinrich, @Florian, @redbeard and @Aurelien.
>
> Major distro's have already drawn a distinction here that they will drop
> support for hardware which isn't RVA23 for the sake of keeping binary
> distribution simple.

The following are just my personal thoughts.

For commercial distributions, I just don't see how things work out if
you have hardware that costs less than (say) $30 over its lifetime, and
you want LTS support for 10+ years.  The existing distribution business
models aren't really compatible with such low per-node costs.  So it
makes absolute sense for distributions to target more powerful cores,
and therefore require RVA23.  Nobody is suggesting that mainstream
distributions should target soft-float, either.

For community distributions, it is a much tougher call.  Obsoleting
virtually all existing hardware sends a terrible signal to early
supporters of the architecture.  But given how limited the RISC-V
baseline ISA is, I'm not sure if there is much of a choice here.  Maybe
it's possible to soften the blow by committing to (say) two more years
of baseline ISA support, and then making the switch, assuming that RVA23
hardware for local installation is widely available by then.

However, my real worry is that in the not-too-distant future, another
ISA transition will be required after RVA23.  This is not entirely
hypothetical because RVA23 is still an ISA designed mostly for C (at
least in the scalar space, I don't know much about the vector side).
Other architectures carry forward support for efficient overflow
checking (as required by Ada and some other now less-popular languages,
and as needed for efficiently implementing fixnums with arbitrary
precision fallback).  Considering current industry trends, it is not
inconceivable that these ISA features become important again in the near
term.

You can see the effect of native overflow checking support if you look
at Ada code examples with integer arithmetic.  For example, this:

function Fib (N: Integer) return Integer is
begin
   if N <= 1 then
      return N;
   else
      return Fib (N - 1) + Fib (N - 2);
   end if;
end;

produces about 370 RISC-V instructions with -gnato, compared to 218
instructions with -gnato0 and overflow checking disabled (using GCC
trunk).  For GCC 15, the respective instruction counts are 301 and 258
for x86-64, and 288 and 244 for AArch64.  RVA23 reduces the instruction
count with overflow checking to 353.  A further reduction should be
possible once GCC starts using xnor in its overflow checks, but I expect
that the overhead from overflow checking will remain high.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
