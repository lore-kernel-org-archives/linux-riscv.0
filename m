Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF31EFB7F3
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 04:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2utelixosjwbEJMiXkN9W1Ya2ZOmcSzSc+vy79Rg34=; b=TWPWO0dzPHyX36
	y0mcLXgcGDVTPWGvvycXroUYs/H3DNDqFdzcCk8/UB315B1MglNorTQv+lFo75femSqVQgO4U05nD
	6reTBiebfD9Y+lXbJACkomLIX3Ym5Bp+v2uhjx0addcaYWLe1LI7ifwmBKG8MmW6SJh16mSCRTdi+
	RmVByOjj+lz28j+51DzNKnpfHBcxQNkPxKR9Z4wLOqzy3P1b4c1nwZm7othNPO7Kf87O/Zd4lNkE5
	m03fcrHI26LwVGDxJmf5Ve5CBppztbAEa4GV7Y320LmiJ2sGPPkuKzgY7SvhPtMEG0lZG76G5qze4
	KBzxOUBSGI+bnU7DuM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vujbG-00000001Px8-335a;
	Tue, 24 Feb 2026 04:00:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vujbD-00000001Pwn-3Ml3
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 04:00:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3Ld072443816
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 04:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INx/molihhHqZGWte4bwl6SSiXEwkeQczSYBTTQ9yNs=; b=mENUZ1DinBf2jwkH
	MbHnWJ0pUOR3PjqttDa3Z50aD2kQJxivnHqtDIFkh6Inwhku7RdkgyIUBspU2GwN
	351Z3PHfeuINf2E3MWP5Jm15WKytNjqSyISd1YAmVqbHHq+69UGZSmk8Zt02952K
	EyVIR6HNVBzm6AeHwKY/8IWuW5lZGjoE1Ydq2LxJ60y+Sua6ntcyL2vnBXCOlbN1
	vvZOjmb5LOhQTNJMxZo/P7plQVnW3I+xaNsYqJ3hnmu2rLXo4OrxOrr+jlsZJxGb
	uupg5AF9+O1knhhJN/kVDzbhATJ43DOjSph0/JS7VHWSEVFhMlAHkaWg4NteI2C1
	iMRZsQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y2tgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 04:00:37 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4cdc32cdeso69753876a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 20:00:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771905637; cv=none;
        d=google.com; s=arc-20240605;
        b=H5am5BnEYVNOi2LiWKUzgBzD06fWN4tjBDtcN8sbvXIpbevQVDW6ZeVd/oAQ8JHBJ2
         FQh9VdDKZQGBfTHZb00kAq7N9WLpJPwP2Mg1PP7jaSz2xUnr0boOJiXegGNngdyHVNaa
         AUxcpcRMAgDWmtKfH/YZ3N3xeipF7G2N6zi74+2pHMish4MHWW5CZldViELfnFcRIip8
         aQYla7XBjHJX8Oyrw0uTPEIJ5CoreHTzbl6o1mDv5Lq7VjS3X9ItMV0m6MCpctjiKTaJ
         ae0bMvIhaKo5O7cjnQ4hsdzk3BfreN7scDm1JwySTC+vlwDDgUA1KZoRqJW2b2mewe41
         LVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=INx/molihhHqZGWte4bwl6SSiXEwkeQczSYBTTQ9yNs=;
        fh=KxxpG87eyZhsuELkctlJBpcOPHnJSqUK2LINvlKUc7s=;
        b=UNv+5bG5oytoxLkIZvR1JA6J/5zQzD1j1Ngb48nIlMExQqMOz0oqwRNky71cEL2YER
         IDOuVwZ13fRwfc+JF+EkbyWrtE+qsqTiVGeCzpw72r4x5eYqgM54nebOI6xhLJuAvoXc
         uI7LXDoNKIKNNFWXDOp1UlCqX0t/YW9yXk1v3uIlCfhCUDHhYVfB2vJsEzdokHAYorXn
         XTK98+j8d+TaDjAllCPQPlvDdlpqE/R8VwOnwydFmCeXZi9AY2UbnY2T3LmYSs8uk1fp
         sV8VUc0Si/xLrlWQcAo1flzfq6GrCZ/smbXTmje5GIxoyhdL/7pxCdGa0PSVWOyDVPjl
         FmFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771905637; x=1772510437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INx/molihhHqZGWte4bwl6SSiXEwkeQczSYBTTQ9yNs=;
        b=LVSfaX/RqyQAZz4Db+ECx/iOhd53HWf4uegE9Najc8jJfyQHBfOvIIOQNfIdn4iJBL
         pwSu8zfRBZBBBSBZECCX4Bkd0S54q6hioVhV3Fnyce4LKB5yyFqX88ARIfp9t6HhI4xu
         XBHVaTFx88zFmC+ICtfDKl0ZKOjr0JPmQABkFTf/uCsI1IffLS++FYec+pRuNOCYTK8I
         ZcpeM0YeD3Mzuh7OFlXd+nXbHebv3nW3wfcQYOAe3OBvzdZeYCEuigJJn2uESxFvHKTB
         3Ro6+m1tYAtXfrzPagOK07Wy686rcvcloGwUN2SdfJ5zTARXUeTTsUDhCmxahYYAdqsw
         tuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771905637; x=1772510437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INx/molihhHqZGWte4bwl6SSiXEwkeQczSYBTTQ9yNs=;
        b=cecKFwed9EsrUTaYynJpqdE7TnevgmuJWLsrFdnygQ3lZnKOhkulByWwl/l+lCPoGn
         zjSF2zYdZ6DZwLmiFBbl1PGQ+0U3oIdQiUEFjjOlp7e9ROcyO40mvTa7dGYqZXXQ18kH
         h46arh1yd0qitmWafbx+7cX8DBtrlEtRAlbUR2lOhXnqa0598tFkJiRKs4ch2I5Q5UJL
         gS6644zevx6TTszbKxBFPHOTOLKnLHMxgv0IgfFARcFGeZo66h5fZV7EgVFksxXGaZtA
         v/LoycJC1r5DR05L3L1e9q/qXPiPPqdLmm5vwKfj196gF7bIU2QVupDYi7jMHr69efZY
         SwLg==
