Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDADC5B56A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZywfjGd5eKnZ+7S78vtKTlh+RRdJGE4lVecGaPz6UQ8=; b=V/9gluhkKtQQCH
	2dc0RK3C6vM6efu+BciON3+I9iYMpYMHu0W3u48zcoMS2N74T/LKnJFgtJ2xKsT2kWFwGGRR5h0pv
	E5DO+5pFRJlo46OFKaJgkw5GO/NeeocWo0SJedrQFD5DPE8mNDoSMVBU36MvoBlOFS6rfHd02IZAw
	OnTDCblgpdnT/ElPkyFgDuBsR1TqjBIrF54nC/dkmCReHeeVdB2KBVUGrjU3UeVupmWkk0gYPIWoe
	t9O/YGKggL/+pVEgW3zJH2JhVIa1WZvuVsgBi7mycbsNNKVVBj3Csci2OJWyLY1Amxt3i20gl4b3y
	6e2tphZ/XD8zcEwQJ4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4OJ-0000000FeKu-3TbH;
	Wed, 12 Aug 2026 08:32:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4OH-0000000FeJq-0PGU
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 08:32:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62PZR3288560
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 08:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=; b=CkDL8DAQ7U5HJ5gu
	1wiZk6P3XYhm6d4d9Pl6AKoAm0ojpYY6+9yiDJZDagzLZQTj16HDJomqpc5v54hm
	GjSEyRKSdQVk2j9FpqyOAoeTrOP+p+wWdbUdRWU/yYx0PWT8D8Et1aCgK4asxrLu
	BUA0QVwgeHqElbgMD6ra5qsvjO5su8wj1OYt0H/jivqkQ2lv9ithdF1oBONgCcid
	f1xHlOKmxkuRrcEQW+w3H5tgD3Dj6/hJFlo1HgELfglRLWrUSkx5BHrqFLUnHTIe
	s6AnqvpNyLsUsHayG1koazsaHDRh1sv/8JPb3KIjgGv77U1cYm15NtMwmv6XYC1y
	Ee1l7A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049ev880-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 08:32:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so11107031cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523567; x=1787128367; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=;
        b=Kb02I5SDL1pm5khWhf8IV3bV76GxNbav6RC1qGuvhm/F5fUUdeNkpBsb7lIQn8Eyus
         rdYjHlP3RRHQbjwCvH9reAKtueW41JnC7FBL1MhPTPlWEDW0pl/HldL7BlyYv0UyFKDh
         uxhmElD5q66EdKDnhZg56UeFIaISeNEl9iCggVMWmhZA2v/0pDEfo+Ns7RCfNm0w5k+g
         5xcR7vjFeNXbkLa7M4XBJgfR6iYPhz5MX2P0+e18F8bSDFMA0zn5RSrMYTUspcwWB6qN
         fgQ4Oyp4RoTieANX8HjauU+6iQQpKcgl0RzSVaDwjCwe9x6if5rLHlIHC5QLkEk3eFwq
         W/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523567; x=1787128367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFIM07BsWUmRXowFn9qQEjJQwSE915UpKVvsGJRFiu0=;
        b=FnDs+sC17DvG0piQamHOZ+KckiLtWfOwVVIuiZwPfwvFtTVwNgI4r/n4XoEzZYOjsw
         3JJemk5Jc4pQu5QP67gbYAEdHGDnvcFIiYRne/KDxjHysiXmksaGZFbpZJdQmYpJMyIK
         E1ACj0F+BNH0MiIRrpCxzsgegUx/7FA1AE31OO1w7wEoAdE3l9wD5l6fQclH1ISGSfFI
         rWlEQSC6g6h6GUpjTsyLxWWjoNXlunmE48Ieya963481O823bpUoyWyU/kwahNmYkHUV
         QurKwLBAivHOGatv9vSVwpuvFAoM9XYuIW2365ZxOBLYRKXjthdNPFSr+4cjavxZ0eg2
         IWYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNWRxrlMOzdvyJoJlZTIVXGQ4fd1Q2RItNeWKfjq39WvBQfmahMeskvnGnPt2uEHgINAO087L2Hb2NSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YymLl1w457IEdNoYGUJlkCMVQT/2CJ6PbWqpHoU/XpnwQbzZcq0
	sMQVFcyk6lVXvieeUMELDXySidZfulsnmzgneFnIC9BSERYNbqY181/+on6uyJSEq1/tl4EJZ+U
	e9PRoSWMJS0Helgu35UJ6hvLnXzRSkQBVwga9RbUB5Im/leuid3iFT0FH2rwRJecDugsubrrhbf
	j250z5iQ==
