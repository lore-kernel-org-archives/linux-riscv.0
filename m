Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D05D29DE2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UW4JUX/Lu8aPdOxHOmInVMTp30TIFXRSs1kjgI6+C50=; b=ANYZx2hspciS2s
	ZtKzyX7Wo3Bg0wLTqkVMjxvdDI1nqdGxKc4U9zEfiqy5KET8CtTNsVw9aGVHkokeVt+6w4iJf0/Mc
	hXi9PwbwT37uENplJlqnc13SoFmjjPg8Z+W4Ix3HvtCHGjD+m+DpZaJ4ZUXhyqXAlvskh8IkA6lKS
	tKUIBqs/Mc1Go9Sy2LWKyprV1/YECYLldOHOhXXbRSiKaO07HrYgBHgd3NjwehmDyW872KvF4VZxe
	gqWaZ6dHplfwNL8i1MCY/JbAKEFHZ3eIv7FcC7MZBQnXfU43llNy/+XqJ02/eLfb/9CbaS4RP2hh0
	Df/JrNdtKoZi57JyV5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZyc-00000006laY-04Bw;
	Tue, 13 Jan 2026 08:42:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZyZ-00000006la0-24Y8
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:42:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1thu02752099
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 08:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=gMMQfkmso6EqTlKeQEIEJn6dTWYUS6uAjenTpc28WAg=; b=oC
	Rv0Yc7voplOJZGPIG+HGVNrv1yJUbGTtAr/0T90J5xBbbGRXbHTsT4PZQDK187Sd
	5dq9JJmBcFMqj3K9w8ns7D1vIt4EUn9Q5BeStCe3AMyVdBx40d+owdeDUjE2fQIS
	WW40/Ja0zGgBx4fJ0SEkTlPOP96lOPK18PN1K6X3yiJgzKGTqgiShP5DM/i6rFOV
	BV2v28SOxRuzDuFigKIM4g8VRfwYsR1QVOds9J3iz3J8pCv0ebYmNfbbQ/4lfCbd
	rp7jdJgfzwr1gMGL9LMgDeCsO0YPajQYgtx8WdlXch7AuxXggLFxLdM3VZ8GleRH
	QbsEJ6SWkMi0tkd0UcGQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnctjs1yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 08:42:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a34f64f5eso179414276d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768293726; x=1768898526; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gMMQfkmso6EqTlKeQEIEJn6dTWYUS6uAjenTpc28WAg=;
        b=cyQfvUqQ7ED9XjqTmi1DDiJ2l2CHJTl4ibFSf22aDh/U+UeFR7LqkhYBhaFpE6QBbW
         8ubBkxSCJ2Bogr8PuLSo2+zYPUYiji2kQfQZ+RLev4HaH4tFRDDSY8nFE4BdP1/1C1X2
         F+jwxYb+REaDCD68L2Wr8ecY3o2FT0f53B3bhjFuIhDUPYU3Vc6fsICLuX+e0TDkZUsx
         X6GpxVv4Zb1WjojRdud+wWU9VzrFmDzYnN9uPsiOE6mTzxe9T/PjU7KVA9wjOOziCdhi
         vl+W9Ll7iUXu7o/GbxLFUJlfe8iwV1rao7wgkLwgtUQ4vHLjIkyGPVB84d0k/R6pSFjv
         PmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768293726; x=1768898526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMMQfkmso6EqTlKeQEIEJn6dTWYUS6uAjenTpc28WAg=;
        b=Vit9t1OWLRLYOySABDndorLdEyXJXwU4JouTqI0ZUjzhcZrZgqZ5UAVBfzmzJ436rB
         Z5K/RTkMWDkjdV30viMiL7X2eZ8XxLaNA2U5kO0yd1+QVqLTE5GtrE1qfCOUbQFIdy/L
         h7elMuD2gy0pbEm51uaQTqYAq0bBkyfwoSB+7M+9cjxcPo/Zp+Q5Of37NuYuKjBbILcY
         MZAN0m2ik+j4+BoeSWNwJVjTU5cxVgzyOmnYm7Qc++uGgZ/FPl2G/74Vd6wlywvn6Col
         A7ySdBjDOWdXJlsWgz7vNUdaf1aRyyr/5Xr+oe+VZdHP9qmNxL5qKOh6qpCi0XDYFH55
         6P7w==
X-Gm-Message-State: AOJu0YzM9oXTNvxq3P2RF7Nq3H+Bstl0Vkx3vAzVCCeaoyInV02LbmIf
	LG0gcddxY5KJ4lqJl2E/zaZrjrKx/zEQ18nSYA9NoiYlMDk+h+eCLpjTMICjEWGxSoss7NVATqw
	Zs6uAruNM3NnMTojQ+cbRvUpFajAQUM5dR3HO2pP0aYJZQs3xbYLushKUSKiJGcKfeoAC2rTH3l
	JSwjER6NZaPPh655gAckj1/+MWyAYjNKOU8CTyMVPBxsHBgQ==
X-Gm-Gg: AY/fxX6+J4Xd9KEeRKEgl0L8CpzWhpG6AbQqQdluMiN/CYMl8Oxmjj/yTGjsQQYXrBc
	ZdrftIPS4Hmu3ETpoa9IL0RJO/5jt3uB1IrfhAjQMEEVdamWGMMKJunK62FSugpZz2g9wOPVcmn
	6mavTsgyVa4F7qAMjoXo114QgHDA4E/ZBfw7J10j+0aXEWvY4m35dMy+IepL3QG9hoPQ==
