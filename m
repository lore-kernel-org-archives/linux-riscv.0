Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44672C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 05:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlB+ogt36m/4Wt4vzKXvKPjXDFrOJTaGWnjz4pK+0gk=; b=GjKJEHWg8agalg
	nsj59iVMUkf1qbAex/wdQc5ACqx3w1U2L/LVyWcvty6fK9QHkh8nj7USWCV7Sh0QtIS9zobnGA6xN
	iTThJzbePyjYQDXs22DMGNtT/NBJOdc4t7WSMVMZt/8QZCHcPIvcO1fGrrYztAZFCnRD4Y7Et9q2h
	rPGcdDpuZbvO+vkuHe0mxD0BbiBReamBRwWH0eaZcN7+artaUKOWwmL8PFq1FC7O8o8nNZGFywuw1
	/bkLDqBOaQYsUmnOY1SZ2i0V8zKUl0FFYsHO1GAsd5pnreZDv1EyVQB6cmn17hXzlTVf8v8Yqy/Qj
	on0wSleiZ7OJsdYfQMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpOIp-000t1L-TG; Tue, 23 Nov 2021 05:25:12 +0000
Received: from forward501p.mail.yandex.net ([77.88.28.111])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpOIk-000syh-RV
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 05:25:09 +0000
Received: from iva4-d8b0e1d849e5.qloud-c.yandex.net
 (iva4-d8b0e1d849e5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:825:0:640:d8b0:e1d8])
 by forward501p.mail.yandex.net (Yandex) with ESMTP id 0970E6212B9E;
 Tue, 23 Nov 2021 08:24:59 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net
 (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
 by iva4-d8b0e1d849e5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 nNgosoqyy1-OwBS7IsT; Tue, 23 Nov 2021 08:24:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1637645099; bh=AAUrV32yaUUoUQ3o2yF/Pi7ihEGhxraE9YwnZVM1DBY=;
 h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
 b=k8fy2P9txvlARpUjvskOLTzrMv5E/wye/KI2rEIi9FMuMa9iRwWAIDWAHhPBb5sdm
 JpHGNHXmoQhcf8zIaSGZQuEljEZx5a5+vmYFgBExKUJ86JBQ1YPZ24MZ1DLM1IkMOu
 Ps8hvF9MPNBhkKF+KuQ/c5n80sOt86HyXe9MCazg=
Authentication-Results: iva4-d8b0e1d849e5.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 2gBsXxeiP5-OvxC3LsX; Tue, 23 Nov 2021 08:24:58 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Tue, 23 Nov 2021 08:24:56 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: =?ISO-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>
Cc: Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, Anup Patel
 <anup.patel@wdc.com>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 0/4] Introduce pmu-events support for HiFive Unmatched
Message-ID: <20211123082456.003778f6@redslave.neermore.group>
In-Reply-To: <20211122145751.GA10739@joaomariovmubuntu>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
 <20211117152523.66f4ee8e@redslave.neermore.group>
 <CAOnJCULUmmtr=n3yB2e1x_DtyRGTZxVLW-OZOy2aWHS=nOK2gw@mail.gmail.com>
 <20211122145751.GA10739@joaomariovmubuntu>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_212507_288187_661D04A3 
X-CRM114-Status: GOOD (  12.99  )
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

Hello Mario!

On Mon, 22 Nov 2021 14:57:52 +0000
Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt> wrote:
> =

> As the changes to the U-Boot are short I'm including them here,
> please tell me if I should include them in other way. I merged my
> changes with Atish's own patch to simplify the process.
> =

