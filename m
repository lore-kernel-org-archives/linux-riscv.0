Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507E606A32F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wyIQtWKk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AHJPaNt3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8YLiTH4j/cFVJ8oiGdi1aD/+M6UX0bdV8z87KdFKU5g=; b=wyIQtWKkoRFIC6+IMWRahOgt4X
	HWMBxV8cyQWhQicx4TGosGeyLBiAZ0dSKhiANlqZdUJZQNZknSxh536FYP4+H42Cakvs/GNheubJQ
	54ACMbmx4k3L0bfS+FDgCUwptUXqcjHnlOdC7qhYL0PUVinQWfPAiBOmVlSObcWcakyUJfDYJeomY
	UYByRm/lpToCImG9aCri7IyWyVpGJnz354+DRnZ3MhpolXR0o02d482Z0OTky2gpjLGo5q+kBDzuZ
	Bt+2HxHtb469jXxspHvlo8arkMx4Fbt4PrLupuKEkL8/PaMswjKYvPK5lkwKnUlHfCAYbSJYT5NJE
	/Q1xtu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0wj-0000000Bmll-05pr;
	Thu, 19 Nov 2026 12:08:57 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0wf-0000000Bml2-1bGz
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 12:08:54 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-38190551625so3687909eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 04:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090132; x=1795694932; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mw3u54M9upMKnOTAPQin/ZVJiGtWbtiuAdgAa3Btsi4=;
        b=AHJPaNt30rTyDzgXC+bdnDvkc/UZmbuVJ8rAHfkpm8Q9x638d3OHLvrq2jzBIVgER/
         ZRvbmep1LRtUNnJff7qkrZZkYHWaCADsyu6CJ36X3KWqJUuiWEkl9qZp72MrXD2/7/XV
         rsJ2t/Okw0q/EeKC4s4JWv+b2W6/IHPldL81OA6IyLCnrZ66wtJpXvECklV/P/mi+Dwq
         yuoL2XZ+2tlEzma6eVnbxOXrpYee28i6uh9ujrSH1tR84cRqRl8A4pWI8hME5rSRmr1L
         dxG2MEg9+op1Tt8WkS/LNelfDO2cB4DFBCjsbXSnGXp2pNQgLr7EF5AwJKoCGVzNTY+5
         Hd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090132; x=1795694932;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw3u54M9upMKnOTAPQin/ZVJiGtWbtiuAdgAa3Btsi4=;
        b=F5M7ZuZLkjMMr/4VXDGL4qi5AGzwBxJ3QURRyui8lL68P17Bx/kcga8Gux42KkpQax
         MAQpiBEDlGTeBtgfvNUOWlmsVCp2vPmfbKSmlTb41mz2CVUK6uHRyl2CkFi03W0h4DVm
         LGPg1Yav43pgmCF0MPGqHoENZUDsVYYB1XTrHc6lJp+UkEWWn2cEx8tyIl2hGlQ113pE
         Av0TZrinFL/XxGM1ha/wbooPl63imuZbbJZWs3SGFH3UT0N+tHhBNv663U4xo7TRChY7
         a2QM1RHlifr8j7RZ2TNgv4EJuconudjfBj8LM03XdsgPt1rd0saiMvZClNocyO998BRI
         VK8Q==
X-Forwarded-Encrypted: i=1; AL+hErE5VRbXkN25CAw6T0fp217s+V1clDgGxdrt964KBoYrmeFOpPx0ylzG1tPTG9u4BR1Ob4HpReYJOo2Olg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9RU/tL23YNgEOV1+zPBACrWwTOGC4Fdxip580mdHw8/GBhHzWq
	TmP7ztnsVCfjNBa2s/W4LIHQYieCzlv6ZT8zH36dZSGOpwUyMmlLRLNY5o2PbpX5SOg=
