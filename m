Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E100B606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hAz7vdfV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvR/sSus;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g2SSrDhX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=veSlw4v/DjZi6kJ2I+xFr4zXm0R11kUm++h1A04KB0E=; b=hAz7vdfVGytupDD3q4Jm7Py7oj
	TpxqIyJsV4P0A3xvgznvNBfKxAcCm2ojEPz+GELWHJmhtRQTdbvHtx+Bey/6UiRUfiZo2sMYzBCy+
	0LGLPEp+xmK/QHwrQIGUZQhC3NtgJw2+btCxaoiidxyve4hrTBAkkQoywU4psQD7Nt/T+H5T9ObG4
	dg0psCFIyNKpoUvAYVj7er3j6EsMwe/tqV6W0vU8MhOaJILZYO/HyFPMunrIM5M31xPlOZBkb2XWW
	IecThof35PKvw++teEteXkt6j62eGvsYS9k7uHx6hjh9pWU2UhZCh+W4iuKsC0diRWT+/Qcu7oq7O
	OYRgbW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeYE-00000008oql-38Ol;
	Wed, 18 Nov 2026 12:14:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeYB-00000008oq3-1C4A
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 12:14:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkjpd156812
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 12:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=; b=SvR/sSusgAAfN746
	9UFnReufWOyWMyRHTAn6lQBClvNKkHfcuIA2GyAVMtuRCSGj1l/c+feTFDvbPPdU
	uNJEaiazG0AExTQsU4QZ3Xr1JWPyN0A+Jv/YSV2jUhuNi1m379pxfFpIWUqgshei
	08RdiyGdWidPf1BMt9lgn+LK74AU6DVwdtWLYGvEkAHYhmhEXGlkjkdIEPMBhdw9
	rMkIBeN/HkFJxrVMYJX9AaqjZikGD0HSJwIDJfEotz0/K4aifQF5EJEyewlB7HXw
	xJ7q4phJ6PWjkSvhzXDzHu4O8mPDe2QgmOg/p4jPgThN9XV1ydsPhI9mEwLyLniy
	cYfqfg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jw98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 12:14:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so912465b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 04:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795004045; cv=none;
        d=google.com; s=arc-20260327;
        b=Ey5bJX2HeQlW2tlii18zJyVnJlw9mzl+DT/Cn6SbPoAvt99IoURTp8GYmRgJhEG6Ze
         y0T11EDsRpLMux1Z12KMCKX2Q5E+Pi/ScfUw1y9riBeBDhnsrk8+ECw7UD1TmSCcm13K
         5i6XjXNCf6r/HyIIHDtYPsVwso01k3zXgFsieqGJt5IxjxL144F2MCiCXpkeACURJSkr
         q3RFcYYSUCtNcfWU45YyiI8tZ5kXZP6L+soZ32IE5cCzRbZBsfUMXFipylgJbrSv3fju
         IQrjBDDoE1UIeEdWLyip2p2ztDFuyPZjhclOGXL/70xHNhFIxNUuDmgTKWp29s4txq65
         GBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
        fh=O8FICsVjOMvmjFgWGpZ4q9IX0nnAxuU4su/j7+F5uDw=;
        b=jQ61QTNdhG43AqwdzD3LslqwNFNGLLDJUVuCCgbEU3HaE6CzL9XCTFwWx/k/Uf3Pa7
         99Xd/7hp/Zt86R6yO74dupkt4Y1OlQJyb+zPeW23liRldIO85raFIv7OanRimbbXJCOK
         jwoumCTjuXmor+qyxyw7cuTwjlZ30CoszR34w1GzsOvAkCRHiLaeUan5w7+UdoRr1TgG
         lrZJUXZt7vbCVU2gACyEQx+sr4mym1fMS2Smy8paAEduIrFj49FiCORkRtbMDXqejI7B
         U9Y76+Zc1rvEpJB921Cl3KsNF1sUM+q83qD7NWdQpil9vUG2R4QBeQSIfgDlbv6pXY+w
         K4DA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795004045; x=1795608845; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
        b=g2SSrDhXCbo9u1IC4UjGO6DZhUgrXBrVcmuxsat7O57WueqXe3/IarIyYUWtXunvZf
         TvQIUTQBulh+VSfHugzJX+VOujVbGxZRv8UdLY0hkKtZdfJ/qsRNyqOzlzdwFZQrtCq3
         7Tbh72y7eq6fu+cyX/ROxXcuK8gJhlRSk8irzUe/0lDv333Bb+e64UJwHHnsgIg7kXjW
         Hk492hPr7FaGShkRtH7bmp7IRybB/qhsReiX1AnZsVy12LmdokfYLifNTZU7YcJh3YxB
         JTZp8dB4Xu8fxmpVp4U7V2dMHsgJnCrD9oqPeI4hdvG/4KRjViBlYEQRRHEMCaEPtZT3
         9XKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004045; x=1795608845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
        b=qN52Sn4LM6TUzzEyp7UsOHsLqmzkTabdMOneZmx7jTAikQ4rwZyUmiEfV0c8TcT6DS
         TSy9jREoePB7JjjivSUaqAWVbGQ6QLQOt7CzZX6nedxWsTmmyFRgtHrezTzYLS4xH41p
         7wnAk/KkCAx56VngIAhbVn/GvzsZJ1zVa4HUtgXxp4coBFSAnsg/0YJ1U1CHK1Nco9AU
         OtWbYf8hy89aGCVuG+Lfyk3h2FEui7v8128zkLCUjZ5+fBytNez04KobqPjyJEslB6A8
         pJoevpKqgcG+6A5/CAte07pU5VePWSssLkOnjm5b0Sbb0Rjve5ppbHDRu+qYUSLE74rD
         IOJQ==
