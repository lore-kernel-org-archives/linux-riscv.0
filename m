Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F44F8FA9A
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oROMUDIr9tbITA+PyZiHyGSqd3hib3XzJUNrgfc8MmE=; b=KlRhxVRUG44Clt
	WU3QeVrvPa5TmRCXkwlPc0wBjWpD4KJW6gtg2fbAuWUZzkcLe0OM/iQNHKJv6I/j06XjdZ7ZzpFGF
	6KHSDj0Q/bXreU0KbNL+ViWni2O5g2sSXXCqy5AVBfjxdGJLhg5S/qnmd2g191YBI1Fbj1q3b6EaB
	R99uv9aUkX+nifweX+mM+J67aQm8JFGHQfe257JzgvptR6PjO/Yu49oEZBTXsJCljSdcAcafumlPc
	vvIXnz20Lz+QnXiChNvefGOcDM4k8SbN1m8K2BqaMB5DwEzP3mVCkDCFuDqbMwMJhi0qwjYVqXRNU
	2o+siB/MTV1uK0kyCHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDhE-00000008tYh-41Ky;
	Tue, 21 Apr 2026 16:11:32 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDhC-00000008tYI-3jqJ
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 16:11:31 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-466ec4c6846so1387915b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 09:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776787889; cv=none;
        d=google.com; s=arc-20240605;
        b=AQugkXGlJ3dTIEqK2bmgMzL74VCVBOMdrapvY3adnRPdL73Ixr9zNakYxS1P2GVbXE
         rBB6jlyx7wMpbJIbbiPnfnB/4h3CUsdvICe2mpfIrSRBb5WunQe2SyG7STzNFzz1AmBa
         /uiz68W7vLqkNKufnCP+jaNKIjcRW6sRFotyn1YMBcFeGdeBVrt53UBF2GJihSyZEAtw
         4KgHKIKNPApCn1hadZL8/otAWKA9f2YYufT2pikAyWeOg2S1yC9KbYTwTkqgcT93HIjH
         ltAUNtzVlr8Qc25OkJkvu246yFpoIzy9DhNtY2o1U2Fcvd2l1rMehw9RfZzBF5AmHolX
         oPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jInUirkrCYPP8V5B2fobD/SlWrNOrVioJ83jqBg/g2U=;
        fh=Oce43stC94gPVOoYwQmLrjHz4ypaprclwlaHAZZ5VEw=;
        b=RnnOadpszMaPNTIqpJSj4vPQWKLnPDiXUKUD9TrIc6q047YjJzA5pkA4hTp9v5yEil
         xRuIfA12At+IQixekj/+jfJCCj3kTI59bCIQrDX+LbhFwgTvaDRURP4VscDh5HRA0OiZ
         0YYEnmQPXNc/X4vBgWLXWGqR1wyfhKMXdMZ19TZ8F9I0TcY49Os58NH9QD015uMH5qR9
         la20fidqxz2Nvn9xBFjo5qm0ZpzPWwiUKpTnHjUWIqtYjkDneVnChE5jH214bUl/WstD
         g8VBjHdntTojZQi9lBxtnA9Qo8BdVIse6G/V0+6jnOBUjjNqfH84/n/jXDs8kKP+ulUT
         Yy4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776787889; x=1777392689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jInUirkrCYPP8V5B2fobD/SlWrNOrVioJ83jqBg/g2U=;
        b=RdfjyNTEmsadBm3zoV3y6ZNfhD/9Ldzo3ZsvGkwIJgIU0LFVjZlmSG8ciUuif64KIz
         XIpwBFVuikORY/fP6Fo5A57NN5JBOMI05CCtxcC564aUsPzThm+Zs/91kVN/aLGgRkRI
         HLdbY0C7X/0RflHWLQ8pyUOTebSG1coFnLcresFhugjTY46y930Yzlwb4y7ts5+4U+Fd
         3ttOzXYsIcaWH2O8Hfinbo4Pl9h+cM2jt1PRW22PbtPFmj3m+viE6cONp8OAMGYlHjmO
         SdudGW3MP7Mnl5vmKvXTXwEKLrdBIrQXSPcKOTkzrPm9CqWvEfhOBr1Iv2JwdjTTQrNa
         Qv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787889; x=1777392689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jInUirkrCYPP8V5B2fobD/SlWrNOrVioJ83jqBg/g2U=;
        b=XVdhTtVNo09QI8NW7wB2T7JUopHF0ogdKYESfRvzGuFUZ+HlEmK2EOi+jrz2YNjK5P
         y9zpBQAHVmQjM8LklB0uO2RG/hzUpj05VzHqeopwGjeD73QzQbZhE1xpJgdJxjtZ2mKR
         fxTdBo2iaJrLrMJDujl7qVQEjfsFGXbbRrD/xv5cfjkO1WlmxDK65yv49HjmRzhAYooD
         7lBuUP/I4A0D1n7uAW6zEUZ3hKFMR947Cd4kS9B521MDgQXW/SnY7ldPZdqkmKWh/HEJ
         u2MpfONupA+q71drutrwVGleaFJuKeFsIWvY7RA5eY9Nu3PBHwUatYUnHtCUtjGN9anR
         7pAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pAn7HHlJAV5oea3HtZDe1T7xADT3m1aAe2I16nLwv0RFt26ZTOjYmr+TkgpWTTXQioSyzZ20dPyWOeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7X4DKRIOg7qlKrtSGTf3U8B9lhVLx+7c5MQ7hipVJ/gD9PNSo
	RkZp0oGTD7GZwHshy1wWNp1AqgfB83mu8m50fFMQCrm6lDf2vxIeO1IujoAbta7OL8SEdbTtlm/
	CwOb3a0E6WahDmGWSrM1axsIiBIhhxMA=
