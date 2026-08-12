Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA96C5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 08:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvH6ymQB9XQkIId37vbnhYD3IGoJrMTYdZeausaP8U8=; b=skAb/hMtQv/A4V
	4MTrVMJf02hU06Wr+opK16sbmvUqhmsAB7EohMa0qYOHrLAY6a+51tb+/lbLHhbQkLaaKHPxo1dOh
	VO1rdiRyZFmfZ9jNnf9KOGRR2jPwVshtQIVtOm6+r5xSYaVyIO4vt4I534N7d6pCVbPaDCtSfgMj1
	d8BaFpDPm54766E4xmuJRVFQXUC7qfm1j2TkvBokoGi2XXUeLvPApuLuZtDlM6cK1cI2vnHryOKd4
	9A/mINWuRkEUO8FCGexRnBNHbPstzHnld7cXtCUNVZwCo//px/5X9kG/OvCCtl9FEt77UYfxhTehI
	z6bDpGnfSkF+AoO1mCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Nq-0000000FeEi-2sxP;
	Wed, 12 Aug 2026 08:32:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Nm-0000000FeDE-0vjb
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 08:32:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62QeE2641620
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=; b=b8C9Yqg8Zv7ud594
	nLhBjn3LD0R2IFoZBphwr8fNk+G3TqgTAuGQRrLfP3UKNc+w9ecbVuIvfdwhgDUx
	MskA2v+orWOZkzQQc5qbsAoL2X/1Ibgu17Rsz0bi7WmtOCjmGpoHHovoyRSvSfgt
	jTafQSFR/yRRt4vo9apKANAlKhmbFAiqH887KCdB6o9SoZf546OmI7m6fYiyPZ7a
	WFCs785nwPsjy22clIkMH1I7BhQxrJiWr554cT8F+65SPndBCqt7Pm1r4Vwg1hhN
	7Ok9ydvCxHueLfYe96jQOcXPNTpqbrv4HLjZXsYIp38gQ6bCWQ2W0o9Ba55y0NMc
	SmZw1g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049mm82h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 08:32:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so14766211cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523536; x=1787128336; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=cdmXhaPPNJ5W7vgMpBAZz9k4Wmg6k2jcvKtQlXR5Z8Mt71vw2m8fL+Xo74zvI4v7TU
         wA8QJAHRG0KTHFQInBynPYwxPCxNaK51WFrr/Eg0Ld0K/2GKPD4lbFGyD6Kx7MT0Nq3/
         GitWK91RomlFj1OnUOAqwIm581J56WVdaILvnD+DVx+52OXwkhBEm0LBqWfG0ShGgnz+
         R8M2VsGA4tPLgL0Q8m1mZC7wqfuYp3B75ZyGPjFzVUMFyVwf3CHq5mLkmVUQ+3XEccoe
         9LUgFLKd56eLsMpzaRPQu2izNMBIatWWXLwxtWaq83ARbC3R3OmuThXgUa8xmE0EsPgB
         U7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523536; x=1787128336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=KvdeNXkeQemrHJMdtjkCwvyEaubLOYaBa4WanyI2HbrcloB3lRvfbHNzhdXyuvF4B4
         WAvg+kRuV9xG/R63vqtRtxtLLvbIJh9Mr5MQBGhpOOhV3XrN25nTtIn65Ew5MZZyWbhJ
         XYLP51ka+LI6vYE8CBAVP3H4LzBVYTUvkoeDeRyZeX7x3XgRMtIB9kY+HwYY+JQrN/Il
         yyo1mwuo9mPcaLookBwI1Mz/42PMtY457vNToN+4GxBLUHpIuk51kJyyD5eVD9Stqr0g
         qZYU1POJOgaS1gfKniyF3HUIp6BjTN4OvYukPa555HFlCg7+azzr1DMXPbud0d2Ba65t
         6XLg==
X-Forwarded-Encrypted: i=1; AHgh+Rrum4uYFlDcR933kUwneH53R0CP4k+oTCqC3CWoQ2kmxaJ2bdoYUCFEWGEZRhkEEjU9DUTHjyIIFoOF7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCTA2qB74lDRn/IbD+lBnfQyQNZdUlH5Pxnoq3mw3eNu3PrdKG
	N3DvTAr6oTYrGnvuox0Asvnuaz7mK+0YuTyTuwffV3BsQXz0o7coQ9BA+hII5SogCHEMhq52EaL
	e5pSJvZqAJbHNlR4OvphP8U8LlsdjtH4N7PO2CtMzc2n8o3LCsvqNtz/b85ecQbULwsaMW2A=
