Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0698BC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kppsqxsp/y67gEBkQObO53mQ5kam5g3H18Gtr4/bO84=; b=MWe8fWTkRsHSdQ
	Z7S3+C+8+5+qAEeMbD8wYMkP13k+xrbY6k/v4zHWxyJk1M7AaPSvKybGpUZx4UnK00nWVOS34Lkpu
	ZtS3GLPIqYD4p9qk9A3bZ8XU72M6Yq50A3Z6DykXrH6tA8k0IOSgzcAZ4ogLI1BlU49G6X6I3dX9i
	fkMjpqzvU3w1uAvsrZ2o6R8cXfoiL7sfkZNEe2wnSwhcjrJdjccQ5NZVznZu3OWKY8pAe1NRsJaGh
	m2ifYwLIzn07BP1ytuDxz47XyB8TtP6XKfhAiAj5NlghUtmVoxc/uoJy4rKO0U8gJyZwSY2qkeClo
	BUV41U4s9r1VTSEeYe+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80SK-0000000EuGf-3ARx;
	Thu, 24 Apr 2025 17:33:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80SI-0000000EuF9-1fPR
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:33:47 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-227a8cdd241so18090195ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516025; x=1746120825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqV/L1fucoXh0zEq3ZbEkv0iZBTOf63rS7eOzOMDARE=;
        b=MR415BQnKSlAIPMdxj8qqqiAtYiG+29HnWOSUrn18JvWUGWwMCmuB/QEzd6arMORha
         pie3BhVAtDZp6ts8jGIRuTQgEZWUf33TPvbHilG4PcXV0y3fEFImiiaAak3jH8BgXDUR
         B47i/FxzZYr4mCFX6a3zrTGKybDWG/Wz0mjfB3w4T8mLK+TgnI4JVOmr893J7r/cfcQP
         GGuqAuNo8zCgDY3eBDBGHmtsinFFPiO/gW6TYedRSuILQgJ0x4SzVhkm2L5bOj7UeMpZ
         xrCs68pxYprcKLfefrh7fm8i/HL14mh5dHQiQNNwAm261+GdnD4x8tR+tQZZ5V/4Qm2e
         XJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516025; x=1746120825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqV/L1fucoXh0zEq3ZbEkv0iZBTOf63rS7eOzOMDARE=;
        b=rCleiwa0/yCIsGl0PvZ9C562pNs3q+xIjE9yJgp/jY3LQVY+d99nMycvTJFeuw1SHw
         dWlBoM09nA2RyglX1zGWcaWNcjik0yP9qpjzMGZEypzXnoNkG5MrdngvJEvhoRQlF9Bw
         9uoXI2E5AZqdaO46ctRt0Wkk041oq26U6iHUNxsXRDDZyuWBwYahyr8KWUMa5kSidNgV
         buFhdBBplyjc83Gw2og+LhMLXCQREsCbQJWEaVrtVUdbGUWF3JvLWg8by46iKLQOVd3e
         EHRDroEglHniyYDWPKZtPyOfn40N0oKqDudIMdVl0ix60COmReOx93TKF0wYgmP0w5wM
         dMpg==
X-Forwarded-Encrypted: i=1; AJvYcCVMNLuHU1DOu/rhDv6GjfogVv8NCNb/GgWJvq2C/nEakPBJQjG+6XYTQ7KPwVdxN9lWl3NawtLKFS89VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSp/WIB6vk4c1jHrRyJN9OK7jbRhkVJKT2FxtLBb2k32fc5lwf
	QpVj2It4GHbC7iIuGH1i/TqLIXl2XlvhcvvWJJEU9DB2lEn+LON08dnUeSW3JOY=
X-Gm-Gg: ASbGncu++Eo+Fo+jve83Y9kbvsEvo1iAjMRSFMEME6HJsPofFLcAyS5rNzH7OGUefyY
	xnzZdDtRgdgaOVfwL3MA6zFDkX2L2oBJa7If8n8OLzOZmJXtj6Fby4pt2hw0OX52zx0W6VGP8Il
	3ZG9CrL2GIzpAgb/rVH4IOa+EV3TiuqVUXuvPWCsyDVmSEkR/skmMjVmgzBSPM5/WaSAMvPq6st
	BELI9flOHa14QZ3jTUKLBrGtvEzdvbg8l6PNSYg2F/jztqolAkzRJGlftt6KVzj1UpU0+zYWxHE
	jTe43g80uicpLf8jrDjOMur9rmypldcO1YqaJO6Svw==
X-Google-Smtp-Source: AGHT+IGoXel2WMkjiTK/q7g1/yBkqNZ84Lmsw32W4+SLXcM2BGBaWrGqIbaWGI5EV1R0ZMMR1eKW3w==
X-Received: by 2002:a17:903:2445:b0:220:d078:eb33 with SMTP id d9443c01a7336-22db3d71d34mr56439695ad.36.1745516025550;
        Thu, 24 Apr 2025 10:33:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:33:44 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 01/14] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
Date: Thu, 24 Apr 2025 19:31:48 +0200
Message-ID: <20250424173204.1948385-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103346_434883_9C6CFEBE 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

