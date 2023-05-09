Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D8C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdG5ldH4fiHDLdK45WYa3ztIzjxWUyY0JSanofFcA5c=; b=x2CkDEbdyRs68o
	5IJynssavWaC/m4vCdxEn0qDNnOqQ43IeYNlAOULHqxOmkL8svn6K4uvdgrH6DCcOD3R9N5BHgZyC
	+O3heDOrResbNknZBLLPKmVWdtm2UwJmZ+9R4Ouoz9tBS7vtOYTlBaMU2Wexz/y/Qe6E6PSB4jKPu
	7gPr+bX5A/2ymQkjBTHaRK/4qaBQZrqKb3GOx8k6+r33oHnuwqCniC06jtF4PdgZxhGNrHWeea4H+
	OdkyBORdO0Gyjp2+ES8sLA3rP1poDYpHoWqYHuc5Jqr8qT2bcOTi21Y5ds98RVSAZlFrQ6ZC+Jc84
	bJczF69RrKmX+pl7V1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdq-002tWe-10;
	Tue, 09 May 2023 10:32:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdo-002tUA-1F
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 May 2023 10:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W9PBJBzHlcHA8nlVu28xWsGDRnYddiwOeG1IiMG6RqE=; b=ENFd18DFpzIUiLnrqps+UY3zRx
	vLR2c8gu7HEWe/lXgLP6UChOuxnJlBe9UA6sM2ZDhck8W1oAd6dU5p5zPlJEImGHOj+3FNm1SOXJk
	RYhkloGemHpG1wb0cQmQxLUQOVJbGPa3TbXaUl0RF3x92Em/LRD1E5yMiDtQEfAbZRZIhvmIxb1gk
	MThCsSnNpmBcSidvILQej5kE89si7Nu5nmXY1zOShWwYkNEkKvjC6BF3qjmE1WfUY9szdhmahH9gb
	udC1LZphmfd2kjgcQoY3/edTqf0+WNSKby5LOB9bAw6tA1e0Rl0WRiqX1LqSUMqqRcsmVGYyE5Nun
	O8Qhoeog==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdj-00666C-27
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:32:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so38944305ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628334; x=1686220334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9PBJBzHlcHA8nlVu28xWsGDRnYddiwOeG1IiMG6RqE=;
        b=fgFYU4GjyB45BopdN6/mp7jhxbWo36eigX6K9WDGkmRzoA52E8rBme8tzQx0e3fzxC
         8JcR91zK7V0T63GX9JfP7YfNtEn3QzTB8PDscEI8aLVhVm7fpmPy56LNnX9O9ejUjwk6
         9tmNrXp/McmNAaTMvGAOUNE9xzqcywpwGWtjXRKPvR4vOD8hNh37QBdB6czEFqF/xEpA
         c8EGd61ObNqMc6hiEkSRy0V83SZjH8GeKYSkadZU8RRiBvtmmtiGVeGK5qM8hxgWzqvG
         tFYLsTidgbjnHLYVoQ4If5pJU0i6OVkMNCNd8a6IENap7Jp3I3tIe6UqKBtfmt5NzgOZ
         R/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628334; x=1686220334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9PBJBzHlcHA8nlVu28xWsGDRnYddiwOeG1IiMG6RqE=;
        b=aRG+d/uwxP+y3dv/xxF5Tt4qNhgDtgrjB8pXnH0a51eXyVvwaGGYWkU2p5L4QMjmgn
         pdtTU6uNCOOQiP90EirgSHNax8pUhmRIowxasQI+0q36EorYM/rklvNUkpeMSuXqCPGu
         qzHpgPJUb6eSm54Yl1h3TRwVqr6vIppW3MXuyXsJ7qnAF7IbLQ3C3+ossNdJnkaEMOfe
         J7DGb21QV6MwbnOczfwRzEg1PS+4guEegPxXymSOA96LQw8+TkiObIj2jaH98x9iQ6dv
         sGxLuHKOUnWfP5hyKJe0WQLAAUFUHcCWzfcKPcNnMsUKKkLiLz9w4iSOwnkAcxJv+Zzr
         BDrg==
X-Gm-Message-State: AC+VfDx9MD/+jBxu4FJODNfssu31ST1mXeOvu0S3MNwLSX8FHyU53k++
	JPOHqDjoJHhsUfJD5T9jpYHC1wzWH3iZpoHdvy+QgRIi1LoBuJNdQtZxJky6Pi/lAvJAKQllZJu
	nVD2u1zTGvX8/LJpgXDHoD8mvLF/bJMER0pkdDqdgLrKmI14M3wJ9wgiBZqN3ZxyJMIKkTJvzf4
	IX34/fFA1axmFX
