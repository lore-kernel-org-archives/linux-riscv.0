Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471BACD6E79
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TG8yoFjXRh59HNEJo1cbDVTdHsNrF45JLnA2fcjzYvI=; b=ocrHPeW8/tYfFK
	1XS9R1QwA0SU+4urDaDdfGVDqvT0HN03g1gcGOLWUACQypTOq3+PR8Hp5lSYJcmeEPvpleGW87cxq
	SfLIhokoCxI6Q4U9ymS0s11nQ22qwoLqo4ftvjoqyWrqBKjDW6z57j0JiCvdyrCsQD9Qzg3F1s1dp
	+tG4ZyoZcp8z7p/iHrb4TgmfZCpoifhaubjhXRckFAkxZOmrfbHkMlpd38OmmXFu2jqB0EfjLYcOc
	ndwAtd2ILusutDRd5eR3H0m0+kYOrMMjzYwprTzTZxZP1LHh3r+PDa8OWL1sKm6GfLyzM+ehLL+kG
	14eRCB3obiltdrSgla8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcsC-000000044dk-25BC;
	Mon, 08 Jun 2026 16:30:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcsA-000000044cc-0jZY
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 16:30:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFTDg3552610
	for <linux-riscv@lists.infradead.org>; Mon, 8 Jun 2026 16:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=; b=Jc
	ShYuEjajO11QNx+P9XS8wV9QDiTTs4AcyuiWhZop6oA4R9vpZ/xuIk3VJ2UdMP+Q
	VlhjAXtHNd9pPr5psE0IzXfZYONSAiBszhF0CHHLiAssX93R/s/ov0pnNY+VxI9h
	cc/uAg63M5E/lbbbFSOLxpdvIjy9piS03SS9/QsQwhQ/chI/zRMAhd96k1KBqYYT
	DZIaBhu3e62xqVfo3MbNxxoS998MXMxlsuzkyWTTA2y2AltD+UyHqwqUYVFSbsQ/
	DU9NJKE+MdXMxcp0OsN+/eA3ASnZpuLWKbWz0gt/sUDQpCZpJ2e29vUlhcBDcq3r
	jno72HC2CrKW3VjfocPQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna9t9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 16:30:45 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-660d7828a5bso9150743d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 09:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936245; cv=none;
        d=google.com; s=arc-20240605;
        b=Lt2TNSDBFM1TOGYPBES7EN6G9BtAaIA7qyA0vFp7zU427R4Kru4hRw5+fbPGBX13r8
         wVWdCwHwBK1rtHUuKYKyPojnG1ppXuO7EIzD/C5uqLNzuX0umR5uV+WxL57vM6lltisZ
         sMUcVoY9bRJQU42MOHWfyDFNtrQfHkriO0PRgu31nHjEMiGKkaChud3cFdrRk7ONtfjE
         RkD9Dwdbtz2ggCPjZcR0L5STrQz1QyhnlyDQozvkDk4PhGGbmJUw9ZGzTmmd5KvLxhu7
         fjU5YoaQuXXJXGtqWww/ijNgh66/UvXTzmNT+z2n+x6ORW1v9DBYx6PBcEnVGY8Vjv++
         DZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=;
        fh=3mHEWVTlIgO5ak/xy2aut2u2zAEei/a14iJE4RnhWMY=;
        b=kYVrmiEl57GYAtc4lGV3I70bMr0AcxiUsh/wSGVafwQVCezIKO6GnhKNOgtGV7PKhi
         mYHTBip+yB28zTjTVTfsXohelXtSjk04HeGMHwQOM8ywgBKi3shH6bixVyD+/lzjttXX
         fSuzcI9so0Fz9r0TweT8qteKqMW5YXSyxH7WNrdw+vYd0+Ljdm2X2VE2632M2vc79vT3
         UmxemYJB+aTLqZpedBCBGxUNfgHBuy5e1flq5dOQtlWehTT1i4/9Xj/qvMTsnRPS4pyP
         EIz1slq9E4udDRPRFcvL+RpIBG0l5RKRJXA3l3uYwT5LE+LYDStCiQ+RcdWCR6tPLbpU
         Q4cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780936245; x=1781541045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=;
        b=YZMVJgWaEfUW9N0akPp3nQ/MehgOnzC/74nAMa0mYH42dTqlqYvKRRV12vtscxdEjw
         xWqFxemTD9yZBBgQXLfwv+SPDsP9LemTbnEEthyFHS7NInjRiunWPLZEuN6Q00Jr266B
         siOpEoNIdxF4W3nlz1R1CpgvJlcn8LJc8xl3waLXK0kY8x5Wv4NxCcT2fzscx/EbOC13
         KOfL3TSwCZ6gbAm0fqggf2lmmPDx4BcFcDLGVqSEq/Atndc+rW6dRrG7rjww+weo0sAe
         2hrwrRHbEBJOycDx9WnzDqhFURfVWIHBcsegJYioP4bJMsBR5clj8b9vrIXUbRZz+vkr
         ZoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936245; x=1781541045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUE+ny+UnvWaJEVXkhAnSWXizCbQqgAqEbs9h0LudUU=;
        b=RxsXoKZp/eBRlde5y3022mTVP/R0RHuhvn7WM/CC4152wjv+kqPi3t21uiIss4R49P
         ZRVy03hZjVR13ZFF5Lahmqm6FWCCVvCxHiy7GINahL/NcawK16EDPvr5krjdoOjXbtzf
         wlDeMylpqyrZJYH4BRYcm8vfJyjA/RJ6KDC91cTu8U1CfCfFTQKHuGt1nLvbNreEGeqd
         j8wpmdj7P6Jo8+mgbL7u6D6IBSfK6VzOx1GoPKNJcGfw6yvY0W1QVgfdj4/LulI1YTtP
         ZEVTaY4fKO8+W3/57tT8zshv8o3Vp+q230MUeCnhqNrjumcyrPHAkWVExgpIHIqwovEm
         vrxA==
