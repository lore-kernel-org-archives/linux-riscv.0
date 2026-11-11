Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E35606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 05:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AqVtUYBV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=eCpXcTV+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PpEqTpnHG4jnSCuevCHtaYKw6AryO5RecpoCiN5/gTA=; b=AqVtUYBVuKuvJqOiT7ty8sWryh
	9IGcdaehcapAQYw+reyA6/MhJPyPzykpzTD2/RWOxDdvkt6H+E2MO3ahIh/Hn+exgbTHL7JqH1MAf
	ErDavi9+sLPX7DBi8rhJK1btcaC8iQjAbLe6G5IuwQfhLVyAKGSyV4QeyHSZpIDqp8bggvtSDSQq0
	VlwaARCTeiUMN5oGjRWEcKyKiJDoLbB7aKQ1CDzOnQrBdtmGwMAuIGDb/+cwvmiQZ0Ra51dk/7q5S
	krOksJbsE/RiTzZx9cmd0tu+NBNm2e/rUDld5PLZ8H5+4+VJeVkibi96OIMavXBTknK/mitMKc0F+
	MbmmlJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR0Vm-00000005eRG-3OIZ;
	Wed, 11 Nov 2026 05:04:42 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR0Vi-00000005eQt-3tMA
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 05:04:40 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-675617e81f9so2774446d50.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 21:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794373477; cv=none;
        d=google.com; s=arc-20260327;
        b=c550GQYv9wkLlZ2yr3A6j3ZH+C9aqCup5hOaV3uACu+jc6LdZ1wAtr5lCyLgQv2MIg
         z7dkKbVRL128yb1x3l0NoVr4ciEE6EHhcW/DRn5PXOkpn44m3RbBofML06EdenxUJHuW
         eDdmT2xlOIl2iMAWQVYWsbGEMeiHic38wgXhzYnD+VP5JQZKMlwkxpPGhBALGGfeiGeU
         NpujJ711Kf0BmpwoV74DenEujS4X/75DBmqvDzdE/6L1NoQySooPeaUL+LwBXnx9ajlN
         62maigoKrUSDyo3SPzXRiqZ9l0L35IxrT1dat3oByWNf0vaSbtAQTy0w9PNk41sat/7y
         y2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dzo9dmdNDZyvRQ9KZAx2Ucn8n5volg9HRvYG93blfog=;
        fh=MED1qFVeVWJz/O6NyNP4x/sLOBnhzLAtQ0/yX4i+cVw=;
        b=nvn58XmU02FUPjvpj3RvH5LoutjnuEEnXIliXMRl/BS4Hzj1As2hb4PhQ2fSjRmCXR
         HL3WzEmWZf33ygRMyDJakeOKiD6vlGlUije66HgrLFXEqJEI6w0NNktPXACCGX6obgby
         gGBKNtJ+Qmqz1vUHWb/oe4sGlMKBz/jykv74sbbh/2FYm7eEASFxw59f1cagUilkeyp3
         SAK+H6WS1rsKTD7xL5zKH7Mk6lkSthQfz2+xUxkjYEXeNfLoXgIHUdTb67Qhp9RSakRe
         T1+RZ57FHW090cpk5FLxfKD/PDUKnkDs+DG7l57vxFJobPZSTdxeP9eV2vH9DcURJoqb
         9P3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1794373477; x=1794978277; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzo9dmdNDZyvRQ9KZAx2Ucn8n5volg9HRvYG93blfog=;
        b=eCpXcTV+sbLgasO5ilMeNW/ScsC6b/PsKAEeB8suXvtXQZRsy4xRENjj2NnzX3NLm7
         AzhihJDSrqw7V7Wjrb4ydVh6BOJdL7dx3c/yUQdjQHfhtXn+FbGiNVsstM5lB8A091ON
         UInsrxhtAfyCh70aKBkSO7ot+56fAXCjeXt/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794373477; x=1794978277;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dzo9dmdNDZyvRQ9KZAx2Ucn8n5volg9HRvYG93blfog=;
        b=iaDNygYH1ELsi+rWV5R/tpyUM1uyzr4gVRqVn+j8/yGmNFgf2Z+fn3ot0dMYrI07TU
         JI4wKSz1fLxVBb4qFk+w6o/32TI0RTNLKjV/UN0jzqxyFthOR+pZ0G5VUWWlraC5OAx2
         RmnLrGWCzG1VEpyi50PYPGxaKuJuCXZuNS3bvi+RvHAjY6CL2jIM+dzCiCJgxEUEfkrp
         bT87x7Dt+wjNA5p7Z/jiFWyMx3oLBeRffY5WZxufioihR+e0bcBzKUYHemhlj/5WcNxi
         9nVqVhpqPPlscb04vWx5OCdhrze1ryIjX9ONW5hd9nRxcpebKhFweSyVnrgmH6ZBqDqa
         sjNA==
X-Forwarded-Encrypted: i=1; AL+hErGzbQCJzHxGTZSelVkAiB+eA29svdIsVxGPx4ZDAbnru7o164TieycSF5/YZJKXksFSfN/ByORPhSt8tw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/WETKfek+AVYOGQ7ioDb6IqrpLN3UIzeT6dt/dxkC3VIPevo18
	O+nZXgN2tyH3nkPUm56saqBtmnr3TP+KS2DI3wZUh9+OnKlzXv/dH/hQQUTfJr1R3k87SUA1xsn
	lJbGC02+nPAoTbrqqN2Tea2W2hAXXcf1Dfv7S
