Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C83CCCD1A7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 15:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4zJkuo6Qucb87h/n/laMCayyPtBQjIbCDQWz2qq294=; b=YVnmRDOp0IHcbc
	zdyXnkA2NRwQW84UfDVG5YlyWZb0CSYrBx+FmfyGRY7qz4Yz7yKXYIEo1x/5epm2yxbBSzeLbsOlS
	714NWMm2M8Q+o6yg6PB17r7K6qCMAXq47/+pNSFTvJRl0s38azLmkMOoSZDpkYAySwQUMcdICKrh7
	V2/AQu734gTSYKKHtrHIrDiYmnJUvgjSwpW2D2C290EAPAD+IAhFzzsC+cBcavhk63J+EZN8JtEij
	I5vg6oZej6MzRIP/x1jtK4of5Ol835b/5cRgcwz9lJSKBEK6uDKiQVEOrRJM0vfH9Icv9tzUikM0F
	h182hnYTa8yz2ietSr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEeW-000000000Of-13Vl;
	Tue, 21 Oct 2025 15:52:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEeU-000000000Nf-2suw
	for linux-riscv@bombadil.infradead.org;
	Tue, 21 Oct 2025 15:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+0cSMAwFRMJRxsYANvmyJeRZmZI2zdPSEESzl/tT500=; b=Qb0eVjTvc0Zvv8YBdCvuC8eDqc
	745S8Q5HRVACSb6wZhF4nRM9KM1v7aomQEURFupV22nmpPt+EfZu3VV5BwhXIG2vDvlHpuu2oJRhI
	/uQuyb/VXapBWyZ9kH+FQAIkJDo6xzjwoleCYHdQO4/ENaodJFBwDDav9di/Izkb8YrcXowo15l6G
	qypJfvqvhwXyhsK4TGm8vgOyehF+rxziNpKbIQJQmit3j3FuqtGGZ/+oBHqmDVc1RtUZxufC2+b91
	pRVM3gteKbi6uYEhcrWpQ/w56PjKNE4CMRZI/ni3youdfAVLRCXNpY1YmgpJr3aNdco/ivMvMIGLt
	dbD4X0bw==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDmk-00000000puj-0qld
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 14:56:29 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so1107683666b.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761061907; x=1761666707; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+0cSMAwFRMJRxsYANvmyJeRZmZI2zdPSEESzl/tT500=;
        b=VVITcFFtUgOS1/sn4VA7VqBazhwsm2exmR/yYB6ifcWhs6S/jeoIQMI4ycjHXugMrn
         gB4pDAzPTRoLk2yQbU5ojy+B13itDb0zAuD82BsMnwPZyRC1p4zI3ejF0MobpWQvK01C
         aoiXeWFPXaYNt3AGS3T/vUuS8R7NQGgtXFmko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761061907; x=1761666707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0cSMAwFRMJRxsYANvmyJeRZmZI2zdPSEESzl/tT500=;
        b=DXpzroBxP4xcFNAKjrqbV7Re2l2oJUrLHbtuXXjOiTdGMzTz1lDlPUYxiAC/gbCopQ
         xtuN3twz7bwIu1W9ArDyoiiqT5gwY5hBL4XokfdPUQtnthXtlonnI2bTtUnkiGiZfDSD
         01FMyhSTxtnkma/MtZk2kxRwVmZlPMTLwFv6SmhxtKbheedx014xusDZmTO4zA3YLqAV
         aiWY/vJw8qlgW6Cn5cetnCdHdLcp9QDovW24qFzInkf7ip8y+tUHVvWawcJoKeh3yRpR
         Yi/x+4OHgYle45ZdtenVHUBRQHVi7Oo2ehIBFVPqis9/mk+/FE7sDA81wbdhVOd4GoKW
         4K6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1EPgg3X3I+y54EczkDZ6yLK4XrWkhOdCYRikEXqavqGiSQ8qAd4V9RBG4QlfWEFDhrgG4yRT3pFzbQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YznrY+SEcP1X6WKmAOXxEig+KhqDcDuKwbXzDmsbDZwVrNQuGw4
	l5Bmi9cUu0MCYI1ETInONIuWUvhv0pHXB21aYnaWIPO0ijeeYo88oF52+9yc16sF3qJ5JfKUfRf
	2gt2KBQISxg==
