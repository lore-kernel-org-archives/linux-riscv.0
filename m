Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FA2E81DEE
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rPn/NwSaH3VpS3HWrGcKiN7owbPOh3RV29exaaRUdI0=; b=0sAY9c1JgtJmqT+T7AjptkZen+
	GGpyt2vk4DRNOdLY9WMzfj9qYvNorep32b0pKkHX/aFHSpm19gj8NSpuwDflqhHqAYX9krIek2exM
	GGvif6zMVYiBFKYATqewHOQQzHs1flgvEpSHMVTA/s9El82duEXaW0aQlO/7/cTD8tUTqUlFE+6AJ
	MjeHn/V2gFT/22oEhVI3nOdpsSvoqDPGB3w5Yi61sG19++YptpSUrN5wPztU+2ffR13q2OkdQCBEn
	cK4yXv6KKCtXbNCqEtnBrFpF1WbKlHFSUz2JNPbvf91hHy5THrVRVD7/znckTZ2I1kcgmbjsTORkJ
	Il89PNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojyV-005mpW-10;
	Fri, 06 Oct 2023 12:30:35 +0000
Received: from out03.mta.xmission.com ([166.70.13.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojyR-005miu-25;
	Fri, 06 Oct 2023 12:30:33 +0000
Received: from in02.mta.xmission.com ([166.70.13.52]:37482)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1qojy7-00AOeg-9W; Fri, 06 Oct 2023 06:30:11 -0600
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:49692 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1qojy5-001oHA-T0; Fri, 06 Oct 2023 06:30:10 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>,  Will Deacon <will@kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  Andrew Morton <akpm@linux-foundation.org>,  Marc
 Zyngier <maz@kernel.org>,  Oliver Upton <oliver.upton@linux.dev>,  James
 Morse <james.morse@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>,
  Arnd Bergmann <arnd@arndb.de>,  Oleg Nesterov <oleg@redhat.com>,  Kees
 Cook <keescook@chromium.org>,  Shuah Khan <shuah@kernel.org>,  "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>,  Deepak Gupta
 <debug@rivosinc.com>,  Ard Biesheuvel <ardb@kernel.org>,  "H.J. Lu"
 <hjl.tools@gmail.com>,  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  linux-arm-kernel@lists.infradead.org,  linux-doc@vger.kernel.org,
  kvmarm@lists.linux.dev,  linux-fsdevel@vger.kernel.org,
  linux-arch@vger.kernel.org,  linux-mm@kvack.org,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
References: <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
	<ZOTnL1SDJWZjHPUW@arm.com>
	<43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
	<ZOXa98SqwYPwxzNP@arm.com> <ZOYFazB1gYjzDRdA@arm.com>
	<ZRWw7aa3C0LlMPTH@arm.com>
	<38edb5c3-367e-4ab7-8cb7-aa1a5c0e330c@sirena.org.uk>
	<ZRvUxLgMse8QYlGS@arm.com>
	<a7d2fd66-c06b-4033-bca2-4b14afc4904f@sirena.org.uk>
	<ZR7w/mr0xZbpIPc5@arm.com>
	<638a7be5-6662-471d-a3ce-0de0ac768e99@sirena.org.uk>
Date: Fri, 06 Oct 2023 07:29:45 -0500
In-Reply-To: <638a7be5-6662-471d-a3ce-0de0ac768e99@sirena.org.uk> (Mark
	Brown's message of "Fri, 6 Oct 2023 13:17:01 +0100")
Message-ID: <87y1ggylvq.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1qojy5-001oHA-T0;;;mid=<87y1ggylvq.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.168.167;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1+LvOjycHAoB6LT49HjM3IrRBVDb8ivK8I=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded
 Control Stacks
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_053031_699867_A0EA8FE7 
X-CRM114-Status: GOOD (  23.66  )
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

Mark Brown <broonie@kernel.org> writes:

> On Thu, Oct 05, 2023 at 06:23:10PM +0100, Catalin Marinas wrote:
>
>> It's not just the default size that I dislike (I think the x86
>> RLIMIT_STACK or clone3() stack_size is probably good enough) but the
>> kernel allocating the shadow stack and inserting it into the user
>> address space. The actual thread stack is managed by the user but the
>> shadow stack is not (and we don't do this very often). Anyway, I don't
>> have a better solution for direct uses of clone() or clone3(), other
>> than running those threads with the shadow stack disabled. Not sure
>> that's desirable.
>
> Running threads with the shadow stack disabled if they don't explicitly
> request it feels like it's asking for trouble - as well as the escape
> route from the protection it'd provide I'd expect there to be trouble
> for things that do stack pivots, potentially random issues if there's a
> mix of ways threads are started.  It's going to be a tradeoff whatever
> we do.

Something I haven't seen in the discussion is that one of the ways I
have seen a non-libc clone used is to implement a fork with flags.
That is a new mm is created, and effectively a new process.  Which
makes the characterization different.

In general creating a thread with clone and bypassing libc is
incompatible with pthreads, and the caller gets to keep both pieces.

As long as there is enough information code can detect that
shadow stacks are in use, and the code is able to create their own
I don't see why it shouldn't be the callers responsibility.

On the other hand I don't see the maintainer of clone Christian Brauner
or the libc folks especially Florian cc'd on this thread.  So I really
don't think you have the right folks in on this conversation.

Eric
k

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
