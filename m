Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6943BC9830D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CP2e0P3CM0az17NgrxwjV3qTPaudIacpsPMIMnSTOyo=; b=rkMvwrZNWxDOqn
	T3s6uowySovjemT6ZhfdTitrdWSAtPsCT4J4vql9ryrlPLSURGQNb28IvFotJDnP6VapDY3baaihB
	+2UNulsyBTjkQwJzKhEcaNkwM9yeUN2phRbm25V1zxRlpAH+BFqTJgI9yBRcoC6eY+jVESMjuelmu
	LfbCWTnShIp1vD9P+qC1iUJUsymLGtwg988aDxC5/ZHHgeh4Wl8jGdAuco8+Smdo8OgXTQJFOxD/H
	/K0OBP7i5z5ya4Vc5alinzqVgEr32+UC9nTYctJUSLzHRYaSUcSuIdmLD+kDaBAtJe+v5D4cOlQZT
	g2KtDb3fEYPSsH3UX/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4IR-0000000DEHR-1tzj;
	Fri, 25 Sep 2026 11:40:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4IP-0000000DEH0-0x1n
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 11:40:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4ZEXe1056570
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 11:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rsNrOzwbCifpU6R6cJ/a5dsMB4faQfYqNwJbgN8GX/4=; b=mJj1QL4NL1LcI3Sf
	9kX2QOperICOQlPFMtnh7bHpFLC0junUGc/gBIo98esg2yuTqko1yUe9u0v/QuQl
	qrYi1caRlRO4Xnsm7CCya5O3d5QeUpE/UQexh0fcUTjT/4CLqfrVvmXi0MD7B9Gl
	i0nZa68+qYiJcLoaHXBSX8qHavv2xqM9r2nKbk5GZiHofhWV3Qw7qXyURbd94Hj/
	3GoOD/+i1qVTuyBFSMTgwJTT1ywRvMstVcY7JKGzURSfLr5ZC5S/Thah0QgzhYK3
	3EM8TJTEJ7Mq1GtfU0y89yww4q4TdBCriqKP1bfVokaN4SnCACs1LKW13ZH8ZTE1
	1gWcMA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7a7s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 11:40:51 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6716c35e36dso1453333d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 04:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790336451; cv=none;
        d=google.com; s=arc-20260327;
        b=nuSzY+wGK84fr1kYitfKeotxJF3cakKmdcCGtuIGULreX09omyhhmpMm3xhv6DCZAR
         ibKm8/VzsiQ8ClfFy0jVMxvfMiqTuXpi/vo6juzp07twSiql/6qp5r9FO6e3JKDq98RM
         m4H6Ti84GYxSTfGcmzGMUrRl663o3gWlASkyD7JJqLqij+zvJp202NsSsQTOeaLnxOBa
         Fkm7m9CHuyhb9V0/J7wfbiGZKsRxXU2G5JgujL6k1PcRFFRjXeyLplWjk+FImpTwAZXd
         IhcfbCa8tPa7CoP+/u9yYi9p1j7bwzoaLeUOldoMT3m1b7f1F/auPOvGlKz8kvsANKKg
         SD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsNrOzwbCifpU6R6cJ/a5dsMB4faQfYqNwJbgN8GX/4=;
        fh=emxjAuH3LmDoIlCtIH2gM+zLnI8UmqWqUEKw1ny3t6Y=;
        b=eY3i1a1tetkJ/7mxxgH2a/xZNPypaiG8k4IYL/48tgvHK7jEn6ppVqs6/MEt5Ewi0w
         g/t8G785rVEAczzr46rShxiLJAxrb/jwPdXORbufrywmvs+cMsnmAfoWzDZyAGGKQpSm
         yoybGZps2xiv9iIhkZsbvlpoLGz31nDsNrE5ZTx+acSBqnj7YRI3KahPhtXpaVMBsmBy
         RrxOk32uk566lPc5Mk/nLlzhvGvmPE8vaDVx35KmJuJzwgD+YMhWAFEkBvCjpzfE5dw8
         AiekuKFD52RsxxSNJMfBq0vbdWWrJw3h2LpcTbOxSCX9/nPpYPJC71yU/4Ukg2UlPd8E
         vHeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790336451; x=1790941251; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsNrOzwbCifpU6R6cJ/a5dsMB4faQfYqNwJbgN8GX/4=;
        b=WVLVRG1slQ32FXHrgmwWISlD6SHorbhPZw75fwS+qf7o6CuD9GS2kZU6JHFZayQjei
         UYaaIEbU0Lm0+v3dX/oKL6VKOKb2YQwVTZSsqTBeeCET8uq+MP6hSQOUSSBuENoOCwhN
         29Y4U8cXLDMXnpLOwkmXaxDz6MeEXxHWBUG4yml1Oii+Q0qZ6J1uPs0jKEEV52ymCGPF
         rdQtPBUbGx818ZcTcv6fafSGVgnfitSc0v+Limxc/QRGAg26GlqvjFXXuwwURA/dgNvx
         JvJSJqtjpsvMFzSuHWgQxfoFn01g2ssBpsHGfbIbfnqSJNZoqpe7uD/vmvfgu8ouqO1e
         nYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790336451; x=1790941251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsNrOzwbCifpU6R6cJ/a5dsMB4faQfYqNwJbgN8GX/4=;
        b=kwnFzyswBRwRqPwA9b22W6pTamTPm2QBoWeecTlHzFERZ5dfa2SmYkVfBSIPlDEOJR
         6iHIlh4dK5s8/8bd2Xrt1y5Apv5lVr+ZaKyE/DgDtevQVbsLCKwV7j2SKwJ+flUX9tOQ
         Z8z08DP8isewV4RM0oX+oabp+EmF2SOGOEyTklcv89QKcHu71rNQw5QW8MCSmRseO1m5
         bm110NlCGz+eUFL0PS2cMnsX/eB8pfRu/M0JLAAQVSuQMZ1LNgz++hqUkCmD8jj/ENj3
         WxkjmhbjEC/mm97tMZjJUtpWuenW5h/FlBTyyGj3jSPpmy4ErqcCW7hy9IC+WLtmq9I4
         3WVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+pqSyjuNdiNaeZ0eKRQGglSnGDyic6MGnl+zZYRMw/4ClAwPmY28H+Ky/UQU1QwmUkIqin/v8UtF4Nw==@lists.infradead.org
