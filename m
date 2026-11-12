Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAB5606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=My87cXn/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nj4sXmSj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAmbQ6eU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MsjG16X5sR56aBhOwj2crxaP8pu8F8FLUN4AJ6PpfkY=; b=My87cXn/xmMjBEBn7n9gkJrDiP
	aNtFwcUPpQOZCseIrLAbrfmuqbiEkJPDWzS/9nEb7khNZOdoB1RNik6ud8kRVjBAICNM52zttN2AF
	WYkWiEu9mRTRyEoBzF4kU3ej8kCCafqclsFRVWOspaeiXHNc+HcrzNJ8i6PSo57a4SRbRfmt1aFoJ
	Wl6ZJE+xNMAgh/zpJJ6rXdqDl6Hpc+w/OOY7G557c9j6H2cEfGlkHD9YjNeT+v4TVC/Eyp0E7rHF1
	Z4fDa9N5rkrbSSwn2TijodF71wuwzgcw7w0fgc73CT/hRwF+QBFz3ddeTupUvX3j+e11tiHEIuDFq
	uXohF12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV7U-0000000A8HM-2FDS;
	Thu, 12 Nov 2026 13:45:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV7Q-0000000A8GM-29Hj
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 13:45:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9AKuv4092474
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 13:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSHTQa6HyakUeWII5QwTPdRVYIzIGg3+WldbvYwS3KY=; b=nj4sXmSjUAISGVD3
	5Nk0C06mgyyX4VE8uX40/BJCKpM4N16OAs60W/ZAciCWNlW8cAl1QpqJku3wdRCV
	jaNVGAOdjUUuQpR10aejveIzpUJQT8PBymo85eWtuqEUSeglS/Ms/z0SMigMOvNl
	vybNoXozdjlLrX10l5rJnPCv5vJks/LYxee96DMVmZnfQahU52gzDBLnbQdDl0Bu
	EnJ6pL/itJt4UalizLpynU+e8qTybWcuImpuOSrEEm+m32VNnSvU1VLNYmP1O1R5
	Ryz9lNmA71g14b97fB5GrZ+mqqmtJzyhxWcN9WYaHvzmRgvHD5GnqCGPb9U9rb6w
	tUNblQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8k2e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 13:45:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so512545685a.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491133; x=1795095933; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSHTQa6HyakUeWII5QwTPdRVYIzIGg3+WldbvYwS3KY=;
        b=gAmbQ6eU+StZzSG/8j7S+azlwlMNKCAmeBM8GWzYmrhmOsByv7c3SEQYkYfkFpg3sh
         cR4Aa1+Iz9eWJxGPMWnfMbGruqAgsR+rtXcWB+CDsu/5A9LtDZ3OEyUfzOSpmFpRCDGw
         eJZJK7JZ3JnjF+HMUFTWzkhC6Tcztofx0ehs29yiIv4sgjasSWfjQ6gdiUBKqdF8C5A1
         buQikUrZjppTVuI1r/I7y5BQk79JATp/iMapoIbxIIbEfucVKt0MITI1sbPU+ai0F1+s
         4IC1o29auInjS+p0RGsZeXPLc4LQPG3j8CHkMsfcqRDjl0DJ6I4w+RZg9AmT5VmorTII
         aTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491133; x=1795095933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSHTQa6HyakUeWII5QwTPdRVYIzIGg3+WldbvYwS3KY=;
        b=FuxNjbhkXYId8cSnG//xQpncKN5JVeBeDTaKmuJT2ecvP4/TitEiH+u0qQHbvVVr7V
         7fzPxE8b4KCO6sn8wbT4AsTxSXJSEXJA9+ohOffQVU75cbDxBKx1gzWWFkfv/EfDMnY8
         oRyIKcq9h8LwkuhAjh+tLzcWtHOVPYbJT78/ejmTQ57h+5HG5b3xSACzleSzl2MxR7KR
         /7Iw3TMJOQ/eiEauZiQnhct4Qi+4E0jH5JI/ReOyTP6rGreZXBVpdMsHssXEpy1JjvJF
         QGcStA5Ifu/uVDlBZxiIwjjf/wtTh1J0Ps9pxM7ho+jKlgr/i500gU0QCDAxXP4jf7kb
         ae6Q==
