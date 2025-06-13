Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8707C71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyK5czDKEQBGs14uIwYiWsqvTNSpgWbZeDe5qsk9cQY=; b=HJwJYBzIaN00ul
	MTvT3s7fJlxIiJY7gvJrGLCWs4+5QJ5HV2wUf3esrhPSJn8tqnjfTzZjqzkcZs0HCPD09TtUKc1Qf
	Twu63OvjBK0hpAEBJoUwWRCfngjDUfHRO/bCs+gfS8LIqFFAwnS20HfCJSrNZQZ8qYywxVfB5Se/i
	LPr8FmS8uAhloogTgeCnDGCE1N4h/muA5rkJavbGbu83HwRT/KfsS9o3py2hrpaa/GJcIzJmR6Yik
	42kUVprHxgEuWFDFF5KpQKrWxCDMD6csOE7irWaCkIZcL6toKmTOtl0W5sG92CFqTZ+5wK3qYGdaO
	ZdbXyT4TxKtKHYJbFecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzCZ-0000000Fgy9-3iVW;
	Fri, 13 Jun 2025 07:51:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyza-0000000FcoB-32Nq;
	Fri, 13 Jun 2025 07:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19D6043688;
	Fri, 13 Jun 2025 07:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE10BC4CEF1;
	Fri, 13 Jun 2025 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749800306;
	bh=Zk9E7B0cLEq92YUYEu39PlPpaS6WCK5qgzp4ebsQ2B0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WtfSBnNCUmuYf5NcrAgqVTt96tHIUKFJjXr7PvpldJPScV0tuOvGnajWm1O3tZXkO
	 nUOYkh9/7JmQb8F0mP1BcS18U37CM95+rlMGvYqivLv3nUq73wkPXM9Px3rBBvzljy
	 Frwe/AcLm5NwMOuO43bPX8iKA2Z/g8Xiyo7A4AEaRFzzia45NqUH2jwPOhxX9zH3rE
	 BDWaV8f5tyEjPv0Gvfeep2/ETr4Y5PgqniqLy3mbJnHbhzjoE8R8+XgJO8Bav5IvGl
	 atQUCp6R4L243D9DJeMrDkwWUS0sZVeix0Zke6AclHXAJWjg3ZH0+q+gNdIlQVoc4M
	 PgnnFOti0q+Tg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-551ed563740so2032285e87.2;
        Fri, 13 Jun 2025 00:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfNNEAwPTx8AUbopFhhySSBK7iDEYmOJ7w1TXAhwQeq/Q+T2phIB97dtuFwUVxRjrkeHhC8frt0ZM1iqw=@lists.infradead.org, AJvYcCWxKUvxDQjM4Nhk39GZe6sevAZoE4DhfhMnbuQeXxudE3lEpqZKqque2qhuORuPT72NoTAMM+nZJdqf23mHZwHY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/jNhKGyWU1wNUWG4lEwpd8WelTi7yeU9vvPVXH4wUdJraxlY/
	UfeW2Ya+mbMij15Sw+BVLdUS9yO06yfijEyVGu/wRDbyqTyjf+w3MT4cMHmsmcTAgnCL02dNamr
	mbeqJcz3tUNdSN3xVw+LutPouI5OltCA=
X-Google-Smtp-Source: AGHT+IHlO4hZ7n7uTJh4T8Gyrwm4r7eJzxuJkITnqDB9Kgj30CFlF7REbfDIhM5d+j/NBrv+1KJlS3nHK1VNyHiQv00=
X-Received: by 2002:a05:6512:138b:b0:553:2190:fef9 with SMTP id
 2adb3069b0e04-553af97a5c9mr527698e87.34.1749800304328; Fri, 13 Jun 2025
 00:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250611020923.1482701-8-ebiggers@kernel.org> <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol> <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol> <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au> <20250613055439.GB163131@sol>
In-Reply-To: <20250613055439.GB163131@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 13 Jun 2025 09:38:11 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>
X-Gm-Features: AX0GCFs24ZatfLP--3A0HdZVLkk0PxiYFRdOEZErG1-T31ygmhYk5yo9nxe3t44
Message-ID: <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Jason@zx2c4.com, torvalds@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_003826_780644_8BCDC5E3 
X-CRM114-Status: GOOD (  15.56  )
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

On Fri, 13 Jun 2025 at 07:55, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 13, 2025 at 01:38:59PM +0800, Herbert Xu wrote:
> > On Thu, Jun 12, 2025 at 10:36:24PM -0700, Eric Biggers wrote:
> > >
> > > You do know that most of the sha512 asynchronous hash drivers use custom state
> > > formats and not your new one, right?  So your code in ahash_do_req_chain() is
> > > broken for most asynchronous hash drivers anyway.
> >
> > Every driver needs to be converted by hand.  Once a driver has
> > been converted it'll be marked as block-only which activates
> > the fallback path in ahash.
>

Perhaps I am just slow, but could you please explain again what the
point is of all these changes?

Where is h/w accelerated ahash being used to the extent that it
justifies changing all this existing code to accommodate it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
