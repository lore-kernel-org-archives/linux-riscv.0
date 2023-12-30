Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E362FC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yI3etr644/Bhkz0w4zIZEgzDRfVJgZN4/IR2rNGyVrs=; b=N+kTTe4bIrtn2n
	FCYQMv7jGcBN93umoTnTBdkHUdY9POuXIAW9a5Q5ufcDyWQXks+St4fKAGnL+8gv/a2zj8kscF6uD
	B3/hUZbx1c/ub6Dthi2rGGtb/+hODvi9GAM2PyMZUC9/XCEsGsOyis11uB+yjMhYKmyftLw223+mF
	8bBnpbIjqv8b2VhLba4l89Ukfz9pWDj59030C85eoTguVEl19QTGMJfsbFeGm2eO/Nf0osqNsdfyT
	IwLrleGwu6EG33N75ANduedmpEgfM6pKjgd7sYwK7XHe/HMbqGq++GpBUSPxe1wpEnIr1sBrMBFGf
	Cepc/72Pcytwdo0LYZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJUQT-002OHE-2z;
	Sat, 30 Dec 2023 08:10:33 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJUQR-002OGQ-1q
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 08:10:32 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7ba903342c2so507925839f.3
        for <linux-riscv@lists.infradead.org>; Sat, 30 Dec 2023 00:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1703923830; x=1704528630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiNrSH9oUjINY/vtkmdArFK8GmKKmu32NZyqnMgcK1w=;
        b=eT2QXYikEtvrc4HcVAk4Ey43K74Tties4BaZd1S14GOm2Vtgu7bgRlLzeL4/b+3xLF
         PDf37vcNtfesScYYNxNvYW1irYZcGzNVYknaUuBTUNPppBZxkbCbGUSzLgHGHv4j22df
         Fh//0H+oUWqllqBYtfd4A0kuarjLZjzeRXBbFX4lsH8EdoQNAzw4B5vw2WFaoX6WLo5N
         QkWONAMP2OQVS4HRKbnpxPgFMhe94c4NlLJ7ueE3xDTO39YEcTS7Z7Rfxo43AckmRS4w
         Ciqg3/CXZ2vwo0o85awldzWg3LcDH2An5emZp5uuhVuWpGbVmY2vWHOPXeg/3AqD6oPG
         +thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703923830; x=1704528630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiNrSH9oUjINY/vtkmdArFK8GmKKmu32NZyqnMgcK1w=;
        b=BahzIwbRkwMeKzasp73QeSk+uIOA5V1awVJpJYlFQjYqKHuy+f6GbwB3pYj0oJVUwe
         BjSvNDMfrMUOmCdqs0ZB0NhgidupowLDV3Yets6XpmsNiTJam6WPrbXbA4emW3dfwZ55
         ZXp+F2DLuQuuvQuGxcGvntGPwd4wRDJKjEblk1PRd4ElnfkA150SsYs3kvXxRCDXmv2x
         alkG9A2IWZh3GFJ2oWiPhoXfC1yPL7vtOl6BXtdDND5lXIMColp0WXEBEQaY2iu2OKt9
         xkOo9aVzl+0Ton0rGMnEt8xB2GHUe8benFmyQA8JWU/uOnscawY5NqUzHRJ7uEe4z67B
         U4Jw==
X-Gm-Message-State: AOJu0Yy/3hBey5wJttspawgtt1jULuVRNjaTuVNO+owT8xjVcuDI9hPD
	OYgZyUxR+s1FmrvwTkv4/YPNRmj1dgC7/tPLtsgCm1rUlcz3qg==
X-Google-Smtp-Source: AGHT+IEhY4D0sK9xFLORpCAS+I82gFLXEGeS2aN1Vp0qGYmEIOgWrqL0REUG0dfNSg0lCV7PZGEUmGb8+bNLhldBe68=
X-Received: by 2002:a05:6e02:2408:b0:35d:5995:7992 with SMTP id
 bs8-20020a056e02240800b0035d59957992mr23726864ilb.44.1703923830374; Sat, 30
 Dec 2023 00:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20231229214950.4061381-1-atishp@rivosinc.com> <20231229214950.4061381-11-atishp@rivosinc.com>
