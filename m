Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A419CCA465
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 00:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qx33xm2vk3XkEVB2es35bekGgmxhsx5hZsQLzu9TfZs=; b=swZKj8vzE8IlDZxeabvvcS2dAI
	z4TPY7x8ZrkfkjuSgPjYQBhPwLwTwZ3hSrodx1w8M+qo6RzdnAlpLR9Cb6Ukl9a8p3QQtWbDLYQfK
	EpaoJuHYJ5n7oipfFF4AolBEZCc6XJFyv9wb0iZlFHCQABYW4g3KTdlEWGWyc0j2L1e0Kq6GlG6H7
	i0CNX4x7eFmvVAnLu0nkmOO60pRM5eReL9sWfYE+cB7NrzohihCgerUhEYEchNFfByzcIJlFftFM0
	9l7H6QJ7hz/IxUqobhSgJCb/8Yd6rGAn2meoJaKXMUuRiwVZVnyzUi6QZGKbqL5alTCBrK+6Z+mao
	1w4eW2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVQF-00000001at9-2dTJ;
	Fri, 16 Oct 2026 00:03:43 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVQC-00000001asm-2khP
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 00:03:42 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FJSN6v437488;
	Fri, 16 Oct 2026 00:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/J9vkQ
	nHyxosFoJr9W9QBtjq0YYxgnpGBT61RpVtPOM=; b=T8JmhcIdM+IZlDu1hLe31J
	m6mbjwcWL7wzOhkhG48GMAQlsaYPR+qFspy9MtxmiqJAc7tEhHppbNKH9Ly6ZtZV
	VqxL0sG8s2UwXNLFqIJ/BYZUI5pdL3Q7nroUwRsfUZ8NnojGqzqlf4TRT4AYhP4L
	6FIDNuGbJCz0GmEFk/Hg39Qj1dTW+wDF8Je9F6lhuDnTz0Ez1O9eo34NkYGd3QWl
	cZT5GXWip3BeiaEHOopn1erdpxY1LeO4vtBHH3q98w6K3sLk76T90ISRopD52k3Y
	zDVC5jr2MvAZIMwg+xjEXbsZPTVrL2CYSC8Mm8BnPyO6Np9NnZwnVMHA81Yvggnw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwjc4bu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 00:02:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69FN3x9q1927457;
	Fri, 16 Oct 2026 00:02:54 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h9ypq94xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 00:02:54 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69G02sUl44827056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Oct 2026 00:02:54 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18558580DF;
	Fri, 16 Oct 2026 00:02:54 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36309580E3;
	Fri, 16 Oct 2026 00:02:51 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.159.15])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Oct 2026 00:02:51 +0000 (GMT)
Message-ID: <2dd935d171066eb4f1c251184eee871ad91f46b4.camel@linux.ibm.com>
Subject: Re: [PATCH] kexec: Select ima_get/free_kexec_buffer() with
 CONFIG_HAVE_IMA_KEXEC(_OF)
From: Mimi Zohar <zohar@linux.ibm.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, catalin.marinas@arm.com,
        will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org,
        kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
        saravanak@kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, noodles@fb.com,
        linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
        Roberto Sassu
 <roberto.sassu@huawei.com>
In-Reply-To: <20261014150005.138309-1-roberto.sassu@huaweicloud.com>
References: <20261014150005.138309-1-roberto.sassu@huaweicloud.com>
Date: Thu, 15 Oct 2026 20:04:39 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA5NCBTYWx0ZWRfX2HSmi+79F5sk
 F6cJ7NPejHB+7WHifxwy2jTNeN+1trz8LY4O/c9Nrxfke0WNdl7j1Q+67s4DKMWPR6esIHz8ktI
 K0tq6WDkqAuHdd5alAeGCbELszv+Iy4JZ0+fqSO/L13P8KVSgc+hLSs0BUMcp1abGeEddTWuQ0x
 DgckQmdPn28cVLNyaRpJNpQgHrkPzvNhtB4BrwiL11DqWhTQ4iKZBnJ6O6YMYp3wIbPkHlbPNTu
 yuFjLtwZNiUnx0o6/TBRUj7JJDZnA2Psv+zNVmANtyZBcqWuyk14cfQgW2Kd9p6jpMvxEPS0i4P
 9izNnrleHEY+3qJ5vxEC5owm2SmqeBCu4OE58PHvT8msLi1bqUTwEmcDI3uhC1lcyvBSJ8AI2/Z
 P4yU5XoeV0+kwIer2DSUzTnv5W4e9/IuU49Yz1D77lWvgRbiAXpcAuzu2CM8QtMFWDh3J7Pn/95
 F6Hddu++a3Zm8l5+F0g==
