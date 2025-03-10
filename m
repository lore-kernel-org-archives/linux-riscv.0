Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8694FC35FF2
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mf7nuoLPdAKaOQ5lmgawroSJ+BVHq4ix/XWFNjcEEjw=; b=CbgKb78yze462y
	Uz6uV0htgiu5dBHgfNYN+PyAc2Nd2RkdpyhsBVp3TaTGSqWT3EzXNo2O/F/2MoYOrSCmdfJ+d9OWI
	bS9HgN/zWJhvRlCA+afhY5tYADEBKhR5lEz++cYG46Z6cfnu+eIWhgGukuzjJzEJblfescOFODZCw
	8fYbWmNQYdfaqTWqSF7w+RaOzJGMDfjgXMzEoVt8UGZE/CLc50lw8hNyquqWkx6lhWlFbWDO1LtDk
	9+c7nZQa8WvxZ1CXWzn9o3AiwlCfB0r1MsDVJ4jfVlcE0KgMYZuQYoP0OS9y2AtRG0BIagDIDfZxi
	vI6ewonE1zOqeUTAOfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLs-00000003FuY-1eUy;
	Mon, 10 Mar 2025 15:47:36 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treoi-000000037Yd-3bN6
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2243803b776so68720345ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619600; x=1742224400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCzObjCiX22GaNtqPcn313QNcQsAxjFzTtLeQoUqwaY=;
        b=GadKO/aWA6LBNANRtxvkWLX+BU901uj99fPr3DezPVqVRUjP/xBRg26U6L5iY4Jq6c
         3I6G2Xt3F4x/lWVCT4IQQP9YYWNBFEPs8JH8CtBZkJCGkfs3wBzt4arGwi/vZxuoDX9x
         NKbkOzJWA3dSQV8R9iM3m758Wad4ckgjtXOScRpEauKJl+vCywuanQDB3OqUae5uc0TE
         jLYF+JDRlqeohSXOEmtGZ9wvbV1EZ1rD/hy/8e9xD4uGHwBiWxFi2HuGWi1q1NLQe5Vl
         A9nf7MSnURWG0pXFtkNaHYe5gcJVbZ6yF43kgYxVBDtKVuPrKq+CS/ynm6Uj7Xm3XNqg
         J1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619600; x=1742224400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCzObjCiX22GaNtqPcn313QNcQsAxjFzTtLeQoUqwaY=;
        b=GXmYS76uqmpSc6OfhnYUG8fPxwAgoz3dP7oCxymTndZq+Yb0mbGxu+KrySZyTw+khF
         /GYioPQs9+lKu8uSujjHRPSJ3pRhX2lRoUFgVUB31zOAqujjYwmafG1JWYEBHOdKa3f4
         wS7WteuE5Nb3uaxnfvRffcRPm1x5izVqH2jROe5gwxvI3tj6VpiaJWFDOQpQWpXWOjlh
         P1p9rUjeI+weatE5Jeiw47YKXE53QpBb2qSaE7DkXHFnZL0ByjEbPuhYCkVk+VhSZw3D
         E1GiYd5/hjc/LZTubZ2ONTqNauSCexRaIgTMOsWHU0W4Qxc+YZ6/Ktrlblzk6ZRWTQWZ
         fNtg==
X-Forwarded-Encrypted: i=1; AJvYcCWTc9X7zyNh/Cy6mi4L12kFQxidBSe1M34npgyGJ7pEJhh6G5Em8Dx8t60dO0r+3/TQEzhho4ID/BxadA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9HLONh75OfWLn/TZhzQTcfeBggEyf+mqGhFoIKsgky9HigWYU
	Xc8VZ7VE96sXxFvf7KzTdFf/gjDXO5YmSDfoWOlGIbBGe96REHkhH2HEoT8U/m4=
X-Gm-Gg: ASbGncuDju+qhWBCzhbOszxaSUxf2qGs24D2DfsABYzQLYkqpLQhKk/wwRD2M2kYOn4
	t7+bUsKbWRY7Jt4uNM7VNtTq7Z/akX2f3eBgEAUBWdMQZDmEJPdqfJo2daR3REE8+/paI7EnUDX
	voDd1z+TqopLzGoR9/ZuX9RIXVWA1wqy+aLRst+vfRc2p3pl7wi1qR9/AWdgR6Si+amd8BlIEdA
	NAOT44A6r1f4d+hcs/fdMOYuHvmapJTfM4fTkqr9eyqYbqtqcGtwTOic4K7iAHPM8cnLbxsEboH
	iXYgncxwyZNU3a245Yqbjrr5YFUQJllysNn35tdMqterEw==
