Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475BFC53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 12:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wZDWr41IGPSf34fZ9oXjzYC43B1zhXVl5lF9K9LJqs=; b=GlALBwOPycq9oT
	I+V+xzVWoEXCFeIGXyFTA0pL5lphQHo2IY8/L93dt8OD/1oh5B0qREt8j4aJvo7OBovSPO9U04jyd
	7eh5x45eLBDyurcYs12QUdlXi7h0pb8XHDaftaP7m9KrzZHa7pMNYuS1wBZTn+ik5PdvSPq5NEJaG
	e2frfTQkR7/YlxHIOOF0X3s+orCOfleMAfCxi3y/GvpilBBQkirDRa3yze/bc1EGOWwND9n25KRui
	FYxCQz5FTT1mHfyzvDAEQ1JcDxUcTgXCz5no+a8O9b/YLLd4nCdT/uuKbG+BFvQL016jwrgVyt5uR
	31sNIrk4n/th3Q3MHbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohKC-00000005Iat-2m4g;
	Tue, 28 Jul 2026 12:54:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohK9-00000005IaW-2fVl
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 12:54:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHt6m2606205
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 12:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=2cawBiWQxfIarR0xDzJpp07gga51kPcOc4W3XKmecSg=; b=Gu
	oFVeyrj5q7qEfmAq9Ld9pF3nypwgyzdkuGSuoVTrliv1yNCHhZMtRTyw6zyxUXed
	t8JZrp7fZ4Usyenfy/Xmmfzzcauy0t9EvBjpfHflJsAUruSJ7i3Yd3Lwu6iJ87VT
	J8cUeEMAQv0iItVbW8kkoq58V8clS1/cXeexBCbcq/+hWo0xY4a9cMyRUEeUVADz
	aRRJaTgeyTHySUXMG5/VCYg4YbkxpYiN4HK+RNjr7WNgJg5k3t+iy0hEulHTBk2S
	/vgmHalkhe65yZjvFnEgTpanqwYpMzinT/iEHkpm32sdEqV9LrAzUDjMnujYjQHQ
	KeLaP8g/8L9ak2VswBtQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19j2w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 12:54:19 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-667d0d587e0so9896052d50.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 05:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785243259; cv=none;
        d=google.com; s=arc-20260327;
        b=XjGreNVZVdng4clUyIMC6ePXDk0xWg8vd8uafMh+o7w0NVqhiFr2pEeaujipp7btxk
         RqF8Gt8aVwgepGuk2gO7ElC48g1KHEMLQ6uHoz/XMaawi8FviPBED4NImhVPLuYwRhNh
         9sI4xXwwNZwnD1npC8muQQIcJkCby74AGlCAuFNXuDT1ME8JJUnt0gyATCU0ZBT7Ry7H
         VCyfzA0MukIMtTlgZRmLhqF/hV+1QqOMqssCuJbFDA1auowuJCxZMtxkrvWZPv73QEPk
         zEZwpv3C2j1ALFbqmCSi+OELwL80sVWmXPTpLHVfB1g7M4V8tRWHaO0EmcfUVJkO9EhR
         AZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=2cawBiWQxfIarR0xDzJpp07gga51kPcOc4W3XKmecSg=;
        fh=YC4HlGWhyxBSZs4+I+mb9nfAx2NsBr9kePXfNZNweSw=;
        b=MdyaMR4H05PO3K2GQn3vx1zLhTCVSvYH+DWjxa+TcK752FIGDD9x2iDscB6jamc6Fe
         sUTgg+imfx2UvopLhZkHVS3u2WBDVdd5bzsvqRJgWFP/+QnefCWjvNEuYjDvqe1xDGj4
         XSTBoojpOW5ceWzvz1ab4hHLan6lWrQBtkgzQ81gzPHcvHzUyJP5XgbBMO2IWGaiuPgG
         U89MNU6wEDT/Fp0E7jB9AsItsJhIIKBaFEZb15ut4XiupSV8icTKVKV+WwqFWzSM61H6
         hyVo50GpHYYOuoTphHH4bSVne/a7vHAKxG5qnAK0vWSbgZnmu99UbH3G33qI/PtjvWMb
         QFZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785243259; x=1785848059; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2cawBiWQxfIarR0xDzJpp07gga51kPcOc4W3XKmecSg=;
        b=ChKdbjRNsi4aODx39oOJa8Xn7hWV81DjtWwrXlHjq5X9M4cv3JNQ1Mu8jZW+/X/u0X
         iusRgB3xQ9Ig8YFPZcn8txCqJisxjmQ4UcjeRbyIR7OW0CKOyOZshl5JytoeOosc2PB7
         hQcGKS/APGyShzop8qFgYb9074DpirEiM4PHWj9iHL2U6xz74UXj5xEvQmp1B8KoSiF/
         mH7ShUS0RUXyFKlkQQQcJGpNMtDF4pU9X1dHLfs7N4fGniR6l8gAnVX76pE3K5RgW55C
         jCXBQGRXms+4icLMX9J25rygRaKtZktcbI1oImVzVjgwKrK7ikuRB7A5WY+GEp9Bp2+l
         GmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243259; x=1785848059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cawBiWQxfIarR0xDzJpp07gga51kPcOc4W3XKmecSg=;
        b=pn7d+ixGMFfhle6CkjFEEqi9LhIm96gMTvRn4CkCd+BXFa7WbS0za/H3onCOfjPTRj
         +FZ0bZIqfa/N7oFCNdVvPqZkT0yD/rP0qX7OpS4WdgVA1bJwUlC4sSu3N3rEkTyb+igf
         C7KKdVpHikf9aL2NcrSDBYl76vem0UL2mdBi/9Kpla3Xexiz/AcHY2Y3Sz4RGSX7ehTL
         inAj0QfFxMqpDrKUPRGWKmEjTJZRsHTCXJiJsF2MqNs5W/KOHgOmhyzLQST27Va0vccK
         z/khSZFCUKmQfnxCH+kfoH3iXcdwCGQ4jgnFwuEG8v0nzHWzkQc5YIVFfcgtN8ZshA2v
         IX9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpVcKg7WJ1omaK502QELZp0m05uEXeqxwPqMVGLhvyF4yL0xGgz+k5cO0ub7PgCIMPngGq1MZk6NZRQIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXlChWrM3IOtfcRr6QSPDbbz7CfpqijhebKsBlINoDZCg2f7hn
	jpHu4yuMsr7Fgidu3oAS57J5oOeepZco6dSNOxiZnxi/mgDMKJR7RvTcKQV1oPDDA5pqNu/I3Yd
	tncK0mXQll9ETZ3V+zcOTfcRkQHegy0pPVYHjAWUigW2c8ywHbziCQhjGH3ar3f/ngTQvCx5hQz
	9sOT3AuF4OG2jYlS7b8QT+cE24VOx8OjwitzHfrkXu0m+mRQ==
