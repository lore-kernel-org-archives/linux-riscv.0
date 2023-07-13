Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB748C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHOMVaJHmzGnNFmFDthYPlwjLX1QS/zQg6mYoiyK2JA=; b=anjdw33HoqG86f
	qwlAFWzAMwKBgKdVywGYtMLOvIRsI0Xs9WM9fl6rdIb2ma19d2B9UOLcPqsP9gurkYlOAsBkhyam9
	tCQKbW7kNGgUo/sIE54zPRa+ACsw8OM4rghuB/RQpS4oWlvhBVuhmw8tRfQBKwvwyuKGXbrlEKl6A
	EvLsQsXCpJXYiwn0d4BdH2m7hXwz9HKOeCFe6A1a4GkJB/Q2nWcXlYO0MjA1g3xRosXCNb1dtMT7m
	VZoto9O23QthXiH7sMA5wyV5bb9SgyojwSSsfPtaEJ4kCitsg9aNOGCqcecCiZ2jqOJDoMkWfyag2
	pmRZxK0CIt9A6Gu+97fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0Ck-0043fy-2a;
	Thu, 13 Jul 2023 17:34:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0Ch-0043fY-1A
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 17:34:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D36AB61A7F
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 17:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C88C433C9
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689269650;
	bh=GU3pPisujvVO+SFQGoi4RS3xfskW0uc6CnX0qz+cCqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tFrs8u+CnbgMgDv2bw5r6Nq+8SZARaF+piLYf7nv9hmmTdwmkB6dzxCwhAXh6yJLi
	 qN/kASek4ZVQRondDaE9fqZfyi0hyWYHR+IwxmS4PY0ADWwpcDM3qlH9cFibZ/Bjrj
	 ALqHQb9Qngrc8hwKz/w7+kS+Na/FvCQAfmTzc+Clu20f3COJUnyu80TWv36EGbf12c
	 NhzoSE/36Vxjp1wgmEuqM7Dgsm5lRtZ1UJid/hWUug2eWNw4p0F17W8qNP1s29ekq2
	 thfH7OQ6nC4dv7+emtMog+ZxnuuTc1hhuBAz8VH79AkL5ZEIPL3n4dvMLYb6jl7zpe
	 /sLHmtDym5dbg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso1795834e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 10:34:10 -0700 (PDT)
X-Gm-Message-State: ABy/qLa8Zn/TgPw9gzLMWwNs5vUwbbX8fN53dGsr4wRwSU8goaDR7qn/
	8tB7CsbytNqFggkdvIbFK8y03klQkVcU1ZYwsHA=
X-Google-Smtp-Source: APBJJlEe5vAY//L5MgvhngEMZ671gBdHWIahMgnNuAN6/7MRkd4ev8WZRC3ihD02ana2JJ0pHz+6EAhp+/i1tDlfE88=
X-Received: by 2002:a05:6512:10d0:b0:4f9:556b:93c2 with SMTP id
 k16-20020a05651210d000b004f9556b93c2mr2075706lfg.1.1689269648240; Thu, 13 Jul
 2023 10:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-postal-affiliate-0d61a209897f@spud> <ZLAoIWX+qqWvucWz@xhacker>
In-Reply-To: <ZLAoIWX+qqWvucWz@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 13 Jul 2023 13:33:56 -0400
X-Gmail-Original-Message-ID: <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com>
Message-ID: <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com, heiko@sntech.de, 
	charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_103411_505332_ABFDDFF5 
X-CRM114-Status: GOOD (  35.90  )
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

