Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B30DC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vj/Q+zv+Qfmw+00Wew4ppgd9AK/SwDMwBk98DflEtI8=; b=SlArzsd5jY4jga
	mpksetk9x3/S2zVXPSYH0o9S0LVNGwwxWIRXEopS2fCd6oMw+LuRg67YURGBdzoKhSbZ0OxL+kzFW
	YByJxUGI69kNH6jYfZPDWQkk4Lpa2xbbOx/4Crh3mmwn+1YaBlz2noZtBqKiRIhZb09Q+pWeT+tzE
	okOgWpHc40QskB6F9IyrUcygz08VUD+DWQq5Bjq5ccHoJyPeNkLgBscUrWEvtttCpoasZrxMeggML
	mgisox0ocFFm5ukwCwZ98I4bQ57E9yJ1072d3bpYju85wkRwsC6PQZBObjpYfianr9mM5rrP6stEz
	S/4a2EuyD46674WKwjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cY-000000022Xf-3cYc;
	Thu, 09 May 2024 16:27:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cU-000000022SX-156z
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 16:27:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso8157565ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 09:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272065; x=1715876865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gS0Jn2CNRETSxII8vxmdki1qJ+zipNSMB0uxD87mL7s=;
        b=celi4V7RmmwZEKjzMV2slq0uJcYEaSaGSP9M21KFRr9bF3jpbs++uszUr4yQ0ma4oK
         T0kcJZpZCq97RhFAcOV2nUrNRsZMuBJGfnoqP8cE3lvJkMUdIzDG8lchLICP1E+4ZkYG
         nM5/0jDqIiG+nufRdkD1D7qkevIA42ZfC4iEQ3d2q94GCEaCd8KGJuQZIUORk342lDUT
         heSlcC9ZKCwchoBperL7yzF5jEeya+Lhg/Zs8One35LXblkDby6gZk51I98xkKMxZn0+
         m/1Lp5EUzy0xA7z65wwBFFogcwo+WyEDZQA7MAE5AduAnlPtBh8TrJlct+mTx+RrJFsy
         GROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272065; x=1715876865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gS0Jn2CNRETSxII8vxmdki1qJ+zipNSMB0uxD87mL7s=;
        b=NuqnKOWewMWJYNSoFW4YZzr77sfnNa7HNI61FOeP/NKISioVLGq80/jgEo987aWJBy
         ZOZnAeEXMJ0QGilLT5rhVUKcj7FkqxsWwfTTU01no0v+xDn8JYuWBJMBX+s5j1+Vymjs
         S0k0MxkMepxXwPEW/j43A0uT2I/BwkQ4+ckZ0MqBQPQ50dqIXXRTDIn+IK2+z1LREs7c
         dI6mJvlEjJscrOKZKQ63Cr8q6EDgbqXu0T6P38GmsO1TsXT1IoQBnj/bsirE+58ypxOr
         dPgthHuBEd2cOdCafzmmO47+lNktEgyJxqvJUIzMTHOnlkKMplEpGa+bj32eMUXZLW3J
         7nrg==
X-Gm-Message-State: AOJu0YyFG/FOiuH76FKP2/JPtHCKRfvD8OVKchbKPErbI7xDkXPVgXWW
	JJlVu/L3nLJJXgS9CU5d1pEuvCR55A1zcbVSQVX9EpkRA86FmFUvarVESFlJK/s=
X-Google-Smtp-Source: AGHT+IEcfNG5b+WnhP899fciFO7zYJT6fjTvSFp0///eZQlXzATxkTOr3r8djPCFfhzo/MtEAYsIKQ==
X-Received: by 2002:a17:902:ea10:b0:1ea:2753:2b9f with SMTP id d9443c01a7336-1ef43d15560mr1959745ad.20.1715272064666;
        Thu, 09 May 2024 09:27:44 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:44 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:56 +0800
Subject: [PATCH v5 6/8] riscv: hwprobe: add zve Vector subextensions into
 hwprobe interface
MIME-Version: 1.0
Message-Id: <20240510-zve-detection-v5-6-0711bdd26c12@sifive.com>
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_092746_479138_647AD9C7 
X-CRM114-Status: GOOD (  11.16  )
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