X-Gm-Message-State: AOJu0YywXtK9d/O52QlPjtvcsPmmu0MQi+E9gk86gkAW0KvZOstJU0Um
	R5xQ1vYhfexblW5K23AqESQUz+13n4H3rTfAQpxoDp8vBHp9GnM6tUMMTG/CVu2EsmKCb4vka4v
	rruVBnURTPG0sxMx9em3l2bHYn1CUHaQ71A2rITUoieVpxtg5v827Cv1m4YEWbOdca12mYPs+eg
	XbsEy7onCffh0m9p+0TP6r5E5Sc7fCLlG1kK5ptbRl4yyqiA==
X-Gm-Gg: AZuq6aIV+xzF7E259l11Csj+CubA91LFkze7Xb+EZeFpF7C2mWvXqpwTbwc4MmkLSLb
	XQtS1ynC9TLONh7GeW+NxXdnzeTq90Ovgm6TJ4EAgEUjg3H2FvwqFEtKCmoBdWiziwVHZ4UgJl4
	AkWgCBjBVnQxq8bp6Wk8sTGu/uZVQ7UNqXpqvCgmC/pVP2/S72NezDxLadvYJFskL7RcuSXIYd3
	puhqco=
X-Received: by 2002:a05:6820:f027:b0:679:c801:89aa with SMTP id 006d021491bc7-679c8019062mr4209529eaf.13.1771905637240;
        Mon, 23 Feb 2026 20:00:37 -0800 (PST)
X-Received: by 2002:a05:6820:f027:b0:679:c801:89aa with SMTP id
 006d021491bc7-679c8019062mr4209517eaf.13.1771905636837; Mon, 23 Feb 2026
 20:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com> <20260223-mouth-plated-50294c7a6ac0@wendy>
In-Reply-To: <20260223-mouth-plated-50294c7a6ac0@wendy>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 09:30:24 +0530
X-Gm-Features: AaiRm53GEeaPIjJMTp0iHEB0_COLQqOtStOxwD5KmR7A6jrZABq-iciioVsEslc
Message-ID: <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfXzjoOpleatQhk
 HSwmEspAkqraFdB7tjMxCR9wnxRQaQe9IkdAif+G0ZDNCb9YsFnGfdCpdD9JOzgCB4ZTPfjeCfA
 6AtGFs8Jl+1UzxO/zLZfU/paCoemQRng7E/pcavgffIhKSVHASS6R2Q1x0wajMj0CXdN5MBPTpF
 RRfGbNQZ00OxrbfrxKofiEbKtccZP+uUa+UDrthiP4N9VzzsXS0JNpVMTt/EKqWZuyD/Y36cOuv
 jM0wGSCeyTIeoVdBfZ9owEclp2Kj/IEHsmLWFLUZKzhuFwneaByjB0XOFhRU3OS1H7G1k6sAPkM
 8lRD4PI7KtGTjNFwpDA4Ku2Rs0g4HFKKLwRkDNZ2YDnyf3Ez/SUYCeMlkHj8Mil8ej3kFVBZnuY
 D9pYGyqDXdmNgG68KZpcZk2IB4g4NILtRVh37E3joHfHPy/cJJmstfcz0hV/F07DsAPHoJsZi/5
 /P27kWkdTnb9DyiSakA==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699d2265 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=XYAwZIGsAAAA:8 a=cTGC0r_DHt5W8i4FB3EA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: sTLLMOfjRaDErEkSiHjXVNVW2wdmBpCM
