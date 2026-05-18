Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C57CD4F3D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 03:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKIEG5WJWne1fA96ALIrsE96aR6atFY60oM42wDJTWE=; b=zzc921U4EXQgZm
	cYPnpMlFwP6Lq1GaQEdPGUu5V/zQh5vbUP94UmfD/nLb0Y+s+SUBvvAQ12b/tzPSqW92Tm9BI7aPS
	6kc1iPpnyFghTBSvrV+byNDvKIbEXtf2pvN6U3fdHm3X/J5G2J6cfduqCtrsLJgyF6qfXpX9zzAlH
	qMjITFuSyjbJ04ik/OGHzR4Fe+DVUvNaqFYQBReiEySGbSKb4FAWSVVtGoI2LvL7AtawX9ZZvApFK
	Pxi/Q64j9b1D7FXeREQpK0cdk/ekTIGOyioCNCZydFCKcDULh861QltMWj+8oWQLY0tkCDOkZzwo2
	+2PqyzOQoG4Xf/96a/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoJm-0000000E0tb-0kiF;
	Mon, 18 May 2026 03:06:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoJj-0000000E0sz-1s0z
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 03:06:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I1tK061697510
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 03:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X708K6u8SzSx52/GxLg4ntRNIqhO0X/cHHFOcijQWfw=; b=mAEEYiqLjDj3ISSj
	U5DTIyGChBAQ/hDH6mDWkV6zMwT8BOQuX2+8nzAyS9aaOYA0uF35nWjqMAnPO9CO
	kDURFnlI2SvtZVFtL2PMfoSaJwmZkWBzsUTC0cnUSVkhA6e+rZcH8vMNrK/YHxrv
	NjyQV02h7yktq+80nCCu2aPwj3jeGUzsnYijL010Z5NCWM+E7/iezZiQ9ZVkGZxV
	ha8zvgvtHH05doMuKKYrYfQ1p2puHZypDxlp6iANSMc14+Muu/dft+LVBA/Wk8wG
	yqDsVg+F2SCwMf70CJ/xSX5we1QXkH4hbl5d3oaco9SCSGaPGCmTXgUiPaYuclDx
	2WjEtQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g47re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 03:06:54 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dbb6b95836so4773990a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 20:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779073613; cv=none;
        d=google.com; s=arc-20240605;
        b=f23zkeuK8U/lBEiO2lm/ydINglbrNm3ajnkP6rLkcNCKX8dcn92VCN282Xq5AIxjXG
         aXS4VnaBucrcPMJ/hMGRoBfoBjszcVUCTET4Yqt9FnEfdLZITtwiqLxNa0v/CyB/zh3g
         C6KkLyH+ZD3IuipaP0b28FGBWphzbv9fgb4b3W6GC9ycQ1G2DAUCD9uVhJwdUvUBb5C1
         SeOfVVxaGnCqTdE1rqm6QljN0FDrAHeXwSSk1GFeyikCGBc5dJ7pMaEdcJulGKGZxzZz
         WgRCzMxnJ7as159uOq7zQDx3bRyM8JP7Ooyp0TXTasj7VGfs8v//bGjngYNAkOX2jXw/
         OuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X708K6u8SzSx52/GxLg4ntRNIqhO0X/cHHFOcijQWfw=;
        fh=VmeJUPhBia7p05iWIXDJeCxVTDx9Fi5EyaowkPJWKmc=;
        b=SgpBx/owFQBEefuI2TLVUzga59q++G6Z4FmiXR6XwmVB0UXGeNGwOm2KjgB6X47dpf
         O+mXg4sH7WOwO545VVRaZw0N3KO6rRVpNU026oE8zyr7fEk5y8FOY4ZORycVb/KU9fhA
         YD00WyWGHBWHK9kd377fi3BQ2ZmrlS/eb65lP1D+9fptuaAUdpI9PJsZEtkTtSWR5ZzA
         HhQIK6GOQaf6dpO0wK1jNi8wwJayHclzW9x+94FbEtlfasUjJjFLLlx1svCpJXwYBEFw
         t41zEce9ony4ZvJrBS8Mx6uP179E2ajo8BiPTQvK3OYHweEnF01qu7wRI2F73IDEL7HO
         kOnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779073613; x=1779678413; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X708K6u8SzSx52/GxLg4ntRNIqhO0X/cHHFOcijQWfw=;
        b=a+UZvvLc86QjPbtIRjxBWqg6OjyyPTfT39zv9KzSS2mq2ItOoJZodaHckfCYXhlUaB
         y0Il+TcBGSMpKGQtMgHneIvjDmtTckL0VfXtJlTfolebFxh19vcXnt+3MlRS4wrGvB7E
         YqJ2sAvwPuujOa1JjPV2keHiPdrHd4Ohm/67rVYMUxmIX7Orq9CAMQ/+zi8Ald8gq6JN
         EE10uLGGQT8a6v28coMVhkHiuPr+MLP2kN278Hy6yoHjBdvdntHKYNpAO7vGr7UC8x8D
         5jnXTvhg0zVQG18M6HWwFtVpEz6MN2nfL4Q8bOwUjLl42gPbjPygOPktEd12CLUYHOzt
         IplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779073613; x=1779678413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X708K6u8SzSx52/GxLg4ntRNIqhO0X/cHHFOcijQWfw=;
        b=WouOfrxgbDglS5ZFviy41QV57ppgzArLETfm8A1XSZvAkJth6YI2yHMrpDJ6oMC1Ce
         TDeZa0+UHMjQtG2FUrT5N2kWGITLMcXUhPoV/B7Cb4v3waDLEB6ZhMeQeCrfwFUUE7bC
         J5kJ9EAD0cJw4bGZj45Xtdkxsmfue/ACbIhrYU1WxgbjiNXNDz3cAPvAK40im0a+tG2y
         +FHiTfP4dAHgyFjjBxDtrp940GjCPd+RCEa7xIDF8bxbOAU3aAO2pvxrq0j6DCuxZV3i
         YS0WHuJi8C/JFGwAj/mWQuPpL6d25NlcLtNKpamDC6UTb6obIvOkGUvaAK1bRmH4Vla5
         nWEQ==
