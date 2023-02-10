Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BE1C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 15:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vAqAebWke5PMuOUvNioJj9GDauFFg+/Hn3GPkGv7gQ=; b=4/Bh7VVoQ0dtEcspMQlI+Qjq2/
	r1jQItHW1/1gE//UvO+H7tXEpGJktX1ugnHpRMXSTKu+gGnqmDh+Sehu0tZbV2/takzRH5jvV6oE9
	A+84cBEeHNgHk7i+ompwZ4uum6UhaC1Lvy09vXR6W6jLmd97DXtjunsmiHRBvTcxL99aPlRBIKoHE
	pNJOJdrHoUoKwRvdvuUB1nCKdq1F6JUdY8eZkTbsYW4sj8SYnClFlxW5MsmxCHnzJ4TPnje4jFGUb
	o/cxK2wT3gXxGide4RyBYinW8OHTTOWxGLrHmsoLB0VIKcSCA+kZ6LiDVgHqivKPzBEx75bvoUefU
	iOBZaLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVFY-006JcJ-1d; Fri, 10 Feb 2023 15:23:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVFQ-006JW8-4A
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 15:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676042615; x=1707578615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Pkhd7L0Rr6+g1/WEDjw/dHyNxQqeeIwIMB2XHYXKnw=;
  b=uKUDmematTRYCzNuW8BtNUtsZl3LFge1kLWyMvG15L6gJiEsh8CPbABf
   9Nda2Yszm7Fdr1N/p0h8SVp1MSoPWswYcpDrB37wf5jKi4enwE/Q+DRGi
   iC5ggIyke3z5jROVR0HjozzDeWLYrFCmw6v8RshGay99n+AN8xB4Ji84H
   orUR+mKwsx8TW4BeGjEGi3vNPXkqVVCCb8tb8CYmNTrQ8HvqkLpcK3Emk
   nfxBosrDzOMyqBE07+kv/lRckAlwhtxnpe8JEc8mNJLSBGE3TCiQQvR7D
   PbKYYKAhEEdOgCG/un6bzMBdNDzGwAqZ6EZUeX0oiOWRVHZU3hOAQ+2ln
   A==;
X-IronPort-AV: E=Sophos;i="5.97,287,1669100400"; 
   d="asc'?scan'208";a="136572823"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Feb 2023 08:23:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 10 Feb 2023 08:23:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 10 Feb 2023 08:23:23 -0700
Date: Fri, 10 Feb 2023 15:22:58 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>, Guo Ren <guoren@kernel.org>
CC: Guo Ren <guoren@kernel.org>, <arnd@arndb.de>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<heiko@sntech.de>, <jszhang@kernel.org>, <lazyparser@gmail.com>,
	<falcon@tinylab.org>, <chenhuacai@kernel.org>, <apatel@ventanamicro.com>,
	<atishp@atishpatra.org>, <mark.rutland@arm.com>, <ben@decadent.org.uk>,
	<bjorn@kernel.org>, <miguel.ojeda.sandonis@gmail.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Yipeng Zou
	<zouyipeng@huawei.com>
Subject: Re: [PATCH -next V16 4/7] riscv: entry: Convert to generic entry
Message-ID: <Y+ZhUuCKm21FiuWc@wendy>
References: <20230204070213.753369-1-guoren@kernel.org>
 <20230204070213.753369-5-guoren@kernel.org>
 <D6D12456-3A6F-4AD2-B5D8-4DD83C8D0DE6@kernel.org>
 <CAJF2gTTFb+h-tzTiwj=SBjEqjRwbsRvCn=vpvdW26aEaqc_Z3A@mail.gmail.com>
 <A1D7112B-5738-4DF5-906B-76535647EF28@kernel.org>
MIME-Version: 1.0
In-Reply-To: <A1D7112B-5738-4DF5-906B-76535647EF28@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_072336_303881_01F6E354 
X-CRM114-Status: GOOD (  29.92  )
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
Content-Type: multipart/mixed; boundary="===============9156944986989831258=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9156944986989831258==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AJFLSkFu3rFIM/YT"
Content-Disposition: inline

--AJFLSkFu3rFIM/YT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

