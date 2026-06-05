Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3257DCD6E6B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPYCF5WopyQQkn48LttCSMyBeyzKGRMWMDYzKhPgET4=; b=bpgTLeO4bINx3u
	2SI1RvS/o+E+pqTUqRq5JvMVqMNNaiG0ddLB629uOEnUM8Wo2CcuK7QE8jQV4Okv3mfl+o6dsPuks
	/OHFAMjTcjgvq+3MnHjmya74RJ2yksg7v6w2kRWvBloSnBXqXu0URvsp7cfe55K2ifpyyMnBGfY8s
	5wZDbvfgjUH0TkMmOkP726J5V8AJf0AI291dW1pDMAU31BfPefo/dXSLbaxq3fmZ0qucDvi0gis9m
	P7aE+5N9kHb+q8w9g/TaW7mnvpZNZDslaKLOAIa1btXKKvc547F2bFfNGK2bcflN1p9AWACF9v1gd
	zjY82fIrs40syj2Od/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQSr-00000000MWz-2Dl3;
	Fri, 05 Jun 2026 09:03:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQSp-00000000MWA-28NA
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 09:03:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65518NwW3603450
	for <linux-riscv@lists.infradead.org>; Fri, 5 Jun 2026 09:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=JNGNA9KfLEu6lKiLq/bw2EyVuHECatldL352HW3O3Jk=; b=ms
	YyxjAa60BJo83GWoLx+DOyn9oy4FanODdWgC5P/uXkr+Py13w0W5PZJp6/7VKqP4
	RTzgJJ0UBiekRROIJcIPKAJLBQc4rMhN5pQxuXpXx3FvCKMjOPC9CmeLJqwKNUYF
	qJ1zIC5MBfEAvZ0ixzx5KA7JSWx0ktay1po+N/G7KV5V3CY0Z1GSY206LLQE0rnD
	JBPN3LL5eURVso7RC+I3B3aSFv9di7sajhccj4cTGNcQOYPrY1grz/aue6Cil3Ab
	mr419w+e/umHWh+LrPw4NbNWh8nrAncrjfgsCUdDfKA9fbXn/379GbqZeGRxO2wF
	E5mAx6F2P/qWrtaQ3nDQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekmhf9jq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 09:03:38 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7eb18546ec2so30628577b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 02:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780650217; cv=none;
        d=google.com; s=arc-20240605;
        b=bkq0iyhmaAHTkw01BYMLUik0hEOJSEAiwpUGA/EGOaYCUkwcuEmiHM/A88kLJnIyw4
         s6/F9yaGIQr5AbSym8sSwYEunM0huE7vZ5jmgm3yt3x/zCNHrS6NHmUgcqkxqpH5lmVw
         VrCz/jonIi+lGJbT0ctsLKPyU/vxw+AgFedAtAygJUtV8nrOP1L/n7eEYssGtO7nEmq4
         tbvfqdSFTYaGgqutw8I50DGk2zY8Jp+lC7x/PusfikyIlhJfiUPD0N7HYK4ZIwhOuiPO
         QHP2GI08mQaiRkjhcS5+l7CnvP83PY6uNIFgl2JzzTwLbTTepDL3hbTm4G/Bk5xf02Ui
         w5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=JNGNA9KfLEu6lKiLq/bw2EyVuHECatldL352HW3O3Jk=;
        fh=QeY0UU8Rs7UzRMZZAgm5SYHUzNseX26HTC+qIhVUiC8=;
        b=MgR1k81GOI7+9zV5hUVYs5Qj2IEHpZZsOuDC3A1SB4c3pDusZWrlAmL1rA+87rHIFC
         nbdeDEMBlc71s3TXT/GrAHO77hx/QtoyyKmGTkvcypP3hbDbkMGVJObs/xSzBuT/Vu78
         BA28bXP+cVDp+m112y1hw4wdqjg2tZIjk5cD6pBxOPsjJE86hNpNvUNRcQT+pb9Zya6B
         mcyh/svm6hc67N/3BXO5P+j5sgeUGsuEpxrvcTQGutm9BDz8D+Cg7BVjnP3f4cwbiiYf
         Mpmaiwzp7W7KbFtYcdX6gYWj06qDzCrhjiXE/M9oYEzhlL4EQoHCfDHOOE0zrWwMvY8B
         vVwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780650217; x=1781255017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JNGNA9KfLEu6lKiLq/bw2EyVuHECatldL352HW3O3Jk=;
        b=W8PP/R6Da8vK7/IDOjydZ261bMn9zb8EnOf/fL8oRjomd/a1xh9xUce1dmECAyBQo0
         YG0V2ns0ZtxQmlVMKK605z5bKPzB6+nM22wtmFthy5LFOJCCfTuNkfeJK0380sipl9LC
         V5Nr5ZdFRJDlA+NgCRZO6uhBvgNUdJ7xzoEEFQLwHmPwqdCjuaqI0MhHpxYgqWK/6Wg4
         8eDFweiM4Ir4LhlFA4g44Us46eswo9ySq7ylnSDxejwSWD1A3MFLCidiwY3k82W0rd7r
         Ij/Ri60Nri5e9a+7X82fdYz9auTSxWtZulSoGBzIdnnj9/V9YZPksHQRpMImc4cH9X0q
         rXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780650217; x=1781255017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNGNA9KfLEu6lKiLq/bw2EyVuHECatldL352HW3O3Jk=;
        b=UbG5Y4jBfioCipzjQ70Gx6vd0VhClx2/107kkgl3sakl14QB5LHIBEkOK5x1n+PIqp
         YI8wWLSykQnhEFoLjUKGcH4Z+wnAxphBcFy2Y1UgtcdyNW/hIkxi7xAtspi39rHqlzv1
         O/iVWV6DvCjEXjCVUeiqhY8SATnjO85Aq6GLUlHtFt4rU2P8eeqKVE74rZngqaS2KUyy
         51Y64Yuu8GHbrdGigUu64noHTeJ4oEdrDMOg/TS8CnUOdq+QJ96fQsueaNMRmxUe8uIZ
         7EoeWoIHnDF+2q0B4enFra4uvgH3USYSM91VZrPJc95dGA8RKk4R5JrP93bqfNW4Qzx0
         Rwag==
