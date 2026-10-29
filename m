Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B047E606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4fmlGZ/5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gGvAiqyK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=njHnGcD9jwROPLtSImuYQOhy8fRG3/H0kNerq8BfeJo=; b=4fmlGZ/5ctbOIAyjZ4n8wY4oYz
	b+udZcQDzLBNwE1tMV2bXTLsPodUGBTrjPZBWogPb9f1elH8Y3bD9n8Yz3twCAYWobaQQ62jvq4tA
	QEs5h+fyaa+EZFvpphZgtfXQhhfIQ5r1RArPxdQcp2RLS5OOsG46DwgfZcOiVci8ZYqvNQ6RXD+Hf
	vx+OwEkYc6IgQf/pNtiCxNTRKcDGu4ydm2R5r+oiMU45B7brH+BROEVgReo1jeK15Q0UVu8bikds6
	OX2MLJFgKF5cvadVykyo3HHCbhmZlPwfqqmfZscEz0iX+CH6IRbHriKfoAlg74YDVvW/4qcb/OrQg
	8kr8Ju9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKt5-00000008ZuI-2uyc;
	Thu, 29 Oct 2026 07:49:27 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKt3-00000008ZtI-0K2a
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 07:49:26 +0000
Received: by mail-pj2-x09.google.com with SMTP id d9443c01a7336-2e7c8213b09so5736715ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793260164; x=1793864964; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3A4KroQ7g5mtKyNwDKv1PbMO1uQ0igFufvmY/wg4ak=;
        b=gGvAiqyK8xj8X3vYD2pTEeC8lknJIeQD8nmYlIVXXc/X485NOUKkSq+12ixZbStaA1
         zEhC8MCRCLSVNwi5Wyus2iFOpkNQryBy/npfiP/k8+zwtLBN58Y5aLjJjwduI++YuUpe
         kjW0kT+lAOPGfR9vpZz7jg9wHlrn3wwpp0RV/YrhFaJJb7vdef9iHGy6T+YPeqYD2cz5
         Wg7+WxINxAOAij1LxbiVcENseQsMgKkBVeLc1by29xbYOqKoSw4YIUQbvqOw0a7eoLHu
         L8/2Ke1G3xAaYH/372VBeab3oFKvBCHU+WVXmbzb7ImTvx6obSoSEM8FUrDKfBrVb/dB
         Em/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260164; x=1793864964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3A4KroQ7g5mtKyNwDKv1PbMO1uQ0igFufvmY/wg4ak=;
        b=gfkv5HSAZvPcoooVlZonAGYaFKMmyJZmXhdPpU8mxEhUjXKc5vIeu3EQ/uQrWQ/1eR
         /qfuZUPEqE+aLOiTt8MrKvjdJ41vt960X0nJ6vG7OPPW3JQHi5gVjfvDkt+ZPy6CiH44
         cm4Q7pvA9m3z3prMN+cA/1PnS4QLXgHuA9m37Qc1VdUbaboqaCqgOs/QT9l2tnpLv64Q
         eIbdhQl2bIFeb15+VnLpdIQFinSRyje8j7kxOWelExdEUKCcWwuStrvcVh/VIyO4eZXY
         2+ZB3+T7v9eFUqL5i8NJ7jKbPCXwcrreZxGOK2fVzSQSPbdoQy0FSgi7oC/QAJfni98H
         ODPA==
X-Forwarded-Encrypted: i=1; AKwUvBwOraR5VMyLidEUAbjD292Mf4kKbHYj8x1VlrqDNSvjVgA939YvYCAh0Cp7DgG+2dw8zu+xiZmTxqnGfA==@lists.infradead.org
X-Gm-Message-State: AFq9FYI2tzKtUSzPyTAxUZKd6Vk6UEFBxO064WJBUH2J/c+3nlnzsOhF
	45csRTvioHcw4P1wNIym8Az8izoCTCqVNmalM8g1VlseGjkNSKF9GhGxK/566EhRoYQ=
X-Gm-Gg: AYBFou1spAarlZU2/aylPd+fUP/Z8cGRPz29AfsVVhyouyDt+72z9W1Yr44xZO0kUVm
	Rmef6oMDAO8DgwEai1srB99BZXyE9vmQIDPbld7S2aFyPjyab6w1wGiRaW1H7GeSX2DQdvBJF2i
	p9HxN9Zb/zDni3Z26LVfWgUnYc49qOp2FsRyBScyBdLW5E8lq6kxvUPKvl7O3AWcdfleIcFIPVf
	SxUS0WgaULr3TocIS5WdgtUIi0dtjAoLpnQ0AynP5p63nzNsANl0lJdxSajY37l7m62mZPSlkET
	XosdTlB8SbTLZsdv8V8zSzZr4yqKvv/L3A/qP/vND56ODHJ9IFlVWBY3/BXWonV4ZTt/sNeWNks
	0LqjKDSijLuQTWgxeQAWfHK8zfMRE6QuFgJvX4e/SbKxjzv0ZlS/vsAuhglfc22peN1iDF6VQal
	kZyOEkXyxsVi6sxMs52Q6ErJQueGIxnk7ny8C+gCoPqGfYEcEUHCaLQYxkkiauvaMwkz7YTec4H
	9sX5fqlDDKkhN5xjth+T4DwVcVNd+O4xQMNvTD0EwHpN2orxBAXLYT1mx3AVRlrObaOEd9vWKFG
	H0XvNPGv3q3Lebt021/6/keBib01AgZ1/uUBrLoXGRw6/l1MXJkpXBNPPwfUcpz5bXAKgJ6yu4B
	eUR7V+H5Rnmus1zIQmapE1USOHX6W
