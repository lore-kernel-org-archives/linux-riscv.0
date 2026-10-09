Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA6DCA6019
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+MUrzW8p5/aigU1Pw5RPRh2jeiZ/3gpR0pOd7hmqAs=; b=ofInWr1taunDut
	PfTPHrDAhvT+0Prv7qLdZU+NSpxOQxfJechN973VGJzB6NBU2GQ/1vtPpyn33MUaFmgJ6aRkXDP8n
	MmmHRNXiypP55QMQ24GjAPvObCIQfcJ2fHIoFZXnY/xqddpL94krg+smp3u1OO7Pui0BYzIuKIhLu
	CENR/xpmMoNc7VBPHYUcKqFw5hK1h7rclHioxfyIV1lFzvYI8fWEbL1MOphII3CEGtjoUk6d1Q+uz
	uOamyvwSp+izhgEQlA20Cectkxxxy+xQzcHQK+YfQ+BDkyo/P8IYel1z/r2sBSeQOxGaCpBENcxIE
	4xthIFaMoWBGvCtBxmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBos-00000006TRI-0Pog;
	Fri, 09 Oct 2026 14:43:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBop-00000006TQ5-0dNe
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 14:43:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DkoHD1956579
	for <linux-riscv@lists.infradead.org>; Fri, 9 Oct 2026 14:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=; b=OucXmOv8QLOr2EQt
	RI+eChZ5BICG4gv1ayGqO7u8MoiGZTMrZgMQ6JYdSwkUl+pkidf1YD2NGfYKhgNX
	egvb1RRlmAIGyoc2U9vUnXrOlYrRy2wHBtSi3zdo2rJ2RzzOFQyeee8EFAeUgss0
	tOe0vjrletI0qD7TPDccY4BfYYsorOtfdC524/xN919n3Iy6FpyQ3JXbscviIiEN
	lk0QtWtE575fJRD8XtywnfK0SUxxgqG78GtP2cv3vBHQx6YLfLtA5rFoQXkljXVX
	CLNZ1C1i3qJSthYN6CXIMd4IbbB3pCNrwpbfo2GceUEPA84JEvxMKUvxsD7s5awB
	bfR5Qw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f287k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 14:43:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535851217d9so60574581cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 07:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791557009; cv=none;
        d=google.com; s=arc-20260327;
        b=ORT+iU40FaAGZ92GrkvPNVFko449f8d3mOdQQC4zTJMAh8hNbha0odUW3f1hP/2tHq
         kgnOFr2eZ2wwoMGRWOV5gS3kUbdHONtmJkExkm2T/q8NlLlRu37+PZq3LchQZy5O39Au
         G5r9FJWCJwelpAbC/vz4xXhXtn3CXQOXpkw8o2bE8A/SbfdQ5imTPf6NNrhDbTbKbaTF
         /F7H2QwixZXD2qts/SIfgEn6bdZW+eucK290hACQRBQHcqhHuxaTHgBuHMc3H3bfHKOD
         Itp3dGk6BZ3A/5cze+Z7k52pfEwOcPebUaJ7saJmdw0OBMgHYrXQwFYZQ3zPoMvej1lK
         hVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=;
        fh=eHIwa/BRS8gq7repe0so3sHALsQACn8xEpdlsyIZFnc=;
        b=nCVZPFYbYACTmdjTuikYxMJDqnhv1SVuDi/Q1G4DKPm/fPmecyzI8o5rxPukyntrdW
         kMFUNm7KVOD1QKZIcMnKNtupOy96z5pLuOUas+J/GZ0OHSJ489WDJrB77FIG9VQdrSFx
         1tCCX49TdKvlbC5//YNZTpTcj7C9AwelhAqRlJJKO8TurriK+TjkMfBSzlQGhIQ505Xb
         I9q/yPccgKQJdOq94b6IW23VB/9njnUMiAnNiR2/e46oVHtAHAuSjzFoWYPWICLDkHWJ
         MhSPXRKajZ7GWghs8yUl9pqTXseNRhOfnBfZxhFgy8W7YBsiG+YoNhwQbIJyz6f/Gn8g
         zqxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791557009; x=1792161809; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=;
        b=IEwtzmDzxo7HRfIfKm1f+jzGZAKs0G4KaYlLJFR65OcRygTSrMEo+nRI8ppA8enQQV
         xFn9X+WceesJI/rlzPJzZUH3fQ1GPipaaWsqLNvAw7RxSMh1/yYZ+DmQAI5uhImxezql
         yH+FG+uqSoVleFGMD99Nbq5KL3UWFb2fqojfKnhv7ndoQyJDVPbcZswgrTXA00BsP8PV
         MY3v3JzsLJ/UdgFe1DH5ST4qZV6vvL8YPoyyfTzptQ1T5izbDmOvu8iUolAE7CZ6IQjq
         haT0sSGMMrpKcsy4Cz77cQOxsAeP7GY8UsBZSU946YJ5+Vk4zqgxFvFO2Kei9vvSZUCB
         rulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791557009; x=1792161809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=;
        b=RQtEfOqQwDoPBqiCnRAF6bXPEXbk8gcGaSlJEXEQaIM+FimCmsRenGZTZsBlncBiz0
         AOTWa3rk3wM0DFuHejx9RVMu+7p5fEQ7TR73J/uHzQWBBWlxqjRW6/0CIGS5RTBHd8NZ
         HgecPWj9B5MfJcpkDjXGyr7I+dwBYl+IxFJS+xxkdtBGUCkSn6nWa/5RVtoV0osi+c6C
         sto+To/PLLchqXQE4SSDsTHwY8qEWOw+cd/RBNwLiNiZPH0/+vh7ZFsqG79BQzBUzQHI
         i7tAe5UuP2Egb0qHGasOfGY2QUEvpTv74b7knPPXgoz14cUWbjUghkxLvNVYUGYsw+j4
         Y/sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlShqP/b8pe0Lq5A9da3qy88J5KEQ3PbV4FUvHtvVTsd8Dqrbcb7Za8YWpXh2RI5IhQwBHad6zBY2k/Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kLCEdcJ1IJTPxe0xvAQ8VeNHR2Rix0/m05qKF3/7OLEE4xbHEM
	HPpVDJlfQVF11JvqeTHYb72L5RGoLzZWpkn0rxn8dvenbFSS6sraLWFBnqsaguL9O+jeAl3i4Vy
	P1BPAKYHTrywaCTV/elzmiDAWQzHz+iMPid8dnb+EnfdzsTnV/vSS/2x3/nzMhLiYYVLipYYOus
	3muqdaOCQ8WNKek2OT8fv/ap8C8nvUC3z/RAkGrj/iVfYXDg==
