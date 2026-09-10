Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E301C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0habo5Yd4u09BLSfWDnxRksdeeVHzpUoFwC/uVjkVU=; b=i5QVvsvm4aY6/e
	aPVOqiA7aGNVSevGrOv2HxgppYbF+S43o6I74bENNYDPo+w01aVYnoaxggH6uaWGM3FTeQdlsBC/Y
	WaH/MAVhp26UExm4E0do62JmHGfl2NSTuPGjJx1rzdIEtvkBTzYP+g5V8DdYHO5cruVeqXdzUUr3g
	HupVmDYu/tb/ND0irdVjugML+NnvjIMJE1lhbcbzpAa+uc+ncYojETMCsRFL4VuAMQWM/aV9tJ/L3
	IKBQoVaEmXWAbpVRnpJt0o937Vs/UxJ88iQ6I2zxGE1ykTinhYfABQafhiZIrM/3j1IQGRzq3j4dV
	Uoyofm7PtrgF4A+SP0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bOq-0000000DvnQ-0otf;
	Thu, 10 Sep 2026 09:48:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bOm-0000000DvlZ-2h1y
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 09:48:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q9RR1001496
	for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 09:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=; b=F4KnF94ThZPlCPXB
	ELuACDM7vfX4nzSaDQPZ2nwfPYa2kiethzdgojbYncp/GJlM1PpgA8MVhziljHN0
	BMbRolZ5FAeZf0jub24aO0L3T9DtkEcfIEALAv0acWO/t1wPgcEvOs2sWoRn+Aap
	biHeqtD079eamRlmvVsXGYHa8r81KTcGP2nxsCgF4ukpAjn2rsbbARgaSROcSUJK
	LQtnlrO4tNxIrr74DK8xfSTLUlzJcbwUarRsEBHldvcrGARMsOxRqzMQfIJLLWeL
	nxhu+fhvZkFKfTrgJKhnQ7en80JXJF6QQ+mGHAEc0W01WGcqVlzJZWR84QN/6KrO
	PYr4dg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvrne3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 09:48:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so6081049a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 02:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789033730; cv=none;
        d=google.com; s=arc-20260327;
        b=lAAFUk+05lq0egT5I2IkgvgzGvgeaU1uN1m4UWjYZfd/LQhfFJz94fB71oA2DBZxBD
         R6Us2AqwShFQz6MAo/c5IhetU734LV7fLyC5f0QKSTCWdkW3VF6++ElCrgkplOcMzYc8
         PMB0r6aw8Md1sXr/O0usa2D0DWy7a+lw4KJtPVHL2TcVRMqpfuymlzMQhiQra/6Myqg7
         GHkBz0XMb/dCuJZRRf7njyBfejxMLU1SDOv1qcxny8TYymdEkCmRvD5B8FzB1Rp9/Qwt
         vAnh4d3AgNQiZEAl66oRedvxmT/E0ZnWu6RnaLVc8TV+yiUJOzGe1AJaG+gTfdcH8bMq
         UJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=;
        fh=eXGIhVY8NVeQPT6jMkTrMgGFdEsyMI6lU5B72FdVyEc=;
        b=KAyt2akP/45fft0GjF93eNVR5yAIulP/iw/YX1+vYd/XT4BPqRdU/tb2MJ48+lcOWu
         o0cayNr3cBIJbzhudQOzDZHm1A9uDXPFHVg8SbUnROaHRku8zldAnGu7VBgQ5j84CAUm
         P+8Rmz98ujNq0N9myMP4Ih9Hi1PdMz+uRb2qTWgNA5f0O30r5OLDvv+0gQhE2rInFViB
         ZscBoxSMwAk0ujznx6Vd7WO6OiAyX4u3AkD7h1SPRA0hf4uNrfwcsoZN+LG5eFcE/rij
         6RQ9hAICI6AT/TvtRcXYCKSYihBmHgFSjUxxYqEU3uTc/VVCgB270N/nHzMYSRA+Y+9H
         OTvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033730; x=1789638530; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=;
        b=Toj+udQnclupYXa91tLfZi8j1ZTTNwNpv9Rls0j3rQ5n2LE7cGTuMNg67EY9JBLpJj
         Hy8FYSrahrWE7ryDoHFBGeAiZSL9Slq+ykYRB8E3ymEHFxLYas8/xFEC9BR64ZHGEwqG
         oA1+OciI71IKSnHXji7BCCsMXPa6IdYROFFF9e0W+QcucnGaEIizgRskdRT99cjcmjjL
         LyoUCxjtLJA0/wq3s5zO6wytlwYL/2HYw+acPGVVQVtuzfkcS3xWfDw6j3XiofDAAJnj
         /0Fb+yvJja0KvD3coIvZGTPH/OVazd6zl+1xPFcXrPvrYRmgi+fSWjMcRg8ZfSwZxCrp
         FtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033730; x=1789638530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=;
        b=Bmhx6A49fvMBoKhRp21CyDIJnfOcJJ8bGI26mRTpCkkczTGE+WaQhDHwPBslUOs4NX
         ST0abu1hXgFm0b7kqm2jZ0DPXTRauQNjyMvN2WgYP7JJyYgvs54CAUfPIACDe/Pztlsx
         9Vh0kPmqaOcX5GkDMlabtok0LHGUxldmTbaF2IaAcMS6bmWwUpf3rOjHX2fpbgjqjP+r
         OLUvQshN718/J0JJD5+OiMH7ed7NBGSDHIR7I3Ze31H59w23I9747yoJFA3n8JPmeoJd
         lnUn2vBgU8KeAHxMmYFuRcQ2c26cz0060WuXURafcauvxQ4S2O+Dc+iR/1CS/dM/mmu3
         +wfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEpbbDLDhXrmz3TlxucGcPl3SmGChAx0n/9eOxzkba9aSX5QhwZ7bI+8JV/KpeqFtnGrc8zOmgRxSiBw==@lists.infradead.org
