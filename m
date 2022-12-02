Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377C8C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIVJnxITv4lDvxWPKCEbdCzeSduzioLL2WBeennIzAk=; b=YUO88nPluiBXqq
	gU4cTKlJtFZoD24MToNLwcEc/ggebWaM5g+KRB1IeAe9biob2bvjwVM9nWoZ1dJDqwPgqJWnu3YJ/
	Nour4uoWRY3EjrqdzCJ3BeQydppznx6m3WCR53L48X5tevKueylmSK2Ao37V+/rTKC9nsCxBM1OVa
	h0lHWHmvLuYpcDBY9JORqJq+WYjkKiMkIWq7NeQRBbULSvCZ9XHDDnOCcXXNV1WMqhYzZ4hlYvQPA
	ZLFDKFkfJJyfFxh8uYwZ8fr6k8GbJU1pOoR98Y7LpRHdxmXuM+0oZoDkiuA7WBc8FL5humu7Kf//n
	ffZ8E906ZiUbuvnPFfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p192h-0000pA-Lo; Fri, 02 Dec 2022 16:37:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p192Y-0000lw-Nb
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 16:37:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 302F16234B
	for <linux-riscv@lists.infradead.org>; Fri,  2 Dec 2022 16:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AC7C4314B
	for <linux-riscv@lists.infradead.org>; Fri,  2 Dec 2022 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669999049;
	bh=EvJJMDT2Lq9pPqMsw0zk5dy2vuzQb62lx5KfT70us/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZZolye9g9cXNPBfD/6CR7XzvyGpcNzWhbXQTX9PJizhF5AxoqHjtioLxMsY54gcCv
	 D3Fuw2v0UGgWU83YkfOHZapX5zUjPkx5t7YA6jlP86kBkU07BzflPCgi+BP+oaGOAn
	 aJd9CVsRQwxq52T9rJCQiuEtYk6fZsM99T/wLQseCrNoYy6Se7VkCTYLWT5/ilFEF2
	 0PWE8eXKsht3/oaEP/P0sxt6g3RrXP0iPLy/i1ivzQmECuUF5emXZ+swPvsRW9oHub
	 tneS4nxN/zoLHs9kjln/u0sk6UE87e6V8B+Fev8NdxFbEXigjInVy7TlMeFWsscfXU
	 JOZe2YLKAH3Vw==
Received: by mail-lj1-f170.google.com with SMTP id r8so5982116ljn.8
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 08:37:29 -0800 (PST)
X-Gm-Message-State: ANoB5pliuyDpwubQl2fKzTDYng5KcmLrXFnMN4Mkcbo9hqeuL/l2N1PG
	2zvKoSzvHdJAc0znMfuTKvm4TjO6ue1NnVgysLs=
X-Google-Smtp-Source: AA0mqf4cP5vb+93NiI7bo/ZZvh3IXG/Angm4270zBWJmIi4Rjhoz7ku+a9UJTL6u9/quHp9vK7vWlRhjTjhEhM8Np5E=
X-Received: by 2002:a05:651c:1603:b0:26d:d603:8df2 with SMTP id
 f3-20020a05651c160300b0026dd6038df2mr21120504ljq.189.1669999047497; Fri, 02
 Dec 2022 08:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20221130225614.1594256-1-heiko@sntech.de> <20221201193455.2hr6mwm6sa6vnd3w@kamzik>
 <CAMj1kXG=zM0EFFPn8MBWFurk=oSRPqwdd6CP1dudQC+JXV36Og@mail.gmail.com> <4822525.e9J7NaK4W3@diego>
In-Reply-To: <4822525.e9J7NaK4W3@diego>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 Dec 2022 17:37:16 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGBSLf4ppjA5_F4Ork+ZJ45Sk0w6SnPc3eDcWbTMkj3SQ@mail.gmail.com>
Message-ID: <CAMj1kXGBSLf4ppjA5_F4Ork+ZJ45Sk0w6SnPc3eDcWbTMkj3SQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] efi/riscv: libstub: mark when compiling libstub
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, 
	conor@kernel.org, philipp.tomsich@vrull.eu, 
	emil.renner.berthing@canonical.com, linux-efi@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_083730_870878_AEA06469 
