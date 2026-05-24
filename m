Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEFCCD5BAB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 20:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOlamJVlS1djII2CrS+myMmOfS5x1UUDnDgLw4veta4=; b=l9ABiPRdCB4pQr
	LgqZvBzrJc/vazN4PBHUnr8LQpbgANxYirPtZ5dpLSPed7IvYfe0mt8xEHcG2eAUqMh4J1Xm5DIU0
	J3yjcFdX5T+Bg7MIuzDMydBTb+tNYFcakWbwUloMKLZxAmupbaAeIp+7NuDkaDISXMLjdggGJzRxR
	hENCi6p6++mduwGVyBM3oEUTnqEl7fKCtG1SXZff4M8gxLPbqjEYpHL/wysy3TWhcU4nDJozzBriM
	qVZUVCUYD9SJ6q1Ui3FKCHSW3jyHXFxr2laV4ykyzPrWg5wtPR6hFVhmH55mE4R1iBv5B+bELtg9Y
	fiZhUEUnlROWi7K6jukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFgg-0000000Fbyy-3N3E;
	Sun, 24 May 2026 20:44:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFgd-0000000FbyN-29Tc
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 20:44:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OHkSVv1350437
	for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 20:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQogeAgKiIqEc7XfVmxQA3qRRaUT1qCQOY0TNjex+LU=; b=SDMwIDRLWuVNZiKP
	EQUhukwq1nvAt6RnHV0CGmtrZmXMpTDdHTTQ4v05SKPUXVJYkJU3UmkcHwSCph8I
	Ct1d2W/ieIBYXB+3zj/jSJV9CFZ7EZbDxtli8+50qG8Ec+DF4kjjzBwuxfFA/XHi
	NTh1CRxpOt49lxMKW5fsVKiDJDFF2eOrZj+vlm1DtoRHzTqzA5xV0UqhighZQIID
	5KVUZ12WWIgFOa4l+UneKfwgfXLx2+7jml2rO4lpwZWii/ipUXF84kQsDvNJMQCd
	fmBlsL7VPxnkZY+YPVNYacx9MkxxJUZk7XsGI4uJCJZg7J3/COG3x5FXkGwAWtdj
	uy62rA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3jgv3q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 20:44:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ef62078ee7so10026373eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 13:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779655477; x=1780260277; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cQogeAgKiIqEc7XfVmxQA3qRRaUT1qCQOY0TNjex+LU=;
        b=Rz46X1u/WajBWCNDafu+rpPHGGbSw/6pdbDSd38/Ipf29h4LvbL/xSF3via9eS+6ab
         4I0MylLYeB/KMU/V6M0wcyOwWYSBjeUAMOJqs937nI2k732vYa+q5ENCgttulzdsxiNA
         ZasyrD3+WHvDGzr64OLz0o6wQrPM9vkoBip4riwRhvBqyE5JiFEF20DrbNWzf4nkO5L8
         zF9YWfKYcQuH1dRVg+E8y7U1bLR1dzAOEKoHb7X7//MNuZTzH9ZHtsje8+1dNfGaAn/N
         M3hqDZD1vv7Oq/38LgNvxQYSsEVj9JBGV43afdAU9/XuldlPvQ54lYCIDp8yEottscEl
         dqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779655477; x=1780260277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQogeAgKiIqEc7XfVmxQA3qRRaUT1qCQOY0TNjex+LU=;
        b=TDbHFubNTq0T508+gMc1OP4kEZR9LNEkZbgMSCt1rgKuY0g+IHTVWfhsByZsaB/Xhb
         tIG9yZHATyMT6lbgfqTdalhzNdFaRnMx4TbYKSCnXdXxZYyLnJe8hO3VrscbOAA5UAr3
         35lOgjxJ7M89jH4JehsH3HBvHp8Gh9wYVesdbQ8k9CiNxYtQJPhoObH0tEfEGESakIPp
         WBj8jhZKasAAIWg/Wvpom9HhjShTuVtBXN+uyOkX9NBAh0p06f4Qk2IyH79JwF5g1e84
         QM2Zwu2Hh3E3VlJpuz5NYJXHSwy/9r8tpR/vycw8zeW6hjJcnpCPYrDfbqW5IIDv8hYT
         8OJg==