T24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMTI6NDjigK9QTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5n
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgMDY6NDg6MDJQ
TSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gRnJvbTogUGFsbWVyIERhYmJlbHQgPHBh
bG1lckByaXZvc2luYy5jb20+Cj4gPgo+ID4gVGhlIGxhc3QgbWVyZ2Ugd2luZG93IGNvbnRhaW5l
ZCBib3RoIFYgc3VwcG9ydCBhbmQgdGhlIGRlcHJlY2F0aW9uIG9mCj4gPiB0aGUgcmlzY3YsaXNh
IERUIHByb3BlcnR5LCB3aXRoIHRoZSBWIGltcGxlbWVudGF0aW9uIHJlYWRpbmcgcmlzY3YsaXNh
Cj4gPiB0byBkZXRlcm1pbmUgdGhlIHByZXNlbmNlIG9mIHRoZSBWIGV4dGVuc2lvbi4gIEF0IHRo
ZSB0aW1lIHRoYXQgd2FzIHRoZQo+ID4gb25seSB3YXkgdG8gZG8gaXQsIGJ1dCB0aGVyZSdzIGEg
bG90IG9mIGFtYmlndWl0eSBhcm91bmQgViBpbiBJU0EKPiA+IHN0cmluZ3MuICBJbiBwYXJ0aWN1
bGFyLCB0aGVyZSBpcyBhIGxvdCBvZiBmaXJtd2FyZSBpbiB0aGUgd2lsZCB0aGF0Cj4gPiB1c2Vz
ICJ2IiBpbiB0aGUgcmlzY3YsaXNhIERUIHByb3BlcnR5IHRvIGNvbW11bmljYXRlIHN1cHBvcnQg
Zm9yIHRoZQo+ID4gMC43LjEgdmVyc2lvbiBvZiB0aGUgVmVjdG9yIHNwZWNpZmljYXRpb24gaW1w
bGVtZW50ZWQgYnkgVC1IZWFkIENQVQo+ID4gY29yZXMuCj4KPiBBZGQgR3VvCj4KPiBIaSBDb25v
ciwgUGFsbWVyLAo+Cj4gRldJQ1QsIG5ldyBULUhFQUQncyByaXNjdiBjb3JlcyBzdWNoIGFzIEM5
MDggc3VwcG9ydCBzdGFuZGFyZCBSVlYtMS4wLAo+IHRoaXMgcGF0Y2ggbG9va3MgbGlrZSBhIGJp
ZyBoYW1tZXIgZm9yIFQtSEVBRC4gSSBkbyB1bmRlcnN0YW5kIHdoeQo+IHRoaXMgcGF0Y2ggaXMg
cHJvdmlkZWQsIGJ1dCBjYW4gd2UgbWl0aWdhdGUgdGhlIHNpdHVhdGlvbiBieSBjYXJlZnVsbHkK
PiByZXZpZXcgdGhlIERUcz8gUGVyIG15IHVuZGVyc3RhbmRpbmcsIGR0cyBpcyBhbHNvIHBhcnQg
b2YgbGludXgga2VybmVsLgo+Cj4gVGhhbmtzCj4KPiA+Cj4gPiBSYXRoZXIgdGhhbiBmb3JjaW5n
IHVzZSBvZiB0aGUgbmV3bHkgYWRkZWQgaW50ZXJmYWNlIHRoYXQgaGFzIHN0cmljdAo+ID4gbWVh
bmluZ3MgZm9yIGV4dGVuc2lvbnMgdG8gZGV0ZWN0IHRoZSBwcmVzZW5jZSBvZiB2ZWN0b3Igc3Vw
cG9ydCwgYXMKPiA+IHRoYXQgd291bGQgcGVuYWxpc2UgdGhvc2Ugd2hvIGhhdmUgYmVoYXZlZCwg
b25seSBpZ25vcmUgdiBpbiByaXNjdixpc2EKPiA+IG9uIENQVXMgdGhhdCByZXBvcnQgVC1IZWFk
J3MgdmVuZG9yIElELgo+ID4KPiA+IEZpeGVzOiBkYzY2NjdhNGU3ZTMgKCJyaXNjdjogRXh0ZW5k
aW5nIGNwdWZlYXR1cmUuYyB0byBkZXRlY3QgVi1leHRlbnNpb24iKQo+ID4gU2lnbmVkLW9mZi1i
eTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiBDby1kZXZlbG9wZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gLS0t
Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBVc2UgbXkgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggdGhh
dCB0b3VjaGVzIGh3Y2FwIGFuZCBpc2FpbmZvIHVuaWZvcm1seQo+ID4gLSBEb24ndCBwZW5hbGlz
ZSB0aG9zZSB3aG8gYmVoYXZlZAo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gaW5kZXggYmRj
ZjQ2MGVhNTNkLi4wNTM2MjcxNWUxYjcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+
ID4gQEAgLTIxLDYgKzIxLDcgQEAKPiA+ICAjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGFzbS9wYXRjaC5oPgo+ID4gICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4gPiAr
I2luY2x1ZGUgPGFzbS9zYmkuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+ID4KPiA+
ICAjZGVmaW5lIE5VTV9BTFBIQV9FWFRTICgneicgLSAnYScgKyAxKQo+ID4gQEAgLTMzNCw2ICsz
MzUsMjcgQEAgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF9aSUhQTSwgaXNhaW5mby0+aXNhKTsK
PiA+ICAgICAgICAgICAgICAgfQo+ID4KPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAg
ICAgICAgICogIlYiIGluIElTQSBzdHJpbmdzIGlzIGFtYmlndW91cyBpbiBwcmFjdGljZTogaXQg
c2hvdWxkIG1lYW4KPiA+ICsgICAgICAgICAgICAgICoganVzdCB0aGUgc3RhbmRhcmQgVi0xLjAg
YnV0IHZlbmRvcnMgYXJlbid0IHdlbGwgYmVoYXZlZC4KPiA+ICsgICAgICAgICAgICAgICogTWFu
eSB2ZW5kb3JzIHdpdGggVC1IZWFkIENQVSBjb3JlcyB3aGljaCBpbXBsZW1lbnQgdGhlIDAuNy4x
Cj4gPiArICAgICAgICAgICAgICAqIHZlcnNpb24gb2YgdGhlIHZlY3RvciBzcGVjaWZpY2F0aW9u
IHB1dCAidiIgaW50byB0aGVpciBEVHMKPiA+ICsgICAgICAgICAgICAgICogYW5kIG5vIFQtSGVh
ZCBDUFUgY29yZXMgd2l0aCB0aGUgc3RhbmRhcmQgdmVyc2lvbiBvZiB2ZWN0b3IKPiA+ICsgICAg
ICAgICAgICAgICogYXJlIGluIGNpcmN1bGF0aW9uIHlldC4KVC1IRUFEJ3MgdmVjdG9yIDEuMCBT
b0NzIGlzIGluIGNpcmN1bGF0aW9uLiBLZW5kcnl0ZSBLMjMwIGlzIHRoZQpzaGlwcGVkIFNvQyBj
aGlwLCB3aGljaCB2ZW5kb3IgaWQgPSBUSEVBRF9WRU5ET1JfSUQgYW5kIHdpdGggdmVjdG9yCjEu
MC4KCj4gPiArICAgICAgICAgICAgICAqIFBsYXRmb3JtcyB3aXRoIFQtSGVhZCBDUFUgY29yZXMg
dGhhdCBzdXBwb3J0IHRoZSBzdGFuZGFyZAo+ID4gKyAgICAgICAgICAgICAgKiB2ZXJzaW9uIG9m
IHZlY3RvciBtdXN0IHByb3ZpZGUgdGhlIGV4cGxpY2l0IFYgcHJvcGVydHksCj4gPiArICAgICAg
ICAgICAgICAqIHdoaWNoIGlzIHdlbGwgZGVmaW5lZC4KPiA+ICsgICAgICAgICAgICAgICovCj4g
PiArICAgICAgICAgICAgIGlmIChhY3BpX2Rpc2FibGVkICYmIHJpc2N2X2NhY2hlZF9tdmVuZG9y
aWQoY3B1KSA9PSBUSEVBRF9WRU5ET1JfSUQpIHsKSWYgeW91IGluc2lzdCBvbiBkb2luZyB0aGlz
LCBwbGVhc2U6CgppZiAoYWNwaV9kaXNhYmxlZCAmJiByaXNjdl9jYWNoZWRfbXZlbmRvcmlkKGNw
dSkgPT0gVEhFQURfVkVORE9SX0lEICYmCnJpc2N2X2NhY2hlZF9tYXJjaGlkKGNwdSkgPT0gMCAm
JiByaXNjdl9jYWNoZWRfbWltcGlkKGNwdSkgPT0gMCkgewoKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBpZiAob2ZfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKG5vZGUsICJyaXNjdixpc2EtZXh0ZW5z
aW9ucyIsICJ2IikgPj0gMCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGhp
c19od2NhcCB8PSBpc2EyaHdjYXBbUklTQ1ZfSVNBX0VYVF92XTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF92LCBpc2FpbmZvLT5pc2EpOwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB0aGlzX2h3Y2FwICY9IH5pc2EyaHdjYXBbUklTQ1ZfSVNBX0VYVF92XTsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsZWFyX2JpdChSSVNDVl9JU0FfRVhUX3Ys
IGlzYWluZm8tPmlzYSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAg
ICAgICB9Cj4gPiArCj4gPiAgICAgICAgICAgICAgIC8qCj4gPiAgICAgICAgICAgICAgICAqIEFs
bCAib2theSIgaGFydCBzaG91bGQgaGF2ZSBzYW1lIGlzYS4gU2V0IEhXQ0FQIGJhc2VkIG9uCj4g
PiAgICAgICAgICAgICAgICAqIGNvbW1vbiBjYXBhYmlsaXRpZXMgb2YgZXZlcnkgIm9rYXkiIGhh
cnQsIGluIGNhc2UgdGhleSBkb24ndAo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KPiA+Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoK
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