X-Gm-Gg: AR+sD120VCmbJkE3QpAcXHv5tphY21jdsaFtJMMIJDQ4pwj3dzZ2LSwtst2rKWJkCJr
	kbBLmi8ZTUjjnTxwNgNssg5Skxoc4AqQowhfSAUYpwcVahEGzd7ocmz7Y1kcXgmhpk5MbfjxPVF
	YhIoDIr9numGLHa8mBtf6LihDAyHMFdvV1ZzzjW5RPdkbke5T2rYFYTR7kfwOebRY6vMwqwMfSp
	D0uKDJPuiz90AvKgJ3VsQVnvjeKzy1B1nSVwSdYHPEGAgnCy1g8U1v50wrYgu4SjNbNc3hYq37N
	egyXKhTodZ5h3CC9VIBOhSZ1ndqH7JTChJstiqgCKCy17hh4Y3YLJtS3aLm9YAc3npgtdSrn5er
	26k/D1BPeqmqa7V9OE4eRMCUcOmULDre5aEYoflAt996ImAglLmLjG0aDU0uSh3I=
X-Received: by 2002:a05:622a:4d91:b0:51c:1d18:2fe9 with SMTP id d75a77b69052e-52d6469cf4amr25908911cf.5.1786523567368;
        Wed, 12 Aug 2026 01:32:47 -0700 (PDT)
X-Received: by 2002:a05:622a:4d91:b0:51c:1d18:2fe9 with SMTP id d75a77b69052e-52d6469cf4amr25908681cf.5.1786523567010;
        Wed, 12 Aug 2026 01:32:47 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c8fa1c7sm47131155e9.0.2026.08.12.01.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:32:46 -0700 (PDT)
Message-ID: <447b83e2-5bd0-4b7b-ba4d-61a0fe400195@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] clocksource/drivers/arm_arch_timer: Remove
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
 <20260724-vdso-arch-clockmodes-v4-5-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-5-ddbe447be860@linutronix.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX4Ezvw1UdOH0i
 ChO/eJTNXre2RtJVher5Jj2ZT5NVXQiZRMKoa8hxA8PZ6aoPbM7RpCR37T539ViZP5hZKuhV7lJ
 405Lkz9VC5+aK2ioNwI+A6hheOEW+BM=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7c2faf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eCx_7nzpRrifSLxMv2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: CKVoHgkUOjobPWYGvcNW1zU7qWwdXQj_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX2KnCg30zNcwt
 sZ0M8i1LAo7sNJTkr3s1WoGD4s7MJcex8l9TdpGBn/n366EpcjiUcmPlEWKcdMhUiL1/AZhYrT+
 D9tuM36XYjcEsPwpwrBPb4lFzLICYX3gAUEAxEgEQB9CDMynqOWddlRPIjhdcVOzSQ9dnATk3JX
 sU+6GH+KGr/CriUi79dvZJPFa+JqRoE/9Nd55gSw1yXB98FHmL7+IhYKyAH+cp8hhaLgngv0qd9
 KBPFnQUCIJjVLokxFKR5v/4egluypTwwpbRxEVsrqLU2gaxVSuR14wvoQxIrpulZhtP10f9g6L9
 HpEV7+1bZl09UbWAPCLVqJvN/4wtZElT1eKXY2n6rZa0gDW09moKZK37ZQIchgrx0IvYEqyvbUF
 b/TuFIBSgYGmPxvQluwvtZ2pHEFiJ18CZdo8PevGxUB/5+vhpEoo2zi7rUzq8flniWeS8krBugS
 nQ4/mcFH4XrdkU5Ln3g==
X-Proofpoint-GUID: CKVoHgkUOjobPWYGvcNW1zU7qWwdXQj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_013249_295149_D7016A1C 
X-CRM114-Status: UNSURE (   9.39  )
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
dHJvbml4LmRlPgo+IEFja2VkLWJ5OiBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPgo+IC0t
LQpBY2tlZC1ieTogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQG9zcy5xdWFsY29tbS5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