X-Forwarded-Encrypted: i=1; AFNElJ8nvavFFFECkRMaAX0xc43oaYc1eEVUbREzlAtVbvGa0EykziU3he4oOuieWS80CwbPbWgeBTREzGN1Ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQsFpLpSHkjc6vIN0qzmIkiB6ccU1ggLwU/qQj0b7vCvndiKU1
	ITM2SwyoFmXWrx2xeWu3zrKfwXJ1fZEqv2DMAHdyg/kEnAnxr9xuSOf2DR20VbC2eFrNxzD4l9t
	p5gLYGPlo/D4jQaD0juVjUFYCEm83qK0mHvK8p9FTppPymmXLuhKwDPQw3VVHY5ALuYHzeMU=
X-Gm-Gg: Acq92OHP1cJRPIGPeJo/keDbcyzoCy4iMfOxVYqdH2mhXW476E+u+C0/1SqXQpPW0YR
	tNAm9R3HjRO9DTeSFnyTZEefCi+AhgL2+b4Ja0XbY5KLZTdaNaUBtMT0zzlJoJJjPCS8F5kxAo6
	LMG1q6OqjTdk9t02R9PZ5Y6PWsXXJr+wDRfq6yWurukM62K3YgYtR+dTkKbn1kwD7vxEzp7IJrO
	HywpzHobs2sFJmuyuWyAKrVG9P9fWYt6hsHY3k27Efot0lbVMAHHWgXxL5533iZdTqpTeaAebfM
	dndntxtUuwqVoHGuWPyvM47lMRypoeZXXqtfnbsxtq7BWRAynLnXvGazP+O76ZK+Il5+0nvE+f7
	joUmLkzgJRL9DgyHch3Bd6yhPwhN+5Ag=
X-Received: by 2002:a05:693c:2d84:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3044922a698mr4947812eec.30.1779655477124;
        Sun, 24 May 2026 13:44:37 -0700 (PDT)
X-Received: by 2002:a05:693c:2d84:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3044922a698mr4947787eec.30.1779655476479;
        Sun, 24 May 2026 13:44:36 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f1fe3esm10158904eec.7.2026.05.24.13.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 13:44:35 -0700 (PDT)
Date: Sun, 24 May 2026 15:44:34 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        akpm@linux-foundation.org, pasha.tatashin@soleen.com,
        andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com,
        debug@rivosinc.com, baolin.wang@linux.alibaba.com,
        zhangchunyan@iscas.ac.cn, apopple@nvidia.com, namcao@linutronix.de,
        wangruikang@iscas.ac.cn, apatel@ventanamicro.com,
        liu.xuemei1@zte.com.cn, ajones@ventanamicro.com, cleger@rivosinc.com,
        charlie@rivosinc.com, hui.wang@canonical.com, guodong@riscstar.com,
        pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [External] Re: [PATCH v2 1/2] riscv: track effective hardware
 PTE A/D updates
Message-ID: <y2euih5fneiiisawwstfaqjufivpup2lag6yfme2io452v4dn6@n2tieehvqbsy>
References: <20260522142358.87589-1-cuiyunhui@bytedance.com>
 <eklh2rwzk4gcmeampzq5gj5kktspgtsm6znc56bqvg77rrg4yl@vhjrhmg6f2n2>
 <CAEEQ3w=+YXS_KE+ZeVH0TF_NQCa6aS=tQrvNyO1HA66r9TykcA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=+YXS_KE+ZeVH0TF_NQCa6aS=tQrvNyO1HA66r9TykcA@mail.gmail.com>
