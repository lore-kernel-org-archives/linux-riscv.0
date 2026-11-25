Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60865606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lQNvjf5E;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MTlNwwTQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KvrTNoqu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ZYqJlt3oZoph2iBqoN9r7vhUJgGYztWoqDr+UAGV8k=; b=lQNvjf5EO/ixnSg6yEHxS+zhue
	emeFg/Hvdjf3vta4bwnqrS6GXqxmNvTaFcxaCeddHeDs+EaGm7UXioEssci+hgRf6qC/qh3tW0XG+
	IWPhgpm+uED+i+mnn+ymvgmb/fc2SNHDw/+h8POzb1Huj+FmoRD7atmQyFAq326/rXjZFUY9poQpz
	vSU0f2T53jMoqIn7fkQBUjHobrA5oKl16CoaYnCu4xnV847jzdOL9O1VyViWl/A+dQRuNnSmMxQTl
	ok1LXeyooRnUrFUxrkTM6d+2KD7RCQdjjcc1f8s25p3yuYerVFOSbEI+sIiUgLKbB11htz8PyhDsa
	8R0OqWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAL8-00000009T2H-196u;
	Wed, 25 Nov 2026 10:35:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKV-00000009Sma-40lH
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 10:34:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mdcZ796830
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=; b=MTlNwwTQXga43xmW
	iM7da30bnloXibrktMFcBqpiXRmX+ABlAZ6LWDcXrCAu0NK0regToQLoMG4X1IXy
	G7tQwe8D89/7GJnRKRlEyOM4FK4yU/t5GDBFMcCZ9zrfTttxMThIoCkVE8yBJV47
	VNirkCtgmLSpMEBLeQa0468ZGW7teO2Cj1gccoqV62Hs1VUwiqyGtwctvF2INn28
	UDR+w28YC9fOR4dapuOlrgxA1VUKl9kwwYJA8zPF6gEKUxe92PZn5cz5Tq/3UmkH
	iLj6bhcMtxKNs2MSEsjmLBLLEPtQ+CuCaAGf7Z/c2vlRF6sd/6D7EHg4pxZkIP9l
	iWGLsQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rt7mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 10:34:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so4524430a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 02:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602862; cv=none;
        d=google.com; s=arc-20260327;
        b=b5QErgNSgjqjI9ycHCUZAE4ENueEFG+tTvUYA/oZMxZobqPwEt8IugFEiDW3ibw/M6
         h/mvEXS1DSpowqNgKjBUZ4mBg2C9Ay0HFQJgFIYkoLA2abjSi/Mv3K8VnfHdh4tTR/5w
         xPUOBE3M1cxV0+7ERfEhzWRUmbCJ/1KBrrlkIu1ErNKuZlTF7wS6VKrUXRKMqsLO2s8F
         gM6x5ZmJkHKYRgRHG+GSvYkUUAH9wfjEwEIU9WGC7/DDbq/wTp5w2jAyIX8a8zYsCor2
         J8e3pM+bpLHcr6KngHBDCkmRWgnTob6unHg0dMtun4lZ0B8zmjJBmqcgcahg+COHSYUZ
         Mu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
        fh=ZVd7TPmrssGz6aUv4udn7IbjXCPxgaWIdG2kaHTXoK0=;
        b=jMLUgagXEjNbIpxImv7RTDY/E/KMyxpWScKOndgUaio74apC29p0paylYnN0Eqd3Jb
         45kMYOyKXz+6wkUGD2eoRMZzHp8Z/lUXfFsGgsPqoxCISSAsEC4CJJSNSahGIHSoafeA
         XNAzWUMEFUm6Z1BRB47soMgQeBvwdE2Qu1Q8Cqy5wtcwq4qM6YUMXiy5cwxnT24Hldcx
         NjbTAQdvGmstVzrFDKhEz97lOkkmFMO/9TYJFSrkKj6zOvqVVYt5ZdGTuI1AXkMnB2X+
         Sw4MwYw+eUo0MSFJBMnz6zC4tI5uqaYubt2Rg9RDyE7NnsLQRqVYVYShgh0ijeYIUkJ8
         4V2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602862; x=1796207662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
        b=KvrTNoqu8lc2jqCqT1gFzzSg0FQgI6jiLQSQDRHu08I7C7WTL2Q6+hh1w6UBu0qaIq
         lJZxaQGa8i6EKY+/JAJCUMgDXkx/DvPM5yoQxjefD8wRLEYmScNpfMgJzS1ALlOcQrqZ
         i/xJzWK1oSGway54kxTjNGV96wCNGjf+d1U9vYFoOaj5r5FwxI/uVOwkJjUM/xXsxSo8
         M06WtK9P22tt2GPRSukZHXd3v+5TPM9LJuwY+0WHGSU9g1CEc7Vn27VvJB/dUQfwqrJD
         DLeWHNjniZc4TDJ0rqLtsDHiANP+qHsfn+ZF+zeWCC/+qIXMxqQNJJvSNAitjztTgrez
         AD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602862; x=1796207662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
        b=w8C+OsSZjxJzXUqEy63GW5BLnwPDgvqBqzckv6GotiLs09AMAVPO/KO3KZRGhbtBg2
         DGx0impBRRUPVKpxZ9xg68hUgO/u3UAmRa9Ob49AwQGln+5oGiWTbmxGQer1Ly0ddySM
         GZTgSUtbSF6odVjzMCMJh/z8iJCpwDcqr41jrTamNf5ejSYxrtEAGreX72yvhBun73N0
         2cijyhLloglh/nIKGAZyuYqULNqnUyrD3r92rjCGDvHfJ4SXH+aDE8bgbDYmJh24k37p
         ICKXfdnACX4ry+EumcO2P+qaQiL/jBpGMMhHRmIHfHTDIZGfeuoz+4JSnQmzdrtVpoPS
         7FzQ==
