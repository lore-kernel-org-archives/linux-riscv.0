Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ED5E68143
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFq6/mBB27czdsiqV3UKwoPZHG2m6RJbsNFz5K/kMts=; b=ahS62+M976d9Gx
	Wx6Opx/nsspgle24QQU7ONgBNLq0JVKiMBX1rNcrjXSFz0XcimcTi6+mN1yn4zEmu9V212QDjQluw
	ItwSM8Cdc0C0Koi0aywXnzUV0vGX8bTCuGRGZUIboGWz2oVGQj8BkUONQhY6zMUu3WjeVMBDPcr8a
	9PmQPGoT4RuTOh08tySdxy3JyWTvgvZomNf2zGnYMSG3Pn1g24Yw9qVVa/nRar39msuTEo/3iVxxC
	bKgBD82S4dcVitegd7DSVNE5iXV5is/i290S8MfxlUuiwUwS+g5nfBWAcGkPMvOf5/nTdhh60q7Qr
	PSkMG14HrxTIKo+wP8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsGgQ-00000007sSO-2ZGA;
	Tue, 17 Feb 2026 08:43:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsGgM-00000007sS2-2a1C
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 08:43:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GKDXRC549524
	for <linux-riscv@lists.infradead.org>; Tue, 17 Feb 2026 08:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d2vzc8NeogKdgV3kB5BYMJxN3JhypHe+v7mpk50CGug=; b=GHjiZdu76nkft7xt
	IZCVLrLj1TLZSmyV2sjUuS+gf5vZEkHyw3K9rfbsGIhbHYkahDHbr2dwM11maNnj
	L3fhy68vih9aX98aRSdPHiTTi0K0l2I51vnfii9439oiOiFTZQnJ18Ahe2SFaROR
	wsL75lKJIzCqa/yhz2/1XsCiMht14uP700DNpqNHWBx+FgNLT23GDcihcf+YkaPU
	8m2E6dAwoncES4AJEekgdUyuJtE545oEDXOCd9QIy3BfJqmUQM2L1wLZZ13BbfNU
	QOgOs7ktZnEACGn5C/TJ6uhHDSyy44D7CbQvSXV3t/ZsV4cpbB35qMKjCVSLDfCm
	BjctnQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d81q4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 17 Feb 2026 08:43:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2baa7366f9aso42183270eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Feb 2026 00:43:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771317824; cv=none;
        d=google.com; s=arc-20240605;
        b=iNyC4aaKF4BupU1UzW/ez1zJCXk2divtI9Cnd7wg0NWVfKuwkAk7Nf6EpEFgc0UZrq
         /Ra/1xpis49KCv+Sl/pEI7EtwHwLPpqpJHDuj2pJlNonWuEQN+nXWVBlacHsefh+baCa
         HhIx3Mn35Ieerj0Xo/CdIMjlGXXRCaD47iCQ/+ev44itXef+RIYVq7Fv+T4H1E70vxt/
         S6l7RGedLr1BeTNcw88IyP8skGRLXTloobtNCsff62wqVwvFai3vKk3qHXjiB1AqMqat
         3gASYmb2pbgJ5zxiGoa4gOrNu8gFtWVRTBa4+N3XQnVyZKeXtgYnQhU9Nw6R2DavE8/A
         d2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d2vzc8NeogKdgV3kB5BYMJxN3JhypHe+v7mpk50CGug=;
        fh=G3YSuq5yl13B3QUPVzZRHeyxQ3Mb8OTJtqIlsbBg4EE=;
        b=MM/AiAqC8jdnMm9fXsuCogP9RiAf6KL/g+YlOSZ2MWw+u4TAs1GSJVvHyNBC754cZr
         CywNzrFCKzXEZSC3Vck1iEkFVFzOxEuPPmvMkIxEsaDmruLZN0KWLztqKIQ6vpW5JrC6
         TQvEV8iE0T5XDUt/59nFicZ7YHzJYzA5dnl0y6tUX3EsVjM/RTpSLheVwD6mieZ1KWP6
         9sX6FnfliQizl9+CemFsUjjr5XsFBw3dSWEMmF2ea1nDZLWzkZVdOqDmnwRLfSsgZreO
         JEpr2YLODWbu+RoCU1UAlmQdQ1c/RW8T0PnvNmWNXvMlUjahqOwShLb7YdGgrOQLE4Uz
         eAKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771317824; x=1771922624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2vzc8NeogKdgV3kB5BYMJxN3JhypHe+v7mpk50CGug=;
        b=E1UGqkP8gTzyO05O3qxukUo2PDcQU9C53cWdFohWOUITQAhPBBpTN4Y3t/hcTw3dtX
         HFMFRe03ZmEL5yiovhzgBmQvyVspagW9W19l4lg4vIHA6ee/hW2D59oV6+QD1nR0nvtc
         /TEXtoYnVAaZryzoti22rHMvWmJfFkvsuINGuCeJw6LXOOgB1mB5zmSLH4nwcZE0TV1h
         kvRE8iiLWiX7q65+EmKtDSAv9lP+TVHv8SKTqPV3n7TtoxJ0khw5nQWfjiCL4xEpXmqg
         8zPXynS4AWC01MSMh/EB85IUIEvDNKobLiBvBJvTSkMLkM3F+QBfd3tVCMgBTDgSTmF+
         l98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771317824; x=1771922624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2vzc8NeogKdgV3kB5BYMJxN3JhypHe+v7mpk50CGug=;
        b=SIlnztDBvX/jwHBruYYkumpFDPhvxcNAwo0t4c1yAa8kZtrs4xzNzSSAmO0AXcgQ0c
         G4n5bq3A4CR2VFLHoqbjHJNzl1+DvmwrOMovA70Un9NzlCzhKbAlXppMICKDizRw3L2w
         RgcRIUyIK8d2uYgEghYIQyN+ZKdSwluTCXf5YPaQgCCJWGf7nv4mhWgFDJCdky14/ZZL
         FXspNHyRlJzKI2NHdJWkH4ed6xrQLK/8CyOeK3fduxmi97uwV1j7NbI0EbKxYKIO8wbg
         LDuZmq1Y18ZP+ixP8eQpO827Trj+9AJHsimXrbiQi2kx/jjwxUV1DhhxGWTeo94ucUXp
         GaiA==
