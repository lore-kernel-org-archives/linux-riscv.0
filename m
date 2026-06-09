Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23ECCD8CAA
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkQ9O37UsN07QvL9UNzMhRH5DqdRFOxsYgWluicx8Ho=; b=AlatYPbm55IF+S
	nsw5Gfz8rAKejN/6DwCYca8NiVqNW2jhBXGVMHnbGhVbp8rVqm5+xuQUuuIt02y6K88/NGdpwl4vH
	kFdKDge2yN05CocDlwboHBsx9lrmB3OB6TTad5m0urqq5Q1jcV8YJuiYWyAU1lVKqydvFXqYBMVCu
	S8fbJEg5pdFGe1lzWWRgXw6/ZwsFXvLSqvQu9l6LsSISS1Bq14zIcOHV1AS4jWFvOX7HFIBUVewY/
	2laGx2PGCWO9KJn8sKg/vuA6p9UR5mKqjTm5RZsh0KwWnCGriZMkp37gIoJjzBJkpR7jyGytvbnKt
	T/2AbTs+uF4cv6hpu9uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxTf-00000005mPu-2eFu;
	Tue, 09 Jun 2026 14:30:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxTc-00000005mNN-16vY
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 14:30:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClG8o2251529
	for <linux-riscv@lists.infradead.org>; Tue, 9 Jun 2026 14:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=n2ZoTe9MZ9DLe7zQEw5ul/Iirw7q5Hetu2UB3w96zKw=; b=ft
	hfLPGWXHW1tH05MGW+QkewmxBy1Qv1V5JZ1bg1jJl3Rmo0OZAHZS1Ti6DGfbnuQq
	Wke6OSRaNbWX2DrJrThCm5nZmCBPypmaW6HFWWeYTaWJtSQ32r8hjLGBM0e4Ma74
	XvLousMzr7VkLfoUz15z1bjMeTNOieUtev0MsrKZ0qfswdGbnYV05JCa6Bym7IHa
	NF/S3WZR1NMkA64Kf/r172K7fuWMmaqpR4zdP3ZC77W6P1TBhLRm/HqFVa9kQFvl
	s+yrnow19Pd/K8omAHQN+8c/cbkR+0Ry6G2B8Ju1rWrJLqtcJTNXXLykt53TNjjM
	gpPW1Xu7r7+I4xexTORw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqght8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 14:30:47 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-660d7f1d143so4184125d50.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 07:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781015447; cv=none;
        d=google.com; s=arc-20240605;
        b=JMhwxlmU4Uo8i0k48z1eLKmtjafWtYvWcnEIBFsVl/1nBDdQ6jO06zMFpqjS8MnkWa
         tnid8HMqTuIBNjGzPg6IIUSvNLkjw9Fzmb3MLRAZnH5pUMFFGe1J2zmck8kem4VCZoj5
         GvElfPW3lu6/aTlsZ0OvISNJwlDmLvUzKFXmMvj5fQCGCkR68JRoCaTLRz2E18A604Wt
         QLx3cyeRWFcRxJKTsRLl42B2wgxqCHExLCBpMYsMAnrKPa8aWohk8Fm7/DxaC8dBpz0j
         VXLsVm7edTjptO98ol3YNR72cXYoYWUC8ATrtzMzgR49h5Y2UHoajSXeMzrYt7aNBP+Y
         UPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=n2ZoTe9MZ9DLe7zQEw5ul/Iirw7q5Hetu2UB3w96zKw=;
        fh=JPBs0T0mqs7AduWVQZ+nKlQm2WT+U42QM4etRF6cFkc=;
        b=DQe7eyIi3uouzYzBsueEJUQ8JMu16CPAj9A8vNN90Xo9sgdAzMCBqT+32f/Iw7Y4GL
         WuB/Bcj8fZB0SMNbIh7yfPtk56SpUUpmGTbcSCQM6cLTxQ5yMy47VxMCO7Ndoih+ptAW
         1j6DKKVaeBuypZNkqz3/+WEV91gyIOtDo1KF66vB7XosNSMh1mTL9wy2xdmtUzz0kTNN
         6KBa4V/KVzuvNhDq1jawMpPOIE0TYSvHRmIZmn0sGR9DdHbxCWkTddj1+l1cauNr81XV
         lq1nzPGTCHzRlM1Th81jmFdw1gqSop9W5mzGpZfyPoyNxXcGpu+XwyEF03yvXpkwuK8c
         UpCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781015447; x=1781620247; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n2ZoTe9MZ9DLe7zQEw5ul/Iirw7q5Hetu2UB3w96zKw=;
        b=A+QiZVg+da/1BFxaxuh0JMFAhRYA+/9X5Y+KxUkyJktTMRGki0FXG+HpgjApLA/oo5
         gxy7Sr4VtWntoXh2LXl+YrhgubcLzdx52Hh8a8HbMQ0nhtjmkbrlapOYetnAU2YWI++1
         e128VD1po8l7ghSUbbuWD/cSFO9nyjShKGc8oRI4YJY7uN3RJAU2UY5IgmZBhPZ2W0Ut
         1v9IJaUWjYBorO/+mxp3f9H47ViNMkxPEv62bqLX0TgojbrG0Ro3J4OOp8A9fLRzDcuV
         +IXRfGLLV2/8jjkFRRCO1BEZ7us+SCG8P8kcoOtbrgAwWB2m29YnozDn5jOi94UAdXw9
         TCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015447; x=1781620247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2ZoTe9MZ9DLe7zQEw5ul/Iirw7q5Hetu2UB3w96zKw=;
        b=nOlk+onU2wQnkcQm6HI1VeHbyHOwbtV08gRCg7wPFvWW/FvMR3hd39EjOw/27Ivd59
         I48XVLkz3JtV6lLXwDiuambryjO3bb9/vBfiCSHREYz88QyDgl6yAjGh6Uc2leFz5yDG
         cy+CqBKjEyFKXkiZJSiLB2snHoUAj4NDJz7Hl3kfasxKrrCRcHm1aChPd2UKxR8YqKYA
         I/TW2uHyLt+bMy52Ad9H1SUfTFn8ngNQswNBuXb0jFXJPTBLGxpTgUL37jdTsUI8+xsL
         DMhD8wWOdLPbfvTOKjJNcu+oCp2+2fZOBh0GLJBWn+K3HlEw7fNK+vSGI+1LTGVD4BFN
         8TLw==
