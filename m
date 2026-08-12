Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF44C5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 08:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BOQrSQQl60qwxpUVnEo7xIec9ZZ+xDOmYeZbiqzyWk=; b=lz5uEHztAZiEz4
	j1SJXE6ufTVkZrcWgzMADZlsgv/tKkw927Dn8nyyd3p+4rLQbJcJXJgn+iAcd6zQktHO4m3do/iJw
	z/six8SpWuMpN6ByY8jHaUtdrWL5mLF8hpUBiTl7zsRNJuyshPbeOqunM97fNjvwhroY0uvp463Wq
	xWuM9wf0hd6fbtBwwbx8krv1nEyjpjAhJLkM33925scuQ34fiCKC0ZUdwmrs5uI1PJznjOOERxGxn
	lbDmmMiCsJkhsqpmvWbTvzYamrFh8P+fmBjkWecUrHdRG3RAy3C3FTuHoq2z8QaJ0xGEOxCSpTHVr
	UMXJWBz6LLkKLDus8dBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4On-0000000FeWZ-2yPa;
	Wed, 12 Aug 2026 08:33:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Ok-0000000FeUr-0LAG
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 08:33:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62abH1720806
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 08:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=; b=CMi+xbV8rlZ997l6
	8ymfyCRnjTVDNYMTFbQHDvUOjeReWM0cMy1Nw29jxh6/EDU8FzIYaqrlwgV6Dugn
	Th7xAreT9RbRpZiaZNk+Ysied6XpVbJFURZv2SgQTM/+JG5tUZWc3Lr/c4Vf7A5d
	l6jMNpk5fMu0/wKwGbZkUeDeUixWNfMRkRazXLD0J8FxCUGrAjjVIhnO7GBU5dQD
	bvumQhfhc1mO+doLBf+WbbcnepCS6H5Ic6uwaJaHFNlixse9tH3RAXjawBbJR5fQ
	hO6a5Chx7vTh8a3CJdlOdTlrQnchK70Mpj7t7/gHEA8jL3rmO0tDthA+ANAZEa6T
	OdEjbw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw0xaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 08:33:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so11113751cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523596; x=1787128396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=QSoNVmsjmOdPuxgUaiqewWoLogdY/TgyG7V0bZEI3312Y9PM1t9IOV/BThDE5WPX4u
         B+A2FBumvkB2ehzd2Sr8Gje2IshSc4EbIxF2lBIZiJH1Hj4zMVjpkpaDcX87fwgunq6B
         fFMwGUBCgw8LxzMZ2Js9B1nn21idf9YQcIJPRzDLgOEJ0Z/CjUSeV3IYMmFiUpLVSiD9
         Fs9pBRauxdYs4Drc+01MYz97ry/G5Sawn2eYJ6ODj3B2kr4JBcUlqrFXy/BzEBAuxk++
         ItLDxplcbGp00TZho6YjykcVhX7dBlHeL5WZuntONycu+6NdTYDiPTWhPGvdPgtwah3F
         ibjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523596; x=1787128396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=ergtbtVl7I+RGHflwY73cHQG2IkmPxHzE8vL/iXQBgFPA67tgT5B1NS8iHFABtUpwf
         2dm2FOJrs9iOCXsEdFokRMZg2M5lh3ZcZuZnkcBptqrVd+LKvygfTlO6m9RZZtBaQnlo
         Q81gJh3VQ7yPGXCZcpr4bUkglBsXLeFC4Ojx77AotHe796IOdTKoMK8oXV/iWbtiPeQO
         aueZq+yy5gI9dhAzvM9nBrlyjI51NQ9RH6v+jfe8v+QqciPZeLukfGdbUpeSuJzO4UtR
         s/8+fYT77ajPuP55oW0lFYHCK8EoELmDYyPbMavKKQV/01ADwwPgqP10DKHXnE8h/lI3
         zmWw==
