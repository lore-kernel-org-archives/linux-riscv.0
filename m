Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22BEC61DB9
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 13:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CN+irqDqsqZ2OmU26lf4euuQoeoqxjk0nlSe2P71JVA=; b=0Q3p/cGJXmJB6f
	TabScgF65Of6GyurWZeXD/lRQjy7+vGetKqealUuKeuMzove9CfllsXvkqPXWQD+wTrC7gEwYTI7Z
	EgMfJFccFb6T+LFlQfwOlw54v7U1qtGWoQNJnjf6lIlOsIfiXp9Xz+x9nus4byUOiahJK75Bt6uZA
	7daDJY+jGrCHnTNjFsHRGgisFQGi/FXzN305TntY3+vhNI8okPTLzqqa1cKnjhSC4yS5/2VHHCPYi
	9iTKpHubAEhczZL1FmkVUaYFkgGCX09MBRyEmDZQiXlUxJz/+ryVojdv7fzSZ0hcaU1yfG/Ep1h33
	sJ4FPtvWluxl891ebafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyr1N-00000000qIl-0kpB;
	Tue, 25 Aug 2026 13:16:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyr1K-00000000qHh-0cBw
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 13:16:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAvAQi2090801
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 13:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvqkCKDCZwmeMaXcFghQ7kb7aCZrtTzb3I560fNPdCE=; b=HSz7R7mhb8BhpTSl
	jPyFXFmfRIhiAciT1fsU/QPbwkwKTK2PngNzPz8ibiqz2V+gc7h2fFW+e6FPyTAl
	XnwQdeBXvCfYzWXObMrLfuETZXu+j+8LfXnLjmGs8LhLpAUzN62jf/8TN1hOhP1Z
	V9bQmiN82xkbVETgp66MmJIVkhRzSjhpY5o1f7Kxr+WHYOFrMXpbuIugsouvmFra
	6V/ooKH9fPnot0XqMZ9H47vS4yK2j0MOrkLZ00jiRN8hHsVevseXjMyj9lOhuujZ
	YgT4A/RVBbUBnCmS5eA0w/znsVA/e1CqBaQ5bYl4G3FIhonkqKl53X3icfOflM1c
	jMuJ7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvt2qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 13:16:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso56846905ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 06:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663812; cv=none;
        d=google.com; s=arc-20260327;
        b=emBHFtHZH2h6RGHAmYLBTi4r2p22fNSR11ePPzSg3gIi1coV5swCyQmKqUT2XmqaP8
         A9SL8GxSEox8+LUX3zoi1YtEPQrTkWxI816U9Hj1NOnij2doNlTTwmY9rZyBBmsmBVrt
         +pbn+MWWIV5eISflRgA6zlltT93PHBdqJ7AU+ECqOAdKccZ6yujr5SXaS357sXN9cmWy
         ANnOukcl7ll4GrOKod0rS3HAp1o9+nhFfugKLycfU8qo7TdiL/PLkpTuMC+vX7WMHLv3
         T85bPa7QM1dKmy7M9ejv667LgHdGIqhfvPG1EGsX4fquOxtz0RTiLIf2c9Vt0fzqfk0Z
         Ss4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XvqkCKDCZwmeMaXcFghQ7kb7aCZrtTzb3I560fNPdCE=;
        fh=i+C/OCm8qa5Drq0RuHUKGJtQqa4VSbHHrJ6GruusDuk=;
        b=DJGULG6Zd/KrAvsGPPHR6lKhrsRaPn9ktNI3d5QW67SLZK2P3BMbuSxDVmel6izVFM
         VmKgK2QxNko3Oj0qSXjaGd3ehgIC6ecQ3e/hJDAcUz+AHQzyUeZ5O05whDupuz0Y2QeM
         5G/uk4jKDTvjoRZc2W3k9YprTkNyUGxdeHkDEHQ1EigTgRrB2OVceliXSaPRyu32ELCO
         FzPSYoDxhgHenlLGBKlqg3aNtmo1Qaa4S8eemswrWrG9D2Ke22K5e5ICzYZ9SLTkerIH
         w8YRkiLZzq8VxNhj4mgIMdjzj3ZORk0cR19L6UTCexQm7bP/xwyMI+SNx1T1a0BuGM1k
         BxlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787663812; x=1788268612; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XvqkCKDCZwmeMaXcFghQ7kb7aCZrtTzb3I560fNPdCE=;
        b=VlUf/2T+JWuY2esgcMTga3kY6LE3Sjm8ZGvxL/gmvkiTY0ziougihfUx8ND7rGuQzj
         bT80F4aLP/JHqBtCCETEqIdckbWp0TkcTz48yAuu4OmpbQzjyPnsH8VAbHZvxTP9fTfC
         UT7EuJwxpvGtz1BfBSfQLSPV1oH+0mQK41Gcp85SEvBe2SpLeDlOlp6d+0cx0JK094MU
         8+IqvnRFrdHV0OJDBsHH9rTz3btHYdnDJ/KMThxuA8D6dpbjQypuABrWpKgaEyzjxh6q
         aj0u/VSbYfO6vpH54lZPc7MK+9x8Wj+wFOexjZgXrrE+H+HSnXSPUlhdt7G0pGDYC20D
         HC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663812; x=1788268612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvqkCKDCZwmeMaXcFghQ7kb7aCZrtTzb3I560fNPdCE=;
        b=m9qatg5CEOZ3jNhUQ0pwEvIcluEnbL0LKljFLnIp9B3apxXUXOV3PumM5+r9hSQkE2
         T4XWaCjfc7SUyupvHCZ6KfVAWfH5W9oL/RUy4To2Q8/qBbb/G1o7Zw/w+N1LkeYiY2gE
         jVLrEAuIUwNTktcNhIRkDJTwCl7HsMBvkztAWNuaxf9a1RNf1ZAaqKq83MhYfUmZ/LgM
         bI91eYOn7GzppX4xBLuJWZFP0NFAk8EN9Ag6GDQ2M5l+wEYzX+q//wtlKY2Ncj+Zsdxh
         ncE/O1m5i2S2qc1gYMu7FnGM9hPS4azmzykMZjfozxVNfx7l2c5yUNDPJO2kU4BOqfN2
         XkKw==
