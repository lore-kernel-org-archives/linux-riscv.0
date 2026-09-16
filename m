Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22E0C88E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 10:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WqFHXh0uciz8roxl3N6a9DxWeMHRWCYX6pRFWv0UHs=; b=yNp6jR1SqNraOu
	KGDxbF+Xv0Toxiy11aSF3kS934L9hZ5DbK9NEH7EtMKkztXwkv3lKp9qa6ZY8u9YWcceN8gf5AqrB
	q3UB54FMQUgDa/Q/x4ZuuBnAuFqUevL7njhIUBSxjJOrFEuOaWy/abmDuJ1BLdZRxA4vfG+V09OFS
	aujhp8h+tclO3Xv559JHh6dThw8Jfp6jgPjSPbWpPcggKFpdXKnBl/Qjcu0BEAw2nhIlLh645+YeR
	JC/coO4L1I78bJCG+NbXtrYclq7auY1oSxWWZcdBRLw06nMym3z1eQ3O/5QjoxObdtro7X/9V0JPo
	syQR0cY1lzR7ei7uhLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6md0-00000008wZe-2dRJ;
	Wed, 16 Sep 2026 10:12:34 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mcx-00000008wYJ-2xrJ
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 10:12:33 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d8239so4822215e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 03:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789553550; cv=none;
        d=google.com; s=arc-20260327;
        b=J3LUtuR2wjpCW+VjmKrCoogGd+SdoVy8KKFN2EqQ1FbS0cr6UOs1P/hjPSogSjME7k
         HQkg/K7L6kinlf4C4Nr4Qfmsj3EUNZWTtcR0Ubdx7iMKJK5H33xFMfwLSKOiJbkC4aS3
         dgxxyQLhk2eU3b86myQ8jI//IrKipoa63q10sSIj19G21ONgmjBS5ZCTXqnJ/Zl5qeRL
         SD2wdclDtbfV7vO0e1JYA023TFkbQlQ6bd7c1ImHynDGZSQpprZ3uPEJ4Kj/eRXSDUwN
         QFuBBHXg2h1FgdTBTimBD/tyfuGdrd/WHsW/fG13Oiiv9yo4/1rZja448GebScvb0U1l
         RcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        fh=J7Ul+9tbEsPvf/jqC/EYTIOgEHE0hQ7ffMiXvOTTunE=;
        b=Hi67lixEopMFMHqnkwwK2op/cxR+WYeXFGgJMtxToojgJCVjVXm1nXFGtPp8hz4x80
         xUMzwvJfqMXXQ+XkvY3upkD0KcrcjOJAa8LcK8s+0tNpRXwjNM5CzNN+lFRO2SS4MFRz
         nZ0C48aUU4PSqrFm3ZkLAwfFDK+5cB6Q5/VSdr2qsTCcXGUEvG2nPB7mkiXJTVEBUfks
         9nmbM5mWk9wJJu/d7FF6hz1Fn+wKv+P8Xm+bzn7ymbI7qecxUhBFTeOi7b+3I4wAMmxM
         X+d6tNhYQjoFqzDKwCLTMqCQNedtURcF3QixndKkScZvDNSg4LXQrDn4rPWx01BNaX9X
         YoTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789553550; x=1790158350; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        b=M0mNlqYPLnpFsm1NsOsr9iMNRRDkvHsE27aOonJXLfVe3r0/gdSKrXQXC4n1eTewkm
         MyEMqyGuVOqO6lQ+JYF64gbP9iae86QC9kAWquwqEj+JBh1fv0XpllXl/2ndX/wi+vVs
         iZFvQmSffwh6bbv1CjcApU9VH5brucB5Earbcgi1RmYqi4sTeZlMD9gCxqPyKZjM2KdZ
         iAoZ3psZfZlwtRRat2cruJS/s4QnFwkcltaUNI5BlS7zUccecWV80tyKRoda90jV4gIk
         wZVY3qEl+rk/VtBPLQi1vBqr/ZNkXXT2BSDrNaIYey10+lbC08YzoEksMjlG69wv4RtG
         35XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553550; x=1790158350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        b=y3U9gYG8svShC73mh0azfl5cz5m31lo0AfGBG/0L4GqAI86pm6CcPHoSwoM19b2RYm
         B5ulWy7R29vZzouLmt8unPOK0X+QnScgKUmNdjkryFHAFtDxVHhC36mW911LKABGMpha
         +mqxeFouuyg1thhD5weKerO2+dnLKW4pQ7uHniJ8wNkYMymq01NmjeB/619lZSRCNws2
         FyJFi3CPvO9/oXFgJELtROI/Zy1xzXs/LpgfdN5PJOJhTN3bnu/nJiXER4kxn8weGBD+
         R2CTr14K8C/vPKl9q3Rc9FxM8A5G3Ct4cHgdLgSZUD/vYz2Rw5bjylJ8/LjB1PZOp8rz
         XL7A==
