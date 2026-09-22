Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15BEC982F1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 02:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm1/B9RVE3a/NjpaUUMxPW2I/Ph96NKJnTI290pmPC4=; b=uO6Vue0UMHCe3j
	RD13iiD/hCqC5ND4Fw/xS2fO68/Y8JxkyowCBMndCYchXzKtzyrO5xju2P8xq4Hmo5qGjllt3DWVV
	O2qdYT1OxV+/yqmbwPywhIB2EfNFrFYzzQQ4ERr+s5cMq49JNHrhMw6SzI+y7sTYyxdU4qHrfPIm4
	QvCpX9dZGy3Kyw8jd6bw/YHswOPw3sBqy/ugHOZSgYy7WZKstM7Itx3gZ1rO82TthEvK9ZLyD13jS
	UsrMVVjHRTgdsUo59BHjhNnKnR9DSmHbsvgECVVvw/25PGnPl4ibj0yQSq4deQQSbkgAcLoR4L3Bf
	oSM1ZVUuUTp3uWsPpMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qHa-00000003z9d-0SOb;
	Tue, 22 Sep 2026 02:30:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qHX-00000003z8X-1NHc
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 02:30:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00Dm03840475
	for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 02:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=; b=OmgSqfXtSo9MtmfT
	2zAqToT9hUME0YZ7jll34Ab7i20/Q5mET2GUbb0pqMcDLIvmuxTCoc27nVu2XzII
	yOnX7o+VcZs4tO6G5VCQTW1LuMkflRW2QgYgZanKQD5rNLIyfvsjuKZiMcOudEh+
	WOWou7Pq9+0F/ODvw6S0c0kfwfOcyk8qDfKDIml2lKOf5zTJt8ZEk86hWotjCvqR
	3pT8drqXqcEP/YlWhem/BKG9yIOCfOfvuOaBnfG3GYlhOlWAGiVOGfU3EfH9RGAy
	ybcScBRc0z1DooHEHxr4aplAqN4VYvOHrMX8pUN9P9NGP9kutHQTpbXpKibI+xDd
	EmsLwA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v51tjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 02:30:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a7bb1dd95so584397b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 19:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044254; cv=none;
        d=google.com; s=arc-20260327;
        b=TeaCxCf23h52n7j4nImb9b0emBtm82LS2smlc8gSL+oFfirtCrNB/2epJc/yzuvQva
         AD+Klx24JyMmBCr7ZXTfWp5Xf1YszpNhKrd+KR7KZ39BIkU1QPz0nSMfQXfXzJwZqlOc
         nFRmEerSTZYclgWJDf8qadfxtInJplo033t81DudJPRcWQAqnxUH2KZxpQLi7fnYITOd
         7jsZYXhq87qRvOAnWvh/gZpZqz/Uk/IkIFeIpdmLQWoBTiG8C1hVEckjWavgvA2DrBJs
         /fpt3QV+al77i9MIqkWsQSz1P9OIhLeqqMelb55QY2btwnyjBQ0nid6+RxVnTv1B6uQd
         bk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=;
        fh=eH2E/xySN3WJc9IH9iR7RIsZN1oFcRxHU96wPxgqqHs=;
        b=CLbbhz7mUNy+H8iR3BvWCHXdkVFxoE0ket+9HSPgEWldkdh2FZ+oJ1+2jMTGcvuZGx
         sC/CetxFGjq5QBGpMvZm+dseGbTbJ8TdYsjOQBdkNYOczl8tlknL06rStncrOGQqybKC
         smc2mJkBbPui4IFGoAA7VmZYBDFPLYpfedB1A+a9ydqQ3FOUqzWsJd5yaoW/akkYLcrP
         OhNGC+yoFm3FpwtzeuxfzN2G9ZF8I/VfJbEVmFYYRdhYFd3PiWqzbRHtGXscftohCtWA
         D7U+IhT++WF2vMDcw4FcAjHeaIyicWCha0nCL7DxSinMlMezno0Dhf1YhUDMd+Nk20kW
         jlFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790044254; x=1790649054; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=;
        b=cl9k+lkkXUJ0NCYp2PlnvlkTJGUTQY7z4+2MwqqCZiOQf80UI2fomzCImZUBFuRzjm
         fi/UvaYoQSL9bzL4b8Un8nyBZgHLGZZYcaDp7OqgZFBytkghLDCb1yONqGBWvtGOmTDn
         pFyd7tLDmYbGnT6g6HFKtmVCj8OQ+eT0v3zRpTVtyVHVVbkAfQxqlNhY9BMTI142xb9q
         I1jBZb/uahJkXU6+rlcFvUKWROAtDa0Ltv/8+dEN/YKkgyfqbVRu/D6iFZzPBO27MGJv
         EU6BDKL+65aCAwDFiPam39Nbm6M5jW291CWKb0Z62lGBa8Hk34Ydz2haIxfFOeJZysbK
         DY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044254; x=1790649054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=;
        b=M25WQmteVNgJAYg6KKk9qd2o/cWmF3T6UjCmb92LnGS9awGxgBF4C/6OQ7qB6ZS8dR
         8V7R6EPWywjP3ERvy2gVt3RQOJVAxbDDy8KT9cfFH0JsZH/9to/IVskCNYogKp0Fxxrl
         2opRg0WrSsZSzbSdLMkztHgVLFU8c3OTo0v6VQW0cUN2/7t/V29lTX/56Aj7SdgayL9r
         k8y24tCzdI7rjdze4NlLp+cRhayF0ZchqsSRdcYWxf/CnFBcElH9ieERjRiJWD9Q4lo+
         Ncof8NHZr+l6uC2tG4ESVD8oKB4z0n7O0ka4F3cBeyKqLfvdS/HmDQFo2Mlj/RXf491W
         Svkw==
