Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8027C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6F8F+y5UO7aN8svCf/bj0SgfeQOgrngreXX0vkfZt0=; b=TiKvR7Nib/nVuh
	I4s3RDgID4umTiYHtvFPHlJuF6Qeep5m3QMOnHaXMbDcAJZrpUvkqkszLs2wML8lrA1OHVLoIIcnN
	2JD1GOOmYz9d/TUkJh+stukooGIqT6DiIM4qnKGIT5fUW6RUqnIMQPAm9qzOC6iUluc6ok3l+LiO5
	lqX7ytTy4Ck2Awfm9/xhh4hXuErjHrYSQ2oTbOoAP5im6/HZ5y4jEfZ2IVJp93hQfA1p9cQLiZS13
	MCJVCEiH4SW/xqLZhO/CjjDIiPw7RMj16H54SaQPLH0yp+cwHV3ee84ZBKBr55BDPEQ9lzM9yzTg9
	n0giiH642k61qyLb7EYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWY4u-00000004jKy-1Zss;
	Tue, 01 Jul 2025 10:19:04 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWY2a-00000004iyg-2rgC;
	Tue, 01 Jul 2025 10:16:41 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5616feQ9015295;
	Tue, 1 Jul 2025 10:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bI5gCu
	bobaT76ILZ7nxLCeAprDNwZM108vGmis92vfw=; b=PjDoYwjtYkSnDRugC3E/Hv
	o51v3h2eqLbh9PbKCz24WznV4ZvLaYp6Jd8agA71iKB5BcxaWfNXDxx/GBRMKaW3
	3zwQRfDGD1wbtMpiFA30+yJ0p2Dz70v8RKSPdvUI6qypZ6CrGufrf+7IIFEUHjpn
	VmkbQl7a8Y3LA2aHvCqH/jproxX7Zk8z+3ExVJMJr0374lAG/InCZaGor60RhO/n
	pZkHKDq5PA9Rrp9xR6ocRlUp4mDAsxk77EVa6HUg/PlWw41EfjilnF4bkr92n46Q
	F8/88KcMiADFeGk8H7HpkIgzcddU+eeOqjJiJQCQdUedp0LGnNlGkuTdVNCZIoJA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j830pmab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:15:48 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 561A93Md010712;
	Tue, 1 Jul 2025 10:15:47 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j830pma6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:15:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56173CoY032320;
	Tue, 1 Jul 2025 10:15:45 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47ju40j8xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:15:45 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 561AFfZk21365030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Jul 2025 10:15:41 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4405320040;
	Tue,  1 Jul 2025 10:15:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32B5D20075;
	Tue,  1 Jul 2025 10:15:39 +0000 (GMT)
Received: from osiris (unknown [9.111.81.242])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  1 Jul 2025 10:15:39 +0000 (GMT)
Date: Tue, 1 Jul 2025 12:15:37 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
        glider@google.com, dvyukov@google.com, vincenzo.frascino@arm.com,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
        akpm@linux-foundation.org, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, arnd@arndb.de, rppt@kernel.org,
        geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com,
        tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
        linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with
 kasan_enabled
Message-ID: <20250701101537.10162Aa0-hca@linux.ibm.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
 <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
 <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
 <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qu16htFmviN0JHs_Lk2UXggpRHKamSL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1OCBTYWx0ZWRfX1+8afvt373Lc kWdnunbPz6C9f/GOHjl4ZrQKHABgOATpMhlNHzlwXmovxD7qpB0NHRzjO1rBP3TCrzWp9aDgeMZ BRGyDtucaQptfKRiB1Ir1UEiA/DnvvId+/noIpRKGxbqodALAZAM/OouyWSCdZn9Br55SUFY1mF
 /QElD3fMWDED/2Up/bE3bdkQFp0y4l0tbOgz/r1X+BYJtzifCAp1d8Rjiv1rqAaxBvj1uWPWfAv gRsEeOrKai0th89ONMoXzLZtwQ+ZFabmyQx6rICdTSFHm+Cjr3wa4WzluId4DM526gzf4NqEHxp T9u38OW/UmDyf8gxdR/KVtrZKshh0EQP4/y/BFKLU+IB3+JEAkKDZdFyiBgBhMsxkkHSKm2H012
 aLNkwLyaNoCYreQzuUSpD2tKUqxrMT5HjvgLBKo4Yoqu8W0zpbow/WbwFXvshhrHRfN8RYzo
X-Authority-Analysis: v=2.4 cv=MOlgmNZl c=1 sm=1 tr=0 ts=6863b554 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=jBQngTtrd59FM_Ge02gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: HLwv3VLvA_zkneOazGXOaA6Q1nuISU0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 mlxlogscore=906 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_031640_720977_A663DD99 
X-CRM114-Status: GOOD (  30.24  )
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

