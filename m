Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF4606A32C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uw5XmkOu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YffUjBfT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tCed8Ab9lt5chI7d9cB1P9v1eKLdcUOBa/K9dDJ3A+g=; b=Uw5XmkOuTcOT4vLSDyofC8jg7V
	srMru+xuPSiCpbPVYAgkg0kjnWJejrGo+/tADcsJ+7plzM5cWOGm5d/G+XkFuf+75FVNCiV1fS+1Y
	oKpvi94rJ4xPM6L/ZizUL1FwQyP/0hNSmMrC0YDEEJYQZAMzcYmoSRaGX0xmDR+mX4KumNkE4Ctr2
	ySTP8bn0XchaD5EIWlr0aR7cMTonDAGmQztXXgXZvljKwTuRiJh3SuFnwODyajuqakj6GbWi7U8jX
	eIXeeP+jraZ4+w+zGFY2xGPmgO2hJTOy9adsc1ykhQgzCTj6E3fTeAYrCP1jltSBZsJpOk3mYBq4u
	10+6SfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6yl-00000007crI-1xsr;
	Wed, 28 Oct 2026 16:58:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6yi-00000007cqu-0ole
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 16:58:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAXtE1153221;
	Wed, 28 Oct 2026 16:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ti9xJXOUpVhBEh6IONzPkiFQ8GBGVezeIUFHL8AKXKk=; b=YffUjBfTczHe4yr9
	Gv6SleZL8PlqEZC/7RJ9U46flRHculBLbP10ufcxgd8uMy/o5ebzgMCZ3BZ0pbDz
	6uDocDnxLYI0Brx6TenAhRs1fKGrEtfsiPzS0W7RhbXWoRECWxkKaWRn7m5hdAqt
	4/cZ3VaTKG667F+d9q+NyVsnbSax0Z+ztmAMoG1MrjLp8HJHnOr8eqdxeMNF0WZV
	faJG2jiMAP75Yoo3jaCdSvMddNObdZ3KCvAVQQogPZdPLgBQXXQmu8SIwJ+kWggd
	lEKw2cMmimqxm/0akg+sALsUsjtTH2pKmHM/WxEPiPbql1e0aofG0X6F4wp+Qhw1
	5+f8wg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be3m0k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:57:45 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69SGtYEW1881526;
	Wed, 28 Oct 2026 16:55:34 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69SGtYij1881490
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:34 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 26E47220FD; Wed, 28 Oct 2026 22:25:33 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
        Conor Dooley <conor@kernel.org>, Atish Patra <atish.patra@linux.dev>,
        Anup Patel <anup@brainfault.org>
Cc: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v11 1/9] riscv: add SBI SSE extension definitions
Date: Wed, 28 Oct 2026 22:25:23 +0530
Message-ID: <20261028165531.940336-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: dkZmSZzbxwJmRS_gJnpkAuJnr5u0P2Rb
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae22989 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=HwFc7jivAAAA:8
 a=h0uksLzaAAAA:8 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=7gMZY_Da8-zL24rEBcEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kr7TZk85JJIQSqC0cl8G:22
 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX/AE8MXY3mPPY
 83eMgQboUsdR2oP8VsOBS4rY0zkfc1eAdXzFFXvc4ShLO3huQq46wI45r56P+EpLKZFyoLkYcsa
 GIMzsQlBl7aOX93JdulyQPR3HrKCPpI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX/csPbFPAbpOU
 DfLPlawkIeukrRiwt8TLtUN3gjYHWAfRBwXU63jUAC3sr1wIx9moXrH2+fY5EHP3YkN6fJpLr6S
 5oYdLR1eSuhQ7HyqCqazdWj+EzsO5Zh3SbVXcUWj+9Jbqz8u0wQZFYfEZYVoXBvEIRYqumjcQOL
 kErgawbWpxYf056dZQrXba9jByKN46owX0zeTvuiA4ov40fKjqylKeojnjjxLyzgSxBdrUtOrTX
 xvkVNZvi/1MYyPhNoOAq/tcK+VB2CxmG+5zSUyd9itG2f07aoGQLh35d2voPnQ4iHzLWjZiia8w
 PJLl9QLQ1ByAnEFbVQIVj4Nu2dYAi1x0g+Qq8rzESHYjfTYk0vWIUNMqxhTGTu9XCt+o/oPExhc
 O+Hx66x9LTdZuJg9N5SUkWQu3wTWFFTyZ5AZ/MOXqLAVTqsn75JJ8vZ2sXJQZSQCBZszGGHA1qK
 /udj4t1qF8CYqEQc1Gg==
X-Proofpoint-GUID: dkZmSZzbxwJmRS_gJnpkAuJnr5u0P2Rb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_095820_350987_92A8D84D 
X-CRM114-Status: GOOD (  12.05  )
X-Spam-Score: -2.7 (--)
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
aWQgewogCVNCSV9FWFRfREJUUl9OVU1fVFJJR0dFUlMgPSAwLAotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