VGhlIEZpcm13YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQg
b2YgdGhlIFNCSSAzLjAKc3BlY2lmaWNhdGlvbi4gQWRkIFNCSSBkZWZpbml0aW9ucyB0byB1c2Ug
dGhpcyBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KVGVzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4KUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ni
aS5oCmluZGV4IDNkMjUwODI0MTc4Yi4uYmIwNzdkMGM5MTJmIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
QEAgLTM1LDYgKzM1LDcgQEAgZW51bSBzYmlfZXh0X2lkIHsKIAlTQklfRVhUX0RCQ04gPSAweDQ0
NDI0MzRFLAogCVNCSV9FWFRfU1RBID0gMHg1MzU0NDEsCiAJU0JJX0VYVF9OQUNMID0gMHg0RTQx
NDM0QywKKwlTQklfRVhUX0ZXRlQgPSAweDQ2NTc0NjU0LAogCiAJLyogRXhwZXJpbWVudGFscyBl
eHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCiAJU0JJX0VYVF9FWFBFUklN
RU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLApAQCAtNDAyLDYgKzQwMywzMyBAQCBlbnVtIHNiaV9l
eHRfbmFjbF9mZWF0dXJlIHsKICNkZWZpbmUgU0JJX05BQ0xfU0hNRU1fU1JFVF9YKF9faSkJCSgo
X19yaXNjdl94bGVuIC8gOCkgKiAoX19pKSkKICNkZWZpbmUgU0JJX05BQ0xfU0hNRU1fU1JFVF9Y
X0xBU1QJCTMxCiAKKy8qIFNCSSBmdW5jdGlvbiBJRHMgZm9yIEZXIGZlYXR1cmUgZXh0ZW5zaW9u
ICovCisjZGVmaW5lIFNCSV9FWFRfRldGVF9TRVQJCTB4MAorI2RlZmluZSBTQklfRVhUX0ZXRlRf
R0VUCQkweDEKKworZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgeworCVNCSV9GV0ZUX01JU0FMSUdO
RURfRVhDX0RFTEVHCQk9IDB4MCwKKwlTQklfRldGVF9MQU5ESU5HX1BBRAkJCT0gMHgxLAorCVNC
SV9GV0ZUX1NIQURPV19TVEFDSwkJCT0gMHgyLAorCVNCSV9GV0ZUX0RPVUJMRV9UUkFQCQkJPSAw
eDMsCisJU0JJX0ZXRlRfUFRFX0FEX0hXX1VQREFUSU5HCQk9IDB4NCwKKwlTQklfRldGVF9QT0lO
VEVSX01BU0tJTkdfUE1MRU4JCT0gMHg1LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX1NUQVJU
CQk9IDB4NiwKKwlTQklfRldGVF9MT0NBTF9SRVNFUlZFRF9FTkQJCT0gMHgzZmZmZmZmZiwKKwlT
QklfRldGVF9MT0NBTF9QTEFURk9STV9TVEFSVAkJPSAweDQwMDAwMDAwLAorCVNCSV9GV0ZUX0xP
Q0FMX1BMQVRGT1JNX0VORAkJPSAweDdmZmZmZmZmLAorCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VS
VkVEX1NUQVJUCQk9IDB4ODAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX0VORAkJ
PSAweGJmZmZmZmZmLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVAkJPSAweGMwMDAw
MDAwLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9FTkQJCT0gMHhmZmZmZmZmZiwKK307CisK
KyNkZWZpbmUgU0JJX0ZXRlRfUExBVEZPUk1fRkVBVFVSRV9CSVQJCUJJVCgzMCkKKyNkZWZpbmUg
U0JJX0ZXRlRfR0xPQkFMX0ZFQVRVUkVfQklUCQlCSVQoMzEpCisKKyNkZWZpbmUgU0JJX0ZXRlRf
U0VUX0ZMQUdfTE9DSwkJCUJJVCgwKQorCiAvKiBTQkkgc3BlYyB2ZXJzaW9uIGZpZWxkcyAqLwog
I2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCiAjZGVmaW5lIFNCSV9TUEVDX1ZF
UlNJT05fTUFKT1JfU0hJRlQJMjQKQEAgLTQxOSw2ICs0NDcsMTEgQEAgZW51bSBzYmlfZXh0X25h
Y2xfZmVhdHVyZSB7CiAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9TVEFSVEVEIC03CiAjZGVmaW5l
IFNCSV9FUlJfQUxSRUFEWV9TVE9QUEVEIC04CiAjZGVmaW5lIFNCSV9FUlJfTk9fU0hNRU0JLTkK
KyNkZWZpbmUgU0JJX0VSUl9JTlZBTElEX1NUQVRFCS0xMAorI2RlZmluZSBTQklfRVJSX0JBRF9S
QU5HRQktMTEKKyNkZWZpbmUgU0JJX0VSUl9USU1FT1VUCQktMTIKKyNkZWZpbmUgU0JJX0VSUl9J
TwkJLTEzCisjZGVmaW5lIFNCSV9FUlJfREVOSUVEX0xPQ0tFRAktMTQKIAogZXh0ZXJuIHVuc2ln
bmVkIGxvbmcgc2JpX3NwZWNfdmVyc2lvbjsKIHN0cnVjdCBzYmlyZXQgewotLSAKMi40OS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
