Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE50CD6E79
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yR8U4xyxK7NXWtH8Civ5CbeSWeJQ92v5tibLNs2mzvg=; b=1MyR5qsdoq5n+K
	Csqsz3QX8cpw94sP/bxN7OaVN2YXmxRy97m2bp80WD39dDNllbADWsx+kLQLk5Rl1mmLy58zAb564
	CkyGkYegWWcy96ZnUb+KkPTw2BEdVbee+U5XOA9JgXPYcLkqkwjB5VbF6uOL2y29UFMBzA8ieszsm
	Zb+DCqChWHplsVLeQ4gDFQPl8H5SBBeXs4Q6tCcvmsyoiG76f0c0OvpVsnKfY/joJiWBopbbTc9Yc
	Te4bbw7wZ83P4Tpo5F4kp+8/7jaJF6eVTALm734lBvMMV2OWf9PPQLQ1p/aIDOYIdznXKVgwDZBl8
	x+3zeAWrsCCEVkDSCbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdpD-00000004CZ9-1xQi;
	Mon, 08 Jun 2026 17:31:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdpA-00000004CYJ-29Xc
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 17:31:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFZFV4041730
	for <linux-riscv@lists.infradead.org>; Mon, 8 Jun 2026 17:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=NboUCLZhVdamDjmk3+ro5FUR3e/MaMLfVXZD7CFCBmQ=; b=MZ
	7ZYieTiWl84GjiRgdXz4awP4cGqtTjVwzl/xLPeYpoNddIilxXmopDu0EZ9hXgoy
	tjX5j1OxwrTKB1dBVuxebTr0lTC0xuqeZZD7lDIU5/EUMDRteROE5tm4lRd3ZTR+
	iPpC+2mmbuj5RHGe4x5PmbB+NQSfszPtVKuE6fwKYb5LBeBcP3jwaRboBSiPNEIo
	ewBdPmzvWzXH4cCOvc5ZjPjmGI4V1tCoEKBMpnET89X3zrIZzw2Te1xv37nAEM89
	GLFtuOTlvqGxVjU8R8mFIHCmnngJRFkPYWac7WJHpO2GjWOsSv8C7MnUy1Vi1eAm
	P/MsW+GQgqwfkQSlZJKg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv9jq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 17:31:42 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7e96dad7730so97155707b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 10:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780939902; cv=none;
        d=google.com; s=arc-20240605;
        b=k0rUgWATfg+Kanfu17AFqXYwLQxzuZG7jGgLgb0w8/5ojZHl8PQExtD9XCtV5sJ8aH
         6QvO77kpxnEMIjV4W/SZjH0cjDPhk1WIn01GtarGBL515ar6AoHqeXRyaiZjhycgkuz7
         +187HZNv1Gc3Hbpd6gLfMDvPyX2ObwdorPP0Whv+kSsCEKSURtBmXRV3QkqlCQF4ixYd
         SFUdAEiwCmLfrNaa54l92QCV660Edj39fYGoNVzkYcESCHBDqG09jo4QSd+QY40O2Gpq
         zPTP8tMpCwv9IqJXyUUY6vfcDoYeihZi2+aPRM2Gb1P8Z0xR3+SzcnOKQsnnWd+ky24u
         C/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=NboUCLZhVdamDjmk3+ro5FUR3e/MaMLfVXZD7CFCBmQ=;
        fh=paKhWbpB5VJvyOfNmP4cVW2EcfPJH2bWFvCuIdDNdGA=;
        b=hg4OkIzXDBRL3pjcYze/Gqx1U+Q8ihwDJprMSSOJScubUgG9KZnu9FJZINREtb2I82
         DglCfMP7T+XumLA+XJccgNscMNpzqzoG+C9SRE/vRqk6n6UI3KLA3IE/fhAOmwn0K6DF
         6J8vAYqutRHNr/xn36BzneKzzvF2g04d0EHs7LmjN4UzDkoFGuYaqVNWsvk32OIUROoN
         r6xLXexdJ09mpb462ss6mwzt1Pv+GZPVtLyJRe3s0m4zVippFTx+SLCFYOY1lCyq2s+j
         iadCN7AmPvP4F3KQkBRwAIUrz6+xNzKKikdos9oai7hc+t5we8DW1ZVsNUKaI90Jl18P
         CZQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780939902; x=1781544702; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NboUCLZhVdamDjmk3+ro5FUR3e/MaMLfVXZD7CFCBmQ=;
        b=PisXfQBlwT1n9o3KYYhtQNIEblPsFKO1t09BtJtC05R/UizFyrEmkHedSpsbU47EOQ
         HxVgnqK0nyqfvHxyPBbZrXtC/iFN8f1RWita6J40SMdGKrzngfhC2gLQ5m7kcKZTa4kd
         O5wXzsUhrxlhcfneGZNk1c0RnA6125as2Bii9D217Yt/g9RwbNfmZo61NzHc/7VE57gk
         sdTDxjbUQ1eR2nq3Ic8Hpytw3wk2N+yh48g/xu0Lhb7Ti/NkkV/jIbWspU8ucQxJWkq2
         FNfXBgr/ALNb61Mbb4+AJSL2WkzKN22p1/k4Wf0Pjc0Jt5Nw4M5RMzwDfgdu08NTwS2y
         +Bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939902; x=1781544702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NboUCLZhVdamDjmk3+ro5FUR3e/MaMLfVXZD7CFCBmQ=;
        b=HRDFde65iw7iph4xP7cu6S8fkXk8ZVkbw1HIqQhP3uLVhCqjCfO3N/C+vJdzEBdcmd
         qcUmrI5fMp8U9pFasYQ4N3DqqFbHxkSXOTTveoR7Syhi5y6iWjb5z20WDuPFMPvvTSFs
         tj6ef6bcRp+K8K+5nadZ/GnR8OBXS8dE4P0pYAbtGFx/Ic3z8TXZp3yJdENI2S7HHCGa
         zMF4XWbB7dfQmm/hCqVGMx0dUEmBZBjGW1vJBaCN58x7dDrK9mEcieAaY3rryIbkyCRn
         WI4zd+D7lAgizi+gMz6y2uj7IZUVllL2gVMEQFnRGOWIeqRAYGFBv5XpXzjM9oHMeLSg
         riYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AmzX7Uphv/n9A70Zv3hMWfCohUwb9xpyxC3RIiQO4/YzBpYl5JMcEIdPZiW87ZnMi/+VWmOcRYmQJlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyC2X5NVsaTzo7QLkmE3B0V+O1Q+h98C3dhswotjeaunWvixJib
	EK0gwNI23E/CyMJqxkr2EOC4Fs7ipoHfFVcB8bxtyJ52Rh8ISEpOtwJOFKw/RpUEgL0lmk8bZf3
	EM9HwvI8Z2PhQ2K2cDP+wKhnIcswiXD1e5Ziq8B1zR21uGMzS1QeCY8VLgmJ1nWV+r7WGrAH33A
	wqzRko/GGzx3d/qC5pFUWiFcSJGZSZ5ftZhmdswbKpaKVRxA==
