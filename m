Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207BBC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 15:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EFFJQnt7JAcKZoBzeLvBZebEP5peSZGWXF8TkIpgas=; b=CkNkYXwiKuLC9G
	zcyRHuBzTIV/UjrueiOup1zKWeyDYHKZkgHDAMEULbTMzrv85C+BK/mJKdBz02+0iQi1jzdY7VXP+
	5ZmyOLxw8YPOdaMgo42yvpkOy/qM8izWJT8Cbf9o7JseCkTEOoghlU00HkEfBjaYynxooLAQc+bpw
	GXJXwVTfy0Ql1a86SQdUkF0IZdlTBemhuiv5vX8Bf6SVoSkqoZ4Q1ujxh1PnV0rLkppL5K2H8Z77V
	IQBNlj0OfRHWyPwTXiRVprZZf5EwxTi3IjrcI/iAIZzRnnz1xbIXwxu8JGfJYjzjw259UrydzqC02
	tkJ1Mip5gwBqKHszcixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptVQc-00GE1U-32;
	Mon, 01 May 2023 15:27:02 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptVQa-00GE0c-1m
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 15:27:02 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2a8ba693f69so26815571fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682954816; x=1685546816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYm1A2Y9JCZwWJY3qxKMfyKzI+6vl440LsSxrmBj2go=;
        b=yEOlzIaV3aJknjdM72WirigOWww4r/fv/w+yhsRsPTr3tk3IR/qB7P5VekNU4eJVXr
         KA7uz4riPYIztbxYiKtrKzIER4ofXty03AvxT2uKXDBqEs/EWMYaz9wcbm7HSauumT2V
         bEJTupRfO0L+lpquWNzXwLW4kyBu4RqGA/H14KE3GVbmtGLL+qiABAjUeXo/fZGFrd9A
         XqKmaOGnaOY9u1oLvDQBQfwgWcYqb3R9iQGEZhZ9laWq52NaKKGcqTXJlCX9bDIl1hL4
         Jt+cyeVNBz1fYyLBFKnLoRg6nr7qdhf1A/FIiqjVlwxGV7hdIdPP7BvBmmt7TWacnYO/
         I8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682954816; x=1685546816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYm1A2Y9JCZwWJY3qxKMfyKzI+6vl440LsSxrmBj2go=;
        b=YGDzB81cczKTDm4P1KgxBYIfljHjJDJYTBbJuXsWYdyA6mxmlYcIlrrBW6bgfCtU6C
         OMqHxQN4u0LwJ9N1SVSRaEB5LC70Khd/NscvXd8RPA/JTLCH7XPC+2+DRSXxuhNHZzOW
         cKsBCd93GQInYTw3Rirx40Z3bS5EZXwfSBQP22bZjzFByc0cX+R2cvLqJimIgK0UONOe
         XxbRoOJC2lzx1JfJcFFaf7FsL3D4NMGDKsCnW9wBo6M2ASDL88hIobKXsiNyE4ghcSqF
         S3IlfttYL/7M1Im0PU4G+zTi+HkQczAiHQWAO6QQXpLrxkUunr1jWFG+g4GfcwdZy431
         EVJw==
X-Gm-Message-State: AC+VfDyScsaX0H3kwS9i73tFujT6k7VXfLEm0dQPOEbbRpP5LjBVx9qt
	KESW9TIASc4Vr6eD/RN/wfAPw/gnaYiYe+2wX/amfA==
X-Google-Smtp-Source: ACHHUZ5SrpQirrYAcF9qgnVJKaaaAQzxukyNkmKEArX8qm1p+W3TbEIE4ryk2UMkaDjJlid7gyr/resqZTPXwf9lyHc=
X-Received: by 2002:a2e:3e13:0:b0:299:bdc7:8ff2 with SMTP id
 l19-20020a2e3e13000000b00299bdc78ff2mr3727827lja.39.1682954815912; Mon, 01
 May 2023 08:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230429155247.12131-1-rdunlap@infradead.org> <CALs-HsuG3EFBs60sgiMcPHoE1dF7mhi3GKt=AWvRPaUHAfA88Q@mail.gmail.com>
 <20230429-outboard-hypocrite-983e977103d2@spud> <CALs-HstrR3Cm3jQKt6dmfYiRRVkAVibAZDtFo0wmXz4LEvRf_A@mail.gmail.com>
 <37e6b325-44e4-8e65-68e3-eab2943018ac@infradead.org> <CALs-Hss3b86zAqohK9NYEkzn+pnLeMB37qaj1EA6f6bRkFWwCg@mail.gmail.com>
 <20230429-dandy-gush-6f5da93055bc@spud>
