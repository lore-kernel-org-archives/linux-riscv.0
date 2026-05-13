Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EFDCD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bptf6ajhQV/z+HoRBsHKmbUxV2ullcMmBjeGfMGkMtk=; b=XK5bT3UrPl3LE1
	c/x72qgTfE0H2P/vj7cZQnwPKu33kXGRZUr2+YSZGq676SwcCv3mEA9+xOv5wLYx+Cav6wQGZBRWp
	YowwVyfwewF22wG2I47TwRJH7G3R+H++P1bBA3SGz6iRGIPB+9m5cU+Y25EqTd5ZT740pLvGDVgGc
	FJJoxPJraV/PKJkBtcsijIVJfm7fIhB8u7rmUyvru7lQ3QV06TIN3EnowMShQF0dNh2nZWDnBe8+b
	xgrrA7A2qxqUgpoUI92UworjHEi/ZkbZ4Hg8wBZ7wvDs02zkY/If/CG7kQnnpHud4c7Lcw27x2inO
	JtbzSmnvqZlLfWmWw+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5CN-00000001mFj-1Y74;
	Wed, 13 May 2026 08:44:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5CK-00000001mEO-3oe7
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:44:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9nC2652380
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQxw9pRj4KjsMr71sZ2t5x+9tK+jz2fwPiFRsDjX/i0=; b=KV2ULzrUF+A121l9
	z9f955kn0s1jVBhILxSnebPtKiWic4KBX9jO7+5bV701hVPYAjoFWfFKYQ+w8bv+
	IfQMCgOpvfz8pP6wHuqSO/wlu4nYnTUCvi2m4sYEQ5S/4uTatQGRTCkM3yWtXvFj
	LhiT+JOzzI7Sd+i4bkvpSxa7avNl6uwHRRVCbKksMhULwrlXHg7wXa6xbADYoYT/
	S/LOfwG6PsNRU4CaR/RudRWeqhdn+ATc0Z3N5cEHpm9QfzrrpvLKkqNbsPBuPbhG
	aqxJzS1/PcCVa5l3Ggulq0N5DfhG01kxnRqLYbJ+kWSU6oq1480UIYiAvW8Q5zqE
	Vaap8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avku63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba15e384c7so39782775ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661846; x=1779266646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQxw9pRj4KjsMr71sZ2t5x+9tK+jz2fwPiFRsDjX/i0=;
        b=F+etPTCKD41vZy35VIzAws8TznNVaULVYcWhkdGXjeQlVdh3AnGcwk1ZXsYraRDZgl
         8lkEld7f/dmTlQ2fgqpO2PRkmcpfTpy6ucCtVqAzpu24Hsr7Q6CL0CXhNKbxJ5f4dFwI
         I4hsdXYeXU4zg3/+KaFtiuJQIz+QKstxYg1lw2M3p4FbYBlMexGUhGGNMt/pDR5oBypE
         oUqwA65fIF5e8Lb2Rc9o9U4JyKXykkBQSmsmkV5WAzp/uGhsCxNWFllEeGZKq2cltSdO
         UYZEcn849t00PqXU/5qQ/1qrhQMSYy4sl3RW5byVMIfDoPXtxNhKii3nMGD6ef1r5zbf
         4JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661846; x=1779266646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IQxw9pRj4KjsMr71sZ2t5x+9tK+jz2fwPiFRsDjX/i0=;
        b=mjcG8vHRFn9EkRLrXJzhJcb1Uel504+Qb7Uovj8LKe6Lh2CUniR8Chko4GAdcrRUkr
         Io3RefE82HFwsnRszMVx+5v7uCGi6yQ/FLJDBOC2gvnzPon5aG9cwhToP1kII/YGlyzn
         PSwX3xxTBhWyzqXfmr51C1FnwHULmZct8iQ67KetWVDuLEwSBoOPYlr60r+4bo9+yRPF
         ngdC3XhDz5uYuSWj87pGbZP9dzwh/BKunkrC3j9OfNfSlG0/wr6jospxE3mpwWwocgPe
         RbFusMN5ofBXMRe+lc8GHEuxx/YZL9EG9fv/vGKt/n+23v+aYn37W3GvfIhCn80rLmQ1
         MYIg==
X-Gm-Message-State: AOJu0YyGONCKtNXiie4RLRSbthw4aFT3T15AkxDILuu1a3ji/5z7c5Tc
	CaxOM/lBT73tb4sLl81XJCyxHFucWxl7uAHGaD4ERd5RnCRdHtZls6RptzJF2B1Wl3anVivga86
	UDJteDO4lkA2NEeen5tG23rJAySwZmFOQ7eEOUSdoHpTQ857HWPyRbwgjs3tIKcsv3ffJfKok3K
	PsqzY=