X-Forwarded-Encrypted: i=1; AL+hErGtdYeHZxbUeinEeZdn1BimsiLhW1Dmpw6oclWzUcujgio1/Ug6uGJQW/8Jdz3MBSDi922j8SqdIGTUrA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+7HVFTZ0cGEOxdn24J0raqcAk9yPSb+BeCYhzf3xM4nY3lxQwX
	Nv3mqG//j1iMWdLqBCN6xSX7Pq6JCIAm/Md3Dj2UxMWDbr7WQm0ySfA/hoh7BrYjNiSWbPun0tH
	JKwJAw4BrDXu9SIqlbgdYnid88kPjZb6ZOZYrogXi9Js/VJ4oHn6vz0blP7SIiceeNG4/ji1mr6
	bnnby4Pr+vxVbi5xXbdDXyvyDrMv9aMQcKAnjXTgQWlvZbig==
X-Gm-Gg: AZFdTZcIlfNFjRfYm3RHNhfSx57nVtniEHiDO821l1wTB0cFUPDkFZapU1gxoDTQIIZ
	UYIVnVbFzY5EgtlkkKIFeUMVODd9wSJi5CwBQ0RwHmRcdssBjSV8yJpA1PxnFS5RaJuuS2I5Uq1
	IOoDO8EMBDF4FOognNIu7pp0l6uUqsHN/3j4ifHTpxN2P5UaSBBHJiVs50SQ==
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr15585911a91.25.1795602862231;
        Wed, 25 Nov 2026 02:34:22 -0800 (PST)
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id
 98e67ed59e1d1-3b41c911819mr15585881a91.25.1795602861775; Wed, 25 Nov 2026
 02:34:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-01-pm-device-link-v1-1-8932e0862378@kernel.org>
 <CAPx+jO-37Km71oSW+zOO7BBWLj86SNCn=U=EGmBXdC5SfX4nbA@mail.gmail.com>
 <20261116072442-GKA100890@kernel.org> <b7d7ac2eee0e64aa7c267def5c2a8a022c7da425.camel@icenowy.me>
In-Reply-To: <b7d7ac2eee0e64aa7c267def5c2a8a022c7da425.camel@icenowy.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:34:09 +0100
X-Gm-Features: Aa3M54rH_iaUZ5ip693Y70gQCtTHGqzR_7H39x_RiS3GWAMpcjgQcywZy4Jp6MA
Message-ID: <CAPx+jO8bY7WZjeSuOjNE1=FxrBhs=M9fxEJx-r06c2S84xFr_g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: connect consumer with supplier via device link
To: Icenowy Zheng <uwu@icenowy.me>, Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX6AK7TF7hCU0f
 hqF5+L6F8JdWvM+wddCrGFjRm/7PdzguL0zxzsR/2bkkdL6UU4//hSdV3mmsclgbuADGj85q6mO
 r2Z280jVMPKbRngrPwZVI68YA2H0201yp/clSa0kQw9VWgnb+dBzRyREwtg5b/K0FPqF3oGRFpm
 GK+CVBLPyIqoU5bNXUPDUg6M55ywQpy55Yq8iQhQXobPeoFGMIUaRI4sqaYEjWN/C20L6NbCtAZ
 CgZGxKwpeOYLofrz5cHnCHnVLmROWh2iJdEmyKQ5uqGQY1eUY53QV85rRCse1/cJc8NF3DVuFb2
 CUriDjJcMrpFArsHpxviQLpulaP4SuGwbeEjUP8GGDty4YfRdPFb2XyQ7xE+m86GcxoT4K8AzZ0
 LX+OLlasjPSyisf6lYEiNBlywkknh2KwfGnr2MAB6/3p3LOggJQy0l+5a6Oxu8yINdJJrnhCDgT
 b3Pl2ivrasLBWrg7HzQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06b9ae cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=8NAnHuo4LRsqlWi9iDsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: bGEnSB3h22erKQJlcTN2zgHu8EkRXI_U
