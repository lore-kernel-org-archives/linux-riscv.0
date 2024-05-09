Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2CCC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZu5+hCQuEYWExpWO91vERPDcCnTUJWIsqfdzodImTE=; b=bXJ18z106G9CgF
	Ats5PlRn8VwrlfP8+r5oT6+/zJJjHLKwZ6Ucdte5Okk3JU5s9q2/n38AuJ3def+SacNd2YK8YjwuV
	3PwSdJ70wO/xvqAQU13VvTrQ15utWQ6IyKKo5JWhKdcnZIGeCZr9UUz1hCDAXhrZ6qDo3/B/l5R13
	9Dandfo3SmPdx6kNl2dzSzLqFaVjHUUo/qQQnpMmvmNWeVqsjFCJUPOdPQnfIxbm4oVSOvp/tjd60
	TSFZSORNNaWycv7edDChJYCe6tNFPvalDe+iyeIEDZLeta1t04n29qAnUafdrOkUWZPu1jON0BWh4
	gI3iX2w+r8XuA8BIQS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cT-000000022T7-3CWJ;
	Thu, 09 May 2024 16:27:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cP-000000022PS-2bNz
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 16:27:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ec486198b6so8471495ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 09:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272061; x=1715876861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNkHbY9oNilft+2PQdFQmYDad5FfREv7NAdRkMrTsLg=;
        b=gCAtc8BkcqR0HbSETgQiREjuzxzoIJGUOUS7KdRpNhViQ5i8XlebyTR8pZODdpK7Pz
         Coh42wdhMY1YJh41HuEEmSO0AxC2oRVby42Nn9j6QiFMIzCJt3I1uEh3MSkahxdkmJtP
         Ykq+4QXS+BH+NKi1NCg5/IDQZYlGVTZuoyW1YKwtYE3CMENBHhz7Qusv+jSye8qqsaVx
         QFOe48bdpFQGqBVecNWjtUxgYxeaM86HUBbLHrXj2NS9NkddUoD2ckuOcp45C4ynXyX2
         7B4dJvWypjDaO/+aUjU2BlJ12k3uOWSiH/Xkp4UJmd6px02twC0vTHga9KQ3JAKeAnOw
         d8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272061; x=1715876861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNkHbY9oNilft+2PQdFQmYDad5FfREv7NAdRkMrTsLg=;
        b=ApqpgLi1TpHFC2vThekT0AtdUfu+a0YhMYBLMppRM7bi/CA/AQWSPuHNoou4HuZ6S5
         qIJiV9BcCo4XKHB74ukAWY7kXD2wItqlf26re54IlFvrGmvVm+Pry1I4RyNJ9BPu1W3L
         ArKmA+D5D9UKBQMA4J5snyh+KbIMBdgOv0Uz1p2JXwk9rgIMtCEEdBxKKVTjZK/VGNad
         gHn5DXdsrN5TbWTINX47c7PhPE8l+/C6s0GOan5YvHnGbV0UjPv5LdPs3yT9RW3rVxb/
         IlspMZom9qwCCiKoX/HVOBVKHVb3yYuCx7kBfUR8QX3cjKm+TFV3Omeut6lWWcgz0dlC
         +veQ==
X-Gm-Message-State: AOJu0Yzzlah8a4g6kOzi5rwL46POoO+eCplAcHQHc6f4oBIw9GsKCP7s
	VHpAiQd3QU1v4fEoOpik2ai0AeOiEOzVlXmiRn5TgkqZubJ+38rtl08QloXWyLM=
X-Google-Smtp-Source: AGHT+IGUu1uPaO5nrqJvbHdXDLkvUWrWrbX5e2xStsjIzWenVBJGkFP5i2uTWH7PLE8vnnAsdqvMPA==
X-Received: by 2002:a17:903:110f:b0:1ea:b125:81a2 with SMTP id d9443c01a7336-1ef44161e50mr1676745ad.53.1715272061063;
        Thu, 09 May 2024 09:27:41 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:40 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:55 +0800
Subject: [PATCH v5 5/8] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa
 detection
