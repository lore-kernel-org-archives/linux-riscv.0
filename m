Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2A3105F7AF
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iyTehutuW1JqDakRcQDbAhCTcR+OeZUCWoizaQ3Ypw=; b=kUBSOnE3/3dF3q
	qE7K2svfIZeOFz+bCxgcKvWuNFoPR/fL3J99JfKSjnjlwwh4EkYzUWsrQcBsmr4oCcmQMrcuPpoqT
	FFnO32mvrH1ScxbpI+NCRW7Y71w//Q4cFxumN1zQStvPf0yaRWQoOO/j70fkiCXw6OOXj7r1QOazL
	4XAHB/N08Qo6KyOsLV4KnW3eOnLHcLj3eVd2xZvgaZm9CykEWGNqdx3c8hRhi4LHzqq2PKZzFfqWQ
	DY2QHC6Fyk5lb2ljBVY/N+LjK7U5BrZMgLhMucplxDXbwnQdd34A6ZmrrvCVJdEjVeNjzwkDD6mWL
	uTgBahfZn81HFtBP18ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Hk-00000000Lgl-14xA;
	Fri, 13 Mar 2026 14:14:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Hg-00000000Lf5-2wrm
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 14:14:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DD8o5T793568
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yb8otKhnt0ZfdX0TM0MYAhAHgSLa2dwwdNl7K8IPkJY=; b=mIbw2WhsYb6OPwUq
	6cyyk5xfsBmRsyPT+GcQe17MXyaIHACsQ7bjCNpfVFpXm9gX+79rHui8VDQdh5ZB
	EWsRmjO4ZlbFmpJb2To3lTpeUD4rRzFrGGE5cnUvleMYzyzYS1sV0XshX3HrWlfL
	9ylyBNwlkkO4dgrFtsC48J8UzPIhFKwfn5GUfBzD4Ea5blNXld6H7wG/OAmnGbBG
	AK0K5nBUEPcJOYVn5eA5/vlgcpr/08GRK4iEAq83HY7/FldBiVE/Y7bK5KhukRF5
	XtNM2zZb77HYHN/EuLYKAtY9u9w1lZk6CHxW9kLdKUKJ1cFlBt8ByeMZ2L37HoXk
	P82DlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt1ja9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:14:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd722c1a69so1322022285a.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411275; x=1774016075; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yb8otKhnt0ZfdX0TM0MYAhAHgSLa2dwwdNl7K8IPkJY=;
        b=PvFIkDlRMuiI0EE+aJrdHjRxFoWHhgSI2lG8wVMtmbOAjDAw+0bqFKi7FUuA2jr92D
         20HfSCvxcdylM7uvlUK0N9Dh/KwmtYomWPRKi7Hv2hKM7gukSfGuAnpyJrtmwDiEh8JZ
         ON9fMMmyHBfJEqjz3qTzrpOPdh5xkFPDWUeslSjxIGEqtYqlxgSGH3MbkdueQD31dK/b
         rYJ5WvI2k4Va3YjJZw9s45Ljdugoqb6PIg6rAVLWq8caodF3p92HC8J793MpEcJvFLps
         jAXIoXDjkMnaaIwTNEcsI0jxehkzQyybpqm3IzC3vNasPJUCjES7E1dptUs4Cgg4qc+R
         twDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411275; x=1774016075;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yb8otKhnt0ZfdX0TM0MYAhAHgSLa2dwwdNl7K8IPkJY=;
        b=jsAVRI8N7n+mt9TAnwbE12U47pEbHdu/uhrzPPTNnf3Dqf3dZnDeymyeRLtcgzPfML
         ElNzuByfbdeFAG51F9zXWkDbaCmdTFEM0VB1PYD0Zb1we55zRQtjq/xFhnibhQKTQV0a
         t640Lutqjpr2x0cE3bJg5SLsqXySGyLVOtdEFRM2CNd/gyjuLfG4pYej2J/mIZxYejZ+
         drnKzmZF1E+Frg3Z39E5OKzOPyfrxgWJRbz5Bjm305fMK3v8Df7JeqJjHkIUt9Wb4eSf
         KQnmIWvk2ZfJnxbBB3Urm9x1y9ux+MR/uKKEbdRGGRGKh4LJgHCcqGUAE9PANB91SAb1
         grUw==
X-Forwarded-Encrypted: i=1; AJvYcCV7kNMVwS1VQfzxHonZB8+if51vzspvpF2D0sdhaom8IGBeKZ5R4iAVu6zeYvfYgIgE/8Shq2O9OlQylQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz61NmzDd7mle3AEuyCmYu7K3uXntNrDR3eQLojzTVxqZGNzetY
	IZRNW5yR4d52KgyN60Z7gDtV/ugJpoj1oLdOhUARHWgfA/rf3/V+C5Xid1Nz63wSO+9ZtsncYuK
	oDeBvBSvxDaRR6682rlR4njNgEAnpnEbRdrJ+goFHQ69oTBicWCBxXWfdkxVm2JS3KqaeTxk=
