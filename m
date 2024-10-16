Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4893D2F7D2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 22:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm0mIB9zilRt3mbHXH0E9BATaujCD2lVRo4f5i3fth8=; b=rWnAnZdDkMc2gd
	7Kv2sFOaSxS6m0NXehEQNjF0sSaQYMtlBQlGlYS0SB0k8Cd26EXZ03fW8dzUYuYsSsxYqw2kEspmQ
	G3QDQoPPeapmiRXAF5hRda0IW+dBJogorie/fMocBolwbg0dPSd5u+DHh7FlbfwFelBoV9zcUvnW8
	0pcg6q8g9BsdCcBO9cq7FPTza3JHcpG9PYCJ2mMLyswXdhh4GZRX8xAK17is85OOJAo7hHxuyFwzY
	QVo6vaZKazIzURNKrVcfLiTkNOyg4qmmdvoEckxFTVVMSobqvLQdkQyGB6Ei+Svl0Ts16w83z7ZJz
	cmK8adO6aNPWqvUmpGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Cm9-0000000DB1C-3p2h;
	Wed, 16 Oct 2024 22:45:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Bk4-0000000D4OY-3V8h
	for linux-riscv@bombadil.infradead.org;
	Wed, 16 Oct 2024 21:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6H8Y7/ZzORONU1hyN/i6yVrHJ4H/bODv43/WrBP0n1k=; b=ULc5+a8iaE8xOkl9cVVXIHBL4g
	OSMmzk/W7PrM6Sd2HvMf09mRmBHur5EiyDo3IP/2y5trCP8U6c/F1gqAkxfXxyE/DFdx1VdwZbK1o
	5YkUQzWsmqtcjmS4GsDgDtjehg6rzYTm5wja/obxzAdizCmwNaPQWjeObuEdtyRYAyN6PZf6A2Rl4
	xtyPqECNMuioKDreslYapSNr6HiEmPk1Q/yxTpxwzIISLdBsVURaCAMib42OnpHYouK95qg/VMpEH
	y2k0aEHMO+DgvlgI2S7k7pXMMYMy42ZmGVqeUR+8amllwjYpHZjD8S9Ho7bRUBamn3z4qpB/J72Cs
	GwsxeNBA==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Bk0-00000006voe-2f1Q
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 21:39:39 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539e7e73740so251186e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 14:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1729114774; x=1729719574; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6H8Y7/ZzORONU1hyN/i6yVrHJ4H/bODv43/WrBP0n1k=;
        b=NHmKXGeuZaDtVN4hbAAVwC5CzavcyEYCNJFSCfuv1e4mGrbeWNnsnRBWWWvoDCl+bN
         hhCKVrd0GFyUO87B6zSViEzxQBf9cKQZ1Mb19EvE6be3U4zbzE2MUd6C0sHJ8+dbVuRx
         XQyhntxv3698Bsv5iYeYFeJiyeswT2/GHnGnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729114774; x=1729719574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6H8Y7/ZzORONU1hyN/i6yVrHJ4H/bODv43/WrBP0n1k=;
        b=U6s7Up3o4g2lSHv0wDI/O4mVXsAcwo2i7bplIXr3qz6/1/GfUHFVlRv293l/yqWjZ2
         U9eTZzO+9fuVgMJBdatwnqPeXbNnlzGV8Gjih/2+zo158MV1o2sSlVUfNjJ8Zu9ijEZa
         UZjpAp1PSNGqUOuGPu1O/ZCp5I16AqXf+DOITUTgq8Cuf9bdaqupL2tLo7qWyz6EZMlr
         x1Ju3yYfsKkofRk159ZG0TCdXv3NuUInhMeLvRb1/XVCdExcYZ/T36S0wwIABUbe7JIQ
         V6N+aFYwr3yniyyKk88bwp+FLkITIPOWKjnjx9GOkEnXTaFBkBBFPCDGQYidp0HH7iWg
         YAAA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Td7JRsMrrrpn4z2ux8DFTgLdbRM8fP6UNIWb/7rDkTnQS4p6Bv9AQ6AQA7FuyPd6iXK1EyansciwgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yykmth/3s9j+h7Ycoe8A3OTLSqz4kuasLKhRUL9Vj11mrFhtQHA
	lUQmwMdMGBA5Zpav5H9/F3aADBCRxAKX5PE/eGj7elzA6jgN9AfO3kAD6oHiNVyrSLXCOqAe/Lf
	TVmLGLM94Uml3cjPAgtrb1H9obMPlrUkM2sJNrpDkvgmpkL8=
X-Google-Smtp-Source: AGHT+IFPP+peTAUAy0oiDSlqRo1dFfekSIv/GJho/24l6zoVqW/NQcaXYqDCBv05acUPzYaLU4twAhJ7d34uSv62lyk=
X-Received: by 2002:a05:6512:ad6:b0:539:ff5a:7ea5 with SMTP id
 2adb3069b0e04-539ff5a8042mr4811318e87.15.1729114773775; Wed, 16 Oct 2024
 14:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240719160913.342027-1-apatel@ventanamicro.com> <20240719160913.342027-6-apatel@ventanamicro.com>
In-Reply-To: <20240719160913.342027-6-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 16 Oct 2024 14:39:22 -0700
Message-ID: <CAOnJCUKD_LFrzr+KN=F1mZ3=eJqw73XjrkhVDt=7W6=eEo=4Pg@mail.gmail.com>
Subject: Re: [PATCH 05/13] RISC-V: KVM: Replace aia_set_hvictl() with aia_hvictl_value()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_223938_033334_5B1F3C41 
X-CRM114-Status: GOOD (  15.60  )
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

