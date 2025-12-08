Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B87D3B7E1
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 12:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/v6FYa0OX/uHvNwHATkn4cLYLQ2jWR7SATYNGFUU4Q=; b=1AMQ1ULaVSK6Gk
	nh6rHraqImmtYaKxcTDG8a+uMMymm1WW6QfLOxaPd7Zh/cEC1OeblElHHSwoO+eyxBLGYLKLURmH6
	IB4zD2K7YkbUgW3afJ417gcxNYuunVanrG9aVbNLnxtv6PKUAD0l0zLUQ8okQ+bJcAN3FTPfck4kC
	Nttnk0nSEGRkDycsxmeGuLTk6e5aXEH18ZpkiAv8UJ5q2uWbBocwckMT0aG9Arce9BVd6s1shbH23
	e+CE2mXAsO1TrqfkS/kVi2fwrliz+Vesqpvk3jcQxZn+odtz+YwXenuYRz1B9hXZMqlL8Kw2CBsAM
	9vhuK/1IEoC+DGXVJOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSal4-0000000D5wQ-25MV;
	Mon, 08 Dec 2025 12:54:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSakx-0000000D5vq-3WZV
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 12:54:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8CheYW850772
	for <linux-riscv@lists.infradead.org>; Mon, 8 Dec 2025 12:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8NW0eaIjc+/bup2mAkhtGsrWNXPoYpo4XqyUD9efLk=; b=PBb+1WSw63YxN4kz
	y6Zuccu7OaSLyKKqukOrjIbfV0uaBTdNMwdYOssPHT9Bowhd7dYfP97+eZFQ/l1r
	hfMGjynIEaSLf4ejgJ3LDabAU4WHlZTuRLVVoH6Duy4eFO8tOfwn1CbiCBd1gXqA
	WQXl8VAHc9XBCDcEzhoQ8BdPmWuAVaodbwUhaiJ9olclmZrOKHdJIhi8wvnNtJ4B
	a2nAZS46+N+c6EugtznuMuKJ5tEBAq/jPitbGXdKn2hJMtkLLgA8bxs4vJCCHWnm
	XPRrcAV8k6rMAsrIwUhSHY/PMGE39Pu/AFjt/iGB9ZecBPhHOUScIiB8pmqeg1io
	PPj43w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awxxc00sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 12:54:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737e673so5598281a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 04:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765198461; x=1765803261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8NW0eaIjc+/bup2mAkhtGsrWNXPoYpo4XqyUD9efLk=;
        b=NeuF9bquwAp0MzE0DZukY6/iYqb05MIe6bkPVl11vcv/PqybbBrox2CUaF0wzXGRV5
         2nPNdI5wbTe2k9LhrUjSicB7NnJwfdhHjr0sx6Zssca7J3G7Uh5MTit2LEPMFbX+sipY
         oMcLY9Sr9PtLU4ao/p8ymfmJ7eWwgCJiHMYOu1aAh4SY4G5RPKpG6YDMBYQYwAo8S0yo
         rg09C8ETJZvVF/BixDmWm2bTjbRPU6ugDySQoMbs09fmRLnrkCdTlLUFyUJg6oeLrEC0
         5YE2SE4gsjKmJMYEkxUklXW5hwt8kPNm3K6XF1Xcsh/HV6xoTLWsbRBC8cSujZXRqXAX
         I9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765198461; x=1765803261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8NW0eaIjc+/bup2mAkhtGsrWNXPoYpo4XqyUD9efLk=;
        b=VUr+tV7hNtuSO956bAxg0zaRgkGGePmAGPpa6x3jxlCtnfuV3ADRFNnrb8n+SSwJ77
         9YFhf147STMk5w8g9HRQQjXvUOxYqn+dsqtnojamsTT02OBRXGyrAQB6wQDSo7g7CEpN
         x5NgHfWHk5Svq4BuXHujJeX8oRQtifO9J72AQtadI75Q3+1D9PFt5GVfVeUNU0Y81sag
         lXrzS3Gwel30gQLpkoCGn11WaY9jhwZ2zTJM2g9w6V2dWqCv7/VIOrUWHonBVbPZPqXJ
         CrSaAiqAcghYfvPrv4m8ZbHU4UUAtiAO+6Q7X01sHEgyf7Pi3MxeyZODeJp7f2z6KwBS
         njqg==
