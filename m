Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044D606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0B4f6Qw7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dP3la4/k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rMJ9V1Vs9oSGI4feMKOiQxuwP3ZKirFademT7Rx5AE8=; b=0B4f6Qw72jVEDVWaJQdcKzKQgw
	RsrYQpwk16TnBhQB9KdsqlG/8ci1m081w+v0adq5K6qbpgf8+N0MnM1wD2XQXDId9TFzJl/ABvgNR
	+JwbS6x3heyN3rNHz9vnJM37WoD7U4v8JjhKS0NhR45KIDA8O6hEH/RFodoVrrOkvzIbZY2Y2VgwA
	OiZTJaZJbHlnq0BhtAcsRatlRhIRgT7LyeXLNSlJJkrtLoJWBq0P8t7Tk4s0P2HFhZhqcnhL6Xpj5
	kZUc82KeDJi1+huetDgGjPnZvK9vNPWhtGiSF446KyviSbChF6vruzTz9kvYvicX0i0dZvwsJxnyc
	WzlICyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1ik-00000005lRx-2sNp;
	Wed, 11 Nov 2026 06:22:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1ih-00000005lRX-1ilv
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 06:22:08 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1599537a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 22:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378126; x=1794982926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UfQ1SBe18fofvg8ZZZgctDqwagjqFYv2el79q9J7+kI=;
        b=dP3la4/k1Dg5el9gbSt26kyIuqYtfdvWQLF7nyxVqQdCT8NS7DtW5kcJU5tkhtPvJj
         pctwi9gj+54KUvpZFLeRiTFY5SSTQzbwe4TMV7ziZ6ODgulYgNBZ7nOG0GNECZUDxABK
         32hll3d67pcm3QwH9Qo9CG0B4Q4g/3gIbDfrUen5Mfnxd6mzYO79BYqr4ZeTw+9uQsIg
         Lmk5ni4iw51uHAtPnYal6Akk+oEpp6Q9SOhTqefIfGSzjd2fZEXsMijvijKeWmDDq0bc
         S86y4ePRFcs6s6NHb9H3ZZdI2rQUevRBf8s60WY31l99R7+33w+rQjSpHAyoYaYt+WpI
         5AOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378126; x=1794982926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfQ1SBe18fofvg8ZZZgctDqwagjqFYv2el79q9J7+kI=;
        b=gwrhRD/snu8tcbnkuAqpiqm7QPLQ34BWWCtI1yPyHgB8PjY56YAjbLHbdwyQrAzMC5
         wGugM5cb8jKTHdilMjeO6Oc66F09S5IDg5yX8W9o4U5Z+J1tbkhAMyKvmdO5S2pn1CXE
         lENOimXWNdK1r1Y7x6cNEd3r74TEd+D6I/EFTKq1aZBI141ZAEmlkt+ifwpHCc0H9rgy
         RpxKo7eYjGCkXPrZjQOgZNVw0Osh3/rxd/DUKsi9gs0Hoo7ePkoYqlPNwnpYziXJkrlx
         Lcdes08KlR0C47ULJ+Vw0SuOO0afcBa6XpOrlsGkdQJvXhD55RhvyyQNXNK7VdAneMEu
         sxlA==
X-Forwarded-Encrypted: i=1; AL+hErFfUvIMxL4hZoepMD64yIMgSpqH1tiU1TJPqURXC7YljXn1JXuk5MCfZhe8N3IWXSf13tAc32FlNugsMQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/KH8ygx2Uf0ce7UGp3S6LXlCiQw+A0UHs7z4TLsvDCtZwDr9oE
	wPGJBk0rS6N/awSYb7Q7pl5zPLz8r+FdvCa5Fnl9wZi6YCTBSEnOtS9f
X-Gm-Gg: AYBFou0PIQkLuzxi1KY+dpfFGbVsQSZcqIeu5rxxkdfP/rLmUZw8UxqnMxXBZX1amAE
	Zsc+s7j3m+SvT1yi0lS39KmW739sP+NGj2Pkk/DKKnkA8Yj4t93gTcAJT1PgSelpqds6Een4PUc
	I/Um5tXF8Q3D2ZnpRrvo2R3lrhkQUCeZkCKvKoFsJB7LlEaRC0r+tQqUyqK282wFNLnoGOdmo0s
	7tvKi7u1idnopckCINQktHL27ZF0OUTcCBKUwgctmA9zXbEXwKA/Dv9eBdKG/ttuFipJUypyEYN
	xhmC7DAjG8YY6ec4Ccs/jQcACknwApw88Yg728y6rSBGKCL1npj1AMscR9Ga8JNP7Tm5Es9GhsV
	eSICPExtiy0aBA1ERZdYrzoxIQBo9w+EJ/wYUenqGXK4nUCBds2Ul9gFD+zIXB55oLbz2mqqS49
	LHkReRJHNL1pfGsHC8JJIadP7yiv1p8j4WuI1RWYRCPfI4rOqDfqjB/XlcH5ntp8AilGDduJMUV
	IfnjmnbpW0uWsQqi1jgoLrpvl1YRSpGO9NotSzLARn2a04s80Od+DyM+Nytf/dY4bNjBwFGL8LE
	KnGDCSnL50nr21yDywLzemqRKHw=
X-Received: by 2002:a17:90b:3901:b0:3ae:533e:7e3c with SMTP id 98e67ed59e1d1-3b182f58c51mr1596933a91.35.1794378126465;
        Tue, 10 Nov 2026 22:22:06 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm2990708a91.6.2026.11.10.22.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:22:06 -0800 (PST)