X-Forwarded-Encrypted: i=1; AHgh+RrKbjZI3vN++C/P+sPP/dp3GDSKzv7HOR6v8jKzsgFumaZgDGPI7SUPVkPIUwutODG1nzz6ahbgorYQfQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mIbthBOVfREQ6LcjwN+JrKglrSSneBrnKOvEy7Xt/nO9SlI7hM
	NFfo/KzCKrTpsI/2yNKjOJ2/ZMPmz17DqY1OhIg4J0hkBMBJy+nDbebhQUzZnE5zUNZpr4tpmTx
	5MoQUqWk7miWYqbFfD0kJc73zIU5YB53iQKTbA+wdhbq78ljhlcJOX0oh+w2+eGI4WD9+1TvixC
	5YS/8L+LzqzIyHA7Z6K2JGEypSuUNaRL+h9QZYD8P7NWwifQ==
X-Gm-Gg: AR+sD10ZXFnibpEgryLtfmsHpb7KXQ/wXjanIGLJPsmq1Lxn4HNw+B1V2YYa5xxj1Jz
	vMeUuKQyDe4WmRluA/8gVqsL3wJZVS77KMhAjsD6GzIrtu2AWE3twRqQAzntPRjKfvPbEEeSIHo
	mPiC1G/785JdsRHU1m7/KDPcQxC6vDqch0oh5jrY+2xeo/sAe6nxu8DVlZnrU=
X-Received: by 2002:a17:902:f683:b0:2d6:3c1a:85e0 with SMTP id d9443c01a7336-2d6dccfb542mr121198185ad.14.1787663811869;
        Tue, 25 Aug 2026 06:16:51 -0700 (PDT)