On Sun, Feb 05, 2023 at 03:04:37PM +0100, Conor Dooley wrote:
> On 5 February 2023 14:56:01 GMT+01:00, Guo Ren <guoren@kernel.org> wrote:
> >On Sun, Feb 5, 2023 at 6:43 PM Conor Dooley <conor@kernel.org> wrote:
> >> On 4 February 2023 08:02:10 GMT+01:00, guoren@kernel.org wrote:
> >> >From: Guo Ren <guoren@linux.alibaba.com>
> >> >
> >> >This patch converts riscv to use the generic entry infrastructure from
> >> >kernel/entry/*. The generic entry makes maintainers' work easier and
> >> >codes more elegant. Here are the changes:
> >> >
> >> > - More clear entry.S with handle_exception and ret_from_exception
> >> > - Get rid of complex custom signal implementation
> >> > - Move syscall procedure from assembly to C, which is much more
> >> >   readable.
> >> > - Connect ret_from_fork & ret_from_kernel_thread to generic entry.
> >> > - Wrap with irqentry_enter/exit and syscall_enter/exit_from_user_mode
> >> > - Use the standard preemption code instead of custom
> >> >
> >> >Suggested-by: Huacai Chen <chenhuacai@kernel.org>
> >> >Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> >> >Tested-by: Yipeng Zou <zouyipeng@huawei.com>
> >> >Tested-by: Jisheng Zhang <jszhang@kernel.org>
> >> >Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> >Signed-off-by: Guo Ren <guoren@kernel.org>
> >> >Cc: Ben Hutchings <ben@decadent.org.uk>
> >> >---
> >>
> >> Got some new errors added by this patch:
> >> https://gist.github.com/conor-pwbot/3b300050a7a4a197bca809935584d809
> >>
> >> Unfortunately I'm away from a computer at FOSDEM, so I haven't done an=
y investigation
> >> of the warnings.
> >> Should be reproduceable with gcc-12 allmodconfig.
> >Thx for report, but:
> >The spin_shadow_stack is from '7e1864332fbc ("riscv: fix race when
> >vmap stack overflow")'. Not this patch.
> >
> >New errors added:
> >--- /tmp/tmp.nyMxgc6CGx 2023-02-05 05:12:59.949595120 +0000
> >+++ /tmp/tmp.5td5fIdaHX 2023-02-05 05:12:59.961595119 +0000
> >@@ -10 +10 @@
> >- 1 ../arch/riscv/kernel/traps.c:231:15: warning: symbol
> >'spin_shadow_stack' was not declared. Should it be static?
> >+ 1 ../arch/riscv/kernel/traps.c:335:15: warning: symbol
> >'spin_shadow_stack' was not declared. Should it be static?
> >@@ -9109 +9109 @@
> >- 37 ../include/linux/fortify-string.h:522:25: warning: call to
> >'__read_overflow2_field' declared with attribute warning: detected
> >read beyond size of field (2nd parameter); maybe use struct_group()?
> >[-Wattribute-warning]
> >+ 38 ../include/linux/fortify-string.h:522:25: warning: call to
> >'__read_overflow2_field' declared with attribute warning: detected
> >read beyond size of field (2nd parameter); maybe use struct_group()?
> >[-Wattribute-warning]
> >Per-file breakdown
> >--- /tmp/tmp.bHiHUVMzmZ 2023-02-05 05:13:00.109595117 +0000
> >+++ /tmp/tmp.kUkOd6TrGj 2023-02-05 05:13:00.257595114 +0000
> >@@ -1197 +1197 @@
> >- 65 ../include/linux/fortify-string.h
> >+ 66 ../include/linux/fortify-string.h
> >
> >Seems the line number change would cause your script to report old
> >errors as new. So it would be best to improve the check script, such
> >as ignoring the first column line number :)
>=20
> I thought it already did!
> I might've messed up in a refactoring of the script.
> I'll fix it up when I get home so, sorry for the noise!

So I finally got around to trying to sort this out.

>- 1 ../arch/riscv/kernel/traps.c:231:15: warning: symbol
>'spin_shadow_stack' was not declared. Should it be static?
>+ 1 ../arch/riscv/kernel/traps.c:335:15: warning: symbol
>'spin_shadow_stack' was not declared. Should it be static?

As you pointed out, this one is just the movement of an existing error
but isn't why the automation complained about the patch.
That said, should probably be fixed by declaring it in thread-info.h
alongside shadow_stack?

>- 37 ../include/linux/fortify-string.h:522:25: warning: call to
>'__read_overflow2_field' declared with attribute warning: detected
>read beyond size of field (2nd parameter); maybe use struct_group()?
>[-Wattribute-warning]
>+ 38 ../include/linux/fortify-string.h:522:25: warning: call to
>'__read_overflow2_field' declared with attribute warning: detected
>read beyond size of field (2nd parameter); maybe use struct_group()?
>[-Wattribute-warning]

The 37 and 38 here is the source of the complaint though, this series
added an extra one of these warnings, so I don't think the automation
has done anything wrong here.

The number comes from the output of:
grep "\(warning\|error\):" $tmpfile_n | sort | uniq -c > $tmpfile_errors_now

And that appears to be correctly reflected in the report:
build_rv64_gcc_allmodconfig	fail	Errors and warnings before: 17343 this pat=
ch: 17344

However, I should probably go and do something to display the LoC that
caused the issue, since knowing it came from fortify-string.h doesn't do
all that much to help you know which change caused it to appear.

Thanks,
Conor.


--AJFLSkFu3rFIM/YT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+ZhRAAKCRB4tDGHoIJi
0g0JAP0b4fo/nTYSwqwmMxxca6d11n7La9RaH0WmjVkgHg44dwEA6m309zaBWEfZ
APV1TVTzKmLZyFvvmewSEdHfcFUfVQM=
=fAgh
-----END PGP SIGNATURE-----

--AJFLSkFu3rFIM/YT--


--===============9156944986989831258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9156944986989831258==--

