Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28055D1A623
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17qr0LNoyAdDR3sLMD/ArTedzwW8KOSv6iz7ICrSZ+U=; b=JrWm433KARPzjJ
	nFU44ecv08m45gLLqeOxGoJTa8G83twRR1RRdLCSj6pZuyryvEkqOvQOy5k7p/DRQ/E0iimwuCRqI
	pb8zIRd0wEXLOYkBLq89DMqqEPxsrEtFss8vs2ipnjFvF5FVtibwcDTJW4Xmg65vhfWqoMLKmJtvD
	po+qBj4kBIU0FedQrgTRa9Kmk/K58NnaC6AmKhYtjEG/PKs4qM1vj5OqEc0q4sIpn2jUFla0jnCmE
	6bWGFQwj5nbD43n+lI2VwVtLHtijRdFJIMEpzmLGK/4l/G2/4i4+6nUjPVnrspYQ+osfMS+Q4rQwD
	TXIuBG3brY4VleSAudhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCR6-00000002Lau-03mO;
	Fri, 09 Jan 2026 13:21:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCR3-00000002LaJ-1vgN
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 13:21:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099jJtp007896
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 13:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BJpvv9CAxjxya3vDiC3pvKGJRe500UKGEV+RGwaO2ls=; b=WX
	hEiw/2oKmYNFFdOqfMrcNoWZvCEqAypOl56bXLBwan+58yVJepe2ID5MXdOKx5Th
	svf0Hvm2K9pBhc5BaFMmbV6+ixlWG/qY7PUoPmPj6UQYkiYUSi1Zuexh9iym6On5
	OtOrOgO6976pOqwrSe+Pg1b0qq+rI01wWSmKgB5bvPUyRzdO2lOhYsJH4zOV81X8
	DUTESvIyxrLj3UaUcVWBd0d3oos4IN6JqirVx+/x8K+UbCXvzSVRKIvmIj9AQs/k
	5jmls5NVpKBnrJ95uT0v5OdFluZW1/o2jTQ+LwUCHoHai+/gdC6Eqm58vy/Idl0+
	zrDP8C+Rq+GjnXW6RD/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjyaqgjua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 13:21:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so117813131cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 05:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767964907; x=1768569707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BJpvv9CAxjxya3vDiC3pvKGJRe500UKGEV+RGwaO2ls=;
        b=asOmtjINl5QGAuJ7drIxbyCCmX6Rd50uo21RQgOlS5s/HCfbyw9duQ91cl0KS/M7TD
         XNYLiNz2wVv5LEekgUIui7cz0Ef80YqvkujJ6OszQ3/3r16HJZ0WofCKOG7pY9cxm5n1
         KjaWvMj7d9GOVSUG+8l2MbWE0J9oY5QnjaDE+wXSCmmoDCxrpKjdQ7I6Q+qXE80DapNE
         k1RyJyx07bTntT9SLYKeBuIsZQW9bZU3XSJvl/PzbQvsDRigmWrhQbQ0Fgv1qdfZn17/
         Q4w3G4H7yMEdkB6pnr8CE+UT5w6JplqHl+fM1j7LHIUs4272PRAh2b/NVSBS4IHG/BYz
         DBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964907; x=1768569707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJpvv9CAxjxya3vDiC3pvKGJRe500UKGEV+RGwaO2ls=;
        b=QM+a/EleKjz1O6s98hfIUS8ZZrCWrdGsqrkpz7JHzvLIYPJx7/oNCDamAHQJ/m1csd
         cfwZyt0k+NeBkSxJKiyfwXQ4eo/wFBmsQa1QQqmMZcWsW9/W9EIdw1ziPo/xPl+TI1oj
         KSfCvaImIV7Ivy14AmUivU6J8RkcceVHW2hzCvjCNXa7IRCx7UADcKWBu0g+WNwUpiiU
         V76jVg/2akWBPF2ZXGMQmFNJ4JC0+IP+aYg6W3cM1YsuuVU03ZJEhO4cpiZRp4T6cIur
         r9rOWGt3vB1wMr+RKAiInS7Vj3JXPknCBgKYbHvfJHbydTOHqY3wEexOmyXlWQXw6vRx
         l//Q==
X-Gm-Message-State: AOJu0Ywwq1FhbHVvXufVXvyEYo3EW2G3zTVI7sEiz/Z3hq+KgacX36L6
	Flj+QaXQ/t6bqBVEpouZ7DL2G8Sg5WE0ux0IRTLv6bkt4fqiMU6fNoHQPyHWFOWFH692AI6BOxt
	S5yHOE8RrhaEIkci0evQe6bFMETt/STHcck5Xmfkws5deFwIp0wPWn68gPhkiDZ83wi4P6kgSRx
	oeJddcmM+3n30iBvpqoW6LG4gtKddy2SYGvyXzPGN3cE3ZAw==
