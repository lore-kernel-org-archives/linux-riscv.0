Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F69AC54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 10:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nteHLSlKlmro6eQI+eJXX0XdAAMaz8x3jD6A+CBsb64=; b=MFVfTXevWz8Fin
	SbgXcz2ICbPytVmOJ9gs1LP1zbqgC2L7TGNVileJO5gud5Dnwh/uP80GjvaaI2tGtZg2WrML9V1lo
	QHhxvjeNqAYeHm31Xhy24HfGAkNtKnt06sJk/WQHJHWvXQSg+4bS9ybW2MVBiMZHjteXxfvVhvFlI
	0bz37/7LLq3bI7o4eFaTtNSf7wr7yu+pQUEiiTbRaLwbgFeucGtTI/tMrjgC1um1Ta24H1dNs4kmf
	mzqNbR7Ps1nqprMRdiYK8CGJYuDWvG7rSOpHVljNmKh20mBrDNWAo5Gvv8MJNDBfmLRAq/T5+amJU
	SvXe6avvC8Pu6smVPWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJr94-0000000AQfb-0Ebt;
	Tue, 27 May 2025 10:02:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJr6O-0000000AQG4-0O3H
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 10:00:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso2293492f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748340006; x=1748944806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJhXd+JjVeHIu6wwD9ZZEi2Ud9dEpWw6YK5yGe9aoM4=;
        b=CIk5Ac3kb5wC8PwEu28ge30yuLs3jUAkINCTeyVVVv6hCoDJFc81mAlRDwtgkw0KpM
         amkDiiv7bkAIz8IK3rcod2h48et7z9uLpKGYTT/oneZVG81fU75p60L4Xe6YpaCQ+h0y
         s8WszWYgcc5V5fV4IclyPTzusKsnZI00ec1ZxFdDxwszbsCx83e3OpS2BdlFxg0rIYq6
         MwmflG4EE3frVG/GzL35xOCAQdnsYkfeHRveJ/pqz8nfJWKcxx9hJKCyM7/dNUVdRMBI
         lJABhRPMTevXFdKuu1jC5QYPjf5jgeIznv/DboaFr/L56kxLQO17SJpp4UQSyKbMg9Lh
         zw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748340006; x=1748944806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJhXd+JjVeHIu6wwD9ZZEi2Ud9dEpWw6YK5yGe9aoM4=;
        b=jb05o+rkPNioSadSguBP3R0ASPPl/gGqRuTXjPajF6pWRgTz5VJIqwNsiWOLcbMCtA
         dil5iSwqeBoEmz+Wknw3vBbXc0rmPIT6RsGyqSs4OnosjLldu2rUvOc3/tWKR53vc8BM
         W51L7PBfKA4FX+HhjDDGD54rM1M2rDLh+pGUZalx8cXuQ3OhUz7dfhg4HjV65j/JiaUY
         NC93tKftqKObxv7EuAB74zt60MkbNSwvtqLR8u1cmwW0oqsELPCVyCXeZO1KaVt4+Ist
         owbT7zeabi9Gsln7gdE3oqt0bX+GQGaRTV3Xtnroz/hZ88Ok5WcBRBf8SaD8Axc4GtXy
         kUdg==
X-Gm-Message-State: AOJu0YyKLUfPuazSBN3+I8YL9upYMTF3k2y2UF4xy0PyWjthuY4FaGpK
	ClwcWnzSqKl91B4Wp9VdjIcpZNjgAWKVfj+wkMJZQNBskzUD7W5TmuSPo42/g5ZLdhg2X11NAv2
	hfvfC
X-Gm-Gg: ASbGnct4Lmo50gUInCoA5Of1799fMCaIfl87S2qtnfJltNGHE9A4EKOcZseZVEXkjuH
	MSz3trE+llecGZfJVj55aVfFflj0Km5LQBG7Vz/pAY7gA1cNcMIEdOcgULDO1tFWX5V2ipJ1Uh5
	4yX7hOcoGIhTtlSNeVK1PVc7/DVZzEAqNXKmr4JOkrpTyEpmum9e80y8Lcm0yJtZ5qbshFFzPEB
	wRhCKekxvjAP0Im/QaIrpaWiKAKgT2W5BOH/CXIVMYQzQnqvYMgucZIOJZvmoQhWA7frh0yB34c
	vU17OelgaLT8opaXh/K/UHytH4e0ExEgplnCpvoQfxyExJBshCx3rw1L
X-Google-Smtp-Source: AGHT+IGfCppXgpPamjMfVSNSnmDy40QGJRE8nqlxlFa1U9yBRe3jzsHtH6aIszOx0NKk7Xis+8Y/kQ==
X-Received: by 2002:a05:6000:2485:b0:3a4:e0e1:8d9b with SMTP id ffacd0b85a97d-3a4e0e18f4fmr1447154f8f.50.1748340005697;
        Tue, 27 May 2025 03:00:05 -0700 (PDT)
