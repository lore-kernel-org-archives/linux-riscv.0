Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639A8C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgiqXKcC034axXg50Y0HtV9wpRKSeAXfDLoVFgzR5n4=; b=xUbCoAKE3I/CkH
	7OkgFhjLUQpr7qGewtAsamGnkKKaM6vFHVokQybc4Nh8yBlgLqx9JkXr6KDDmeImZivmn3TtLEnWS
	YRjz99WqKiac8aFXhuulKUz+a02JwszXYcLD7Et55OC4nZOVdln5tYHOoFllPotxVOf+cChu10RA5
	hIgyoRRoMAL1dpAbcvYYDcEeKiCFeHwL4O2FWY4as3UBmxUmS+WaTFSQOC8QDXufugxlGhMV6Yxnn
	LAC478ridalAsQwG46HBNyG8DCPst4eY/KazwBheLJOElPypG7lRpDzgJbz8MJ1/faRM4wS1JrRyT
	gS7MT6BWs/dUSjyfbAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTjw-00000002o3a-1SqF;
	Thu, 18 Apr 2024 15:31:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjR-00000002cYl-2C0r
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/AvdB3u3xfYtOVc85K9gr+w0O/Mfoyuz+qydkV22p5c=; b=Xu7sqDaQAsKGTZJkfnVNbExYa2
	sCEhNogcE7RarBKb96cSoiT9kyG/SjbHGQnKR36NUEsbMfIUnmOK3pFMYmv1pfcPSOhF1B2MkZOTF
	whDZ41Z/T2njXnbPTnJYVjjPC26D2JM3tYYE7TDOtu1CHnwa47cIxvlHkwTIW2f0n38oJ0trCanCm
	XXHE+cdZMxid5EB5eUEJ9EV6yjaiqbnb3O0A3JBs+fUtcvNi7EUzodfoUWnznCOo6f7xUAEM6B7j4
	yVFRVFUxwqc1v1ybAQOWc+J6wJf6AdS0GXHBlZ3wHRrSG4J8alWyBWb1+X2A9DfXJzpx3Z6N+kT/y
	QaXJ3iuw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjN-0000000C2Pa-0NVd
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:27:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-346407b8c9aso257200f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713450435; x=1714055235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AvdB3u3xfYtOVc85K9gr+w0O/Mfoyuz+qydkV22p5c=;
        b=PM/u6q1OdFkCQf1GXofsvfbkVOWm1kQ62dllCGZBAX+0rpD7iRejofC+vqE/Mk+EUs
         cgTEzo7TOnZDLGDmuT709BoNy2rcFWh3QOhMGROQY2Pt1aB6/b1QE1AG/wkV3vgYUpj7
         y9URkYPQFwE7UOwWWVrX2k8chjUD3L7+0El9jhAMJuZTlM2P5+5UnUbcDSfm7/BUXypu
         HMtEcH3baPbXC13ZCtvrsPdqMyZyHHpKwTcSSQYYjQRiEiOvJVQ5mFwnbDUrZHjnti4B
         dkPSi77vlk9agW2TJpOO9y9KZ6vWyyWgYKpnQmdO0yHiL951gJoFRtYkjoUXkf+NQw7K
         RrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450435; x=1714055235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AvdB3u3xfYtOVc85K9gr+w0O/Mfoyuz+qydkV22p5c=;
        b=g7Fa7GuygYUzq4+2BOc88ME2eNuNsl7MU/QiSIvGd/ettehug2HNlSPZvxQgh13ZAJ
         1LP5TzOdOlrPDs/O+x5/IHCB8iD02Krq12PVQAblWjBekYuu2tccDCWX1p1xVcJY6vKo
         jfaY3rOILmYoKiCj0gdUFhy+4PlFyTjfmOkaikPzdLb4Jsspz1Lr4z+++F2Sym1D3NsB
         aiJHG4e1+C5jXJtAKiNvghRaHC3JucUB5zkZ/McTV4BpCpOh0d70xjkluldO0vnCtWl5
         G+cPxRRLxqy66irg2NZWkjAdbiHiwy7+GFmcFlUMhjFYxVtMOrkVaeqeARrbk+5y7c1Z
         oouw==
X-Forwarded-Encrypted: i=1; AJvYcCXXhRxCBCCE24Tqq9f77C0UDYLTPhIyBKbqHPBGQQEziO5qfTVT96qqLYKIBjjYzS6IBTzZ81lLVjAsLWMfeEAosufQAHpd9HYDb6DNArLZ
X-Gm-Message-State: AOJu0Yz/ETJz6YWqGg7cvVI4HeKfXxO9DcFIeZavLR411xB0n120Mkbd
	bRIAizdiWyhypDIEngM/12+49PMky9Yyp1VfEm0N5Q6JcOskYmXsiw8uMuU/wh2PIQ1MtkQFjTz
	6haw=
