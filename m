Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969BECD98D2
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 04:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGYllr456mJUnlQkrBINcB4Alh3FmF0tTe5SRfWbWD8=; b=XUKEMXjGDR6pxM
	2T1+OJ2jJYTlakRGncbC4cxZFha19PkuWvA/ZjIAbTEy6Cc/SznPO4XGRwLYI6oMjYhGMWCj1qAcu
	8tXl5yqujPDw38sFcYL5bXqlwRtTQT0RtxaOpQ+SZZrG5RIWfbLmfC5gNR7pEtzahUQ36tiWTQ3YO
	wE38Ud3+jpE/HxDBPKzYVGjwUmAOGKJskclVf3qyx5XpVRqZL8xnxwcoDEoZhRedm6UaPSiXS3QZh
	gfcpgYCUIhy1Ge7u6EqJ0COeBprhtH/lN1DHf9pXBrvsmn8YjF4Lz95qG3CHUnbGR2goYbZv6T/4H
	L8doxOptEyQHUNCdG1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLQt-0000000FCY3-22sm;
	Tue, 16 Jun 2026 04:29:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLQq-0000000FCXf-03ms
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 04:29:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G1xjvg2147840
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 04:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=uiSbxUJEm3aTACH1EONHBj8VwUud/W9+7fe3ejBUM84=; b=CH
	XtK9dremQVIChyCZsSd0DouORbk7d6dzThY/OxKgbxVEdEt2RPO2S/bbdTnd05+p
	oE4KTXvlpjfKr2cEbKffSpAUXmwNB3U2hw9Sg823cO0+0luq6ObHu2M+4+6E2b04
	2VThF4LeFvbl/MzpGrQ958bcOR03g0ZoZHtQb8OQn79BE5fTLqnHNf2sEQh9EAXT
	ocnh2jmCps8yxHbzccOxU6xgvaW1qDbC7Q0qf9PmETlEi/1slCjD5Zw3BsjzmjNY
	+fnhn4xQiVoooRGcr5ru5FXM9proradETUjFzMho/UUZjEA7riW/zNWtxv0/MQci
	HSjwDJJFxfCdu9TnjByg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf4pk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 04:29:45 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7f0c0b7601bso73245927b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 21:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781584185; cv=none;
        d=google.com; s=arc-20240605;
        b=lTHpNED9XQ9LRiUaJU7WwTkR9uAuxpRMN4NsR64kRmcTq2Xy90dGO0GNOUrKac+vLF
         xB1Pqigiuphw1Q7uTiJc6v8gr2ngjrWU5KnUh7KgUO9N8walETvTLXlNp0E5piQjftsU
         2f0AeBgzbDRodmk5qbq7CK+qFvmUIaeo7fYmBxbezhApIjdjQISTvkA5Bi1nxcbj0Tg3
         5thrFKg4xNq2Nw6ogZzNYGt123vv7dDPOiD651Z/4d7gI1bhDuh0NmL+F0dnElPUzbC8
         /eFr3ihXL/iXmUK472AgWsdjK8e4ecwVEoXNw2eSmmxSeI4wpfkuQWOrQk2CNId+9PNz
         iLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=uiSbxUJEm3aTACH1EONHBj8VwUud/W9+7fe3ejBUM84=;
        fh=+AmjhqwzKyJXFK4LThhAQJ6wzgXKfregU/KDox5SRdI=;
        b=VqXwElJAqtPHfB4chBEW2hRAotUIAJj6oy2LAnL+VB6ebqKyNpr8LN9YLmWligRuDh
         2G4EAomPCr7V5V+SLmLz0su9gtdsVXssomKgqUzUG2qq0nC5L3t+DT9dIUVuOW0aM5ai
         erW27TmnNOasA2bKA50BFOY4qnq1Gaq8jc6NgiPtR7yaQ+JsHnJRX2FRqzgyBD96Vx49
         4O/S+KaLD57MWIfjyB++56MJ5wMi+s4xIowY5JAHbTGar62rtDoLXGjJYLeETCK5507I
         Ipu8HEl52v5re7XQTBCyp7akjfDCKbw7BwNK2G4s1Jshznw7ABFSe7ZauMvKcerZ/xM6
         G2aQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781584185; x=1782188985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uiSbxUJEm3aTACH1EONHBj8VwUud/W9+7fe3ejBUM84=;
        b=jY3YZxlapua9cQk52Xj7fR2BqDa7BwQydDSjekc0OnKEEpp41xOqYAuRAFyiz+irE9
         T1b8K4jcCnQBLgTPXZiUYDJ6Kb8VFc6AcckWgWk8Vp/wsPKq7pALCvr9gJh/uVnKAFX4
         Q4hK1Y/muQHjSITNjvOEQvtOd9uJGqnYQpoYiSryzhCPh5VgLNm1olkKd14xXYldnm/o
         LNvQeosejwhPD25zUwIRKve07F0gH0k1g2zdK22SC6ct/8QLpF0VSL7Hx4is4R+tLgrF
         gO6bvuABpuzDVr205mm3ydlqe4PSpR/ShoiphPh+pcO6q8h5LTPZ1rmHotbZNH2QzOsL
         fytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781584185; x=1782188985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uiSbxUJEm3aTACH1EONHBj8VwUud/W9+7fe3ejBUM84=;
        b=Tr2hHCGKsWcPkvy3tzIyP09yUSvy5IkmZpUEpz+h0Wu958k6BRT1TJtMf3godssuWw
         bpGrG0OR+Lvk87YbADU7lUFfw1eAfaQURZTe/Gy50Hpv6PKtXQ76/hVU1NOoiUwj9lmU
         av4BjbLBVYcBno1v4CLNXOUkmD7oZ3YE8DchzR18cCO8Mv8KB9x7EH81tWStFd3jEPh0
         od+o3in8c+Am3EIIem2cIj43ikNnuhe2jV+Kbc7GAs748t0mqhUeOm1993VsCswBgAPo
         /jxl5Vhf9jAZTtKf5cJv+YIX01koAX5QEsCgueg0yy6z3NgnLLhNvJnB0ago47xW2OH2
         qWSw==
