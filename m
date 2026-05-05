Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00212FF8855
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7S+EkQAW97gpQbeO/gKYBj4UJde1GjXFIQDzr9SPKI8=; b=cQR5zRGhMyPUYr
	ybbJGdO79U3puqh1PLU9czmUTAERg5TXtnaw6jkCjUG6Gm2tjZoQbZ67Bfwic7ny57LINKOm+cgF/
	vDo5pVfT8iBMGy/vfeB+YWcoU6IFqHu/09m/MX1f99b3JKAlkpXy39+Ren93yqPZLSCQUWWZ5in/g
	OhcQ+Sng9xtpZkua0U1b5CbImO+8KWlACfmO7f0whjbeYoyyV59Rk0d46ccHp3/qgAX506Mtb9j/d
	57zZ/fCDrM7Uah+rUNmKgQq8MRzxDTvCIXaeSrOm+eCs9WPDqvFcpXGSWasWTKy2cLPFLtlNvH8f6
	wPvDo4m28L9wwRkMgwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIkr-0000000GukR-3Hmf;
	Tue, 05 May 2026 16:36:17 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIko-0000000GujJ-0vZS
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:36:15 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7de4ed0593fso3331057a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777998973; cv=none;
        d=google.com; s=arc-20240605;
        b=PVwaa4OtDXSMC0Hoo8EhgA9rZyeBKJG//m8fW5XiEr3ETwA+FBRW4hliEz/yDfbnJG
         fnUyS/3Ql/rQgBlqxQbfZJWuMdAWuPZ7NwtWdD0vbeWwdSYCx55LwuhtoTMjyVq7w/PH
         1FpU91IpEtSibjyzhNkfk+b4xkLc6WFnJ+FkQcpS4MIq0r8qmXK1GjGi7mFarOimwkFI
         agg5UeBiHgUKQ5I/2HeIJg6Fb7Z9sh94gLLtSVCY8bW5eh9GJktXPo+UPJu7KbAsDwGV
         Njhpb5NbPGTuB5cdudukVKMfdV86ARvRRVBpzfkfkdxtr8bq5OJsV4uK8vMeZKIcfq6m
         PSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XMwGqdsNVv3aob9cGd1eQz6UK34amfZUCSFO2bXmDok=;
        fh=wM7vZadMcAuBFx9WHi2ayY5ZRRSodanH+UrW1VNoYK4=;
        b=hf2tZNrQ4KivEJ2BhRcPPrCCc815gqebEWNb4rlN8nKO66GcMZWzX6U4vhUuOjnD2L
         H3seWQECuyj0/yotZVUY60pk5IXxviGqi2ZEJRt5C+/GO5mJvOFM6tKr/BX4NjIdG0Aj
         ccdw2mNohtit1HqewzxBKUXnhFe9sfTzq6+C8GGDeUjFOriLsM62M4JwcHjfKZlHpXr7
         pYoByZA1/lLir9Z9Us+RHG4tzePuwk7UbUvf3SX16WvCjGbMYvonITNPHlRAso5my2v0
         g8Fe1C6ZHLdmRfQ/y9oCQvpaFqhzDr/TfqQe44TIbBYsrKMXUTz4XGXDeR9e+OPWMZd+
         f8GQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1777998973; x=1778603773; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMwGqdsNVv3aob9cGd1eQz6UK34amfZUCSFO2bXmDok=;
        b=VjsHMTJAG+WzyEmjpKk3cExS0+/PxZivQH3w2TkiN8vAgVTXQd2tDqrglVdBeVdN0p
         YfgrrJZoo9BsoRxcFBXUyN8bh2knV69KElLZKQfAzQdm2LlA78ObAz5S6w2G5fSVJYpt
         aj18sjAWfsjDx1vgGmR9MCBcwnvgMzT99gwmaLsEuku6//r8M7uUxzs3kj2KXbHBpXWf
         4om+zebd1PNcdbDMg2pbxcC0EtwCiS0eAqwq5BEJHLkGZMcvJcuby+jvnf7ZsagXBgje
         Oda3F5DOEA04l8MdZCA1gjGCHHJNUUAcG1SiXpzhWLdI8pzDbl0YYF3fx/fFMtIzYhws
         4kwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998973; x=1778603773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMwGqdsNVv3aob9cGd1eQz6UK34amfZUCSFO2bXmDok=;
        b=RID6bxlV/5Tr/DbMD9Ie90jRZOJRlld9e3NmC5IGEfhsNh7LDjvSHRwFkqvRArd7tW
         W8NsEzjInwDoXZ/8X4P7t8BCmB096U6ngHHhUom5v5mxKwRwUhWj62Uy+VAx1ixxBqpM
         uOi7ykAp5uI6YNmGLICLtp3HLqASQtMnjXoAkiYCoOpz7/8DpHsOX+tpRW1eJdQekHnv
         JGtVI/DUZi4sq/aoONvDaZQ1F78Xf1Vvds0O6HJNGTT6euVcjW9gSFUvhLyWAHFEwY/4
         CiZeXhPpgvD8M4uYoASe0hORNDJvkuYAkcGHJUEDVNOXDLR7XIOOAczOzDDwNmJHJVya
         Ao1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/QR0S6V/3nDLzTbSPj2eaJp2qEttI3za8jwNgnwWs9+7uoNEC92+gAnYjn9DUXqlOzR2zBNa5lsEu7Mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnkajAcI9aWqOzLuMKU7svkDDkloQfUhHZwILSuTLEEadL7H0w
	ap/Z7M+dTMvvOdnf1QZrdi27WR8l0J4UE9QPrFk9W9KDFTZnz+9idRWLQIEjvium96LO/A1fDqF
	zLVhc7Dh0a0BpcgaoP+mWi5UsONbF2nt+StIvp3XFQw==
