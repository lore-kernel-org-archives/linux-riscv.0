Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B708CD8C9D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7ksXQ5uIRccV3/sgtFSFc/TiPQSDHXGO7XWlvqhfu0=; b=MWK6UTBJR1pVeF
	YVaxxCWJFtD/mThPHQWHHsNWX3WP0oGQcgIuIWCx7UDddPVxF843+7TCW28OKrzktrJr19/1ytvNM
	0ET5PbMCwj+FXa0m1lxll6iKj5kG1OxgZ23uYZl+z9/xoXqwlKpbxuiaavLqwdg2bj20KVvc+p15x
	UGNw3PEeLRjSE4c2M27QR0cbGQgvXYTLhR917St2/Tm5+a18oGme3w6aZGBBuO/hltilhbbKCBEhq
	/bzbEIkp1wslbFqO/FZ8z8s7T/X0eGCtVaq5K59/1cCAFTQEIEdJR4aPvTj6a5Zb0y8BUdoy110Eg
	TOjzKlrGWB72TD96EEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdsx-00000004Cuv-0Tzc;
	Mon, 08 Jun 2026 17:35:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdsw-00000004Cun-2ffQ
	for linux-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 17:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=mlZU0/pgW+ejL50FpauU5Ho0DNaF5PbUOlmB72X0Aj8=; b=ILrWYxjPgNdWNsBQKt0Ua9QLxc
	nQ00DcECLbr5kJVgrjwlcBe2AuU3AC4trZpeecfrHoZq3KUVx9KSpEEPbguXdsi2WtngSuqfsTPs6
	+s0iaPGHjYwXqsvyKqsR25vDYkJbbEibOlhGvqhiRin4jlUo5kxgVY85derjYEBmGdYUFQ2dzILL+
	v1uPyCTk4fRnZQW5Cf53MyrDuI7tsYj6YxQOQJkxxY4NpMSqRJfibkQ/+YZv/N0+Fl2t59B9qixf3
	ja2GBAhhtqKrqvPWA72RxYc2PKmXbHRrTJczBfg4VI6By/Q8qyKwobkOEGVVsrGs2zTHpRvolnpAm
	vNG2hyxQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWdst-00000001ORF-18pr
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 17:35:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFRC14041643
	for <linux-riscv@lists.infradead.org>; Mon, 8 Jun 2026 17:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=mlZU0/pgW+ejL50FpauU5Ho0DNaF5PbUOlmB72X0Aj8=; b=Dv
	Tb5UH8ccM2oDsgKng2asrIeWtqzQCmYGDd08K8abr6WXPMPSilYEE+fNjH9+wLqq
	uiUYbkNN+XYso/8c9e9dTT8mmXVUzailRpo/OSWzz98UFA75e27we0p9IDj0BdB8
	gVaQ40tm+xjpCx9t0vJ4I8I8a75dO3I65N0lSm+eRB+EOX187AbT5nPd/iDYJZIf
	69+ikXT9VQ2Z/1tUQSApeDZG8Xur1SXZVeyNlGqMD8jKoLCVez+1C4PIJPtnwueK
	M6KDdDAhla51X686JX4H4W8G1VlkgYrIhj7+qG3EI++/Ik8lKqC2GaRznlKgQ+Xa
	8ar8m/oRojBK9UhbvKWQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv9k8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 17:35:31 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7efaace4bdcso31395257b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 10:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780940131; cv=none;
        d=google.com; s=arc-20240605;
        b=Gf4GXLbuSJ/4YZyFO36kJKfvggS4Yz6R+v8UVhIrFWG+cxlwDg6AhkyR8XWVV456XK
         ts0NeyZeGoEXWkQrsn71cKmMhYJvqN6t0gJhLO5LJghvVBn0/bkW89VOk7PYWxzpS0v1
         EIdAI6rpFllWYcb/3wKLlE4XaKvyQTq17eLnC83PqstAr87gFN/TiZmli03Prb7hdY1f
         MpRQKbzxQGqZ8s7DfyeKj7lcicZKhAT4DKGnTK0DA055+peCURM7V6S4nlJ7sVwIZGbq
         H94Wjc6TfsPwWM4EfPptzTS8Cv/3uLpvq1L+/gYFdyEHK6Pkd8lHVIo8JS81JIKBcoY8
         1Hjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=mlZU0/pgW+ejL50FpauU5Ho0DNaF5PbUOlmB72X0Aj8=;
        fh=9dhd7EGhBjhEYTug89Zhq1iVxi3UhPVKv2LROeC+mfc=;
        b=BqjpK+Vw0sfv5z2DbEKT3xiLEczBu6fLL9O1Vs6Aju0Xyq9VqTHhPvMvJN9jvKll3F
         8zHtjWuPBy1Oq4U6Hj3pyivryrBO6ibp3PsINbD3dBw8lVYzr8/nLoaFH1bIFsfgIDM1
         zgzDOhhs9wcqOKPM2GWeLk+tyr25SweRNuayslki9coVI/amdxRxesX089LHU7/RPdM8
         7zNcc/ayzhiFN0HOjgFZCFUJJih2SN3jCBZNs10DZG21WK0JGX4Pu7WDMwTfiIN8MK/e
         e3gueqIMnQ9lFjK6RnnFdunk8fL87hfVVRuxrkioPdANSxsdJXy21noeqxVHycA0zzSq
         qyJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780940131; x=1781544931; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mlZU0/pgW+ejL50FpauU5Ho0DNaF5PbUOlmB72X0Aj8=;
        b=Xuyoi1L1Tr4BetRS2U2S2NGGifVS86e+8fPUZCbN7HxmpcQIm49VFk02kLIvWHrIyR
         o8Q0R0thstNOeQ6zCh1/udxp8U8bewzvfvoBW2ySe+QmLw6bS4J9qtOY3omohB6Cjx/5
         lCd2Aze3CjHr+4BUhwM8KnnKW24YfsZyW9ANNJNwZkUZBX0QgsNuPD7LaaftNfAxcZcG
         +XuIPuIAvfibCt4pgBJDe0Pv5dgpJKof5yfNNnTzM9u+AhEKfv/9AYtyOt31l0EUnEEj
         t0uX338abBJsBAHqLBqBr6eU8+PCbGtqT52G/zfXUcXxZlUUpumNZhu2R7HaZhMkPuER
         ofdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780940131; x=1781544931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlZU0/pgW+ejL50FpauU5Ho0DNaF5PbUOlmB72X0Aj8=;
        b=IJWIubS5Tk9PYIWQKnGjr9BTy+2yJDy//4xAvHUp8K5dIUJhio5lEJydHyTccgxRnO
         l+X81MW2PynDYvaM09j+YpTgC4GLXLuqUxjtrWAiJhHLqWXTUhHImYnM/h7d1C+fIW36
         5j7y9HBMRNierdMahgwj52WBl7JHKxZ97lfD/y9z5TCNnqmrTSpcdNum1cPxjedKOhBe
         NGFfqbg0DEVZkGqCAYw5scvlfHLdXKnzaV51W/DEZoxyqI/3ZfX1iMdIB3RZbIslGsxu
         9wENxbrpBnG/Rl8glEW19c1nUWr+mF6vU1XlnCrf5IBMLZ4rbEV1Shed8yQp7DqAdUHu
         /24g==