X-CRM114-Status: GOOD (  22.86  )
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

T24gVGh1LCAxIERlYyAyMDIyIGF0IDIzOjM5LCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNo
LmRlPiB3cm90ZToKPgo+IEhpIEFyZCwKPgo+IEFtIERvbm5lcnN0YWcsIDEuIERlemVtYmVyIDIw
MjIsIDIxOjU3OjAwIENFVCBzY2hyaWViIEFyZCBCaWVzaGV1dmVsOgo+ID4gT24gVGh1LCAxIERl
YyAyMDIyIGF0IDIwOjM1LCBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBOb3YgMzAsIDIwMjIgYXQgMTE6NTY6MTJQTSArMDEw
MCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4gPiA+ID4gRnJvbTogSGVpa28gU3R1ZWJuZXIgPGhl
aWtvLnN0dWVibmVyQHZydWxsLmV1Pgo+ID4gPiA+Cj4gPiA+ID4gV2UgbWF5IHdhbnQgdG8gcnVu
dGltZS1vcHRpbWl6ZSBzb21lIGNvcmUgZnVuY3Rpb25zIChzdHIqLCBtZW0qKSwKPiA+ID4gPiBi
dXQgbm90IGhhdmUgdGhpcyBsZWFrIGludG8gbGlic3R1YiBhbmQgY2F1c2UgYnVpbGQgaXNzdWVz
Lgo+ID4gPiA+IEluc3RlYWQgbGlic3R1YiwgZm9yIHRoZSBzaG9ydCB3aGlsZSBpdCdzIHJ1bm5p
bmcsIHNob3VsZCBqdXN0IHVzZQo+ID4gPiA+IHRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9uLgo+
ID4gPiA+Cj4gPiA+ID4gU28sIHRvIGJlIGFibGUgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgZnVuY3Rp
b25zLCB0aGF0IGFyZSB1c2VkIGJvdGggaW4KPiA+ID4gPiBsaWJzdHViIGFuZCB0aGUgbWFpbiBr
ZXJuZWwsIGFyZSBnZXR0aW5nIGNvbXBpbGVkIGFzIHBhcnQgb2YgbGlic3R1YiBvcgo+ID4gPiA+
IG5vdCwgYWRkIGEgY29tcGlsZS1mbGFnIHdlIGNhbiBjaGVjayB2aWEgI2lmZGVmLgo+ID4gPiA+
Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVi
bmVyQHZydWxsLmV1Pgo+ID4KPiA+IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHVwZGF0
ZSBhcmNoL3Jpc2N2L2tlcm5lbC9pbWFnZS12YXJzLmggc28KPiA+IHRoYXQgb25seSB0aGVzZSBn
ZW5lcmljIGltcGxlbWVudGF0aW9ucyBhcmUgZXhwb3NlZCB0byB0aGUgc3R1YiBpbiB0aGUKPiA+
IGZpcnN0IHBsYWNlLgo+CgpBY3R1YWxseSwgYWxsIHJlZmVyZW5jZXMgdG8gc3RyaW5nIGFuZCBt
ZW1vcnkgZnVuY3Rpb25zIGFyZSBnb2luZyBhd2F5CmZyb20gdGhlIHN0dWIuIFRoaXMgaXMgYWxy
ZWFkeSBpbiAtbmV4dC4KCkVGSSBub3cgaGFzIHpib290IHN1cHBvcnQsIHdoaWNoIG1lYW5zIHlv
dSBjYW4gY3JlYXRlIGEgRUZJIGJvb3RhYmxlCmtlcm5lbCBpbWFnZSB0aGF0IGNhcnJpZXMgdGhl
IGFjdHVhbCBrZXJuZWwgaW4gY29tcHJlc3NlZCBmb3JtIHJhdGhlcgp0aGFuIGFzIGEgaHlicmlk
IEVGSS9iYXJlIG1ldGFsIGltYWdlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
