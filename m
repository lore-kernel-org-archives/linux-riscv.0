Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA80606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tM6IXC+u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RhVRkjk/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U/Wppy2H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tpum6wKBu82JXqzVtTvwimf4wHcfDBCBoV4r1BbYy+o=; b=tM6IXC+uE3g8jkjkbVUF5xSOxT
	YAzXaR+A5cuF9w2VWNrE/wYGVnupvig93Yi3vJteq4Qj0DKy/BqQ6vburhbLR6MtahtfjYeQWPen+
	Qm3a1hmyX8mBaoSkCvr9svFLq0VmgOZtGYJyog9hZm1cvsoiOjFvzRcpGqfBi6Kw3cAlIPzPpxRwG
	Q23rPlV5+YcCv2u4Xa/Pv6XfckBQEnTqY6wAaYtzZWeBoGWioens4urwhHIo1YzoKzW1Ds4pZw40m
	DGPG3euutElv8AKRGzHso3SkWfXquHXyjQwq/V0K/nfGcQyQNvCtngUYqjqe0gH8xkN1L0lgXidqW
	KgKk7CrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeDQ-00000008lHj-3gB5;
	Wed, 18 Nov 2026 11:52:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeDO-00000008lHP-1epC
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 11:52:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkitN3624428
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 11:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=; b=RhVRkjk/yo2LJeGc
	YGPikUMNkstbY0Y6YCCZvIDpUP6Q5NoU2K67MCAUvISTeJ/iSWiuFTfQsaVwV5Sr
	hBBvLr69HirHz7qzgDTOMxL+PQA7POaN6n4ocweh+taAYVH4dRn0LKh2bhOW/fDc
	uQtFW3S9tkzQZQZQ1YUD/0sT+w1ILy9v2hgVUFwNq0V7fdvCUeNQz8ltpYpj9pZV
	LORnE1ujmGGseIxoDeBW1jClWzffPoUaHltuy3JiQADweYYm0AlxveEMxH4ZlZmW
	ROQtx023bszzSMMHJ72c6rQz/niMDCVsojZp9DobXA66So20Noq4UIfvhFOFp+fu
	e8iIEA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatvsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 11:52:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd66551e02cso1102269a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 03:52:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002757; cv=none;
        d=google.com; s=arc-20260327;
        b=sMfYeuYe6vMpWBYczloNjhaZNy7et+qZg3k4LWaAiA9s4OQ2M7gT14INJrB30OPW+e
         3FglNS52UhZk+UwNYJCreA5TBoMnqgq/FpGdQngVQaKEHMplKDs2cvBopOzXr1ZVQ0V0
         wlpQah4Z54gFu1Xzu4N6QYz6wBemUSY5P9gUBRsUZQXJtl4tV0MOnwC5t2mAoXKZN/Ah
         MPtPRA6b9wTNh55QswbG0zjlqb5jre0XMus4HZ0qMfWIwTiuG+Og8s1xD7SFcFoVihTi
         jD5UosVA/ZFk5sgL4BvqxQARlmNrTESeb3Itgf5yEiF5RT4663cGbvXqLEDYgZ/XcH/Y
         twHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
        fh=vM8ayQMLnaHHd7LzpxOmde6ftzyskrXANn1mGl2whJU=;
        b=sMpTj0QAFMslD1n6/2W7tBtZS0EHXAZ4UDl2VzUk3ffwb3tltB1xWimut3agIgP/9K
         TuyfQ/MFnKT6YepilvtsBicq3GLf9x9x9zdcwzV3iBRZg3MoWksv7wA+VUiEBKN1tcnC
         OQ7MVO1C2QYXuLg8hP2h3eAKrVOdTSMECbKsfoRLeAi7WvJ9RjqebhDVjqwYpj+Nl9Tw
         YfWkmZaShCK3frq2/aSgR/40FfOoUpGaRkk8dRlCvkBLfBS+nU2hw4h0PjMZtkCrot/+
         BhZRFyis4R0fyVGALQ1+DSaQNeg1kXsCweUB7MA9WJgXGNTVpmLhIKsSNX4PoxDii/G9
         PhXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795002757; x=1795607557; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
        b=U/Wppy2HwU6ESd8ccGe4+Nsar4Gnb2+ictTjeH9vR1267bPHgBcraBNMSLOwdgYhae
         maZR6N0uS1wP3HX+/mDcNJ3wkRiA4P36/P8Y80PZW3XJshHk1RJIcJnzqpImbykZO2M3
         kvJx4+q+mw52dQBgL9aedeWIiHGPI5db6BztYIyCLa7Rr7ggQ5yEKMIFfK6mt+AIYYy/
         sQlTauayTJ3PrWboqyWaUbEUjSE3ROGTfrdd6THWAMgAvupp/06NajmORbrginJtGTDS
         3AVbSipm9zWXzz4ssloxR+jPgiAwDQvSupwZxT3m9wgnmtMGHTVBv9M9cOQylggJkWX4
         rjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002757; x=1795607557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
        b=BURba2O+5U+MtVYr/9vby+a7V9ec0ZDhVoP1Yy3hCos8qQ4wLi1oZUyDhsLeJjEbbm
         baPXR/Du85JjEocEhDH1CVv6ckBG+PTCPcUndY1ku5iefNWokFP6zT3/fHi2eX/pv+pU
         URCSrFsxFL7DAqYcC1p5fKKt2JsArPCSzGvnQBGi3Gz/0U8/ukIFJqDxKrgS0RmzHTxr
         +w3AEn8UlQvqIGm5xN9XlEqZVN8Q7nsZHJa2ofjfNfxNQhdcfnVMZd6/GvQ2+V1xaGDV
         SmmFOdri1tTnsx0h2VyXe/ZXiwmxk3190JZdv8G+f+AX6uAVlpZgvSalhqczmYVzxkY+
         4ECg==
