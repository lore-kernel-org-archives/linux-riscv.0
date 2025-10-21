Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020AACCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3m4M6X5DLStrSDbz7gwzBYnSWw9rDk2g3bksT0X5KY=; b=TO/UzB+fE5rSrk
	cOWhuW7l4jJjSUmPzYnkrNaiW5/TRPOdRYyI27Kv5wX+Ly6sGj7v6ZSN6QWonKU2JAMiBN4AxBC3k
	0kAXl1gkOTPCbHFrrQi2i74GHMKp6DE3Mf+9aw4vrZ55zdfHIC9oCAfK7HE0cmcb1wUaY/PQoyAbn
	qHdog/tKexIYsBUBzcEdeCbfktJWgwif2mRTOgaWk20X6PT3lNw0V/18Jxd8DJ6QJRQ/OcWAYbu+i
	afeHKQdmdkndyeEQ5nF/W/Mm3GxXU5UVR6l2/bLRmhNu/fXDtOq3/qUIvfacMaHKaqhzxzjuQXBus
	d9WU6zuYv4Op4nvkcriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBE4U-0000000HSoa-2A5L;
	Tue, 21 Oct 2025 15:14:46 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBE4S-0000000HSny-1g5l
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 15:14:45 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57a960fe78fso7396711e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761059682; x=1761664482; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5p3iIWVRp3NUhUS8ltDIPiH8ErmpKdyMg8XkHtjDt5U=;
        b=iGGNY2K1WqLlJWzKuHi9PZu+/35b+fNOON2NyFxgWgzMxcOgz+Vpx/y6sgnLAuRin2
         hszMYY5ytuba1pwXbx5/nhRim/ADrMYTTFNjAzAS6u25dOSvDUPtMXs8m/6s0Cd7BkOO
         2icL9LKdE+22qIYXZni7IJru7OeMcOikING0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761059682; x=1761664482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5p3iIWVRp3NUhUS8ltDIPiH8ErmpKdyMg8XkHtjDt5U=;
        b=KkVFCmTSkCLi0q1yvxwTcMfFx41QeljgrYBkkh7h9oFlIh0rKahcnIAv1tLxBXUvo/
         EX6Iv2cGrx6vMjZRQwy2CEuRqOkh5/zKFoJw0/GSr94zRUfmvhAS9cemyuL6t47B1aRm
         QBW7vDxHYhE70DI0+CwzxCBF/Tasz7Mr0PVv6ER27nQ6AgItAsTIVeXBjrqd5mF6xGUe
         sHURxq6+bF5zqJ5NoT60r05MqibK4zU8W8oKMoO/exkTjlPLOTa/yS8XesMKM6lfjSTs
         A7G/3zfBo+ZapCvkPbG4K9GCE07d4PulpdBFrvVsmcqnfqgDoEp5PIh1GV1drX4chcMZ
         WMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDXasoLU5qFxr9dSg1C7cIcE1nNYhOmqumclOPxLqob4gBXYZ5uJGKlD+LIad/jGutxkB7FTuC4cZL6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkU41+e+y2f26+AwElajD28icYF6b07EDJgKR54DZ7aNwOju30
	gdD/v07nrckrfUgqe/rZADEshBpjgG+ZkeN2XeSai8ZzefGnp7NG0yzdOynvOrHk2q7tVR9aeeC
	P4QL7Jtk=
X-Gm-Gg: ASbGnctPONh60O/8kofFAY4rL2DLAq3SlhlB1XkgLEdUPVskWtcMaZTN6orhmrT7x/S
	lanl8zXi3Bywj+RG9L7OA/fKaBxGr2y1kCAojB3hxO2q3MmPmoMUR9KsulDQAZSUjpFObikhAk5
	HhuWtrj+HGSX50ep07YywFbpbXPWxvSRrauaqbRhmUHN503KENJ+iuTO0yFd8EdulM9UecPaj3t
	9oomwB0dK7oYuC72D49tnQ7cmIB1qEb3NZbs+31mQ5BJSIN3xSAr6Cc2p3SLWQ9iXlCTUXoJbmz
	5wGVyNyjH1OsKUoaQZMub2XlEBEyqLy8FYZYR8OfhG3xAVpXXMhHY/VMnfFcxkLIAmglim0N81b
	bhEYIlKhYsNF80GG8wAbhdpGvjVsGEmzUHiaCTXtU4dNIU1wvlJVRzbhN5g3kO1csZG/7F0MbZl
	PRBX1YsVlTdyy9pF2c8qZml197fVbACJ3x26X+gEldXrfcbA7fNqEhfXgTiOuiiWaX
X-Google-Smtp-Source: AGHT+IFU8nBB43LVMEBv0glCQh1rS8KzaA0mbM8N4QUxIGdx8WN9HhwB6k1mh6CLVqB7wOgs8RoTuA==
X-Received: by 2002:a05:6512:3a90:b0:579:f4b3:bd2d with SMTP id 2adb3069b0e04-591d8591713mr6253079e87.57.1761059681886;
        Tue, 21 Oct 2025 08:14:41 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deea8cafsm3747290e87.2.2025.10.21.08.14.41
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:14:41 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3737d0920e6so61453581fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 08:14:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWo8HMtn5AYqLKvax0zbKzVrMD0fXthUd+kNJgTmuNpdKPB+FPup119tmVv9rlhebpf4bJO83oFuRZ0nQ==@lists.infradead.org
X-Received: by 2002:a05:6402:1ed2:b0:631:cc4f:2ff5 with SMTP id
 4fb4d7f45d1cf-63c1f6c39a0mr15531402a12.25.1761059216055; Tue, 21 Oct 2025
 08:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251017085938.150569636@linutronix.de> <20251017093030.253004391@linutronix.de>
 <20251020192859.640d7f0a@pumpkin> <877bwoz5sp.ffs@tglx>
In-Reply-To: <877bwoz5sp.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Oct 2025 05:06:38 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
X-Gm-Features: AS18NWA4hFVtubdvPHiqdyKph2ZRKrwMfjnw6C6eEZqbhQOMaKTPF5q4gpdDvSA
Message-ID: <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251021_081444_449338_01320E55 
X-CRM114-Status: GOOD (  14.41  )
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

On Tue, 21 Oct 2025 at 04:30, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, Oct 20 2025 at 19:28, David Laight wrote:
> >
> > (I don't like the word 'masked' at all, not sure where it came from.
>
> It's what Linus named it and I did not think about the name much so far.

The original implementation was a mask application, so it made sense
at the time.

We could still change it since there aren't that many users, but I'm
not sure what would be a better name...

                   Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
