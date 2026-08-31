Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A94C624A5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBo0yI1QlPFOPEodC9TZIoYNsG+gP0SbKkbxTisjb8E=; b=LpUYM4g/4kdFaw
	vdLBvyTSlh8ESkdM3SPsIV0m8U9GzY2bGUmshg7CPXJE+mDtiV5Y4wCH02FdhdaSLcCuXDfnFmcBS
	/K3zqlL2g3dypdG3s8BR4KY0apZRGyOpSqHj26UtRjuMRQS9N97nsGQHQsjHThIjokrmlX8iQnQq2
	pDSilOq4GoAIL+Pxj1fUhWCvr4y88VyLmUejeQ0NTpfJdnTSkNqNDAMRmQR/TNNBm0no0YJxQiqp7
	dy3XxBbumKtl1tPgxFENBI6L+kfzEK4zYySoCMgv2G8PYEzrTtnoYHovCDYxBtKTREJS/JORc9xIO
	SHahqe5ZUtgNPpHD8Oqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0w19-00000008fgi-0FgH;
	Mon, 31 Aug 2026 07:01:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0w16-00000008ffy-1k0e
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 07:01:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52Tw62617661
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 07:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=; b=ADbV7gF0JLvS8Cfm
	MbksJgGLNSKI3xxGjotgVWvM+q8epb467QICaXLotIyYrv99Y1alK1gSWrH+9s5l
	/90iasfhS4zbr2buBXBnrfuEoH4lc1q3SH2YOMpoMSwXt54vqyMuRnlsEXfhPKTy
	AFhGjQqBwz/kXLuZ1Yq+kDsC2rK9QdcF2UR4E2+7GnoV4iVec6OORZn6kNYOjTA/
	3swAnPDtX1XRJvyA2wVQgMRrgxZkWbF7q+tduldnVPLuaoLSNKICnOvNRLEIgzqe
	l2zgAqscYDB5+5MR6bNgxfSWqkPokSfcMB/mwoTRoNqAZgO9ak6S6NXnC7srbmHJ
	47yNbQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2n26a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 07:01:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so1076698a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 00:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788159674; cv=none;
        d=google.com; s=arc-20260327;
        b=BI00/Uep39z+OsMD5TL8do91SJ8/GyWDi1xGa9lt57W8SJt7OFlPZF/g9NS/pO4vn0
         v/p5QPtdWnkpC+ovilrrFUiyIQF5lTlEOVDFjMzrMpcn0yxtRuLWz3SDhcLG0M2/vt4P
         5tJ42FJ6HDLqcJ0oscb61kILSZWmy+JVTFEFdbBkEAPMOSjM9NKPWAot6A55KJgpCr7u
         PywD/iznbG0O2mqULN/DptUqr/DLKY7AHen1I08Tvu+HSmZrViMWaDPnTpzEhMqD7g/B
         a8XS28DyiL96JblMWbwnjJtuCQBDs/5IZNO7inAISF7ijm9PLTUcIFso0F/CebZtytlp
         Reyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
        fh=ommw9H9d/Ic4PXYyThEsxfkAlaEhzLsSy0wSIFULe1E=;
        b=inTVHJB/acNIaAEXmSgWHnyrC+FqvtYT/DPJef4UUNEAzBAvxyXYcGUldTbEPxckgC
         fVATbMWtEYhFI5Wr3NHOU8legisjveG2ZebpQnf/OLSbF+rSj9ZIh9cCJ1yfEFfK4fUR
         EjSmaSBJKtbdmRHHJulkaMbMONs8+OUmkFjcfdn32VBsR8J0HophKkAeCIZVkLJahkQR
         WrrQNjWr5eA7MN6lnJoCUIVNamlD8BqL8nUVF3TFVAlFaA1V8aEq/qEUXJH6FL+rZUgs
         ZFTRrc178flTEScNkqQjou1GPM6YOts5CoD+JDVbrj0+pgrrgxsifzCh2mzzaGFOwPxA
         fThQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788159674; x=1788764474; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
        b=FBM097DM4lqqyl5S8iRL+ouDd6/M03ovaL36tMVVJd3+OtV9V9P6K/mYboAohf1Hwi
         /S7RnByhBi9xsjwSWLU1UEfF4UxBe07QpDxCRZ8yHOohhOxgkfLmb20FhZmQl3SiwkQq
         +Sxw3YzXA+ew1t5832/kUno3FcsG6ObjJYsLU0gRm5wkhJLUIWC2OfCjroRknSy3ex22
         nvRxNZImg+mYyck2EPIPU9mdNW++2g8XA3HOqAHUkvYrFaDnh6AXhKJpPUMhhB8+HEpo
         lLngauJsZQ6vDRfdtaEqHpJRvlyATEJASMvCc86LlM9/vDyGIUfAu9mLgaGe/qmF9ZrY
         6B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788159674; x=1788764474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjz3VLkoLmNm493egCLVUmw1zCg+c71kvqmAxjQBT3w=;
        b=FfpkJKZ6WjEJ9X1AYEEL7uvE2IhRU9jIAX4+djhErf7hdxCF/m7kGM4XGgit6tqpBi
         zMQ/xIUbFDkg5cjxOHnP7+azvTVlMlPC39QbrvehykzyM+wcyqC5Hb2Hgtw3L2cO48NZ
         R0990xF2BkoLPe4+XNOw3FEU2nA/bDgaYb9hJ9890+PYYOBO5LDMFILUxkrwjBI2Ll3i
         SXV3+ejkhx57J/ZwGNhULjnirxbgGy6gUNVydeXRS9cCY5USMJsJdwYv/3/K92BfeaY2
         giqQ+mVjq+uN3PSoXfjxctjp8ivDhvZm99a3n5E2te/ZX801oSX182sp6f48MknVUceH
         ZOyg==
