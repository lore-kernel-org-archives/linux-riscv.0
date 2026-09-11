Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C177C88E50
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AR+hfJWOq7/3KTzGgBz1jFF7BK/bTjuPD/l7jexFhc=; b=N7bWaDWWsaFQOp
	b4NJ6yyfZGTDU/RN+7ixm5p/7R2ICs7KFNypZPHnxf1rfNVicktAiX/xnKYbwS+3S5OM1smPTeeqF
	AI88D5F1rhQPkw3Di2uVLdd3YU08Cc8/lrFOxNFbe6X4c3IRT5f0d4CT750UXVpVp/Wkf79m/gNWu
	iM4eniQIdd1vQpGcwQ7KzlxhnWhnvVoh+rTl1eNUtO5x/oOiYHzoC72cOXxpsQjFbtQARIbh4uHMU
	50ydsZgzX/1/Tk0iVxrGs/7hhzpaunbxjv3g4JXYTv+kAEnDTn8xvBIrOrUK79nnQ1qwYiq0TgMhb
	0HG0+er/eHHXf8B0ou7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Ae-0000000GagN-3JvS;
	Fri, 11 Sep 2026 12:15:56 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Ab-0000000Gae7-1QiN
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 12:15:55 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1008584a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 05:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789128952; x=1789733752; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=L25Gjr3OpRe5vrLPmTwsIDy8tIshTMH5+fG0BrH4WLQaP0tidxN2oPmd5FaE3nViqu
         kDge0l17k2SOSW/Nv4Se36+y1uT6W1RGxuuSbbDIfuU14+t+GxnHAGBmGOX8WhRVh93X
         SvD7hU0OapGex8KyB2MxqIyaHhi54OFBScKyMx/8fWm1IkXKdVhzgRJremsecQa8Dtgi
         bXdLd/a7l6wzQXjfvkdLM8C6sgSkH6svnfO0uBmFNnILY7PXyDqzaCUk0z00iaPQpgDG
         j05jRKEoNlC3p3sHu1mEEhIG5xbnWYj6JMxg6bU+GRRbhsZRi26tr2FBEErK9vKswYCm
         gT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128952; x=1789733752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=mt6nTFZtWo7MDR1Ru2uWIm0G4wnPLD8Ofc1kRyaNQgYugOiDWZovb2DMIcfM6TslEs
         E1Pj4OW7OuVrfxKwSWunQ+uAnBaSMFkuYK/RMa1z7k3IHAOwBs4zwdeRwlyXzQ4HpGlW
         wP38c/Gdifco0Av1dOfb3ZY9bVpqcFEHCM9EDWwCOLqSS/HpCD1QXdJjefpCezqhU02O
         kZR0T4RSIH94QuEgryiKwaGf5ZJ/YsToJN4ZDIM9JGLRKuiM9N9LuVneIimNAvQ9r1ZY
         j+HAfBbJ4VYWvidJv9VrqnrwZgU4KooHdcuqOhKqs8lhUtI4bMW1wIfGg8tR/3suJSF2
         Ilzg==
X-Forwarded-Encrypted: i=1; AKwUvByPHuXT7HuQPFsO4Ah1HdVrxFBTLzxxoZKJf78MIBhFaiEN4xI8ZgGilk2b8DFFnIY+1guaTbwPbxg+GA==@lists.infradead.org
X-Gm-Message-State: AFuF++kTw+2Bjtyilsz8k8odstl/V2LEeFubZQX3rlYFrBBl+WImknJ9
	HLRJjBowprMcZVJd7KleR56Buqj+Stqf4nmNEvG2oyUuS3zFGYaqIuJpdEhZ/lF0SxQ=
X-Gm-Gg: AYBFou1zFzKjpkA+K5gFr5DWrkYIRsD52T6Pnw+OIajSNrYefbfOXyc0d5sI+m816bl
	43PvMI80b2W880OeUS+BmwIV3dCqNOZHliFNm77TBpF+iX6mWP0tQ39pCS3Hig/3PFqeswfyNGl
	FlJDaPfjwP2+/lZMcgDx6b1Th6DSDk51QOrVHTIe1O7KKORj1Sb1QPzI0W3T7ASyuW9T9aYAwRr
	mT5TduOpolFJdcjAhO7fETfpcdIEWnPctfgDTlddkiufyamsy4XQCn5joMx7iNlVGPa4nel979T
	nOBblodIoZxQ4w8+ZdiGV0eN25xAi8pVK+RCReNuOTp5hQhw0PSbQ9hV8hKf1ZOcsaFMQJyn6Gx
	DcD5WzvmW+X7H+BIqRDTosk5N8YzWUfd2EyWabJ2IK3EBXM2zTC1h3H7gi7BJ0Z3fQzJ/jPnX5d
	XMBZbD2HO+pUXuueQQUNXbNWNtHDzhjK2lTE32hkuCA4w8eywYBpKq42dlsIt6Dh5LyxNyK1Of8
	GjVg/qaZ947SU0IRfIUpEcLzrUyMtc7yzy/Y7rf6g==
X-Received: by 2002:a17:90b:1648:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39d9bec50b9mr6390301a91.10.1789128952266;
        Fri, 11 Sep 2026 05:15:52 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.15.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:15:51 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
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
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 1/9] riscv: add SBI SSE extension definitions
Date: Fri, 11 Sep 2026 20:14:48 +0800
Message-ID: <20260911121456.33223-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_051553_396806_381D1E6E 
X-CRM114-Status: GOOD (  10.90  )
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
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IDU3MjVlMGNhNGRkYS4uNGU1NGQ3
OWJhNTQzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAgLTM4LDYgKzM4LDcgQEAgZW51bSBzYmlfZXh0
X2lkIHsKIAlTQklfRVhUX0ZXRlQgPSAweDQ2NTc0NjU0LAogCVNCSV9FWFRfTVBYWSA9IDB4NEQ1
MDU4NTksCiAJU0JJX0VYVF9EQlRSID0gMHg0NDQyNTQ1MiwKKwlTQklfRVhUX1NTRSA9IDB4NTM1
MzQ1LAogCiAJLyogRXhwZXJpbWVudGFscyBleHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlz
IHJhbmdlICovCiAJU0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLApAQCAt
NTA2LDYgKzUwNyw2OCBAQCBlbnVtIHNiaV9tcHh5X3JwbWlfYXR0cmlidXRlX2lkIHsKICNkZWZp
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
