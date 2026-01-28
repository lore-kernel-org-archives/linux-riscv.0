Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE01D35697
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzC8b1pk4m5gIG4bueYibn1v7bDa7YOKtssmKqN2kE4=; b=C6IHpd3k2yMUqr
	oK3D0c84wOSifq0BTanQTb8YyacEo3lwb1jT9B5gX13D8ZK/AOpxRtrPVv09YwqOj5LkeJk2SkdBH
	IuikpbD581rtK4wzWyJHF1szmS3I6qcmHtxll34P2iDrQmDeDYzyZYtc8nirKqoefW7OCmkD6LKz/
	+kWpBRoZu6Z34vAfSZM8J1l6/ObeWQ2ktBkV7/YUvjE0BcVa7vQXGA6koOjC2Bt2FiNv82VptfBB9
	j5LnmfvW2PuMLK9UTw1/nMsqZDOjTfNiJHB1lD8hEws62RDokh7EQ3sUEI/GoT5dpUQLM8ktRektm
	hsCQ8AYujUw2qbqjsMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl23h-0000000FllJ-02bT;
	Wed, 28 Jan 2026 09:41:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl23e-0000000Flku-1JQT
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 09:41:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91ukq3879263
	for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 09:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85LiEtbp+zi+7uf3UPx9/LEQW4aYkFFdpd5AsmHIyDE=; b=gH+SyO1eAPIg1Dys
	TTYgivMQJlYaU5DhyZ3kyCdqalNDxSAgvF7rdN84KxOIekidaPKJPPTZtXBaqNUY
	4TawC+o2SMTZ68uJg28jX6CjFJtrn9PZNk7JfL6VJ8a3k+EYbjum7ibGgkuqVtBz
	vHWkeRE7tNKOOkqdsIYI2QihIEIQoF/msdFfsA4PvwQ7wS4U56QBnapHLvP5YdrR
	B4yCiQO5jOnluox9IQNSpXXw5z1hnrpVWPdbA5XICsPRqDm0zb1jLA0BNDv0fDWP
	0vGmoEywqCUG60E0wECqHYS5NRzMRcu/uxkEfrH1+Hs/+hkt7Z3S4zQ3ygD4qA7P
	HSZTKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv0vat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 09:41:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5e166fb75so1708579085a.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 01:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769593312; x=1770198112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85LiEtbp+zi+7uf3UPx9/LEQW4aYkFFdpd5AsmHIyDE=;
        b=dtFclVMa0xDDzS25ijyWuUvQw/Ifd2PvVhZnojzIGhDQW1eI8ChLbdh3TXB9xwZIFX
         JA1PTgOIXc68/+KOSQRsE+By64DPOCU+jYoX4R/NdN/Lh3ye3hSZDHkoUagqxOYQCrXL
         8Cz5tZCMFjQmx8V9LNzhVV5p0Orzt60in590jWT/rxs2VoQekZX9fg3GiCXmz5e9AyVp
         F+QOMK9RagrUAzgm+4xX/6iWKFAnNbwRt2jP+sJdwq5FTLF16VGQQ7Hg6AxL17usKvGM
         IK8RPJTuLXtSgvTuv9mhQaVuo3dpKoEOsr5NdNMQ0bfohp8E9H44Fp0IebIfJHuMA5B2
         HMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769593312; x=1770198112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85LiEtbp+zi+7uf3UPx9/LEQW4aYkFFdpd5AsmHIyDE=;
        b=EJ61QytNHv7GW8Fh0aNSab3FPS3RVhCMOxL5c6XWRBA3/e8re53+TQsH67RlxbiELf
         C0limMg3bPwLwlbkt7yePHI+QlMhsbg7TM3z8O0E8B4kbdTn5mA7EvPwSlKHOcDmWuwA
         zyrNbUDRQz54CboEflYKp0ZbWTA9bCYI30r08D2OMLY8Ksa+I/zIuV4Fm9ZyGDtlyATt
         f4kfeMZ62kZ16ABvN87lU5BfUA8riSVcLAlIl+MePeYFChu2zmS4dtdv0Kqgb0qCFZ/x
         GOYnxN8DWGRJRMkFI+4tk/ptO/ptQkAeY5w/Fp07pBCbdRefMWY7FykHkh3ZutGdVqce
         f3VA==