X-Google-Smtp-Source: ACHHUZ7yfmEM4E6vWuEzYwtxvd6PrSPoyafIOeEJxl/CBUSDWn2J/WhYKrhqHToYgslPH9nfweruRw==
X-Received: by 2002:a17:902:ab5e:b0:1ac:2d81:3cf9 with SMTP id ij30-20020a170902ab5e00b001ac2d813cf9mr11588040plb.13.1683628334488;
        Tue, 09 May 2023 03:32:14 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:32:13 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v19 10/24] riscv: Add task switch support for vector
Date: Tue,  9 May 2023 10:30:19 +0000
Message-Id: <20230509103033.11285-11-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_113217_216862_01262934 
X-CRM114-Status: GOOD (  16.99  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Jisheng Zhang <jszhang@kernel.org>, Nick Knight <nick.knight@sifive.com>, Peter Zijlstra <peterz@infradead.org>, vineetg@rivosinc.com, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Ruinland Tsai <ruinland.tsai@sifive.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Heiko Stuebner <heiko.stuebner@vrull.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KClRoaXMgcGF0Y2gg
YWRkcyB0YXNrIHN3aXRjaCBzdXBwb3J0IGZvciB2ZWN0b3IuIEl0IGFsc28gc3VwcG9ydHMgYWxs
Cmxlbmd0aHMgb2Ygdmxlbi4KClN1Z2dlc3RlZC1ieTogQW5kcmV3IFdhdGVybWFuIDxhbmRyZXdA
c2lmaXZlLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiBOaWNrIEtuaWdodCA8bmljay5rbmlnaHRAc2lm
aXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogTmljayBLbmlnaHQgPG5pY2sua25pZ2h0QHNpZml2ZS5j
b20+CkNvLWRldmVsb3BlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgpT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+CkNvLWRldmVs
b3BlZC1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KU2lnbmVkLW9m
Zi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KQ28tZGV2ZWxvcGVk
LWJ5OiBSdWlubGFuZCBUc2FpIDxydWlubGFuZC50c2FpQHNpZml2ZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFJ1aW5sYW5kIFRzYWkgPHJ1aW5sYW5kLnRzYWlAc2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1i
eTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1ieTog
VmluZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5keSBD
aGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJu
ZXJAdnJ1bGwuZXU+ClRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZy
dWxsLmV1PgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggICB8ICAxICsK
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggICB8ICAzICsrKwogYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIHwgIDMgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oICAgICAgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNo
L3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgfCAxOCArKysrKysrKysrKysrCiA1IGZp
bGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aAppbmRleCA5NGEwNTkwYzY5NzEuLmYwZGRmNjkxYWM1ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oCkBAIC0zOSw2ICszOSw3IEBAIHN0cnVjdCB0aHJlYWRfc3RydWN0IHsKIAl1bnNp
Z25lZCBsb25nIHNbMTJdOwkvKiBzWzBdOiBmcmFtZSBwb2ludGVyICovCiAJc3RydWN0IF9fcmlz
Y3ZfZF9leHRfc3RhdGUgZnN0YXRlOwogCXVuc2lnbmVkIGxvbmcgYmFkX2NhdXNlOworCXN0cnVj
dCBfX3Jpc2N2X3ZfZXh0X3N0YXRlIHZzdGF0ZTsKIH07CiAKIC8qIFdoaXRlbGlzdCB0aGUgZnN0
YXRlIGZyb20gdGhlIHRhc2tfc3RydWN0IGZvciBoYXJkZW5lZCB1c2VyY29weSAqLwpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc3dpdGNoX3RvLmgKaW5kZXggNGI5NmIxM2RlZTI3Li5hNzI3YmU3MjNjNTYgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaApAQCAtOCw2ICs4LDcgQEAKIAogI2luY2x1ZGUg
PGxpbnV4L2p1bXBfbGFiZWwuaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC90YXNrX3N0YWNrLmg+
CisjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgogI2luY2x1ZGUgPGFzbS9od2NhcC5oPgogI2luY2x1
ZGUgPGFzbS9wcm9jZXNzb3IuaD4KICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+CkBAIC03OCw2ICs3
OSw4IEBAIGRvIHsJCQkJCQkJXAogCXN0cnVjdCB0YXNrX3N0cnVjdCAqX19uZXh0ID0gKG5leHQp
OwkJXAogCWlmIChoYXNfZnB1KCkpCQkJCQlcCiAJCV9fc3dpdGNoX3RvX2ZwdShfX3ByZXYsIF9f
bmV4dCk7CVwKKwlpZiAoaGFzX3ZlY3RvcigpKQkJCQkJXAorCQlfX3N3aXRjaF90b192ZWN0b3Io
X19wcmV2LCBfX25leHQpOwlcCiAJKChsYXN0KSA9IF9fc3dpdGNoX3RvKF9fcHJldiwgX19uZXh0
KSk7CQlcCiB9IHdoaWxlICgwKQogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKaW5k
ZXggZTBkMjAyMTM0YjQ0Li45N2U2ZjY1ZWMxNzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGhyZWFkX2luZm8uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVh
ZF9pbmZvLmgKQEAgLTgxLDYgKzgxLDkgQEAgc3RydWN0IHRocmVhZF9pbmZvIHsKIAkucHJlZW1w
dF9jb3VudAk9IElOSVRfUFJFRU1QVF9DT1VOVCwJXAogfQogCit2b2lkIGFyY2hfcmVsZWFzZV90
YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzayk7CitpbnQgYXJjaF9kdXBfdGFza19z
dHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0cnVjdCB0YXNrX3N0cnVjdCAqc3JjKTsK
KwogI2VuZGlmIC8qICFfX0FTU0VNQkxZX18gKi8KIAogLyoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5o
CmluZGV4IDdhNTZiYjA3NjlhYS4uMTIxZDcwMGM2YWRhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9y
LmgKQEAgLTEyLDYgKzEyLDkgQEAKICNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1YKIAogI2luY2x1
ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+CisjaW5jbHVk
ZSA8bGludXgvc2NoZWQvdGFza19zdGFjay5oPgorI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KICNp
bmNsdWRlIDxhc20vaHdjYXAuaD4KICNpbmNsdWRlIDxhc20vY3NyLmg+CiAjaW5jbHVkZSA8YXNt
L2FzbS5oPgpAQCAtMTI0LDYgKzEyNywzOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92
X3ZzdGF0ZV9yZXN0b3JlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpyZXN0b3JlXwogCXJp
c2N2X3ZfZGlzYWJsZSgpOwogfQogCitzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92c3RhdGVf
c2F2ZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssCisJCQkJICAgICAgIHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQoreworCWlmICgocmVncy0+c3RhdHVzICYgU1JfVlMpID09IFNSX1ZTX0RJUlRZKSB7
CisJCXN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICp2c3RhdGUgPSAmdGFzay0+dGhyZWFkLnZz
dGF0ZTsKKworCQlfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUodnN0YXRlLCB2c3RhdGUtPmRhdGFwKTsK
KwkJX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKKwl9Cit9CisKK3N0YXRpYyBpbmxpbmUg
dm9pZCByaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKKwkJ
CQkJICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwlpZiAoKHJlZ3MtPnN0YXR1cyAmIFNSX1ZT
KSAhPSBTUl9WU19PRkYpIHsKKwkJc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnZzdGF0ZSA9
ICZ0YXNrLT50aHJlYWQudnN0YXRlOworCisJCV9fcmlzY3Zfdl92c3RhdGVfcmVzdG9yZSh2c3Rh
dGUsIHZzdGF0ZS0+ZGF0YXApOworCQlfX3Jpc2N2X3ZfdnN0YXRlX2NsZWFuKHJlZ3MpOworCX0K
K30KKworc3RhdGljIGlubGluZSB2b2lkIF9fc3dpdGNoX3RvX3ZlY3RvcihzdHJ1Y3QgdGFza19z
dHJ1Y3QgKnByZXYsCisJCQkJICAgICAgc3RydWN0IHRhc2tfc3RydWN0ICpuZXh0KQoreworCXN0
cnVjdCBwdF9yZWdzICpyZWdzOworCisJcmVncyA9IHRhc2tfcHRfcmVncyhwcmV2KTsKKwlyaXNj
dl92X3ZzdGF0ZV9zYXZlKHByZXYsIHJlZ3MpOworCXJpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUobmV4
dCwgdGFza19wdF9yZWdzKG5leHQpKTsKK30KKwogI2Vsc2UgLyogISBDT05GSUdfUklTQ1ZfSVNB
X1YgICovCiAKIHN0cnVjdCBwdF9yZWdzOwpAQCAtMTMyLDYgKzE2Nyw5IEBAIHN0YXRpYyBpbmxp
bmUgaW50IHJpc2N2X3Zfc2V0dXBfdnNpemUodm9pZCkgeyByZXR1cm4gLUVPUE5PVFNVUFA7IH0K
IHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfdmVjdG9yKHZvaWQpIHsgcmV0dXJuIGZh
bHNlOyB9CiBzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl92c3RhdGVfcXVlcnkoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpIHsgcmV0dXJuIGZhbHNlOyB9CiAjZGVmaW5lIHJpc2N2X3ZfdnNpemUgKDAp
CisjZGVmaW5lIHJpc2N2X3ZfdnN0YXRlX3NhdmUodGFzaywgcmVncykJCWRvIHt9IHdoaWxlICgw
KQorI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHRhc2ssIHJlZ3MpCWRvIHt9IHdoaWxl
ICgwKQorI2RlZmluZSBfX3N3aXRjaF90b192ZWN0b3IoX19wcmV2LCBfX25leHQpCWRvIHt9IHdo
aWxlICgwKQogI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vZmYocmVncykJCWRvIHt9IHdoaWxlICgw
KQogI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRvIHt9IHdoaWxlICgwKQogCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9wcm9jZXNzLmMKaW5kZXggZTJhMDYwMDY2NzMwLi5iN2ExMDM2MWRkYzYgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9j
ZXNzLmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+CiAjaW5j
bHVkZSA8YXNtL3RocmVhZF9pbmZvLmg+CiAjaW5jbHVkZSA8YXNtL2NwdWlkbGUuaD4KKyNpbmNs
dWRlIDxhc20vdmVjdG9yLmg+CiAKIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgZ3BfaW5fZ2xvYmFs
IF9fYXNtX18oImdwIik7CiAKQEAgLTE0NiwxMiArMTQ3LDI4IEBAIHZvaWQgZmx1c2hfdGhyZWFk
KHZvaWQpCiAJZnN0YXRlX29mZihjdXJyZW50LCB0YXNrX3B0X3JlZ3MoY3VycmVudCkpOwogCW1l
bXNldCgmY3VycmVudC0+dGhyZWFkLmZzdGF0ZSwgMCwgc2l6ZW9mKGN1cnJlbnQtPnRocmVhZC5m
c3RhdGUpKTsKICNlbmRpZgorI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgorCS8qIFJlc2V0IHZl
Y3RvciBzdGF0ZSAqLworCXJpc2N2X3ZfdnN0YXRlX29mZih0YXNrX3B0X3JlZ3MoY3VycmVudCkp
OworCWtmcmVlKGN1cnJlbnQtPnRocmVhZC52c3RhdGUuZGF0YXApOworCW1lbXNldCgmY3VycmVu
dC0+dGhyZWFkLnZzdGF0ZSwgMCwgc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlKSk7
CisjZW5kaWYKK30KKwordm9pZCBhcmNoX3JlbGVhc2VfdGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tf
c3RydWN0ICp0c2spCit7CisJLyogRnJlZSB0aGUgdmVjdG9yIGNvbnRleHQgb2YgZGF0YXAuICov
CisJaWYgKGhhc192ZWN0b3IoKSkKKwkJa2ZyZWUodHNrLT50aHJlYWQudnN0YXRlLmRhdGFwKTsK
IH0KIAogaW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYykKIHsKIAlmc3RhdGVfc2F2ZShzcmMsIHRhc2tfcHRfcmVn
cyhzcmMpKTsKIAkqZHN0ID0gKnNyYzsKKwkvKiBjbGVhciBlbnRpcmUgViBjb250ZXh0LCBpbmNs
dWRpbmcgZGF0YXAgZm9yIGEgbmV3IHRhc2sgKi8KKwltZW1zZXQoJmRzdC0+dGhyZWFkLnZzdGF0
ZSwgMCwgc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlKSk7CisKIAlyZXR1cm4gMDsK
IH0KIApAQCAtMTg0LDYgKzIwMSw3IEBAIGludCBjb3B5X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnAsIGNvbnN0IHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJncyAqYXJncykKIAkJcC0+dGhyZWFk
LnNbMF0gPSAwOwogCX0KIAlwLT50aHJlYWQucmEgPSAodW5zaWduZWQgbG9uZylyZXRfZnJvbV9m
b3JrOworCXJpc2N2X3ZfdnN0YXRlX29mZihjaGlsZHJlZ3MpOwogCXAtPnRocmVhZC5zcCA9ICh1
bnNpZ25lZCBsb25nKWNoaWxkcmVnczsgLyoga2VybmVsIHNwICovCiAJcmV0dXJuIDA7CiB9Ci0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