X-Forwarded-Encrypted: i=1; AFNElJ8AzEDpZUyugIayyeiZkeOinMRnkFqpn15zcBrM5to0i+3uUZLoudFoINyQ0s+AheTfBJdH8PwPyCGtew==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEBp6O4FWE/DQMrqeGMMQp7EQ4MuQ3iLhR1UMyYV/hkvoO58gQ
	ijsu5avSIgBSTkNhM5b+HxPhIrvDaXQ4DI+3JVCFm2KeIKj67xVntqbuetzpSgRLPc700u3Ptyl
	H1jdowqE/uCTPQNNzZINPSwupF7D4romP9bfry1DukM6mrCVy730/RoKnp+8HdFDgKp5hs7k4DL
	+2zTktHd6d78eKIXJpcBWh8c62/IzMW2y2lSc0TQ5INL4zvw==
X-Gm-Gg: Acq92OHjlMM4K4m/OY7GyKOypRJQBxvZWzuLLui8oFk9wxG+sHhEkg1oYlatzGityrR
	MyoXBUWqSdEfxwnWwdYVWnc2tlCvsQp3/J5Z7cOBrK1W9jOF6YtLt0XD+5h9HuLlzSEkmTUj/tU
	I/FiBI0P41kgLHph3kkui6dT5+V3nC/BMSu8G0D419705uOsWTT1CJx/xq1ZYnmQHkz0foZsMEJ
	FLYiE3+
X-Received: by 2002:a05:690c:6f0f:b0:7dc:61c7:5919 with SMTP id 00721157ae682-7f7b85260c8mr159907347b3.37.1781584185124;
        Mon, 15 Jun 2026 21:29:45 -0700 (PDT)
X-Received: by 2002:a05:690c:6f0f:b0:7dc:61c7:5919 with SMTP id
 00721157ae682-7f7b85260c8mr159907127b3.37.1781584184746; Mon, 15 Jun 2026
 21:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260615-efi_reset_shutdown-v1-0-9414edcbbab0@meta.com> <20260615-efi_reset_shutdown-v1-2-9414edcbbab0@meta.com>
In-Reply-To: <20260615-efi_reset_shutdown-v1-2-9414edcbbab0@meta.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 09:59:33 +0530
X-Gm-Features: AVVi8CcNRoHNlbuFDJquTotPLHdD45hKeD4LKVXtIQwwoO7UFjJZNufPU49TWgw
Message-ID: <CAB19ukEZhGc=4mi2D1e3FxZdJ_yENGt_=B+2R+3WDkxtT+xmYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Restart via EFI runtime services when available
To: Atish Patra <atish.patra@linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Atish Patra <atishp@meta.com>
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a30d139 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VabnemYjAAAA:8 a=EUspDBNiAAAA:8
 a=Vwtfa9UIybZDa4ZHMzYA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: dOJX_lO1-z0YW-mQrVhSwQypCTFbSPrv
