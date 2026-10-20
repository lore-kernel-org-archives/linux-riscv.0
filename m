Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E9B606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hVuKWe5e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXIFw2VE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V8n1ahjA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10QFxcjWBybIH4TRFtze6anZfILd12mjlCAptt7Z9dY=; b=hVuKWe5emMfrvc
	m8iq/t7cPTyWz9f11nd3s/fsU6PypOb/D9LSgeannMkenUULvm04OqqbxggJFjThkYMVmTFNUozD9
	Ql6F8vEmHImUxKJ8oC5ODfLkBLKjjbdwdmcUuEbpjDYWW5R5lCLekIXC8iKxTXguB1S3jQGK857Nt
	kjCnbsWEm0r9xdpNB0n9GiVopHwklqfkHSbixe9yWXkX88iogNP9m52X1tf0Pqz30SQA2Na9N6kXJ
	tW3Uh3aSfLoCQHaxcc8LgUxy7n5j/HzZR/gN5ZmBrYGq6k7siJ1TaPZJwLOVEweCxC5AiZ6TuMt+O
	jKkQ8r+PH7rrjqOkfLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6lS-00000009OR5-2ISn;
	Tue, 20 Oct 2026 10:08:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6lQ-00000009OQk-00gf
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 10:08:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K65seH803528
	for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 10:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58+sjcUUXLQgHhvGrNg0LfK6mENj6ITYY+TpEzI2IkY=; b=mXIFw2VE1AlAzU/C
	N6sS3geJDQxogbZYW+Gs+PttJWKPwLg+BUSahZC/laokXSeitMkwJxXnuCKL0QYz
	OyugH8k1thnmZp5bvTDS8R4ypQ0YOCsrAy1bIV80NebntKhtHvW6U3gwBR3vFIlM
	WerHi7Q5KXSqvqRdMq77TpxJDQPfKFlOWUcVAxLemcooelhhS4jciRC71JnMYaFd
	F4HncvuOhCD7kiHBbK1SZGYYmNvwyh5ebbGalohOj1BJ6pixjR9KHsASWQjTHkUl
	WQKTp0w3f3HCWRujYNcBkus03oeaUouSHTq1QXHrCKQp73b9Qpx6iGN+GkT9By62
	eFeSRQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n20ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 10:08:09 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so11571148c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 03:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792490889; x=1793095689; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=58+sjcUUXLQgHhvGrNg0LfK6mENj6ITYY+TpEzI2IkY=;
        b=V8n1ahjAkqGQZZ50mr9JKqNhnHF9B1w/5dBdft/BS+BtlDGJV5IRhYS21DZEKj1npP
         SDhj38xsXC38cpe/16CgRpYsHw36hs9eUy2C24F7KOhGJOZ54YLVeVZCc3BBH+evgSoB
         SH2FUCb36FvnXnjTVHLxyQrci415kQXCbo8W2r7vEkpthV8PeT0bc7arQfqcESnckhzd
         2mD0DpxIN+jjxygMwaoLByHzlBXcdlf7WRbx79Y267LpddJWZHKT0G30JcvOMKOXN1s/
         otusVy1TrTfrzYDmPePidAt31dBMmCVzY79Rx4p35kORV8+DcJmLpDYaN334tv9uO+E1
         K9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490889; x=1793095689;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58+sjcUUXLQgHhvGrNg0LfK6mENj6ITYY+TpEzI2IkY=;
        b=SdoxTkV97NIo50GQ5IrnQZo1l7zi7BeFZqYYBpJo7sLNlkOeOgx+y0wc4LqYGjqfr+
         91GDO+36Uih7YKCxtt/Hv+E44IuCWOSQ5wMtom4t6QluILQ7lPBdEO1U/PkA/Fu9su5A
         3U5EonQdCpUK3fuuAZBNsKQmNIyb9a8P29t9xCLGCAWvPibyLxGnqmkToRev+DlphYb1
         zEBTSwbZJ8qllyNnMlx2ZDVpO9Nm61zbFfARp5tMyXO+f/Xm9slksmAiD33i8tdp1A39
         qwwxBWMbomrBrClSegXWwu8vN1QWuNNmQLSB9QX2fbkRy9FjL9uu9GDttRdQWdHnXA7P
         H36A==
