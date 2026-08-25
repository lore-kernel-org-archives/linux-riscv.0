Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDECC61DBE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCiCMAmz/135YVR0jYVDK6sTsQAwWj4BTi+6UQoxTLo=; b=Kv/eGswfEqJtIL
	ndEsnfokcee08uZmQk+Yscww0rr4bZ5rD2fl9JbQ8EfvpgdiGLONnBnfisBmuPzKGhxhKMFM/auAS
	F0I4bRKjbHnA4Y+vrTddDpZuXD/QMfuYEJPz/om3Ol7C4X4x8KsgwLZ65NJ/VAqcA3dj2lq/jahUX
	4a4lNrAIQ/iUn2tgJEBpF7l8MdhAwOgAyLXzGZiiEZsm1kFA/cecKwX2FBVLObQLOe5Q+r8/kyXOM
	jZc2ca9V3Bjjzv0CsMl9Rw565LSD3eKgpjXVyn31ZZ9++a7VPP+HKTWZ5rTvnrPzB2OZ/sDTD5ZK3
	9aNEAhX6TdPz4mZ8bvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqyk-00000000pvq-2yVn;
	Tue, 25 Aug 2026 13:14:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqyg-00000000pu6-1h2k
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 13:14:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAuxTv1152968
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 13:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5rJuoLCWO7KVfDNBoBfeBkBYsbNKNweb2IqmkGw9Bg=; b=pyu6VlIJDgoiFSrO
	uNnwDnUX4Lzccl9YZsw0xp9VrU2OJ29gP0L3sAbjy9OGmyp6eNEg8hkOw7JRdHn7
	iys6P229QtFBi18hf7B6LariH0HDFRCLekqVrp4BmXtaM98pkREZezaQqb82XMvM
	zXfE20rjgThbmRUnxwoXypC8ZaZyh/NJayKJblM+rxZuYC6dSW2LewzHtHtlgh2b
	TwtDivZAP5pOYt3S/IsJoRkxghCxwddUt35dKYU2BDUQeMh9/T6X8Prh2LtVBTul
	jyh6lpmb8yPClB7NOCPl/K8vyml4wNM2RsF2zSOwQvnmgP0IBaiAzvYS+RaAsioY
	TOe9SA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93nat2ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 13:14:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6ae2a942dso42174115ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 06:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663648; cv=none;
        d=google.com; s=arc-20260327;
        b=PRfJtlIieF2bGH4lK5LcD4Jz4FWG6dZUvqKKLSYIP9hkEBhx6MZoljO0f/fxQdFhMf
         XJXaUN+7LBtTD8Pay97f5E2aXENJ3a8ezyKTjLtWFy3cWMski/WCFYxRhiDjhn+8ja9C
         7BbqZHeSHIJoqwXy6H4aGaPNlfTTlYP2F9DPR6QvLYHoWEpeFpzTpa8F4N4cqTyGk61S
         8BuqL9U8f+U+pJIV451c95WW35Kc8mkTfvUk4n6C/2eUAhntRVS5K3gMEdx8hRJIMHak
         YOcDpj/fivxE/0rhhANnSM6NjcfOEnAUTyb5y8Fx0y+svxQWGp06M0Hh1vde6gfolAMm
         IJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f5rJuoLCWO7KVfDNBoBfeBkBYsbNKNweb2IqmkGw9Bg=;
        fh=KZvt8fMycNHun/3YX2eRPsAhYd08LWXu1VqASk5hq7o=;
        b=nvRSc2bnJ8QbmBvxPueNYj1Ny4ezMJKBGQ5DkNZ6EJ45q0hCCZCbqYjNEqdgQYail1
         Ikhx6JyLuBv+RFHImV2uJJDVc7uP0c039g+NqqymME7yltsIF6wwiZIZI3jXZW6uAReR
         B4HlHFgVC30PJT8qKRzZAFbiLwJ0xXuHC73rrRKL/6UaLTHgL1tD+seHz5loO12Uxeoj
         axS6kqwubl3/Hp6b3FkRwmr9H90QRTFe/KPImbM+okxREplebLFPGaCLTThC159mKm0U
         CXMi0DdQBsdi7qX4fx7k8auykwyFMu2kxjBvY2hd2SpqOJDTHFClW6ZMT32BEF2zgiOG
         duow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787663648; x=1788268448; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5rJuoLCWO7KVfDNBoBfeBkBYsbNKNweb2IqmkGw9Bg=;
        b=NuvUsJq8ZOT1e88SZ4YhvnwRyuMwMjY5++IkkIQVehsE5FMdax6ptAmjb+iY5IYPCC
         tKUbue9PFviQiq2V9k7zZUi1FHQ7u4ydyisM1yHrPPfo6GM4qUmkivWJfRIc352ZB9pJ
         4NZXbfnXtvNab/eCdz3o1/qYzfOSpvEOAbYLlwWhDmVZDeqpsQKRw+NPo5IwAPSr7exX
         DdgzfOGeX3WOcW1UplPgZEOanuqZfIOu5gPvfzNRi5Ez3drLWYtqNqK0JsetV6ColApF
         1HGH3/rsqvMtqU5FqKH+jKl+ihdsTAT/ScVzBhghAs9nQ6Tih3+rsIbzuLMuaj8YGQv9
         XhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663648; x=1788268448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5rJuoLCWO7KVfDNBoBfeBkBYsbNKNweb2IqmkGw9Bg=;
        b=nzkYqbHaxATY/mCP1UFCRnPfqXLZ7q7qv5k4T/a+FgtmOrOOk+7HpPj8qZmCDnJ69o
         vXPiTV/WtZecsGTqsUbWKt9/k8dZGJ7CtD3rGJW9Bnl2QEzMyPpz8lyTrswrWFgV4gPU
         5rILZY018enCPU6V87x4zE0NjQDH6A3hofhDD741mHGJeJP1XqWeSjlyarxTgP3YkSqC
         0rOpkcR7BL7Nt+27fZZrX8t2xcSkCGSfIy33V20R0rUSM+bddPhVRi/aDU1hEl1zs8OT
         xYAmIi6dosXeDmLB3DqVezIScB3ZJsfAZrTLPQHrTPHBYyGzT6YS8YRgsJdYv5EM/rte
         xbxg==