X-Forwarded-Encrypted: i=1; AL+hErGSaM/kVfuyeJacWvi6xl6lAoV3opGSB8AuRt6nDNw7dY6F10UEtc7CLJ9CgCG1Jo/8RBZKOqw+/s7bLw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+VJDCA0ATLL/j6Vb2B4rMCQAzDiQYtBAyZOJX7vpZ1DdJzlkaq
	OEmROTvxfQ1dYYWt6rGLAkljKACSErSQoCrYDHVya722jXWR0xK+T35OJ7O+rLInXB4iPrb41zH
	urvfSDnQcMxylB8ewFJrbJkDO8f3joGcixoOvw6pFKhWB5xnJ0tZwQBfmjddG2Ee9qyzUpHeGDI
	usZXBYMmUK9Sb0pmoGMI1I565fbAvM57tHD2popmes5NmuFw==
X-Gm-Gg: AYBFou1FOvyumegeYK9a+DVt1sZhOtmbkspst2yekiRffarxykokBmY1Yk+HjYquVf4
	NiEcLjnCf02Ff2KQ4PC1p4mqUiNf/jfolLVnzJAhBykinvQ6kdnACNazOflxPNC8kRV7hqBWQVH
	s02vVXvlLH86wrQHJHNKsAMN3f0bY5/QgJQQR0lIXvCeDzyKHOEmSEfobXmiQ=
X-Received: by 2002:a05:6a21:7784:b0:3ed:bdfd:23a8 with SMTP id adf61e73a8af0-3fe8b0fd138mr2284415637.61.1795002757197;
        Wed, 18 Nov 2026 03:52:37 -0800 (PST)
X-Received: by 2002:a05:6a21:7784:b0:3ed:bdfd:23a8 with SMTP id
 adf61e73a8af0-3fe8b0fd138mr2284369637.61.1795002756683; Wed, 18 Nov 2026
 03:52:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com> <20261110042920.2108205-1-leo.liang@sifive.com>
In-Reply-To: <20261110042920.2108205-1-leo.liang@sifive.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:22:25 +0530
X-Gm-Features: AclHuK8gGyKNzxG61XNU0OfhAW45im2YjqVMYzhmxWa7gPFxF1N6yrBDS1NwRIQ
Message-ID: <CAHuiULCcenE-489qnfepHO0dEf4HihzgiHSD-SgYQQd3vVoyhQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/14] gtrace: Add function to copy into perf AUX buffer
To: Leo Yu-Chi Liang <leo.liang@sifive.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd9185 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pFyQfRViAAAA:8 a=Vcmy69C8LHsApJ-CToYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: NPPZzGTgUK0xZoQEYQ_WXzPZEnWoNsO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NyBTYWx0ZWRfX4QSKBa/L99+/
 gIsuLBYZ7VFl+694Uuj69VrQTyz8CjHCO13QMqxpd98acqkTYqAMeV/ehHaEB7ihEDU3KBnWlFN
 BoAgXUME69f3pMQf13E492diPp49WOLFCgrgX3tfA1BNc0F6fk8sRvFSb6iCgzxkhP7GOzvajjN
 ZT1wLRCLG6jLhX+RDBHLpVbj9oEGnRRznHN4vjg5UOnVt3sAwKwv9m8ZlOAy0mqnB2R/IAAMLUp
 Sua6LY9oyw8vc9SCaV2MkzyWT3HfTEpIL9jwC6Oi0dTnUEGFeBpssmyYRjNudtFoqJ66erfba5+
 T1zrrVI6fA/3jhE74Ck49BdyxB1hkwtlB7F+RB01SZvoPnYko7r7sxgPUufXbEcAJytGto2cUj6
 TInfGheOg7twV8TZZCt2PBERAvABSKfDbP4ZApJqiYQ6jIBoI1ZQ595OYutGnIUAun/R/bDvL1Z
 bP82zNRMEGBi4OiM8+A==
