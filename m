Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FEAE668B4
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akKN6ba6IcN+ea/7a2U59nbIu+/Ztn9ob3vsDzmgubg=; b=cIJs7Z8vG3YEpm
	G3Rbcxzi2vjwuG27p3iMWOMRE3wFbx4/UhHz2BxWkU8/iKAup1fw2hBlS4YwXbEpzLRLbIZP6aivL
	YibY7fJPd99rf0iuvP+34JuET0jc2rRNLC9F1DukuHLoGQkVI2/0Tsta06965TVf92Wc9OSm9jDF5
	kfexsHcdtgz3ohoGOzXTmUbv0nFmhx5rVyj3H1mPdo4Z7jxTNPVWT6QrWR28E8B66/9YFjq7VRqxK
	WKI+wtm/hue0jQ2kvWKdtBRg9eoK1gXpk1SCaKCNtdiPKx3MFcW0FrKlE5bw4M12pehWefvzDI6y5
	E7PY7wPbBLKQLHqdlG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyJC-0000000BfSH-0KTa;
	Sat, 20 Dec 2025 14:51:50 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyJ8-0000000BfRk-2vq9
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 14:51:48 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BK2u2OC016773;
	Sat, 20 Dec 2025 14:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=djfhIu
	JvYr8fZjpwPdnh6ePE1iA9EV9e5HBHaApl7YE=; b=dxSCe++Jf2cc1xWe9cI8+q
	8VhoG/4hiDU81tLrM9wnVlYBVLxkcVtNq0/dbohCXCiKgDI8/F6h0DuegrzDndXk
	kcMHdpnBrgZGYIbb5lvFhr0fH/y05s1M1aeWsvCZpJfP6J8paz7ZAiAMqSEXgU4f
	ubBxEFHG0+FaAlGY8Vmvjy3ychYjHG51gFCok4DTFsBUv0vd1o1KbY/IM0Y8afCD
	ZDkopg94qC8GTbx7rMCvt4lZwiFj+o2HQ5TqWNasPOxdL+rnRCaBW5fZA2ALjFer
	gzhC6vtNAK6BOU/V+fkO5QdRDw0wyu9sAwrbOXB2lauLrqOWFOZCiIRa4deC25lw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kethexa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Dec 2025 14:50:55 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BKEosAG001104;
	Sat, 20 Dec 2025 14:50:54 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kethex8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Dec 2025 14:50:54 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BK954Q5006164;
	Sat, 20 Dec 2025 14:50:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b4qvqrrw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Dec 2025 14:50:53 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BKEonUX31588812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 20 Dec 2025 14:50:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AC7C2004B;
	Sat, 20 Dec 2025 14:50:49 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0ACF420040;
	Sat, 20 Dec 2025 14:50:46 +0000 (GMT)
Received: from [9.124.209.127] (unknown [9.124.209.127])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 20 Dec 2025 14:50:45 +0000 (GMT)
Message-ID: <a2bc427d-a41c-4b8f-b006-021390ff0070@linux.ibm.com>
Date: Sat, 20 Dec 2025 20:20:44 +0530
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
        x86@kernel.org, linux-riscv@lists.infradead.org
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
 <83920c44-47f5-4a46-bfa7-76713197d7e4@kernel.org>
 <1fddcf72-26f7-4fb4-84b8-1328e486d58e@linux.ibm.com>
 <64a9ca24-2968-4532-ac04-594c340ec2a2@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <64a9ca24-2968-4532-ac04-594c340ec2a2@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -UJ_23oZBmFZhfvHtHo9iau46cSaqYPO
X-Authority-Analysis: v=2.4 cv=Qdxrf8bv c=1 sm=1 tr=0 ts=6946b7cf cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=z6Ez1-wMAixVQXjHHx4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: EIWVDUCMc9Mrg17J49sUpCdeutt-GuAL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEyNyBTYWx0ZWRfX1+huJTyQIbeo
 no9LO/EePOuyWY0Qs78ZfePtdlkwmKgnzx5jBZObrMuKxOyrfYlTYF3BN+3NJVMPqtsAvxUU+9Y
 wjG92PrqHSel+FQFGRaCGHi+PReMrcJc9bfI56RtoJ/WaxUXqSyXBwzuZ9hlzQiYdvrOUKGyarP
 UNMex/W0oJmqmhKn6vDN5nUTXXPjQga6nJ1Yf1S7NmUV3DcvSeninTQwBQMhSIpmvBmgprGPEx0
 LKIBT+0iV/uX8x5r8yQLxAZVmlM/5jrYVemys26LU8bEu/5Ad6MMwnWTWztK0aEpMXxq/YVTZPk
 OP25uBUwHptUDNSvIRgHXlZYbbL/m7m0Cn/xrYSE44X3ZkMa5s5HC/fodbo6C18T1SCToTVO3Pu
 PktBc5LbgoaID+BINaW097kiiNX7Xki+zD2+bXyVWRnnVBN9/nggJ8iV1V4IgqtX0MxB3XYAVbT
 +4pdLD2EAQy96bAU+tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512200127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_065146_881361_3F80763B 
