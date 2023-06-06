Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D144C7EE37
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 22:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8rVkFBokcEFcaEVfTmZtVMIs6eZd9k6zAjRTE3XTK0=; b=W9XKvbl1sXT2OC
	VKcr33TqqBRStXqiH77AKNPBtZRIEARWcIit6rJ1EBVKT2bnJfnkxC9/hor5NIMcGQN6CykEMJoOB
	zXchgMH6LyJ2sBWaTpF5f/hX8Pvx8zM3phlycpqXqxsLGhyQulk0kLKqM4dso5pwi7NKraT6hpEFg
	LS7w2V+PMuS2WpelExBWx2mIK1e9WZxs4dY72ejJYd5AlbaG/sglQvsTwJeolpI/Vf+6vWEoGPL/T
	EARF04ZRAhp5HRFTwEt0lJsdUYKNk+WlvguFOseJa8Q1Si2hdDJWc1mzPX3pPjvJlyPuzqFWV1aUZ
	9/zkWD2O4ZqrcfoPcoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fWr-003Vgr-31;
	Tue, 06 Jun 2023 22:51:53 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fWo-003Vdk-0N
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 22:51:51 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b1fcda0f92so4534181fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 15:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686091906; x=1688683906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbEOqi7UDwPGQYsVQdLqqaKOY2Ki9XGPX+PsNVb1pfQ=;
        b=mbcwf6gk5i2TF9vdZWhsZIpi4+sIJQgRjoOrNUxv/ebdwsHW5ix9YXxd42wqB7xKvv
         kocs5a9n3jYTep04cgtEtmwiRNhJhemMD4SyL6n1Gu7NpKN8WYIYZWHWb2G5NDBloBqX
         uehI7uE6GqTtYclM1PfGmlXU5wTE5HC2RRcp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091906; x=1688683906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbEOqi7UDwPGQYsVQdLqqaKOY2Ki9XGPX+PsNVb1pfQ=;
        b=UYaVd/cNef2AZ/VHBG2Wndniu3Ygs4KVGD22XdjH1H8wZnGTnulxZzY2TzQ5PgJzx/
         JWKjO7tja6CHGmXu5oMgCuaSp2HUbhlj52TuOL6dDHg4pEMFn3JEz2JBQELl9a+b5qCC
         JQuy2zlWETbWcziPdGTTe0B6EbmkNeECRoDUsdm4uzGNFGGvhMW5egaFzNFkHHxvFi4A
         zICbAWziFGkkS+SzHIOnf9867ErPKcUwGMi4fNA2nsoIkttm/+9eTpFWPNneRAwAm/76
         OVjcmnxKhXsffZ9dTTiHiW+JoutwQmXKV+bUV4RkOhZk9MiaBkH02ysLoPY8vOjwsShF
         EL0A==
X-Gm-Message-State: AC+VfDwdU+9AezZ8+lHxCxcotmrU3UIuVUMZioPkmKgF308LsN8txphY
	Pfp7qvrNj/SXL8I8hckUXm7DTPccCk+8nUHCq6kZ
X-Google-Smtp-Source: ACHHUZ4KJVviG384lev7O3Wui5sN4TViyK0F/tK+N2XPByIrcx4WENx+9LadjCdNhsvEyIt9mDbEKgzlxPJcCWdbS/E=
X-Received: by 2002:a2e:999a:0:b0:2b1:c312:4faa with SMTP id
 w26-20020a2e999a000000b002b1c3124faamr1623384lji.53.1686091906254; Tue, 06
 Jun 2023 15:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230517105135.1871868-1-apatel@ventanamicro.com> <20230517105135.1871868-4-apatel@ventanamicro.com>
