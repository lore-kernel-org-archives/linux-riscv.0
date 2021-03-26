Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD73C433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 18:22:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C2A961A2D
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 18:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C2A961A2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mWhwD9nQSSsKPwfRKLN+auEuev1trFlMRwf2Db/90nk=; b=no89K5FRPTkK6HVHluaMOYlnv
	tRl6al1uWrgjemN4NY9gRI0fANP9jSwsGtR0SiYW+i87AKO1gFjb4nsw6ki3tp4IVAymZsZnM3ULj
	r/g2WmNHuhsiovECw/8KmpZlgTksweLXEYtekbECbFDCRIyQ4zReIMz/TObvxx6iv/1rLNyunZRqq
	r1F1x8Tu2srtzoPGjwYtWaBCllxj8KEY42Qkdz4oJ/rKl4wCUSBhy+qwpEkhBe5gSRg3jja3KJp7h
	lZj7Yr2T0ZQNafqqxbRGtqvPE4J7VE31OzLQTNMJ3JSnHdjTBGY5eVOqo7qTX/UAaXhCEXCLFj3Do
	mWkrcTBng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPr6M-0048Kw-Q3; Fri, 26 Mar 2021 18:22:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPr6B-0048Jy-Tw; Fri, 26 Mar 2021 18:22:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAF4D61A44;
 Fri, 26 Mar 2021 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616782938;
 bh=jLGR+NyehSUNZVl5kh+mHpluJzlAfSJXFMkJ5QFHPLQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FGNMBA2S+sqoHCfdgN2xPFLdvY7w1ubfGycnYplAm5Xuh33eTfteivyAovekbWA9w
 yfld9bMxHjPtk6Hhklpu7oYZIbdFL1ljaGBXqC5JDt9yKBlTX7kAx1myFZ7wuAQTTU
 jVdlWWeH+3FguNaGmIau3X7NuPSKeRLNaH0udlAHqHLaTI2Nh59I0ILOAppKs8o8/D
 19qHEC4fCaQI1gejM6rW9sLEbEJ8sx1EuiN8eQS9UBjNdK2v5TM+H9geJCe0fg2Uua
 hTXju+20flSq1dpCUtji3RjvYCP8L0pwpr+4Ldr1Bi1ZJpawqdb9WedZVTTF9eqZAI
 +O7oIbfohruuw==
Received: by mail-ed1-f45.google.com with SMTP id h13so7355035eds.5;
 Fri, 26 Mar 2021 11:22:17 -0700 (PDT)
X-Gm-Message-State: AOAM532zINZ6CIk9tOMJdh47tx3h6HMHpS06xZAATl04JeAKbeWLgNGa
 Ray2yoyMfQ36hJR9wdB4XiVqjdxzQjLyKxwuww==
X-Google-Smtp-Source: ABdhPJzge00Chol2o+zcxsCiGngmRlWpn0gXJpTNd7PjgqCsH3Y9wanEoRXm0NadwDvEZ6TqBdnoQxNSvLg0UG9tpaw=
X-Received: by 2002:a05:6402:c0f:: with SMTP id
 co15mr16452718edb.373.1616782936426; 
 Fri, 26 Mar 2021 11:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <7362e4f6a5f5b79e6ad3fd3cec3183a4a283f7fc.1616765870.git.christophe.leroy@csgroup.eu>
 <CAL_Jsq+LF-s5K4Jwd5jCHrU8271L5WCiGb0tR7aTUa8ddHF1YQ@mail.gmail.com>
 <c18ef8f7-8e79-a9d3-3853-f8b992a4fc93@csgroup.eu>
In-Reply-To: <c18ef8f7-8e79-a9d3-3853-f8b992a4fc93@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Mar 2021 12:22:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOFHmfRNAXgm6Gbe3qTUwnUTroxPzPmmLJUN7ciM2z9g@mail.gmail.com>
Message-ID: <CAL_JsqJOFHmfRNAXgm6Gbe3qTUwnUTroxPzPmmLJUN7ciM2z9g@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] arm: Convert to GENERIC_CMDLINE
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicolas Pitre <nico@fluxnic.net>
Cc: Will Deacon <will@kernel.org>, Daniel Walker <danielwa@cisco.com>, 
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
X-CRM114-CacheID: sfid-20210326_182220_334518_19EE18F8 
X-CRM114-Status: GOOD (  21.18  )
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