X-Forwarded-Encrypted: i=1; AKwUvBw4tcR0ied21KqX7arJB4CAzZzFsD4OXHmhJ5bHoSjBy1KZAwKY4BMGJBv5ty3Amhjk2zWCjTCVz7WxGA==@lists.infradead.org
X-Gm-Message-State: AFuF++k+YfYwTDy86kx3TedzISgFmiYbqBw0uJupgL2V0Lj0KjkP1hnD
	JS3F3YeNePiGl02bG09fzYToP4Llbm3DqJmlaKQY3G6aHjz00zQ545ObsgVaERvV/xxA9CERdRJ
	SUl2MCeaobEI04C1n0Nbzh9ceP85nzYmEC99C/aruu5uKqiXPlhlqRbtKGUNC0g+AbTbPCiO4nh
	VL4otNf7PAAvYRbfG3zLa4XXapadd7h47s1m4PSC8BAyEIlQ==
X-Gm-Gg: AYBFou26Re+9oT6VsePLe956rVDaqOiN7PteRYXi6A6Av1jRLSuvRzUvHXogkL3+N6R
	X7J4lBWL721E/XYo7jkso12Vj1FJ1VmJJSdRhfElwxRaYudo2faIxRl83oUcOWdPCUtQFaogPYl
	OtnV9IiX2li023RbW6HUkziwGAhDFUuvvn9CL+yNAOJZrghTTPLKHAG4SwTA==
X-Received: by 2002:a05:6a00:aa05:b0:854:b3d3:8631 with SMTP id d2e1a72fcca58-87bbf47c483mr1080939b3a.12.1790044254195;
        Mon, 21 Sep 2026 19:30:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa05:b0:854:b3d3:8631 with SMTP id
 d2e1a72fcca58-87bbf47c483mr1080908b3a.12.1790044253705; Mon, 21 Sep 2026
 19:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-8-mayuresh.chitale@oss.qualcomm.com> <BA4ECE62CC750889+2da1a0db-8500-4332-8954-e9f126604258@linux.spacemit.com>
In-Reply-To: <BA4ECE62CC750889+2da1a0db-8500-4332-8954-e9f126604258@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 08:00:42 +0530
X-Gm-Features: AcwNN1UY8XV7_aUB93jIu3Bz-IyBK8F8R8tUINGupIRIRT0pG87pNdVga_QmFwY
Message-ID: <CAHuiULDiFB234ev1R8bJKVppj+odtupmr=ic01S3a_HCXnHQeA@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] gtrace: Add function to copy into perf AUX buffer
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Proofpoint-GUID: PIfKEnaF-rrZ7uHvQhIiQAumtlcXapeg
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab1e85e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=lv0vYI88AAAA:8 a=EUspDBNiAAAA:8
 a=G_Gx11oXSWwxtuNH6PoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzMyBTYWx0ZWRfX/uVIrpWYfzWg
 LlDrbs5tUqtPe5NJFKJOd5jmTvGJj1zgmd4u60hNE8LFwwumN+oOmXS7RYjx7k02DU0jXmh04VU
 uC29+3ZuFr85tP10W2cIkJKEOfjOkV8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzMyBTYWx0ZWRfXwB791clUvlfF
 73PT3hZGM0MSx2+tnfZlBKHuxxvQeNv882rClgzOlTu4tBp8weIF7v1EPP3cMdC/QypJj2mZjo9
 pPoN4F0bpVhbPJc1hSCEZVY8PSrS8VFz6kjTSq+FrpByM3hV2la64OcDvQWOatcH7neajQ/uc0y
 1iEKe/x5AhGRJSwnLVSYN7l7Qs/CrUp4sfXEEjJMP4fYsNsvQdc+6kOuTdbI5SCaOevpnXkIHDH
 ZmadVxjSIDGLO02j4X30JwLbCGxYnlyBI0HnJC9NYsih7RKMgThrIK3hfFz4wSsIHQ1Uz6oMwCj
 aan4aYv4jS8X7aROEFt+UkwY+HM4X5llQE7ZMkYdcPTpHFkpO9Kdw3ZX/sUUxeZoFKHEH87Su/w
 hvo/Rqv1lICMHyEDizPkMXpETMmmO5/JkE+fRgxhQW0CAIA1TilagO3m3MB7zqM3rPsAAyxSCSO
 Wh8d0qab7keYbSYX1pQ==