X-Forwarded-Encrypted: i=1; AL+hErGHdxt5CTjgiZ5XA9Mi9q3GZ69j/OcTqD/QHTzjQo+4xGS+l00M7EtbthKn/wcAJeAeZoxHgsU9XRxgQg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8CwmJ9sQ+6yjNR8B5zZ/DuvWfCfRi4sV8Icvhf3LEpxt3e6hEQ
	SYbrVVTKtCCoWcsjcMSsRuN5uF+PpANs9cKF/wF6hI8PUcN0GN261KQtfYEHVo6e4NBBWlS3A1/
	ge7iP0GU5Bzv46cHuxenZdU5bGMfrpdyBx2RMynr1pC1czjjrlSfYJLHH+P7OVHsltZHE/xM=
X-Gm-Gg: AYBFou238I6bwHiev51yK74pIviCtNfLVu7JDXacgo7C9v8G1w4XD6xcjIfl739cv24
	zKVgsYfbfAGWYClgpF4IFCU4CZmaIdxw9rN5rSzZvnS2lomTF1mH+tFgaMQKsMrmoH69JC7Pblp
	v5pHfQUr4cUX920o4NxXvj6UPsNRwKWRNKV0SrN7aPfv/SrCphi73V+kOYytBvk0c3M8FMc3Sxm
	BNcC/kjZuWSi42pI+MnnJyA+kViEcw1hdAm1qtRvKK+LpL8pPzqAwzXm3J9xu370YnuUNYIcCu5
	Jqwa5Wayi1KFwQqMHlOhERYdDkEvBvPX2fk/TpWbBR6tmMWx3Kozp1e1yEW0UhNk2ji7cN2plDv
	6z87gcz6kdiyXD20AHzCAfvn+Rj2wzLXy4eBnR7LgeXgZTT5Xq46YmvWZQc7qaIVcC/q8Vw4GPJ
	sazWVxsS2zpVOLZovT9Ac3+5NtR/URst+92KlOWG//BfQozSd/goEE1zG9JzwRJLCN6oO6Ax2FE
	ZhbQFUui41vUPwQx+inH8ql9Zyoft10EU1qhsV0oFs=
X-Received: by 2002:a05:620a:2b46:b0:93a:2611:270f with SMTP id af79cd13be357-947aff88b4bmr1027605585a.13.1794491132566;
        Thu, 12 Nov 2026 05:45:32 -0800 (PST)
X-Received: by 2002:a05:620a:2b46:b0:93a:2611:270f with SMTP id af79cd13be357-947aff88b4bmr1027599685a.13.1794491132056;
        Thu, 12 Nov 2026 05:45:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a62b303sm342113466b.58.2026.11.12.05.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:45:30 -0800 (PST)
Message-ID: <993586ff-a618-4a92-b95a-552e2ba268f4@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:45:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] platform/wmi: Allow wmi module to load when acpi_disabled
 is set
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Han Gao
 <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
 <8382881b-f2d4-7909-d7d1-3a2c74f3b123@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <8382881b-f2d4-7909-d7d1-3a2c74f3b123@linux.intel.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXy9BJjrnNU54W
 OAIyR4Y7xxJGLvQvKYmq71e2rmcXAmAXZXTKLdinPFAdcdixyxcye63zLVPbJplKyKjdQVKNR/J
 LxmPt8/2+ls5SLo0uhCQmxYnoZ28Kac=