X-Forwarded-Encrypted: i=1; AJvYcCUNqktqo3hlV6y5Unx27IMw3Hyw1Gy7WojhmbYv5om8jSrMta1HCWqZdqkDbQqJis4xx3r3KJ+Lc35X/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp2UAU1VH0MxQ8DeF1hhyxv8Rmr1xdK5Ziw9KnYjA6z5baXPIU
	Cb31ls+ji8cLPQg8iUecjnfJaHsFvF/fktgRiq5LQqhXh4JSC/wo6nzufnpaJ1+mrxBW17w7U+8
	6c6CMuysbAUxp732FJ4lK4ST15C74Q7iqHre8Rvncm6wvv2Mr/INtgyRy6Kcn8Cq2ylzSLSw=
X-Gm-Gg: ASbGncvG9GWcTk/w2XyfmDDLMvGRD9rOxP3aY7cUOoRFhxp4Vj/Wvf09ZBlT94PphIH
	PpSPY7rb+4+GNRM3JVZvClnqMR0NK/uWghMdXNFbBjspi91YvsniiQOZGhK/jqdqprAdt3gsRep
	KMmxDG7B12eGyS2cvRrtfwP1b36BuXggVLp2PlDABWAC/M6IwDRPr/o53pWvQM/syHJEgkYDbYl
	Zld5zPL5m6fd5M/cG3pwsQo1q9nJOMLTgdXay8EixRomteWL7uThfRWS1K++sk0+0BmFJd6K2xs
	+03DR7Mg2j3Aa0K8RpCOaEsRhglky6JgRRARAaOGwZHsTmaYoIQV/shIZacnyr2sZFXv3UzBVOD
	UDSYHX+v6OtHSEu4/QFb3QeRw7a8qhtMafgVl9es=
X-Received: by 2002:a05:6a21:3288:b0:334:a11e:6bed with SMTP id adf61e73a8af0-36617e8a4e7mr7819562637.29.1765198460685;
        Mon, 08 Dec 2025 04:54:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7OUkYAdQN7i8QZ9P5DCVYGpdvwsmAM8jPa2jw2GtZJTdd1JqInCFhs2mSHfHefLyYpmevhA==
X-Received: by 2002:a05:6a21:3288:b0:334:a11e:6bed with SMTP id adf61e73a8af0-36617e8a4e7mr7819539637.29.1765198460150;
        Mon, 08 Dec 2025 04:54:20 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf748c6bcacsm11868865a12.0.2025.12.08.04.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 04:54:19 -0800 (PST)
Message-ID: <2c0d09b7-0d8c-4bf2-a1bd-1dc4b58cd0a8@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 18:24:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Randy Dunlap <rdunlap@infradead.org>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251204101730.1036671-1-arnd@kernel.org>
 <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
 <0b061075-ab71-4ac1-93ec-438ddaaec903@oss.qualcomm.com>
 <aTbCqyOuprPOyU4X@sumit-X1>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <aTbCqyOuprPOyU4X@sumit-X1>