X-Forwarded-Encrypted: i=1; AHgh+RqwG6CE7i7xa7XYJZb5yQ5AI8lnYMNsCz1Yq32h5k0tnlYSUhofvEdtFGgB593K315B1bUmuSx+NT4NqQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nMXBDDTnLWqXTRgz7srFcdAFegFi4cCq2QCM65qW1hGFE4Fpv8
	Z6c5lF2DXaYH1f5S1foq4vGL1L8q79ZeJgSO4Xbpnp3g0bYHg207isZVNP5BAjB3P9Y/qw+Gv8A
	hcKk+IpfpLL+vIdYNdYaZT5eItXQfnNAkk485I9xD8icKKr4pwLuqVJhDysdA3g7pejaOZOto6q
	w7qVZiVWTLeCeG+XaltadHEFk+/8FZtZlrI0cwGT5mYVGurA==
X-Gm-Gg: AR+sD122YZxJ/7u7Ah9B5WpdfbCDL+8alWYGLBC5U5AOxKMmq7oTgkdc/Ls11ny8cVx
	xbnveLlzMXrFMVVCMTcQyiWT1WChRAKmlXXqep4iRdJ95NW/fzxwsRw8HU+mMzP/WK8WN3m7E2X
	vA5fi8SB6GRF73teYk2LlD0Q282jB6xF9RqwIGOW4+cD2WgbGUA6KaCHE4OLs=
X-Received: by 2002:a17:90b:6cc:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-395c33d786amr67081336a91.2.1787663648406;
        Tue, 25 Aug 2026 06:14:08 -0700 (PDT)