X-Gm-Gg: AYBFou23aZEmYE5Kfdw10cMp2ufYOwlNxi06lVCpKLPil7OmyfnzaEPO12/WL8md0o0
	SX9YmfJZ5DlXI+YpVG3R+h/rzeb3fYhdYMGCe2U81Rvn76mMpkF1wrhm2Qk8L+u/3y+9DUu/T8/
	i6ib5LqA+4OgNN/YAdzFK5mx/FtCEBXZkQ4dWhwUSvBbVbQ+O1qDWK/xw=
X-Received: by 2002:a05:622a:2517:b0:533:73b3:ab37 with SMTP id d75a77b69052e-5359facd277mr32614121cf.21.1791557009001;
        Fri, 09 Oct 2026 07:43:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2517:b0:533:73b3:ab37 with SMTP id
 d75a77b69052e-5359facd277mr32613541cf.21.1791557008361; Fri, 09 Oct 2026
 07:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-7-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveU+8d-MmPL4n_ADimkrthsE1sU4QHJoBeh==sxLZmdrFw@mail.gmail.com> <f9e91a7d-1628-4746-b2e7-03c7b1be11cc@oss.qualcomm.com>
In-Reply-To: <f9e91a7d-1628-4746-b2e7-03c7b1be11cc@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:43:17 +0200
X-Gm-Features: AclHuK-iwpXhKCW1lDKHLFQjYfiUaQQVp7wnVNfe_r5bhgAvlRHOCGBGjBCgB9Y
Message-ID: <CAGgiveU0DcUYW-EF-hneNqeQOkk9OTwcvzhgUvFB4JJOGSiwkg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/8] tee: optee: bind RPMI services and negotiate
 backend capabilities
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
X-Proofpoint-ORIG-GUID: w1Kpbi4S9V7zjuTwONJ5HSpxa-da2O8T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX9+N8KxnTUSFh
 wn/TAHBKP/vj0T10ggmbaOSXSBFrBt2xnTmaR0ug8UAPadQFp+sP0RZ31Y2ABQf0p3GuoNOcBt/
 FIWsNAqvJzPp+/DzzKK9NZmQIeEg48vUCXeA6BjAXXgm8Kn95fCuWkXRXhBzzYeA5gnMzUc73Us
 7rU6IdD65iYpdJJkUFJQSJIB9uCB8EmCynARrUJTtxNwHAm+BXIl67fW1IFax1wF1gzXeMxT8il
 3aNMGQNSBZoKGsXW3kizYolDNhjQ7Ui1mD/Qtv49zmJtC5mgqQCs3YcL+49Nc4B+8D+at5E/QrC
 yvGW9bmXmoDKUvE4KkR71ZMWft1o3RAW/5ElZhCUaCP6JVd+JtLFdfaQodghxLPO/AJe1OqSbKW
 ld5+tUGY7uZBAb+bcr4jeZ02jOkcBCl/pfIqPrztRvAgJ515YKI52wvIo4szKlAttiEagp98Vhz
 Cabn6BklIWFFOojJtJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfXz718khlCDB8j
 qiZHZXzHXrsoNSCFD3qATiG9/gF1UqcP39BggzVK9xo5Uc/qasHE6R6C++KY6SIBimFaSNeBrdq
 DW00JK+eg0P9YFQgEwUNYbEuDXeYu1w=