X-Gm-Message-State: AFuF++l1EJ0+yswGUCfqKiJyUT92lN04BodxXI2hRpi6ZDeKUlutK+sd
	ygJczTqqDupSM7PNKhvbcdR//x7LCqctOz2VVDxErWDWatcJ6ax+aLJDyepA1q0wY8tUTi/H/mw
	VgOCPc7icxN/o6B215G5UssIlb+mL53QGPTNxNqirbhBTtyqboORlIoFp8ud5TUaE/BpSAW0oM9
	PTIrGIiWyHl9sq3PXwoFx3efJcWyBOiMDM68yr+ezHsvbFnw==
X-Gm-Gg: AYBFou0lTNhM4zcF7ym/54CR15+jKzj6KldXV5Txfg06THPwUSwgNycrRrr/l/OI2X9
	sCSuaD/P2Inwuo7/6zgDV4z3jwrw47xkFhFwtGHCGEgqfRAgVVMw7II36GB5qwIlDzYLCFSTqme
	6L/YJjaHNLX9/PvPdEa9bGg3QY/2oPylJaCb/2K62O0KFtgNgFklmQPsA=
X-Received: by 2002:a05:690e:4386:b0:671:5206:72f5 with SMTP id 956f58d0204a3-672ed447526mr2076039d50.64.1790336450659;
        Fri, 25 Sep 2026 04:40:50 -0700 (PDT)
X-Received: by 2002:a05:690e:4386:b0:671:5206:72f5 with SMTP id
 956f58d0204a3-672ed447526mr2076032d50.64.1790336450169; Fri, 25 Sep 2026
 04:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
