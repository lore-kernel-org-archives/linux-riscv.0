Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B5BC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:27:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B84761A26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B84761A26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZQDOe2zGtFDkCGRLrWC9AxU/5fRTvWU6cC/4rE91/Is=; b=GcT+cxrsP7XR++t/YQMi57YX7
	lUK+WKpNShtTmlK5yMAclB+JA2PaCpJ0fowzPhFStvBUyUzUnsYqwSKz7jq3GhyvnH+Za7zn2cHwq
	+wNEbWJ3tNVGRsCd5e8v6HnvdwdOl26jbCFst7A1vtPVa1K4yy3HCufQClKYrMUl8BcxEPLLF3KRs
	kArsFkpFArQMG/GmCRg1UYRXBqauuGpnpP1y6AUjF2ZpkPx+tpLZj/RcmNhiigp2E0+CjWPfh36NO
	8+s0dY4MOiW9NglLuQR0aoFtYS5Ix/h0sm5z88PaUcAH2y4s9jBVhifrSTgqPU0Y6wdAt/GH8OfcR
	4mnewpKEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPoMo-003srW-JA; Fri, 26 Mar 2021 15:27:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPoMe-003spp-HT; Fri, 26 Mar 2021 15:27:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 947F861A27;
 Fri, 26 Mar 2021 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616772421;
 bh=PgZvub/EEgXyOMtj36/Ui5nnRJqFFaiQoQ/VbltMCjA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Eg+BwZGAwSyILfvPcAOTVne302pKV2q+cmm5Ihp4Me5aUHSjUNGW3+nDtB8R91wcm
 C2DZ9VNhmbn0jETV9GNehbOwe3JTYKhoqjnh/MiS11ee4oxdvW0wRf2ZrWgUDyfJma
 hWNpN/TDOWiJIBIfJozhEVq7FS6Mk6XBvB49orLZFW6uYQR5hUuZGCCK5sAk8SD5SC
 UeP3y50GhNpSvcc4yWyh8y4La1rfFodfJDuofdgE1ai4ujHIVkZF7oQxbAyMF7RCJU
 u626vT1IL6nOSZEgmRmqhiGrDEBDKZfd4AiSGwBgBRCvns974kHSj2o73ajFlbU9P5
 x5eyEjjSzm5/A==
Received: by mail-ed1-f54.google.com with SMTP id h13so6760027eds.5;
 Fri, 26 Mar 2021 08:27:01 -0700 (PDT)
X-Gm-Message-State: AOAM532QLfaG7IUCxgU661SLOnjT64ihR6vZRie1PkT4i/kNbLmwmKRW
 2sB4GC5sHfdAaPHZMxx/XgBJh/tK9ZXEnS4wBg==
X-Google-Smtp-Source: ABdhPJwqjia+Et0ifS4Qa3YP7BG89nAuXW50XJw7Bv12OLaUbiQxEkJ38eyAu5ZhN7DqGhRVJR72+O39P4k/LsEHPLw=
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr16004050edd.258.1616772420155; 
 Fri, 26 Mar 2021 08:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 <87zgyqdn3d.fsf@igel.home> <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
In-Reply-To: <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Mar 2021 09:26:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
Message-ID: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Will Deacon <will@kernel.org>, 
 Daniel Walker <danielwa@cisco.com>, 
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, 
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 microblaze <monstr@monstr.eu>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, nios2 <ley.foon.tan@intel.com>, 
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, X86 ML <x86@kernel.org>, 
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_152708_956999_59959F24 
X-CRM114-Status: GOOD (  13.44  )
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

T24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgODoyMCBBTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4KPgo+IExlIDI2LzAzLzIwMjEgw6AgMTU6
MDgsIEFuZHJlYXMgU2Nod2FiIGEgw6ljcml0IDoKPiA+IE9uIE3DpHIgMjYgMjAyMSwgQ2hyaXN0
b3BoZSBMZXJveSB3cm90ZToKPiA+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPj4gaW5kZXggZjhmMTUzMzJj
YWEyLi5lN2M5MWVlNDc4ZDEgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0
dXAuYwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiA+PiBAQCAtMjAsNiAr
MjAsNyBAQAo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3N3aW90bGIuaD4KPiA+PiAgICNpbmNsdWRl
IDxsaW51eC9zbXAuaD4KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9lZmkuaD4KPiA+PiArI2luY2x1
ZGUgPGxpbnV4L2NtZGxpbmUuaD4KPiA+Pgo+ID4+ICAgI2luY2x1ZGUgPGFzbS9jcHVfb3BzLmg+
Cj4gPj4gICAjaW5jbHVkZSA8YXNtL2Vhcmx5X2lvcmVtYXAuaD4KPiA+PiBAQCAtMjI4LDEwICsy
MjksOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcGFyc2VfZHRiKHZvaWQpCj4gPj4gICAgICB9Cj4g
Pj4KPiA+PiAgICAgIHByX2VycigiTm8gRFRCIHBhc3NlZCB0byB0aGUga2VybmVsXG4iKTsKPiA+
PiAtI2lmZGVmIENPTkZJR19DTURMSU5FX0ZPUkNFCj4gPj4gLSAgICBzdHJsY3B5KGJvb3RfY29t
bWFuZF9saW5lLCBDT05GSUdfQ01ETElORSwgQ09NTUFORF9MSU5FX1NJWkUpOwo+ID4+ICsgICAg
Y21kbGluZV9idWlsZChib290X2NvbW1hbmRfbGluZSwgTlVMTCwgQ09NTUFORF9MSU5FX1NJWkUp
Owo+ID4+ICAgICAgcHJfaW5mbygiRm9yY2luZyBrZXJuZWwgY29tbWFuZCBsaW5lIHRvOiAlc1xu
IiwgYm9vdF9jb21tYW5kX2xpbmUpOwo+ID4KPiA+IFNob3VsZG4ndCB0aGF0IG1lc3NhZ2UgYmVj
b21lIGNvbmRpdGlvbmFsIGluIHNvbWUgd2F5Pwo+ID4KPgo+IFlvdSBhcmUgcmlnaHQsIEkgZGlk
IHNvbWV0aGluZyBzaW1pbGFyIG9uIEFSTSBidXQgbG9va3MgbGlrZSBJIG1pc3NlZCBpdCBvbiBS
SVNDVi4KCkhvdyBpcyB0aGlzIGh1bmsgZXZlbiB1c2VmdWw/IFVuZGVyIHdoYXQgY29uZGl0aW9u
cyBjYW4geW91IGJvb3QKd2l0aG91dCBhIERUQj8gRXZlbiB3aXRoIGEgYnVpbHQtaW4gRFRCLCB0
aGUgRFQgY21kbGluZSBoYW5kbGluZyB3b3VsZApiZSBjYWxsZWQuCgpSb2IKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
