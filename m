Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0A0C27C75
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BN8d24WBBnm2sfq8P5nTAp/o8lTLw78uwvQbocFb05M=; b=SznrC/mRPGwIrIKdOa4sHE5r3B
	B4IRnX3GNd3mytIeJRWmMX7x1GAJRtimsI7ysL9wxW8aJZje4uMMZgU8y39OX/19xEplI5FKyTKSm
	7FGFZ1iyoDQrFdYVdOWDGlDOucZ5DQZ4NHBrHOWicfmhMa2Dpfg5yX8gVUlyg1sV1wuIWqnhh7NGz
	O2Z2VW+2Ugeo3LXSYTN53uMZHmABPIH4saQj+Rasr7jqDCiNACmEDY1TFqWCWc4N2RPUEaW/dWNS/
	XnN3PAgNcmaPSmsahGwmAAffO98UyOZUfoxy4tI/9mtTsbXCEkI+1VCHXJOHB7meb02lftodqPm15
	PJoy8htA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH3Tx-00000009L1i-0bLg;
	Tue, 11 Jun 2024 15:32:21 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH3Tt-00000009L0k-23ws
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 15:32:19 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7043102dcc1so2665980b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718119933; x=1718724733; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vn7Kc4x7zOZjOguyNFwvnJrV+uFfVWZrPr9+iUiJQvs=;
        b=WkDr/CL0iv0LENBvm+FJEFzvZambwmNBdwDR2aSzi45Y/muyn0ZlFKQvmac/0GDZc0
         lPTsUqQWrHrQeh0aei3KuiTVW0lh8p/OUyoanKAc1+kE0NbdRuk8SQYOKGhFKUFIsu8w
         XSQayFtiHNUgr4+C4Fjpfgx4LdZby8ddTSAPW7V+F35BYyPBZgIB3ajq8uo2p3bxNECJ
         Xevzn+ARrmzRyEPoLKuhFygPZaqbyLF6ynHsA2Dncaw2ccn758eWe5Ukr7jfKrlieK8J
         m3T/WVN4HOGIuWLkfUb2K5DDBP24uNFzLwNsn0fSqf85FZ7tevz4JvdhA9VsrMK7yxDw
         aqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119933; x=1718724733;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vn7Kc4x7zOZjOguyNFwvnJrV+uFfVWZrPr9+iUiJQvs=;
        b=QvaeL39Yz7lxAI2jRkw6oTjm35axwpHrwrE4MgI1B70DtRwmwfZhJQ40ydtYEyuL51
         HGCYvJKBcCT89XCqP3wjMWzCCFWhShA/kujWQASRDq68KIoOqvWxCD3T7lZ30RvHpjO9
         NP6OcajSNFNaa61X7VEF6dGhPBlxOJ+gS2iyC7tMq+j65OWYhy411V1RQvZdSLf+a1a9
         SlNnct6UyRrcW8KO7QzS9PHZlf8NMW5MTU2UxhApynHUy1UYszFtpMDsY8m1XpZsIkk1
         HbXsjOfiHBs9RV3c/Rq1fAkcNF4zYHyzeXgndJq3IqCQ5GfMUk/MC6T1L46onNwhqv9I
         NfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZNDsBZSa3iuGSnc6ruIi+X9mlBjyHM/ipxxQ9aEcObQGgytw6pJzHAnCHJgPlK012nW+yKT9kSFlfKlfzUFPbjS9f2mN6p43jjZ/5lyw
X-Gm-Message-State: AOJu0YzmJojsfGzMk3kBu5HTv9njftq5XTbBDLMg7tCOIS1eHhKygYBi
	hkH/Zk8bSC6u9aWew5XPMwD94OCOFoJzXKmzb+Z5ehpwOTh8TqhWAxQFG8vfczdeczMi4e+wlFF
	g
X-Google-Smtp-Source: AGHT+IF8rG5/mjujMehriFq+KOF4rVuXuWFdDgw6V0TBjJ1ZIkoAFk5Q1ybFIIs3W8YsWs7KBpcR4g==
X-Received: by 2002:a05:6a20:9190:b0:1b7:d72e:9e5e with SMTP id adf61e73a8af0-1b7d72ea074mr4679110637.37.1718119932775;
        Tue, 11 Jun 2024 08:32:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e668a494c4sm4998087a12.22.2024.06.11.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:32:12 -0700 (PDT)
Date: Tue, 11 Jun 2024 08:32:10 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jesse@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <Zmht+h75GgxP3ocz@debug.ba.rivosinc.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
 <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
 <20240610-qualm-chalice-72d0cc743658@wendy>
 <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>
 <Zmdq6kszPBxAvLdD@debug.ba.rivosinc.com>
 <20240610-earplugs-anybody-ebd04a5fa777@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240610-earplugs-anybody-ebd04a5fa777@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_083217_633005_3F63D9AE 
