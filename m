Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E69D6ACFB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 13:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPCZC7ZjamoZU3W15zEMHDndQSDOs6GJ+kORLiQbIaA=; b=pnmtR17IxGjf9r
	a2md0zWACg5POMGXxxHt7z3z8Z6jLpfnrXnpP6JzXXnvptff6GhJhqZwPAKzfP0RZeNp2WrjkScRB
	gWwnmOl23vPBDqvmxB0lQcuBBX/1DinkqLCPdh6M3jyxQ/ImXFcM3sTkqn24PXP0B7wl6bagWo5q0
	jFOp3xAQFVdFf0PkeM2iCpdgV9okfaQ9S1P7txZm8GT5ftfQkG5NL+WC9ylJ/SpoE8VrMg3VMm1Hh
	0aZAnG7rQAspcwrISp4BTv/hloOkyhpiej4NDK4NKw8mUzPIl1O+f9RvbtBtri95ccX7TCOu3YCwS
	cIz1d9JO5hS/oPHSW6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDjF-00000008VAm-1tky;
	Thu, 18 Dec 2025 13:07:37 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDjD-00000008VAQ-0sZ9
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 13:07:36 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIAJhM4011462;
	Thu, 18 Dec 2025 13:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9bVjFf
	tHVS7uWdZpW9/LtnWIGLoCJqI5JblUIwN+Kv4=; b=oL2wrKYVOkb6Hv4O5sGlX1
	rjEWnNqOztiynELQMggvGq8sx4nrgdq1QaK6OB19ZDDyZwz0rKWJHidtJUhCMaJu
	B7LcNUlO3wMkXNs7e7ec/P/qxoDBRhsVrfopSTRnPAv8UK1zyc14VnF09QBNQIEm
	lczyTTVcO68kdK/IHwk4dNMSPA20vfmz1QH06R34ov9HdfFUoXmXbZ0OYUZmhVDx
	7YbmVhdj6WtdVmjGfabIeYHScdtHQ8IAkLDWMyOKQPNxLAk8mdHnVzQgjMq5Qgbj
	Tbl9d74sAxgcGJj+UNAaSflpuWhcgigBGelVggjXhlcK1BmuP/iDBPNKaLBKflGA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm9ur6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 13:06:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BID6TwE012531;
	Thu, 18 Dec 2025 13:06:56 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm9ur0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 13:06:56 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIBAuvo002863;
	Thu, 18 Dec 2025 13:06:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kfngdew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 13:06:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BID6pOB37159190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 13:06:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58C302004B;
	Thu, 18 Dec 2025 13:06:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC06A20040;
	Thu, 18 Dec 2025 13:06:47 +0000 (GMT)
