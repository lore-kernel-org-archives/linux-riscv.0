Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB05D1A63C
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J40qZvVKgyJvkpZ42QfxQp9FpISJxh1gkhnqI3jbfd8=; b=w9DiC58+WQSBsD
	Hcd26niWdJgkfz2DRJKW9MH/CdJIkuqGR+PvLPCKTAANvNhLNhnfKGcc8rw+0o+WwOmtX3CxFnCmo
	vGfyK4WMXBR6K1ZvyReoUvrBp6V0uyc8gYPX3ZlsuC+VYIOK4AgLwEb9kFX0xpta9y04CmJ/Yr8a6
	LdvMTAaIylL6CWHJWVDPAJzkgdy0fziysZXxEPoL43lIkJ2HnmqEkD/w2g+3LqoS1kqjsEkoyFwR9
	zggY5xdEPR3pjqRD5E/zHAGqbMy2bj99OmrNFg+D46NBpXUNoP83upQlshcCM6So1QcCf1Qi3AvfE
	kyBcejKPe8DlQZIPaLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDcI-00000002Q2A-2mKT;
	Fri, 09 Jan 2026 14:37:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDcF-00000002Q1n-3JWw
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 14:37:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609DPJgJ1701969
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 14:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+ysgsKTq/m9T0qhX5590PZF3RQ4Mh0B8PnSQRpVzqAQ=; b=mT
	GzVf2nDhMw4o6/3HLd/DbZ7cczaTSnz2ZaiG/2pJV6UDzpW3OqY1qBbje3xrOi8R
	8ByOpa44LCArRRWtS1jP3uWpgU9alL3VBNqfyRH5N9YdeYovPczZpjSAsH1PvITI
	MA1mzUkPdDqNiwMaL6upiKH3H8/LsqiJERwe2xVyKracA7mMoZQMknrCqXRc2Crb
	/Lr/SMIWfcRgD8XUz7emNhMQ4wyopgqnF0z2Ynk6zeXhzz8iFZr+M+Ydn7Z6EIN5
	aTDv3ERyfgeBQn7tRQ+AEwJWL3opQf8xboU9aNpHtgBI2uUSb+4TDEeD5iuPWNrh
	QOnnVaxSk40hAztYMxGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdabkxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 14:37:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b19a112b75so1031953685a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 06:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767969446; x=1768574246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+ysgsKTq/m9T0qhX5590PZF3RQ4Mh0B8PnSQRpVzqAQ=;
        b=EOUygzUKD58WRXhwv8gUf4qpz+po7C39/041LulIK/hs/RSKOdgLKgbTAeWYdVvU0z
         zUz6QinPrz/T0TGmkEZprSln1xlbiEgAWiG1I4f2TZBkhu4N+DqeXxen1xc3AOoeVcvz
         B9cEbBxX6Y4DyslCdGhmPYn1pUyUk3lcq8oAOFVsH5g94nSC6FOTsBe79C8R5TWafYiq
         jDB7ETLrMhaX1vYvJAuvZhzWVF01Zc5SfbG16nHk1oMeePYHzg6COCarHRnCXQuJiDej
         r4HCSJ0wH4p/I+T1kjygpLrxPQZOHJwD6xuK9nJzGTmQVE2jLL3ubkXbXbLLnmQ6l24+
         wGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767969446; x=1768574246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ysgsKTq/m9T0qhX5590PZF3RQ4Mh0B8PnSQRpVzqAQ=;
        b=hQpUvyXx+iFZ3/MoQhUtlhYxS4kV/hv31GszpxBxMBzndVoz5net7ddkN9FDet58Q5
         IbgICC3YqYVXFQI3OmHYn7qsgSlAAnBREppC2nGfUowU/2cunxCLapvs6vY2vprICRRH
         1LYsi/uXMB1XLwZtuRwxLPHzTL6HC643r91i4oN9xLcC0Zfb9MJn1Ys3IeT+dBJpxi/s
         bSubQSrB7UTZy4Esq+KkfFpExi3KurZzovu+7iqisjVyEWWUD2eKMIaflFdbukE9ccyM
         pjZ4UdVUa2Mz1mNdu4NXzIyX1VoSSdXR0xj42w0Hc0vyJkPtut45Gu6ecabTiJ60uXqG
         R6aw==