X-Authority-Analysis: v=2.4 cv=B8ksQ+tM c=1 sm=1 tr=0 ts=6ac8fd91 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=9OYd7h5rvP6jySxxyU8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: w1Kpbi4S9V7zjuTwONJ5HSpxa-da2O8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_074331_306555_69D3AB40 
X-CRM114-Status: GOOD (  21.81  )
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

SGkgQW1pciwKCk9uIEZyaSwgT2N0IDksIDIwMjYgYXQgMToxMOKAr0FNIEFtaXJyZXphIFphcnJh
YmkKPGFtaXJyZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBIaSBqZW5z
LAo+Cj4gT24gMTAvOC8yMDI2IDc6MjAgUE0sIEplbnMgV2lrbGFuZGVyIHdyb3RlOgo+ID4gSGkg
QW1pciwKPiA+Cj4gPiBPbiBUdWUsIE9jdCA2LCAyMDI2IGF0IDI6NDDigK9BTSBBbWlycmV6YSBa
YXJyYWJpCj4gPiA8YW1pcnJlemEuemFycmFiaUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+
Pgo+ID4+IFJlZ2lzdGVyIGFuIFJQTUkgc2VydmljZSBkcml2ZXIgbWF0Y2hpbmcgdGhlIE9QLVRF
RSBzZXJ2aWNlIFVVSUQgYW5kCj4gPj4gaW50ZWdyYXRlIGl0IHdpdGggT1AtVEVFIG1vZHVsZSBp
bml0aWFsaXphdGlvbiBhbmQgcmVtb3ZhbC4KPiA+Pgo+ID4+IENoZWNrIHRoZSBzZXJ2aWNlIEFQ
SSB2ZXJzaW9uLCBxdWVyeSB0aGUgdHJ1c3RlZCBPUyByZXZpc2lvbiwgYW5kCj4gPj4gb2J0YWlu
IHRoZSBSUEMgcGFyYW1ldGVyIGFuZCBsb2dpY2FsIG5vdGlmaWNhdGlvbiBjb3VudHMuIEluaXRp
YWxpemUKPiA+PiBzaGFyZWQtbWVtb3J5IHRyYWNraW5nLCB0aGUgY2FsbCBxdWV1ZSwgc3VwcGxp
Y2FudCBzdGF0ZSBhbmQgaW50ZXJuYWwKPiA+PiBjb250ZXh0IGJlZm9yZSBwdWJsaXNoaW5nIHRo
ZSBjbGllbnQgYW5kIHN1cHBsaWNhbnQgVEVFIGRldmljZXMuCj4gPj4KPiA+PiBDb25uZWN0IHRo
ZSBSUE1JIGJhY2tlbmQgdG8gdGhlIGNvbW1vbiBPUC1URUUgb3BlcmF0aW9ucyBhbmQgZW51bWVy
YXRlCj4gPj4gdHJ1c3RlZCBhcHBsaWNhdGlvbiBkZXZpY2VzLiBFbmFibGUgaW4ta2VybmVsIFJQ
TUIgcm91dGluZyB3aGVuIHRoZQo+ID4+IFJQTUIgc3Vic3lzdGVtIGlzIHJlYWNoYWJsZS4KPiA+
Pgo+ID4+IEFkZCByZW1vdmFsIGFuZCBwcm9iZSBmYWlsdXJlIGNsZWFudXAgZm9yIHRoZSBiYWNr
ZW5kIHJlc291cmNlcy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFtaXJyZXphIFphcnJhYmkg
PGFtaXJyZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4KPiA+PiAtLS0KW3NuaXBdCj4gPj4g
Kwo+ID4+ICsvKiBRdWVyeSBhbmQgc3RvcmUgc2VjdXJlLXdvcmxkIGNhcGFiaWxpdGllcyBhbmQg
YnVmZmVyIGxpbWl0cy4gKi8KPiA+PiArc3RhdGljIGludCBvcHRlZV9ycG1pX2V4Y2hhbmdlX2Nh
cHMoc3RydWN0IG9wdGVlICpvcHRlZSkKPiA+PiArewo+ID4+ICsgICAgICAgc3RydWN0IG9wdGVl
X3JwbWlfcHJvYmVfcmVxIHJlcSA9IHsKPiA+PiArICAgICAgICAgICAgICAgLm9wID0gY3B1X3Rv
X2xlMzIoT1BURUVfUlBNSV9FWENIQU5HRV9DQVBBQklMSVRJRVMpLAo+ID4+ICsgICAgICAgfTsK
PiA+PiArICAgICAgIHN0cnVjdCBvcHRlZV9ycG1pX2NhcHNfcmVzcCBjYXBzOwo+ID4+ICsgICAg
ICAgdTMyIHJwY19jb3VudCwgc2VjX2NhcHMsIG5vdGlmX2NvdW50Owo+ID4+ICsgICAgICAgaW50
IHJldDsKPiA+PiArCj4gPj4gKyAgICAgICByZXQgPSBvcHRlZV9ycG1pX2NhbGwob3B0ZWUsICZy
ZXEsIHNpemVvZihyZXEpLCAmY2Fwcywgc2l6ZW9mKGNhcHMpKTsKPiA+PiArICAgICAgIGlmIChy
ZXQpCj4gPj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPj4gKwo+ID4+ICsgICAgICAg
c2VjX2NhcHMgPSBnZXRfdW5hbGlnbmVkX2xlMzIoJmNhcHMuc2VjdXJlX2NhcHMpOwo+ID4+ICsg
ICAgICAgcnBjX2NvdW50ID0gZ2V0X3VuYWxpZ25lZF9sZTMyKCZjYXBzLnJwY19wYXJhbV9jb3Vu
dCk7Cj4gPj4gKyAgICAgICBub3RpZl9jb3VudCA9IGdldF91bmFsaWduZWRfbGUzMigmY2Fwcy5u
b3RpZmljYXRpb25fY291bnQpOwo+ID4+ICsgICAgICAgaWYgKCFub3RpZl9jb3VudCB8fCAhcnBj
X2NvdW50KQo+ID4+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVQUk9UTzsKPiA+PiArCj4gPj4g
KyAgICAgICBvcHRlZS0+cnBjX3BhcmFtX2NvdW50ID0gcnBjX2NvdW50Owo+ID4+ICsgICAgICAg
b3B0ZWUtPnJwbWkuc2VjX2NhcHMgPSBzZWNfY2FwczsKPiA+PiArICAgICAgIG9wdGVlLT5ycG1p
Lm5vdGlmaWNhdGlvbl9jb3VudCA9IG5vdGlmX2NvdW50Owo+ID4+ICsgICAgICAgb3B0ZWUtPmlu
X2tlcm5lbF9ycG1iX3JvdXRpbmcgPSBJU19SRUFDSEFCTEUoQ09ORklHX1JQTUIpOwo+ID4KPiA+
IFdoYXQgaWYgT1AtVEVFIGlzIGJ1aWx0IHdpdGhvdXQgUlBNQiBzdXBwb3J0Pwo+ID4KPgo+IEkg
ZGlzY3Vzc2VkIHRoaXMgd2l0aCBTdW1pdCwgYW5kIHRoZSBpbnRlbnRpb24gd2FzIHRvIG1ha2Ug
UlBNQiBwcm9iaW5nCj4gcGFydCBvZiB0aGUgYmFzZWxpbmUgZm9yIHRoZSBuZXcgQUJJIHJhdGhl
ciB0aGFuIG5lZ290aWF0ZSBpdCBzZXBhcmF0ZWx5Lgo+IEkgY2FuIGVuYWJsZSB0aGUgY2FwYWJp
bGl0eSBiaXQgaWYgaXQgc2hvdWxkIHJlbWFpbiBvcHRpb25hbC4KCllvdSBoYXZlIGEgcG9pbnQu
IExldCdzIGtlZXAgaXQsIGJ1dCB3ZSBtYXkgd2FudCB0byBtb3ZlIHRoZQphc3NpZ25tZW50IGRv
d24gaW50byBvcHRlZV9ycG1pX3Byb2JlKCksIGFzIHRoZSBvdGhlciBwcm9iZSBmdW5jdGlvbnMK
aGF2ZSBpdC4KCkNoZWVycywKSmVucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
