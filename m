Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80428D232F6
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nggTpGRQsJdRtoJ50rqLhuM/jbBxJnpF/1tinC5TVCo=; b=i206MNPFPMcDZM
	9ejx7k6BQUwD0QQOEOLg5sf1ytPW/D8GcGv9z87CTC40jexBMWFE2+OBBxfnTwJyjvbxkxf3kHKZW
	vKFI2A30/5kFhkd8/Td4J5Hmwdd138GicRR0wZsu2RwpJwvS2Wcgt3xqJ5P05NlyJlrrGIi54JGVa
	iXAB0A/Ll1Yuu3ppO4juKnmUl4mlpkd2Ek5b8gZrIZxGT5bWpOp9wCHLF9vngOkUPf+D827CBkfs0
	JVH/ZQMJdI1N1NGE3lVQDs/iASYFNVQPb937I5NSMHrzcjHNzjNuQi2Pzg4ABKLsvmdgQ4k6yW/Ou
	FWSxSvrM7cQvkehcMd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OQ-00000001xDQ-1h9e;
	Fri, 09 Jan 2026 09:02:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8ON-00000001xCj-4Aez
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:02:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982W782183974
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvgWc29jzN/49P/rhW+5yK4jRWn0OB7E4Hh0dtdA5Ik=; b=VCs9IKIyu32kpsAI
	ZeiVo0iZDOppFqssC/Ozh8WGL/AqHT1FywG55nAc7ebhALPJp9boD9FebpsEeqnf
	19Z367Nv/06PSRrWvndZvvmp3wPvN8k9Hsjr2p31TTfcpLPtjzxWLgBklXfGJUvI
	JExUbyqIkjniDZLc/1xVF+o51yZfnTJWqlknLYgB/acFJTMY3EfscQUJX8p6kSvQ
	q1kAgD9v0ETtNPNEBuMpybQjS6AQS5vgzmoSThKHC8HkI0VEv/4czhQU7oxIog4H
	DGhA47D3YJ04urCV4QrEmHs8r2gIyZp0cP5Tz3npEl5j7QrtUP2Xf34b/YkDsSEG
	U4sH3g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn864h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:02:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81e7fd70908so599765b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949366; x=1768554166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvgWc29jzN/49P/rhW+5yK4jRWn0OB7E4Hh0dtdA5Ik=;
        b=Ys6cQBA2VmBNraneDRREK+MfgxBeq03XUUtS0yEHJoWHU1FlX4FuXijFCAzwSF0X0F
         yvzbn7i9AoFq/KBmeGMPxEYPxlav9p091uDSxxJeJfVhk/9/GJrGi1yCLqL5FppVbDiu
         98PqwUd/GX+EkSgKrPfveAyh6Bvm6jZwfSOognSgC8BNAKs2SNguBm08JoIgQl/HkhBE
         u+bieeSFXLVAXh8HxeDhOypk9KcMJy50HrKV3cvyZIw7aaaHdyzO2h4FCVul1kNghslq
         F/avHs5VtKgM3In3CzAo0v1Xy1EvqQYfASO2kqMu2eMs/3aeM+Q1PbBHIzIhS3/SlP4/
         KrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949366; x=1768554166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvgWc29jzN/49P/rhW+5yK4jRWn0OB7E4Hh0dtdA5Ik=;
        b=uIpfNyZwInFyxZRc0ccWU+75a7G7+5hX1enV7+QtKRpmFeGYUD9S4i9y49pUiLe0y7
         rn/uu7o8YBZLKt7XnaCgtVmofkMPzYjiENqxOehkCvlYm64A1X5k+AOnQfojRIWFRSnp
         kP2oXHlsWSvAd4V7dGHOI+SPqCTxV0eHmz7QDSM77M5KvnjhczeDkcXzf0FDjYmKFTIp
         +/+qMLqB6Nasp7TxvigTZcVE0wmqL+NdrDG0l00oGTRRS+opgjW0/+f9m/xrQF2SCFTd
         WCTfSE0bQL/KJ+1Et9v1ajVhnsmxdmt7C0CcGcCZqHb7lUXeKdtjjHCOhEB7qpBksh9J
         0wxg==
X-Gm-Message-State: AOJu0YwXYpgj2mpkZujEOl7MUM6GWuEVH6VHM8/ms6HocN18LtItYC0G
	4hZlJ/XBmXc/HbOX3lAVH+v87bdru1C6MdNR1eK4n9iK9Ml1uTBcuZSpuYJOOq5Pz11PB+tp77K
	VaQWicIipzb6NizqurKDTrNjRvq9kIfdBWbAc5XUvXqNnYvTEM58GJAy8IVJ7GxCifggxceSHqU
	8Chgc=
X-Gm-Gg: AY/fxX4bF5LvA6WqnFlk2Mgb4wKLlzlj190078S+8pHxO2aHCubbM58s/PxaEy3Xdym
	w3STkrAow8w6HWBTdnrTRtEC+Q7WBErtwo9RnSTYDqLyZD7fFAvC+x0NFSyU8hv6EOOmxWdGxPU
	J5fWstiKe4fREfR9PuQh459fZcQyZL+G2YWV5wGnLH8vBERPdfNp0Hq5LnTTC5qmo0dlWswl5sz
	hMcrGsvH4Os4N0VRUFmPe2B1eWaJPUnrkUK7JO60/RQB8hrmOgzl8PTAZYi+kMRKXExD4+CH6PS
	hHzJl/W0/n1aE5V97lQPWiLeY0T+fWPq30y4/wVxEYuzfOS990mPuHoqeaYBXzftDzFh0e8aPs4
	IrFuBcO+RxshyWXsHTntH7oRzoibeyIojmup6I1huqZH97v9ca/YCOfK2xjEiWedcIBakRtzNPZ
	XsaOiDNWgXzl7+YpokDAaqEEg1dLhdTMDycg==