X-Forwarded-Encrypted: i=1; AFNElJ+Y73kL9t4CgKxkMx6jmly5f/rS4UcWER9O+Nv1rX1/A26HWZmXE167JFow/cmOtfbxezHV9L1ezBzhgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YykpAyRRDrVX8RNmkvxEtJYjx2MPEtbVrKlfVIeNiDf2mKh8GAH
	oAIAJr5b9RK0c6wy2kyntpuXrKlMgggzE/IBSgSP3cZkRCN5zKpRp9uFKuYmy3h+EN8kDtASyOV
	RkwggblAXqhm8ye42/KMBO3oIWj94CILkTi2xKYHJtv92WeXoOk5cn0LFE25rztPP5q1Y6ZVgcT
	FteBY7RugJNptzsUjT9fIBJ01X4hSI9pZudoYEzxM3zq0L+A==
X-Gm-Gg: Acq92OGAIkafOY0/YrFBDj1TQAxGtIabhSDsrmOVZDTMI17NepDKkuGgy/1iErjo14F
	9RCIfYPa/hE+NYhupA46Kw/EmUkczjcx+T2CoEHq0qpj4RzWMArhb7iNe49/FB1FmmNYQRRjUK8
	GC72F8MXc6J9ktZ/O7KXgOffq10+d0cUx0YBI1ARXlLBKs32rhjgOmiC2ZgIPmnZozjkCPfW+yr
	HWS7h09FGgVLytSoQ==
X-Received: by 2002:a05:690c:6810:b0:7d1:dd7b:b736 with SMTP id 00721157ae682-7ed0d3c5b7emr25872607b3.37.1780650217195;
        Fri, 05 Jun 2026 02:03:37 -0700 (PDT)
