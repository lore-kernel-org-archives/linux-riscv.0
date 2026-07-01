Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA8CC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bP5+idMKo4z+JwwQ9K9v1gyIi+oXctf8Gqw8BWW42sU=; b=Sr4ipzYgvlH+Z5
	goOQ5hzsFlSMPLuyU/n+z8vAiLo7eBVrIusEaIwqTxY+XFOC2jDGj/Q+3/H+xahtgZ7zqyRl2YnPu
	sf4RYHleqry6YMHPh5bfXPY32mLKhKCqtVDSrtK49nWHxtGrYFDddC3wLL/4NQ2yeRnFD5DhQAyRe
	8UuC7D4Hl0LBglYt7ytYfvY5/UYx6XDNlik21H4pPDBHhXs179vr79/dkHGRRB5u/P4o5G1mzZTHN
	rjPbR+oZynJ3VS5WLbGQWKWS8h4C+D7KBZmMVjZvJ0d2GzUTedJge0d8EnfKj53hMMRtGAm4hCxSS
	xLBgxv5zcHFfqg6uSLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welPT-00000000ZHq-0LqF;
	Wed, 01 Jul 2026 03:14:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welPP-00000000ZHM-1SKL
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 03:14:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6612tRh83953010
	for <linux-riscv@lists.infradead.org>; Wed, 1 Jul 2026 03:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=VS5ekj4FCpEpJNmH/ZuA4QFE9m28JNhBKG92EL1tzpg=; b=NS
	Px0p1Tx8GIDPY2Bm9XKO8/dpBeu3EpgQNxCTsYCYXowA9Yv0zHToQyWCYv9o0dWT
	vVu/hcZUGfLcgVF+pIFJQfGj5nJ9LZmIF8d08T3IbAKaimGksNnjYnfJhr7eHu91
	Wc56KOJfK7RLECRtwaEvifl63vJOxUmK5KKaooLr+sVU+pCjUIMf7yiw+A4HKLcS
	1lOjgU0ydtNso1ADZW76gJ4pgNodBzOfpDTY1lisOvXptXFXwHGw92i1v0/NhWsp
	f4mHje8pUxFkC7v5O4kkiy4LDhQQ5+j9xxGveGQFjBquOTEGjAaOGHN17y1XPH5P
	7MF/pX0mvrhpLCRzL9oQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jkt9uub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 03:14:41 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7fe835353acso3114757b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 20:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782875681; cv=none;
        d=google.com; s=arc-20260327;
        b=VEmTcuHal3ylrk9KsudjeYkKhJa7xGkMT16Z+bl/01vG4f4+FjYbKrc4jrI0E6PoxG
         FE2uUBs1Ct+fknqn/by/D9dy0+m5xwjpEjVQdUMWpBQP3qzqz/c0D59eHYje5WbhxA1D
         rSMMoB4veloAcmarLaUMyiO4JU8JwNLVSOGwD2RGH0InVBFxqcp87JRdSdzglVyUpaWk
         Mo2Zw+hL63ZdZJ0StI2UrkwdoukxZeFouuFqzcfDpfCDaxoxhxGSukiFQyvDDwMq61u8
         qkvmO7ehcBIwQQ5+tHyqMaQq8QoMbb12dvqezLAnTL81Wnd9S7bUhc5ll1xfLQjSoptg
         3UEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=VS5ekj4FCpEpJNmH/ZuA4QFE9m28JNhBKG92EL1tzpg=;
        fh=iTnIJrCFCrIId31AzSwIU0JkgZy1Wz9NaQWcGtF8qHU=;
        b=TNmwFxHgYBDIqixpkx26yzogxUSK/V16wg4Yo5uxLou6Ptu2bSoaSMA0ojwZIkDTbi
         pM+Xd1g/qmy7JvevLejF2pWJefYDez/Dj+i+DXMrQJLeW814V2Slc5HFQyk56VznK5QP
         6v0bknR+3JpV6mtFqUgGHM1HmhmYWGMglvugJqChiqyfIUS0GoOQ2fwOHa34Ym63HI5p
         /haORPw66jhDFLOai1wT+cqHaSuvYWN3EVcWfL2rY7ZXbrpyP1ULBE104bCpLA1PwXn3
         wGe0Lq+FdnqB3gZJ0FwUDjYfs5AJSw9aEsxfYTOf99grP51lQ+2PhHYHM5WbMgR1YavM
         EROA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782875681; x=1783480481; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VS5ekj4FCpEpJNmH/ZuA4QFE9m28JNhBKG92EL1tzpg=;
        b=BGCiShZnwtCSqR2VKZqg5pU4u9d7W3a7+DJnOpVBHjRMM+X+b7DyAell10SHL1lYWV
         GYE+qhEG/Is8wNCsj7Ybc5eOt+GYwoGFPkUNjDtdSyLc3+6+8LCDM+e0h2v14poPuRji
         1yXZ+QwCNrQjM5ihqCNDz0xpffsna8qI4r55XYi5Eoj5W4et0hIEndGr1yJOgEOmb18y
         G+q2eWY48qZPCXC3umSLeGbIb6grtIpNv+YrQZ/M1VnpUkGi8Kgx2X/VaJxXO5a3ZJ8y
         U2YIGhdXXfiffvdIra1poEfBKU0Zeski4ELTHbNZsi06b+iX38SH9VeDNiVno9q2o1NP
         AUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782875681; x=1783480481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VS5ekj4FCpEpJNmH/ZuA4QFE9m28JNhBKG92EL1tzpg=;
        b=cYoudXfMSNu8F2a0bFnO1IwVr8ZYBqI6ROZeBmj29uQGf1sUiVltcKmHKaE+hpTZye
         o1u/po3MT8pRCUv2YoC3ZKU2zfl096teyDQ4kMT8fuLzTzUvp2qL04/kY3yQ5IMOY2tZ
         27u3CFSrD6UDsm4VxAzx9NYE60mwAkCr939I0tvFaExL0VMDQTQb5/G6bTGMMQORQUBr
         s8OsjAf6tzIg2KvjqxFEeh4xAA+WAcaGa3fmir8KPmzNHu6PaX07WM79GMCr2j2RwWeC
         lbwja8aJTyXCdAfKIYRFLMaopZ1G8D4RySzGyIRkmdyQOXV/v0e/YSJJSUYOBUcH6OD9
         Pmkg==