K05pY28gd2hvIGFkZGVkIHRoZSBsaW5lIGluIHF1ZXN0aW9uLgoKT24gRnJpLCBNYXIgMjYsIDIw
MjEgYXQgOTo1MCBBTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAu
ZXU+IHdyb3RlOgo+Cj4KPgo+IExlIDI2LzAzLzIwMjEgw6AgMTY6NDcsIFJvYiBIZXJyaW5nIGEg
w6ljcml0IDoKPiA+IE9uIEZyaSwgTWFyIDI2LCAyMDIxIGF0IDc6NDQgQU0gQ2hyaXN0b3BoZSBM
ZXJveQo+ID4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4gPj4KPiA+PiBU
aGlzIGNvbnZlcnRzIHRoZSBhcmNoaXRlY3R1cmUgdG8gR0VORVJJQ19DTURMSU5FLgo+ID4+Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1Pgo+ID4+IC0tLQo+ID4+ICAgYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgfCAz
OCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+ICAgYXJjaC9hcm0va2Vy
bmVsL2F0YWdzX3BhcnNlLmMgfCAxNSArKysrKy0tLS0tLS0tLQo+ID4+ICAgMiBmaWxlcyBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL0tjb25maWcgYi9hcmNoL2FybS9LY29uZmlnCj4gPj4gaW5kZXggNWRhOTZm
NWRmNDhmLi42N2JjNzVmMmRhODEgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9hcm0vS2NvbmZpZwo+
ID4+ICsrKyBiL2FyY2gvYXJtL0tjb25maWcKPiA+PiBAQCAtNTAsNiArNTAsNyBAQCBjb25maWcg
QVJNCj4gPj4gICAgICAgICAgc2VsZWN0IEdFTkVSSUNfQVJDSF9UT1BPTE9HWSBpZiBBUk1fQ1BV
X1RPUE9MT0dZCj4gPj4gICAgICAgICAgc2VsZWN0IEdFTkVSSUNfQVRPTUlDNjQgaWYgQ1BVX1Y3
TSB8fCBDUFVfVjYgfHwgIUNQVV8zMnY2SyB8fCAhQUVBQkkKPiA+PiAgICAgICAgICBzZWxlY3Qg
R0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QgaWYgU01QCj4gPj4gKyAgICAgICBzZWxlY3Qg
R0VORVJJQ19DTURMSU5FIGlmIEFUQUdTCj4gPgo+ID4gRG9uJ3Qgd2UgbmVlZCB0aGlzIGVuYWJs
ZWQgZm9yICFBVEFHUyAoaS5lLiBEVCBib290KT8KPiA+Cj4gPiBDYW4gd2UgYWx3YXlzIGVuYWJs
ZSBHRU5FUklDX0NNRExJTkUgZm9yIE9GX0VBUkxZX0ZMQVRUUkVFPwo+ID4KPgo+IERvbid0IGtu
b3cuCj4KPiBUb2RheSBBUk0gaGFzOgo+Cj4gY2hvaWNlCj4gICAgICAgICBwcm9tcHQgIktlcm5l
bCBjb21tYW5kIGxpbmUgdHlwZSIgaWYgQ01ETElORSAhPSAiIgo+ICAgICAgICAgZGVmYXVsdCBD
TURMSU5FX0ZST01fQk9PVExPQURFUgo+ICAgICAgICAgZGVwZW5kcyBvbiBBVEFHUwoKSSB0aGlu
ayB0aGF0J3MgYSBtaXN0YWtlLiBJbiBhIERUIG9ubHkgY2FzZSAobm8gQVRBR1MpLCB3ZSdsbCBn
ZXQKZGlmZmVyZW50IGJlaGF2aW91ciAoaW4gZmR0LmMpIGRlcGVuZGluZyBpZiBDT05GSUdfQVRB
R1MgaXMgZW5hYmxlZCBvcgpub3QuIE5vdGUgdGhhdCBhdCB0aGUgdGltZSAoMjAxMikgdGhlIGFi
b3ZlIHdhcyBhZGRlZCwgdGhlIERUIGNvZGUKb25seSBzdXBwb3J0ZWQgQ09ORklHX0NNRExJTkUg
YW5kIENPTkZJR19DTURMSU5FX0ZPUkNFLgpDT05GSUdfQ01ETElORV9FWFRFTkQgd2FzIG9ubHkg
YWRkZWQgaW4gMjAxNi4gQW5kIHRoYXQgaGFzIGRpZmZlcmVudApiZWhhdmlvciBmb3IgQVRBR1Mg
dnMuIERULiBJbiBzdW1tYXJ5LCBpdCdzIGEgbWVzcy4gV2Ugc2hvdWxkIGRyb3AgdGhlCmRlcGVu
ZHMgZWl0aGVyIGJlZm9yZSB0aGlzIHBhdGNoIG9yIGp1c3QgYXMgcGFydCBvZiB0aGlzIHBhdGNo
IElNTy4KSSdkIGdvIHdpdGggdGhlIGxhdHRlciBnaXZlbiBDT05GSUdfQVRBR1MgaXMgZGVmYXVs
dCB5IGFuZCBlbmFibGVkIGZvcgpjb21tb24gY29uZmlncy4gV2l0aG91dCB0aGF0LCBpdCBsb29r
cyBsaWtlIENPTkZJR19DTURMSU5FIGRpc2FwcGVhcnMKZnJvbSBtZW51Y29uZmlnIGZvciBhdDkx
X2R0X2RlZmNvbmZpZy4KCkFsc28sIEkgdGhpbmsgdGhpcyBjb2RlIHNob3VsZCBiZSByZWZhY3Rv
cmVkIGEgYml0IHRvIGVsaW1pbmF0ZQpkZWZhdWx0X2NvbW1hbmRfbGluZS4gSW5zdGVhZCwgd2Ug
c2hvdWxkIGp1c3Qgc2F2ZSBhIHBvaW50ZXIgdG8gdGhlCkFUQUdTIGNvbW1hbmQgbGluZSBzdHJp
bmcsIGFuZCB0aGVuIGNhbGwgY21kbGluZV9idWlsZCBoZXJlIGluc3RlYWQgb2YKZG9pbmcgdGhl
IGV4dHJhIGNvcHk6CgogICAgICAgIC8qIHBhcnNlX2Vhcmx5X3BhcmFtIG5lZWRzIGEgYm9vdF9j
b21tYW5kX2xpbmUgKi8KICAgICAgICBzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBmcm9tLCBD
T01NQU5EX0xJTkVfU0laRSk7CgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