X-Proofpoint-GUID: KgUHXlvDaTtc32ZjX-M326E0pr16JGUY
X-Proofpoint-ORIG-GUID: KgUHXlvDaTtc32ZjX-M326E0pr16JGUY
X-Authority-Analysis: v=2.4 cv=AKf9OaRj c=1 sm=1 tr=0 ts=6936ca7d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tbvlgjoc70kLmXw65C8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEwOSBTYWx0ZWRfX9PwEdkqSUcCF
 DiZ4OHx6zgjjkQ2JodGtSG6BWW246lY3YgfmAHINs4aqt9vbZvb2wsLes/BE9bzyvkH/riQE794
 4Juo7KRPjyzviaoUvWQIQ+3OgTu4S+W/k5yEvOT3dio+MJmT4g6MZKIs/R0aZDuraIQmrphefKn
 pdMKdts9PojD/BYUS3zCyBBpYUtPZKL9SK47sR3HnhZnnbB0Jjq2yyy8SMIqvgqKfn3+Vxe6oNx
 3+Vk9AgPBg2TZ4XI0LYHC/QN4hBU4I2HRp71MiVRHuX14QNAkC/sp1AZ81Gmi0dGP+0Lq3juE1Z
 ZNLE1omjLBVUe0mSuLFoJIXTs0mgE/b9Uq3WIMkthhAAdsng07LMBvKoc0pFaVNiDxLyPOJt5ln
 HeU1tXcheTbtCMssjo+6Gz7gjTaXSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_045424_182757_76A300E5 
X-CRM114-Status: GOOD (  21.70  )
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