MIME-Version: 1.0
Message-Id: <20240510-zve-detection-v5-5-0711bdd26c12@sifive.com>
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
X-CRM114-CacheID: sfid-20240509_092741_705034_8646D2FB 
X-CRM114-Status: GOOD (  14.49  )
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

TXVsdGlwbGUgVmVjdG9yIHN1YmV4dGVuc2lvbnMgYXJlIGFkZGVkLiBBbHNvLCB0aGUgcGF0Y2gg
dGFrZXMgY2FyZSBvZgp0aGUgZGVwZW5kZW5jaWVzIG9mIFZlY3RvciBzdWJleHRlbnNpb25zIGJ5
IG1hY3JvIGV4cGFuc2lvbnMuIFNvLCBpZgpzb21lICJlbWJlZGRlZCIgcGxhdGZvcm0gb25seSBy
ZXBvcnRzICJ6dmU2NGYiIG9uIHRoZSBJU0Egc3RyaW5nLCB0aGUKcGFyc2VyIGlzIGFibGUgdG8g
ZXhwYW5kIGl0IHRvIHp2ZTMyeCB6dmUzMmYgenZlNjR4IGFuZCB6dmU2NGYuCgpTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgpSZXZpZXdlZC1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KLS0tCkNoYW5nZWxvZyB2NToKIC0g
UmVtb3ZlIFpWRTMyRl9JTVBMWV9MSVNUIGFzIFpWRTMyRiBvbmx5IGltcGxpZXMgWlZFMzJYIChD
b25vcikKIC0gQWRkIGEgbGlzdCBmb3IgViBhcyBpdCB0aGUgaW1wbHkgbGlzdCBmb3IgWlZFNjRE
IGRvZXMgbm90IGluY2x1ZGUKICAgWlZFNjRELgpDaGFuZ2Vsb2cgdjM6CiAtIHJlbnVtYmVyIFJJ
U0NWX0lTQV9FWFRfWlZFKiB0byByZWJhc2Ugb24gdG9wIG9mIDYuOQogLSBhbHBoYWJldGljYWxs
eSBzb3J0IGFkZGVkIGV4dGVuc2lvbnMgKENsw6ltZW50KQpDaGFuZ2Vsb2cgdjI6CiAtIHJlbW92
ZSB0aGUgZXh0ZW5zaW9uIGl0c2VsZiBmcm9tIGl0cyBpc2FfZXh0c1tdIGxpc3QgKENsw6ltZW50
KQogLSB1c2UgcmlzY3ZfenZlNjRkX2V4dHMgZm9yIHYncyBleHRlbnNpb24gbGlzdCAoU2FtdWVs
KQotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8ICA1ICsrKysrCiBhcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IGUxN2QwMDc4YTY1MS4uZjY0ZDRlOThl
NjdjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC04MSw2ICs4MSwxMSBAQAogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pUU08JCTcyCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFDQVMJCTczCiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWEFOREVTUE1VCQk3NAorI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1pWRTMyWAkJNzUKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkUzMkYJCTc2CisjZGVmaW5lIFJJ
U0NWX0lTQV9FWFRfWlZFNjRYCQk3NworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0RgkJNzgK
KyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NEQJCTc5CiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9YTElOVVhFTlZDRkcJMTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCA0YmZjMTMyMDk5
MzguLmFkM2U2MTNlZTMwZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMTg4LDYgKzE4OCw0
MCBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2YmJfZXh0c1tdID0gewogCVJJ
U0NWX0lTQV9FWFRfWlZLQgogfTsKIAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0Rl9JTVBM
WV9MSVNUCVwKKwlSSVNDVl9JU0FfRVhUX1pWRTY0WCwJCVwKKwlSSVNDVl9JU0FfRVhUX1pWRTMy
RiwJCVwKKwlSSVNDVl9JU0FfRVhUX1pWRTMyWAorCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZF
NjREX0lNUExZX0xJU1QJXAorCVJJU0NWX0lTQV9FWFRfWlZFNjRGLAkJXAorCVJJU0NWX0lTQV9F
WFRfWlZFNjRGX0lNUExZX0xJU1QKKworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1ZfSU1QTFlfTElT
VAlcCisJUklTQ1ZfSVNBX0VYVF9aVkU2NEQsCQlcCisJUklTQ1ZfSVNBX0VYVF9aVkU2NERfSU1Q
TFlfTElTVAorCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2ZTMyZl9leHRzW10g
PSB7CisJUklTQ1ZfSVNBX0VYVF9aVkUzMlgKK307CisKK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBp
bnQgcmlzY3ZfenZlNjRmX2V4dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhUX1pWRTY0Rl9JTVBMWV9M
SVNUCit9OworCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2ZTY0ZF9leHRzW10g
PSB7CisJUklTQ1ZfSVNBX0VYVF9aVkU2NERfSU1QTFlfTElTVAorfTsKKworc3RhdGljIGNvbnN0
IHVuc2lnbmVkIGludCByaXNjdl92X2V4dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhUX1ZfSU1QTFlf
TElTVAorfTsKKworc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmU2NHhfZXh0c1td
ID0geworCVJJU0NWX0lTQV9FWFRfWlZFMzJYLAorCVJJU0NWX0lTQV9FWFRfWlZFNjRYCit9Owor
CiAvKgogICogV2hpbGUgdGhlIFttc11lbnZjZmcgQ1NScyB3ZXJlIG5vdCBkZWZpbmVkIHVudGls
IHZlcnNpb24gMS4xMiBvZiB0aGUgUklTQy1WCiAgKiBwcml2aWxlZ2VkIElTQSwgdGhlIGV4aXN0
ZW5jZSBvZiB0aGUgQ1NScyBpcyBpbXBsaWVkIGJ5IGFueSBleHRlbnNpb24gd2hpY2gKQEAgLTI0
NSw3ICsyNzksNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9l
eHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShkLCBSSVNDVl9JU0FfRVhUX2QpLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHEsIFJJU0NWX0lTQV9FWFRfcSksCiAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoYywgUklTQ1ZfSVNBX0VYVF9jKSwKLQlfX1JJU0NWX0lTQV9FWFRfREFUQSh2LCBSSVND
Vl9JU0FfRVhUX3YpLAorCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh2LCBSSVNDVl9JU0FfRVhU
X3YsIHJpc2N2X3ZfZXh0cyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoaCwgUklTQ1ZfSVNBX0VY
VF9oKSwKIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoemljYm9tLCBSSVNDVl9JU0FfRVhUX1pJ
Q0JPTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNF
VCh6aWNib3osIFJJU0NWX0lTQV9FWFRfWklDQk9aLCByaXNjdl94bGludXhlbnZjZmdfZXh0cyks
CkBAIC0yODAsNiArMzE0LDExIEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlz
Y3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp0c28sIFJJU0NWX0lTQV9F
WFRfWlRTTyksCiAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHp2YmIsIFJJU0NWX0lTQV9FWFRf
WlZCQiwgcmlzY3ZfenZiYl9leHRzKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJjLCBSSVND
Vl9JU0FfRVhUX1pWQkMpLAorCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmUzMmYsIFJJU0NW
X0lTQV9FWFRfWlZFMzJGLCByaXNjdl96dmUzMmZfZXh0cyksCisJX19SSVNDVl9JU0FfRVhUX0RB
VEEoenZlMzJ4LCBSSVNDVl9JU0FfRVhUX1pWRTMyWCksCisJX19SSVNDVl9JU0FfRVhUX1NVUEVS
U0VUKHp2ZTY0ZCwgUklTQ1ZfSVNBX0VYVF9aVkU2NEQsIHJpc2N2X3p2ZTY0ZF9leHRzKSwKKwlf
X1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlNjRmLCBSSVNDVl9JU0FfRVhUX1pWRTY0Riwgcmlz
Y3ZfenZlNjRmX2V4dHMpLAorCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NHgsIFJJU0NW
X0lTQV9FWFRfWlZFNjRYLCByaXNjdl96dmU2NHhfZXh0cyksCiAJX19SSVNDVl9JU0FfRVhUX0RB
VEEoenZmaCwgUklTQ1ZfSVNBX0VYVF9aVkZIKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmZo
bWluLCBSSVNDVl9JU0FfRVhUX1pWRkhNSU4pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2Is
IFJJU0NWX0lTQV9FWFRfWlZLQiksCgotLSAKMi40NC4wLnJjMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
