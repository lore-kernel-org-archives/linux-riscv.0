Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34674606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kwen55bV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MveGXrNU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N/OG3jcJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gANmDQ46bgc0ASLkhb7GQjoSUN4kBYj6q9sjxeJPDlg=; b=kwen55bVmSKjcnh52diGySLJq9
	XI/vrYwvifVov+DKCBb31DDaCMGs16LUcByrxGFx3pHQueQ4+3sF0XfkbU9fV2N4m3Fzy+PoxEapz
	leqIih/EEexIoxl4WHqbvf+kfs+/GVA/5A1svnvz+36TmBwvV35M20lihLue2W9gro+UIas1vOiMm
	CU39jrqEFLrTWa0Mdr8BXD8mzKY8tzeaxvdpIYWfIWLDFH+T2WTMYQDRjHdAD7vdszeAvWS6G8pH9
	28daHqCHHmPYrAGib+k/QT/xFBsXfd8+m/OEe8OEXQU3n0P1OZQnVGY7E8/cXOpOo1ZPRA7hsf+/i
	aX5GF8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEro-0000000ALBM-0MIf;
	Wed, 25 Nov 2026 15:25:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWErW-0000000AL4i-36B5
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 15:24:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMKfG1396274
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIYZYd3o/tNv9e79fiRmovS4XRBJcwrqybTUeeJB7F4=; b=MveGXrNU9rvAmn6V
	xyXMLjH+LeWkmnYw5sO0/5LIzFGhJKO6bnj+DlEI27vePJbVd0hXi74Bktgvxg/7
	qTXu93gmDfo1mniLpECQMDNfQAraAs2gSciu6wtyvKkg5MYR5NR1xIuon3fFcysa
	vweMynCEphOviJ2FslE5q5pFdHKX8Vs7EQnRWvJuSHd11zkB/LMkPjB7+cJb0Jub
	X0GKLuGzzobTNolJ/29eZLg5253HUI1rBQHw6o8FEoIQO4X6XyRIjozhWIYI+OOA
	IDrSIbUznKwH2Byn5AsoGh7SuEsRWGvb4b832YXkS3/gvvFl3idyej/aVE7siMXh
	XdEvLA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rubr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:24:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0467a525eso45121195ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 07:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620285; cv=none;
        d=google.com; s=arc-20260327;
        b=oXFWVx/U+jM9y5im9YxGn0R6SejH0GUMFl5BWsPfJZ8uUu2fkhvNyMi7YLvd/jEiiZ
         gXr8G2Nk4xmIsmQGZEErRab4wq8QqwucnwucMsO58dA29FTR5dckjga998hlOtnEYOz6
         L8ZEAxe2T9rjwEEZxoNfxGhmgXhpdOTWY3SxAIv0w7gvZ+x26Bbl3AVu9JUVzD0xy2i2
         sUXAJlQcohARPI5+1sd+LViwg/m/8WTSFt9BX95lfOszNGOi0kZTZglWG9XgOnQn0lZu
         Q311KKYTqKZNvjtpkZTun30kuIV5yTPD0MyiGgcxvTf9HjL8drCZBmNOJvDbGShGHEgZ
         yipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QIYZYd3o/tNv9e79fiRmovS4XRBJcwrqybTUeeJB7F4=;
        fh=HLq/QseLSdweYJ5KsKQ37XI5SCCxRvGoauOYSLLtoX4=;
        b=nth9sIDpOJ9ezvat9FfywGOo0ePW90lSIG2c9xQAOM9tEK+cGh9aZrsBXZIIlTOgCD
         /1QF/euEXeApwwlUcoOa8wahn5YqETc0rfcC9lw74D2sWEy/H5V/xlUJ/hRSiJSC6zS2
         gildZBFANgivmg5fKLTawox72Dh1CPuzI6pl5WoaIpllyj3H49INZfV8YjukYZRrd/El
         E/lNx9trXaLhCcjBUHshmPixeH1L/VSuFOAMsDteRr6t9t26+4FQQU5lmjyca8GYcEde
         Z78FFtjBUFR9TjsmoDy+cPmzweQTQnVo92S7VqqFfxAORCNocxng0hty5GG+ajhCoUee
         F9hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620285; x=1796225085; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QIYZYd3o/tNv9e79fiRmovS4XRBJcwrqybTUeeJB7F4=;
        b=N/OG3jcJaINycykGL76L3P/3rt58Wa/MMYlNHNW6bE5hBEv0QP5HR/pFBenmS72mb2
         YOcYIJZKJOIthKV5nSAkolK42QrVTDbY4e+rNq4Rfh0voRk2Z8ldQkmlV8uAe+Yovx9y
         GpXFEN+SSg1fgOlx6LKvO4eT/Df0c0G6P7RXDn25qpJQoVXR8RmiAMInPTNZ/bzQBCtt
         ZqdKiR8lwUeSlVwYs6P4YWcm+Tfi/mnim7xrn0TTrk5ZaYvXXusUnUmgs0KD3lx7Z8Qu
         eUluS3SD4V24ABRxVtYwsKyHiO1piAuc+YgjSRqMKAs2bwFxr+Drc8vi8SB0zol+uX+C
         vZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620285; x=1796225085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIYZYd3o/tNv9e79fiRmovS4XRBJcwrqybTUeeJB7F4=;
        b=UKpUR9QmHx+bzvatEe5J5UlsiEkXI3xUnxxHQ18unqM5lTPP1v/8oJR5RcQ3RJuXU5
         J1spjZEcinAoK+F6s325XC3hn4jtAhme7pQgAkq/Yrp//aNZcByUiLvxKj4FCQbM3cti
         PZNV7O7n49AFU11qJO1PxI1Uj4gL1rPf8Q4vd5mfpm/Mko19I3B+giUSBaGIBsFPDLeZ
         a+1YDs8KPxGv1VBNI6QWTf+rwV7NVKQEsnIpV9mJpcNYNohAn9pW2SwyaKlyNIVEJ5eM
         6qODp315fVUIcFC/J9iaMyIf3wtNiSm3wbuqpr3Ungq3n2gs4MM+0cOFpxoQDMs69L2p
         5Ocg==