X-CRM114-Status: GOOD (  22.38  )
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

CgpPbiAxOS8xMi8yNSAxMTo0MywgRGF2aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIHdyb3RlOgo+
IE9uIDEyLzE4LzI1IDE0OjA2LCBTb3VyYWJoIEphaW4gd3JvdGU6Cj4+Cj4+Cj4+IE9uIDE4LzEy
LzI1IDE3OjMyLCBEYXZpZCBIaWxkZW5icmFuZCAoUmVkIEhhdCkgd3JvdGU6Cj4+PiBPbiAxMi8x
OC8yNSAxMjo0MSwgU291cmFiaCBKYWluIHdyb3RlOgo+Pj4+IFNraXAgcHJvY2Vzc2luZyBodWdl
cGFnZSBrZXJuZWwgYXJndW1lbnRzIChodWdlcGFnZXN6LCBodWdlcGFnZXMsIGFuZAo+Pj4+IGRl
ZmF1bHRfaHVnZXBhZ2Vzeikgd2hlbiBodWdlcGFnZXMgYXJlIG5vdCBzdXBwb3J0ZWQgYnkgdGhl
Cj4+Pj4gYXJjaGl0ZWN0dXJlLgo+Pj4+Cj4+Pj4gU29tZSBhcmNoaXRlY3R1cmVzIG1heSBuZWVk
IHRvIGRpc2FibGUgaHVnZXBhZ2VzIGJhc2VkIG9uIGNvbmRpdGlvbnMKPj4+PiBkaXNjb3ZlcmVk
IGR1cmluZyBrZXJuZWwgYm9vdC4gVGhlIGh1Z2VwYWdlc19zdXBwb3J0ZWQoKSBoZWxwZXIgYWxs
b3dzCj4+Pj4gYXJjaGl0ZWN0dXJlIGNvZGUgdG8gYWR2ZXJ0aXNlIHdoZXRoZXIgaHVnZXBhZ2Vz
IGFyZSBzdXBwb3J0ZWQuCj4+Pj4KPj4+PiBDdXJyZW50bHksIG5vcm1hbCBodWdlcGFnZSBhbGxv
Y2F0aW9uIGlzIGd1YXJkZWQgYnkKPj4+PiBodWdlcGFnZXNfc3VwcG9ydGVkKCksIGJ1dCBnaWdh
bnRpYyBodWdlcGFnZXMgYXJlIGFsbG9jYXRlZCByZWdhcmRsZXNzCj4+Pj4gb2YgdGhpcyBjaGVj
ay4gVGhpcyBjYXVzZXMgcHJvYmxlbXMgb24gcG93ZXJwYyBmb3IgZmFkdW1wIChmaXJtd2FyZS0K
Pj4+PiBhc3Npc3RlZCBkdW1wKS4KPj4+Pgo+Pj4+IEluIHRoZSBmYWR1bXAgKGZpcm13YXJlLWFz
c2lzdGVkIGR1bXApIHNjZW5hcmlvLCBhIHByb2R1Y3Rpb24ga2VybmVsCj4+Pj4gY3Jhc2ggY2F1
c2VzIHRoZSBzeXN0ZW0gdG8gYm9vdCBpbnRvIGEgc3BlY2lhbCBrZXJuZWwgd2hvc2Ugc29sZQo+
Pj4+IHB1cnBvc2UgaXMgdG8gY29sbGVjdCB0aGUgbWVtb3J5IGR1bXAgYW5kIHJlYm9vdC4gRmVh
dHVyZXMgc3VjaCBhcwo+Pj4+IGh1Z2VwYWdlcyBhcmUgbm90IHJlcXVpcmVkIGluIHRoaXMgZW52
aXJvbm1lbnQgYW5kIHNob3VsZCBiZQo+Pj4+IGRpc2FibGVkLgo+Pj4+Cj4+Pj4gRm9yIGV4YW1w
bGUsIGZhZHVtcCBrZXJuZWwgYm9vdGluZyB3aXRoIHRoZSBrZXJuZWwgYXJndW1lbnRzCj4+Pj4g
ZGVmYXVsdF9odWdlcGFnZXN6PTFHQiBodWdlcGFnZXN6PTFHQiBodWdlcGFnZXM9MjAwIHByaW50
cyB0aGUKPj4+PiBmb2xsb3dpbmcgbG9nczoKPj4+Pgo+Pj4+IEh1Z2VUTEI6IGFsbG9jYXRpbmcg
MjAwIG9mIHBhZ2Ugc2l6ZSAxLjAwIEdpQiBmYWlsZWQuwqAgT25seSBhbGxvY2F0ZWQKPj4+PiA1
OCBodWdlcGFnZXMuCj4+Pj4gSHVnZVRMQiBzdXBwb3J0IGlzIGRpc2FibGVkIQo+Pj4+IEh1Z2VU
TEI6IGh1Z2UgcGFnZXMgbm90IHN1cHBvcnRlZCwgaWdub3JpbmcgYXNzb2NpYXRlZCBjb21tYW5k
LWxpbmUKPj4+PiBwYXJhbWV0ZXJzCj4+Pj4gaHVnZXRsYmZzOiBkaXNhYmxpbmcgYmVjYXVzZSB0
aGVyZSBhcmUgbm8gc3VwcG9ydGVkIGh1Z2VwYWdlIHNpemVzCj4+Pj4KPj4+PiBFdmVuIHRob3Vn
aCB0aGUgbG9ncyBzYXkgdGhhdCBodWdldGxiIHN1cHBvcnQgaXMgZGlzYWJsZWQsIGdpZ2FudGlj
Cj4+Pj4gaHVnZXBhZ2VzIGFyZSBzdGlsbCBnZXR0aW5nIGFsbG9jYXRlZCwgd2hpY2ggY2F1c2Vz
IHRoZSBmYWR1bXAga2VybmVsCj4+Pj4gdG8gcnVuIG91dCBvZiBtZW1vcnkgZHVyaW5nIGJvb3Qu
Cj4+Pgo+Pj4gWWVhaCwgdGhhdCdzIHN1Ym9wdGltYWwuCj4+Pgo+Pj4+Cj4+Pj4gVG8gZml4IHRo
aXMsIHRoZSBnaWdhbnRpYyBodWdlcGFnZSBhbGxvY2F0aW9uIHNob3VsZCBjb21lIHVuZGVyCj4+
Pj4gaHVnZXBhZ2VzX3N1cHBvcnRlZCgpLgo+Pj4+Cj4+Pj4gVG8gYnJpbmcgZ2lnYW50aWMgaHVn
ZXBhZ2UgYWxsb2NhdGlvbiB1bmRlciBodWdlcGFnZXNfc3VwcG9ydGVkKCksIHR3bwo+Pj4+IGFw
cHJvYWNoZXMgd2VyZSBwcmV2aW91c2x5IHByb3Bvc2VkOgo+Pj4+IFsxXSBDaGVjayBodWdlcGFn
ZXNfc3VwcG9ydGVkKCkgaW4gdGhlIGdlbmVyaWMgY29kZSBiZWZvcmUgYWxsb2NhdGluZwo+Pj4+
IGdpZ2FudGljIGh1Z2VwYWdlcy4KPj4+PiBbMl0gTWFrZSBhcmNoX2h1Z2V0bGJfdmFsaWRfc2l6
ZSgpIHJldHVybiBmYWxzZSBmb3IgYWxsIGh1Z2V0bGIgc2l6ZXMuCj4+Pj4KPj4+PiBBcHByb2Fj
aCBbMl0gaGFzIHR3byBtaW5vciBpc3N1ZXM6Cj4+Pj4gMS4gSXQgcHJpbnRzIG1pc2xlYWRpbmcg
bG9ncyBhYm91dCBpbnZhbGlkIGh1Z2VwYWdlIHNpemVzCj4+Pj4gMi4gVGhlIGtlcm5lbCBzdGls
bCBwcm9jZXNzZXMgaHVnZXBhZ2Uga2VybmVsIGFyZ3VtZW50cyB1bm5lY2Vzc2FyaWx5Cj4+Pj4K
Pj4+PiBUbyBjb250cm9sIGdpZ2FudGljIGh1Z2VwYWdlIGFsbG9jYXRpb24sIGl0IGlzIHByb3Bv
c2VkIHRvIHNraXAKPj4+PiBwcm9jZXNzaW5nIHRoZSBodWdlcGFnZSBrZXJuZWwgYXJndW1lbnRz
IChodWdlcGFnZXN6LCBodWdlcGFnZXMsIGFuZAo+Pj4+IGRlZmF1bHRfaHVnZXBhZ2Vzeikgd2hl
biBodWdlcGFnZXNfc3VwcG9ydCgpIHJldHVybnMgZmFsc2UuCj4+Pgo+Pj4gWW91IGNvdWxkIGJy
aWVmbHkgbWVudGlvbiB0aGUgbmV3IG91dHB1dCBoZXJlLCBzbyBvbmUgaGFzIGEKPj4+IGJlZm9y
ZS1hZnRlciBjb21wYXJpc29uLgo+Pgo+PiBIZXJlIGlzIHRoZSBmYWR1bXAga2VybmVsIGJvb3Qg
bG9ncyBhZnRlciB0aGlzIHBhdGNoIGFwcGxpZWQ6Cj4+IGtlcm5lbCBjb21tYW5kIGhhZDogZGVm
YXVsdF9odWdlcGFnZXN6PTFHQiBodWdlcGFnZXN6PTFHQiBodWdlcGFnZXM9MjAwCj4+Cj4+IEh1
Z2VUTEI6IGh1Z2VwYWdlcyB1bnN1cHBvcnRlZCwgaWdub3JpbmcgZGVmYXVsdF9odWdlcGFnZXN6
PTFHQiBjbWRsaW5lCj4+IEh1Z2VUTEI6IGh1Z2VwYWdlcyB1bnN1cHBvcnRlZCwgaWdub3Jpbmcg
aHVnZXBhZ2Vzej0xR0IgY21kbGluZQo+PiBIdWdlVExCOiBodWdlcGFnZXMgdW5zdXBwb3J0ZWQs
IGlnbm9yaW5nIGh1Z2VwYWdlcz0yMDAgY21kbGluZQo+PiBIdWdlVExCIHN1cHBvcnQgaXMgZGlz
YWJsZWQhCj4+IGh1Z2V0bGJmczogZGlzYWJsaW5nIGJlY2F1c2UgdGhlcmUgYXJlIG5vIHN1cHBv
cnRlZCBodWdlcGFnZSBzaXplcwo+Pgo+PiBJIHdpbGwgd2FpdCBmb3IgYSBkYXkgb3IgdHdvIGJl
Zm9yZSBzZW5kaW5nIHYyIHdpdGggdGhlIGFib3ZlIGxvZ3MKPj4gaW5jbHVkZWQgaW4KPj4gdGhl
IGNvbW1pdCBtZXNzYWdlLgo+Pgo+Pj4KPj4+IEN1cmlvdXMsIHNob3VsZCB3ZSBhdCBsZWFzdCBh
ZGQgYSBGaXhlczogdGFnPyBBbGxvY2F0aW5nIG1lbW9yeSB3aGVuCj4+PiBpdCdzIGNvbXBsZXRl
bHkgdW51c2FibGUgc291bmRzIHdyb25nLgo+Pgo+PiBOb3Qgc3VyZSB3aGljaCBjb21taXQgSSBz
aG91bGQgdXNlIGZvciBGaXhlcy4gVGhpcyBpc3N1ZSBoYXMKPj4gYmVlbiBwcmVzZW50IGZvciBh
IGxvbmcgdGltZSwgcG9zc2libHkgc2luY2UgdGhlIGJlZ2lubmluZy4KPgo+IEkgZG9uJ3Qga25v
dyB0aGUgZnVsbCBoaXN0b3J5LCBidXQgSSB3b3VsZCBhc3N1bWUgdGhhdCBzdXBwb3J0IGZvciAK
PiBnaWdhbnRpYyBwYWdlcyB3YXMgYWRkZWQgbGF0ZXI/Cj4KPiBJdCB3b3VsZCBiZSBncmVhdCBp
ZiB5b3UgY291bGQgZGlnIGEgYml0IHNvIHdlIGNvdWxkIGFkZCBhIEZpeGVzOi4KClRoZSBiZWxv
dyBjb21taXQgcmVtb3ZlZCB0aGUgaHVnZXBhZ2VzX3N1cHBvcnRlZCgpIGNhbGwgZnJvbSBhbGwg
dGhyZWUKY29tbWFuZC1saW5lIHBhcnNpbmcgZnVuY3Rpb25zLCB3aGljaCBpbmFkdmVydGVudGx5
IGNyZWF0ZWQgYW4gaXNzdWUKZm9yIGZhZHVtcCB0aGF0IG15IGNoYW5nZXMgYXR0ZW1wdCB0byBm
aXguCgpodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9YzI4MzNhNWJmNzViMzY1N2M0ZGQyMGIzNzA5
YzhjNzAyNzU0Y2IxZgoKSSB3aWxsIGFkZCBmaXhlcyB0YWcgb24gYWJvdmUgY29tbWl0IGFuZCBz
ZW5kIHRoZSBuZXh0IHZlcnNpb24uCgotIFNvdXJhYmggSmFpbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