X-CRM114-Status: GOOD (  32.83  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 10, 2024 at 10:56:35PM +0100, Conor Dooley wrote:
>On Mon, Jun 10, 2024 at 02:06:50PM -0700, Deepak Gupta wrote:
>> On Mon, Jun 10, 2024 at 11:16:42AM +0200, Cl=E9ment L=E9ger wrote:
>> > On 10/06/2024 11:02, Conor Dooley wrote:
>> > > On Mon, Jun 10, 2024 at 10:33:34AM +0200, Cl=E9ment L=E9ger wrote:
>> > > > On 07/06/2024 20:51, Deepak Gupta wrote:
>> > > > > On Mon, Jun 03, 2024 at 01:47:40PM +0100, Conor Dooley wrote:
>> > > > > > On Mon, Jun 03, 2024 at 11:14:49AM +0200, Alexandre Ghiti wrot=
e:
>> > > > > I don't know all the details but on first glance it seems like i=
nstead
>> > > > > of ACPI,
>> > > > > may be FWFT is a better place for discovery ?
>> > > > > https://lists.riscv.org/g/tech-prs/topic/patch_v12_add_firmware/=
106479571
>> > > >
>> > > > IMHO, doing discovery in FWFT is not the goal of this extension. I=
 think
>> > > > the "real" solution would be to wait for the unified discovery task
>> > > > group to come up with something for that (which is their goal I th=
ink) [1]
>>
>> Yeah I understand the conundrum here.
>>
>> > >
>> > > I'm curious to see how that works out. The proposal documents an m-m=
ode
>> > > csr, so we'd have to smuggle the information to s-mode somehow...
>> >
>> > Ahem, yeah, I spoke a bit too fast. Looked at the proposal and the
>> > mconfigptr CSR will be accessible by M-mode only so I guess we will ha=
ve
>> > to find another way...
>>
>> That's not the only problem. Even if you get mconfigptr access, parsing =
the format
>> is another thing that has to be done. This is early in boot. Although it=
s strictly (pun
>> intended) not a firmware feature extension, I think it's much easier to =
ask underlying
>> firmware if platform is `Sstrict`. or may be expose something like below
>>
>> `ENABLE_SSTRICT`.
>> Platforms which support `Sstrict` can return success for this while plat=
forms which don't
>> have `Sstrict` can return error code (not supported or not implemented).
>> This way its not feature discovery.
>
>I mean, it's feature discovery in all but name. You're calling it
>enable, but the behaviour you describe is feature discovery - not that I
>am against this being feature discovery since it gets us out of an
>annoying bind.

Yes I know it's cheating but at least for this case, it seems like easy sol=
ution which
doesn't break anything. Neither I see it creating any future problems (exce=
pt FWFT becoming
to look like discovery mechanism :-) and Clement/Atish hating me for that)

Another solution to this could be introducing a riscv config `CONFIG_RISCV_=
SSTRICT`.
By default always select `CONFIG_RISCV_SSTRICT` and any platform owner who =
are not
sstrict, they can build their own.
I expect distro (ubuntu, red hat, etc) would want by default `CONFIG_RISCV_=
SSTRICT`.

>
>I forget which extension Alex and I discussed previously, but there's
>some mm-related things that you're gonna have to probe super early and
>we need to figure out if we can get that info from ACPI or not. I know
>we discussed it w.r.t. one of the T-Head vendor extensions, but I think
>another standard one got mentioned too.
>
>> It seems like arm64 parses fdt and it reads certain CSRs too
>> (`arch/arm64/kernel/pi/kaslr_early.c`). Although it doesn't look like it=
 has to do any
>> discovery for them.
>
>A decree from the Palmer that we don't support things that do not conform
>in this manner would allow us to do what arm64 does. I brought this up
>originally because it's been discussed before that we cannot rely on
>conformance because we want to support people's platforms, whether they
>comply or not. I'd be wary of making this an exception now, and then
>later on someone makes a platform we want to support that doesn't
>conform and hey presto, we regress KASLR support - even if I think it is
>pretty unlikely that someone is going to repurpose the Zkr CSRs.
>
>One of the problems with only supporting conforming platforms is that
>the definition of conforming changes over time! This has happened with
>the Andes PMU for example, which I believe uses an interrupt number that
>was later co-opted by AIA spec. That conformed at the time, but doesn't
>anymore - do they get to mark themselves as Sstrict?
>
>Maybe we can do this on a case-by-case basis, but it's up to Palmer
>whether or not we can do that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