X-Received: by 2002:a05:690c:6810:b0:7d1:dd7b:b736 with SMTP id
 00721157ae682-7ed0d3c5b7emr25872277b3.37.1780650216818; Fri, 05 Jun 2026
 02:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260604145510898G2kTwM2Pr25QE5H8T4Wh6@zte.com.cn>
In-Reply-To: <20260604145510898G2kTwM2Pr25QE5H8T4Wh6@zte.com.cn>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 14:33:25 +0530
X-Gm-Features: AVVi8CeQNoqp6ec-yy76ZQa8OFaMF7NkyuFmoREpSs-Er4z8q50OUmANSqwrxik
Message-ID: <CAB19ukEzQZktJcBAXi8X2Pwz+hO_FcR+iiaK9nsCAumP9BrHnw@mail.gmail.com>
Subject: Re: [PATCH] iommu/riscv: Add dependency between iommu and devices
To: wang.yechao255@zte.com.cn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NyBTYWx0ZWRfX7SXYY4029/oJ
 ovhj67DXJ6qpLnysBeh4BD3KeliNK77q4nUIhWClQsZXi3eo8zPQTDJTDTSuB/pCoKRjDl0LeUb
 Xe+tn5hDEv0J/9kOQjDPc8W2loaOi7gDrZx+oT5pho2OMl5zK3omrgCFgOcbccP1pdaWizbcHDp
 +shq77JsY935/TMhb+mnNGqMKzv2xIPf8VQavdtne/8xEGxj1E3oQGDeaQExARz/Pj92BT1eOyG
 20jgxczpASjvd2nrKnaefzkrThDdu5IbFsKkwCghKULudQYuMZAym5GYgUSGJD18YgKqjBleOJv
 +7DpgB7Fl8RFteReWKFeuEWLXK8mN3aRy9+LNG0lXw3/xpJcp+mO/nMKX8z/IExElABDCd67EYk
 64is5jjGVFHAmKkZMuZoIb6ViAEf5LHNKyNWiIYNP8drP08SZPPCM5AF7VzLdKMUR1fyyNCCUVT
 AnaHfKDX+b1QBIxKxIg==
X-Proofpoint-ORIG-GUID: Mvo17KrKgNId9-ay5SV_tjn8lZK-8bxl
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a2290ea cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=1RTuLK3dAAAA:8 a=8XNXOnQHZAaewqnS2oYA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-GUID: Mvo17KrKgNId9-ay5SV_tjn8lZK-8bxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_020339_561943_D5EC9235 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
Cc: aou@eecs.berkeley.edu, tomasz.jeznach@linux.dev, alex@ghiti.fr, rafael@kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>, linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, linux-acpi@vger.kernel.org, iommu@lists.linux.dev, palmer@dabbelt.com, linux-riscv@lists.infradead.org, pjw@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gNCwgMjAyNiBhdCAxMjoyOOKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gQ29tbWl0IDkxNTY1ODUyODBmMSAoIkFDUEk6IFJJTVQ6IEFkZCBkZXBlbmRlbmN5
IGJldHdlZW4gaW9tbXUgYW5kCj4gZGV2aWNlcyIpIGFkZHMgdGhlIGRlcGVuZGVuY3kgYmV0d2Vl
biBpb21tdSBhbmQgZGV2aWNlcyBvbiBBQ1BJCj4gc3lzdGVtcy4gT24gZGV2aWNldHJlZSBzeXN0
ZW1zLCB0aGUgaW5jb3JyZWN0IHJlbW92YWwgb3JkZXIgYWxzbwo+IG9jY3Vycy4KPgpJbnRlcmVz
dGluZy4gV2h5IGlzIGl0IG5vdCBoYW5kbGVkIGJ5IHRoZSBmd19kZXZsaW5rIGluZnJhc3RydWN0
dXJlIGluIERUPwoKVGhhbmtzLApTdW5pbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
