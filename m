Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C458C88E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 08:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SY5DtndbuHIRcqioFj1JQjB9oMCzEAb6ZJg57kGPXfM=; b=P+Swqg4P4zSQoi
	Oz098aJCmYF40bLyIpS0SBPcGQNdadj/EwhjbwVESfxypHZnE/DJFmkDKjESoDmRSlCGHKjwOUQUB
	lTht9ViL9VhadQn9nz5cj0dNiS3uumdAdE9B8RNKOBSC/EP8U2hKnvahcQQWkbWpC6K5+2C+40pkk
	yCzDyJRc5h0AhS5faCnRFdrQS4zDOH97Qd1sEQEDQZ5Kt5MJfFR4eaqbMFOoEfsuLO7oE3EiJXKWh
	n8UTzDvbOB+1l0dGSJH8J/wxlAJBpBKozBUzDyHROVOfzmX5d/xQBGA0rBV3dv+QzyereeSaFMLhU
	1pfHURWd+o/4RyJ2fRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6koB-00000008hF8-0TKM;
	Wed, 16 Sep 2026 08:16:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ko8-00000008hDx-1KcH
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 08:15:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G7XaOX2970550
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 08:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgP5HdRm5/ypy7B2uxMSTsL/gunMeW6/Ikm87gCsoUc=; b=claw5/PQwPgEkA6R
	gOWj7y+8gEf+AEzC8YQp3V15E2t47LCjQnYj9rCRqmO89OG5slDVwnmLUdM+NDTu
	mBAsdzHz6YgM6pA40lHZAjWjwvnECjRZWChpEPwknUorWd1F8G22uat6kEVgSVim
	sf4KqgdWKN14vIJEiANg9g/1GBL87Lm9b5+oZN+BWcvZPqvehCL/yzPIZ1yLZOd/
	U7KJgJ4VPRyKRxIGZswIvrIuIAJp3m/7ddd25qGXlul/mA38RngjWq1tXFd54N60
	5CvvgfqdHrJhnhZPipE+dMz8Yc0WX+y98e3neS0kzRbgGV5J7jm5dIyXFycMuqkc
	AOFAKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2r5dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 08:15:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39dfcc20aeaso2835457a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 01:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789546553; cv=none;
        d=google.com; s=arc-20260327;
        b=djnXeUrScOk0/a3HahNtJZi8FswsLqzVmH4XiAjb3FU78ECh11oItus111iSLjPySF
         yhmT2xohoNVIpougtHOLl4MoAdKcM/LC/Ucy/5WVR5DwCKI+7KC9Dgj4F3mB+YYiMS1J
         IASxvEc29vdV1LKgjS9gkpdWvJX0tjczcvvqgEhJJYM+WZ3xlLox3p917EiFz25hqX6U
         n54adxjqM57Qjzf3G2CftEkRS6M49EDqxKrtS1q9U4etjvazemWXqUKZqL6N8HBztPtt
         ZQvI+uAFJoUk77qGqpEGUNe8Nz2992Y1UhCunP/zDWWwPdFyFiZgry41Tn2mGSgMGjtv
         JTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VgP5HdRm5/ypy7B2uxMSTsL/gunMeW6/Ikm87gCsoUc=;
        fh=x0ZscKaVXUGAJpjr3HOyMm5TtYyIV7PWT8A/12mxKkw=;
        b=qypuCnj4Imc0ZCSjV7U+E3zi9TeGDERYh5FRndArsRlDwVGjz5XOCGPDzJvFBVYlwB
         Zk2rUVjH8UhhUfmDeylcNlhWdfdwqZbYVQQU20cD3KWZ+eSJoSf3xwQqCLDWPBBYks8a
         rglNoYQaCOOFfRScQ1WHv+2ArtXap4nszKNQMU4WXmtFGotjncDb8KogMJHXEHtCbXcR
         zfVcOKt3c6MHYSWHJHZd3UZg29jgKS2ngCwu6vk/DdzNpU6O8BmTgpIYhJbaYdG3hccn
         xaRThzUAmPirM5JgOS8yZiUrdykIorfDxkUJtrrrfZeBulvafZkNlAB7F8c5a0MGaiE2
         JxRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789546553; x=1790151353; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VgP5HdRm5/ypy7B2uxMSTsL/gunMeW6/Ikm87gCsoUc=;
        b=NxtcORpUqH9f4cQaB1r9ujFODeyb6lJ5l1GGA1nqLuZFpwMGwzE+fdQoYbwFgzgalh
         ucZOq2XiXxYavpzAwPFMBdkASioLHv2pcAap4JZ5do55CNv57Qtem6gpPWEO6VfdxLXV
         2CShluKimsybELHoGRX5rOjETuupyIB21T0OMYcTmugGlrbNx41XUEZR9dmmckBv2TZ6
         HWbTyt8C67CraJ7sU35piXkXGt4FJLUnucYpC7C8llmuzdGxFMkKoOL+dzpHfs10USdt
         LeyhsU+X7cDVMpJtVj0ji74TN/+2k4y4yHMQP/w/T5ppjpZ9CMXhEQFN7XrhQSkdNBUB
         AxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546553; x=1790151353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgP5HdRm5/ypy7B2uxMSTsL/gunMeW6/Ikm87gCsoUc=;
        b=rkSByoTh/Mrl0C7A1gkFP1rSjOMu0SJVd/QIAg9WK3tGwQEFmRgNz2UmpJlPtO/HvT
         BibeF128tKn7eGaeSsKIusC8+ci3jnf+PQS+0D+wMKDzd7LMZJToQ3lG4T5S3vhg3xpG
         P2O2ioJxnSfXD7RxR2FXNmdD378f3Wu/SoBhtkb3iBu8abSS1TnlFWHs/asl3lMK5YR4
         WFNETmoa7AjbD1kCwjkG52cGLyal43ZktkVIvDamw7JpOz888XsgUX15sOmYYjs+3ikj
         mHHey0v/vsWmrQ68oBAJHXmoFINlQA9VH1xSxrjdlbIL57PFNDZLw6+hCSP2hPjHjGmT
         +2vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFG6PTcXZ7qLFCMW7QeyCna5UCxoobUPVwCgIdWHFw94RxX+knOwQ8Z3lFadXO85kZG8G+aVIuXfAA3w==@lists.infradead.org