In-Reply-To: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:40:38 +0200
X-Gm-Features: AclHuK8-NKfHmECD0DVtOmk_e4klBoqgwKqOwd5x4NG4wazlnEDTkkCFkHyTAAw
Message-ID: <CAGgiveV=MvRpgQxsfxxh9Hq2CFm3HDxOn3V1i7X2d9wYAvzXrw@mail.gmail.com>
Subject: Re: [PATCH v4] tee: optee: build the Arm-specific code only on Arm
To: marouene.boubakri@oss.nxp.com
Cc: jenswi@kernel.org, sumit.garg@kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        amirreza.zarrabi@oss.qualcomm.com, peter.lin@sifive.com
X-Proofpoint-GUID: BhnKOcC28_-7eKexCjHEwoRudaIUGPGz
X-Proofpoint-ORIG-GUID: BhnKOcC28_-7eKexCjHEwoRudaIUGPGz
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab65dc3 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=iiJROjN2hu4f1MACNQ8A:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0NiBTYWx0ZWRfX6erFk6j5mi/m
 kAHAu1lSn4x+8DP6kuRFHmBusN6azX5JmEkkqrUS3LXOIxfeu6srWAl3JLDvshnlpx6vfo0niV3
 WeMVw4JnhomekozFAjzCKeab9/vVkBzliSFtqS4Quq8e8NjurjCEqAQfbCG/YNq10ZCWzrCXnK/
 /NnoR5AfzdMJZuEtoWXd0W1jSkTRfINRzcP9JVPYV//0KJ6iFX5TpA2e6BS4y87ice2Hu7BK9x6
 AKzbof+QQXg0FlntvjM6p2HIGsTycE91QgwUnt2UzrSaer07PRZVaFMNxZLwrHIFEWiN8XbIePb
 vC+RhwpOdA9Jdnys9JKnCXdoAbzhX0isDbXLCbrUW4n04Lcw3TW1sMUnai9RwgF8b4DG3k6RNtY
 czKzQgwQdVKmc/IDwZC1LjTMgnyt6pCh0G4KaYKvYfBDqJJpD/YKl1GnT5tvXFKnyONZnM2lfAy
 Is/9EvPJ0UsSKXPE+xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0NiBTYWx0ZWRfX37HV3HTv9Vov
 zJorF/pb6FhJk5Pw/ncMyDJC4zGOvkvcQGOc+++KZm2cxhkT01L/RJIhW6f3VZpPA4wW7GHoagN
 uEpjaTGgDUtNzvD0NEInKQYjKaKTrzY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_044053_277321_62719123 
X-CRM114-Status: GOOD (  30.99  )
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