X-Received: by 2002:a17:903:46c7:b0:2e5:e1de:9c3c with SMTP id d9443c01a7336-2eb00590642mr37850705ad.47.1793260163496;
        Thu, 29 Oct 2026 00:49:23 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm30598915ad.29.2026.10.29.00.49.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:49:22 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 01/11] riscv: add SBI SSE extension definitions
Date: Thu, 29 Oct 2026 15:48:43 +0800
Message-ID: <20261029074853.35467-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_004925_125839_81DD2D01 
X-CRM114-Status: GOOD (  10.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKQWRkIGRlZmluaXRp
b25zIGZvciB0aGUgU0JJIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIGV4dGVuc2lvbiBbMV0u
ClRoaXMgZXh0ZW5zaW9uIGVuYWJsZXMgdGhlIFNCSSB0byBpbmplY3QgZXZlbnRzIGludG8gc3Vw
ZXJ2aXNvciBzb2Z0d2FyZQptdWNoIGxpa2UgQVJNIFNERUkuCgpbMV0gaHR0cHM6Ly9saXN0cy5y
aXNjdi5vcmcvZy90ZWNoLXBycy9tZXNzYWdlLzUxNQoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpDby1kZXZlbG9wZWQtYnk6IEhpbWFuc2h1IENo
YXVoYW4gPGhpbWFuc2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4KU2lnbmVkLW9mZi1ieTog
SGltYW5zaHUgQ2hhdWhhbiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPgpDby1k
ZXZlbG9wZWQtYnk6IFpoYW5wZW5nIFpoYW5nIDx6aGFuZ3poYW5wZW5nLmphc3BlckBieXRlZGFu
Y2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBaaGFucGVuZyBaaGFuZyA8emhhbmd6aGFucGVuZy5qYXNw
ZXJAYnl0ZWRhbmNlLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgNjMg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IGZkNjI2NmE3YjMzLi5lYjIyZDc5
Y2VhNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAorKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCkBAIC00MCw2ICs0MCw3IEBAIGVudW0gc2JpX2V4dF9p
ZCB7CiAJU0JJX0VYVF9GV0ZUID0gMHg0NjU3NDY1NCwKIAlTQklfRVhUX01QWFkgPSAweDRENTA1
ODU5LAogCVNCSV9FWFRfREJUUiA9IDB4NDQ0MjU0NTIsCisJU0JJX0VYVF9TU0UgPSAweDUzNTM0
NSwKIAogCS8qIEV4cGVyaW1lbnRhbHMgZXh0ZW5zaW9ucyBtdXN0IGxpZSB3aXRoaW4gdGhpcyBy
YW5nZSAqLwogCVNCSV9FWFRfRVhQRVJJTUVOVEFMX1NUQVJUID0gMHgwODAwMDAwMCwKQEAgLTUw
OCw2ICs1MDksNjggQEAgZW51bSBzYmlfbXB4eV9ycG1pX2F0dHJpYnV0ZV9pZCB7CiAjZGVmaW5l
IFNCSV9NUFhZX0NIQU5fQ0FQX1NFTkRfV0lUSE9VVF9SRVNQCUJJVCg0KQogI2RlZmluZSBTQklf
TVBYWV9DSEFOX0NBUF9HRVRfTk9USUZJQ0FUSU9OUwlCSVQoNSkKIAorZW51bSBzYmlfZXh0X3Nz
ZV9maWQgeworCVNCSV9TU0VfRVZFTlRfQVRUUl9SRUFEID0gMCwKKwlTQklfU1NFX0VWRU5UX0FU
VFJfV1JJVEUsCisJU0JJX1NTRV9FVkVOVF9SRUdJU1RFUiwKKwlTQklfU1NFX0VWRU5UX1VOUkVH
SVNURVIsCisJU0JJX1NTRV9FVkVOVF9FTkFCTEUsCisJU0JJX1NTRV9FVkVOVF9ESVNBQkxFLAor
CVNCSV9TU0VfRVZFTlRfQ09NUExFVEUsCisJU0JJX1NTRV9FVkVOVF9JTkpFQ1QsCisJU0JJX1NT
RV9IQVJUX1VOTUFTSywKKwlTQklfU1NFX0hBUlRfTUFTSywKK307CisKK2VudW0gc2JpX3NzZV9z
dGF0ZSB7CisJU0JJX1NTRV9TVEFURV9VTlVTRUQgICAgID0gMCwKKwlTQklfU1NFX1NUQVRFX1JF
R0lTVEVSRUQgPSAxLAorCVNCSV9TU0VfU1RBVEVfRU5BQkxFRCAgICA9IDIsCisJU0JJX1NTRV9T
VEFURV9SVU5OSU5HICAgID0gMywKK307CisKKy8qIFNCSSBTU0UgRXZlbnQgQXR0cmlidXRlcy4g
Ki8KK2VudW0gc2JpX3NzZV9hdHRyX2lkIHsKKwlTQklfU1NFX0FUVFJfU1RBVFVTCQk9IDB4MDAw
MDAwMDAsCisJU0JJX1NTRV9BVFRSX1BSSU8JCT0gMHgwMDAwMDAwMSwKKwlTQklfU1NFX0FUVFJf
Q09ORklHCQk9IDB4MDAwMDAwMDIsCisJU0JJX1NTRV9BVFRSX1BSRUZFUlJFRF9IQVJUCT0gMHgw
MDAwMDAwMywKKwlTQklfU1NFX0FUVFJfRU5UUllfUEMJCT0gMHgwMDAwMDAwNCwKKwlTQklfU1NF
X0FUVFJfRU5UUllfQVJHCQk9IDB4MDAwMDAwMDUsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVE
X1NFUEMJPSAweDAwMDAwMDA2LAorCVNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHUwk9IDB4
MDAwMDAwMDcsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0E2CT0gMHgwMDAwMDAwOCwKKwlT
QklfU1NFX0FUVFJfSU5URVJSVVBURURfQTcJPSAweDAwMDAwMDA5LAorCisJU0JJX1NTRV9BVFRS
X01BWAkJPSAweDAwMDAwMDBBCit9OworCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNfU1RB
VEVfT0ZGU0VUCTAKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX1NUQVRVU19TVEFURV9NQVNLCQkweDMK
KyNkZWZpbmUgU0JJX1NTRV9BVFRSX1NUQVRVU19QRU5ESU5HX09GRlNFVAkyCisjZGVmaW5lIFNC
SV9TU0VfQVRUUl9TVEFUVVNfSU5KRUNUX09GRlNFVAkzCisKKyNkZWZpbmUgU0JJX1NTRV9BVFRS
X0NPTkZJR19PTkVTSE9UCUJJVCgwKQorCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRF
RF9GTEFHU19TU1RBVFVTX1NQUAlCSVQoMCkKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQ
VEVEX0ZMQUdTX1NTVEFUVVNfU1BJRQlCSVQoMSkKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVS
UlVQVEVEX0ZMQUdTX0hTVEFUVVNfU1BWCUJJVCgyKQorI2RlZmluZSBTQklfU1NFX0FUVFJfSU5U
RVJSVVBURURfRkxBR1NfSFNUQVRVU19TUFZQCUJJVCgzKQorI2RlZmluZSBTQklfU1NFX0FUVFJf
SU5URVJSVVBURURfRkxBR1NfU1NUQVRVU19TUEVMUAlCSVQoNCkKKyNkZWZpbmUgU0JJX1NTRV9B
VFRSX0lOVEVSUlVQVEVEX0ZMQUdTX1NTVEFUVVNfU0RUCUJJVCg1KQorCisjZGVmaW5lIFNCSV9T
U0VfRVZFTlRfTE9DQUxfSElHSF9QUklPX1JBUwkweDAwMDAwMDAwCisjZGVmaW5lIFNCSV9TU0Vf
RVZFTlRfTE9DQUxfRE9VQkxFX1RSQVAJCTB4MDAwMDAwMDEKKyNkZWZpbmUgU0JJX1NTRV9FVkVO
VF9HTE9CQUxfSElHSF9QUklPX1JBUwkweDAwMDA4MDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRf
TE9DQUxfUE1VX09WRVJGTE9XCTB4MDAwMTAwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NB
TF9MT1dfUFJJT19SQVMJMHgwMDEwMDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9M
T1dfUFJJT19SQVMJMHgwMDEwODAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1NPRlRX
QVJFX0lOSkVDVEVECTB4ZmZmZjAwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUxfU09G
VFdBUkVfSU5KRUNURUQJMHhmZmZmODAwMAorCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfUExBVEZP
Uk0JCUJJVCgxNCkKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUwJCUJJVCgxNSkKKwogLyog
U0JJIGRlYnVnIHRyaWdnZXJzIGZ1bmN0aW9uIElEcyAqLwogZW51bSBzYmlfZXh0X2RidHJfZmlk
IHsKIAlTQklfRVhUX0RCVFJfTlVNX1RSSUdHRVJTID0gMCwKLS0gCjIuNTAuMSAoQXBwbGUgR2l0
LTE1NSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
