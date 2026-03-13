Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E1A105F7AC
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlxO7pVIglYUdfGJr1z+hOBtTSari7FW7G4+FtL0NVs=; b=DN2kbivZKNA++E
	wMWJ4nJqA013MGEq0stvxV5J/PwHx470C28rBeuNVFE4gNJUVKMW5NamNH2Rs6JQtPu/1XUNJurTS
	94Ycu7VriOQWg2p31Yr75GVSBwnwiSpRAoNZEWVsf8uDyk7I5akN5yM5tf0G1ix8iKmmj21T2vrpd
	YIkd+OPrv2GnHSjBfCyjF3EYzaDrkwvy2+brS/SHpD/JaQmWHJtMA3pv9zb9jvlGswKLRwySimzTw
	LeskqA0mhRswLs9GulMp8h2aodI9qf+eoh3oTJMtdB8PeE0RrZiW8+RDKRH1MRM2BK3Fylkx9yOaS
	AYTMnhh1RpFVQ6fA8Jrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Y3-00000000Eeo-1roJ;
	Fri, 13 Mar 2026 13:27:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Y0-00000000Ebn-1owE
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:27:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iLuT2262552
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nlW109bb/HB/QDCXch5lmGmv1Xj5QyHaZAnML++DYY=; b=Y+ZaNBCQfFQuQhBo
	6p1N4DaISDil9CT8DRrLzQLJ1xsdyP1T9f8tpL7qVgwl8wwjq3yGeQWew4lQ7rO9
	I0BnNBvdxN+qjWkkby8onSiinQSsyp5cl11WdGnDbVLxdJPjHlAhP0eUG7KBb64T
	yr8FuoluaAhmgHc7GpDxTYrgrg9TRYwXs4W5l0QJfeC/8hCsmsKmpwZJ98MY/fIv
	ZyF0g/UDtgkcZE6qpa7uO3NDB7ybHwTIRGTeR9ApSABL48t6zfG9rsncNEfp6hvk
	pK3nttJexlTW3kX37DE1LoXdZfAyKX9kFZ0ncQ5t9XiBG4fbRwsskoa3HXyQtJ+p
	P7jFYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4s5a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:27:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso1590251685a.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 06:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408442; x=1774013242; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nlW109bb/HB/QDCXch5lmGmv1Xj5QyHaZAnML++DYY=;
        b=Jkzor4DbXCDghOuloieuxsZwJOkRqOlYEU8fTzN9lIvrHD3p/iBIqQzOWOjpqAtbhp
         1j2Lur+MsfmqLulKpp0S8Aur7oJZx3SUPnW/fXfhwiJGcOnnCEJgvawp22n6HMdTYYLH
         mLPbTfOudnE9n4fME58skRgCPD3FBIGHvAzaT+bWpF++/o15ejegyH0Ii+w33NkDvHYK
         HTvLEY7EJTAMHI4bqeCC/3wZw8sKm4jqpTf8ZhVIFqiVS3L4NwJkYJfonQVKvkLVeKV8
         lmOnGY/d9Cau/K6gcud8Y+CvTPq/ooVJAbLaa0dlDhZs6G4TYXBiZzNeHZGJIyR1+vis
         +8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408442; x=1774013242;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nlW109bb/HB/QDCXch5lmGmv1Xj5QyHaZAnML++DYY=;
        b=CCtLosuWSTGI4qm9FNRmC2iZnobPOIrY0YKIF+mB47V6UtzCtynedZHKDlp7XTaIXZ
         ZsCZkE3iwKt99E6vb4zR2U7GAReXTmSFCwhIA0mxIFhyOhP09nYPksRs6SEta9f7i48j
         ZJBj4tWfuJMylUgVAGxHwldHDBCqeuaonG0KdYqAwODzt057JIJOcfExA+XHAgxsrrYG
         DdoT3hrCzgOj30qM0jvo5fQPRAIx7vrTEmlp+s5YhM+LWOC43De1BNNJUmhndC4WsmPx
         ZFaDWY8J9+4hgb9ynAqJrMa2zh3h7di2mUobviW+CfNAEEurImsBKYjMPZXaOWQ306rS
         o02g==
X-Forwarded-Encrypted: i=1; AJvYcCWnkNkdbDyK6bRjCfpbgIdEZ9bRNey4MxUv9bgMFcNKn8xEW/eYsTklQK7aQlc4AUnoCoH4BL8Lo96lRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfRE73l6sfpRTF1iqzAC1tYpg8XDcQ14KQnmaweHsGsCxehtP8
	mTD8tkN2wgIgAf9o4QqEVyon1UKq431g3eQ4hYwyEQ9haTOx+Ben1MxcWaxzcx5340SkwRJ+ZHL
	PIZLb05G7StY+cLZyiKJGsWGlR7PZZ2ajmGnw9RWysybTAYfGd01w03eJFHvCmOVxW2punvU=
X-Gm-Gg: ATEYQzw30belIAsFPY4KNiBaS0YRqIgbrk7SJAmqyAYDG68s15mBTAvwQmchK38a98B
	T+kwi/+FBPVP2m/3PP8MwYfAFd8Zk6FKcmKEkZRJmsOLJmqru43KCaMgs4kIp7/RzuO2HYBW5Lo
	syRUxTeVeOGyCfos4iiN1E/0/qyKtZtzD/tZ3PmKbqQ+3+nyMBVH5EDGVv1IDDZWXLeNEsSUKQS
	8DEHrYNDNq0Y4/uF8WAAxkqWJdyU7wJ+4LlB6n8SUND4Z4POjypmbgtEZmHnd8BFDyEgNbNpEKE
	AnY6mNl9wpyoj3MR8K1HajOX+BnBYpQAY5C1ck8BuXt1Wnfx9QrLUHD/vdCN+vzrQFp60ZjQMNT
	CvZdNLzAMA2yM2yL+x8U8ey4zUzbkFmmZTnV9lllF7gtaMpw88569ZgDfImTT