X-Gm-Gg: Acq92OFolLrc31lVkTyS3Wig+7/YJNUoLrQDj1mJG0m3GyUVLiDQB8A8t0jXerGp/uo
	Z/k9ivXyzff6uwkvcq2fiaDR1nLBNTz+inj7JoWful31a7qCDx/SKe1DBlTQqejX9XEdaGwNbO/
	Bf+N03D5Ti2uUbw0sLvvkMfrl+CzTx0SLHNy4IofQHHDJxd1xVN4ecazt4EuXCGSgplWmWn7Jb1
	btEZ/jrRgGKLa56ig==
X-Received: by 2002:a05:690e:2ca:b0:660:32d9:22c1 with SMTP id 956f58d0204a3-66106f55bb0mr11340910d50.33.1780939902251;
        Mon, 08 Jun 2026 10:31:42 -0700 (PDT)
X-Received: by 2002:a05:690e:2ca:b0:660:32d9:22c1 with SMTP id
 956f58d0204a3-66106f55bb0mr11340866d50.33.1780939901792; Mon, 08 Jun 2026
 10:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260525074415.1533884-1-maoyixie.tju@gmail.com>
In-Reply-To: <20260525074415.1533884-1-maoyixie.tju@gmail.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 23:01:29 +0530
X-Gm-Features: AVVi8Cf8ngzVdvK9FKMj-xLN5UeSAS7tWWFrcGhG8O0eDmb0hUhF-uRq5getBFw
Message-ID: <CAB19ukFFpsc2eOmkXo9UzSieF-PrMb_BqHw1gdH8_MvwHJTw+g@mail.gmail.com>
Subject: Re: [PATCH] acpi/riscv: use a dedicated insertion point in riscv_acpi_register_ext_intc()
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Proofpoint-GUID: DlhrTFEfJisnniIG9f_KQ5ni6WLUyBkG
X-Proofpoint-ORIG-GUID: DlhrTFEfJisnniIG9f_KQ5ni6WLUyBkG
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26fc7e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Saupl1bv0fQYsKODqNUA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NSBTYWx0ZWRfXycHnO46FN/FW
 tricpNPNMR22PMDBpVXPiSna8x8IOidhrUF0JpTZ+KPQJ3fI6U+J1Tl65VL49Naxo+KvBD/YQtF
 zMNMZuAi4tgvxQj7Ea9GvfcQrnnhLcx7gzyJZ1IKlZzWirJ98MfVou2i5crtPuCSNPYeMruZxUP
 1az+nEjBDz47bI5fmV0HaGH7r/XP+o0rRV/2Cx9Ky6rzRqMm4A0f7IbbDmsWiRnLhcGRF6YA8zc
 wOqecChJY3CDTuwZMY6ke9AGF6wYoS1f+HO/ZJPP6Q1B+sU8JHw45T1oZaHObI57GlmsosJehqB
 BldG6LtPgsiveT8+PU+aDRsnhvv5Ft/KiCzT7DKoQ6KjFDMtGU4o1ViftUq0kxtriWkucknWefr
 cRFN67wiXg+xamXU368f8aVfWs6A+dHZ8SYDPoQUt8eEyyk/ahyl32Ki9qaUt33vrQI6dWNq6GG
 CZT1Yu2cSeivYYW7VqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_103144_668603_919A9427 