X-Proofpoint-ORIG-GUID: PIfKEnaF-rrZ7uHvQhIiQAumtlcXapeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_193055_381028_7550C33D 
X-CRM114-Status: GOOD (  29.06  )
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

SGkgWmFuZSwKCk9uIFRodSwgU2VwIDE3LCAyMDI2IGF0IDM6MDDigK9QTSBaYW5lIExldW5nIDxs
aWFuZ3poZW5AbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IE9uIDgvMTAvMjAyNiAxMToy
MiBQTSwgTWF5dXJlc2ggQ2hpdGFsZSB3cm90ZToKPgo+ID4gRnJvbTogQW51cCBQYXRlbCA8YW51
cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+ID4KPiA+IFRoZSBSSVNDLVYgdHJhY2UgcmFtc2lu
ayB3aWxsIG5lZWQgYSBtZWNoYW5pc20gdG8gY29weSB0cmFjZSBkYXRhCj4gPiBpbnRvIHRoZSBw
ZXJmIEFVWCBidWZmZXIuIEFkZCBndHJhY2VfcGF0aF9jb3B5dG9fYXV4YnVmKCkgZnVuY3Rpb24K
PiA+IGFuZCBjb3JyZXNwb25kaW5nIHRyYWNlIGRyaXZlciBjYWxsYmFjayBjb3B5dG9fYXV4YnVm
KCkgZm9yIHRoaXMKPiA+IHB1cnBvc2UuCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBNYXl1cmVz
aCBDaGl0YWxlIDxtYXl1cmVzaC5jaGl0YWxlQG9zcy5xdWFsY29tbS5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXl1cmVzaCBDaGl0YWxlIDxtYXl1cmVzaC5jaGl0YWxlQG9zcy5xdWFsY29tbS5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsQG9zcy5xdWFsY29t
bS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2h3dHJhY2luZy9ndHJhY2UvZ3RyYWNlLWNvcmUu
YyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2xpbnV4L2d0cmFjZS5o
ICAgICAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2h3dHJhY2luZy9ndHJhY2UvZ3RyYWNlLWNvcmUuYyBiL2RyaXZlcnMvaHd0cmFjaW5nL2d0cmFj
ZS9ndHJhY2UtY29yZS5jCj4gPiBpbmRleCA2ZmYxYjMwODc5NDcuLjUzYTM2NzliYTY5ZiAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL2d0cmFjZS9ndHJhY2UtY29yZS5jCj4gPiAr
KysgYi9kcml2ZXJzL2h3dHJhY2luZy9ndHJhY2UvZ3RyYWNlLWNvcmUuYwo+ID4gQEAgLTYyNiw2
ICs2MjYsMjggQEAgaW50IGd0cmFjZV9wYXRoX3N0b3Aoc3RydWN0IGd0cmFjZV9wYXRoICpwYXRo
KQo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChndHJhY2VfcGF0aF9zdG9wKTsKPiA+Cj4g
PiAraW50IGd0cmFjZV9wYXRoX2NvcHl0b19hdXhidWYoc3RydWN0IGd0cmFjZV9wYXRoICpwYXRo
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBndHJhY2VfcGVyZl9hdXhi
dWYgKmJ1ZiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgKmJ5dGVzX2Nv
cGllZCwgdTY0ICpmb3JtYXQpCj4gPiArewo+ID4gKyAgICAgY29uc3Qgc3RydWN0IGd0cmFjZV9k
cml2ZXIgKmd0ZHJ2Owo+ID4gKyAgICAgc3RydWN0IGd0cmFjZV9jb21wb25lbnQgKmNvbXA7Cj4g
PiArICAgICBzdHJ1Y3QgZ3RyYWNlX3BhdGhfbm9kZSAqbm9kZTsKPiA+ICsKPiA+ICsgICAgIGxp
c3RfZm9yX2VhY2hfZW50cnkobm9kZSwgJnBhdGgtPmNvbXBfbGlzdCwgaGVhZCkgewo+ID4gKyAg
ICAgICAgICAgICBjb21wID0gbm9kZS0+Y29tcDsKPiA+ICsgICAgICAgICAgICAgZ3RkcnYgPSB0
b19ndHJhY2VfZHJpdmVyKGNvbXAtPmRldi5kcml2ZXIpOwo+ID4gKyAgICAgICAgICAgICBpZiAo
IWd0ZHJ2LT5jb3B5dG9fYXV4YnVmKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAqYnl0ZXNfY29waWVkID0gZ3RkcnYtPmNvcHl0b19h
dXhidWYoY29tcCwgYnVmLCBmb3JtYXQpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+
ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+ICt9Cj4gPiAr
RVhQT1JUX1NZTUJPTF9HUEwoZ3RyYWNlX3BhdGhfY29weXRvX2F1eGJ1Zik7Cj4KPiBJcyBpdCBy
ZWFsbHkgbmVjZXNzYXJ5IHRvIGludHJvZHVjZSBgZ3RyYWNlX3BhdGhfY29weXRvX2F1eGJ1ZmA/
IFRoZSBidWZmZXIgY29weSBsb2dpYyBzaG91bGQgYmUKPiBleGNsdXNpdmUgdG8gdGhlIHNpbmsg
Y29tcG9uZW50Lgo+IEEgY2xlYW5lciBhcHByb2FjaCB3b3VsZCBiZSB0byBkZWxlZ2F0ZSB0aGlz
IGRpcmVjdGx5IHRvIHRoZSBzaW5rIGluc3RhbmNlOgo+IGBgYAo+IHN0cnVjdCBndHJhY2VfY29t
cG9uZW50ICpzaW5rID0gZ3RyYWNlX3BhdGhfc2luayhwYXRoKTsKPiBzaXplID0gc2luay0+Y29w
eXRvX2F1eGJ1ZihzaW5rLCAmZXZlbnRfZGF0YS0+YnVmLCAmZm9ybWF0KTsKPiBgYGAKPgpUaGlz
IGxvb2tzIGJldHRlci4KPiA+ICsKPiA+ICBzdHJ1Y3QgZ3RyYWNlX3BhdGggKmd0cmFjZV9jcmVh
dGVfcGF0aChzdHJ1Y3QgZ3RyYWNlX2NvbXBvbmVudCAqc291cmNlLAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBndHJhY2VfY29tcG9uZW50ICpzaW5rLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gZ3RyYWNlX2NvbXBv
bmVudF9tb2RlIG1vZGUpCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ndHJhY2UuaCBi
L2luY2x1ZGUvbGludXgvZ3RyYWNlLmgKPiA+IGluZGV4IDc4ZTJlYWQzZGI4ZS4uYmM4MjgxNGUy
NzM4IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9ndHJhY2UuaAo+ID4gKysrIGIvaW5j
bHVkZS9saW51eC9ndHJhY2UuaAo+ID4gQEAgLTI1Nyw5ICsyNTcsMzAgQEAgdm9pZCBndHJhY2Vf
ZGVzdHJveV9wYXRoKHN0cnVjdCBndHJhY2VfcGF0aCAqcGF0aCk7Cj4gPiAgaW50IGd0cmFjZV9w
YXRoX3N0YXJ0KHN0cnVjdCBndHJhY2VfcGF0aCAqcGF0aCk7Cj4gPiAgaW50IGd0cmFjZV9wYXRo
X3N0b3Aoc3RydWN0IGd0cmFjZV9wYXRoICpwYXRoKTsKPiA+Cj4gPiArLyoqCj4gPiArICogc3Ry
dWN0IGd0cmFjZV9wZXJmX2F1eGJ1ZiAtIFJlcHJlc2VudGF0aW9uIG9mIHRoZSBwZXJmIEFVWCBi
dWZmZXIuCj4gPiArICogQGxlbmd0aDogICBTaXplIG9mIHRoZSBBVVggYnVmZmVyLgo+ID4gKyAq
IEBucl9wYWdlczogTnVtYmVyIG9mIHBhZ2VzIG9mIHRoZSBBVVggYnVmZmVyLgo+ID4gKyAqIEBi
YXNlOiAgICAgU3RhcnQgYWRkcmVzcyBvZiBBVVggYnVmZmVyLgo+ID4gKyAqIEBwb3M6ICAgICAg
UG9zaXRpb24gaW4gdGhlIEFVWCBidWZmZXIgdG8gY29tbWl0IHRyYWNlZCBkYXRhLgo+ID4gKyAq
Lwo+ID4gK3N0cnVjdCBndHJhY2VfcGVyZl9hdXhidWYgewo+ID4gKyAgICAgc2l6ZV90IGxlbmd0
aDsKPiA+ICsgICAgIGludCBucl9wYWdlczsKPiA+ICsgICAgIHZvaWQgKmJhc2U7Cj4gPiArICAg
ICBsb25nIHBvczsKPiA+ICt9Owo+ID4gKwo+ID4gK2ludCBndHJhY2VfcGF0aF9jb3B5dG9fYXV4
YnVmKHN0cnVjdCBndHJhY2VfcGF0aCAqcGF0aCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZ3RyYWNlX3BlcmZfYXV4YnVmICpidWYsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZV90ICpieXRlc19jb3BpZWQsIHU2NCAqZm9ybWF0KTsKPiA+ICsKPiA+
ICAvKioKPiA+ICAgKiBzdHJ1Y3QgZ3RyYWNlX2RyaXZlciAtIFJlcHJlc2VudGF0aW9uIG9mIGEg
dHJhY2UgZHJpdmVyLgo+ID4gICAqIEBpZF90YWJsZTogICAgICBUYWJsZSB0byBtYXRjaCBjb21w
b25lbnRzIGhhbmRsZWQgYnkgdGhlIGRyaXZlci4KPiA+ICsgKiBAY29weXRvX2F1eGJ1ZjogQ2Fs
bGJhY2sgdG8gY29weSBkYXRhIGludG8gcGVyZiBBVVggYnVmZmVyLiBUaGUgZHJpdmVyCj4gPiAr
ICogICAgICAgICAgICAgICAgIHJlcG9ydHMgdGhlIFBNVSBzcGVjaWZpYyB0cmFjZSBmb3JtYXQg
b2YgdGhlIGNvcGllZCBkYXRhCj4gPiArICogICAgICAgICAgICAgICAgIHZpYSBAZm9ybWF0IChz
ZWUgUEVSRl9BVVhfRkxBR19QTVVfRk9STUFUX1RZUEVfTUFTSykuCj4gPiAgICogQHN0YXJ0OiAg
ICAgICAgIENhbGxiYWNrIHRvIHN0YXJ0IHRyYWNpbmcuCj4gPiAgICogQHN0b3A6ICAgICAgICAg
IENhbGxiYWNrIHRvIHN0b3AgdHJhY2luZy4KPiA+ICAgKiBAcHJvYmU6ICAgICAgICAgRHJpdmVy
IHByb2JlKCkgZnVuY3Rpb24uCj4gPiBAQCAtMjcwLDYgKzI5MSw5IEBAIGludCBndHJhY2VfcGF0
aF9zdG9wKHN0cnVjdCBndHJhY2VfcGF0aCAqcGF0aCk7Cj4gPiAgICovCj4gPiAgc3RydWN0IGd0
cmFjZV9kcml2ZXIgewo+ID4gICAgICAgY29uc3Qgc3RydWN0IGd0cmFjZV9jb21wb25lbnRfaWQg
KmlkX3RhYmxlOwo+ID4gKyAgICAgc2l6ZV90ICAgICAgICAgICAgICAgICAgKCpjb3B5dG9fYXV4
YnVmKShzdHJ1Y3QgZ3RyYWNlX2NvbXBvbmVudCAqY29tcCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGd0cmFjZV9wZXJmX2F1eGJ1ZiAq
YnVmLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
NjQgKmZvcm1hdCk7Cj4gPiAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAoKnN0YXJ0KShz
dHJ1Y3QgZ3RyYWNlX2NvbXBvbmVudCAqY29tcCk7Cj4gPiAgICAgICBpbnQgICAgICAgICAgICAg
ICAgICAgICAoKnN0b3ApKHN0cnVjdCBndHJhY2VfY29tcG9uZW50ICpjb21wKTsKPiA+ICAgICAg
IGludCAgICAgICAgICAgICAgICAgICAgICgqcHJvYmUpKHN0cnVjdCBndHJhY2VfY29tcG9uZW50
ICpjb21wKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