X-Forwarded-Encrypted: i=1; AL+hErGDgzlL2tLnRuFk85APzzdVYVWIf5vKgJgDmTDE0kM2f51S6K7j1AFz7kpxnXbYZbUEG/qSQtAd4Xx+pg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+SCI2QxYADZUW+U40WFUdOta8ba+Cc2VnQUZhpm9AjGT74/hYK
	0sYk8s1jqbJNGuSjvC/vIUTz4I0jAoIGcHuAcx8a812GDv3tto0HlQTQxm7csvz9zLbNQ7lk+pC
	hF5G/xtex79sfIFUmyJjj9MujE4mV7m8WeLnNJN6h5iBNRhXpauDDR2Ph+sWi+FbQLdygLGWxFT
	onEijnncqyzb74+rhzXHk+1VlfLEAgv5C0Z+st6fmHZ9jSsQ==
X-Gm-Gg: AZFdTZddD8jd106zYZ0UvLQjwhYTotcOl4gmS6Vvi9Xrlmgty3ToS7Gkrycajq4rCTG
	URJDltIdgyyamcLu4o93GM6cea85y8icCi4C7h1VBfc7g2J49R2CF0EBFJIn7UgVVEIWh8SP+8q
	ZdSvtfBVN/S4hQfhXX4xNRU6YSfTlhjDuV5qdQtIKPl0warrTyRiZC+r1lMQ==
X-Received: by 2002:a17:903:4b07:b0:2ef:de9a:e59 with SMTP id d9443c01a7336-2f03f1a1767mr166368905ad.23.1795620284608;
        Wed, 25 Nov 2026 07:24:44 -0800 (PST)
X-Received: by 2002:a17:903:4b07:b0:2ef:de9a:e59 with SMTP id
 d9443c01a7336-2f03f1a1767mr166368535ad.23.1795620283988; Wed, 25 Nov 2026
 07:24:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-04-k3-pm-support-v5-0-42394acdf3e3@kernel.org>
