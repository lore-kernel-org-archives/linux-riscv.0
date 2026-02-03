Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66E1E8B362
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97b8SWzledfPRhfc9jTVmr0fqzvOuVGyb7G78BRAhwg=; b=G8bj3sLwhEirLP
	I0TawmiqpQqb7SHFE6N4Wgkn8JWBlHG4JZLEy+hzRkEa6kWHUJSGYasPKxwDo/y1tsg9u7vD4BFJD
	UtUHr5oiPWpRgr1uWNp+bvN5cL3bWFZF+jkIE4kAJREV6m8RU9Mvw2OYATwY+vW+N3Pe2CX9VTx75
	5AtXnABiqzd1z4GEbRxmuSxobZkqmkmVQN9nwJxmIbDCr4LazeATKzADi3GO9BwViFN+iVAHzDAE9
	HKqtMk0EmgvFPySE5ABMKhcD+HJM2KKwT46V0MinHzQNrDhBHCfvuweQ82TfBuC5FVlYUCRp9Hgwl
	TCFpDaia2Df6I8G8InVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNvb-00000007NJ0-48b5;
	Tue, 03 Feb 2026 21:27:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNvZ-00000007NHX-0u9N
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 21:27:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImPB83824309
	for <linux-riscv@lists.infradead.org>; Tue, 3 Feb 2026 21:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz1a6xsKW0DDS5mq5QeO0TOyjfRK1srfv9pCRWVxbLE=; b=Kb73YfIXSmTcR7d4
	RlyaDCniI7YeU7LMIO9bX4/1FnCN05gtV+1lh/rWKPjr6c6OUzuI/xzLCVjs0m5k
	BVtZATrWM9YXMJrXia7vyBObHcatr/A/fuaxqkHEvTpEoXVUBzzfoDEefeoh2h5i
	IGeg02PrcidCJhe7qU5Yg9jZUqQICqwhA0kZA4fjm5jzLMqB/KKILdOY1fwLiuBL
	3dNQYdGvr+1eq1hjkA5sc97Vsk7xialvB/2Z/AcWYKspTSSZXEKgnNY0g1IrftZn
	azWRE+0ywQMyOt8LuWtZHTRCwAzb1foz6f7Me+f8dGOl5/Z374ft2i5YEoM7A04e
	GhJ8Ug==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33hyq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 21:27:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b7ef896edcso675630eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770154034; x=1770758834; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tz1a6xsKW0DDS5mq5QeO0TOyjfRK1srfv9pCRWVxbLE=;
        b=M20abPNhFfp2wcPgt/zmNg3dZDzBgzENgWuNXpXagWT0BUlBSExwkEJV5Cjwl6gjju
         JCZKJ7uSez9+MQJCs81ms2ZgAL/1qLPTu666wSOeT5nTp07vRQS/EKhZVQi2LJfDrLsL
         QndYNbQS+W57NHqEeBT16rQjoWfIwoyCVlPp3/FxSMOVKh1KzKpe3sePZhDDbZYaC2L9
         QSiOr7ur0qRezj9YWQVm1mcu29V5OEJ6wtI4gYU81ZNvLAsb/YDkLGZCbUa1fZxdvOb8
         BvMyAi2W9Fo02ck/QXeg/Etk7e2o+bO6M0iy2lQYa+M10G61j8xEKIDSnxUJXn2oZm31
         ni0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770154034; x=1770758834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tz1a6xsKW0DDS5mq5QeO0TOyjfRK1srfv9pCRWVxbLE=;
        b=cKarm3v3CW8AhdM+qDPly/wuX5Zm/k3QxgLUwAd5gDoHSu1Foymci4Zu34M/4EznfJ
         O0w/JSRnBuo9XwI1xZAYOK60UT87/PlVJezB+dWUHfYCaDmz73Ftm9eDpZcsiJzHUGzy
         IQjFknK9CJLXETiNwZXiZc0JsEhG16blHo2pKdCorXC0PWYZ1oSF4EnOYzO8zeWrgP7J
         F9LRIKHyQKtTAaoaSpNPgle2E3kdVxMopRkPt0o7KPzVuiVGLvqAjiGT4cyARurGPJ8p
         pPdP+fBvbC9Aj9sfPPaxxwYam3cpMKS+BSgTp4ppGB0L6n9dIBzqCGuRBLp3bb4Q1SiA
         WrBA==
X-Forwarded-Encrypted: i=1; AJvYcCVXF3GK33WrSUbu2m06QMstzhmBdBfq5l6G8Ld8tEy5tlqfvE/AIjv8NkLGlKua/o6IgnDfZmwWuD6+gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEejdVVHCq3ZX+zxW/PAZ5L9u7LEaWoFatll3hdoy7C1S9VZtN
	0S4mCbDj8hwWn5DAp7yVcaa5NyXg51IRVdPWUID4IqihusDIbQiD0cOpBZgYohkFp5mhPvszHo+
	Jer2cpGd/94amiza4q+Fd9gsVpzueabrtNvV8XbMxtWHw5dRSE6fyS67TRWOfhiR44MGmevY=