X-Gm-Gg: AY/fxX5vrjdEFZGf0duEkyS/QKMIR8yGLsgBigKdpD1lCtCWguR8cgpLYsndN8WvGwB
	3ayeVoLi3wK3vA6o8yhqt5mn9PmVjjGroLe1lvjS4eb6hoonsqR6kpmaOUsQGAD8OC4X6cQG305
	zwSeDsozropDelNTI9iEcCNEI7d4odJo/jnGlUcxIZuq7XE8a9T38huH4d+EbgXKM+aPQ=
X-Received: by 2002:a05:622a:14c8:b0:4ee:61f8:68d6 with SMTP id d75a77b69052e-4ffb485404emr127525291cf.6.1767964906797;
        Fri, 09 Jan 2026 05:21:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECkusQZQQHBVt2A44gSkXhBbZXUvr9pmoh9OZwBivjqjivaJRNE2lJCJ8geRdznbFg0XMQMJzEHdBSKjeUGqY=
X-Received: by 2002:a05:622a:14c8:b0:4ee:61f8:68d6 with SMTP id
 d75a77b69052e-4ffb485404emr127525011cf.6.1767964906406; Fri, 09 Jan 2026
 05:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com> <20260109090224.3105465-4-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260109090224.3105465-4-himanshu.chauhan@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 18:51:35 +0530
X-Gm-Features: AZwV_QjUVwGXO2R47NOUKBNVW8AqeLgnl_83gTKQ6qB3PBktNV8dMcQ64Qr-7zI
Message-ID: <CAB19ukG+_a+q8htOMxXnQRByprAmfPjCfNeHBh-3GqVeQbNMMg@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] acpi: Introduce SSE in HEST notification types
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com,
        anup.patel@oss.qualcomm.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5OSBTYWx0ZWRfX1VMhQDUGeRwb
 pna6yhGHR/FQfUn4xIg4UO56/VfAIZgsVIO3XInwO66zi4/L2b13ESyQtSSZAs8Ow1pq79usyiI
 Y7AKGdeBvg1RR2BbFD2jctJ8dVH3UNahCegYfu/Xi9s6thqIzvGF61CAhN/7LAJauQiUR/SiGHq
 EzUlGeVV2CmCSGYbEkaEBmEiZHxsqMfgCLDHgY8Y+UJON7FGxNLwuxXkdPtel01rlhCvyy746Bl
 r0eUODYoQnMvbEFmkIotcQMpAKOOgpG9XAW+Gr38gzsUWudiTdi33yX0RMrdI5bMYoBRgGO0GW+
 0c1tH7NeHnnEWmTahTYDppj2xY3RZrYZBPAp+3hWrdQ/eS4f8oxKMQk6Pu9PpsZ1F8kzT3OYLBF
 nUfII67zuIZBIRnMKBG4DqKiRT9dIEmEjVWXgAu4GvsL+Cw3NCKI3Qk4RxcIzRKsjVe2+GV+6NJ
 Q00Ke8zF0TJqZnuY2pw==
X-Proofpoint-GUID: SaWTtRkwARUILvWidr4aMlsHObRmti83
X-Authority-Analysis: v=2.4 cv=IKUPywvG c=1 sm=1 tr=0 ts=696100eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h0uksLzaAAAA:8
 a=a1NblK7KE1KWh-jXdIsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: SaWTtRkwARUILvWidr4aMlsHObRmti83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_052149_621314_55913222 
X-CRM114-Status: GOOD (  10.58  )
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

SGkgSGltYW5zaHUsCgpPbiBGcmksIEphbiA5LCAyMDI2IGF0IDI6MzLigK9QTSBIaW1hbnNodSBD
aGF1aGFuCjxoaW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gSW50
cm9kdWNlIGEgbmV3IEhFU1Qgbm90aWZpY2F0aW9uIHR5cGUgZm9yIFJJU0MtViBTU0UgZXZlbnRz
Lgo+IFRoZSBHSEVTIGVudHJ5J3Mgbm90aWZpY2F0aW9uIHN0cnVjdHVyZSBjb250YWlucyB0aGUg
bm90aWZpY2F0aW9uCj4gdG8gYmUgdXNlZCBmb3IgYSBnaXZlbiBlcnJvciBzb3VyY2UuIEZvciBl
cnJvciBzb3VyY2VzIGRlbGl2ZXJpbmcKPiBldmVudHMgb3ZlciBTU0UsIGl0IHNob3VsZCBjb250
YWluIHRoZSBuZXcgU1NFIG5vdGlmaWNhdGlvbiB0eXBlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGlt
YW5zaHUgQ2hhdWhhbiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPgo+IFJldmll
d2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGlu
Y2x1ZGUvYWNwaS9hY3RibDEuaCB8IDMgKystClRoaXMgaXMgYW4gQUNQSUNBIGNoYW5nZS4gUGxl
YXNlIHN1Ym1pdCBhIFBSIHRvIHRoZSBBQ1BJQ0EgcmVwbyBmaXJzdC4KClJlZ2FyZHMsClN1bmls
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
