Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EEA606A33F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aiUhbj3E;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l3dTjAt2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FGtdduTMs5OeJkuMdaQSS8YCzMlG9P2mfMqEJrf2Sx0=; b=aiUhbj3E5R6fcHMNPHNFscPq0+
	uHjXNpKo9OjfyVzlfjYahJtc0fLn69/6DMAAr9FanfJIBJejNjLTTUfCNNQ77mp3LHyu2DcFbBIWy
	Wb/Qt0XL6mX7T496Dok/PUYl0ze0FB5uXDNDxQWDeLHNxeVXVNzeykWHxdBL2gZRaDgvLC1d1k+Dy
	N4AdUFXdAc6cq5rgj6a3oP+41HtLCCKwocfbbH2c9Gs5LvQEc5fl2uAF4fPJ8y1zljx76OuW8AZft
	YLxzh+7T2Zx61U+B+/rQ+Mrqicne1Oesd7kSqKFd6tsMuWsRSHNVMWR9SQ4Cei8/CunDAvho6MlVJ
	yyUAshHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvDK-00000007UUj-1jMv;
	Tue, 24 Nov 2026 18:25:58 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvDG-00000007UT7-1DKt
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 18:25:57 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFYoQC3008243;
	Tue, 24 Nov 2026 18:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VZzpPq
	1ob9UJ0Xx8VNNvDotWuBBmi2CQ2YmwJu5GpTM=; b=l3dTjAt2K63zLLLJXUNI9u
	xDSkucwlwAvx0VV1SdCVp7V3rYH2Hm4rXKwRV2Y7y0eLxhZnINdD8mxp5kcNDaWe
	mKLRuNh0hb+fpATgvWb+wWhq67bVr1GTNjJQb8uK837g/+7oVm9iJZlk+WOM1ocH
	Kji3e0CuM+PysRTX173t6QioKjXvNoUHdBEeHLQLSHweM2oomlFWuEuu1quHeUFV
	iREAIbf/LcOfLo8qT+LASWVkTFRyF1nzQn/Mx8t+Ceu8AmY4zA06eXNFL1fPWQmf
	HRw+eoxG0p0M2tbXgyk1GeqC7qJtw1dIv9Y1T8Q1ZQePhYiM9aLe2ISC2OF7QY4g
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fa94mn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:25:40 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFJW5P817075;
	Tue, 24 Nov 2026 18:25:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j5a411736-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 18:25:39 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AOIPZ7848890174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2026 18:25:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B1A720043;
	Tue, 24 Nov 2026 18:25:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E0B22004B;
	Tue, 24 Nov 2026 18:25:34 +0000 (GMT)
Received: from p-imbrenda (unknown [9.111.42.244])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 24 Nov 2026 18:25:34 +0000 (GMT)
Date: Tue, 24 Nov 2026 19:19:56 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Carlos =?UTF-8?B?TMOzcGV6?= <clopez@suse.de>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
        seanjc@google.com, pbonzini@redhat.com, akpm@linux-foundation.org,
        david@kernel.org, peterx@redhat.com, ljs@kernel.org,
        borntraeger@linux.ibm.com, frankja@linux.ibm.com
Subject: Re: [PATCH v3 7/9] KVM: pass the mmu_notifier event and flags to
 kvm_gfn_range
Message-ID: <20261124191956.105f57d7@p-imbrenda>
In-Reply-To: <20261112142039.907090-9-clopez@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
	<20261112142039.907090-9-clopez@suse.de>
Organization: IBM
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3MSBTYWx0ZWRfX2g7p/APmDZD7
 +FKutPQbrWivuxmdL6oEbvGatMiAgGrstkVr3qWEWYfBphbbT9KEpaX01SPP2EdyWRqpT/JFT/G
 Y/8UAkXpvHM0R9cU6go/zc+QjKt3CtrwUG2uNdrR3cVjHZYlrgUTlCc6qnrR5jHqb48ObJnr5yG
 XWDPOiGq7l8+bsuocqisujNQ+T2OX2aBE5jcssWqd0/rxnGCan3KJPUQdF7N5ssEROllG8g1I3G
 oxWVuMOKcm+DOcA7M7e3KWJlEtQPjWyOHSVKj04ZUtNWe684TMNQ/0vTzVN/lQQgpOg+xjLARMJ
 ICOjqZwc8r6Onn7WhtBOYqqxs/lDs+iH8yeHuP1ofhvhzom7tFGe/xZMGLbPMYwCN/JPu5fbbhS
 dnOWdlLy/lzJ4fcrfNpsxb96gf4qkVi/bfNv/ihjWbeebOcxbgM7n//Dx4vCYwWtCtJUL0vEcnE
 jFU7xJrzRBpooS9Lo0A==
