Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E397EC5B555
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VnlSvNUNnbfrNrNEwtjT7623V8k5oymNiIty95IlEo=; b=xwS6VqBl7tG4Jf
	7Ac+UdfmfuxWT0qXEfUuRGkb0zmGtYtlZ0zctNC1nQJz9BMQ8eHtrk8n3l75uVpCp+xLFV1iGWnD4
	dR/JXPa0vl+gNaf48bbHVnLZ/0JL5lf2FyM3navTKp7W9Nibylr9a0Qj3bGt7Le7V0+hl9aogmtfi
	1aiB/rKAocD84oVg1CzFAbtoh0ZdCc9ZN2wkj8kLXsQInvjoi7wrxrHmc1riOq92w2U+6DsVaMAt2
	is43LVvm/jy7tb9ViR2uIVReXGSwjkScy/jQqQ+zfjPRZdD8wj7Vzu3CdTy/fghmq4Y/uK8bvpIsr
	lYz+NfeDAZtEQ/cQVeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBVz-00000008gzF-0zmT;
	Mon, 02 Jun 2025 20:12:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMB5Q-00000008Znc-1Siy
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 19:44:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2352e3db62cso31006205ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 12:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748893483; x=1749498283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db/Ed44rvRu053l+IvlTe4ds9o8zgJplXr/Yk0XQfi8=;
        b=YXSVUeJnFp4awllHGcOGW5mAm+v1cfD/GTvxZbraF1hlDzgqORN4OIkaBqU9Pj09U9
         F+aYDaieR2vP83HkSmy6WCiDaXQjGaGH7UbXTc8cuK8exJTkcpLhtsjbIdQBGe67Nzup
         HXbHee9zuqxDK1i3IckCRF2yGjEbRJsQpWCUZE/bZQOeJ7tysPzkCJ79K0ESzeOijYWx
         0uakyeNwei+nE+bdx9OMncMUXUPU3Pbnr/pMFxXmF+Kaiz2TePS3dkAsckskvohXG0ZE
         xEWXVbILUtyKK+DZMun7QWL+Da8MQ6hKZj2M3nHD8VnX2/oAScD+mCTcx3Tdr3vBfvK7
         mhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893483; x=1749498283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db/Ed44rvRu053l+IvlTe4ds9o8zgJplXr/Yk0XQfi8=;
        b=CfhjhjUPtf2X4xVOHMcJYDjtNJPE+6oYUkUlOjL0eEatdL3ru6pzeQF9Z3gieo5AzU
         +0S9KYeUCubsX+VW7+I95PK4TyZg8/WY38NAp/idt7ySFlRK5GOpm1jUgFVmaJPDHjh9
         oqfTiWlRF9QicBWt6sympmx4pwIWkCy2k6be0lmjuwHqColiw40nH7Xi79ExvCL2YP0w
         cIxwwECufySSF8zDUiTaRVJpPh/byo8+5SpoGu9V+UDHMfaXTrQ2LG+WGnXi5WgT7SEd
         ZFioLPCTURKVKaLqCyF1UckSLXFeRoDXSuLEGgN941UNavedFce71drkDj8I04Gb1P+p
         WwoA==
X-Gm-Message-State: AOJu0Yw5Mmjs087IRjT2ZB2O5kF/Zrv0V8FqLvjD5QcdlKwhBk8iygrm
	75x7PMp+JSw2g56xVi3FrxP9tSbSpHMLXg3oTtq5M4GzvvNJsf9kQu+0ZvLCXYQpmmmQSCmR7fN
	lmlCYUic=
X-Gm-Gg: ASbGncu0QFyXLkKI7+5klWx+4CHBBFqaH7ZySDGkIf1h6i2DSKc0wbhXCQo3LAbHrrE
	evjhe0c78QikeTnyDsLGE9BIx8Ss7a/zeTHYziIqp5fCBdrruYtCc5p9Kxm4TnzmEHS+FlZWJJH
	QMN9Lmq45FIOseKqUhuee1tyW7HT2iE36HQcAEF7hzXjKU6M6b57GR5N/0Qy8Z8ApX/pUVgzGl2
	HPMfyOZVNKhswHHAt56dJ1VTcva2Tdsmi2yq1MA8SZ2QlBVBwjlz/h5ddWA8qIr93rF0ayxBSpq
	IQxuyTt3qBcqkBo3MPmJX2cxQ6aFNAOj83no86LgojDMgmIFOn1B
