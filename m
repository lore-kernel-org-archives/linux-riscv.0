Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43915D46C1D
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 00:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2k7lKqCgWNHd+mjkJZH6FezM19hok2D1yCD5v58rcMo=; b=jg+0InutSSqyZ1
	05JenBnYqyorcQR1IP5FdLsvnJTK4qBRVv9nVDov4KTnJFo09F39lla9qXFHHKcsqGzglBKbxamtc
	r1eAXEKnxtzKxWIs9yYUzJ4Xlt7Hcc+A51sHul2DNhQ3VvSoj/+NdFzDi60yQMcW6otonUTWCYuxs
	mLtV24GDgKdnYG3OOlA0e5eKdVVIP2f6nO3vA+VATYW6D9HoE2ud9Yt8SU+aKK5E3LfByHmVNQr1t
	iYHgKQDZf/dui7JwfTns/mEa2NwRZy30lHLi1AuKgFB9qqECePPU6m9r3DXvjMuUmH5Dtmv3odcwJ
	eKXxiNk2eiPQY1J88X3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyed-000000028dB-1rIX;
	Sat, 31 Jan 2026 00:15:59 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyea-000000028bi-3nsl
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 00:15:57 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-662f9b82a36so1162443eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 16:15:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769818555; cv=none;
        d=google.com; s=arc-20240605;
        b=Ggr54KI13Ix1ZePGvHfSYe4B1CTVCQjN34IyC0F2G3/Tpw4+ipvWkWzeh2/aiWIzC8
         KJpucoUI0IuQldw964fUXXQpUIj4N0kAwGVjMV63cRQTudSeRzDgM+FO8foKMPYmOLM+
         2NPP1ioDHnXzvtiQhDl053yQJbsq5F6V/sK0BsGy4g0LLsYKDHDARHUq/Sg9X50JtZYU
         U90pQ3g/m34PX831N4zPAnHHlHr5fsT0wmEIswXTn053TiZx0PpqcMSiV8tIQnoFoXuq
         llAAm3XtHnLoSvKF/lCqF6FY2PccoId5UKRaaLkQ/FMpbiE1s35DKAF7wIE84gr8tivj
         jYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRm5sfCTEKVx/sN5RzP4+dvvkIsVmkN2zIPCD6RD2hs=;
        fh=T9XVNOlbcibI3tugcxpffoOVZTre1LxtO4/s8MzP9aI=;
        b=QE05dfymJZiNRxhp5dmWyOHyONvbVv5oMIFpLmBUcEE6o9XDtV/AYLhjL1YB7KQDa2
         K7xvuW9qQeXMvEa8ICLKP4pBUWjq3qd2UymaD1PY9spQpoMJ/A/G8gMnSClwHBsV0Ji5
         obRvTZq6a78+b2OAjJD6XjR4oeunbSwjIDUDoprAm6t8cuR5FVL3T9dz/QkgslyJdelv
         OQRW7FHWNvgkfuJVvRaRnkKJoqKRx5ulqNVSkyE4QFCav+P1gAVL3r6gHGZf7S4iNSf7
         1mevF+hgCAxN0Z0113upvVJ4ZNtBHeqjVP3z+OrH3hYnGRecGZwM8FiK8adrE64HQxSB
         GXtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769818555; x=1770423355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRm5sfCTEKVx/sN5RzP4+dvvkIsVmkN2zIPCD6RD2hs=;
        b=nFEZs59mKqc0JxhfIxYbYsiAXXGBSf3jt+ICfrDrNLGXbVZI4gZVzl4h2ubInHMYwv
         tQr5PD4dhuO8L/5wZcPnRrS4kjjF29YMk6xc0a51t0fUg4pKmRusHEsNwFypVx1xy0aj
         vpastDLz7SY6CyJRzJikNlhboLUJglL1UcyPjSVNuwYT1tA9/F3f6nRCh0qTor4EuAjE
         tU4aRHAnaeIYgNiODRXqNlhVzBgiMMA2w/Dit5NuCLV0M3JdtIkiDTjzX4c8dwZ7/qat
         jGh3Zpfdv5QRnm4yqUttBbSHkGKW33lvvFSE1yaY0X/zzqWMdS75JplS1IUIDd5wZW6T
         tNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769818555; x=1770423355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yRm5sfCTEKVx/sN5RzP4+dvvkIsVmkN2zIPCD6RD2hs=;
        b=ln+XKaqxEFNAI1Y9DHPfEkqnkuJctnj5mxbff8QIqHZvav+jMcYfUJW+bHXxdkOn2k
         nYnEZZLPI1cNyQk3S62lGJIhv+qSQOb/iswQY0JPq2EYMRmOe9DOM3PWkv6W0T9ao38l
         vfE4rORI5QMLqNTNKYNKVPimts3kcIPYXEGU5ocxZRZMLdwXqQn8nHLhMZS47lC3clMl
         F6T+CPUqtjOOR3zeG1vS/qJk+7lMTQAHNBGGUDL44owIHUSBBTXIOQsI/edWw/BOLaca
         +ixBgYO0Ke/xnvSHSXRj6HNR8F2/njtpbMq0EcLLCNAgqCEaAIvwHdz/FXhjhRvzjEnr
         rlWg==
