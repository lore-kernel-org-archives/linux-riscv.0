Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39D3C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMpmSKobOm2ran08LrL+Tv+yRdyFWZDDnCTGIJE0BRM=; b=plYxl0IuSFaAJa
	3ERoWvH5lWCj+r+3jhlwwbraobh7zyt7q8atpzq55/uCy2zAC12R75rDow1kvy/yp3njiJTwbk09q
	ekmxY4vw12rU/qQbdZOZv2bUDkiutuHQCc04loXMZLWM3HEndC1yhKlp8JBqNDnc/Ac0290yxJwrT
	Kdp0d6+Udyi9br0AZAhFNBw5sdqjat3focVfBuj6UndWAYgeSeWL+GxGjhDex06i22lhv+XrnH+s0
	Ixe+wBGIaJUpgD3Lg93XUUQDIXJkRGZPc7SePb87xQNqVoH6WuHfot/WJG9Itz1V6Fr1Flq3bE9Mf
	F095XRtCoUmkz+4Emq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2O-0000000Ed2a-4BHI;
	Thu, 14 Mar 2024 14:26:29 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2L-0000000Eczu-2YF7
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:26:27 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso284882b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710426383; x=1711031183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNstRg6daczAXrALw7Zi6GYP2+HGLqW/5dmPLPDSUJY=;
        b=njTg6ZIZM30iuJNtCXreI0C47JhYACAv0vECvtKHDTeZ4MyYK0dLZWXJ8FS2dEyMiB
         b1Y1Qlc15aIn0N+6I0Mh9QYC+NEh6/OW9c3bgerBGauKZArmIE+53TQO6MqtaNCPTkLi
         NaZZoJktIPVPGHnAh5o53q0VM/TyrCzuZo8DwKmiuLjAEf4+TzM3bURNSCbxXw721g09
         E5d2UMsqVpk1Q/KsxtLgFDcwbWNYDhAu2Wxx+eHRMgE5DQCZAqTZVn759ckBP96aArRv
         n3LaUWxW9MKEltTIIHw7HId0xiwOqMwqjX2YbpSI3Bv6TPfX+8jIlA3dsBecFtRRvtIH
         NSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426383; x=1711031183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNstRg6daczAXrALw7Zi6GYP2+HGLqW/5dmPLPDSUJY=;
        b=DF7GHfVs4FLQHcJk+GaLsk1wWCCnvcitwlIa/Z6CYUgneMoTrWV5GGhFvw1eIAY/S1
         GCbpUrGHf1uvbUVMXAYryp7HhGs6VdEhGp7n8wagANGZIMnTWtccoeo+5vo4AaAjITAI
         j/B6a7fH//CrDwm3u8vvyKwn1jRWxZTT8aIcTFoEtCdgvuqAGQ10iiV/21a6NaPItNxH
         Fep22wWoIcVeBqlywBypeLPkLvDeVvO5QzxckpPSLr5cPL16A5ENy6GVXHU0yyXoldpI
         xNVCGZveYZ4eILwH94N10Bga5Lkx6QjRUUA2Irm7qTB20AzzUwF8kVF8Y4WkpVrrdDLx
         y/lA==
X-Gm-Message-State: AOJu0YypFb+EHvqrk4UmQ9dfwZhZl1JSmje3pMLz3jtAoBJh8UvOk37/
	fEEw3JDYJ/nf3ex+KLhCuhKblaeMFCkg4E4YCjNs6jeD612uYAsx47pjWLQJkKBWwk4b8nzWIfQ
	aeTP+MacRjlCNW5FafnI/QR55Z1VanWve09TWeqyH1NvqD3Teo6OLMbe2zangYd7AtGK/ZlRqOo
	N0bwd8jr1+RH24We5Y1WWVuNI1AT2KvgkBBxjtUNbWGYyDZiE57fqr
X-Google-Smtp-Source: AGHT+IHCOBS+cXi7w9ic2iD6x5GoItCXB4+H5HlhuhP/fax9v+yBM5aNMDIglPLe+3Txu8Gb4LL+kA==
X-Received: by 2002:a05:6a00:3cc5:b0:6e6:30ef:b7e9 with SMTP id ln5-20020a056a003cc500b006e630efb7e9mr2995239pfb.16.1710426382983;
        Thu, 14 Mar 2024 07:26:22 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y9-20020a62f249000000b006e6854d45afsm1556435pfl.97.2024.03.14.07.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:26:22 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [v2, 4/7] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