X-Received: by 2002:a17:90b:6cc:b0:392:ca3b:370a with SMTP id
 98e67ed59e1d1-395c33d786amr67081169a91.2.1787663647756; Tue, 25 Aug 2026
 06:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-4-mayuresh.chitale@oss.qualcomm.com> <c30e91d3-514a-4fef-8b61-e1744f577d35@amd.com>
In-Reply-To: <c30e91d3-514a-4fef-8b61-e1744f577d35@amd.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 18:43:54 +0530
X-Gm-Features: AcwNN1XGeK3kKeeesL0CAGDbwc6gJUoKnhOVO6Mm-4cXkc72U05QOEit2B_T6As
Message-ID: <CAHuiULC-Z+pqKsMKMPX8emnN4tz9Div7_9c-QGZ9-L_Ef21dEg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] perf/riscv: Use Sspesa for precise sample attribution
To: Sandipan Das <sandipan.das@amd.com>
Cc: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExMiBTYWx0ZWRfX9ANHagECvQBY
 IesObd4NonBbsUS+2MjRjAgTKqFYGc7Lou/Ry43XnjgJbIoKIPScf5GEIAqeULH+1WLLURJJiub
 9Tn8IciFJW12h7I6ztVpVOn2VVZO4SM=
X-Proofpoint-ORIG-GUID: 0m2Z5T3eVfNX1_Ogw1zXPwo3neIogVD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExMiBTYWx0ZWRfX26MJGb/+vkZb
 J0UBXEiiwHWwcChAInQ8i2dzgY2+9JN20hP6f3h6E2cpMoT1In34qYkEy0ca9MsplibFWhuWqCX
 6oR9VjHIGCOsqoG/4Gazyus+TCVBX4vhGimxJcCmjxcB2ZX9xPRr27xjkSaBtqtAbFlKLGol/nu
 4rWMIBUycwvBc5hzAPJ96lVRgVpa38YY3VMe+/x8lkKifc/tVBm7Um705IQ+Q+ksTBShqAt0U4y
 YnOrH1zYkmtlsujtm0X317Ibm4c5GsuSZ3NOytjtrNxE3cDLimit9gP05dxBhx7IpEPOwyjH8sK
 M7ZY1/IripzP/VPzMUr+5llxn9fqCrVCT3upsrMlpjXEp2DVBvt54RmczjaSpzSRI+9Kmd/VrVk
 NmldvC39FX1yEXotUoxHjOjFmkmJzNqH+Ga/XBb3CAjr6qWzFdufLHtr8eYp7G72+dNC7Qxb0+Z
 0xLBK3841E4WiKTjyLw==
X-Proofpoint-GUID: 0m2Z5T3eVfNX1_Ogw1zXPwo3neIogVD8
X-Authority-Analysis: v=2.4 cv=W74IkxWk c=1 sm=1 tr=0 ts=6a8d9521 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=8lNz-84GcgrwCALWT8sA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_061410_449959_A2CB5BC0 
X-CRM114-Status: GOOD (  30.38  )
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

