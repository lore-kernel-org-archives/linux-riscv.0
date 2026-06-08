Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74661CD6E79
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4/YMF8qQNklNShXWRhASHZ9RxCdJwbAtEbAM9CwZzE=; b=Bnqt9GMv1v7HYF
	8zVUxKx7jBsVOaz/m0AMO8dtNkUrO/4uWMNWhwG79O/6vaO6dE3M/JqDVvlbvcLlO/2LSs3l/uH/C
	Il7EVd0AU01cdxrrtYESlePsePU1GFTgmnd/UGCbNO/a2KgceDUwoIaFIYllTpMTfU7/qI4E+1SRv
	IOQmWnPJU/IaH8rSRvX1aZUfHB9uTM/0badzGrs99ef2h/GleerX6+wlWdXNLOhmJJtLcK3XiJKRX
	xHifHY9L6R5GPOEVZ3m1AVQ/2xwdZE9DVbQiKCAVNIKK/kuhPClmPyQ1JJdH44lgHP/jcV7gqa4tk
	Lm9Lsk+6yVxhmIOfawJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcsy-000000044qj-3QEd;
	Mon, 08 Jun 2026 16:31:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcsr-000000044oo-3Wem
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 16:31:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFaeN3588524
	for <linux-riscv@lists.infradead.org>; Mon, 8 Jun 2026 16:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=; b=bK
	UroUnhkz4pKQ36Eqx2OGDhGkz7J6Re/8ZFD82X0RehI7Y0MGj8NHovKB/97jYISn
	fudrob/coutlI9v+msh9ROiWhUMQ8PO/M+dKlF0civ+oQsu85Ade9En7qOvTf8ka
	Kb+aY7g3PrKtluAcX6wpYzIzOLTDqPDc9qgZKUlxWZEXfNJ2CU85gD/6FWG5IWUF
	bo0oN1oSSu5ihMosfyOpGFYaVVXxWPRbQDBfVYtWCirjdLKRLAFxMPbnEHWfJRm2
	GvSPIoVqBJKrLAJ6igEQPSCeJZarVZUJQbOkkhXfmbau/+2UV8zwUObFZ71lIRTA
	dKV2VrrDJz5GcxOhOv4g==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun41sm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 16:31:29 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6605694a059so8191622d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 09:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936288; cv=none;
        d=google.com; s=arc-20240605;
        b=hsGk2x3wEC18nlfMlCKpwRCYz/PxXzYxpojhxrSQ+O7S4kWUVIXvnWm0TuqAZIa4bW
         NuhfiEPqibzIT0LmCuq5aIyc0JydokThTZhb3LHNITMvP6S8W1ZnjM3W38SmI0BEF9ZN
         Dwo2fIeJREAJd1mL98Z6PiGp1LrYzXrjo3TeVHvYp/jFGIFGieTslsS+UHLe6/q10Ron
         oZAwp9OqpqPGDIS5k0R+mlUJgWVP5VZUNSpS6W2NXvTZxmvrg0KrkOc9lT1sRrFugEcI
         5R4xx23FXt/wDyy/M1xtGEf4XVW/X4Jul1wzE+WOCiECH+z4HhM67rD2E27sYtTV0zHz
         3hlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=;
        fh=YUxYZ99MZ058mw0yrsQZP7nD1ig4bYgiQ5FpivJvTA8=;
        b=FaUPg2YRE8UhB5PiwpRZIQlvSudLWEE5EuWR5O7Br0z4iTMDmF6RDlMm2b2AkfA0G6
         AjBRo5mcNbppZyn8DQPfHV5DCuKhx55kFA90vlvDtUW7vi3NmoMMGnDJxbvEGYUjzD+d
         XYG+q+waI2yuaZxf38BweBvY7UZM7aSa113a3MdtfND7HBPy5DX22bRTL/FAfhGWuu4c
         VXZxpTtJlUIBQfWiDp2StZjIOBmu6buoEpXOx7FaJEeDHkMm5kVym/IMxjWop3uzSL1h
         8amwPwcoCgPvsVQir9Fz1GeQnGrgCciPeDITnelBst6NLKn4XkMsrPYeaCNmsRtKLsm3
         /MGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780936288; x=1781541088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=;
        b=RNh8wffYiLFzInYqfT2l480o/OL79GGVHScamIQ6GgH3whWJuob5nipqnjBJRpV7TX
         oawc2Z6ylKLJySg2qrd1aiAZ/QLBRV5JD0xvmQBwchF4uyRpqr3YS3RLEw4Yt5piI/yA
         hYZuSoA1KAPI1+zVPm+TSc9wWdqFVkL6w4b3x1PVPRgzbYOBVey5FQj5inD1U5NvAEqt
         EshiE+0vlzZ3/hcJR6t/KJLsoL/SF2Zz64i1isdgdPSuhQgC9gx2VH/vhtrAbmzIIVnc
         KfVnS8BWwqQDuDzry2xFcijipV7/ADfnvwrij04tICwDVkdOfkl20UDX7WKOUe6LolKF
         xe+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936288; x=1781541088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=;
        b=HgLIxDXAgr8CAtqytKi9rYRXcX6m8zmp0cVeXSIkS7kcOQSs4HwFkOnxki42o3wNah
         52CTmah/KXtw9UvcDJylZyEtsiSLV0yq02DUgfPSgo1Q5yFkr1t039k34455a2lThiIp
         eH+rjz+7QSTeMpXE8Xm4r/fyZ0B+aDM8cbL8DVQ//1ltMD9Lcv5B1QkgFutIM68JL3Tm
         uuEzfoBGdJYtpn7MFNrKSNTBP4dO0mOHSeUuEGVxA9B+vYz1vB6FpTxnEy41BX9HhOaP
         3vUpsEZv+Qb97467Yl4D4rl4GsJz0p3PJbIVwm5z/yy5zKI4rvEgcPpnxl3mWD+4k4hv
         ATrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8Kn3HojBslLD24ZJpZIgvObcAnMjFCUyc9iLxCcDz3lHiQBIxNYMvH6LH+LrcqUe+AtjHFRfebgKImw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjIM26OYJsVVXvYV1FG3zxhf/jYANlL8RgwvGYbZcSlR39fNBw
	fDQHk64m3AB5hvFVyok7aRfEsXMi8moX+ena8sWdnv/A+D1GGTmelQ8jeSv7qPWw4EW6sHW3D/5
	FkHDEyUVEg2B/wSodiOvz4LUhJDW5HfmNjGDOY8ea61u+FcmkrfAPux6q1U89BxvY+MD3WSUCXY
	AZNuSlRRDuZR90gnV+oLhBTPnDbHidgjtQqioImyPWHUUUDA==