X-Proofpoint-ORIG-GUID: sTLLMOfjRaDErEkSiHjXVNVW2wdmBpCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_200039_989361_95A07476 
X-CRM114-Status: GOOD (  20.89  )
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

SGksCgpPbiBNb24sIEZlYiAyMywgMjAyNiBhdCAzOjU14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAyMywgMjAyNiBh
dCAxMDoxOToxN0FNICswNTMwLCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+ID4gK3N0YXRpYyB2
b2lkIGluaXRfc2JpX2RidHIodm9pZCkKPiA+ICt7Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIHRk
YXRhMTsKPiA+ICsgICAgIHN0cnVjdCBzYmlyZXQgcmV0Owo+ID4gKwo+ID4gKyAgICAgaWYgKHNi
aV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9EQlRSKSA8PSAwKSB7Cj4gPiArICAgICAgICAgICAg
IHByX3dhcm4oIiVzOiBTQklfRVhUX0RCVFIgaXMgbm90IHN1cHBvcnRlZFxuIiwgX19mdW5jX18p
Owo+Cj4gVGhpcyBpcyBnb2luZyB0byBydW4gYW4gYWxsIHN5c3RlbXMsIHJpZ2h0PyBBIHByX3dh
cm4oKSBzZWVtcwo+IGluYXBwcm9wcmlhdGUsIGdpdmVuIHRoYXQgbm90IHN1cHBvcnRpbmcgdGhp
cyBleHRlbnNpb24gaXNuJ3QgYSBwcm9ibGVtLgo+IElmIHlvdSB3YW50IHRvIHByb2R1Y2Ugd2Fy
bmluZ3MsIG9ubHkgZG8gaXQgZm9yIDwgMCByZXR1cm4gdmFsdWVzIGFuZAo+IG1heWJlIHByaW50
IHRoZSBhY3R1YWwgZXJyb3IgY29kZSB0b28/CgpJdCdzIGNvcnJlY3QgdGhhdCB0aGUgYWJzZW5j
ZSBvZiB0aGUgZXh0ZW5zaW9uIGlzIG5vdCBhIHByb2JsZW0gYnV0IGFuCmluZm9ybWF0aW9uYWwg
bWVzc2FnZSBjYW4gYmUgaGVscGZ1bC4KU28sIEkgY2FuIHVzZSBwcl9pbmZvIG9yIHByX2luZm9f
b25jZSBmb3IgdGhpcyB3aXRoIHByb3BlciBlcnJvciBjb2RlLiBPaz8KClJlZ2FyZHMKSGltYW5z
aHUKCj4KPiA+ICsgICAgICAgICAgICAgZGJ0cl90b3RhbF9udW0gPSAwOwo+ID4gKyAgICAgICAg
ICAgICBnb3RvIGRvbmU7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICByZXQgPSBzYmlfZWNh
bGwoU0JJX0VYVF9EQlRSLCBTQklfRVhUX0RCVFJfTlVNX1RSSUdHRVJTLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIDAsIDAsIDAsIDAsIDAsIDApOwo+ID4gKyAgICAgaWYgKHJldC5lcnJvcikg
ewo+ID4gKyAgICAgICAgICAgICBwcl93YXJuKCIlczogRmFpbGVkIHRvIGRldGVjdCB0cmlnZ2Vy
c1xuIiwgX19mdW5jX18pOwo+ID4gKyAgICAgICAgICAgICBkYnRyX3RvdGFsX251bSA9IDA7Cj4g
PiArICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHRk
YXRhMSA9IDA7Cj4gPiArICAgICB0ZGF0YTEgPSBSVl9EQlRSX1NFVF9UREFUQTFfVFlQRSh0ZGF0
YTEsIFJWX0RCVFJfVFJJR19NQ09OVFJPTDYpOwo+ID4gKwo+ID4gKyAgICAgcmV0ID0gc2JpX2Vj
YWxsKFNCSV9FWFRfREJUUiwgU0JJX0VYVF9EQlRSX05VTV9UUklHR0VSUywKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICB0ZGF0YTEsIDAsIDAsIDAsIDAsIDApOwo+ID4gKyAgICAgaWYgKHJldC5l
cnJvcikgewo+ID4gKyAgICAgICAgICAgICBwcl93YXJuKCIlczogZmFpbGVkIHRvIGRldGVjdCBt
Y29udHJvbDYgdHJpZ2dlcnNcbiIsIF9fZnVuY19fKTsKPiA+ICsgICAgIH0gZWxzZSBpZiAoIXJl
dC52YWx1ZSkgewo+ID4gKyAgICAgICAgICAgICBwcl93YXJuKCIlczogdHlwZSA2IHRyaWdnZXJz
IG5vdCBhdmFpbGFibGVcbiIsIF9fZnVuY19fKTsKPiA+ICsgICAgIH0gZWxzZSB7Cj4gPiArICAg
ICAgICAgICAgIGRidHJfdG90YWxfbnVtID0gcmV0LnZhbHVlOwo+ID4gKyAgICAgICAgICAgICBk
YnRyX3R5cGUgPSBSVl9EQlRSX1RSSUdfTUNPTlRST0w2Owo+ID4gKyAgICAgICAgICAgICBwcl93
YXJuKCIlczogbWNvbnRyb2w2IHRyaWdnZXIgYXZhaWxhYmxlLlxuIiwgX19mdW5jX18pOwo+ID4g
KyAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICAvKiBm
YWxsYmFjayB0byB0eXBlIDIgdHJpZ2dlcnMgaWYgdHlwZSA2IGlzIG5vdCBhdmFpbGFibGUgKi8K
PiA+ICsKPiA+ICsgICAgIHRkYXRhMSA9IDA7Cj4gPiArICAgICB0ZGF0YTEgPSBSVl9EQlRSX1NF
VF9UREFUQTFfVFlQRSh0ZGF0YTEsIFJWX0RCVFJfVFJJR19NQ09OVFJPTCk7Cj4gPiArCj4gPiAr
ICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9EQlRSLCBTQklfRVhUX0RCVFJfTlVNX1RSSUdH
RVJTLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHRkYXRhMSwgMCwgMCwgMCwgMCwgMCk7Cj4g
PiArICAgICBpZiAocmV0LmVycm9yKSB7Cj4gPiArICAgICAgICAgICAgIHByX3dhcm4oIiVzOiBm
YWlsZWQgdG8gZGV0ZWN0IG1jb250cm9sIHRyaWdnZXJzXG4iLCBfX2Z1bmNfXyk7Cj4gPiArICAg
ICB9IGVsc2UgaWYgKCFyZXQudmFsdWUpIHsKPiA+ICsgICAgICAgICAgICAgcHJfd2FybigiJXM6
IHR5cGUgMiB0cmlnZ2VycyBub3QgYXZhaWxhYmxlXG4iLCBfX2Z1bmNfXyk7Cj4gPiArICAgICB9
IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICBkYnRyX3RvdGFsX251bSA9IHJldC52YWx1ZTsKPiA+
ICsgICAgICAgICAgICAgZGJ0cl90eXBlID0gUlZfREJUUl9UUklHX01DT05UUk9MOwo+ID4gKyAg
ICAgICAgICAgICBnb3RvIGRvbmU7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArZG9uZToKPiA+ICsg
ICAgIGRidHJfaW5pdCA9IDE7Cj4gPiArfQo+Cj4gPiArCj4gPiArdm9pZCBod19icmVha3BvaW50
X3BtdV9yZWFkKHN0cnVjdCBwZXJmX2V2ZW50ICpicCkKPiA+ICt7Cj4gPiArICAgICAvKiBUT0RP
ICovCj4gPiArfQo+ID4gKwo+ID4gK3ZvaWQgY2xlYXJfcHRyYWNlX2h3X2JyZWFrcG9pbnQoc3Ry
dWN0IHRhc2tfc3RydWN0ICp0c2spCj4gPiArewo+ID4gKyAgICAgLyogVE9ETyAqLwo+ID4gK30K
PiA+ICsKPiA+ICt2b2lkIGZsdXNoX3B0cmFjZV9od19icmVha3BvaW50KHN0cnVjdCB0YXNrX3N0
cnVjdCAqdHNrKQo+ID4gK3sKPiA+ICsgICAgIC8qIFRPRE8gKi8KPiA+ICt9Cj4KPiBUaGlzIGlz
bid0IGFuIFJGQywgd2h5IGRvZXMgaXQgaGF2ZSBUT0RPcz8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