> diff -u b/arch/riscv/dts/fu740-c000.dtsi
> b/arch/riscv/dts/fu740-c000.dtsi --- b/arch/riscv/dts/fu740-c000.dtsi
> +++ b/arch/riscv/dts/fu740-c000.dtsi
> @@ -141,6 +141,49 @@
>                 #size-cells =3D <2>;
>                 compatible =3D "sifive,fu740-c000", "sifive,fu740",
> "simple-bus"; ranges;
> +               pmu {
> +                       compatible =3D "riscv,pmu";
> +                       pmu,raw-event-to-mhpmcounters =3D <0x00000000
> 0x00000100 0x18
> +                                                       0x00000000
> 0x00000200 0x18
> +                                                       0x00000000
> 0x00000400 0x18
> +                                                       0x00000000
> 0x00000800 0x18
> +                                                       0x00000000
> 0x00001000 0x18
> +                                                       0x00000000
> 0x00002000 0x18
> +                                                       0x00000000
> 0x00004000 0x18
> +                                                       0x00000000
> 0x00008000 0x18
> +                                                       0x00000000
> 0x00010000 0x18
> +                                                       0x00000000
> 0x00020000 0x18
> +                                                       0x00000000
> 0x00040000 0x18
> +                                                       0x00000000
> 0x00080000 0x18
> +                                                       0x00000000
> 0x00100000 0x18
> +                                                       0x00000000
> 0x00200000 0x18
> +                                                       0x00000000
> 0x00400000 0x18
> +                                                       0x00000000
> 0x00800000 0x18
> +                                                       0x00000000
> 0x01000000 0x18
> +                                                       0x00000000
> 0x02000000 0x18
> +                                                       0x00000000
> 0x00000101 0x18
> +                                                       0x00000000
> 0x00000201 0x18
> +                                                       0x00000000
> 0x00000401 0x18
> +                                                       0x00000000
> 0x00000801 0x18
> +                                                       0x00000000
> 0x00001001 0x18
> +                                                       0x00000000
> 0x00002001 0x18
> +                                                       0x00000000
> 0x00004001 0x18
> +                                                       0x00000000
> 0x00008001 0x18
> +                                                       0x00000000
> 0x00010001 0x18
> +                                                       0x00000000
> 0x00020001 0x18
> +                                                       0x00000000
> 0x00040001 0x18
> +                                                       0x00000000
> 0x00000102 0x18
> +                                                       0x00000000
> 0x00000202 0x18
> +                                                       0x00000000
> 0x00000402 0x18
> +                                                       0x00000000
> 0x00000802 0x18
> +                                                       0x00000000
> 0x00001002 0x18
> +                                                       0x00000000
> 0x00002002 0x18>;
> +                       pmu,event-to-mhpmcounters =3D <0x05 0x06 0x18
> +                                                    0x10009 0x10009
> 0x18>;
> +                       pmu,event-to-mhpmevent =3D <0x05 0x00000000
> 0x4000
> +                                                 0x06 0x00000000
> 0x4001
> +                                                 0x10008 0x00000000
> 0x102>;
> +               };

Well, i definitely thought it was shorter...

After applying Vincent Chen patches:
https://patchwork.ozlabs.org/project/opensbi/patch/20211110050153.26935-1-v=
incent.chen@sifive.com/

My looks like:

diff --git a/arch/riscv/dts/fu740-c000.dtsi
b/arch/riscv/dts/fu740-c000.dtsi index 649efe400a..6a155b2b86 100644
--- a/arch/riscv/dts/fu740-c000.dtsi
+++ b/arch/riscv/dts/fu740-c000.dtsi
@@ -141,6 +141,17 @@
                #size-cells =3D <2>;
                compatible =3D "sifive,fu740-c000", "sifive,fu740",
"simple-bus"; ranges;
+               pmu {
+                       compatible =3D "riscv,pmu";
+                       riscv,raw-event-to-mhpmcounters =3D <0x00000000
0x3ffff00 0x0 0x0 0x18
+                                                        0x00000000
0x7ff01 0x0 0x1 0x18
+                                                        0x00000000
0x3f02 0x0 0x2 0x18>;
+                       riscv,event-to-mhpmcounters =3D <0x05 0x06 0x18
+                                                    0x10009 0x10009
0x18>;
+                       riscv,event-to-mhpmevent =3D <0x05 0x00000000
0x4000
+                                                 0x06 0x00000000 0x4001
+                                                 0x10008 0x00000000
0x102>;
+               };
                plic0: interrupt-controller@c000000 {
                        #interrupt-cells =3D <1>;
                        compatible =3D "sifive,plic-1.0.0";

Shorter indeed, but surely less readable.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