In-Reply-To: <20261118-04-k3-pm-support-v5-0-42394acdf3e3@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:32 +0100
X-Gm-Features: Aa3M54olEAoYIpHYojNK94sf0JF_SRHhMMcIhjtuJGmTJ5tnlyfF1zWJRLUcNAA
Message-ID: <CAPx+jO-TqhmF=vwSveSQk0ayUKf9M9fSDBYygTx3uTdQ5QHSHw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PM: spacemit: Add power domain support
To: Yixun Lan <dlan@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX3WDPAxi9eYTl
 iI2sOBYcaZ63LSD9ds6hdW0anfONcvI9frjKDaTm37qGpVecyawGYL9fNKQ4u4JB7ua8P5nJOaS
 eH0cgkxo/e0crj8AnpTwIVSmIL+S139shkpvTRNnOv+sPj1L6/rsR1ZtKn/vyhiohQqLTR0KxQ+
 9GdJGF2mO+c3xhneKza9b08KnDewdhe7xn7kuuqtICR/I64Ymkrvn5RHqBwy44p0rUoW1TvSSh2
 Q6bLFr/T+yTsSy7DfwCJD8nyOUCaLsJFTdcgm8lCDZZhjaH3kxE5zgAnCBZam0wLieIWjIIkvT3
 ta/T/42+izHE0I7Q+MSU3XSJ1qwz58JDPR8buEbsnlvB0AxVP2aUAwMzDPnh12X+NfiLUkVXC9H
 NC6SrZIlnP4oGJUj/xfvWROxUxLc7vsIj06L7+pC8c5GAkaluF2z7unjih3gffOTUa77gk8XFMx
 kdE83lx5shblD0xLrkw==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06fdbd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8
 a=CDiEhUVfAZlwq9Ebo7kA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: LCUow7RH2l1SVJ7yqLAZ2zTjF9Xh6Iph
X-Proofpoint-ORIG-GUID: LCUow7RH2l1SVJ7yqLAZ2zTjF9Xh6Iph
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX8rn4o0NLYsvO
 f+e40TXmdO2//KsyQgBQE4HIdWGiDFJIfgG44ynHtesPAJAY5Qa7wKepO2sBTL9VI0uvL2J2CrQ
 i5EhOYpyaOGQP/zeeGb6y3xTBHTP7GU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072447_361307_59C3A5AD 