X-Gm-Gg: ATEYQzzYLNXKPq77+t9UEpjZMLrjSrXmwQLiDPcDZehfPJK91sJ2NB0SbJL6rr9Snzu
	N1TGJuCwiIHBRY/DLcCPyOlw/t2fxEgpjECGFGrFOcpxxNcVnzhPZEFmzEOPC/fCMwtIOtU9ZIf
	grEK7YnZRFeI0wrJsLNIlQIrb+gikcuxwc98O3YZOVVp9AJsm2qdwT6algn9wA2w2mzjRRyA9Kn
	Za0VCLkvzDwzcJFBWisM+hyhVtcdHnFA1EjoJfdQqy57ZE68B7ehsbvBWjwv7XbHsTfLDQzoCDJ
	2ZL68R1XfqZboVqqL29Ynj1QUTIs3cWn0wHGfp7m9SPnaQIn62uoI1rQBEpnrcRv9PomnPp0q5M
	7QzE9lvvKOULNu4Tmgh+JilNuWdIlGqwToFDGgnJZ1rt77jhDWdrrKDx8x3oQ
X-Received: by 2002:a05:620a:170f:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cdb5a61b1fmr457592485a.28.1773411275285;
        Fri, 13 Mar 2026 07:14:35 -0700 (PDT)
X-Received: by 2002:a05:620a:170f:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cdb5a61b1fmr457584385a.28.1773411274689;
        Fri, 13 Mar 2026 07:14:34 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm44367405e9.7.2026.03.13.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:14:33 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 15:14:32 +0100
Message-Id: <DH1PTVPUM2UR.2J53ICCVVPAFA@oss.qualcomm.com>
Subject: Re: [PATCH 05/27] RISC-V: KVM: Factor-out ISA checks into separate
 sources
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-6-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-6-anup.patel@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b41bcc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sIBLlZgNAvny2aHwhmQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: cJwdU2ZNZQV2DXuduPRi0kZLF8voq7mM
X-Proofpoint-ORIG-GUID: cJwdU2ZNZQV2DXuduPRi0kZLF8voq7mM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMyBTYWx0ZWRfX3VRTpwF4u6iQ
 XGWonqvkWXHJs4MZloLHeJJNJpRy6yLp+erV2YpMHdkguvDwlo3h3xynTYKRsjpoW1i0nj/UHXa
 FB8XXMioiJpZbRPgX6ms01Bd6UA1JkkAaIa+38P39VvkhHfLqQKCdERaV8GMSkDXGB+E7X/9bBx
 8RsSX3UGHXcJd6kd8oWnOegNHN0xPKXmDsrd/YN1Vx/XFW8A3JDfr4mLmpjpMnIAU4bx13DRTNV
 QyHriSpkHWIW989ZV1S4ygdDErl8s4h7UUXSezKMPv5kVtYdURRqARmXsGcao9QUlPmOtdXvzfE
 vdQYkaal9WVGeP5HgOC/2Ws6QXP5z3gMvLwtfuvzIVwBS2SwU/G6XWlTU3UF/EGD2DR5cLfVxKw
 J3M3gL7B38eRIr0N4okJol0fmtJ0MhH7jzDzefsE7fESU4anBORWv+5G4mfKoiA0cVGcFFBXa6q
 9rCQygoVb+/INk4Fgsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071436_744462_993FBAA1 
X-CRM114-Status: UNSURE (   8.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MjAyNi0wMS0yMFQxMzoyOTo1MSswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBUaGUgS1ZNIElTQSBleHRlbnNpb24gcmVsYXRlZCBjaGVja3MgYXJlIG5v
dCBWQ1BVIHNwZWNpZmljIGFuZAo+IHNob3VsZCBiZSBmYWN0b3JlZCBvdXQgb2YgdmNwdV9vbmVy
ZWcuYyBpbnRvIHNlcGFyYXRlIHNvdXJjZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+IEBA
IC0xMiw2ICsxMiw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvdWFjY2Vzcy5oPgo+ICAjaW5jbHVkZSA8bGludXgvY3B1ZmVhdHVyZS5oPgo+ICsj
aW5jbHVkZSA8YXNtL2t2bV9pc2EuaD4KCkkgZ3Vlc3MgPGNwdWZlYXR1cmUuaD4gaXNuJ3QgbmVl
ZGVkIGFueW1vcmUsCgpSZXZpZXdlZC1ieTogUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJA
b3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
