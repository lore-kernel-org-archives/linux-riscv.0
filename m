Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FB3E7719A
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4hlM+L2XXUJe5g8tmzq3u/PKRwRdt5OjXK4o2ZAP+U=; b=aSkdr8mobusZVl
	55hYFp+fy7+w3ii5PdsWD1EHVui+jcsXAywMYymZcTYuF0Dzt74h8yuADVlDzn0CXYb5Wcorg94v4
	q/8aSyiPSwcBzd/g1Z5hFPBAaKSGcZE2VnxBB5icMeJONLYZuQAKJwXsYLDGVNL8+IRLPt0G+55ZP
	dwcU95hXwp7yiE7zVegwj0AHdUDcgPNZI3YTpVTLp9BNubkbmWkFlMBbTtVwIsLV3xXe64j2uAnQg
	TNYifQaTGwG5U1aI1FPQc2jV/qo3OPHAdS+DFKA4eFv6RlVgB3Fuk7nWnP6T1MZ/DDf5XqOh73ZAb
	H4hKnKAxM7jETjW0hhkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWc7k-00000000tIH-1zrD;
	Sat, 11 Jan 2025 14:06:00 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWc6V-00000000tAI-3JFs;
	Sat, 11 Jan 2025 14:04:45 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50B7PNME000920;
	Sat, 11 Jan 2025 14:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=J2lbfO
	GB8gg7wUXgcCKWwEjh/GIQdeP4KglNFtDE9I8=; b=lzAOD3IHOM+LF+0a5FCa7Y
	bADezBvhwGwklBA4suWH6lgpbqO1H4Gtdvf9a4WwyOuV0djj3mU4v5JBzC4QSwjM
	wrx/9ymlxvo3VLali/3cEoUQzq/6innMi3v7uRENscc855giXs3sP/JQfMyITdsW
	ytDjgjXk6w6TVMvupMAuAfiVGJOIsLYblVdno/WfOl7xS1aQvccyj+n4I6ma0LkA
	2pWkF3RrBglyT1kotvcwRu5fsKDl+82NR6Olmsf4KgWWd4855f/PBqXrb2JruOnH
	eUmfaEG++S+q5swlGz8blYUTSlyA+03MD8xV1uPRhp4FSzdPoujt7be2YMvSn5FQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 443e2nhxjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 14:04:16 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50BE4FWv022141;
	Sat, 11 Jan 2025 14:04:15 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 443e2nhxje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 14:04:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50BALm66003572;
	Sat, 11 Jan 2025 14:04:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfatqk76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 14:04:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50BE4CcR27853066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Jan 2025 14:04:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D45802004B;
	Sat, 11 Jan 2025 14:04:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E1BA20040;
	Sat, 11 Jan 2025 14:04:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.242.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 11 Jan 2025 14:03:59 +0000 (GMT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Z4EyD_RgjjeD6G4K@x1>
Date: Sat, 11 Jan 2025 19:33:46 +0530
Cc: Charlie Jenkins <charlie@rivosinc.com>, Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>, Hari Bathini <hbathini@linux.ibm.com>,
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
Message-Id: <721EF5C4-5B22-4654-8328-F3616CDD1D29@linux.vnet.ibm.com>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1> <Z4AoFA974kauIJ9T@ghost> <Z4A2Y269Ffo0ERkS@x1>
 <Z4A8NU02WVBDGrYZ@ghost>
 <8639C367-2669-4924-83D8-15EAFAC42699@linux.vnet.ibm.com>
 <Z4EyD_RgjjeD6G4K@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4t0XeC8NVubnR-Ul2Eg3y8vjelW9NEDY
X-Proofpoint-GUID: ih83BF0cpgnFHXX9AyELYSHOM8UwQ-Qx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501110120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_060443_958782_CC6D5093 
X-CRM114-Status: GOOD (  17.61  )
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

Cgo+IE9uIDEwIEphbiAyMDI1LCBhdCA4OjEz4oCvUE0sIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVs
byA8YWNtZUBrZXJuZWwub3JnPiB3cm90ZToKPiAKPiBPbiBGcmksIEphbiAxMCwgMjAyNSBhdCAx
MjozNDo0NlBNICswNTMwLCBBdGhpcmEgUmFqZWV2IHdyb3RlOgo+PiAKPj4gCj4+PiBPbiAxMCBK
YW4gMjAyNSwgYXQgMjo0NOKAr0FNLCBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMu
Y29tPiB3cm90ZToKPj4+IAo+Pj4gT24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMDU6NDk6MzlQTSAt
MDMwMCwgQXJuYWxkbyBDYXJ2YWxobyBkZSBNZWxvIHdyb3RlOgo+Pj4+IE9uIFRodSwgSmFuIDA5
LCAyMDI1IGF0IDExOjQ4OjM2QU0gLTA4MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPj4+Pj4g
T24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMTI6NTk6NDNQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+Pj4+Pj4g4qyiIFthY21lQHRvb2xib3ggcGVyZi10b29scy1uZXh0
XSQgZ2l0IGxvZyAtLW9uZWxpbmUgLTEgOyB0aW1lIG1ha2UgLUMgdG9vbHMvcGVyZiBidWlsZC10
ZXN0Cj4+Pj4+PiBkMDY4MjYxNjBhOTgyNDk0IChIRUFEIC0+IHBlcmYtdG9vbHMtbmV4dCkgcGVy
ZiB0b29sczogUmVtb3ZlIGRlcGVuZGVuY3kgb24gbGliYXVkaXQKPj4+Pj4+IG1ha2U6IEVudGVy
aW5nIGRpcmVjdG9yeSAnL2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYn
Cj4+Pj4+PiAtIHRhcnBrZzogLi90ZXN0cy9wZXJmLXRhcmd6LXNyYy1wa2cgLgo+Pj4+Pj4gICAg
ICAgICAgICAgICAgbWFrZV9zdGF0aWM6IGNkIC4gJiYgbWFrZSBMREZMQUdTPS1zdGF0aWMgTk9f
UEVSRl9SRUFEX1ZEU08zMj0xIE5PX1BFUkZfUkVBRF9WRFNPWDMyPTEgTk9fSlZNVEk9MSBOT19M
SUJUUkFDRUVWRU5UPTEgTk9fTElCRUxGPTEgLWoyOCAgREVTVERJUj0vdG1wL3RtcC5KSlQzdHZO
N2JWCj4+Pj4+PiAgICAgICAgICAgICBtYWtlX3dpdGhfZ3RrMjogY2QgLiAmJiBtYWtlIEdUSzI9
MSAtajI4ICBERVNURElSPS90bXAvdG1wLkJGNTNWMnFwbDMKPj4+Pj4+IC0gL2hvbWUvYWNtZS9n
aXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9GRUFUVVJFX0RVTVA6IGNk
IC4gJiYgbWFrZSBGRUFUVVJFX0RVTVBfQ09QWT0vaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5l
eHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCAgZmVhdHVyZS1kdW1wCj4+Pj4+
PiBjZCAuICYmIG1ha2UgRkVBVFVSRV9EVU1QX0NPUFk9L2hvbWUvYWNtZS9naXQvcGVyZi10b29s
cy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9GRUFUVVJFX0RVTVAgZmVhdHVyZS1kdW1wCj4+
Pj4+PiAgICAgICAgbWFrZV9ub19saWJiaW9uaWNfTzogY2QgLiAmJiBtYWtlIE5PX0xJQkJJT05J
Qz0xIEZFQVRVUkVTX0RVTVA9L2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3Bl
cmYvQlVJTERfVEVTVF9GRUFUVVJFX0RVTVAgLWoyOCBPPS90bXAvdG1wLktadVEwcTJWczYgREVT
VERJUj0vdG1wL3RtcC4wc3hNeUg5MWdTCj4+Pj4+PiAgICAgICAgICBtYWtlX3V0aWxfbWFwX29f
TzogY2QgLiAmJiBtYWtlIHV0aWwvbWFwLm8gRkVBVFVSRVNfRFVNUD0vaG9tZS9hY21lL2dpdC9w
ZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCAtajI4IE89
L3RtcC90bXAuWTBNeDNLTFJFSSBERVNURElSPS90bXAvdG1wLndnOUhDVlZMSEUKPj4+Pj4+ICAg
ICAgICAgICAgIG1ha2VfaW5zdGFsbF9POiBjZCAuICYmIG1ha2UgaW5zdGFsbCBGRUFUVVJFU19E
VU1QPS9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmL0JVSUxEX1RFU1Rf
RkVBVFVSRV9EVU1QIC1qMjggTz0vdG1wL3RtcC5QMExFQkFrVzFYIERFU1RESVI9L3RtcC90bXAu
YWdUYXZabmRGTgo+Pj4+Pj4gZmFpbGVkIHRvIGZpbmQ6IGV0Yy9iYXNoX2NvbXBsZXRpb24uZC9w
ZXJmCj4+Pj4+IAo+Pj4+PiBJcyB0aGlzIHNvbWV0aGluZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0
Y2g/Cj4+Pj4gCj4+Pj4gSSBkb24ndCB0aGluayBzby4KPj4+PiAKPj4+PiBCVFcgdGhpcyBzZXJp
ZXMgaXMgYWxyZWFkeSBwdXNoZWQgb3V0IHRvIHBlcmYtdG9vbHMtbmV4dDoKPj4+PiAKPj4+PiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYt
dG9vbHMtbmV4dC5naXQvbG9nLz9oPXBlcmYtdG9vbHMtbmV4dAo+Pj4+IAo+Pj4+IFRoYW5rcyEK
Pj4+PiAKPj4+PiAtIEFybmFsZG8KPj4+IAo+Pj4gVGhhbmsgeW91IQo+Pj4gCj4+PiAtIENoYXJs
aWUKPj4gCj4+IEhpIENoYXJsaWUsIEFybmFsZG8KPj4gCj4+IFdoaWxlIHRlc3RpbmcgdGhlIHNl
cmllcywgSSBoaXQgY29tcGlsYXRpb24gaXNzdWUgaW4gcG93ZXJwYwo+PiAKPj4gU25pcHBldCBv
ZiBsb2dzOgo+IAo+IFllYWgsIFN0ZXBoZW4gUm90aHdlbGwgbm90aWNlZCBpdCBpbiBsaW51eCBu
ZXh0IGFuZCBDaGFybGllIHByb3ZpZGVkIGEKPiBmaXgsIHNvIEkgc3F1YXNoZWQgaXQgYWxsIHRv
Z2V0aGVyIGFuZCB3aWxsIHB1c2ggaXQgc29vbjoKPiAKPiAgICBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjUwMTA4LXBlcmZfc3lzY2FsbHRibC12Ni0xNC03NTQzYjUyOTMwOThA
cml2b3NpbmMuY29tCj4gICAgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1
MDExMDEwMDUwNS43OGQ4MTQ1MEBjYW5iLmF1dWcub3JnLmF1Cj4gICAgWyBTdGVwaGVuIFJvdGh3
ZWxsIG5vdGljZWQgb24gbGludXgtbmV4dCB0aGF0IHRoZSBwb3dlcnBjIGJ1aWxkIGZvciBwZXJm
IHdhcyBicm9rZW4gYW5kIC4uLl0KPiAgICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzIwMjUwMTA5LXBlcmZfcG93ZXJwY19zcHUtdjEtMS1jMDk3ZmM0MzczN2VAcml2b3NpbmMu
Y29tCj4gICAgWyAuLi4gQ2hhcmxpZSBmaXhlZCBpdCB1cCBhbmQgYXNrZWQgZm9yIGl0IHRvIGJl
IHNxdWFzaGVkIHRvIGF2b2lkIGJyZWFraW5nIGJpc2VjdGlvbi4gbwo+IAo+IFRoYW5rcyBmb3Ig
dGhlIHJlcG9ydCEKPiAKU3VyZSwKVGhhbmtzIENoYXJsaWUgZm9yIHRoZSBmaXgKCkkgdGVzdGVk
IG9uIGxhdGVzdCB0bXAucGVyZi10b29scy1uZXh0IGFuZCBjb21waWxlcyBmaW5lCgpUZXN0ZWQt
Ynk6IEF0aGlyYSBSYWplZXYgPGF0cmFqZWV2QGxpbnV4LnZuZXQuaWJtLmNvbT4KClRoYW5rcwpB
dGhpcmEKCgo+IC0gQXJuYWxkbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