X-Gm-Gg: ASbGnct1XKgj6IjoIQut2lKutSIjpnQUfxdeEmX4xB4LSI4a7fzKFxbg5fq402eyrAf
	akVPhXgKZv4zw38gKgbidJF9mNGRPXtcr/FSXUMXUntS3gVQX2Xl84kL1A7meVPJujy6ToiUUZO
	U3fN4rhe7r9qVtgtV8dHZnfH7S5XOJNzscQ1OlkF57WBgSPi40dr2NfB+TxEyfgkm0efRkMLXzD
	sfLK8QS9vJqF7+BIDwS9mfjJsH1AwXky4lazKfScgwQp7KHqc/UvB50642oLblTUn+ZlWGMwYdN
	YtIchNODC0mVJuyx+yZlwjlgOt5cSqsdHOHLFxrHYzD+uRdrLtD2JZeBVM71VwCmAgoReV9mt6r
	gY+FaacFGyidsoOgn5EeWnipAjNpmCs/vKH+wQNfGW3afnHoBqz5rxFw0xmrkY4DjNAw0xY9xuf
	FhKDd0OxPvf84+SuwzFbCLLtyvtT1ADVF7eY2c/2NYUQDmwiZmLLeYMnq0XpTM
X-Google-Smtp-Source: AGHT+IFZ/JyJnoZECAX5xKiWdYQ357cBiOArU52yllta9Yx1Rvy5760hijiTgxS9GYw3X7WK6lZjrA==
X-Received: by 2002:a17:907:6ea8:b0:b3c:f0a4:b324 with SMTP id a640c23a62f3a-b647463a1a4mr1850094466b.21.1761061906716;
        Tue, 21 Oct 2025 08:51:46 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83937a3sm1116501766b.23.2025.10.21.08.51.45
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:51:46 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so9311556a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 08:51:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwZUaARGf5todAr3k17VbbJUBhwZmAliExM5LS6a4UaySCZs8ikSwCgsNRXvXWXDBfcjalTdPuiq1SUg==@lists.infradead.org
X-Received: by 2002:a05:6402:518e:b0:63c:4da1:9a10 with SMTP id
 4fb4d7f45d1cf-63c4da19c97mr11628470a12.31.1761061904052; Tue, 21 Oct 2025
 08:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251017085938.150569636@linutronix.de> <20251017093030.253004391@linutronix.de>
 <20251020192859.640d7f0a@pumpkin> <877bwoz5sp.ffs@tglx> <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
 <871pmwz2a3.ffs@tglx>
In-Reply-To: <871pmwz2a3.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Oct 2025 05:51:26 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj3VgQAwUjfM_6f5O5gFr4kXBma2q5m8PLarRCnA8R49w@mail.gmail.com>
X-Gm-Features: AS18NWAG7YIQvZWdpCHOlvhJ3OJWyOrD174ntZFm1lwB34kJVwOkBypjHYnGjQo
Message-ID: <CAHk-=wj3VgQAwUjfM_6f5O5gFr4kXBma2q5m8PLarRCnA8R49w@mail.gmail.com>
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access regions
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Laight <david.laight.linux@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_155626_690062_46689DEE 
X-CRM114-Status: GOOD (  14.57  )
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

On Tue, 21 Oct 2025 at 05:46, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Tue, Oct 21 2025 at 05:06, Linus Torvalds wrote:
> >
> > We could still change it since there aren't that many users, but I'm
> > not sure what would be a better name...
>
> I couldn't come up with something sensible for the architecture side.
>
> But for the scope guards I think the simple scoped_user_$MODE_access()
> is fine as for the usage site it's just a user access, no?

Ack.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
