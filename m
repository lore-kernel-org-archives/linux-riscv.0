Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3428BCCF9EB
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bGUbKDFzNfMNuhA3hc2WTH7eA3snVT5PrjdANNc0gw=; b=MIYZblJPSCKssy
	Y2oZJEiqtsdnGnJ1a8f9RKSX8oyfHUwfCMwhjJF/G98g+xdFuSXN1wPyCKR/KgQ5bklMdCGHVwVu9
	/gS7ZhA3pqxksA++oFgOnsJLykikl0OXNQDRR3PKaLKOW9pg+JoLpm2FD6Do5vVCLyiDNBWpaIfx8
	ZjDTDGvwFnBunH+TR/I4YYNc95iZ9ExQ9xE2c+l2Dj5xpkThwuLidtd3oSsJZvDdyf+mTEe2TEBVe
	6/NjRk9/NHL5cSAnuCsvxoEAjp860QYnZ8y3E6+6rEDlqveExRvTvhRhA4QPoh1cb+cXNkVQTpH0P
	id40x9wO7nbp++mw38oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPXn-0000000EGOA-2o9b;
	Mon, 27 Oct 2025 15:54:03 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPXl-0000000EGNR-0ApX
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 15:54:02 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso8306412a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761580438; x=1762185238; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lyo3P6jUrO11oV/07r7VEk3+sHuM/zfcTZIIBqJLkxg=;
        b=h84y+MjF/07qZRVDoumK8EdGj271nC14uC02mI98of8m0GcOb3r86Pi7vkVOuFeI98
         ceWOnItfGx2lTsk2qXfFC1+cvqw9OEvsfRHzDBiz1vwxMoo21J28vp6r08gOvCDMXn+j
         yRLIcVXTUzSp7U2xmNll3i7ZMwHJK5z4u0VK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761580438; x=1762185238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lyo3P6jUrO11oV/07r7VEk3+sHuM/zfcTZIIBqJLkxg=;
        b=vewaMAxou+OS7ErFvLKgvR/lK3YbNFMrpRGXMgvU++Zcpl1nJgl8weJ42WLiIeQB89
         Ddq3aMIsdIxNw9yfKRZHCowDxStvm2a8u1UFq83S/CZNoTPqoreHk2UhmaAWghqWZ9+F
         UEGioDtXKDnHu0lfhrgdSVG3GZXnvzcdUPrq2fn0uMk20Qv0/CtjE/ISDoi8Hf3GsOd5
         FVHN37zC5SZy2iTAqV1gehNdExMR5ilu+k5P4m7lbyMypRxtelXxE4HW0Y8j2kDJeEHu
         g4bvVLLlzA9IakpEqS7ZAK/m+W7wSBaA2Zt5gLrj85nA2iwLoyxpkjUqXcuePYZwa2yB
         47wA==
X-Forwarded-Encrypted: i=1; AJvYcCXY/E4VXW2ADV87CF4/3clhrTxIjN3BF+GTg6xg3OghU1/cVpvP9JWSZPCDIASiumtyJ4glthih6AsOvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9r7j8/jWQwkflHURGZWK74jvb86T3RaAllPYVdClq50lckAQi
	PBe/UyeavUH1pTD8nUoxtNJ/u7XtvrYaPtRC6C0zY4L6dGMXde2DwL2ilBHimA7YYugKDL0URb0
	oKoyRLrY=
X-Gm-Gg: ASbGncsu2ZhUKA5mdDMSvBotpEWGR+vmrf0EFnAwAtB+h7VoVTEK5lprqpYBwT476zp
	dh7E0YOrt4LqmhXRDiurwxnPu992JTiir+KWbb2E0aoK4aiE/Y995hVjflGmp42ac5xY+gzrbdO
	QCgteh4watfHPkVLL8tgGyAC6teh5uEnhXs3/eyfWluqHmCyc7lXvKY4eKwMsxqoWBNRJiMvxuv
	T/41MN6cV1rBcxVV8KedfeKhl1PaACFWZSzlXoPP4d2JsYtSmLP6FQnovmFsg5c4KaicZOMT/AX
	6Ydsgpfw2LU9CQ3nFA41PQQy8evP0S6Z7gbGoTDUJHfmfYVfyZz7XqAS+vOiKVsvnRFmbgk2id9
	+P4lQ5wIJ4UE8rHhX4gB1x3Q3CyCg486oUKYkEotq2QjbuQzZ6bcIdNR3apUjKd9Wy2yI2qj45j
	kA/IijklYVajEjVS36NFKMWx7HA2fvFbZYVEes56BnPJRsd/wlDntCV0LEEoQ7
X-Google-Smtp-Source: AGHT+IEtg5fgC5oubFlkGA7VvJPxfVOZacAZsfvcQLS1o2XtBSJqhJOM5fMhVIqXkTNPxbTUaTTThw==
X-Received: by 2002:a05:6402:158c:b0:63e:1e85:6e76 with SMTP id 4fb4d7f45d1cf-63ed84d1c71mr386689a12.19.1761580438596;
        Mon, 27 Oct 2025 08:53:58 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7efd0fabsm6285618a12.34.2025.10.27.08.53.58
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 08:53:58 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63c4f1e7243so7611042a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 08:53:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCfv1Nbab1RUVpOTMM5+yYPtzzu6+qtzhifaoDq5spKvBuSPMjA0KDpAih/JPViutze7mVU/oQiArmnA==@lists.infradead.org
X-Received: by 2002:a05:6402:4412:b0:628:b619:49bd with SMTP id
 4fb4d7f45d1cf-63ed84db9e2mr369134a12.25.1761580437926; Mon, 27 Oct 2025
 08:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251027083700.573016505@linutronix.de>
In-Reply-To: <20251027083700.573016505@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Oct 2025 08:53:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZ0RdDzpafUUduCn3gOVX3a=ZmGOw7wu1s-jqe8KypDA@mail.gmail.com>
X-Gm-Features: AWmQ_blZNXFTqWGx07mPO-qNDyYJc9sRx0MxijvPg_spVplnaBKcigb1OKRcACM
Message-ID: <CAHk-=wiZ0RdDzpafUUduCn3gOVX3a=ZmGOw7wu1s-jqe8KypDA@mail.gmail.com>
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_085401_123763_5627531B 
X-CRM114-Status: UNSURE (   9.84  )
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

On Mon, 27 Oct 2025 at 01:43, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> This is a follow up on the V4 feedback:

This series looks all sane to me, and I think the naming etc now all
makes perfect sense.

                  Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
