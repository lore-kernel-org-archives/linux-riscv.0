Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D2AC61DBD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yx4DdWAbh/I6ZWW9oCPnAIM105Z9tizQIFg0JucRlfc=; b=hnBcfBKjPF+T0t
	rS48EkT1hhdgM1d1WiwNiooLBpA9KDPmOr/1ixuNomNoFbzQN0/jsR8O7ioo9/CX/Iz/6zUeFNZT9
	kGdKrw1YF+np0N/oIMCZ+1faCRQnJGJvqCQkaCXR+APyZQHmSVyaJj0SWVs0mT0kWKpFLMClpidIA
	/y8TJs2T7mDWQ69P9dj7/MMYr/tTaA2Np/6Tk0Si4Pn3zhYbNQUIQ0TRjdps3Pw0lTNyV0guKxauU
	iFJYfiO5MWOAxGwOpu+dgGx/O5SnIPq2LD1ZrreyYDjjlPEXYNebN8bVlkhdBdkYtN0zXVgzd1ddE
	maoUmQK/0u3y/tZCDXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw7W-00000005m3X-0GOo;
	Fri, 28 Aug 2026 12:55:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw7T-00000005m2e-1qgy
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 12:55:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7L8b2167618
	for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 12:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qMsc0H9v5E0bSl/fIG39NIMkkZMYTzMHbvVDO82fKk0=; b=HqT2e4PQr+oaOBkd
	t6CFh5SMjFW9PdYFIglukwk6axjkuqgay10FRcnmUF1YUOWiAjvv/KsZrocypxx1
	gACZLX8wIA9+xuI5TsiKXKZX71dB3YitdtKhm7uc1JWs1N1UUuhsBhtNtnqKnZvk
	4HFXfgChOyAklkX/pQ7CkN4fCIS5rd+5FBchkpbQwYSAjnLTANJ+0+GP8dlX2SqW
	jvpeDkYDSZEe0AYcARvlYGhRDnwNxqJX/gj9kwQ8N+P1YRBU9DgYvY9crR3RsMnE
	ETqasSZJdXoVElV9ljo72PsY/jRvkuqdbrJ5S/rF/rs7NxCvaCcYFy1tMt0jCp1X
	fI27Pg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h0122w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 12:55:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso2087000a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 05:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787921742; cv=none;
        d=google.com; s=arc-20260327;
        b=mmFfyB6ZQ60iY3xtabjNYFWJFwuVBSY2HQlM+K85hBJHzLhJMXP0RbZRdk1x79/OZl
         dnb5kUehTAX1GcwaJ0e7uQN1VvsWfsXfxXnSlecH4/6bYmN/cRjGkydpcpkohA61ha1B
         RmUqqiANkL8GZC5lsE0K+JwvYIfq9d4sn0OpcBbYYwi9bmOE7rUuiyAhxN0Tykpv9lNE
         osU+0qbGd6d4m3yYd/brPRBSpTXLJt9CwcdCQLyJqCPn1+nAtRjiTA/yWLz4O+IaMUXx
         iky4YtH2K9ma/KJt6LmpV/pPe1TVHuBxpZ1eTnqL/pI0URJWHZNWPE0iBSUn1NsvEGz8
         3WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qMsc0H9v5E0bSl/fIG39NIMkkZMYTzMHbvVDO82fKk0=;
        fh=ep8YXcmCK65p8WIfGKC1A4EEgFddnxq95O8At+cSJ/E=;
        b=ATQfYrnoMw86mM//uDPcXXZ0LidS2ZcpUWplAcRPM4o+R9ZRhItglpmtI1WucFR6Re
         fzYClTPFkHLNAJ2EXvxJ3FBVvuGO3QMG5IzUa1YRkWliUtF9UAXuQ89nGlF6OVjMc0nX
         CsKQldgecNSneEte4kGYefRxyu8oaYerBT68VrbTWSef0FUx1L3o6j7XR/BzmmmKlj2x
         X2L1qO+cNscE8Gt5BpbM/NkfyXehjWgkVAvsQFaRKVhJU9PmJbypWy0e2qwcf0kO36bA
         BbX7JF7dfuKlAYGXQcs4pxO3xBtvy+WwpdC1R7PvDUGK1qbtnRexSX01ryWZ0PTiMddT
         J5Kg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787921742; x=1788526542; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qMsc0H9v5E0bSl/fIG39NIMkkZMYTzMHbvVDO82fKk0=;
        b=GtYOil2J6TOs2fAlJtNJDhj+Aw/bobBEpsEGOjjck8Ci4dpOHF6ATJV9ZMD1ctp0Uv
         lLunPKiRlBF28+GG7Rx+96uJ6a1jerUQkiYHczyrJOeti8ireRoLFPMTu/HAl1I189VC
         vl7uVFi/9fyjIyiXOyq6ay//nNNpCB2RZ/Xftj8g8pEPulb04XpZ5+0TDGx67cNHyTfv
         nBAd6TTV8jQIxflGlhXzr40E07Orpg66d2mnk+mZcSzuwT8LeiMhCyxpZ1YHyO8gxAT1
         mF0jdpwQW5og/cWxy0fhsegTnDgmiHwXTULrx1LQOcDA0Jlg/ek4KGmzJpZPuDtpXPM1
         BExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921742; x=1788526542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMsc0H9v5E0bSl/fIG39NIMkkZMYTzMHbvVDO82fKk0=;
        b=k/rAdZjCokHDTwO4dUO3K/vpMmneOXQo0EC9fhKTm8xq0D3r3exCtqj+bpI+StbQB7
         K7aLLATf1aWKdIsoc3399R1EJs6Y60kpNP7dB3bQBg0pP7T0O9buU0OEEtMGPTLJCRyW
         HrtvWJUaZYLxO8Ezdmva0CtH14Ou/6PRgQfkwmRQy31Oa1YJDo/vJlcF82TPE7Cyq1FW
         ytu38yS5xjRNtAR8B02E0A5v8VNtQOZN+6HYZ4WklYzcxCc8sBXeO9AXAfqDot4Whfgk
         FuGCAbsZJlBykuFF9fVWMbBbD5BJ5VwgUG59JRT77XBvDV5HgcdXQgrvC633ceVYcHDS
         5MBw==
