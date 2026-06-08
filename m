Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7A6CD6E79
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 16:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVnnslGhhrUDqZcTm0uB3p33vTJ4mAXUMiNgmd/GcgI=; b=W15sq2reX5JOsM
	2y8qj1AKlKpBMOzK0D9a5qGmvo43IZcH4E6Boe/fx0kWvKTYZUEpXC6195IBWQKfGoWhItlYlzt4Q
	uT+TIr4y3MAZPJCy6K14NgQIfeVHASUfSrp7RVL3x9ffJcr7UwTi3V+b2UTzX0Dts9J3IXltp3O3Q
	8GQ7oDO4BolRJaPzoffLd3J4L6tBxcI2D+svnCY/+QIgYV1YGjIsSmSKyjPDKtO9mq+UKxwA2Yd7X
	s4Yo+/zh6TgpUqkbHLTjNnU8XqiVPH06afnn1Gko/sCGu99mBXsvN1uf4SSWZgWauco8wX5XqhOk5
	Y1Paq0aVbWeYsb/RuEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcze-000000045dj-45g3;
	Mon, 08 Jun 2026 16:38:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWczb-000000045cU-44at
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 16:38:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFcIp3593031
	for <linux-riscv@lists.infradead.org>; Mon, 8 Jun 2026 16:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=; b=aL
	VN1rGk2GnCSWpr/C5mhI7V/5mo7au+DRCD5bCtE/56VkmF3zZDD5S4QGK7eSdi5N
	UDkPQvz/UwKEQ20ogLUtz1AcvotEMA2huV18YXdRP65okCDNEJ6s1EDD3/5TwpDE
	4uwuNiz1cEICsvSq5yq0VanLSarRqXHJ5Z/nihGen/hbOw+rv0BrlL6ic+AjCYVB
	sC3pDYPM5qOzS5R4T2Oa4Mft44f38yL7Ok/A+AK4478fvwXX47e5FexQBHRoHG9G
	JUvnodwGcFbbiUaiSjH374OIWgz7p5hfDSJLtjjr8OF4szDFHS7ga8B9VfPqNUN+
	Cbh3tK++gPAtQHfjYzqg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m1ddy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 16:38:27 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7e9234db3bfso79325447b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 09:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936707; cv=none;
        d=google.com; s=arc-20240605;
        b=LhB9bXcHikdsxcy9eANxt9ms1FZuW/p3SoUoYzTZ4z/IK0IEFoK1nEyV91KwtBCM5P
         ZDn7mBGjfZwx3hPQPHFs9Q0FBxlq+6uPs4v9k8MUz7cQa9Rf/Jy6QntZP2+gyEO7JirR
         UrlyRUAlkhQvtH3IwaWKTjEzxzm6lUCtP6z5sZMJcAAOIzdWb4eK80twAoYWYQBkfr3D
         wKDo0Wj94uF5Ge9XJJacbpzEuYuPyK/q08jrxtqEnTOEHbX8qeWJ40qzBufl2Bm1pAUB
         iegceitdY2ZneRcrsEmpVDCEYSy1JCZ5Sb1U+TnIheKsosAtUqYxTIn5jM/FKXY0OQye
         LCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=;
        fh=GtpBVLB1vxAjgqcWYh52rZijSnZLkh2NO8K83yGTzbA=;
        b=MyBCtPpprW2lOLfq0+1XnKGtK0XC0U0gqfzZOF6fN4z9xiFrIL0JHJg4DrCTZDvn9Y
         jKJOPV8IQbv6VlSNi+1UlLO8LCBUNVjibmAY3ABDgoDL7yXv1oHm/3bJkyxjYgtqeeBI
         KjOI8TuZUu0A8gPuneM3xj44g+2x6ClphyUcW7hcg3gH1E2kL1OlbXt0kXzCN9MJnoks
         lD7usMNsNi/Q6d3UoQAlaIVf6yVebd8E/j9lBG8mWDdZZbhKguTPkl21afYL8M7yBoWE
         EkxdEugZhDsX14wVQtaPYKCUnnyfFk1Sk/EJXUigEnlwmI4+TqxQTJN25HMUXEYiSBME
         gu2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780936707; x=1781541507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=;
        b=Zenw7uPdviSMdaxRTw3ts2JRt5xTnocwaZytRD9KHTKcbTntvnA5K5I3krMW9icDiv
         n91p4Sh9cJ79WTjVEo/Oab3s9AsYVVTXGyRFQAaOJ8llMXMhFAA8M1RbrHEaq89ULelY
         7YV2UyaKq35WrHiD653eNWYrE4qJs7HOBHRmnf5LBDATnhUdc9vpHgaAqbBp2jjgLwR+
         M7wDihsMWGASlDeaPioqzj/iMOZIk6HmaEDlOuP698drPlmrg1GXR9Ga2QEA3p5ZWs56
         gUqTz8CvJIUBYTemThZOySN2cJJqMqfj2QiDj8qb97eZzvk5i/ghqtCeBna3lXHd5Sx9
         ymLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936707; x=1781541507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c+auThQZxPAjxDc0fMSepBAYMkGW6rfzA+iCSa7438U=;
        b=p9pVmnn+3OBDyb06lqVl6aex1/p623grg78i2VCglgJKSyfwSYPAmXq7qNw18qLwsK
         4vl7DR4F7MJOJYb7U3pUg9muyuI4XXBjKzSiMGKmBztW6IT4ueOZdmyoQqQmPG8kxlur
         vAVbgnldpMAy5DRmXlh5Eo27uw5avm3bemQHSW8iWUOylWiLferUWDfFzSzMPbYtFv/v
         CrxOMgT9Ar6ybe5RcBqR2pBfH5PybSpAPoOLBoe/X+2K+OF+mpsEoLCkFJbox4tMXKUp
         UDh6MSRDqNTTjUwvJZeTxjXaR1HQB53qQ34M18652cEKiz0in+8utqGpHaQbM+5wsqrj
         zHUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YWAHkD+cNDURLOn7yxhNvyADyrTu2eQe+hbrXvtSj0BdSHckZ1j0AjpheHZZENIGc+rytUlQArxaPbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMo1+lLAnlnRnqV/jirC6UEI2ZyCANETfC4JTF68FYKvLWLPAU
	OpHDkgmwO1Xf20HU1Fz56ToteuEI8KefiSInsgPXjSqFBu5PFI27sHIpOqzTz2crnohepRomL2Z
	lTF0GmwM6YqiBKYW9i3jyfwLE8C3rZjXu+G7180bRk1kZcPGgnRT1ZLxQCXZVKBHwnj8i3X/sOD
	jxx0tcoatblAARLzkYZnKtjmd3VJ+NDV/QXgYUEb1J4022rA==