X-Forwarded-Encrypted: i=1; AL+hErHTJwEfm5zRO/osLI3IxLvD23tv+FS4ReF4/KdZe7Ep7ms0uFaN01K/VlgcTmTohiYI4jiOCFPaZWnGSg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+IdNl8A8+wVrL0unttl+PQijoHCDWOoEFWUCipZDALD++aBaf2
	hLpTJtadeyJrgVp74g870rmvScyqHgXKXYAoKhGuTkUNAuCdlfwWZ4nAIACOMFRnq8bo11UmW3Z
	y4w490WW39kmKOgbkSKegjbzHI1NhMnI72eNHR0bBWZATKkUsBk9Bv9jt4ZUlv56hpsP7XsjbU5
	HM3KPlfouOWpRSnuRsUdORyP+vfp+HRgrpbv+CSRpOWXpELw==
X-Gm-Gg: AYBFou2WLIiS1h4QT39Jge6vOEeGX/K4cDLmo+GnovS6VHPK82a3rSdR+SsDai7Zca2
	AP3xZnMcVztrT+KLwiNyqQ/0cuAk6MYGdlrw8WW+vN5yKfvavQEiwh0p49o2598MpTgYKFv5igK
	VoU6dCbt5tRNrhhoFH9J5Jj/+LMTy1KyUfaKHKmmMKmwDuQn8/9Q2uYrLIqdQ=
X-Received: by 2002:a05:6a00:aa05:b0:89e:71df:d6d5 with SMTP id d2e1a72fcca58-8c5d363803dmr2099220b3a.10.1795004045341;
        Wed, 18 Nov 2026 04:14:05 -0800 (PST)
X-Received: by 2002:a05:6a00:aa05:b0:89e:71df:d6d5 with SMTP id
 d2e1a72fcca58-8c5d363803dmr2099197b3a.10.1795004044909; Wed, 18 Nov 2026
 04:14:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
 <41B3F89514935AAF+5c08fd7d-1cfb-428c-9ef8-035fa3910bd6@linux.spacemit.com> <17FBF8B3DEC33669+55643c4c-b5ae-4ac3-bb2c-a1653c3a6972@linux.spacemit.com>
In-Reply-To: <17FBF8B3DEC33669+55643c4c-b5ae-4ac3-bb2c-a1653c3a6972@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:43:52 +0530
X-Gm-Features: AclHuK_lmH3PRq6DteQT9bsd-ifWG5c7o_benTjtIXtrCBUSK48qIpxC1_u9aYc
Message-ID: <CAHuiULCf7RF07G8Nzgt6ZS0deWxMrBenWf9BaD615fLtwOzobw@mail.gmail.com>
Subject: Re: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
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
X-Proofpoint-GUID: YeXyKvdRI5fiLqeplVWYBDj0fpUP6HPg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXwGY+xam3zeZA
 NiSjTS02sl//eghKyU9/2i6ZkJx4/HmSLKUwtnpHlb3J01WnY6ZZqT2aKm+NfGfGOaDSl1wGoHA
 yW3Gu7g7f2Nrqt1UEKoW52Qbg4D2CPY=
