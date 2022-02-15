Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8D6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXAT8hgqKSpb8VPbsMcFLLvGAy+t951v2wRO5jQo6uk=; b=buMi4Mt+jXpI81
	GUXlNegqZ7tSnheQTRIQdDGIOUdNwQl4MQ4KPicO0KY1FJkt1/Z3kwwHtYz7Kobroy/orvnOJzTve
	BFcKSMWi2E1pQTezSUoxMtjlLg7SFzPARQuJQTEFHY1p5WzrQknoP6Jct2eSHwMsh6A41cfARvwyS
	lG0y2NROgk63agnMvk3HadgjpAeAQJ12mdE+I2wMY2/u3uKGJGrIDXgw9Oq6q0czyrP+9howZkH8m
	4+d6qV9BpwdoCZ26JdVGo7+6WZhmwMn0Le1yGmPULBZZnBHn2mbDNyAx7xmQT6g0Iorac5AqEXE7r
	vcPKZ5qpimVac8N8oOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuRg-00279p-Kf; Tue, 15 Feb 2022 09:48:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuRa-002770-D5
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:48:27 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJuRV-0006sA-KF; Tue, 15 Feb 2022 10:48:17 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 4/6] RISC-V: Implement multi-letter ISA extension
 probing framework
Date: Tue, 15 Feb 2022 10:48:16 +0100
Message-ID: <3135135.4LZR2ihtLn@diego>
In-Reply-To: <CAHBxVyGSB-LjTEwLXrw_UKn+VB56k6GtH7P8hMvU7qB530PqEA@mail.gmail.com>
References: <20220210214018.55739-1-atishp@rivosinc.com>
 <CAHBxVyEETRsUu3mXqT2oD=fuxmNHxmvEd7z+ZhdXb60af2L=EQ@mail.gmail.com>
 <CAHBxVyGSB-LjTEwLXrw_UKn+VB56k6GtH7P8hMvU7qB530PqEA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_014822_479935_4CCF3F2D 
X-CRM114-Status: GOOD (  49.34  )
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

Am Dienstag, 15. Februar 2022, 10:12:53 CET schrieb Atish Kumar Patra:
> On Mon, Feb 14, 2022 at 3:22 PM Atish Kumar Patra <atishp@rivosinc.com> w=
rote:
> >
> > On Mon, Feb 14, 2022 at 2:22 PM Heiko St=FCbner <heiko@sntech.de> wrote:
> > >
> > > Am Montag, 14. Februar 2022, 21:42:32 CET schrieb Atish Patra:
> > > > On Mon, Feb 14, 2022 at 12:24 PM Heiko St=FCbner <heiko@sntech.de> =
wrote:
> > > > >
> > > > > Am Montag, 14. Februar 2022, 21:14:13 CET schrieb Atish Patra:
> > > > > > On Mon, Feb 14, 2022 at 12:06 PM Heiko St=FCbner <heiko@sntech.=
de> wrote:
> > > > > > >
> > > > > > > Am Donnerstag, 10. Februar 2022, 22:40:16 CET schrieb Atish P=
atra:
> > > > > > > > Multi-letter extensions can be probed using exising
> > > > > > > > riscv_isa_extension_available API now. It doesn't support v=
ersioning
> > > > > > > > right now as there is no use case for it.
> > > > > > > > Individual extension specific implementation will be added =
during
> > > > > > > > each extension support.
> > > > > > > >
> > > > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > > >
> > > > > > > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > > > > > >
> > > > > > >
> > > > > > > By the way, does a similar parsing exist for opensbi as well?
> > > > > > > Things like svpbmt as well as zicbom have CSR bits controllin=
g how
> > > > > > > these functions should behave (enabling them, etc), so I guess
> > > > > > > opensbi also needs to parse the extensions from the ISA strin=
g?
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > No. Currently, OpenSBI relies on the CSR read/write & trap meth=
od to
> > > > > > identify the extensions [1].
> > > > > >
> > > > > > https://github.com/riscv-software-src/opensbi/blob/master/lib/s=
bi/sbi_hart.c#L404
> > > > >
> > > > > I guess my question is more, who is supposed to set CBIE, CBCFE b=
its in the
> > > > > ENVCFG CSR. I.e. at it's default settings CMO instructions will c=
ause
> > > > > illegal instructions until the level above does allow them.
> > > > >
> > > > > When the kernel wants to call a cache-invalidate, from my reading=
 menvcfg
> > > > > needs to be modified accordingly - which would fall in SBI's cour=
t?
> > > > >
> > > >
> > > > I think so. I had the same question for the SSTC extension as well.
> > > > This is what I currently do:
> > > >
> > > > 1. Detect menvcfg first, detect stimecmp
> > > > 2. Enable SSTC feature only if both are available
> > > > 3. Set the STCE bit in menvcfg if SSTC is available
> > > >
> > > > Here is the patch
> > > > https://github.com/atishp04/opensbi/commit/e6b185821e8302bffdceb463=
3b413252e0de4889
> > >
> > > Hmm, the CBO fields are defined as WARL (write any, read legal),
> > > so I guess some sort of trap won't work here.
> > >
> >
> > Correct. Traps for extensions that introduce new CSRs.
> > I was suggesting setting the corresponding bits in MENVCFG and reading
> > it again to check if it sticks.
> >
> > > The priv-spec only points to the cmo-spec for these bits and the cmo-=
spec
> > > does not specifiy what the value should be when cmo is not present.
> > >
> > >
> > > > > > In the future, zicbom can be detected in the same manner. Howev=
er,
> > > > > > svpbmt is a bit tricky as it doesn't
> > > > > > define any new CSR. Do you think OpenSBI needs to detect svpbmt=
 for any reason ?
> > > > >
> > > > > There is the PBMTE bit in MENVCFG, which I found while looking th=
rough the
> > > > > zicbom-parts, which is supposed to "control wheter svpbmt is avai=
lable for
> > > > > use". So I guess the question is the same as above :-)
> > > > >
> > > >
> > > > PBMTE bit in MENVCFG says if PBMTE bit is available or not. OpenSBI
> > > > needs other way to
> > > > detect if PBMTE is available.
> > > >
> > > > That's why, I think MENVCFG should be set correctly by the hardware
> > > > upon reset. What do you think
> > > > about that ? I couldn't find anything related to the reset state fo=
r menvcfg.
> > >
> > > me neither. Both the priv-spec as well as the cmobase spec do not
> > > specifiy any reset-values it seems.
> > >
> > I have raised an issue in the ISA spec.
> > https://github.com/riscv/riscv-isa-manual/issues/820
> >
> > > So I guess in the Qemu case, Qemu needs to set that bit when
> > > its svpbmt extension is enabled?
> > >
> >
> > We can do that if the priv spec is modified to allow that.
> >
> =

> As per Greg's response, hardware is not expected to do that.
> So we have to dynamically detect the extensions in OpenSBI and write to m=
envcfg.
> =

> I am not sure what needs to be done for CBIE bits as it both flush(01)
> or invalidate(11) are valid values

From looking at the security remark in the cmo-spec, I guess flush would be
the appropriate thing to do?

"Until a modified cache block has updated memory, a CBO.INVAL instruction m=
ay expose stale data values
in memory if the CSRs are programmed to perform an invalidate operation. Th=
is behavior may result in a
security hole if lower privileged level software performs an invalidate ope=
ration and accesses sensitive
information in memory."

But also do we actually _want_ to enable cmo always ... Greg was talking
about backwards compatiblity in his response as well.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