X-Proofpoint-GUID: voEldFS01BgaJDLyaVzfzlntVXmcBY1v
X-Proofpoint-ORIG-GUID: voEldFS01BgaJDLyaVzfzlntVXmcBY1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDIwNyBTYWx0ZWRfX68ZP5nGwXY2E
 zALszk05X9KlOZZrkor4tmOAL6RnofJzzKQRbJG68Uh9uHnkUfzpTflEF99/QW1jLE+A4xsCkOQ
 9xoathuBFwOEBTCtGiSIy5qf94UPN91qAtnuFM+aKWws9lYblOVU4qBYS0/VeRiYwbpS4ddhZH9
 VxfMcOIoClMsmcX1Veif5EV9TTnRQstKU6Vf7OrKstWijx9rDQeWJqoe77a09u/Rwtg0R1eu5Wr
 5Lv6Y/XGgrbIQ61PcfwVePi45PlXmtxfmWIy3gWHupU/v7sfuaISp93ibGkqVG4zz3yjxxOH0aG
 HBMr+H8eay6rjiZhHuIQqy+0E7kFvjg0aUuej57DVSZd20SnK0ygfh0kL7YwWA68bnUzJRLpD2H
 6vWbvkyCKsw/UlSROgT4Hbob9AGj2wB+yFLhUMNBRAwugSKnhyJjNNuHBwRCE5w7Q5w6eAoCDs9
 dbOhFSZSdig6OSx35CQ==
X-Authority-Analysis: v=2.4 cv=Do9mPm/+ c=1 sm=1 tr=0 ts=6a136336 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=mA-A_AazHyMx1wTyVvMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_134439_704733_19C22B44 
X-CRM114-Status: GOOD (  39.16  )
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

