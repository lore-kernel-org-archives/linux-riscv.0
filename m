Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126B5CAC5B9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKY/tr9GgepE8QqoyL2ZXRjCqMndqzF3x87H6HhCvZI=; b=Hc34U9mtZFDsOU
	mInff9eTc8fE4yUVcNn1YKfNSdGwRw3piOxEx4146nduL0U5AqobLHXd2yeWuMq6QbkFx8yeiatEf
	XhJxdYxdrAewJlBzdl8dQ+jIZ65r33D9sxrhbXIfAnHikuqur0Z0p7XdPdxMSRyiMDh7yVSewNqTW
	IwAv5wcWLZu65Txr964uonWGSfihCQDUBtoh0JB5jLz9hmOR1aOuQmiYcqGSIi1ZSK3gfjlatRGnw
	q1WZFz4J5utdwCjvr9n8dHiAatIYEb1DqpE498YVilNIJkptRW7OD7wiQdzd+jemtCC4k/m8DoUO1
	PJ7WDZGsRJ/9vjJ4lHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WXm-00000004o5b-3bMB;
	Tue, 30 Sep 2025 09:21:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WXg-00000004o24-2fQa
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 09:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759224062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9lQSfvfcTNySF441awH7y9u1KuhzkH5FEbQXswdQdkk=;
	b=AvNdlLo9a1cWGse7zMpFg1nzbB26M9JQA0tIAZ2qBXlgXonbj1bJ9snhI1YilnCCcxfZrn
	AsweM6/n81miGHJG56gcihwiO9ftnZMzcByyOUcMYEsWtL8/0EEJXDAe5zQTx62BONHdyF
	p7g31vpVvVnafYyxH+L5bcjdHghtHFs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-90-34emJvPvN3m5oBvcOsfJzQ-1; Tue,
 30 Sep 2025 05:20:58 -0400
X-MC-Unique: 34emJvPvN3m5oBvcOsfJzQ-1
X-Mimecast-MFC-AGG-ID: 34emJvPvN3m5oBvcOsfJzQ_1759224053
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B5A218004D8;
	Tue, 30 Sep 2025 09:20:52 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.33.56])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 051C1180035E;
	Tue, 30 Sep 2025 09:20:34 +0000 (UTC)
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
In-Reply-To: <aNcAela5tln5KTUI@debug.ba.rivosinc.com> (Deepak Gupta's message
	of "Fri, 26 Sep 2025 14:07:06 -0700")
References: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
	<20250926192919.349578-1-cmirabil@redhat.com>
	<aNbwNN_st4bxwdwx@debug.ba.rivosinc.com>
	<CABe3_aE4+06Um2x3e1D=M6Z1uX4wX8OjdcT48FueXRp+=KD=-w@mail.gmail.com>
	<aNcAela5tln5KTUI@debug.ba.rivosinc.com>
Date: Tue, 30 Sep 2025 11:20:32 +0200
Message-ID: <lhu3484i9en.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_022104_783649_8585766E 
X-CRM114-Status: UNSURE (   8.91  )
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

> In case of shadow stack, it similar situation. If enabled compiler
> decides to insert sspush and sspopchk. They necessarily won't be
> prologue or epilogue but somewhere in function body as deemed fit by
> compiler, thus increasing the complexity of runtime patching.
>
> More so, here are wishing for kernel to do this patching for usermode
> vDSO when there is no guarantee of such of rest of usermode (which if
> was compiled with shadow stack would have faulted before vDSO's
> sspush/sspopchk if ran on pre-zimop hardware)

I think this capability is desirable so that you can use a distribution
kernel during CFI userspace bringup.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
