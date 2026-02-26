Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1EFFD45F9
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 02:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iy2BqHwekDD15B6gYiZHLN6T5doiiJ4bkqawm2WHbZo=; b=Q5elyq1NdUn0L4
	ft7l13WhUl3Hnt8QWIoGMzlHjRW+qmWFuMaW9MCoXlXvsLDc/h46HGa3Ca9ByaebAXcGvqrfR1PSF
	rhWyt0EZ2kLRVJbY3JyEJu6gKOtT9UF0ztu84Troa5a0q9tm0yxCXH2neGVdLEia7hlaE2UPsvbl7
	4MzpDioOx4kraTVXsWgD8LZxDomh8MZwzUraZP0tMJYqllU6UC35bFnhV0KN729Krle+KFzZHodYg
	o3L2DsyYxEhsmbjr6tGe6VDNDoJ5LYQrkqYolnnjfiDiIQLFtQlglFqLlj+BUdGGqy0jMxJUwPXY+
	LIJFhunYVB/BGAaD36Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRQ5-00000005GYI-2HgZ;
	Thu, 26 Feb 2026 02:48:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRQ2-00000005GXx-0sRI
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 02:48:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH3mON1195802
	for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 02:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WgeHXGAdAt0j+botWO9FYEEY9kbME4KO8ZR9ZAyRsw4=; b=kL5SC11TZ6MdnV2q
	lIDIwnvydI4x1bi5QkTNNf56MMMuAmvgQIoPt+a4q48nu9TxFz9uNhfDTl3sYFOy
	cmB5tr4k7jUtTiGhuxHC7pHH6iXeImXT2I0B1f/cWvetDzFbUB+DtThprrGsREqM
	M8/mLEl4lfLQa4UfcLDO5XlqUDjJQik3Ye6L2H3aoGqW55QlpchXP6M+viQW21Xs
	pdkCunnPc+LJ/G9EHCENN0t5pHc8AytJyg/gJNW3fF6yhIRQ9C0nvFajiWOfKBd2
	flwgvEEcFhCbqpAoVZYdAe5V022XcPBRi5styN3VL/M3mYZwJGTX3ERYU0A6euHz
	QejbnA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559hfpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 02:48:01 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4bd8c44f3so4465726a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 18:48:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772074081; cv=none;
        d=google.com; s=arc-20240605;
        b=fbmSBQTM6WHjhdphx/ZPfEqMMajZWDjgT/YMzB7Nu7yU+/Dq97+i9/jcCNyowCSbpz
         Exyicl/YrLWaCNOpMCtuYGUv/ltGRBEKtLbmhUI3SyJITzcbeL1SBkZ6drH3eIjrbh2l
         6AVDiKW7nSbFklXDoNlavfMIRVn5sZb3zs3RrD1tFc3kJwPiWpPRg8ORDWF0wQ/24kDw
         S1DZVmFSXKKw8Wyt11MtzpedkGF+uqXTy1XDikkpNTIuIyZWRSWZuvWaLIC4sR2YSmey
         dvEsaYestdDs+J0FZOLRDiqt1r92kjIH9zDxmdHJAQIdwUfMP95LZbqKIh2axHL9Cmgu
         zpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WgeHXGAdAt0j+botWO9FYEEY9kbME4KO8ZR9ZAyRsw4=;
        fh=vK12HitZ6O8/G1E2RMXRciiG1D423UkWhsbLrBeUGd4=;
        b=B6p4QC5rIkOj7T3TGU1Y0kaWLnwt0ZRGuZzLiURaVGzRnNZnWw2ksSRNdJt5Edn80c
         fTanBQVr6uiVPwWCJpaXM1mSNI0KZkAzaBME2t1zhC/e8BQz536KvPuud549BQVhtkyp
         RYxWH5vkQO5qMjGSY2RZ+c+jd/MdtILQtVgmOHYYevoxqkIv6mqWvUGD7nhHchlt+anZ
         lluguFgNefgzUcfrnGwlgqFtO5YjPvAnejjLmf9HesaP6V+TPX3SF0ZmlqKKn+DJtp6i
         9whdgZxmLecrUZpIEUEWRcijzoVN07qtVfWBMvlPkbqnc75uC+wR/vcFbMsmSmo7g8RI
         yTjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772074081; x=1772678881; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgeHXGAdAt0j+botWO9FYEEY9kbME4KO8ZR9ZAyRsw4=;
        b=Ca0Uy5HIQIxTfgd3DViJJPUtE6NZUZpzy+x7l7S2nVUIhR5QZrJUrk7pWJw6QtJlNO
         ivEe0R0oKOHyvb7rqqarhCqI1sIE/dLAC9lPgGxg+YTxIZTYxQ63162vv4LuwhKSb/Xd
         Kvy64T6NzLA8DodgnwU9S/6Bpz7O05i0K0hS6rl+UajPhrISzTRGPFd3fh9nZpo5RAMe
         Uz5/vri9vQoPOx7jjLyTRuUUnogeb4N624C0DZb7RmZiwo+MvvcWHSTIiBLACo0rF52q
         M18PWxLkhP8AHbedpon7cWZQoyp8yA7YueM0SMT9D1LcKwHw0HeLoyQ3ETK3ICdyZAA5
         a3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772074081; x=1772678881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WgeHXGAdAt0j+botWO9FYEEY9kbME4KO8ZR9ZAyRsw4=;
        b=BSjGemoWWEkxkCaK1XtqBY3U7V6rBb9Z7iUdT81WkQsutDQbqHc/LR6vG+8ry8jkWI
         Rfd9oDLWCdsVP3tMP7Ct2QceS6RUCVWKbkH8ydKJWl2uMZIUzeGT5XGu5bTZsN763I67
         9hYUBlo2JMx/gKL79a5iPJ/ISI02sM4W0wGEZHLtoFRGGQwJGrVukApoTwPJ/qohKxuu
         Mp7b09Z28FRpVdHd9VpCOjOzUwVziX2SfEjlyAEoFHGkqXX9mG1LAGiZ10DecTioSqeY
         lqjyHnnCY+Wk0+mR9KQs1Lvi4mpnJX+SyrDU0s20kYbmw//ibrlRa4C/YebpnELjHCze
         MC5A==