CgpPbiAxMi84LzIwMjUgNTo1MCBQTSwgU3VtaXQgR2FyZyB2aWEgT1AtVEVFIHdyb3RlOgo+IE9u
IE1vbiwgRGVjIDA4LCAyMDI1IGF0IDA0OjI0OjE3UE0gKzExMDAsIEFtaXJyZXphIFphcnJhYmkg
d3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAxMi81LzIwMjUgMTI6MjcgQU0sIEplbnMgV2lrbGFuZGVy
IHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT24gVGh1LCBEZWMgNCwgMjAyNSBhdCAxMToxN+KAr0FN
IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4KPj4+PiBGcm9tOiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Pj4+Cj4+Pj4gVGhlIHRlZV9pb2N0bF9vYmpl
Y3RfaW52b2tlX2FyZyBzdHJ1Y3R1cmUgaGFzIHBhZGRpbmcgb24gc29tZQo+Pj4+IGFyY2hpdGVj
dHVyZXMgYnV0IG5vdCBvbiB4ODYtMzIgYW5kIGEgZmV3IG90aGVyczoKPj4+Pgo+Pj4+IGluY2x1
ZGUvbGludXgvdGVlLmg6NDc0OjMyOiBlcnJvcjogcGFkZGluZyBzdHJ1Y3QgdG8gYWxpZ24gJ3Bh
cmFtcycgWy1XZXJyb3I9cGFkZGVkXQo+Pj4+Cj4+Pj4gSSBleHBlY3QgdGhhdCBhbGwgY3VycmVu
dCB1c2VycyBvZiB0aGlzIGFyZSBvbiBhcmNoaXRlY3R1cmVzIHRoYXQgZG8KPj4+PiBoYXZlIGlt
cGxpY2l0IHBhZGRpbmcgaGVyZSAoYXJtNjQsIGFybSwgeDg2LCByaXNjdiksIHNvIG1ha2UgdGhl
IHBhZGRpbmcKPj4+PiBleHBsaWNpdCBpbiBvcmRlciB0byBhdm9pZCBzdXJwcmlzZXMgaWYgdGhp
cyBsYXRlciBnZXRzIHVzZWQgZWxzZXdoZXJlLgo+Pj4+Cj4+Pj4gRml4ZXM6IGQ1YjhiMGZhMTc3
NSAoInRlZTogYWRkIFRFRV9JT0NUTF9QQVJBTV9BVFRSX1RZUEVfT0JKUkVGIikKPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Pj4+IC0tLQo+Pj4+IFRo
ZSBuZXcgaW50ZXJmYWNlIHNob3dlZCB1cCBpbiA2LjE4LCBidXQgSSBvbmx5IGNhbWUgYWNyb3Nz
IHRoaXMgYWZ0ZXIKPj4+PiB0aGF0IHdhcyByZWxlYXNlZC4gQ2hhbmdpbmcgaXQgbm93IGlzIHRl
Y2huaWNhbGx5IGFuIEFCSSBjaGFuZ2Ugb24KPj4+PiBhcmNoaXRlY3R1cmVzIHdpdGggdW51c3Vh
bCBwYWRkaW5nIHJ1bGVzLCBzbyBwbGVhc2UgY29uc2lkZXIgY2FyZWZ1bGx5Cj4+Pj4gd2hldGhl
ciB3ZSB3YW50IHRvIGRvIGl0IHRoaXMgd2F5IG9yIG5vdC4KPj4+Pgo+Pj4+IFdvcmtpbmcgYXJv
dW5kIHRoZSBBQkkgZGlmZmVyZW5jZXMgd2l0aG91dCBhbiBBQkkgY2hhbmdlIGlzIHBvc3NpYmxl
LAo+Pj4+IGJ1dCBhZGRzIGEgbG90IG9mIGNvbXBsZXhpdHkgZm9yIGNvbXBhdCBoYW5kbGluZy4K
Pj4+Cj4+PiBUaGlzIGlzIGN1cnJlbnRseSBvbmx5IHVzZWQgYnkgdGhlIHJlY2VudGx5IGludHJv
ZHVjZWQgcWNvbXRlZSBiYWNrZW5kCj4+PiBkcml2ZXIuIFNvIGl0J3Mgb25seSB1c2VkIG9uIGEg
ZmV3IGFybTY0IFF1YWxjb21tIHBsYXRmb3JtcyByaWdodCBub3cuCj4+Pgo+Pj4gSSB0aGluayB3
ZSBzaG91bGQgdGFrZSB0aGlzIHBhdGNoLCBidXQgbGV0J3MgaGVhciB3aGF0IG90aGVycyB0aGlu
ay4KPiAKPiBZZWFoIHNpbmNlIGl0J3Mgbm90IGFuIEFCSSBpc3N1ZSBvbiBhcm02NCBwbGF0Zm9y
bXMgd2hlcmUgUVRFRSBydW5zLCBzbzoKPiAKPiBSZXZpZXdlZC1ieTogU3VtaXQgR2FyZyA8c3Vt
aXQuZ2FyZ0Bvc3MucXVhbGNvbW0uY29tPgo+IAo+Pj4KPj4+IFRoYW5rcywKPj4+IEplbnMKPj4+
Cj4+Cj4+IEkgYWdyZWUuIFdlIHNob3VsZCB0YWtlIHRoaXMgcGF0Y2guIEFzIG5vdGVkLCB0aGVy
ZSBhcmUgbm90IG1hbnkKPj4gY2xpZW50cyByZWx5aW5nIG9uIGl0IHlldCwgc28gdXBkYXRpbmcg
dGhlIHVzZXJzcGFjZSBzaG91bGQKPj4gYmUgc3RyYWlnaHRmb3J3YXJkLgo+IAo+IFlvdSBzaG91
bGQgcmF0aGVyIHRlc3Qgd2l0aG91dCBhbnkgdXNlcnNwYWNlIGxpYnJhcnkgdXBkYXRlIHRvIHRl
c3QgaXQncwo+IG5vdCBhbiBBQkkgaXNzdWUuIEp1c3QgZm9yIGNvcnJlY3RuZXNzIHNha2UsIHlv
dSBjYW4gdXBkYXRlIHRoZSBsaWJyYXJ5Cj4gdG9vLgo+IAoKSSdsbCB0YWtlIHRoZSB0aW1lIHRv
IHRlc3QgaXQgYXQgc29tZSBwb2ludCB0aGlzIHdlZWsgYm90aCB3aXRoIGFuZCB3aXRob3V0IHVw
ZGF0aW5nCnRoZSBsaWJyYXJ5IEFCSS4KClJlZ2FyZHMsCkhhcnNoYWwKCj4gLVN1bWl0Cj4gCj4g
Wy4uLl0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
