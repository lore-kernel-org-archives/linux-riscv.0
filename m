Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93019C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOL6MFl7gWXiJlVr4kcUsCe07l4nS7OyPnYUMK2J8k4=; b=Cl8+FrI+beolJg
	KOv05tSbFwmvcLEaeQNho5ztyQ1hUsQkfTOatYHQ7cs56IhlNumHq0WB+yT4Tpulnr12BuuPMbBZn
	6D7rKyluvaRbcRW0c/gvkkD98/EiU3c8d0QVMjLNuKLH+v163EBcvpehpBYL1wz3Uh6XcD9VXztgM
	QS/MfoG6tDPpiCwMt076wmesJ4ySX/tAgStSrK2/qMfG4oJWgmOj+t5CmLHHv1coPJcbsdYWHyB+y
	uqlMxqDuy/yxCKviYv1TjHxVpirrWPN1JxShmo4cWEh9eXvTfp6I4IZHwRCSL+MtTuL5TSya+qucj
	N5EwVwYF1U/0UNB29pLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRaa-008Qeh-7A; Tue, 22 Nov 2022 11:37:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRaX-008QcW-1C
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 11:37:18 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oxRaT-0000Cm-O2; Tue, 22 Nov 2022 12:37:13 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Tue, 22 Nov 2022 12:37:13 +0100
Message-ID: <4429380.iIbC2pHGDl@diego>
In-Reply-To: <11144018.nUPlyArG6x@diego>
References: <20221110164924.529386-1-heiko@sntech.de> <CA+V-a8u=vrrvhWCo+W28kbogMYHULuO3B6qcDeAEPEgzp+sVWg@mail.gmail.com> <11144018.nUPlyArG6x@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_033717_094704_20974C72 
X-CRM114-Status: GOOD (  23.14  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 22. November 2022, 12:19:40 CET schrieb Heiko St=FCbner:
> Am Dienstag, 22. November 2022, 11:59:57 CET schrieb Lad, Prabhakar:
> > Hi Heiko,
> > =

> > On Mon, Nov 21, 2022 at 10:17 PM Heiko St=FCbner <heiko@sntech.de> wrot=
e:
> > >
> > > Am Montag, 21. November 2022, 22:31:36 CET schrieb Lad, Prabhakar:
> > > > Hi Heiko,
> > > >
> > <snip>
> > > As either manually or with a helper like
> > >
> > >         https://luplab.gitlab.io/rvcodecjs/#q=3D0xf4c080e7
> > >
> > > you can then decode the actual instruction and compare.
> > >
> > > In your log the two jalr instructions decode to different offsets,
> > >         jalr x1, x1, -180
> > > vs
> > >         jalr x1, x1, -834
> > >
> > > Can you check what the patch_offset value is in your case?
> > >
> > patch_offset for the above case is -654.
> =

> which is a big indicator that the auipc-jalr-fixup function is not catchi=
ng
> the instruction ... i.e. -180 - 654 =3D -834.
> =

> I managed to reproduce that issue with your branch now
> (after hacking up stuff a bit to run in qemu :-) ).
> =

> I'll try to find out where the fixup fails.

imagine me with a slightly red head now ... as there is a slightly
embarrassing mistake in the fixup function ;-) .


When going from void* to unsigned int* pointers I have missed
adjusting the actual patch-location.

The call needs to be
	patch_text_nosync(alt_ptr + i, call, 8);

instead of the current
	patch_text_nosync(alt_ptr + i * sizeof(u32), call, 8);

In my str* cases this didn't matter because "i" was 0 there, but in your
longer assembly it actually patched the wrong location.


Heiko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
For reference, my debug prints to find where the patching fails was:

diff --git a/arch/riscv/errata/renesas/errata.c b/arch/riscv/errata/renesas=
/errata.c
index 986f1c762d72..a5a47c5e9ff8 100644
--- a/arch/riscv/errata/renesas/errata.c
+++ b/arch/riscv/errata/renesas/errata.c
@@ -72,6 +72,7 @@ static void riscv_alternative_fix_auipc_jalr(unsigned int=
 *alt_ptr,
        u32 rd1;
 =

        for (i =3D 0; i < num_instr; i++) {
+printk("%s: looking at inst 0x%x\n", __func__, *(alt_ptr + i));
                /* is there a further instruction? */
                if (i + 1 >=3D num_instr)
                        continue;
@@ -84,6 +85,7 @@ static void riscv_alternative_fix_auipc_jalr(unsigned int=
 *alt_ptr,
                if (rd1 !=3D 1)
                        continue;
 =

+printk("%s: -> found a auipc + jalr pair\n", __func__);
                /* get and adjust new target address */
                imm1 =3D EXTRACT_UTYPE_IMM(*(alt_ptr + i));
                imm1 +=3D EXTRACT_ITYPE_IMM(*(alt_ptr + i + 1));
@@ -101,8 +103,10 @@ static void riscv_alternative_fix_auipc_jalr(unsigned =
int *alt_ptr,
                call[0] |=3D to_auipc_imm(imm1);
                call[1] |=3D to_jalr_imm(imm1);
 =

+printk("%s: patching to 0x%x and 0x%x\n", __func__, call[0], call[1]);
                /* patch the call place again */
-               patch_text_nosync(alt_ptr + i * sizeof(u32), call, 8);
+               patch_text_nosync(alt_ptr + i, call, 8);
+printk("%s: patched to 0x%x and 0x%x\n", __func__, *(alt_ptr + i), *(alt_p=
tr + i + 1));
        }
 }
 =

and then realizing that the "patching to" and "patched to" where different.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