X-Received: by 2002:a0c:e017:0:b0:880:4272:9a4e with SMTP id 6a1803df08f44-892661a78a8mr25805616d6.10.1768293725692;
        Tue, 13 Jan 2026 00:42:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJYJUOMDvWx4l8hA/velk17KC5jXEUWmnRlBHDEYXsu1TKZmLa9YbgjQfnsevRZSrydtA0WA9PnjG8rM9/N9s=
X-Received: by 2002:a0c:e017:0:b0:880:4272:9a4e with SMTP id
 6a1803df08f44-892661a78a8mr25805426d6.10.1768293725320; Tue, 13 Jan 2026
 00:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com> <20260109090224.3105465-8-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260109090224.3105465-8-himanshu.chauhan@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:11:54 +0530
X-Gm-Features: AZwV_Qh9cMywaFsFi6xL1Dz9DO_-xJHelf2IMNiJrFuansm4cMH8oxrnVD1xemI
Message-ID: <CAB19ukFj7BiyikY7Bmnu5uWidZcBhL7Vg+Yhc8exstKj_UnRhg@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] riscv: Add RISC-V entries in processor type and
 ISA strings
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com,
        anup.patel@oss.qualcomm.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3MiBTYWx0ZWRfX2o3FZqHbSaVh
 4yt2zk4oJFOupzSFbmPqcpIlwkGFw312yJwJmQNbVyWkn95DkGO5MVrrA2KLBfI0fgmy5ciVuVj
 AG7aC3n7MdbCEmdpMBtFmi8syp3V7mN3vbpwKPkP3ohEPZ9AV/su5dTXwGp8s/7HJfXYoT/Mpvq
 NtXB0WfL7w+aBCtx7MiQj8IdNBv5V9PMeZmPAtZBFDl1dphpVYte4E5tapu04C4MIWD47ZsQvod
 dA2h1LTpIEjrVY0cz6ruwe76IgDZQYIWuDbyN95T8dkOK0f5M77bD5ac292u2DtJObmN/OC6Z6P
 9zt3tAh+PYw8HlTFILOqttrZqB1njqMZp1IthtJsmq04kQWAF6XvlEAgz1kSf8qofif9WJURM6k
 arAhEEXYQSOXuRJWdFjZ/kvPRM6tyJztGP6+QB3Bp96FfUJw9OHR9YpRfTARzvShvgDML+M3IQK
 ya3Etn4DF+fPkD2y+Dw==
X-Authority-Analysis: v=2.4 cv=Ls2fC3dc c=1 sm=1 tr=0 ts=6966055e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=xWNtRwkhHlcOdG438WIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: zf5ErOKYDwBwhcyUzbzP6GqMwhbNz-jH
X-Proofpoint-GUID: zf5ErOKYDwBwhcyUzbzP6GqMwhbNz-jH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_004207_651560_FFE201E0 
X-CRM114-Status: GOOD (  19.10  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSGltYW5zaHUsCgpPbiBGcmksIEphbiA5LCAyMDI2IGF0IDI6MzPigK9QTSBIaW1hbnNodSBD
aGF1aGFuCjxoaW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQWRk
IFJJU0NWIGFuZCBSSVNDVjMyLzY0IHN0cmluZ3MgaW4gdGhlIGluIHByb2Nlc3NvciB0eXBlIGFu
ZCBJU0Egc3RyaW5ncwo+IHJlc3BlY3RpdmVseS4gVGhlc2UgYXJlIGRlZmluZWQgZm9yIGNwZXIg
cmVjb3Jkcy4KPgpJIHRoaW5rIGl0IGlzIGJldHRlciB0byBhZGQgdGhlIHJlZmVyZW5jZSB0byB0
aGUgRUNSIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCj4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUg
Q2hhdWhhbiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2Zpcm13YXJlL2VmaS9jcGVyLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvY3Blci5jIGIv
ZHJpdmVycy9maXJtd2FyZS9lZmkvY3Blci5jCj4gaW5kZXggMDIzMmJkMDQwZjYxLi45ZDU5MWEy
OTQzMjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvY3Blci5jCj4gKysrIGIv
ZHJpdmVycy9maXJtd2FyZS9lZmkvY3Blci5jCj4gQEAgLTE3MCw2ICsxNzAsNyBAQCBzdGF0aWMg
Y29uc3QgY2hhciAqIGNvbnN0IHByb2NfdHlwZV9zdHJzW10gPSB7Cj4gICAgICAgICAiSUEzMi9Y
NjQiLAo+ICAgICAgICAgIklBNjQiLAo+ICAgICAgICAgIkFSTSIsCj4gKyAgICAgICAiUklTQ1Yi
LAoKVGhpcyBzaG91bGQgYmUgIlJJU0MtViIgYXMgcGVyIHRoZSBFQ1IuCgo+ICB9Owo+Cj4gIHN0
YXRpYyBjb25zdCBjaGFyICogY29uc3QgcHJvY19pc2Ffc3Ryc1tdID0gewo+IEBAIC0xNzgsNiAr
MTc5LDggQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBwcm9jX2lzYV9zdHJzW10gPSB7Cj4g
ICAgICAgICAiWDY0IiwKPiAgICAgICAgICJBUk0gQTMyL1QzMiIsCj4gICAgICAgICAiQVJNIEE2
NCIsCj4gKyAgICAgICAiUklTQ1YzMiIsCj4gKyAgICAgICAiUklTQ1Y2NCIsCgpUaGlzIHNob3Vs
ZCBiZSAiUlYzMi9SVjMyRSIgYW5kICJSVjY0IiBhcyBwZXIgdGhlIEVDUiBhcHByb3ZlZC4KClRo
YW5rcywKU3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
