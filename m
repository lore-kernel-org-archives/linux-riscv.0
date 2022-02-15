Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4004BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5MfstIGLAxXFAv8aRhKIVwcfY2s7TtY2zADEBUzB6Y=; b=C9+uQM3B/95ZHS
	uMc2Ur3+hgUbfy3fn5SFnvIA8S5369dk3Zddljj4WcFBIeUVlAIdal21VPHNyrwS+ggXscABRVT5C
	mGeznYKwfMUzByNUrhRx4M7r9A0EMhWH7Dbsomfz3RYhcQC6EtWmMU5/ETNMsFSJfkrsEicnvUBZ2
	b1VheDkcouE67QOMkdqzcbA4lNZuU/Zd1QbCxUxPVZK84IRqYPzoGfjcXsU+r7LCF8ZG7PPFhl9TR
	w/rXomh7K4HMYZWr7gOojWaDwB8gxSR03fSUnmDlY9la1/nn9fbNU42/B2nngo3WtTY4XYwNNErwc
	6jMgLcgvPyz/EiOh063Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuTq-0027kD-5h; Tue, 15 Feb 2022 09:50:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuTS-0027bs-Q1
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:50:20 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJuTR-0006so-Ep; Tue, 15 Feb 2022 10:50:17 +0100
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
Date: Tue, 15 Feb 2022 10:50:16 +0100
Message-ID: <5047719.XZAooIIPeM@diego>
In-Reply-To: <3135135.4LZR2ihtLn@diego>
References: <20220210214018.55739-1-atishp@rivosinc.com>
 <CAHBxVyGSB-LjTEwLXrw_UKn+VB56k6GtH7P8hMvU7qB530PqEA@mail.gmail.com>
 <3135135.4LZR2ihtLn@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_015018_882165_D3189973 
X-CRM114-Status: GOOD (  51.22  )
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

Am Dienstag, 15. Februar 2022, 10:48:16 CET schrieb Heiko St=FCbner:
> Am Dienstag, 15. Februar 2022, 10:12:53 CET schrieb Atish Kumar Patra:
> > On Mon, Feb 14, 2022 at 3:22 PM Atish Kumar Patra <atishp@rivosinc.com>=
 wrote:
> > >
> > > On Mon, Feb 14, 2022 at 2:22 PM Heiko St=FCbner <heiko@sntech.de> wro=
te:
> > > >
> > > > Am Montag, 14. Februar 2022, 21:42:32 CET schrieb Atish Patra:
> > > > > On Mon, Feb 14, 2022 at 12:24 PM Heiko St=FCbner <heiko@sntech.de=
> wrote:
> > > > > >
> > > > > > Am Montag, 14. Februar 2022, 21:14:13 CET schrieb Atish Patra:
> > > > > > > On Mon, Feb 14, 2022 at 12:06 PM Heiko St=FCbner <heiko@sntec=
h.de> wrote:
> > > > > > > >
> > > > > > > > Am Donnerstag, 10. Februar 2022, 22:40:16 CET schrieb Atish=
 Patra:
> > > > > > > > > Multi-letter extensions can be probed using exising
> > > > > > > > > riscv_isa_extension_available API now. It doesn't support=
 versioning
> > > > > > > > > right now as there is no use case for it.
> > > > > > > > > Individual extension specific implementation will be adde=
d during
> > > > > > > > > each extension support.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > > > >
> > > > > > > > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > > > > > > >
> > > > > > > >
> > > > > > > > By the way, does a similar parsing exist for opensbi as wel=
l?
> > > > > > > > Things like svpbmt as well as zicbom have CSR bits controll=
ing how
> > > > > > > > these functions should behave (enabling them, etc), so I gu=
ess
> > > > > > > > opensbi also needs to parse the extensions from the ISA str=
ing?
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > No. Currently, OpenSBI relies on the CSR read/write & trap me=
thod to
> > > > > > > identify the extensions [1].
> > > > > > >
> > > > > > > https://github.com/riscv-software-src/opensbi/blob/master/lib=
/sbi/sbi_hart.c#L404
> > > > > >
> > > > > > I guess my question is more, who is supposed to set CBIE, CBCFE=
 bits in the