X-Gm-Message-State: AFuF++kqnGsmknUTtpAIkWrBhH5Fhc+w7yis/+uZXjKW/SQ9dHC+IrjZ
	C+VNVhF1vDUlyOk+kChUhxWXNXW15U20soKFvXJXx0nJ43dYgjsqNSRJBNPPz9j0UYh/5P9uhM/
	XFS0hJg1+JXvYUt07hooNlCxO2Yakw+dVcw5x3IG8BM0n44unRIIxstWimtotmJeLml4EMBOM7q
	7XRRjDPHbv33QF8buzxXRrPxqrAStDdPWuDI5bcJC6RPlsug==
X-Gm-Gg: AYBFou22e/1z84NAuXASp9XZmsDisO0/h/N3vd18VPSgpyqneRQxhQbdt1UVe4nP34r
	CiF8v6kPd09VOy5pycYkdV6xLsl88foD/PfsGWcu+4Gh9bDFPz2MQSKqgD480yR2RBCHD7dN8GX
	/tUQ9ghWgVBpHo9CZmEErjAbMpZZrtjKJ9E0nOUIKNTJQcLsHKZQh03HdPYGg=
X-Received: by 2002:a17:90a:1650:b0:39e:248e:fdeb with SMTP id 98e67ed59e1d1-39e248efe80mr1347700a91.19.1789546552823;
        Wed, 16 Sep 2026 01:15:52 -0700 (PDT)
X-Received: by 2002:a17:90a:1650:b0:39e:248e:fdeb with SMTP id
 98e67ed59e1d1-39e248efe80mr1347640a91.19.1789546552255; Wed, 16 Sep 2026
 01:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
 <CADRr4be9p14tQcx=v-jVwfXwka0eBV8MWPfj1G4qcqv=yfxjfg@mail.gmail.com>
 <CA+Ht8=Y3CJA0jq3o0j--jA-avcBm576zm-54+BxoRfm6JB72Hw@mail.gmail.com> <aqofe_pdCdPhpRpD@blinky>
In-Reply-To: <aqofe_pdCdPhpRpD@blinky>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:45:40 +0530
X-Gm-Features: AcwNN1UTFfJ6I6-UOW007DWbngDs9XjQy_I5mhiVO6AT8mA6yf6wpB_-UGiw5wQ
Message-ID: <CA+Ht8=YYsG4w3G44M0qmXrg88j3G9McunjTqLghwZ=5iJVN3dA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] riscv: Introduce support for hardware break/watchpoints
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Jesse Taube <jtaubepe@redhat.com>, linux-riscv@lists.infradead.org,
        qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org
