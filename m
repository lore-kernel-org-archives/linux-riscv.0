Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0697FB5EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 04:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQAUfKyEOa/AH6N/llWpUc2MwWDhz7u1Ry5Yd1ccFvI=; b=f5IWvqQzBntSvO
	RSuPXVVu10bIcRRAXK29SBx3JjYD3lJbhqZ0I5cBM0CynfCWyZzN2xPOE5gQ4E8pbnP9c10Gny4kv
	1komcgDnp9I17vK3rYOhOJRDEKRfp6IQ9egxtujaA3VP13EYyNy3c4lALPrgGw8BnDKTr8BNwDRn/
	QCk08vEztdWamXZWwN778hGLrK8PD7quzz4V/djXic6SMer3dA7dHKIU+9iAwy72bGeeLa/dlf9DA
	JH+6S4ZSXWUh+nowCd7e6rKA1Mli20wKSUuAxPs+7yivDOtzt/rVxxdN2z59dbA7k18xWS+DquIeY
	sN39HUmpUVlkkDGHgUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2MJp-00000005Pa2-1mWk;
	Tue, 17 Mar 2026 04:46:13 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2MJm-00000005PZh-0j6B
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 04:46:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773722720; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RvD/C0178NU1LwJEkSg2UFnPK19fryVEEEn4KH1SuSSNoKbCxy9CLexhK+PWYoMvqFtvy9AEretvZR5Q+W53mvYc1Q3uTjxfrcau3ZYo7nLcsF7qcFYdlx2zfl9e/bPy65olb/oW4z0lC/mFwSLlWj3M9F3HWdvPoCYgocBQfK4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773722720; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MZtGcjgstCOwi90UqZfYqyQ9iZiBcfojTGxX5RIebuY=; 
	b=JlP1Q9OoOBvGuVB4qdDtUbzeSCIQFGCsWGwfLhDcmeCWkQt8eIWr4mFE0T3kny7nqYzxJv6vYc77IN1iBxJyPrY8zwfoWS+c89X/KVhr6I4CoSthUJ32n4nhs+Ye0of2hteJ23YzAydUsXIatKAKhznE9CxUEtMWECvlvsnLuV4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773722720;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=MZtGcjgstCOwi90UqZfYqyQ9iZiBcfojTGxX5RIebuY=;
	b=PyqfIhz2A+D4PU3lO2lI8y/tSQIinoROefawYKrjEtzapgOROW0tQOakEFk2ZAcc
	xAPFyKTDxclE6kiWf3fINMPhdWHqGErfmylRD+Bu8j27sSIwbTFEPaimumoXYZmbeXc
	1EAZc0aPk0qLhwZU9sf4Jc4gTc3zECp4f/UPY6zw=
Received: by mx.zohomail.com with SMTPS id 1773722718208506.92900941934556;
	Mon, 16 Mar 2026 21:45:18 -0700 (PDT)
Date: Tue, 17 Mar 2026 04:45:05 +0000
From: Yao Zi <me@ziyao.cc>
To: Paul Chaignon <paul.chaignon@gmail.com>, rsworktech@outlook.com
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Amery Hung <ameryhung@gmail.com>, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH bpf v3] bpf: do not use kmalloc_nolock when
 !HAVE_CMPXCHG_DOUBLE
Message-ID: <abjcUSXWiShiuMvH@pie>
References: <20260315-bpf-kmalloc-nolock-v3-1-91c72bf91902@outlook.com>
 <abgcKvuSQc2ZYKw4@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abgcKvuSQc2ZYKw4@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_214610_312632_D01F23E8 
X-CRM114-Status: GOOD (  17.03  )
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

On Mon, Mar 16, 2026 at 04:05:14PM +0100, Paul Chaignon wrote:
> On Sun, Mar 15, 2026 at 12:02:48AM +0800, Levi Zim via B4 Relay wrote:
> > From: Levi Zim <rsworktech@outlook.com>
> > 
> > kmalloc_nolock always fails for architectures that lack cmpxchg16b.
> > For example, this causes bpf_task_storage_get with flag
> > BPF_LOCAL_STORAGE_GET_F_CREATE to fails on riscv64 6.19 kernel.
> > 
> > Fix it by enabling use_kmalloc_nolock only when HAVE_CMPXCHG_DOUBLE.
> > But leave the PREEMPT_RT case as is because it requires kmalloc_nolock
> > for correctness. Add a comment about this limitation that architecture's
> > lack of CMPXCHG_DOUBLE combined with PREEMPT_RT could make
> > bpf_local_storage_alloc always fail.
> > 
> > Fixes: f484f4a3e058 ("bpf: Replace bpf memory allocator with kmalloc_nolock() in local storage")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Levi Zim <rsworktech@outlook.com>
> > ---
> 
> Note there may be something broken with your setup as lore is reporting
> that you sent this v3 email three times. Not sure if it could be an
> issue.

Once is because linux-riscv@lists.infradead.org adds a trailer when
forwarding messages but keeps the Message-ID unchanged, so lore indexed
one extra message with the same ID but different content, it was not
Levi doing something wrong.

The other message has the same content but a different From line, not
sure what happened to it. Differences of the messages could be viewed
here[1].

Regards,
Yao Zi

[1]: https://lore.kernel.org/all/20260315-bpf-kmalloc-nolock-v3-1-91c72bf91902@outlook.com/d/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