> > > > > > ENVCFG CSR. I.e. at it's default settings CMO instructions will=
 cause
> > > > > > illegal instructions until the level above does allow them.
> > > > > >
> > > > > > When the kernel wants to call a cache-invalidate, from my readi=
ng menvcfg
> > > > > > needs to be modified accordingly - which would fall in SBI's co=
urt?
> > > > > >
> > > > >
> > > > > I think so. I had the same question for the SSTC extension as wel=
l.
> > > > > This is what I currently do:
> > > > >
> > > > > 1. Detect menvcfg first, detect stimecmp
> > > > > 2. Enable SSTC feature only if both are available
> > > > > 3. Set the STCE bit in menvcfg if SSTC is available
> > > > >
> > > > > Here is the patch
> > > > > https://github.com/atishp04/opensbi/commit/e6b185821e8302bffdceb4=
633b413252e0de4889
> > > >
> > > > Hmm, the CBO fields are defined as WARL (write any, read legal),
> > > > so I guess some sort of trap won't work here.
> > > >
> > >
> > > Correct. Traps for extensions that introduce new CSRs.
> > > I was suggesting setting the corresponding bits in MENVCFG and reading
> > > it again to check if it sticks.
> > >
> > > > The priv-spec only points to the cmo-spec for these bits and the cm=
o-spec
> > > > does not specifiy what the value should be when cmo is not present.
> > > >
> > > >
> > > > > > > In the future, zicbom can be detected in the same manner. How=
ever,
> > > > > > > svpbmt is a bit tricky as it doesn't
> > > > > > > define any new CSR. Do you think OpenSBI needs to detect svpb=
mt for any reason ?
> > > > > >
> > > > > > There is the PBMTE bit in MENVCFG, which I found while looking =
through the
> > > > > > zicbom-parts, which is supposed to "control wheter svpbmt is av=
ailable for
> > > > > > use". So I guess the question is the same as above :-)
> > > > > >
> > > > >
> > > > > PBMTE bit in MENVCFG says if PBMTE bit is available or not. OpenS=
BI
> > > > > needs other way to
> > > > > detect if PBMTE is available.
> > > > >
> > > > > That's why, I think MENVCFG should be set correctly by the hardwa=
re
> > > > > upon reset. What do you think
> > > > > about that ? I couldn't find anything related to the reset state =
for menvcfg.
> > > >
> > > > me neither. Both the priv-spec as well as the cmobase spec do not
> > > > specifiy any reset-values it seems.
> > > >
> > > I have raised an issue in the ISA spec.
> > > https://github.com/riscv/riscv-isa-manual/issues/820
> > >
> > > > So I guess in the Qemu case, Qemu needs to set that bit when
> > > > its svpbmt extension is enabled?
> > > >
> > >
> > > We can do that if the priv spec is modified to allow that.
> > >
> > =

> > As per Greg's response, hardware is not expected to do that.
> > So we have to dynamically detect the extensions in OpenSBI and write to=
 menvcfg.

Doesn't SBI also get the devicetree and could therefore parse
the ISA string for extensions? Might be less volatile and would
have both Kernel and SBI do the same thing for detection.


> > I am not sure what needs to be done for CBIE bits as it both flush(01)
> > or invalidate(11) are valid values
> =

> From looking at the security remark in the cmo-spec, I guess flush would =
be
> the appropriate thing to do?
> =

> "Until a modified cache block has updated memory, a CBO.INVAL instruction=
 may expose stale data values
> in memory if the CSRs are programmed to perform an invalidate operation. =
This behavior may result in a
> security hole if lower privileged level software performs an invalidate o=
peration and accesses sensitive
> information in memory."
> =

> But also do we actually _want_ to enable cmo always ... Greg was talking
> about backwards compatiblity in his response as well.
> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
