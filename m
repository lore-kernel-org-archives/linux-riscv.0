Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855AAE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 07:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88MEnWPx292ENZWtglF0ChBpB4lAB/TFluQhg8LIV24=; b=ORonTBm4GtHBpf
	yCXiU6pLNWnYg0YIDEMpsGa4IugFxehjH+RXSI1Zhv95zworW+xV3+JP2+dVz+XcD874L0N/KpUhh
	r9BqalIi3ImX3Z+1edosooCpBJxwmbyvV/FD7qG4CILcSwbrOgu60rgyiMx5ZeD0hFf0zfXeTnQGy
	A7AjlyUJ5F5jcoB7y/ky4N29APPebUKc1EOzmWkGvi48ZnM02DYE6MpbKWJKUGFMZr7VurJSxwxe3
	AT1rpjZXYep1yZapm44eQLrPza/UDYPwJKZtIAz7law81vBUjrKsnJsfc6uHIZSdWmFAxQ0dXa01X
	FNXDh2CR+JarVKxGVoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW96g-0000000EKT5-3u4Q;
	Fri, 10 Jan 2025 07:06:58 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW95S-0000000EKJh-0csF;
	Fri, 10 Jan 2025 07:05:43 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509Nx3WS001536;
	Fri, 10 Jan 2025 07:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ga2v7r
	9meIaBz31U84eL3jzMovm9W2gKUR+quKpB1qA=; b=QnAbgUsLn+3Vws1cBuxTgI
	q8qT2Sxy0KdXA7TFwPigM8cyZ3GDwHKLSpVpJpb2PwHBGDr1SDvvg7UA0Rt9zpBt
	vZAL2svAjglyIlH+TCw821igklZH+0BMbx0V7vZYwB/NqQqP8OPj/uXKtcgubVYC
	WD8yzvXJIln8d1U4DhuZqI+u8nKz8ajOc41MPouCwMpIo7qXkNcy3wRGBKcTeTo+
	LwvR3qLCv0TkgMQTE3VJU/14iYnAdIInln+AZzQF5Klv3er80Bo/xRJmF0wfSQwc
	qARk+SpbTp8aW7/7mbnOiu1NWkPtpXp6O06MtO5vUg6r3QCKcN6dWYSG7UNyuyMw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442rkhs8x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 07:05:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50A744c8012820;
	Fri, 10 Jan 2025 07:05:16 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442rkhs8wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 07:05:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50A5RVYL013571;
	Fri, 10 Jan 2025 07:05:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygap916j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 07:05:14 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50A75Do329229632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 07:05:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E42B420040;
	Fri, 10 Jan 2025 07:05:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A95B2004B;
	Fri, 10 Jan 2025 07:05:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.17])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 10 Jan 2025 07:04:59 +0000 (GMT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Z4A8NU02WVBDGrYZ@ghost>
Date: Fri, 10 Jan 2025 12:34:46 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        =?utf-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
        Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
        James Clark <james.clark@linaro.org>,
        Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org,
        bpf@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Message-Id: <8639C367-2669-4924-83D8-15EAFAC42699@linux.vnet.ibm.com>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1> <Z4AoFA974kauIJ9T@ghost> <Z4A2Y269Ffo0ERkS@x1>
 <Z4A8NU02WVBDGrYZ@ghost>
To: Charlie Jenkins <charlie@rivosinc.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
        Hari Bathini <hbathini@linux.ibm.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CR4E83pg86k8Cx0Y_9xNEtR5rkcWclRc
X-Proofpoint-GUID: l3UdX7YMbwWwHX9jihu9fy-EzLhsFC2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_230542_190711_565D8042 
X-CRM114-Status: GOOD (  21.66  )
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

Cgo+IE9uIDEwIEphbiAyMDI1LCBhdCAyOjQ04oCvQU0sIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+IAo+IE9uIFRodSwgSmFuIDA5LCAyMDI1IGF0IDA1OjQ5
OjM5UE0gLTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPj4gT24gVGh1LCBK
YW4gMDksIDIwMjUgYXQgMTE6NDg6MzZBTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+
Pj4gT24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMTI6NTk6NDNQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2
YWxobyBkZSBNZWxvIHdyb3RlOgo+Pj4+IOKsoiBbYWNtZUB0b29sYm94IHBlcmYtdG9vbHMtbmV4
dF0kIGdpdCBsb2cgLS1vbmVsaW5lIC0xIDsgdGltZSBtYWtlIC1DIHRvb2xzL3BlcmYgYnVpbGQt
dGVzdAo+Pj4+IGQwNjgyNjE2MGE5ODI0OTQgKEhFQUQgLT4gcGVyZi10b29scy1uZXh0KSBwZXJm
IHRvb2xzOiBSZW1vdmUgZGVwZW5kZW5jeSBvbiBsaWJhdWRpdAo+Pj4+IG1ha2U6IEVudGVyaW5n
IGRpcmVjdG9yeSAnL2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYnCj4+
Pj4gLSB0YXJwa2c6IC4vdGVzdHMvcGVyZi10YXJnei1zcmMtcGtnIC4KPj4+PiAgICAgICAgICAg
ICAgICAgbWFrZV9zdGF0aWM6IGNkIC4gJiYgbWFrZSBMREZMQUdTPS1zdGF0aWMgTk9fUEVSRl9S
RUFEX1ZEU08zMj0xIE5PX1BFUkZfUkVBRF9WRFNPWDMyPTEgTk9fSlZNVEk9MSBOT19MSUJUUkFD
RUVWRU5UPTEgTk9fTElCRUxGPTEgLWoyOCAgREVTVERJUj0vdG1wL3RtcC5KSlQzdHZON2JWCj4+
Pj4gICAgICAgICAgICAgIG1ha2Vfd2l0aF9ndGsyOiBjZCAuICYmIG1ha2UgR1RLMj0xIC1qMjgg
IERFU1RESVI9L3RtcC90bXAuQkY1M1YycXBsMwo+Pj4+IC0gL2hvbWUvYWNtZS9naXQvcGVyZi10
b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9GRUFUVVJFX0RVTVA6IGNkIC4gJiYgbWFr
ZSBGRUFUVVJFX0RVTVBfQ09QWT0vaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMv
cGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCAgZmVhdHVyZS1kdW1wCj4+Pj4gY2QgLiAmJiBt
YWtlIEZFQVRVUkVfRFVNUF9DT1BZPS9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29s
cy9wZXJmL0JVSUxEX1RFU1RfRkVBVFVSRV9EVU1QIGZlYXR1cmUtZHVtcAo+Pj4+ICAgICAgICAg
bWFrZV9ub19saWJiaW9uaWNfTzogY2QgLiAmJiBtYWtlIE5PX0xJQkJJT05JQz0xIEZFQVRVUkVT
X0RVTVA9L2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVT
VF9GRUFUVVJFX0RVTVAgLWoyOCBPPS90bXAvdG1wLktadVEwcTJWczYgREVTVERJUj0vdG1wL3Rt
cC4wc3hNeUg5MWdTCj4+Pj4gICAgICAgICAgIG1ha2VfdXRpbF9tYXBfb19POiBjZCAuICYmIG1h
a2UgdXRpbC9tYXAubyBGRUFUVVJFU19EVU1QPS9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4
dC90b29scy9wZXJmL0JVSUxEX1RFU1RfRkVBVFVSRV9EVU1QIC1qMjggTz0vdG1wL3RtcC5ZME14
M0tMUkVJIERFU1RESVI9L3RtcC90bXAud2c5SENWVkxIRQo+Pj4+ICAgICAgICAgICAgICBtYWtl
X2luc3RhbGxfTzogY2QgLiAmJiBtYWtlIGluc3RhbGwgRkVBVFVSRVNfRFVNUD0vaG9tZS9hY21l
L2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCAt
ajI4IE89L3RtcC90bXAuUDBMRUJBa1cxWCBERVNURElSPS90bXAvdG1wLmFnVGF2Wm5kRk4KPj4+
PiAgZmFpbGVkIHRvIGZpbmQ6IGV0Yy9iYXNoX2NvbXBsZXRpb24uZC9wZXJmCj4+PiAKPj4+IElz
IHRoaXMgc29tZXRoaW5nIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaD8KPj4gCj4+IEkgZG9uJ3Qg
dGhpbmsgc28uCj4+IAo+PiBCVFcgdGhpcyBzZXJpZXMgaXMgYWxyZWFkeSBwdXNoZWQgb3V0IHRv
IHBlcmYtdG9vbHMtbmV4dDoKPj4gCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC9sb2cvP2g9cGVyZi10b29s
cy1uZXh0Cj4+IAo+PiBUaGFua3MhCj4+IAo+PiAtIEFybmFsZG8KPiAKPiBUaGFuayB5b3UhCj4g
Cj4gLSBDaGFybGllCgpIaSBDaGFybGllLCBBcm5hbGRvCgpXaGlsZSB0ZXN0aW5nIHRoZSBzZXJp
ZXMsIEkgaGl0IGNvbXBpbGF0aW9uIGlzc3VlIGluIHBvd2VycGMKClNuaXBwZXQgb2YgbG9nczoK
CgogIENDICAgICAgdXRpbC9zeXNjYWxsdGJsLm8KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21l
L2F0aGlyYS9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9z
eXNjYWxsX3RhYmxlLmg6NSwKICAgICAgICAgICAgICAgICBmcm9tIHV0aWwvc3lzY2FsbHRibC5j
OjE2OgphcmNoL3Bvd2VycGMvaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL3N5c2NhbGxzXzY0Lmg6MTY6
MTY6IGVycm9yOiBpbml0aWFsaXplZCBmaWVsZCBvdmVyd3JpdHRlbiBbLVdlcnJvcj1vdmVycmlk
ZS1pbml0XQogICAxNiB8ICAgICAgICAgWzEzXSA9ICJ0aW1lIiwKICAgICAgfCAgICAgICAgICAg
ICAgICBefn5+fn4KYXJjaC9wb3dlcnBjL2luY2x1ZGUvZ2VuZXJhdGVkL2FzbS9zeXNjYWxsc182
NC5oOjE2OjE2OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYc3lzY2FsbHRibFsx
M13igJkpCmFyY2gvcG93ZXJwYy9pbmNsdWRlL2dlbmVyYXRlZC9hc20vc3lzY2FsbHNfNjQuaDoy
MjoxNjogZXJyb3I6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV2Vycm9yPW92ZXJy
aWRlLWluaXRdCiAgIDIyIHwgICAgICAgICBbMThdID0gIm9sZHN0YXQiLAogICAgICB8ICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fgphcmNoL3Bvd2VycGMvaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL3N5
c2NhbGxzXzY0Lmg6MjI6MTY6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDigJhzeXNj
YWxsdGJsWzE4XeKAmSkKYXJjaC9wb3dlcnBjL2luY2x1ZGUvZ2VuZXJhdGVkL2FzbS9zeXNjYWxs
c182NC5oOjI3OjE2OiBlcnJvcjogaW5pdGlhbGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1XZXJy
b3I9b3ZlcnJpZGUtaW5pdF0KICAgMjcgfCAgICAgICAgIFsyMl0gPSAidW1vdW50IiwKICAgICAg
fCAgICAgICAgICAgICAgICBefn5+fn5+fgoKCkFuZCBzaW1pbGFyIGVycm9ycyBpcyB0aGVyZSBm
b3IgZmV3IG1vcmUgZW50cmllcy4gVGhlIHJlYXNvbiBpcyB0aGF0LCB0aGUgZ2VuZXJhdGVkIHN5
c2NhbGxzIGZpbGUgaGFzIHR3byBlbnRyaWVzIGZvciBlYWNoIG9mIHRoZXNlIGZhaWxpbmcgY2Fz
ZXMuCgpGcm9tIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2dlbmVyYXRlZC9hc20vc3lzY2FsbHNfNjQu
aCBjcmVhdGVkIGJ5IHNjcmlwcy9zeXNjYWxsdGJsLnNoIAoKCiAgMSBzdGF0aWMgY29uc3QgY2hh
ciAqY29uc3Qgc3lzY2FsbHRibFtdID0gewogIDIgICAgICAgICBbMF0gPSAicmVzdGFydF9zeXNj
YWxsIiwKICAzICAgICAgICAgWzFdID0gImV4aXQiLAogIDQgICAgICAgICBbMl0gPSAiZm9yayIs
CiAgNSAgICAgICAgIFszXSA9ICJyZWFkIiwKICA2ICAgICAgICAgWzRdID0gIndyaXRlIiwKICA3
ICAgICAgICAgWzVdID0gIm9wZW4iLAogIDggICAgICAgICBbNl0gPSAiY2xvc2UiLAogIDkgICAg
ICAgICBbN10gPSAid2FpdHBpZCIsCiAxMCAgICAgICAgIFs4XSA9ICJjcmVhdCIsCiAxMSAgICAg
ICAgIFs5XSA9ICJsaW5rIiwKIDEyICAgICAgICAgWzEwXSA9ICJ1bmxpbmsiLAogMTMgICAgICAg
ICBbMTFdID0gImV4ZWN2ZSIsCiAxNCAgICAgICAgIFsxMl0gPSAiY2hkaXIiLAogMTUgICAgICAg
ICBbMTNdID0gInRpbWXigJ0sICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAxNiAgICAgICAg
IFsxM10gPSAidGltZeKAnSwgICAgICAgICAgICAgICAgICAgIAogMTcgICAgICAgICBbMTRdID0g
Im1rbm9kIiwKIDE4ICAgICAgICAgWzE1XSA9ICJjaG1vZCIsCiAxOSAgICAgICAgIFsxNl0gPSAi
bGNob3duIiwKIDIwICAgICAgICAgWzE3XSA9ICJicmVhayIsCiAyMSAgICAgICAgIFsxOF0gPSAi
b2xkc3RhdCIsCiAyMiAgICAgICAgIFsxOF0gPSAib2xkc3RhdOKAnSwKCkxpbmUgbnVtYmVyIDE1
IGFuIDE2IHNob3dzIHR3byBlbnRyaWVzIGZvciB0aW1lLiBTaW1pbGFybHkgbGFzdCB0d28gbGlu
ZXMgZm9yIG9sZHN0YXQuIFRoaXMgaXMgcGlja2VkIGZvcm0gaHR0cHM6Ly9naXRodWIuY29tL3Rv
cnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL3Rvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL2VudHJ5L3N5
c2NhbGxzL3N5c2NhbGwudGJsCgoxMyAgICAgIDMyICAgICAgdGltZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzeXNfdGltZTMyCjEzICAgICAgNjQgICAgICB0aW1lICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN5c190aW1lCgoxOCAgICAgIDMyICAgICAgb2xkc3RhdCAgICAgICAgICAg
ICAgICAgICAgICAgICBzeXNfc3RhdCAgICAgICAgICAgICAgICAgICAgICAgIHN5c19uaV9zeXNj
YWxsCjE4ICAgICAgNjQgICAgICBvbGRzdGF0ICAgICAgICAgICAgICAgICAgICAgICAgIHN5c19u
aV9zeXNjYWxsCgpGb3Igc2FtZSBuciwgdHdvIGVudHJpZXMgYXJlIHRoZXJlLiBJbiB0aGUgYXJj
aCBzcGVjaWZpYyB2ZXJzaW9uIG9mIHRoZSBzY3JpcHQgdGhhdCBtYWtlcyB0aGUgc3lzY2FsbCB0
YWJsZSwgdGhpcyB3YXMgaGFuZGxlZCA6IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51
eC9ibG9iL21hc3Rlci90b29scy9wZXJmL2FyY2gvcG93ZXJwYy9lbnRyeS9zeXNjYWxscy9ta3N5
c2NhbGx0YmwjTDI4CgpTbyB3ZSB3aWxsIG5lZWQgY2hhbmdlIGluIGdlbmVyaWMgc2NyaXB0IGFs
c28uIFByb3Bvc2luZyBiZWxvdyBjaGFuZ2UgOiAKCmRpZmYgLS1naXQgYS90b29scy9wZXJmL3Nj
cmlwdHMvc3lzY2FsbHRibC5zaCBiL3Rvb2xzL3BlcmYvc2NyaXB0cy9zeXNjYWxsdGJsLnNoCmlu
ZGV4IDFjZTBkNWFhOGI1MC4uZDY2Y2VjMTBjYzJkIDEwMDc1NQotLS0gYS90b29scy9wZXJmL3Nj
cmlwdHMvc3lzY2FsbHRibC5zaAorKysgYi90b29scy9wZXJmL3NjcmlwdHMvc3lzY2FsbHRibC5z
aApAQCAtNzUsOCArNzUsMTAgQEAgbWF4X25yPTAKICMgdGhlIHBhcmFtcyBhcmU6IG5yIGFiaSBu
YW1lIGVudHJ5IGNvbXBhdAogIyB1c2UgXyBmb3IgaW50ZW50aW9uYWxseSB1bnVzZWQgdmFyaWFi
bGVzIGFjY29yZGluZyB0byBTQzIwMzQKIHdoaWxlIHJlYWQgbnIgXyBuYW1lIF8gXzsgZG8KLSAg
ICBlbWl0ICIkbnIiICIkbmFtZSIgPj4gJG91dGZpbGUKLSAgICBtYXhfbnI9JG5yCisgaWYgWyAi
JG1heF9uciIgLWx0ICIkbnIiIF07IHRoZW4KKyBlbWl0ICIkbnIiICIkbmFtZSIgPj4gJG91dGZp
bGUKKyBtYXhfbnI9JG5yCisgZmkKIGRvbmUgPCAkc29ydGVkX3RhYmxlCiAgIHJtIC1mICRzb3J0
ZWRfdGFibGUKCkFybmFsZG8sCkkgc2VlIHdlIGhhdmUgdGhpcyBwYXRjaCBzZXJpZXMgaW4gcGVy
Zi10b29scy1uZXh0LiBJZiB3ZSBuZWVkIGFib3ZlIGNoYW5nZSBhcyBhIHNlcGFyYXRlIHBhdGNo
LCBwbGVhc2UgbGV0IG1lIGtub3cuCgpUaGFua3MKQXRoaXJhCgo+IAo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