X-Gm-Gg: AZFdTZcxUVEwn3cXrpnmEb7l6TqZkmqeVnDlTTvM7865qMw4MYECsrd8hQ/AsGybKCa
	FMZWHUgBrdj/SV05I7HSVsNtlK0wssR/SpcNDm1qa7VpfqKEte5D7X0jJfMQfqJIa8AMcPylFZ7
	KM87HhCNKEtSOUQysvoj7PSJGYyAKbdZLr6pjj6yhrum5EHXaEiAamFTC0vffQ3F7pAPSgfchGw
	sTH2pTXbOXlMnmvSp6K+ksIeccPI1K4RbFMZ5Z7+IrV5//C769TKUvNSANpNeziMFEeAND/ctwN
	Gipj3xTmbNd/ukJPB/j5+QBgdxMzVs7X2YKeTAn6t9hhYCW080EVdWUfsnSextyYOsE3FCYHQk/
	bcaXtfxkd1lbmzfoBwBK0RTOMtTToORFW6hqaFxuv5K79gIPVfTTDrYljPwspDc6bDSFQACT5BB
	lgi08W5ZRmnkf5F5BjCkjLwyLOXYoiPXX/sR17BuYXnLVUfyg4sCvdaKI553UttAIv79FSl+pUO
	QlbQdAIuXugJBETH6n2oo/br7NKIh1quYY/H11dp/jGdRm6biXRWqKVa0QPiM3dPw0pFqLokRy3
	QxluqLmjuzdRmgJ64JIAzRbwLetTSMO185ZstxwxsOsROU84F5XDtejU50I7ZqUOtK8NYaMj3Om
	BVfhPn9A=
X-Received: by 2002:a05:7300:b092:b0:374:ba43:ae2e with SMTP id 5a478bee46e88-38280078014mr5600153eec.14.1795090132300;
        Thu, 19 Nov 2026 04:08:52 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.08.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:08:51 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 01/11] riscv: add SBI SSE extension definitions
