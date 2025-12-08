Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D851CEBF88
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 05:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4qjyc6aqIC7WLA0x+u3xMkDjx+VorCLKNiXwr3nGbA=; b=qTYGd0ttTUaL/7
	M+uj2VGNQ5tSmSW2X8x06xKDVfkSTha4rf/2VH+ZmfuvJFaSzHT4xi3eTThRZ4tnnWbzpF8TvXPsG
	c6uKq8rheq/rFc2XO1U6Kn7wE+/nwncPK20ECVt7X/zZSkFOQ3exjE2iIL4w+vXl0aemooUh989LF
	ZtDyRYJ0kAcT5sqzyOxF9E+BHkOz21FZiX3LQ75xZLS0daVHLPMNGPgfPR+CJSzZ+9Mv27IqEXYWj
	TcOmZE8dBHO5Jlf1dlvYnuntMlNQ0qA2KaMifHW7Fi7dm/n2T6d4xNMSrd92TbclzV9AmZwa2HD3D
	j/hv3gSgciupDXKmVWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSTjZ-0000000CcEK-46Fj;
	Mon, 08 Dec 2025 05:24:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSTjX-0000000CcDo-00Ai
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 05:24:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7GhKIO2754737
	for <linux-riscv@lists.infradead.org>; Mon, 8 Dec 2025 05:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTFDaI0X2upqE8C3ur4iiWVf3TE03Gdd/FG9zE6s/AM=; b=ApOVx5lyNdoxDrd8
	Xi0d3GljU5ydMHmXVOdvIsNWuswRKmAi8ICo2Y0xNGnku/zlr9cRkD6grk0pdj1/
	uQ4IYNWOFf8RpAlBDCLBdhzmVOvb2dzLBEJyEKwJ3D0zJq4AUqwods99QHu9recL
	bdd6g6KVILVvFDVQ4f/jysJzUcVjTDspzVMIcBGhukLDE4gauWHVFedSLWeTHpHg
	80tVsBsZI6Jw087vT+6pa6PuORvs+6r0LRp6+7rlRl40fQj7ixOzsJoYpRTcD2L1
	Cn8dzbMKh1WPFFaFFxPqMxQdo5jbP7+1Z84OUu7xaoPhFqRBagjxrsCIJU1y0kPo
	HLDJ1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjvbp1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 05:24:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29b760316a8so59195465ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 07 Dec 2025 21:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765171464; x=1765776264; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CTFDaI0X2upqE8C3ur4iiWVf3TE03Gdd/FG9zE6s/AM=;
        b=WEk7SgEYUxGbP0Aqqo4OLMGikWVjCGJe/ai6mEs222x8LJExeariaDtAbXrvNAi43K
         Qt2t/knEpNWdsZIeKMyz8XMllMJPUUg8HrcDtgN6cyN8AjohlGwgZMwrpOlYpfAW17G7
         p1MRI6LWoBtC4C9DIxXjr7PatA4xpd3Hlu0ycfQS6d0idWSOxT/gDcpEFYV/88vx6OLH
         Lvs3XPHFvdLEbpYRfl6799mtflDo2VIFZEvCDXtrjnNWg1K4wVJ+EOfit1ATr5DEqqnA
         5Eme+HfhLI7GYLXd59114RK9IhxFhB4PL1zxXUMksieDKspZdiENJppry24eATyxOkZZ
         nAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765171464; x=1765776264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTFDaI0X2upqE8C3ur4iiWVf3TE03Gdd/FG9zE6s/AM=;
        b=N7703x+5//D+NdbG+7qrARNeWM8byMLs5Dxqpj+7E2TVVWYnZUAYB2K9OuqiSgMqq5
         7zyU364n8H23LdXABmQPnxL0sqibimS7Y6CKsCJxn0iJj6Z31ShCvDhjtjbYdSyAG/z0
         GC4sHpvlfM9G/3jug6u3GH1ACRq1Lz5j/cduD2Ombx36M3NML+WPYcNrp2pRph1uJhJ5
         rU9JmMFZZAuoc99Usf/+BLoxo29UJ0MZwNlPAwRKN5jhWO6CgUvx/RWWsHHutuqfJqF2
         zwGkSMiECm+hbe4c6qJG0HzVD+4DjnqgAIZYi0okWCGK53l/8X9ycBuFqpbwcIM5mlRy
         9ZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzDA4oPzXC0tvNwe6gXXuTzNwPIeyx9eNaXKnlrm3vRsyxW7tPUqkeMTPTfOdf/Jp0cNRbd1sPD0vgxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvjRJ6EPwtH/UroyIizObkr6B2dC+JDv5xU9D09+VCxwSly5Hy
	GOXfv8k99mJBqa04vZOFFx5VgVixKxXi6lS1r4wJlR4UVZojHXY0C3HRP5M/9b7zmNDH8wnItmS
	sk4svfuZZpuVloTtuwHS4/wOqFygT8JQXAMxtrHOKVYsf2+/A2EAe/GmkXz1vf3rxt1aMNA==