X-Gm-Gg: AR+sD12Gsul5iNnyvzAr876Q64I36N3B49zY9dCrKRsHgcF7OqpQI1DSjLqturTCzyI
	zX0bgawsHskEimaeQ8kfmAiN2P63v/7PdfCnkxbyYN7EI2YQEgtKtQ27Tn9XpU2iHN+SpxZOcQk
	CROge0FeGaiXu75AYMpNbpIu/1QEVf9wxEWMhegjQD33GZxmDKYPXFkgx4+Q==
X-Received: by 2002:a05:690e:4395:b0:668:1c09:aef1 with SMTP id 956f58d0204a3-669054c30c9mr601988d50.6.1785243259019;
        Tue, 28 Jul 2026 05:54:19 -0700 (PDT)
X-Received: by 2002:a05:690e:4395:b0:668:1c09:aef1 with SMTP id
 956f58d0204a3-669054c30c9mr601973d50.6.1785243258645; Tue, 28 Jul 2026
 05:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com>
In-Reply-To: <20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:24:06 +0530
X-Gm-Features: AUfX_mwIyP8SKtHFksxOpexuAlrA0_ifqJrmlt19_-9C5OcL2egVfaB2UDApqMo
Message-ID: <CAB19ukH1Srbw+Yko_-21DiV7Wc0ysJX9cmE7xDTwtrmUm_5rMw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: acpi: Handle LPI architectural context loss flags
To: Peixin Xie <peixin.xie@linux.spacemit.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
        Oza Pawandeep <quic_poza@quicinc.com>, Will Deacon <will@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
        stable@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a68a67b cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8 a=lv0vYI88AAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YoT47lCsnKj-Z75T7f8A:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22 a=FO4_E8m0qiDe52t0p3_H:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExNCBTYWx0ZWRfX+z0Nq4JSYoao
 0tsX2nDW8RqI27Co7bQ7qt9/t0UMCkIYsv2qSI4Ms0yViUVdvx0Dg2ERjVywUWR9mkBUdmKYBgf
 k0DETRZaxtfPSyV5nO9BzTW2AUS8VzvDvAvsbwk6jVkzS+l6GC4/LzCLac4dkUc3HiHWorVQvWd
 yAf5COvkFn8jmPQLovhpnQHgv5ltJ+4STA0e1aWNeaGy4oHtuhgMCJP67uzJy0jZ/eSTovAAY0K
 69IPDJoz9LZYxsmo7R2NZ1wTp62cah/ayH0M9Ga2UJ7eDjksCIS9yRL94ZjSTycag0j5RdVzhSi
 FT8SPpNkgQDoFbQ/Rh33jnYgLuQuvbP70yN82MXc7l6o2HRlnubAfJLWX9FZZ6cbXopbdwTcOBQ
 JW+WTG9u/0t2usUFyAJK80Ox7Jnv2dv+jwVi+6T/KSB0tO9QtQpomHn3j4eIew4UKr4NZk+Friy
 wnpYNyanbU7BbQgGnxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExNCBTYWx0ZWRfX+FwTCd/KXNwR
 jsYF3Ht8EqhyrNSbVCzkrddqj8KJ24fFYu6SmjQP8zznxzy1Q1Cu465RGqF7Vhm769+r8C3Uuy1
 hfXpWkjaOAvosaTGzX+PXO2tUi+7ROA=