X-Received: by 2002:a17:902:f683:b0:2d6:3c1a:85e0 with SMTP id
 d9443c01a7336-2d6dccfb542mr121196205ad.14.1787663810832; Tue, 25 Aug 2026
 06:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com> <20260818-hunger-module-a44d9716010d@spud>
In-Reply-To: <20260818-hunger-module-a44d9716010d@spud>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 18:46:39 +0530
X-Gm-Features: AcwNN1V9egfNMIH691TkAHArGtQXAw0rOFr0i5eeHAW-N5CIlrbpdAfvtphGjHo
Message-ID: <CAHuiULBGKCqxMzO7f-i0VeuN0nykEaDwzVzq1VtT5VK2LM3eTQ@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExMyBTYWx0ZWRfX4lNKdAkKVQFZ
 i8zRHxU6Mg9oLTIgFdp3T8aGh7RA7oErn/5ZWjBpmNgL43tMff/2adTGCKZ94FKFbADpCk1dX5S
 Q/Q/xwkReMWmw7HB0HlSuFwikZJ/H9f5Jjm0JpnKziu2XAzQcLUk/aWbA9FHNol2IrvhPufgSUF
 Ra36GDfYsi5Hu8Sf9sKG3lviv93DpxH5PVRLx9C3NrfbRsDi6aL/qI2UGgUnanxE0girm2E+RxV
 rEOd2YrpkKijYmxidhqtcST0JkZbGdQAsgtp1RzpS5kS++2NevQekj2wTf9cilDkkTDu8le6tA7
 gQ547Gg5vfo/bxXmGHls0lykbaiSgGMZrFvkdDnNfga3KC02VP3T5JisOLvsV/MNocoexqUMild
 4ckFdTUWZkqzTinVDw6kACmaHqPnDsPp36EqUKx5eBFTBw7c09c8uw+Atu6Fo+GaTVRTOgCA5Tz
 iaU1ZIuFoWd7fyujOVw==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d95c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5iWJdViXKeNTBtzVyBoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExMyBTYWx0ZWRfX8k0RyujtAAyV
 xr8qP8YKvV7ZFfkbJ1xfvV27OduZnjrUqE7ycFcP8iHO/Yh6xEnni7mTxvZzN/ElBLX4kKthbQO
 JC2+WUAtmA7ocG7S/b3s3tQebFj+qKI=
X-Proofpoint-ORIG-GUID: l3GU_r2mk6ywOKH-p6adHolaK3WAfPi9
X-Proofpoint-GUID: l3GU_r2mk6ywOKH-p6adHolaK3WAfPi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_061654_300351_41A646FF 
X-CRM114-Status: GOOD (  21.58  )
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

