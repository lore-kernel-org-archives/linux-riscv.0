Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9A1CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 11:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVM1ZMZeq8QYzUji67Fxu2+AelkXIIsR7tz4a23d9pE=; b=FmbG4uBTAuicWa
	d5Nrv5ATP3bha6wNwFoPdLc6gdWhs9UlDbpZnp3E37Dfrl+G3xc71dWb5SSRnWjQWZ/UxZOc3Fvbk
	XTQnnFn1qqO6tfd3xSmTHcviHFdX/REtZFBnlgbmhejP8Tq1iMXoTv5z9ToFheMiPI4rWV9Ypsg3E
	tsWry8VONevP3Uv2P659iDaD/9mL+qhzrUCxM4LGUWwB2lqHddwiUniTFoSzkupZogaOZicJQ1qhf
	iElbCzI1JH/D290LZJEbNgTUJU5yyIbeICXXRyD2zXCRtGo3LNXRxAGTI2pCB8nDgYsHaOG16TyrW
	2JMLODpT6IZ1YV11iasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4HlP-0000000AOX5-2QhZ;
	Thu, 02 Oct 2025 11:46:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4HlN-0000000AOV5-0hKa
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 11:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759405579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XAW7j/GiCX4Ldk1pbIGoe/EzygOj7TZ3MCMZKOX1tCA=;
	b=RKh8rjsBMETTgDGZWoe4ZtiaMzgODoAloYdtGz5T7uGcmdKEYNqbadQFttGzjfr97mqpH0
	wfE4SMivVB1R0+G3WN0aPOx86HkR/h2N2yWRqUBQo0wpyJ7a6erhtDqUIi76qC1f9R771F
	VG1G0rAiAIhp8dNXeOC49x5rlk+bL44=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-0ElKgZKKMTaiTW8-y-6wyw-1; Thu,
 02 Oct 2025 07:46:17 -0400
X-MC-Unique: 0ElKgZKKMTaiTW8-y-6wyw-1
X-Mimecast-MFC-AGG-ID: 0ElKgZKKMTaiTW8-y-6wyw_1759405572
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 494BD1956095;
	Thu,  2 Oct 2025 11:46:10 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.32.225])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 83FCA300018D;
	Thu,  2 Oct 2025 11:45:51 +0000 (UTC)
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
In-Reply-To: <aNxsWYYnj22G5xuX@debug.ba.rivosinc.com> (Deepak Gupta's message
	of "Tue, 30 Sep 2025 16:48:41 -0700")
References: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
	<20250926192919.349578-1-cmirabil@redhat.com>
	<aNbwNN_st4bxwdwx@debug.ba.rivosinc.com>
	<CABe3_aE4+06Um2x3e1D=M6Z1uX4wX8OjdcT48FueXRp+=KD=-w@mail.gmail.com>
	<aNcAela5tln5KTUI@debug.ba.rivosinc.com>
	<lhu3484i9en.fsf@oldenburg.str.redhat.com>
	<aNxsWYYnj22G5xuX@debug.ba.rivosinc.com>
Date: Thu, 02 Oct 2025 13:45:48 +0200
Message-ID: <lhuwm5dh6hf.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_044621_267550_72DCA099 
X-CRM114-Status: GOOD (  11.73  )
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

> On Tue, Sep 30, 2025 at 11:20:32AM +0200, Florian Weimer wrote:
>>* Deepak Gupta:
>>
>>> In case of shadow stack, it similar situation. If enabled compiler
>>> decides to insert sspush and sspopchk. They necessarily won't be
>>> prologue or epilogue but somewhere in function body as deemed fit by
>>> compiler, thus increasing the complexity of runtime patching.
>>>
>>> More so, here are wishing for kernel to do this patching for usermode
>>> vDSO when there is no guarantee of such of rest of usermode (which if
>>> was compiled with shadow stack would have faulted before vDSO's
>>> sspush/sspopchk if ran on pre-zimop hardware)
>>
>>I think this capability is desirable so that you can use a distribution
>>kernel during CFI userspace bringup.
>
> I didn't get it, can you elaborate more.
>
> Why having kernel carry two vDSO (one with shadow stack and one without) would
> be required to for CFI userspace bringup?
>
> If Distro is compiling for RVA23 CONFIG_RISCV_USERCFI has to be selected yes,
> kernel can have vDSO with shadow stack. Distro can light this option only when
> its compiling entire distro for RVA23.

I think it boils down to whether you want CFI bringup contributions from
people who do not want to or cannot build their own custom RVA23
kernels.

Another use case would be running container images with CFI on a
distribution kernel which supports pre-RVA23 hardware.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
