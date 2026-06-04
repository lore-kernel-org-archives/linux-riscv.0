Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C49CD6E6D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMyfjfhZJ/OHol+2Pe9V4NxsbBKugiC/kTCGvn48lWc=; b=R3Lx8z1c4vMMeg
	XgWxbMr+BHp327ztR0t6fBZfO989kKSWyr+bHHSs502aILNzM2W3qz0gAusp4M3reOYMkqt1Ylgef
	orlJBIb/2zCJaDAPqnLdCAuPzC09y7bldRyx1riV/dk1zamJJ4jmFn7Ko0oeN8hc1oPUA1DNdOuZZ
	h70S0f9yQUv+kXDwiK2w/4catmzyUbB7XG3PhP8od6wXKrATug6e1XRo9muX1J4e0nSAyWxFz9D8L
	v8b6KtLi2WBLiYLOhgkBofKZwYEjiw/Z69bP9WzoG9ImpzZbDTRwERI4sWzlz3SbyL1esgwYaCkRU
	qivdBrEtvjK6sGRco/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVA0i-0000000Gzx3-1A4a;
	Thu, 04 Jun 2026 15:29:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVA0g-0000000Gzwp-3Pzq
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 Jun 2026 15:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=; b=Z+5tUYnhUEMWFOf5Vuj1nEOIiu
	YiRD+IBMJcHYYLL2ohyf8ufrPTTYZ2kJ03jXHbBLGuDUWlaUQxPUJPVXEaqzyg+RDP5sRDJJGvrvH
	yVLRLLJZAwaE32LwpMg316lfv4aTvMSsnV4jdafdkSBMjZm1qUWYsEm6Uny8b2Dsbedk7pSTp/h4u
	vzqGGe/KLPfsRJHTlqk7XizfC0HFj7RJ6BLWpGs/eKim7+x32mje48jmhZs6wjQiOxr+IByliFmk/
	sZXbhcl30x1b/3q4/N+wWh8waCFjrxTqBbMpQm6fOSL3nmqH+Vs3IK7AvUERItLhAhNrfwfdxA6UB
	Hu8OC/Jw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wVA0d-0000000EVxe-0gvx
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 15:29:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EDIKg313788
	for <linux-riscv@lists.infradead.org>; Thu, 4 Jun 2026 15:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=; b=Qlncft6Fwh6BKW7n
	ka795Z+gVHHYDdEefWUmmoQD4RgUPeiGhHV8SLohswSyxQA7tUpBQh5QJy+w6cUx
	nthELcj2CqKsQtu8IWnnUGVBvx1B4CcqQbh0/tJI53DobGxPsWEKB0olLTomoQjJ
	dKokvTmQAdHSd8V/mrQrqOhm7qnHT3NPPfKphB5f08Ld+jJ4MMnuk4pGoYKPsYNR
	fBUyH5fUfYvPA9cIOWGy6Lhda0l5bMpg0n4kcqegrR9PrsGt3p4KFs11AYqkLbIx
	DPVLtwnic5BaEo8QCGinJHUSHwKzz5V/qJ+gTP541f0Kvr7AYVrKVIkHTnW2gfBI
	ME5ykQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v36ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 15:29:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137f2083280so3398961c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780586962; x=1781191762; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=;
        b=PQY4xoisAHcIFp3ZqGx8L+A879Su3bItc5JiDDHyVaIT/SVy1VhxW+H+uz/Oo9Av6u
         hjX7AToWfohX6kVtW8NLAS4EbbAPzDQCX0ZYcAzXquzixS0YK/jcZoA9ELfDfcRpU+sg
         kDXdAf/6lxZ20xkxVtr2amjfM6EzysESIEybxu2Cffuc/cLavD5dLwD70Z1j722TpE4s
         YipCNdZAs+8LMJa9qHTZZ/j9nKYp0wZ3H4qrlNRBxOcqQ2vQ9CK5t1dXA5Ldq1ourwat
         zoDf0rFiKdE4+HPPDreaARWyY264hum9d6ek8LKlRKxfnuZUSb6Ce3VRSRTmTAm6Ipfc
         Q4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586962; x=1781191762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=;
        b=JhojUN4P/QPdAlUsofxxM7o6fms62JPwZ2G46Xr5rM39+lic6HKDYHdKCZNPFoia5U
         dHlDk521Sk53OD0sBCt3pX/F24WA39aVrTS7pSpdHi2nreyQeXGq4HwMdSkYpr+fcdEY
         zEOhJ6FwWqPYACZEcqZ3nqdyx2GkIKVqn4PNANRjB9tI7sfZz7xxTLD+DBZDX2TKqlSZ
         7dfKdbnlANAFl81f+uMSPC6g0TII1Y1N1SQthq22HAMNWvjWyY7L+aA7l9c0Kr3brlZd
         yWiCOV6f/RusaMkDJ8e3YNVWNSiPnW7ngX2jn6Mg1RsZWuccp+wxFLH4bBKjKTL5rmpm
         c1lQ==