X-Gm-Message-State: AOJu0Yxbok05LAJetzxLg0Q0TDOi4G6wba7bW3Pi9MBWTh/zSxKwEiWF
	U1SKFjIMED5ffEhLjvszDoxx7SBeuXH7A2AcqYBI8DUl0uuLiO765tfQ5h2EVLho4juGygCnW2P
	DJ4lYY03LcjPzgp7Rk7fKiQ7I0a06gKEkR5ZkTBpvEiT6k0P0G1PZ+4zqfjPYugHYD+CMAL6Fdo
	4sI9WDw/jTfGraCzipONpP3fwByiXWll7vwEXwUwmRuHrvlw==
X-Gm-Gg: AZuq6aIDfL0uR0yBQ+ASAKnYcpS8D+2ym28bUlu8sE95tUIAWuoHFdN6TVbFs1seGvK
	7cjBQ9N0P12m0/7Fsf+N99K5JzVJdQ95oNgcIidSv15iEp5CNNh7vaTFyvFwd+2zfVNbiWsMmu/
	n1OBUjtL1td44daGlfvQXde/dtuUVJWfJSS7imnx4/9FUHFv8qnrEA/KS3XPehn0BMJuPocXMO/
	YqsFxY=
X-Received: by 2002:a05:7301:1292:b0:2ba:6f02:2940 with SMTP id 5a478bee46e88-2babc5356d5mr6445012eec.27.1771317823939;
        Tue, 17 Feb 2026 00:43:43 -0800 (PST)
X-Received: by 2002:a05:7301:1292:b0:2ba:6f02:2940 with SMTP id
 5a478bee46e88-2babc5356d5mr6445001eec.27.1771317823432; Tue, 17 Feb 2026
 00:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20260106082021.2680658-1-himanshu.chauhan@oss.qualcomm.com> <e0e40e14-e4f4-c3b3-4ebd-200052b529aa@kernel.org>
