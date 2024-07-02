Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A636AC30658
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 22:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kscscUkrFLkqzqCxXGFT56uCTMXngjmnJarUw8O0mCM=; b=s0JFd6widskNAd
	Tum/PCsfapens0RH3k3DoFTgpRu12aKjcssADIU9ljxp8xjAEgVDPGQQ7FxpNQkb086yCHFnAyV+H
	oVOoBP0hJWuRVX4qV6wkD+SQJ0nUZDzmltblbeKKlyIWT0YPP0SzFiePptGu95Ak3mUcx0JmzBPSK
	LdnJwtl9UHdK1LviccAOgMudCT8rFOIGCA+y9hjaYO82xGiUW/7FDP+JfAQfCH1jREt8fKf7N8IAu
	p/C0DuvxIY3WxQ4kaIbcLPlsqHkTCp4xCJ19AksW4vG3aRaNmHV67gRzRKmbRqCF/DgXwFjEoprOZ
	mMC88jYYhwcmXYv96LlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOltj-00000008CBd-0va4;
	Tue, 02 Jul 2024 22:22:51 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOltg-00000008CAR-1iLe
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 22:22:50 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7065a2f4573so3291832b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 15:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719958967; x=1720563767; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2HAreNgSKd2flbDmhZ9kzCgXWhr/5FjsTCmFlTvboqE=;
        b=VuBv0b6XL2CiyrxkO2gWTXUTZiLMYJ0RTRnaYM4SsuPKglUIFwiBvPm9CbUzGppRT3
         0Nc4OEKDvxvwATYU/wDN8SmTlv48S/zg7XVoLgvGgtCReh8XEDq7ZqvHr+CntvF5n3x0
         A440lOb93A+2jGb/Db2XQJd5j8hxR9IMlbL/tWIES/dMzmV7eDNV8peplFBwmzfj7Emh
         RlVGqiFwWci33WqbWU+PHvS0axzj8sIHBXY5o7c9AYMGEpfkL23DDDMe5Pw3yurw6FQo
         /uWDuvO6fpXvf/+vLACQnljtrzRQjqgYMZUrloFSixHBeXi1p6LtEKXvMjVk0NhxHMmI
         2nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719958967; x=1720563767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HAreNgSKd2flbDmhZ9kzCgXWhr/5FjsTCmFlTvboqE=;
        b=uAgdnZynap8nB/bT9pNJeAhWN4YcGmyfZRIR5dWuX5azF/ZdYF8A/CIxdsGHH92db0
         U10GB/F5ccfsgOYHCDLiyNJ4ktIovzyWNBFB6q9O0LQkqYZ6ON+Dgco11jOoR5Gpqx92
         GUTTwTs26uuc7whBtrcm64lNczGOxXL+Kj6xH1GrR+YWWWRRXb3iPkutcNq3pwmmhmuE
         EE3ZeccwFnpe+gBVRR3/l9NRXgIt8TKTYe7mHpT/Ku4IGBzPRWT5fPFVUS5VVrcYfBw3
         0p2zN8v2OswYdnf5iAixj3dMek1/tqcd3AHzRMdEfGFgZuiTt3IQfsYqwHCz4eBo0/jX
         2CWw==
X-Forwarded-Encrypted: i=1; AJvYcCUKvHOG20cjH4NS/i4V5m58h3WWfpWnFcPrJzRWPJq36GPC0rqGa9wZJSv/Dbu3b2PGJxSFQkWpHSEp3sxR7OvSyC3qd0TX72sIx1PDblzv
X-Gm-Message-State: AOJu0YyChURFez9s0KjcfON9r+EQxAJu6+AExX7rioNnxRT0pPYohYZW
	KN0GHilcqcAgRpqpXOdwk9oksV5fALrLVArw1qZHotyMs/4l9+seWQAkn409zMk=
X-Google-Smtp-Source: AGHT+IFv/UktdfqfVi4xgaaycbPb7pdL54C2mZHYwO0zrmNP80hR83Y1Fy2VM2Z6FDn1I046+MIzxQ==
X-Received: by 2002:a05:6a20:1586:b0:1be:cb97:a918 with SMTP id adf61e73a8af0-1bef610bf3dmr9638155637.29.1719958967187;
        Tue, 02 Jul 2024 15:22:47 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf97csm9053071b3a.127.2024.07.02.15.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 15:22:46 -0700 (PDT)
Date: Tue, 2 Jul 2024 15:22:43 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Jesse Taube <jesse@rivosinc.com>,
	linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/8] RISC-V: Check Zicclsm to set unaligned access
 speed
Message-ID: <ZoR9swwgsGuGbsTG@ghost>
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-5-jesse@rivosinc.com>
 <20240626-march-abreast-83414e844250@spud>
 <Zn3XrLRl/yazsoZe@ghost>
 <43941f48-9905-4b25-89ef-6ad75bf1a123@rivosinc.com>
 <20240701-ajar-italicize-9e3d9b8a0264@spud>
 <ef639748-3979-4236-b48d-c0c44e2d5ad2@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef639748-3979-4236-b48d-c0c44e2d5ad2@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_152248_826473_8C53B941 