X-Gm-Message-State: AOJu0YzT1QTl0gQ3YTF/MwGQ9Wv8u/eV7ma4WNpH5rFHYv8dsiJavDc8
	aPlfPJKK6kmDcla34cXzfdM8uls6Ea8Nt6D04+OLXwHc9THZq11V9MnyGe8Iext2hKUqjcdQR04
	q4q0sOspqyvYQNwjw6FmT7Rju0wwg71XHt3YosUW29PEIULS/jX2aa9QaX+uQH4sCIxqhFWwyFB
	Gom4pbAsMXuMpunI2v8Xyex0hiEC4dEI70YDqwXSfeb7owNg==
X-Gm-Gg: Acq92OFbzLDEJqIAi5ebjR9BLYheCrwokEcvf45r7BlX9oaQo+NVGHO6a/TpRuTOtRC
	8eU/ABL7hx7UIFUdm3ArAvRE0J7ozpB2qyomp9lJCCNDmNn9lE1A/gxvCp+8O/Sad/kIOYLoUBl
	0AHQ2gDeadeLPCyeDJCxvUvC5XX92RgMGlY77rFMiCls9SQUmxWzQ5u/0596AM6aekzS8CZD/cS
	wv1s8DK/xnFrmGtww==
X-Received: by 2002:a05:6830:828b:b0:7e3:7697:9b5a with SMTP id 46e09a7af769-7e4f2b9bfd7mr9164820a34.18.1779073613226;
        Sun, 17 May 2026 20:06:53 -0700 (PDT)
X-Received: by 2002:a05:6830:828b:b0:7e3:7697:9b5a with SMTP id
 46e09a7af769-7e4f2b9bfd7mr9164792a34.18.1779073612814; Sun, 17 May 2026
 20:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
 <20260513084325.2176952-4-himanshu.chauhan@oss.qualcomm.com> <CAJZ5v0g2kjfAvcTzp8898A8HdMymU1SQ-rHW_DFhZP49c9=s5Q@mail.gmail.com>