X-Received: by 2002:a05:6a00:1d19:b0:7e8:4433:8fa0 with SMTP id d2e1a72fcca58-81b7f8dab26mr8201875b3a.40.1767949366476;
        Fri, 09 Jan 2026 01:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKnKdQCBa6kDhoymUf+Gyb4nrZ7PDDZAan9h/ZOlpJJiP8XQhbILGsfxIu865gK5xfMhg2Xg==
X-Received: by 2002:a05:6a00:1d19:b0:7e8:4433:8fa0 with SMTP id d2e1a72fcca58-81b7f8dab26mr8201843b3a.40.1767949366033;
        Fri, 09 Jan 2026 01:02:46 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:02:45 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 03/10] acpi: Introduce SSE in HEST notification types
Date: Fri,  9 Jan 2026 14:32:17 +0530
Message-ID: <20260109090224.3105465-4-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: IIeWvE2___McV49gVKb3Nr_mrmZ2Bvwi
X-Proofpoint-ORIG-GUID: IIeWvE2___McV49gVKb3Nr_mrmZ2Bvwi
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960c437 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h0uksLzaAAAA:8
 a=6zSMeUNXk5_XeOI1LAoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX+8zJ/I6knqNM
 RFZxAKZDCeoQk27kuKskI9DnI4J7yC4oV8Y9MFSjm3z1tgKdD9c5FymDIrBnreNE0qWTmXbfowX
 4lwwi5EBEA3eDpYtDs1wxFhL7jQZeyD4gSy/Z5heybv/TAWuVBOVLQo23ZxY9gMatsyi/fwNjnO
 aE7n8CMbYOSxtSEiCjUnbk+4JnPa3E/CYvyCSlxH8Ub0IYXds9U5SgWqJHMofguok9qmJ+oqL3A
 LKKLgaUzkJPfYx00bT//BwUjUg5xYT0QoaDLFV2Vn2nvnTd+JGder4JWD/WDYG+A4UxvIokkzc9
 twGRa+HBax9sWduFkjuTpj9XykzAkf8j6n+n07PFvTu0LePJCQz5n74J/XOkCqhbCplY6UkGk74
 9hWuzfkPZ4DZPqgfMP1ef1ZPNwUUo1RZRFoUGhdZ7AnEA3Qb/a0L1BTRKpSd3IJxDcw3cfp4uJo
 izxjad23LMz0vljg2OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010248_144149_3DF87BE0 
X-CRM114-Status: GOOD (  13.64  )
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

SW50cm9kdWNlIGEgbmV3IEhFU1Qgbm90aWZpY2F0aW9uIHR5cGUgZm9yIFJJU0MtViBTU0UgZXZl
bnRzLgpUaGUgR0hFUyBlbnRyeSdzIG5vdGlmaWNhdGlvbiBzdHJ1Y3R1cmUgY29udGFpbnMgdGhl
IG5vdGlmaWNhdGlvbgp0byBiZSB1c2VkIGZvciBhIGdpdmVuIGVycm9yIHNvdXJjZS4gRm9yIGVy
cm9yIHNvdXJjZXMgZGVsaXZlcmluZwpldmVudHMgb3ZlciBTU0UsIGl0IHNob3VsZCBjb250YWlu
IHRoZSBuZXcgU1NFIG5vdGlmaWNhdGlvbiB0eXBlLgoKU2lnbmVkLW9mZi1ieTogSGltYW5zaHUg
Q2hhdWhhbiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPgpSZXZpZXdlZC1ieTog
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGluY2x1ZGUvYWNwaS9h
Y3RibDEuaCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hY3BpL2FjdGJsMS5oIGIvaW5jbHVkZS9hY3Bp
L2FjdGJsMS5oCmluZGV4IDdmMzVlYjBlODQ1OC4uMjBiNDkwMjI3Mzk4IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2FjcGkvYWN0YmwxLmgKKysrIGIvaW5jbHVkZS9hY3BpL2FjdGJsMS5oCkBAIC0xNTM1
LDcgKzE1MzUsOCBAQCBlbnVtIGFjcGlfaGVzdF9ub3RpZnlfdHlwZXMgewogCUFDUElfSEVTVF9O
T1RJRllfU0VJID0gOSwJLyogQUNQSSA2LjEgKi8KIAlBQ1BJX0hFU1RfTk9USUZZX0dTSVYgPSAx
MCwJLyogQUNQSSA2LjEgKi8KIAlBQ1BJX0hFU1RfTk9USUZZX1NPRlRXQVJFX0RFTEVHQVRFRCA9
IDExLAkvKiBBQ1BJIDYuMiAqLwotCUFDUElfSEVTVF9OT1RJRllfUkVTRVJWRUQgPSAxMgkvKiAx
MiBhbmQgZ3JlYXRlciBhcmUgcmVzZXJ2ZWQgKi8KKwlBQ1BJX0hFU1RfTk9USUZZX1NTRSA9IDEy
LCAvKiBSSVNDViBTU0UgKi8KKwlBQ1BJX0hFU1RfTk9USUZZX1JFU0VSVkVEID0gMTMJLyogMTMg
YW5kIGdyZWF0ZXIgYXJlIHJlc2VydmVkICovCiB9OwogCiAvKiBWYWx1ZXMgZm9yIGNvbmZpZ193
cml0ZV9lbmFibGUgYml0ZmllbGQgYWJvdmUgKi8KLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