X-Gm-Gg: ASbGnct9hBk6IOgKFEPOba63t3suxvjLuDw/pIvhix6sKvCHRu9xrSd3F2r7h+S4sqs
	W3H5A8huLGapVRvIP9qDNn1QZ2YHon+Dr938UVkf98aLYcTV2PKHv/tBseZE42Ormp4GCeAcR0w
	c8UunuUAIvaiQDrqdRnXTxGOQvWiXX1t88Mn1fz1DaFl85X/PVQcGG3xARnDqd7dp3TULsRS1rx
	JL6I3QCmf/ylNiw7yZRZUhdUhzv/FjDGJ4/z0j7obhNYGSsQs6P7cgJxMyNFtmtyujs7hEKT3/f
	c1gCt+XXhkUIFs5sSuTxsOyWJS6xSiAkrcZvqVMMPGDe8hT4lpLHbje3CQ4etcbCxaWirqIvL6L
	2F46bQ1jUulfeXYIUetS35F0vvE+vz71yVrHHCy/lqKeGa3QBX2YiV9w05JuYdcfeBVC+wrk4FX
	V/MuK+MbU=
X-Received: by 2002:a17:902:f693:b0:248:ff5a:b768 with SMTP id d9443c01a7336-29df5571f2dmr58562645ad.10.1765171463887;
        Sun, 07 Dec 2025 21:24:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTwo90BTgSEMEr4il9ifC75dGqZTYMnmBFNNwzpfJCfnl95G5gnFXZV8agR/+7hCFVjz8BVw==
X-Received: by 2002:a17:902:f693:b0:248:ff5a:b768 with SMTP id d9443c01a7336-29df5571f2dmr58562465ad.10.1765171463383;
        Sun, 07 Dec 2025 21:24:23 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaac16fsm109803545ad.87.2025.12.07.21.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 21:24:22 -0800 (PST)
Message-ID: <0b061075-ab71-4ac1-93ec-438ddaaec903@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 16:24:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Sumit Garg <sumit.garg@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Randy Dunlap <rdunlap@infradead.org>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251204101730.1036671-1-arnd@kernel.org>
 <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=69366108 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xFIYUFTxM1JpX5VCbgAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0MyBTYWx0ZWRfX9xRSXl1MxysO
 tVrt+muwZQnF72GQih/LVRq/Q4HzcZu08oLvqk8cEZO2fu7zej0lcDBJuzNA/DivFmieHyDMCKm
 sOEpW+FqUNCfBdin9mYuwRWqqy/+m43FDqj8fo0hekbnEVyQfmz5wSau4+pOmcqjbBXBkaFdgIh
 wSxP342tTy6qZQiaxOlF4Q18tjmYi2MSgkh5OovNhRWizQz5ywoUt0lRLavJ32lEXr4UWbgbZ2t
 Jhq10OuRa2HvzJ9ly/Wu+qndhgx9YDY4PmTHfITeLlK6T/LR9gzv0g71aQtV3dFrPn9i9zgbrKS
 7gzA//nASL/TJsOv/p1Td/e/i9Pmrs0RxX5yAAEX5rhoeUf2Ynwt/u+O+WnRc/LtkkrJ7kZ6Sm3
 GX+UZCnjkaoxys106PA0D6ggyeiDLA==
X-Proofpoint-ORIG-GUID: RINcc_29AyVCJnQjy51Hwmskw9p_rt0D
X-Proofpoint-GUID: RINcc_29AyVCJnQjy51Hwmskw9p_rt0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_212427_191072_3974B780 
X-CRM114-Status: GOOD (  22.32  )
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