X-Forwarded-Encrypted: i=1; AHgh+RorEUAnM3RD61takcIsZkF1rDQKC7Tx9Tsen4U8vK1lwZXE+uULNXXRx12LyKiEroESrhahnDDgK4NMMQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l5sIGTrYsQAIEwfWw0xVqOFZUBv00fexK0dg9R34hhrasAcNHG
	gGClewI+WxoLd+pHw09SZWjgnzeiv279n/h8fZJRmbi5wwmQ9g21ID8bWD3CGLo0BCOTsi++tar
	15ITyPLCXGzGlKb0O34zcRLFXzTe/JISIEtVBv+J4kH5rBZHWkgQFxOI1ufC7Q3mqPfguAOx3bj
	qteL2D3pVtECYCYP+v/ii9ybh3/53OdjylbqszYse4B10EDA==
X-Gm-Gg: AR+sD11gT/gajOUvfY/rIec9Iy8X5nnoLW2Cdc9eWcUNum4alfLz6ePmF8wpz12ZJiz
	Lvtbjmezdki+qadB0ki1tbVYOhi8ZfLvDTOAfISUJonczeBiGBKUxbPGE/MG7LzXhLQ+PtKc19M
	JS5l2JNEbAntTo6W+ObijmXSWBRrd8yaJmlABCVe46hlFPYCxgcIitcepdlA==