X-Gm-Gg: Acq92OG5nRp8wqf1WbbQDd1u0oQm8tjI9IzakTACfMYBzRDSJhMeI2TqD5m5kBJL+MA
	woQi8qOJ397BLLKSfbkhvOFihz49NCBveMpzXli4M/7NwhA6prB+aj9P8r2M6CcaB5q4x6IKTdu
	fdkzMAUfjFyYSoCykZuT5lTeGzOLsDr4kEBmuE3uzUcrd6d2RVFr0PBB/MqDBOtWHMQMFFAHgRa
	3gOnaqKoq6j10fr9Q==
X-Received: by 2002:a05:690c:e3d1:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7ed0d3cbcc4mr155717387b3.6.1780936706567;
        Mon, 08 Jun 2026 09:38:26 -0700 (PDT)
X-Received: by 2002:a05:690c:e3d1:b0:79a:60f6:c5ed with SMTP id
 00721157ae682-7ed0d3cbcc4mr155716897b3.6.1780936706088; Mon, 08 Jun 2026
 09:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-4-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-4-23ffa16b6ebb@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:08:15 +0530
X-Gm-Features: AVVi8CdP_PRc1DJjUVOc0gMS_HHZf1oDGc6wp_gUILbiw5JbF5QWPmOsllQtoVM
Message-ID: <CAB19ukH5hx_kfpfcRiuPFrUmvFxMk3B08RNjcaxx3C6fDBS0dw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ACPI: irq: Move RISC-V interrupt controllers
 autodep to ACPI IRQ code
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1OSBTYWx0ZWRfX7DfAoP4DoBIa
 F8th5ahvz2DmTr5MwAh04qVgUzIJvMugjLPJ+ysyO0UWUc9kI9N9ArrBnQ+6zFMZX1QHwuC89V4
 5C8IWK/J5ZKksxxbhRQ7mipydG0ZFPHAk/IbK5IaawgLSdHUe4P1UIJzlKrRGip2Czz8hu6uJS+
 AjhWLqLTmRnOqXnx1jwtjT9Vbo5xQulVi0J8tdJ3eqRUnFKcMitrNrYq7YDr2YADoSJGVdmMO6a
 H8pHQAJFdmcktc3EluxOIpo66B1OCcgZOp8mt9hGPgYdCIZ6Se6CW9p02Mb4MD2pp+Rq4VFpYAg
 cwCL60LLYntWIsvcvix8HVBbUIExGHBcJPGJbPZB01vc8RpMRMXzZ2P4BXTIFGut0vy/WKoaEV4
 t04ywALnxF+ejSjbfvkuw/s2nxAnnBw3DzouQzloiFY+Eh0l/vQSn/IwfaF85vHK8oj2GwefXHl
 xGwXmwoOi1/SjUGHEjA==