X-Received: by 2002:a05:620a:2a11:b0:8cd:871c:909d with SMTP id af79cd13be357-8cdb5b5fc9emr450719985a.53.1773408441942;
        Fri, 13 Mar 2026 06:27:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2a11:b0:8cd:871c:909d with SMTP id af79cd13be357-8cdb5b5fc9emr450714985a.53.1773408441464;
        Fri, 13 Mar 2026 06:27:21 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe23afc5sm19683402f8f.39.2026.03.13.06.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:27:20 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 14:27:19 +0100
Message-Id: <DH1OTQ0FHZLN.1RCIA8ERD3VGF@oss.qualcomm.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH 09/27] RISC-V: KVM: Don't check hstateen0 when updating
 sstateen0 CSR
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-10-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-10-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ECeUv16gblNGNQ4e8v10ixfok__sqMcn
X-Proofpoint-GUID: ECeUv16gblNGNQ4e8v10ixfok__sqMcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNyBTYWx0ZWRfX3/M0oliA4M5f
 M3gxYm71D3vvLi+hqvjrlpg306PhKdE7JvNiK0F/2JxqsZadIl2CEhtgGE+qO1XTVtT8VKAHK7x
 vomh6YTS+eC4L01MkYqP3sITF8uheaWFA+y5YmAPWa0TLdHKDhhJtj7KiqtPSjfRpqxb4t+3+1p
 LtfNi7tw+4pCKJ5ZkqCRnUxzVCMNZXSPbUoOvz8EYvw7IME8xDwYRDQtKax1k96wHSbRqEEquv9
 TdeJ7STi/uXnXS6qqnZdUkWgSrjY0NcbJCEVlgWTvhrFWHjolbRui+kbFpDWGZkeMVY1ztGzujd
 nep0dXQPNhYIet8n329wEv1cx+LJQIwX/4lvReeGf+KbctwFGhes0uKlRNCg0vgwuFV5Jc5VlyZ
 4V1s4Ij2ldhWhQFVaVJNMZ+GX6cwA8ZtOpnvQc6m/sJGoG8ozD72fxL0jz0ZGbi2XEFwWKYYhqe
 AEJkGzuNjBOBQ+Ba1jg==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b410bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MPGxGW8KdBHyhiCmLn8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_062724_490182_4CC1818F 
X-CRM114-Status: GOOD (  11.72  )
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

MjAyNi0wMS0yMFQxMzoyOTo1NSswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBUaGUgaHN0YXRlZW4wIHdpbGwgYmUgcHJvZ3JhbW1lZCBkaWZmZXJlbnRs
eSBmb3IgZ3Vlc3QgSFMtbW9kZQo+IGFuZCBndWVzdCBWUy9WVS1tb2RlIHNvIGRvbid0IGNoZWNr
IGhzdGF0ZWVuMC5TU1RBVEVFTjAgYml0IHdoZW4KPiB1cGRhdGluZyBzc3RhdGVlbjAgQ1NSIGlu
IGt2bV9yaXNjdl92Y3B1X3N3YXBfaW5fZ3Vlc3Rfc3RhdGUoKQo+IGFuZCBrdm1fcmlzY3ZfdmNw
dV9zd2FwX2luX2hvc3Rfc3RhdGUoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFu
dXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTcwMiwyOCArNzAyLDIy
IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zd2FwX2luX2d1
ZXN0X3N0YXRlKHN0cnVjdCBrdm1fdmNwdSAqCj4gLQlpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91
bmxpa2VseShSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTikgJiYKPiAtCSAgICAoY2ZnLT5oc3RhdGVl
bjAgJiBTTVNUQVRFRU4wX1NTVEFURUVOMCkpCj4gLQkJdmNwdS0+YXJjaC5ob3N0X3NzdGF0ZWVu
MCA9IGNzcl9zd2FwKENTUl9TU1RBVEVFTjAsCj4gLQkJCQkJCSAgICAgc21jc3ItPnNzdGF0ZWVu
MCk7Cj4gKwlpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NN
U1RBVEVFTikpCj4gKwkJdmNwdS0+YXJjaC5ob3N0X3NzdGF0ZWVuMCA9IGNzcl9zd2FwKENTUl9T
U1RBVEVFTjAsIHNtY3NyLT5zc3RhdGVlbjApOwoKVGhpcyBjb3VsZCBldmVuIGJlIGNvbnNpZGVy
ZWQgYXMgYSBmaXgsIGFsdGhvdWdoIHRoZXJlIGlzIG5vIGJ1ZyBhdCB0aGUKbW9tZW50IChib3Ro
IGhvc3QgYW5kIGd1ZXN0IHNzdGF0ZWVuIGFyZSBhbHdheXMgMCkuCkluIHRoZSBmdXR1cmUsIGV4
ZWN1dGlvbiBvZiBhIGd1ZXN0IG1pZ2h0IGhhdmUgYmVlbiB0YW1wZXJpbmcgd2l0aCB0aGUKaG9z
dCBzc3RhdGVlbiwgYmVjYXVzZSBzc3RhdGVlbiBpcyBhY3RpdmUgZXZlbiB3aGVuIGhzdGF0ZWVu
LlNFMD0wLgoKUmV2aWV3ZWQtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5x
dWFsY29tbS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