T24gU2F0LCBNYXkgMjMsIDIwMjYgYXQgMTE6NTg6MDVBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBBbmRyZXcsCj4gCj4gT24gU2F0LCBNYXkgMjMsIDIwMjYgYXQgMzo1OOKAr0FNIEFu
ZHJldyBKb25lcwo+IDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gT24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMTA6MjM6NTdQTSArMDgwMCwgWXVuaHVpIEN1aSB3
cm90ZToKPiA+ID4gVHJhY2sgdGhlIGVmZmVjdGl2ZSBoYXJkd2FyZSBQVEUgQS9EIHVwZGF0ZSBt
b2RlIHNlcGFyYXRlbHkgZnJvbQo+ID4gPiBTdmFkdSBjYXBhYmlsaXR5IGRpc2NvdmVyeS4gV2hl
biBib3RoIFN2YWRlIGFuZCBTdmFkdSBhcmUgcHJlc2VudCwKPiA+ID4gZW5hYmxlIFNCSSBGV0ZU
IFBURSBBL0QgaGFyZHdhcmUgdXBkYXRpbmcgb24gZWFjaCBvbmxpbmUgQ1BVIHZpYQo+ID4gPiBD
UFVIUCBhbmQgdXNlIHRoZSByZXN1bHRpbmcgcnVudGltZSBzdGF0ZSBmb3IgYXJjaF9oYXNfaHdf
cHRlX3lvdW5nKCkuCj4gPiA+IEZhbGwgYmFjayB0byBzb2Z0d2FyZS1tYW5hZ2VkIEEvRCB1cGRh
dGVzIGlmIGVuYWJsaW5nIGhhcmR3YXJlIHVwZGF0ZXMKPiA+ID4gZmFpbHMuCj4gPiA+Cj4gPiA+
IFdoZW4gU3ZhZHUgaXMgcHJlc2VudCB3aXRob3V0IFN2YWRlLCBhc3N1bWUgaGFyZHdhcmUgUFRF
IEEvRCB1cGRhdGluZwo+ID4gPiBpcyBlbmFibGVkIGZyb20gYm9vdCwgYW5kIGRvY3VtZW50IHRo
YXQgYm9vdC10aW1lIGJlaGF2aW9yIGluIHRoZSBEVAo+ID4gPiBiaW5kaW5nLgo+ID4gPgo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+
ID4gUmV2aWV3ZWQtYnk6IFFpbmd3ZWkgSHUgPHFpbmd3ZWkuaHVAYnl0ZWRhbmNlLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgfCAgNiArLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICAg
ICAgICAgIHwgIDYgKysKPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAg
ICAgICAgICAgICB8ICA4ICstLQo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
ICAgICAgICAgICAgICAgIHwgNTggKysrKysrKysrKysrKysrKystLQo+ID4gPiAgNCBmaWxlcyBj
aGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCj4gPiA+IGluZGV4IDJiMGE4YTkzYmIyMTQuLmIwOTg4OGU5OTg4ZGUgMTAwNjQ0
Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gPiBAQCAtMjk0LDEwICsyOTQsMTAgQEAgcHJvcGVy
dGllczoKPiA+ID4gICAgICAgICAgICAgICAgIG9mIHRoZSBQVEUgQS9EIGJpdHMgb3IgcGFnZSBm
YXVsdHMgd2hlbiB0aGV5IG5lZWQgdXBkYXRlZC4KPiA+ID4gICAgICAgICAgICAgIDIpIE9ubHkg
U3ZhZGUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lIFN2YWRlIHRvIGJl
Cj4gPiA+ICAgICAgICAgICAgICAgICBhbHdheXMgZW5hYmxlZC4KPiA+ID4gLSAgICAgICAgICAg
IDMpIE9ubHkgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lIFN2
YWR1IHRvIGJlCj4gPiA+IC0gICAgICAgICAgICAgICBhbHdheXMgZW5hYmxlZC4KPiA+ID4gKyAg
ICAgICAgICAgIDMpIE9ubHkgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3Qg
YXNzdW1lIFN2YWR1IGlzCj4gPiA+ICsgICAgICAgICAgICAgICBlbmFibGVkIGF0IGJvb3QuCj4g
PiA+ICAgICAgICAgICAgICA0KSBCb3RoIFN2YWRlIGFuZCBTdmFkdSBwcmVzZW50IGluIERUID0+
IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUKPiA+ID4gLSAgICAgICAgICAgICAgIFN2YWR1IHR1cm5l
ZC1vZmYgYXQgYm9vdCB0aW1lLiBUbyB1c2UgU3ZhZHUsIHN1cGVydmlzb3IgbXVzdAo+ID4gPiAr
ICAgICAgICAgICAgICAgU3ZhZHUgaXMgZGlzYWJsZWQgYXQgYm9vdCB0aW1lLiBUbyB1c2UgU3Zh
ZHUsIHN1cGVydmlzb3IgbXVzdAo+ID4gPiAgICAgICAgICAgICAgICAgZXhwbGljaXRseSBlbmFi
bGUgaXQgdXNpbmcgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbi4KPiA+Cj4gPiBMb29rcyBnb29kIHRv
IG1lLCBidXQgSSB0aGluayBkdCBiaW5kaW5nIGNoYW5nZXMgYXJlIHR5cGljYWxseSBpbiBzZXBh
cmF0ZQo+ID4gcGF0Y2hlcy4KPiAKPiBPa2F5LCBJJ2xsIHNwbGl0IHRoZSBEVCBiaW5kaW5nIHVw
ZGF0ZSBpbnRvIGEgc2VwYXJhdGUgcGF0Y2guCgpNYWtlIHN1cmUgdGhlIGFwcHJvcHJpYXRlIGxp
c3RzIGFuZCBtYWludGFpbmVycyBhcmUgQ0MnZWQgdG9vLgoKPiAKPiA+Cj4gPiA+Cj4gPiA+ICAg
ICAgICAgIC0gY29uc3Q6IHN2YWR1Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5o
Cj4gPiA+IGluZGV4IDczOWZjYzg0YmY3YjIuLmFkOWZhZDZlZWU1NWQgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiA+IEBAIC0xMjgsNiArMTI4LDEyIEBA
IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgewo+ID4gPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBy
aXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdOwo+ID4gPiAgZXh0ZXJuIGNvbnN0IHNp
emVfdCByaXNjdl9pc2FfZXh0X2NvdW50Owo+ID4gPiAgZXh0ZXJuIGJvb2wgcmlzY3ZfaXNhX2Zh
bGxiYWNrOwo+ID4gPiArREVDTEFSRV9TVEFUSUNfS0VZX0ZBTFNFKHJpc2N2X2h3X3B0ZV9hZF91
cGRhdGluZyk7Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNj
dl9oYXNfaHdfcHRlX2FkX3VwZGF0aW5nKHZvaWQpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIHJldHVy
biBzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZyaXNjdl9od19wdGVfYWRfdXBkYXRpbmcpOwo+ID4g
PiArfQo+ID4gPgo+ID4gPiAgdW5zaWduZWQgbG9uZyByaXNjdl9pc2FfZXh0ZW5zaW9uX2Jhc2Uo
Y29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCk7Cj4gPiA+ICBzdGF0aWMgX19hbHdheXNf
aW5saW5lIGJvb2wgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fbGlrZWx5KGludCBjcHUsIGNvbnN0
IHVuc2lnbmVkIGxvbmcgZXh0KQo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gPiBp
bmRleCBhMWE3YzY1MjBhMDk1Li4yMDY2M2E0NjZjZjZjIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaAo+ID4gPiBAQCAtNzMyLDE0ICs3MzIsMTQgQEAgc3RhdGljIGlubGlu
ZSBwZ3Byb3RfdCBwZ3Byb3Rfd3JpdGVjb21iaW5lKHBncHJvdF90IF9wcm90KQo+ID4gPiAgI2Rl
ZmluZSBwZ3Byb3RfZG1hY29oZXJlbnQgcGdwcm90X3dyaXRlY29tYmluZQo+ID4gPgo+ID4gPiAg
LyoKPiA+ID4gLSAqIEJvdGggU3ZhZGUgYW5kIFN2YWR1IGNvbnRyb2wgdGhlIGhhcmR3YXJlIGJl
aGF2aW9yIHdoZW4gdGhlIFBURSBBL0QgYml0cyBuZWVkIHRvIGJlIHNldC4gQnkKPiA+ID4gLSAq
IGRlZmF1bHQgdGhlIE0tbW9kZSBmaXJtd2FyZSBlbmFibGVzIHRoZSBoYXJkd2FyZSB1cGRhdGlu
ZyBzY2hlbWUgd2hlbiBvbmx5IFN2YWR1IGlzIHByZXNlbnQgaW4KPiA+ID4gLSAqIERULgo+ID4g
PiArICogQm90aCBTdmFkZSBhbmQgU3ZhZHUgY29udHJvbCB0aGUgaGFyZHdhcmUgYmVoYXZpb3Ig
d2hlbiB0aGUgUFRFIEEvRCBiaXRzCj4gPiA+ICsgKiBuZWVkIHRvIGJlIHNldC4gVGhlIGNvcmUg
TU0gY29kZSBvbmx5IGNhcmVzIHdoZXRoZXIgaGFyZHdhcmUgdXBkYXRpbmcgb2YKPiA+ID4gKyAq
IHRoZSBhY2Nlc3NlZC9kaXJ0eSBzdGF0ZSBpcyBjdXJyZW50bHkgYWN0aXZlLgo+ID4gPiAgICov
Cj4gPiA+ICAjZGVmaW5lIGFyY2hfaGFzX2h3X3B0ZV95b3VuZyBhcmNoX2hhc19od19wdGVfeW91
bmcKPiA+ID4gIHN0YXRpYyBpbmxpbmUgYm9vbCBhcmNoX2hhc19od19wdGVfeW91bmcodm9pZCkK
PiA+ID4gIHsKPiA+ID4gLSAgICAgcmV0dXJuIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHko
UklTQ1ZfSVNBX0VYVF9TVkFEVSk7Cj4gPiA+ICsgICAgIHJldHVybiByaXNjdl9oYXNfaHdfcHRl
X2FkX3VwZGF0aW5nKCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICAvKgo+ID4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gPiA+IGluZGV4IGY0NmFhNTYwMmQ3NGQuLjgzMWRkNmE3YzFhMDYgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ID4gQEAgLTM1LDYgKzM1LDcgQEAKPiA+
ID4gIHN0YXRpYyBib29sIGFueV9jcHVfaGFzX3ppY2JvejsKPiA+ID4gIHN0YXRpYyBib29sIGFu
eV9jcHVfaGFzX3ppY2JvcDsKPiA+ID4gIHN0YXRpYyBib29sIGFueV9jcHVfaGFzX3ppY2JvbTsK
PiA+ID4gK0RFRklORV9TVEFUSUNfS0VZX0ZBTFNFKHJpc2N2X2h3X3B0ZV9hZF91cGRhdGluZyk7
Cj4gPiA+Cj4gPiA+ICB1bnNpZ25lZCBsb25nIGVsZl9od2NhcCBfX3JlYWRfbW9zdGx5Owo+ID4g
Pgo+ID4gPiBAQCAtMjg3LDE1ICsyODgsNjAgQEAgc3RhdGljIGludCByaXNjdl9leHRfenZmYmZ3
bWFfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPiA+ID4g
ICAgICAgcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC1zdGF0aWMg
aW50IHJpc2N2X2V4dF9zdmFkdV92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9k
YXRhICpkYXRhLAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
dW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKPiA+ID4gK3N0YXRpYyB2b2lkIHJpc2N2X3NldF9o
d19wdGVfYWRfdXBkYXRpbmcodm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgc3RhdGljX2JyYW5j
aF9lbmFibGUoJnJpc2N2X2h3X3B0ZV9hZF91cGRhdGluZyk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+
ID4gK3N0YXRpYyBpbnQgcmlzY3ZfaHdfcHRlX2FkX3VwZGF0aW5nX3N0YXJ0aW5nKHVuc2lnbmVk
IGludCBjcHUpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIGludCByZXQ7Cj4gPiA+ICsKPiA+ID4gKyAg
ICAgcmV0ID0gc2JpX2Z3ZnRfc2V0KFNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORywgMSwgMCk7
Cj4gPiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ID4gKyAgICAgICAgICAgICBpZiAocmV0ICE9IC1F
T1BOT1RTVVBQKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCJDUFUldSBmYWls
ZWQgdG8gZW5hYmxlIGhhcmR3YXJlIFBURSBBL0QgdXBkYXRpbmc6ICVkXG4iLAo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNwdSwgcmV0KTsKPiA+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gcmV0Owo+ID4gPiArICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4g
PiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgX19pbml0IHJpc2N2X2h3X3B0ZV9hZF91
cGRhdGluZ19pbml0KHZvaWQpCj4gPiA+ICB7Cj4gPiA+IC0gICAgIC8qIFNWQURFIGhhcyBhbHJl
YWR5IGJlZW4gZGV0ZWN0ZWQsIHVzZSBTVkFERSBvbmx5ICovCj4gPiA+IC0gICAgIGlmIChfX3Jp
c2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfU1ZB
REUpKQo+ID4gPiAtICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+ID4gKyAgICAg
Ym9vbCBoYXNfc3ZhZGUsIGhhc19zdmFkdTsKPiA+ID4gKyAgICAgaW50IHN0YXRlOwo+ID4gPgo+
ID4gPiArICAgICBoYXNfc3ZhZGUgPSByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NW
X0lTQV9FWFRfU1ZBREUpOwo+ID4gPiArICAgICBoYXNfc3ZhZHUgPSByaXNjdl9oYXNfZXh0ZW5z
aW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfU1ZBRFUpOwo+ID4gPiArCj4gPiA+ICsgICAgIGlm
ICghaGFzX3N2YWR1KQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPiArCj4gPiA+
ICsgICAgIGlmICghaGFzX3N2YWRlKQo+ID4gPiArICAgICAgICAgICAgIGdvdG8gZW5hYmxlOwo+
ID4gPiArCj4gPiA+ICsgICAgIHN0YXRlID0gY3B1aHBfc2V0dXBfc3RhdGUoQ1BVSFBfQVBfT05M
SU5FX0RZTiwKPiA+Cj4gPiBJIGRvbid0IHRoaW5rIENQVUhQX0FQX09OTElORV9EWU4gaXMgY29y
cmVjdC4gU2V0dGluZyBIVyBBL0QgaXMgc29tZXRoaW5nCj4gPiB0aGF0IHNob3VsZCBiZSBkb25l
IGF0IF9TVEFSVElORyB0aW1lLgo+IAo+IEkgZG9uJ3QgdGhpbmsgbW92aW5nIHRoaXMgdG8gX1NU
QVJUSU5HIGlzIHRoZSByaWdodCBmaXgsIGJlY2F1c2UgdGhpcwo+IGNhbGxiYWNrIGNhbiBmYWls
LCB3aGlsZSBfU1RBUlRJTkcgY2FsbGJhY2tzIGFyZSBub3Qgc3VwcG9zZWQgdG8gZmFpbC4KPiAK
PiBDUFVIUF9BUF9PTkxJTkVfRFlOIGFscmVhZHkgY292ZXJzIGJvdGggdGhlIENQVXMgdGhhdCBh
cmUgb25saW5lIHdoZW4KPiBjcHVocF9zZXR1cF9zdGF0ZSgpIGlzIGNhbGxlZCBhbmQgQ1BVcyBi
cm91Z2h0IG9ubGluZSBsYXRlciwgZS5nLiB3aXRoCj4gbWF4Y3B1cz0uIElmIEZXRlQgc2V0dXAg
ZmFpbHMgZm9yIGEgbGF0ZXIgQ1BVLCBvbmx5IHRoYXQgQ1BVJ3Mgb25saW5lCj4gb3BlcmF0aW9u
IGlzIGFib3J0ZWQuCgpUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBsYXRlciBob3RwbHVnZ2VkIGhh
cnRzIHdpbGwgc2VlIHRoZSBnbG9iYWwgc3RhdGljCmtleSBzbyBzb2Z0d2FyZSB3b24ndCB1cGRh
dGUgQS9EIGJpdHMgYW5kIEhXIEEvRCB1cGRhdGluZyB3b24ndCBiZSBhY3RpdmUKb24gdGhhdCBo
YXJ0IGVpdGhlciB1bnRpbCBhZnRlciBDUFVIUF9BUF9PTkxJTkVfRFlOIC0gcmlza2luZyB1bmV4
cGVjdGVkCmV4Y2VwdGlvbnMuIFNpbmNlIF9TVEFSVElORyBjYWxsYmFja3MgY2FuJ3QgYWJvcnQg
aG90cGx1ZyBhbmQgc2luY2Ugd2UKcmVhbGx5IHdhbnQgSFcgQS9EIGFjdGl2ZSBiZWZvcmUgdGhl
IGhhcnQgdGFrZXMgaXRzIGZpcnN0IHBhZ2UgZmF1bHQsIHRoZW4KbWF5YmUgdGhpcyBuZWVkcyB0
byBiZSBkb25lIGF0IHNlY29uZGFyeSBzdGFydHVwIHRpbWUuCgpUaGFua3MsCmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
