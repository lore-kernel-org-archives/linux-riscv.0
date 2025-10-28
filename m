Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A2DCCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5Gpz3AtnDyXeLus+LckvsvKwiLG650lp6Wss9U8qqk=; b=BWn7BDblKSzxnM
	uJ5Dg0fp8wGH5WCRUqwCoTybnmWLO6RvOMBNH7Rp4N9n8JInQy8Vc6//8/LLjgSshf4atTXUYwOvE
	6k+jhVUL9DJtmceVmpS9vRIWgH6RsVsNDJQr0r6Ppq75mvT+Ly74Q/CJpmNIYY9LPfEWLmx4MdCJy
	sDaU2sS4b4Hd30531bgqDtoMs2K6xKa2qfNTUcRuVXVYP9Yo5VxE5Sdha1+05jqmiYpkG/KWNuoUl
	v254cNHiwMqOZwzOxJ4anKMfi6mM3iVMi2SX0iOcHQmBFD+8ttZW7+3ICBRrBY3bTdkyUYmy/n4eh
	3RFzLVmEfgxziQPJflaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgP8-0000000Fh8Y-3A0E;
	Tue, 28 Oct 2025 09:54:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgP5-0000000Fh6g-2qiG
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 09:54:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so34137035e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761645250; x=1762250050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eov/MPh/YX8dO6loIW1fKNx4DJr3A70PfDx1JeMPyWU=;
        b=CFrzzo5UipMTmehr0EQVg6uCNo3XMoS0txE9lD5iSzEw8doWrkeUb9xmY+0qWZOXRO
         znihjQOpqUEX4GZ+9P3Hhz3lTN55+aRrE4iK1rMuYpqE/R+PL/MAB3ZYc6HAsh6hUG76
         WCnd2133ZNR7ofzDfyNyNd9msLrkI8Sc5XBPfD1kcxsMGmZTrvL5ykdVeePdUEq1lsqv
         lhEvKqGxaO7M/FkBL4jEPQTy89/0a4l9WZ06Cj7QHj8O47P7iH97q4G6lAuX7qTm8p8u
         wHYe03HNFbop+yZVasmBoyK+a4yMlxi6baB0YJ4xQ12gBwU5GkR8AIjSHMqpCzhi2H65
         y8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645250; x=1762250050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eov/MPh/YX8dO6loIW1fKNx4DJr3A70PfDx1JeMPyWU=;
        b=Zk4sD9qzjPaSzB5BWjZ7uTdJSjmo1qB8tfRdfvhGq7CkUWsRPIulC9tOMrvyyTP2OT
         HeFEMrZf+hvtCPYC1icsjjs264iLv1HNFqkPkdqI0czyys8oRONrXnLy7IUKVwoS+fOO
         pQtbm08XV0FBYoJuLLj5bKOMiCCZjhBY7yXYtc2lwuMSex9IDiZAB1emQ2ggNK3ymIUX
         k2HZ5c8uIraVW+N0im6EAuzRDPoP1flWNuDSgxHEy31YUqavN5irVnHeRRu+6GEEzexr
         Y1fkcWBtRXhn1ezNEg3l1TIPZKQ0IEInfYjWH8uz/ex+XKN5G4MiVvQ8GdYEJwMkk5FX
         TZxg==
X-Forwarded-Encrypted: i=1; AJvYcCULxWue6NiCR2CtZX/D5LP2BJ3SmXA/SJOkDtEjaiSagt4S5X9lh4XZJVMfriTuWmY1IHirTtUPJd/gtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZsB1GcShIhbzxSx1JyV7ZVeswQI8xiwYG1lZ+r/J4gIEyRWPj
	q0g/DuZPicBA9Ovgzxop4YOomlYBUl3XUN4j3Hor+dvVIgcGALkA0xlD
X-Gm-Gg: ASbGncvVIclAq7uQL3aTkjYzaHKTQRDypjxPvK/lLGg7FdKjHvEc+fw9VVHczoncX/6
	sGQSdtDnmTNREg63CQrVVC2pDAHX/o2r23WVgkpaMK8z8A41NfSmFsAIYNizvLcCu0l24Q/CnTo
	5VY5xqmlpLTodrI0vVZ/6b+ArPcFAHVslLPwNw7F5a1h+w6PkVbHGo0uppitLTMyF3bl5naKxtc
	BJRCPQuu5S8Vxyiaa+jNUVbLq2nd8Q6ZaCI+39OR+kmNUpdEu5tvLDlYVXm3XCiVSGIRBAF/6+P
	ncT3343hGc0XnQcBfW0iYLUezb6gjNAMHyoDdkgLiM7kJBoRSyn1+rwQnt5WP5Vztq+Ac+140WI
	8Zg5fkxMdNgc6e8J2+idiAj6sY8NvNH2ViafDU5Ln6fY2u0EWpVpBmtYAhAT5re+HWxOn1i1FpV
	o0s04GHfLLDg1GCnmlDegTjWC/I0Je1sFHQgZey2zCOw==
X-Google-Smtp-Source: AGHT+IHTsad+5R9VyJ1jsBgS805AF7/gtOcePpU3LeuhaXctgbpE0MIvJRpdSfBK4sVPhc9XIgYUZg==
X-Received: by 2002:a05:600c:1e0f:b0:475:dbb5:2397 with SMTP id 5b1f17b1804b1-47717d488f1mr20861355e9.0.1761645249706;
        Tue, 28 Oct 2025 02:54:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4783b8sm187327045e9.15.2025.10.28.02.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:54:09 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:54:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: dave.hansen@intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com,
 christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
 edumazet@google.com, hpa@zytor.com, kuni1840@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mingo@redhat.com, mpe@ellerman.id.au,
 npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, tglx@linutronix.de,
 torvalds@linux-foundation.org, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Message-ID: <20251028095407.2bb53f85@pumpkin>
In-Reply-To: <20251028053330.2391078-1-kuniyu@google.com>
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
	<20251028053330.2391078-1-kuniyu@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025411_736109_6232241A 
X-CRM114-Status: GOOD (  11.33  )
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

On Tue, 28 Oct 2025 05:32:13 +0000
Kuniyuki Iwashima <kuniyu@google.com> wrote:

....
> I rebased on 19ab0a22efbd and tested 4 versions on
> AMD EPYC 7B12 machine:

That is zen5 which I believe has much faster clac/stac than anything else.
(It might also have a faster lfence - not sure.)

Getting a 3% change for that diff also seems unlikely.
Even if you halved the execution time of that code the system would have
to be spending 6% of the time in that loop.
Even your original post only shows 1% in ep_try_send_events().

An 'interesting' test is to replicate the code you are optimising
to see how much slower it goes - you can't gain more than the slowdown.

What is more likely is that breathing on the code changes the cache
line layout and that causes a larger performance change.

A better test for epoll_put_event would be to create 1000 fd (pipes or events).
Then time calls epoll_wait() that return lots of events.

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