X-Forwarded-Encrypted: i=1; AFNElJ9rvU9arWwpVqNHxs2gpQlDOvnw+qd+9Ndy84wSn2T3yc2qcPcviuFDLCoFhy0PI+P6NMz/91j7PpDqww==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDguUFfADRNw8fHFuY3wfekac9MjusPRqpX9CxYyHzV0DNAxh0
	cSpHhGn01rccYGZvcHHAJ5nnrS7UO08Hzlg//BWo3khb7gdHbAwhf9vVdIDf1Kuu4ECnYFOxoLU
	MzvTYe6N+t1IMMsnfdUJ8DmHEK8857/PaewXlmugaSY6Ve+cDHoiBfJlP95yta9DNx5DRztlYE1
	bRA/Sby9ROxKA6VT3hhZ4cFcHGXs46GaCuZMNZIXhjJXWo6A==
X-Gm-Gg: Acq92OFMMHRb16DMmiNcOgVP3EP9p+i0jlPtDYkYtDDH+xf3RNw/3kPekEpZbdKsK2K
	oOfe/jsxUz9wn2jDEYID7CVegpdnbZWpbdpA9llwDt0CMkPFIawZAbkX7XhE1Sb5fkYSE9UkGSE
	wzgFD41NQHc18owK/TvLvtsttyHbooCwKqaZk/ANPBCPJNyj+Zuykfi9GmtCoppwgoqmxTs4joW
	UrpnWW/xxJ7IJ33/g==
