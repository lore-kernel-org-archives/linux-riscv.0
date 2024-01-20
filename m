Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AEDC47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 17:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fYErIV5Qf9fDTQWEqR+YyHt/jPAhqbW9b0+4s4pxAE=; b=sNbJWsgc9/PDs0
	HJgxYCsWNthAYavEtK8oUOtKpcT3JwThXPHoc2lAgChvwfN7cD6YznjrwAp2ZKoi2TZmNRVZ6uGFv
	AiciY6+NirZPGLJUnxKLbGd1ocshCorRDt7Fh7CpZMUMWEgtXOoX1Y2wCnG48oqk4B/AQbVW7dbCX
	2fIK/IpIUkQbf5sn1fg7N2QIbK89Vyw2rRnJoqXD0AqFvF4vwe1AMPAfid6zwLjlqpl5Ol8O8zVL1
	eu/490JwC8Z2R/RPzwzS8Rcy/oXqM1Ym0XGtdPY0ggYEY4nqwC9UkqAkJoVxH2oijdG2mZT2WbtQl
	8VbqLTEd38E1YWQM/JJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRFMa-008AXm-0u;
	Sat, 20 Jan 2024 17:42:36 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRFMU-008AXC-1A
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 17:42:34 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2cddb2c2b54so17762191fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 09:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1705772546; x=1706377346; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h5sBSOD8D5bflULBYqNmao2RpCqG6n7bDrfLt4seRmw=;
        b=bmAhylUmHUMI9P1M0EebCpcatzkmuG/Ei7nf2OhKK/BLtOybRm83je5QzXjl/kqfxX
         lNxHMvalvL0jcoSxoJOxxR3VF+yGxZeGhV9AyBN72UIcM5pUczDUkcPRPTcN7NRYRtuE
         1f06REo2xJIcF1lrGXD86/0atex3DxQZgqGkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705772546; x=1706377346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5sBSOD8D5bflULBYqNmao2RpCqG6n7bDrfLt4seRmw=;
        b=mTqCL8e8hsc0AZXmqQKzHffvH8RRRRwpBUEXEvFJbpLwI++BtFRpcwJ2hAIRtZMSxR
         Q/ibWxWIenJjpjKQ24XrlmsGBIMXY7OGJZsI+zT9HfF1Bsmr81qPNJEpxqc6V2CvE42A
         CRwBz0XrIZwZPMjcZy4aTA2prrQY+M3mrl5e1lNMZ9nMJ87kqXDuyhk6919xAXhY97Qp
         fQnSBJzQWaSTvsRSFXjtXHvtwdiN8JgMgzz3DQF9qwYdtn9NcBoQ7486uFD5moH5M6yP
         Sd7KGbNQGWv5AzVGq/yB7LAmw3sAuEvVtXNrx5J5T8S+WaqcJoDLaw18Nw8pRieoevWm
         Uh2g==
X-Gm-Message-State: AOJu0YwNpoGoznw7+njGemLjkukX2apbnh3hIXjSYgEkPPUI8O6p+yZh
	WXy34evktUMHI0X85pJ6M6WaWbwtjnPk2t+6Ad85NpJWmjZlbqcs28faX4QWo5Au6Yn+zmeAwQR
	ChS5Ikg==
X-Google-Smtp-Source: AGHT+IGKVSizeFQPyTTV4E4TNoS0F0uXILolOxPaxkN4cSgRVsQGh1ytGy2puLYV3EyLu5jjBCtSOw==
X-Received: by 2002:a19:670c:0:b0:50e:8eff:3980 with SMTP id b12-20020a19670c000000b0050e8eff3980mr651295lfc.30.1705772546247;
        Sat, 20 Jan 2024 09:42:26 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id b15-20020a056512304f00b0050e897b320fsm1377272lfb.192.2024.01.20.09.42.25
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jan 2024 09:42:25 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eabd1c701so2023374e87.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 09:42:25 -0800 (PST)
X-Received: by 2002:a05:6512:ba3:b0:50e:31fc:ca1e with SMTP id
 b35-20020a0565120ba300b0050e31fcca1emr926031lfv.40.1705772545366; Sat, 20 Jan
 2024 09:42:25 -0800 (PST)
MIME-Version: 1.0
References: <mhng-7cf9e456-32a2-4a75-93d5-5b97fb93ad2b@palmer-ri-x1c9>
In-Reply-To: <mhng-7cf9e456-32a2-4a75-93d5-5b97fb93ad2b@palmer-ri-x1c9>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 20 Jan 2024 09:42:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wimDL8m=hETgzazd4W23PtBQ_K=E80mkuqhx0H=8BpWQA@mail.gmail.com>
Message-ID: <CAHk-=wimDL8m=hETgzazd4W23PtBQ_K=E80mkuqhx0H=8BpWQA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.8 Merge Window, Part 3
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@subspace.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_094230_433073_C51229CF 
X-CRM114-Status: GOOD (  12.63  )
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

On Sat, 20 Jan 2024 at 06:52, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The last one is particularly clunky, as I've just squashed the fix into a merge
> from your tree.

_Please_ don't use back-merges to pre-merge things before sending me a
pull request.

Just let me know about the semantic conflict, and send your tree as it
works for you. Then, as I merge your tree, I can take care of the
actual conflicts.

IOW, I really _really_ want developers to worry about *their* changes.

Yes, linux-next is then there to give a heads-up about how these
changes end up interacting, and you should be aware of it enough to
send me a heads-up. But that's literally all - you should *not* then
merge in other peoples changes into your tree.

IOW, a conflict with other trees that got noticed in linux-next should
just result in that note to me about the conflict once you send your
tree to me.

Not a random merge of a random commit that came in through another random tree.

One result of that random merge is then your messy diffstat. Your pull
request claims this:

 443 files changed, 7415 insertions(+), 4420 deletions(-)

but that's literally because you got that random noise from pulling in
the state from the tty tree that had *nothing* to do with your RISC-V
changes. The real diffstat if you don't have that last merge is

 71 files changed, 2678 insertions(+), 215 deletions(-)

and ends up looking much saner (ie it actually lists just arch/riscv/
and the incidental changes around selftests etc that actually happened
in your tree).

So please send a new pull request where you just have *your* tree
changes, not a random back-merge.

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
