Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23848C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 18:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcsSrwMN8F5pCoUWdermG/lAgbCvu4r+Nw+3Bm1bVh8=; b=PINVTPm7sCwjZY
	4bFfleWWq9autgL1zzegXrosvvNKzvv12d3QssdXg+4GOFGID6aA5POP7rD67ArcUNV7rq84T2lgJ
	20r31BcLeRybAXIUQk3KP7nPvj1FAgrSK3Sfr5MORCYtoQKpaoo5Ifj/xelHFTgEOOb5evwIYnetL
	2Vc10JTDmyJb+/d13Ka+n4njG8oCjkCnkq0bzf8QNsXbClVReU869t/o/u3VgTb8i7YpJuInJ8ctK
	NYChfHROahZ8Bcp4Bg2vhIciY0v641I0MNfa0588ZB9scNVU0xHsKlNGg9tEt9vy3H0NlqMu/PtJ2
	0MnFwO2xxyL0BfCTmpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6ml-00H9lY-1y; Mon, 07 Nov 2022 18:23:51 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6ll-00H9Jt-1p; Mon, 07 Nov 2022 18:22:50 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7IBfhG003607;
	Mon, 7 Nov 2022 18:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=EzR8gIJXN5CxUQRbcB4MiNn9dtOoco2fyNz/1FbCYTs=;
 b=oLSyj97Tdsnk0VQOOelX0cMC03SHso5gNnzaHyD+AU0QdK4ObvkSGhKy5MB3Eu0X4nH3
 cwQlVJnBR+mHedqllHCGkozoyH6XI3rvXWzRd6B14keKEVzxvN6OwiPguQYiPjgoozr5
 CuCksG6s9mdmq7QLIUQJIca83ZvoD2XgDSxzv6A51X5fRtxNeiKKljGLcDn9w2C0oVaI
 lt4UbjIbWAu4ejWPW7Tu9j/0mFdDdf2RJQ//Gs+6w72ns70J8ekHGYyOg0A6bX47zuXl
 7JNyzQw/vMhVPkpKIf+E0zSFCsOlxjnE+4eVRtOOT/s/U0hkUCCpuH99DScbFKpRAn6z EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1uuwfy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 18:22:19 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A7Gap8F020063;
	Mon, 7 Nov 2022 18:22:18 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1uuwfxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 18:22:17 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7IL2nI028450;
	Mon, 7 Nov 2022 18:22:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma04dal.us.ibm.com with ESMTP id 3kngmswr5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 18:22:16 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A7IMJ895243508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 18:22:19 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B096858062;
	Mon,  7 Nov 2022 18:22:14 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E657058052;
	Mon,  7 Nov 2022 18:22:11 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown [9.65.225.56])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 18:22:11 +0000 (GMT)
Message-ID: <e2b21ebfec94bcc3d830a5c7f11837d6dedac652.camel@linux.ibm.com>
Subject: Re: [PATCH 25/44] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
From: Eric Farman <farman@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini
 <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen
 <chenhuacai@kernel.org>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul
 Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>,
        Alexandru Elisei
 <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Atish Patra <atishp@atishpatra.org>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,
        Thomas Gleixner
 <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
Date: Mon, 07 Nov 2022 13:22:11 -0500
In-Reply-To: <20221102231911.3107438-26-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-26-seanjc@google.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zz_sQx9dIUW7WUoiYMvv3aj8CVyX61yu
X-Proofpoint-ORIG-GUID: x0YF0w8yQ2jwBDgCwuGa40JfBxQPUq9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=598 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_102249_284919_BEFE0EC9 
X-CRM114-Status: GOOD (  16.57  )
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

T24gV2VkLCAyMDIyLTExLTAyIGF0IDIzOjE4ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOgo+IE1vdmUgdGhlIGd1dHMgb2Yga3ZtX2FyY2hfaW5pdCgpIGludG8gYSBuZXcgaGVscGVy
LAo+IF9fa3ZtX3MzOTBfaW5pdCgpLAo+IGFuZCBpbnZva2UgdGhlIG5ldyBoZWxwZXIgZGlyZWN0
bHkgZnJvbSBrdm1fczM5MF9pbml0KCkgaW5zdGVhZCBvZgo+IGJvdW5jaW5nIHRocm91Z2gga3Zt
X2luaXQoKS7CoCBJbnZva2luZyBrdm1fYXJjaF9pbml0KCkgaXMgdGhlIHZlcnkKPiBmaXJzdCBh
Y3Rpb24gcGVyZm9ybWVkIGJ5IGt2bV9pbml0KCksIGkuZS4gdGhpcyBpcyBhIGdsb3JpZmllZCBu
b3AuCj4gCj4gTW92aW5nIHNldHVwIHRvIF9fa3ZtX3MzOTBfaW5pdCgpIHdpbGwgYWxsb3cgdGFn
Z2luZyBtb3JlIGZ1bmN0aW9ucwo+IGFzCj4gX19pbml0LCBhbmQgZW1wdHlpbmcga3ZtX2FyY2hf
aW5pdCgpIHdpbGwgYWxsb3cgZHJvcHBpbmcgdGhlIGhvb2sKPiBlbnRpcmVseSBvbmNlIGFsbCBh
cmNoaXRlY3R1cmUgaW1wbGVtZW50YXRpb25zIGFyZSBub3BzLgo+IAo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24g
PHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+IMKgYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jIHwg
MjkgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyNSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IEVyaWMgRmFybWFuIDxm
YXJtYW5AbGludXguaWJtLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