Date: Wed, 11 Nov 2026 14:21:44 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joel Stanley <joel@jms.id.au>, Conor Dooley <conor@kernel.org>, 
	inochiama@gmail.com, junhui.liu@pigmoral.tech, aleksa.paunovic@htecgroup.com, 
	chen.wang@linux.dev, dlan@kernel.org, guoren@kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Message-ID: <avQFhoMuUGhASMla@inochi.infowork>
References: <20261109051050.105623-1-joel@jms.id.au>
 <20261109051050.105623-5-joel@jms.id.au>
 <20261109-jester-zestfully-a664203cfbd1@spud>
 <CACPK8XcnPb9oMQq4YpNFG+RznroP-647E-_O5j84OW_YQ7P=9Q@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8XcnPb9oMQq4YpNFG+RznroP-647E-_O5j84OW_YQ7P=9Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_222207_455918_EEA12095 
X-CRM114-Status: GOOD (  36.88  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 03:34:26PM +1030, Joel Stanley wrote:
> +cc people who might know more about the various hardware this binding supports.
> 
> On Tue, 10 Nov 2026 at 05:59, Conor Dooley <conor@kernel.org> wrote:
> > > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> 
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - tenstorrent,atlantis-aclint-mtimer
> > > +      - const: riscv,aclint-mtimer
> >
> > So, what are we doing about thead,c900-aclint-mtimer.yaml?
> 
> Once we agree on this binding, I planned to submit a change to bring
> over the devices that implement the common binding. I can do that up
> front instead.
> 
> >
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: mtime register
> > > +      - description: mtimecmp registers
> >
> > For example, I note that you have mtime and mtimecmp in the opposite
> > order to how the mips folks have had to add the mtime region to that
> > file:
> > https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com/
> 
> This is the order OpenSBI has used since v1.0, when support was added
> about five years ago. It reads mtime followed by mtimecmp when there
> are no reg-names:
> 
>  https://github.com/riscv-software-src/opensbi/blob/v1.9/lib/utils/timer/fdt_timer_mtimer.c#L79
> 
> QEMU also generates a dt with mtime followed by mtimecmp, and without reg-names.
> 
> The MIPS ordering works because it specifies reg-names. OpenSBI uses
> reg-names to parse the reg property so it would continue working, but
> u-boot takes index 0 as mtime and ignores reg-names.
> 
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: mtime
> > > +      - const: mtimecmp
> > > +
> > > +  interrupts-extended:
> > > +    minItems: 1
> > > +    maxItems: 4095
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> >
> > You've also not made reg-names or interrupts-extended required.
> 
> That was intentional. A mtimer device without harts attached won't
> have interrupts (opensbi supports this), but I haven't come across a
> system that uses it this way. I have no preference here, what do you
> think?
> 

I think reg-names is required. The spec archive does not requrire the core
implement both MTIME and MTIMECMP. So using reg-name will let the DT parser
does not reply on the order and leave the room for MTIMECMP only devices.

interrupts-extended should also be required, it is kind of weird for 
a zero-interrupt timer.

> > I think we should swap the regs around and make these two required at a
> > minimum, but also "initialise" this file by renaming the existing file.
> 
> Bringing over the other devices sounds like a good idea to me. And I
> appreciate the spelling.
> 
> The nuclei/anlogic boards document mtime[1] support:
> 
>  - nuclei,ux900-aclint-mtimer
>  - anlogic,dr1v90-aclint-mtimer
> 
> K3 has a mtime register (at 0xf181bff8, by experimentation on hardware):
> 
>  - spacemit,k3-aclint-mtimer
> 
> MIPS has it, as per their patch[2]:
> 
>  - gf,mips-p8700-aclint-mtimer
> 
> Note that MIPS have mips,p8700-aclint-mtimer in opensbi.
> 
> T-Head has no mtime[3], just a set of mtimecmp registers. Sophgo are
> unknown, can we assume it is the same design as T-Head?
> 
>  - thead,c900-aclint-mtimer
>  - sophgo,sg2042-aclint-mtimer
>  - sophgo,sg2044-aclint-mtimer
> 

For T-HEAD, IIRC all the design share the same layout. C9XX use the same
layout for both C906/C910/C920. Sophgo is just a SoC vendor, not the
core vendor.

> There are two options for T-Head:
> 
> 1) Leave it in its own binding, because it doesn't have mtime registers.
> 
> 2) Use this binding with an optional reg property for the mtime
> region, which means putting the optional part last.
> 
> If we go with 1 we can preserve the mtime, mtimecmp ordering, matching
> u-boot, opensbi, qemu. If we go with 2 we put mtime last and make
> reg-names required.
> 
> The current K3 and Anlogic current device trees would need an update
> to their reg property to describe mtime when adding the riscv
> compatible.
> 
> I lean towards 1 because it reduces churn in firmware.
> 

I prefer 2. as the ACLINT is designed for modularity, it should 
tolerate one that does not have MTIME.

> > My ~assumption~hope is that all of the devices in that file have
> > implemented the aclint spec at the -rc1 revision that we're citing here.
> 
> (-rc4). Yep, we can move the majority of the compatibles into this
> binding. The T-Head family might be the exception.
> 
> Cheers,
> 
> Joel
> 
> [1] https://doc.nucleisys.com/nuclei_spec/isa/timer.html
> [2] https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com/
> [3] https://lore.kernel.org/all/IA1PR20MB4953D36ABE26822B62415500BBBBA@IA1PR20MB4953.namprd20.prod.outlook.com/

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