X-Proofpoint-ORIG-GUID: Evuq1cmy9AU-MynMD6Z4jC95lciopKoY
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa5039 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=JfrnYn6hAAAA:8
 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=Szl7KQOmT0g9m7oTZp0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: Evuq1cmy9AU-MynMD6Z4jC95lciopKoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwNiBTYWx0ZWRfX1Nt1ThqR085P
 QNEfLksnIZo0KvNckGHLf6epjq5M0wdhIKLjb6OO4430uGDXjL9SWXeytsO2qvSMzSsnalujsrr
 XmwCd+kmurkFsgGxSKXMgjZsEgHFiJtxzKYiQLQUZXt0SlML6c9oJj4A/gVMWRpyVuI9vtsWXPP
 9av74xoagGGclKzyZAN2s02QUK6x2oXh2NqsBQ/qGvenzpELNm/xtfZ54mQYyQBHMYXI19o8Sib
 WHnCpvyGTCUuj/dWWldKDLtpzjuGZBy7sTsQF9tOo/+mDyegT0wTJwkXvN6hcXL2u9Zql/2XsFe
 6JU6KlUpLLK2IJhtq75Rfssc9MXBfjKxNkwh7W/Jpc0KfNM48srluE165UnwgFyNNHCWTeN19vp
 hQmlCVt+gOHAnIcVlLxjgBEV5OQo6iGDV1FiuuMqOZpxgkqx2Xo9XyCSHP8olkcA1GK9vEFgCAV
 qxcMt40KHiGSRK7TO6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwNiBTYWx0ZWRfX92y+SEg040eb
 Y/NvGdRRTu+lI/dSWmcQNb9R5Blt7fBo/aMyDfmPZSNOd9J3wuHDUqDWdhNCfj718g8xBj5fgh9
 JrE94NA3yK0ZmZBgWumWJFRKkqB2rIE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_011556_374524_9F9CD979 
X-CRM114-Status: GOOD (  44.49  )
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