X-Proofpoint-ORIG-GUID: bGEnSB3h22erKQJlcTN2zgHu8EkRXI_U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX2sELs7hBP+Y8
 K+p3SaKvkwnUnB7J2R0/LV9WA6ayfHOUECt6Q8DClY8zpqjiNLbmNWFut6Epl6zF73ltnNt4BZk
 Q1e+vEWzq6RQYmc/BQ370isvMIa2Z1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_023424_691395_9EA78DA7 
X-CRM114-Status: GOOD (  20.01  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMTYsIDIwMjYgYXQgODo0N+KAr0FNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKPgo+IOWcqCAyMDI2LTExLTE25LiA55qEIDA3OjI0ICswMDAw77yMWWl4
dW4gTGFu5YaZ6YGT77yaCj4gPiBIaSBVbGYsCj4gPgo+ID4gT24gMTI6MzMgU2F0IDE0IE5vdiAg
ICAgLCBVbGYgSGFuc3NvbiB3cm90ZToKPiA+ID4gT24gVGh1LCBOb3YgMTIsIDIwMjYgYXQgODo0
NeKAr0FNIFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+
IENvbm5lY3QgZG93bnN0cmVhbSBQb3dlciBEb21haW4gY29uc3VtZXIgd2l0aCB0aGUgc3VwcGxp
ZXIKPiA+ID4gPiB0aHJvdWdoCj4gPiA+ID4gdGhlIGRldmljZSBsaW5rIEFQSSwgU28gd2hlbiB0
aGUgcG1kb21haW4gZHJpdmVyIGlzIHVubG9hZGVkIG9yCj4gPiA+ID4gdW5iaW5kZWQsCj4gPiA+
ID4gdGhlIGNvbnN1bWVyIGNhbiBiZSBhdXRvbWF0aWNhbGx5IG5vdGlmaWVkIGFuZCBwdXJnZWQg
Z3JhY2VmdWxseS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxh
bkBrZXJuZWwub3JnPgo+ID4gPgo+ID4gPiBDYW4geW91IGNoZWNrIGlmIHRoZSBiZWxvdyBjb21t
aXQgdGhhdCBzaXRzIG9uIG15IGZpeGVzIGJyYW5jaAo+ID4gPiBzb2x2ZXMKPiA+ID4gdGhpcyBw
cm9ibGVtIGZvciB5b3U/Cj4gPiA+Cj4gPiBObywgSSd2ZSBjaGVycnktcGlja2VkIGJlbG93IGNv
bW1pdCBhbmQgaXQgZG9lcyBub3Qgc29sdmUgbXkgaXNzdWUsCj4gPiAgaXQncyBhIGRpZmZlcmVu
dCBwcm9ibGVtLgo+ID4KPiA+IFByb2JsZW0gaGVyZSBpcyB0aGUgcG0gY29uc3VtZXIgc2lkZSBp
c24ndCBhd2FyZSBwbSBkcml2ZXIgaXMKPiA+IHJlbW92ZWQuCj4gPgo+Cj4gSSBkbyB0aGluayBp
dCdzIGp1c3QgYmV0dGVyIHRvIHByZXZlbnQgUE0gZHJpdmVycyBmcm9tIGJlaW5nIHJlbW92ZWQu
Cj4KPiBUaGFua3MsCj4gSWNlbm93eQo+CgpJIHRlbmQgdG8gYWdyZWUuCgpVbmxlc3Mgd2UgaGF2
ZSBhIHJlYWwgdXNlIGNhc2Ugd2hlcmUgd2UgcmVhbGx5IG5lZWQgdG8gdW5iaW5kIGEgcG93ZXIK
ZG9tYWluIHByb3ZpZGVyIGRyaXZlci4gSXMgdGhhdCB0aGUgY2FzZT8KCktpbmQgcmVnYXJkcwpV
ZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