X-Forwarded-Encrypted: i=1; AJvYcCXJKvt6Y8MJ7rRlNqjLPDNwZQlFQkThXRCCmMMB1zsKmmQG9Rf6XUI7Bjf9QnmTzD8jnUDRJDs5eY/36g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ5qMi/54usp6gJMG9dEoRvNRQ539Gz6fBharo0sSpln5T1kk9
	AP+F81YeRbk3AVo4eVrmp06YhVogk+1si8Z4HMAIZntE30swzih0NUbSK3It1U4KKmqqDjTZ4oW
	chgya96WmVGNqLGImRQcAiNYQLmXn8b/CxsiY8GvyS3JGShQtGzjzy1bBAzUDmfTte9St0yc8aH
	N3GIQ8HCWXpYNvCM/fjFfLSxclHV3vRwNg1ZA7o0Uye/Ma3Q==
X-Gm-Gg: ATEYQzzyM2zRR7fntQjpbwysruaOxGzgr6XZET6/X73Do7fLozNfGZ/Lm3/VjuU2A+k
	lkTkQ24zuBSb6zgi+HSZqw19KdPXVCPm5bv6OBtvl8+x1qXow6xCKngg0lS1lL2WDbaoDP5LrAa
	VU0jw2PhMPwkMwwvhg2Pa0i2CHvkrfTtl5QffpGFY8cN5U10I4sDhm/VUCfVZkpyjq4plvQ4unm
	bmtnTI=
X-Received: by 2002:a05:6830:442b:b0:7d1:91a7:8e15 with SMTP id 46e09a7af769-7d582a9889amr1522205a34.33.1772074080792;
        Wed, 25 Feb 2026 18:48:00 -0800 (PST)
X-Received: by 2002:a05:6830:442b:b0:7d1:91a7:8e15 with SMTP id
 46e09a7af769-7d582a9889amr1522188a34.33.1772074080354; Wed, 25 Feb 2026
 18:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260223-mouth-plated-50294c7a6ac0@wendy> <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
 <20260224-likewise-rimless-151f6a12b092@wendy> <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com>
 <20260225-compress-moody-400a1e2f46fb@spud>