X-CRM114-Status: GOOD (  31.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMToxNOKAr1BNIE1hb3lpIFhpZSA8bWFveWl4aWUudGp1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiByaXNjdl9hY3BpX3JlZ2lzdGVyX2V4dF9pbnRjKCkgaW5z
ZXJ0cyBpbnRvIGV4dF9pbnRjX2xpc3QsIHdoaWNoCj4gaXMgc29ydGVkIHdpdGggdGhlIGxhcmdl
c3QgZ3NpX2Jhc2UgZmlyc3QuIEl0IHdhbGtzIHRoZSBsaXN0Cj4gdW50aWwgaXQgZmluZHMgdGhl
IGZpcnN0IGVudHJ5IHdpdGggYSBzbWFsbGVyIGdzaV9iYXNlLCB0aGVuCj4gaW5zZXJ0cyB0aGUg
bmV3IGVudHJ5IGJlZm9yZSB0aGF0IGVudHJ5LiBBZnRlciB0aGUgbG9vcCBpdCBhbHNvCj4gY2Fw
cyB0aGUgcHJlZGVjZXNzb3IncyBucl9pcnFzIGlmIHRoYXQgcHJlZGVjZXNzb3Igd2FzIHJlZ2lz
dGVyZWQKPiBhcyBQRU5ESU5HLgo+Cj4gVGhlIGN1cnJlbnQgY29kZSB1c2VzIHRoZSBsb29wIGN1
cnNvciBmb3IgYm90aCBqb2JzOgo+Cj4gICAgIGxpc3RfZm9yX2VhY2hfZW50cnkobm9kZSwgJmV4
dF9pbnRjX2xpc3QsIGxpc3QpIHsKPiAgICAgICAgICAgICBpZiAobm9kZS0+Z3NpX2Jhc2UgPCBl
eHRfaW50Y19lbGVtZW50LT5nc2lfYmFzZSkKPiAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
ICAgICB9Cj4KPiAgICAgcHJldiA9IGxpc3RfcHJldl9lbnRyeShub2RlLCBsaXN0KTsKPiAgICAg
aWYgKCFsaXN0X2VudHJ5X2lzX2hlYWQocHJldiwgJmV4dF9pbnRjX2xpc3QsIGxpc3QpKSB7Cj4g
ICAgICAgICAgICAgLi4uCj4gICAgIH0KPgo+ICAgICBsaXN0X2FkZF90YWlsKCZleHRfaW50Y19l
bGVtZW50LT5saXN0LCAmbm9kZS0+bGlzdCk7Cj4KPiBJZiB0aGUgbG9vcCBmYWxscyB0aHJvdWdo
IChubyBlbnRyeSBoYXMgYSBzbWFsbGVyIGdzaV9iYXNlKSwKPiBub2RlIGVuZHMgdXAgcGFzdCB0
aGUgZW5kIG9mIHRoZSBsaXN0LiBgJm5vZGUtPmxpc3RgIHJlc29sdmVzCj4gdG8gYCZleHRfaW50
Y19saXN0YCB2aWEgY29udGFpbmVyX29mKCkgb2Zmc2V0IGNhbmNlbGxhdGlvbi4gU28KPiBsaXN0
X3ByZXZfZW50cnkoKSBsYW5kcyBvbiB0aGUgbGFzdCByZWFsIGVudHJ5LCBhbmQKPiBsaXN0X2Fk
ZF90YWlsKCkgaW5zZXJ0cyBhdCB0aGUgdGFpbC4gVGhlIGNvZGUgd29ya3MgdG9kYXkuCj4KPiBJ
dCBpcyBmcmFnaWxlIHRob3VnaC4gQW55IGZ1dHVyZSBjaGFuZ2UgdGhhdCByZWFkcyBhbm90aGVy
IGZpZWxkCj4gb2Ygbm9kZSB3aWxsIGhpdCBtZW1vcnkgYmVmb3JlIHRoZSBleHRfaW50Y19saXN0
IGdsb2JhbC4KPgo+IFRyYWNrIHRoZSBpbnNlcnRpb24gcG9pbnQgd2l0aCBhIGRlZGljYXRlZCBs
aXN0X2hlYWQgcG9pbnRlci4KPiBJbml0aWFsaXNlIHBvcyB0byBgJmV4dF9pbnRjX2xpc3RgLiBT
ZXQgaXQgdG8gYCZub2RlLT5saXN0YCBvbgo+IGVhcmx5IGJyZWFrLiBVc2UgcG9zLT5wcmV2IGZv
ciB0aGUgUEVORElORyBhZGp1c3RtZW50LCBhbmQgcG9zCj4gZm9yIGxpc3RfYWRkX3RhaWwoKS4g
VGhlIGN1cnNvciBpcyBubyBsb25nZXIgdG91Y2hlZCBhZnRlciB0aGUKPiBsb29wLiBCZWhhdmlv
dXIgaXMgdW5jaGFuZ2VkLgo+Cj4gU2FtZSBzaGFwZSBhcyB0aGUgS29zY2hlbCBjbGVhbnVwcyBm
cm9tIDIwMjIgKGUuZy4gOTlkOGFlNGVjOGEKPiB0cmFjaW5nLCAyOTY2YTk5MThkZiBjbG9ja2V2
ZW50cywgZGMxYWNkNWM5NDYgZGxtKS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hb3lpIFhpZSA8bWFv
eWl4aWUudGp1QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL3Jpc2N2L2lycS5jIHwg
MTUgKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9pcnEuYyBi
L2RyaXZlcnMvYWNwaS9yaXNjdi9pcnEuYwo+IGluZGV4IDliODhkMDk5M2U4OC4uNDk1ODJjZjRm
NGUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNjdi9pcnEuYwo+ICsrKyBiL2RyaXZl
cnMvYWNwaS9yaXNjdi9pcnEuYwo+IEBAIC0xMzQsNyArMTM0LDggQEAgc3RydWN0IGZ3bm9kZV9o
YW5kbGUgKnJpc2N2X2FjcGlfZ2V0X2dzaV9kb21haW5faWQodTMyIGdzaSkKPiAgc3RhdGljIGlu
dCBfX2luaXQgcmlzY3ZfYWNwaV9yZWdpc3Rlcl9leHRfaW50Yyh1MzIgZ3NpX2Jhc2UsIHUzMiBu
cl9pcnFzLCB1MzIgbnJfaWRjcywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHUzMiBpZCwgdTMyIHR5cGUpCj4gIHsKPiAtICAgICAgIHN0cnVjdCByaXNj
dl9leHRfaW50Y19saXN0ICpleHRfaW50Y19lbGVtZW50LCAqbm9kZSwgKnByZXY7Cj4gKyAgICAg
ICBzdHJ1Y3QgcmlzY3ZfZXh0X2ludGNfbGlzdCAqZXh0X2ludGNfZWxlbWVudCwgKm5vZGU7Cj4g
KyAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkICpwb3MgPSAmZXh0X2ludGNfbGlzdDsKPgo+ICAgICAg
ICAgZXh0X2ludGNfZWxlbWVudCA9IGt6YWxsb2Nfb2JqKCpleHRfaW50Y19lbGVtZW50KTsKPiAg
ICAgICAgIGlmICghZXh0X2ludGNfZWxlbWVudCkKPiBAQCAtMTUzLDE4ICsxNTQsMjIgQEAgc3Rh
dGljIGludCBfX2luaXQgcmlzY3ZfYWNwaV9yZWdpc3Rlcl9leHRfaW50Yyh1MzIgZ3NpX2Jhc2Us
IHUzMiBucl9pcnFzLCB1MzIgbnIKPiAgICAgICAgIGV4dF9pbnRjX2VsZW1lbnQtPm5yX2lkY3Mg
PSBucl9pZGNzOwo+ICAgICAgICAgZXh0X2ludGNfZWxlbWVudC0+aWQgPSBpZDsKPiAgICAgICAg
IGxpc3RfZm9yX2VhY2hfZW50cnkobm9kZSwgJmV4dF9pbnRjX2xpc3QsIGxpc3QpIHsKPiAtICAg
ICAgICAgICAgICAgaWYgKG5vZGUtPmdzaV9iYXNlIDwgZXh0X2ludGNfZWxlbWVudC0+Z3NpX2Jh
c2UpCj4gKyAgICAgICAgICAgICAgIGlmIChub2RlLT5nc2lfYmFzZSA8IGV4dF9pbnRjX2VsZW1l
bnQtPmdzaV9iYXNlKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcG9zID0gJm5vZGUtPmxp
c3Q7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIH0K
PiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogQWRqdXN0IHRoZSBwcmV2aW91cyBub2RlJ3MgR1NJ
IHJhbmdlIGlmIHRoYXQgaGFzIHBlbmRpbmcgcmVnaXN0cmF0aW9uICovCj4gLSAgICAgICBwcmV2
ID0gbGlzdF9wcmV2X2VudHJ5KG5vZGUsIGxpc3QpOwo+IC0gICAgICAgaWYgKCFsaXN0X2VudHJ5
X2lzX2hlYWQocHJldiwgJmV4dF9pbnRjX2xpc3QsIGxpc3QpKSB7Cj4gKyAgICAgICBpZiAocG9z
LT5wcmV2ICE9ICZleHRfaW50Y19saXN0KSB7Cj4gKyAgICAgICAgICAgICAgIHN0cnVjdCByaXNj
dl9leHRfaW50Y19saXN0ICpwcmV2ID0KPiArICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2Vu
dHJ5KHBvcy0+cHJldiwgc3RydWN0IHJpc2N2X2V4dF9pbnRjX2xpc3QsIGxpc3QpOwo+ICsKPiAg
ICAgICAgICAgICAgICAgaWYgKHByZXYtPmZsYWcgJiBSSVNDVl9BQ1BJX0lOVENfRkxBR19QRU5E
SU5HKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHByZXYtPm5yX2lycXMgPSBleHRfaW50Y19l
bGVtZW50LT5nc2lfYmFzZSAtIHByZXYtPmdzaV9iYXNlOwo+ICAgICAgICAgfQo+Cj4gLSAgICAg
ICBsaXN0X2FkZF90YWlsKCZleHRfaW50Y19lbGVtZW50LT5saXN0LCAmbm9kZS0+bGlzdCk7Cj4g
KyAgICAgICBsaXN0X2FkZF90YWlsKCZleHRfaW50Y19lbGVtZW50LT5saXN0LCBwb3MpOwo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gIH0KPgpMR1RNLgoKUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3Vu
aWx2bEBvc3MucXVhbGNvbW0uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