T24gVGh1LCBBdWcgMjAsIDIwMjYgYXQgMzo1MeKAr1BNIFNhbmRpcGFuIERhcyA8c2FuZGlwYW4u
ZGFzQGFtZC5jb20+IHdyb3RlOgo+Cj4gT24gMTctMDgtMjAyNiAyMTozMiwgTWF5dXJlc2ggQ2hp
dGFsZSB3cm90ZToKPiA+IFdoZW4gdGhlIFNzcGVzYSAoUHJlY2lzZSBFdmVudCBTYW1wbGUgQXR0
cmlidXRpb24pIGV4dGVuc2lvbiBpcwo+ID4gYXZhaWxhYmxlIGFuZCBhIGNvdW50ZXIgb3ZlcmZs
b3dzLCB0aGUgaGFyZHdhcmUgcmVjb3JkcyBhIHNhbXBsZSBQQyBpbgo+ID4gc2hwbXNwYyByZWdp
c3RlciBhbmQgdGhlIGNvdW50ZXIgSUQgYW5kIGFkZGl0aW9uYWwgaW1wbGVtZW50YXRpb24tZGVm
aW5lZAo+ID4gZGF0YSBpbiBzaHBtc2RhdGEgcmVnaXN0ZXIuCj4gPgo+ID4gSW4gdGhlIFNCSSBQ
TVUgb3ZlcmZsb3cgaGFuZGxlciwgdXNlIHNocG1zcGMgdG8gcmVwb3J0IHNhbXBsZSBQQyB2aWEK
PiA+IFBFUkZfU0FNUExFX0lQIGZvciB0aGUgY291bnRlciB0aGF0IGNhdXNlZCB0aGUgb3ZlcmZs
b3cuIFNocG1zZGF0YSBpcwo+ID4gZXhwb3J0ZWQgYXMgcmF3IGRhdGEgdG8gdXNlcnNwYWNlIHdo
ZW4gZXZlbnRzIHJlcXVlc3QgUEVSRl9TQU1QTEVfUkFXCj4gPiBzYW1wbGUgdHlwZSBhbmQgaXQg
YXNzaXN0cyBpbiBkZXJpdmluZyB0aGUgc2FtcGxlIFBDIGZyb20gc2hwbXNwYyBpZgo+ID4gcHJl
Y2lzZSBhdHRyaWJ1dGlvbiBpcyBub3Qgc3VwcG9ydGVkIGZvciB0aGUgZXZlbnQuCj4gPgo+ID4g
SWYgc3NwZXNhIGlzIG5vdCBhdmFpbGFibGUgb3IgZm9yIGNvdW50ZXJzIHRoYXQgZG9uJ3QgbWF0
Y2gKPiA+IHNocG1zZGF0YS5DTlRSSUQsIGZhbGxiYWNrIHRvIGVwYyBmb3IgUEVSRl9TQU1QTEVf
SVAuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWF5dXJlc2ggQ2hpdGFsZSA8bWF5dXJlc2guY2hp
dGFsZUBvc3MucXVhbGNvbW0uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3Bt
dV9zYmkuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+IGluZGV4
IGRmYzg4NmRlZTVhZC4uMWIwYjFjYzYxMmRlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYwo+ID4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+
ID4gQEAgLTYzLDYgKzYzLDggQEAgUE1VX0ZPUk1BVF9BVFRSKGZpcm13YXJlLCAiY29uZmlnOjYy
LTYzIik7Cj4gPgo+ID4gIHN0YXRpYyBib29sIHNiaV92Ml9hdmFpbGFibGU7Cj4gPiAgc3RhdGlj
IGJvb2wgc2JpX3YzX2F2YWlsYWJsZTsKPiA+ICtzdGF0aWMgYm9vbCBzc3Blc2FfYXZhaWxhYmxl
Owo+ID4gKwo+ID4gIHN0YXRpYyBERUZJTkVfU1RBVElDX0tFWV9GQUxTRShzYmlfcG11X3NuYXBz
aG90X2F2YWlsYWJsZSk7Cj4gPiAgI2RlZmluZSBzYmlfcG11X3NuYXBzaG90X2F2YWlsYWJsZSgp
IFwKPiA+ICAgICAgIHN0YXRpY19icmFuY2hfdW5saWtlbHkoJnNiaV9wbXVfc25hcHNob3RfYXZh
aWxhYmxlKQo+ID4gQEAgLTEwNTEsNiArMTA1MywxMSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcG11
X3NiaV9vdmZfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXYpCj4gPiAgICAgICBzdHJ1Y3QgY3B1
X2h3X2V2ZW50cyAqY3B1X2h3X2V2dCA9IGRldjsKPiA+ICAgICAgIHU2NCBzdGFydF9jbG9jayA9
IHNjaGVkX2Nsb2NrKCk7Cj4gPiAgICAgICBzdHJ1Y3QgcmlzY3ZfcG11X3NuYXBzaG90X2RhdGEg
KnNkYXRhID0gY3B1X2h3X2V2dC0+c25hcHNob3RfYWRkcjsKPiA+ICsgICAgIHVuc2lnbmVkIGxv
bmcgc2FtcGxlX3BjID0gMDsKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgc2FtcGxlX2RhdGEgPSAw
Owo+ID4gKyAgICAgaW50IHNhbXBsZV9jbnRyaWQgPSAtMTsKPiA+ICsgICAgIHU2NCByYXdfc2Ft
cGxlOwo+ID4gKyAgICAgc3RydWN0IHBlcmZfcmF3X3JlY29yZCByYXcgPSB7IDAgfTsKPiA+Cj4g
PiAgICAgICBpZiAoV0FSTl9PTl9PTkNFKCFjcHVfaHdfZXZ0KSkKPiA+ICAgICAgICAgICAgICAg
cmV0dXJuIElSUV9OT05FOwo+ID4gQEAgLTEwODgsNiArMTA5NSwxNiBAQCBzdGF0aWMgaXJxcmV0
dXJuX3QgcG11X3NiaV9vdmZfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXYpCj4gPiAgICAgICAg
ICAgICAgIHJldHVybiBJUlFfTk9ORTsKPiA+Cj4gPiAgICAgICByZWdzID0gZ2V0X2lycV9yZWdz
KCk7Cj4gPiArICAgICAvKgo+ID4gKyAgICAgICogU3NwZXNhIHJlY29yZHMgdGhlIFBDIGFuZCBt
ZXRhZGF0YSBvZiB0aGUgb3ZlcmZsb3dpbmcgY291bnRlciBpbgo+ID4gKyAgICAgICogaGFyZHdh
cmUuIFRoZSBQQyBpcyBwcmVjaXNlIG9ubHkgZm9yIGV2ZW50cyB0aGF0IHN1cHBvcnQgcHJlY2lz
ZQo+ID4gKyAgICAgICogYXR0cmlidXRpb247IG90aGVyd2lzZSBpdCBpcyBiZXN0LWVmZm9ydC4K
PiA+ICsgICAgICAqLwo+ID4gKyAgICAgaWYgKHNzcGVzYV9hdmFpbGFibGUpIHsKPiA+ICsgICAg
ICAgICAgICAgc2FtcGxlX3BjID0gY3NyX3JlYWQoQ1NSX1NIUE1TUEMpOwo+ID4gKyAgICAgICAg
ICAgICBzYW1wbGVfZGF0YSA9IGNzcl9yZWFkKENTUl9TSFBNU0RBVEEpOwo+ID4gKyAgICAgICAg
ICAgICBzYW1wbGVfY250cmlkID0gc2FtcGxlX2RhdGEgJiBTSFBNU0RBVEFfQ05UUklEOwo+ID4g
KyAgICAgfQo+ID4KPiA+ICAgICAgIGZvcl9lYWNoX3NldF9iaXQobGlkeCwgY3B1X2h3X2V2dC0+
dXNlZF9od19jdHJzLCBSSVNDVl9NQVhfQ09VTlRFUlMpIHsKPiA+ICAgICAgICAgICAgICAgc3Ry
dWN0IHBlcmZfZXZlbnQgKmV2ZW50ID0gY3B1X2h3X2V2dC0+ZXZlbnRzW2xpZHhdOwo+ID4gQEAg
LTExMjMsNiArMTE0MCwxNSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaGFuZGxl
cihpbnQgaXJxLCB2b2lkICpkZXYpCj4gPiAgICAgICAgICAgICAgIHJpc2N2X3BtdV9ldmVudF91
cGRhdGUoZXZlbnQpOwo+ID4gICAgICAgICAgICAgICBod19ldnQtPnN0YXRlIHw9IFBFUkZfSEVT
X1VQVE9EQVRFOwo+ID4gICAgICAgICAgICAgICBwZXJmX3NhbXBsZV9kYXRhX2luaXQoJmRhdGEs
IDAsIGh3X2V2dC0+bGFzdF9wZXJpb2QpOwo+ID4gKyAgICAgICAgICAgICBpZiAoc3NwZXNhX2F2
YWlsYWJsZSAmJiBoaWR4ID09IHNhbXBsZV9jbnRyaWQpIHsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBkYXRhLmlwID0gc2FtcGxlX3BjOwo+Cj4gRG9lcyB0aGlzIG5lZWQgdG8gYmUgdGllZCB0
byBldmVudC0+YXR0ci5wcmVjaXNlX2lwPwpJIHRoaW5rIHRoZXJlIGlzIG5vIG5lZWQgdG8gdGll
IHVzYWdlIG9mIHNhbXBsZV9wYyBpdHNlbGYgdG8KcHJlY2lzZV9pcCBhcyB0aGUgc2FtcGxlX3Bj
IG9idGFpbmVkIGZyb20gc2hwbXNwYyBpcyBtb3JlIHByZWNpc2UgdGhhbgplcGMuIEJ1dCB5ZXMs
IHdlIG5lZWQgdG8gdGllIHRoZSBzZXR0aW5nIG9mIFBFUkZfUkVDT1JEX01JU0NfRVhBQ1RfSVAK
ZmxhZyB0byBwcmVjaXNlX2lwID09IDMgYW5kIHNzcGxjb2ZpIGV4dGVuc2lvbiBiZWluZyBhdmFp
bGFibGUuIEkgd2lsbApkbyBpdCBpbiB2Mi4KPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRh
dGEuc2FtcGxlX2ZsYWdzIHw9IFBFUkZfU0FNUExFX0lQOwo+ID4gKwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHJhd19zYW1wbGUgPSBzYW1wbGVfZGF0YTsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICByYXcuZnJhZy5zaXplID0gc2l6ZW9mKHJhd19zYW1wbGUpOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHJhdy5mcmFnLmRhdGEgPSAmcmF3X3NhbXBsZTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBwZXJmX3NhbXBsZV9zYXZlX3Jhd19kYXRhKCZkYXRhLCBldmVudCwgJnJhdyk7Cj4g
PiArICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgICAgICAgaWYgKHJpc2N2X3BtdV9ldmVudF9z
ZXRfcGVyaW9kKGV2ZW50KSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIC8qCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICogVW5saWtlIG90aGVyIElTQXMsIFJJU0MtViBkb24ndCBoYXZl
IHRvIGRpc2FibGUgaW50ZXJydXB0cwo+ID4gQEAgLTExOTQsNiArMTIyMCw5IEBAIHN0YXRpYyBp
bnQgcG11X3NiaV9zZXR1cF9pcnFzKHN0cnVjdCByaXNjdl9wbXUgKnBtdSwgc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRlCj4gPiAgICAgICBzdHJ1Y3QgY3B1X2h3X2V2ZW50cyBfX3BlcmNwdSAq
aHdfZXZlbnRzID0gcG11LT5od19ldmVudHM7Cj4gPiAgICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAq
ZG9tYWluID0gTlVMTDsKPiA+Cj4gPiArICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFp
bGFibGUoTlVMTCwgU1NQRVNBKSkKPiA+ICsgICAgICAgICAgICAgc3NwZXNhX2F2YWlsYWJsZSA9
IHRydWU7Cj4gPiArCj4gPiAgICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUo
TlVMTCwgU1NDT0ZQTUYpKSB7Cj4gPiAgICAgICAgICAgICAgIHJpc2N2X3BtdV9pcnFfbnVtID0g
UlZfSVJRX1BNVTsKPiA+ICAgICAgICAgICAgICAgcmlzY3ZfcG11X3VzZV9pcnEgPSB0cnVlOwo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
