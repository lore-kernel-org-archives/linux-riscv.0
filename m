Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562A2CCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7+VJbGqXi/x8WYmedzf34v5q9PGsD5C56lvRi73tI0=; b=fw4MaviXKGosfe
	BiN+czpf+XmpZ4l9gXV7TBwwIoHQg1BRZtjG57lf5r5oU6W+jAj3yTnZdr/ZU56699uRvmnxk2Xyi
	Fi9GuHTmuLSkA8bjPiTrxDsGhJf3iAMCuDEtlBe6JZcmIr436OJv+jX+EQRT0OuoJY90oDcu6aO61
	uWHfOBKQgmntKntwVQQDKevfkoHJ6i+sxu/vwIoLN7S5T1U3S21YxHR0OlW+TSnxXaiLEZUm7ZrId
	tXr6o411Wgzw2zElSMsGCSJ44mfDotdiXtHVk0ClM1csFp1PqnNT3iew8P56dz2z0DnGy/FyAUOzs
	jkvm2PEtuFfpEK7rCGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JZY-0000000DP8d-0C16;
	Mon, 13 Oct 2025 14:30:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JZT-0000000DP5f-2Fqq
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 14:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760365841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BTlu2d/OCa7smgTdfnf6rps6xmzbDobGt8v/NuBgfVM=;
	b=CUezQGv+xzW2fhxNYqdBEDwYrS2ME0Yfl75PbMAOKjPvq2ByGDAmdaDhKOw5a8BooNx5kx
	4ebDp17ZUhn3m6GLQpU33TUpOkVu9L0VF38VhbDNlci8M++M9t3ZyZ9oRiYMN0GBuS0KSf
	0sLam3sxzhFMFkMZvSShViYwN1wqZGA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-WHoEOy0QNoS_DHwHLaA70A-1; Mon,
 13 Oct 2025 10:30:37 -0400
X-MC-Unique: WHoEOy0QNoS_DHwHLaA70A-1
X-Mimecast-MFC-AGG-ID: WHoEOy0QNoS_DHwHLaA70A_1760365832
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAB3019560A7;
	Mon, 13 Oct 2025 14:30:29 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.32.50])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 414E01954107;
	Mon, 13 Oct 2025 14:30:12 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Charles Mirabile <cmirabil@redhat.com>,  pjw@kernel.org,
  Liam.Howlett@oracle.com,  a.hindborg@kernel.org,
  akpm@linux-foundation.org,  alex.gaynor@gmail.com,
  alexghiti@rivosinc.com,  aliceryhl@google.com,  alistair.francis@wdc.com,
  andybnac@gmail.com,  aou@eecs.berkeley.edu,  arnd@arndb.de,
  atishp@rivosinc.com,  bjorn3_gh@protonmail.com,  boqun.feng@gmail.com,
  bp@alien8.de,  brauner@kernel.org,  broonie@kernel.org,
  charlie@rivosinc.com,  cleger@rivosinc.com,  conor+dt@kernel.org,
  conor@kernel.org,  corbet@lwn.net,  dave.hansen@linux.intel.com,
  david@redhat.com,  devicetree@vger.kernel.org,  ebiederm@xmission.com,
  evan@rivosinc.com,  gary@garyguo.net,  hpa@zytor.com,  jannh@google.com,
  jim.shu@sifive.com,  kees@kernel.org,  kito.cheng@sifive.com,
  krzk+dt@kernel.org,  linux-arch@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-fsdevel@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  linux-riscv@lists.infradead.org,
  lorenzo.stoakes@oracle.com,  lossin@kernel.org,  mingo@redhat.com,
  ojeda@kernel.org,  oleg@redhat.com,  palmer@dabbelt.com,
  paul.walmsley@sifive.com,  peterz@infradead.org,
  richard.henderson@linaro.org,  rick.p.edgecombe@intel.com,
  robh@kernel.org,  rust-for-linux@vger.kernel.org,
  samitolvanen@google.com,  shuah@kernel.org,  tglx@linutronix.de,
  tmgross@umich.edu,  vbabka@suse.cz,  x86@kernel.org,  zong.li@sifive.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
In-Reply-To: <aN6sNFBzx8NPU3Th@debug.ba.rivosinc.com> (Deepak Gupta's message
	of "Thu, 2 Oct 2025 09:45:40 -0700")
References: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
	<20250926192919.349578-1-cmirabil@redhat.com>
	<aNbwNN_st4bxwdwx@debug.ba.rivosinc.com>
	<CABe3_aE4+06Um2x3e1D=M6Z1uX4wX8OjdcT48FueXRp+=KD=-w@mail.gmail.com>
	<aNcAela5tln5KTUI@debug.ba.rivosinc.com>
	<lhu3484i9en.fsf@oldenburg.str.redhat.com>
	<aNxsWYYnj22G5xuX@debug.ba.rivosinc.com>
	<lhuwm5dh6hf.fsf@oldenburg.str.redhat.com>
	<aN6sNFBzx8NPU3Th@debug.ba.rivosinc.com>
Date: Mon, 13 Oct 2025 16:30:09 +0200
Message-ID: <lhujz0yoowe.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_073043_637569_A4AADBA7 
X-CRM114-Status: UNSURE (   9.03  )
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

* Deepak Gupta:

> How will they contribute to CFI bringup without having a CFI compiled
> usersapce?

Build glibc themselves and then proceed one library at the time.

>>Another use case would be running container images with CFI on a
>>distribution kernel which supports pre-RVA23 hardware.
>
> Container image with CFI will have glibc and ld (and all other
> userspace) also compiled with shadow stack instructions in it. As soon
> as you take this container image to a pre-RVA23 hardware, you won't
> even reach vDSO. It'll break much before that, unless kernel is taking
> a trap on all sspush/sspopchk instructions in prologue/epilogue of
> functions in userspace (glibc, ld, etc)

The idea is that you can use a stock distribution kernel to run CFI
images (potentially form a different distribution or version of the
distribution).

But maybe none of this really matters.  How far out is CFI-checking
hardware?  Is it going to arrive much later than the RVA23 flag day
that people are suggesting?

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
