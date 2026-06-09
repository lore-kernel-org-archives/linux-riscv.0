Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B853ECD8CAA
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s17FdwvtBpKZt+6oWyn77N0hyr3C9aYcgrGdvU3LIH8=; b=VLk9697PvFocTu
	VIlIbpn3MGqJBbn+YLf4RlQWuJqqP4sYo2P0R6jer7wiYtSJCeYfRDU47/9XRKqmzaXq1Iq/BAzod
	eu5bbRy6c76rN6pzcrMAI95x0E6NH/hD2pmuSldKh4YMWe8vNw8jkupSknzGTSjAI1VvNA5O2CrEs
	hbF+bNoxSdmkD3Hmav/qOhlrHcgoWLLi/dRuHIJwzkVY0KpF2RRs0XtToQwTEYWoIrqd7Wcx8oUgW
	6zvro9h6v0q9+biZcSf01V4wgQRXvbjz1cPNJ1UquNUENadyZ0IVsQM9vHlyKN7oRr4FeKycgCOQ+
	Rhm0IWkikttuBbgy5pNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxiQ-00000005oXk-1f9r;
	Tue, 09 Jun 2026 14:46:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxiO-00000005oWY-1DRG
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 14:46:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClU452286831
	for <linux-riscv@lists.infradead.org>; Tue, 9 Jun 2026 14:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=; b=YU
	qcfUNUaOVUkovl/5AssMnAttWPY7SDezAdkO+w640KWrdDbDpxlMFLt8DDCQtOjc
	+GKx50SzLMy8zXgyM7r6SadFmanGTCCh7Y6CNvOHlCuk5QzVyVhgliKcnHKdVXmD
	LHJOQTbG1Jl9u1IVSLFyut3VMqBblidslvPIklCQxjOKdvhp+hQKHcPB1D48e31v
	xP0VHjZ6VJo8RfJSRmq929I3fyQ45t0Xb3iClFnOMwR0OPWnJ4pZGWf1y+awNqtD
	LPFHaxwjMu5LiQ2a/EO+zXdnCzNmY2kzen8bQG/C0g/roSiKTi0NDEoSqxzcFxPM
	AGOBDDAAltAUPagEOjNQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jsjkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 14:46:03 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7e90f879daaso99997627b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 07:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781016363; cv=none;
        d=google.com; s=arc-20240605;
        b=HaOqBOfwSGsVq+aM1Vrt9qW6+PTL7Ucp7ID7tUxl6ZKgBL48RRdmjuXO2aPMkulIpw
         +ZjkocIGqU5vwjizA58nR1/X4830ePbjVB8h9eMcghidNuu1u8KISpfDopU2MWDgzExe
         zHvklr2eA/TP4sex30KoGphDWCUGKDmoy9yzoF5uenFHuSQ4dRdLsdCv6wMaX4DJdhrI
         s7m7uaC+1sqPVPzeC9XzrisvWFn/GRlUoew659MlRuw0ZPQwJwUa3Nc8YQ8i5YZVcCH8
         nEFjy58/XcdoTQN4Ck9O8zWFOf9BwkICKf0vNXJCrXkwSLzgL05d3nvjvBjSFcB5kqoj
         0k1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
        fh=J/uD/kFOvNM8E0fHT7SmMbaKX4eM4g3ZJKJB0Cz9PF0=;
        b=l15QxtBREgXb70y12xLFKsUPdAQWvZuhZloRHGUhSJ9eQ/5tHIqFGfzwAY8fbzUJEP
         utDuOgSG+zuMdxJ6CCMAEe8I9u45sZFYdpojtlmmwpgTFyxH69QAelrsRomaFxb9+lW3
         z/cn4UTyiltgMvQsotk9sjBcycSKTAZmW8MNHLfKk3D+1TTOvqnvHWIbi0kxLq7ActtB
         iucZeoJdakA3gfNoFbUXMIEbIjQqGDMZB65LZ95v/KjbExfDHp2HppXglkqBMAL6FZG4
         wBK13b07ojcv1dA0JZSc+QRLWzXC2YWZeieE9nqLWx5MeXEDfM4BFxSeQytwENoiVw8y
         sNHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016363; x=1781621163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
        b=UT5iqQJdBjh2EvTu6iq9XUV220is7djhH0y5zRRPf/MncV9XdSDbbhdefoi6UizX7G
         zW+femH/nuqTUe4mh24jV3pvJztPJO/Kqu6Wb4e4+iqTw7+hKaMCsWkch/KJPP6TecAA
         PkUbbFJeE13sLd6BPCpEO5QtDiC1Qvf+mXR2hm7z+yq7ouuD+Rc76lhygGmxjFBHv9aN
         jwUtCIgjjlX9+//awDl83xYQE0Sb6Ka2FQS3XFZBtG3IdM6YTSEv/98bTA5E9frBXfwe
         yvDXMEhICEDGJR+R7M2AipFy2PNXeuS/KfWfQeRgOeNbb4+T3unvhMghBfhqaY0ZDsAN
         XN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016363; x=1781621163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BkSambIUQitGRlTvVm9rbPHKE+ioSB6QhEypVQhx7ss=;
        b=VSJIrEElelQ2n5Xz5d7annSb4mq3SalLTcy6AnDFxbVLW1Di20F/+cRO/wncdGqQu1
         WfxW4s3OzGksQQTQHZjTd8IeR9gYTgekmeS+X8fOkqcw6X27L7Wjx0o9t73VI8IbHQJd
         rUUbuklqGK0gRB3oCNVXTOf2gZXEsU7oHM5/vUZ/BFdH4tt3lQBepBGol3wNxUUddnNx
         Jp6I28N+Y1d5D0vMskf8WmUZld3v7+KiYGyablXooFbafAv9T2IPJEG2gCZCsa1Z+pwB
         lK5QL+8MVLJO2OJILwcWa4NhzicjFWo9nDyPRqN/wwgRdnbyA3fNGgVMNXF/F8i0LIC9
         2wIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uWwDsa1LuljmprvFGWf1agagoWNGQcmWGZvinTYlgngihpCoJyoR1hewNg8I0/t2LWTUTZoGgRvzLMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVgUWK/i3DcnauRnKsy28rSGNJ5osKfxazeaDHRr+P8TcaVs2a
	8VzmXKBmWYq/PgwGxd4rQtb97XnjOWTdgnMwadPRE94/8hNlEcoP4f2gl3PJ11m+CzxUghRLB/k
	ZAReTFUQ5oCihCNmFRpL3tXUM/GK7BRX7qeohj5mhvdI/MG606Z/Jp2W9HUmsBl2r8m7s9bZJcE
	1GnkEtyFjzpgMaYmzgUDftm83WyjAp3RKsK1wuhsrkQOF8FYHdrpZE2tr9