SGksCgpPbiBUaHUsIFNlcCAyNCwgMjAyNiBhdCAxMjozN+KAr1BNIDxtYXJvdWVuZS5ib3ViYWty
aUBvc3MubnhwLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBNYXJvdWVuZSBCb3ViYWtyaSA8bWFyb3Vl
bmUuYm91YmFrcmlAb3NzLm54cC5jb20+Cj4KPiBUaGUgT1AtVEVFIGRyaXZlciByZWFjaGVzIE9Q
LVRFRSB0aHJvdWdoIHRoZSBTTUMgQUJJIG9yIHRoZSBGRi1BIEFCSSwKPiBib3RoIHNwZWNpZmlj
IHRvIEFybSwgeWV0IGJ1aWxkcyBib3RoIHVuY29uZGl0aW9uYWxseSB0b2dldGhlciB3aXRoIHRo
ZQo+IFNNQyBDYWxsaW5nIENvbnZlbnRpb24gZGVmaW5pdGlvbnMgdGhleSByZWx5IG9uOiBmZmFf
YWJpLmMgaXMgYWx3YXlzCj4gY29tcGlsZWQgYW5kIG9ubHkgaXRzIHJlZ2lzdHJhdGlvbiBpcyBj
b25kaXRpb25lZCBvbgo+IElTX1JFQUNIQUJMRShDT05GSUdfQVJNX0ZGQV9UUkFOU1BPUlQpLCBh
bmQgb3B0ZWVfcHJpdmF0ZS5oIGluY2x1ZGVzCj4gPGxpbnV4L2FybS1zbWNjYy5oPiBhbmQgZGVm
aW5lcyB0aGUgU01DIGFuZCBGRi1BIHNwZWNpZmljIHR5cGVzIGZvcgo+IGV2ZXJ5IGZpbGUgb2Yg
dGhlIGRyaXZlci4gVGhpcyBpcyBmaW5lIGFzIGxvbmcgYXMgdGhlIGRyaXZlciBkZXBlbmRzIG9u
Cj4gSEFWRV9BUk1fU01DQ0MsIGJ1dCBpdCBrZWVwcyB0aGUgZHJpdmVyIGZyb20gYmVpbmcgYnVp
bHQgZm9yIGFuCj4gYXJjaGl0ZWN0dXJlIHdpdGhvdXQgU01DQ0MsIHN1Y2ggYXMgUklTQy1WLgo+
Cj4gQnVpbGQgc21jX2FiaS5jIG9ubHkgd2hlbiBIQVZFX0FSTV9TTUNDQyBpcyBzZXQgYW5kIGZm
YV9hYmkuYyBvbmx5IHdoZW4KPiB0aGUgRkYtQSB0cmFuc3BvcnQgaXMgZW5hYmxlZCwgYW5kIHBy
b3ZpZGUgc3R1YnMgZm9yIHRoZWlyIHJlZ2lzdHJhdGlvbgo+IG90aGVyd2lzZSwgc28gdGhhdCBp
dCBmYWlscyB3aXRoIC1FT1BOT1RTVVBQIGFzIHRoZSBGRi1BIEFCSSBhbHJlYWR5Cj4gZG9lcyB3
aGVuIHRoZSBGRi1BIHRyYW5zcG9ydCBpcyBub3QgcmVhY2hhYmxlLiBLZWVwIHRoZSBTTUNDQyBo
ZWFkZXIsCj4gdGhlIFNNQyBpbnZva2UgZnVuY3Rpb24gdHlwZSwgdGhlIFNNQyBhbmQgRkYtQSBz
cGVjaWZpYyBzdHJ1Y3R1cmVzIGFuZAo+IHRoZSBTTUMgUlBDIHJlZ2lzdGVyIHBhcmFtZXRlcnMg
aW4gb3B0ZWVfcHJpdmF0ZS5oIHVuZGVyIHRoZSBzYW1lCj4gY29uZGl0aW9ucywgYW5kIGRyb3Ag
dGhlIHVudXNlZCA8bGludXgvYXJtLXNtY2NjLmg+IGluY2x1ZGUgZnJvbQo+IG5vdGlmLmMuCj4K
PiBNYWtlIE9QVEVFIGRlcGVuZCBvbiBBUk1fRkZBX1RSQU5TUE9SVCB8fCAhQVJNX0ZGQV9UUkFO
U1BPUlQsIGFzIGl0Cj4gYWxyZWFkeSBkb2VzIGZvciBSUE1CLCBzbyB0aGF0IHRoZSBkcml2ZXIg
aXMgbGltaXRlZCB0byBhIG1vZHVsZSB3aGVuCj4gdGhlIEZGLUEgdHJhbnNwb3J0IGlzIG9uZSwg
cmF0aGVyIHRoYW4gYnVpbHQgaW4gd2l0aG91dCBGRi1BIHN1cHBvcnQuCj4gZmZhX2FiaS5jIGlz
IHRodXMgYnVpbHQgZXhhY3RseSB3aGVuIHRoZSBGRi1BIHRyYW5zcG9ydCBpcyByZWFjaGFibGUK
PiBmcm9tIHRoZSBkcml2ZXIsIGFuZCB0aGUgSVNfUkVBQ0hBQkxFKCkgY2hlY2tzIGluCj4gb3B0
ZWVfZmZhX2FiaV9yZWdpc3RlcigpIGFuZCBvcHRlZV9mZmFfYWJpX3VucmVnaXN0ZXIoKSBhcmUg
YWx3YXlzCj4gdHJ1ZSwgc28gZHJvcCB0aGVtLgo+Cj4gT1BURUUgc3RpbGwgZGVwZW5kcyBvbiBI
QVZFX0FSTV9TTUNDQywgc28gc21jX2FiaS5jIGlzIHN0aWxsIGFsd2F5cwo+IGJ1aWx0LiBUaGUg
b25seSB2aXNpYmxlIGNoYW5nZSBpcyB0aGF0IE9QVEVFPXkgY2FuIG5vIGxvbmdlciBiZQo+IGNv
bWJpbmVkIHdpdGggQVJNX0ZGQV9UUkFOU1BPUlQ9bTogc3VjaCBhIGNvbmZpZ3VyYXRpb24gbm93
IHJlc29sdmVzIHRvCj4gT1BURUU9bSwgd2l0aCB0aGUgRkYtQSBBQkkgYXZhaWxhYmxlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogTWFyb3VlbmUgQm91YmFrcmkgPG1hcm91ZW5lLmJvdWJha3JpQG9zcy5u
eHAuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBNYWtlIE9QVEVFIGRlcGVuZCBvbiBB
Uk1fRkZBX1RSQU5TUE9SVCB8fCAhQVJNX0ZGQV9UUkFOU1BPUlQgc28gdGhhdAo+ICAgdGhlIGRy
aXZlciBpcyBsaW1pdGVkIHRvID1tIHdoZW4gdGhlIEZGLUEgdHJhbnNwb3J0IGlzID1tIChKZW5z
KS4KPiAtIFVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nbHkuCj4gdjM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkyMjEzMTczNS41MjQ2MzUtMS1tYXJvdWVuZS5i
b3ViYWtyaUBvc3MubnhwLmNvbS8KPgo+IENoYW5nZXMgaW4gdjM6Cj4gLSBEcm9wcGVkIHRoZSBS
UE1JIEFCSSBwbGFjZWhvbGRlciBhbmQgdGhlIFJJU0MtViBlbmFibGVtZW50IHBhdGNoZXMsCj4g
ICB0aGlzIGlzIG5vdyBhIHNpbmdsZSBwYXRjaCAoSmVucykuCj4gLSBLZXkgdGhlIEZGLUEgcGFy
dHMgb2Ygb3B0ZWVfcHJpdmF0ZS5oIG9uIElTX1JFQUNIQUJMRSgpIGluc3RlYWQgb2YKPiAgIElT
X0VOQUJMRUQoKTogd2l0aCBPUFRFRT15IGFuZCBBUk1fRkZBX1RSQU5TUE9SVD1tIGtidWlsZCBk
cm9wcwo+ICAgZmZhX2FiaS5vIGZyb20gdGhlIGJ1aWx0LWluIG9wdGVlLm8gd2hpbGUgb3B0ZWVf
ZmZhX2FiaV9yZWdpc3RlcigpCj4gICB3YXMgc3RpbGwgZGVjbGFyZWQsIHdoaWNoIGRvZXMgbm90
IGxpbmsuCj4gLSBEcm9wIHRoZSBub3cgYWx3YXlzIHRydWUgSVNfUkVBQ0hBQkxFKCkgY2hlY2tz
IGluCj4gICBvcHRlZV9mZmFfYWJpX3JlZ2lzdGVyKCkgYW5kIG9wdGVlX2ZmYV9hYmlfdW5yZWdp
c3RlcigpLgo+IC0gRGVzY3JpYmUgdGhlIGN1cnJlbnQgRkYtQSBjb25kaXRpb25hbCBjb21waWxh
dGlvbiBhY2N1cmF0ZWx5IGluIHRoZQo+ICAgY29tbWl0IG1lc3NhZ2UuCj4gLSBQb3N0ZWQgYXMg
YSBuZXcgdGhyZWFkIHdpdGggYSBwcm9wZXIgc3ViamVjdCBwcmVmaXguCj4gdjI6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL29wLXRlZS8yMDI2MDkxNTAyMDIzNS41MDczMDItMi1tYXJvdWVuZS5i
b3ViYWtyaUBvc3MubnhwLmNvbS8KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBObyBjb2RlIGNoYW5n
ZSwgdGhlIHRlc3Rpbmcgc2VjdGlvbiBvZiB0aGUgY292ZXIgbGV0dGVyIHdhcyBjb21wbGV0ZWQu
Cj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wLXRlZS8yMDI2MDkxNDE3NTQzNS4xMTgz
MDMtMi1tYXJvdWVuZS5ib3ViYWtyaUBvc3MubnhwLmNvbS8KPiAgZHJpdmVycy90ZWUvb3B0ZWUv
S2NvbmZpZyAgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL3RlZS9vcHRlZS9NYWtlZmlsZSAgICAg
ICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvdGVlL29wdGVlL2ZmYV9hYmkuYyAgICAgICB8ICA4ICsr
LS0tLS0KPiAgZHJpdmVycy90ZWUvb3B0ZWUvbm90aWYuYyAgICAgICAgIHwgIDEgLQo+ICBkcml2
ZXJzL3RlZS9vcHRlZS9vcHRlZV9wcml2YXRlLmggfCAzOSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystCj4gIDUgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCgpMb29rcyBnb29kLCBJJ20gcGlja2luZyB0aGlzIHVwLgoKQ2hlZXJzLApKZW5zCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