X-CRM114-Status: GOOD (  42.01  )
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

On Mon, Jul 01, 2024 at 04:20:15PM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 01/07/2024 15:58, Conor Dooley wrote:
> > On Mon, Jul 01, 2024 at 09:15:09AM +0200, Cl=E9ment L=E9ger wrote:
> >>
> >>
> >> On 27/06/2024 23:20, Charlie Jenkins wrote:
> >>> On Wed, Jun 26, 2024 at 03:39:14PM +0100, Conor Dooley wrote:
> >>>> On Mon, Jun 24, 2024 at 08:49:57PM -0400, Jesse Taube wrote:
> >>>>> Check for Zicclsm before checking for unaligned access speed. This =
will
> >>>>> greatly reduce the boot up time as finding the access speed is no l=
onger
> >>>>> necessary.
> >>>>>
> >>>>> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> >>>>> ---
> >>>>> V2 -> V3:
> >>>>>  - New patch split from previous patch
> >>>>> ---
> >>>>>  arch/riscv/kernel/unaligned_access_speed.c | 26 ++++++++++++++----=
----
> >>>>>  1 file changed, 17 insertions(+), 9 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/risc=
v/kernel/unaligned_access_speed.c
> >>>>> index a9a6bcb02acf..329fd289b5c8 100644
> >>>>> --- a/arch/riscv/kernel/unaligned_access_speed.c
> >>>>> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> >>>>> @@ -259,23 +259,31 @@ static int check_unaligned_access_speed_all_c=
pus(void)
> >>>>>  	kfree(bufs);
> >>>>>  	return 0;
> >>>>>  }
> >>>>> +#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> >>>>> +static int check_unaligned_access_speed_all_cpus(void)
> >>>>> +{
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +#endif
> >>>>>  =

> >>>>>  static int check_unaligned_access_all_cpus(void)
> >>>>>  {
> >>>>> -	bool all_cpus_emulated =3D check_unaligned_access_emulated_all_cp=
us();
> >>>>> +	bool all_cpus_emulated;
> >>>>> +	int cpu;
> >>>>> +
> >>>>> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
> >>>>> +		for_each_online_cpu(cpu) {
> >>>>> +			per_cpu(misaligned_access_speed, cpu) =3D RISCV_HWPROBE_MISALIG=
NED_FAST;
> >>>>
> >>>> - const: zicclsm
> >>>>   description:
> >>>>     The standard Zicclsm extension for misaligned support for all re=
gular
> >>>>     load and store instructions (including scalar and vector) but no=
t AMOs
> >>>>     or other specialized forms of memory access. Defined in the
> >>>>     RISC-V RVA Profiles Specification. =

> >>>>
> >>>> Doesn't, unfortunately, say anywhere there that they're actually fas=
t :(
> >>>
> >>> Oh no! That is unfortunate that the ISA does not explicitly call that
> >>> out, but I think that acceptable.
> >>>
> >>> If a vendor puts Zicclsm in their isa string, they should expect
> >>> software to take advantage of misaligned accesses. FAST is our signal=
 to
> >>> tell software that they should emit misaligned accesses.
> >>
> >> AFAIK, Zicclsm is not even an ISA extension, simply a profile
> >> specification which means that only the execution environment which
> >> provides the profile support misaligned accesses (cf
> >> https://lists.riscv.org/g/tech-profiles/message/56).
> > =

> > I dunno, the specification status page used to describe it as an
> > extension:
> > https://wiki.riscv.org/display/HOME/Specification+Status+-+Historical
> > My understanding was that these could be considered extensions, just
> > like we are considering svade to be one.
> > =

> >> . I don't think we
> >> can extrapolate that the misaligned accesses will be fast at all.
> > =

> > That is my opinion on it too. If it doesn't say "fast" and give a
> > definition for what that means in the binding, then we can't assume that
> > it is fast. I'm also wary of extending definitions of extensions in the
> > binding, because a) I am 90% sure that people writing devicetrees don't
> > care and b) it'd be a potential difference between DT and ACPI without a
> > real justification (unlike the zkr or svade/svadu situations).
> =

> BTW, the profile spec [1] has a note that states the following for Ziccls=
m:
> =

> "Even though mandated, misaligned loads and stores might execute
> extremely slowly. Standard software distributions should assume their
> existence only for correctness, not for performance."
> =

> Which was also quoted in patch 1, so I guess that settles it.

The intention here was to allow vendors to configure an option to skip
the probing. This extension does not seem useful as it is written! A way
around this would be to add a kernel arg to set the access speed but
maybe it doesn't matter. For the sake of this patch, it looks like we
should get rid of this Zicclsm check.

- Charlie

> =

> Thanks,
> =

> Cl=E9ment
> =

> Link:
> https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc?plain=
=3D1#L524
> [1]
> =

> > =

> >>> This allows for a generic kernel, like the one a distro would compile=
, to
> >>> skip the probing when booting on a system that explicitly called out
> >>> that the hardware supports misaligned accesses.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