X-Gm-Gg: AYBFou2SkDxQqPvzj1wkppP2P2CgbMYmzGfp3VnhlrJcd8+ZYxyRgAJmykHNDWUbtg2
	srWCcuGvR/+Hk3E3FXSL//NteUW3DDDBBmrHO3eA0z243x0wqD4hmCh0HHORUQpWl5thYQRYBHF
	R9ca3k0E3wddRJbxdlQAV7nSlJzIVy/0v/aO486T9g0Ncoj6TYipk5yZTPdGVkosMlrFoyN+9jB
	x6B/Vzm1CPADCymikg4qhD7w6m8lVJHANegp9oS+iLIUTFLkPWgLmFncfFT8qL4mUzI+gY1Pfdt
	F9jYLWQcMspoAxCAGXbSTjPF82veYzBjC9n1LWZ3LRjkZnBD8+xBJeVnfo5gwKM59707aVInnCh
	5exD2VHTlQBpYjeLnScEEBl2E2YPSInMq4uX2xk4wQ+urkAZZRhKphn4QspbgLjIWyTAOo29jZd
	VyB5XwcBqsrqr9vHfDyGTeAH7191fijDiZlRuDXa9Nn3Z8W9StM5C72UHr
X-Received: by 2002:a05:690e:1918:b0:677:c18f:7257 with SMTP id
 956f58d0204a3-67c67f1c881mr1305926d50.23.1794373477351; Tue, 10 Nov 2026
 21:04:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109051050.105623-1-joel@jms.id.au> <20261109051050.105623-5-joel@jms.id.au>
 <20261109-jester-zestfully-a664203cfbd1@spud>
In-Reply-To: <20261109-jester-zestfully-a664203cfbd1@spud>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Nov 2026 15:34:26 +1030
X-Gm-Features: AclHuK-i1zsgez-5VzJXCYD7r7Wts_rzqoCdOsoACfNxyvK7FbXBp92FnWrhYDM
Message-ID: <CACPK8XcnPb9oMQq4YpNFG+RznroP-647E-_O5j84OW_YQ7P=9Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
To: Conor Dooley <conor@kernel.org>, inochiama@gmail.com, junhui.liu@pigmoral.tech, 
	aleksa.paunovic@htecgroup.com, chen.wang@linux.dev, dlan@kernel.org, 
	guoren@kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_210439_325143_ED75044B 
X-CRM114-Status: GOOD (  23.20  )
X-Spam-Score: -1.7 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

+cc people who might know more about the various hardware this binding supports.

On Tue, 10 Nov 2026 at 05:59, Conor Dooley <conor@kernel.org> wrote:
> > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml

> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - tenstorrent,atlantis-aclint-mtimer
> > +      - const: riscv,aclint-mtimer
>
> So, what are we doing about thead,c900-aclint-mtimer.yaml?

Once we agree on this binding, I planned to submit a change to bring
over the devices that implement the common binding. I can do that up
front instead.

>
> > +
> > +  reg:
> > +    items:
> > +      - description: mtime register
> > +      - description: mtimecmp registers
>
> For example, I note that you have mtime and mtimecmp in the opposite
> order to how the mips folks have had to add the mtime region to that
> file:
> https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com/

This is the order OpenSBI has used since v1.0, when support was added
about five years ago. It reads mtime followed by mtimecmp when there
are no reg-names:

 https://github.com/riscv-software-src/opensbi/blob/v1.9/lib/utils/timer/fdt_timer_mtimer.c#L79

QEMU also generates a dt with mtime followed by mtimecmp, and without reg-names.

The MIPS ordering works because it specifies reg-names. OpenSBI uses
reg-names to parse the reg property so it would continue working, but
u-boot takes index 0 as mtime and ignores reg-names.

> > +
> > +  reg-names:
> > +    items:
> > +      - const: mtime
> > +      - const: mtimecmp
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 4095
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> You've also not made reg-names or interrupts-extended required.

That was intentional. A mtimer device without harts attached won't
have interrupts (opensbi supports this), but I haven't come across a
system that uses it this way. I have no preference here, what do you
think?

> I think we should swap the regs around and make these two required at a
> minimum, but also "initialise" this file by renaming the existing file.

Bringing over the other devices sounds like a good idea to me. And I
appreciate the spelling.

The nuclei/anlogic boards document mtime[1] support:

 - nuclei,ux900-aclint-mtimer
 - anlogic,dr1v90-aclint-mtimer

K3 has a mtime register (at 0xf181bff8, by experimentation on hardware):

 - spacemit,k3-aclint-mtimer

MIPS has it, as per their patch[2]:

 - gf,mips-p8700-aclint-mtimer

Note that MIPS have mips,p8700-aclint-mtimer in opensbi.

T-Head has no mtime[3], just a set of mtimecmp registers. Sophgo are
unknown, can we assume it is the same design as T-Head?

 - thead,c900-aclint-mtimer
 - sophgo,sg2042-aclint-mtimer
 - sophgo,sg2044-aclint-mtimer

There are two options for T-Head:

1) Leave it in its own binding, because it doesn't have mtime registers.

2) Use this binding with an optional reg property for the mtime
region, which means putting the optional part last.

If we go with 1 we can preserve the mtime, mtimecmp ordering, matching
u-boot, opensbi, qemu. If we go with 2 we put mtime last and make
reg-names required.

The current K3 and Anlogic current device trees would need an update
to their reg property to describe mtime when adding the riscv
compatible.

I lean towards 1 because it reduces churn in firmware.

> My ~assumption~hope is that all of the devices in that file have
> implemented the aclint spec at the -rc1 revision that we're citing here.

(-rc4). Yep, we can move the majority of the compatibles into this
binding. The T-Head family might be the exception.

Cheers,

Joel

[1] https://doc.nucleisys.com/nuclei_spec/isa/timer.html
[2] https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com/
[3] https://lore.kernel.org/all/IA1PR20MB4953D36ABE26822B62415500BBBBA@IA1PR20MB4953.namprd20.prod.outlook.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