X-Forwarded-Encrypted: i=1; AFNElJ9yPlbiutYA3/1sMZF4GIpetzDa745wnutjsxLXiEe7Mj1oLQaM9sLIEnaBdNPk0J7faXU+EXNCGVSR1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvhifyVfaB7ROFfWiUzfAR+Hq9fb82ob29Q1niBgFsrPArW6F7
	89SZaBFhGCJ2PmyBAeukwUFO0nWw1mdmZZv8cI9nKhQ5sasgIxvxItRzsPm03IeMEfQQ+SHvFGN
	4TOP3ehvgCI3RYO1wFmupCyFdi8ywWmQmTdKKIZEhLLivzEkgMajElhXignTPhMEnr3rbRvx8nX
	Pxe2FBPbsxgC4zOaL30iVayx3FB3tO8RaHzwSa0xEyUallhQ==
X-Gm-Gg: Acq92OFdGqVF3SbD8S9mTGJ4UB77IAa58AEp+SmpV0uEydAs72+hg5l0uXBatUdW+NA
	dYKP1i5W0S6NtY27JB5XSGsFzsg5CeVGHV1De4rRDEJ5wj2jVK2Ayeigpis3slAvUZNwx+LhBBo
	d3ysxrp1hW+S70eTEIljgmUmh4Fjdf18kVu1TLUn1viinUZY9LJ5edOtw8UifbekylBMu1wBClB
	JuqAWuXp3XhnUnu5g==
X-Received: by 2002:a05:690e:138d:b0:660:529f:76c2 with SMTP id 956f58d0204a3-6610a62ba9dmr11112991d50.8.1780936244694;
        Mon, 08 Jun 2026 09:30:44 -0700 (PDT)
X-Received: by 2002:a05:690e:138d:b0:660:529f:76c2 with SMTP id
 956f58d0204a3-6610a62ba9dmr11112955d50.8.1780936244186; Mon, 08 Jun 2026
 09:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-3-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-3-23ffa16b6ebb@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:00:32 +0530