VGhlIGZvbGxvd2luZyBWZWN0b3Igc3ViZXh0ZW5zaW9ucyBmb3IgImVtYmVkZGVkIiBwbGF0Zm9y
bXMgYXJlIGFkZGVkCmludG8gUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wOgogLSBaVkUzMlgK
IC0gWlZFMzJGCiAtIFpWRTY0WAogLSBaVkU2NEYKIC0gWlZFNjRECgpFeHRlbnNpb25zIGVuZGlu
ZyB3aXRoIGFuIFggaW5kaWNhdGVzIHRoYXQgdGhlIHBsYXRmb3JtIGRvZXNuJ3QgaGF2ZSBhCnZl
Y3RvciBGUFUuCkV4dGVuc2lvbnMgZW5kaW5nIHdpdGggRi9EIG1lYW4gdGhhdCB3aGV0aGVyIHNp
bmdsZSAoRikgb3IgZG91YmxlIChEKQpwcmVjaXNpb24gdmVjdG9yIG9wZXJhdGlvbiBpcyBzdXBw
b3J0ZWQuClRoZSBudW1iZXIgMzIgb3IgNjQgZm9sbG93cyBmcm9tIFpWRSB0ZWxscyB0aGUgbWF4
aW11bSBlbGVtZW50IGxlbmd0aC4KClNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1
QHNpZml2ZS5jb20+ClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+Ci0tLQpDaGFuZ2Vsb2cgdjU6CiAtIFJlYmFzZSB0aHVzIGFkZCBaVkUzMlggYWZ0ZXIg
UklTQ1ZfSFdQUk9CRV9FWFRfWklDT05ELgpDaGFuZ2Vsb2cgdjI6CiAtIHp2ZSogZXh0ZW5zaW9u
cyBpbiBod3Byb2JlIGRlcGVuZHMgb24gd2hldGhlciBrZXJuZWwgc3VwcG9ydHMgdiwgc28KICAg
aW5jbHVkZSB0aGVtIGFmdGVyIGhhc192ZWN0b3IoKS4gRml4IGEgdHlwby4gKENsw6ltZW50KQot
LS0KIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCAxNSArKysrKysrKysr
KysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAgNSArKysrKwog
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8ICA1ICsrKysrCiAzIGZpbGVz
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5y
c3QKaW5kZXggMjA0Y2Q0NDMzYWY1Li5mYzAxNWI0NTJlYmYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlz
Y3YvaHdwcm9iZS5yc3QKQEAgLTE5Miw2ICsxOTIsMjEgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFy
ZSBkZWZpbmVkOgogICAgICAgIHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNB
IG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdAogICAgICAgIGQ4YWI1Yzc4YzIwNyAoIlppaGlu
dHBhdXNlIGlzIHJhdGlmaWVkIikuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRf
WlZFMzJYYDogVGhlIFZlY3RvciBzdWItZXh0ZW5zaW9uIFp2ZTMyeCBpcworICAgIHN1cHBvcnRl
ZCwgYXMgZGVmaW5lZCBieSB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNp
b24gbWFudWFsLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTMyRmA6IFRo
ZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBadmUzMmYgaXMKKyAgICBzdXBwb3J0ZWQsIGFzIGRlZmlu
ZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4K
KworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkU2NFhgOiBUaGUgVmVjdG9yIHN1
Yi1leHRlbnNpb24gWnZlNjR4IGlzCisgICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVkIGJ5IHZlcnNp
b24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbiBtYW51YWwuCisKKyAgKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZFNjRGYDogVGhlIFZlY3RvciBzdWItZXh0ZW5zaW9u
IFp2ZTY0ZiBpcworICAgIHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBieSB2ZXJzaW9uIDEuMCBvZiB0
aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFsLgorCisgICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfRVhUX1pWRTY0RGA6IFRoZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBadmU2NGQgaXMK
KyAgICBzdXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBW
ZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KKwogKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlf
Q1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29udGFpbnMgcGVyZm9ybWFuY2UKICAgaW5mb3Jt
YXRpb24gYWJvdXQgdGhlIHNlbGVjdGVkIHNldCBvZiBwcm9jZXNzb3JzLgogCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCAzMWM1NzBjYmQxYzUuLjY1OTNhZWRiOWQyYiAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBAIC02MCw2ICs2MCwxMSBAQCBz
dHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNBUwkJ
KDFVTEwgPDwgMzQpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUNPTkQJKDFVTEwgPDwg
MzUpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlRQQVVTRQkoMVVMTCA8PCAzNikK
KyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWRTMyWAkoMVVMTCA8PCAzNykKKyNkZWZpbmUJ
CVJJU0NWX0hXUFJPQkVfRVhUX1pWRTMyRgkoMVVMTCA8PCAzOCkKKyNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pWRTY0WAkoMVVMTCA8PCAzOSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhU
X1pWRTY0RgkoMVVMTCA8PCA0MCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWRTY0RAko
MVVMTCA8PCA0MSkKICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKICNkZWZp
bmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOCSgwIDw8IDApCiAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJKDEgPDwgMCkKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jCmluZGV4IDk2OWVmM2Q1OWRiZS4uMzUzOTBiNGE1YTE3IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19o
d3Byb2JlLmMKQEAgLTExNCw2ICsxMTQsMTEgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0
MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJRVhUX0tFWShaSUhJTlRQQVVTRSk7CiAK
IAkJaWYgKGhhc192ZWN0b3IoKSkgeworCQkJRVhUX0tFWShaVkUzMlgpOworCQkJRVhUX0tFWSha
VkUzMkYpOworCQkJRVhUX0tFWShaVkU2NFgpOworCQkJRVhUX0tFWShaVkU2NEYpOworCQkJRVhU
X0tFWShaVkU2NEQpOwogCQkJRVhUX0tFWShaVkJCKTsKIAkJCUVYVF9LRVkoWlZCQyk7CiAJCQlF
WFRfS0VZKFpWS0IpOwoKLS0gCjIuNDQuMC5yYzIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