X-Gm-Message-State: AOJu0Yxhbs0CJAi1HGiY2G+fNXqdp/rGVhhItaXcm+36eNN+NVvYyevO
	yoGfZ99RddwmIrFDev53x/1JsT6YtRSUG4VnyaofPtsNfd92V2DuHVo097NH0OpKWExfd6MPxS2
	cqJMUv67pkAFHBXzMoTL9Xfwe+LQgFpbghpy7ErXIevcdg76dYYzq2Q+xRbiV0iYBzs3mXWJ1ut
	QoGLAhJl0H1YxkrYiP280J2rWku626vMS8pB0NVnZjE7TlQQ==
X-Gm-Gg: Acq92OGDr3DbpEBsvC/MYyieC6u9QcnCNxHIzo+de2QE1J+nL3yS5RTN4bURHm4TXsB
	FUhCepn8j39ZbMgaYuR46j5fTH72eXVfC+CYbqfCp86X9lQZcs1blENgcGrctEFAwYz/b/svch5
	idJNjVEdxT8A9nBvnI9txRL4/m0j+6kCtfP0WmbLiFUMBf2Vee9lHCv2O4SuPKG1Yoa8HJ4MksT
	BCj8Ng9umGIzh6bZg==
X-Received: by 2002:a05:690e:5cd:b0:657:e42c:ef3f with SMTP id 956f58d0204a3-6610707c453mr14362588d50.47.1781015446791;
        Tue, 09 Jun 2026 07:30:46 -0700 (PDT)
