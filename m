Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193C0E64A80
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8wRKBddXjhFlu9C933A5EYlwjK63UyK5oXG86C2fCE=; b=aGynElh7xx0bLv
	LMAGb7Yw18SB0/zDUJoSL4Pc+DAyandkMfiirHmlEPbBpdz8VAJnjounXCNfUBkR/Cp3hvF1k5MN3
	rj5PTu5WkZEeK64KzgOyvH/9zASQSvnPIde2+Nuoe+3tUm956RGdyK4nArYYqKGzqtqAPPu0GxXDw
	q8lQoxixQpctEahWi6XDfqv8o+sN1Pa+fyaWmKt0kQuY46Jk01sYiw7iPOLTFYZx5RZhdDoL62XXK
	9EqiRCRpy9LWZ8sCGJwkOe2yETbg0wpgCJZn1bqBd+PN/XKqq1F0lnOqLarNccg9+gSIY0WwtgjXT
	63Lq6S+Hcdbggg+aV5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQzk-00000009GlE-3aSv;
	Tue, 03 Dec 2024 11:23:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQzi-00000009GkM-1ZJS
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 11:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DA42A40C0E;
	Tue,  3 Dec 2024 11:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7767C4CECF;
	Tue,  3 Dec 2024 11:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733224985;
	bh=LWrHeEAcDdiZ/xoyrOTd94Gq02Fz5NLIsrn0bqh7X7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WN1DKp96SqgUh3Uljzsv+QiuDSYm4DYXnmN9ZJgItrNM9Lnf60MeEQsDgLukPxtV5
	 pZf3TLeZqxGGrnS3L+meY0jUphgKjmo0o6pEkX4LSwAxqJwU+fg9AgPQhJJOZKGmpH
	 c46hhoFOjk9jsoqV0AwDs7L18fSJxCuULDC51+20VV+vthi2d78Nt9kEzNojpVETcR
	 7vNKlJ7ACEHHrh+yCzFRpAOwATfIXKJ1RQAvTNqFWVMPynBmXuZoGiEjebnc/I1Smf
	 tG0WMbratU6QeUNRyn0vZri0r7BXi2cbbXClkkxzX9qapOE76fcRdvG/m+nvnTLrUX
	 2TTSJoJYBkSCA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Celeste Liu <uwu@coelacanthus.name>, Oleg Nesterov <oleg@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
 Andrea Bolognani <abologna@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, Felix Yan
 <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang
 <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi
 <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv/ptrace: add new regset to get original a0 register
In-Reply-To: <31d48f53-eaf0-445e-b9e3-7c56070ff6ad@coelacanthus.name>
References: <20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name>
 <87v7w22ip6.fsf@all.your.base.are.belong.to.us>
 <31d48f53-eaf0-445e-b9e3-7c56070ff6ad@coelacanthus.name>
Date: Tue, 03 Dec 2024 12:23:01 +0100
Message-ID: <87jzchdn8q.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_032306_475124_CB198B35 
X-CRM114-Status: UNSURE (   4.77  )
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

Celeste Liu <uwu@coelacanthus.name> writes:

>>> +static int riscv_orig_a0_get(struct task_struct *target,
>>> +			     const struct user_regset *regset,
>>> +			     struct membuf to)
>> 
>> Use full 100 chars!
>
> Linux code style prefer 80 limit.

No, it has been increased to 100, since many years [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl#n60

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
