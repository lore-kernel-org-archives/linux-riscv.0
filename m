Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06077CA5FC7
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsimvqpX5IkD5VszOqHSqds+mNmyYQzDBHir0mN+/KQ=; b=gZVmpAoa73r1wL
	q/KY11VlXUF1ycT5BIhJDTThO5BIxuyIn2lOj2lopopKUm/DBrWNp9AmwJm+S1cE4PPQUpiLVYuO3
	7awJ+l+96FIsfZXw8omD+shm4GBnAcz/Y29kMX0dLRezFleKSh9RN1y9wNaEQ/S7HWKBMCrr069hT
	zH4ynSNT/MtxKJd7JHYhtW6jKDt6OHaWqv9Ph2Ls+bcLiYI+mUj1hnPGDAsy1+wllsQU9n+clMO+J
	RIf9M79xWBir4t1HsNyZqOEJzHHMVlOSZhBiMzwgW86iPt66Mf5wPpnVQrQ5V6V/+bbTzEOd7rILe
	oXXVz7h6jTXqRu3IZnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxO9-00000006j8T-4623;
	Wed, 30 Sep 2026 16:42:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxO5-00000006j7T-47vB
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 16:42:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxuoD612376
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 16:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=; b=pBU0+pANHB87dG77
	A3fm8IveP+Ag7UyWUl9XemM+27sK/70uPWCCammhgyIHxwpqWO2cMKmk9cYNz3LI
	IyUtvE5QN/EmzT0TJpn3rVjXoKqKq+jvjPe7qGyMGPoOSEbkbRh+Pjalzb45Q7hp
	dcgmoLdWDthQNv1aYqGBWhDfojNuWuvWY1+8SAyYKpdGZ0YcFoPUz2zWT5uyivvu
	14zuD3dUeEXCzu1oOqnN6XqZ2TrJ8VYQ//wWqYsN4ORiuN/mrfyCHdr9ej4Vb4j1
	OkqcF3X6TxyZidapwVOcUkdrCAwjhNtYlBbS8Fs7whk4wSP17hFy3DJFa7RO8LbG
	dXP0rQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh81xx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 16:42:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88551591365so1429537b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 09:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790786553; cv=none;
        d=google.com; s=arc-20260327;
        b=G4JZq6Q5k2nu7sKSLPcC45iQqepSv1LmwlXmzyp558J5ZIZzuS3A58x4nBlXQk7w9Q
         M/rfG3Uck3WzyUQrDUGI1OVuoCbmDmCl5eg1vRyAl1ZS2J5TLQvH5hb0x6xVoZm2YsoI
         +yzk9wmy8GIcuKMD7jq/bIbSL8gZcMuKpA0dBJrovxhhCAdDr3HKPVWbgljmzEe5ObKi
         GnvsFTK5tmd6zpmhfqmjZi6hmb/MadIqPInRdF9HJLNukDxI7623iqVZJkKQ1P6+IrvC
         U9OffjvlNz4/W+gIXgFAtHSXnL5LuitKGhZJi8m4/jBFlX/esAZrEaSIxITbhPdd3vaa
         tblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=;
        fh=dE5MhHTmZBRu+IAAJan4uy4Zbf6pYoxxxLpCwcE+04E=;
        b=fZaofdALVJ9bz2Oj1DSkUPxlW/EwWdyIIXSBvoaBaUVZsPxmUkuSsyaHXNy/qMQJ42
         c0b58kNVewJS3EBfWBCe3c75oEsTaYuTHxJ3rz9I7vOInQo9gS3nWoK/gEZFI16Uz7V9
         k785MiU7fIPLBFf709PjHVJnxw7YG7Fif4Np5W5MnU+mkIn5mMGptssPYu+vEJ/uuI87
         DiveFn0qGAtuErMzdiHLldFmsPC0ScutBvykFwGBLbXrq3o272a+cZziveE8DXfdRXrc
         UWU+M2ktEXK4nGd7VTX30g9MGSGvD/J3kVK0eMQVm5kzdlHqv8N4rrandwLcAix2dpyk
         Hk/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790786553; x=1791391353; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=;
        b=QuGv9B0qHqMvGg1zwrnqKEJmkJwPhuvOBaxg624+P3wXvXcUjXhMXmhTc9DrJy1Kcd
         ea+10nS/bcRyO9m7Tr3Ea5oTp1ttACrZsnSO+dKMcUytSU3wclKi229n2CaGUfcx7iAl
         Z8mPG8FuGGuvvdXqKVriZJq7DbkMJ1LzTJGFS708z2mopW1Ecj7mrpyqKQysbNNgT/dr
         64L9oIEz8aCDOaCwgTlDj9+2d68AJcaHrfI2Zf8VjjnU2XZkq0NYkYglTCHf53ZDfU6Q
         fnARUDQlVzMeVcuMH/DHBtNsk2uXeRjmL0DzYAOESNdZ5OUjeh7SlMClq4oXHzDsGTy2
         0/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786553; x=1791391353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUM7uZQADhHABqd68so1Mp99N+E0onvzt7ltNYA+wn8=;
        b=Sm3k6tEZC2jldQlntTuChygIjwVFlSMkkGIEyOBO09cH7S0TiyIfgqgSLE+vq3kslU
         ipjN3oU4uI8IesTCCKbWcNt7Z+bowspzi8y8Vr3qJHqSYiADF3hGDuZjRg1LJ9gKuBFU
         G0nkHsK7B77HhZj9DrdI9SKuwu7vGD38xMgrgOWI63pcGvx8rYKFuu3SSZOEd1XX4kYr
         Uv2xzS4587BhoR4pzDR76ymrClWaIgu+Xztc3Cfh7nPveYszbeJ5umCnUj9vu9OQ7otG
         RcwD7FLRwnSOnToxYObuxJHy0Q4UKrnHaU0v+/0YjOyuE3f+nu4Wu5B6ag7242rwsS1E
         2D+g==