X-Gm-Message-State: AFuF++lZIjQk0r48EAWlC8RGZpHd9IkaCJYd4eozG/G/S8uq2JivK0yH
	4qkL1DClH9uMHq4ErJ3r2v/FsBiXgAseq/oYx2qeF4dR8+o3XpTn3FlnSiooCGgGsxaXRPneqLq
	fm/wxJyvzLaPvRLfNk0suGPgrfXEOcObSZTLO3F/K8xawRP+9OtEh8pOCOsyoYqKqgYc2LJ+X94
	eY+pAGsNH9YeB4UHolRZYv0nCZ84utoME4cYTd1HAOGvBuNAA6wBfF/A==
X-Gm-Gg: AYBFou3aiTNYD83RcHDLoqTU3aaF1KClNykfJKYkPZDX67gjXkYKPA/8V5ULHodXAqn
	1I+HQrAhbGTrq1OSvD0wrNCW/icDtH+a01xYClyfFucHuT6X/e0dc2n8q60+OWrg8IwU6c1NYko
	yjw6RnSqQbQ+s+MUQKWEe/xsJq13mrncTbNku4JaSB5y5iGdVbS42zFX2ncg==
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d70c2f16emr9938814a91.24.1789033730201;
        Thu, 10 Sep 2026 02:48:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id
 98e67ed59e1d1-39d70c2f16emr9938760a91.24.1789033729754; Thu, 10 Sep 2026
 02:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260721073612.137259-1-xb@ultrarisc.com> <20260810-imsic-attr-race-v2-1-00ed95ad321e@ultrarisc.com>