X-Proofpoint-ORIG-GUID: NPPZzGTgUK0xZoQEYQ_WXzPZEnWoNsO2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NyBTYWx0ZWRfX02uO6h2mHDMG
 SPieq4yNcw19blg0+pv6qU3iqwwboE+2gUvl1awHRGmuudh4XvAT7Qgcyu0+P43gsRlaexkQ0+C
 9t+v4KJyFq9oq9DAZ/EUVvGEgDPXxmM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_035238_477361_E9BD7103 
X-CRM114-Status: GOOD (  18.83  )
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

SGkgTGVvLAoKT24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgOTo1OeKAr0FNIExlbyBZdS1DaGkgTGlh
bmcgPGxlby5saWFuZ0BzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIE1heXVyZXNoLAo+Cj4gT24g
MTAvMS8yMDI2IDE6MjIgUE0sIE1heXVyZXNoIENoaXRhbGUgd3JvdGU6Cj4gPiArICAgICBsaXN0
X2Zvcl9lYWNoX2VudHJ5KG5vZGUsICZwYXRoLT5jb21wX2xpc3QsIGhlYWQpIHsKPiA+ICsgICAg
ICAgICAgICAgY29tcCA9IG5vZGUtPmNvbXA7Cj4gPiArICAgICAgICAgICAgIGd0ZHJ2ID0gdG9f
Z3RyYWNlX2RyaXZlcihjb21wLT5kZXYuZHJpdmVyKTsKPiA+ICsgICAgICAgICAgICAgaWYgKCFn
dGRydiB8fCAhZ3RkcnYtPmNvcHl0b19hdXhidWYpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7Cj4gPiArCj4gPiArICAgICAgICAgICAgICpieXRlc19jb3BpZWQgPSBndGRydi0+
Y29weXRvX2F1eGJ1Zihjb21wLCBidWYsIGZvcm1hdCk7Cj4gPiArICAgICAgICAgICAgIHJldCA9
IDA7Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgfQo+Cj4gVGhpcyBjYWxscyBj
b3B5dG9fYXV4YnVmKCkgb2YgdGhlIGZpcnN0IGNvbXBvbmVudCBpbiB0aGUgcGF0aCB0aGF0Cj4g
aW1wbGVtZW50cyBpdCwgd2hpY2ggYXNzdW1lcyBvbmx5IHNpbmtzIGltcGxlbWVudCBpdC4gT24g
RXN3aW4vRUlDNzcwMAo+IHByZS1yYXRpZmllZCB0cmFjZSBoYXJkd2FyZSB0aGUgZW5jb2RlciBh
bmQgZnVubmVsIGVhY2ggaGF2ZSBhbiBlbWJlZGRlZAo+IHN5c3RlbSBtZW1vcnkgc2luay4gV2hl
dGhlciBhIGNvbXBvbmVudCBpcyB0aGUgc2luayBkZXBlbmRzIG9uIHRoZQo+IHRvcG9sb2d5OiBh
biBlbmNvZGVyIGNvbm5lY3RlZCB0byBhIGZ1bm5lbCBpcyBub3QgdGhlIHNpbmssIGJ1dCBhbgo+
IGVuY29kZXIgd2l0aCBubyBvdXRwdXQgY29ubmVjdGlvbiBpcy4gSW4gdGhlIGZpcnN0IGNhc2Ug
dGhlIGRhdGEgd291bGQKPiBiZSBjb3BpZWQgZnJvbSB0aGUgZW5jb2RlciByYXRoZXIgdGhhbiBm
cm9tIHRoZSBmdW5uZWwsIGFuZCB1bmRlciB0aGUKPiBmdW5uZWwncyBsb2NrICh0aGUgc2FtZSBs
b2NrIG1pc21hdGNoIHNhc2hpa28gcG9pbnRlZCBvdXQpLgo+Ck9rLiBJIHdpbGwgdXBkYXRlIGlu
IHY3Lgo+IE9ubHkgdGhlIHNpbmsgaG9sZHMgdGhlIHBhdGgncyB0cmFjZSBkYXRhLCBzbyBjb3Vs
ZCB0aGlzIGp1c3QgY2FsbCB0aGUKPiBzaW5rJ3MgY2FsbGJhY2s/aWUKPgo+ICAgICAgICAgc3Ry
dWN0IGd0cmFjZV9jb21wb25lbnQgKmNvbXAgPSBndHJhY2VfcGF0aF9zaW5rKHBhdGgpOwo+ICAg
ICAgICAgLi4uCj4gICAgICAgICBndGRydiA9IHRvX2d0cmFjZV9kcml2ZXIoY29tcC0+ZGV2LmRy
aXZlcik7Cj4gICAgICAgICBpZiAoZ3RkcnYgJiYgZ3RkcnYtPmNvcHl0b19hdXhidWYpIHsKPiAg
ICAgICAgICAgICAgICAgKmJ5dGVzX2NvcGllZCA9IGd0ZHJ2LT5jb3B5dG9fYXV4YnVmKGNvbXAs
IGJ1ZiwgZm9ybWF0KTsKPiAgICAgICAgICAgICAgICAgcmV0ID0gMDsKPiAgICAgICAgIH0KPgo+
IFRoYW5rcywKPiBMZW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