X-Received: by 2002:a05:690c:e3d2:b0:7dd:3f36:59d8 with SMTP id 00721157ae682-7ed0cfdfdcbmr158839347b3.13.1780940130880;
        Mon, 08 Jun 2026 10:35:30 -0700 (PDT)
X-Received: by 2002:a05:690c:e3d2:b0:7dd:3f36:59d8 with SMTP id
 00721157ae682-7ed0cfdfdcbmr158839047b3.13.1780940130520; Mon, 08 Jun 2026
 10:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAB19ukEzQZktJcBAXi8X2Pwz+hO_FcR+iiaK9nsCAumP9BrHnw@mail.gmail.com>
 <20260608142206426CGB5DlYd1xVlR8wrOawWH@zte.com.cn>
In-Reply-To: <20260608142206426CGB5DlYd1xVlR8wrOawWH@zte.com.cn>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 23:05:17 +0530
X-Gm-Features: AVVi8CcOHTT-aaiAsTR3LDPlyvyK1Yv-Td6vF48uAWWN7KC86YUXl0j5J289Oso
Message-ID: <CAB19ukFMu1tW5QkCOY2e=DWbKrehEDv_iO5T7vEfKEGkbTFEEw@mail.gmail.com>
Subject: Re: [PATCH] iommu/riscv: Add dependency between iommu and devices
To: wang.yechao255@zte.com.cn
X-Proofpoint-GUID: GisjpDbcpkrP6rzGRsRzhZ34S4xFH91r
X-Proofpoint-ORIG-GUID: GisjpDbcpkrP6rzGRsRzhZ34S4xFH91r
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26fd63 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=1RTuLK3dAAAA:8 a=90lprICnAGeg8zAacqkA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NSBTYWx0ZWRfX7sj2RSmAE73A
 8JS0t9A/0kdLZJnXkiEa7F9B/Oh5715KM7E1kZM1RDDrE6QKcWbUjEjBUrTkS7wrA3xSVO/dkVd
 tw20ORF9U9tS8L4UrEXLLkt90HfUaUtDaKJWx2jL5w0eeQqqoouzCA6LOX63XbRP6epwzrRmOrP
 38kDmSn3rJzcxRds72mz3sDoNyRdsbgED9g69MGAIrqqmspzDYApfQQ2SL0odJ9lytCT7ninCNB
 7QKzjkf+UITQrT/6MUgH6ZeAx3dDa5ZM51+1qIg+GdGXe8HGwM3kGnqOxKVoOqPfd3Pu+PdY4Ty
 M3GdDY+wr+bHDuqDGiKwpqcU4FMasG4XBN45Cb7RP5paapW7W5QfaU62BOFzH43PifG8KspTnFc
 W7ZQBHvOIzSuRIgN4e0xPA7yyMSOx9AhfLSr2bnYkTo/U86J/gHsFnZKk2FwNZPBWb7qgDCz+Wt
 OFwFRhBV2iRdF35tkvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_183535_727111_04F231E4 
