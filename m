Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158DEC761A6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIaAvKkVCq68j91kZo5lpWtx3DwDEsW/2gYCCXjp9sU=; b=WDpmECawXNly+z
	ENEc9Y4v8kZ7GzN7nEMdsoDv18LLktiMb0kQuzxiJ07qMRHTVH36AbN+272DVfvPTzUHMFYGe1J13
	Z6XVDlJLJTYBav9nU7EyclR8oeHedo/w6saTE4l4XQWpUp1OqUoiUF9gPaTJuLAea32hyP17CVXMO
	ZKcIOsRr8K6oxFwPmOupvO7rowuXCwUdvSjG8UDZbtKJPRgjf2sbwiv/wrskGmJ1XBUgEOFyv1nQD
	A4CEszNxAzD3x2pVHFKVI67a7hiyGMpSziSjtjvGJaSdJY9an3UC+j/2yoasnnUODc9o857e8sIWH
	JOMzbjelOO5dhtR3xFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3W-00BlTV-0H;
	Mon, 27 Mar 2023 16:50:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3R-00BlQ9-2c
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:50:49 +0000
Received: by mail-pf1-x432.google.com with SMTP id l14so6104033pfc.11
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akIgalGTpe/p23pL7vFw1BejwphTBbhuEovSolwHeyQ=;
        b=H+KP2NUFG5GwpPDbo8n/GCxrEfoyJkL/dr827iNpQde1zUUcOelbX+6sOWIZf4PV4K
         CWnjj3YB7r6uMYzs491dRimZPSIwTU17HdrCRpxHGf3Xozmy+EFpG7zs4QrkicwAjlnp
         GSL/HtJx4F5Kr78ax4jihDwAqjmwikMPsDKR3bHAul+OVkbZbY2PL5ybs+xhpJlIquSe
         oH88+/iY8mTshynz6zAaYRcToKtSE7HIISdr0VF28i8/jJ61JTjwILY5CeIRjUuDCFLh
         qqp2IsTHYcoDQQl2UbUhO/qjaRMOce3M1mmFKVb7qSwTx4yr6NRwJCsKV8MyaB3bXZyv
         E0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akIgalGTpe/p23pL7vFw1BejwphTBbhuEovSolwHeyQ=;
        b=OEfQ2ob+UQn3ka1GrLR6iJiiFN0yW/MEAOcsGozDVclYJxTUeXg9YpGvWJFnW20VRK
         sh1VfDpB02C3VRgwfe7JP8M7hriRkrgE6dBFgbDX4Bn+u0jFDsXRPXnybgtRfc+27Ty+
         DRnz9uHu6viqtC8KLpLtHOkMfASzd3IUiFSk5dbo+t5ZfcnCksG2kgqO1j1JK5DwcWye
         tsvPuFd5FpldnSqpZooxYEku9HzXP1Yo9iOxFsnvA30q8c8Eow5ZiLMnDKvYUJzHD0Ks
         WmgcnNk4QQaVOcikCnzVgclNFFi6DlW3FyetmyhMEUNMdZRsy21q5nwoguvDq/IM5kEH
         qnug==
X-Gm-Message-State: AAQBX9eCvh8EydH08WyAw+4NQoW9bYD4021yf2wcLZb2QLIzDIJy+n56
	IoqhgJ5OAtBMh9GjAwkCHL/0slFbjm687jAivQtI39m7zn5pm0l/BxYxiMfl3tpIrSi4tGR//gR
	ILX1VbtHRnLGTkW/HfF7SDJyl/qYOhFUtN1mOH+WLj3rf38yLNXT6yy491UWfqi7uJdqoOgMMiA
	pOdveN895ymrA7
X-Google-Smtp-Source: AKy350ZcMQ0+RR/BjnDc57c15djycBBQqKdTM3FXmyHZKE1vsnIcMgYe/JSzGf4rBRH+CKJCisuZeg==
X-Received: by 2002:a62:18c4:0:b0:619:53de:8880 with SMTP id 187-20020a6218c4000000b0061953de8880mr11283464pfy.16.1679935843043;
        Mon, 27 Mar 2023 09:50:43 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:50:42 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v17 09/20] riscv: Add task switch support for vector