Received: from carbon-x1.lan ([2001:861:3380:2e20:6214:6f9b:8e4c:f723])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f38145eesm260382115e9.26.2025.05.27.03.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 03:00:04 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] riscv: cpufeature: add validation for zfa, zfh and zfhmin
Date: Tue, 27 May 2025 12:00:00 +0200
Message-ID: <20250527100001.33284-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_030008_129051_121C96E7 
X-CRM114-Status: GOOD (  10.38  )
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

VGhlc2UgZXh0ZW5zaW9ucyBkZXBlbmRzIG9uIHRoZSBGIG9uZS4gQWRkIGEgdmFsaWRhdGlvbiBj
YWxsYmFjawpjaGVja2luZyBmb3IgdGhlIEYgZXh0ZW5zaW9uIHRvIGJlIHByZXNlbnQuIE5vdyB0
aGF0IGV4dGVuc2lvbnMgYXJlCmNvcnJlY3RseSByZXBvcnRlZCB1c2luZyB0aGUgRi9EIHByZXNl
bmNlLCB3ZSBjYW4gcmVtb3ZlIHRoZQpoYXNfZnB1KCkgY2hlY2sgaW4gaHdwcm9iZV9pc2FfZXh0
MCgpLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
PgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgfCAgNiArKystLS0KIGFyY2gv
cmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgfCAxNCArKysrKystLS0tLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYwppbmRleCAyMDU0ZjZjNGIwYWUuLmRjMjU4ZGJlNGRkOSAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYwpAQCAtNDU3LDEwICs0NTcsMTAgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0
YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemFjYXMsIFJJU0NW
X0lTQV9FWFRfWkFDQVMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHphbHJzYywgUklTQ1ZfSVNB
X0VYVF9aQUxSU0MpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHphd3JzLCBSSVNDVl9JU0FfRVhU
X1pBV1JTKSwKLQlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmEsIFJJU0NWX0lTQV9FWFRfWkZBKSwK
KwlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFURSh6ZmEsIFJJU0NWX0lTQV9FWFRfWkZBLCBy
aXNjdl9leHRfZl9kZXBlbmRzKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFURSh6ZmJm
bWluLCBSSVNDVl9JU0FfRVhUX1pGQkZNSU4sIHJpc2N2X2V4dF9mX2RlcGVuZHMpLAotCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAotCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHpmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aRkhNSU4pLAorCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBX1ZBTElEQVRFKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgsIHJpc2N2X2V4dF9mX2RlcGVuZHMp
LAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpmaG1pbiwgUklTQ1ZfSVNBX0VYVF9a
RkhNSU4sIHJpc2N2X2V4dF9mX2RlcGVuZHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpjYSwg
UklTQ1ZfSVNBX0VYVF9aQ0EpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpjYiwg
UklTQ1ZfSVNBX0VYVF9aQ0IsIHJpc2N2X2V4dF96Y2FfZGVwZW5kcyksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEFfVkFMSURBVEUoemNkLCBSSVNDVl9JU0FfRVhUX1pDRCwgcmlzY3ZfZXh0X3pjZF92
YWxpZGF0ZSksCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCAyNDlhZWM4NTk0YTkuLmEzZGQz
MTM3OTI2MiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC0xNTEsMTQgKzE1MSwxMiBAQCBz
dGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAog
CQkJRVhUX0tFWShaVktUKTsKIAkJfQogCi0JCWlmIChoYXNfZnB1KCkpIHsKLQkJCUVYVF9LRVko
WkNEKTsKLQkJCUVYVF9LRVkoWkNGKTsKLQkJCUVYVF9LRVkoWkZBKTsKLQkJCUVYVF9LRVkoWkZC
Rk1JTik7Ci0JCQlFWFRfS0VZKFpGSCk7Ci0JCQlFWFRfS0VZKFpGSE1JTik7Ci0JCX0KKwkJRVhU
X0tFWShaQ0QpOworCQlFWFRfS0VZKFpDRik7CisJCUVYVF9LRVkoWkZBKTsKKwkJRVhUX0tFWSha
RkJGTUlOKTsKKwkJRVhUX0tFWShaRkgpOworCQlFWFRfS0VZKFpGSE1JTik7CiAKIAkJaWYgKElT
X0VOQUJMRUQoQ09ORklHX1JJU0NWX0lTQV9TVVBNKSkKIAkJCUVYVF9LRVkoU1VQTSk7Ci0tIAoy
LjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
