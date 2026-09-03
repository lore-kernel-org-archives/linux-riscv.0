Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DABBC624DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/aDM12NCmGinxE5pf1ekp1BMseD+gBns4rrjQ0OSBE=; b=oJrJZ+Jpd4wMHE
	94KoFoxFBQXxJOfFtA9MrWoOgUeOySluleCuoKF/DiYkHOQuBHW4pVEUP8Sq/L8ITDA+W5gJdX0rc
	b0cmz5OvACBujYLjSQJm66hzLlPoeLa99VBcLVmfTFIzVKre582vfjQEwK1BViZhrHar6u4w0+Zkj
	V0got6p9/Xta0faAi7vz460OQ92fYlLg+sF52EoEpb96C8KO8CElgmen/h5NNlCW4JMVOiIMixvGi
	5HsLSyH5bhAjpojEGFDa0wnnDy+B/rTKHnks1qbzJUHdO9FMUbvIzaafsGXNJ2T4/uaPUMC7OHBNk
	xUUTlbUuIpJnQX/OzlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkE-0000000GMmb-1GWb;
	Thu, 03 Sep 2026 05:12:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkA-0000000GMl0-2tUu
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xZS24150802
	for <linux-riscv@lists.infradead.org>; Thu, 3 Sep 2026 05:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=LR9IzqRjALwvtfG5DGG1mPrwlxTakHLUnlY5jwSMpfg=; b=WO
	tT8K3Itnc0Ak+8I0BFgOGn9/g2FVvuu0T+dr8ALhNdfJKJGANHAOovCKLSe61eaK
	RmFMYR+ziIiCDeXJdVcvMBTm/ywhPktYEH6gD4YE7nX3E4+nsMW1o3vMuQdSw/XP
	6vzifS4X+ujg/lN1qiwnthspDZu6QOY0sQLXbu+2ljOE5B0HkgBcUBQLqUnkBLll
	/sO3HvdZVWZKRmYoY43EPr7slNLQCLodnkT1wTrV8NEQyaOfuhG3hAAv9eUzaagZ
	QLWPrtRZBQr6BAFsmHCu2y0bGmYE34PtPJT3gv/6BnvQ6DzfUnNR2u5099agYCY4
	KzKeWlN0FpCTuFTMNN8Q==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnajh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 03 Sep 2026 05:12:09 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66f7fdefb16so2327906d50.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 22:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788412329; cv=none;
        d=google.com; s=arc-20260327;
        b=N2Tk7I5YClqwAXlhuMqB6Q7tsp/wl4JtMvRTtRhJJ2832+CCY0Vp1wkg0jQEwp2VJu
         ceCkr++3FYqikyr6t2zCpXCtvTFUguBH+ZH6bFH5xvcraBypKbd1wMtsM4uZ/uopB7uf
         O4eEaqS7bN5bEiAdwE1C+JAChiUFJ8MjMh+KUqleR07CxfOxtHbpEuu2qJ7hjVs0/FOE
         hXPHs/Xco9I/PFnRWNgZQjJa6WZB9AmUyDTw99daZeyLCNoL/DhMfJEA2mBq9u+56/Fj
         eC8ANcFFMtk2NncSXXdVlZQvcAiwguVnlMItkixtpsNKS3AViyQ6eFylgVFmwqmb3clj
         8ktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=LR9IzqRjALwvtfG5DGG1mPrwlxTakHLUnlY5jwSMpfg=;
        fh=dF96Oee2OT6Qv1r3Rj0oDplUSd09yn68xJRnEromdZY=;
        b=JcgyzKpmNu/cqwtLwUhQcp686+TBt2qDtXrs4jbaEk7zoaQ6dLvk8G001g7UGcMTzT
         GouI5LGPh1g3bqsT76P/uK5/5XBtB5EmZTZdefbRFAh5r9vPzktk7xsTjJAH6Atvkua/
         FtYZSliTS1k2rnbIIfl3LpLQmZvZNRkHRfQL+HuaZ497q707DoNDsfb3sWPO0DU3ByL5
         4LVHfn8F6HqnEfunc6KzCnkoFrWbXhIqdDGytzXDYTTbrsw48QEcAMio0h7l/aVMyJRR
         RzmNO8LT6Lj6nXvMCu3pKr+8apdn6vhEjAiSH4AtrQp0aJk7M8MXxcVryC1Z0+JluwO2
         mdEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788412329; x=1789017129; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LR9IzqRjALwvtfG5DGG1mPrwlxTakHLUnlY5jwSMpfg=;
        b=BiRXiS6zCmxSFBDqKjtba9k2lK1NdpRIfk6qOsuFVTBpOLoUC+Gju1Cxatiky2nOjc
         K++f2rAvrRAOYRLt8inRSCB74OVjAVk8cGN03bKADNjAPIyRi0K2aObN4Qbo2bpfB9re
         3rriihs91eeq8tcPmmR2eNsnHY8n3fhgOrVoE03kPXw+8lw1ODYSITA38cdfuiuxLrIO
         94l1wgvnhLRnhRRuh7ZLJsU3yVx8jvckyUDWPjB5rMNijnGm9bZG4GaO4N+JyOGTnSMT
         K1UNBwjscxqVkpiN3si8Ls7sPhCK3wL9MtGzsOd78C4RYpVtly/2di6jnj+FK1nmDN16
         +iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412329; x=1789017129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LR9IzqRjALwvtfG5DGG1mPrwlxTakHLUnlY5jwSMpfg=;
        b=brkITGWshPQxFlovS26GQwvFwdkN/lMNPlhf9VyYQ9FJqCgFiLP4+tbYfSjIZgqLFL
         bv5MyJt0mLxbQ6MsgOQ0q4g9ocwEvJ7Ep++6g99ryrckhpaHh+C4xiXTJ5IXFEmqP/fI
         CNPF0e4ezjZL9TcjI/u+u5lQNKdHWGjHV3hmQM4oZj7VBEVyeXXKmrIoesbe+88cqmig
         ZN2cIBiJo07avhiIhv7QsNQAkcu5AtGk0IKBtImfYKxOyYM/l8C7rFS7RHZoYAMD+nvF
         5Psrl9M0+PETfPuO41rCNM41IXipSF0jGCNtcoIhPSlhFmwdWrgkD1z6uaVtpakjP39L
         60Vg==