X-Forwarded-Encrypted: i=1; AKwUvBwpdaskgKiczuqA6iRfFqHgN/MPgluJpG6GH3WY8fwU4PwSGrDXMj1EExOdtaSKbCfb13VCmdeOfrkAQw==@lists.infradead.org
X-Gm-Message-State: AFuF++mMZ9o2Ww2C0yzU624rbiAbHSKP9+FPVHN8mskJL1i9trWZyON9
	kihHOeZtsnDi1FLY7dnb5HBlsEVApWdNMIMfoR3u2WBIPyU8kLc4m54f4fjQv6R0b3FU2Q7UXng
	Q4rXY01M6miuOikDOnWbb0l5pcnbLH+LVFDloCTr7qQ==
X-Gm-Gg: AYBFou0N+6CCiPGuMW4DNypQaMlDLhNywSPQUll6oUjWXmAoWEc97xHoJHIfCRZmDHH
	AFWBswlEb/8Wuw7T7FqrIFoHPRfuPSxu8WPCBdJjcKoiUepFrVm7agyqOORA2Q3fAHVgc8MlUcb
	iOr351j/GwgeIxUpn1YklB4eX7QyoDdvgC9mtnggC54DPnDWazxpuSKj7dUeoWVRA8L1mON4v9Q
	7AWIb3JvAvhBW0ksC3/QlfP5oSa0SwGdZ34uOkVAOO/+OgmPj8MvgmffRfoVBZc9Tjb8dYMVm/S
	zrOTA9fsuJZ6vKbC5hmYebhTiomnEO9u/x2pak36TpUOwDAgib+sr+ig41zVcabWQ42q0gcxhu4
	XRl0S9m49H3RvBJ6I2JIq9kbaT5MaiFLUAqZwtrqHyiTpZKMwBSTOMXEjxRxMNh3ZMUXgabfv9o
	U=
X-Received: by 2002:a05:600c:1986:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-49ea528e2f5mr24120835e9.0.1789553548884; Wed, 16 Sep 2026
 03:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Sep 2026 15:42:16 +0530
X-Gm-Features: AcwNN1XhJcdypVFFKePBGQrRcccPnauqo1pQsJ8HQwZetdLhE4E6-eyGGrD9-yI
Message-ID: <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_031231_789898_BFE1C5D3 
X-CRM114-Status: GOOD (  22.41  )
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

