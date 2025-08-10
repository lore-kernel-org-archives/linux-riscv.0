Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBCEC87FCA
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=febRU9DyyJSJE2Vm5jnXYbEzUE3R5zN/3tgQdTZFkm8=; b=uqB9/cvaDgCzDn
	f+chacrzmr0P8leTgnSHXBRqTr9FV/KKfTYeERsoS+i8TwsuHvizV+QdTljgPdBcx9H+BPs7DPW/l
	B0n7TqnjbxPbPA7xc/Vq0K/GA4qTHULHmyaRC7qY2lZxw1vtBmagXbGw2iGHLWkWK683kJJ9Tny11
	zoJCX8P7UDVjwdhD4XiAC0QZ/9kk+ucdaQqhVxTF39h0krQwMEtC4e948SN2zcYE2QQeZ+sfQVGqN
	v19ch0KAJpA2q1R3pKIFgT1EsjTQdS3xwfpPDOZL6rZRdRKx8msxQjE2/ZQivH17Pi2xDYqC6iSJJ
	jvYOuhPMESoOdXQuPfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0kY-00000005PgS-18rP;
	Sun, 10 Aug 2025 07:45:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0kU-00000005Pg4-3siN
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 07:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754811945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVt0giKq01c+tkApRK/bOHrB953kwHQUrVwjxBxJkWY=;
	b=VnifWRqFivpwRrw+MrHsVHXYotK42py8wv7+KXDshpHpQGWfDO2x1osp7HfEEPgxeIdhEm
	ED3prd7zgHt9Ic32e6KB5Gyz16RivaRB2qpPiYKaXM7WM12rkM07Dd9j9rAdtsJipJB5Y4
	hGBG4AJZ2hfqC/72HhOhYRmkTAEFrBc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-135-uDWUvcvAO1ychBbt31xByw-1; Sun,
 10 Aug 2025 03:45:36 -0400
X-MC-Unique: uDWUvcvAO1ychBbt31xByw-1
X-Mimecast-MFC-AGG-ID: uDWUvcvAO1ychBbt31xByw_1754811934
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 509571956087;
	Sun, 10 Aug 2025 07:45:34 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.32.37])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E6AF01800280;
	Sun, 10 Aug 2025 07:45:29 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Alexandre Ghiti <alex@ghiti.fr>,  Samuel Holland
 <samuel.holland@sifive.com>,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,  Andy Chiu
 <andybnac@gmail.com>,  Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,  Drew
 Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v2] riscv: Add sysctl to control discard of vstate
 during syscall
In-Reply-To: <aJe8ZW5LEtBK7Jmj@x1> (Drew Fustini's message of "Sat, 9 Aug 2025
	14:23:49 -0700")
References: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
	<lhuo6so7ur5.fsf@oldenburg.str.redhat.com> <aJe8ZW5LEtBK7Jmj@x1>
Date: Sun, 10 Aug 2025 09:45:45 +0200
Message-ID: <lhuqzxjy5zq.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_004547_044643_29E80DF3 
X-CRM114-Status: GOOD (  24.12  )
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

* Drew Fustini:

> On Sat, Aug 09, 2025 at 10:40:46AM +0200, Florian Weimer wrote:
>> * Drew Fustini:
>> 
>> > From: Drew Fustini <dfustini@tenstorrent.com>
>> >
>> > Clobbering the vector registers can significantly increase system call
>> > latency for some implementations. To mitigate this performance impact, a
>> > sysctl knob is provided that controls whether the vector state is
>> > discarded in the syscall path:
>> >
>> > /proc/sys/abi/riscv_v_vstate_discard
>> >
>> > Valid values are:
>> >
>> > 0: Vector state is not always clobbered in all syscalls
>> > 1: Mandatory clobbering of vector state in all syscalls
>> >
>> > The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
>> 
>> Can this be put into the system call number instead, or make it specific
>> to some system calls in other ways?
>
> Do you mean the control the initial state of the sysctl, or not having a
> sysctl for discard behavior at all?

It's seems rather strange to have a sysctl for such an ABI change
because it really has to be a per-process property.

>> I think C libraries can use this optimization for their system calls
>> (after adjusting the assembler clobbers) because the vector state is
>> caller-saved in the standard calling convention.  But there is backwards
>> compatibility impact for turning this on for the entire process.
>
> The focus I have right now is allowing users to avoid the delay in
> syscall entry on implementations where clobbering is slow. Palmer had
> mentioned in my v1 [1] that he has 'a patch out for GCC that enables a
> system-wide vector ABI, but I don't have time to test/benchmark it so 
> it's kind of hard to justify'. It seems like creating a new ABI where
> the vector registers are preserved across syscalls could be useful, but
> I think it would be best to handle that possiblity later on.

I'm confused.  Current glibc assumes that vector registers are preserved
across system calls because the assembler clobbers do not mention them.
Similar inline assembly probably has ended up in other projects, too.
It works by accident if glibc is compiled for a non-vector target, or if
it so happens that GCC never keeps vector registers alive across system
calls.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
