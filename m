Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9D2C77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 15:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzU0PMbE8u931+IfxDxdzgTXO48tJEntpbOXfMDh+AE=; b=P7bUlVZziaHbyc
	ZNu63Lkw+C7Rp+aUT6TR6LTkGrVJRppwH1IVSDybkB8DTWLFPmpe4pnr4moIjgOsnt3OwKaiKz514
	Wv+6gm08TrpefpbUNZy9kwymm17bUyROEiiw036ltAlMewDRUNkid96d3Pdim2hLIxoltcvVFyo2E
	2EP2++nYyPUiF1MMI3k+WnrCRC7QCn9ERBGkHSLop+pCPeyNLX9Qmj5C5FnowJEEW9eYYsWH0iTfj
	c7No4BtqrHDjwtB048xCqcwBwX6D8zjIzS50vrNvvCMOauJavHEB8+sn9WHPkOK6ealiV3Lxk5eGe
	2WTsoWbuL/z5krJh/kVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZCh-002wP1-0I;
	Fri, 26 May 2023 15:18:07 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZCd-002wN3-1p
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 15:18:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-96fffe11714so148833366b.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1685114279; x=1687706279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sd+Dqbtp7qNkmD7ajxLTDaj4AydWZwx3n13Wvgc7GFs=;
        b=TRHNHAAR6c1NlEv/sGYH1HA06wpmtw1E4UZ90c07jFTP1sVRLv1Jrof9UjKetX5ZkQ
         ze2mFYeXe+O+qNKCluJbQmhNyUfuW8hnf7DoNBOVME4k9tlA+MJaQC6jv5wkyWn0TREW
         zTPvIOm+ziJ77lNzncoyzYWHB5sIC5H1TPvavJPgDDzFyFZeMHY8mzzgWG4JoC2I8zky
         YCLnVsuCjdpMVgRgE8yTjN0U/lraQpoHD44hNQSp1XDVy/P+yIclNzAhhXuhzfY7sngJ
         riRi/IvdV/G1sX0RbULMNqAwEIJgP+os7FAWAEs6bMetrwR2UpfxmWshperLPxPM9RTs
         X1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685114279; x=1687706279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sd+Dqbtp7qNkmD7ajxLTDaj4AydWZwx3n13Wvgc7GFs=;
        b=da/oDIqTKdYzDRBqMviMA3G4T5WCsm11fE+HotNLU6frzV5ujLsrgQS1lv3xMsku88
         D+NjtlAh0z2Oq6H/cPcOLMVn8pH0V6I6C/QmYnlrttbrxhVGIsWzyr9DMAJ+yga36BEi
         Z9MYekwgRXmowHw0Mx0Wk1SrMBK19O5RsznAbz12+ZGKXtKkBHl4UFR0v5u2K+7Dsr2N
         TSfYQU4ryjCDLqY3M4lDhIpZPkk8kxYq3IF/6d4Mp3GZg1Loz9MY1lHVWVifUCW9v6z5
         jnkW7W0tbl1avM1n6PbGNgrLgAqhzGadyAo8ByaOSXneybcGyf7MYVAUOTxd6NrgcWWp
         Uw+A==
X-Gm-Message-State: AC+VfDwNDgvU0QSX6rtx502dvQhjwacPAFcMEP6X2zOP5++LVNZ+QG69
	pQsSrLEmUysuNbRFdkbbjcQ6Fh8H4hgn/SjreQnAOw==
X-Google-Smtp-Source: ACHHUZ5LynO2GJiwmoeAQI5/buwE8oRlwAL8Srf5qC3wN/oPJW8SyryyE6aZMB0q9lTrjXtGQtrDsuFBKljZsrNW58Y=
X-Received: by 2002:a17:907:7f8e:b0:933:4d37:82b2 with SMTP id
 qk14-20020a1709077f8e00b009334d3782b2mr2787208ejc.57.1685114279026; Fri, 26
 May 2023 08:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230525-shrapnel-precut-26500fca4a48@wendy> <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy> <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud> <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
 <20230525-desecrate-imposing-d97ab34e06ad@spud> <CAOnJCUKfRv68Bh8ue=ZhMGxai9_UEHLpm3553g2c2NXh-RP-TQ@mail.gmail.com>
 <20230525-batting-botch-7e03393a2d97@spud> <CAHVXubiDezbwZO6X2btvgpq-XqHnxZjXzaMnSK2YrHc_ioLx8Q@mail.gmail.com>
 <20230526-steep-omen-a5a46a1086bf@spud> <f82e7d3d-a16d-593e-7513-753b5cbf28af@ghiti.fr>
In-Reply-To: <f82e7d3d-a16d-593e-7513-753b5cbf28af@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 26 May 2023 20:47:46 +0530
Message-ID: <CAAhSdy0_XqiB=1w3hnYkipPj1aF_D=z=MD2fKLxk6rb_iDdBow@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <apatel@ventanamicro.com>, robh@kernel.org, jeeheng.sia@starfivetech.com, 
	linux-kernel@vger.kernel.org, palmer@rivosinc.com, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_081803_823800_C276200A 