X-Gm-Gg: AeBDies5gwmsfFjC7cLbvdSQQ/f2kpebR2w1TiQvGc0nqrV5Ff9PcUc7jt7S/OcrG0r
	CkDEKH5HdTtA72/SV3+YGIi8pemOjQn+e3FwFcngZPCyVbXK7KaPslUvPB2R3OgSQofHeUfELcJ
	2u6+A2JOnedLQSRS5EzlL4yCsrpppuxHptL2/CAhbdOO0JUhLJME5TVrkTz3sfyorpE0u3l4qly
	23Ws6VMbXuQOfwF5CjKTRADyrnYlj6WMnWQSxBFU8p8tgOE8SyiJBTHNs4rozrTdvf4esK5AwM4
	xkjrE5ZGqiugm/y9YA==
X-Received: by 2002:a05:6820:4df9:b0:692:a19b:af68 with SMTP id
 006d021491bc7-6998a59a01emr1986059eaf.5.1777998973075; Tue, 05 May 2026
 09:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com> <7-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
In-Reply-To: <7-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 May 2026 09:36:02 -0700
X-Gm-Features: AVHnY4KvPh1rW_OXbHCyJsQ0b4w2L_79cfPR7de6IXz-sHUXJfM_liaWTT5PblY
Message-ID: <CAH2o1u4PJSf8epbjLcAD1rojYu2gLVUtgW4kd1J+Cnwzz08PeQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] iommu/riscv: Add NAPOT range invalidation support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_093614_272949_90E98542 
X-CRM114-Status: GOOD (  27.15  )
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

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgODo1N+KAr0FNIEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gVXNlIHRoZSBSSVNDLVYgSU9NTVUgQWRkcmVzcyBSYW5nZSBJ
bnZhbGlkYXRpb24gZXh0ZW5zaW9uCj4gKGNhcGFiaWxpdGllcy5TLCBzcGVjIHNlY3Rpb24gOS4z
KSB0byBpbnZhbGlkYXRlIGFuIElPVkEgcmFuZ2Ugd2l0aAo+IGEgc2luZ2xlIElPVElOVkFMLlZN
QSBjb21tYW5kIHVzaW5nIE5BUE9ULWVuY29kZWQgYWRkcmVzc2luZy4KPgo+IE9uZSBpb21tdV9p
b3RsYl9nYXRoZXIgbWFwcyB0byBvbmUgTkFQT1QgaW52YWxpZGF0aW9uIGNvbW1hbmQuIFRoZQo+
IHNtYWxsZXN0IHBvd2VyLW9mLXR3byBhbGlnbmVkIHJhbmdlIGNvdmVyaW5nIHRoZSBnYXRoZXIg
aXMgdXNlZCBzaW5jZQo+IG92ZXItaW52YWxpZGF0aW9uIGlzIGFsd2F5cyBzYWZlLgo+Cj4gUyBh
bmQgTkwgc2VlbSB0byBiZSBvcnRob2dvbmFsIGluIHRoZSBzcGVjLCBzbyBpZiBOTCBpcyBub3QK
PiBzdXBwb3J0ZWQgdGhlbiBnbG9iYWwgaW52YWxpZGF0aW9uIGlzIHByb2JhYmx5IGFsd2F5cyBn
b2luZyB0byBoYXBwZW4KPiBhcyB3aXBpbmcgYSBsYXJnZSByYW5nZSB3aXRob3V0IGEgdGFibGUg
Y2hhbmdlIGlzIG5vdCBjb21tb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMu
aCB8IDE3ICsrKysrKysrKysrKysKPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jICAgICAg
fCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDU0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pb21tdS9yaXNjdi9pb21tdS1iaXRzLmggYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJp
dHMuaAo+IGluZGV4IGYwMWI0OWFjODE1NTg2Li4zMmIzYWQzYWM5YWU1OSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaAo+ICsrKyBiL2RyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUtYml0cy5oCj4gQEAgLTY0LDYgKzY0LDcgQEAKPiAgI2RlZmluZSBSSVNDVl9J
T01NVV9DQVBBQklMSVRJRVNfUEQxNyAgICAgICAgICBCSVRfVUxMKDM5KQo+ICAjZGVmaW5lIFJJ
U0NWX0lPTU1VX0NBUEFCSUxJVElFU19QRDIwICAgICAgICAgIEJJVF9VTEwoNDApCj4gICNkZWZp
bmUgUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVTX05MICAgICAgICAgICAgQklUX1VMTCg0MikKPiAr
I2RlZmluZSBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfUyAgICAgICAgICAgICBCSVRfVUxMKDQz
KQo+Cj4gIC8qKgo+ICAgKiBlbnVtIHJpc2N2X2lvbW11X2lnc19zZXR0aW5ncyAtIEludGVycnVw
dCBHZW5lcmF0aW9uIFN1cHBvcnQgU2V0dGluZ3MKPiBAQCAtNDc1LDYgKzQ3Niw3IEBAIHN0cnVj
dCByaXNjdl9pb21tdV9jb21tYW5kIHsKPiAgI2RlZmluZSBSSVNDVl9JT01NVV9DTURfSU9USU5W
QUxfR1YgICAgICAgICAgICBCSVRfVUxMKDMzKQo+ICAjZGVmaW5lIFJJU0NWX0lPTU1VX0NNRF9J
T1RJTlZBTF9HU0NJRCAgICAgICAgIEdFTk1BU0tfVUxMKDU5LCA0NCkKPiAgI2RlZmluZSBSSVND
Vl9JT01NVV9DTURfSU9USU5WQUxfTkwgICAgICAgICAgICBCSVRfVUxMKDM0KQo+ICsjZGVmaW5l
IFJJU0NWX0lPTU1VX0NNRF9JT1RJTlZBTF9TICAgICAgICAgICAgIEJJVF9VTEwoOSkKPiAgLyog
ZHdvcmQxWzYxOjEwXSBpcyB0aGUgNEstYWxpZ25lZCBwYWdlIGFkZHJlc3MgKi8KPiAgI2RlZmlu
ZSBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxfQUREUiAgICAgICAgICBHRU5NQVNLX1VMTCg2MSwg
MTApCj4KPiBAQCAtNzMxLDYgKzczMywyMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3ZfaW9t
bXVfY21kX2ludmFsX3NldF9ubChzdHJ1Y3QgcmlzY3ZfaW9tbXVfY29tbWFuZCAqY21kKQo+ICAg
ICAgICAgY21kLT5kd29yZDAgfD0gUklTQ1ZfSU9NTVVfQ01EX0lPVElOVkFMX05MOwo+ICB9Cj4K
PiArLyoKPiArICogU2V0IE5BUE9ULWVuY29kZWQgYWRkcmVzcyBmb3IgcmFuZ2UgaW52YWxpZGF0
aW9uIChTPTEpLgo+ICsgKiBzel9sZzI6IGxvZzIgb2YgdG90YWwgcmFuZ2UgaW4gYnl0ZXMsIG11
c3QgYmUgPj0gMTMgKDhLaUIsIDIgcGFnZXMpLgo+ICsgKiBhZGRyIG11c3QgYmUgbmF0dXJhbGx5
IGFsaWduZWQgdG8gMl5zel9sZzIuCj4gKyAqLwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zf
aW9tbXVfY21kX2ludmFsX3NldF9uYXBvdCgKPiArICAgICAgIHN0cnVjdCByaXNjdl9pb21tdV9j
b21tYW5kICpjbWQsIHU2NCBhZGRyLCB1bnNpZ25lZCBpbnQgc3pfbGcyKQo+ICt7Cj4gKyAgICAg
ICB1NjQgcGZuID0gYWRkciA+PiAxMjsKPiArCj4gKyAgICAgICBwZm4gfD0gQklUX1U2NChzel9s
ZzIgLSAxMykgLSAxOwo+ICsgICAgICAgY21kLT5kd29yZDEgPSBGSUVMRF9QUkVQKFJJU0NWX0lP
TU1VX0NNRF9JT1RJTlZBTF9BRERSLCBwZm4pOwo+ICsgICAgICAgY21kLT5kd29yZDAgfD0gUklT
Q1ZfSU9NTVVfQ01EX0lPVElOVkFMX0FWIHwgUklTQ1ZfSU9NTVVfQ01EX0lPVElOVkFMX1M7Cj4g
K30KPiArCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X3Bz
Y2lkKHN0cnVjdCByaXNjdl9pb21tdV9jb21tYW5kICpjbWQsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHBzY2lkKQo+ICB7Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3Yv
aW9tbXUuYwo+IGluZGV4IGVhMTQ2MzA0MzA0NTFhLi40MWUyNmUyNjdhN2ZkNiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L3Jp
c2N2L2lvbW11LmMKPiBAQCAtOTI5LDYgKzkyOSwxMCBAQCBzdHJ1Y3QgcmlzY3ZfaW9tbXVfdGxi
aSB7Cj4gICAgICAgICAgICAgICAgIHU4IHN0cmlkZV9sZzI7Cj4gICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBudW07Cj4gICAgICAgICB9IHNpbmdsZTsKPiArICAgICAgIHN0cnVjdCB7Cj4g
KyAgICAgICAgICAgICAgIHU4IHN6X2xnMjsKPiArICAgICAgICAgICAgICAgdTY0IGFkZHI7Cj4g
KyAgICAgICB9IHJhbmdlOwo+ICB9Owo+Cj4gIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X3RsYmlf
Y2FsYyhzdHJ1Y3QgcmlzY3ZfaW9tbXVfdGxiaSAqdGxiaSwKPiBAQCAtOTQ1LDkgKzk0OSwyMyBA
QCBzdGF0aWMgdm9pZCByaXNjdl9pb21tdV90bGJpX2NhbGMoc3RydWN0IHJpc2N2X2lvbW11X3Rs
YmkgKnRsYmksCj4gICAgICAgICAvKiBObyBsZXZlbCBpbmZvcm1hdGlvbiBhdmFpbGFibGUgKi8K
PiAgICAgICAgIGlmICghY29tYmluZWQpIHsKPiAgICAgICAgICAgICAgICAgdGxiaS0+c2luZ2xl
LnVzZV9nbG9iYWwgPSB0cnVlOwo+ICsgICAgICAgICAgICAgICB0bGJpLT5yYW5nZS5zel9sZzIg
PSAwOwo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4KPiArICAgICAgIC8q
Cj4gKyAgICAgICAgKiBDYWxjdWxhdGUgdGhlIHNtYWxsZXN0IE5BUE9UIHJhbmdlIGNvbnRhaW5p
bmcgW3N0YXJ0LCBsYXN0XS4KPiArICAgICAgICAqIE5BUE9UIGVuY29kaW5nIHJlcXVpcmVzIGEg
cG93ZXItb2YtdHdvIHNpemVkLCBuYXR1cmFsbHkgYWxpZ25lZAo+ICsgICAgICAgICogcmFuZ2Uu
IE92ZXItaW52YWxpZGF0aW9uIGlzIGFsd2F5cyBzYWZlLgo+ICsgICAgICAgICovCj4gKyAgICAg
ICB0bGJpLT5yYW5nZS5zel9sZzIgPSBmbHM2NCh0bGJpLT5zdGFydCBeIHRsYmktPmxhc3QpOwo+
ICsgICAgICAgaWYgKHVubGlrZWx5KHRsYmktPnJhbmdlLnN6X2xnMiA+PSA2NCkpIHsKPiArICAg
ICAgICAgICAgICAgdGxiaS0+c2luZ2xlLnVzZV9nbG9iYWwgPSB0cnVlOwo+ICsgICAgICAgICAg
ICAgICB0bGJpLT5yYW5nZS5zel9sZzIgPSAwOwo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4g
KyAgICAgICB9Cj4gKyAgICAgICB0bGJpLT5yYW5nZS5hZGRyID0gdGxiaS0+c3RhcnQgJiB+KEJJ
VF9VNjQodGxiaS0+cmFuZ2Uuc3pfbGcyKSAtIDEpOwo+ICsKPiAgICAgICAgIC8qCj4gICAgICAg
ICAgKiBDYWxjdWxhdGUgc3RyaWRlIGZyb20gdGhlIGxvd2VzdCBjaGFuZ2VkIGxldmVsLiBSSVND
LVYgdXNlcyA0S2lCCj4gICAgICAgICAgKiBncmFudWxlIHdpdGggOSBiaXRzIHBlciBsZXZlbC4K
PiBAQCAtOTY5LDcgKzk4Nyw2IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2lvdGxiX2ludmFs
X2lvbW11KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LAo+ICAgICAgICAgYm9vbCB1
c2VfbmwgPSB0bGJpLT5ub25fbGVhZiAmJgo+ICAgICAgICAgICAgICAgICAgICAgICAoaW9tbXUt
PmNhcHMgJiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfTkwpOwo+ICAgICAgICAgc3RydWN0IHJp
c2N2X2lvbW11X2NvbW1hbmQgY21kOwo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBpb3ZhOwo+ICAg
ICAgICAgdW5zaWduZWQgaW50IGk7Cj4KPiAgICAgICAgIHJpc2N2X2lvbW11X2NtZF9pbnZhbF92
bWEoJmNtZCk7Cj4gQEAgLTk3OSwxNiArOTk2LDMwIEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11
X2lvdGxiX2ludmFsX2lvbW11KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LAo+ICAg
ICAgICAgICogSWYgbm9uLWxlYWYgZW50cmllcyB3ZXJlIGNoYW5nZWQgYW5kIHRoZSBJT01NVSBk
b2Vzbid0Cj4gICAgICAgICAgKiBzdXBwb3J0IE5MLCB3ZSBtdXN0IGZhbGwgYmFjayB0byBnbG9i
YWwgaW52YWxpZGF0aW9uIChBVj0wKS4KPiAgICAgICAgICAqLwo+IC0gICAgICAgaWYgKHRsYmkt
PnNpbmdsZS51c2VfZ2xvYmFsIHx8ICh0bGJpLT5ub25fbGVhZiAmJiAhdXNlX25sKSkKPiArICAg
ICAgIGlmICh0bGJpLT5ub25fbGVhZiAmJiAhdXNlX25sKQo+ICAgICAgICAgICAgICAgICBnb3Rv
IGdsb2JhbDsKPgo+IC0gICAgICAgaW92YSA9IHRsYmktPnN0YXJ0Owo+IC0gICAgICAgZm9yIChp
ID0gMDsgaSA8IHRsYmktPnNpbmdsZS5udW07IGkrKykgewo+IC0gICAgICAgICAgICAgICByaXNj
dl9pb21tdV9jbWRfaW52YWxfc2V0X2FkZHIoJmNtZCwgaW92YSk7Cj4gKyAgICAgICBpZiAoaW9t
bXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfUyAmJgo+ICsgICAgICAgICAgIHRs
YmktPnJhbmdlLnN6X2xnMiA+PSAxMykgewo+ICsgICAgICAgICAgICAgICByaXNjdl9pb21tdV9j
bWRfaW52YWxfc2V0X25hcG90KCZjbWQsIHRsYmktPnJhbmdlLmFkZHIsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGxiaS0+cmFuZ2Uuc3pfbGcyKTsK
PiAgICAgICAgICAgICAgICAgaWYgKHVzZV9ubCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBy
aXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X25sKCZjbWQpOwo+ICAgICAgICAgICAgICAgICByaXNj
dl9pb21tdV9jbWRfc2VuZChpb21tdSwgJmNtZCk7Cj4gLSAgICAgICAgICAgICAgIGlvdmEgKz0g
MVVMTCA8PCB0bGJpLT5zaW5nbGUuc3RyaWRlX2xnMjsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaW92YTsKPiArCj4gKyAgICAgICAgICAgICAgIGlm
ICh0bGJpLT5zaW5nbGUudXNlX2dsb2JhbCkKPiArICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IGdsb2JhbDsKPiArCj4gKyAgICAgICAgICAgICAgIGlvdmEgPSB0bGJpLT5zdGFydDsKPiArICAg
ICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IHRsYmktPnNpbmdsZS5udW07IGkrKykgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJpc2N2X2lvbW11X2NtZF9pbnZhbF9zZXRfYWRkcigmY21k
LCBpb3ZhKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAodXNlX25sKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3ZfaW9tbXVfY21kX2ludmFsX3NldF9ubCgmY21k
KTsKPiArICAgICAgICAgICAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfc2VuZChpb21tdSwg
JmNtZCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW92YSArPSAxVUxMIDw8IHRsYmktPnNp
bmdsZS5zdHJpZGVfbGcyOwo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gICAgICAg
ICByZXR1cm47Cj4gIGdsb2JhbDoKPiAtLQo+IDIuNDMuMAo+CgpSZXZpZXdlZC1ieTogVG9tYXN6
IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KClRoYW5rIHlvdSwKLSBUb21hc3oKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
