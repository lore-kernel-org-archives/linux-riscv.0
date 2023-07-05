Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08980EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpNh4MxJWiaXlLVTIxNunw+R+x2Lu9R0Gb5JMXdqsVU=; b=1qXxn61EGvKFOn
	LLFIFB+ivcsUlaGuIS0dhmVjfeUwxxkJCmM5j3KF9FQamFV53PPBShocn5JKns/R03bG0lMTxnK2B
	c1ZrEKJ4+WJkafW6Ucjv4Ap3e3VWeK3/8VuiO6WTq8YUiqmGMxLz0/yz2WJt2/X70hPFp1JCDerCw
	c1ggIW4pRtYPM2hQP+SkubdT/FADopl+eGRLAp0lNat6TDuvijoTgDX0ApnsWtXeUbx4DeaXGkSAT
	C0T/vMgwYJtxkmUFL9OdDF5Y4W1aCwrl/YtSZ14WnX3hh1APslX4sZKot7+ddtP1wSwmW3zSEmBz1
	Eoy/Uaa2cRbHeuczUvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4na-00GOK8-07;
	Wed, 05 Jul 2023 15:52:10 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4nW-00GOI4-28
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 15:52:08 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b69923a715so106677151fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688572321; x=1691164321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkUoG+L6Gc/FljCZD/tXYCRllz67Rh2nIbBivClEET0=;
        b=CbnZ3gwfvWWXIIghXULsz6NIP5rnHhM0x78jL+4sIHTjvJeU3DzIlDuIl2Mh31YhRX
         jWmZHVwr/K5jAhyLoKLUWJw1HTq+f1d6YifnbeLqsQj1TN9pHZ2UvXjceftWXXqZ2H8C
         R/Ebm9bWLFlbb/GpueRSSCueHI5XyOjn8x+HjPBU9E6Gh7lN6NvcEqCfsHFZPEo6hR0Z
         np9VLqPcHy/P7eSvTV4qu45BVbxs+pyB3zUyReQK4UmWVF1v6Hw1Q7+RJEuF0Rc6hA6+
         MGEl8ChtNFAgO8RLF1Ln3YEfPhoQpsFjgWDkfAxkCAtYY+qrIZAa8soBmUDkkNVdTge8
         fHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688572321; x=1691164321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkUoG+L6Gc/FljCZD/tXYCRllz67Rh2nIbBivClEET0=;
        b=MpJXj/3a7zL1592eAmqdGRn+HeDDSAdB+y9YPYFFHu3YltlahO4Ey5BMb4HBHLkqDn
         /+AEsAuO2WoA/vYUPpSqDwGN+JEkff533S0Oo/WAXQzN2af6td0KGsxxGdvwxAsDv+a4
         SxtWsulKpG5Rm29U8g0991nOuwMfwnmjRv2E6jV/uy/uHUL1FWQKU1MxaydtzFJMY6mY
         ApiFStyVaxVTND0sSDjgq0JbpeL4uh891uxc4qxOrV4KosOmOahyfqdK0CFmyniRGfZT
         6HfdMfaecNyxH9UQ9boclRA/5DlR/P5nbFwfYXMIrs6lt30UXfgliQ5hEsDpp7eIJvXl
         WyvA==
X-Gm-Message-State: ABy/qLaCRE81Qdf2rRmAHKlw2Sthpu1D+DAK23Nv0nHaVWAYWM0ac7gl
	hOEVEFYLPXtWvxnR3yJHHuRFle8aO0tLoiFMYvM+rA==
X-Google-Smtp-Source: APBJJlGKbai8gXpDr4vYUvG8VdKZTo2aCyZEqSPqFeRVC2rVuqdMSLQvBrXDRqYUxwFk4YRBiOa9ouocg7839t3sPDk=
X-Received: by 2002:a05:6512:3da5:b0:4f8:6e6e:3f42 with SMTP id
 k37-20020a0565123da500b004f86e6e3f42mr18675814lfv.14.1688572320599; Wed, 05
 Jul 2023 08:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy> <20230703-girdle-underling-880f633c4c73@wendy>