X-Forwarded-Encrypted: i=1; AHgh+Rqam50YuJoWGgL++em2nNZkv1lyeheFltbtYiMyp4bfssPdlvC2yR3W2W4TFeev3XbvVx/rs23QMYVvjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZy6Wx+XFTbbDUM9wNmXM6j2ePeEGJM8cbNcADjHWCoTWAyq8t
	qQ3QheI0yPPOG9MCKqQH0sdgDmNxiPx2EB0q8KAn6mcTJVrmQTwKgw67J/KG/qpsddUsFFG1ukc
	6DBCZozQlrACZX7Ge6I5KS3fwinWKoQt+g6N8iT35ujP6y4jC0/JYLGGKdKk8llETGNzmQ6SQVq
	Ji/3aqv5KUvrLHK0nMGPrc2bYbOoMZuaz6baFHtOPOKeIsMQ==
X-Gm-Gg: AfdE7clofQKQKceEzZ3G3Ik1/5JbQ12YCkp4pBhky9ZQ3Rne9zfog+Gseqg1HUui1XK
	XWbcTC4m+OOZoPo5yn/gQLN8q2cVJWT9LsAGmwA8ontScZ3rjpUbcq+SPPCxQ2zXP5m2aKtIuio
	Og5/QSxk4m2dk4KS6jriiuOdsfInfH6fMjIFjCJLZFHLHu0Ufg/PkkzSBTKC8no2LnZXwA9Q==
X-Received: by 2002:a05:690c:22c2:b0:80c:85e5:8749 with SMTP id 00721157ae682-810db01e72emr70433487b3.71.1782875681054;
        Tue, 30 Jun 2026 20:14:41 -0700 (PDT)
X-Received: by 2002:a05:690c:22c2:b0:80c:85e5:8749 with SMTP id
 00721157ae682-810db01e72emr70433197b3.71.1782875680711; Tue, 30 Jun 2026
 20:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260609192856874Y8AaPpKL5TnmbgiWI8DI3@zte.com.cn>
In-Reply-To: <20260609192856874Y8AaPpKL5TnmbgiWI8DI3@zte.com.cn>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:44:29 +0530
X-Gm-Features: AVVi8CdZv5JqJiLqPrWvRuGUGoTjuCetf9hU24TCu97qowjOVPb4FJ55ZLdiM28
Message-ID: <CAB19ukErZAJZjXwZFE6m3R8N8L3jTn=FUR-sKm0RgvyhXmkyWA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: RISC-V: Fix false warning in cppc_read_ffh() for
 same-CPU reads