X-Gm-Gg: Acq92OEI6yTTnC/Ts9YbteaM7qOKpBEzUrNSslXk+JltnS3C4ZcnEmu4ARutoB2hsYP
	TOfvi4VhQkAQ1kNUgpLCGClXAmFdccjbyvB1D6sPBz7QTaDn2PSVOcW8VrO1hVwXzAzGul4Ecje
	Wh3giunfZplscRkgDGxG2IREk0c24x2PpbMLrwlU5KYUMIdHngzZ17s8crJ2I89LSjIhr7XFqbl
	3eQ7hIYFgUa0E8KwyUNhySiwjSPW0oTEEOCsv6r/B2lCRfMiC7D4gvlPXLm2wR5Ly/aG/JIZ3rB
	0IyPqFTIf3JWOWIWgux6MpRXobx4UIueAMgq95hIZU829r59hP7K9PZgTfebDKCK8gQJAkqgvx5
	Furyrx+VC3esnUGyOM3nbvYOfI8uMHv8Bdi4m0ah/ydbTq08wIU/BvCtzSIfpMPJli7+t4n4OWo
	rK2ggeH6pEobKkLWzBrwPiVbD0M69oLW01OYJ+bDpHh57s9g==
X-Received: by 2002:a17:903:238b:b0:2bd:a5e:4c66 with SMTP id d9443c01a7336-2bd27161669mr28108295ad.14.1778661846227;
        Wed, 13 May 2026 01:44:06 -0700 (PDT)
X-Received: by 2002:a17:903:238b:b0:2bd:a5e:4c66 with SMTP id d9443c01a7336-2bd27161669mr28107795ad.14.1778661845699;
        Wed, 13 May 2026 01:44:05 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:44:05 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 04/10] riscv: Add fixmap indices for GHES IRQ and SSE contexts
Date: Wed, 13 May 2026 14:13:19 +0530
Message-ID: <20260513084325.2176952-5-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: cYkOTtFJZaBCp8qQY_aEZoI3J13cfGLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfX1Y+9zxwqOKpi
 Qikbv9/Bxt9C0tI2XPwvRNLJ1Tu6/ZqVMdSsJgbNoNgGhXbsyn+BNONqKzM2G4F1dIKSRHyAyXb
 fijlnNKwff0cDgyljO6/BLN6fNhHJzjyzIT67sPdrpXkk5qCKPCOObj72ee4p+pKglvuvpadtcB
 kzV9537tLxtdViE8TKAMbNTassHOg3u1dH6mK7daXBzS7IyxC5j68PL9MxODA7PlUnDWpfvjOHm
 +YGW4HXguGr+epI0onEgAuJFFVXZ92npRNKfM1mPSUYpNfWO9Vhh929xGz064MA0+1V0BxmfB2m
 mPJz+K1tkMJqnaQTeU6rlemdAu4d95P2rJA80zTiihu2wu9OWyA6Y9bStClAvY8JIEu72xf8Gj4
 ixz5SjParxTv+E+xtajasDFCZFCt+1NM5mHkZno60ELlwFe1kKNHKJhiXNUBgk+Zlcq8BajzTeF
 +fcyaOoA2Zmbgc0qLCg==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a0439d7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=h0uksLzaAAAA:8 a=0wheRbxtA0UXKxI4o1AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: cYkOTtFJZaBCp8qQY_aEZoI3J13cfGLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_014409_067619_86B3C56E 
X-CRM114-Status: GOOD (  11.03  )
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

R0hFUyBlcnJvciBoYW5kbGluZyByZXF1aXJlcyBmaXhtYXAgZW50cmllcyBmb3IgSVJRIG5vdGlm
aWNhdGlvbnMuCkFkZCBmaXhtYXAgaW5kaWNlcyBmb3IgSVJRLCBTU0UgTG93IGFuZCBIaWdoIHBy
aW9yaXR5IG5vdGlmaWNhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBIaW1hbnNodSBDaGF1aGFuIDxo
aW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+ClJldmlld2VkLUJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9m
aXhtYXAuaCB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ZpeG1hcC5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9maXhtYXAuaAppbmRleCAwYTU1MDk5YmI3MzQuLmU4NzRmZDk1MjI4NiAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9maXhtYXAuaAorKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2ZpeG1hcC5oCkBAIC0zOCw2ICszOCwxNCBAQCBlbnVtIGZpeGVkX2FkZHJl
c3NlcyB7CiAJRklYX1RFWFRfUE9LRTAsCiAJRklYX0VBUkxZQ09OX01FTV9CQVNFLAogCisjaWZk
ZWYgQ09ORklHX0FDUElfQVBFSV9HSEVTCisJLyogVXNlZCBmb3IgR0hFUyBtYXBwaW5nIGZyb20g
YXNzb3J0ZWQgY29udGV4dHMgKi8KKwlGSVhfQVBFSV9HSEVTX0lSUSwKKyNpZmRlZiBDT05GSUdf
UklTQ1ZfU0JJX1NTRQorCUZJWF9BUEVJX0dIRVNfU1NFX0xPV19QUklPUklUWSwKKwlGSVhfQVBF
SV9HSEVTX1NTRV9ISUdIX1BSSU9SSVRZLAorI2VuZGlmIC8qIENPTkZJR19SSVNDVl9TQklfU1NF
ICovCisjZW5kaWYgLyogQ09ORklHX0FDUElfQVBFSV9HSEVTICovCiAJX19lbmRfb2ZfcGVybWFu
ZW50X2ZpeGVkX2FkZHJlc3NlcywKIAkvKgogCSAqIFRlbXBvcmFyeSBib290LXRpbWUgbWFwcGlu
Z3MsIHVzZWQgYnkgZWFybHlfaW9yZW1hcCgpLAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