X-Forwarded-Encrypted: i=1; AKwUvBy08ofPr4bD6u+OQ6Y/OxYjRuD/gPu0pzPejwQ5PWLhuRwtPI5xVheaLXiiJ83K7c2KObqR9Sn8KVgdQg==@lists.infradead.org
X-Gm-Message-State: AFuF++kA1BqICRR+M28cSZ5owPMhmw4O4pjJjHSpBnggjT+QPY0nvjMc
	W5AH2c9WCv87+WIJQ2UEIBIy8BJquimPP1Frd3zNmzBsUB2iI7RbQKgZm360Gr/w0LkVqWGvG3V
	oh+PyEcZQMh6753mAuKzIotXjxvIQLLOmLB1d75FJ19oNhKRu1JzvGV2IIkwofOR/R705NNJRsP
	irkhnhQqC4YY9v2MseyVew+V/5CiR0A8qYHhXrvPwtqHus9g==
X-Gm-Gg: AYBFou1+YCYhTlGwTiAS9tFI0EG6kR1G1CkpDbtckUoYYHLYMto+8h8o1PMoZKl0DTn
	m9BRavKJ2eBHUnYJ04BYAQTDJJxYZC3Jep7cGmw5DVEDxFZ4q5xlrm+Noc2TL40qh3hFsQG7KrQ
	/Xs7H/5OUOy6iB6vyRuEVonTY9Lh3AOUaD1oqqRWzP7NwtESwkVyRdDx4P2A==
X-Received: by 2002:a05:690e:438d:b0:668:9d0f:ab70 with SMTP id 956f58d0204a3-66f9b93b27bmr2799453d50.18.1788412328925;
        Wed, 02 Sep 2026 22:12:08 -0700 (PDT)
X-Received: by 2002:a05:690e:438d:b0:668:9d0f:ab70 with SMTP id
 956f58d0204a3-66f9b93b27bmr2799438d50.18.1788412328517; Wed, 02 Sep 2026
 22:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260902083450.2348-1-douyufan@picoheart.com>
