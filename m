Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF47CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+iptLarfIPakibvmIVRJBTSCpgUESSYIW7kJU2rz7U=; b=bGnHoKNE+ADJem
	fboYHeM7gSf7dsYlQOtCQbfAfYrYPBEiGMWM+lP88haP9hTFzwC0Wirl5Zn24ua48jJhk+7gvd9GR
	XYOPZT9Ulpz1fa8RPb2te2u5AWJuWGHLB/BLbEx7UV9gx0DZv/oQk2qJQwSzZMUWhWypqMWRx//Je
	hdJi20vFJLnvVemvThc2fboVoqrWn+77xGscjlaaaM8mDAcAIMz/Hstb0hKmZ6cGTZYi4f0P9+0gI
	tJ8dVIecVR4tFU3tkZaFSj/CmxThL1qTmvwNMOt63Miuy79HSfPmVCQD3qYrvIhVuJ5snJZIRKNYA
	iiJMbkSgbV/g2STTdqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5CO-00000001mGv-23nz;
	Wed, 13 May 2026 08:44:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5CN-00000001mFe-3haw
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 May 2026 08:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=10e/P1TFZBwN9btyQIYXv7eFhzP3u0CEgDuiofULBYw=; b=daV3OzquntuGokMaD9Q7GmMqSo
	qmpi8qxWlTb12TPHCMvtzGrLxjn8EtBbf3HBczz8Bp0VxDp8PBHNr40+QBZhlUe9aLs0bA9RD4ox0
	UmFeTIY4xjowqkfBijlGggYo2Ygo+EuG0EnvWG/boICbTr4huDWK0zUVY/yOBjGXW1IEG8KeUMSHt
	fAD7UWY3TMoxkxw5BpRMK516zRFtVMPBBXKeBzR9/lkp2e01oLkXjm9lbYgbMsAQxtr9l06Th7/aw
	AFizAAYVO2FS+fKfktVb9mzhpS6QrwvVMcELUNrqrylXx3Ocr3AInpIwR7fDdDkq+JbhdXCIFA/pz
	CgO4oEGg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5CJ-0000000Gs2x-3NnN
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:44:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p8Kf2932978
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10e/P1TFZBwN9btyQIYXv7eFhzP3u0CEgDuiofULBYw=; b=FiV9PcTOqUDEUrUB
	wi0As6qHPrmE1gK7uhvqXC2uVxa9J1dv7ySRSEbDJLDcDSaRwakuHud2jdMnNIwK
	Q0hNZ6dBU9a3s/Z0SfKkRwsydypn6S9OxbyfClQ0AH2illUtBPY0lOL+EBmocGs/
	pi6ioYi75L7WwnsGMhylhE3v+dWyYG3LPDDSoMF3YV/CKXBOiSCOyqzbDO4uPYqO
	gGs/hNOmOPNo8l9XQpt3K7iUwXJ5Je/tFiOSNvW4UlEjZBHYJkLO+pEUD1lNo/kj
	J+7Cfdr/7xYTwi72vawVCnv3U4srs/SJjVvCDmIO5j+nPL1VGlMVJrrIwy/Q9qmI
	hjYInw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319vjeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7c904d476so70931925ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661841; x=1779266641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10e/P1TFZBwN9btyQIYXv7eFhzP3u0CEgDuiofULBYw=;
        b=iJrtFzqOlgVt+OKkp+rNvl2EHHg99O/e7s0GyS1nFK1ruekMebrjjl/JyOfCMDw1c8
         Qk3chSilwTIu/P8h9kNRlOk9DpqaAWB+ajP/qtQ8Uf9G3WL4eweA7klH7ZiMdI5TuGW/
         adlEeqs4ljX5iLagVDYG0InizJSgYl5OjKZVBcgrZcRICQstEn2LG8wasd2fOAi2dgQs
         8DNDGH5Nr4O34ZEfM9F5N9ygOReF5AIE6kyT5/WqhAExL/Z8yXQtpD5O6/Moh9HnJUtI
         GvYPt7bwGXDXT5tW0z1ZWomwrp6VsChBY6E0LfgVKkIXPCiuB+bNsUPOQbn/rn+zS+UP
         VAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661841; x=1779266641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10e/P1TFZBwN9btyQIYXv7eFhzP3u0CEgDuiofULBYw=;
        b=dfo/KQm5Sxc4MJzsIkVO4GroH3VIABLAoCrLJiEfkZW01NzP1JQvgJRYzrd1kqzzfd
         l60L1I80icRUOI8rqFm9mPDb+047luhk3my6v0od7XhRzUboiXVx/Yjf3YryVXSq86XV
         A01YigyYama061/V8oXvyXZCMYOyShAmuELmzG6m88P+USgwh7vDocf/bFuNuwMEB74D
         UDftz5LGMpi5AvxsATkIQUiFXMMzKZBc7vDBGHrBPswp48snhCdemdpopPuk7A9JmePi
         UmmpcZ7PWbclJFQrtgXTtqAvUMufYe56MS7NEKQc+wA0JInDIPaNdSyfonXGem32b5de
         brUw==