X-Gm-Gg: Acq92OHlBXanhyzohX1E44HfRNU9pt9+aYoPEMCtv3e+3u9bYXjGVYYIk5Z2YszoWoW
	DBzDZYoO/tdXV70ifNaVSyQx1evaIZuuX6YNiu63tS7dGJI3+U+42ifzt4tCAL90r1JI5Yoe/CA
	l1wbSAkYBExiUZLW9veytsduqgLc5t2+IiAy0cVZouQPR1v8FoquXzmULFIXimPHLjCaitrQQdC
	mbaQhnx0hBetXLjLA==
X-Received: by 2002:a05:690c:600a:b0:7dd:35fb:a529 with SMTP id 00721157ae682-7ed0f826fb1mr175041167b3.25.1781016362728;
        Tue, 09 Jun 2026 07:46:02 -0700 (PDT)
X-Received: by 2002:a05:690c:600a:b0:7dd:35fb:a529 with SMTP id
 00721157ae682-7ed0f826fb1mr175040657b3.25.1781016362226; Tue, 09 Jun 2026
 07:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
 <CAB19ukFFwm3ehzkBFr+oXRjA7VK_4_=XHFSuqdEpbVqUz8Do4Q@mail.gmail.com> <aifahCtdj8GpHN/v@lpieralisi>