X-Forwarded-Encrypted: i=1; AJvYcCVEdUYN5HFsXDwDWhqkvi/637CcpJuIvxJ3iKtHWqRxafflnO90LPsrNwWCz3U0aWI+Rooi+dzwZkfmgg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj4IV1lCqLywNxGIZSwWIO/qxCG/aTiiPQSZuZtFShOL8yHrQK
	oAXAHvygtJ11uTaT0DzT288P6kUn4s1NJk0OsmT0D30ezTasHH/NKFn/knVHh1sA4NF7+kCO/Wf
	BqiDhLgZezvlMdwr+0XdOr+AUHGYraNs=
X-Gm-Gg: AZuq6aKwnhUd7/aeyFbjjcs5bBBpUGwSXv5Jn1Jhgly6OyMQcPHJqaBaH2iyIKC1Lod
	OQSONvGU2/z2SHHc66FA/M0Tynb7W4ClE3bkNInQPhqjEgzMYy7paHXec6zcHBswGdeLeRcPIHV
	OIXyg7lqA2r0R3cXbXFC4PcxyBYQV8BZFvfP3k9H4NgF6DMuDbf2Xn2atw+4SrUb0AWQFIZsPnx
	UDcDpvd4vXG4dbuJzfLUKQjPxT+ikadq/mzstndI0UaIJKZ0BfBmKqQ7H5bVVBTuf+vS/kV/Xsi
	vmkX8BgFsYX2WT0HGl59OP5sgQ==
X-Received: by 2002:a05:6820:4489:b0:659:9a49:8f33 with SMTP id
 006d021491bc7-6630f3a6d87mr1889512eaf.68.1769818554970; Fri, 30 Jan 2026
 16:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20260124022042.2168136-1-xujiakai2025@iscas.ac.cn> <ydibz63oh6tj66utjlemeikxg7iateqoox3bwg7r4pdvbwijoj@5zxhlhesvv2t>