X-Gm-Message-State: AFq9FYIJ0r71jLk2JHeuw1LuC8peNDG3Dv3baoMoLlg3vFKzdqPo4rMJ
	/nvap9tin1mcnzH4kVHN8z5OlZeIlSP87KOc3HeSkF/LRrqa8zLFDOiGTLFCvgtZbhPbRTvHxqp
	A6+o5PGcbPNXI5cnDPnPt1o/kyiSv3y18/FCeorrlJY9lxmorTEA0Cs5sYXOYUg9uHES5qBTQjy
	WASIY=
X-Gm-Gg: AYBFou1SuX8oW2+v/4GYCARocWKQaQRlKGA36h5O0UjYIdFpS+NqfDgwYivsaSeCi3k
	l5Z9L+ETz3XJrXn5zRx8Wbnb4sWiOdI0v4DzJxMJ4BGt0yfmi7kn55Ao+p+GZQgSA5/uHnW5Slf
	MzyBOexJzEo/Uwl7rNVblrP1o8GiNVDZO69hDVzvGHSmFxyQ2UZ1pQdNpMF+aXWoOOTH5w5P/YD
	Hdsd/CNRmJGcFPXY1hMZzJRJdZABAa1W3lVWec/v44rMRngldvpwBohjQTEfnp0rwJGKUcRcSGE
	ymDhSOTeU9ILw+Luz+f8CgmWSlt5s2Hw6BRe/4YnWYdv5mASKXVqjx1joF37tM849PjUf55rJJF
	LQuClzX10MQpPRzvIgafl5plvYx1PC3eh2F9xKQ==
X-Received: by 2002:a05:620a:294e:b0:93c:89a0:bf82 with SMTP id af79cd13be357-93f29d6f081mr1775353385a.43.1792490421914;
        Tue, 20 Oct 2026 03:00:21 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:93c:89a0:bf82 with SMTP id af79cd13be357-93f29d6f081mr1775343285a.43.1792490421184;
        Tue, 20 Oct 2026 03:00:21 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f99ffbabsm4757595e9.1.2026.10.20.03.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:00:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 20 Oct 2026 12:00:18 +0200
Message-Id: <DM9KTMFKWFYK.2QDRQCZPPEKTC@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re:  riscv: hwprobe: Report Supm only when available
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Guodong Xu"
 <guodong@riscstar.com>,
        "Zong Li" <zong.li@sifive.com>,
        "Charlie Jenkins"
 <thecharlesjenkins@gmail.com>
To: "Andy Chiu" <tchiu@tenstorrent.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
 <atKWa5PU2ECSgocI@Tao-Chiu's-Mac> <atKa3JDynQmx2KS3@Tao-Chiu's-Mac>
In-Reply-To: <atKa3JDynQmx2KS3@Tao-Chiu's-Mac>
X-Proofpoint-GUID: kt4bIFMwH9_0i3mNFLC3pYv1E-20NZJ7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX5y3vo1j8Oxvj
 7gEUQ4HJtw1g0Albg5csPIYa59oli8MGDOQ4nn419fZaxj2YcgJ1VKBWlrnNE0heXqmWaBKGHfc
 A7LbxMSHPDoT7QpI57YM8MyNjvQ9IuQ=