X-Forwarded-Encrypted: i=1; AFNElJ/x1bSJhROFnvUgELjUAoj0HWYMJzIk+LZV4SoRw1F1y1b9S+a14qVioT1jCdG2mWbfcqfT5AS9wf43ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgUmHjFecW/WH49GFOayZjClw0WcUkhwyKTmtZTlwwaMx3KO6a
	v9FwXX9RGZm9wfKcO3FPl/keVMZhsaLIrXWpPYINaQl2nE8Tr2ddIsa9VmIlB+VzzznjieeI3LU
	fK13Zv41LZRI0drghFbCU1JMnPRrddG+JOYRE7P5KgBL2bYN5KZsRAIPVy5gTNL5JbcZxhqI=
X-Gm-Gg: Acq92OHEWb74UuXgeq/KMQHOQXUgrDWuTQckrnpxT6/n4fDA5uNm1sBC3IQbOX4BPvX
	gottkYq9SEgixSNtBTUs+yK13y9De8GdoRg0fyGaxhnEITZCXWyeGQXzO2Sz2z6s0JhReFhcsJe
	9Phk0yKfkcQgfYNfNZCV6yItLgzjqM+CZZEfkcbCQHgEIKdH19in8T6F0PseY76GXT8pHaLSZW8
	2V1jZZgiQw9s/HA3SK++P5TLPySoGfOdqvjZqOJn/WbBTAbKCryo5cEonKqG7x04bkTIE2ikyah
	jb1+PrfE53OaG3QYtbCjb9F0qeT6PsnBOd68AVa9iwNs3z6tOw0iH8Kv5C8fY46jvkOEzccPIm0
	+w2OraRjMqSZrQMZql6DAzaXlF/sVHYuq2Zau6ZQ7wg==
X-Received: by 2002:a05:7022:693:b0:136:90d9:f204 with SMTP id a92af1059eb24-137f6bb4bd5mr3557184c88.25.1780586961865;
        Thu, 04 Jun 2026 08:29:21 -0700 (PDT)
X-Received: by 2002:a05:7022:693:b0:136:90d9:f204 with SMTP id a92af1059eb24-137f6bb4bd5mr3557156c88.25.1780586961314;
        Thu, 04 Jun 2026 08:29:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm4107408c88.11.2026.06.04.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:29:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:29:19 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <ug2cipududshcbv24ruicqpugzinujnamvdcuy6pubkwh67bfp@2fysrplz3nr4>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
 <5tjmypgyxbhgxfjub5q6ne475uysse6yl473sxisjoammkdvbu@yebejqbiy6e3>
 <CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1MSBTYWx0ZWRfX+xTwREvrSF72
 3zqwUUXYp2dnIPG88wSfqKujyiIYX0QNqjfFeC1ER2LnGbh62JQzO5ZcwEZm9fvxjpdG1PqgrYm
 jmbs1977lc/chdp5bY97u0mKcjP3wkJmVvxSjXEFLiUdDNexu+2QRdE/LtKWoxzlWYWei6gtZcu
 a4Xw/pdQnFukLlRwllR2qc6Ta/75gOI0TDLbd9vjAY9Ape3xpjSyT512ReTtZYk7YUFco5j6R4y
 BuGo58cHatWnuPEvmvBFBVZQ2+5QNTiINzVZAlx2OAh2VUVkf0fYV7FEQxp9grqZS66IwX9Qru7
 DhxcGv2r9artbI9REd3gIyUUoaBQXXHDK45zNOcs7kXa2qnLrvtGBu33DnHo4iHUNcMZ+UsMFtg
 8Iu/nFF81N65gE2YY6bK09gGZCOeGATJ3eHyK+HLgHiZ2q1dBpJ6yKsTXngzWmPOERiIYPbcDbx
 H3PG9/upiWZWrpJIAuA==