X-Received: by 2002:a05:690e:5cd:b0:657:e42c:ef3f with SMTP id
 956f58d0204a3-6610707c453mr14362545d50.47.1781015446306; Tue, 09 Jun 2026
 07:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com> <20260513084325.2176952-10-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260513084325.2176952-10-himanshu.chauhan@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 20:00:34 +0530
X-Gm-Features: AVVi8CeCCuwpN-K9EkxyrVCpMYmKH1wrm2WzWm0aWwYK4PiS3mEB9S1-HswUmmQ
Message-ID: <CAB19ukGeM=v=G10r_tX2SC603Tej5Q6nFOCddcPF8BaKwxFxrg@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] riscv: Select HAVE_ACPI_APEI required for RAS
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com,
        anup.patel@oss.qualcomm.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzOCBTYWx0ZWRfX3cDq3V7E3FFu
 KipMWrRxMgcevKJXoMSvmJFBtS53ZqZtMdbeTqZWRHyyXRX7zsZSP2bPKWENHSieUvp4U6FbzPP
 9/hhgabmbEF4ryM3NVtGPCcBO5rm8WITourIZNZlTGVUtBbPVQmN1vcIE8irvUyNbvK0OuXe0Xr
 JK1Ppn9B1VETOXYbha2rN+7MKGwWOBwWiBpnKkk8DHTTaas/IiMfCePvo7kpoX2KaY/lb5n2sPy
 CJcEdzmLcaPGImnmxNEGmxStO7fvINFBHOPZ9qUIc8zNOrPZ9r6AmWdYyT3a4mrOP2/S/nnRmvV
 WDCNs3meo0Eha/b0wGSBE1RGzUq8AvKPnon3sKGZZ2IuC165EAM18pfQDnuswf6pCMnxV4g/pyD
 Hr8Uz1LOnZw+5UTp3F8XphM3lUC8pgmCWcHB/VJO+IreFoFE3Iq48qpDwIkqJZ0o12+JaeFptu+
 1pq6UBoOjMQGL4e9j5g==
X-Proofpoint-ORIG-GUID: _dL0UiW6Wi2INdWs1BF5myu6RODSZrge
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a282397 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=GsIs01FLSDa8B7WPS-oA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: _dL0UiW6Wi2INdWs1BF5myu6RODSZrge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073048_328791_B3428908 
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
Reply-To: sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMjoxNOKAr1BNIEhpbWFuc2h1IENoYXVoYW4KPGhpbWFu
c2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBTZWxlY3QgdGhlIEhBVkVf
QUNQSV9BUEVJIG9wdGlvbiBzbyB0aGF0IEFQRUkgR0hFUyBjb25maWcgb3B0aW9ucwo+IGFyZSB2
aXNpYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUgQ2hhdWhhbiA8aGltYW5zaHUuY2hh
dWhhbkBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggZDIzNTM5NmM0NTE0Li5i
OTRiMTlmYjQyNDkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJj
aC9yaXNjdi9LY29uZmlnCj4gQEAgLTE4Nyw2ICsxODcsNyBAQCBjb25maWcgUklTQ1YKPiAgICAg
ICAgIHNlbGVjdCBIQVZFX01PVkVfUFVECj4gICAgICAgICBzZWxlY3QgSEFWRV9QQUdFX1NJWkVf
NEtCCj4gICAgICAgICBzZWxlY3QgSEFWRV9QQ0kKPiArICAgICAgIHNlbGVjdCBIQVZFX0FDUElf
QVBFSSBpZiBBQ1BJCj4gICAgICAgICBzZWxlY3QgSEFWRV9QRVJGX0VWRU5UUwo+ICAgICAgICAg
c2VsZWN0IEhBVkVfUEVSRl9SRUdTCj4gICAgICAgICBzZWxlY3QgSEFWRV9QRVJGX1VTRVJfU1RB
Q0tfRFVNUAo+ClJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAb3NzLnF1YWxjb21tLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