In-Reply-To: <20260810-imsic-attr-race-v2-1-00ed95ad321e@ultrarisc.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:18:36 +0530
X-Gm-Features: AcwNN1VtrgITlL2Xz8ROk6p7GYj2cQAUch2tRwnfxZo4Abg2uCG431NY2Z7hSEs
Message-ID: <CABBgwmtrZY_KB+ffy5At3sz4FjOqkePiDwCEsF-pG7ZBJBOxBw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
To: xb@ultrarisc.com
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa27d03 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=Lx1EvxgrAAAA:8 a=W-_n0kkjAAAA:8
 a=BwDWKhTLMd55pYuKsv8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=ZFi1QaP_tuf8dODdgmj-:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX4NGfbOB2tHOs
 Mj0GOot3yNCCb8HA+vZlpFgxiiEueRkZJ/hN6FzHTQNJq65M655XK73n5AyeTnm83t5fXLK+Ir1
 U49caV81bEyrqfUZbOt/barad/cXLcCnuCqWrCz61KIi7/BeJWm/YCF29KJki6z2g4aRTodlqFv
 zJRQvmgWZgfChITleALMz+/LA2XUh6Vvg4HVY3VJHFky0RGXOLrI5fhot/wglW/aS4fEABPxXte
 2WBMyaa1Nqv+fhkOADg3zHq5Hq3O7Cdm7sYgOU9mN6zw0cPKz+c/PqZiw9rUPNZyuKZTcgyNUjO
 pK+4FcZINYqui8vB8dUkVjcm3YfKz5yedMx+FQJZhCHi2ZwL8WORDF88J2r0NAjIOXeBS1IfO9Q
 r2Cf2sTCnuzzlWIm7221ZMIJXN96N/wmyeL9tvbUf/MqZFq7sM+iHsDegtB5N4NVxcvF/C1wo8N
 ll5fvNhh9PNZnjwqRFA==
X-Proofpoint-ORIG-GUID: anRdWglVbiSFn_i0ZNz-a38xogWurOhg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfXyjNbu66+rvLi
 Z9vjflZAWJNmlCzB7S9uTcb582kYzo+TLvUlMgp8ZobnXlkMA84pNPHyu3pllSD2m1aYxdXBGPj
 TdX5s4vLeY0Xn2afq3tMY/eUMa0LOnY=
X-Proofpoint-GUID: anRdWglVbiSFn_i0ZNz-a38xogWurOhg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_024852_795960_AC85696E 
X-CRM114-Status: GOOD (  22.13  )
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

