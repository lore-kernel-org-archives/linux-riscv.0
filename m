Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11293606A336
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1JVrzyXp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2YFLRQ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tYhWOi9c+ydCcNE0B6cbURUK/AnhZnq/kM7Q7myKC1s=; b=1JVrzyXpjEB+zDsGfFctUxojWu
	MS6Amj2x3FqYcEvDF1aB4TShrpSmD5OM80Dilu0vePTi7JF7RBe1wzpqY67SbRONr50+sWYJmQaXH
	Fv4I8Bw9lYhKpF0vvAx2O284gTHiQ+LhqvUwLQhdI73FEjkCwxCMtRbc4I6xY6LMpzlbxjZOjRiCI
	O0TOoKKMgMV1gGwidnaoQKA8tB390wIZduq7M0mgJ8U/Fl9gHbAG2NurvnfpQcJjJ8t7zbG79O8pB
	QgCZpvFZejQon7nPxKrEPIJk8w+vmB07YvShu6o3y05TX8/3y4Nfk6ERO0W4PhJxqWCsPXB5/0J74
	cWg8wnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl2P-0000000BaLV-0cnq;
	Fri, 30 Oct 2026 11:44:49 +0000
Received: from mail-pz2-x0a.google.com ([2607:f8b0:4864:3b::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl2L-0000000BaKH-3rMf
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 11:44:47 +0000
Received: by mail-pz2-x0a.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso107094a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360684; x=1793965484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J/6UIvMwC+2M7xk6hrl7rsj5PVVyi+u7mrNva4BtF6A=;
        b=R2YFLRQ9x6YeK6M1amo+4zI7JM+bE3Q6YqtbS/tCLE5P2BhvTXkApCsvRHcW7eXlXv
         MTEexpqtn62gb5zDpUKCjteI7j9z/Fhgm+hHNsPZW0z7876TVgjbcZ29w/4E8ksVGI2p
         O4FJnz13uvtqroWkNYZv/NlfqieqSfUdqUle6BSeZAkr7AnJ0xRad7fKDxJJCU1FkuBH
         Wd+640UUO/LgBPOJH39JcqHwwaJVPQxa9BNq0onH6v5j8O09rs6reRHk0KdpVHRD6qm3
         Jr9MWPJ6YuS4mDKLRz4CCtmjcDnwNvr2P2cyDCJSqU362GTrer029J0rf813X4tpYUDX
         dK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360684; x=1793965484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/6UIvMwC+2M7xk6hrl7rsj5PVVyi+u7mrNva4BtF6A=;
        b=1TdBflxbKyiuom5rpuBaKGCVwpo61WRjK+2NE1ceLnWtT273db12QRjlwOhxVcZtKk
         cfVBBWfyr26u/cj9mgOoUJsV1BGpWOGD83vtLMHQiJvqMp+Cg/9nit+ip01BKNaxPOLa
         +qMu4wJEiq4u8O2Li4vCn7joRV4lj1RpQZHiI0cjswRgqc3PLT9wj2wz+aeDRjvCJe6b
         Jdm3s5+1oIRww1ij2hvhjwqyyBevkH3aHJu2o207MiJpDAIhFJHjJhpnD+ARePUi55Dj
         AEhfceesll6sQIiFnatJBeiwWJYdJcXNww/YdA06fNUQQU5JtcwkEv6Rs+xe51aRBKgO
         T4zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTHLfCTsAdY7Nqwcspf9uu1XpY3v05YiywnvHgRmQ4AfAJm5FgrvO5wS7Cbz5TcXXZdd9/iuEtxOTx8w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJt71ou1WPGLIN8yXjWQCb/Qg04AphoqOE/Yw4NRGz2tosmI3mP
	ZXW3XJ9U+vuv5nkuXJ37ZzbaWFVDkXznFghPji55PDXh+A8IOs9ygzlF
X-Gm-Gg: AYBFou34UVCI5TbgPcoUX95tyIT9yhnVTksWdGMZY/DqSfTCQxEFBmpqsHT6lruF3Ct
	BwXB5maGNVNYj0i/t3gaWAjulJA6+OHgOz3weW7oNSmM5bQfGzsBa2HUTGGBKvvXodIwpqqPBen
	ExUzfGFJ8KBxAFjZuVmBUw7QftfFdeYJCmA0ziSsbNa7IKkdQkblSTXPPaj6Wpjheqd4wn8gkMA
	I4MsSZgY6f4Ct3jS+is/UT4gn+iFSfIL7AI7Z8IA7pKuyHmdYlixKKnEkxM+LZMrlIXUXhHg/gp
	5L7pmIsU5eyaGwtZRCmdqJVsEOWsnNAG9Jyy6OwpemMAQET4JuccDGgD2h6NOJqBPp5v6BId+Ge
	J4e35FDkRqPFVyq/gKzT9x96yB/YVIgUsSpM6p21CGiZOEgCTake/7wSdPHxcCQ4iyKBB5egWfV
	7DGhaRdJlzHJpJ6PD4piLqXoHRTXykUqnGqqfh7uiDakdVBmE3HehGP9Oc5fuAGL4uU4fhH/KAj
	mB38cqZ6GtQX6HPzytuZRc0F5hcuKfvfvKgfFeR0zvXHFPZAHgypc/3GYNayAsT7t9Wd/QjjQmr
	m74jIwrdbBkxA5vgBifmPQ==
X-Received: by 2002:a05:6a00:2d1c:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8a9be5896acmr1842901b3a.15.1793360684421;
        Fri, 30 Oct 2026 04:44:44 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef957e6sm660253b3a.15.2026.10.30.04.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:44:43 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:44:36 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <auSDJH9V31wmbrYv@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-amuser-savior-6a6ab062f471@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_044445_969618_56352276 
X-CRM114-Status: GOOD (  25.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 07:20:41PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 07:08:56PM +0000, Conor Dooley wrote:
> > On Thu, Oct 29, 2026 at 01:05:53AM -0400, Kwanghoon Son wrote:
> > > Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device trees
> > > and Rust serial driver and abstractions.
> > > 
> > > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > > ---
> > >  MAINTAINERS | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c958a81b626c73b422c0d4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4926,6 +4926,19 @@ S:	Maintained
> > >  F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
> > >  F:	drivers/iio/imu/bmi323/
> > >  
> > > +BOUFFALO LAB BL808 SUPPORT
> > > +M:	Kwanghoon Son <asdfkwang@gmail.com>
> > > +L:	linux-riscv@lists.infradead.org
> > > +L:	linux-serial@vger.kernel.org
> > > +S:	Maintained
> > 
> > Missing git tree, unless you're expecting me to apply patches for the
> > platform for you?

I added this entry after seeing checkpatch's MAINTAINERS warning,
but made its scope too broad. I'll separate the BL808 platform support
from the generic Rust serial abstractions in MAINTAINERS.

> 
> Additionally, are you actually going to add wider scale support for this
> device? Like a clock-controller driver and the various other
> peripherals, or is this really just a vehicle to support your rust
> serial driver work?
> 

Yes, I'd like to extend BL808 support beyond serial. I have local work
on peripheral clock/reset support, pinctrl/GPIO, SPI and PWM, including
an SPI display on the M1s Dock.

I'd like to bring those pieces upstream incrementally as they are ready!

> > 
> > > +F:	Documentation/devicetree/bindings/riscv/bflb.yaml
> > > +F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > > +F:	arch/riscv/boot/dts/bouffalolab/
> > > +F:	drivers/tty/serial/bflb_uart.rs
> > 
> > > +F:	rust/helpers/serial.c
> > > +F:	rust/kernel/serial.rs
> > > +F:	rust/kernel/serial/
> > 
> > These should probably not be maintained under the arch support since
> > they're not platform specific.
> > 
> > > +
> > >  BPF JIT for ARC
> > >  M:	Shahab Vahedi <list+bpf@vahedi.org>
> > >  L:	bpf@vger.kernel.org
> > > 
> > > -- 
> > > 2.47.3
> > > 
> 
> 

Thanks for review!

Best regards,
Kwang.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