In-Reply-To: <20230429-dandy-gush-6f5da93055bc@spud>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 1 May 2023 08:26:19 -0700
Message-ID: <CALs-HsuP1moOdZQG_Ur3J3cQ1J+j9Zr-tiSgAkvmCsOXaca9ag@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: fix sifive and thead section mismatches in errata
To: Conor Dooley <conor@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_082700_585026_F11E4DB7 
X-CRM114-Status: GOOD (  23.56  )
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

T24gU2F0LCBBcHIgMjksIDIwMjMgYXQgMTI6MTHigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMjksIDIwMjMgYXQgMTI6MDY6MTlQTSAt
MDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IE9uIFNhdCwgQXByIDI5LCAyMDIzIGF0IDEwOjU4
4oCvQU0gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4gPgo+
ID4gPgo+ID4gPgo+ID4gPiBPbiA0LzI5LzIzIDEwOjQ4LCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4g
PiA+IE9uIFNhdCwgQXByIDI5LCAyMDIzIGF0IDEwOjI04oCvQU0gQ29ub3IgRG9vbGV5IDxjb25v
ckBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPj4KPiA+ID4gPj4gT24gU2F0LCBBcHIgMjksIDIw
MjMgYXQgMTA6MjE6MzlBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gPj4+IE9uIFNh
dCwgQXByIDI5LCAyMDIzIGF0IDg6NTLigK9BTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFk
ZWFkLm9yZz4gd3JvdGU6Cj4gPiA+ID4+Pj4KPiA+ID4gPj4+PiBXaGVuIENPTkZJR19NT0RVTEVT
IGlzIHNldCwgX19pbml0X29yX21vZHVsZSBiZWNvbWVzIDxlbXB0eT4sIGJ1dCB3aGVuCj4gPiA+
ID4+Pj4gQ09ORklHX01PRFVMRVMgaXMgbm90IHNldCwgX19pbml0X29yX21vZHVsZSBiZWNvbWVz
IF9faW5pdC4KPiA+ID4gPj4+PiBJbiB0aGUgbGF0dGVyIGNhc2UsIGl0IGNhdXNlcyBzZWN0aW9u
IG1pc21hdGNoIHdhcm5pbmdzOgo+ID4gPiA+Pj4+Cj4gPiA+ID4+Pj4gV0FSTklORzogbW9kcG9z
dDogdm1saW51eC5vOiBzZWN0aW9uIG1pc21hdGNoIGluIHJlZmVyZW5jZTogcmlzY3ZfZmlsbF9j
cHVfbWZyX2luZm8gKHNlY3Rpb246IC50ZXh0KSAtPiBzaWZpdmVfZXJyYXRhX3BhdGNoX2Z1bmMg
KHNlY3Rpb246IC5pbml0LnRleHQpCj4gPiA+ID4+Pj4gV0FSTklORzogbW9kcG9zdDogdm1saW51
eC5vOiBzZWN0aW9uIG1pc21hdGNoIGluIHJlZmVyZW5jZTogcmlzY3ZfZmlsbF9jcHVfbWZyX2lu
Zm8gKHNlY3Rpb246IC50ZXh0KSAtPiB0aGVhZF9lcnJhdGFfcGF0Y2hfZnVuYyAoc2VjdGlvbjog
LmluaXQudGV4dCkKPiA+ID4gPj4+Pgo+ID4gPiA+Pj4+IEZpeGVzOiBiYjNmODk0ODdmZDkgKCJS
SVNDLVY6IGh3cHJvYmU6IFJlbW92ZSBfX2luaXQgb24gcHJvYmVfdmVuZG9yX2ZlYXR1cmVzKCki
KQo+ID4gPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRl
YWQub3JnPgo+ID4gPiA+Pj4+IENjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+
ID4gPiA+Pj4+IENjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4g
PiA+ID4+Pj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gPiA+ID4+
Pj4gQ2M6IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1Pgo+ID4gPiA+Pj4+IENjOiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+ID4+Pj4gQ2M6IENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4KPiA+ID4gPj4+PiBDYzogRXZhbiBHcmVlbiA8ZXZhbkByaXZv
c2luYy5jb20+Cj4gPiA+ID4+Pj4gLS0tCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gVGhhbmtzLCBSYW5k
eS4gSSdtIGNvbmZ1c2VkIGF0IGhvdyBJIGRpZG4ndCBzZWUgdGhhdCB3aGVuIEkgbWFkZSB0aGUK
PiA+ID4gPj4+IG9yaWdpbmFsIGZpeC4gSSBmZWVsIGxpa2UgcmVwcm8gb2YgdGhlc2Ugc2VjdGlv
biBtaXNtYXRjaCBlcnJvcnMKPiA+ID4gPj4+IGRlcGVuZCBvbiBzb21lIG90aGVyIGZhY3RvciBJ
J20gbm90IHVuZGVyc3RhbmRpbmcuIEluIGFueSBjYXNlOgo+ID4gPiA+Pgo+ID4gPiA+PiBQZXJo
YXBzIHlvdSBoYWQgYSBjdXQtZG93biBjb25maWcgdGhhdCBkaWQgbm90IGVuYWJsZSBlaXRoZXIg
b2YgdGhlCj4gPiA+ID4+IHJlbGV2YW50IEFSQ0hfIG9wdGlvbnMgdG8gZ2V0IHRob3NlIGVycmF0
YSBjb21waWxlZD8KPiA+ID4gPgo+ID4gPiA+IEl0IHdhcyB3ZWlyZCwgbXkgb3JpZ2luYWwgImZp
eCIgKHRoZSBvbmUgbGlzdGVkIGluIHRoaXMgRml4ZXMgdGFnKSB3YXMKPiA+ID4gPiBuZWVkZWQg
YmVjYXVzZSB3aGlsZSB0aGUgaHdwcm9iZSBzZXJpZXMgd2FzIGNsZWFuIG9uIFBhbG1lcidzIGJy
YW5jaCwKPiA+ID4gPiBpdCBnZW5lcmF0ZWQgYSAic2VjdGlvbiBtaXNtYXRjaCIgb24gbGludXgt
bmV4dC4gQXMgbm90ZWQgaGVyZSwgaXQgd2FzCj4gPiA+ID4gb25seSB3aXRoICFDT05GSUdfTU9E
VUxFUywgc28gSSBleHBsaWNpdGx5IHJlbWVtYmVyIGdlbmVyYXRpbmcgdGhhdAo+ID4gPiA+IGNv
bmZpZyBhbmQgY2hlY2tpbmcgaXQgb24gbGludXgtbmV4dCB0byBnZW5lcmF0ZSB0aGlzICJmaXgi
LCBhbmQgaXQKPiA+ID4gPiBjYW1lIG91dCBjbGVhbi4gSXQncyBsaWtlIHRoZSByb2JvdHMgYXJl
IGdldHRpbmcgc21hcnRlci4KPiA+ID4gPiAtRXZhbgo+ID4gPgo+ID4gPiBJIG9ic2VydmVkIHRo
ZSBwcm9ibGVtIGluIDggb3V0IG9mIDIwIHJhbmRjb25maWcgYnVpbGRzLAo+ID4gPiB1c2luZyBs
aW51eC1uZXh0IDIwMjMwNDI3Lgo+ID4KPiA+IE9oIGludGVyZXN0aW5nLCBzbyBub3QgdGhlIHN0
b2NrIGsyMTBfbm9tbXUgZGVmY29uZmlnLiBUaGF0IG1ha2VzIG1lCj4gPiBmZWVsIGEgbGl0dGxl
IGJldHRlciBhdCBsZWFzdC4KPgo+IE9oaCBtYW4sIHRoYXQncyBhIHByZXR0eSBiYWQgY29uZmln
IHRvIHRyeSB1c2UgKGlmIHRoYXQncyB5b3VyIGRlZmF1bHQpCj4gZm9yIGJ1aWxkIHRlc3Rpbmcg
c3R1ZmYuIFRoZSBrMjEwX21tdSBkZWZjb25maWcgZG9lc24ndCBlbmFibGUgYW55dGhpbmcKPiBv
dGhlciB0aGFuIFNPQ19DQU5BQU4uCj4gSSBjb3VsZCByZXByb2R1Y2UgUmFuZHkncyBpc3N1ZSBv
biBkZWZjb25maWcgdy8gQ09ORklHX01PRFVMRVMgZGlzYWJsZWQuCgpUaGF0J3MgdGhlIG9uZSB0
aGF0IGNhdWdodCBtZSBiZWZvcmUsIHNvIEkgcmVtZW1iZXJlZCBpdCBhcyBiZWluZwoiZGlmZmVy
ZW50Ii4gSSdsbCB0cnkgd2hhdCB5b3UgZGVzY3JpYmUgYWJvdmUgbmV4dCB0aW1lIEknbSBodW50
aW5nCmZvciBzZWN0aW9uIG1pc21hdGNoZXMuCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