X-Gm-Features: AVVi8CcjdmtpKU9pycNL-hwxjKIaJHrcR5nC3cRzrIaKxh71BhOXsVMQNx-uaR8
Message-ID: <CAB19ukFw34et9YULib7i-xXPirrW-TVK96PH3KKR0Nb0iiwjNw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ACPI: RISC-V: Fix riscv_acpi_add_prt_dep() loop handling
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NyBTYWx0ZWRfX6CkHxjnQsYM+
 GNbIjxQ8j2rfBLzpTJrQHWI6svaH0odNF+WAqqTEEe88g7kFrFZYy5F0LbaeOGZO8N1d63Yw8dQ
 rkLV5iSRuLIwOITjdYNTz5VAvtmoBDhOp7m69PM873BF2beXk3kS7My5OTPjpJfsOh6JUZTlxvT
 X/s7R/F+60xuSmdO/T0NXGFBrOA2h99DPtp58BOL1MrjqzXTuz2NkjEBBzeLrSHfXF4xf8JE7zg
 KP3hHBLX4C1bTZ9kYUU31xaVJNEHYNwqSrMFwwofNO7xL247r6u2+FUtW/QLcWsup6zyhi+wUuM
 2Kl5o/isobFlaSf3JamfkmJKJnDcIIeon8YGEGP1QN7oH/WsdDElBl8j4yuKQr47mTbdOpjYfFQ
 o0zVSyj/x5RoleMnLVgSw+eP8DYZzARbEbMi6hvMcIwiNO2eA0e6MffPklxuiLF0ooWvqR+J9X4
 a9LQRL2pgc5K6/ZpVkg==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26ee35 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8
 a=_MyEUG9zEuNOLPre8u8A:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-ORIG-GUID: mrpMmbLOhHCBbKM9eittMH36GppIcCnR