Date: Thu, 19 Nov 2026 20:08:25 +0800
Message-ID: <20261119120824.13969-14-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_040853_430381_7717A4D1 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IGZkNjI2NmE3YjMzOS4uZWIyMmQ3
OWNlYTYxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAgLTQwLDYgKzQwLDcgQEAgZW51bSBzYmlfZXh0
X2lkIHsKIAlTQklfRVhUX0ZXRlQgPSAweDQ2NTc0NjU0LAogCVNCSV9FWFRfTVBYWSA9IDB4NEQ1
MDU4NTksCiAJU0JJX0VYVF9EQlRSID0gMHg0NDQyNTQ1MiwKKwlTQklfRVhUX1NTRSA9IDB4NTM1
MzQ1LAogCiAJLyogRXhwZXJpbWVudGFscyBleHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlz
IHJhbmdlICovCiAJU0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLApAQCAt
NTA4LDYgKzUwOSw2OCBAQCBlbnVtIHNiaV9tcHh5X3JwbWlfYXR0cmlidXRlX2lkIHsKICNkZWZp
bmUgU0JJX01QWFlfQ0hBTl9DQVBfU0VORF9XSVRIT1VUX1JFU1AJQklUKDQpCiAjZGVmaW5lIFNC
SV9NUFhZX0NIQU5fQ0FQX0dFVF9OT1RJRklDQVRJT05TCUJJVCg1KQogCitlbnVtIHNiaV9leHRf
c3NlX2ZpZCB7CisJU0JJX1NTRV9FVkVOVF9BVFRSX1JFQUQgPSAwLAorCVNCSV9TU0VfRVZFTlRf
QVRUUl9XUklURSwKKwlTQklfU1NFX0VWRU5UX1JFR0lTVEVSLAorCVNCSV9TU0VfRVZFTlRfVU5S
RUdJU1RFUiwKKwlTQklfU1NFX0VWRU5UX0VOQUJMRSwKKwlTQklfU1NFX0VWRU5UX0RJU0FCTEUs
CisJU0JJX1NTRV9FVkVOVF9DT01QTEVURSwKKwlTQklfU1NFX0VWRU5UX0lOSkVDVCwKKwlTQklf
U1NFX0hBUlRfVU5NQVNLLAorCVNCSV9TU0VfSEFSVF9NQVNLLAorfTsKKworZW51bSBzYmlfc3Nl
X3N0YXRlIHsKKwlTQklfU1NFX1NUQVRFX1VOVVNFRCAgICAgPSAwLAorCVNCSV9TU0VfU1RBVEVf
UkVHSVNURVJFRCA9IDEsCisJU0JJX1NTRV9TVEFURV9FTkFCTEVEICAgID0gMiwKKwlTQklfU1NF
X1NUQVRFX1JVTk5JTkcgICAgPSAzLAorfTsKKworLyogU0JJIFNTRSBFdmVudCBBdHRyaWJ1dGVz
LiAqLworZW51bSBzYmlfc3NlX2F0dHJfaWQgeworCVNCSV9TU0VfQVRUUl9TVEFUVVMJCT0gMHgw
MDAwMDAwMCwKKwlTQklfU1NFX0FUVFJfUFJJTwkJPSAweDAwMDAwMDAxLAorCVNCSV9TU0VfQVRU
Ul9DT05GSUcJCT0gMHgwMDAwMDAwMiwKKwlTQklfU1NFX0FUVFJfUFJFRkVSUkVEX0hBUlQJPSAw
eDAwMDAwMDAzLAorCVNCSV9TU0VfQVRUUl9FTlRSWV9QQwkJPSAweDAwMDAwMDA0LAorCVNCSV9T
U0VfQVRUUl9FTlRSWV9BUkcJCT0gMHgwMDAwMDAwNSwKKwlTQklfU1NFX0FUVFJfSU5URVJSVVBU
RURfU0VQQwk9IDB4MDAwMDAwMDYsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTCT0g
MHgwMDAwMDAwNywKKwlTQklfU1NFX0FUVFJfSU5URVJSVVBURURfQTYJPSAweDAwMDAwMDA4LAor
CVNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9BNwk9IDB4MDAwMDAwMDksCisKKwlTQklfU1NFX0FU
VFJfTUFYCQk9IDB4MDAwMDAwMEEKK307CisKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX1NUQVRVU19T
VEFURV9PRkZTRVQJMAorI2RlZmluZSBTQklfU1NFX0FUVFJfU1RBVFVTX1NUQVRFX01BU0sJCTB4
MworI2RlZmluZSBTQklfU1NFX0FUVFJfU1RBVFVTX1BFTkRJTkdfT0ZGU0VUCTIKKyNkZWZpbmUg
U0JJX1NTRV9BVFRSX1NUQVRVU19JTkpFQ1RfT0ZGU0VUCTMKKworI2RlZmluZSBTQklfU1NFX0FU
VFJfQ09ORklHX09ORVNIT1QJQklUKDApCisKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQ
VEVEX0ZMQUdTX1NTVEFUVVNfU1BQCUJJVCgwKQorI2RlZmluZSBTQklfU1NFX0FUVFJfSU5URVJS
VVBURURfRkxBR1NfU1NUQVRVU19TUElFCUJJVCgxKQorI2RlZmluZSBTQklfU1NFX0FUVFJfSU5U
RVJSVVBURURfRkxBR1NfSFNUQVRVU19TUFYJQklUKDIpCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9J
TlRFUlJVUFRFRF9GTEFHU19IU1RBVFVTX1NQVlAJQklUKDMpCisjZGVmaW5lIFNCSV9TU0VfQVRU
Ul9JTlRFUlJVUFRFRF9GTEFHU19TU1RBVFVTX1NQRUxQCUJJVCg0KQorI2RlZmluZSBTQklfU1NF
X0FUVFJfSU5URVJSVVBURURfRkxBR1NfU1NUQVRVU19TRFQJQklUKDUpCisKKyNkZWZpbmUgU0JJ
X1NTRV9FVkVOVF9MT0NBTF9ISUdIX1BSSU9fUkFTCTB4MDAwMDAwMDAKKyNkZWZpbmUgU0JJX1NT
RV9FVkVOVF9MT0NBTF9ET1VCTEVfVFJBUAkJMHgwMDAwMDAwMQorI2RlZmluZSBTQklfU1NFX0VW
RU5UX0dMT0JBTF9ISUdIX1BSSU9fUkFTCTB4MDAwMDgwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVO
VF9MT0NBTF9QTVVfT1ZFUkZMT1cJMHgwMDAxMDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xP
Q0FMX0xPV19QUklPX1JBUwkweDAwMTAwMDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFM
X0xPV19QUklPX1JBUwkweDAwMTA4MDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfU09G
VFdBUkVfSU5KRUNURUQJMHhmZmZmMDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9T
T0ZUV0FSRV9JTkpFQ1RFRAkweGZmZmY4MDAwCisKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9QTEFU
Rk9STQkJQklUKDE0KQorI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTAkJQklUKDE1KQorCiAv
KiBTQkkgZGVidWcgdHJpZ2dlcnMgZnVuY3Rpb24gSURzICovCiBlbnVtIHNiaV9leHRfZGJ0cl9m
aWQgewogCVNCSV9FWFRfREJUUl9OVU1fVFJJR0dFUlMgPSAwLAotLSAKMi41MC4xIChBcHBsZSBH
aXQtMTU1KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