X-Forwarded-Encrypted: i=1; AHgh+RpsiUKGLfmR8r/pBq4F1KJqcWzqnpYFiMQ01eNHTlB1MH0Pd2ECwd3ZvLq6OUK/4rsHHW1bKd5nrpViOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy03cDiz96yYpZ1L/14KrZejvlBpHq7wkNNLU8HIIvLW0r2J53r
	fJoby4912/dDI5adm4EpJitNZzOYBFQh9xr3NotdxR0kSESChHgeRmhaJDr5KHNbCBI/wgBP20c
	dM2hOFPrEGK75EvcRhqfuK/oQAfKjd63AhlXh5bW6mponvWtR69WwlRZJbiKCQPsxn+QJ5z8=
X-Gm-Gg: AR+sD11arjZujV2k4Jpom/GgZn0bLkWzeD5zYDzZPMZfrEjZqdf2KMGOQvuSClCVaEn
	pVJAflO/WFQAsSD5ZX887sbCKJEh0baykr8yj217CuR7B5HWm5ShCqKQW2/S6MazpUIotSh2g9e
	p6PPTznwzkuAmu3Ux0tudEyQqPlhYkKnx7PnBT9UD/GnpaJMk1cBvJcnJe0gICGqz1di/1776pG
	3NvRdol5fB1sUnGJoen9Cozga/ZTzBjb0wzy8g2+asqyirUj6Tg+y3u1o9MCyle/7dHcqVPID68
	F45Dsmc7hd+OotsPRQD6YnUa5U8FhF8xAS2Ofb6jrXLjyM2g5E56EoGSXDAjuZtT3w7AohNKPOj
	C1EmnYQkb3N2W/JW/NI+VuQC412bMmUng9I8LwoqML4kiO0jfLgy/NHz7sl9tsWo=
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115361cf.38.1786523596201;
        Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115061cf.38.1786523595799;
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c998f27sm28031395e9.15.2026.08.12.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Message-ID: <16d3f0b9-2a12-42d0-93b6-b9da3f540256@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
 <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX0BSxdYtWZTvY
 RI1Xj1AMLdc8uwW4NMftC4x0FL9hTi3hD8bQwNMJTkOHvh6Nh+P/UBLFv0HzboqnF8lHn0L8CVN
 BG5OhYcOhpQ34xZrK4cvIbg5Q7Lh8bc=
X-Proofpoint-GUID: vs9nSF-afezzOuHPgtG4TnWhhPxfUp0Z
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c2fcc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eCx_7nzpRrifSLxMv2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: vs9nSF-afezzOuHPgtG4TnWhhPxfUp0Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX/7q78gs+gqvn
 7SaJuQDrXVvnp604x4KbWZyohtiv8+JXB58RqVXiRGgtIG2Vjfx4oQ8N0lGKhkoDNc5Y4up2Vnj
 ZpEom0xDBf5A47fOrI/sWfDAlo1wXXCbuYgMQL7I+3y+gL0hQ66W3MZ+20B6ZFGFuDacP4J5Wd/
 3TagOOLm9vVDYBWxduURD7BM56bvmcJG/njXp8Wa7yWkhA7hfI5OIYb7HpmlD9qWpvH7OQRTsVe
 Qo+k8hLoLYJPWcSdmDER15sCTT41IFglr6iXrx23dyHLVtlQqhVih3HtGgFyBX97LsLk1yaHd3h
 HJstKcuqKPgNQE95Fs+Z9KmkB33+gkl/ITeFKYqOTnqDIdaUrYTIA1ht8rEXV+DnfbQj7bwSaBG
 /FQVsFdBVObK664xzshxqOzmxnehn/XI/JEw+BogkJFW5xX/d95vGivX9tj3hcn22facAZmwFfj
 G0SoXKmNnu//hNUVL7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_013318_291426_5A79CF28 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8yNC8yNiAxNTozNiwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4gTm93IHRoYXQgdGhl
cmUgaXMgYSBkZWZpbml0aW9uIG9mIFZEU09fQ0xPQ0tNT0RFX0FSQ0hUSU1FUgo+IGV2ZW4gaWYg
bm8gdkRTTyBpcyBidWlsdCwgdGhlIHVnbHkgaWZkZWZmZXJ5IGNhbiBiZSByZW1vdmVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51
dHJvbml4LmRlPgo+IC0tLQoKQWNrZWQtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fu
b0Bvc3MucXVhbGNvbW0uY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
