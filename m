Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC68C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 00:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hz8rH1w7w5wYwL3lkKWdsg3a1j6P8Du1bjqPZrgWEDU=; b=DLQRbbX3JxzpeU
	Kwz5wk8yjyijQjPur02eAcK1nm4BiNxzThAxJcoBrq83jHK5sZWU4mAEfyYNBzqhAR4zr9EJKPdte
	aGXXHAiBjW8XSSvkKq1V9o8Ym5c932PmPzmPQsaW5zBbMNKasjr5d3+h7vaOSvWgD635T/MMP8lEY
	lUk53TfkemtX3GVdrA2d5XTdw9jCi5Cfeif3PT9tcWs5FURX/t45cpa20n/dbfCH/ipesyQ5Gh6yy
	mi5EmodPdZrZnRsFj2GKPsmBO3QzyF77buIO+Ym0MADx794P4Bvboi/NckHz2B6Xc5qIA9tgZBGPr
	j4t/T7rOLDW0tp6PTzmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNG3-00000009Ifo-01zw;
	Thu, 13 Feb 2025 00:39:11 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNG0-00000009Idj-2mw4
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 00:39:09 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-471963ae31bso3048411cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 16:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739407147; x=1740011947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUrtJevhcm0CKbwqKbK4CuYq0Bi82l+4WvPMumL72xI=;
        b=fz2Sh45m0uW79x1NVs5jtIeztfzAQbJ9o/8mDvlaZyX+Z1RSmN2vri/FdaKeiPjqap
         Ul8TvRrW+GX3S/wqnl2lo/H8Kf+My7IeDbb9DAN62zEYhHp0R/OJGYLnH4EMkjV9E9Y9
         U6ZwcPmgizobzGPfrrAoXCpzHlD42WCk2+08rpA6Hdr2LI8/x0xJ+qBJUR7S5WfgnFge
         10Vk9DyywnIZoa+LN3LktOWxGJ1lMd0GTC7ewFaeoZXAwuUx0J4CXIQhpS8w4v+BTk0J
         pNgyxLWIn3nO2ZDH83nthwdBHD49murKzb8DbOnUEAfj2G+Jm/HwiUfVXVe1JzBT014c
         UibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739407147; x=1740011947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUrtJevhcm0CKbwqKbK4CuYq0Bi82l+4WvPMumL72xI=;
        b=B9xt6J1fQFgVbK5MhdLABkOpkrw6mLWmWazfUGst64KXmQdf3eb1lY8gQ8XFeo/AXg
         W8QNG3bjFxefpVgfn1q0AV3D+jXgRA0LKgy2wOzQGI5Y4+uN3qBa5NKKeXyH5GI8atEV
         w7nU6GVZBRvaP4VVWN5nDpasrV4/07IqS73CrfBGdUPKjMNytdhCKJ0YUux+/BQhwh1w
         MyFHzZ1BB1m0bwRhlpjsHD/7sb6fhztYEYj87LN/uLcN1Fs+ypHSrKdpQZbeFQqhjUG+
         LYXua5Sked2mRA2ojmBTTrLWIroLmDKC3WgIMZ2lH5AP6YzNTuTENx7SQ5Fb7kB0+Rbo
         HWRg==
X-Forwarded-Encrypted: i=1; AJvYcCVBBn0IaCEpZLjmGCLhcL98XMW5Rq/bIu/ENhBPCeo8G7CXQFUWvoT6LesEj3nL+we07nSsY45T69EzuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhmNMvNCtbLVd+5NabUsyENAyJMOPFUeoKukWlA0LgiPBokYnn
	RDECddZf70WWE/Hw5uWIeNs+Vu4XRalQYYgxGbw23CEYiNNb3VI+
X-Gm-Gg: ASbGnctPL6kzzp8cOdTcmkFAud8G2AUJdeGVensVtG1oc4NqpBZgcZnL67vadark1KG
	evtA0Ky5hfulxSgYGkQ7WQwgrdXxJUszHldVM7DS3sEtKY9tn+/Adr1i4fN6kwyXAn8+bFxHvOj
	e+GpN+l+o4Gy+I3eQJZ5pmGj8aGbs52k0+pm6quT3fDdXc2oHirhVUnYRZFPZiZIMl9QdOxHXKe
	Z6TnUuAdnEIEjUKIMbw4yQ4GnQiISuIa7WhVwr9N3Xdi39n/A4I1dvmOJMLuX9K8kw=
X-Google-Smtp-Source: AGHT+IH4Lace1X98ZnWBEvY1cymlk72VSYPPy3ZXrC1eukrH19AoRSIo1KXtdbZz9LKA1vAlD6ac/A==
X-Received: by 2002:ac8:5a15:0:b0:471:a602:e75 with SMTP id d75a77b69052e-471bed7567dmr20929571cf.25.1739407147286;
        Wed, 12 Feb 2025 16:39:07 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471c2b06002sm1152481cf.77.2025.02.12.16.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 16:39:07 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/3] riscv: add ISA extension parsing for bfloat16 ISA extension
Date: Thu, 13 Feb 2025 08:38:46 +0800
Message-ID: <20250213003849.147358-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213003849.147358-1-inochiama@gmail.com>
References: <20250213003849.147358-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_163908_704299_E02C338A 
X-CRM114-Status: GOOD (  11.48  )
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

