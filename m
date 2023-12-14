Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298F2C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 12:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81BAUzjXhUZP1bNDWj4G9GZqpwyFecIrNxBm9OO6qBM=; b=h5pndBvFycsGkV
	80NAYimNFD1G9FA5D6Y+HC3uio7odtfQrEdSYTt2UmQx89lXPBO/clzYR5rCKcbFJ1rRveWu34EQx
	+umj+hDUOEXT7HqJg0mwZL8hmaSBK/cPaNHgOQGwY8I2jHnt9KmzOoJFvanbSzmUw4KXx3wYiyz36
	SAO+/WvurqpDT+S1JhBBblLtqUGyAL8kYhBbkfvinnEerzivzVnJVF8RIJrHAeSoWITOETH6u8/O2
	D6OKPV5icg5vifF3vGnIoAYHQSsaNobSvt2VcWB3YEoFDmnOPqux55qofhItjb4ZsltMX6oL4MoAX
	3gu0sGW6k2aMJT/oTd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDl2i-000JBc-2Q;
	Thu, 14 Dec 2023 12:42:20 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDl2f-000J9y-2L
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 12:42:19 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-286b45c5a8dso8399821a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 04:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702557729; x=1703162529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yws50ylq1EjUkokTIkYOP2sTsutSEl10pAQ1LytLppw=;
        b=U8oAD+HmSWD3gHCOQwVJRxydux7+fUPk7bOeNuyA0uD0y062uBv9CL/StAxbniFK2m
         rnL7MVoBy03acwkqZv7T1m67+ZLb2hbEpE/g7SbFqR8QtNVILoEKv4xGnrZbL2udwXIo
         oK/a7RtdTKD1FHyjyQTSvVFZZJkZW3dwOJ8JdKewTOg5WWgZj1qanbOOcAflcazvDKAZ
         4ZScZ6jjL+ZTEZS4o+KWMVhaPr00RzDGWUGPJ2tUgcvdkIjr+WHuUAxoKnz4hBs7uKBa
         i6cJZpcmdCrJ0/UBvpmwgiNDBW6cecfaubWEZW8Q+uT3EE59FWYXC5+zDpGTfJc8Tszt
         x6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702557729; x=1703162529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yws50ylq1EjUkokTIkYOP2sTsutSEl10pAQ1LytLppw=;
        b=d/carxHAmvS82FTtKavIK2fnidp6g9Qai9KLErUnU6KWENmXWiIuPDWSytSL8o6hIm
         5oAqg2fikXWafAf9cdcYl4FWJ154+6AyNjkriao/qrTsfgwlRQprbIJRkHw7XsbKZfUu
         9nKMoSb0pGrQx57n68MWgja+MQoCWt0vaXSvEucmYnkqj0Zs38quVeVPNceQB3lucNvW
         xnNqawTUyGprL3npoo3Ih1ai+EHic5FISMLZNHvgMHNwh2JWt/IsHoKUsQWSkT0BvRuF
         21ONG1krTtq2x+Rss7lZe2zMuQ4owScbLAbDQudj4VF/JooYyjM8tets19zalaDOIK8U
         v3Gw==
X-Gm-Message-State: AOJu0YzXSDWVTZDjS7tQ7zjw03eBZAiiERKHNExizMQ5d1d2i9Fnkohs
	G8sMzCu4or+PrVSZkMxnC+Bcl2faQTcjxYWTAGY12A==
X-Google-Smtp-Source: AGHT+IHGAsyuOZIB4sppc3GwRu4zHElev+uLaRnUeyYMhAuZzoyenRB6gyAOaSXUB4X/u3gleJnJa3pxzwY2EnvbCio=
X-Received: by 2002:a17:90a:c697:b0:28a:dfa6:f1d3 with SMTP id
 n23-20020a17090ac69700b0028adfa6f1d3mr2094943pjt.0.1702557729115; Thu, 14 Dec
 2023 04:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-10-atishp@rivosinc.com>