X-Gm-Gg: AZuq6aKIbc6hQB6WqwM+/D3Wr/tPLuM+8FTWNbsIwUkoo8xCPnKhGyd6Vlo4dNSNdpx
	32aEISpUbN9MdtV+XZoFCLOamD3oDSC4SrFLM9Ls434OylsameToDhZJgpB4Ns41p/BwhDH4vQA
	N69I0wji9Mn/aM9FF+SRgnKOMPxiI6kvHujb0EKvsOVdn6LDrTewKApXCNl5Wb5Wto0vgoaOMMg
	1fVH1qy66jKQLLPVIH1y5GLaXW7dBi3HqyVeS9qTyEkv/NMmRh0IwilY9Spwk4hveiGQyAV8Uyw
	rGXIIEpK34fc2kdxBy3jpRy7se7KEJOmBwxJCOtu8InVBzWPgfI9/hWhY0nEMgr6R9+lHLciZmL
	b4t4COBpDVFKpHePIMEg=
X-Received: by 2002:a05:7301:6094:b0:2b7:5e35:fa9e with SMTP id 5a478bee46e88-2b83287e6e9mr528571eec.3.1770154033855;
        Tue, 03 Feb 2026 13:27:13 -0800 (PST)
X-Received: by 2002:a05:7301:6094:b0:2b7:5e35:fa9e with SMTP id 5a478bee46e88-2b83287e6e9mr528545eec.3.1770154033326;
        Tue, 03 Feb 2026 13:27:13 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832e4cd26sm463464eec.12.2026.02.03.13.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:27:12 -0800 (PST)
Date: Tue, 3 Feb 2026 15:27:10 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: radim.krcmar@oss.qualcomm.com, ajones@ventanamicro.com, alex@ghiti.fr,
        anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
        corbet@lwn.net, guoren@kernel.org, kvm-riscv@lists.infradead.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
        rkrcmar@ventanamicro.com
Subject: Re: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
Message-ID: <fazd2fcfuwldtrarm6aw26qa5g6fcieoa35xz3bwchif6qfutw@xuvspa4e533b>
References: <DG4PS6NRRUC1.1FL8WBJVEEM4D@oss.qualcomm.com>
 <20260203142422.99110-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203142422.99110-1-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=69826832 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=Y6f1DytA9gW5mLcrTH8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: -kAzUca2Rjbjd92ZyOioPRtpquEgMc_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE3MCBTYWx0ZWRfXx0bqYw8Ha1Ii
 vnQxrAkeI19g5i0U3T1XY6bOItsmPCDrKF7IKazCx1eSnA8maGKKoEjVQFLEq+mh3LxlJsQuWHM
 i9oM/yFX6RTriYzxDaOpkuNYBMzqFjRseCw9upnkneoRnqmALdz076aVFsfgTMITROC4ikWPlOF
 gqYrnOHJ59zydb/LJr5gtYutzXRGjYi3nbIhfclnCPy/y0294DEtZeWP7kcsxTGam2SFn5TaVll
 mlqnR3jJF2+Co/8CCEpDtTzFQYgBIuvjdTC02kYaPGyY/4Pw1EsGypUUjByoy+UQYfSv0X7yG1d
 vZ3w1P/VCM9fvyTvZcv277JczGhDN4mqmLc2Xynq1ZvxlpCYxHgydL9Y+68AGrIcejc0zMq1U3+
 qXHuGQmrTNuhgtsfnVwV6WS4uIZxPZahWY7/E6vmtDN5qN+dsNvyN/3V5ZSdRY1ExqgdR3J6DmY
 MvXRqH4qiOXcvqMoQHw==
X-Proofpoint-GUID: -kAzUca2Rjbjd92ZyOioPRtpquEgMc_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_132717_362227_09F837F8 
X-CRM114-Status: GOOD (  26.09  )
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