T24gVHVlLCBBdWcgMTgsIDIwMjYgYXQgMzowNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAxNywgMjAyNiBhdCAwOTozMjoxN1BNICsw
NTMwLCBNYXl1cmVzaCBDaGl0YWxlIHdyb3RlOgo+ID4gRG9jdW1lbnQgdGhlIFJJU0MtViBQZXJm
b3JtYW5jZSBFdmVudCBTYW1wbGluZyBleHRlbnNpb25zIFNzcGVzYQo+ID4gKFByZWNpc2UgRXZl
bnQgU2FtcGxlIEF0dHJpYnV0aW9uKSBhbmQgU3NwbGNvZmkgKFByZWNpc2UgTG9jYWwgQ291bnRl
cgo+ID4gT3ZlcmZsb3cgSW50ZXJydXB0KSBpbiB0aGUgSVNBIGV4dGVuc2lvbnMgYmluZGluZy4K
PiA+Cj4gPiBBZGQgYSBkZXBlbmRlbmN5IHJ1bGUgcmVxdWlyaW5nIFNzcGVzYSB0byBiZSBwcmVz
ZW50IHdoZW5ldmVyIFNzcGxjb2ZpCj4gPiBpcyBwcmVzZW50Lgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IE1heXVyZXNoIENoaXRhbGUgPG1heXVyZXNoLmNoaXRhbGVAb3NzLnF1YWxjb21tLmNvbT4K
Pgo+IFdoeSBpcyB0aGlzIHNlcmllcyBSRkM/Ckl0J3MgYmVjYXVzZSB0aGUgc3BlYyBpcyBzdGls
bCBpbiBkcmFmdCBzdGFnZSBhbmQgYWxzbyB0aGUgcmVnaXN0ZXIKYWRkcmVzc2VzIGhhdmUgeWV0
IHRvIGJlIGFzc2lnbmVkLgoKVGhhbmtzLApNYXl1cmVzaC4KPgoKPiBDaGVlcnMsCj4gQ29ub3Iu
Cj4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbCB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gaW5kZXggNWZmYzQwZDU5OWMwLi5m
MzE2YjkzNzU0ZmYgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBAQCAtMjMyLDYgKzIzMiwx
OCBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgIHJhdGlmaWVkIGF0IGNvbW1pdCBkNzAw
MTFkZGU2YzIgKCJVcGRhdGUgdG8gcmF0aWZpZWQgc3RhdGUiKQo+ID4gICAgICAgICAgICAgIG9m
IHJpc2N2LWotZXh0ZW5zaW9uLgo+ID4KPiA+ICsgICAgICAgIC0gY29uc3Q6IHNzcGVzYQo+ID4g
KyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBT
c3Blc2Egc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9yIHByZWNpc2UgZXZlbnQKPiA+ICsg
ICAgICAgICAgICBzYW1wbGUgYXR0cmlidXRpb24sIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBQ
ZXJmb3JtYW5jZSBFdmVudAo+ID4gKyAgICAgICAgICAgIFNhbXBsaW5nIHNwZWNpZmljYXRpb24u
Cj4gPiArCj4gPiArICAgICAgICAtIGNvbnN0OiBzc3BsY29maQo+ID4gKyAgICAgICAgICBkZXNj
cmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBTc3BsY29maSBzdXBlcnZp
c29yLWxldmVsIGV4dGVuc2lvbiBmb3IgcHJlY2lzZSBsb2NhbAo+ID4gKyAgICAgICAgICAgIGNv
dW50ZXIgb3ZlcmZsb3cgaW50ZXJydXB0cywgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIFBlcmZv
cm1hbmNlCj4gPiArICAgICAgICAgICAgRXZlbnQgU2FtcGxpbmcgc3BlY2lmaWNhdGlvbi4gU3Nw
bGNvZmkgZGVwZW5kcyBvbiBTc3Blc2EuCj4gPiArCj4gPiAgICAgICAgICAtIGNvbnN0OiBzc3N0
YXRlZW4KPiA+ICAgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ICAgICAgICAgICAgICBUaGUg
c3RhbmRhcmQgU3NzdGF0ZWVuIGV4dGVuc2lvbiBmb3Igc3VwZXJ2aXNvci1tb2RlIHZpZXcgb2Yg
dGhlCj4gPiBAQCAtOTM0LDYgKzk0NiwxMyBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAg
ICAgICBjb25zdDogc21ucG0KPiA+ICAgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ID4gICAgICAg
ICAgICAgICAgICBjb25zdDogc3NucG0KPiA+ICsgICAgICAjIFNzcGxjb2ZpIGRlcGVuZHMgb24g
U3NwZXNhCj4gPiArICAgICAgLSBpZjoKPiA+ICsgICAgICAgICAgY29udGFpbnM6Cj4gPiArICAg
ICAgICAgICAgY29uc3Q6IHNzcGxjb2ZpCj4gPiArICAgICAgICB0aGVuOgo+ID4gKyAgICAgICAg
ICBjb250YWluczoKPiA+ICsgICAgICAgICAgICBjb25zdDogc3NwZXNhCj4gPiAgICAgICAgIyBa
YTY0cnMgYW5kIFppY2Nyc2UgZGVwZW5kIG9uIFphbHJzYyBvciBBCj4gPiAgICAgICAgLSBpZjoK
PiA+ICAgICAgICAgICAgY29udGFpbnM6Cj4gPiAtLQo+ID4gMi40My4wCj4gPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