X-CRM114-Status: GOOD (  27.49  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgODo0MuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPgo+IE9uIDI2LzA1LzIwMjMgMTY6NTksIENvbm9yIERvb2xleSB3
cm90ZToKPiA+IE9uIEZyaSwgTWF5IDI2LCAyMDIzIGF0IDAzOjE0OjMzUE0gKzAyMDAsIEFsZXhh
bmRyZSBHaGl0aSB3cm90ZToKPiA+PiBIaSBldmVyeW9uZSwKPiA+Pgo+ID4+IE9uIFRodSwgTWF5
IDI1LCAyMDIzIGF0IDExOjI04oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3
cm90ZToKPiA+Pj4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDE6MDY6MDRQTSAtMDcwMCwgQXRp
c2ggUGF0cmEgd3JvdGU6Cj4gPj4+PiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAxMTozOeKAr0FN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pj4gT24gVGh1LCBN
YXkgMjUsIDIwMjMgYXQgMTE6Mzc6NDBBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gPj4+
Pj4KPiA+Pj4+Pj4gQW55IHRlc3Rpbmcgb2YgaGliZXJuYXRpb24gc3RpbGwgbmVlZHMgdG8gcmV2
ZXJ0IHRoZSBwYXRjaCB1bnRpbCB3ZQo+ID4+Pj4+PiBoYXZlIHRoZSBwcm9wZXIgZml4Lgo+ID4+
Pj4+ICJ0aGUgcGF0Y2giIGlzIHdoYXQgZXhhY3RseT8gSSBhc3N1bWUgeW91IGRvbid0IG1lYW4g
ZGVwZW5kaW5nIG9uCj4gPj4+Pj4gTk9OUE9SVEFCTEUsIHNpbmNlIHRoYXQgaXMgYSBLY29uZmln
IG9wdGlvbi4KPiA+Pj4+IE5vcGUuIFNvcnJ5IEkgbWVhbnQgdGhlIGNvbW1pdAo+ID4+Pj4KPiA+
Pj4+IDMzMzUwNjggKCJyaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFy
IG1hcHBpbmciKQo+ID4+PiBBaCwgaWYgeW91ciBTQkkgaW1wbGVtZW50YXRpb24gaXMgb25lIG9m
IHRoZSBhZmZlY3RlZCBvbmVzLCB5ZWFoLgo+ID4+PiBJZiBub3QsIHlvdSBjYW4ganVzdCBzZXQg
Tk9OUE9SVEFCTEUgOikKPiA+PiBAQmrDtnJuIFTDtnBlbCBlbWl0dGVkIHRoZSBpZGVhIG9mIGV4
Y2x1ZGluZyBmcm9tIHRoZSBoaWJlcm5hdGlvbiBhbGwKPiA+PiB0aGUgbWVtb3J5IG5vZGVzIGlu
IHRoZSAiL3Jlc2VydmVkLW1lbW9yeSIgbm9kZQo+ID4+IChodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ni40LXJjMS9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jlc2VydmVkLW1lbW9yeS9yZXNlcnZlZC1tZW1vcnkueWFtbCk6Cj4gPj4gSSBoYXZlIHRv
IGFkbWl0IHRoYXQgSSBkb24ndCBzZWUgd2h5IGl0IGlzIG5vdCBkb25lIGJ5IGRlZmF1bHQgYnkg
dGhlCj4gPj4ga2VybmVsLgo+ID4gTXkgdW5kZXJzdGFuZGluZyB3YXMgdGhhdCBpdCB3YXMgcGVy
ZmVjdGx5IGZpbmUgdG8gdXNlIHJlc2VydmVkIG1lbW9yeQo+ID4gbm9kZXMgdG8gZmVuY2Ugb2Zm
IHNvbWUgbWVtb3J5IHRvIHVzZSBpbiBkZXZpY2UgZHJpdmVycyBldGMsIHdoaWNoIHRoZW4KPiA+
IG1heSBuZWVkIHRvIGJlIHNhdmVkL3Jlc3RvcmVkLgo+Cj4KPiBBZ3JlZWQsIGJ1dCBJIHdvdWxk
IHNheSB0aGF0IGl0J3MgdXAgdG8gdGhlIGRyaXZlciB0aGVuIHRvIHRha2UgY2FyZSBvZgo+IHRo
YXQsIHNlZSBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL3BtL25vdGlmaWVycy5o
dG1sCgpJIGFncmVlLCBpdCBzaG91bGQgYmUgZHJpdmVycyByZXNwb25zaWJpbGl0eSB0byBzYXZl
L3Jlc3RvcmUgdGhlIGRlZGljYXRlZApyZXNlcnZlZCBtZW1vcnkgdXNlZCBieSBpdHNlbGYuCgpB
bHRob3VnaCwgSSB0aGluayB3ZSBzaG91bGQgYXQgbGVhc3Qgc2F2ZS9yZXN0b3JlIHJlc2VydmVk
IG1lbW9yeQpyZWdpb25zIGhhdmluZyAicmV1c2FibGUiIHByb3BlcnR5IHNldC4KClJlZ2FyZHMs
CkFudXAKCj4KPgo+ID4+IFVubGVzcyB0aGVyZSBpcyBzdHVmZiBpbiB0aGlzIG5vZGUgdGhhdCBu
ZWVkcyB0byBiZSAiaGliZXJuYXRlZCIsIEkKPiA+PiB0aGluayB0aGF0IHdvdWxkIGJlIGEgdmVy
eSBnb29kIHNvbHV0aW9uIHNpbmNlIHdlIHdvdWxkIG5vdCByZWx5IG9uCj4gPj4gdGhlIG5hbWUg
b2YgdGhlICJpbnRlcm5hbCIgbm9kZXMgb2YgIi9yZXNlcnZlZC1tZW1vcnkiIChpLmUuCj4gPj4g
Im1tb2RlX3Jlc3YiKS4KPiA+Pgo+ID4+IEknbSBkaWdnaW5nIGludG8gd2h5IGl0IGlzIG5vdCBk
b25lIGJ5IGRlZmF1bHQsIGp1c3Qgd2FudGVkIHRvIGhhdmUKPiA+PiB5b3VyIGZlZWRiYWNrIGJl
Zm9yZSB0aGUgd2Vlay1lbmQgOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
