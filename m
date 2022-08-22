Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA8C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCaPI5gH45AhXAUKnYMu+2xCHmepUfIurRsd5sHrqOU=; b=ro5joR+BZHcmE0
	snqgMsxNigAPjkLnPUoB1jcpCq8QlGNc+FpYL2kpp0giUES79t6LmmUmtIvs3W6axbS0YNHOaK7iN
	2XN1HUFLdJ+qZ2ZicpjF+13Igxd1lumvZ9H1COrM756XygvX3KGbZwc82SCCXC5PhKW5vzF1ABWUj
	ehp/sp4vdis4vrICu4wi76ECVBo099wuiwOuj1IbXPsrsOmHkMZo9TD9LCyNH9v5kSBUlwCU6WjvC
	qbEElhjjIvnKJeMbgFwKBMb9wtLVL4uEdsLO4Ewoiw5wu9qqSMs8QkbkbMhkllHk0AUbnt8saFjCY
	fx24YhVPF+76DQYHnCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2sH-006ViO-V9; Mon, 22 Aug 2022 08:33:34 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2eN-006O6B-92
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 08:19:16 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 1B76533797;
	Mon, 22 Aug 2022 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1661156344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ASHhNHij0ueBJ18D4vtRLHcwSU9jKPXo/LPzppsN7Ik=;
	b=KTJDM/ZW6MnPIDyt9HcOjbWFdikkZ5J1FKf+O82vKuQV9uQpFUkwLkvEdqZdCXyjp3HHxs
	LAnqRe14ImVH+coTw6HXeHTSRkl5a/xk+xz3fXF0/HpDK+ld+98JS0xhedBpAOFupvpbyV
	+uI+rwJ4tWW2maxSFAF+5j+KLLVhlaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1661156344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ASHhNHij0ueBJ18D4vtRLHcwSU9jKPXo/LPzppsN7Ik=;
	b=M7y5JVwxJXXiIAZeAdIoJOAlZLqoyjtCrLMp2FP7Y2rHJKTAYtK/mi1TEktYiHsK/dgv87
	YYm5yQbs8y8vK8DA==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id D5B322C142;
	Mon, 22 Aug 2022 08:19:03 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 98D3A444B1A; Mon, 22 Aug 2022 10:19:03 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: <linux-riscv@lists.infradead.org>,  <oleg@redhat.com>,
  <paul.walmsley@sifive.com>,  <palmer@dabbelt.com>,
  <aou@eecs.berkeley.edu>,  <guoren@kernel.org>
Subject: Re: [PATCH -next 0/2] riscv: ptrace: implement PTRACE_{PEEK,POKE}USR
References: <20220822030105.16053-1-zouyipeng@huawei.com>
X-Yow: I'm thinking about DIGITAL READ-OUT systems and
 computer-generated IMAGE FORMATIONS..
Date: Mon, 22 Aug 2022 10:19:03 +0200
In-Reply-To: <20220822030105.16053-1-zouyipeng@huawei.com> (Yipeng Zou's
	message of "Mon, 22 Aug 2022 11:01:03 +0800")
Message-ID: <mvmzgfwelmw.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_011913_131221_DE0BA628 
X-CRM114-Status: GOOD (  10.66  )
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

On Aug 22 2022, Yipeng Zou wrote:

> The PTRACE_{PEEK,POKE}USR going to get/set tracee's user register.
> This patch sets add PTRACE_{PEEK,POKE}USR and compat implement to
> riscv.
>
> I notice this issuse when transplanting some app form x86 to riscv
> recently.
> I don't know why these two function are not implemented now, and I
> found few talk about that.
>
> The {PEEK,POKE}USR are both defined in include\uapi\linux\ptrace.h,
> So I was thinking maybe these two function shouled be implemented.

There are PTRACE_[GS]ETREGSET.  I think PTRACE_{PEEK,POKE}USR are
legacy-only.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