T24gVHVlLCBGZWIgMDMsIDIwMjYgYXQgMTA6MjQ6MjJQTSArMDgwMCwgZmFuZ3l1Lnl1QGxpbnV4
LmFsaWJhYmEuY29tIHdyb3RlOgo+ID4+IEZyb206IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4
LmFsaWJhYmEuY29tPgo+ID4+Cj4gPj4gRXh0ZW5kIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRl
Y3QoKSB0byBwcm9iZSBhbGwgSEdBVFAuTU9ERSB2YWx1ZXMKPiA+PiBzdXBwb3J0ZWQgYnkgdGhl
IGhvc3QgYW5kIHJlY29yZCB0aGVtIGluIGEgYml0bWFzay4gS2VlcCB0cmFja2luZyB0aGUKPiA+
PiBtYXhpbXVtIHN1cHBvcnRlZCBHLXN0YWdlIHBhZ2UgdGFibGUgbGV2ZWwgZm9yIGV4aXN0aW5n
IGludGVybmFsIHVzZXJzLgo+ID4+Cj4gPj4gQWxzbyBwcm92aWRlIGxpZ2h0d2VpZ2h0IGhlbHBl
cnMgdG8gcmV0cmlldmUgdGhlIHN1cHBvcnRlZC1tb2RlIGJpdG1hc2sKPiA+PiBhbmQgdmFsaWRh
dGUgYSByZXF1ZXN0ZWQgSEdBVFAuTU9ERSBhZ2FpbnN0IGl0Lgo+ID4+Cj4gPj4gU2lnbmVkLW9m
Zi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4gPj4gLS0tCj4g
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiA+PiBAQCAtNzUsNCArNzYsNDAgQEAg
dm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3JhbmdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2Us
IGdwYV90IHN0YXJ0LCBncGFfdCBlbmQKPiA+PiArZW51bSBrdm1fcmlzY3ZfaGdhdHBfbW9kZV9i
aXQgewo+ID4+ICsJSEdBVFBfTU9ERV9TVjM5WDRfQklUID0gMCwKPiA+PiArCUhHQVRQX01PREVf
U1Y0OFg0X0JJVCA9IDEsCj4gPj4gKwlIR0FUUF9NT0RFX1NWNTdYNF9CSVQgPSAyLAo+ID4KPiA+
SSB0aGluayBpdCdzIGEgYml0IGF3a3dhcmQgdG8gcGFzcyA5IHdoZW4gc2VsZWN0aW5nIHRoZSBo
Z2F0cCBtb2RlLCBidXQKPiA+dGhlbiBsb29rIGZvciBiaXQgMCB3aGVuIGRldGVjdGluZyBpdC4u
Lgo+ID5XaHkgbm90IHRvIHVzZSB0aGUgUlZJIGRlZmluZWQgdmFsdWVzIGZvciB0aGlzIFVBQkkg
YXMgd2VsbD8KPiA+Cj4gPlRoZXJlIGFyZSBvbmx5IDE2IHBvc3NpYmxlIGhnYXRwLm1vZGUgdmFs
dWVzLCBzbyB3ZSdyZSBmaW5lIHN0b3JpbmcgdGhlbQo+ID5pbiBhIGJpdG1hcCBldmVuIG9uIFJW
MzIuCj4gCj4gSSB0aGluayB0aGlzIGlzIGEgZ29vZCBwb2ludC4KPiAKPiBVc2luZyBsb2dpY2Fs
IGJpdHMgMC8xLzIgaXMgaW5kZWVkIGxlc3MgaW50dWl0aXZlIHRoYW4gdGVzdGluZwo+IEJJVChI
R0FUUF9NT0RFX1NWMzlYNCkgd2hlbiB1c2Vyc3BhY2UgcGFzc2VzIHRoZSBhcmNoaXRlY3R1cmFs
IEhHQVRQLk1PREUKPiBlbmNvZGluZy4KPiAKPiBIb3dldmVyLCBpZiB3ZSB1c2Ug4oCcSEdBVFAu
TU9ERSBlbmNvZGluZyBhcyBiaXQgaW5kZXjigJ0sIHdlIG5lZWQgdG8gZXhwb3J0Cj4gdGhvc2Ug
ZW5jb2RpbmdzIHRvIHVzZXJzcGFjZS4gVG9kYXkgSEdBVFBfTU9ERV8qIGFyZSBub3QgcGFydCBv
ZiB0aGUKPiBVQVBJLCBzbyB1c2Vyc3BhY2Ugd291bGQgbmVlZCB0byBoYXJkY29kZSBtYWdpYyBu
dW1iZXJzLgo+IAo+IFNvIGlmIHdlIGdvIHdpdGggdGhpcyBhcHByb2FjaCwgSeKAmWxsIGFkZCBV
QVBJIGRlZmluaXRpb25zIGZvciB0aGUgSEdBVFAKPiBtb2RlIGVuY29kaW5ncyAoZS5nLiAjZGVm
aW5lIEtWTV9SSVNDVl9IR0FUUF9NT0RFX1NWMzlYNF9CSVQgIDgsIGV0Yy4pIGFuZAo+IHRoZW4g
ZGVmaW5lIHRoZSByZXR1cm5lZCBiaXRtYXNrIGFzIEJJVChtb2RlKS4KClRoZSBiZXN0IHBhcnQg
b2YgUmFkaW0ncyBzdWdnZXN0aW9uIGlzIHRoYXQgdGhlcmUgaXMgbm8gbmVlZCB0byBhZGQgdGhl
CmJpdHMgdG8gVUFQSS4gV2UgY2FuIHdyaXRlIGluIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUg
Y2FwYWJpbGl0eSB0aGF0CnRoZSBtb2RlIHZhbHVlcyBtYXRjaCB0aGUgc3BlYy4ga3ZtIHVzZXJz
cGFjZSBjYW4gdGhlbiBqdXN0IGxvb2sgYXQgdGhlCnNwZWMgdG8gZGV0ZXJtaW5lIHRob3NlIHZh
bHVlcyBhbmQgY3JlYXRlIGl0cyBvd24gZGVmaW5lcyAod2hpY2ggUUVNVSwKZm9yIGV4YW1wbGUs
IGhhcyBjZXJ0YWlubHkgYWxyZWFkeSBkb25lKS4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
