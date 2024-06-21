Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31876C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEqz9cSCoUGJDPYjtPyoTq9BjwmfgekoIKDoNi4doJQ=; b=c3bdX/3N7pH0XD
	F0bYIO1m54addAChHohPEaa4y6mgONZHgNprmWkNo5LN2LiT8aqcE+XYXkk7AeZzvhIzMVbn8lAq5
	OswGI9i0Enq6isuG2XXbaTu2SpMlgaDpfS7ud25xIy1Ox+wTUgUhBlC5wMr9AC3V3CVxqx7TLLD5N
	QX7nZE4Ye/pbTWu6Lvz2HXZDyWd88M39qsAeHLa+5hbN3S2IS0ndT8G9sOxxAug4xrUHaetkFEw7G
	aw9JzuKJM/JtTqF/BPf+eXlBu1TUB39l8WidehycxWbJvYEwwibhuYIfCoTsEjJHwuvZtkwA7V0YB
	S7+ra5iW6BA09idEFiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd6O-000000094JB-1M5L;
	Fri, 21 Jun 2024 12:10:48 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd6M-000000094IN-21WQ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 12:10:47 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3762c172d9aso5145255ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1718971845; x=1719576645; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXUId7BgiOrJKlvj4EXPaiwGxRE3QDT7xYFFY6+6a4g=;
        b=zkh/nauSA9c/xvcJOLDSKaSS/NpFyuUzCy8UYsfoeYec6wXyHR9kGRIfpA7Srt8+qz
         H0rY9JaWKR1cXX3fvLSq0ShpYzZaDE3D+cAgv69ihXL1/H/3sjBUuyyjEwqV42p/C+tO
         sVGeDDCyJaxIaPmIVybIAKL/M0nentNPbx8f7ubU2I6xoNARW8Rz4XCjr28tNujbbytq
         DUou40LjDpN5ISuZ+ku+9RLwyOoC78JIM4dpUJDRYrDAvoucTr2okNJ+5k/UQM3wx0sN
         8YhOb9BLSrYMWlRr6cHZLfuv5RSRvc1R9OS9sy5h1fWKVN02ddSPNpPWMpO+T4RlDNeG
         thRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718971845; x=1719576645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXUId7BgiOrJKlvj4EXPaiwGxRE3QDT7xYFFY6+6a4g=;
        b=uXycuwdLPKreP+eHtuhymPu7nK2NOkiFWO87ICnw8xr5iL5jHvGV4CW0kHR44WfTXu
         Jb7WshcW6IZ11uTprGKi/5Z5feUHCxWLy8dTUemMuIqIaly7S633cIYCkvEiKD84WT4s
         8tLHxU1FNCZMZd1bR6FnBLVTAXp7MD06+hsNwWEGzdbChqZ+vsW1ZvB8T8u/8xynZOff
         SkL65cIoje7gbZXbagVRrw3cOnPlMYwjy1drinm7V7P0viSHSD0qFbKGRuLfyl0fZkSN
         57XPyQ31K31V/MaBbT2ueRdREw3Y4+mOOkF6UGJ082uwAFl06bor0Fk2cxmlLz9iaABx
         PHOw==
X-Forwarded-Encrypted: i=1; AJvYcCVaVwdB3nG8IkcDb2mjYcrvLApmmD9DlwP9LcHmfE/AFJjkThIv+uT0k2LSL+ufQDwv6RGdyyjdGI+iyv+FmFwW0Dfwkz2sixbavKm2vDzC
X-Gm-Message-State: AOJu0YwcLbjf6l1pLuUTO4JdnNtfogfWshV4BzIAxRDXQzHAcZxh6NEf
	PfL4N3FyB8sSivko44IExR7t/JFCMEwWG7V9QRtnPgAy/dmZvb2BWMCImKFhiOgoTQoFgMFlde0
	rGkFkIZvRALGKAcfRQqSr8+w5LQsMyGHOQGAENw==
X-Google-Smtp-Source: AGHT+IE+Q+KOOE0S07ldQyv/lyyHoya7PZRDhlWazWZX8wdUbyDfKI4hFTF8xA69bxE3aHWLPp9UAq+n4zkSLmp8Cqc=
X-Received: by 2002:a05:6e02:1fc9:b0:375:c240:e7a6 with SMTP id
 e9e14a558f8ab-3761d70b3f1mr87707435ab.24.1718971845149; Fri, 21 Jun 2024
 05:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240621113143.35827-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240621113143.35827-1-cuiyunhui@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Jun 2024 17:40:34 +0530
Message-ID: <CAAhSdy2wU2NCXAJ_muYTkxxx4YECis2HWwRf55u3nuAtNBDVfA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Provide the frequency of time CSR via hwprobe
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com, evan@rivosinc.com, 
	conor.dooley@microchip.com, costa.shul@redhat.com, andy.chiu@sifive.com, 
	samitolvanen@google.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_051046_545269_F730CA93 