X-Proofpoint-ORIG-GUID: YeXyKvdRI5fiLqeplVWYBDj0fpUP6HPg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXxKDaXUrAMgYv
 4QYZ8rsGVqb7xb5/GRvbHP1ZyhnMg3kAYauF+NtUW8eKuHvYlwS20pzElRQ3YJ63pczPsx9h34u
 XHB9GYG+nNUM9zAX44FgE5B9e/scUDkZ11LQZ6v8DhLGyXQ/OI06IxjH0WJ8Sb8Mv978NDDOVg9
 UqSi/7FTsw6HobHYXVBsQnoe+fngIE4LUx2ScEM2Ffil9g43J0XopDwU4Z8wOT/GrYX52SVzp5i
 nMyxwugyM1vB2oIPS11Bqzr3jKHpFLRxZrLCmOwOhFyjp2wMzKwctkNiRx/I/k5aYXJGewJN/vA
 u5XzqlnvRWh+gT86WQfDOs3++AGcxEKa77tPANgWWsooJBkei/BPCJeoahd1aqn8zjAFMw0lWkl
 0xfj4Ag7sOOjLCSQSHs567wKozwuPQmMbPX797s+k+2+UeAu1Pcwn4sdvsAyrQqEIcMpw4BYuTg
 56wsfigXIXwBSCpvmKQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd968e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=lv0vYI88AAAA:8 a=WaSwiR3hT_GFvAymbGwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_041407_441596_51E5C98A 
X-CRM114-Status: GOOD (  15.41  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgWmFuZSwKCk9uIFRodSwgTm92IDUsIDIwMjYgYXQgMTI6MznigK9QTSBaYW5lIExldW5nIDxs
aWFuZ3poZW5AbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+Cj4gT24gMTEvNS8yMDI2IDM6
MDAgUE0sIFphbmUgTGV1bmcgd3JvdGU6Cj4gPiBPbiAxMC8xLzIwMjYgMToyMiBQTSwgTWF5dXJl
c2ggQ2hpdGFsZSB3cm90ZToKPiA+PiArLyogSGVscGVyIHRvIGFjY2VzcyBzdGFydCwgbGltaXQs
IHdwIHBhaXIgcmVnaXN0ZXJzICovCj4gPj4gK3N0YXRpYyB1NjQgcnZ0cmFjZV9yYW1zaW5rX3Jl
YWRfcGFpcihzdHJ1Y3QgZ3RyYWNlX3BsYXRmb3JtX2RhdGEgKnBkYXRhLCB1MzIgbG93X29mZikK
PiA+PiArewo+ID4+ICsgICAgdTMyIGxvdywgaGlnaDsKPiA+PiArCj4gPj4gKyAgICBsb3cgPSBn
dHJhY2VfcmVhZDMyKHBkYXRhLCBsb3dfb2ZmKTsKPiA+PiArICAgIGhpZ2ggPSBndHJhY2VfcmVh
ZDMyKHBkYXRhLCBsb3dfb2ZmICsgNCk7Cj4gPj4gKwo+ID4+ICsgICAgcmV0dXJuICh1NjQpaGln
aCA8PCAzMiB8IGxvdzsKPiA+PiArfQo+ID4+ICsKPiA+PiArc3RhdGljIHZvaWQgcnZ0cmFjZV9y
YW1zaW5rX3dyaXRlX3BhaXIoc3RydWN0IGd0cmFjZV9wbGF0Zm9ybV9kYXRhICpwZGF0YSwgdTY0
IHZhbCwgdTMyIGxvd19vZmYpCj4gPj4gK3sKPiA+PiArICAgIGd0cmFjZV93cml0ZTMyKHBkYXRh
LCBsb3dlcl8zMl9iaXRzKHZhbCksIGxvd19vZmYpOwo+ID4+ICsgICAgZ3RyYWNlX3dyaXRlMzIo
cGRhdGEsIHVwcGVyXzMyX2JpdHModmFsKSwgbG93X29mZiArIDQpOwo+ID4+ICt9Cj4gPj4gKwo+
ID4KPiA+IENvdWxkIHlvdSBtb3ZlIHRoZXNlIGhlbHBlcnMgaW50byAiaW5jbHVkZS9saW51eC9n
dHJhY2UuaCIgYW5kIGltcGxlbWVudCB0aGVtIGFzIGdlbmVyaWMgQVBJcwo+ID4gKGUuZy4sIGd0
cmFjZV9yZWFkX3BhaXIsIGd0cmFjZV9yZWxheGVkX3JlYWRfcGFpciwgZ3RyYWNlX3dyaXRlX3Bh
aXIsIGFuZCBndHJhY2VfcmVsYXhlZF93cml0ZV9wYWlyKT8KPiA+IFRoaXMgd291bGQgYWxsb3cg
dGhlbSB0byBiZSBlYXNpbHkgcmV1c2VkIGJ5IGZ1dHVyZSBjb21wb25lbnRzIGxpa2UgQ29yZXNp
Z2h0Lgo+IEJ5IHRoZSB3YXksIHBsZWFzZSBwYXNzIGJvdGggfGxvd19vZmZ8IGFuZCB8aGlfb2Zm
fCBhcyBwYXJhbWV0ZXJzIHRvIGhhbmRsZSBub24tY29udGlndW91cyByZWdpc3RlciBvZmZzZXRz
LgpZZXMsIEkgd2lsbCBkbyBpdCBpbiBuZXh0IHZlcnNpb24uCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