In-Reply-To: <aifahCtdj8GpHN/v@lpieralisi>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 20:15:51 +0530
X-Gm-Features: AVVi8Cd9pzTcVntwOkdct8eFjOpuS2Xxx1qo-G3imlUBB7gP99ylMuHrty8LTZg
Message-ID: <CAB19ukHAAHp5kmm+5KBDqtn969h3V4LBr2put9hJSWphPS8jmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop termination
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Proofpoint-GUID: sQldFjXNOLPCNbZk6_ziVZqE8w_PIg3I
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28272b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=45POYx1-RFdywSfKWh4A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MCBTYWx0ZWRfX80tJOKVq5f7q
 fHTLU730xIXjfKf/lB2uizwuiqBxc+lLvhgPccR27fna603BGIuL+HjsjFg9h1ZC/IYRHQ+iyz5
 sACPEV3Fl+5ldWridOQbTNGMY+hmVW7FU6sIbOyrYD4qoTYddiP3bbkkW+bpfpGau6Q8xQL4T9k
 Gd/7x4PhbC69tCKskEKZaEa7vtokMsFYbx5GOkwL+EWH0/TLfaG6ahZzEGP1oLXCJR5PUJUeH5f
 LOUnj+WZnRT2WUy6josdm5zWOXaOR6y7t7FChSbkW5O8mCL8jZZnhcp30Jd9OLWv8vXuT8TdA3y
 zBUgLejhg0N60+Zc9dguSJ00TVtee4t/2lKB8kYP1ORWVAM/STsBMvdNhFWsC6tUUlZjiOP3YHK
 8pMFfVQI74qsHzC4RRNK+EImDht8QrLuVsagyGYGaW5rAhYFFKoSqQRv8ozWjY28nCPpiGwT4RC
 mbYHOFf5bdcLwAwR+Hg==
X-Proofpoint-ORIG-GUID: sQldFjXNOLPCNbZk6_ziVZqE8w_PIg3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_074604_362879_CA65BAA5 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gOSwgMjAyNiBhdCAyOjQ54oCvUE0gTG9yZW56byBQaWVyYWxpc2kgPGxwaWVy
YWxpc2lAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAwOCwgMjAyNiBhdCAwOTo1
NDoyOFBNICswNTMwLCBTdW5pbCBWIEwgd3JvdGU6Cj4gPiBIaSBMb3JlbnpvLAo+ID4KPiA+IE9u
IFdlZCwgSnVuIDMsIDIwMjYgYXQgMTo1MeKAr1BNIExvcmVuem8gUGllcmFsaXNpIDxscGllcmFs
aXNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgpbLi4uXQo+ID4gRG8gdGhlc2UgZml4ZXMgbmVl
ZCB0aGUgRml4ZXMgdGFnPwo+Cj4gSSBjYW4gYWRkIGEgRml4ZXM6IHRhZyBidXQgSSB3YW50ZWQg
Zmlyc3Qgc29tZSBoZWxwIHRlc3RpbmcgdGhlbSwgaXQKPiBpcyBjb2RlIHBlcnVzYWwgdGhhdCBn
b3QgbWUgdGhlcmUuCj4KT2gsIHllcy4gSSB0ZXN0ZWQgdGhlc2UgY2hhbmdlcyBvbiB0aGUgUklT
Qy1WIHZpcnQgcGxhdGZvcm0uCgpTbyBmb3IgUklTQy1WIHRlc3RpbmcsCgpUZXN0ZWQtYnk6IFN1
bmlsIFYgTCA8c3VuaWx2bEBvc3MucXVhbGNvbW0uY29tPgoKPiA+IE90aGVyd2lzZSwgTEdUTS4K
PiA+IFJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAb3NzLnF1YWxjb21tLmNvbT4KPgo+
IFRoYW5rcywKPiBMb3JlbnpvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