X-CRM114-Status: GOOD (  31.39  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMTI6MTPigK9BTSBZaXh1biBMYW4gPGRsYW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBJbiB0aGlzIHNlcmllcywgd2UgdHJ5IHRvIGFkZCBhIFBvd2VyIERv
bWFpbiBkcml2ZXIgc3VwcG9ydCBmb3IgU3BhY2VtaVQKPiBLMS9LMyBTb0NzLCB0aGUgZHJpdmVy
IGltcGxlbWVudCB0aGUgcG93ZXItc3dpdGNoIGZ1bmN0aW9uYWx5IHdoaWNoIHN1cHBvcnQKPiBw
b3dlciBvbi9vZmYsIGFuZCBpdCdzIGJhc2VkIG9uIExpbnV4IEdlbmVyaWMgUE0gRG9tYWluIGZy
YW1ld29yayBhbmQKPiBzaW1pbGlhciB0byB2ZW5kb3IgSzEncyBpbXBsZW1lbnRhdGlvbiwgYnV0
IHVubGlrZSB0aGUgSzMncyB2ZW5kb3IKPiB2ZXJzaW9uIHdoaWNoIGlzIG1vcmUgY29tcGxpY2F0
ZWQuCj4KPiAgIFRoZSBEVCBkb2N1bWVudGF0aW9uIGZvciBQb3dlciBEb21haW4gYWxyZWFkeSBl
eGlzdCBpbiBiZWxvdyBmaWxlLAo+IGFuZCBBUE1VIGFscmVhZHkgaGFzICNwb3dlci1kb21haW4t
Y2VsbHMgcHJvcGVydHkuCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9z
cGFjZW1pdC9zcGFjZW1pdCxrMS1zeXNjb24ueWFtbAo+Cj4gICBUaGUgcHJldmlvdXMgRFRTIHBh
dGNoIGlzIG9ic29sZXRlLCBzbyBJIGRyb3BwZWQgaXQuIEZvciBkZXZpY2VzIHJlcXVpcmVkCj4g
UE0gZmVhdHVyZSwgaXQgbmVlZCB0byBhZGQgYSAicG93ZXItZG9tYWlucyIgcHJvcGVydHksIGFu
ZCBzaG91bGQgc2VuZCBpbgo+IGEgc2VwYXJhdGUgcGF0Y2guCj4KPiAgIEluIG9yZGVyIHRvIHRl
c3QgdGhpcyBzZXJpZXMsIGEgcHJlcmVxdWlzaXRlIENDVSBwYXRjaGVzIGFyZSBuZWVkZWQsCj4g
d2hpY2ggY2FuIGJlIGZvdW5kIGhlcmUgWzFdLgo+Cj4gSGkgVWxmLAo+ICBXb3VsZCB5b3UgYmUg
b2sgdG8gdGFrZSB0aGlzIHZlcnNpb24/IG9ubHkgbWlub3IgY2hhbmdlIHVwZGF0ZWQuCj4gSSB0
aGluayB0aGUgc3VkZGVuIHJlbW92YWwgb2YgcG1kb21haW4gc3VwcGxpZXIgaXMga2luZCBvZiBh
bgo+IGluZGVwZW5kZW50IGNvbW1vbiBpc3N1ZSAoZXhpc3QgaW4gb3RoZXIgcGxhdGZyb21zIHRv
byksIEkgZG8gbm90Cj4gd2FudCB0byBhZGRyZXNzZSBpdCBpbiB0aGlzIHNlcmllcywgc2VlIGEg
cG9zc2libGUgc29sdXRpb24gaW4gc2VwYXJhdGUKPiBwYXRjaCBoZXJlIFsyXSwgb3IgSWNlbm93
eSdzIHByZWZlcmVuY2UgaW4gY29tbWVudFszXSwgb3Igd2hhdGV2ZXIKPiB3YXkgdG8gdGFrZS4g
SnVzdCBsZXQgbWUga25vdyB3aGF0IHlvdSB0aGluay4uCgpJIG1hZGUgYSBjb21tZW50IG9uIHRo
YXQgYXMgd2VsbCwgYnV0IEkgYW0gZmluZSB3aXRoIHRoaXMgYXMgaXMuClBsZWFzZSBtYWtlIGEg
Zml4IGZvciB0aGUgdW5iaW5kL3JlbW92ZSBwcm9ibGVtIG9uIHRvcC4KClRoZSB2NSBzZXJpZXMg
YXBwbGllZCBmb3IgbmV4dCwgdGhhbmtzIQoKS2luZApVZmZlCgoKPgo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3NwYWNlbWl0LzIwMjYxMDA4LTA0LWszLWNsay1wbS1hdXgtdjEtMC04
MzcyZDczMDc2OTRAa2VybmVsLm9yZy8gWzFdCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvc3BhY2VtaXQvMjAyNjExMTItMDEtcG0tZGV2aWNlLWxpbmstdjEtMS04OTMyZTA4NjIzNzhA
a2VybmVsLm9yZy8gWzJdCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvc3BhY2VtaXQv
YjdkN2FjMmVlZTBlNjRhYTdjMjY3ZGVmNWMyYThhMDIyYzdkYTQyNS5jYW1lbEBpY2Vub3d5Lm1l
IFszXQo+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPgo+IC0tLQo+
IENoYW5nZXMgaW4gdjU6Cj4gLSBkcm9wIHBtX2luZGV4Cj4gLSBmaXggZGV2X2VycigpIHRvIHJl
dHVybiBlcnJvciBjb2RlCj4gLSBMaW5rIHRvIHY0OiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsv
MjAyNjExMTItMDQtazMtcG0tc3VwcG9ydC12NC0wLWRlMzkzMWFhNTE1M0BrZXJuZWwub3JnCj4K
PiBDaGFuZ2VzIGluIHY0Ogo+IC0gYWRqdXN0IEtjb25maWcgaGVscCBtZXNzYWdlCj4gLSBkcm9w
IHVudXNlZCBpbmNsdWRlIGhlYWRlcgo+IC0gcHJvcGFnYXRlIHJlZ21hcF9yZWFkX3goKSBlcnJv
ciBjb2RlCj4gLSBzaW1wbGlmeSBzcGFjZW1pdF9wbV9pc19vZmZfc3RhdGUoKQo+IC0gTGluayB0
byB2MzogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYxMTA4LTA0LWszLXBtLXN1cHBvcnQt
djMtMC1iOWRjMDg1NzAzOWJAa2VybmVsLm9yZwo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIGNvbGxl
Y3QgdGFncwo+IC0gcmVuYW1lIHNwYWNlbWl0X3BtX2lzX29mZl9zdGF0ZSgpCj4gLSBpbXBsZW1l
bnQgYSByZW1vdmUoKSBmdW5jdGlvbgo+IC0gdXNlIHByb3BlciB0eXBlIGluIHN0cnVjdCBzcGFj
ZW1pdF9wbV9kb21haW5fcGFyYW0KPiAtIHJlZmFjdG9yIHN0cnVjdCBzcGFjZW1pdF9wbXUKPiAt
IExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MTAwOC0wNC1rMy1wbS1z
dXBwb3J0LXYyLTAtNmY3NzhhNTNkZDJkQGtlcm5lbC5vcmcKPgo+IENoYW5nZXMgaW4gdjI6Cj4g
LSBjb252ZXJ0IHRvIGF1eGlsYXJ5IGRyaXZlcgo+IC0gbm8gbmVlZCBkdC1iaW5kaW5nIGRvYywg
ZHJvcCBpdAo+IC0gZHJvcCBkdHMgcGF0Y2gKPiAtIHN1cHBvcnQgdG8gYnVpbGQgYXMgbW9kdWxl
Cj4gLSBzZXQgYWx3YXlzIG9uIGZvciBLMyBhdWRpbyBwbQo+IC0gbm8gZ2xvYmFsIHZhcmlhYmxl
IGZvciBzdHJ1Y3Qgc3BhY2VtaXRfcG11Cj4gLSBubyBmb3JjZSB0byBkbyBwb3dlci1vZmYgaW4g
c3BhY2VtaXRfcGRfcG93ZXJfb24oKQo+IC0gY2hlY2sgcmV0dXJuIHZhbHVlIG9mIHBtX2dlbnBk
X2luaXQoKQo+IC0gYWRqdXN0IGxpY2Vuc2UgaGVhZGVyIGZvcm1hdAo+IC0gTGluayB0byB2MTog
aHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwOTE4LTA0LWszLXBtLXN1cHBvcnQtdjEtMC0w
YWNkMmIzNmI5NmZAa2VybmVsLm9yZwo+Cj4gLS0tCj4gWWl4dW4gTGFuICgyKToKPiAgICAgICBk
dC1iaW5kaW5nczogcG93ZXI6IHNwYWNlbWl0OiBBZGQgcG93ZXIgZG9tYWluIGNvbnRyb2xsZXIg
SURzCj4gICAgICAgcG1kb21haW46IHNwYWNlbWl0OiBBZGQgcG93ZXIgZG9tYWluIGRyaXZlcgo+
Cj4gIGRyaXZlcnMvcG1kb21haW4vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgICAx
ICsKPiAgZHJpdmVycy9wbWRvbWFpbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwo+ICBkcml2ZXJzL3BtZG9tYWluL3NwYWNlbWl0L0tjb25maWcgICAgICAgICAgICAgICB8
ICAyMSArKwo+ICBkcml2ZXJzL3BtZG9tYWluL3NwYWNlbWl0L01ha2VmaWxlICAgICAgICAgICAg
ICB8ICAgMSArCj4gIGRyaXZlcnMvcG1kb21haW4vc3BhY2VtaXQvc3BhY2VtaXQtcG0tZG9tYWlu
cy5jIHwgNDIyICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2R0LWJpbmRpbmdz
L3Bvd2VyL3NwYWNlbWl0LGsxLXBvd2VyLmggICB8ICAxNCArCj4gIGluY2x1ZGUvZHQtYmluZGlu
Z3MvcG93ZXIvc3BhY2VtaXQsazMtcG93ZXIuaCAgIHwgIDEyICsKPiAgNyBmaWxlcyBjaGFuZ2Vk
LCA0NzIgaW5zZXJ0aW9ucygrKQo+IC0tLQo+IGJhc2UtY29tbWl0OiA2NjI4ZTdkNGM2YjI1Yzhk
MThmMTM0NWUzYTIwZDIxODI5YWFlN2U0Cj4gY2hhbmdlLWlkOiAyMDI2MDkwOS0wNC1rMy1wbS1z
dXBwb3J0LTBiZWY0MGU4N2ZkNwo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gWWl4dW4gTGFuIDxk
bGFuQGtlcm5lbC5vcmc+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