PiA+ID4gQW5vdGhlciB0aGluZyB0aGF0IG5lZWRzIGNhcmVmdWwgY29uc2lkZXJhdGlvbiBpcyB3
aGV0aGVyIGl0J3MKPiA+ID4gcG9zc2libGUgdG8gY29tYmluZSBrYXNhbl9hcmNoX2lzX3JlYWR5
KCkgYW5kIGthc2FuX2VuYWJsZWQoKSBpbnRvIHRoZQo+ID4gPiBzYW1lIGNoZWNrIGxvZ2ljYWxs
eSBhdCBhbGwuIFRoZXJlJ3Mgb25lIGlzc3VlIG1lbnRpb25lZCBpbiBbMV06Cj4gPgo+ID4gSGVs
bG8sCj4gPiBJJ3ZlIHJlbW92ZWQga2FzYW5fYXJjaF9pc19yZWFkeSgpIGF0IGFsbCBpbiB0aGlz
IHNlcmllczoKPiA+IFtQQVRDSCB2MiAxMS8xMV0ga2FzYW46IHJlcGxhY2Uga2FzYW5fYXJjaF9p
c19yZWFkeSB3aXRoIGthc2FuX2VuYWJsZWQKPiA+Cj4gPiBJcyBpdCBub3Qgd2hhdCdzIGV4cGVj
dGVkIGJ5IHVuaWZpY2F0aW9uPwo+IAo+IEkgZ3Vlc3MgdGhlIGlzc3VlIGRlc2NyaXB0aW9uIGRp
dmVyZ2VkIGEgYml0IGZyb20gd2hhdCBuZWVkcyB0byBiZQo+IGRvbmUsIHNvcnJ5IGFib3V0IHRo
YXQuCj4gCj4gVGhlIGNvcmUgMiB0aGluZ3MgSSB3YW50ZWQgdG8gYWRkcmVzcyB3aXRoIHRoZSB1
bmlmaWNhdGlvbiBhcmU6Cj4gCj4gMS4gQXZvaWQgc3ByYXlpbmcga2FzYW5fYXJjaF9pc19yZWFk
eSgpIHRocm91Z2hvdXQgdGhlIEtBU0FOCj4gaW1wbGVtZW50YXRpb24gYW5kIG1vdmUgdGhlc2Ug
Y2hlY2tzIGludG8gaW5jbHVkZS9saW51eC9rYXNhbi5oIChhbmQKPiBhZGQgX193cmFwcGVycyB3
aGVuIHJlcXVpcmVkKS4KPiAKPiAyLiBBdm9pZCBhcmNoaXRlY3R1cmVzIHJlZGVmaW5pbmcgdGhl
IHNhbWUga2FzYW5fZW5hYmxlZCBnbG9iYWwKPiB2YXJpYWJsZS9zdGF0aWMga2V5Lgo+IAo+IElu
aXRpYWxseSwgSSB0aG91Z2h0IHRoYXQgcy9rYXNhbl9hcmNoX2lzX3JlYWR5L2thc2FuX2VuYWJs
ZWQgKyBzaW1wbHkKPiBtb3ZpbmcgdGhlIGNhbGxzIGludG8gYWZmZWN0ZWQgaW5jbHVkZS9saW51
eC9rYXNhbi5oIGZ1bmN0aW9ucyB3b3VsZAo+IGJlIGVub3VnaC4gQnV0IHRoZW4sIGJhc2VkIG9u
IFsxXSwgdHVybnMgb3V0IGl0J3Mgbm90IHRoYXQgc2ltcGxlLgo+IAo+IFNvIG5vdywgSSB0aGlu
ayB3ZSBsaWtlbHkgc3RpbGwgbmVlZCB0d28gc2VwYXJhdGUgY2hlY2tzL2ZsYWdzOgo+IGthc2Fu
X2VuYWJsZWQoKSB0aGF0IGNvbnRyb2xzIHdoZXRoZXIgS0FTQU4gaXMgZW5hYmxlZCBhdCBhbGwg
YW5kCj4ga2FzYW5fYXJjaF9pc19yZWFkeSgpIHRoYXQgZ2V0cyB0dXJuZWQgb24gYnkga2FzYW5f
aW5pdCgpIHdoZW4gc2hhZG93Cj4gaXMgaW5pdGlhbGl6ZWQgKHNob3VsZCB3ZSByZW5hbWUgaXQg
dG8ga2FzYW5fc2hhZG93X2luaXRpYWxpemVkKCk/KS4KPiBCdXQgdGhlbiB3ZSBjYW4gc3RpbGwg
bW92ZSBrYXNhbl9hcmNoX2lzX3JlYWR5KCkgaW50bwo+IGluY2x1ZGUvbGludXgva2FzYW4uaCBh
bmQgdXNlIHRoZSBwcm9wZXIgY29tYmluYXRpb24gb2YgY2hlY2tzIGZvcgo+IGVhY2ggYWZmZWN0
ZWQgZnVuY3Rpb24gYmVmb3JlIGNhbGxpbmcgX193cmFwcGVycy4gQW5kIHdlIGNhbiBzdGlsbAo+
IHJlbW92ZSB0aGUgZHVwbGljYXRlZCBmbGFncy9rZXlzIGNvZGUgZnJvbSB0aGUgYXJjaCBjb2Rl
LgoKRldJVywgYXMgQWxleGFuZGVyIEdvcmRlZXYgYWxyZWFkeSBtZW50aW9uZWQ6IHRoaXMgc2Vy
aWVzIGJyZWFrcyBzMzkwLApzaW5jZSB0aGUgc3RhdGljX2JyYW5jaF9lbmFibGUoKSBjYWxsIGlu
IGthc2FuX2luaXRfZ2VuZXJpYygpIGlzIG5vdwpjYWxsZWQgd2F5IHRvbyBlYXJseSwgYW5kIGl0
IGlzbid0IG5lY2Vzc2FyeSBhdCBhbGwuIFdoaWNoLCBhcyBmYXIgYXMKSSB1bmRlcnN0YW5kLCBt
YXkgYmUgdGhlIGNhc2UgZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMgYXMgd2VsbC4gczM5MApzZXRz
IHVwIHRoZSByZXF1aXJlZCBLQVNBTiBtYXBwaW5ncyBpbiB0aGUgZGVjb21wcmVzc29yIGFuZCBj
YW4gc3RhcnQKd2l0aCBLQVNBTiBlbmFibGVkIG5lYXJseSBmcm9tIHRoZSBiZWdpbm5pbmcuCgpT
byBzb21ldGhpbmcgbGlrZSBiZWxvdyBvbiB0b3Agb2YgdGhpcyBzZXJpZXMgd291bGQgYWRkcmVz
cwp0aGF0LiBHaXZlbiB0aGF0IHRoaXMgc2VyaWVzIGlzIGFib3V0IHRvIGJlIHJld29ya2VkIHRo
aXMgaXMganVzdCBmb3IKaWxsdXN0cmF0aW9uIDopCgpkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL0tj
b25maWcgYi9hcmNoL3MzOTAvS2NvbmZpZwppbmRleCAwYzE2ZGM0NDNlMmYuLmMyZjUxYWMzOWE5
MSAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL0tjb25maWcKKysrIGIvYXJjaC9zMzkwL0tjb25maWcK
QEAgLTE3Miw2ICsxNzIsNyBAQCBjb25maWcgUzM5MAogCXNlbGVjdCBIQVZFX0FSQ0hfSlVNUF9M
QUJFTAogCXNlbGVjdCBIQVZFX0FSQ0hfSlVNUF9MQUJFTF9SRUxBVElWRQogCXNlbGVjdCBIQVZF
X0FSQ0hfS0FTQU4KKwlzZWxlY3QgSEFWRV9BUkNIX0tBU0FOX0VBUkxZCiAJc2VsZWN0IEhBVkVf
QVJDSF9LQVNBTl9WTUFMTE9DCiAJc2VsZWN0IEhBVkVfQVJDSF9LQ1NBTgogCXNlbGVjdCBIQVZF
X0FSQ0hfS01TQU4KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva2FzYW4tZW5hYmxlZC5oIGIv
aW5jbHVkZS9saW51eC9rYXNhbi1lbmFibGVkLmgKaW5kZXggMjQzNmViNDVjZmVlLi4wNDkyNzBh
MjI2OWYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgva2FzYW4tZW5hYmxlZC5oCisrKyBiL2lu
Y2x1ZGUvbGludXgva2FzYW4tZW5hYmxlZC5oCkBAIC0xMCw3ICsxMCwxMSBAQAogICogR2xvYmFs
IHJ1bnRpbWUgZmxhZy4gU3RhcnRzIOKAmGZhbHNl4oCZOyBzd2l0Y2hlZCB0byDigJh0cnVl4oCZ
IGJ5CiAgKiB0aGUgYXBwcm9wcmlhdGUga2FzYW5faW5pdF8qKCkgb25jZSBLQVNBTiBpcyBmdWxs
eSBpbml0aWFsaXplZC4KICAqLworI2lmZGVmIENPTkZJR19IQVZFX0FSQ0hfS0FTQU5fRUFSTFkK
K0RFQ0xBUkVfU1RBVElDX0tFWV9UUlVFKGthc2FuX2ZsYWdfZW5hYmxlZCk7CisjZWxzZQogREVD
TEFSRV9TVEFUSUNfS0VZX0ZBTFNFKGthc2FuX2ZsYWdfZW5hYmxlZCk7CisjZW5kaWYKIAogc3Rh
dGljIF9fYWx3YXlzX2lubGluZSBib29sIGthc2FuX2VuYWJsZWQodm9pZCkKIHsKZGlmZiAtLWdp
dCBhL2xpYi9LY29uZmlnLmthc2FuIGIvbGliL0tjb25maWcua2FzYW4KaW5kZXggZjgyODg5YTgz
MGZhLi4xNDA3Mzc0ZTgzYjkgMTAwNjQ0Ci0tLSBhL2xpYi9LY29uZmlnLmthc2FuCisrKyBiL2xp
Yi9LY29uZmlnLmthc2FuCkBAIC00LDYgKzQsMTMgQEAKIGNvbmZpZyBIQVZFX0FSQ0hfS0FTQU4K
IAlib29sCiAKK2NvbmZpZyBIQVZFX0FSQ0hfS0FTQU5fRUFSTFkKKwlib29sCisJaGVscAorCSAg
QXJjaGl0ZWN0dXJlcyBzaG91bGQgc2VsZWN0IHRoaXMgaWYgS0FTQU4gbWFwcGluZ3MgYXJlIHNl
dHVwIGluCisJICB0aGUgZGVjb21wcmVzc29yIGFuZCB3aGVuIHRoZSBrZXJuZWwgY2FuIHJ1biB2
ZXJ5IGVhcmx5IHdpdGgKKwkgIEtBU0FOIGVuYWJsZWQuCisKIGNvbmZpZyBIQVZFX0FSQ0hfS0FT
QU5fU1dfVEFHUwogCWJvb2wKIApkaWZmIC0tZ2l0IGEvbW0va2FzYW4vY29tbW9uLmMgYi9tbS9r
YXNhbi9jb21tb24uYwppbmRleCAwZjM2NDgzMzVhNmIuLjJhYWUwY2U2NTliNCAxMDA2NDQKLS0t
IGEvbW0va2FzYW4vY29tbW9uLmMKKysrIGIvbW0va2FzYW4vY29tbW9uLmMKQEAgLTM2LDcgKzM2
LDExIEBACiAgKiBEZWZpbml0aW9uIG9mIHRoZSB1bmlmaWVkIHN0YXRpYyBrZXkgZGVjbGFyZWQg
aW4ga2FzYW4tZW5hYmxlZC5oLgogICogVGhpcyBwcm92aWRlcyBjb25zaXN0ZW50IHJ1bnRpbWUg
ZW5hYmxlL2Rpc2FibGUgYWNyb3NzIGFsbCBLQVNBTiBtb2Rlcy4KICAqLworI2lmZGVmIENPTkZJ
R19IQVZFX0FSQ0hfS0FTQU5fRUFSTFkKK0RFRklORV9TVEFUSUNfS0VZX1RSVUUoa2FzYW5fZmxh
Z19lbmFibGVkKTsKKyNlbHNlCiBERUZJTkVfU1RBVElDX0tFWV9GQUxTRShrYXNhbl9mbGFnX2Vu
YWJsZWQpOworI2VuZGlmCiBFWFBPUlRfU1lNQk9MKGthc2FuX2ZsYWdfZW5hYmxlZCk7CiAKIHN0
cnVjdCBzbGFiICprYXNhbl9hZGRyX3RvX3NsYWIoY29uc3Qgdm9pZCAqYWRkcikKZGlmZiAtLWdp
dCBhL21tL2thc2FuL2dlbmVyaWMuYyBiL21tL2thc2FuL2dlbmVyaWMuYwppbmRleCBhM2IxMTI4
NjhiZTcuLjQ1NTM3NmQ1ZjFjMyAxMDA2NDQKLS0tIGEvbW0va2FzYW4vZ2VuZXJpYy5jCisrKyBi
L21tL2thc2FuL2dlbmVyaWMuYwpAQCAtNDIsNyArNDIsOCBAQAogICovCiB2b2lkIF9faW5pdCBr
YXNhbl9pbml0X2dlbmVyaWModm9pZCkKIHsKLQlzdGF0aWNfYnJhbmNoX2VuYWJsZSgma2FzYW5f
ZmxhZ19lbmFibGVkKTsKKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0hBVkVfQVJDSF9LQVNBTl9F
QVJMWSkpCisJCXN0YXRpY19icmFuY2hfZW5hYmxlKCZrYXNhbl9mbGFnX2VuYWJsZWQpOwogCiAJ
cHJfaW5mbygiS2VybmVsQWRkcmVzc1Nhbml0aXplciBpbml0aWFsaXplZCAoZ2VuZXJpYylcbiIp
OwogfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