X-Proofpoint-GUID: GZjQm8JbWizue7wDOcFeNlON2A-xieXY
X-Proofpoint-ORIG-GUID: GZjQm8JbWizue7wDOcFeNlON2A-xieXY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX3DCnDDZFeRd+
 /f+Gq11J0MBocpOIfa1XKTLXRZNii/fNviwdeP2hOS+VQMgDRcaCpuZ+O+mZD3k5BtFU6UdF/Yj
 IWssPtIlkccmbBj+ejJlZNrq8zl4+G5tnTXpxAQcDLoqHOTY3qdim2V1ErxRGzC9p8gaFZeMC/N
 SjMCUT+oaC2wJ5tJh0GJcZMraSqGlhkEEcDjrgO7+zNxJYLieGgp5AxFONCF8/TftvRimABuSJ6
 rJd2FOZkpmabZoqLAUkyItef5IDKTn1rbSZ5+sUjQtb0o13uN88XV5J7sWRJ69N8gBmhfNnxmfH
 pbNzo2YkXfsvyfK3P22QvnJJAjMLRz+eZCskV1eInnC+nD5LkoW0LgVeax5LNEBCINqHPfTvMcp
 hS9irNjBGMigU1JQTLIga47edSngKndT0vqvWrUSiLopv1OuLG4o/4eBs/n1harmnbcOaacGCVg
 Q7raTZ5xk9cJ5ZlXkrg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5c2fd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=j-yhcRukXSKXep7fvDIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_054536_557813_11CEFEC3 
