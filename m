Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0648DC433E3
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 08:40:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66DE205CB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 08:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d9VFbGgJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMHZYDe+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66DE205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I8I9tX04br56XoJx8PMEmPeNhLJz81drlOadI3jRuRA=; b=d9VFbGgJHtr58ifuAal1smdOK
	9xR8YfqEv7ynFsSpNfoqQpas9GnAg36WKnK59Oh0LgzzmfYZoygLc9UlD71Z4/WZgMZsKJ3BbuQyj
	jJxEbTnmy0nfixpAtH3rm7SWQVpedjrmLysdIGpmNUpvZCOCkN9u+fu3J/U6oeFQzFZn9FC8gzz0b
	xfSr3E7OI6zjlKlH5oyVeAnsZV7lXUUeL2sc+NrariafRMWfqHdfNRs9HyDZpFGaF/r6+mHZJ/O23
	G4TBAslQTIWqr71P4amBc09wyhUbXluk7kFbUsCQeNKoY6RiR96t0spF0L5PoEe8nOnTtT8sXCtWr
	KQaWMAbqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyAIN-0003de-TO; Wed, 22 Jul 2020 08:40:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyAIK-0003cs-QP
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 08:40:09 +0000
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 386D122B51
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2020 08:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595407207;
 bh=VE9TEy4TaBrXAUOfVps22D3GyNc1Lgjd/KIVOsr7iRE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XMHZYDe+HsqdgolM4FM11vgpgBo8oGNFi12pM1TVZ6sjBUvaLd9cUwKAOd7RYyuxP
 MBUaWckX7gAQthcfoY7rZOdxuysoT0ZKMswKBL6X/iA+JS2AIm7g7d3FOVHpmAxFXO
 MnPJx7OxZLdvV0r/ix+jzajqQAJpF+NAUyrRVZNQ=
Received: by mail-lf1-f43.google.com with SMTP id m15so192515lfp.7
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2020 01:40:07 -0700 (PDT)
X-Gm-Message-State: AOAM530/lQh94r/COVTLf7qxNaN5+GNUROMseMSxSkVicWTloKCz+xR1
 kpv5m/2OA8S6vaO/8eOYSVR92KlcqjFYQwESXLM=
X-Google-Smtp-Source: ABdhPJxM9I8nLASjXFg39htK/rhr5fByxOJVsWiQcQfWB4zl8ffRhBZFGXHlg/WB63xIk+kZZJguVKSDf1KZ39lRh64=
X-Received: by 2002:ac2:5935:: with SMTP id v21mr15443904lfi.135.1595407205384; 
 Wed, 22 Jul 2020 01:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <1594683562-68149-1-git-send-email-guoren@kernel.org>
 <1594683562-68149-7-git-send-email-guoren@kernel.org>
 <20200714203757.512ce7fb5fa61a88b1dbb2f3@kernel.org>
 <CAJF2gTSMUnHfv3GLj_TGT2dJkKq2zbEsnbPKREiq5i6PPjyTBg@mail.gmail.com>
 <20200721222701.3074315f6a9f6c42c5963f40@kernel.org>