X-Proofpoint-GUID: NTtm2mgFbtZvv4BT6wKycrFWT1K8ZNoK
X-Proofpoint-ORIG-GUID: tiREeBn2CptRBXexEe4TPGoQAtBFlstP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA5NCBTYWx0ZWRfX/DAorNGlPVs4
 yv5/RElxR2BVrhNGnK8pZHiy6neDZgmPdHp2jFgKzGeIaabQ9Lw8/ORsLJZrcqeRQhQk4Obp43l
 W/UyHe4tHhV1wBc+cnuG7GIYhmkZQRE=
X-Authority-Analysis: v=2.4 cv=btHZl0ai c=1 sm=1 tr=0 ts=6ad169af cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=i0EeH86SAAAA:8
 a=oj6d6ukrGZa-rDQ9-ikA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_170340_821604_BE7BB25A 
X-CRM114-Status: GOOD (  22.57  )
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

SGkgUm9iZXJ0bywKCk9uIFdlZCwgMjAyNi0xMC0xNCBhdCAxNzowMCArMDIwMCwgUm9iZXJ0byBT
YXNzdSB3cm90ZToKPiBGcm9tOiBSb2JlcnRvIFNhc3N1IDxyb2JlcnRvLnNhc3N1QGh1YXdlaS5j
b20+CgpUaGUgZmlyc3QgcGFyYWdyYXBoIHNob3VsZCBleHBsYWluIHRoZSBwcm9ibGVtIGZyb20g
YSBoaWdoIGxldmVsOiB0aGUgdXNlci0KdmlzaWJsZSBpbXBhY3QgYW5kIGNhdXNlLiBGb3IgZXhh
bXBsZSwgc29tZXRoaW5nIGxpa2U6CgrigJxPbiB4ODYsIGlmIENPTkZJR19PRl9GTEFUVFJFRSBp
cyBlbmFibGVkLCB0aGUga2VybmVsIHVzZXMgdGhlIGRldmljZSB0cmVlCmltcGxlbWVudGF0aW9u
IG9mIGltYV9nZXQvZnJlZV9rZXhlY19idWZmZXIoKS4gSG93ZXZlciwgeDg2IGRvZXNu4oCZdCBw
YXNzIHRoZSBJTUEKYnVmZmVyIHRocm91Z2ggdGhlIGRldmljZSB0cmVlLCBzbyB0aGUgYnVmZmVy
IGlzIG5ldmVyIGZvdW5kIGFuZCB0aGUgSU1BCm1lYXN1cmVtZW50IGxvZyBpcyBub3QgY2Fycmll
ZCBvdmVyIGFjcm9zcyBrZXhlYy7igJ0KClRoZW4gY29udGludWUgd2l0aCB0aGUgZml4OiBkZWZp
bmluZyBDT05GSUdfSEFWRV9JTUFfS0VYRUNfT0YgYW5kIHNlbGVjdGluZyBpdApvbmx5IG9uIHRo
ZSBhcmNoaXRlY3R1cmVzIHRoYXQgdXNlIHRoZSBkZXZpY2UgdHJlZSBpbXBsZW1lbnRhdGlvbi4K
CnRoYW5rcywKCk1pbWkKCj4gCj4gVGhlIGltYV9nZXQvZnJlZV9rZXhlY19idWZmZXIoKSBkZXZp
Y2UgdHJlZSBpbXBsZW1lbnRhdGlvbiByZWxpZXMgb24gdGhlCj4gYXJjaCBjb2RlIGNhbGxpbmcg
b2Zfa2V4ZWNfYWxsb2NfYW5kX3NldHVwX2ZkdCgpIHRvIHBhc3MgdGhlIGluZm9ybWF0aW9uCj4g
YWJvdXQgd2hlcmUgdGhlIElNQSBrZXhlYyBidWZmZXIgaXMgbG9jYXRlZC4gT25seSB0aGUgYXJt
NjQsIHBvd2VycGMgYW5kCj4gcmlzY3YgYXJjaGl0ZWN0dXJlcyBzdXBwb3J0IHRoYXQuIExvb25n
QXJjaCBpbXBsaWNpdGx5IGFzc3VtZXMgdGhhdCB0aGUKPiBkZXZpY2UgdHJlZSBpbXBsZW1lbnRh
dGlvbiBpcyB1c2VkLCBidXQgaXQgZG9lcyBub3QgY2FsbCB0aGF0IGZ1bmN0aW9uLgoKPiAKPiBU
aGUgaW1hX2dldC9mcmVlX2tleGVjX2J1ZmZlcigpIHg4NiBpbXBsZW1lbnRhdGlvbiBpbnN0ZWFk
IHN0aWxsIHJlbGllcyBvbgo+IHRoZSBzZXR1cCBkYXRhIHRvIHBhc3MgdGhlIGtleGVjIGJ1ZmZl
ciBpbmZvcm1hdGlvbiwgYW5kIGlzIGJ1aWx0IG9ubHkgaWYKPiBDT05GSUdfT0ZfRkxBVFRSRUUg
aXMgbm90IGRlZmluZWQuCj4gCj4gSG93ZXZlciwgaWYgQ09ORklHX09GX0ZMQVRUUkVFIGlzIHNl
bGVjdGVkIGluIHg4NiwgeDg2IGF0dGVtcHRzIHRvIHVzZSB0aGUKPiBkZXZpY2UgdHJlZSBpbXBs
ZW1lbnRhdGlvbnMgb2YgaW1hX2dldC9mcmVlX2tleGVjX2J1ZmZlcigpLCB3aGljaCBhcmUgbmV2
ZXIKPiBnb2luZyB0byBzdWNjZWVkIGJlY2F1c2Ugb2Zfa2V4ZWNfYWxsb2NfYW5kX3NldHVwX2Zk
dCgpIGlzIG5vdCBjYWxsZWQgZm9yCj4gdGhhdCBhcmNoaXRlY3R1cmUuCj4gCj4gSW5zdGVhZCwg
ZGVmaW5lIENPTkZJR19IQVZFX0lNQV9LRVhFQ19PRiAoYXV0b21hdGljYWxseSBzZWxlY3RzCj4g
SEFWRV9JTUFfS0VYRUMpLCBzZWxlY3QgaXQgZm9yIHRoZSBhcmNoaXRlY3R1cmVzIHRoYXQgc2hv
dWxkIHVzZSB0aGUKPiBpbWFfZ2V0L2ZyZWVfa2V4ZWNfYnVmZmVyKCkgZGV2aWNlIHRyZWUgaW1w
bGVtZW50YXRpb24sIGFuZCBlbmFibGUgdGhlc2UKPiBmdW5jdGlvbnMgaWYgdGhlIG5ldyBjb25m
aWcgb3B0aW9uIGlzIGVuYWJsZWQuIFNldCBpdCBhbHNvIG9uIExvb25nQXJjaCwgdG8KPiBwcmVz
ZXJ2ZSB0aGUgY3VycmVudCBiZWhhdmlvciBhbmQgYXZvaWQgYSBsaW5rIGZhaWx1cmUuIExvb25n
QXJjaCBkb2VzIG5vdAo+IHBhc3MgdGhlIGJ1ZmZlciBsb2NhdGlvbiB0byB0aGUgbmV4dCBrZXJu
ZWwgeWV0OyB0aGlzIHdpbGwgYmUgYWRkcmVzc2VkCj4gc2VwYXJhdGVseS4KPiAKPiBGaW5hbGx5
LCBkb24ndCBzZWxlY3QgaXQgZm9yIHg4NiwgYW5kIHVzZSB4ODYncyBvd24gc2V0dXBfZGF0YS1i
YXNlZAo+IGltcGxlbWVudGF0aW9uIHJlZ2FyZGxlc3Mgb2YgQ09ORklHX09GX0ZMQVRUUkVFLgo+
IAo+IEZpeGVzOiBiNjlhMmFmZDVhZmMgKCJ4ODYva2V4ZWM6IENhcnJ5IGZvcndhcmQgSU1BIG1l
YXN1cmVtZW50IGxvZyBvbiBrZXhlYyIpCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0byBTYXNzdSA8
cm9iZXJ0by5zYXNzdUBodWF3ZWkuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