X-Gm-Message-State: AOJu0YwO6yeQzXeLykEiAD69/vksJtOFCOFRfPH1WuX5F0Den8vuKTHy
	5d8553kG/qWSfNa9sa20JlLTtV7Zm1mbuHF2qkWOa5TT+lMakF39juauCNt0J3WH7/SnGOmYyn6
	ZNe8TmvsYQWnUG0Q22PtrDkMSSznDCBZ/RPXzAaP74LV4CfPosVdT9qSHqLdOc/Fhl5cZSHKfQ+
	uLCz8=
X-Gm-Gg: Acq92OEu4wv5kSHt1qLB8XU89PFhgxZOwFR56KSIdtNcKi5MRguKfLwrLiA4cV2W1cn
	Dw+W+4hdPVH2dqKESqZX1QcEewSKmCWAJcvoIa1bkB+uWxbx4MouLjOhBMRdl3feyRRkomOniFA
	kN/vjLTvAPK/LdzwpiP3WzrIyNB4yb++in+tcDpY33j+zQIPCJbOSQb1W9b244XuekqNX6pmUCj
	D+sI0PsxeX7S60Kkkhep3g8YhkgJ+vp53sVnvTbP6ulAVu/lY3qi0NF70tTBXu9nKpVaK47Vb7A
	fK7J462NGjTUPgkqntIftQoWMYkS6vYDy4MQIe0OeTr45mXs7ZHvjXy+vROpkNCE9QHiRKvRi/c
	HQ47VuxvKqIpuIQ0Z9g8h7mox9SwfsP+ysBrCNgpqRu/SCIoagiGsYuM7Y2JNJAVC6ePRZGZyKI
	/V2qVN/lcPdgYeQzQ38YHWXoYOATx9UCW5JvDSYTlNKlXdbw==
X-Received: by 2002:a17:902:db01:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2bd2716dbd0mr27138445ad.10.1778661840798;
        Wed, 13 May 2026 01:44:00 -0700 (PDT)
X-Received: by 2002:a17:902:db01:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2bd2716dbd0mr27137965ad.10.1778661840293;
        Wed, 13 May 2026 01:44:00 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:43:59 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 03/10] acpi: Introduce SSE in HEST notification types
