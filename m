Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992BCC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YR6kRZmpr4wR4rjZOa24BiNGes9n5X2R8tFiS6yWkDk=; b=oUybyTaRuzRJ2Y
	JFgESpspd8osVSM/b7PQMjOrZMQQ7YpDrVQLUpgRifBr0aVAk03kg0R0gYvHSlK7Ge7dWpQGCk9HK
	EKqDgv+JLW4ELAYiNRmUCKdf3s/2v4TWugNuFGm5kHpG2FSHT5kicLlY8U1aIB0+k1jFCB8Fw5UJd
	4LfHCs1EG71jQptp9TdbYUTQZ1tqVKQuWOW4fTpqJ8/AdROAG2SjJSTHIX/k8K0FhEUuLlacnPYcz
	hIPwgGjHGGInYJAXIg+5PLs8bCgok0aPpzUm3XPKNMPi+gF829YAVcwdgfdHFjgfbg1B31dbcbIy3
	m7d+oKINnmEP3FBI7Cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCiHP-00GNfp-Ih; Sat, 16 Jul 2022 13:56:23 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCiHE-00GNbT-1E; Sat, 16 Jul 2022 13:56:13 +0000
Received: by mail-il1-x12c.google.com with SMTP id w9so311875ilg.1;
        Sat, 16 Jul 2022 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V4FhIyepvRr1gXawjyEQpzIVadAC7ZxwCjKEzgRh/bc=;
        b=KdWH1PfnFwqpPxd7W0PxapNamksI04N1J1pzzmASbjhZAa3HLxSSk5HwzaEAseuXpW
         nNsgKAEAxGvztay7gho66xNc2QCxWwEyGXbCv5lAz3EAhFpFJfuIeY7K76/0vq1k3vCQ
         2A4ZeWEkN4IZQH1TYyqAVV2R0ANWdmP2osXk1QbS92RBijpvBQo0R3fnlJ87Bav+p7xf
         FSAfrCYfgPPgpP/Eo2QbIXBrRk5zd4AvPDHrzOq47USph/a5huS67TiBDFyW8noTS6Uh
         Rr0qFvkmBG2Rj2WAofY8yIfRhbQByw8ah0SxA+yZ2h9GNamE5b2FqVNxaZBPSBZiccV0
         aKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V4FhIyepvRr1gXawjyEQpzIVadAC7ZxwCjKEzgRh/bc=;
        b=XegqSDSab/1gz1Xq6bI2g1AQwt9eB+ARNrB7JGuIY0NNYiXaG8Wtf7lyt3x1S+DVY/
         1t4oqF5V+vVDLGEMt2pU45YfkQkfVLCrTfMnXbBtNbHSxsVXuUN2Bdw/lQIWQwQ2dD1X
         HO4gqUTmXW+PuJYo+QMLIokWK4fQ7Xgxg/zQfC3vHJ0jowRMfywSGBRmrOgO7CDpGq9w
         EYuZyD1iUH6Q3LmaRoIIpBE3cweyeUtOEOPxrf3t1ck9DrWf+eQS8++s6x8PFLlv0A93
         jefK/ywd8e7XlpiPksbdxX4/UGkF1NqzOHNLVZkfnloULbCWrghwi25omoHFdAkIeQiK
         j00g==
X-Gm-Message-State: AJIora9t7apHJyKMMWnTk6NnkjoqnGFumeNOat21qFt6iiJNDyev+UqX
	CWeLjccjVx4GNhpIgLbV7ME08twFeKS3Hs/owtc=
X-Google-Smtp-Source: AGRyM1tr+wIQ9WPj4ffi06adPAclHl6+H10vOy21nRYCi1+gt6eZYnfIg0TqG8PTuM+GqMyjQgVFJxK/0/WWZ5rGrRw=
X-Received: by 2002:a05:6e02:1c2a:b0:2dc:621e:df15 with SMTP id
 m10-20020a056e021c2a00b002dc621edf15mr9816280ilh.151.1657979771086; Sat, 16
 Jul 2022 06:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220716124214.329949-1-conor@kernel.org>
 <CANiq72nYRkHV6N2bGpTz3td=2Vto21apvZW0igTT-mV8TZtB2g@mail.gmail.com> <4a6240da-9003-cd74-cd47-f95ba2d9e7ae@microchip.com>
In-Reply-To: <4a6240da-9003-cd74-cd47-f95ba2d9e7ae@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Jul 2022 15:56:00 +0200
Message-ID: <CANiq72nDcJLSB3pLhkdqGdLitfmqqCUVVfkY5EjP9AcwVv9B4A@mail.gmail.com>
Subject: Re: [PATCH v7 00/25] Rust support
To: Conor.Dooley@microchip.com
Cc: Conor Dooley <conor@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um@lists.infradead.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, live-patching@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_065612_093339_BD45BA72 
X-CRM114-Status: GOOD (  11.06  )
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

On Sat, Jul 16, 2022 at 3:51 PM <Conor.Dooley@microchip.com> wrote:
>
> Ah right, sorry for the noise so. I checked the ml but didn't see a
> report there.

No apologies needed -- thanks to you for the report, instead! :)

> Thanks Miguel, good to know! I'll just wait around for a new version.
> Just been trying to get my CI etc in order for when rust support lands,
> but it sounds like I should be okay as it's a known problem & not some
> only-broken-on-riscv thing.

Yeah, it is a simple `bindgen` issue. Thanks a lot for making the
effort to prepare your CI in advance!

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