In-Reply-To: <CAJZ5v0g2kjfAvcTzp8898A8HdMymU1SQ-rHW_DFhZP49c9=s5Q@mail.gmail.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Mon, 18 May 2026 08:36:40 +0530
X-Gm-Features: AVHnY4IXHSTvGb4jHkiTrfKvQSC_eyAqKXiBE4l4KpJ5S_P8fZyP7mnKGJ0aI8I
Message-ID: <CA+Ht8=YbMLXnCFtoyVosrjS56ye_bUp16awgxnXkEmHB4_5_Dw@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] acpi: Introduce SSE in HEST notification types
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAyNiBTYWx0ZWRfX4M76kJYSvXyv
 gBNWCWwjEaQC3hqJ/+03A9FRqcT35onCEzqSMzmwJOYwPJI1ayMeRekPwghH2VL1oxNwvkuS3Zf
 iUxIEXQy+9T5xvceLvFSBd+ypODKuYrXIP5zj1r9AL/F03985IUPk4c/8Pv5x/PFhzftFW4/pB0
 qzwm6WWhLRDqpPYrqJR86z9MCKreazjl/sGvbxiLGPZSx/tOX5PcO0OWxgidammMohN2Dbjq5o/
 sOQ4fIcEUhdogwHJsXR5i+oLKv6JIxHWSvJb7TNzigYIoHvI3w9GDd5RlClTgIHkMnPHFuxFR+C
 Xzm/kXXsxmGiphORYl4Cwy16wUR3kedv1loV9xvmsgftmLRmUKzcyRMjQqOPYzTJaXZk5wSWCFv
 zbvknlcTPn0VZn83UuGMnHvxruFiLOJtZnU8tIUZR80uTCI+daTeduEKV9l4Kx9tTURvISF1cqi
 0CD5MgsHhIWOUFdV7rg==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0a824e cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=h0uksLzaAAAA:8 a=sBTH58jHExCepGOTGfcA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-GUID: vJ_8GsZI47sOKasC8akUQBbU6lGCUh0d
X-Proofpoint-ORIG-GUID: vJ_8GsZI47sOKasC8akUQBbU6lGCUh0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_200655_493812_D5E4A178 
X-CRM114-Status: GOOD (  25.45  )
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