X-Proofpoint-ORIG-GUID: kt4bIFMwH9_0i3mNFLC3pYv1E-20NZJ7
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad73d89 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=t9496tuAAAAA:8 a=1rQCNxc8bWSMfTx6MfgA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX27bzBFj5UtBd
 tuMicy6ElkYiRiuDzcLE+KAhaS5LkMLAthSSqiWyHcrIDVUQx3XO5cuwd3uM+EgkfeiwyoDnzCe
 QfWQqi1qD7Nua20cLqsTvcZKx+ofOKfIEJvnUGxR31Arw9j4eF0E9gaZJTZ8P//SWnE5CIRz9hc
 kjJuc20tEmFFpvR9Zh3iEpo1g8eiVNGlDj5rKTKQ3VvSMLfeqq6t98ZoA0njASynwfPxs9dvKNn
 ODird+ywtrV5YsuyX8quhRiJXeBcZt4l57f0kddsvvqQComXPZbXIHHl/RoNj9dSJlyzRdf7mVV
 0qWaqjtBTra8sA9QdGuqGR/wplNWWJtqZ3dLMX6kAB+Dkr2W4thgcZl+OxtbnvDN+yct7SpPnWD
 qiTz5y4egzfosT2n6SFy+nY6XTkDMMu9C3yFgEBkvcuvXoFzqgzFsRdh0QJ/2USFjUZc/MGUSL+
 0JJB+DH9hDscn/5v0mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_030812_179899_6150D425 
X-CRM114-Status: GOOD (  13.69  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MjAyNi0xMC0xNlQxNjo0NTowMC0wNTowMCwgQW5keSBDaGl1IDx0Y2hpdUB0ZW5zdG9ycmVudC5j
b20+Ogo+IE9uIFR1ZSwgT2N0IDA2LCAyMDI2IGF0IDA5OjUzOjAxQU0gKzAyMDAsIFJhZGltIEty
Y23DoXIgd3JvdGU6Cj4gPiAgLS0tCj4gPiAgVGhlIGNvbXBhdCBoaWRpbmcgYW5kIGdsb2JhbCBz
eXNjdGwgdG9nZ2xlIGJldHRlciBmaXQgaW4gQW5keSdzIHNlcmllcy4KPgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBUaGF0IHNlcmllcyB3YXMgZHJvcHBlZCBiZWNhdXNl
IHRoZQo+IG1lY2hhbmlzbSB3YXMgbm90IGluIGZsYXZvciBvZiByZXZpZXdlcnMgYW5kIHdlIGFy
ZSBnb2luZyB0byBkZXByZWNhdGUKPiB0aGUgcHJjdGxbMV0uIEJ1dCBJIGNhbiBzZWUgdGhlcmUg
aXMgc3RpbGwgYSBuZWVkIGZvciB1bmRlcnN0YW5kaW5nIGlmIGFuCj4gZXh0ZW5zaW9uIGV4aXN0
cyBhdCBydW50aW1lLiBXZSB3aWxsIHRha2UgdGltZSB0byByZXZpc2l0IHRoYXQKClRoYW5rcyBm
b3IgdGhlIHJldmlldyBhbmQgY2xhcmlmaWNhdGlvbi4KCldlIGNvdWxkIG1ha2UgdGhlIGRlc2ln
biBjbGVhbmVyIHdpdGhvdXQgbG9zaW5nIHByYWN0aWNhbCBmbGV4aWJpbGl0eSBieQphYmFuZG9u
aW5nIHRoZSBzeXNjdGwga25vYnMgaW4gZmF2b3Igb2Yga2VybmVsIGNvbW1hbmQgbGluZSBwYXJh
bWV0ZXJzLgoKQm9vdCB0aW1lIGNvbmZpZ3VyYXRpb24gd291bGQgc3RhYmlsaXplIHVzZXItbW9k
ZSBleGVjdXRpb24gZW52aXJvbm1lbnQKYW5kIHdlIHdvdWxkbid0IG5lZWQgdG8gZXhwYW5kIGh3
cHJvYmUgbm93LiAgSXQncyBzdGlsbCBicmVha2luZyBVQUJJLAp0aHJvdWdoLi4uIEknbGwgc2Vu
ZCBhIHByb3Bvc2FsIGZvciBkaXNjdXNzaW9uIGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