X-Received: by 2002:a17:90b:2e0e:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-396d0e34e0amr15326587a91.2.1787921741905;
        Fri, 28 Aug 2026 05:55:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:38d:dfd1:7c1 with SMTP id
 98e67ed59e1d1-396d0e34e0amr15326489a91.2.1787921741399; Fri, 28 Aug 2026
 05:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAJh9TS+k9P7bpa5gW+XV_da6JvA6TOGFJEdmsEmAULNAiZTBaQ@mail.gmail.com>
 <CAJh9TSJWr8eLG=9_UjwdOqwUqfsCxaAJb8NUUJ9NKjnmPcLSPA@mail.gmail.com>
In-Reply-To: <CAJh9TSJWr8eLG=9_UjwdOqwUqfsCxaAJb8NUUJ9NKjnmPcLSPA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:55:29 +0200
X-Gm-Features: AcwNN1V7lxdEGrOUHTiNyhanMK-GXSQ77bN-sYB5cy8Q_XdA_1K89CXemOM9wgs
Message-ID: <CAPx+jO9x304geo422e6PGNGPNsgSPAKcqUUyX244jOwy7fNw3w@mail.gmail.com>
Subject: Re: RISC-V genpd race in OSI mode (genpd domain power_off vs firmware
 suspend call)
To: Jimmy Ho <jimmy.ho@sifive.com>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
        Anup Patel <anup@brainfault.org>, rafael@kernel.org,
        daniel.lezcano@linaro.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Nick Hu <nick.hu@sifive.com>, ulfh@kernel.org
X-Proofpoint-GUID: 2mxDZYB4C7sEUGavPh7TwtIT-VnzrIdq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExMSBTYWx0ZWRfX7b+nBLNShaOE
 mynZ3p53mr/jBGzLbePob9htMf85CyRG7hcQ3LxLHr/knZFNxImxXlFTs9crPYQ5zkj1d3qNn9l
 EhOuSkNGNS6ipRWK3WsPH7A2AneanQc=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a91854e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=UXIAUNObAAAA:8 a=pFyQfRViAAAA:8
 a=jJX-bYqjmPCJVg_0ptYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a1s67YnXd6TbAZZNj1wK:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: 2mxDZYB4C7sEUGavPh7TwtIT-VnzrIdq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExMSBTYWx0ZWRfXwgZLtUjEtrxQ
 7+hF2GbjxkuUPabBJb3Gz4JRRN90H6Z66k47AKvAu8Ggo/zSo2LRa9OFmq1T9tMzEQ4sYv3cfRu
 BXKhuZs1zX6mRYhEdqtlgwlAKZoyfAg54RGrjFH3EgcX76upe4UaqvywBYH/5XYs+MxR/KvhPSj
 QPiQlhLQfmOVmaOfWADerS/E8nFPQzCqcvdGh6fWvp23dztveOgTvtxEsBmnKI2LBLBsmRlkRbk
 p41EuK1VJLCkgujFhNPhg4fc00h+RsO0ilzN6531GmpDqhoGEcQ5jreMNiHHh1HUJIJCmK1fbNe
 a9G85e7nTeYHDgDF6eRoiI8cg5WHrJfHluUjE1uGjab8e6EiNEUKP9iMaLRCVQwiuQo/Ebb9tUh
 KiAE5vMJzdhuhARzN8/AF3KhD6fIxg6p5df64kmACstHMJ6Ytzyke9r78hgsr+YUzbi+bNocXvu
 WiObz2gXEjOtdGsbabA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055543_488703_CF635293 
X-CRM114-Status: GOOD (  39.79  )
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