SGksCgpPbiAxMi81LzIwMjUgMTI6MjcgQU0sIEplbnMgV2lrbGFuZGVyIHdyb3RlOgo+IEhpLAo+
IAo+IE9uIFRodSwgRGVjIDQsIDIwMjUgYXQgMTE6MTfigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5k
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgo+Pgo+PiBUaGUgdGVlX2lvY3RsX29iamVjdF9pbnZva2VfYXJnIHN0cnVjdHVyZSBoYXMg
cGFkZGluZyBvbiBzb21lCj4+IGFyY2hpdGVjdHVyZXMgYnV0IG5vdCBvbiB4ODYtMzIgYW5kIGEg
ZmV3IG90aGVyczoKPj4KPj4gaW5jbHVkZS9saW51eC90ZWUuaDo0NzQ6MzI6IGVycm9yOiBwYWRk
aW5nIHN0cnVjdCB0byBhbGlnbiAncGFyYW1zJyBbLVdlcnJvcj1wYWRkZWRdCj4+Cj4+IEkgZXhw
ZWN0IHRoYXQgYWxsIGN1cnJlbnQgdXNlcnMgb2YgdGhpcyBhcmUgb24gYXJjaGl0ZWN0dXJlcyB0
aGF0IGRvCj4+IGhhdmUgaW1wbGljaXQgcGFkZGluZyBoZXJlIChhcm02NCwgYXJtLCB4ODYsIHJp
c2N2KSwgc28gbWFrZSB0aGUgcGFkZGluZwo+PiBleHBsaWNpdCBpbiBvcmRlciB0byBhdm9pZCBz
dXJwcmlzZXMgaWYgdGhpcyBsYXRlciBnZXRzIHVzZWQgZWxzZXdoZXJlLgo+Pgo+PiBGaXhlczog
ZDViOGIwZmExNzc1ICgidGVlOiBhZGQgVEVFX0lPQ1RMX1BBUkFNX0FUVFJfVFlQRV9PQkpSRUYi
KQo+PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+PiAtLS0K
Pj4gVGhlIG5ldyBpbnRlcmZhY2Ugc2hvd2VkIHVwIGluIDYuMTgsIGJ1dCBJIG9ubHkgY2FtZSBh
Y3Jvc3MgdGhpcyBhZnRlcgo+PiB0aGF0IHdhcyByZWxlYXNlZC4gQ2hhbmdpbmcgaXQgbm93IGlz
IHRlY2huaWNhbGx5IGFuIEFCSSBjaGFuZ2Ugb24KPj4gYXJjaGl0ZWN0dXJlcyB3aXRoIHVudXN1
YWwgcGFkZGluZyBydWxlcywgc28gcGxlYXNlIGNvbnNpZGVyIGNhcmVmdWxseQo+PiB3aGV0aGVy
IHdlIHdhbnQgdG8gZG8gaXQgdGhpcyB3YXkgb3Igbm90Lgo+Pgo+PiBXb3JraW5nIGFyb3VuZCB0
aGUgQUJJIGRpZmZlcmVuY2VzIHdpdGhvdXQgYW4gQUJJIGNoYW5nZSBpcyBwb3NzaWJsZSwKPj4g
YnV0IGFkZHMgYSBsb3Qgb2YgY29tcGxleGl0eSBmb3IgY29tcGF0IGhhbmRsaW5nLgo+IAo+IFRo
aXMgaXMgY3VycmVudGx5IG9ubHkgdXNlZCBieSB0aGUgcmVjZW50bHkgaW50cm9kdWNlZCBxY29t
dGVlIGJhY2tlbmQKPiBkcml2ZXIuIFNvIGl0J3Mgb25seSB1c2VkIG9uIGEgZmV3IGFybTY0IFF1
YWxjb21tIHBsYXRmb3JtcyByaWdodCBub3cuCj4gCj4gSSB0aGluayB3ZSBzaG91bGQgdGFrZSB0
aGlzIHBhdGNoLCBidXQgbGV0J3MgaGVhciB3aGF0IG90aGVycyB0aGluay4KPiAKPiBUaGFua3Ms
Cj4gSmVucwo+IAoKSSBhZ3JlZS4gV2Ugc2hvdWxkIHRha2UgdGhpcyBwYXRjaC4gQXMgbm90ZWQs
IHRoZXJlIGFyZSBub3QgbWFueQpjbGllbnRzIHJlbHlpbmcgb24gaXQgeWV0LCBzbyB1cGRhdGlu
ZyB0aGUgdXNlcnNwYWNlIHNob3VsZApiZSBzdHJhaWdodGZvcndhcmQuCgpCZXN0IFJlZ2FyZHMs
CkFtaXIKCj4+IC0tLQo+PiAgaW5jbHVkZS91YXBpL2xpbnV4L3RlZS5oIHwgMSArCj4+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFw
aS9saW51eC90ZWUuaCBiL2luY2x1ZGUvdWFwaS9saW51eC90ZWUuaAo+PiBpbmRleCBjYWI1Y2Fk
Y2E4ZWYuLjUyMDM5NzdlZDM1ZCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3Rl
ZS5oCj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC90ZWUuaAo+PiBAQCAtNDcwLDYgKzQ3MCw3
IEBAIHN0cnVjdCB0ZWVfaW9jdGxfb2JqZWN0X2ludm9rZV9hcmcgewo+PiAgICAgICAgIF9fdTMy
IG9wOwo+PiAgICAgICAgIF9fdTMyIHJldDsKPj4gICAgICAgICBfX3UzMiBudW1fcGFyYW1zOwo+
PiArICAgICAgIF9fdTMyIDozMjsKPj4gICAgICAgICAvKiBudW1fcGFyYW1zIHRlbGxzIHRoZSBh
Y3R1YWwgbnVtYmVyIG9mIGVsZW1lbnQgaW4gcGFyYW1zICovCj4+ICAgICAgICAgc3RydWN0IHRl
ZV9pb2N0bF9wYXJhbSBwYXJhbXNbXTsKPj4gIH07Cj4+IC0tCj4+IDIuMzkuNQo+PgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