X-Gm-Gg: AR+sD13qhm8YnWWR0zWeHpPPlDb09Sc+5jtSjSh0G5W2sM0kJFU9/I3gk+lvea6WXRt
	bYvDrKK8aPjPldA8+wFusosQ6rN0stqK6OTTZcWpxaAOh7aZUbEUWUujBOc8WVS4prUHlfNIaoh
	3+fMTI+QsxnQ7RlLi8CnJbzoNElWGnhwC+DV5Xu+vBeDxybBMUzpQnfNdjL/KZYhJssOD8wpcR/
	3tzCDU/X4MkFbxU9XbqiigHNrqfi7hVnmO4qKL1unLioqy2uEYmU0WX4nJpp9Fy9HsTdNJR5qeC
	B8N3TxL7O+dQwGPWHk23W76fuZwpz57D9jTRs//jjMYWJYbLWYbLgdnUpDf3xU40EXuH+ZjnXn+
	BkovhW7C5JcM0Vaz5K2VcnlVQB5a0w+bncy/VcFAJiwQes9uUpzJiw06m3IcsqhM=
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847411cf.33.1786523536339;
        Wed, 12 Aug 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847101cf.33.1786523535827;
        Wed, 12 Aug 2026 01:32:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997d2e4ce5sm9693755e9.0.2026.08.12.01.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:32:14 -0700 (PDT)
Message-ID: <c70e9011-26e5-46b6-aa1f-c7f0c179611c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] clocksource/drivers/mips-gic-timer: Remove
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
 <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
X-Proofpoint-GUID: NhKCEOfgsHQmsWqIEAI_05P8Y8iHmqBi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX9YT9u8byRyIS
 fWUMvfu98dDynC7S6cx3MyalfoRYHJr3PWloHJ+/S9y7dEOr5zfkMSqtqpGFNARNzZgajBfZAW3
 p8t3E8JD2xRuoW5wozUDjOLuiC85gWEe/U7jQWZzH5SZWg+x+oop4Ndiw6QNRLwDNgvetsJl6JV
 dBWX59YwD/SnSGfm6QdtfmEHQJ35oOdGz7gkhTSYD9xi+7foQgZ3anThklmvS7XOt9KFtF3CB7Z
 u8SFZmGl6iB9pkrONmxCrK6NstkOVl+7ZzrXmj1v/vILOvEw2tMdwozHgeMZynz9GJgrNBZsqJD
 vnSGaZmMmxsDr1OHhWCdusR46l/jpSEFMingnj7upQ6EMAYdk4GgBC4hgZFqrwSQV3Qt+XUS8UQ
 hWg8YCmXNrsS8YOHaRWPtf7WJyIWr8h2lhvqeZ57jaJmgsRytqR5ldnH5OFwdNGiN7+GCpQQgCT
 SplgT1Dp+6fYyp083bQ==
X-Proofpoint-ORIG-GUID: NhKCEOfgsHQmsWqIEAI_05P8Y8iHmqBi
X-Authority-Analysis: v=2.4 cv=FbkHAp+6 c=1 sm=1 tr=0 ts=6a7c2f90 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=dVVT6RvzqqZ4HvZtmZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX2Sv/UI0akNSV
 2neTCHwGOqqJcYNURpQRZpu9mIAgXCTXL71R7qEZx+VBLvlrYGsPTLx3GerHlWn8xpO7+DuZk4j
 JqL1oJ/g/61O3IEniTrjzfphrnXsp70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_013218_368653_5F76F18C 
X-CRM114-Status: UNSURE (   9.70  )
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
cmUgaXMgYSBkZWZpbml0aW9uIG9mIFZEU09fQ0xPQ0tNT0RFX0dJQyBldmVuIGlmIG5vCj4gdkRT
TyBpcyBidWlsdCwgdGhlIHVnbHkgaWZkZWZmZXJ5IGNhbiBiZSByZW1vdmVkLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4
LmRlPgoKQWNrZWQtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0Bvc3MucXVhbGNv
bW0uY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