T24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgNzowM+KAr0FNIEppbW15IEhvIDxqaW1teS5ob0BzaWZp
dmUuY29tPiB3cm90ZToKPgo+IFJlc2VuZGluZyB0aGlzIGZvbGxvdy11cCB0byBVbGbigJlzIGN1
cnJlbnQgYWRkcmVzcwo+Cj4gT24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgMTI6NTbigK9QTSBKaW1t
eSBIbyA8amltbXkuaG9Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgbGludXgtcG0sCj4g
Pgo+ID4gV2UgaGl0IGEgcmFjZSBjb25kaXRpb24gaW52b2x2aW5nIGdlbnBkJ3MgQ1BVIFBNIGRv
bWFpbiAoT1NJLW1vZGUKPiA+IGhpZXJhcmNoaWNhbCBjcHVpZGxlLCBzaW1pbGFyIHRvIHRoZSBB
Uk0gUFNDSSBPU0kgbW9kZWwpIG9uIGEgUklTQy1WCj4gPiBwbGF0Zm9ybSwgYW5kIHdvdWxkIGxp
a2UgdG8gZ2V0IHlvdXIgb3BpbmlvbiBvbiB3aGV0aGVyIHRoaXMgaXMgYQo+ID4gZ2VucGQtbGV2
ZWwgaXNzdWUgYW5kIHdoYXQgdGhlIHByZWZlcnJlZCBnZW5lcmljIGZpeCB3b3VsZCBsb29rIGxp
a2UuCj4gPgo+ID4gQmFja2dyb3VuZAo+ID4gLS0tLS0tLS0tLQo+ID4gT2JzZXJ2ZWQgdGhpcyBp
c3N1ZSBvbiBxZW11IHBsYXRmb3JtCj4gPiBPbiBvdXIgU29DLCBkcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWFwbGljLW1haW4uYyByZWdpc3RlcnMgYSBnZW5wZAo+ID4gbm90aWZpZXIgdG8gc2F2
ZS9yZXN0b3JlIHRoZSBTLW1vZGUgQVBMSUMgY29udGV4dDoKPiA+Cj4gPiAgIGFwbGljX25vdGlm
aWVyKCkKPiA+ICAgICBHRU5QRF9OT1RJRllfUFJFX09GRiAtPiBhcGxpY19zYXZlKCkKPiA+ICAg
ICBHRU5QRF9OT1RJRllfT04gICAgICAtPiBhcGxpY19yZXN0b3JlKCkKPiA+Cj4gPiBDUFVzIGFy
ZSBhdHRhY2hlZCB0byB0aGlzIGdlbnBkIHZpYSBkdF9pZGxlX2F0dGFjaF9jcHUoKSAoYXMgaW4K
PiA+IGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jLCBtaXJyb3JpbmcgY3B1aWRs
ZS1wc2NpLmMpLiBXaGVuCj4gPiB0aGUgbGFzdCBDUFUgaW4gdGhlIGRvbWFpbiBnb2VzIGlkbGUs
IGdlbnBkX3Bvd2VyX29mZigpIGRlY2lkZXMgdGhlCj4gPiBkb21haW4gY2FuIGJlIHR1cm5lZCBv
ZmYgKGJhc2VkIG9uIHRoZSAibm90X3N1c3BlbmRlZCIgY291bnQgY29tcHV0ZWQKPiA+IHVuZGVy
IGdlbnBkX2xvY2spLiBXaGVuIHRoZSBmaXJzdCBDUFUKPiA+IHJlc3VtZXMsIGdlbnBkX3Bvd2Vy
X29uKCkgZGVjaWRlcyB0byB0dXJuIHRoZSBkb21haW4gYmFjayBvbiBhbmQgZmlyZXMKPiA+IEdF
TlBEX05PVElGWV9PTiwgd2hpY2ggdHJpZ2dlcnMgYXBsaWNfcmVzdG9yZSgpLgo+ID4KPiA+IEhv
d2V2ZXIsIHRoZSBhY3R1YWwgU0JJIEhTTSBzdXNwZW5kIGNhbGwgKHJpc2N2X3NiaV9oYXJ0X3N1
c3BlbmQoKSwKPiA+IHNpbWlsYXIgdG8gYSBQU0NJIENQVV9TVVNQRU5EIGNhbGwpIGlzICpub3Qq
IGlzc3VlZCBpbnNpZGUKPiA+IGdlbnBkX2xvY2suIGdlbnBkJ3MgcG93ZXJfb2ZmKCkgY2FsbGJh
Y2sgb25seSByZWNvcmRzIHdoaWNoIGRvbWFpbgo+ID4gaWRsZSBzdGF0ZSB3YXMgc2VsZWN0ZWQ7
IHRoZSByZWFsIGZpcm13YXJlIHN1c3BlbmQgY2FsbCBoYXBwZW5zIGxhdGVyLAo+ID4gYXN5bmNo
cm9ub3VzbHksIG9uIGVhY2ggQ1BVJ3Mgb3duIGNwdWlkbGUgZW50ZXIgcGF0aAo+ID4gKF9fc2Jp
X2VudGVyX2RvbWFpbl9pZGxlX3N0YXRlKCkpLgo+ID4KPiA+IFRoZSByYWNlCj4gPiAtLS0tLS0t
LQo+ID4gQmVjYXVzZSBvZiB0aGlzIGdhcCBiZXR3ZWVuICJnZW5wZCdzIHNvZnR3YXJlIGRlY2lz
aW9uIHRoYXQgdGhpcyBDUFUKPiA+IGlzIGxhc3QtbWFuIC8gZmlyc3QtbWFuIiBhbmQgInRoZSBD
UFUgYWN0dWFsbHkgaXNzdWluZyB0aGUgZmlybXdhcmUKPiA+IHN1c3BlbmQvcmVzdW1lIGNhbGwi
LCB3ZSBvYnNlcnZlZCB0aGUgZm9sbG93aW5nIHNlcXVlbmNlCj4gPgo+ID4gMS4gQ1BVMCByZXF1
ZXN0cyBhIHN5c3RlbSBkb21haW4tbGV2ZWwgcG93ZXItZ2F0ZSAoZGVlcCBzbGVlcCwgdGVhcnMg
ZG93biB0aGUKPiA+ICAgIHNoYXJlZCBTLW1vZGUgQVBMSUMgY29udGV4dCkgYW5kIGhhbmRzIG9m
ZiB0byBmaXJtd2FyZS4KPiA+IDIuIEJlZm9yZSBDUFUwJ3MgcmVxdWVzdCBpcyBwaHlzaWNhbGx5
IGNvbXBsZXRlZCwgQ1BVMSB3YWtlcyB1cCwKPiA+ICAgIGdlbnBkX3Bvd2VyX29uKCkgcnVucywg
R0VOUERfTk9USUZZX09OIGZpcmVzLCBhcGxpY19yZXN0b3JlKCkgcnVucy4KPiA+IDMuIENQVTEg
Z29lcyBpZGxlIGFnYWluLCBidXQgdGhpcyB0aW1lIHN5c3RlbSBkb21haW4tbGV2ZWwgZ2VucGQg
cmVqZWN0Cj4gPiAgICByZXF1ZXN0LCBzbyBpdCBmYWxsYmFjayB0byBjb3JlIGxldmVsIHBvd2Vy
LWdhdGUKPiA+IDQuIENQVTAncyBvcmlnaW5hbCBzeXN0ZW0gZGVlcCBwb3dlci1nYXRlIHJlcXVl
c3QgZXZlbnR1YWxseSBjb21wbGV0ZXMgYXQgdGhlCj4gPiAgICBmaXJtd2FyZSBsZXZlbCAtLSBw
aHlzaWNhbGx5IGNvbGxhcHNpbmcgdGhlIHN5c3RlbSBkb21haW4sIGluY2x1ZGluZyB0aGUKPiA+
ICAgIFMtbW9kZSBBUExJQyBjb250ZXh0LCBzYXZlZCBlYXJsaWVyIGJ5IGFwbGljX3NhdmUoKQo+
ID4gNS4gQ1BVMCB3YWtlcyB1cCAoZS5nLiBVQVJUIGludGVycnVwdCksIGVudGVycyBMaW51eCwg
YnV0IHN5c3RlbSBnZW5wZCdzCj4gPiAgICBzb2Z0d2FyZSBzdGF0ZSBzdGlsbCBzYXlzIHRoZSBk
b21haW4gaXMgIm9uIiAoZnJvbSBzdGVwIDIpLCBzbyBzeXN0ZW0gZG9tYWluCj4gPiAgICBHRU5Q
RF9OT1RJRllfT04gd2lsbCBub3QgYmUgZmlyZWQgYWdhaW4gYW5kIGFwbGljX3Jlc3RvcmUoKSB3
aWxsIG5vdCBiZQo+ID4gICAgY2FsbGVkCj4gPgo+ID4gVGhpcyBsb29rcyBzdHJ1Y3R1cmFsbHkg
aWRlbnRpY2FsIHRvIHRoZSByYWNlIFRGLUEncyBQU0NJIE9TLWluaXRpYXRlZAo+ID4gbW9kZSBk
b2N1bWVudGF0aW9uIGRlc2NyaWJlczoKPiA+IGh0dHBzOi8vdHJ1c3RlZGZpcm13YXJlLWEucmVh
ZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2Rlc2lnbl9kb2N1bWVudHMvcHNjaV9vc2lfbW9kZS5odG1s
I3JhY2VzLWluLW9zLWluaXRpYXRlZC1tb2RlCj4gPgo+ID4KPiA+ICAgIkluIE9TLWluaXRpYXRl
ZCBtb2RlLCB0aGVyZSBhcmUgcmFjZSB3aW5kb3dzIHdoZXJlIHRoZSBPUydzIHZpZXcKPiA+ICAg
YW5kIGltcGxlbWVudGF0aW9uJ3MgdmlldyBvZiB0aGUgc3lzdGVtJ3Mgc3RhdGUgZGlmZmVyLi4u
IHRoZSBPUwo+ID4gICBtaWdodCByZXF1ZXN0IGEgcG93ZXJkb3duIHN0YXRlIGZvciBhIG5vZGUg
ZnJvbSBvbmUgY29yZSwgd2hpbGUgYXQKPiA+ICAgdGhlIHNhbWUgdGltZSwgdGhlIGltcGxlbWVu
dGF0aW9uIG9ic2VydmVzIHRoYXQgYW5vdGhlciBjb3JlIGluCj4gPiAgIHRoYXQgbm9kZSBpcyBw
b3dlcmluZyB1cC4iCj4gPgo+ID4gVEYtQSdzIGFuc3dlciBpcyB0byByZXF1aXJlIHRoZSBPUyB0
byBlbmNvZGUgYSAibGFzdF9hdF9wd3JsdmwiIGZpZWxkCj4gPiBpbnRvIHRoZSBTdGF0ZUlEIHBh
c3NlZCB0byBDUFVfU1VTUEVORCwgd2hpY2ggZmlybXdhcmUgdmFsaWRhdGVzCj4gPiBhZ2FpbnN0
IGl0cyBvd24gdmlldyBvZiBzeXN0ZW0gc3RhdGUgYmVmb3JlIGhvbm9yaW5nIGEgcG93ZXJkb3du
Cj4gPiByZXF1ZXN0LiBXZSBjb3VsZCBub3QgZmluZCBhbnkgY29kZSBpbiBjdXJyZW50IG1haW5s
aW5lIExpbnV4Cj4gPiAoY3B1aWRsZS1wc2NpLmMgb3IgZ2VuZXJpYyBjcHVpZGxlL2dlbnBkIGNv
ZGUpIHRoYXQgYWN0dWFsbHkgY29tcHV0ZXMKPiA+IGFuZCBlbmNvZGVzIHRoaXMgZmllbGQgZHlu
YW1pY2FsbHkgcGVyIHN1c3BlbmQgY2FsbCwgc28gYXMgZmFyIGFzIHdlCj4gPiBjYW4gdGVsbCB0
aGlzIHJhY2UgaXMgdW5oYW5kbGVkIGdlbmVyaWNhbGx5IHRvZGF5LCBvbiBib3RoIGFybS9wc2Np
Cj4gPiBhbmQgcmlzY3Yvc2JpIGJhY2tlbmRzLgo+ID4KPiA+IE9wdGlvbnMgd2UgY29uc2lkZXJl
ZAo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gMS4gSW1wbGVtZW50IHNvbWV0aGluZyBs
aWtlIFBTQ0kncyBsYXN0X2F0X3B3cmx2bCBnZW5lcmljYWxseTogZXhwb3NlCj4gPiAgICBnZW5w
ZCdzIGFscmVhZHktY29tcHV0ZWQgImFtIEkgdGhlIGxhc3QgQ1BVIGluIHRoaXMgZG9tYWluIgo+
ID4gICAgaW5mb3JtYXRpb24gdGhyb3VnaCB0aGUgcG93ZXJfb2ZmKCkgY2FsbGJhY2sgQVBJLCBz
bwo+ID4gICAgYmFja2VuZHMgY2FuIHBhc3MgaXQgZG93biB0byBmaXJtd2FyZSwgYW5kIGhhdmUg
ZmlybXdhcmUgdmFsaWRhdGUvCj4gPiAgICByZWplY3Qgc3RhbGUgcmVxdWVzdHMuCj4gPiAgICAt
IFBybzogbWF0Y2hlcyB0aGUgZG9jdW1lbnRlZCBQU0NJIE9TSSBhcHByb2FjaC4KPiA+ICAgIC0g
Q29uOiBXZSBkb24ndCBrbm93IGhvdyB0byBzZXQgdGhpcyBmbGFnIHByb3Blcmx5IGluIGEgZ2Vu
ZXJpYyB3YXkuCj4gPiAgICAgIGxhc3RfYXRfcHdybHZsIGlzIG9ubHkgbWVhbmluZ2Z1bCBvbiBy
aXNjdi9hcm0sIHNvIHdlIGNhbid0IGp1c3QKPiA+ICAgICAgYWRkIGl0IHRvIGdlbnBkJ3MgZ2Vu
ZXJpYyBjb2RlIHBhdGguIGdlbnBkIGFsc28gZG9lc24ndCBrZWVwIGEKPiA+ICAgICAgY291bnRl
ciBvZiBob3cgbWFueSBDUFVzIGluIGEgZG9tYWluIGFyZSBzdGlsbCBhbGl2ZSwgc28gdGhlcmUn
cwo+ID4gICAgICBubyBleGlzdGluZyBzdGF0ZSBpbiBnZW5wZCdzIHBvd2VyX29mZigpIGNhbGxi
YWNrIHdlIGNvdWxkIHJlYWQKPiA+ICAgICAgdG8gZGVyaXZlIHRoZSBmbGFnLiBPbmUgaWRlYSB3
b3VsZCBiZSB0byB3YWxrIHRoZSBnZW5wZCBoaWVyYXJjaHkKPiA+ICAgICAgZnJvbSB3aXRoaW4g
dGhlIHBvd2VyX29mZigpIGNhbGxiYWNrIGFuZCBjaGVjayB0aGUgcnVudGltZV9zdGF0dXMKPiA+
ICAgICAgb2YgZWFjaCBDUFUgZGV2aWNlIGluIHRoZSBzYW1lIGRvbWFpbiAoZ2VucGQgZG9tYWlu
cyBhbHJlYWR5IGNhcnJ5Cj4gPiAgICAgIGEgQ1BVIG1hc2ssIGFuZCBnZXRfY3B1X2RldmljZSgp
IGNhbiBiZSB1c2VkIHRvIGxvb2sgdXAgdGhlCj4gPiAgICAgIGNvcnJlc3BvbmRpbmcgQ1BVIGRl
dmljZSkKPiA+Cj4gPiAyLiBEbyB0aGUgcG93ZXItZG9tYWluIGNvbnRyb2wgZGlyZWN0bHkgZnJv
bSB0aGUgcG93ZXJfb2ZmKCkvcG93ZXJfb24oKQo+ID4gICAgZ2VucGQgY2FsbGJhY2tzIChlLmcu
IGhhdmUgdGhlbSBwb2tlIHRoZSBTb0MncyBwb3dlciBjb250cm9sbGVyCj4gPiAgICByZWdpc3Rl
cnMgdmlhIGFuIFNCSSBjYWxsLCBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gZWFjaCBDUFUncyBvd24K
PiA+ICAgIGlkbGUtZW50cnkgcGF0aCB0byB0cmlnZ2VyIHRoZSBkZWVwZXN0IHN0YXRlKS4KPiA+
ICAgIGl0IGNyZWF0ZXMgdHdvIGluZGVwZW5kZW50IGRyaXZlciB0aGF0IHdpbGwgdG91Y2ggcG93
ZXIgY29udHJvbGxlcgo+ID4gICAgKG9wZW5zYmkgdnMgbGludXgpCj4gPgo+ID4gMy4gSGF2ZSBl
YWNoIENQVSBwYXNzIGEgbW9ub3RvbmljYWxseSBpbmNyZWFzaW5nIHNlcXVlbmNlIG51bWJlcgo+
ID4gICAgYWxvbmdzaWRlIGl0cyBzdXNwZW5kIHJlcXVlc3QgdG8gZmlybXdhcmUsIGFuZCBoYXZl
IGZpcm13YXJlCj4gPiAgICBpdHNlbGYgZGV0ZWN0IGFuZCByZWplY3QvZG93bmdyYWRlIGEgZGVl
cCBwb3dlci1kb3duIHJlcXVlc3QgaWYgYQo+ID4gICAgKm5ld2VyKiBzZXF1ZW5jZSBudW1iZXIg
ZnJvbSBhIHNoYWxsb3dlciAoaS5lLiAic29tZSBDUFUgYmVjYW1lCj4gPiAgICBhY3RpdmUgYWdh
aW4iKSByZXF1ZXN0IGhhcyBiZWVuIG9ic2VydmVkIGZvciB0aGUgc2FtZSBkb21haW4gc2luY2Uu
Cj4gPiAgICBUaGlzIGlzIGEgZmlybXdhcmUtc2lkZSBzdGFsZW5lc3MgY2hlY2ssIGVudGlyZWx5
IGJlbG93IHRoZSBTQkkKPiA+ICAgIGNhbGwgYm91bmRhcnkKPiA+ICAgIHRoaXMgc2VxIG51bWJl
ciBjYW4gYmUgbWFpbnRhaW5lZCBpbiBnZW5kcGQgZ2VuZXJpYyBjb2RlCj4gPiAgICBvciByaXNj
diBwb3dlcl9vZmYoKSBjYWxsYmFjaywgd2hlcmUgZG8geW91IHN1Z2dlc3QgdGhpcyB0byBiZQo+
ID4gICAgYWRkZWQ/Cj4gPgo+ID4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gdG8gc29sdmlu
ZyB0aGlzIGlzc3VlPwo+ID4gVGhhbmtzLAo+ID4gSmltbXkgSG8KClRoZSBwcm9ibGVtIHNlZW1z
IHZlcnkgc2ltaWxhciB0byB0aGUgcmFjZSBjb25kaXRpb24gd2UgaGF2ZSBmb3IgdGhlClBTQ0kg
T1NJIG1vZGUuIFRoaXMgcmFjZSBjb25kaXRpb24gbmVlZHMgdG8gYmUgbWFuYWdlZCBpbiB0aGUg
RlcuCgpJZiB0aGUgbGFzdCBDUFUgaW4gYSBjbHVzdGVyIGlzIGFib3V0IHRvIGVudGVyIGlkbGUs
IHRoZSBGVyBzaW1wbHkKbmVlZHMgdG8gYWJvcnQgdGhlIHJlcXVlc3QgZm9yIGl0LCBpZiB0aGVy
ZSBpcyBhbm90aGVyIENQVSBpbiB0aGUgc2FtZQpjbHVzdGVyIHRoYXQgaXMgYWJvdXQgdG8gd2Fr
ZSB1cC4KCktpbmQgcmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