To: wang.yechao255@zte.com.cn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAzMSBTYWx0ZWRfXwVJzGwLQ4L01
 6CAVT5noU3wW7PF9rtE1wJVGeS9xKWoR3DXFXpYrX29Qdpp5GGbiBU4AdEKI8YVkDWnKIS3o54M
 Uag/pfh2wrg9X6G3ikeKcJ4EUNC06Ck=
X-Proofpoint-GUID: E-WNfL8FzvE9ebqp0zP7u0hmlC8fb_I6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAzMSBTYWx0ZWRfX1r0q7e6BbD+j
 k17ldb4o9n+1CfPLKQgHbok8Jv3QG8YPvdMRf7kiskNawF1uaL7J9BYTvSc2TPmlh4JKtJ0wZdw
 fIICr1JGl5wbqWppl24XrpatVWQjredRtVAEazKzYLn+1kmTKd1a1epFI8VZcuPbcrbljNvpgil
 3HJ/G+e1YCx6crx1raAhPuTRC3z7kwolRT0fTIUJDunPO2mMbq3+0IOI8FImQWQlyg1x3roY0Iw
 t6iqV+qNoG7lFEh+3mUh1MAhyPhof7nuGloIUqe7IdsZ0yK1SOPmTQJMFNgy1pb41aSetUCH0iP
 NYNeuagu+Xk7aFNHUDIeYoKtb/ymkpG+tv8BIHCw80afDtqgbQehlerzFdvvXbqYnA4wsfwMXRi
 rd88RekGkRPGLEPpVPMHebTAcbpjHcdMaQFCUWVcFp0YETSHF+72BWjyaTf1kW+9n9J9e3BTbKu
 Hi2za79Ezy8IMoQdSIA==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a448621 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8
 a=ChMDA8uULeNNkDMNihIA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: E-WNfL8FzvE9ebqp0zP7u0hmlC8fb_I6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_201443_933581_6DB3A809 
