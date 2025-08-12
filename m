Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9ECC87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrRZmNLggC4OpdH/Utr6B29LTMVLGkPrcDjt93C+jBo=; b=gMatOh6aYFIQkn
	hjQ85gENNzLEk4JeYfIouG1XShOqjJ7Kh9vJPhjU2AP/N1F2pevKPu/5mVo5PgLUYBkhaUeXPMNdu
	qP6W8Jo4B6+p8+rsnB/bEfkccMwv20CTIfnVjytqReufX6iSiB53szrnlWA2b4v5teHEj8oa28Rfr
	QhHGPhaZV8jUqnIGk9HS8XRZ4VgxguD/5tSDN6xSNLnqt16plJiuVTUEk+XQH+mMW5Lim6CcOE78Q
	ktFPU0cFb4LJRDjXbzm8GfOj4VP56PiOG3LzCcrXNIEdXOyvaSD5WVp2uSRQMVCJhSr7utjeaNHCf
	3+i1ft3nr4N3QoPFkoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEi-0000000Ahrw-3VL3;
	Tue, 12 Aug 2025 12:36:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljyf-0000000AC42-1969
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 08:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754985802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zPD2NvE044yYaRiCB49zIx8of/z3CQOyIqI9hVU1DHo=;
	b=OkITRI/n0jcAFK+9i98XaAmrH7D2Ne3VMgTkSOr+T4HOVQws+NkqnMOr5eIaAxX9G5hTjb
	Vtzm5LXQo9WI+Iw8jIiBG3+soQ8q2YMBjvLi4IWa2q6f2yjh0FycOrOuXUpZ0NEeO9R1A7
	rfo7+gT0194m4WzkIc5gE2rdo6A9fNw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-seZebHSoN5OZopFtpsAsRQ-1; Tue,
 12 Aug 2025 04:03:14 -0400
X-MC-Unique: seZebHSoN5OZopFtpsAsRQ-1
X-Mimecast-MFC-AGG-ID: seZebHSoN5OZopFtpsAsRQ_1754985793
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 83DD31800340;
	Tue, 12 Aug 2025 08:03:12 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.32.207])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE4B61800280;
	Tue, 12 Aug 2025 08:03:08 +0000 (UTC)
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
In-Reply-To: <aJpUWnYEL18dk4aC@x1> (Drew Fustini's message of "Mon, 11 Aug
	2025 13:36:42 -0700")
References: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
	<lhuo6so7ur5.fsf@oldenburg.str.redhat.com> <aJe8ZW5LEtBK7Jmj@x1>
	<lhuqzxjy5zq.fsf@oldenburg.str.redhat.com> <aJpUWnYEL18dk4aC@x1>
Date: Tue, 12 Aug 2025 10:03:05 +0200
Message-ID: <lhua545dl1i.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_010325_381909_76BE0493 
X-CRM114-Status: GOOD (  10.03  )
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

>> I'm confused.  Current glibc assumes that vector registers are preserved
>> across system calls because the assembler clobbers do not mention them.
>> Similar inline assembly probably has ended up in other projects, too.
>> It works by accident if glibc is compiled for a non-vector target, or if
>> it so happens that GCC never keeps vector registers alive across system
>> calls.
>
> I wasn't trying to make any ABI changes with this sysctl patch. The
> riscv kernel documentation states vector state is not preserved across
> syscalls. I am not trying to change that policy.

Oh, then glibc is just buggy in this area.  I had no idea.  If the
vector state is already clobbered, than the sysctl for experimentation
is fine.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