QWRkIHBhcnNpbmcgZm9yIFpmYm1pbiwgWnZmYmZtaW4sIFp2ZmJmd21hIElTQSBleHRlbnNpb24g
d2hpY2gKd2VyZSByYXRpZmllZCBpbiA0ZGMyM2Q2MiAoIkFkZGVkIENoYXB0ZXIgdGl0bGUgdG8g
QkYxNiIpIG9mCnRoZSByaXNjdi1pc2EtbWFudWFsLgoKU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFt
YW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgg
fCAgMyArKysKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDM1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCA4NjlkYTA4MjI1MmEuLjE0Y2MyOWYyYTcyMyAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtMTAwLDYgKzEwMCw5IEBACiAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWklDQ1JTRQkJOTEKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TVkFERQkJOTIKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9TVkFEVQkJOTMKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkJG
TUlOCQk5NAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRkJGTUlOCQk5NQorI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pWRkJGV01BCQk5NgogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5W
Q0ZHCTEyNwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggYzZiYTc1MDUzNmMzLi4zN2ZiNmIw
NzI4MWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTgwLDYgKzgwLDE1IEBAIGJvb2wgX19y
aXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShjb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0
bWFwLCB1bnNpZ25lZCBpCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChfX3Jpc2N2X2lzYV9leHRlbnNp
b25fYXZhaWxhYmxlKTsKIAorc3RhdGljIGludCByaXNjdl9leHRfZl9kZXBlbmRzKGNvbnN0IHN0
cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEsCisJCQkgICAgICAgY29uc3QgdW5zaWduZWQg
bG9uZyAqaXNhX2JpdG1hcCkKK3sKKwlpZiAoX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJs
ZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX2YpKQorCQlyZXR1cm4gMDsKKworCXJldHVybiAt
RVBST0JFX0RFRkVSOworfQorCiBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib21fdmFsaWRhdGUo
Y29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKIAkJCQkgICAgIGNvbnN0IHVu
c2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCiB7CkBAIC0xNDAsNiArMTQ5LDI4IEBAIHN0YXRpYyBp
bnQgcmlzY3ZfZXh0X3pjZl92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRh
ICpkYXRhLAogCXJldHVybiAtRVBST0JFX0RFRkVSOwogfQogCitzdGF0aWMgaW50IHJpc2N2X3Zl
Y3Rvcl9mX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEsCisJ
CQkJICAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKK3sKKwlpZiAoIUlTX0VOQUJM
RUQoQ09ORklHX1JJU0NWX0lTQV9WKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAoX19yaXNj
dl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pWRTMy
RikpCisJCXJldHVybiAwOworCisJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cit9CisKK3N0YXRpYyBp
bnQgcmlzY3ZfZXh0X3p2ZmJmd21hX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0
X2RhdGEgKmRhdGEsCisJCQkJICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXAp
Cit7CisJaWYgKF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklT
Q1ZfSVNBX0VYVF9aRkJGTUlOKSAmJgorCSAgICBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxh
YmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfWlZGQkZNSU4pKQorCQlyZXR1cm4gMDsKKwor
CXJldHVybiAtRVBST0JFX0RFRkVSOworfQorCiBzdGF0aWMgaW50IHJpc2N2X2V4dF9zdmFkdV92
YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAogCQkJCSAgICBj
b25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQogewpAQCAtMzQ1LDYgKzM3Niw3IEBAIGNv
bnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHphY2FzLCBSSVNDVl9JU0FfRVhUX1pBQ0FTKSwKIAlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6YXdycywgUklTQ1ZfSVNBX0VYVF9aQVdSUyksCiAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoemZhLCBSSVNDVl9JU0FfRVhUX1pGQSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFM
SURBVEUoemZiZm1pbiwgUklTQ1ZfSVNBX0VYVF9aRkJGTUlOLCByaXNjdl9leHRfZl9kZXBlbmRz
KSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmgsIFJJU0NWX0lTQV9FWFRfWkZIKSwKIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6ZmhtaW4sIFJJU0NWX0lTQV9FWFRfWkZITUlOKSwKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6Y2EsIFJJU0NWX0lTQV9FWFRfWkNBKSwKQEAgLTM3Nyw2ICs0MDksOSBA
QCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlf
X1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlNjRkLCBSSVNDVl9JU0FfRVhUX1pWRTY0RCwgcmlz
Y3ZfenZlNjRkX2V4dHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NGYsIFJJU0NW
X0lTQV9FWFRfWlZFNjRGLCByaXNjdl96dmU2NGZfZXh0cyksCiAJX19SSVNDVl9JU0FfRVhUX1NV
UEVSU0VUKHp2ZTY0eCwgUklTQ1ZfSVNBX0VYVF9aVkU2NFgsIHJpc2N2X3p2ZTY0eF9leHRzKSwK
KwlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFURSh6dmZiZm1pbiwgUklTQ1ZfSVNBX0VYVF9a
VkZCRk1JTiwgcmlzY3ZfdmVjdG9yX2ZfdmFsaWRhdGUpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
X1ZBTElEQVRFKHp2ZmJmd21hLCBSSVNDVl9JU0FfRVhUX1pWRkJGV01BLAorCQkJCSAgICAgIHJp
c2N2X2V4dF96dmZiZndtYV92YWxpZGF0ZSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZmaCwg
UklTQ1ZfSVNBX0VYVF9aVkZIKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmZobWluLCBSSVND
Vl9JU0FfRVhUX1pWRkhNSU4pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lT
QV9FWFRfWlZLQiksCi0tIAoyLjQ4LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