In-Reply-To: <20231205024310.1593100-10-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 18:11:57 +0530
Message-ID: <CAAhSdy24k0r7vS1MkuRkAZwu9vOM7nLz4z+_gUjQE7ppkSq15g@mail.gmail.com>
Subject: Re: [RFC 9/9] RISC-V: KVM: Support 64 bit firmware counters on RV32
To: Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_044217_795418_7B4D4130 
X-CRM114-Status: GOOD (  21.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCA4OjEz4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gVGhlIFNCSSB2Mi4wIGludHJvZHVjZWQgYSBmd19yZWFkX2hp
IGZ1bmN0aW9uIHRvIHJlYWQgNjQgYml0IGZpcm13YXJlCj4gY291bnRlcnMgZm9yIFJWMzIgYmFz
ZWQgc3lzdGVtcy4KPgo+IEFkZCBpbmZyYXN0cnVjdHVyZSB0byBzdXBwb3J0IHRoYXQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9wbXUuaCB8ICA2ICsrKystCj4gIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgICAgICAgICAgfCAzOCArKysrKysrKysrKysrKysrKysr
KysrKysrKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmMgICAgICAgICB8ICA3ICsr
KysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9wbXUuaAo+IGluZGV4IDY0Yzc1YWNhZDZi
YS4uZGQ2NTUzMTVlNzA2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X3ZjcHVfcG11LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5o
Cj4gQEAgLTIwLDcgKzIwLDcgQEAgc3RhdGljX2Fzc2VydChSSVNDVl9LVk1fTUFYX0NPVU5URVJT
IDw9IDY0KTsKPgo+ICBzdHJ1Y3Qga3ZtX2Z3X2V2ZW50IHsKPiAgICAgICAgIC8qIEN1cnJlbnQg
dmFsdWUgb2YgdGhlIGV2ZW50ICovCj4gLSAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlOwo+ICsg
ICAgICAgdWludDY0X3QgdmFsdWU7Cj4KPiAgICAgICAgIC8qIEV2ZW50IG1vbml0b3Jpbmcgc3Rh
dHVzICovCj4gICAgICAgICBib29sIHN0YXJ0ZWQ7Cj4gQEAgLTkxLDYgKzkxLDEwIEBAIGludCBr
dm1fcmlzY3ZfdmNwdV9wbXVfY3RyX2NmZ19tYXRjaChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVu
c2lnbmVkIGxvbmcgY3RyX2JhCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBrdm1fdmNwdV9zYmlfcmV0dXJuICpyZXRkYXRhKTsKPiAgaW50IGt2bV9yaXNjdl92
Y3B1X3BtdV9jdHJfcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgY2lk
eCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zYmlf
cmV0dXJuICpyZXRkYXRhKTsKPiArI2lmIGRlZmluZWQoQ09ORklHXzMyQklUKQo+ICtpbnQga3Zt
X3Jpc2N2X3ZjcHVfcG11X2Z3X2N0cl9yZWFkX2hpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5z
aWduZWQgbG9uZyBjaWR4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGt2bV92Y3B1X3NiaV9yZXR1cm4gKnJldGRhdGEpOwo+ICsjZW5kaWYKPiAgdm9pZCBrdm1fcmlz
Y3ZfdmNwdV9wbXVfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICBpbnQga3ZtX3Jpc2N2
X3ZjcHVfcG11X3NldHVwX3NuYXBzaG90KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQg
bG9uZyBzYWRkcl9sb3csCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBzYWRkcl9oaWdoLCB1bnNpZ25lZCBsb25nIGZsYWdzLAo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUu
Ywo+IGluZGV4IDg2YzhlOTJmOTJkMy4uNWI0YTkzNjQ3MjU2IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4g
QEAgLTE5NSw2ICsxOTUsMjggQEAgc3RhdGljIGludCBwbXVfZ2V0X3BtY19pbmRleChzdHJ1Y3Qg
a3ZtX3BtdSAqcG11LCB1bnNpZ25lZCBsb25nIGVpZHgsCj4KPiAgICAgICAgIHJldHVybiBrdm1f
cG11X2dldF9wcm9ncmFtbWFibGVfcG1jX2luZGV4KHBtdSwgZWlkeCwgY2Jhc2UsIGNtYXNrKTsK
PiAgfQoKTmV3bGluZSBoZXJlLgoKPiArI2lmIGRlZmluZWQoQ09ORklHXzMyQklUKQoKSnVzdCBs
aWtlIG90aGVyIHBhdGNoZXMsIGxldCdzIHVzZSBJU19FTkFCTEVEKCkgaGVyZS4KCj4gK3N0YXRp
YyBpbnQgcG11X2Z3X2N0cl9yZWFkX2hpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQg
bG9uZyBjaWR4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
Km91dF92YWwpCj4gK3sKPiArICAgICAgIHN0cnVjdCBrdm1fcG11ICprdnBtdSA9IHZjcHVfdG9f
cG11KHZjcHUpOwo+ICsgICAgICAgc3RydWN0IGt2bV9wbWMgKnBtYzsKPiArICAgICAgIHU2NCBl
bmFibGVkLCBydW5uaW5nOwo+ICsgICAgICAgaW50IGZldmVudF9jb2RlOwo+ICsKPiArICAgICAg
IHBtYyA9ICZrdnBtdS0+cG1jW2NpZHhdOwo+ICsKPiArICAgICAgIGlmIChwbWMtPmNpbmZvLnR5
cGUgIT0gU0JJX1BNVV9DVFJfVFlQRV9GVykKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gKwo+ICsgICAgICAgZmV2ZW50X2NvZGUgPSBnZXRfZXZlbnRfY29kZShwbWMtPmV2ZW50
X2lkeCk7Cj4gKyAgICAgICBwbWMtPmNvdW50ZXJfdmFsID0ga3ZwbXUtPmZ3X2V2ZW50W2ZldmVu
dF9jb2RlXS52YWx1ZTsKPiArCj4gKyAgICAgICAqb3V0X3ZhbCA9IHBtYy0+Y291bnRlcl92YWwg
Pj4gMzI7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArI2VuZGlmCj4KPiAgc3RhdGlj
IGludCBwbXVfY3RyX3JlYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNp
ZHgsCj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqb3V0X3ZhbCkKPiBA
QCAtNjk2LDYgKzcxOCwyMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9jZmdfbWF0Y2go
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYQo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPgo+ICsjaWYgZGVmaW5lZChDT05GSUdfMzJCSVQpCj4gK2ludCBrdm1fcmlz
Y3ZfdmNwdV9wbXVfZndfY3RyX3JlYWRfaGkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25l
ZCBsb25nIGNpZHgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
a3ZtX3ZjcHVfc2JpX3JldHVybiAqcmV0ZGF0YSkKPiArewo+ICsgICAgICAgaW50IHJldDsKPiAr
Cj4gKyAgICAgICByZXQgPSBwbXVfZndfY3RyX3JlYWRfaGkodmNwdSwgY2lkeCwgJnJldGRhdGEt
Pm91dF92YWwpOwo+ICsgICAgICAgaWYgKHJldCA9PSAtRUlOVkFMKQo+ICsgICAgICAgICAgICAg
ICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICsKPiArICAgICAg
IHJldHVybiAwOwo+ICt9Cj4gKyNlbmRpZgo+ICsKPiAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9j
dHJfcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgY2lkeCwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zYmlfcmV0dXJuICpy
ZXRkYXRhKQo+ICB7Cj4gQEAgLTc2OSw3ICs4MDUsNyBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3Bt
dV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBw
bWMtPmNpbmZvLmNzciA9IENTUl9DWUNMRSArIGk7Cj4gICAgICAgICAgICAgICAgIH0gZWxzZSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcG1jLT5jaW5mby50eXBlID0gU0JJX1BNVV9DVFJf
VFlQRV9GVzsKPiAtICAgICAgICAgICAgICAgICAgICAgICBwbWMtPmNpbmZvLndpZHRoID0gQklU
U19QRVJfTE9ORyAtIDE7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcG1jLT5jaW5mby53aWR0
aCA9IDYzOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9w
bXUuYwo+IGluZGV4IDc3YzIwYTYxZmQ3ZC4uMGNkMDUxZDVhNDQ4IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmlfcG11LmMKPiBAQCAtNjQsNiArNjQsMTMgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9wbXVf
aGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gICAg
ICAgICBjYXNlIFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRDoKPiAgICAgICAgICAgICAgICAg
cmV0ID0ga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9yZWFkKHZjcHUsIGNwLT5hMCwgcmV0ZGF0YSk7
Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSBTQklfRVhUX1BNVV9DT1VO
VEVSX0ZXX1JFQURfSEk6Cj4gKyNpZiBkZWZpbmVkKENPTkZJR18zMkJJVCkKClNhbWUgYXMgYWJv
dmUsIHVzZSBJU19FTkFCTEVEKCkgaGVyZS4KCj4gKyAgICAgICAgICAgICAgIHJldCA9IGt2bV9y
aXNjdl92Y3B1X3BtdV9md19jdHJfcmVhZF9oaSh2Y3B1LCBjcC0+YTAsIHJldGRhdGEpOwo+ICsj
ZWxzZQo+ICsgICAgICAgICAgICAgICByZXRkYXRhLT5vdXRfdmFsID0gMDsKPiArI2VuZGlmCj4g
KyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBTQklfRVhUX1BNVV9TTkFQU0hP
VF9TRVRfU0hNRU06Cj4gICAgICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNjdl92Y3B1X3BtdV9z
ZXR1cF9zbmFwc2hvdCh2Y3B1LCBjcC0+YTAsIGNwLT5hMSwgY3AtPmEyLCByZXRkYXRhKTsKPiAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gLS0KPiAyLjM0LjEKPgoKQXBhcnQgZnJvbSBtaW5vciBu
aXRzIGFib3ZlLCB0aGlzIGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
