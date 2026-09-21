Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0C5C982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AR+hfJWOq7/3KTzGgBz1jFF7BK/bTjuPD/l7jexFhc=; b=ai/Veb3o3fIdFD
	7PwPPXHzV8gUgqaWx8QHhMrVokwz73FkX5LoK/k/V9SFrSkhQLftHP457VI3I82vepzi5WTwDIS4j
	VQGYsA6vP5u8FSktUAyOobzBteT6dav01CGLEPMf04/88tw43F5bpdn0M0aU5eppog9CYoBXM0V4F
	1JO25N2xKos0v3DdAbHYwgH4o2ECAQRNNzmuVbktcSSzx/0e38EWroq0Tfleg9fu/JndW4yN9r+jq
	HHTCjKkaM6hYJ1m5RszV47xZ+Lk5ydqbk7GAs4wLD/2GSGVVTWq/Xy5Qmj496mTq8NiC5AulvTymN
	JoYwnu4USTm9G89z5QyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c0L-00000001r3G-28aE;
	Mon, 21 Sep 2026 11:16:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c0H-00000001r0G-0kHF
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=; b=k03j6PVXqm/IVkfgDW3vrUcZr8
	V8C5d/eQ5TiQwnfvO+WBGIF3fR6sm2N9PQuUoX/8/Lp7Q0U5P4WI7poC30Brv9Anoc9CbkO6xuQH3
	lhO48YmHYL7vD73yKieGZxfwcQn6bFyMH9cddqguJziq5OsKKcl+PV6iWhNWlNAO+z7okHanPsrSI
	Hsrl9j8ygenmHZizpC+CojHLYoL4CwIThN33ye9exPlrodDwTChztUKmHzEPlZhBZVwzz1m7RHsDt
	kCtZosnmMc5xhdudlbGMBndfcSuWCgvi5Yw86sOeWHxbA1bTG3xnmS4XjURzpML5gHS1gXP4h4QaT
	OXo7X8VQ==;
Received: from mail-pj2-x18.google.com ([2607:f8b0:4864:39::18])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8c0D-0000000CBKP-18ss
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:16:07 +0000
Received: by mail-pj2-x18.google.com with SMTP id d9443c01a7336-2d747ed9866so25981975ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789989363; x=1790594163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=kLJEABBfuCtvjuk5HnmOzlT47fqfz6zO2dv+ZNJ3u1oB6JVWXzBpXaxxhjXIsko9j9
         tMcjEoCHQcdyJXQAUJufnIqek3TaJ3gBc4KjBe/qfNV5JhIWOLXWbAToIyKQrGKJNuzI
         Qgdc29filzHufFkG9bIOdB2JNFpoYU9/orKrm4Vm9hOvaX7WEK8c2sLH2xpRiDxn1HhV
         XoqzRxizGHLzv6gEdPoSmyLaZJKtKtXrNzzDDZEOzMcSPwUCMZZ5zplK3+9nVpyyq5ek
         SDq/+KGcSnjrWc2jvk+5KoOgGZlnlD5aWnwHo9XjNEWKPTOnodtbflXq6Up4hHj5hKtO
         CfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989363; x=1790594163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=ewtHUUnBps2bclv614vy59RPMawDSQrGVZ+fUibSKj3ad2cKHPoMDM12Z2wPnuODkH
         VJXlkt8GDmy2Jab0nwG/Mr2KtB4RGbYnsfvL8jLSWDTFa+Swh+tJ9+FygcKa/s2CJlua
         F9IwOzCxHrL79QtUrXEGv/LkXMfAiPmWPR5KD6NEDDcL/igryg7naebc4pgYwNTyE3uI
         x8tWOb2hnTYZf+/XbRRi9ZgTmECD+uY8XLtCEyZUWvXZ6cnHHVQjktD5j65SpomDOwUq
         Agps6ZjeIKBENXyx7wGr0uoDZr/Ykaom8+areUPt3JJeTiZRGfn84D3+2PanPzSA+kR/
         fi7w==
X-Forwarded-Encrypted: i=1; AKwUvBwF97xSUJF0ciHcyXvRxOG2Fr8z4246i/wzxZKPEKn5s14g0JC4UkCwUrCmJIx2kh5RiWVibdwJx+KLag==@lists.infradead.org
X-Gm-Message-State: AFuF++m3EJUaFeh6Y3bzjkTv9MbOK9TeOsQvOySHnsyO9mvRai4MkI1c
	WZF4krUoz7os5OcUAIsAOuZD7j+rojYoGv/m/3W7Fb3k5ADlz0xBwb+RFfk/tkD+500=
X-Gm-Gg: AYBFou1hIUvifpbItEd0zTLQO3M7XL/Hxb6j0M8CKo9hhCwks2wi8FFw3DBunfvtsXe
	f7mXCPL0QwE4yP46ak6epx/0DV5VQS+lR8NxR/0TA6Ov2tz4qo51n2vQBagFTfbxmCTy64VxthQ
	oLY/1EB7gQuhOFQrvC4n3SzrKBQQVsmlPAzllOvMGi2Tn+lZ67Yc8E+86nziyfHrI6ndUgh4Ea4
	6t5VQAinXEcLKuPvAmCpBuvFP7BxaxGxfTNK9FlhMLvDCfHzA94wXgKJElF1DO2v8Q+2tUyiaGr
	/ZYWS7HkuZJCP2uaVMqxVmGZ1dKVsXYhSIwThb6ITnBkoUR6ZPiAxjpg1e1SOS+zQYG+d5AY7WJ
	7zJcUssbHm3Lo9Zl6Z2Tt+Oi0hvUXRebAGeNr5eo5WeOnXnTy6gFc+PWNiB84Cx8tqw+xxRPcbM
	2kWZecqYk2kTeJFFZTXRXFHkQMufV+Cd/pLxHBYn2cF50nyCzThOXorwCzFUBU5odk/jPtVREM/
	6opNO4KSWMoaFoeoZ1NlRGEzWQj+trtk2w=
X-Received: by 2002:a17:903:3c05:b0:2dd:4070:8eb with SMTP id d9443c01a7336-2ddb1b97f0amr160128205ad.20.1789989362987;
        Mon, 21 Sep 2026 04:16:02 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([240e:694:e20:401::8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba651sm31831125ad.53.2026.09.21.04.15.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 04:16:02 -0700 (PDT)
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
Subject: [PATCH v10 RESEND 1/9] riscv: add SBI SSE extension definitions
Date: Mon, 21 Sep 2026 19:14:58 +0800
Message-ID: <990ca6db19bc476f7533f97d48e2030b509633aa.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121605_746624_D69A57CF 
X-CRM114-Status: GOOD (  11.19  )
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
