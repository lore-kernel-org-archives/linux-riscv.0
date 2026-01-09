Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A14FD232FE
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bptf6ajhQV/z+HoRBsHKmbUxV2ullcMmBjeGfMGkMtk=; b=tqUuY/lu6VnjAO
	lhFYNUgsoE6D4pepPGKlNu6Zx3Bj6VOh/W5mriY94UQ9EGsyZuqPjPiJ/Ins9/rwY20jOxeAXxgT1
	GRemLWxFW4Y+orNMFDVMlkfCPwevntse/c5D4a3hQd9xPVX0gzT4ed8FfSsF+DrwKj13o3AAzUOZE
	CRmO0393Nd0Imxz9okruVN7UcbWqasaoaYGipT84shmQVYF9t1o0gkTpgxgim2lcWmaihMCaueTy2
	7ndu80pgfkXT2ZBvm43Xa08T3dejDAI7uLxhcjPrPV+YDh7dwhb/KynyHsDNDfHdclJuYFjjul+gQ
	AsbJhkUDv36Yj23U4Dgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OU-00000001xFA-2wAP;
	Fri, 09 Jan 2026 09:02:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OS-00000001xDz-1RDE
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:02:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6091qSck3324822
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQxw9pRj4KjsMr71sZ2t5x+9tK+jz2fwPiFRsDjX/i0=; b=oXL+N6Dr7UqfcymO
	YOAN4imTr5a2HEp9O15FtDGt3bopjHJxqZLVAMt+55EhAz9PZPqW7E++GKXgoUDq
	znXArl/vK2K0oU/X3IuUN/mOzE3n+vnKN6Pv+cRlZAU+ukslMdTx8WYjajdG+mi8
	BQKCTU3v9ft++o8G53U6ip5sOCJMUK0BnnoXlo4MV3dRniiX9wF0zny1lxUm54tI
	ikqHC4xGhmhGskTyAaBT9pKIfZnLplawfcuFj5T5YhlgoA3pUTNnHjZvNB5CSvJw
	Wry3zeANBB2n0MitQB9duLkc6yLIQcWgPUjsFNqEm3GDLmFj4om1ME0K8pKSmtD8
	fny63A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6h4uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:02:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81e7fd70908so599879b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949371; x=1768554171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQxw9pRj4KjsMr71sZ2t5x+9tK+jz2fwPiFRsDjX/i0=;
        b=RRmq3QlJ2LctV3TQOqhw3xNt8blEg9YvPzeC4sqSphqQsB6TZd4CjM0wIPv1rbiXUy
         g/IRfMExHOxYprzCjymXr4HcdAtpY0sxWtq5roUQ8/LecTtqjPmtYg2+UHWTlKauuZEu
         w/TGIQ7g1BWpsoEkfemSVtbYsie1PY2xr5LXTAr4izkNunABR0Z6qnpRONZjBDLe+vgr
         GFxwllJx8xPNmZqI4qecnQZ4LkkkrvQiB49Sy6tGlrMKoAJnQj5dP4pxO6OlVHOu9eRW
         tA7+Sdftw0c5FkrHohv9EG6a+KPnN1kOUh0yZVr/Voaxh2gFp9OG2GOJiXLrPIJgmOBv
         O6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949371; x=1768554171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IQxw9pRj4KjsMr71sZ2t5x+9tK+jz2fwPiFRsDjX/i0=;
        b=CG0eR/AxK2JAonogG7bujeyrCg6N+e3oEBo8nPoG5DslWbvxdS7nYCMjVUxw3j6gVt
         x7rl432R0BUYJoDfSXimBzlHFTjw7VyotcNlbjCtx69WRLO17lUVrNutbca85GfZg8nL
         /Q65k5zOXa5FTk7rPE+UYv6jJRhwegPr2R4SwNVHjD3zAFx9Ben32UG+ql/S5BXCrtfh
         fNhd6tF6h2TW5qssbYkt5RkdBg/AtCR10zCNYmBr1aGy40mVcTg79vVy1UFeyX8hyRsD
         i7D7yPtvfrzL5uCtZpWTxOUZdfkqLu+5bavRhEsSlLLMPD03uwkWuILCuRHQyyKGTXw1
         fDnw==