X-Proofpoint-GUID: Vj3HjEyWzUJyka20jNiGUfqIEljIeAE7
X-Proofpoint-ORIG-GUID: Vj3HjEyWzUJyka20jNiGUfqIEljIeAE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_055421_818662_14CC754B 
X-CRM114-Status: GOOD (  22.66  )
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
Reply-To: sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjgsIDIwMjYgYXQgNToyNOKAr1BNIFBlaXhpbiBYaWUKPHBlaXhpbi54aWVA
bGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IENvbW1pdCA0Nzg1YWE4MDI4NTMgKCJjcHVp
ZGxlLCBBQ1BJOiBFdmFsdWF0ZSBMUEkgYXJjaF9mbGFncyBmb3IKPiBicm9hZGNhc3QgdGltZXIi
KSByZXBsYWNlZCB0aGUgZ2VuZXJpYyBub256ZXJvIGNoZWNrIGZvciBMUEkKPiBhcmNoaXRlY3R1
cmFsIGNvbnRleHQgbG9zcyBmbGFncyB3aXRoIGFyY2hfZ2V0X2lkbGVfc3RhdGVfZmxhZ3MoKS4K
PiBSSVNDLVYgZG9lcyBub3QgaW1wbGVtZW50IHRoZSBoZWxwZXIsIHNvIGl0IGZhbGxzIGJhY2sg
dG8gdGhlIHN0dWIKPiB0aGF0IHJldHVybnMgMC4gQ29uc2VxdWVudGx5LCBDUFVJRExFX0ZMQUdf
VElNRVJfU1RPUCBpcyBub3Qgc2V0IHdoZW4KPiBhbiBMUEkgc3RhdGUgbG9zZXMgdGhlIGhhcnQg
dGltZXIgY29udGV4dCwgcHJldmVudGluZyBjcHVpZGxlIGZyb20KPiB1c2luZyBhIGJyb2FkY2Fz
dCB0aW1lciBmb3IgdGhhdCBzdGF0ZS4KPgo+IEltcGxlbWVudCB0aGUgUklTQy1WIGhlbHBlciBh
bmQgbWFwIHRoZSBoYXJ0IHRpbWVyIGNvbnRleHQgbG9zcyBmbGFnCj4gdG8gQ1BVSURMRV9GTEFH
X1RJTUVSX1NUT1AuCj4KPiBGaXhlczogNDc4NWFhODAyODUzICgiY3B1aWRsZSwgQUNQSTogRXZh
bHVhdGUgTFBJIGFyY2hfZmxhZ3MgZm9yIGJyb2FkY2FzdCB0aW1lciIpCj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPiBBY2tlZC1ieTogU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAa2Vy
bmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogUGVpeGluIFhpZSA8cGVpeGluLnhpZUBsaW51eC5zcGFjZW1pdC5jb20+Cj4g
LS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIENvcnJlY3QgdGhlIEZGSCBzcGVjaWZpY2F0aW9uIHJl
ZmVyZW5jZSB0byBDaGFwdGVyIDIuMS4xLjIsCj4gICBUYWJsZSAzLCBhcyBzdWdnZXN0ZWQgYnkg
WWl4dW4uCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA3Mjgt
cmlzY3YtYWNwaS1scGktdGltZXItdjEtMS1jNzIyYmNlMDFlNDhAbGludXguc3BhY2VtaXQuY29t
Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oIHwgMTkgKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hY3BpLmgKPiBpbmRleCAyNmFiMzdjMTcxYmMuLjI2NDNlMjhmYzA4YyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYWNwaS5oCj4gQEAgLTEyLDYgKzEyLDggQEAKPiAgI2lmbmRlZiBfQVNNX0FDUElfSAo+
ICAjZGVmaW5lIF9BU01fQUNQSV9ICj4KPiArI2luY2x1ZGUgPGxpbnV4L2NwdWlkbGUuaD4KPiAr
Cj4gIC8qIEJhc2ljIGNvbmZpZ3VyYXRpb24gZm9yIEFDUEkgKi8KPiAgI2lmZGVmIENPTkZJR19B
Q1BJCj4KPiBAQCAtNjcsNiArNjksMjMgQEAgaW50IGFjcGlfZ2V0X3Jpc2N2X2lzYShzdHJ1Y3Qg
YWNwaV90YWJsZV9oZWFkZXIgKnRhYmxlLAo+Cj4gIHZvaWQgYWNwaV9nZXRfY2JvX2Jsb2NrX3Np
emUoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0YWJsZSwgdTMyICpjYm9tX3NpemUsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgKmNib3pfc2l6ZSwgdTMyICpjYm9wX3NpemUp
Owo+ICsKPiArLyoKPiArICogUklTQy1WIEZ1bmN0aW9uYWwgRml4ZWQgSGFyZHdhcmUgU3BlY2lm
aWNhdGlvbiBWZXJzaW9uIHYxLjAuMSwKPiArICogQ2hhcHRlciAyLjEuMS4yLiBBcmNoLiBDb250
ZXh0IExvc3QgRmxhZ3MsIFRhYmxlIDMKPgpJc24ndCBpdCBDaGFwdGVyIDMuMS4yLCBUYWJsZSA0
PwoKPiArICovCj4gKyNkZWZpbmUgUklTQ1ZfTFBJX0hBUlRfVElNRVJfQ1RYVF9MT1NUICAgICAg
ICAgQklUKDApCj4gKwo+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBhcmNoX2dldF9pZGxl
X3N0YXRlX2ZsYWdzKHUzMiBhcmNoX2ZsYWdzKQo+ICt7Cj4gKyAgICAgICBpZiAoYXJjaF9mbGFn
cyAmIFJJU0NWX0xQSV9IQVJUX1RJTUVSX0NUWFRfTE9TVCkKPiArICAgICAgICAgICAgICAgcmV0
dXJuIENQVUlETEVfRkxBR19USU1FUl9TVE9QOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9
Cj4gKwo+ICsjZGVmaW5lIGFyY2hfZ2V0X2lkbGVfc3RhdGVfZmxhZ3MgYXJjaF9nZXRfaWRsZV9z
dGF0ZV9mbGFncwo+ICsKT3RoZXJ3aXNlLCBMR1RNLgoKUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8
c3VuaWx2bEBvc3MucXVhbGNvbW0uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