Date: Thu, 14 Mar 2024 22:25:39 +0800
Message-Id: <20240314142542.19957-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240314142542.19957-1-andy.chiu@sifive.com>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072625_836138_0AB1717E 
X-CRM114-Status: GOOD (  12.34  )
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
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgotLS0KQ2hhbmdlbG9nIHYyOgog
LSByZW1vdmUgdGhlIGV4dGVuc2lvbiBpdHNlbGYgZnJvbSBpdHMgaXNhX2V4dHNbXSBsaXN0IChD
bMOpbWVudCkKIC0gdXNlIHJpc2N2X3p2ZTY0ZF9leHRzIGZvciB2J3MgZXh0ZW5zaW9uIGxpc3Qg
KFNhbXVlbCkKLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAgNSArKysrKwog
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IDUzNDBmODE4NzQ2Yi4uMjRlZmVhNDRm
MWFiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC04MCw2ICs4MCwxMSBAQAogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pGQQkJNzEKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVFNPCQk3MgogI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1pBQ0FTCQk3MworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTMy
WAkJNzQKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkUzMkYJCTc1CisjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfWlZFNjRYCQk3NgorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0RgkJNzcKKyNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9aVkU2NEQJCTc4CiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9NQVgJ
CTEyOAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX0lOVkFMSUQJCVUzMl9NQVgKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYwppbmRleCBkODM2MjQxYTFmMTEuLmRkYWMyNWE1ZmUzZSAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYwpAQCAtMjAxLDYgKzIwMSwzNSBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJp
c2N2X3p2YmJfZXh0c1tdID0gewogCVJJU0NWX0lTQV9FWFRfWlZLQgogfTsKIAorI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pWRTMyRl9JTVBMWV9MSVNUCVwKKwlSSVNDVl9JU0FfRVhUX1pWRTMyWCwK
KworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0Rl9JTVBMWV9MSVNUCVwKKwlSSVNDVl9JU0Ff
RVhUX1pWRTY0WCwJCVwKKwlSSVNDVl9JU0FfRVhUX1pWRTMyRiwJCVwKKwlSSVNDVl9JU0FfRVhU
X1pWRTMyRl9JTVBMWV9MSVNUCisKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NERfSU1QTFlf
TElTVAlcCisJUklTQ1ZfSVNBX0VYVF9aVkU2NEYsCQlcCisJUklTQ1ZfSVNBX0VYVF9aVkU2NEZf
SU1QTFlfTElTVAorCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2ZTMyZl9leHRz
W10gPSB7CisJUklTQ1ZfSVNBX0VYVF9aVkUzMkZfSU1QTFlfTElTVAorfTsKKworc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCByaXNjdl96dmU2NGZfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRf
WlZFNjRGX0lNUExZX0xJU1QKK307CisKK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3Zf
enZlNjRkX2V4dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhUX1pWRTY0RF9JTVBMWV9MSVNUCit9Owor
CitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2ZTY0eF9leHRzW10gPSB7CisJUklT
Q1ZfSVNBX0VYVF9aVkUzMlgsCisJUklTQ1ZfSVNBX0VYVF9aVkU2NFgKK307CisKIC8qCiAgKiBU
aGUgY2Fub25pY2FsIG9yZGVyIG9mIElTQSBleHRlbnNpb24gbmFtZXMgaW4gdGhlIElTQSBzdHJp
bmcgaXMgZGVmaW5lZCBpbgogICogY2hhcHRlciAyNyBvZiB0aGUgdW5wcml2aWxlZ2VkIHNwZWNp
ZmljYXRpb24uCkBAIC0yNDgsNyArMjc3LDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRf
ZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoZCwgUklTQ1Zf
SVNBX0VYVF9kKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShxLCBSSVNDVl9JU0FfRVhUX3EpLAog
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKGMsIFJJU0NWX0lTQV9FWFRfYyksCi0JX19SSVNDVl9JU0Ff
RVhUX0RBVEEodiwgUklTQ1ZfSVNBX0VYVF92KSwKKwlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQo
diwgUklTQ1ZfSVNBX0VYVF92LCByaXNjdl96dmU2NGRfZXh0cyksCiAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoaCwgUklTQ1ZfSVNBX0VYVF9oKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNib20s
IFJJU0NWX0lTQV9FWFRfWklDQk9NKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNib3osIFJJ
U0NWX0lTQV9FWFRfWklDQk9aKSwKQEAgLTI4Myw2ICszMTIsMTEgQEAgY29uc3Qgc3RydWN0IHJp
c2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RB
VEEoenRzbywgUklTQ1ZfSVNBX0VYVF9aVFNPKSwKIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQo
enZiYiwgUklTQ1ZfSVNBX0VYVF9aVkJCLCByaXNjdl96dmJiX2V4dHMpLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyksCisJX19SSVNDVl9JU0FfRVhUX1NV
UEVSU0VUKHp2ZTMyZiwgUklTQ1ZfSVNBX0VYVF9aVkUzMkYsIHJpc2N2X3p2ZTMyZl9leHRzKSwK
KwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmUzMngsIFJJU0NWX0lTQV9FWFRfWlZFMzJYKSwKKwlf
X1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlNjRmLCBSSVNDVl9JU0FfRVhUX1pWRTY0Riwgcmlz
Y3ZfenZlNjRmX2V4dHMpLAorCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NGQsIFJJU0NW
X0lTQV9FWFRfWlZFNjRELCByaXNjdl96dmU2NGRfZXh0cyksCisJX19SSVNDVl9JU0FfRVhUX1NV
UEVSU0VUKHp2ZTY0eCwgUklTQ1ZfSVNBX0VYVF9aVkU2NFgsIHJpc2N2X3p2ZTY0eF9leHRzKSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmZoLCBSSVNDVl9JU0FfRVhUX1pWRkgpLAogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHp2ZmhtaW4sIFJJU0NWX0lTQV9FWFRfWlZGSE1JTiksCiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoenZrYiwgUklTQ1ZfSVNBX0VYVF9aVktCKSwKLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