In-Reply-To: <20260902083450.2348-1-douyufan@picoheart.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:41:57 +0530
X-Gm-Features: AcwNN1XjAPbxTpUY682euCheD5pZce4ONELDwflXG2pmom4yd0wIGrjfYXZSpf4
Message-ID: <CAB19ukHyZN6kFJ5W9dYLNANmuU=vnSC51D+2q+FhuspAbPg8RA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: RISC-V: CPPC: Implement cpc_read_ffh_fb_ctrs()
To: Yufan Dou <douyufan@picoheart.com>
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a9901a9 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=TxhyHGSeAAAA:8 a=EUspDBNiAAAA:8
 a=R2scDWojlFBtPnKtwUAA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=VRTRSrWG77IPp_BSX07q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA0NCBTYWx0ZWRfX/ZDL/aPnltFB
 rZ4Bvq0aTdD+LLbOiu03BmY8MB432ZjQZLjChwMLMD6Oepsea4X+PXSR/E+0uHaS0zFW7x4njAZ
 QHgMK6fBVtqPKPax8Xp3FiDgMjQ9KT4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA0NCBTYWx0ZWRfXw1ywJSwHKJRu
 H0oQxi5oODjME3zD0GAmjJUAPJJP6zRGaEXrLrXu1xKbHYE40zVv+okIrDpdJzbZ5LCmMoPtqOv
 whGNh29EHfY/2Lcwy9QoiKAaW0ZiyPRTolIgrmmwA5IoqKeyzp4KpkaTJNNoR1KhLnzJcWu/JEf
 6DJdceylEq+p173HYQpVgXsLdw/+Rr5j36YyUD73Mnh6FtILDum4M2NxIhpdlaMz5mxDUwCZ8qd
 ao+nH5l1xOtEBGTJUApk02W7Qi4+/qQZ0XNOuIVbF8GDfHcPlc66FZQpLqSdJx1LX7kB/yvNMMu
 pR6tqyYd3afNGoE5CmZF5hQwPkSArltQbI5BPiudjZSB4M2H62KvFlOXsl5JrTA/ErwrmYEIxtZ
 pxCcRcVtdXHEOZQY2eHNUjqr41oUKcSqJDj7kSW3cYBDVtnIZUsrAtyM321tHczLSabuqtD+fJ5
 K9sfcu6fQThxuAABmTg==