X-Gm-Message-State: AOJu0YwWoWt5jmnnS1uk002UWH64eaL0qiylhX/2U2+OHs/RNTzXoG94
	fxDprnGbcG5QPZgMuP7d2ZP3f6b2M5Mo/eaittE/e0tIa2nBQowM301lFyoE6ARbhJZ0SogP/dt
	GkoSUmPzb+XL7iX7hL9JJEo7+qv8j1n7tp9ndtgfDI7O83ErsNfpzXVU1B5WnTWXx9uZEPGKpcb
	qepQM=
X-Gm-Gg: AY/fxX7TdlZDdxwrRZqiNNtnUSt4haDxkSAcufWBS1uA67eefXzxQEwBIGO8vABX5Bz
	GOpvVRrfAweSC8nBr99vuNo1tjVDEEiulhbD25SwQDFexf5L5TXRf5xCSuCt8mCUDh8Aawm1nv8
	qoWvjEklBawt9rxAOdo8zCGN/lV7rkD+wuoePHHiqu9y7o4WFzlwKQa0kaqPcp3vwo1JDIJ1YHi
	Czzf90snzwO4t+nNOrqiPI/vA/GeJlak4gWThjNZEIAH9Jjkdg5vWj4181zTZq5rTS40cijxTTg
	74elENLA39omtrq4kDZLhV5CTe4OK3hXn32+jlVRWVLeBo4pnQh8XEbAimJDRxXVOQcy5BVLUMv
	mcycQEdG203r9a+uER1LsD5ioshYirjQwK9L9rRcTqFoG7d4mdji8eqKmNrvsHjpXEVYWLMBriL
	yNDa3wnHlEYZq8fKZPRHTJz6Nw/dlamPdVNw==
X-Received: by 2002:a05:6a00:3019:b0:806:1719:295a with SMTP id d2e1a72fcca58-81b7fdc3515mr7977753b3a.47.1767949371059;
        Fri, 09 Jan 2026 01:02:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtfwiA+2BFdveZ7B0QFne8hWPdA9OtjKKcqFuxwp7fzla1g4pqTzNpr3/SfNjQP+cNiU4jrg==
X-Received: by 2002:a05:6a00:3019:b0:806:1719:295a with SMTP id d2e1a72fcca58-81b7fdc3515mr7977725b3a.47.1767949370599;
        Fri, 09 Jan 2026 01:02:50 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:02:50 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 04/10] riscv: Add fixmap indices for GHES IRQ and SSE contexts
Date: Fri,  9 Jan 2026 14:32:18 +0530
Message-ID: <20260109090224.3105465-5-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX2I1I4kVusGOx
 HHN0W3otwZXK+k91gLPrguq0dgkpwKJIs74XxgB8MdL76V0NNEzTCzFf2ujb60dxrZlh+bdDfWU
 DdKO3At5W0yqf30OTu3mu4vChRYWN9SGcUd2TZnNrZXCxEWSW3ASUGFqNuOIEZ0zdsemHHVm5ax
 o4eDUt4U8nantyVq7u1klBv7heCoeeV78n56oIYOXPpXS7yfzRwcNfK70YBQ81lMYJkqRoUyNGj
 yLtbViVURJCdTz3NcKy9UunvYwGCJHM70oBdk3GQoobJKJih0ROBkcUSdANCf/icPhKDfGLdIUn
 F1B7X2UNbgpkQ/R2kjE4a/RzIwSl5mV+Fy3umR8ma2NuAW38cEeYLBU1OO09XqqCcJFgdztbI25
 ueAqYG4rNxl01R1YjsxR8/vRZcKpg6wM4MrUlw/VWahZEB6jSRwAJg8syGOpPmHqPzBWDtdLA+S
 KYiGWf1ijItL5UPnxgg==
X-Proofpoint-GUID: OFxaYJDu60Zx-tfuj-cBfZzpJYgXFOqJ
X-Proofpoint-ORIG-GUID: OFxaYJDu60Zx-tfuj-cBfZzpJYgXFOqJ
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=6960c43b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h0uksLzaAAAA:8
 a=0wheRbxtA0UXKxI4o1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010252_384273_98DBAC3E 
X-CRM114-Status: GOOD (  11.07  )
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