X-Gm-Gg: AeBDievAs/r3M2/9/xnifaj9sbUpRJPHKK4PVE/gQY4+NN7cA+MePHeL/mwppQcEvuW
	jPYqf/DBHQSNwLWPQQ9xmM8iJTDZs5CdIFtv2qSWBG+WTFVxdObiL36Plsweui6uLj9GWgN8NDs
	0CHQiwH8oH+lwVSoSADLIhVDbPvx+IAu863+LEvANCOGTvPUxrM3xuTgltTok7KDKHxLadOEdVU
	+v2gdjqsnR+Vx96yRSUo8PDyfdeAS0lsCBrv5asTkctFMgT2jGIgohCxx2gj27YSxmAj3aVTUAZ
	1E9YNlLOEBM/DM3TrP+3C8I9WZ3kWe6MciRtLgUNwWZFd56oE8gbhtpzpl0+1CSGWpXP4sBV3vL
	QMGDQBG7c3miEwERAX3tUgCuPFRHQPTWmtiSJDuP2
X-Received: by 2002:a05:6808:198c:b0:45f:481c:e258 with SMTP id
 5614622812f47-4799c97f030mr7889576b6e.16.1776787889137; Tue, 21 Apr 2026
 09:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260403111516.379795-1-josh.milas@gmail.com> <20260403111516.379795-5-josh.milas@gmail.com>
In-Reply-To: <20260403111516.379795-5-josh.milas@gmail.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 22 Apr 2026 00:11:17 +0800
X-Gm-Features: AQROBzBlh98NyBlEmbYmzw7vICUUUiwt5WFp1mPUvyil0G8EdaRkcbgAdW60Bs0
Message-ID: <CALbr=Lau_7eRDP5HCh5dQ5aXumvGKkNS4fX68d2CJp9ZjNxzDA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] riscv64: dts: sophgo: add SG2000 dtsi
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, samuel.holland@sifive.com, unicorn_wang@outlook.com, 
	inochiama@gmail.com, daniel.lezcano@linaro.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com, 
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org, 
	chao.wei@sophgo.com, anup@brainfault.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_091130_936682_D79EC92F 
X-CRM114-Status: GOOD (  12.74  )
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