In-Reply-To: <ydibz63oh6tj66utjlemeikxg7iateqoox3bwg7r4pdvbwijoj@5zxhlhesvv2t>
From: eanut 6 <jiakaipeanut@gmail.com>
Date: Sat, 31 Jan 2026 08:15:44 +0800
X-Gm-Features: AZwV_QiUFp1qYkWALkWr6hfzyepY58cE_Y-BcKFDEwgeIpp64Dx1DEYCOS4-mFo
Message-ID: <CAFb8wJsPgfE2WRE2wcuYUwkqr27vGOPVv_VHJttQzWoA3dL_0Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Validate SBI STA shmem alignment in kvm_sbi_ext_sta_set_reg
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_161556_950569_B977EE24 
X-CRM114-Status: GOOD (  17.04  )
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKSeKAmWxsIHNlbmQgYSB2MiBzaG9ydGx5IHdpdGggdGhl
c2UgY2hhbmdlcy4KClRoYW5rcywKSmlha2FpCgpPbiBTYXQsIEphbiAzMSwgMjAyNiBhdCA0OjQ4
4oCvQU0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6
Cj4KPiBPbiBTYXQsIEphbiAyNCwgMjAyNiBhdCAwMjoyMDo0MkFNICswMDAwLCBKaWFrYWkgWHUg
d3JvdGU6Cj4gLi4uCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3Rh
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+ID4gaW5kZXggYWZhMDU0NWMzYmNm
Yy4uN2RmZTY3MWM0MmVhYSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X3N0YS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+ID4gQEAgLTE4
NiwyMyArMTg2LDI1IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfc3RhX3NldF9yZWcoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0sCj4gPiAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gICAgICAgdmFsdWUgPSAqKGNvbnN0IHVuc2lnbmVkIGxvbmcg
KilyZWdfdmFsOwo+ID4KPiA+ICsgICAgIGdwYV90IG5ld19zaG1lbSA9IHZjcHUtPmFyY2guc3Rh
LnNobWVtOwo+Cj4gUGxlYXNlIGRlY2xhcmUgbmV3X3NobWVtIGF0IHRoZSB0b3Agb2YgdGhlIGZ1
bmN0aW9uIGFuZCB0aGVyZSdzIG5vCj4gbmVlZCB0byBpbml0aWFsaXplIGl0IHRvIHZjcHUtPmFy
Y2guc3RhLnNobWVtLiBBY3R1YWxseSBpdCBhcHBlYXJzIHlvdQo+IG1lYW50IHRvIGluaXRpYWxp
emUgaXQgdG8gTlVMTCwgYmFzZWQgb24gdGhlICdpZiAobmV3X3NobWVtIC4uLiknIGNoZWNrCj4g
YmVsb3cuCj4KPiA+ICsKPiA+ICAgICAgIHN3aXRjaCAocmVnX251bSkgewo+ID4gICAgICAgY2Fz
ZSBLVk1fUkVHX1JJU0NWX1NCSV9TVEFfUkVHKHNobWVtX2xvKToKPiA+ICAgICAgICAgICAgICAg
aWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAg
IGdwYV90IGhpID0gdXBwZXJfMzJfYml0cyh2Y3B1LT5hcmNoLnN0YS5zaG1lbSk7Cj4gPgo+ID4g
LSAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guc3RhLnNobWVtID0gdmFsdWU7Cj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgdmNwdS0+YXJjaC5zdGEuc2htZW0gfD0gaGkgPDwgMzI7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgbmV3X3NobWVtID0gdmFsdWU7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgbmV3X3NobWVtIHw9IGhpIDw8IDMyOwo+ID4gICAgICAgICAgICAgICB9IGVs
c2Ugewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guc3RhLnNobWVtID0gdmFs
dWU7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgbmV3X3NobWVtID0gdmFsdWU7Cj4gPiAgICAg
ICAgICAgICAgIH0KPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICBjYXNlIEtWTV9S
RUdfUklTQ1ZfU0JJX1NUQV9SRUcoc2htZW1faGkpOgo+ID4gICAgICAgICAgICAgICBpZiAoSVNf
RU5BQkxFRChDT05GSUdfMzJCSVQpKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZ3BhX3Qg
bG8gPSBsb3dlcl8zMl9iaXRzKHZjcHUtPmFyY2guc3RhLnNobWVtKTsKPiA+Cj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgdmNwdS0+YXJjaC5zdGEuc2htZW0gPSAoKGdwYV90KXZhbHVlIDw8IDMy
KTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICB2Y3B1LT5hcmNoLnN0YS5zaG1lbSB8PSBsbzsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBuZXdfc2htZW0gPSAoKGdwYV90KXZhbHVlIDw8IDMy
KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBuZXdfc2htZW0gfD0gbG87Cj4gPiAgICAgICAg
ICAgICAgIH0gZWxzZSBpZiAodmFsdWUgIT0gMCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gICAgICAgICAgICAgICB9Cj4gPiBAQCAtMjEwLDcgKzIxMiwx
MCBAQCBzdGF0aWMgaW50IGt2bV9zYmlfZXh0X3N0YV9zZXRfcmVnKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgdW5zaWduZWQgbG9uZyByZWdfbnVtLAo+ID4gICAgICAgZGVmYXVsdDoKPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gPiAgICAgICB9Cj4KPiBQbGVhc2UgYWRkIGEgYmxh
bmsgbGluZSBoZXJlLgo+Cj4gPiArICAgICBpZiAobmV3X3NobWVtICYmICFJU19BTElHTkVEKG5l
d19zaG1lbSwgNjQpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiAr
ICAgICB2Y3B1LT5hcmNoLnN0YS5zaG1lbSA9IG5ld19zaG1lbTsKPgo+IEFuZCBhbm90aGVyIGJs
YW5rIGxpbmUgaGVyZS4KPgo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC0tCj4g
PiAyLjM0LjEKPiA+Cj4KPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