T24gU2F0LCBTZXAgMTIsIDIwMjYgYXQgMzo0NeKAr1BNIEFtaXJyZXphIFphcnJhYmkKPGFtaXJy
ZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSBkZXZpY2UtdHJl
ZSBiaW5kaW5nIGZvciB0aGUgT1AtVEVFIFJJU0MtViB0cmFuc3BvcnQgdXNpbmcgdGhlIFJQTUkK
PiBURUUgc2VydmljZSBncm91cCBvdmVyIFNCSSBNUFhZLgo+Cj4gRGVzY3JpYmUgb25lIG1haWxi
b3ggY2hhbm5lbCBwZXIgaGFydCBhbmQgYW4gb3B0aW9uYWwgaW50ZXJydXB0IHVzZWQgYXMKPiB0
aGUgYXZhaWxhYmlsaXR5IGRvb3JiZWxsIGZvciBhc3luY2hyb25vdXMgbm90aWZpY2F0aW9ucy4K
Pgo+IEFkZCB0aGUgYmluZGluZyB0byB0aGUgZXhpc3RpbmcgT1AtVEVFIE1BSU5UQUlORVJTIGVu
dHJ5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW1pcnJlemEgWmFycmFiaSA8YW1pcnJlemEuemFycmFi
aUBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvdGVlL3Jpc2N2LHJwbWkt
bXB4eS10ZWUueWFtbCAgICAgICAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysKPiAgTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90ZWUvcmlzY3YscnBtaS1tcHh5LXRlZS55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RlZS9yaXNjdixycG1pLW1weHkt
dGVlLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uOGY2
ZmYzMTNmZDQyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy90ZWUvcmlzY3YscnBtaS1tcHh5LXRlZS55YW1sCj4gQEAgLTAsMCArMSw2NSBA
QAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkKPiArIyBDb3B5cmlnaHQgKGMpIFF1YWxjb21tIFRlY2hub2xvZ2llcywgSW5jLiBhbmQv
b3IgaXRzIHN1YnNpZGlhcmllcy4KPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3RlZS9yaXNjdixycG1pLW1weHktdGVlLnlhbWwjCj4gKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsK
PiArdGl0bGU6IFJJU0MtViBSUE1JIFRFRSBzZXJ2aWNlIGdyb3VwIGJhc2VkIG1lc3NhZ2UgcHJv
eHkKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gQW1pcnJlemEgWmFycmFiaSA8YW1pcnJlemEu
emFycmFiaUBvc3MucXVhbGNvbW0uY29tPgo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBUaGUg
UklTQy1WIFBsYXRmb3JtIE1hbmFnZW1lbnQgSW50ZXJmYWNlIChSUE1JKSBbMV0gZGVmaW5lcyBh
IG1lc3NhZ2luZwo+ICsgIHByb3RvY29sIHdoaWNoIGlzIG1vZHVsYXIgYW5kIGV4dGVuc2libGUu
IFRoZSBzdXBlcnZpc29yIHNvZnR3YXJlIGNhbgo+ICsgIHNlbmQvcmVjZWl2ZSBSUE1JIG1lc3Nh
Z2VzIHZpYSB0aGUgU0JJIE1QWFkgZXh0ZW5zaW9uIFsyXSBvciBzb21lIGRlZGljYXRlZAo+ICsg
IHN1cGVydmlzb3ItbW9kZSBSUE1JIHRyYW5zcG9ydC4KPiArCj4gKyAgVGhlIFJQTUkgc3BlY2lm
aWNhdGlvbiBbMV0gZGVmaW5lcyBhIFRFRSBzZXJ2aWNlIGdyb3VwIHdoaWNoIGlzIHRoZSBSSVND
LVYKPiArICBhbmFsb2cgb2YgQXJtIEZGLUE6IE9QLVRFRSBhbmQgdGhlIHJpY2ggZXhlY3V0aW9u
IGVudmlyb25tZW50IChSRUUsIGkuZS4KPiArICBMaW51eCkgYXJlIHBlZXIgZW5kcG9pbnRzIGFu
ZCB0aGUgUlBNSSBmcmFtZXdvcmsgKG1hY2hpbmUgbW9kZSBmaXJtd2FyZSkKPiArICBtZWRpYXRl
cyBldmVyeSBtZXNzYWdlLiBFbnRlcmluZyBPUC1URUUgb24gYSBoYXJ0IHJ1bnMgaXQgb24gdGhh
dCBoYXJ0IHVudGlsCj4gKyAgaXQgcmVzcG9uZHMsIHNvIHRoZSBTQkkgaW1wbGVtZW50YXRpb24g
cHJvdmlkZXMgb25lIFNCSSBNUFhZIGNoYW5uZWwgcGVyCj4gKyAgaGFydDsgYWxsIG9mIHRoZW0g
YXJlIGxpc3RlZCwgaW4gaGFydCBvcmRlciwgb24gYSBzaW5nbGUgbm9kZS4KPiArCj4gKyAgPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICsgIFJlZmVyZW5jZXMK
PiArICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gKwo+ICsg
IFsxXSBSSVNDLVYgUGxhdGZvcm0gTWFuYWdlbWVudCBJbnRlcmZhY2UgKFJQTUkpIHYxLjAgKG9y
IGhpZ2hlcikKPiArICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Yt
cnBtaS9yZWxlYXNlcwo+ICsKPiArICBbMl0gUklTQy1WIFN1cGVydmlzb3IgQmluYXJ5IEludGVy
ZmFjZSAoU0JJKSB2My4wIChvciBoaWdoZXIpCj4gKyAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvcmVsZWFzZXMKPiArCj4gK3Byb3BlcnRpZXM6Cj4g
KyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiByaXNjdixycG1pLW1weHktdGVlCj4gKwo+ICsg
IG1ib3hlczoKPiArICAgIG1pbkl0ZW1zOiAxCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAg
T25lIFNCSSBNUFhZIGNoYW5uZWwgaW1wbGVtZW50aW5nIHRoZSBSUE1JIFRFRSBzZXJ2aWNlIGdy
b3VwIHBlciBoYXJ0LAo+ICsgICAgICBsaXN0ZWQgaW4gdGhlIHNhbWUgb3JkZXIgYXMgdGhlIENQ
VSBub2Rlcy4KCkkgYW0gbm90IHN1cmUgd2h5IHlvdSBuZWVkIHNlcGFyYXRlIE1QWFkgY2hhbm5l
bCBwZXIgaGFydC4gVGhlIE1QWFkgc2hhcmVkCm1lbW9yeSBpcyBhbHJlYWR5IHBlci1oYXJ0IHdo
ZXJlYXMgdGhlIE1QWFkgY2hhbm5lbCB3aWxsIGJlIGRvbWFuIHNwZWNpZmljCmZvciBURUUuCgpB
bHNvLCBmb3IgdGhpcyBiaW5kaW5nIHJlZmVyZXJyaW5nIHRvIG9ubHkgbWFpbGJveCBjaGFubmVs
IGlzCnN1ZmZpY2llbnQuIFRoZSB1bmRlcmx5aW5nCm1lY2hhbmlzbSB0byBzZW5kIFJQTUkgbWVz
c2FnZXMgaXMgYWJzdHJhY3RlZCBhd2F5IGJ5IHRoZSBtYWlsYm94IGNvbnRyb2xsZXIKZHJpdmVy
LgoKPiArCj4gKyAgaW50ZXJydXB0czoKPiArICAgIG1heEl0ZW1zOiAxCj4gKyAgICBkZXNjcmlw
dGlvbjoKPiArICAgICAgQXZhaWxhYmlsaXR5IGRvb3JiZWxsIHJhaXNlZCBieSBPUC1URUUgdG8g
c2lnbmFsIGFzeW5jaHJvbm91cwo+ICsgICAgICBub3RpZmljYXRpb25zIG92ZXIgdGhlIFJQTUkg
VEVFIHNpZ25hbCBidXMuIE9wdGlvbmFsOyB3aGVuIGFic2VudAo+ICsgICAgICBhc3luY2hyb25v
dXMgbm90aWZpY2F0aW9uIGlzIGRpc2FibGVkLgo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21w
YXRpYmxlCj4gKyAgLSBtYm94ZXMKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+
ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICB0ZWUgewo+ICsgICAgICAgIGNvbXBhdGli
bGUgPSAicmlzY3YscnBtaS1tcHh5LXRlZSI7CgpUaGlzIG11c3QgYmUgInJpc2N2LHJwbWktdGVl
IiBiYXNlZCBvbiBhYm92ZSBjb21tZW50cy4KCj4gKyAgICAgICAgbWJveGVzID0gPCZtcHh5X21i
b3ggMHgxMCAweDA+LCA8Jm1weHlfbWJveCAweDExIDB4MD47CgpMaWtlIG1lbnRpb25lZCBhYm92
ZSwgb25seSBvbmUgbWFpbGJveCBjaGFubmVsIGlzIHN1ZmZpY2llbnQuCgo+ICsgICAgfTsKPiAr
Li4uCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCAyMDdh
NmUyZGI3MGMuLjdkMGU1NTAwODViMiAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBi
L01BSU5UQUlORVJTCj4gQEAgLTIwNTc3LDYgKzIwNTc3LDcgQEAgTTogICAgICBKZW5zIFdpa2xh
bmRlciA8amVuc3dpQGtlcm5lbC5vcmc+Cj4gIEw6ICAgICBvcC10ZWVAbGlzdHMudHJ1c3RlZGZp
cm13YXJlLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCj4gIFM6ICAgICBNYWlu
dGFpbmVkCj4gIEY6ICAgICBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1vcHRl
ZS1kZXZpY2VzCj4gK0Y6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGVl
L3Jpc2N2LHJwbWktbXB4eS10ZWUueWFtbAo+ICBGOiAgICAgZHJpdmVycy90ZWUvb3B0ZWUvCj4K
PiAgT1AtVEVFIFJBTkRPTSBOVU1CRVIgR0VORVJBVE9SIChSTkcpIERSSVZFUgo+Cj4gLS0KPiAy
LjM0LjEKPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