X-Proofpoint-GUID: QSapIGpzKxXWxTFm_tftrNJb6JZVxZsm
X-Proofpoint-ORIG-GUID: QSapIGpzKxXWxTFm_tftrNJb6JZVxZsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221210_735732_B29B1405 
X-CRM114-Status: GOOD (  27.33  )
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
Cc: zhanjie9@hisilicon.com, yuchao.46@picoheart.com, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, yang.yicong@picoheart.com, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, geshijian@picoheart.com, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMiwgMjAyNiBhdCAyOjE44oCvUE0gWXVmYW4gRG91IDxkb3V5dWZhbkBwaWNv
aGVhcnQuY29tPiB3cm90ZToKPgo+IE9uIFJJU0MtViwgZWFjaCBjcGNfcmVhZF9mZmgoKSBmb3Ig
YSBDU1ItdHlwZSBGRkggcmVnaXN0ZXIgc2VuZHMgYQo+IHNlcGFyYXRlIElQSSB0byB0aGUgdGFy
Z2V0IGhhcnQgdmlhIHNtcF9jYWxsX2Z1bmN0aW9uX3NpbmdsZSgpLgo+IGNwcGNfZ2V0X3BlcmZf
Y3RycygpIHRoZXJlZm9yZSBzYW1wbGVzIHRoZSBkZWxpdmVyZWQgYW5kIHJlZmVyZW5jZQo+IGNv
dW50ZXJzIGluIHR3byBzZXBhcmF0ZSBJUElzLCBhdCB0d28gZGlmZmVyZW50IGluc3RhbnRzLiBU
aGUgc2tldwo+IGJldHdlZW4gdGhlIHR3byBzYW1wbGluZyBwb2ludHMgZGlzdG9ydHMgdGhlIGRl
bGl2ZXJlZC9yZWZlcmVuY2UKPiByYXRpbyBhbmQgdGh1cyB0aGUgZnJlcXVlbmN5IHJlcG9ydGVk
IGJ5IGNwdWZyZXEuCj4KPiBJbXBsZW1lbnQgdGhlIGNwY19yZWFkX2ZmaF9mYl9jdHJzKCkgaG9v
ayB0byByZWFkIGJvdGggQ1NSIGNvdW50ZXJzCj4gYmFjay10by1iYWNrIGluIGEgc2luZ2xlIElQ
SSwgd2hpY2ggbmFycm93cyB0aGUgc2FtcGxpbmcgd2luZG93IHRvIGEKPiBmZXcgaW5zdHJ1Y3Rp
b25zIGFuZCBoYWx2ZXMgdGhlIG51bWJlciBvZiBjcm9zcy1DUFUgY2FsbHMuIFRoaXMKPiBpbXBy
b3ZlcyB0aGUgYWNjdXJhY3kgb2YgdGhlIHJlcG9ydGVkIGZyZXF1ZW5jeSBpbiB0aGUgc2FtZSB3
YXkgYXMKPiB0aGUgYXJtNjQgaW1wbGVtZW50YXRpb24gb2YgdGhlIGhvb2ssIHdoaWNoIHJlYWRz
IGJvdGggQU1VIGNvdW50ZXJzCj4gaW4gYSBzaW5nbGUgY291bnRlcnNfcmVhZF9vbl9jcHUoKSBj
YWxsLgo+Cj4gU0JJLXR5cGUgRkZIIHJlZ2lzdGVycyBzdGlsbCBmYWxsIGJhY2sgdG8gaW5kaXZp
ZHVhbCByZWFkcywgc2luY2UKPiBwYWlyaW5nIHRoZW0gd291bGQgbm90IHJlZHVjZSB0aGUgbnVt
YmVyIG9mIFNCSSBjYWxscyBvbiB0aGUgdGFyZ2V0Cj4gaGFydC4KPgo+IFRlc3Rpbmcgd2FzIHBl
cmZvcm1lZCB3aGlsZSBDUFUxIHdhcyBrZXB0IGJ1c3kgd2l0aDoKPgo+ICAgIyBzdHJlc3Mtbmcg
LS1jcHUgMSAtLXRhc2tzZXQgMQo+Cj4gT24gYSBDUFUgd2l0aCBjcHVpbmZvX21heF9mcmVxIG9m
IDMwMDAwMDAga0h6Ogo+Cj4gQmVmb3JlOgo+Cj4gICBNYXhpbXVtIG9ic2VydmVkIGNwdWluZm9f
Y3VyX2ZyZXE6IDMyMDEzNjkga0h6Cj4gICBNYXhpbXVtIG9ic2VydmVkIGVycm9yOiAgICAgICAg
ICAgICsyMDEzNjkga0h6ICgrNi43MSUpCj4KPiBBZnRlcjoKPgo+ICAgTWF4aW11bSBvYnNlcnZl
ZCBjcHVpbmZvX2N1cl9mcmVxOiAzMDA5NjQ2IGtIego+ICAgTWF4aW11bSBvYnNlcnZlZCBlcnJv
cjogICAgICAgICAgICAgICs5NjQ2IGtIeiAoKzAuMzIlKQo+Cj4gVGhlIG1heGltdW0gb2JzZXJ2
ZWQgZXJyb3IgaXMgcmVkdWNlZCBieSA5NS4yJS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1ZmFuIERv
dSA8ZG91eXVmYW5AcGljb2hlYXJ0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL3Jpc2N2L2Nw
cGMuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNw
aS9yaXNjdi9jcHBjLmMgYi9kcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jCj4gaW5kZXggNDJjMWE5
MDUyNDcwLi4yY2E5OGZhNjllOWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL3Jpc2N2L2Nw
cGMuYwo+ICsrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKPiBAQCAtODUsNiArODUsMjAg
QEAgc3RhdGljIHZvaWQgY3BwY19mZmhfY3NyX3dyaXRlKHZvaWQgKndyaXRlX2RhdGEpCj4gICAg
ICAgICBkYXRhLT5yZXQuZXJyb3IgPSAtRUlOVkFMOwo+ICB9Cj4KPiArc3RydWN0IHNiaV9jcHBj
X2ZiX2N0cnNfZGF0YSB7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2NwcGNfZGF0YSBmaXJzdDsKPiAr
ICAgICAgIHN0cnVjdCBzYmlfY3BwY19kYXRhIHNlY29uZDsKPiArfTsKPiArCj4gK3N0YXRpYyB2
b2lkIGNwcGNfZmZoX2Nzcl9yZWFkX2ZiX2N0cnModm9pZCAqcmVhZF9kYXRhKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3Qgc2JpX2NwcGNfZmJfY3Ryc19kYXRhICpkYXRhID0gcmVhZF9kYXRhOwo+ICsK
PiArICAgICAgIGNwcGNfZmZoX2Nzcl9yZWFkKCZkYXRhLT5maXJzdCk7Cj4gKyAgICAgICBpZiAo
IWRhdGEtPmZpcnN0LnJldC5lcnJvcikKPiArICAgICAgICAgICAgICAgY3BwY19mZmhfY3NyX3Jl
YWQoJmRhdGEtPnNlY29uZCk7Cj4gK30KPiArCj4gIC8qCj4gICAqIFJlZmVyIHRvIGRyaXZlcnMv
YWNwaS9jcHBjX2FjcGkuYyBmb3IgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBmdW5jdGlvbnMKPiAg
ICogYmVsb3cuCj4gQEAgLTEyNSw2ICsxMzksMzkgQEAgaW50IGNwY19yZWFkX2ZmaChpbnQgY3B1
LCBzdHJ1Y3QgY3BjX3JlZyAqcmVnLCB1NjQgKnZhbCkKPiAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ICB9Cj4KPiAraW50IGNwY19yZWFkX2ZmaF9mYl9jdHJzKGludCBjcHUsIHN0cnVjdCBjcGNf
cmVnICpyZWcxLCB1NjQgKnZhbDEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBj
cGNfcmVnICpyZWcyLCB1NjQgKnZhbDIpCj4gK3sKPiArICAgICAgIHN0cnVjdCBzYmlfY3BwY19m
Yl9jdHJzX2RhdGEgZGF0YTsKPiArICAgICAgIGludCByZXQ7Cj4gKwo+ICsgICAgICAgaWYgKFdB
Uk5fT05fT05DRShpcnFzX2Rpc2FibGVkKCkpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVQ
RVJNOwo+ICsKPiArICAgICAgIC8qIE9ubHkgQ1NSIGNvdW50ZXJzIGNhbiBiZSBwYWlyZWQgd2l0
aGluIGEgc2luZ2xlIElQSS4gKi8KPiArICAgICAgIGlmIChGRkhfQ1BQQ19UWVBFKHJlZzEtPmFk
ZHJlc3MpICE9IEZGSF9DUFBDX0NTUiB8fAo+ICsgICAgICAgICAgIEZGSF9DUFBDX1RZUEUocmVn
Mi0+YWRkcmVzcykgIT0gRkZIX0NQUENfQ1NSKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVP
UE5PVFNVUFA7Cj4gKwo+CiBXaGlsZSBJIGFncmVlIHdlIGNhbiBub3QgcmVkdWNlIHRoZSBTQkkg
Y2FsbHMsIGNhbiB3ZSByZWR1Y2UgdGhlIElQSSBhdCBsZWFzdD8KCj4gKyAgICAgICBkYXRhLmZp
cnN0LnJlZyA9IEZGSF9DUFBDX0NTUl9OVU0ocmVnMS0+YWRkcmVzcyk7Cj4gKyAgICAgICBkYXRh
LnNlY29uZC5yZWcgPSBGRkhfQ1BQQ19DU1JfTlVNKHJlZzItPmFkZHJlc3MpOwo+ICsKPiArICAg
ICAgIHJldCA9IHNtcF9jYWxsX2Z1bmN0aW9uX3NpbmdsZShjcHUsIGNwcGNfZmZoX2Nzcl9yZWFk
X2ZiX2N0cnMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRhdGEs
IDEpOwo+ICsgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAr
Cj4gKyAgICAgICBpZiAoZGF0YS5maXJzdC5yZXQuZXJyb3IpCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBkYXRhLmZpcnN0LnJldC5lcnJvcjsKPiArICAgICAgIGlmIChkYXRhLnNlY29uZC5yZXQu
ZXJyb3IpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBkYXRhLnNlY29uZC5yZXQuZXJyb3I7Cj4g
Kwo+ICsgICAgICAgKnZhbDEgPSBkYXRhLmZpcnN0LnJldC52YWx1ZTsKPiArICAgICAgICp2YWwy
ID0gZGF0YS5zZWNvbmQucmV0LnZhbHVlOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4g
Kwo+ICBpbnQgY3BjX3dyaXRlX2ZmaChpbnQgY3B1LCBzdHJ1Y3QgY3BjX3JlZyAqcmVnLCB1NjQg
dmFsKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qgc2JpX2NwcGNfZGF0YSBkYXRhOwo+Cj4gYmFzZS1j
b21taXQ6IDg5YTMxMjk5MWRjNmU2MzhhMzZhZGM0M2NjYjkxZGJjMjU1MDRjMDQKPiAtLQo+IDIu
MzQuMQo+CgpPdGhlcndpc2UsIExHVE0uIFRoYW5rcyEKClJldmlld2VkLWJ5OiBTdW5pbCBWIEwg
PHN1bmlsdmxAb3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