X-Gm-Gg: Acq92OF0ji6tf/94ACNSQvDtnzxiNAwCQclQYEn84nrrhEtg/pIEIySYs6P6GQpYWzn
	zVfS3GjoReT+0OvPSITnDDNlpB00DPS1j/cz0fv/k6U4nTPN3JJgydujTOvyVIG/Zk126ynNyvi
	tebBU0HJ0dgEdaS8qVtQsf7uPUjVso/0WuimthLnZwfKHW6A5meVODVxMch7bcqDWcTIKpIBl+1
	qQHXh+PsBBzAyAhcw==
X-Received: by 2002:a05:690e:1919:b0:65c:1011:8a8 with SMTP id 956f58d0204a3-66106f38d32mr13567120d50.34.1780936288339;
        Mon, 08 Jun 2026 09:31:28 -0700 (PDT)
X-Received: by 2002:a05:690e:1919:b0:65c:1011:8a8 with SMTP id
 956f58d0204a3-66106f38d32mr13567038d50.34.1780936287720; Mon, 08 Jun 2026
 09:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-2-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-2-23ffa16b6ebb@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:01:16 +0530
X-Gm-Features: AVVi8Ce85oHpnPDkl3loJMYesa9hqOwx4u4ydQ5fzIl78S7nrYXEW2Qks7w8mXs
Message-ID: <CAB19ukFVPnWhgvb9icFU44L5qre8ViNTEHg_uvK5232PnCEE5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ACPI: RISC-V: Check acpi_get_handle() status in riscv_acpi_add_prt_dep()
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NyBTYWx0ZWRfX4Xl8Ntdwst2M
 yIADO0mUp4a+x+qt8RvefrVwZ4M8+49Wy5TW0kdgaEGHmN1kfzEMSMeC55FfxP7JdHgukG8k7k4
 dhtRHXWPvi9x4aXC885FFRfDZdEM7vvDBZAK6AJO+4UiWG9xI8RJ6twWxcZRocts1lyQwrWxSGV
 zQ/4Mul+Wy8aAK9HSMouulfBML9TzeiQGDuoS6/pYIw69NeNnzHDTCBUoGW0VAsz/CgPspEbwdq
 52QuZlRsytBWBhWpajhxen5kTgmjnLwvDO++Pg3yjzRckSl41Fakw7Vz5ku8gUHdK7v7OCX8Dgk
 VrkUj2Yn+fIQYJP8z9g+NMlfI1Bm81pgZrOgZT3azqGd67HgVULvyFshnAIHRPTKmZtXPJJc3X4
 4ochWmi6xC4uvK/GkWTcvkYC2BWpy1pnOEVZGeYO6CD5n0ZaDk65hH2vzb9ih5fKHL7kUtKDo8O
 OR/Cowf8e8M79gRBD1w==