X-Forwarded-Encrypted: i=1; AKwUvBwsiA6kB9NFVhWwrzIeawnYkzs8vxHztM556A1MOODzTSgZ9/ZyvI49MUlmTrQhP2BoTuExtAhcXEW0uw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLkgUZhA4XSFiXIUkAHfEkQRb5fyWP9xHdgTLaMKK3zb/2iEhnd
	v978dSVt5y2TPUW44aVwLAqvPQEH+T0oqkvNiusKuyXL0VX3JXFkECrxO7Uuck641PJ6345iDwo
	Ua2zWOPKY+lYoVbm+4fuJ+b+6VVVHkp6S8nHgGeB9d4OKtBfrDKS67ZE4Z6evZiGTPyyDI0YrcS
	3jQxerb2mHUqVOilnxnZlOojSRSaKj5j03NxIhL80b7r1pQVs6/+UBgA==
X-Gm-Gg: AYBFou2s+2lirerYkmMX/YPh42jTdagCU0D1BRSvQB+F0Ti8/9HCYqlhyYB4seVGcrI
	91wSDptc6ykh9vgQ5hbk/QqDWcHzMpUNqJxVF+WIj8KPkyBeS7HJtSHDJo7lhXvIVHwBnZJveII
	jfO75YZR9C1Dm+8t/0oY2t9ln3AmDzQIoUEPUPFRQgQWNwDRlbPtnG5sSHB7982e6PGSXTYOlAC
	cYGnyeCE6fDeCelew==
X-Received: by 2002:a17:90b:3c82:b0:3a4:9462:5a69 with SMTP id 98e67ed59e1d1-3a4f3512faamr135086a91.21.1790786552863;
        Wed, 30 Sep 2026 09:42:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3c82:b0:3a4:9462:5a69 with SMTP id
 98e67ed59e1d1-3a4f3512faamr135035a91.21.1790786552126; Wed, 30 Sep 2026
 09:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com> <CE261C82D3A29A3C+1dca40d8-c022-4120-a3a3-a812a34cffef@linux.spacemit.com>
In-Reply-To: <CE261C82D3A29A3C+1dca40d8-c022-4120-a3a3-a812a34cffef@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:12:20 +0530
X-Gm-Features: AclHuK8WzaQHu8Kb1U17BIo3W2WEuj4Y3xTSWnhwaShvCMytjWvQEe1KjMXTQoA
Message-ID: <CAHuiULBK9wawyubGsqJPSjDdtP2=qDG6RU9_asB_6VX=r=-5zw@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NiBTYWx0ZWRfX47uEC/MIyaMj
 7SJph9MaEJ6J390ltnLqvzcq+RYRT1e70J0qldjTblH/QFDBfXJza13VcT1P3e6KJoT3rBky1RU
 oOcxM7q0ezt/LWABjg5Y3q2ZwK0Krm+t0I+7/ayRkytpr/6bjZaPpklhwpSBf3RE7gbN1zTD58/
 DEB4vbHd2JT1tGIILzvJx8IDfx4d5RbZEjuBFHoZS9/Qe7u3AlJpkJhDysupNqY2PL2djkys75D
 CEkC58ohZrNzRwV6keRReDVE8aDUua65uQZ9k1vqCPhmHjqSFHUhgvdIfw/V0TNC7cMi1WzKcfa
 gXUOkwAiEd347fI0a5i1VSNs9oIfTHZkmDXYWLLOYmMQ2n/kf8dZTcKrFqf5/LLwbRNBsGPQeza
 zDy2nWxRGPHZFxra3X0TqSiMvmfM8CjXEpLGPiwlmNl5V900NYkMeDZDc8N/bii8ffJpObEQ6oc
 uyUHqJdsE3Zllof9jBg==