X-Proofpoint-ORIG-GUID: gsOKAj5ifNm7dAUxLw7iFLYs6x5pPMxf
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a2199d2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=ee_2aqc6AAAA:8 a=VwQbUJbxAAAA:8 a=-RU_IiooM-Ar16elnkoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: gsOKAj5ifNm7dAUxLw7iFLYs6x5pPMxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_162927_528476_42D910B1 
X-CRM114-Status: GOOD (  31.17  )
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

T24gU2F0LCBNYXkgMzAsIDIwMjYgYXQgMDg6NDI6MjlBTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBUaHUsIE1heSAyOCwgMjAyNiBhdCAxMjozNeKAr0FNIEFuZHJldyBKb25lcwo+ID4g
U2FzaGlrbyBwb2ludHMgb3V0IGEgZmV3IHRoaW5ncyBhYm91dCB0aGlzIHBhdGNoIHdoaWNoIEkg
dGhpbmsgSQo+ID4gYWdyZWUgd2l0aAo+ID4KPiA+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDUxMS1ydmEyM3U2NC1od3Byb2JlLXYyLXYyLTAtMjFjNWE1NDRmMWRjJTQwcmlz
Y3N0YXIuY29tP3BhcnQ9OAo+IAo+IFF1b3RlIHRoZSBmb2xsb3dpbmcgZnJvbSBTYXNoaWtvLmRl
djoKPiA+IFNob3VsZCB0aGlzIG1hc2sgc3BlY2lmeSB0aGUgaW5kaXZpZHVhbCBzdWJzZXQgZXh0
ZW5zaW9ucyByZXF1aXJlZCBieSB0aGUKPiA+IHByb2ZpbGUgaW5zdGVhZCBvZiB0aGUgc3VwZXJz
ZXQgZXh0ZW5zaW9ucyBsaWtlIFJJU0NWX0lTQV9FWFRfQiwKPiA+IFJJU0NWX0lTQV9FWFRfQywg
YW5kIFJJU0NWX0lTQV9FWFRfVj8KPiAKPiBNeSBwcmVmZXJlbmNlIGlzIHRvIGxlYXZlIHRoZSBt
YXNrIG9uIEIvQy9WIChhbmQgQSkgYXMtaXMuIEknZCBwcmVmZXIgdG8KPiBrZWVwIG1hdGNoaW5n
IG9uIHRoZSBzaW5nbGUtbGV0dGVyLCByYXRoZXIgdGhhbiBleHBhbmRpbmcgdGhlbS4gSGVyZSBp
cyB3aHk6Cj4gCj4gLSBUaGUgUlZBMjMgcHJvZmlsZSBsaXN0cyBBLCBCLCBDIGFuZCBWIGFzIHNp
bmdsZS1sZXR0ZXIgbWFuZGF0b3J5Cj4gICBleHRlbnNpb25zOyBpdCBkb2Vzbid0IGVudW1lcmF0
ZSBaYWFtby9aYWxyc2MsIFpiYS9aYmIvWmJzLCBaYyogb3IgdGhlCj4gICBadmUqL1p2bCogc3Vi
c2V0cyBpbiB0aGUgbWFuZGF0b3J5IHNldC4KPiAKPiAtIEluIGN1cnJlbnQgbWVyZ2VkIGNvZGUs
IGh3cHJvYmVfaXNhX2V4dDAoKSBpcyBhbHJlYWR5IHVzaW5nCj4gICByaXNjdl9pc2FfZXh0ZW5z
aW9uX2F2YWlsYWJsZSgpIHNpZ25sZSBsZXR0ZXIgY2hlY2tpbmcgZm9yIEMgYW5kIFYuCj4gCj4g
UFM6Cj4gQiBtYXliZSBhIHNwZWNpYWwgb25lLCBqdXN0IGluIGNhc2UgYW55Ym9keSByYWlzZSBp
dC4gQXMgdGhlIGNvbW11bml0eQo+IGRpc2N1c3NlZCB3aGVuIEkgYWRkaW5nIGl0IGludG8gdGhl
IGJpbmRpbmdzLCBiZWNhdXNlIEIgY29tZXMgbGF0ZXIgdGhhbgo+IGl0cyBzdWItY29tcG9uZW50
cyB6YmEvemJiL3picywgc28sIHdoZW4gSSBhZGRlZCBCLCBJIGNsZWFuZWQgdXAgYWxsCj4gaW4t
dHJlZSBkdHMgZmlsZXMgd2hpY2ggZGVjbGFyZWQgemJhL3piYi96YnMgYnV0IG5vdCBCIGFuZCBt
YWRlIHRoZW0gZGVjbGFyZQo+IGJvdGguCj4gCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyNjAxMTUtYWRkaW5nLWItZHRzaS12Mi0wLTI1NGRkNjFjZjk0N0By
aXNjc3Rhci5jb20vCj4gWzFdCj4gCj4gQWxzbywgaW4gdGhlIGJpbmRpbmdzOiBleHRlbnNpb25z
LnlhbWwsIGEgc2NoZW1hIHJ1bGUgaXMgYWRkZWQgd2hpY2ggcmVxdWlyZXMKPiBhIG5vZGUgbGlz
dGluZyB6YmEsIHpiYiBhbmQgemJzIHRvIGFsc28gbGlzdCBiIChhbmQgdGhlIHJldmVyc2UpLiBN
b3Zpbmcgb24sCj4gbmV3IGR0c2kvZHRzIGZpbHMsIGEgbm9kZSB3aXRoIG9ubHkgdGhlIHN1YnNl
dHMgZmFpbHMgZHRic19jaGVjay4KPiAKPiBPbmUgbWF5IGFyZ3VlIHRoYXQgdGhlIHNjaGVtYSBj
aGVjayBkb2Vzbid0IGNvdmVyIEFDUEkgcGF0aC4gQnV0IGFnYWluLAo+IHNob3VsZG4ndCB0aGUg
dmVuZG9yIHdobyBwdWJsaXNocyBSVkEyMyBoYXJkd2FyZSBiZSBjb25mb3JtYW50IHRvIHRoZQo+
IGV4dGVuc2lvbnMgd29yZGluZyBpbiBSVkEyMyB2MS4wIHNwZWM/Cj4gCj4gV2hhdCBkbyB5b3Ug
dGhpbms/Cj4KCkkgY2VydGFpbmx5IHNlZSBhIGNhc2UgZm9yIHRoZSBrZXJuZWwgc3RheWluZyBv
dXQgb2YgdGhlIGV4dGVuc2lvbgpkZXBlbmRlbmN5IHZhbGlkYXRpb24gZ2FtZS4gSSB0aGluayBp
dCBtYWtlcyBzZW5zZSBmb3IgYW4gSVNBIHN0cmluZwp2YWxpZGF0aW9uIHRvb2wgdG8gZXhpc3Qg
Zm9yIHZlbmRvcnMgdG8gZG8gc2FuaXR5IGNoZWNrcyBvbiB0aGVpcgpJU0Egc3RyaW5ncywgYnV0
IHRoYXQncyBub3QgdGhlIGtlcm5lbCdzIHJvbGUuIE9UT0gsIHdoZXRoZXIgb3Igbm90CnRoZSBr
ZXJuZWwgd2FudHMgdG8gdHJ5IGFuZCBkZXRlY3QgaW5jb25zaXN0ZW5jaWVzIHdpdGggdGhlIElT
QQpzdHJpbmcgaW4gb3JkZXIgdG8gYnVpbGQgY29uZmlkZW5jZSBpbiB1c2luZyB3aGF0IGl0IHNl
ZXMgdGhlcmUKYW5kIHB1Ymxpc2hpbmcgd2hhdCBpdCBzZWVzIHRoZXJlIHRvIHVzZXJtb2RlLCB0
aHJvdWdoIGh3cHJvYmUsIG1pZ2h0CnN0aWxsIGJlIHdvcnRoIGRlYmF0aW5nLgoKV2l0aG91dCBD
UFVJRCAvIElEXyogcmVnaXN0ZXJzIGZvciBMaW51eCB0byBiZSBhYmxlIHRvIGNoZWNrIGFuCmF1
dGhvcml0YXRpdmUgc291cmNlIG9mIHRydXRoIGFib3V0IHdoYXQgaXMgYW5kIGlzbid0IHN1cHBv
cnRlZCBieQp0aGUgQ1BVLCByaXNjdiBMaW51eCBoYXMgdG8gZGVjaWRlIHRvIGVpdGhlciBibGlu
ZGx5IHRydXN0IHRoZQpoYXJkd2FyZSBkZXNjcmlwdGlvbiBvciBkbyBzYW5pdHkgY2hlY2tzIC8g
cHJvYmVzIGluIG9yZGVyIHRvCmNvbmZpcm0gd2hhdCBpdCBzZWVzIHRoZXJlLiBNYXliZSB3ZSBj
YW4gYXNzdW1lIHRoYXQgYW55IGV4dGVuc2lvbgp1c2VkIGJ5IHRoZSBrZXJuZWwgd2lsbCB0cmlw
IG92ZXIgaXRzZWxmIHF1aWNrbHksIGFsZXJ0aW5nIHZlbmRvcnMKdG8gZml4IHRoZWlyIElTQSBz
dHJpbmdzLCBidXQgSSdtIG5vdCBzdXJlIHdlIGNhbiBtYWtlIHRoYXQgYXNzdW1wdGlvbgpmb3Ig
dXNlcm1vZGUgZXh0ZW5zaW9ucyB0aGF0IExpbnV4IGRvZXNuJ3QgdXNlLCBidXQgZG9lcyBleHBv
c2UKdGhyb3VnaCBod3Byb2JlLiBXaGF0IGFwcHMgbmVlZCB0byBydW4gaW4gdGVzdGluZyB0byBl
eGVyY2lzZSB0aGVtPwpIb3cgbG9uZyB3aWxsIHRob3NlIGFwcHMgbmVlZCB0byBydW4gYmVmb3Jl
IHRoZXkgdHJpcCBvdmVyIHNvbWV0aGluZz8KClRoZSBtb3JlIEkgdGhpbmsgSSBhYm91dCBpdCwg
dGhlIG1vcmUgSSB0aGluayB0aGUgbGFjayBvZiBDUFVJRCAvIElEXyoKcmVnaXN0ZXJzIHB1dHMg
TGludXggaW4gYSB0aWdodCBzcG90LiBJZiBMaW51eCB0cnVzdGluZ2x5IHB1Ymxpc2hlcwp3aGF0
IGZpcm13YXJlIHRlbGxzIGl0IHRvIHRvIHVzZXJzcGFjZSBhbmQgdXNlcnNwYWNlIGJsb3dzIHVw
LCBMaW51eAp3aWxsIGhhdmUgdG8gc2hhcmUgc29tZSBvZiB0aGUgYmxhbWUgZm9yIGhhdmluZyBt
aXNsZWQgaXQuIFNvLCBzaG91bGQKTGludXggdmFsaWRhdGUgZXZlcnl0aGluZyBpdCBwdWJsaXNo
ZXMgc29tZWhvdz8gT3IsIHNob3VsZCBpdCBhdCBsZWFzdApkbyByZWxhdGl2ZWx5IGNoZWFwIHNh
bml0eSBjaGVja3Mgb24gZXZlcnl0aGluZyBpdCBwdWJsaXNoZXMgaW4gb3JkZXIKdG8gYnVpbGQg
c29tZSBjb25maWRlbmNlPwoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