X-CRM114-Status: GOOD (  19.11  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgNTowM+KAr1BNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2
b3NpbmMuY29tPgo+Cj4gQSBoYW5kZnVsIG9mIHVzZXItdmlzaWJsZSBiZWhhdmlvciBpcyBiYXNl
ZCBvbiB0aGUgZnJlcXVlbmN5IG9mIHRoZQo+IHRpbWUgQ1NSLgo+Cj4gU2lnbmVkLW9mZi1ieTog
UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWXVu
aHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBE
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMiArKwo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCAgICAgIHwgMiArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2Jl
LmMgICAgICAgfCA1ICsrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3
cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gaW5kZXgg
ZmMwMTViNDUyZWJmLi5jMDdmMTU5ZDg5MDYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3
cHJvYmUucnN0Cj4gQEAgLTIyOSwzICsyMjksNSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRl
ZmluZWQ6Cj4KPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJ
WkVgOiBBbiB1bnNpZ25lZCBpbnQgd2hpY2gKPiAgICByZXByZXNlbnRzIHRoZSBzaXplIG9mIHRo
ZSBaaWNib3ogYmxvY2sgaW4gYnl0ZXMuCj4gKwo+ICsqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X0tFWV9USU1FX0NTUl9GUkVRYDogRnJlcXVlbmN5IChpbiBIeikgb2YgYG10aW1lYC4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3cHJvYmUuaAo+IGluZGV4IDYzMDUwN2RmZjVlYS4uMTUwYTk4NzdiMGFmIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPiBAQCAtOCw3ICs4LDcgQEAKPgo+ICAjaW5j
bHVkZSA8dWFwaS9hc20vaHdwcm9iZS5oPgo+Cj4gLSNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhf
S0VZIDYKPiArI2RlZmluZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgNwo+Cj4gIHN0YXRpYyBpbmxp
bmUgYm9vbCByaXNjdl9od3Byb2JlX2tleV9pc192YWxpZChfX3M2NCBrZXkpCj4gIHsKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiBpbmRleCA3Yjk1ZmFkYmVhMmEuLjE4NzU0
MzQxZmYxNCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9i
ZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+IEBAIC03
Myw2ICs3Myw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKPiAgI2RlZmluZSAgICAgICAgICAg
ICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5TVVBQT1JURUQgICAgKDQgPDwgMCkKPiAg
I2RlZmluZSAgICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfTUFTSyAgICAg
ICAgICAgKDcgPDwgMCkKPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tf
U0laRSAgICA2Cj4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfVElNRV9DU1JfRlJFUSAgICAg
ICAgNwo+ICAvKiBJbmNyZWFzZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgd2hlbiBhZGRpbmcgaXRl
bXMuICovCj4KPiAgLyogRmxhZ3MgKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiBpbmRleCA4
M2ZjYzkzOWRmNjcuLmZjM2I0MGZiOWRlZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+
IEBAIC04LDYgKzgsNyBAQAo+ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiAgI2luY2x1
ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gICNpbmNsdWRlIDxhc20vaHdwcm9iZS5oPgo+ICsjaW5j
bHVkZSA8YXNtL2RlbGF5Lmg+Cj4gICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gICNpbmNsdWRlIDxh
c20vc3dpdGNoX3RvLmg+Cj4gICNpbmNsdWRlIDxhc20vdWFjY2Vzcy5oPgo+IEBAIC0yMjYsNiAr
MjI3LDEwIEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfb25lX3BhaXIoc3RydWN0IHJpc2N2X2h3cHJv
YmUgKnBhaXIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgcGFpci0+dmFsdWUgPSByaXNjdl9j
Ym96X2Jsb2NrX3NpemU7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gKyAgICAgICBjYXNl
IFJJU0NWX0hXUFJPQkVfS0VZX1RJTUVfQ1NSX0ZSRVE6Cj4gKyAgICAgICAgICAgICAgIHBhaXIt
PnZhbHVlID0gcmlzY3ZfdGltZWJhc2U7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsKPiAg
ICAgICAgIC8qCj4gICAgICAgICAgKiBGb3IgZm9yd2FyZCBjb21wYXRpYmlsaXR5LCB1bmtub3du
IGtleXMgZG9uJ3QgZmFpbCB0aGUgd2hvbGUKPiAgICAgICAgICAqIGNhbGwsIGJ1dCBnZXQgdGhl
aXIgZWxlbWVudCBrZXkgc2V0IHRvIC0xIGFuZCB2YWx1ZSBzZXQgdG8gMAo+IC0tCj4gMi4yMC4x
Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