X-Google-Smtp-Source: AGHT+IFAN+g28xsEl6cRHjCuf/iafyl8QjCyWFLr5ynPSsnxM9bGhegkupQZbu72YeMxbfX8Ebj7iA==
X-Received: by 2002:a17:903:32c5:b0:224:10a2:cad5 with SMTP id d9443c01a7336-2242887b36bmr234821365ad.10.1741619600386;
        Mon, 10 Mar 2025 08:13:20 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:19 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 04/17] riscv: misaligned: request misaligned exception from SBI
Date: Mon, 10 Mar 2025 16:12:11 +0100
Message-ID: <20250310151229.2365992-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081320_904411_EE5C9C37 
X-CRM114-Status: GOOD (  16.82  )
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

Tm93IHRoYXQgdGhlIGtlcm5lbCBjYW4gaGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgaW4gUy1t
b2RlLCByZXF1ZXN0Cm1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBkZWxlZ2F0aW9uIGZyb20g
U0JJLiBUaGlzIHVzZXMgdGhlIEZXRlQgU0JJCmV4dGVuc2lvbiBkZWZpbmVkIGluIFNCSSB2ZXJz
aW9uIDMuMC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgICAgICAgfCAg
MyArLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jICAgICAgIHwgNzcgKysr
KysrKysrKysrKysrKysrKysrLQogYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19z
cGVlZC5jIHwgMTEgKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKaW5kZXggNTY5MTQwZDZl
NjM5Li5hZDdkMjY3ODhlNmEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1
ZmVhdHVyZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCkBAIC02
NCw4ICs2NCw5IEBAIHZvaWQgX19pbml0IHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKTsKIAlf
UklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIF9zdWJfZXh0cywgQVJSQVlfU0laRShfc3Vi
X2V4dHMpLCBfdmFsaWRhdGUpCiAKIGJvb2wgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRl
ZF9hbGxfY3B1cyh2b2lkKTsKK3ZvaWQgdW5hbGlnbmVkX2FjY2Vzc19pbml0KHZvaWQpOworaW50
IGNwdV9vbmxpbmVfdW5hbGlnbmVkX2FjY2Vzc19pbml0KHVuc2lnbmVkIGludCBjcHUpOwogI2lm
IGRlZmluZWQoQ09ORklHX1JJU0NWX1NDQUxBUl9NSVNBTElHTkVEKQotdm9pZCBjaGVja191bmFs
aWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBfX2Fsd2F5c191
bnVzZWQpOwogdm9pZCB1bmFsaWduZWRfZW11bGF0aW9uX2ZpbmlzaCh2b2lkKTsKIGJvb2wgdW5h
bGlnbmVkX2N0bF9hdmFpbGFibGUodm9pZCk7CiBERUNMQVJFX1BFUl9DUFUobG9uZywgbWlzYWxp
Z25lZF9hY2Nlc3Nfc3BlZWQpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4
IDdjYzEwOGFlZDc0ZS4uOTBhYzc0MTkxMzU3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jCkBAIC0xNiw2ICsxNiw3IEBACiAjaW5jbHVkZSA8YXNtL2VudHJ5LWNvbW1vbi5oPgog
I2luY2x1ZGUgPGFzbS9od3Byb2JlLmg+CiAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KKyNp
bmNsdWRlIDxhc20vc2JpLmg+CiAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgogCiAjZGVmaW5lIElO
U05fTUFUQ0hfTEIJCQkweDMKQEAgLTYzNSw3ICs2MzYsNyBAQCBib29sIGNoZWNrX3ZlY3Rvcl91
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAKIHN0YXRpYyBib29sIHVu
YWxpZ25lZF9jdGwgX19yZWFkX21vc3RseTsKIAotdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBfX2Fsd2F5c191bnVzZWQpCitzdGF0
aWMgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yayBfX2Fsd2F5c191bnVzZWQpCiB7CiAJaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQo
KTsKIAlsb25nICptYXNfcHRyID0gcGVyX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNzX3NwZWVk
LCBjcHUpOwpAQCAtNjQ2LDYgKzY0NywxMyBAQCB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nf
ZW11bGF0ZWQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCkKIAlfX2Fz
bV9fIF9fdm9sYXRpbGVfXyAoCiAJCSIgICAgICAgIlJFR19MIiAlW3RtcF0sIDEoJVtwdHJdKVxu
IgogCQk6IFt0bXBdICI9ciIgKHRtcF92YWwpIDogW3B0cl0gInIiICgmdG1wX3ZhcikgOiAibWVt
b3J5Iik7Cit9CisKK3N0YXRpYyBpbnQgY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKHVuc2lnbmVkIGludCBjcHUpCit7CisJbG9uZyAqbWFzX3B0ciA9IHBlcl9jcHVf
cHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KTsKKworCWNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWQoTlVMTCk7CiAKIAkvKgogCSAqIElmIHVuYWxpZ25lZF9jdGwgaXMgYWxy
ZWFkeSBzZXQsIHRoaXMgbWVhbnMgdGhhdCB3ZSBkZXRlY3RlZCB0aGF0IGFsbApAQCAtNjU0LDkg
KzY2MiwxMCBAQCB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCkKIAkgKi8KIAlpZiAodW5saWtlbHkodW5h
bGlnbmVkX2N0bCAmJiAoKm1hc19wdHIgIT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxB
Ul9FTVVMQVRFRCkpKSB7CiAJCXByX2NyaXQoIkNQVSBtaXNhbGlnbmVkIGFjY2Vzc2VzIG5vbiBo
b21vZ2VuZW91cyAoZXhwZWN0ZWQgYWxsIGVtdWxhdGVkKVxuIik7Ci0JCXdoaWxlICh0cnVlKQot
CQkJY3B1X3JlbGF4KCk7CisJCXJldHVybiAtRUlOVkFMOwogCX0KKworCXJldHVybiAwOwogfQog
CiBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKQEAg
LTY4OCw0ICs2OTcsNjYgQEAgYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2Fs
bF9jcHVzKHZvaWQpCiB7CiAJcmV0dXJuIGZhbHNlOwogfQorc3RhdGljIGludCBjcHVfb25saW5l
X2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQodW5zaWduZWQgaW50IGNwdSkKK3sKKwly
ZXR1cm4gMDsKK30KICNlbmRpZgorCisjaWZkZWYgQ09ORklHX1JJU0NWX1NCSQorCitzdGF0aWMg
Ym9vbCBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZDsKKworc3RhdGljIGludCBjcHVfb25saW5l
X3NiaV91bmFsaWduZWRfc2V0dXAodW5zaWduZWQgaW50IGNwdSkKK3sKKwlpZiAoc2JpX2Z3ZnRf
c2V0KFNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLCAxLCAwKSAmJgorCSAgICBtaXNhbGln
bmVkX3RyYXBzX2RlbGVnYXRlZCkgeworCQlwcl9jcml0KCJNaXNhbGlnbmVkIHRyYXAgZGVsZWdh
dGlvbiBub24gaG9tb2dlbmVvdXMgKGV4cGVjdGVkIGRlbGVnYXRlZCkiKTsKKwkJcmV0dXJuIC1F
SU5WQUw7CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyB2b2lkIHVuYWxpZ25lZF9zYmlf
cmVxdWVzdF9kZWxlZ2F0aW9uKHZvaWQpCit7CisJaW50IHJldDsKKworCXJldCA9IHNiaV9md2Z0
X2FsbF9jcHVzX3NldChTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywgMSwgMCwgMCk7CisJ
aWYgKHJldCkKKwkJcmV0dXJuOworCisJbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQgPSB0cnVl
OworCXByX2luZm8oIlNCSSBtaXNhbGlnbmVkIGFjY2VzcyBleGNlcHRpb24gZGVsZWdhdGlvbiBv
a1xuIik7CisJLyoKKwkgKiBOb3RlIHRoYXQgd2UgZG9uJ3QgaGF2ZSB0byB0YWtlIGFueSBzcGVj
aWZpYyBhY3Rpb24gaGVyZSwgaWYKKwkgKiB0aGUgZGVsZWdhdGlvbiBpcyBzdWNjZXNzZnVsLCB0
aGVuCisJICogY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCgpIHdpbGwgdmVyaWZ5IHRo
YXQgaW5kZWVkIHRoZQorCSAqIHBsYXRmb3JtIHRyYXBzIG9uIG1pc2FsaWduZWQgYWNjZXNzZXMu
CisJICovCit9CisKK3ZvaWQgdW5hbGlnbmVkX2FjY2Vzc19pbml0KHZvaWQpCit7CisJaWYgKHNi
aV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9GV0ZUKSA+IDApCisJCXVuYWxpZ25lZF9zYmlfcmVx
dWVzdF9kZWxlZ2F0aW9uKCk7Cit9CisjZWxzZQordm9pZCB1bmFsaWduZWRfYWNjZXNzX2luaXQo
dm9pZCkge30KKworc3RhdGljIGludCBjcHVfb25saW5lX3NiaV91bmFsaWduZWRfc2V0dXAodW5z
aWduZWQgaW50IGNwdSBfX2Fsd2F5c191bnVzZWQpCit7CisJcmV0dXJuIDA7Cit9CisjZW5kaWYK
KworaW50IGNwdV9vbmxpbmVfdW5hbGlnbmVkX2FjY2Vzc19pbml0KHVuc2lnbmVkIGludCBjcHUp
Cit7CisJaW50IHJldDsKKworCXJldCA9IGNwdV9vbmxpbmVfc2JpX3VuYWxpZ25lZF9zZXR1cChj
cHUpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlyZXR1cm4gY3B1X29ubGluZV9jaGVj
a191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGNwdSk7Cit9CmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC91
bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKaW5kZXggOTFmMTg5Y2YxNjExLi4yZjNhYmEwNzMyOTcg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwor
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKQEAgLTE4OCwx
MyArMTg4LDIwIEBAIGFyY2hfaW5pdGNhbGxfc3luYyhsb2NrX2FuZF9zZXRfdW5hbGlnbmVkX2Fj
Y2Vzc19zdGF0aWNfYnJhbmNoKTsKIAogc3RhdGljIGludCByaXNjdl9vbmxpbmVfY3B1KHVuc2ln
bmVkIGludCBjcHUpCiB7CisJaW50IHJldDsKIAlzdGF0aWMgc3RydWN0IHBhZ2UgKmJ1ZjsKIAog
CS8qIFdlIGFyZSBhbHJlYWR5IHNldCBzaW5jZSB0aGUgbGFzdCBjaGVjayAqLwogCWlmIChwZXJf
Y3B1KG1pc2FsaWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpICE9IFJJU0NWX0hXUFJPQkVfTUlTQUxJ
R05FRF9TQ0FMQVJfVU5LTk9XTikKIAkJZ290byBleGl0OwogCi0JY2hlY2tfdW5hbGlnbmVkX2Fj
Y2Vzc19lbXVsYXRlZChOVUxMKTsKKwlyZXQgPSBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3Nf
aW5pdChjcHUpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlpZiAocGVyX2NwdShtaXNh
bGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KSA9PSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NB
TEFSX0VNVUxBVEVEKQorCQlnb3RvIGV4aXQ7CisKIAlidWYgPSBhbGxvY19wYWdlcyhHRlBfS0VS
TkVMLCBNSVNBTElHTkVEX0JVRkZFUl9PUkRFUik7CiAJaWYgKCFidWYpIHsKIAkJcHJfd2Fybigi
QWxsb2NhdGlvbiBmYWlsdXJlLCBub3QgbWVhc3VyaW5nIG1pc2FsaWduZWQgcGVyZm9ybWFuY2Vc
biIpOwpAQCAtNDAzLDYgKzQxMCw4IEBAIHN0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19hbGxfY3B1cyh2b2lkKQogewogCWJvb2wgYWxsX2NwdXNfZW11bGF0ZWQsIGFsbF9jcHVzX3Zl
Y191bnN1cHBvcnRlZDsKIAorCXVuYWxpZ25lZF9hY2Nlc3NfaW5pdCgpOworCiAJYWxsX2NwdXNf
ZW11bGF0ZWQgPSBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKCk7CiAJ
YWxsX2NwdXNfdmVjX3Vuc3VwcG9ydGVkID0gY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3Nf
ZW11bGF0ZWRfYWxsX2NwdXMoKTsKIAotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