X-Forwarded-Encrypted: i=1; AKwUvBzeJDrA5nmLzbZHSjGX5f6xvhH9sVO6rAZ0F2k5TEPCwkbEEXE7BH2KcC3G5GRN4UKJPtzmgqli4nEntg==@lists.infradead.org
X-Gm-Message-State: AFuF++ntxOUhL5Qa/6tUZuy/aQHc2WOjPhrjeAiGW3YN+PvgSay8RX8l
	j6HxhDUMdenREvKsR8gQSan08oDUREFo8k2tXEhFR+W0OumMVzB7KCjsmUhhH48m+0ANx4n4xmO
	K4932J85pYogQ20S955jDvIJzTcwHKJ3MHFpSL/YuWetcl5eUK1M3U/mx2qfj6LN/ELWxHLUwvR
	p+uq2Cvk2MA2MG5+jYRUlTIWl0UsDkjk4HWpYK8B+JDUB5Sw==
X-Gm-Gg: AYBFou1hf/+KJH9gv1PcBuRbrj1RznoC0b6kn0lM/2YDFoNlhlyOUySt/DkA/Svk5E5
	Ib9SDArI6HN9aTkDdKx6jRXkOch9YS3xl4VrjJ9V4Uv7/9nn0ksJC3ErLy31NMjuNiFY7RXAt2D
	0lSqqRT4PKchGnDl+RlFNKaz1nQBHfSFEbN3Y3/saTB5MHmhVZ0XHiQqD3cpw=
X-Received: by 2002:a17:90b:4acf:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-398b17b3dd4mr17738471a91.4.1788159674229;
        Mon, 31 Aug 2026 00:01:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4acf:b0:398:b17b:3bd2 with SMTP id
 98e67ed59e1d1-398b17b3dd4mr17738374a91.4.1788159673614; Mon, 31 Aug 2026
 00:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
 <20260818-hunger-module-a44d9716010d@spud> <CAHuiULBGKCqxMzO7f-i0VeuN0nykEaDwzVzq1VtT5VK2LM3eTQ@mail.gmail.com>
 <20260825-mahogany-reminder-e22b34a405ea@spud>