T24gRnJpLCBBcHIgMywgMjAyNiBhdCA3OjE24oCvUE0gSm9zaHVhIE1pbGFzIDxqb3NoLm1pbGFz
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGRzIHNnMjAwMC5kdHNpIG9uIHRoZSBSSVNDViBzaWRl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9zaHVhIE1pbGFzIDxqb3NoLm1pbGFzQGdtYWlsLmNvbT4K
ClRlc3RlZC1ieTogR3VpLURvbmcgSGFuIDxoYW5ndWlkb25nMDJAZ21haWwuY29tPgpSZXZpZXdl
ZC1ieTogR3VpLURvbmcgSGFuIDxoYW5ndWlkb25nMDJAZ21haWwuY29tPgoKPiAtLS0KPiAgYXJj
aC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDAwLmR0c2kgfCA1MyArKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDAwLmR0c2kKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDAuZHRzaSBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjAwMC5kdHNpCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwMDAwLi40MTJhZGFjYzAwNTc2Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjAwMC5kdHNpCj4gQEAgLTAsMCArMSw1
MyBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQo+ICsK
PiArI2RlZmluZSBTT0NfUEVSSVBIRVJBTF9JUlEobnIpICgobnIpICsgMTYpCj4gKwo+ICsjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtc2cyMDAwLmg+Cj4gKyNpbmNsdWRlICJjdjE4
MHgtY3B1cy5kdHNpIgo+ICsjaW5jbHVkZSAiY3YxODB4LmR0c2kiCj4gKyNpbmNsdWRlICJjdjE4
MXguZHRzaSIKPiArCj4gKy8gewo+ICsgICAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDAw
IjsKPiArCj4gKyAgICAgICBtZW1vcnlAODAwMDAwMDAgewo+ICsgICAgICAgICAgICAgICBkZXZp
Y2VfdHlwZSA9ICJtZW1vcnkiOwo+ICsgICAgICAgICAgICAgICByZWcgPSA8MHg4MDAwMDAwMCAw
eDEwMDAwMDAwPjsKPiArICAgICAgIH07Cj4gKwo+ICsgICAgICAgc29jIHsKPiArICAgICAgICAg
ICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47Cj4gKyAgICAgICAgICAgICAgIGRtYS1u
b25jb2hlcmVudDsKPiArCj4gKyAgICAgICAgICAgICAgIHBpbmN0cmw6IHBpbmN0cmxAMzAwMTAw
MCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDAw
LXBpbmN0cmwiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAzMDAxMDAwIDB4
MTAwMD4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4MDUwMjcwMDAgMHgxMDAw
PjsKPiArICAgICAgICAgICAgICAgICAgICAgICByZWctbmFtZXMgPSAic3lzIiwgInJ0YyI7Cj4g
KyAgICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICAgICBjbGs6IGNsb2NrLWNvbnRy
b2xsZXJAMzAwMjAwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJz
b3BoZ28sc2cyMDAwLWNsayI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDMw
MDIwMDAgMHgxMDAwPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jm9zYz47
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+ICsgICAgICAg
ICAgICAgICB9Owo+ICsKPiArICAgICAgICAgICAgICAgcGxpYzogaW50ZXJydXB0LWNvbnRyb2xs
ZXJANzAwMDAwMDAgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic29w
aGdvLHNnMjAwMC1wbGljIiwgInRoZWFkLGM5MDAtcGxpYyI7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4NzAwMDAwMDAgMHg0MDAwMDAwPjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZjcHUwX2ludGMgMTE+LCA8JmNwdTBfaW50YyA5
PjsKPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwwPjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDI+Owo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJpc2N2LG5kZXYgPSA8MTAxPjsKPiArICAgICAgICAgICAgICAgfTsKPiArCj4gKyAgICAg
ICAgICAgICAgIGNsaW50OiB0aW1lckA3NDAwMDAwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDAwLWNsaW50IiwgInRoZWFkLGM5MDAtY2xpbnQi
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDc0MDAwMDAwIDB4MTAwMDA+Owo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmNwdTBfaW50
YyAzPiwgPCZjcHUwX2ludGMgNz47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICB9Owo+
ICt9Owo+IC0tCj4gMi41My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