In-Reply-To: <e0e40e14-e4f4-c3b3-4ebd-200052b529aa@kernel.org>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:13:30 +0530
X-Gm-Features: AaiRm52nLB9JVDBk3lsmLQ4566qCurSmTZYgGgTITaT8BUFHgNtxb1oGmNA8W3s
Message-ID: <CA+Ht8=afRUo1LZVDq+Zm9hh-Dg4+fpUnVkS6h6VXfCDbgMeU8g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] riscv: Introduce support for hardware break/watchpoints
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        shuah@kernel.org
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69942a40 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=V1jnuoLLAAAA:20 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=na_8VF3vbthHuMXyz_4A:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3MSBTYWx0ZWRfX0AdzDnC9z1jr
 D03e0ykvKfICNYH76xXv/YkS3+MQUl6HjYiqaUh8H/eNgFREc7IXw41IV0PXhn0vSF9DN3oLnLo
 oyR2NOa6OuS/ja6LqocektPXbqHL7s+GNt3sv7DSTxrznnrzlIpyyd+oKzamASI6gto9Kk65ICD
 fazWnE+neyWgZUiQ+BokMQlq50USgFd6VuYD0aRW2pJPF4Ds7GBLT/dEH6F6IMmtyfLxbAf1PGP
 jkSt0mGo8wuIuqlamQ0a9hj1EugQw7IEzF7f++TtyRaFTRm2qQ09tDCBtp9xvjBsAbJVdZ/QVHQ
 G2Gs7bHRGeMf5hvHZb5lyV5oDMyR/XMZ9g8LYEg+k9TOGhkah/yKuLHR0cVF/dNJEbGeXcJrOFA
 +tcytGPueFaekZSWxNCoEWDDpXsKW2TEUN+jvvwoORod70u3PBbB6CMFknoAjvGovYZhCDCF0QD
 hfy4n6qcbl19u8HXTnw==
X-Proofpoint-GUID: bIo0W-O9sIdsVLyheUGUEZ_MfmR4kEpC
X-Proofpoint-ORIG-GUID: bIo0W-O9sIdsVLyheUGUEZ_MfmR4kEpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_004346_676718_0696C292 
X-CRM114-Status: GOOD (  16.65  )
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

T24gRnJpLCBGZWIgMTMsIDIwMjYgYXQgNjowNOKAr0FNIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEhpIEhpbWFuc2h1LAo+Cj4gT24gVHVlLCA2IEphbiAyMDI2LCBI
aW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+Cj4gPiBUaGlzIHBhdGNoc2V0IGFkZHMgc3VwcG9ydCBv
ZiBoYXJkd2FyZSBicmVha3BvaW50cyBhbmQgd2F0Y2hwb2ludHMgaW4gUklTQy1WCj4gPiBhcmNo
aXRlY3R1cmUuIFRoZSBmcmFtZXdvcmsgaXMgYnVpbHQgb24gdG9wIG9mIHBlcmYgc3Vic3lzdGVt
IGFuZCBTQkkgZGVidWcKPiA+IHRyaWdnZXIgZXh0ZW5zaW9uLgo+ID4KPiA+IEN1cnJlbnRseSBm
b2xsb3dpbmcgZmVhdHVyZXMgYXJlIG5vdCBzdXBwb3J0ZWQgYW5kIGFyZSBpbiB3b3JrczoKPiA+
ICAtIFB0cmFjZSBzdXBwb3J0Cj4gPiAgLSBTaW5nbGUgc3RlcHBpbmcKPiA+ICAtIFZpcnR1YWxp
emF0aW9uIG9mIGRlYnVnIHRyaWdnZXJzCj4gPgo+ID4gVGhlIFNCSSBkZWJ1ZyB0cmlnZ2VyIGV4
dGVuc2lvbiBwcm9wb3NhbCBjYW4gYmUgZm91bmQgaW4gQ2hhcHRlci0xOSBvZiBTQkkgc3BlY2lm
aWNhdGlvbjoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1k
b2MvcmVsZWFzZXMvZG93bmxvYWQvdjMuMC9yaXNjdi1zYmkucGRmCj4gPgo+ID4gVGhlIFNkdHJp
ZyBJU0EgaXMgcGFydCBvZiBSSVNDLVYgZGVidWcgc3BlY2lmaWNhdGlvbiB3aGljaCBjYW4gYmUg
Zm91bmQgYXQ6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtZGVidWctc3BlYwo+
Cj4gQ2FuIHlvdSBmaXggdGhlIGNoZWNrcGF0Y2ggaXNzdWVzIHdpdGggdGhpcyBzZXJpZXM/ICBQ
bGVhc2UgdXNlIC0tc3RyaWN0Lgo+Cj4gSW4gdGhlIG1lYW50aW1lLCBJJ2xsIGFkZCBpdCBhcyBh
biBleHBlcmltZW50YWwgYnJhbmNoLCB1bnRpbCB0aG9zZSBnZXQKPiBzb3J0ZWQgb3V0Lgo+ClN1
cmUuIEkgd2lsbCBkbyB0aGF0LgoKUmVnYXJkcwpIaW1hbnNodQo+Cj4gLSBQYXVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