In-Reply-To: <20260825-mahogany-reminder-e22b34a405ea@spud>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:31:01 +0530
X-Gm-Features: AcwNN1XDZ4A5hLcyFgra6kVvN3M13-5kLgxPTlWatkTDhr3XPE_BrCOk6BTaEa8
Message-ID: <CAHuiULCeHydeg2e8vreq8xHcrfH8ium+jG2k6xEwWX0UEp+8zA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Proofpoint-ORIG-GUID: miBjweQhE9ecM8tHr-yGcwmnSjd5PIbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1OCBTYWx0ZWRfX0fm3KxXnuElR
 9OVyrXJgUdbkKixt20Y1fFUAXutp8NFr2RV0PVukJIitTmW5nTNAThuncM6INIayNI8/+1r3Qnd
 n05+6ED2UCioud8y4iEqwbHKzlSN4tSASVtUmhqOcGfErmIHm9ddV39RUXkLTBm/Ligotkgo0r/
 cZWLdCaXtYfrhYwOZ/mCeRpsWqFD5OV6+y6lzPDssigClY7fyzYZ+W/OGpb9uLT/fCeaQiL76YT
 ve5g1kdi3x8hL7qHoE7gIzfTV3ARh6k88fOhgIA4akBVblAKEQPxnqrK3MqC8vAAGHk5Hv3/sWW
 q7wAgNR8kU9X3NDwztSzDv8rM44136BAKZGtWj/6Y+2akX8tjbLyOamCzmettRYuk9e+aLtuKK9
 G1h3buIZ3hnIdsEJxo5nJ2eEvW6Mc9MCc8ct/ir1zGD//4zZh7ZHTOTDCGETBHzdLVhmg0di1u3
 qsXcz0+MQGmXYBhSitw==
X-Proofpoint-GUID: miBjweQhE9ecM8tHr-yGcwmnSjd5PIbO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1OCBTYWx0ZWRfX3ZkhmYSKT63S
 /xCqnALvleF873MrQgIFbScHn/jBdJEr8NSBP1dGUythQiPoU5ZUzR1ttCj6AaQ25CHTQh60iuy
 LVH+7jS1ukoRpkoz+gZwC2rZ8tmcLqU=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a9526ba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=37CK-rImlAPP-qB_EOAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_000116_460471_CE934567 
X-CRM114-Status: GOOD (  16.28  )
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

T24gVHVlLCBBdWcgMjUsIDIwMjYgYXQgMTA6MTLigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMjUsIDIwMjYgYXQgMDY6NDY6MzlQTSAr
MDUzMCwgTWF5dXJlc2ggQ2hpdGFsZSB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDE4LCAyMDI2IGF0
IDM6MDXigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+
ID4gPiBPbiBNb24sIEF1ZyAxNywgMjAyNiBhdCAwOTozMjoxN1BNICswNTMwLCBNYXl1cmVzaCBD
aGl0YWxlIHdyb3RlOgo+ID4gPiA+IERvY3VtZW50IHRoZSBSSVNDLVYgUGVyZm9ybWFuY2UgRXZl
bnQgU2FtcGxpbmcgZXh0ZW5zaW9ucyBTc3Blc2EKPiA+ID4gPiAoUHJlY2lzZSBFdmVudCBTYW1w
bGUgQXR0cmlidXRpb24pIGFuZCBTc3BsY29maSAoUHJlY2lzZSBMb2NhbCBDb3VudGVyCj4gPiA+
ID4gT3ZlcmZsb3cgSW50ZXJydXB0KSBpbiB0aGUgSVNBIGV4dGVuc2lvbnMgYmluZGluZy4KPiA+
ID4gPgo+ID4gPiA+IEFkZCBhIGRlcGVuZGVuY3kgcnVsZSByZXF1aXJpbmcgU3NwZXNhIHRvIGJl
IHByZXNlbnQgd2hlbmV2ZXIgU3NwbGNvZmkKPiA+ID4gPiBpcyBwcmVzZW50Lgo+ID4gPiA+Cj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogTWF5dXJlc2ggQ2hpdGFsZSA8bWF5dXJlc2guY2hpdGFsZUBv
c3MucXVhbGNvbW0uY29tPgo+ID4gPgo+ID4gPiBXaHkgaXMgdGhpcyBzZXJpZXMgUkZDPwo+ID4g
SXQncyBiZWNhdXNlIHRoZSBzcGVjIGlzIHN0aWxsIGluIGRyYWZ0IHN0YWdlIGFuZCBhbHNvIHRo
ZSByZWdpc3Rlcgo+ID4gYWRkcmVzc2VzIGhhdmUgeWV0IHRvIGJlIGFzc2lnbmVkLgo+Cj4gSWYg
eW91IHNlbmQgbW9yZSBSRkMgcmV2aXNpb25zLCBwbGVhc2UgaW5jbHVkZSB0aGlzIGV4cGxhbmF0
aW9uLgpTdXJlLiBXaWxsIGRvLgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
