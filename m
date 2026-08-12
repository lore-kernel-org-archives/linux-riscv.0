Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB756C5B56A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gadjG258upnKEXjzCFaRp7YNMWAhPHolfxdm18pEF/g=; b=BLE90Dwh1/bCBW
	tH0f93ycTXaz2ZL64r689g5wsJ63plIr+xL6tnke4aWte99FUdUKgGGr71+KDE3CH3WqRUpx5rQpZ
	xoPcOIXQAmUIXYzph6Dd6ZGHvzoZOQR0hrybOfrhqIBX2iGPIWMh9bnYFy6BoynXxxK9dZJSrTQ9J
	VGjoYqPfldEBweFfT8IsbYE7lAJ4nf7xI3ut7jaFwC3e+TrBGf9RtGqE+hALsg1aKtFTpOB/gp40z
	6McDRN2Z+WbjVpAyqqv8LTcekt94OZpAC7pPJA7Z9sMq7Pf5fDT4yQAeWQ8Cd7inDQDXYjkNW92xk
	/Bk0EMrOyMh9vSSXrA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAgS-0000000GRwB-1VoH;
	Wed, 12 Aug 2026 15:16:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAgQ-0000000GRvh-1LIw
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 15:15:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDc5Xk3875922
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 15:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BdfscUOJ1exQbIKDJO8Fdd9Yw+KSm+j+ja1ZpjtoaZc=; b=Rhf9ziCgbuGgAjf6
	6XH8dPfZdROJ5mpiII5EEFdiWfDJSY4OJuVovU8xIbQ87dIyHKzdk8jLZJD+Tnas
	WvqrlGhcPaJ8P9VkyB3oc27yObN05xn+NiQuYSbyhII4DkG6lS9zWKApbgpqo0jM
	GGrrE9wpQYBsS4WLcYBK//u7CyBirG8hg0sPr+8sAyVExQmlXKbY8n2CHwRoq0HB
	Me/hOHO6+FQ5nO/pZTsQQHQtlep0bpCc7F6Of6Zjwgy+3gETBp18DTxLRCbQP0w9
	m7TuIoHDUPaniwDQqjQSoSzGlp5p7EAQ2+x8JFFLXD7Eo91N/vkhril/nMB+cHwK
	nDbSqA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1jkmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 15:15:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so15206475ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 08:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786547756; x=1787152556; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdfscUOJ1exQbIKDJO8Fdd9Yw+KSm+j+ja1ZpjtoaZc=;
        b=BOH8r64G5biWBs1U1mNLCGqbCpfiWq5iuLjYejKrwQbPOLpzcilqXeF1SaW9uQz37C
         xgNdqQRQaNIya92R6NDN0UATZS7hwJEdYCciZzEV8EiSjQGK931ptwgBfSMg+T65U036
         GD2QPGjrQbz0406f6AtMleXC5SHc1FkQAVhlo86FZ8qfdcCaCFRaggjVD/UgjIDwEcWC
         Ryp08rSc5/kuHlhbTsBS42+qqFnhQ20o86qbu2aaRC0i7kTXzCQh7C36Ioc1B8tN2xr7
         SNMYeZKfUipxS/JLZO38/T6b1yAPWeHHe474JjmBRXvj2lvCyDOX5IHQ1LqM/3jg9v9j
         /4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786547756; x=1787152556;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdfscUOJ1exQbIKDJO8Fdd9Yw+KSm+j+ja1ZpjtoaZc=;
        b=qd/e0BnMBVJNGW0IXFrCSXQODK/8mvsViqhCyftn6UjzYyfQbagR/0Bxj7zQSuvjLJ
         HaefXkzA/fpvO0nlLcb+2qJF6HZw2ePXCyuoEkNimwkti7PDWaBmXZJVLIC54OeMXOHy
         qsv3xIXY8XCHAP00dElzCH+mYtO5gv6f8TSLJRRZTAeofUqvd+ZAdvP+IB3E6Affzgtz
         a7pELWXhZ1jMG5DHKboSG5PqkFa8uV8Tsa7xVQG1dXh7c5lBFdItINpWyvjujXacoWiu
         M96ngbEaAA9EaaY6Re0jdXDJynZ2MrhQwwJeWLukDbsXmO4I4moyoOl2Wuyv350Ey4lF
         48Bg==
X-Forwarded-Encrypted: i=1; AHgh+RpzfU0+rSYqGIp3CS2X4vnXXR2XkpYSJ9vah6wmk+i8ZwvCmvBIDOyeSghnh3suLCNaT5klE7/c9lJRoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjgtp3YtWB3hsGRU8KeFdESopMI+dQ3E2kouaRVP4qCZ2R2RAD
	fTCJiBMhu51xesqSIoGmps5bKH0mrgtgmBpYXxgD74K0CRMyX7ekLipYzzYuhaiDruN54OYveD3
	wjQDg+NevCi6S6RpeXFwPloRbYGZWdyAgEZ/8Tyh7OpguaPa6rAGuJDZGqgI3j9N/6stz83k=