X-Proofpoint-ORIG-GUID: 9SvOfJcYayAGYI82fFVFMzFh3f0QhHNO
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd3bf9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=lv0vYI88AAAA:8 a=HrkiEsUUJrMWRHDLxzcA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: 9SvOfJcYayAGYI82fFVFMzFh3f0QhHNO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NiBTYWx0ZWRfX+m3W6Aj/u0JR
 F/6IZbPix/FTKP+cXgm0evE6D92Fyn/+KZhXlcdUHoe5Ngi3A4GhWV1/QLA0RduyrO7LLVdfoFz
 uJpTRsDp4N//tdaFcDUeX+qPFOt3Xbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_094234_350812_60D0ECDA 
X-CRM114-Status: GOOD (  19.63  )
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

SGkgWmFuZSwKCk9uIFdlZCwgU2VwIDIzLCAyMDI2IGF0IDc6MTDigK9BTSBaYW5lIExldW5nIDxs
aWFuZ3poZW5AbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+Cj4gT24gOC8xMC8yMDI2IDEx
OjIyIFBNLCBNYXl1cmVzaCBDaGl0YWxlIHdyb3RlOgo+ID4gK3N0YXRpYyBpbnQgcnZ0cmFjZV9y
YW1zaW5rX3NldHVwX2J1ZihzdHJ1Y3QgZ3RyYWNlX2NvbXBvbmVudCAqY29tcCwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJ2dHJhY2VfcmFtc2lua19wcml2
ICpwcml2KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKnBkZXYgPSBjb21wLT5wZGF0
YS0+ZGV2Owo+ID4gKyAgICAgdTY0IHN0YXJ0X21pbiwgbGltaXRfbWF4LCBlbmQ7Cj4gPiArICAg
ICB1MzIgbG93LCBoaWdoOwo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAgIC8qIFBy
b2JlIG1pbiBhbmQgbWF4IHZhbHVlcyBmb3Igc3RhcnQgYW5kIGxpbWl0IHJlZ2lzdGVycyAqLwo+
ID4gKyAgICAgZ3RyYWNlX3dyaXRlMzIoY29tcC0+cGRhdGEsIDAsIFJWVFJBQ0VfUkFNU0lOS19T
VEFSVExPV19PRkYpOwo+ID4gKyAgICAgZ3RyYWNlX3dyaXRlMzIoY29tcC0+cGRhdGEsIDAsIFJW
VFJBQ0VfUkFNU0lOS19TVEFSVEhJR0hfT0ZGKTsKPiA+ICsgICAgIGxvdyA9IGd0cmFjZV9yZWFk
MzIoY29tcC0+cGRhdGEsIFJWVFJBQ0VfUkFNU0lOS19TVEFSVExPV19PRkYpOwo+ID4gKyAgICAg
aGlnaCA9IGd0cmFjZV9yZWFkMzIoY29tcC0+cGRhdGEsIFJWVFJBQ0VfUkFNU0lOS19TVEFSVEhJ
R0hfT0ZGKTsKPiA+ICsgICAgIHN0YXJ0X21pbiA9ICh1NjQpKGhpZ2gpIDw8IDMyIHwgbG93Owo+
ID4gKwo+ID4gKyAgICAgZ3RyYWNlX3dyaXRlMzIoY29tcC0+cGRhdGEsIDB4ZmZmZmZmZmYsIFJW
VFJBQ0VfUkFNU0lOS19MSU1JVExPV19PRkYpOwo+ID4gKyAgICAgZ3RyYWNlX3dyaXRlMzIoY29t
cC0+cGRhdGEsIDB4ZmZmZmZmZmYsIFJWVFJBQ0VfUkFNU0lOS19MSU1JVEhJR0hfT0ZGKTsKPiA+
ICsgICAgIGxvdyA9IGd0cmFjZV9yZWFkMzIoY29tcC0+cGRhdGEsIFJWVFJBQ0VfUkFNU0lOS19M
SU1JVExPV19PRkYpOwo+ID4gKyAgICAgaGlnaCA9IGd0cmFjZV9yZWFkMzIoY29tcC0+cGRhdGEs
IFJWVFJBQ0VfUkFNU0lOS19MSU1JVEhJR0hfT0ZGKTsKPiA+ICsgICAgIGxpbWl0X21heCA9ICh1
NjQpKGhpZ2gpIDw8IDMyIHwgbG93Owo+ID4gKwo+ID4gKyAgICAgLyogU2V0IERNQSBtYXNrIGJh
c2VkIG9uIHRoZSBtYXhpbXVtIGFsbG93ZWQgbGltaXQgYWRkcmVzcyAqLwo+ID4gKyAgICAgcmV0
ID0gZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChwZGV2LCBETUFfQklUX01BU0soZmxzNjQobGlt
aXRfbWF4KSkpOwo+ID4gKyAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPiA+ICsKPiA+ICsgICAgIHByaXYtPnZhID0gZG1hX2FsbG9jX2NvaGVyZW50KHBkZXYsIHBy
aXYtPnNpemUsICZwcml2LT5zdGFydCwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICBpZiAoIXByaXYt
PnZhKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICsgICAgIHBy
aXYtPmVuZCA9IHByaXYtPnN0YXJ0ICsgcHJpdi0+c2l6ZTsKPiA+ICsgICAgIHByaXYtPnByZXZf
d3AgPSBwcml2LT5zdGFydDsKPiA+ICsgICAgIGlmIChwcml2LT5lbmQgPD0gc3RhcnRfbWluIHx8
IHByaXYtPnN0YXJ0ID49IGxpbWl0X21heCkgewo+ID4gKyAgICAgICAgICAgICBkbWFfZnJlZV9j
b2hlcmVudChwZGV2LCBwcml2LT5zaXplLCBwcml2LT52YSwgcHJpdi0+c3RhcnQpOwo+ID4gKyAg
ICAgICAgICAgICBkZXZfZXJyKCZjb21wLT5kZXYsICJETUEgbWVtb3J5IG5vdCBhZGRyZXNzYWJs
ZSBieSBkZXZpY2VcbiIpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsg
ICAgIH0KPiA+ICsKPiA+ICsgICAgIC8qIFNldHVwIHJhbSBzaW5rIHN0YXJ0IGFkZHJlc3NlcyAq
Lwo+ID4gKyAgICAgaWYgKHByaXYtPnN0YXJ0IDwgc3RhcnRfbWluKSB7Cj4gPiArICAgICAgICAg
ICAgIGRldl93YXJuKCZjb21wLT5kZXYsICJSYW1zaW5rIHN0YXJ0IGFkZHJlc3MgdXBkYXRlZCBm
cm9tICVwYWQgdG8gJXBhZFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgJnByaXYtPnN0
YXJ0LCAmc3RhcnRfbWluKTsKPiA+ICsgICAgICAgICAgICAgcHJpdi0+dmEgKz0gc3RhcnRfbWlu
IC0gcHJpdi0+c3RhcnQ7Cj4gPiArICAgICAgICAgICAgIHByaXYtPnN0YXJ0ID0gc3RhcnRfbWlu
Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgZ3RyYWNlX3dyaXRlMzIoY29tcC0+cGRhdGEs
IGxvd2VyXzMyX2JpdHMocHJpdi0+c3RhcnQpLCBSVlRSQUNFX1JBTVNJTktfU1RBUlRMT1dfT0ZG
KTsKPiA+ICsgICAgIGd0cmFjZV93cml0ZTMyKGNvbXAtPnBkYXRhLCB1cHBlcl8zMl9iaXRzKHBy
aXYtPnN0YXJ0KSwgUlZUUkFDRV9SQU1TSU5LX1NUQVJUSElHSF9PRkYpOwo+ID4gKyAgICAgZ3Ry
YWNlX3dyaXRlMzIoY29tcC0+cGRhdGEsIGxvd2VyXzMyX2JpdHMocHJpdi0+c3RhcnQpLCBSVlRS
QUNFX1JBTVNJTktfV1BMT1dfT0ZGKTsKPiA+ICsgICAgIGd0cmFjZV93cml0ZTMyKGNvbXAtPnBk
YXRhLCB1cHBlcl8zMl9iaXRzKHByaXYtPnN0YXJ0KSwgUlZUUkFDRV9SQU1TSU5LX1dQSElHSF9P
RkYpOwo+ID4gKyAgICAgLyogU2V0dXAgcmFtIHNpbmsgbGltaXQgYWRkcmVzc2VzICovCj4gPiAr
ICAgICBpZiAocHJpdi0+ZW5kID4gbGltaXRfbWF4KSB7Cj4gPiArICAgICAgICAgICAgIGRldl93
YXJuKCZjb21wLT5kZXYsICJSYW1zaW5rIGxpbWl0IGFkZHJlc3MgdXBkYXRlZCBmcm9tICVwYWQg
dG8gJXBhZFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgJnByaXYtPmVuZCwgJmxpbWl0
X21heCk7Cj4gPiArICAgICAgICAgICAgIHByaXYtPmVuZCA9IGxpbWl0X21heDsKPiA+ICsgICAg
ICAgICAgICAgcHJpdi0+c2l6ZSA9IHByaXYtPmVuZCAtIHByaXYtPnN0YXJ0Owo+ID4gKyAgICAg
fQo+ID4gKwo+ID4gKyAgICAgLyogTGltaXQgYWRkcmVzcyBuZWVkcyB0byBiZSBzZXQgdG8gZW5k
IC0gbWVtX2FjY2Vzc193aWR0aCB0byBhdm9pZCBvdmVyZmxvdyAqLwo+ID4gKyAgICAgZW5kID0g
cHJpdi0+ZW5kIC0gcHJpdi0+bWVtX2FjY193aWR0aDsKPiA+ICsgICAgIGd0cmFjZV93cml0ZTMy
KGNvbXAtPnBkYXRhLCBsb3dlcl8zMl9iaXRzKGVuZCksIFJWVFJBQ0VfUkFNU0lOS19MSU1JVExP
V19PRkYpOwo+ID4gKyAgICAgZ3RyYWNlX3dyaXRlMzIoY29tcC0+cGRhdGEsIHVwcGVyXzMyX2Jp
dHMoZW5kKSwgUlZUUkFDRV9SQU1TSU5LX0xJTUlUSElHSF9PRkYpOwo+ID4gKyAgICAgbG93ID0g
Z3RyYWNlX3JlYWQzMihjb21wLT5wZGF0YSwgUlZUUkFDRV9SQU1TSU5LX0xJTUlUTE9XX09GRik7
Cj4gPiArICAgICBoaWdoID0gZ3RyYWNlX3JlYWQzMihjb21wLT5wZGF0YSwgUlZUUkFDRV9SQU1T
SU5LX0xJTUlUSElHSF9PRkYpOwo+ID4gKyAgICAgZW5kID0gKHU2NCkoaGlnaCkgPDwgMzIgfCBs
b3c7Cj4KPgo+IFN1Z2dlc3QgaW50cm9kdWNpbmcgZ3RyYWNlX3JlYWRfcGFpci9ndHJhY2Vfd3Jp
dGVfcGFpci9ndHJhY2VfcmVsYXhlZF9yZWFkX3BhaXIvZ3RyYWNlX3JlbGF4ZWRfd3JpdGVfcGFp
ciBBUEksClRoZXJlIGFyZW4ndCBtYW55IHBhaXIgcmVnaXN0ZXJzIGluIHRoZSBzcGVjIG91dHNp
ZGUgcmFtc2luayBzbyBJIGNhbgphZGQgdGhlc2UgQVBJUyBmb3IgcmFtc2luayBvbmx5LgoKPgo+
IFRoZXkgc2hvdWxkIGJlIHVzZWQgZnJlcXVlbnRseS4KPgo+ID4gKyAgICAgaWYgKGVuZCAhPSAo
cHJpdi0+ZW5kIC0gNCkpIHsKPiA+ICsgICAgICAgICAgICAgZGV2X3dhcm4oJmNvbXAtPmRldiwg
IlJhbXNpbmsgbGltaXQgYWRkcmVzcyB1cGRhdGVkIGZyb20gJXBhZCB0byAlcGFkXG4iLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAmcHJpdi0+ZW5kLCAmZW5kKTsKPiA+ICsgICAgICAgICAg
ICAgcHJpdi0+ZW5kID0gZW5kOwo+ID4gKyAgICAgICAgICAgICBwcml2LT5zaXplID0gcHJpdi0+
ZW5kIC0gcHJpdi0+c3RhcnQ7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsK
PiA+ICt9Cj4gPiArCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