Date: Mon, 27 Mar 2023 16:49:29 +0000
Message-Id: <20230327164941.20491-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095045_887513_B403F8D1 
X-CRM114-Status: GOOD (  17.22  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Jisheng Zhang <jszhang@kernel.org>, Nick Knight <nick.knight@sifive.com>, Peter Zijlstra <peterz@infradead.org>, vineetg@rivosinc.com, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Ruinland Tsai <ruinland.tsai@sifive.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Dmitry Vyukov <dvyukov@google.com>, Heiko Stuebner <heiko@sntech.de>
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
bkByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAg
IHwgIDEgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCAgIHwgIDMgKysrCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggfCAgMyArKysKIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmVjdG9yLmggICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICB8IDE4ICsrKysrKysrKysr
KysKIDUgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oCmluZGV4IDk0YTA1OTBjNjk3MS4uZjBkZGY2OTFhYzVlIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcHJvY2Vzc29yLmgKQEAgLTM5LDYgKzM5LDcgQEAgc3RydWN0IHRocmVhZF9zdHJ1Y3Qg
ewogCXVuc2lnbmVkIGxvbmcgc1sxMl07CS8qIHNbMF06IGZyYW1lIHBvaW50ZXIgKi8KIAlzdHJ1
Y3QgX19yaXNjdl9kX2V4dF9zdGF0ZSBmc3RhdGU7CiAJdW5zaWduZWQgbG9uZyBiYWRfY2F1c2U7
CisJc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgdnN0YXRlOwogfTsKIAogLyogV2hpdGVsaXN0
IHRoZSBmc3RhdGUgZnJvbSB0aGUgdGFza19zdHJ1Y3QgZm9yIGhhcmRlbmVkIHVzZXJjb3B5ICov
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAppbmRleCA0Yjk2YjEzZGVlMjcuLmE3MjdiZTcy
M2M1NiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAorKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5oCkBAIC04LDYgKzgsNyBAQAogCiAj
aW5jbHVkZSA8bGludXgvanVtcF9sYWJlbC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rhc2tf
c3RhY2suaD4KKyNpbmNsdWRlIDxhc20vdmVjdG9yLmg+CiAjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+
CiAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgogI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KQEAg
LTc4LDYgKzc5LDggQEAgZG8gewkJCQkJCQlcCiAJc3RydWN0IHRhc2tfc3RydWN0ICpfX25leHQg
PSAobmV4dCk7CQlcCiAJaWYgKGhhc19mcHUoKSkJCQkJCVwKIAkJX19zd2l0Y2hfdG9fZnB1KF9f
cHJldiwgX19uZXh0KTsJXAorCWlmIChoYXNfdmVjdG9yKCkpCQkJCQlcCisJCV9fc3dpdGNoX3Rv
X3ZlY3RvcihfX3ByZXYsIF9fbmV4dCk7CVwKIAkoKGxhc3QpID0gX19zd2l0Y2hfdG8oX19wcmV2
LCBfX25leHQpKTsJCVwKIH0gd2hpbGUgKDApCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGhyZWFkX2luZm8uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2lu
Zm8uaAppbmRleCBlMGQyMDIxMzRiNDQuLjk3ZTZmNjVlYzE3NiAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdGhyZWFkX2luZm8uaApAQCAtODEsNiArODEsOSBAQCBzdHJ1Y3QgdGhyZWFkX2luZm8gewog
CS5wcmVlbXB0X2NvdW50CT0gSU5JVF9QUkVFTVBUX0NPVU5ULAlcCiB9CiAKK3ZvaWQgYXJjaF9y
ZWxlYXNlX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKTsKK2ludCBhcmNoX2R1
cF90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmRzdCwgc3RydWN0IHRhc2tfc3RydWN0
ICpzcmMpOworCiAjZW5kaWYgLyogIV9fQVNTRU1CTFlfXyAqLwogCiAvKgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dmVjdG9yLmgKaW5kZXggY2I2MDYzNzQ0M2JlLi40MTYxMzUyZDZlYTggMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS92ZWN0b3IuaApAQCAtMTEsNiArMTEsOSBAQAogI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgog
CiAjaW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+CisjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4K
KyNpbmNsdWRlIDxsaW51eC9zY2hlZC90YXNrX3N0YWNrLmg+CisjaW5jbHVkZSA8YXNtL3B0cmFj
ZS5oPgogI2luY2x1ZGUgPGFzbS9od2NhcC5oPgogI2luY2x1ZGUgPGFzbS9jc3IuaD4KICNpbmNs
dWRlIDxhc20vYXNtLmg+CkBAIC0xMjMsNiArMTI2LDM4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBf
X3Jpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnJlc3Rv
cmVfCiAJcmlzY3Zfdl9kaXNhYmxlKCk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92
X3ZzdGF0ZV9zYXZlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKKwkJCQkgICAgICAgc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpCit7CisJaWYgKChyZWdzLT5zdGF0dXMgJiBTUl9WUykgPT0gU1JfVlNf
RElSVFkpIHsKKwkJc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnZzdGF0ZSA9ICZ0YXNrLT50
aHJlYWQudnN0YXRlOworCisJCV9fcmlzY3Zfdl92c3RhdGVfc2F2ZSh2c3RhdGUsIHZzdGF0ZS0+
ZGF0YXApOworCQlfX3Jpc2N2X3ZfdnN0YXRlX2NsZWFuKHJlZ3MpOworCX0KK30KKworc3RhdGlj
IGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoc3RydWN0IHRhc2tfc3RydWN0ICp0
YXNrLAorCQkJCQkgIHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCWlmICgocmVncy0+c3RhdHVz
ICYgU1JfVlMpICE9IFNSX1ZTX09GRikgeworCQlzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAq
dnN0YXRlID0gJnRhc2stPnRocmVhZC52c3RhdGU7CisKKwkJX19yaXNjdl92X3ZzdGF0ZV9yZXN0
b3JlKHZzdGF0ZSwgdnN0YXRlLT5kYXRhcCk7CisJCV9fcmlzY3Zfdl92c3RhdGVfY2xlYW4ocmVn
cyk7CisJfQorfQorCitzdGF0aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fdmVjdG9yKHN0cnVj
dCB0YXNrX3N0cnVjdCAqcHJldiwKKwkJCQkgICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKm5leHQp
Cit7CisJc3RydWN0IHB0X3JlZ3MgKnJlZ3M7CisKKwlyZWdzID0gdGFza19wdF9yZWdzKHByZXYp
OworCXJpc2N2X3ZfdnN0YXRlX3NhdmUocHJldiwgcmVncyk7CisJcmlzY3Zfdl92c3RhdGVfcmVz
dG9yZShuZXh0LCB0YXNrX3B0X3JlZ3MobmV4dCkpOworfQorCiAjZWxzZSAvKiAhIENPTkZJR19S
SVNDVl9JU0FfViAgKi8KIAogc3RydWN0IHB0X3JlZ3M7CkBAIC0xMzEsNiArMTY2LDkgQEAgc3Rh
dGljIF9fYWx3YXlzX2lubGluZSBib29sIGhhc192ZWN0b3Iodm9pZCkgeyByZXR1cm4gZmFsc2U7
IH0KIHN0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl92X3ZzdGF0ZV9xdWVyeShzdHJ1Y3QgcHRfcmVn
cyAqcmVncykgeyByZXR1cm4gZmFsc2U7IH0KICNkZWZpbmUgcmlzY3Zfdl92c2l6ZSAoMCkKICNk
ZWZpbmUgcmlzY3Zfdl9zZXR1cF92c2l6ZSgpCQkJZG8ge30gd2hpbGUgKDApCisjZGVmaW5lIHJp
c2N2X3ZfdnN0YXRlX3NhdmUodGFzaywgcmVncykJCWRvIHt9IHdoaWxlICgwKQorI2RlZmluZSBy
aXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHRhc2ssIHJlZ3MpCWRvIHt9IHdoaWxlICgwKQorI2RlZmlu
ZSBfX3N3aXRjaF90b192ZWN0b3IoX19wcmV2LCBfX25leHQpCWRvIHt9IHdoaWxlICgwKQogI2Rl
ZmluZSByaXNjdl92X3ZzdGF0ZV9vZmYocmVncykJCWRvIHt9IHdoaWxlICgwKQogI2RlZmluZSBy
aXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRvIHt9IHdoaWxlICgwKQogCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMK
aW5kZXggZTJhMDYwMDY2NzMwLi5iN2ExMDM2MWRkYzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKQEAgLTI0
LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+CiAjaW5jbHVkZSA8YXNtL3Ro
cmVhZF9pbmZvLmg+CiAjaW5jbHVkZSA8YXNtL2NwdWlkbGUuaD4KKyNpbmNsdWRlIDxhc20vdmVj
dG9yLmg+CiAKIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgZ3BfaW5fZ2xvYmFsIF9fYXNtX18oImdw
Iik7CiAKQEAgLTE0NiwxMiArMTQ3LDI4IEBAIHZvaWQgZmx1c2hfdGhyZWFkKHZvaWQpCiAJZnN0
YXRlX29mZihjdXJyZW50LCB0YXNrX3B0X3JlZ3MoY3VycmVudCkpOwogCW1lbXNldCgmY3VycmVu
dC0+dGhyZWFkLmZzdGF0ZSwgMCwgc2l6ZW9mKGN1cnJlbnQtPnRocmVhZC5mc3RhdGUpKTsKICNl
bmRpZgorI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgorCS8qIFJlc2V0IHZlY3RvciBzdGF0ZSAq
LworCXJpc2N2X3ZfdnN0YXRlX29mZih0YXNrX3B0X3JlZ3MoY3VycmVudCkpOworCWtmcmVlKGN1
cnJlbnQtPnRocmVhZC52c3RhdGUuZGF0YXApOworCW1lbXNldCgmY3VycmVudC0+dGhyZWFkLnZz
dGF0ZSwgMCwgc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlKSk7CisjZW5kaWYKK30K
Kwordm9pZCBhcmNoX3JlbGVhc2VfdGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICp0c2sp
Cit7CisJLyogRnJlZSB0aGUgdmVjdG9yIGNvbnRleHQgb2YgZGF0YXAuICovCisJaWYgKGhhc192
ZWN0b3IoKSkKKwkJa2ZyZWUodHNrLT50aHJlYWQudnN0YXRlLmRhdGFwKTsKIH0KIAogaW50IGFy
Y2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19z
dHJ1Y3QgKnNyYykKIHsKIAlmc3RhdGVfc2F2ZShzcmMsIHRhc2tfcHRfcmVncyhzcmMpKTsKIAkq
ZHN0ID0gKnNyYzsKKwkvKiBjbGVhciBlbnRpcmUgViBjb250ZXh0LCBpbmNsdWRpbmcgZGF0YXAg
Zm9yIGEgbmV3IHRhc2sgKi8KKwltZW1zZXQoJmRzdC0+dGhyZWFkLnZzdGF0ZSwgMCwgc2l6ZW9m
KHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlKSk7CisKIAlyZXR1cm4gMDsKIH0KIApAQCAtMTg0
LDYgKzIwMSw3IEBAIGludCBjb3B5X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIGNvbnN0
IHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJncyAqYXJncykKIAkJcC0+dGhyZWFkLnNbMF0gPSAwOwog
CX0KIAlwLT50aHJlYWQucmEgPSAodW5zaWduZWQgbG9uZylyZXRfZnJvbV9mb3JrOworCXJpc2N2
X3ZfdnN0YXRlX29mZihjaGlsZHJlZ3MpOwogCXAtPnRocmVhZC5zcCA9ICh1bnNpZ25lZCBsb25n
KWNoaWxkcmVnczsgLyoga2VybmVsIHNwICovCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