X-CRM114-Status: GOOD (  16.17  )
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
Cc: aou@eecs.berkeley.edu, tomasz.jeznach@linux.dev, alex@ghiti.fr, rafael@kernel.org, anup.patel@oss.qualcomm.com, linux-kernel@vger.kernel.org, andrew.jones@oss.qualcomm.com, linux-acpi@vger.kernel.org, iommu@lists.linux.dev, palmer@dabbelt.com, linux-riscv@lists.infradead.org, pjw@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gOCwgMjAyNiBhdCAxMTo1MuKAr0FNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+ID4gPgo+ID4gPiBGcm9tOiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8y
NTVAenRlLmNvbS5jbj4KPiA+ID4KPiA+ID4gQ29tbWl0IDkxNTY1ODUyODBmMSAoIkFDUEk6IFJJ
TVQ6IEFkZCBkZXBlbmRlbmN5IGJldHdlZW4gaW9tbXUgYW5kCj4gPiA+IGRldmljZXMiKSBhZGRz
IHRoZSBkZXBlbmRlbmN5IGJldHdlZW4gaW9tbXUgYW5kIGRldmljZXMgb24gQUNQSQo+ID4gPiBz
eXN0ZW1zLiBPbiBkZXZpY2V0cmVlIHN5c3RlbXMsIHRoZSBpbmNvcnJlY3QgcmVtb3ZhbCBvcmRl
ciBhbHNvCj4gPiA+IG9jY3Vycy4KPiA+ID4KPiA+IEludGVyZXN0aW5nLiBXaHkgaXMgaXQgbm90
IGhhbmRsZWQgYnkgdGhlIGZ3X2RldmxpbmsgaW5mcmFzdHJ1Y3R1cmUgaW4gRFQ/Cj4gPgo+ID4g
VGhhbmtzLAo+ID4gU3VuaWwKPgo+IFRoYW5rIHlvdS4gSSBoYXZlIG5vdGljZWQgdGhhdCBjb21t
aXQgZTE0OTU3M2IyZjg0ICgib2Y6IHByb3BlcnR5OiBBZGQgZGV2aWNlCj4gbGluayBzdXBwb3J0
IGZvciAiaW9tbXUtbWFwIiIpIGFkZHMgc3VwcG9ydCBmb3IgImlvbW11LW1hcCIgdG8gdGhlIGRl
dmljZSBsaW5rCj4gc3VwcGxpZXIgYmluZGluZ3MsIHNvIHRoYXQgcHJvYmluZyBvZiBQQ0kgZGV2
aWNlcyBjYW4gYmUgZGVmZXJyZWQgdW50aWwgYWZ0ZXIKPiB0aGUgSU9NTVUgaXMgYXZhaWxhYmxl
Lgo+Cj4gVGhlIFFFTVUgUklTQy1WIHZpcnQgbWFjaGluZSBjdXJyZW50bHkgbGFja3MgdGhlICJp
b21tdS1tYXAiIHByb3BlcnR5IGZvciB0aGUKPiBQQ0llIGJ1cyB3aGVuIHRoZSBpb21tdS1wY2kg
ZGV2aWNlIGlzIHVzZWQsIHdoaWNoIGxlYWRzIHRvIHRoaXMgaXNzdWUuIFRoZXJlZm9yZSwKPiBJ
IGJlbGlldmUgdGhlIGNvcnJlY3QgZml4IGlzIHRvIGFkZCB0aGUgImlvbW11LW1hcCIgcHJvcGVy
dHkgZm9yIFBDSWUgaW4gUUVNVS4KPgpGb3IgUENJIElPTU1VLCB0aGUgZGVwZW5kZW5jeSBzaG91
bGQgYmUgYXV0b21hdGljYWxseSB0YWtlbiBjYXJlIHNpbmNlIGlvbW11CnNob3VsZCBhbHdheXMg
YmUgdGhlIGZpcnN0IGRldmljZSBpbiB0aGUgaGllcmFyY2h5IGFuZCBzY2FubmVkIGZpcnN0LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