X-Proofpoint-ORIG-GUID: dOHNxkvFvNgnlsJZj1NPQ4TbTCi6OFCD
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26ee61 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8
 a=S6Q6xKXrEcqShMHWKZgA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: dOHNxkvFvNgnlsJZj1NPQ4TbTCi6OFCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_093129_883765_5C374792 
X-CRM114-Status: GOOD (  17.77  )
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

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxOjUy4oCvUE0gTG9yZW56byBQaWVyYWxpc2kgPGxwaWVy
YWxpc2lAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBJbiByaXNjdl9hY3BpX2FkZF9wcnRfZGVwKCks
IHRoZSBhY3BpX2dldF9oYW5kbGUoKSBjYWxsIGNhbiBmYWlsIHdoaWNoCj4gd291bGQgbGVhdmUg
bGlua19oYW5kbGUgdW5pbml0aWFsaXplZC4KPgo+IEZpeCBpdCBieSBjaGVja2luZyB0aGUgYWNw
aV9nZXRfaGFuZGxlKCkgcmV0dXJuIHN0YXR1cyBhbmQgc2tpcCB0aGUgZW50cnkKPiBpZiBpdCBm
YWlscy4KPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNpQGtl
cm5lbC5vcmc+Cj4gQ2M6ICJSYWZhZWwgSi4gV3lzb2NraSIgPHJhZmFlbEBrZXJuZWwub3JnPgo+
IENjOiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9hY3BpL3Jpc2N2L2lycS5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcmlzY3Yv
aXJxLmMgYi9kcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMKPiBpbmRleCBjZDgzYzMwMzVjZjYuLjc1
MTcwMTUxYzYxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMKPiArKysg
Yi9kcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMKPiBAQCAtMzM5LDcgKzMzOSw5IEBAIHN0YXRpYyB1
MzIgcmlzY3ZfYWNwaV9hZGRfcHJ0X2RlcChhY3BpX2hhbmRsZSBoYW5kbGUpCj4gICAgICAgICBl
bnRyeSA9IGJ1ZmZlci5wb2ludGVyOwo+ICAgICAgICAgd2hpbGUgKGVudHJ5ICYmIChlbnRyeS0+
bGVuZ3RoID4gMCkpIHsKPiAgICAgICAgICAgICAgICAgaWYgKGVudHJ5LT5zb3VyY2VbMF0pIHsK
PiAtICAgICAgICAgICAgICAgICAgICAgICBhY3BpX2dldF9oYW5kbGUoaGFuZGxlLCBlbnRyeS0+
c291cmNlLCAmbGlua19oYW5kbGUpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9
IGFjcGlfZ2V0X2hhbmRsZShoYW5kbGUsIGVudHJ5LT5zb3VyY2UsICZsaW5rX2hhbmRsZSk7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgaWYgKEFDUElfRkFJTFVSRShzdGF0dXMpKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgZGVwX2RldmljZXMuY291bnQgPSAxOwo+ClJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1
bmlsdmxAb3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