SGkgUmFmYWVsLAoKT24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTI6NTbigK9BTSBSYWZhZWwgSi4g
V3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMTMsIDIw
MjYgYXQgMTA6NDTigK9BTSBIaW1hbnNodSBDaGF1aGFuCj4gPGhpbWFuc2h1LmNoYXVoYW5Ab3Nz
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSW50cm9kdWNlIGEgbmV3IEhFU1Qgbm90aWZp
Y2F0aW9uIHR5cGUgZm9yIFJJU0MtViBTU0UgZXZlbnRzLgo+ID4gVGhlIEdIRVMgZW50cnkncyBu
b3RpZmljYXRpb24gc3RydWN0dXJlIGNvbnRhaW5zIHRoZSBub3RpZmljYXRpb24KPiA+IHRvIGJl
IHVzZWQgZm9yIGEgZ2l2ZW4gZXJyb3Igc291cmNlLiBGb3IgZXJyb3Igc291cmNlcyBkZWxpdmVy
aW5nCj4gPiBldmVudHMgb3ZlciBTU0UsIGl0IHNob3VsZCBjb250YWluIHRoZSBuZXcgU1NFIG5v
dGlmaWNhdGlvbiB0eXBlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IENoYXVoYW4g
PGhpbWFuc2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBDbMOp
bWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2Fj
cGkvYWN0YmwxLmggfCAzICsrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hY3BpL2FjdGJsMS5o
IGIvaW5jbHVkZS9hY3BpL2FjdGJsMS5oCj4gPiBpbmRleCBmNzJlMDA1MTdlYjMuLjJhODE2Nzk3
OTQ1OCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvYWNwaS9hY3RibDEuaAo+ID4gKysrIGIvaW5j
bHVkZS9hY3BpL2FjdGJsMS5oCj4KPiBUaGlzIGlzIGFuIEFDUElDQSBjaGFuZ2UsIHNvIGl0IHNo
b3VsZCBnbyB0aHJvdWdoIHRoZSB1cHN0cmVhbSBBQ1BJQ0EKPiBwcm9qZWN0IG9uIEdpdEh1Yi4g
IFNlZQo+Cj4gRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2FjcGkvbGludXhpemVkLWFjcGljYS5y
c3QKPgo+IGZvciBtb3JlIGluZm9ybWF0aW9uLgo+Cj4gSWYgdGhlcmUgaXMgYWxyZWFkeSBhbiB1
cHN0cmVhbSBBQ1BJQ0EgY29tbWl0IG1ha2luZyB0aGlzIGNoYW5nZSwKPiBwbGVhc2UgYWRkIGEg
TGluazogdGFnIHBvaW50aW5nIHRvIHRoYXQgY29tbWl0IHRvIHRoZSAkc3ViamVjdCBwYXRjaC4K
CkkgaGF2ZSBhbHJlYWR5IHByb3ZpZGVkIHRoZSBwdWxsIHJlcXVlc3QgaW4gQUNQSUNBIG9uIGdp
dGh1YiBpbiB0aGUKY292ZXIgbGV0dGVyLgpCZWxvdyBpcyB0aGUgcGFydCBvZiB0aGUgY292ZXIg
bGV0dGVyLgoKIC0gUmFpc2VkIGEgcmV2aWV3IHJlcXVlc3QgZm9yIHBhdGNoICJJbnRyb2R1Y2Ug
U1NFIGluIEhFU1QKbm90aWZpY2F0aW9uIHR5cGVzIiBpbiBBQ1BJQ0EKICAgaHR0cHM6Ly9naXRo
dWIuY29tL2FjcGljYS9hY3BpY2EvcHVsbC8xMTcwCiAgIEtlZXBpbmcgdGhlIHBhdGNoIGhlcmUg
Zm9yIGNvbXBsZXRlIGZ1bmN0aW9uYWxpdHkKClRoYW5rcwpSZWdhcmRzCkhpbWFuc2h1Cj4KPiA+
IEBAIC0xNzk4LDcgKzE3OTgsOCBAQCBlbnVtIGFjcGlfaGVzdF9ub3RpZnlfdHlwZXMgewo+ID4g
ICAgICAgICBBQ1BJX0hFU1RfTk9USUZZX1NFSSA9IDksICAgICAgIC8qIEFDUEkgNi4xICovCj4g
PiAgICAgICAgIEFDUElfSEVTVF9OT1RJRllfR1NJViA9IDEwLCAgICAgLyogQUNQSSA2LjEgKi8K
PiA+ICAgICAgICAgQUNQSV9IRVNUX05PVElGWV9TT0ZUV0FSRV9ERUxFR0FURUQgPSAxMSwgICAg
ICAgLyogQUNQSSA2LjIgKi8KPiA+IC0gICAgICAgQUNQSV9IRVNUX05PVElGWV9SRVNFUlZFRCA9
IDEyICAvKiAxMiBhbmQgZ3JlYXRlciBhcmUgcmVzZXJ2ZWQgKi8KPiA+ICsgICAgICAgQUNQSV9I
RVNUX05PVElGWV9TU0UgPSAxMiwgLyogUklTQ1YgU1NFICovCj4gPiArICAgICAgIEFDUElfSEVT
VF9OT1RJRllfUkVTRVJWRUQgPSAxMyAgLyogMTMgYW5kIGdyZWF0ZXIgYXJlIHJlc2VydmVkICov
Cj4gPiAgfTsKPiA+Cj4gPiAgLyogVmFsdWVzIGZvciBjb25maWdfd3JpdGVfZW5hYmxlIGJpdGZp
ZWxkIGFib3ZlICovCj4gPiAtLQo+ID4gMi40My4wCj4gPgo+ID4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
