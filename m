Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86145C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FpB3rjRE+yLocqOOtgKGY1cGpRRb04WAGQSioa3GkM=; b=stBra4mjGXW58Z
	eTz8l9vW2e0h4v6z83Szn8Yd9zZZb9t6BSn6fqw+b6TEJdYzU5+7sfpPElOj/icOTfypPOBqPdnLe
	s10gmdtpsLy5nhLz/Hb3J/c1voBltI975eaI9pUygbQ9uLsg8USRD4tdRRK6RRyBaWs79rbcznE8g
	ADukUEAGSldf3PvCkM2GiN/AsU9I8vFr8YwwrsIc4QeE33HxiYTKENU2dZR4y8yyG5v7X9Ib9zcMs
	r1pZw1sy1l9UR/6ujQZvbVnnKOELiPPEEdVOOKodPXdYFXTuBxk/Twf/Xg6QbXzMHA7w4JGMeb8PF
	A2O23ONAtmme9MiVpVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6m6-00H9TK-4t; Mon, 07 Nov 2022 18:23:10 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6lg-00H9H5-EQ; Mon, 07 Nov 2022 18:22:46 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7IHnXe003378;
	Mon, 7 Nov 2022 18:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZuH7o3e1bTbqF+x/vFxtjEWKRRIInbJqe4eNJNa0mb8=;
 b=ju7oucrH6Wp8iBVMxTmB6zAqvCw5YC+Uz7+ezSttCHZ8sxH5CWUu8XcZDONE680ltY18
 IM0/sU73Ux/BfEYs2jpjh/I9DGAs7CeQgxtnwDe0q0OC2l6txXGHl+ii6qvFMBe5LJHn
 xvP9Fdts1GQVXda4zUeOWS20cLGW++8Rjn4VbpDidij1biZGQ9wYJ6QmZ1QKVxQAvzVL
 kEsRyFS+Cs/8s6a2TvHL3qC59PCKR1kEj1kES2YRh2guwZnT239IkfuhFri5PcBlb2Zc
 gNdgvxDVS5jfSMiDjUQWZOLmInbeGJHVf/3yrd5m8sqajqV1nNPploHPbvQ8vPv6UuCt Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1uuwg4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 18:22:28 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A7HQmcs001764;
	Mon, 7 Nov 2022 18:22:27 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1uuwg3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 18:22:27 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7IMEBr024052;
	Mon, 7 Nov 2022 18:22:25 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma01dal.us.ibm.com with ESMTP id 3kngsxwpkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 18:22:25 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A7IMOUX22217242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 18:22:24 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCA1258050;
	Mon,  7 Nov 2022 18:22:23 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD03058062;
	Mon,  7 Nov 2022 18:22:19 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown [9.65.225.56])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 18:22:19 +0000 (GMT)
Message-ID: <fb45be96446d9d66272eafe284863f80bac8af45.camel@linux.ibm.com>
Subject: Re: [PATCH 26/44] KVM: s390: Mark __kvm_s390_init() and its
 descendants as __init
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
Date: Mon, 07 Nov 2022 13:22:19 -0500
In-Reply-To: <20221102231911.3107438-27-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-27-seanjc@google.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _6IU7V4dMFctPdA56pgQtBe5YtzLgS6A
X-Proofpoint-ORIG-GUID: V82sdblhujvxGzoxMA2V1e4qIeYYLGgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=908 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_102244_635699_11F3E87E 
X-CRM114-Status: GOOD (  17.54  )
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
b3RlOgo+IFRhZyBfX2t2bV9zMzkwX2luaXQoKSBhbmQgaXRzIHVuaXF1ZSBoZWxwZXJzIGFzIF9f
aW5pdC7CoCBUaGVzZQo+IGZ1bmN0aW9ucwo+IGFyZSBvbmx5IGV2ZXIgY2FsbGVkIGR1cmluZyBt
b2R1bGVfaW5pdCgpLCBidXQgY291bGQgbm90IGJlIHRhZ2dlZAo+IGFjY29yZGluZ2x5IHdoaWxl
IHRoZXkgd2VyZSBpbnZva2VkIGZyb20gdGhlIGNvbW1vbiBrdm1fYXJjaF9pbml0KCksCj4gd2hp
Y2ggaXMgbm90IF9faW5pdCBiZWNhdXNlIG9mIHg4Ni4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWFu
IENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAtLS0KPiDCoGFyY2gvczM5MC9r
dm0vaW50ZXJydXB0LmMgfCAyICstCj4gwqBhcmNoL3MzOTAva3ZtL2t2bS1zMzkwLmPCoCB8IDQg
KystLQo+IMKgYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5owqAgfCAyICstCj4gwqBhcmNoL3MzOTAv
a3ZtL3BjaS5jwqDCoMKgwqDCoMKgIHwgMiArLQo+IMKgYXJjaC9zMzkwL2t2bS9wY2kuaMKgwqDC
oMKgwqDCoCB8IDIgKy0KPiDCoDUgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IEVyaWMgRmFybWFuIDxmYXJtYW5AbGludXguaWJtLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