In-Reply-To: <20230703-girdle-underling-880f633c4c73@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 5 Jul 2023 08:51:24 -0700
Message-ID: <CALs-Hsua+Y9EvZAz0vX=2-2MmuOcnZQ8zYyiZP+2Y873mEgQeQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] RISC-V: Provide a more helpful error message on
 invalid ISA strings
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_085206_703390_9614FFE4 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMywgMjAyMyBhdCAzOjI54oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4KPgo+IFJpZ2h0IG5vdyB3ZSBwcm92aWRlIGEgc29tZXdoYXQgdW5oZWxw
ZnVsIGVycm9yIG1lc3NhZ2Ugb24gc3lzdGVtcyB3aXRoCj4gaW52YWxpZCBlcnJvciBtZXNzYWdl
cywgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZgo+Cj4gICAgICAgICBDUFUgd2l0aCBoYXJ0
aWQ9MCBpcyBub3QgYXZhaWxhYmxlCj4gICAgICAgICAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0t
LS0tLS0tLS0tLS0KPiAgICAgICAgIGtlcm5lbCBCVUcgYXQgYXJjaC9yaXNjdi9rZXJuZWwvc21w
Ym9vdC5jOjE3NCEKPiAgICAgICAgIEtlcm5lbCBCVUcgWyMxXQo+ICAgICAgICAgTW9kdWxlcyBs
aW5rZWQgaW46Cj4gICAgICAgICBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIgTm90IHRhaW50
ZWQgNi40LjAtcmMxLTAwMDk2LWdlMDA5N2QyYzYyZDUtZGlydHkgIzEKPiAgICAgICAgIEhhcmR3
YXJlIG5hbWU6IE1pY3JvY2hpcCBQb2xhckZpcmUtU29DIEljaWNsZSBLaXQgKERUKQo+ICAgICAg
ICAgZXBjIDogb2ZfcGFyc2VfYW5kX2luaXRfY3B1cysweDE2Yy8weDE2ZQo+ICAgICAgICAgIHJh
IDogb2ZfcGFyc2VfYW5kX2luaXRfY3B1cysweDlhLzB4MTZlCj4gICAgICAgICBlcGMgOiBmZmZm
ZmZmZjgwYzA0ZTBhIHJhIDogZmZmZmZmZmY4MGMwNGQzOCBzcCA6IGZmZmZmZmZmODE2MDNlMjAK
PiAgICAgICAgICBncCA6IGZmZmZmZmZmODE4MmQ2NTggdHAgOiBmZmZmZmZmZjgxNjEzZjgwIHQw
IDogMDAwMDAwMDAwMDAwMDA2ZQo+ICAgICAgICAgIHQxIDogMDAwMDAwMDAwMDAwMDA2NCB0MiA6
IDAwMDAwMDAwMDAwMDAwMDAgczAgOiBmZmZmZmZmZjgxNjAzZTgwCj4gICAgICAgICAgczEgOiAw
MDAwMDAwMDAwMDAwMDAwIGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6IDAwMDAwMDAwMDAwMDAw
MDAKPiAgICAgICAgICBhMiA6IDAwMDAwMDAwMDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAw
IGE0IDogMDAwMDAwMDAwMDAwMDAwMAo+ICAgICAgICAgIGE1IDogMDAwMDAwMDAwMDAwMWZmZiBh
NiA6IDAwMDAwMDAwMDAwMDFmZmYgYTcgOiBmZmZmZmZmZjgxNjE0OGIwCj4gICAgICAgICAgczIg
OiAwMDAwMDAwMDAwMDAwMDAxIHMzIDogZmZmZmZmZmY4MTQ5MmE0YyBzNCA6IGZmZmZmZmZmODFh
NGIwOTAKPiAgICAgICAgICBzNSA6IGZmZmZmZmZmODE1MDYwMzAgczYgOiAwMDAwMDAwMDAwMDAw
MDQwIHM3IDogMDAwMDAwMDAwMDAwMDAwMAo+ICAgICAgICAgIHM4IDogMDAwMDAwMDBiZmI2ZjA0
NiBzOSA6IDAwMDAwMDAwMDAwMDAwMDEgczEwOiAwMDAwMDAwMDAwMDAwMDAwCj4gICAgICAgICAg
czExOiAwMDAwMDAwMGJmMzg5NzAwIHQzIDogMDAwMDAwMDAwMDAwMDAwMCB0NCA6IDAwMDAwMDAw
MDAwMDAwMDAKPiAgICAgICAgICB0NSA6IGZmZmZmZmZmODI0ZGQxODggdDYgOiBmZmZmZmZmZjgy
NGRkMTg3Cj4gICAgICAgICBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAw
MDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMwo+ICAgICAgICAgWzxmZmZmZmZmZjgw
YzA0ZTBhPl0gb2ZfcGFyc2VfYW5kX2luaXRfY3B1cysweDE2Yy8weDE2ZQo+ICAgICAgICAgWzxm
ZmZmZmZmZjgwYzA0Yzk2Pl0gc2V0dXBfc21wKzB4MWUvMHgyNgo+ICAgICAgICAgWzxmZmZmZmZm
ZjgwYzAzZmZlPl0gc2V0dXBfYXJjaCsweDZlLzB4YjIKPiAgICAgICAgIFs8ZmZmZmZmZmY4MGMw
MDM4ND5dIHN0YXJ0X2tlcm5lbCsweDcyLzB4NDAwCj4gICAgICAgICBDb2RlOiA4MGU3IDRhMDAg
YTYwMyAwMDA5IGI3OTUgMTA5NyBmZmU1IDgwZTcgOTJjMCA5MDAyICg5MDAyKSA3MTVkCj4gICAg
ICAgICAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiAgICAgICAgIEtlcm5l
bCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBGYXRhbCBleGNlcHRpb24gaW4gaW50ZXJydXB0Cj4KPiBB
ZGQgYSB3YXJuaW5nIGZvciB0aGUgY2FzZXMgd2hlcmUgdGhlIElTQSBzdHJpbmcgaXNuJ3QgdmFs
aWQuICBJdCdzIHN0aWxsCj4gYWJvdmUgdGhlIEJVR19PTiBjdXQsIGJ1dCBob3BlZnVsbHkgaXQn
cyBhdCBsZWFzdCBhIGJpdCBlYXNpZXIgZm9yIHVzZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGFs
bWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClJldmlld2VkLWJ5OiBFdmFuIEdy
ZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