X-Google-Smtp-Source: AGHT+IFbuzLN7KFe7fs8Vc2nBOhFcNV/tot07VDwvWe1dI2/MhaIzuoXM1xe//BMSqSz86QiYuqiUQ==
X-Received: by 2002:a17:902:e80e:b0:234:d2fb:2d0e with SMTP id d9443c01a7336-235289c81eamr244455005ad.10.1748893483100;
        Mon, 02 Jun 2025 12:44:43 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm74589615ad.97.2025.06.02.12.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:44:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 3/3] riscv: uaccess: do not do misaligned accesses in get/put_user()
Date: Mon,  2 Jun 2025 21:39:16 +0200
Message-ID: <20250602193918.868962-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_124444_390175_E234A7BB 
X-CRM114-Status: GOOD (  15.36  )
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

RG9pbmcgbWlzYWxpZ25lZCBhY2Nlc3MgdG8gdXNlcnNwYWNlIG1lbW9yeSB3b3VsZCBtYWtlIGEg
dHJhcCBvbgpwbGF0Zm9ybSB3aGVyZSBpdCBpcyBlbXVsYXRlZC4gTGF0ZXN0IGZpeGVzIHJlbW92
ZWQgdGhlIGtlcm5lbApjYXBhYmlsaXR5IHRvIGRvIHVuYWxpZ25lZCBhY2Nlc3NlcyB0byB1c2Vy
c3BhY2UgbWVtb3J5IHNhZmVseSBzaW5jZQppbnRlcnJ1cHRzIGFyZSBrZXB0IGRpc2FibGVkIGF0
IGFsbCB0aW1lIGR1cmluZyB0aGF0LiBUaHVzIGRvaW5nIHNvCndvdWxkIGNyYXNoIHRoZSBrZXJu
ZWwuCgpTdWNoIGJlaGF2aW9yIHdhcyBkZXRlY3RlZCB3aXRoIEdFVF9VTkFMSUdOX0NUTCgpIHRo
YXQgd2FzIGRvaW5nCmEgcHV0X3VzZXIoKSB3aXRoIGFuIHVuc2lnbmVkIGxvbmcqIGFkZHJlc3Mg
dGhhdCBzaG91bGQgaGF2ZSBiZWVuIGFuCnVuc2lnbmVkIGludCouIFJlZW5hYmxpbmcga2VybmVs
IG1pc2FsaWduZWQgYWNjZXNzIGVtdWxhdGlvbiBpcyBhIGJpdApyaXNreSBhbmQgaXQgd291bGQg
YWxzbyBkZWdyYWRlIHBlcmZvcm1hbmNlcy4gUmF0aGVyIHRoYW4gZG9pbmcgdGhhdCwKd2Ugd2ls
bCB0cnkgdG8gYXZvaWQgYW55IG1pc2FsaWduZWQgYWNjZXNzZWQgYnkgdXNpbmcgY29weV9mcm9t
L3RvX3VzZXIoKQp3aGljaCBkb2VzIG5vdCBkbyBhbnkgbWlzYWxpZ25lZCBhY2Nlc3Nlcy4gVGhp
cyBjYW4gYmUgZG9uZSBvbmx5IGZvcgohQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9B
Q0NFU1MgYW5kIHRodXMgYWxsb3dzIHRvIG9ubHkgZ2VuZXJhdGUKYSBiaXQgbW9yZSBjb2RlIGZv
ciB0aGlzIGNvbmZpZy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDIzICsr
KysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nl
c3MuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCmluZGV4IDA0NmRlN2NlZDA5
Yy4uZDQ3MmRhNDQ1MGU2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nl
c3MuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAtMTY5LDggKzE2
OSwxOSBAQCBkbyB7CQkJCQkJCQlcCiAKICNlbmRpZiAvKiBDT05GSUdfNjRCSVQgKi8KIAordW5z
aWduZWQgbG9uZyBfX211c3RfY2hlY2sgX19hc21fY29weV90b191c2VyX3N1bV9lbmFibGVkKHZv
aWQgX191c2VyICp0bywKKwljb25zdCB2b2lkICpmcm9tLCB1bnNpZ25lZCBsb25nIG4pOwordW5z
aWduZWQgbG9uZyBfX211c3RfY2hlY2sgX19hc21fY29weV9mcm9tX3VzZXJfc3VtX2VuYWJsZWQo
dm9pZCAqdG8sCisJY29uc3Qgdm9pZCBfX3VzZXIgKmZyb20sIHVuc2lnbmVkIGxvbmcgbik7CisK
ICNkZWZpbmUgX19nZXRfdXNlcl9ub2NoZWNrKHgsIF9fZ3VfcHRyLCBsYWJlbCkJCQlcCiBkbyB7
CQkJCQkJCQlcCisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdO
RURfQUNDRVNTKSAmJglcCisJICAgICFJU19BTElHTkVEKCh1aW50cHRyX3QpX19ndV9wdHIsIHNp
emVvZigqX19ndV9wdHIpKSkgewlcCisJCWlmIChfX2FzbV9jb3B5X2Zyb21fdXNlcl9zdW1fZW5h
YmxlZCgmKHgpLCBfX2d1X3B0ciwgc2l6ZW9mKCpfX2d1X3B0cikpKSBcCisJCQlnb3RvIGxhYmVs
OwkJCQlcCisJCWJyZWFrOwkJCQkJCVwKKwl9CQkJCQkJCVwKIAlzd2l0Y2ggKHNpemVvZigqX19n
dV9wdHIpKSB7CQkJCVwKIAljYXNlIDE6CQkJCQkJCVwKIAkJX19nZXRfdXNlcl9hc20oImxiIiwg
KHgpLCBfX2d1X3B0ciwgbGFiZWwpOwlcCkBAIC0yOTcsNiArMzA4LDEzIEBAIGRvIHsJCQkJCQkJ
CVwKIAogI2RlZmluZSBfX3B1dF91c2VyX25vY2hlY2soeCwgX19ndV9wdHIsIGxhYmVsKQkJCVwK
IGRvIHsJCQkJCQkJCVwKKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VO
QUxJR05FRF9BQ0NFU1MpICYmCVwKKwkgICAgIUlTX0FMSUdORUQoKHVpbnRwdHJfdClfX2d1X3B0
ciwgc2l6ZW9mKCpfX2d1X3B0cikpKSB7CVwKKwkJX19pbnR0eXBlKHgpIHZhbCA9IChfX2ludHR5
cGUoeCkpeDsJCQlcCisJCWlmIChfX2FzbV9jb3B5X3RvX3VzZXJfc3VtX2VuYWJsZWQoX19ndV9w
dHIsICYodmFsKSwgc2l6ZW9mKCpfX2d1X3B0cikpKSBcCisJCQlnb3RvIGxhYmVsOwkJCQlcCisJ
CWJyZWFrOwkJCQkJCVwKKwl9CQkJCQkJCVwKIAlzd2l0Y2ggKHNpemVvZigqX19ndV9wdHIpKSB7
CQkJCVwKIAljYXNlIDE6CQkJCQkJCVwKIAkJX19wdXRfdXNlcl9hc20oInNiIiwgKHgpLCBfX2d1
X3B0ciwgbGFiZWwpOwlcCkBAIC00NTAsMTEgKzQ2OCw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1
c2VyX2FjY2Vzc19yZXN0b3JlKHVuc2lnbmVkIGxvbmcgZW5hYmxlZCkgeyB9CiAJKHgpID0gKF9f
Zm9yY2UgX190eXBlb2ZfXygqKHB0cikpKV9fZ3VfdmFsOwkJCVwKIH0gd2hpbGUgKDApCiAKLXVu
c2lnbmVkIGxvbmcgX19tdXN0X2NoZWNrIF9fYXNtX2NvcHlfdG9fdXNlcl9zdW1fZW5hYmxlZCh2
b2lkIF9fdXNlciAqdG8sCi0JY29uc3Qgdm9pZCAqZnJvbSwgdW5zaWduZWQgbG9uZyBuKTsKLXVu
c2lnbmVkIGxvbmcgX19tdXN0X2NoZWNrIF9fYXNtX2NvcHlfZnJvbV91c2VyX3N1bV9lbmFibGVk
KHZvaWQgKnRvLAotCWNvbnN0IHZvaWQgX191c2VyICpmcm9tLCB1bnNpZ25lZCBsb25nIG4pOwot
CiAjZGVmaW5lIHVuc2FmZV9jb3B5X3RvX3VzZXIoX2RzdCwgX3NyYywgX2xlbiwgbGFiZWwpCQkJ
XAogCWlmIChfX2FzbV9jb3B5X3RvX3VzZXJfc3VtX2VuYWJsZWQoX2RzdCwgX3NyYywgX2xlbikp
CQlcCiAJCWdvdG8gbGFiZWw7Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