SGkgQ2hhcmxpZSwKCk9uIFdlZCwgU2VwIDE2LCAyMDI2IGF0IDEwOjE44oCvQU0gQ2hhcmxpZSBK
ZW5raW5zCjx0aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBB
dWcgMDcsIDIwMjYgYXQgMDE6MzA6MDlQTSArMDUzMCwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToK
PiA+IE9uIFR1ZSwgQXVnIDQsIDIwMjYgYXQgMTA6NDLigK9QTSBKZXNzZSBUYXViZSA8anRhdWJl
cGVAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgQXVnIDMsIDIwMjYgYXQg
OTo0OeKAr0FNIEhpbWFuc2h1IENoYXVoYW4KPiA+ID4gPGhpbWFuc2h1LmNoYXVoYW5Ab3NzLnF1
YWxjb21tLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIHBhdGNoc2V0IGFkZHMgc3Vw
cG9ydCBmb3IgaGFyZHdhcmUgYnJlYWtwb2ludHMgYW5kIHdhdGNocG9pbnRzIGluIHRoZQo+ID4g
PiA+IFJJU0MtViBhcmNoaXRlY3R1cmUuIFRoZSBmcmFtZXdvcmsgaXMgYnVpbHQgb24gdG9wIG9m
IHRoZSBwZXJmIHN1YnN5c3RlbSBhbmQKPiA+ID4gPiB0aGUgU0JJIGRlYnVnIHRyaWdnZXIgZXh0
ZW5zaW9uIChTZHRyaWcpLgo+ID4gPiA+Cj4gPiA+ID4gdjYgZXh0ZW5kcyB2NSB3aXRoIHR3byBu
ZXcgcGF0Y2hlczoKPiA+ID4gPgo+ID4gPiA+ICAgLSBwdHJhY2Ugc3VwcG9ydDogZGVidWdnZXJz
IGNhbiBub3cgc2V0IGFuZCBxdWVyeSBoYXJkd2FyZSBkZWJ1ZyB0cmlnZ2Vycwo+ID4gPiA+ICAg
ICB0aHJvdWdoIHRoZSBzdGFuZGFyZCBQVFJBQ0VfR0VUUkVHU0VUL1NFVFJFR1NFVCBpbnRlcmZh
Y2UgdXNpbmcgbmV3Cj4gPiA+ID4gICAgIE5UX1JJU0NWX0hXX0JSRUFLL1dBVENIIG5vdGUgdHlw
ZXMuIEEgc2ltcGxlciBQVFJBQ0VfR0VUSEJQUkVHUy9TRVRIQlBSRUdTCj4gPiA+ID4gICAgIHJl
cXVlc3QgcGFpciBpcyBhbHNvIHByb3ZpZGVkIGZvciBkaXJlY3Qgc2luZ2xlLXRyaWdnZXIgYWNj
ZXNzIHdpdGhvdXQgZ29pbmcKPiA+ID4gPiAgICAgdGhyb3VnaCB0aGUgcmVnc2V0IG1hY2hpbmVy
eS4gVGhyZWFkIGZsdXNoL2NvcHkgaG9va3MgYXJlIHdpcmVkIHVwIHNvCj4gPiA+ID4gICAgIHBl
ci10YXNrIGJyZWFrcG9pbnRzIGFyZSBjbGVhbmVkIHVwIGFjcm9zcyBmb3JrL2V4ZWMuCj4gPiA+
ID4KPiA+ID4gPiAgIC0gRXh0ZW5kZWQgc2VsZnRlc3Q6IHRoZSBleGlzdGluZyBwZXJmX2V2ZW50
LWJhc2VkIHNlbGZ0ZXN0IGlzIGV4dGVuZGVkIHRvCj4gPiA+ID4gICAgIGFsc28gZXhlcmNpc2Ug
dGhlIG5ldyBwdHJhY2UgR0VUUkVHU0VUL1NFVFJFR1NFVCByZWdzZXQgcGF0aCBhbmQgdGhlIHJh
dwo+ID4gPiA+ICAgICBQVFJBQ0VfR0VUSEJQUkVHUy9TRVRIQlBSRUdTIGludGVyZmFjZS4KPiA+
ID4KPiA+ID4gSSB3b3VsZCByZWNvbWVudCBhZGRhcGluZwo+ID4gPiBgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYnJlYWtwb2ludHMvYnJlYWtwb2ludF90ZXN0X2FybTY0LmNgIGFzIGEKPiA+ID4g
dGVzdC4KPiA+ID4gSSBzZXQgdXAgYSB0ZXN0IHJlcG9zaXRvcnkgaGVyZQo+ID4gPiBodHRwczov
L2dpdGh1Yi5jb20vTXItQm9zc21hbi9kYnRyLWJ1aWxkcm9vdCBmb3IgYW55b25lIGVsc2UgdG8g
dGVzdAo+ID4gPiB0aGlzIHNldC4KPiA+ID4KPiA+ID4gVW5mb3J0dW5hdGx5IHRoaXMgc2V0IGZh
aWxzIGBwZXJmIHRlc3QgMTUgMTYgMTcgMThgLiBJIHdvdWxkIGxpa2UKPiA+ID4gdGhvc2UgdGVz
dHMgdG8gcGFzcwo+ID4gPiBiZWZvcmUgYWNjZXB0aW5nIHRoaXMgc2V0LiBNeSBzZXQgYWRkcmVz
c2VzIHRoZSBwZXJmIGZhaWx1cmVzIHdoaWNoIGlzIHdoeSBpdCBpcwo+ID4gPiBtb3JlIGNvbXBs
aWNhdGVkLgo+ID4gPgo+ID4gPiBJIHdvdWxkIGhpZ2hseSByZWNvbW1lbmQgYmFzaW5nIHlvdXIg
c2V0IG9mZiBvZiBpdCBhcyBpdCBmaXhlcyBtYW55IG9mCj4gPiA+IHRoZSBpc3N1ZXMgdGhhdAo+
ID4gPiBJIGNvbW1lbnRlZCBvbiBpbiBWNS4gVGhlIGZpcnN0IHR3byBjb21taXRzIGluIG15IHNl
cmllcyBhcmUKPiA+ID4gcmVmYWN0b3JpbmcgZHVwbGljYXRlIGNvZGUsCj4gPiA+IGFuZCBjYW4g
dGVjaG5pY2FsbHkgYmUgZHJvcHBlZC4gRXZlbiBpZiB5b3UgZG9uJ3QgZ28gZm9yd2FyZCB3aXRo
IHVzaW5nIG15IHNldCwKPiA+ID4gSSB3b3VsZCBhdCBsZWFzdCByZWNvbW1lbmQgdGFraW5nIGEg
bG9vayBhdCBpdCwgZXNwZWNpYWxseQo+ID4gPiBgcmlzY3Y6IHB0cmFjZTogQWRkIGh3IGJyZWFr
cG9pbnQgcmVnc2V0YAo+ID4gPiBhbmQKPiA+ID4gYHJpc2N2OiBwdHJhY2U6IEFkZCBodyBicmVh
a3BvaW50IHN1cHBvcnRgCj4gPiA+IGFzIHRoZXkgYXJlIHNpZ25pZmljYW50bHkgc2ltcGxlci4K
PiA+ID4KPiA+Cj4gPiBBbGwgdGhhdCBpcyB0YWtlbiBjYXJlIG9mLiBUaGVyZSBpcyBhIHByb2Js
ZW0gd2l0aCBpY291bnQgdHJpZ2dlcnMgaW4KPiA+IFFlbXUuIE9uY2UgSSBmaXggdGhhdCwgSSB3
aWxsIHNlbmQgdjcgYW5kIEl0IHdpbGwgY29udGFpbiBzaW5nbGUKPiA+IHN0ZXBwaW5nLgo+ID4K
PiA+IFJlZ2FyZHMKPiA+IEhpbWFuc2h1Cj4KPiBXaHkgZGlkIHlvdSBkZWNpZGUgdG8gcmVuZXcg
dGhpcyBwYXRjaCBzZXJpZXMgd2l0aG91dCBwdWxsaW5nIGluIEplc3NlJ3MKPiBwYXRjaGVzPwo+
CgpJIHN0YXJ0ZWQgdGhpcyBwYXRjaCBzZXJpZXMgbG9uZyBiYWNrIHN0YXJ0aW5nIGZyb20gZHJh
ZnRpbmcgb2YgU0JJCkRCVFIgc3BlY2lmaWNhdGlvbiBhbmQgUG9DIGltcGxlbWVudGF0aW9uLiBJ
IGhhZCBwbGFubmVkIHRvIGFkZApzdXBwb3J0IGluIGEgc3RhZ2VkIG1hbm5lciBidXQgSmVzc2Ug
Y2FtZSBhbmQgaGlqYWNrZWQgdGhlIHBhdGNoCnNlcmllcyB3aXRob3V0IGludGltYXRpbmcgb3Ig
Y29uc3VsdGluZyBtZS4gSSBoYWQgbGF0ZXIgcGF0Y2hlcyB3aXRoCm1lIGRldmVsb3BlZCB3ZWxs
IGJlZm9yZSBKZXNzZSBzZW50IHRoZSBoaWphY2tlZCBzZXJpZXMuIFRoZW4gbGF0ZXIsCkplc3Nl
IGFiYW5kb25lZCB0aGUgc2VyaWVzIHdpdGggYSBsb3Qgb2YgaXNzdWVzIHN0aWxsIHRvIGJlIGZp
eGVkLiBJCnBpY2tlZCBpdCB1cCBhZ2FpbiBhbmQgaW1wbGVtZW50ZWQgaXQgaW4gYSBwcm9wZXIg
d2F5LiBJIGFtIHN0aWxsCmRvaW5nIGl0IGluIGEgc3RhZ2VkIG1hbm5lci4gTW9yZSBmb2xsb3cg
dXAgcGF0Y2hlcyB3aWxsIGNvbWUgd2l0aCBkdWUKY3JlZGl0cy4KCkRvIHlvdSBoYXZlIGFueSBj
b25jZXJucz8KClJlZ2FyZHMKSGltYW5zaHUKCj4gLSBDaGFybGllCj4KPiA+Cj4gPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9Nci1Cb3NzbWFuL2xpbnV4L2NvbW1pdHMvZGV2L2plc3NlL3NkdHJpZy1y
ZWJhc2UvCj4gPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gSmVzc2UgVGF1YmUKPiA+ID4KPiA+ID4g
PiBTaW5nbGUgc3RlcHBpbmcgaXMgcmVhZHkgYW5kIHRlc3QgYnV0IHRvIGZvbGxvdyB0aGlzIHBh
dGNoIHNldC4KPiA+ID4gPiBWaXJ0dWFsaXphdGlvbiBvZiBkZWJ1ZyB0cmlnZ2VycyBhcmUgcGVu
ZGluZwo+ID4gPiA+Cj4gPiA+ID4gVGhlIFNCSSBkZWJ1ZyB0cmlnZ2VyIGV4dGVuc2lvbiBpcyBz
cGVjaWZpZWQgaW4gQ2hhcHRlciAxOSBvZiB0aGUgU0JJCj4gPiA+ID4gc3BlY2lmaWNhdGlvbjoK
PiA+ID4gPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2Mv
cmVsZWFzZXMvZG93bmxvYWQvdjMuMC9yaXNjdi1zYmkucGRmCj4gPiA+ID4KPiA+ID4gPiBUaGUg
U2R0cmlnIElTQSBpcyBwYXJ0IG9mIHRoZSBSSVNDLVYgZGVidWcgc3BlY2lmaWNhdGlvbjoKPiA+
ID4gPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1kZWJ1Zy1zcGVjCj4gPiA+ID4K
PiA+ID4gPiBDaGFuZ2VzIGZyb20gdjU6Cj4gPiA+ID4gICAtIFJlYmFzZWQgdG8gdjcuMi1yYzYK
PiA+ID4gPiAgIC0gU2ltcGxpZmllZCBNYWNyb3MgaW4gaHdfYnJlYWtwb2ludC5oCj4gPiA+ID4g
ICAtIFRvb2sgY2FyZSBvZiB0aGUgcmV2aWV3IGNvbW1lbnRzCj4gPiA+ID4gICAtIEFkZGVkIHB0
cmFjZSBzdXBwb3J0IGZvciBoYXJkd2FyZSBicmVhay93YXRjaHBvaW50cyAobmV3IHBhdGNoKQo+
ID4gPiA+ICAgICAtIFBUUkFDRV9HRVRSRUdTRVQvU0VUUkVHU0VUIHZpYSBOVF9SSVNDVl9IV19C
UkVBSyAvIE5UX1JJU0NWX0hXX1dBVENICj4gPiA+ID4gICAgIC0gUFRSQUNFX0dFVEhCUFJFR1Mg
LyBTRVRIQlBSRUdTIGZvciBkaXJlY3Qgc2luZ2xlLXRyaWdnZXIgYWNjZXNzCj4gPiA+ID4gICAg
IC0gSEFWRV9NSVhFRF9CUkVBS1BPSU5UU19SRUdTIHNlbGVjdGVkIChicmVhay93YXRjaCBzaGFy
ZSB0cmlnZ2VyIHBvb2wpCj4gPiA+ID4gICAgIC0gZmx1c2hfcHRyYWNlX2h3X2JyZWFrcG9pbnQg
LyBwdHJhY2VfaHdfY29weV90aHJlYWQgd2lyZWQgdXAKPiA+ID4gPiAgIC0gRXh0ZW5kZWQgc2Vs
ZnRlc3QgdG8gY292ZXIgcHRyYWNlLWJhc2VkIGh3IGJyZWFrL3dhdGNocG9pbnQgcGF0aHMgKG5l
dyBwYXRjaCkKPiA+ID4gPgo+ID4gPiA+IENoYW5nZXMgZnJvbSB2NDoKPiA+ID4gPiAgIC0gUmVi
YXNlZCB0byB2Ny4yLXJjNAo+ID4gPiA+ICAgLSBGaXhlZCBydjMyIGJ1aWxkIGVycm9yCj4gPiA+
ID4gICAtIEFkZGVkIHByX2ZtdCB0byBwcmludCBLQlVJTERfTU9ETkFNRQo+ID4gPiA+ICAgLSBD
aGFuZ2VkIHR5cGUgb2Ygc2htZW1fcGEgdG8gcGh5c19hZGRyX3QKPiA+ID4gPiAgIC0gVXNlIHBl
cl9jcHVfcHRyX3RvX3BoeXMgaW5zdGVhZCBvZiBfX3BhIGZvciBwZXItY3B1IGFsbG9jYXRlZCBt
ZW1vcnkKPiA+ID4gPiAgIC0gUHJpbnQgc3VjY2Vzc2Z1bCByZWdpc3RyYXRpb24vdW5yZWdpc3Ry
YXRpb24gbWVzc2FnZSB3aGVuIG5vIGVycm9yCj4gPiA+ID4gICAtIEFkZGVkIFJJU0MtViBERUJV
R0dJTkcgc2VjdGlvbiBpbiBNQUlOVEFJTkVSUyBhbmQgYWRkZWQgbXlzZWxmIGFzIG1haW50YWlu
ZXIKPiA+ID4gPiAgIC0gRml4ZWQgd2FybmluZ3MgZnJvbSBjaGVja3BhdGNoLnBsIC0tc3RyaWN0
IHJ1bgo+ID4gPiA+Cj4gPiA+ID4gQ2hhbmdlcyBmcm9tIHYzOgo+ID4gPiA+ICAgLSBSZWJhc2Vk
IHRvIHY3LjEtcmMzCj4gPiA+ID4gICAtIEZvciB3YXRjaHBvaW50cywgY2hlY2sgdGRhdGExLmhp
dCB2aWEgU0JJX0VYVF9EQlRSX1RSSUdfUkVBRCBhbmQga2VlcAo+ID4gPiA+ICAgICBTVFZBTC1i
YXNlZCBtYXRjaGluZyBhcyBmYWxsYmFjawo+ID4gPiA+ICAgLSBJbXByb3ZlZCB3YXRjaHBvaW50
IG1hdGNoaW5nIHdoZW4gU1RWQUwgcmVwb3J0cyB0aGUgbG93ZXN0IGFjY2Vzc2VkIGFkZHJlc3MK
PiA+ID4gPiAgICAgZm9yIHdpZGVyIG1lbW9yeSBhY2Nlc3Nlcwo+ID4gPiA+ICAgLSBQcm9ncmFt
IGV4ZWN1dGUgYnJlYWtwb2ludHMgd2l0aCBTSVpFPTAgKG1hdGNoIGFueSBzaXplKSB0byBhdm9p
ZCBtaXNzZXMKPiA+ID4gPiAgICAgd2l0aCAxNi1iaXQvY29tcHJlc3NlZCBpbnN0cnVjdGlvbiBh
ZGRyZXNzZXMKPiA+ID4gPiAgIC0gVXBkYXRlZCBzZWxmdGVzdCB0byBhdm9pZCBkZWFkbG9jayBi
eSByZXBsYWNpbmcgdW5ib3VuZGVkIHNlbV93YWl0KCkgd2l0aAo+ID4gPiA+ICAgICBzZW1fdGlt
ZWR3YWl0KCkgdGltZW91dCBoYW5kbGluZwo+ID4gPiA+ICAgLSBVcGRhdGVkIHNlbGZ0ZXN0IGJy
ZWFrcG9pbnQgZnVuY3Rpb24gc28gaXQgY2Fubm90IGJlIGlubGluZWQgb3Igb3B0aW1pemVkIGF3
YXkKPiA+ID4gPgo+ID4gPiA+IENoYW5nZXMgZnJvbSB2MjoKPiA+ID4gPiAgIC0gUmViYXNlZCB0
byB2Ny4wLXJjMQo+ID4gPiA+ICAgLSBGaXhlZCB3YXJuaW5ncyBmcm9tIGNoZWNrcGF0Y2gucGwg
LS1zdHJpY3QgcnVuCj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2VzIGZyb20gdjE6Cj4gPiA+ID4gICAt
IFRoZSBwYXRjaCBhZGRpbmcgdGhlIFNCSSBleHRlbnNpb24gYW5kIGZ1bmN0aW9uIElEcyBpcyBh
bHJlYWR5IG1lcmdlZDsgdGhpcwo+ID4gPiA+ICAgICBzZXJpZXMgYnVpbGRzIG9uIHRvcCBvZiB0
aGF0Cj4gPiA+ID4gICAtIEFkZGVkIGJyZWFrcG9pbnQgc2VsZnRlc3QgaW4gdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvYnJlYWtwb2ludHMvCj4gPiA+ID4KPiA+ID4gPiBIb3cgdG8gdXNlOgo+ID4g
PiA+IH5+fn5+fn5+fn5+Cj4gPiA+ID4gT3BlblNCSToKPiA+ID4gPiAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNiaS5naXQKPiA+ID4gPgo+ID4gPiA+IFFFTVU6
Cj4gPiA+ID4gICBodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11LmdpdAo+ID4gPiA+Cj4gPiA+
ID4gTGludXggS2VybmVsOgo+ID4gPiA+ICAgQXBwbHkgdGhlc2UgcGF0Y2hlcyBvbiB0b3Agb2Yg
djcuMi1yYzYuCj4gPiA+ID4KPiA+ID4gPiBIb3cgdG8gdGVzdDoKPiA+ID4gPiB+fn5+fn5+fn5+
fgo+ID4gPiA+IEZyb20gdGhlIExpbnV4IGtlcm5lbCBkaXJlY3RvcnksIGZpcnN0IGluc3RhbGwg
dGhlIFVBUEkgaGVhZGVycyAocmVxdWlyZWQgb24gYQo+ID4gPiA+IGZyZXNoIHRyZWUgc28gdGhl
IGNvbXBpbGVyIGNhbiBsb2NhdGUgPGFzbS9wdHJhY2UuaD4gYW5kIHRoZSBuZXcKPiA+ID4gPiBO
VF9SSVNDVl9IV19CUkVBSy9XQVRDSCBkZWZpbml0aW9ucyB2aWEgS0hEUl9JTkNMVURFUyk6Cj4g
PiA+ID4KPiA+ID4gPiAgIG1ha2UgaGVhZGVycwo+ID4gPiA+Cj4gPiA+ID4gVGhlbiBidWlsZCB0
aGUgc2VsZnRlc3Q6Cj4gPiA+ID4KPiA+ID4gPiAgIG1ha2UgLUMgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvYnJlYWtwb2ludHMvCj4gPiA+ID4KPiA+ID4gPiBUaGlzIHByb2R1Y2VzIGJyZWFrcG9p
bnRfdGVzdF9yaXNjdiB1bmRlciB0aGUgc2FtZSBkaXJlY3RvcnkuIExvYWQgaXQgb24gdGhlCj4g
PiA+ID4gdGFyZ2V0IGFuZCBydW4uIFNhbXBsZSBvdXRwdXQ6Cj4gPiA+ID4KPiA+ID4gPiAgICMg
L2FwcHMvYnJlYWtwb2ludF90ZXN0X3Jpc2N2Cj4gPiA+ID4gICAjIFtwZXJmX2V2ZW50XTogQnJl
YWtwb2ludCB0ZXN0IHBhc3NlZCEKPiA+ID4gPiAgICMgW3BlcmZfZXZlbnRdOiBXYXRjaHBvaW50
IHRlc3QgcGFzc2VkIQo+ID4gPiA+ICAgIyBbcHRyYWNlXTogQnJlYWtwb2ludCB0ZXN0IHBhc3Nl
ZCEKPiA+ID4gPiAgICMgcHRyYWNlKFBUUkFDRV9HRVRSRUdTRVQpOiBOdW1iZXIgb2Ygd2F0Y2hw
b2ludHM6IDIKPiA+ID4gPiAgICMgcHRyYWNlKFBUUkFDRV9HRVRSRUdTZXQpOiBhZGRyOiAweDgy
ODg4IGNvbnRyb2w6IDB4ODA4MAo+ID4gPiA+ICAgIyBbcHRyYWNlXTogV2F0Y2hwb2ludCB0ZXN0
IHBhc3NlZCEKPiA+ID4gPiAgICMgW2hicHJlZ3NdIGJyZWFrcG9pbnQgcmVhZGJhY2s6IGFkZHI9
MHgxMDQ3MiB0eXBlPTQgbGVuPTQgY3RybD0wCj4gPiA+ID4gICAjIFtoYnByZWdzXTogQnJlYWtw
b2ludCB0ZXN0IHBhc3NlZCEKPiA+ID4gPiAgICMgW2hicHJlZ3NdIHdhdGNocG9pbnQgcmVhZGJh
Y2s6IGFkZHI9MHg4Mjg4OCB0eXBlPTIgbGVuPTggY3RybD0wCj4gPiA+ID4gICAjIFtoYnByZWdz
XTogV2F0Y2hwb2ludCB0ZXN0IHBhc3NlZCEKPiA+ID4gPgo+ID4gPiA+IEhpbWFuc2h1IENoYXVo
YW4gKDUpOgo+ID4gPiA+ICAgcmlzY3Y6IEludHJvZHVjZSBzdXBwb3J0IGZvciBoYXJkd2FyZSBi
cmVhay93YXRjaHBvaW50cwo+ID4gPiA+ICAgcmlzY3Y6IEFkZCBicmVha3BvaW50IGFuZCB3YXRj
aHBvaW50IHRlc3QgZm9yIHJpc2N2Cj4gPiA+ID4gICByaXNjdjogcHRyYWNlIHN1cHBvcnQgZm9y
IGhhcmR3YXJlIGJyZWFrL3dhdGNocG9pbnRzCj4gPiA+ID4gICBzZWxmdGVzdHMvYnJlYWtwb2lu
dHM6IGV4dGVuZCByaXNjdiB0ZXN0IGZvciBwdHJhY2UgaHcKPiA+ID4gPiAgICAgYnJlYWsvd2F0
Y2hwb2ludHMKPiA+ID4gPiAgIE1BSU5UQUlORVJTOiBBZGQgZW50cnkgZm9yIFJJU0MtViBEZWJ1
Z2dpbmcKPiA+ID4gPgo+ID4gPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDkgKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3X2JyZWFrcG9pbnQuaCAgICAgICAgfCAyOTkgKysrKysrKwo+ID4gPiA+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2tkZWJ1Zy5oICAgICAgICAgICAgICAgfCAgIDMgKy0KPiA+ID4gPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgICAgICAgICAgIHwgIDE4ICsKPiA+ID4g
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oICAgICAgICAgIHwgIDUzICsr
Cj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8
ICAgMSArCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2h3X2JyZWFrcG9pbnQuYyAgICAgICAg
ICAgICB8IDY3NyArKysrKysrKysrKysrKysrCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3By
b2Nlc3MuYyAgICAgICAgICAgICAgICAgICB8ICAgNSArCj4gPiA+ID4gIGFyY2gvcmlzY3Yva2Vy
bmVsL3B0cmFjZS5jICAgICAgICAgICAgICAgICAgICB8IDUwNyArKysrKysrKysrKysKPiA+ID4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsK
PiA+ID4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5oICAgICAgICAgICAgICAgICAgICAgIHwg
ICA0ICsKPiA+ID4gPiAgdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5oICAgICAgICAgICAg
ICAgIHwgICAyICsKPiA+ID4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnJlYWtwb2ludHMv
TWFrZWZpbGUgIHwgICA1ICsKPiA+ID4gPiAgLi4uL2JyZWFrcG9pbnRzL2JyZWFrcG9pbnRfdGVz
dF9yaXNjdi5jICAgICAgIHwgNzY1ICsrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICAxNSBmaWxl
cyBjaGFuZ2VkLCAyMzU1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdfYnJlYWtwb2ludC5oCj4g
PiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9od19icmVha3BvaW50
LmMKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jy
ZWFrcG9pbnRzL2JyZWFrcG9pbnRfdGVzdF9yaXNjdi5jCj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4g
PiA+IDIuNDMuMAo+ID4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