X-Google-Smtp-Source: AGHT+IEwlQ04KaJP3EVY+XCohGbQqha8fE09E68ZNltKaQxFJ4YDXOPGuVd4fVf/pEkQ78VT8bcTuA==
X-Received: by 2002:a05:600c:35ca:b0:418:9941:ca28 with SMTP id r10-20020a05600c35ca00b004189941ca28mr2125666wmq.2.1713450435180;
        Thu, 18 Apr 2024 07:27:15 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm2873645wmo.42.2024.04.18.07.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:27:14 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Ved Shanbhogue <ved@rivosinc.com>
Subject: [RFC PATCH 5/7] riscv: add double trap driver
Date: Thu, 18 Apr 2024 16:26:44 +0200
Message-ID: <20240418142701.1493091-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418142701.1493091-1-cleger@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_152718_047130_63EA020F 
X-CRM114-Status: GOOD (  18.99  )
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

QWRkIGEgc21hbGwgZHJpdmVyIHRvIHJlcXVlc3QgZG91YmxlIHRyYXAgZW5hYmxpbmcgYXMgd2Vs
bCBhcwpyZWdpc3RlcmluZyBhIFNTRSBoYW5kbGVyIGZvciBkb3VibGUgdHJhcC4gVGhpcyB3aWxs
IGFsc28gYmUgdXNlZCBieSBLVk0KU0JJIEZXRlQgZXh0ZW5zaW9uIHN1cHBvcnQgdG8gZGV0ZWN0
IGlmIGl0IGlzIHBvc3NpYmxlIHRvIGVuYWJsZSBkb3VibGUKdHJhcCBpbiBWUy1tb2RlLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggICAgfCAgMSArCiBkcml2ZXJzL2Zpcm13YXJlL0tj
b25maWcgICAgICAgIHwgIDcgKysrCiBkcml2ZXJzL2Zpcm13YXJlL01ha2VmaWxlICAgICAgIHwg
IDEgKwogZHJpdmVycy9maXJtd2FyZS9yaXNjdl9kYmx0cnAuYyB8IDk1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9yaXNjdl9kYmx0cnAuaCAgICB8IDE5
ICsrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMTIzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2X2RibHRycC5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9saW51eC9yaXNjdl9kYmx0cnAuaAoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IDc0
NGFhMTc5NmM5Mi4uOWNkNGNhNjY0ODdjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAgLTMxNCw2ICsz
MTQsNyBAQCBlbnVtIHNiaV9zc2VfYXR0cl9pZCB7CiAjZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRF
UlJVUFRFRF9GTEFHU19TUElFCSgxIDw8IDIpCiAKICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NB
TF9SQVMJCTB4MDAwMDAwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9ET1VCTEVfVFJB
UAkweDAwMDAwMDAxCiAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX1JBUwkweDAwMDA4MDAw
CiAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUE1VCQkweDAwMDEwMDAwCiAjZGVmaW5lIFNC
SV9TU0VfRVZFTlRfTE9DQUxfU09GVFdBUkUJMHhmZmZmMDAwMApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9maXJtd2FyZS9LY29uZmlnIGIvZHJpdmVycy9maXJtd2FyZS9LY29uZmlnCmluZGV4IDU5ZjYx
MTI4ODgwNy4uYTAzN2Y2ZTg5OTQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Zpcm13YXJlL0tjb25m
aWcKKysrIGIvZHJpdmVycy9maXJtd2FyZS9LY29uZmlnCkBAIC0xOTcsNiArMTk3LDEzIEBAIGNv
bmZpZyBSSVNDVl9TU0VfVEVTVAogCSAgU2VsZWN0IGlmIHlvdSB3YW50IHRvIGVuYWJsZSBTU0Ug
ZXh0ZW5zaW9uIHRlc3RpbmcgYXQgYm9vdCB0aW1lLgogCSAgVGhpcyB3aWxsIHJ1biBhIHNlcmll
cyBvZiB0ZXN0IHdoaWNoIHZlcmlmaWVzIFNTRSBzYW5pdHkuCiAKK2NvbmZpZyBSSVNDVl9EQkxU
UlAKKwlib29sICJFbmFibGUgRG91YmxlIHRyYXAgaGFuZGxpbmciCisJZGVwZW5kcyBvbiBSSVND
Vl9TU0UgJiYgUklTQ1ZfU0JJCisJZGVmYXVsdCBuCisJaGVscAorCSAgU2VsZWN0IGlmIHlvdSB3
YW50IHRvIGVuYWJsZSBTU0UgZG91YmxlIHRyYXAgaGFuZGxlci4KKwogY29uZmlnIFNZU0ZCCiAJ
Ym9vbAogCXNlbGVjdCBCT09UX1ZFU0FfU1VQUE9SVApkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJt
d2FyZS9NYWtlZmlsZSBiL2RyaXZlcnMvZmlybXdhcmUvTWFrZWZpbGUKaW5kZXggZmI3YjBjMDhj
NTZkLi5hZDY3YTE3MzhjMGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZmlybXdhcmUvTWFrZWZpbGUK
KysrIGIvZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZQpAQCAtMTgsNiArMTgsNyBAQCBvYmotJChD
T05GSUdfUkFTUEJFUlJZUElfRklSTVdBUkUpICs9IHJhc3BiZXJyeXBpLm8KIG9iai0kKENPTkZJ
R19GV19DRkdfU1lTRlMpCSs9IHFlbXVfZndfY2ZnLm8KIG9iai0kKENPTkZJR19SSVNDVl9TU0Up
CQkrPSByaXNjdl9zc2Uubwogb2JqLSQoQ09ORklHX1JJU0NWX1NTRV9URVNUKQkrPSByaXNjdl9z
c2VfdGVzdC5vCitvYmotJChDT05GSUdfUklTQ1ZfREJMVFJQKQkrPSByaXNjdl9kYmx0cnAubwog
b2JqLSQoQ09ORklHX1NZU0ZCKQkJKz0gc3lzZmIubwogb2JqLSQoQ09ORklHX1NZU0ZCX1NJTVBM
RUZCKQkrPSBzeXNmYl9zaW1wbGVmYi5vCiBvYmotJChDT05GSUdfVElfU0NJX1BST1RPQ09MKQkr
PSB0aV9zY2kubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdl9kYmx0cnAuYyBi
L2RyaXZlcnMvZmlybXdhcmUvcmlzY3ZfZGJsdHJwLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi43MmY5YTA2N2U4N2EKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJz
L2Zpcm13YXJlL3Jpc2N2X2RibHRycC5jCkBAIC0wLDAgKzEsOTUgQEAKKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKKy8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMjMgUml2
b3MgSW5jLgorICovCisKKyNkZWZpbmUgcHJfZm10KGZtdCkgInJpc2N2LWRibHRycDogIiBmbXQK
KworI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgorI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KKyNpbmNs
dWRlIDxsaW51eC9yaXNjdl9kYmx0cnAuaD4KKyNpbmNsdWRlIDxsaW51eC9yaXNjdl9zc2UuaD4K
KworI2luY2x1ZGUgPGFzbS9zYmkuaD4KKworc3RhdGljIGJvb2wgZG91YmxlX3RyYXBfZW5hYmxl
ZDsKKworc3RhdGljIGludCByaXNjdl9zc2VfZGJsdHJwX2hhbmRsZSh1aW50MzJfdCBldnQsIHZv
aWQgKmFyZywKKwkJCQkgICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwlfX3Nob3dfcmVncyhy
ZWdzKTsKKwlwYW5pYygiRG91YmxlIHRyYXAgIVxuIik7CisKKwlyZXR1cm4gMDsKK30KKworc3Ry
dWN0IGNwdV9kYmx0cnBfZGF0YSB7CisJaW50IGVycm9yOworfTsKKworc3RhdGljIHZvaWQKK3Ni
aV9jcHVfZW5hYmxlX2RvdWJsZV90cmFwKHZvaWQgKmRhdGEpCit7CisJc3RydWN0IHNiaXJldCBy
ZXQ7CisJc3RydWN0IGNwdV9kYmx0cnBfZGF0YSAqY2RkID0gZGF0YTsKKworCXJldCA9IHNiaV9l
Y2FsbChTQklfRVhUX0ZXRlQsIFNCSV9FWFRfRldGVF9TRVQsCisJCQlTQklfRldGVF9ET1VCTEVf
VFJBUF9FTkFCTEUsIDEsIDAsIDAsIDAsIDApOworCisJaWYgKHJldC5lcnJvcikgeworCQljZGQt
PmVycm9yID0gMTsKKwkJcHJfZXJyKCJGYWlsZWQgdG8gZW5hYmxlIGRvdWJsZSB0cmFwIG9uIGNw
dSAlZFxuIiwgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKKwl9Cit9CisKK3N0YXRpYyBpbnQgc2JpX2Vu
YWJsZV9kb3VibGVfdHJhcCh2b2lkKQoreworCXN0cnVjdCBjcHVfZGJsdHJwX2RhdGEgY2RkID0g
ezB9OworCisJb25fZWFjaF9jcHUoc2JpX2NwdV9lbmFibGVfZG91YmxlX3RyYXAsICZjZGQsIDEp
OworCWlmIChjZGQuZXJyb3IpCisJCXJldHVybiAtMTsKKworCWRvdWJsZV90cmFwX2VuYWJsZWQg
PSB0cnVlOworCisJcmV0dXJuIDA7Cit9CisKK2Jvb2wgcmlzY3ZfZG91YmxlX3RyYXBfZW5hYmxl
ZCh2b2lkKQoreworCXJldHVybiBkb3VibGVfdHJhcF9lbmFibGVkOworfQorRVhQT1JUX1NZTUJP
TChyaXNjdl9kb3VibGVfdHJhcF9lbmFibGVkKTsKKworc3RhdGljIGludCBfX2luaXQgcmlzY3Zf
ZGJsdHJwKHZvaWQpCit7CisJc3RydWN0IHNzZV9ldmVudCAqZXZ0OworCisJaWYgKCFyaXNjdl9o
YXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfU1NEQkxUUlApKSB7CisJCXByX2Vy
cigiU3NkYmx0cnAgZXh0ZW5zaW9uIG5vdCBhdmFpbGFibGVcbiIpOworCQlyZXR1cm4gMTsKKwl9
CisKKwlpZiAoIXNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9GV0ZUKSkgeworCQlwcl9lcnIo
IkNhbiBub3QgZW5hYmxlIGRvdWJsZSB0cmFwLCBTQklfRVhUX0ZXRlQgaXMgbm90IGF2YWlsYWJs
ZVxuIik7CisJCXJldHVybiAxOworCX0KKworCWlmIChzYmlfZW5hYmxlX2RvdWJsZV90cmFwKCkp
IHsKKwkJcHJfZXJyKCJGYWlsZWQgdG8gZW5hYmxlIGRvdWJsZSB0cmFwIG9uIGFsbCBjcHVzXG4i
KTsKKwkJcmV0dXJuIDE7CisJfQorCisJZXZ0ID0gc3NlX2V2ZW50X3JlZ2lzdGVyKFNCSV9TU0Vf
RVZFTlRfTE9DQUxfRE9VQkxFX1RSQVAsIDAsCisJCQkJIHJpc2N2X3NzZV9kYmx0cnBfaGFuZGxl
LCBOVUxMKTsKKwlpZiAoSVNfRVJSKGV2dCkpIHsKKwkJcHJfZXJyKCJTU0UgZG91YmxlIHRyYXAg
cmVnaXN0ZXIgZmFpbGVkXG4iKTsKKwkJcmV0dXJuIFBUUl9FUlIoZXZ0KTsKKwl9CisKKwlzc2Vf
ZXZlbnRfZW5hYmxlKGV2dCk7CisJcHJfaW5mbygiRG91YmxlIHRyYXAgaGFuZGxpbmcgcmVnaXN0
ZXJlZFxuIik7CisKKwlyZXR1cm4gMDsKK30KK2RldmljZV9pbml0Y2FsbChyaXNjdl9kYmx0cnAp
OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9yaXNjdl9kYmx0cnAuaCBiL2luY2x1ZGUvbGlu
dXgvcmlzY3ZfZGJsdHJwLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAw
Li42ZGU0ZjQzZmFlNmIKLS0tIC9kZXYvbnVsbAorKysgYi9pbmNsdWRlL2xpbnV4L3Jpc2N2X2Ri
bHRycC5oCkBAIC0wLDAgKzEsMTkgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wICovCisvKgorICogQ29weXJpZ2h0IChDKSAyMDIzIFJpdm9zIEluYy4KKyAqLworCisjaWZu
ZGVmIF9fTElOVVhfUklTQ1ZfREJMVFJQX0gKKyNkZWZpbmUgX19MSU5VWF9SSVNDVl9EQkxUUlBf
SAorCisjaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfREJMVFJQKQorYm9vbCByaXNjdl9kb3VibGVf
dHJhcF9lbmFibGVkKHZvaWQpOworI2Vsc2UKKworc3RhdGljIGlubGluZSBib29sIHJpc2N2X2Rv
dWJsZV90cmFwX2VuYWJsZWQodm9pZCkKK3sKKwlyZXR1cm4gZmFsc2U7Cit9CisjZW5kaWYKKwor
I2VuZGlmIC8qIF9fTElOVVhfUklTQ1ZfREJMVFJQX0ggKi8KLS0gCjIuNDMuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