X-Proofpoint-ORIG-GUID: dOJX_lO1-z0YW-mQrVhSwQypCTFbSPrv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA0MSBTYWx0ZWRfXyVT6T+Fgi6f5
 Mj+3PKOu3KgcrpIOD9j/6cimffog2N2uo2CHGBfSzegGF1LICYBfDivICMCc2ta+6cbbpyQBNm/
 db9jlsnta2009C+lWtmc3CL64988plY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA0MSBTYWx0ZWRfX1VwMZyTsZtmp
 vlb5BeC5VSH95lomEPFJVuR2SpTmDW5zborWwP+UIiCjuBhyUyK8DjtS35hrv1aWpT7XPsR2417
 vp7EfM71o1StDHDtJ5mqMq7FYjvL7P7pNDzPDnlSKy6lIBYipE6RZkfPeWiDAJfohi6zGLkFBbR
 OqJQgQlmY0hfjQbwT0rH2Rul3je0DOOJoWTBYrtAspJQaRiHHY6N+z3CqyznJZbW1Q/ByY7VoDd
 QzyU7kzXMZTmUDRn4LhrZkNug8LqeiY55h4sOpr7mTzYBKaCkZgYKgoaVwmZRipOeQAbi0WPp8+
 LjPMJinJd5x6o++y+0Da27jqwIxQGkf2CSG27mb/m0m2nAgfK3+pEx5UKmg9m7jp3JF/0qAr9/Z
 Wbwu8IUoz6j8y/3mn/98e0E5UBMu35a/ZEplT6e1zEzPiySI5BILEawe7WkLgBiCu6Dadek3k2x
 90gICeYbhRjpjDg27TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_212948_225946_67F93DB3 
X-CRM114-Status: GOOD (  18.35  )
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

T24gVHVlLCBKdW4gMTYsIDIwMjYgYXQgNDo1OeKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRy
YUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gRnJvbTogQXRpc2ggUGF0cmEgPGF0aXNocEBtZXRhLmNv
bT4KPgo+IEZpcm13YXJlLXByZWZlcnJlZCByZXNldCBhbmQgRUZJIGNhcHN1bGUgdXBkYXRlIHN1
cHBvcnQgcmVxdWlyZXMgcmVzZXQKPiB2aWEgRUZJIHJ1bnRpbWUgc2VydmljZXMgcmF0aGVyIHRo
YW4gZGlyZWN0aW9uIE0tbW9kZSBmaXJtd2FyZSBpbnZvY2F0aW9uCj4gdmlhIFNCSS4gVW5saWtl
IHBvd2Vyb2ZmLCByZXN0YXJ0IG1lY2hhbmlzbSBpcyBkaXJlY3RseSBjb250cm9sbGVkIGZyb20K
PiBtYWNoaW5lX3Jlc3RhcnQgZnVuY3Rpb24gdGhvdWdoLgo+Cj4gUHJlZmVyIHRoZSBFRkkgcnVu
dGltZSBSZXNldFN5c3RlbSgpIHNlcnZpY2UgZm9yIHJlc3RhcnQgd2hlbiBVRUZJCj4gcnVudGlt
ZSBzZXJ2aWNlcyBhcmUgYXZhaWxhYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEg
PGF0aXNocEBtZXRhLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcmVzZXQuYyB8IDcg
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvcmVzZXQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Jlc2V0LmMK
PiBpbmRleCA5MTIyODg1NzIyMjYuLjU0MWUyMTYyYzg1YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9yZXNldC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcmVzZXQuYwo+IEBA
IC0zLDYgKzMsNyBAQAo+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMTIgUmVnZW50cyBvZiB0aGUgVW5p
dmVyc2l0eSBvZiBDYWxpZm9ybmlhCj4gICAqLwo+Cj4gKyNpbmNsdWRlIDxsaW51eC9lZmkuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvcG0uaD4KPgo+
IEBAIC0xNyw2ICsxOCwxMiBAQCBFWFBPUlRfU1lNQk9MKHBtX3Bvd2VyX29mZik7Cj4KPiAgdm9p
ZCBtYWNoaW5lX3Jlc3RhcnQoY2hhciAqY21kKQo+ICB7Cj4gKyAgICAgICAvKgo+ICsgICAgICAg
ICogVXBkYXRlQ2Fwc3VsZSgpIGRlcGVuZHMgb24gdGhlIHN5c3RlbSBiZWluZyByZXNldCB2aWEg
UmVzZXRTeXN0ZW0oKS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKGVmaV9lbmFibGVkKEVG
SV9SVU5USU1FX1NFUlZJQ0VTKSkKPiArICAgICAgICAgICAgICAgZWZpX3JlYm9vdChyZWJvb3Rf
bW9kZSwgTlVMTCk7Cj4gKwo+ICAgICAgICAgZG9fa2VybmVsX3Jlc3RhcnQoY21kKTsKPiAgICAg
ICAgIHdoaWxlICgxKTsKPiAgfQo+CkxHVE0uClJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmls
dmxAb3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