In-Reply-To: <20230517105135.1871868-4-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 6 Jun 2023 15:51:34 -0700
Message-ID: <CAOnJCUL0-BDJU6VCaXKKGzFbCo6hKzqDV9zJCFG_12PcX6uEXw@mail.gmail.com>
Subject: Re: [PATCH 03/10] RISC-V: KVM: Add APLIC related defines
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_155150_199418_E6CD5041 
X-CRM114-Status: GOOD (  15.36  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMzo1MuKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdlIGFkZCBBUExJQyByZWxhdGVkIGRlZmluZXMgaW4g
YSBzZXBhcmF0ZSBoZWFkZXIgc28gdGhhdCBkaWZmZXJlbnQKPiBwYXJ0cyBvZiBLVk0gY29kZSBj
YW4gc2hhcmUgaXQuIE9uY2UgQUlBIGRyaXZlcnMgYXJlIG1lcmdlZCB3aWxsCj4gaGF2ZSBhIGNv
bW1vbiBBUExJQyBoZWFkZXIgc2hhcmVkIGJ5IGJvdGggS1ZNIGFuZCBJUlFDSElQIGRyaXZlci4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfYXBsaWMuaCB8IDU4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCsp
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfYXBs
aWMuaAo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYV9hcGxp
Yy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhX2FwbGljLmgKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNmRkMWE0ODA5ZWMxCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYV9hcGxpYy5oCj4gQEAg
LTAsMCArMSw1OCBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
ICovCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBXZXN0ZXJuIERpZ2l0YWwgQ29ycG9y
YXRpb24gb3IgaXRzIGFmZmlsaWF0ZXMuCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBWZW50YW5h
IE1pY3JvIFN5c3RlbXMgSW5jLgo+ICsgKi8KPiArI2lmbmRlZiBfX0tWTV9SSVNDVl9BSUFfSU1T
SUNfSAo+ICsjZGVmaW5lIF9fS1ZNX1JJU0NWX0FJQV9JTVNJQ19ICj4gKwo+ICsjaW5jbHVkZSA8
bGludXgvYml0b3BzLmg+Cj4gKwo+ICsjZGVmaW5lIEFQTElDX01BWF9JREMgICAgICAgICAgICAg
ICAgICBCSVQoMTQpCj4gKyNkZWZpbmUgQVBMSUNfTUFYX1NPVVJDRSAgICAgICAgICAgICAgIDEw
MjQKPiArCj4gKyNkZWZpbmUgQVBMSUNfRE9NQUlOQ0ZHICAgICAgICAgICAgICAgICAgICAgICAg
MHgwMDAwCj4gKyNkZWZpbmUgQVBMSUNfRE9NQUlOQ0ZHX1JET05MWSAgICAgICAgIDB4ODAwMDAw
MDAKPiArI2RlZmluZSBBUExJQ19ET01BSU5DRkdfSUUgICAgICAgICAgICAgQklUKDgpCj4gKyNk
ZWZpbmUgQVBMSUNfRE9NQUlOQ0ZHX0RNICAgICAgICAgICAgIEJJVCgyKQo+ICsjZGVmaW5lIEFQ
TElDX0RPTUFJTkNGR19CRSAgICAgICAgICAgICBCSVQoMCkKPiArCj4gKyNkZWZpbmUgQVBMSUNf
U09VUkNFQ0ZHX0JBU0UgICAgICAgICAgIDB4MDAwNAo+ICsjZGVmaW5lIEFQTElDX1NPVVJDRUNG
R19EICAgICAgICAgICAgICBCSVQoMTApCj4gKyNkZWZpbmUgQVBMSUNfU09VUkNFQ0ZHX0NISUxE
SURYX01BU0sgIDB4MDAwMDAzZmYKPiArI2RlZmluZSBBUExJQ19TT1VSQ0VDRkdfU01fTUFTSyAg
ICAgICAgMHgwMDAwMDAwNwo+ICsjZGVmaW5lIEFQTElDX1NPVVJDRUNGR19TTV9JTkFDVElWRSAg
ICAweDAKPiArI2RlZmluZSBBUExJQ19TT1VSQ0VDRkdfU01fREVUQUNIICAgICAgMHgxCj4gKyNk
ZWZpbmUgQVBMSUNfU09VUkNFQ0ZHX1NNX0VER0VfUklTRSAgIDB4NAo+ICsjZGVmaW5lIEFQTElD
X1NPVVJDRUNGR19TTV9FREdFX0ZBTEwgICAweDUKPiArI2RlZmluZSBBUExJQ19TT1VSQ0VDRkdf
U01fTEVWRUxfSElHSCAgMHg2Cj4gKyNkZWZpbmUgQVBMSUNfU09VUkNFQ0ZHX1NNX0xFVkVMX0xP
VyAgIDB4Nwo+ICsKPiArI2RlZmluZSBBUExJQ19JUlFCSVRTX1BFUl9SRUcgICAgICAgICAgMzIK
PiArCj4gKyNkZWZpbmUgQVBMSUNfU0VUSVBfQkFTRSAgICAgICAgICAgICAgIDB4MWMwMAo+ICsj
ZGVmaW5lIEFQTElDX1NFVElQTlVNICAgICAgICAgICAgICAgICAweDFjZGMKPiArCj4gKyNkZWZp
bmUgQVBMSUNfQ0xSSVBfQkFTRSAgICAgICAgICAgICAgIDB4MWQwMAo+ICsjZGVmaW5lIEFQTElD
X0NMUklQTlVNICAgICAgICAgICAgICAgICAweDFkZGMKPiArCj4gKyNkZWZpbmUgQVBMSUNfU0VU
SUVfQkFTRSAgICAgICAgICAgICAgIDB4MWUwMAo+ICsjZGVmaW5lIEFQTElDX1NFVElFTlVNICAg
ICAgICAgICAgICAgICAweDFlZGMKPiArCj4gKyNkZWZpbmUgQVBMSUNfQ0xSSUVfQkFTRSAgICAg
ICAgICAgICAgIDB4MWYwMAo+ICsjZGVmaW5lIEFQTElDX0NMUklFTlVNICAgICAgICAgICAgICAg
ICAweDFmZGMKPiArCj4gKyNkZWZpbmUgQVBMSUNfU0VUSVBOVU1fTEUgICAgICAgICAgICAgIDB4
MjAwMAo+ICsjZGVmaW5lIEFQTElDX1NFVElQTlVNX0JFICAgICAgICAgICAgICAweDIwMDQKPiAr
Cj4gKyNkZWZpbmUgQVBMSUNfR0VOTVNJICAgICAgICAgICAgICAgICAgIDB4MzAwMAo+ICsKPiAr
I2RlZmluZSBBUExJQ19UQVJHRVRfQkFTRSAgICAgICAgICAgICAgMHgzMDA0Cj4gKyNkZWZpbmUg
QVBMSUNfVEFSR0VUX0hBUlRfSURYX1NISUZUICAgIDE4Cj4gKyNkZWZpbmUgQVBMSUNfVEFSR0VU
X0hBUlRfSURYX01BU0sgICAgIDB4M2ZmZgo+ICsjZGVmaW5lIEFQTElDX1RBUkdFVF9HVUVTVF9J
RFhfU0hJRlQgICAxMgo+ICsjZGVmaW5lIEFQTElDX1RBUkdFVF9HVUVTVF9JRFhfTUFTSyAgICAw
eDNmCj4gKyNkZWZpbmUgQVBMSUNfVEFSR0VUX0lQUklPX01BU0sgICAgICAgIDB4ZmYKPiArI2Rl
ZmluZSBBUExJQ19UQVJHRVRfRUlJRF9NQVNLIDB4N2ZmCj4gKwo+ICsjZW5kaWYKPiAtLQo+IDIu
MzQuMQo+CgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgot
LSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