X-CRM114-Status: GOOD (  16.28  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpPbiAxMi1Ob3YtMjYgMTE6MjEsIElscG8gSsOkcnZpbmVuIHdyb3RlOgo+IE9uIFdlZCwg
MTEgTm92IDIwMjYsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gCj4+IFRoZSBjb3JlIHdtaSBtb2R1
bGUgcHJvdmlkZXMgc3ltYm9scyB3aGljaCBtYXkgYmUgdXNlZCBieSBvdGhlciBtb2R1bGVzLgo+
PiBUaGVzZSBvdGhlciBtb2R1bGVzIG1heSBzdGlsbCBmdW5jdGlvbiB3aGVuIGFjcGlfZGlzYWJs
ZWQgaXMgc2V0LCBidXQKPj4gdGhlIGN1cnJlbnQgYmVoYXZpb3Igb2YgYWNwaV93bWlfaW5pdCgp
IHJldHVybmluZyAtRU5PREVWIHdoZW4gaXQgaXMgc2V0Cj4+IGNhdXNlcyBsb2FkaW5nIHRoZXNl
IG1vZHVsZXMgdG8gZmFpbCBiZWNhdXNlIHRoZSB3bWkgbW9kdWxlIHRoZXNlIGRlcGVuZAo+PiBv
biBmYWlscyB0byBsb2FkIHdpdGggLUVOT0RFVi4KPj4KPj4gT25lIGV4YW1wbGUgb2YgdGhpcyBp
cyBib290aW5nIGEga2VybmVsIHdpdGggYm90aCBEVCBhbmQgQUNQSS9XTUkgc3VwcG9ydAo+PiBv
biBhbiBhcm02NCBzeXN0ZW1zIHdpdGggZGV2aWNldHJlZSB3aGljaCB3aWxsIGxlYWQgdG8gYWNw
aV9kaXNhYmxlZCBiZWluZwo+PiBzZXQuIFRyeWluZyB0byBsb2FkIHRoZSBhbWRncHUgbW9kdWxl
IHdpbGwgZmFpbCBpbiB0aGlzIGNhc2UgYmVjYXVzZSBpdAo+PiB1c2VzIHN5bWJvbHMgZnJvbSB0
aGUgZHJpdmVycy9hY3BpL3ZpZGVvIG1vZHVsZSB3aGljaCBpbiB0dXJuIHVzZXMgc3ltYm9scwo+
PiBmcm9tIHRoZSB3bWkgbW9kdWxlLiBOb3RlIHRoZSB2aWRlbyBtb2R1bGUgaXRzZWxmIGFscmVh
ZHkgY29udGFpbnMgaGFuZGxpbmcKPj4gdG8gc3RpbGwgbG9hZCB3aGVuIGFjcGlfZGlzYWJsZXMg
aXMgc2V0IGZvciBzaW1pbGFyIHJlYXNvbnMuCj4+Cj4+IEZpeCB0aGlzIGJ5IGFsbG93aW5nIHRo
ZSB3bWkgbW9kdWxlIHRvIHN0aWxsIGxvYWQgYW5kIGFsc28gcmVnaXN0ZXIKPj4gdGhlIGNsYXNz
IGFuZCBidXMgaW5zdGFuY2VzIHNpbmNlIHNvbWUgZXhwb3J0ZWQgZnVuY3Rpb25zIGxpa2UKPj4g
d21pX2RyaXZlcl9yZWdpc3RlcigpIHJlbHkgb24gdGhlc2UgYmVpbmcgdmFsaWQuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGpvaGFubmVzLmdvZWRlQG9zcy5xdWFsY29tbS5j
b20+Cj4gCj4gTm8gRml4ZXMgdGFnPwo+IAo+IERvZXNuJ3QgdGhpcyBmaXggYSByZWFsIGlzc3Vl
IGFuZCB3ZSB3YW50IHRoaXMgZ28gdGhyb3VnaCB0aGUgZml4ZXMgCj4gYnJhbmNoPwoKVGhpcyBw
cm9ibGVtIG9mIHRoZSBHUFUtZHJpdmVyIC0+IGRyaXZlcnMvYWNwaS92aWRlby5rbyAtPiB3bWku
a28KZGVwLWNoYWluIGJyZWFraW5nIGxvYWRpbmcgR1BVIGRyaXZlcnMgd2hlbiBhY3BpX2Rpc2Fi
bGVkIGlzIHNldApzdGVtcyBpbiBlc3NlbmNlIGZyb206CgpmZTdhZWJiNDBkNDIgKCJBQ1BJOiB2
aWRlbzogQWRkIE52aWRpYSBXTUkgRUMgYnJpZ2h0bmVzcyBjb250cm9sIGRldGVjdGlvbiAodjMp
IikKCndoaWNoIGludHJvZHVjZXMgdGhlIGRyaXZlcnMvYWNwaS92aWRlby5rbyAtPiB3bWkua28g
ZGVwZW5kZW5jeS4KCkJ1dCB0aGF0IGlzIGZyb20gMjAyMiBhbmQgd2FzIG5ldmVyIGEgcHJvYmxl
bSBiZWZvcmUsIHNpbmNlIGJvb3RpbmcKYW55IG1vZGVybiB4ODYgaHcgd2l0aCBhY3BpX2Rpc2Fi
bGVkIGlzIG5vdCByZWFsbHkgcmVhbGlzdGljLgoKYWNwaV9kaXNhYmxlZCBob3dldmVyIGRvZXMg
Z2V0IHNldCBvbiBhcm02NCBodyB3aGVuIGJvb3RpbmcKYSBtYWNoaW5lIHdpdGggZGV2aWNldHJl
ZSBvbiBhIGtlcm5lbCB3aGljaCBjYW4gaGFuZGxlIGJvdGgKZGV2aWNldHJlZSBhcyB3ZWxsIGFz
IEFDUEkuIFNvIHRoZSByZWFsIHRyaWdnZXIgZm9yIHRoaXMgYmVpbmcKYSBwcm9ibGVtIG5vdyBp
czoKCmUyYzFiNTZmM2RmYSAoInBsYXRmb3JtL3g4Njogd21pOiBNb3ZlIFdNSSBjb3JlIGNvZGUg
aW50byBhIHNlcGFyYXRlIGRpcmVjdG9yeSIpCgp3aGljaCBhbGxvd3MgdGhpcyBkZXAgY2hhaW4g
dG8gbm93IGFsc28gaGFwcGVuIG9uIGFybTY0LgoKSSdsbCBzZW5kIGEgdjIgd2l0aCBBcm1pbidz
IFJldmlld2VkLWJ5IGFuZCB0aGlzIGFzIGZpeGVzIHRhZy4KClJlZ2FyZHMsCgpIYW5zCgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