X-Proofpoint-GUID: mrpMmbLOhHCBbKM9eittMH36GppIcCnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_093046_224909_4CD9EDE3 
X-CRM114-Status: GOOD (  22.48  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAyOjE44oCvUE0gTG9yZW56byBQaWVyYWxpc2kgPGxwaWVy
YWxpc2lAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgbG9vcCBpbiByaXNjdl9hY3BpX2FkZF9w
cnRfZGVwKCkgaW5jbHVkZXMgZXJyb3IgY29uZGl0aW9ucyB0aGF0IGFyZQo+IGhhbmRsZWQgaW4g
YSBkdWJpb3VzIC0gaWYgbm90IG91dHJpZ2h0IHdyb25nIC0gd2F5LCBieSBjb250aW51aW5pbmcg
dGhlCj4gbG9vcCAod2hpY2ggc2tpcHMgYW5kIG1pc3NlcyB0aGUgZW50cnkgcG9pbnRlciB1cGRh
dGUgdG8gcG9pbnQgdG8gdGhlIG5leHQKPiBlbnRyeSkuCj4KPiBSZXdyaXRlIHRoZSBsb29wIGFz
IGEgZm9yIGxvb3AgKHRoYXQgaGFuZGxlcyB0aGUgY29udGludWF0aW9uIGNvcnJlY3RseSkKPiBh
bmQgd3JhcCB0aGUgY29uZGl0aW9uIGFuZCB1cGRhdGUgc3RhdGVtZW50cyB1c2luZyBoZWxwZXIg
ZnVuY3Rpb25zIHRvIG1ha2UKPiBpdCBjbGVhbmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56
byBQaWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KPiBDYzogIlJhZmFlbCBKLiBXeXNv
Y2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+Cj4gQ2M6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5h
bWljcm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMgfCAxOSArKysrKysr
KysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9pcnEuYyBiL2RyaXZl
cnMvYWNwaS9yaXNjdi9pcnEuYwo+IGluZGV4IDc1MTcwMTUxYzYxNC4uMGNkZWM1ZGQ1NzVlIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNjdi9pcnEuYwo+ICsrKyBiL2RyaXZlcnMvYWNw
aS9yaXNjdi9pcnEuYwo+IEBAIC0zMTksNiArMzE5LDIwIEBAIHN0YXRpYyBpbnQgcmlzY3ZfYWNw
aV9pcnFfZ2V0X2RlcChhY3BpX2hhbmRsZSBoYW5kbGUsIHVuc2lnbmVkIGludCBpbmRleCwgYWNw
aV9oCj4gICAgICAgICByZXR1cm4gY3R4LnJjOwo+ICB9Cj4KPiArc3RhdGljIGJvb2wgYWNwaV9w
cnRfZW50cnlfdmFsaWQodm9pZCAqcHJ0X2VudHJ5KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgYWNw
aV9wY2lfcm91dGluZ190YWJsZSAqZW50cnkgPSBwcnRfZW50cnk7Cj4gKwo+ICsgICAgICAgcmV0
dXJuIGVudHJ5ICYmIGVudHJ5LT5sZW5ndGggPiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCAq
YWNwaV9wcnRfbmV4dF9lbnRyeSh2b2lkICpwcnRfZW50cnkpCj4gK3sKPiArICAgICAgIHN0cnVj
dCBhY3BpX3BjaV9yb3V0aW5nX3RhYmxlICplbnRyeSA9IHBydF9lbnRyeTsKPiArCj4gKyAgICAg
ICByZXR1cm4gcHJ0X2VudHJ5ICsgZW50cnktPmxlbmd0aDsKPiArfQo+ICsKPiAgc3RhdGljIHUz
MiByaXNjdl9hY3BpX2FkZF9wcnRfZGVwKGFjcGlfaGFuZGxlIGhhbmRsZSkKPiAgewo+ICAgICAg
ICAgc3RydWN0IGFjcGlfYnVmZmVyIGJ1ZmZlciA9IHsgQUNQSV9BTExPQ0FURV9CVUZGRVIsIE5V
TEwgfTsKPiBAQCAtMzM3LDcgKzM1MSw3IEBAIHN0YXRpYyB1MzIgcmlzY3ZfYWNwaV9hZGRfcHJ0
X2RlcChhY3BpX2hhbmRsZSBoYW5kbGUpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIGVudHJ5ID0g
YnVmZmVyLnBvaW50ZXI7Cj4gLSAgICAgICB3aGlsZSAoZW50cnkgJiYgKGVudHJ5LT5sZW5ndGgg
PiAwKSkgewo+ICsgICAgICAgZm9yICg7IGFjcGlfcHJ0X2VudHJ5X3ZhbGlkKGVudHJ5KTsgZW50
cnkgPSBhY3BpX3BydF9uZXh0X2VudHJ5KGVudHJ5KSkgewo+ICAgICAgICAgICAgICAgICBpZiAo
ZW50cnktPnNvdXJjZVswXSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9IGFj
cGlfZ2V0X2hhbmRsZShoYW5kbGUsIGVudHJ5LT5zb3VyY2UsICZsaW5rX2hhbmRsZSk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKEFDUElfRkFJTFVSRShzdGF0dXMpKQo+IEBAIC0zNjUs
OSArMzc5LDYgQEAgc3RhdGljIHUzMiByaXNjdl9hY3BpX2FkZF9wcnRfZGVwKGFjcGlfaGFuZGxl
IGhhbmRsZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBkZXBfZGV2aWNlcy5oYW5kbGVzWzBd
ID0gZ3NpX2hhbmRsZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb3VudCArPSBhY3BpX3Nj
YW5fYWRkX2RlcChoYW5kbGUsICZkZXBfZGV2aWNlcyk7Cj4gICAgICAgICAgICAgICAgIH0KPiAt
Cj4gLSAgICAgICAgICAgICAgIGVudHJ5ID0gKHN0cnVjdCBhY3BpX3BjaV9yb3V0aW5nX3RhYmxl
ICopCj4gLSAgICAgICAgICAgICAgICAgICAgICAgKCh1bnNpZ25lZCBsb25nKWVudHJ5ICsgZW50
cnktPmxlbmd0aCk7Cj4gICAgICAgICB9Cj4KUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2
bEBvc3MucXVhbGNvbW0uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