X-Gm-Message-State: AOJu0YybUiTxZwjymIwTwt9ZR7FZaB6A9gFr+RPaXBGYRtWrUgn+4N2r
	CQYM2LxL68bFeNTl9QA3g2p5wTc4X0CMIIZcigcei89qs36DpijGB/7CkjQkwe+ZYnj6z1wZXFk
	pvdwuWwLTq3Py+DnNdrtcZX6evGf2SKAVZ//OAV16KmsMCABAjSHA7YSSu5ET1DBliMgEeSL37y
	8UixQrU+NhpPut/4cq4h/cyq/Boh5XqyInDUtALhdeKMOucQ==
X-Gm-Gg: AY/fxX71ACxajhI7R9FTzrldHRB2Khl7kSdeuBEYK391NfPR89dDXeg+HwUe7LK2Jsh
	iCzvihisUslX03DD+PrI5MCljMgbJz/AXkwtmwpegIXOBnaODI9NrbZozFe2nxUfDXz42zIR7WN
	2BK3wkVR3gIDv2VOuTJNh9iMyO7hJXjxwb3Lf/fWD+kqy/4tP9cCCC0t8n5F7hhrOdY4s=
X-Received: by 2002:a05:620a:318a:b0:85e:24c3:a612 with SMTP id af79cd13be357-8c3893b2c4emr1367491385a.32.1767969446141;
        Fri, 09 Jan 2026 06:37:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5/7nOlDZo5viCDFcqB59VO553vPiFD2t5yij1MhIo9Az81+Uf2uPVbDkTkMomisRCSbRk6+fPaS1p9QPc/VM=
X-Received: by 2002:a05:620a:318a:b0:85e:24c3:a612 with SMTP id
 af79cd13be357-8c3893b2c4emr1367486685a.32.1767969445611; Fri, 09 Jan 2026
 06:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com> <20260109090224.3105465-3-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260109090224.3105465-3-himanshu.chauhan@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 20:07:14 +0530
X-Gm-Features: AZwV_Qi5BjfSLxD-fWr--rIzTe5eMh_UeAHuI8CxS4Y_6Lnfr3xI3R8vXnjfma0
Message-ID: <CAB19ukHDigCSgubLBxq0Pq6XuOfg3gEM7TWse3sNH4EkqqAcGw@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] riscv: Define arch_apei_get_mem_attribute for RISC-V
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com,
        anup.patel@oss.qualcomm.com
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=696112a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=lVw1crRH7-GITBzhd7oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: c0J1DwoTkx5EXCH-gNSf4EtgYlSTXuAL
X-Proofpoint-GUID: c0J1DwoTkx5EXCH-gNSf4EtgYlSTXuAL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEwOSBTYWx0ZWRfX3KIbo7XPRFwZ
 1u5+znc2XhX2uhBPuYY2KRAFdYU/WGRr28BCiamB4W+iqZM7K0aTet7gR5iQM5irBVFCllkOM9A
 4caj2Uoq2chwWCcHtl8muRcCVBW95f++osODWBc930ztVJ4w6BnkINrjtcZGg1Le3Si1bIcWAtT
 Iekg6VzSe8UDjre9tu00Jqu7T1Z7d+r+ZxS9q1oAKDHDBPMzD8CMM3xfIkDE9qsvuPWr3Vt1E64
 p9/l5V+/Kl1l9J1Bocz8Vulib2NmsqPNd8CFeflphnrY0Laolrdq7q7vIRS7ly0tiErXVMVMcwu
 6b2UVXxwL8OAF0UzNhmqLEf+zOlP9GUiPhIoVU6BAHR3EKWBh1pFvMrhAHRrpuROfI5H/iRQiU0
 er04yPKM71XtwWfa3N9J/dWq80U2nzgr+xZgWWdRLMs+2J7jXSIOdAY41x/z8pIQy+4zJd412wh
 98wwcCi9+o39H39uJ+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_063727_947686_D28FE77F 