X-Proofpoint-ORIG-GUID: j8OLDtUZy6r6KTQh7BhViRFKCYHKl6YS
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b05d6a5 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=oIiWE7W5Vk6XH6OXHjMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2Nf20C-yb7AeZvFs-II-eTTDn8p7a7qn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3MSBTYWx0ZWRfX4jFBJmeZ1r4N
 1xDPSwkCxjuOhqmSdfdMHRgjKzeHe+z0KeKJQ65wiWwonz5H8SCnHNpJfWdxYVy2/XtdCDUp27w
 xMyEv+08vKIfa8SXdOGLwZ65K8WsgC0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_102554_341376_9E8C4B90 
X-CRM114-Status: GOOD (  17.60  )
X-Spam-Score: -2.6 (--)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAxMiBOb3YgMjAyNiAxNToyMDozNiArMDEwMApDYXJsb3MgTMOzcGV6IDxjbG9wZXpA
c3VzZS5kZT4gd3JvdGU6Cgo+IFByb3BhZ2F0ZSB0aGUgZXZlbnQgYW5kIGZsYWdzIG9mIHRoZSBt
bXVfbm90aWZpZXIgaW52YWxpZGF0aW9uIGludG8KPiBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSwgc28g
dGhhdCBhcmNoaXRlY3R1cmUgaGFuZGxlcnMgY2FuIGRldGVjdCBhCj4gcGVybWlzc2lvbiB1cGdy
YWRlIChNTVVfTk9USUZJRVJfUkFOR0VfUEVSTV9VUEdSQURFKS4gTm8gZnVuY3Rpb25hbAo+IGNo
YW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgTMOzcGV6IDxjbG9wZXpAc3VzZS5kZT4K
CnN0cmFpZ2h0Zm9yd2FyZCwgYW5kIGFsc28gZXhhY3RseSB3aGF0IEkgd2FudGVkIHRvIGltcGxl
bWVudCBteXNlbGYsCnRoYW5rcyBmb3IgZG9pbmcgaXQgZm9yIG1lIDpECgpSZXZpZXdlZC1ieTog
Q2xhdWRpbyBJbWJyZW5kYSA8aW1icmVuZGFAbGludXguaWJtLmNvbT4KCj4gLS0tCj4gIGluY2x1
ZGUvbGludXgva3ZtX2hvc3QuaCB8IDMgKysrCj4gIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICB8
IDggKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hv
c3QuaAo+IGluZGV4IGU3ZmM5NGUyOTEwYS4uMWY1Y2U0NDEwZGRiIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+
IEBAIC0yNzQsNiArMjc0LDkgQEAgc3RydWN0IGt2bV9nZm5fcmFuZ2Ugewo+ICAJZW51bSBrdm1f
Z2ZuX3JhbmdlX2ZpbHRlciBhdHRyX2ZpbHRlcjsKPiAgCWJvb2wgbWF5X2Jsb2NrOwo+ICAJYm9v
bCBsb2NrbGVzczsKPiArCS8qIEZyb20gdGhlIG1tdV9ub3RpZmllciBpbnZhbGlkYXRpb24sIGlm
IGFueS4gKi8KPiArCWVudW0gbW11X25vdGlmaWVyX2V2ZW50IGV2ZW50Owo+ICsJdW5zaWduZWQg
aW50IGZsYWdzOwo+ICB9Owo+ICBib29sIGt2bV91bm1hcF9nZm5fcmFuZ2Uoc3RydWN0IGt2bSAq
a3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2UpOwo+ICBib29sIGt2bV9hZ2VfZ2ZuKHN0
cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9nZm5fcmFuZ2UgKnJhbmdlKTsKPiBkaWZmIC0tZ2l0
IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiBpbmRleCBjZjRj
YjU4NmYxNDAuLmM1MTdkMWRlYjQ4OCAxMDA2NDQKPiAtLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5j
Cj4gKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwo+IEBAIC01MzIsNiArNTMyLDggQEAgc3RydWN0
IGt2bV9tbXVfbm90aWZpZXJfcmFuZ2Ugewo+ICAJYm9vbCBmbHVzaF9vbl9yZXQ7Cj4gIAlib29s
IG1heV9ibG9jazsKPiAgCWJvb2wgbG9ja2xlc3M7Cj4gKwllbnVtIG1tdV9ub3RpZmllcl9ldmVu
dCBldmVudDsKPiArCXVuc2lnbmVkIGludCBmbGFnczsKPiAgfTsKPiAgCj4gIC8qCj4gQEAgLTYx
Myw2ICs2MTUsOCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGt2bV9tbl9yZXRfdCBrdm1faGFu
ZGxlX2h2YV9yYW5nZShzdHJ1Y3Qga3ZtICprdm0sCj4gIAkJCSAqLwo+ICAJCQlnZm5fcmFuZ2Uu
YXJnID0gcmFuZ2UtPmFyZzsKPiAgCQkJZ2ZuX3JhbmdlLm1heV9ibG9jayA9IHJhbmdlLT5tYXlf
YmxvY2s7Cj4gKwkJCWdmbl9yYW5nZS5ldmVudCA9IHJhbmdlLT5ldmVudDsKPiArCQkJZ2ZuX3Jh
bmdlLmZsYWdzID0gcmFuZ2UtPmZsYWdzOwo+ICAJCQkvKgo+ICAJCQkgKiBIVkEtYmFzZWQgbm90
aWZpY2F0aW9ucyBhcmVuJ3QgcmVsZXZhbnQgdG8gcHJpdmF0ZQo+ICAJCQkgKiBtYXBwaW5ncyBh
cyB0aGV5IGRvbid0IGhhdmUgYSB1c2Vyc3BhY2UgbWFwcGluZy4KPiBAQCAtNzM4LDYgKzc0Miw4
IEBAIHN0YXRpYyBpbnQga3ZtX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0
cnVjdCBtbXVfbm90aWZpZXIgKm1uLAo+ICAJCS5vbl9sb2NrCT0ga3ZtX21tdV9pbnZhbGlkYXRl
X3N0YXJ0LAo+ICAJCS5mbHVzaF9vbl9yZXQJPSB0cnVlLAo+ICAJCS5tYXlfYmxvY2sJPSBtbXVf
bm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSwKPiArCQkuZXZlbnQJCT0gcmFuZ2UtPmV2
ZW50LAo+ICsJCS5mbGFncwkJPSByYW5nZS0+ZmxhZ3MsCj4gIAl9Owo+ICAKPiAgCXRyYWNlX2t2
bV91bm1hcF9odmFfcmFuZ2UocmFuZ2UtPnN0YXJ0LCByYW5nZS0+ZW5kKTsKPiBAQCAtMjU1Miw2
ICsyNTU4LDggQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGt2bV9oYW5kbGVfZ2ZuX3Jh
bmdlKHN0cnVjdCBrdm0gKmt2bSwKPiAgCj4gIAlnZm5fcmFuZ2UuYXJnID0gcmFuZ2UtPmFyZzsK
PiAgCWdmbl9yYW5nZS5tYXlfYmxvY2sgPSByYW5nZS0+bWF5X2Jsb2NrOwo+ICsJZ2ZuX3Jhbmdl
LmV2ZW50ID0gcmFuZ2UtPmV2ZW50Owo+ICsJZ2ZuX3JhbmdlLmZsYWdzID0gcmFuZ2UtPmZsYWdz
Owo+ICAKPiAgCS8qCj4gIAkgKiBJZi93aGVuIEtWTSBzdXBwb3J0cyBtb3JlIGF0dHJpYnV0ZXMg
YmV5b25kIHByaXZhdGUgLnZzIHNoYXJlZCwgdGhpcwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