T24gRnJpLCBKdWwgMTksIDIwMjQgYXQgOTowOeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBhaWFfc2V0X2h2aWN0bCgpIGludGVybmFsbHkg
d3JpdGVzIHRoZSBIVklDVEwgQ1NSIHdoaWNoIG1ha2VzCj4gaXQgZGlmZmljdWx0IG9wdGltaXpl
IHRoZSBDU1Igd3JpdGUgdXNpbmcgU0JJIE5BQ0wgZXh0ZW5zaW9uIGZvcgo+IGt2bV9yaXNjdl92
Y3B1X2FpYV91cGRhdGVfaHZpcCgpIGZ1bmN0aW9uIHNvIHJlcGxhY2UgYWlhX3NldF9odmljdGwo
KQo+IHdpdGggbmV3IGFpYV9odmljdGxfdmFsdWUoKSB3aGljaCBvbmx5IGNvbXB1dGVzIHRoZSBI
VklDVEwgdmFsdWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFu
YW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhLmMgfCAxMCArKysrKy0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+
IGluZGV4IDI5NjdkMzA1YzQ0Mi4uMTdhZTRhN2MwZTk0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL2FpYS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBAQCAtNTEsNyArNTEs
NyBAQCBzdGF0aWMgaW50IGFpYV9maW5kX2hnZWkoc3RydWN0IGt2bV92Y3B1ICpvd25lcikKPiAg
ICAgICAgIHJldHVybiBoZ2VpOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgYWlhX3NldF9odmljdGwo
Ym9vbCBleHRfaXJxX3BlbmRpbmcpCj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBhaWFf
aHZpY3RsX3ZhbHVlKGJvb2wgZXh0X2lycV9wZW5kaW5nKQo+ICB7Cj4gICAgICAgICB1bnNpZ25l
ZCBsb25nIGh2aWN0bDsKPgo+IEBAIC02Miw3ICs2Miw3IEBAIHN0YXRpYyB2b2lkIGFpYV9zZXRf
aHZpY3RsKGJvb2wgZXh0X2lycV9wZW5kaW5nKQo+Cj4gICAgICAgICBodmljdGwgPSAoSVJRX1Nf
RVhUIDw8IEhWSUNUTF9JSURfU0hJRlQpICYgSFZJQ1RMX0lJRDsKPiAgICAgICAgIGh2aWN0bCB8
PSBleHRfaXJxX3BlbmRpbmc7Cj4gLSAgICAgICBjc3Jfd3JpdGUoQ1NSX0hWSUNUTCwgaHZpY3Rs
KTsKPiArICAgICAgIHJldHVybiBodmljdGw7Cj4gIH0KPgo+ICAjaWZkZWYgQ09ORklHXzMyQklU
Cj4gQEAgLTEzMCw3ICsxMzAsNyBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X2FpYV91cGRhdGVfaHZp
cChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICNpZmRlZiBDT05GSUdfMzJCSVQKPiAgICAgICAg
IGNzcl93cml0ZShDU1JfSFZJUEgsIHZjcHUtPmFyY2guYWlhX2NvbnRleHQuZ3Vlc3RfY3NyLmh2
aXBoKTsKPiAgI2VuZGlmCj4gLSAgICAgICBhaWFfc2V0X2h2aWN0bCghIShjc3ItPmh2aXAgJiBC
SVQoSVJRX1ZTX0VYVCkpKTsKPiArICAgICAgIGNzcl93cml0ZShDU1JfSFZJQ1RMLCBhaWFfaHZp
Y3RsX3ZhbHVlKCEhKGNzci0+aHZpcCAmIEJJVChJUlFfVlNfRVhUKSkpKTsKPiAgfQo+Cj4gIHZv
aWQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2xvYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgY3B1
KQo+IEBAIC01MzYsNyArNTM2LDcgQEAgdm9pZCBrdm1fcmlzY3ZfYWlhX2VuYWJsZSh2b2lkKQo+
ICAgICAgICAgaWYgKCFrdm1fcmlzY3ZfYWlhX2F2YWlsYWJsZSgpKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm47Cj4KPiAtICAgICAgIGFpYV9zZXRfaHZpY3RsKGZhbHNlKTsKPiArICAgICAgIGNz
cl93cml0ZShDU1JfSFZJQ1RMLCBhaWFfaHZpY3RsX3ZhbHVlKGZhbHNlKSk7Cj4gICAgICAgICBj
c3Jfd3JpdGUoQ1NSX0hWSVBSSU8xLCAweDApOwo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9IVklQ
UklPMiwgMHgwKTsKPiAgI2lmZGVmIENPTkZJR18zMkJJVAo+IEBAIC01NzIsNyArNTcyLDcgQEAg
dm9pZCBrdm1fcmlzY3ZfYWlhX2Rpc2FibGUodm9pZCkKPiAgICAgICAgIGNzcl9jbGVhcihDU1Jf
SElFLCBCSVQoSVJRX1NfR0VYVCkpOwo+ICAgICAgICAgZGlzYWJsZV9wZXJjcHVfaXJxKGhnZWlf
cGFyZW50X2lycSk7Cj4KPiAtICAgICAgIGFpYV9zZXRfaHZpY3RsKGZhbHNlKTsKPiArICAgICAg
IGNzcl93cml0ZShDU1JfSFZJQ1RMLCBhaWFfaHZpY3RsX3ZhbHVlKGZhbHNlKSk7Cj4KPiAgICAg
ICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgmaGdjdHJsLT5sb2NrLCBmbGFncyk7Cj4KPiAtLQo+
IDIuMzQuMQo+CgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
PgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