In-Reply-To: <20231229214950.4061381-11-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Dec 2023 13:40:20 +0530
Message-ID: <CAAhSdy03BLQRdTZAqteK9PsbjxQt7cncXu_fG1CG99uQK5v6CA@mail.gmail.com>
Subject: Re: [v2 10/10] RISC-V: KVM: Support 64 bit firmware counters on RV32
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231230_001031_612238_EB7B67F4 
X-CRM114-Status: GOOD (  20.95  )
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

T24gU2F0LCBEZWMgMzAsIDIwMjMgYXQgMzoyMOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBTQkkgdjIuMCBpbnRyb2R1Y2VkIGEgZndfcmVhZF9o
aSBmdW5jdGlvbiB0byByZWFkIDY0IGJpdCBmaXJtd2FyZQo+IGNvdW50ZXJzIGZvciBSVjMyIGJh
c2VkIHN5c3RlbXMuCj4KPiBBZGQgaW5mcmFzdHJ1Y3R1cmUgdG8gc3VwcG9ydCB0aGF0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpMR1RNLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApB
bnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5oIHwgIDQg
KystCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgICAgICAgICAgfCAzNyArKysrKysr
KysrKysrKysrKysrKysrKysrKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmMgICAg
ICAgICB8ICA2ICsrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92
Y3B1X3BtdS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9wbXUuaAo+IGluZGV4
IGFmNmQwZmY1Y2U0MS4uNDYzYzM0OWE5ZWE1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX3ZjcHVfcG11LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV92Y3B1X3BtdS5oCj4gQEAgLTIwLDcgKzIwLDcgQEAgc3RhdGljX2Fzc2VydChSSVNDVl9LVk1f
TUFYX0NPVU5URVJTIDw9IDY0KTsKPgo+ICBzdHJ1Y3Qga3ZtX2Z3X2V2ZW50IHsKPiAgICAgICAg
IC8qIEN1cnJlbnQgdmFsdWUgb2YgdGhlIGV2ZW50ICovCj4gLSAgICAgICB1bnNpZ25lZCBsb25n
IHZhbHVlOwo+ICsgICAgICAgdTY0IHZhbHVlOwo+Cj4gICAgICAgICAvKiBFdmVudCBtb25pdG9y
aW5nIHN0YXR1cyAqLwo+ICAgICAgICAgYm9vbCBzdGFydGVkOwo+IEBAIC05MSw2ICs5MSw4IEBA
IGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX2NmZ19tYXRjaChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHVuc2lnbmVkIGxvbmcgY3RyX2JhCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zYmlfcmV0dXJuICpyZXRkYXRhKTsKPiAgaW50IGt2bV9y
aXNjdl92Y3B1X3BtdV9jdHJfcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxv
bmcgY2lkeCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fdmNw
dV9zYmlfcmV0dXJuICpyZXRkYXRhKTsKPiAraW50IGt2bV9yaXNjdl92Y3B1X3BtdV9md19jdHJf
cmVhZF9oaShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgY2lkeCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zYmlfcmV0
dXJuICpyZXRkYXRhKTsKPiAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9wbXVfaW5pdChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwo+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X3NldHVwX3NuYXBzaG90KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBzYWRkcl9sb3csCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNhZGRyX2hpZ2gsIHVu
c2lnbmVkIGxvbmcgZmxhZ3MsCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gaW5kZXggZjJiZjViNWJkZDYxLi5lNmNl
Mzc4MTljYTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBAQCAtMTk2LDYgKzE5NiwyOSBAQCBzdGF0aWMg
aW50IHBtdV9nZXRfcG1jX2luZGV4KHN0cnVjdCBrdm1fcG11ICpwbXUsIHVuc2lnbmVkIGxvbmcg
ZWlkeCwKPiAgICAgICAgIHJldHVybiBrdm1fcG11X2dldF9wcm9ncmFtbWFibGVfcG1jX2luZGV4
KHBtdSwgZWlkeCwgY2Jhc2UsIGNtYXNrKTsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgcG11X2Z3X2N0
cl9yZWFkX2hpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKm91dF92YWwpCj4gK3sK
PiArICAgICAgIHN0cnVjdCBrdm1fcG11ICprdnBtdSA9IHZjcHVfdG9fcG11KHZjcHUpOwo+ICsg
ICAgICAgc3RydWN0IGt2bV9wbWMgKnBtYzsKPiArICAgICAgIGludCBmZXZlbnRfY29kZTsKPiAr
Cj4gKyAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgcG1jID0gJmt2cG11LT5wbWNbY2lkeF07
Cj4gKwo+ICsgICAgICAgaWYgKHBtYy0+Y2luZm8udHlwZSAhPSBTQklfUE1VX0NUUl9UWVBFX0ZX
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICAgICBmZXZlbnRf
Y29kZSA9IGdldF9ldmVudF9jb2RlKHBtYy0+ZXZlbnRfaWR4KTsKPiArICAgICAgIHBtYy0+Y291
bnRlcl92YWwgPSBrdnBtdS0+ZndfZXZlbnRbZmV2ZW50X2NvZGVdLnZhbHVlOwo+ICsKPiArICAg
ICAgICpvdXRfdmFsID0gcG1jLT5jb3VudGVyX3ZhbCA+PiAzMjsKPiArCj4gKyAgICAgICByZXR1
cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGludCBwbXVfY3RyX3JlYWQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNpZHgsCj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyAqb3V0X3ZhbCkKPiAgewo+IEBAIC03MDEsNiArNzI0LDE4IEBAIGludCBrdm1f
cmlzY3ZfdmNwdV9wbXVfY3RyX2NmZ19tYXRjaChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2ln
bmVkIGxvbmcgY3RyX2JhCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gK2ludCBrdm1fcmlz
Y3ZfdmNwdV9wbXVfZndfY3RyX3JlYWRfaGkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25l
ZCBsb25nIGNpZHgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3Qga3ZtX3ZjcHVfc2JpX3JldHVybiAqcmV0ZGF0YSkKPiArewo+ICsgICAgICAgaW50IHJldDsK
PiArCj4gKyAgICAgICByZXQgPSBwbXVfZndfY3RyX3JlYWRfaGkodmNwdSwgY2lkeCwgJnJldGRh
dGEtPm91dF92YWwpOwo+ICsgICAgICAgaWYgKHJldCA9PSAtRUlOVkFMKQo+ICsgICAgICAgICAg
ICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICsKPiArICAg
ICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9yZWFk
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV92Y3B1X3NiaV9yZXR1cm4gKnJldGRhdGEp
Cj4gIHsKPiBAQCAtNzc0LDcgKzgwOSw3IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcG11X2luaXQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBtYy0+Y2lu
Zm8uY3NyID0gQ1NSX0NZQ0xFICsgaTsKPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBwbWMtPmNpbmZvLnR5cGUgPSBTQklfUE1VX0NUUl9UWVBFX0ZX
Owo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBtYy0+Y2luZm8ud2lkdGggPSBCSVRTX1BFUl9M
T05HIC0gMTsKPiArICAgICAgICAgICAgICAgICAgICAgICBwbWMtPmNpbmZvLndpZHRoID0gNjM7
Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jCj4g
aW5kZXggOWY2MTEzNmU0YmIxLi41OGEwZTU1ODdlMmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUu
Ywo+IEBAIC02NCw2ICs2NCwxMiBAQCBzdGF0aWMgaW50IGt2bV9zYmlfZXh0X3BtdV9oYW5kbGVy
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgIGNh
c2UgU0JJX0VYVF9QTVVfQ09VTlRFUl9GV19SRUFEOgo+ICAgICAgICAgICAgICAgICByZXQgPSBr
dm1fcmlzY3ZfdmNwdV9wbXVfY3RyX3JlYWQodmNwdSwgY3AtPmEwLCByZXRkYXRhKTsKPiAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIFNCSV9FWFRfUE1VX0NPVU5URVJfRldf
UkVBRF9ISToKPiArICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkK
PiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfdmNwdV9wbXVfZndfY3Ry
X3JlYWRfaGkodmNwdSwgY3AtPmEwLCByZXRkYXRhKTsKPiArICAgICAgICAgICAgICAgZWxzZQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJldGRhdGEtPm91dF92YWwgPSAwOwo+ICsgICAgICAg
ICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgU0JJX0VYVF9QTVVfU05BUFNIT1RfU0VUX1NI
TUVNOgo+ICAgICAgICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfdmNwdV9wbXVfc2V0dXBfc25h
cHNob3QodmNwdSwgY3AtPmEwLCBjcC0+YTEsIGNwLT5hMiwgcmV0ZGF0YSk7Cj4gICAgICAgICAg
ICAgICAgIGJyZWFrOwo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