X-Proofpoint-ORIG-GUID: HHiTHZDXIoC_x-peH6mXhBCLcdvSCf1b
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26f003 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=bDdBU3oEAAAA:8
 a=EUspDBNiAAAA:8 a=bDd8DhsF2Ke-o0a1jUUA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=qeNa2pbTr82C0GpJEZFS:22 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: HHiTHZDXIoC_x-peH6mXhBCLcdvSCf1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_093828_140142_23B0CC1A 
X-CRM114-Status: GOOD (  16.80  )
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

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxOjU04oCvUE0gTG9yZW56byBQaWVyYWxpc2kgPGxwaWVy
YWxpc2lAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBSSVNDLVYgaW1wbGVtZW50cyBhcmNoIGNvZGUg
dG8gZGV0ZWN0IHByb2JlIGRlcGVuZGVuY2llcyBmb3IgZGV2aWNlcyBhbmQKPiB0aGUgaW50ZXJy
dXB0IGNvbnRyb2xsZXIgdGhlIGRldmljZXMgR1NJcyBhcmUgcm91dGVkIHRvLgo+Cj4gVGhlIGNv
ZGUgaXRzZWxmIGlzIGFyY2ggYWdub3N0aWMgYXBhcnQgZnJvbSBhbiBhcmNoIHNwZWNpZmljIGhl
bHBlcgo+IGZ1bmN0aW9uIHJlcXVpcmVkIHRvIHJldHJpZXZlIHRoZSBhY3BpX2hhbmRsZSBvZiB0
aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIKPiB0aGF0IG1hbmFnZXMgdGhlIGRldmljZSBHU0kgaW50
ZXJydXB0Lgo+Cj4gSW4gb3JkZXIgdG8gZW5hYmxlIElSUSBwcm9iZSBkZXBlbmRlbmNpZXMgZGV0
ZWN0aW9uIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMsCj4gbW92ZSBSSVNDLVYgSVJRIHByb2JlIGRl
cGVuZGVuY3kgZGV0ZWN0aW9uIGNvZGUgdG8gZ2VuZXJpYyBBQ1BJIElSUSBjb2RlLgo+Cj4gQWxs
b3cgaW50ZXJydXB0IGNvbnRyb2xsZXIgZHJpdmVycyB0byByZWdpc3RlciBhbiBhcmNoIHNwZWNp
ZmljIGZ1bmN0aW9uIHRvCj4gZGV0ZXJtaW5lIHRoZSBhY3BpX2hhbmRsZSBmb3IgYSBzcGVjaWZp
YyBHU0kgbnVtYmVyIHRvIHVzZSB0aGUgbWVjaGFuaXNtIGlmCj4gbmVlZGVkIGJ5IHRoZSByZXNw
ZWN0aXZlIGludGVycnVwdCBjb250cm9sbGVyIGRyaXZlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBM
b3JlbnpvIFBpZXJhbGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwub3JnPgo+IENjOiBIdWFjYWkgQ2hl
biA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2Vy
bmVsLm9yZz4KPiBDYzogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiBDYzogIlJh
ZmFlbCBKLiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+Cj4gQ2M6IFN1bmlsIFYgTCA8c3Vu
aWx2bEB2ZW50YW5hbWljcm8uY29tPgo+IENjOiBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaCAgICAgICB8ICAgMSArCj4g
IGRyaXZlcnMvYWNwaS9pcnEuYyAgICAgICAgICAgICAgICAgIHwgMTcyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLQo+ICBkcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMgICAgICAg
ICAgICB8IDE1NiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2ly
cWNoaXAvaXJxLWdpYy12My5jICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJx
LWdpYy12NS5jICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy5jICAg
ICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWxvb25nYXJjaC1jcHUuYyB8
ICAgMiArLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyAgICB8ICAgMyArLQo+
ICBpbmNsdWRlL2xpbnV4L2FjcGkuaCAgICAgICAgICAgICAgICB8ICAgNSArLQo+ICA5IGZpbGVz
IGNoYW5nZWQsIDE4MSBpbnNlcnRpb25zKCspLCAxNjQgZGVsZXRpb25zKC0pCj4KTEdUTS4KClJl
dmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAb3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