Date: Wed, 13 May 2026 14:13:18 +0530
Message-ID: <20260513084325.2176952-4-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfX3UEyDP9S0cqE
 ZqEPdzc0/F0Eo4+paQWOhfcxnTjqacxZ4qr1HN6gmpkiEvbuCA/DtPbzmcjVXTfQHBJnTQ4E/0u
 AbC6/mlCTzUiEn0g06cXCtvy7Eobr1cZWbPWFhoEreYu7TQ3+f2habqr2xH4CcsmV8b/vLER5+z
 afK19JYM3mFi4HP7vmK0exQVVNUUV+wihmKsf6n4JiK194ibgwlP2tiIP9K/aeK2zxykyuaSziR
 sacK+ymAeTg70yY1vnVrKwid8SFGr3cir9994jb7YzxaTgdLPGX+rhdcC8lBLNs//uWKFXqHsP2
 rH9NLacDZsUHsZICErxB3xZUSkc/KSY+cV8GkcLiU6MW0SBW06MrLKcmsYfonRj254cAh7QDDVo
 aA1OTA3+VDAUwx2NEmyNH6OyqG/IfSr0Mu5g34dqln09M8oA7C719ZhMD9ktBMCsvzWzZMw66Ih
 16nDDuphuAaZdHLiXfA==
X-Proofpoint-GUID: sWPUyf0liJ7VuYi0BdQJ0EuAXMET_N7X
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a0439d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=h0uksLzaAAAA:8 a=6zSMeUNXk5_XeOI1LAoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: sWPUyf0liJ7VuYi0BdQJ0EuAXMET_N7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094408_502805_B10EEE36 
X-CRM114-Status: GOOD (  13.37  )
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

SW50cm9kdWNlIGEgbmV3IEhFU1Qgbm90aWZpY2F0aW9uIHR5cGUgZm9yIFJJU0MtViBTU0UgZXZl
bnRzLgpUaGUgR0hFUyBlbnRyeSdzIG5vdGlmaWNhdGlvbiBzdHJ1Y3R1cmUgY29udGFpbnMgdGhl
IG5vdGlmaWNhdGlvbgp0byBiZSB1c2VkIGZvciBhIGdpdmVuIGVycm9yIHNvdXJjZS4gRm9yIGVy
cm9yIHNvdXJjZXMgZGVsaXZlcmluZwpldmVudHMgb3ZlciBTU0UsIGl0IHNob3VsZCBjb250YWlu
IHRoZSBuZXcgU1NFIG5vdGlmaWNhdGlvbiB0eXBlLgoKU2lnbmVkLW9mZi1ieTogSGltYW5zaHUg
Q2hhdWhhbiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPgpSZXZpZXdlZC1ieTog
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGluY2x1ZGUvYWNwaS9h
Y3RibDEuaCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hY3BpL2FjdGJsMS5oIGIvaW5jbHVkZS9hY3Bp
L2FjdGJsMS5oCmluZGV4IGY3MmUwMDUxN2ViMy4uMmE4MTY3OTc5NDU4IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2FjcGkvYWN0YmwxLmgKKysrIGIvaW5jbHVkZS9hY3BpL2FjdGJsMS5oCkBAIC0xNzk4
LDcgKzE3OTgsOCBAQCBlbnVtIGFjcGlfaGVzdF9ub3RpZnlfdHlwZXMgewogCUFDUElfSEVTVF9O
T1RJRllfU0VJID0gOSwJLyogQUNQSSA2LjEgKi8KIAlBQ1BJX0hFU1RfTk9USUZZX0dTSVYgPSAx
MCwJLyogQUNQSSA2LjEgKi8KIAlBQ1BJX0hFU1RfTk9USUZZX1NPRlRXQVJFX0RFTEVHQVRFRCA9
IDExLAkvKiBBQ1BJIDYuMiAqLwotCUFDUElfSEVTVF9OT1RJRllfUkVTRVJWRUQgPSAxMgkvKiAx
MiBhbmQgZ3JlYXRlciBhcmUgcmVzZXJ2ZWQgKi8KKwlBQ1BJX0hFU1RfTk9USUZZX1NTRSA9IDEy
LCAvKiBSSVNDViBTU0UgKi8KKwlBQ1BJX0hFU1RfTk9USUZZX1JFU0VSVkVEID0gMTMJLyogMTMg
YW5kIGdyZWF0ZXIgYXJlIHJlc2VydmVkICovCiB9OwogCiAvKiBWYWx1ZXMgZm9yIGNvbmZpZ193
cml0ZV9lbmFibGUgYml0ZmllbGQgYWJvdmUgKi8KLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