Received: from [9.39.19.14] (unknown [9.39.19.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Dec 2025 13:06:47 +0000 (GMT)
Message-ID: <1fddcf72-26f7-4fb4-84b8-1328e486d58e@linux.ibm.com>
Date: Thu, 18 Dec 2025 18:36:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
        linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov
 <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        x86@kernel.org, linux-arm64@lists.infradead.org,
        linux-riscv@lists.infradead.org
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
 <83920c44-47f5-4a46-bfa7-76713197d7e4@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <83920c44-47f5-4a46-bfa7-76713197d7e4@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IOMjxDdqC_INVd8pD7lbLmjPG0vfkoRD
X-Authority-Analysis: v=2.4 cv=CLgnnBrD c=1 sm=1 tr=0 ts=6943fc70 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=GZ12N8NoI2vug0DTctEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: rGJZSZAJBQua-nl0FXSZ6hN3il9LBdnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwOSBTYWx0ZWRfX81IRjmUONXph
 vRAcgAYV2crAU/QbOJ7+PfueA+I8tNHkip0kvKVvQuphwhyC7oqrgSAukbSdpdjxuNYI5umCGCf
 K5+w/qkxfOWhS8HgN14q7okSGpEUZPEtvWx8GpHcGsHSgXZ/Shnj02rFvKJO0xre4+CKtuCEoiP
 dB/GPOCFuV2MF7RA2vZ/lJCBgpIf0a6AsuMAiXDOksBsJQAZ6BxUndMDhkNRxtGXrQ+5MRzP/f0
 AAzNUoSX1crFlsF+mhqU6AVJ7Lzod1K8N/ryvc5l/6RHwdO7me0NDg3htWywFTtQjNefRZQ5SKC
 ikJN5U/o/W0IHViZx/Iiyjg/YIxIUhQ4Nw1yEeALa1D+Ehzv78TUPYuXU8Z2O09tp4XTChyShNV
 qpiBfzUVNwRMF7hOaLwoM49FW/BVRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_050735_367923_E603B49E 
X-CRM114-Status: GOOD (  25.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxOC8xMi8yNSAxNzozMiwgRGF2aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIHdyb3RlOgo+
IE9uIDEyLzE4LzI1IDEyOjQxLCBTb3VyYWJoIEphaW4gd3JvdGU6Cj4+IFNraXAgcHJvY2Vzc2lu
ZyBodWdlcGFnZSBrZXJuZWwgYXJndW1lbnRzIChodWdlcGFnZXN6LCBodWdlcGFnZXMsIGFuZAo+
PiBkZWZhdWx0X2h1Z2VwYWdlc3opIHdoZW4gaHVnZXBhZ2VzIGFyZSBub3Qgc3VwcG9ydGVkIGJ5
IHRoZQo+PiBhcmNoaXRlY3R1cmUuCj4+Cj4+IFNvbWUgYXJjaGl0ZWN0dXJlcyBtYXkgbmVlZCB0
byBkaXNhYmxlIGh1Z2VwYWdlcyBiYXNlZCBvbiBjb25kaXRpb25zCj4+IGRpc2NvdmVyZWQgZHVy
aW5nIGtlcm5lbCBib290LiBUaGUgaHVnZXBhZ2VzX3N1cHBvcnRlZCgpIGhlbHBlciBhbGxvd3MK
Pj4gYXJjaGl0ZWN0dXJlIGNvZGUgdG8gYWR2ZXJ0aXNlIHdoZXRoZXIgaHVnZXBhZ2VzIGFyZSBz
dXBwb3J0ZWQuCj4+Cj4+IEN1cnJlbnRseSwgbm9ybWFsIGh1Z2VwYWdlIGFsbG9jYXRpb24gaXMg
Z3VhcmRlZCBieQo+PiBodWdlcGFnZXNfc3VwcG9ydGVkKCksIGJ1dCBnaWdhbnRpYyBodWdlcGFn
ZXMgYXJlIGFsbG9jYXRlZCByZWdhcmRsZXNzCj4+IG9mIHRoaXMgY2hlY2suIFRoaXMgY2F1c2Vz
IHByb2JsZW1zIG9uIHBvd2VycGMgZm9yIGZhZHVtcCAoZmlybXdhcmUtCj4+IGFzc2lzdGVkIGR1
bXApLgo+Pgo+PiBJbiB0aGUgZmFkdW1wIChmaXJtd2FyZS1hc3Npc3RlZCBkdW1wKSBzY2VuYXJp
bywgYSBwcm9kdWN0aW9uIGtlcm5lbAo+PiBjcmFzaCBjYXVzZXMgdGhlIHN5c3RlbSB0byBib290
IGludG8gYSBzcGVjaWFsIGtlcm5lbCB3aG9zZSBzb2xlCj4+IHB1cnBvc2UgaXMgdG8gY29sbGVj
dCB0aGUgbWVtb3J5IGR1bXAgYW5kIHJlYm9vdC4gRmVhdHVyZXMgc3VjaCBhcwo+PiBodWdlcGFn
ZXMgYXJlIG5vdCByZXF1aXJlZCBpbiB0aGlzIGVudmlyb25tZW50IGFuZCBzaG91bGQgYmUKPj4g
ZGlzYWJsZWQuCj4+Cj4+IEZvciBleGFtcGxlLCBmYWR1bXAga2VybmVsIGJvb3Rpbmcgd2l0aCB0
aGUga2VybmVsIGFyZ3VtZW50cwo+PiBkZWZhdWx0X2h1Z2VwYWdlc3o9MUdCIGh1Z2VwYWdlc3o9
MUdCIGh1Z2VwYWdlcz0yMDAgcHJpbnRzIHRoZQo+PiBmb2xsb3dpbmcgbG9nczoKPj4KPj4gSHVn
ZVRMQjogYWxsb2NhdGluZyAyMDAgb2YgcGFnZSBzaXplIDEuMDAgR2lCIGZhaWxlZC7CoCBPbmx5
IGFsbG9jYXRlZCAKPj4gNTggaHVnZXBhZ2VzLgo+PiBIdWdlVExCIHN1cHBvcnQgaXMgZGlzYWJs
ZWQhCj4+IEh1Z2VUTEI6IGh1Z2UgcGFnZXMgbm90IHN1cHBvcnRlZCwgaWdub3JpbmcgYXNzb2Np
YXRlZCBjb21tYW5kLWxpbmUgCj4+IHBhcmFtZXRlcnMKPj4gaHVnZXRsYmZzOiBkaXNhYmxpbmcg
YmVjYXVzZSB0aGVyZSBhcmUgbm8gc3VwcG9ydGVkIGh1Z2VwYWdlIHNpemVzCj4+Cj4+IEV2ZW4g
dGhvdWdoIHRoZSBsb2dzIHNheSB0aGF0IGh1Z2V0bGIgc3VwcG9ydCBpcyBkaXNhYmxlZCwgZ2ln
YW50aWMKPj4gaHVnZXBhZ2VzIGFyZSBzdGlsbCBnZXR0aW5nIGFsbG9jYXRlZCwgd2hpY2ggY2F1
c2VzIHRoZSBmYWR1bXAga2VybmVsCj4+IHRvIHJ1biBvdXQgb2YgbWVtb3J5IGR1cmluZyBib290
Lgo+Cj4gWWVhaCwgdGhhdCdzIHN1Ym9wdGltYWwuCj4KPj4KPj4gVG8gZml4IHRoaXMsIHRoZSBn
aWdhbnRpYyBodWdlcGFnZSBhbGxvY2F0aW9uIHNob3VsZCBjb21lIHVuZGVyCj4+IGh1Z2VwYWdl
c19zdXBwb3J0ZWQoKS4KPj4KPj4gVG8gYnJpbmcgZ2lnYW50aWMgaHVnZXBhZ2UgYWxsb2NhdGlv
biB1bmRlciBodWdlcGFnZXNfc3VwcG9ydGVkKCksIHR3bwo+PiBhcHByb2FjaGVzIHdlcmUgcHJl
dmlvdXNseSBwcm9wb3NlZDoKPj4gWzFdIENoZWNrIGh1Z2VwYWdlc19zdXBwb3J0ZWQoKSBpbiB0
aGUgZ2VuZXJpYyBjb2RlIGJlZm9yZSBhbGxvY2F0aW5nCj4+IGdpZ2FudGljIGh1Z2VwYWdlcy4K
Pj4gWzJdIE1ha2UgYXJjaF9odWdldGxiX3ZhbGlkX3NpemUoKSByZXR1cm4gZmFsc2UgZm9yIGFs
bCBodWdldGxiIHNpemVzLgo+Pgo+PiBBcHByb2FjaCBbMl0gaGFzIHR3byBtaW5vciBpc3N1ZXM6
Cj4+IDEuIEl0IHByaW50cyBtaXNsZWFkaW5nIGxvZ3MgYWJvdXQgaW52YWxpZCBodWdlcGFnZSBz
aXplcwo+PiAyLiBUaGUga2VybmVsIHN0aWxsIHByb2Nlc3NlcyBodWdlcGFnZSBrZXJuZWwgYXJn
dW1lbnRzIHVubmVjZXNzYXJpbHkKPj4KPj4gVG8gY29udHJvbCBnaWdhbnRpYyBodWdlcGFnZSBh
bGxvY2F0aW9uLCBpdCBpcyBwcm9wb3NlZCB0byBza2lwCj4+IHByb2Nlc3NpbmcgdGhlIGh1Z2Vw
YWdlIGtlcm5lbCBhcmd1bWVudHMgKGh1Z2VwYWdlc3osIGh1Z2VwYWdlcywgYW5kCj4+IGRlZmF1
bHRfaHVnZXBhZ2Vzeikgd2hlbiBodWdlcGFnZXNfc3VwcG9ydCgpIHJldHVybnMgZmFsc2UuCj4K
PiBZb3UgY291bGQgYnJpZWZseSBtZW50aW9uIHRoZSBuZXcgb3V0cHV0IGhlcmUsIHNvIG9uZSBo
YXMgYSAKPiBiZWZvcmUtYWZ0ZXIgY29tcGFyaXNvbi4KCkhlcmUgaXMgdGhlIGZhZHVtcCBrZXJu
ZWwgYm9vdCBsb2dzIGFmdGVyIHRoaXMgcGF0Y2ggYXBwbGllZDoKa2VybmVsIGNvbW1hbmQgaGFk
OiBkZWZhdWx0X2h1Z2VwYWdlc3o9MUdCIGh1Z2VwYWdlc3o9MUdCIGh1Z2VwYWdlcz0yMDAKCkh1
Z2VUTEI6IGh1Z2VwYWdlcyB1bnN1cHBvcnRlZCwgaWdub3JpbmcgZGVmYXVsdF9odWdlcGFnZXN6
PTFHQiBjbWRsaW5lCkh1Z2VUTEI6IGh1Z2VwYWdlcyB1bnN1cHBvcnRlZCwgaWdub3JpbmcgaHVn
ZXBhZ2Vzej0xR0IgY21kbGluZQpIdWdlVExCOiBodWdlcGFnZXMgdW5zdXBwb3J0ZWQsIGlnbm9y
aW5nIGh1Z2VwYWdlcz0yMDAgY21kbGluZQpIdWdlVExCIHN1cHBvcnQgaXMgZGlzYWJsZWQhCmh1
Z2V0bGJmczogZGlzYWJsaW5nIGJlY2F1c2UgdGhlcmUgYXJlIG5vIHN1cHBvcnRlZCBodWdlcGFn
ZSBzaXplcwoKSSB3aWxsIHdhaXQgZm9yIGEgZGF5IG9yIHR3byBiZWZvcmUgc2VuZGluZyB2MiB3
aXRoIHRoZSBhYm92ZSBsb2dzIAppbmNsdWRlZCBpbgp0aGUgY29tbWl0IG1lc3NhZ2UuCgo+Cj4g
Q3VyaW91cywgc2hvdWxkIHdlIGF0IGxlYXN0IGFkZCBhIEZpeGVzOiB0YWc/IEFsbG9jYXRpbmcg
bWVtb3J5IHdoZW4gCj4gaXQncyBjb21wbGV0ZWx5IHVudXNhYmxlIHNvdW5kcyB3cm9uZy4KCk5v
dCBzdXJlIHdoaWNoIGNvbW1pdCBJIHNob3VsZCB1c2UgZm9yIEZpeGVzLiBUaGlzIGlzc3VlIGhh
cwpiZWVuIHByZXNlbnQgZm9yIGEgbG9uZyB0aW1lLCBwb3NzaWJseSBzaW5jZSB0aGUgYmVnaW5u
aW5nLgoKSSBhbHNvIG5vdGljZWQgYW4gaW50ZXJlc3RpbmcgaXNzdWUgcmVsYXRlZCB0byBleGNl
c3NpdmUgbWVtb3J5CmFsbG9jYXRpb24sIHdoZXJlIHRoZSBwcm9kdWN0aW9uL2ZpcnN0IGtlcm5l
bCBmYWlsZWQgdG8gYm9vdC4KV2hpbGUgdGVzdGluZyB0aGlzIHBhdGNoLCBJIGNvbmZpZ3VyZWQg
YSB2ZXJ5IGhpZ2ggaHVnZXBhZ2VzIChodWdlcGFnZXN6PTJNKQpjb3VudCwgYW5kIHRoZSBmaXJz
dCBrZXJuZWwgZmFpbGVkIHRvIGJvb3QgYXMgYSByZXN1bHQuIEkgd2lsbCByZXBvcnQgCnRoaXMg
aXNzdWUgc2VwYXJhdGVseS4KCj4KPiBbLi4uXQo+Cj4+ICvCoMKgwqAgaWYgKCFodWdlcGFnZXNf
c3VwcG9ydGVkKCkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHByX3dhcm4oIkh1Z2VUTEI6IGh1Z2Vw
YWdlcyB1bnN1cHBvcnRlZCwgaWdub3JpbmcgCj4+IGRlZmF1bHRfaHVnZXBhZ2Vzej0lcyBjbWRs
aW5lXG4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzKTsKPj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiAwOwo+PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKgwqDCoMKgIHBhcnNlZF92YWxpZF9o
dWdlcGFnZXN6ID0gZmFsc2U7Cj4+IMKgwqDCoMKgwqAgaWYgKHBhcnNlZF9kZWZhdWx0X2h1Z2Vw
YWdlc3opIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigiSHVnZVRMQjogZGVmYXVsdF9o
dWdlcGFnZXN6IHByZXZpb3VzbHkgc3BlY2lmaWVkLCAKPj4gaWdub3JpbmcgJXNcbiIsIHMpOwo+
Cj4KPiBMR1RNIQo+Cj4gQWNrZWQtYnk6IERhdmlkIEhpbGRlbmJyYW5kIChSZWQgSGF0KSA8ZGF2
aWRAa2VybmVsLm9yZz4KPgoKVGhhbmtzIGZvciB0aGUgQWNrIERhdmlkLgoKLSBTb3VyYWJoIEph
aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