X-CRM114-Status: GOOD (  20.70  )
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
Reply-To: sunilvl@oss.qualcomm.com
Cc: zhanjie9@hisilicon.com, aou@eecs.berkeley.edu, alex@ghiti.fr, rafael@kernel.org, viresh.kumar@linaro.org, zhenglifeng1@huawei.com, linux-kernel@vger.kernel.org, pierre.gondois@arm.com, linux-acpi@vger.kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org, pjw@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gOSwgMjAyNiBhdCA1OjIw4oCvUE0gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20u
Y24+IHdyb3RlOgo+Cj4gRnJvbTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20u
Y24+Cj4KPiBDb21taXQgOTk3YzAyMWFiYzZlICgiY3B1ZnJlcTogQ1BQQzogVXBkYXRlIEZJRSBh
cmNoX2ZyZXFfc2NhbGUgaW4KPiB0aWNrcyBmb3Igbm9uLVBDQyByZWdzIikgY2hhbmdlZCB0aGUg
Q1BQQyBGcmVxdWVuY3kgSW52YXJpYW5jZSBFbmdpbmUKPiB0byByZWFkIEFNVSBjb3VudGVycyBk
aXJlY3RseSBmcm9tIHRoZSBzY2hlZHVsZXIgdGljayBmb3Igbm9uLVBDQwo+IHJlZ2lzdGVyIHNw
YWNlcyAobGlrZSBGRkgpLCBpbnN0ZWFkIG9mIGRlZmVycmluZyB0byBhIGt0aHJlYWQuIFRoaXMK
PiBtZWFucyBjcHBjX3JlYWRfZmZoKCkgaXMgbm93IGNhbGxlZCB3aXRoIElSUXMgZGlzYWJsZWQg
ZnJvbSB0aGUgdGljawo+IGhhbmRsZXIsIHRyaWdnZXJpbmcgdGhlIHdhcm5pbmcuCj4KPiBUaGlz
IGlzIHRoZSBzYW1lIGZpeCBhcyBjb21taXQgZGY2ZTRhYjY1NGRjICgiYXJtNjQ6IHRvcG9sb2d5
OiBGaXgKPiBmYWxzZSB3YXJuaW5nIGluIGNvdW50ZXJzX3JlYWRfb25fY3B1KCkgZm9yIHNhbWUt
Q1BVIHJlYWRzIikuCj4KPiBGaXhlczogOTk3YzAyMWFiYzZlICgiY3B1ZnJlcTogQ1BQQzogVXBk
YXRlIEZJRSBhcmNoX2ZyZXFfc2NhbGUgaW4gdGlja3MgZm9yIG5vbi1QQ0MgcmVncyIpCj4gU2ln
bmVkLW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+Cj4gLS0t
Cj4gIGRyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgfCAxOSArKysrKysrKysrKysrKy0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgYi9kcml2ZXJzL2FjcGkvcmlzY3Yv
Y3BwYy5jCj4gaW5kZXggNDJjMWE5MDUyNDcwLi41ZGNlMDM3N2E4ZGYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYwo+ICsrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBj
LmMKPiBAQCAtOTgsMTYgKzk4LDE5IEBAIGludCBjcGNfcmVhZF9mZmgoaW50IGNwdSwgc3RydWN0
IGNwY19yZWcgKnJlZywgdTY0ICp2YWwpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzYmlfY3BwY19k
YXRhIGRhdGE7Cj4KPiAtICAgICAgIGlmIChXQVJOX09OX09OQ0UoaXJxc19kaXNhYmxlZCgpKSkK
PiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPiAtCj4gICAgICAgICBpZiAoRkZIX0NQ
UENfVFlQRShyZWctPmFkZHJlc3MpID09IEZGSF9DUFBDX1NCSSkgewo+ICAgICAgICAgICAgICAg
ICBpZiAoIWNwcGNfZXh0X3ByZXNlbnQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4KPiAgICAgICAgICAgICAgICAgZGF0YS5yZWcgPSBGRkhfQ1BQQ19TQklfUkVH
KHJlZy0+YWRkcmVzcyk7Cj4KPiAtICAgICAgICAgICAgICAgc21wX2NhbGxfZnVuY3Rpb25fc2lu
Z2xlKGNwdSwgc2JpX2NwcGNfcmVhZCwgJmRhdGEsIDEpOwo+ICsgICAgICAgICAgICAgICBpZiAo
aXJxc19kaXNhYmxlZCgpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKFdBUk5fT05f
T05DRShjcHUgIT0gc21wX3Byb2Nlc3Nvcl9pZCgpKSkKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAtRVBFUk07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX2Nw
cGNfcmVhZCgmZGF0YSk7Cj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgc21wX2NhbGxfZnVuY3Rpb25fc2luZ2xlKGNwdSwgc2JpX2NwcGNfcmVhZCwg
JmRhdGEsIDEpOwo+ICsgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgKnZhbCA9
IGRhdGEucmV0LnZhbHVlOwo+Cj4gQEAgLTExNSw3ICsxMTgsMTMgQEAgaW50IGNwY19yZWFkX2Zm
aChpbnQgY3B1LCBzdHJ1Y3QgY3BjX3JlZyAqcmVnLCB1NjQgKnZhbCkKPiAgICAgICAgIH0gZWxz
ZSBpZiAoRkZIX0NQUENfVFlQRShyZWctPmFkZHJlc3MpID09IEZGSF9DUFBDX0NTUikgewo+ICAg
ICAgICAgICAgICAgICBkYXRhLnJlZyA9IEZGSF9DUFBDX0NTUl9OVU0ocmVnLT5hZGRyZXNzKTsK
Pgo+IC0gICAgICAgICAgICAgICBzbXBfY2FsbF9mdW5jdGlvbl9zaW5nbGUoY3B1LCBjcHBjX2Zm
aF9jc3JfcmVhZCwgJmRhdGEsIDEpOwo+ICsgICAgICAgICAgICAgICBpZiAoaXJxc19kaXNhYmxl
ZCgpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKFdBUk5fT05fT05DRShjcHUgIT0g
c21wX3Byb2Nlc3Nvcl9pZCgpKSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRVBFUk07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3BwY19mZmhfY3NyX3JlYWQo
JmRhdGEpOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHNtcF9jYWxsX2Z1bmN0aW9uX3NpbmdsZShjcHUsIGNwcGNfZmZoX2Nzcl9yZWFkLCAmZGF0
YSwgMSk7Cj4gKyAgICAgICAgICAgICAgIH0KPgpMR1RNLgpSZXZpZXdlZC1ieTogU3VuaWwgViBM
IDxzdW5pbHZsQG9zcy5xdWFsY29tbS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
