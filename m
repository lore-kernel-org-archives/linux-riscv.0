Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCF5C3DA45
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 10:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDh/1ZFqCJqMqN/N3depUZRHbC1LiPDYcFvSVklMEtk=; b=MfJ1ojmLJlrmT7
	lpCjC0pKID0ScE4OtIR7/SbFUcjTWGx+pR6EtyNAlI3J9cofPBQRqj7I97GF9J0OGO5wF8uiNkpAI
	BQeOJvBTSa5+nV2nf2qndrFiofGgIf3eGZxrUGtxEbKAAO58vdzuXlNtHB1Ak3yvQaMs8IZOJ3407
	SCFhhfnCL1IzVsW/XxLfk2KL9c4HKM9gia2SDTSE6C59V84KmfpB1zufV+CU0IlNFzqOKO72Onmmh
	vyqgtKI+qOx45w3lc2u0whECv07WoxuKMts3nu215XUJPxGcFpXcQTyVFZcmuDpYktQ6g1PqEkD75
	6Jye2oMp1Y7WpKbdT1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRUh6-0000000ADb2-1tS1;
	Wed, 10 Jul 2024 10:37:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRUgq-0000000ADWb-3QUg
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 10:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720607808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TbJg6z7j+ZQBtm21UhpDM4r/48rTnLX4yDmOeuhoEeA=;
	b=CMWJS8WwYGV+Zycf/PKu7fc11hU4dXmtdleVOGC2TIGp09tcRScUJKdTXAc7q0c4mqV3qU
	8njeqNXg7CF3yfitKV7WIVD9raVZRlYXt3PFMvL0RJO7NQ7USRXKGXiYj1jDzpNkVp2ZtX
	t/FuCAsceNCq6CwBO84P2NFNTN7xy/4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-a07wZjSjMfOCkc_bgrfTiQ-1; Wed,
 10 Jul 2024 06:36:41 -0400
X-MC-Unique: a07wZjSjMfOCkc_bgrfTiQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 07722196CE01;
	Wed, 10 Jul 2024 10:36:36 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.154])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A378D19560AE;
	Wed, 10 Jul 2024 10:36:24 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Andrew Morton
 <akpm@linux-foundation.org>,  Marc Zyngier <maz@kernel.org>,  Oliver Upton
 <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K
 Poulose <suzuki.poulose@arm.com>,  Arnd Bergmann <arnd@arndb.de>,  Oleg
 Nesterov <oleg@redhat.com>,  Eric Biederman <ebiederm@xmission.com>,
  Shuah Khan <shuah@kernel.org>,  "Rick P. Edgecombe"
 <rick.p.edgecombe@intel.com>,  Deepak Gupta <debug@rivosinc.com>,  Ard
 Biesheuvel <ardb@kernel.org>,  Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
  Kees Cook <kees@kernel.org>,  "H.J. Lu" <hjl.tools@gmail.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Christian Brauner
 <brauner@kernel.org>,  Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>,  Ross Burton <ross.burton@arm.com>,
  linux-arm-kernel@lists.infradead.org,  linux-doc@vger.kernel.org,
  kvmarm@lists.linux.dev,  linux-fsdevel@vger.kernel.org,
  linux-arch@vger.kernel.org,  linux-mm@kvack.org,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, "Schimpe, Christina"
 <christina.schimpe@intel.com>, "Pandey, Sunil K"
 <sunil.k.pandey@intel.com>
Subject: Re: [PATCH v9 05/39] arm64/gcs: Document the ABI for Guarded
 Control Stacks
In-Reply-To: <20240625-arm64-gcs-v9-5-0f634469b8f0@kernel.org> (Mark Brown's
	message of "Tue, 25 Jun 2024 15:57:33 +0100")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-5-0f634469b8f0@kernel.org>
Date: Wed, 10 Jul 2024 12:36:21 +0200
Message-ID: <87a5iph6u2.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_033648_932764_1DC38BD4 
X-CRM114-Status: GOOD (  19.19  )
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

* Mark Brown:


> +4.  Signal handling
> +--------------------
> +
> +* A new signal frame record gcs_context encodes the current GCS mode and
> +  pointer for the interrupted context on signal delivery.  This will always
> +  be present on systems that support GCS.
> +
> +* The record contains a flag field which reports the current GCS configuration
> +  for the interrupted context as PR_GET_SHADOW_STACK_STATUS would.
> +
> +* The signal handler is run with the same GCS configuration as the interrupted
> +  context.
> +
> +* When GCS is enabled for the interrupted thread a signal handling specific
> +  GCS cap token will be written to the GCS, this is an architectural GCS cap
> +  token with bit 63 set and the token type (bits 0..11) all clear.  The
> +  GCSPR_EL0 reported in the signal frame will point to this cap token.

How does this marker interfere with Top Byte Ignore (TBI; I hope I got
the name right)?  The specification currently does not say that only
addresses pushed to the shadow stack with the top byte cleared, which
potentially makes the markup ambiguous.  On x86-64, the same issue may
exist with LAM.  I have not tested yet what happens there.  On AArch64
and RISC-V, it may be more natural to use the LSB instead of the LSB for
the mark bit because of its instruction alignment.

We also have a gap on x86-64 for backtrace generation because the
interrupted instruction address does not end up on the shadow stack.
This address is potentially quite interesting for backtrace generation.
I assume it's currently missing because the kernel does not resume
execution using a regular return instruction.  It would be really useful
if it could be pushed to the shadow stack, or recoverable from the
shadow stack in some other way (e.g., the address of the signal context
could be pushed instead).  That would need some form of marker as well.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