X-CRM114-Status: GOOD (  21.38  )
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
aGF1aGFuCjxoaW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gZ2hl
c19tYXAgZnVuY3Rpb24gdXNlcyBhcmNoX2FwZWlfZ2V0X21lbV9hdHRyaWJ1dGUgdG8gZ2V0IHRo
ZQo+IHByb3RlY3Rpb24gYml0cyBmb3IgYSBnaXZlbiBwaHlzaWNhbCBhZGRyZXNzLiBUaGVzZSBw
cm90ZWN0aW9uCj4gYml0cyBhcmUgdGhlbiB1c2VkIHRvIG1hcCB0aGUgcGh5c2ljYWwgYWRkcmVz
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhpbWFuc2h1LmNoYXVoYW5A
b3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmgg
fCAyMCArKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmgKPiBpbmRleCA2ZTEzNjk1MTIwYmMuLjBjNTk5NDUy
ZWY0OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaAo+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oCj4gQEAgLTI3LDYgKzI3LDI2IEBAIGV4dGVy
biBpbnQgYWNwaV9kaXNhYmxlZDsKPiAgZXh0ZXJuIGludCBhY3BpX25vaXJxOwo+ICBleHRlcm4g
aW50IGFjcGlfcGNpX2Rpc2FibGVkOwo+Cj4gKyNpZmRlZiBDT05GSUdfQUNQSV9BUEVJCj4gKy8q
Cj4gKyAqIGFjcGlfZGlzYWJsZV9jbWNmZiBpcyB1c2VkIGluIGRyaXZlcnMvYWNwaS9hcGVpL2hl
c3QuYyBmb3IgZGlzYWJsaW5nCj4gKyAqIElBLTMyIEFyY2hpdGVjdHVyZSBDb3JyZWN0ZWQgTWFj
aGluZSBDaGVjayAoQ01DKSBGaXJtd2FyZS1GaXJzdCBtb2RlCj4gKyAqIHdpdGggYSBrZXJuZWwg
Y29tbWFuZCBsaW5lIHBhcmFtZXRlciAiYWNwaT1ub2NtY29mZiIuIEJ1dCB3ZSBkb24ndAo+ICsg
KiBoYXZlIHRoaXMgSUEtMzIgc3BlY2lmaWMgZmVhdHVyZSBvbiBBUk02NCwgdGhpcyBkZWZpbml0
aW9uIGlzIG9ubHkKPiArICogZm9yIGNvbXBhdGliaWxpdHkuCj4gKyAqLwpUaGlzIGNvbW1lbnQg
bmVlZHMgdG8gYmUgdXBkYXRlZC4KCj4gKyNkZWZpbmUgYWNwaV9kaXNhYmxlX2NtY2ZmIDEKPiAr
c3RhdGljIGlubGluZSBwZ3Byb3RfdCBhcmNoX2FwZWlfZ2V0X21lbV9hdHRyaWJ1dGUocGh5c19h
ZGRyX3QgYWRkcikKPiArewo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFVudGlsIHdlIGhhdmUg
YSB3YXkgdG8gbG9vayBmb3IgRUZJIG1lbW9yeSBhdHRyaWJ1dGVzLgo+ICsgICAgICAgICovCkkg
YW0gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoaXMgY29tbWVudC4gV2Ugc2hvdWxkIGJlIGFibGUg
dG8gZ2V0IHRoZQphdHRyaWJ1dGVzIG9mIHRoZSBFRkkgbWVtb3J5IHJlZ2lvbnMuIERvIHlvdSBt
ZWFuIHRoZSBtZW1vcnkgcmVnaW9uCmF0dHJpYnV0ZSB3aWxsIGJlIHRoZSBzYW1lIGFuZCBjdXJy
ZW50bHkgZG9uJ3Qgc3VwcG9ydCBub24tY2FjaGVhYmxlPwoKPiArICAgICAgIHJldHVybiBQQUdF
X0tFUk5FTDsKPiArfQo+ICsjZWxzZSAvKiBDT05GSUdfQUNQSV9BUEVJICovCj4gKyNkZWZpbmUg
YWNwaV9kaXNhYmxlX2NtY2ZmIDAKV2h5IGlzIHRoaXMgY2hhbmdlIHJlcXVpcmVkPwoKUmVnYXJk
cywKU3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