In-Reply-To: <20200721222701.3074315f6a9f6c42c5963f40@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Jul 2020 16:39:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTM6fsK5A9CKFkEhCC3hdsM8bCfBh613ohvM50fTLc5cw@mail.gmail.com>
Message-ID: <CAJF2gTTM6fsK5A9CKFkEhCC3hdsM8bCfBh613ohvM50fTLc5cw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] riscv: Add KPROBES_ON_FTRACE supported
To: Masami Hiramatsu <mhiramat@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_044008_992369_7C73A617 
X-CRM114-Status: GOOD (  19.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Pekka Enberg <penberg@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTWFzYW1pLAoKT24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgOToyNyBQTSBNYXNhbWkgSGlyYW1h
dHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgMTUgSnVsIDIwMjAg
MDA6MjQ6NTQgKzA4MDAKPiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+
IFRoeCBNYXNhbWksCj4gPgo+ID4gT24gVHVlLCBKdWwgMTQsIDIwMjAgYXQgNzozOCBQTSBNYXNh
bWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
TW9uLCAxMyBKdWwgMjAyMCAyMzozOToyMSArMDAwMAo+ID4gPiBndW9yZW5Aa2VybmVsLm9yZyB3
cm90ZToKPiA+ID4KPiA+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5j
b20+Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3Iga3Byb2JlcyBv
biBmdHJhY2UgY2FsbCBzaXRlcyB0byBhdm9pZHMKPiA+ID4gPiBtdWNoIG9mIHRoZSBvdmVyaGVh
ZCB3aXRoIHJlZ3VsYXIga3Byb2Jlcy4gVHJ5IGl0IHdpdGggc2ltcGxlCj4gPiA+ID4gc3RlcHM6
Cj4gPiA+ID4KPiA+ID4gPiAxLiBHZXQgX2RvX2ZvcmsgZnRyYWNlIGNhbGwgc2l0ZS4KPiA+ID4g
PiBEdW1wIG9mIGFzc2VtYmxlciBjb2RlIGZvciBmdW5jdGlvbiBfZG9fZm9yazoKPiA+ID4gPiAg
ICAweGZmZmZmZmUwMDAyMGFmNjQgPCswPjogICAgIGFkZGkgICAgc3Asc3AsLTEyOAo+ID4gPiA+
ICAgIDB4ZmZmZmZmZTAwMDIwYWY2NiA8KzI+OiAgICAgc2QgICAgICBzMCwxMTIoc3ApCj4gPiA+
ID4gICAgMHhmZmZmZmZlMDAwMjBhZjY4IDwrND46ICAgICBzZCAgICAgIHJhLDEyMChzcCkKPiA+
ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmNmEgPCs2PjogICAgIGFkZGkgICAgczAsc3AsMTI4Cj4g
PiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjZjIDwrOD46ICAgICBzZCAgICAgIHMxLDEwNChzcCkK
PiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmNmUgPCsxMD46ICAgIHNkICAgICAgczIsOTYoc3Ap
Cj4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjcwIDwrMTI+OiAgICBzZCAgICAgIHMzLDg4KHNw
KQo+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3MiA8KzE0PjogICAgc2QgICAgICBzNCw4MChz
cCkKPiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmNzQgPCsxNj46ICAgIHNkICAgICAgczUsNzIo
c3ApCj4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjc2IDwrMTg+OiAgICBzZCAgICAgIHM2LDY0
KHNwKQo+ID4gPiA+ICAgIDB4ZmZmZmZmZTAwMDIwYWY3OCA8KzIwPjogICAgc2QgICAgICBzNyw1
NihzcCkKPiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmN2EgPCsyMj46ICAgIG12ICAgICAgczQs
YTAKPiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmN2MgPCsyND46ICAgIG12ICAgICAgYTAscmEK
PiA+ID4gPiAgICAweGZmZmZmZmUwMDAyMGFmN2UgPCsyNj46ICAgIG5vcCAgIDw8PDw8PDw8IGhl
cmUhCj4gPiA+ID4gICAgMHhmZmZmZmZlMDAwMjBhZjgyIDwrMzA+OiAgICBub3AKPiA+ID4gPiAg
ICAweGZmZmZmZmUwMDAyMGFmODYgPCszND46ICAgIGxkICAgICAgczMsMChzNCkKPiA+ID4gPgo+
ID4gPiA+IDIuIFNldCBfZG9fZm9yaysyNiBhcyB0aGUga3Byb2JlLgo+ID4gPiA+ICAgZWNobyAn
cDpteXByb2JlIF9kb19mb3JrKzI2IGRmZD0lYTAgZmlsZW5hbWU9JWExIGZsYWdzPSVhMiBtb2Rl
PSs0KCRzdGFjayknID4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9rcHJvYmVfZXZlbnRzCj4g
PiA+ID4gICBlY2hvIDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy9rcHJvYmVz
L2VuYWJsZQo+ID4gPiA+ICAgY2F0IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvdHJhY2UKPiA+
ID4gPiAgIHRyYWNlcjogbm9wCj4gPiA+ID4KPiA+ID4gPiAgIGVudHJpZXMtaW4tYnVmZmVyL2Vu
dHJpZXMtd3JpdHRlbjogMy8zICAgI1A6MQo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF8tLS0tLT0+IGlycXMtb2ZmCj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLyBfLS0tLT0+IG5lZWQtcmVzY2hlZAo+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAvIF8tLS09PiBoYXJkaXJxL3NvZnRpcnEKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHx8IC8gXy0tPT4gcHJlZW1wdC1kZXB0aAo+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfHx8IC8gICAgIGRlbGF5Cj4gPiA+ID4gICAg
ICAgICAgICAgVEFTSy1QSUQgICBDUFUjICB8fHx8ICAgIFRJTUVTVEFNUCAgRlVOQ1RJT04KPiA+
ID4gPiAgICAgICAgICAgICAgICB8IHwgICAgICAgfCAgIHx8fHwgICAgICAgfCAgICAgICAgIHwK
PiA+ID4gPiAgICAgICAgICAgICAgIHNoLTg3ICAgIFswMDBdIC4uLi4gICA1NTEuNTU3MDMxOiBt
eXByb2JlOiAoX2RvX2ZvcmsrMHgxYS8weDJlNikgZGZkPTB4ZmZmZmZmZTAwMDIwYWY3ZSBmaWxl
bmFtZT0weGZmZmZmZmUwMDAyMGIzNGUgZmxhZ3M9MHhmZmZmZmZlMDAxMDFlN2MwIG1vZGU9MHgy
MGFmODZmZmZmZmZlMAo+ID4gPiA+Cj4gPiA+ID4gICBjYXQgL3N5cy9rZXJuZWwvZGVidWcva3By
b2Jlcy9saXN0Cj4gPiA+ID4gZmZmZmZmZTAwMDIwYWY3ZSAgayAgX2RvX2ZvcmsrMHgxYSAgICBb
RlRSQUNFXQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5e
Xl5eXgo+ID4gPgo+ID4gPiBIbW0sIHRoaXMgc2VlbXMgZmVudHJ5IGlzIG5vdCBzdXBwb3J0ZWQg
b24gUklTQy1WIHlldC4gQnV0IGFueXdheSwKPiA+ID4gaXQgd2lsbCBiZSB1c2VmdWwgZm9yIHVz
ZXJzIChpZiB0aGV5IGNhbiBmaW5kIHRoZSBvZmZzZXQpLgo+ID4KPiA+IFNlZW1zIG9ubHkgeDg2
ICYg4qyG77iPOTAgdXNlIGZlbnRyee+8jGNhbiB5b3UgZWxhYm9yYXRlIG1vcmUgYWJvdXQgZmVu
dHJ5J3MKPiA+IGJlbmVmaXQgYW5kIGhvdyB0aGUgdXNlciBjb3VsZCBzZXQga3Byb2JlIG9uIGZ0
cmFjZSBjYWxsIHNpdGUgd2l0aG91dAo+ID4gZGlzYXNzZW1ibGU/Cj4KPiBPbiB4ODYsIHRoZSBm
ZW50cnkgcmVwbGFjZXMgdGhlIG1jb3VudCB3aXRoIGp1c3Qgb25lIGNhbGwgaW5zdHJ1Y3Rpb24s
IHdpdGhvdXQKPiBzYXZpbmcgYW55IGFyZ3VtZW50cy4gVGhpcyBtZWFucyBhbGwgcHJvYmVzIHdo
aWNoIGFyZSBwdXRzIG9uIHRoZSBhZGRyZXNzIG9mCj4gdGFyZ2V0IHN5bWJvbCwgYXJlIGF1dG9t
YXRpY2FsbHkgdXNpbmcgZnRyYWNlLiBJT1csIGFsbCBwcm9iZXMgb24gX2RvX2ZvcmsrMAo+IHdp
bGwgdXNlIGZ0cmFjZS4gV2UgZG9uJ3QgbmVlZCBhbnkgZGlzYXNzZW1ibGluZy4KPgo+IEkgdGhp
bmsgaWYgUklTQy1WIGFscmVhZHkgc3VwcG9ydCAiLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9
MiIgb3B0aW9uIG9uCj4gR0NDLCB5b3UgY2FuIGVhc2lseSBlbmFibGUgaXQgYXMgc2FtZSBhcyBh
cm02NC4gU2VlIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzYvMTgvNjQ4CnRoZSBsaW5rIGlz
OgpbUEFUQ0ggMC83XSBwb3dlcnBjL2Z0cmFjZTogUGF0Y2ggb3V0IC1tcHJvZmlsZS1rZXJuZWwg
aW5zdHJ1Y3Rpb25zCgpJcyB0aGF0IHJpZ2h0PwoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoK
TUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