X-Forwarded-Encrypted: i=1; AJvYcCVgfsQZ57khP011vGqjhjFaxGYOCGZlK3wa5NPA3HhB5EiRiv3RTC6d3Tk+fFlf/EU8CLUeLqcAXuMLgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy524xwBCqw4E35XN7c90d37YNczIOfjN6PFbSRVs+S+kihddxS
	C3y7E8Ezjt2DuRpwkRElWUkmrYwHFu48TT+lUhpIf7q3W6WhCc3wnEfpb4Srekex6ZP/UbrPEk0
	h61H6JBjgTTT1EejzuYz27Kj086mTOQ47x7WOgVuJ86EOyBNPsF8duWbbEKj2HUrKh5AJRlk=
X-Gm-Gg: AZuq6aJt1wY67ig+vCT6EEff30wIHohlnc9YxcEZyiqGjxP1Wrr6t+epl7jexbqsh0E
	YzxQaSmN5xbaXL8kqwxj+gdUYGUF9vXpYWIQ7vazhZk/Ko+L+8215Ow+8RszKESQQ/yOLOKGcy8
	zGAGscnozuShsdJENHfs5ACT7LFtS8hhVNNupN8Q7MEv7PLNo8Ixw90iRg9tSMZ/Eo/6dNdWY58
	O6Ilk2I4Shs6MWKbH5/IUjPQabNDRJGRvBY+XtGte7yote435kY6A5/TC1la7SudhsQX0OLgNCs
	MxNDcIJ8oREmU83QnqzJbVnW6bE4AWwfwgqK1qTNm83mJUcX/ZV9VZD4Gjj/w0zpiRLb63VoULo
	9KHni74+DJUw26MQ/xDHWJGbEq+OcYh6o5vFG1No=
X-Received: by 2002:a05:620a:2588:b0:8c6:a734:2c00 with SMTP id af79cd13be357-8c70b82272amr555901685a.15.1769593312452;
        Wed, 28 Jan 2026 01:41:52 -0800 (PST)
X-Received: by 2002:a05:620a:2588:b0:8c6:a734:2c00 with SMTP id af79cd13be357-8c70b82272amr555899785a.15.1769593312025;
        Wed, 28 Jan 2026 01:41:52 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6cbc:dfde:e62d:3195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfc9sm5410095f8f.21.2026.01.28.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:41:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
        Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
Date: Wed, 28 Jan 2026 10:41:49 +0100
Message-ID: <176959330536.12707.18374071693115296433.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
References: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
MIME-Version: 1.0
X-Proofpoint-GUID: pfBO4D1NmQuqAgSPwuNqxiQRhX0Nh6TN
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979d9e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gDi01W8oxqZMKvcAlA8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NyBTYWx0ZWRfX7A/+rIgQlMCT
 Ztp1yJ/AG6ayWSqdZCJdJ3eU8yOLWYUM56thYHZXOB2FVzo4AtlYE113diH536jKVDrXaLYQKjD
 APthwd7RpKDLKxnPVV0niQNrpVSZC+ZNQKvuWzpTvr+sz9WWT5pVjqsh5SfWrc5khnwMbeQC6OS
 kbAoRwag1SH2Va2nADwE2hc/ttnr0rSvMQ7WzS/OWazhfCHy+GQr+u0PeNXTsd01SQbNx0tvVB6
 ONxeqlhDGKPD15HCZ82OmRtWNTUXdq7leMYVDCV2Ed3ZTRq+rpSZVl7nye7N4ydXmpDJLFgv9ZE
 /PBRUBupctRVAwCO/tJkYO70Bx3SVtj6W5N0Qq4mrAHshyCVDZl5RONfFJgoPdtf5Ga0HQEvAsH
 DHh8ibfHdZ4q4uetQAVTmuKCVV7PaSWdWb/LLBPzBP2uyLis0wolSaKqV6QjmVMLv1FnVXaxr/W
 DFe2gL6j773KyagG/5w==
X-Proofpoint-ORIG-GUID: pfBO4D1NmQuqAgSPwuNqxiQRhX0Nh6TN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_014154_475247_E8B3E182 
X-CRM114-Status: GOOD (  12.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Tue, 27 Jan 2026 10:58:49 +0800, Vivian Wang wrote:
> On the SpacemiT GPIO controller, the direction control register PDR is
> readable and writable [1]. Therefore, implement direction control by
> using PDR as dirout, and don't mark it as unreadable.
> 
> The original implementation, using SDR as dirout and CDR as dirin, is
> not actually a supported configuration by gpio-mmio. The hardware
> supports changing the direction of some pins atomically by writing a
> value with the corresponding bits set to SDR (set as output) or to CDR
> (set as input). However, gpio-mmio does not actually handle this.
> 
> [...]

Applied, thanks!

[1/1] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
      https://git.kernel.org/brgl/c/aa7e37fd770bafaaf856ab77735296955b93e377

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