T24gTW9uLCBBdWcgMTAsIDIwMjYgYXQgNjo1MeKAr0FNIFhpZSBCbyB2aWEgQjQgUmVsYXkKPGRl
dm51bGwreGIudWx0cmFyaXNjLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IFhpZSBC
byA8eGJAdWx0cmFyaXNjLmNvbT4KPgo+IEtWTSBkZXZpY2UgaW9jdGxzIGFyZSBub3Qgc2VyaWFs
aXplZCBhZ2FpbnN0IEtWTV9SVU4uIEFzIGEgcmVzdWx0LAo+IGt2bV9yaXNjdl9haWFfaW1zaWNf
cndfYXR0cigpIGNhbiBzbmFwc2hvdCB0aGUgcGh5c2ljYWwgQ1BVIGFuZCBIR0VJIG9mCj4gYW4g
SU1TSUMgVlMtZmlsZSBiZWZvcmUgYSBjb25jdXJyZW50IHZDUFUgbWlncmF0aW9uIHJlbGVhc2Vz
IGl0Lgo+Cj4gVGhlIEhHRUkgY2FuIHRoZW4gYmUgYWxsb2NhdGVkIHRvIGFub3RoZXIgdkNQVSBi
ZWZvcmUgaW1zaWNfdnNmaWxlX3J3KCkKPiB1c2VzIHRoZSBzdGFsZSB0dXBsZS4gQSBHRVQgb3Ig
U0VUIGF0dHJpYnV0ZSBtYXkgY29uc2VxdWVudGx5IGFjY2VzcyB0aGUKPiBuZXcgb3duZXIncyBp
bnRlcnJ1cHQgZmlsZS4KPgo+IFNlcmlhbGl6ZSB0aGUgZW50aXJlIElNU0lDIGF0dHJpYnV0ZSBv
cGVyYXRpb24gd2l0aCB0aGUgdGFyZ2V0IHZDUFUKPiBtdXRleC4gVGhpcyBwcmV2ZW50cyB0aGUg
VlMtZmlsZSBmcm9tIGJlaW5nIG1pZ3JhdGVkIGFuZCByZWN5Y2xlZCB1bnRpbAo+IHRoZSBhdHRy
aWJ1dGUgYWNjZXNzIGNvbXBsZXRlcy4gQWNxdWlyZSB0aGUgbXV0ZXgga2lsbGFibHkgc28gdGhh
dCB0aGUKPiBkZXZpY2UgaW9jdGwgcmVtYWlucyBpbnRlcnJ1cHRpYmxlIHdoaWxlIHdhaXRpbmcg
Zm9yIEtWTV9SVU4gdG8gZmluaXNoLgo+Cj4gRml4ZXM6IGRiOGI3ZTk3ZDYxMyAoIlJJU0MtVjog
S1ZNOiBBZGQgaW4ta2VybmVsIHZpcnR1YWxpemF0aW9uIG9mIEFJQSBJTVNJQyIpCj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBYaWUgQm8gPHhiQHVsdHJhcmlz
Yy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4zLXJjWAoKVGhhbmtzLApBbnVwCgo+
IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBVc2UgbXV0ZXhfbG9ja19raWxsYWJsZSgpIGFuZCBy
ZXR1cm4gLUVJTlRSIHdoZW4gaW50ZXJydXB0ZWQuCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjYwNzIxMDczNjEyLjEzNzI1OS0xLXhiQHVsdHJhcmlzYy5jb20KPiAtLS0K
PiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCAxMSArKysrKysrKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMK
PiBpbmRleCBkMzhmNWRlMDguLjc0ZjUyMGU1NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2
bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTk2
OSw5ICs5NjksMTQgQEAgaW50IGt2bV9yaXNjdl9haWFfaW1zaWNfcndfYXR0cihzdHJ1Y3Qga3Zt
ICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSwKPiAgICAgICAgIGlmICghdmNwdSkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4KPiArICAgICAgIGlmIChtdXRleF9sb2NrX2tpbGxh
YmxlKCZ2Y3B1LT5tdXRleCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVFI7Cj4gKwo+
ICAgICAgICAgaW1zaWMgPSB2Y3B1LT5hcmNoLmFpYV9jb250ZXh0Lmltc2ljX3N0YXRlOwo+IC0g
ICAgICAgaWYgKCFpbXNpYykKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKyAg
ICAgICBpZiAoIWltc2ljKSB7Cj4gKyAgICAgICAgICAgICAgIHJjID0gLUVOT0RFVjsKPiArICAg
ICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOwo+ICsgICAgICAgfQo+ICAgICAgICAgaXNlbCA9
IEtWTV9ERVZfUklTQ1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+Cj4gICAgICAgICByZWFk
X2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4gQEAgLTk5NSw2ICsx
MDAwLDggQEAgaW50IGt2bV9yaXNjdl9haWFfaW1zaWNfcndfYXR0cihzdHJ1Y3Qga3ZtICprdm0s
IHVuc2lnbmVkIGxvbmcgdHlwZSwKPiAgICAgICAgICAgICAgICAgcmMgPSBpbXNpY192c2ZpbGVf
cncodnNmaWxlX2hnZWksIHZzZmlsZV9jcHUsIGltc2ljLT5ucl9laXgsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlzZWwsIHdyaXRlLCB2YWwpOwo+Cj4gK291dF91bmxv
Y2s6Cj4gKyAgICAgICBtdXRleF91bmxvY2soJnZjcHUtPm11dGV4KTsKPiAgICAgICAgIHJldHVy
biByYzsKPiAgfQo+Cj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogYjk1ZjAzZjA0ZDQ3NWFhNjcxOWQx
NWE2MzZkZGYzMjIyMmQ1NTY1Nwo+IGNoYW5nZS1pZDogMjAyNjA4MTAtaW1zaWMtYXR0ci1yYWNl
LTA2NzcyYTA0NDUwZQo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gWGllIEJvIDx4YkB1bHRyYXJp
c2MuY29tPgo+Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