In-Reply-To: <20260225-compress-moody-400a1e2f46fb@spud>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 08:17:47 +0530
X-Gm-Features: AaiRm507ocLQZhuPzs5CEtfB4PNGTFFDZ_1XXdnBYGClFxFf6NGZl6UQCga9cV0
Message-ID: <CA+Ht8=ZF2nT+gWwtEi5QdoKuOQPX5ts66WmFcF2gaoTNKT8hgw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, shuah@kernel.org
X-Proofpoint-ORIG-GUID: jyar5eke5_M9GxWlKdYWVYUBYiHZ75e6
X-Proofpoint-GUID: jyar5eke5_M9GxWlKdYWVYUBYiHZ75e6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyMyBTYWx0ZWRfXw49kiM0RBjqz
 SgvwH6olf6E91KPRwlwUP2XsU/jp1QjLkhJjlLF90HLo8SxEe/7rtL/yNl84v6ZccKlX/C0dU0B
 cErXYwfoLFaCQCLH3AsbAyUiPn1AYN00pDF3JOasurWRR/JjFwD7htgZcqhgQVWQWLgXClER6uZ
 BdX+BA3FEp+4d41Jitx72UbgPkeMx7F2Jd6zuJ9Q4quSvOgS0NHX4YbaHpJKd1O1kzVmA6vFilT
 /vh4x1p/GG+hpCriStnCX5xm0VBLIvnx1+TdX3AEBnDdmdCFkwJWezbRDrmR96F861e0MTwpJsF
 HMG5heL83Yfm5fdj1f2YvGgIWfPKdM92jDL/zn7t+hYNnn+kKqgymk4lpQDR4uU5TVnNEGyV/Lv
 CW+EA80HtWHeiP+4u2CJvsyrSvIbjRFAJG0ZR+auhpZez3Y3zV9iwUT9RuDiq30cCa+mD+Bhrn8
 DsLzs/SzhjkaKqBdOLw==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=699fb461 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=XYAwZIGsAAAA:8
 a=lXySHqyfn2AQxE1QTzAA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_184802_274916_EA81B699 
X-CRM114-Status: GOOD (  19.33  )
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

T24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMjozMOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBhdCAxMDozMzoyN0FNICsw
NTMwLCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+ID4gT24gVHVlLCBGZWIgMjQsIDIwMjYgYXQg
MTozM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBUdWUsIEZlYiAyNCwgMjAyNiBhdCAwOTozMDoyNEFNICswNTMwLCBI
aW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+ID4gPiA+IEhpLAo+ID4gPiA+Cj4gPiA+ID4gT24gTW9u
LCBGZWIgMjMsIDIwMjYgYXQgMzo1NeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIE1vbiwgRmViIDIzLCAy
MDI2IGF0IDEwOjE5OjE3QU0gKzA1MzAsIEhpbWFuc2h1IENoYXVoYW4gd3JvdGU6Cj4KPiA+ID4K
PiA+ID4gRGlkIHlvdSBtaXNzIHRoZSBjb21tZW50IGF0IHRoZSBlbmQgYWJvdXQgdGhlIHJlbWFp
bmluZyBUT0RPcz8KPiA+Cj4gPiBOby4gQXMgSSBtZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRl
ciwgdGhlIHB0cmFjZSBzdXBwb3J0IGlzIG5vdAo+ID4gaW1wbGVtZW50ZWQgaGVyZS4gSSBhbSBh
Y3RpdmVseSB3b3JraW5nIG9uIGl0IGFuZCB0aGVzZSBhcmUKPiA+IGltcGxlbWVudGVkIGluIHB0
cmFjZSB3b3JrLgo+ID4gVGhlIHRlc3QgaXMgZG9uZSB1c2luZyB0aGUgcGVyZiBldmVudHMgZGly
ZWN0bHkuIFRoZSBzZWNvbmQgcGF0Y2ggaW4KPiA+IHRoaXMgcGF0Y2ggc2V0IGhhcyB0aGUgdGVz
dCBhcHBsaWNhdGlvbi4KPgo+IFRoZW4gdGhlIHBhdGNoc2V0IHNob3VsZCBzdGlsbCBiZSBtYXJr
ZWQgUkZDLCBzaW5jZSBpdCBpcyBub3QgZmluaXNoZWQuCgpXaHk/IEkgZGlzYWdyZWUuCkl0IGVu
YWJsZXMgdGhlIGRlYnVnIHRyaWdnZXJzIHN1cHBvcnQgd2l0aCBwZXJmLiBQdHJhY2Ugd2lsbCBi
dWlsZCB1cG9uIGl0LgoKUmVnYXJkcwpIaW1hbnNodQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