X-Gm-Gg: AR+sD10QOPrf+gPDJKqiAuk1lFybMEm7Ihbih8fwfV61dUIF5QnZqgnzNC8H+kHLGWi
	713HUecO3dLNB8EQO25gDJNW8BhHmjNHeTcRGhPMOzQXSWwnx8iMvvNtdHGDqsUTnKKxOZg+I1K
	5ufbM6p20CVo90ZCEnf4Z2Qfhd1ROnSYnJ7H7F4uuYbKoTKL+pHCng0iwoFqxYzrqTiY9qHro4+
	suYpOm8U5TSfZ49XCSPltFL4oGLyQ1lejgvsmcb/jGZE1qHvQ6AZJth9QGjQHX5NKyfDyE5lNZf
	IQGpbFVYDtj2oidqk4nQlZiL8n8qh6EFPX5a2aPoow9Ob0hchoiOMPDDhxw=
X-Received: by 2002:a17:903:37cd:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2d34560df46mr72972515ad.14.1786547756085;
        Wed, 12 Aug 2026 08:15:56 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2d34560df46mr72971625ad.14.1786547755623;
        Wed, 12 Aug 2026 08:15:55 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219ee32sm8268495ad.38.2026.08.12.08.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:15:55 -0700 (PDT)
Date: Wed, 12 Aug 2026 11:15:52 -0400
Message-ID: <51d0105b39278f46def5b14d8d10103e.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 15/17] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
In-Reply-To: <20260701142230.A575F1F000E9@smtp.kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-15-2c61f94a695a@gmail.com>
 <20260701142230.A575F1F000E9@smtp.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 9C2-TpdZocnPsql3iqbCVZ1mg16G0Lwd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNCBTYWx0ZWRfX9fivqbyjxJTW
 FN6ZsGp2ShgGMlNor2aAQ28NxNxqSt1zAv8LWHVnqmvWyNwq3DBTgiu7q+3OAUzSel373BkrR48
 gjnQDv66A9lPEH3ur6x8EzGht0HvMaeQ1ehIDGa7y4eQjr11fG2CCiOAetMu/khoWcdBgdL8LHR
 yLZEDfJ39KygKL0M/gUdkfhOd6TGWkxIzzUvjF3FDuJQ1rlpZ4bqatg/17C1cX74lSFzWEpgDVs
 j7SQG2IlgGcv/LbAlEA4h9dqtFr8JZVl7ZK2KpkyXbIAgTky5pFYL+4kdUsX4Kcp3uAsRFNbAik
 w0mYMD09EW9qQ7iU5apY/17aTCpBEWvjQ0Z/sdD61gcUSWHI7UGSkXIQ2y6i0f4oLSY07jzObIZ
 CuhQs3YZPc4CFiRLb9bkLW8XCsXXpCxcLgGMi8GDCnhlK7ROSxZsc9Dq1e0+A5vcq1ozwVDxwTX
 zbDPa+UljZbCSj7Xtfg==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c8e2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=7NWRS0o-2Gl6raFx_5EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 9C2-TpdZocnPsql3iqbCVZ1mg16G0Lwd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNCBTYWx0ZWRfX7hf8OG6+wBbm
 hB88+lre3dxwC1VfPoQUZpbDE8NowU0DbuDnFFHo/VDtaJdMOm3YPbRgtGaKrN9VvOfYZ+EOYRP
 14KxzwX4vi0A4RKkBBcemrLm+STlLtA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_081558_479973_C1DD2930 
X-CRM114-Status: GOOD (  20.46  )
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

On Wed, 01 Jul 2026 14:22:29 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The RVA23U64 base detection wrongly mandates the legacy broad `B` extension superset instead of its required bitmanip constituent extensions (`Zba`, `Zbb`, `Zbs`).
> --
>
> commit e73d8757f0ce7270b4b39989368d4e83e5a355fc
> Author: Guodong Xu <docular.xu@gmail.com>
>
> riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
>
> This commit introduces a per-hart and host-wide bitmap of conformant ISA
> profile bases, such as IMA and RVA23U64. The bitmap is computed during
> init by riscv_init_isa_bases() and registered as a subsys_initcall.
>
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 4c3bf813af052..fa8471aef42ee 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
>
> [ ... ]
>
> > @@ -1304,3 +1307,90 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  	}
> >  }
> >  #endif
>
> [ ... ]
>
> > +	/* RVA23U64 */
> > +
> > +	/* Supm with PMLEN=7 */
> > +	if (!riscv_have_user_pmlen(7))
> > +		return;
> > +
> > +	__set_bit(RISCV_ISA_EXT_F, ext_mask);
> > +	__set_bit(RISCV_ISA_EXT_D, ext_mask);
> > +	__set_bit(RISCV_ISA_EXT_C, ext_mask);
> > +	__set_bit(RISCV_ISA_EXT_B, ext_mask);
>
> [Severity: Medium]
> Does this incorrectly mandate the legacy broad B extension for RVA23U64?
>
> If a RISC-V device tree advertises the RVA23U64 constituent bitmanip
> extensions (e.g., zba, zbb, zbs) but omits the legacy unratified 'b'
> string, it appears this check will fail because RISCV_ISA_EXT_B won't be
> synthesized. Should this instead check for the individual constituent
> extensions required by the profile?

No. This was raised and answered in the v2 and v3 rounds.

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
