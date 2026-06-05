Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74F0CD6E7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EaoE3InYZMA9WYgg46mwF/BhnoozTr9FqkTl8mFJxM=; b=q48h13zHqBCshw
	arfLmRzZzFMPDmpEH5mA1Fl4jo8TW48nMCpUbJip3Dn6TRLVTPdkZZpX/xNPQtyDNBvJ16mQ16Rom
	eIrqgsEhjF7SdaJeeUxrNDMztdRfVUATfpzC2h6Avn7Bq5pOTzw83UnBMYuIFkCKCE++iJnhDYiii
	9IF0Baon1ep/qerzVfYL/66IUMEcJEPqlAGN9U2a1yQkkRtuMoIv9TedM5BPvJkEK4SBPVs8TaMR9
	v93WXH5oIRJhgDz6FUnMloE6jBJ2ObfbwmdD3Sv1SAfvt1nV38e4tZszMo7/bo8W4CX4jL92nwNE5
	CeJNUVfW2Jz1yP4i/+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVX9L-00000000t88-15ee;
	Fri, 05 Jun 2026 16:11:59 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVX9J-00000000t7I-10Jy
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 16:11:58 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51764768c36so29507731cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 09:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780675916; cv=none;
        d=google.com; s=arc-20240605;
        b=QBH8Nk4xsb4OgPN5kOyoLFnbjJjnicbu9mi6qU+1U8gxFcjH5ri2WPlurgVzSPSKez
         wfBwI2xDbn4nUzXcFSAHQHdUHM+FPjgnR+/slSw8rIPHdlQZCT0IXqLJ6jIZzi4JkAMG
         rg+x1XVDyjjtS1foTUJYTCZmTAhDTZeqL/KdSIUQoYgC9upx9C8SNdrOsTc/tYOQu3BZ
         RyOczZ/jc7prTDQ+8EK0FUYr3VcAvlZCEtGedhSpAzOIq7qBERZX/HVjNkBNPFSOaK6x
         k9FgQ6O68S38U2U09rDFQfS5/4fXpBWIFJJ8Rvu5mUJj1eXpWozCrqqgu6pysVi/Uatf
         Mx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B8zHAowjm9o5sCCpDMwWhliapSVQZdoHydKt2nMqWDU=;
        fh=r7ZEdSkpFaFMEhl5RZQ6GcITZdJ4JUe/nqR0lFWPAtk=;
        b=O2AuYR0n9mjPV+oz2UeKHfbrVGr0OWKH2tlWEmA9X/c4Yhwy8j9ZLX9QShS4rWwjUw
         0uqtHI5R3z1AHfDR48BjzFczMKRNQkl6szlUSoRZ2Tre6vmDzteJgLo/3la2ujo/d6It
         XjGIl4hmgadazzWydVC32Rp/fbANfKk/qQE+gqteKsbAovGgCMAZKeTh/i80fY7DLPJn
         3hDyqnVgQpdxx1F0OAkhT1wCKU1yBuKlhHWGez7U2ofZdzYpZ0HyyA/Y2cHmvkzaQAY0
         eP6l7fFuUorJzmQTovn2CK//GCy0Q00l3Pew02L/mGJ7odydY3LUrvwTRlI5Vmp14iPO
         0I9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780675916; x=1781280716; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8zHAowjm9o5sCCpDMwWhliapSVQZdoHydKt2nMqWDU=;
        b=ZpjuD/vzx7Lu/sCbvZs29izmXUKYqBLH53G2g4xeCSs/+Y/FdXm5C1gOInBww4JpCK
         VVL9kKstAnHtKe08J5nGBSLcJGoa9uWldZVk1+oY02CfL1+/r7/NYnAqiTiGTdNyPpdM
         5ZJY0WYS1pDHoZvT3PpKOywmNvFFU2wqClRzGLiiDMizDoRfmeDMAkwPRcC4+NOwCHSn
         KpAxuYztOLlpL2C4ofH2bao6LiFS+aBttBYTZ5bDMU9XjgstZbzAWkXLX+WwMKPIZyME
         qD+Q56i16SQ0ZJm5fOlCBd9BYRdy0QuzXORviD20vHCtv12SemRn6v5XAFXrUOy0dVWA
         oK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675916; x=1781280716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8zHAowjm9o5sCCpDMwWhliapSVQZdoHydKt2nMqWDU=;
        b=RLxZYo8ZDuQGtm9lvWRfSrkLbSG4QdPBiHUCFTQJda7UUlnMq3ww8VWAFjXXqP6Lew
         pIY8nwRqN8/qdk6fL5yQdCvQbxu5CMjxQiHMWQoE7dC+KcCan8zAwsjKwIav9UNcvyhN
         0NKFT/dDiwGyoXxYk0kA1XPwt5lydxwqBe+8AWVduHWLdsL8/8+4C33WmbkkFTwVD0xE
         zPa30WqRMo9rJCREa5qqsILAcW3kcHz/qvzQeR9XLY+Bh8gRwv7P86M2PkCqzzJNdyTw
         U5Mtke5367vGpwN4U9Ns7rf229Qz0an1AggT5bvYU5foOFCTPudkieCpvcVrgrbz9pM9
         J3Pg==
X-Forwarded-Encrypted: i=1; AFNElJ8bXbJGYK3KRvxMA3V2qRRgpWHbb2BVzDUWuRbMC1vxIzi0V8n2PVEmeoOQLIcORLCVsuwCQnnsKDogWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjq/FdZk8x2Qrv+YC6w7JtYBnP9OKo646WmOnFjCYgFxL/petB
	7CVn7RN8uSlopK1Guymi3uLNF0NZzOky2vbA/a1456K6jAam97SPx0d0E0IQexfWRHHP2BMvIPM
	xw9YEURMJJrC5N8iN5YC8CU+IgJg6NnECcs40wzlhJQ==
X-Gm-Gg: Acq92OFddRHEciRTttcJsLB0LntbL6+tsZ2Jlsi7ja2MXWTGnU5rTB2SRGa4OBZ+HaK
	8NH3pV4hdvnKVOJpnMVEKvwZDkAcZiEcP0+xhIJYQ9M2X1DdBCYrnlOECvmeg6vdZYDZXpQ7wyB
	lBZ+HJZLcNmAa3eGgukC7eUnxjbgBo5lokzo/g9H0dNG5Jmq2Jua9IM8+r7pHIdBuPDZf94+IrM
	hCcbGTXxqZ2oWgiNrqddqTwYHuhcECwHZ5Ynkt4DL4m4uFNaxzWoz2r3dL0YHpzsMBBj407uB0x
	FGWu7+CU64ISw7KPxKKV16J4iySdW28Jo1Ic0nXHKtxBI7PLpId7Ib3Iw51tORwBuJzymLKQ30v
	JCNGaZ739hr+Rg1XglqdsvSE7SEkVN2mVJ3Pe
X-Received: by 2002:a05:622a:47ce:b0:514:5d67:7a30 with SMTP id
 d75a77b69052e-51795c74e62mr59512281cf.43.1780675915711; Fri, 05 Jun 2026
 09:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com> <20260601-kvm-get_reg_list-v2-v5-2-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-2-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:41:43 +0530
X-Gm-Features: AVVi8CdMjAT0z7-9b8EOLBKxYkX64w5Y19kWLNobId7ujEDIshFbGvocPy1UTls
Message-ID: <CAAhSdy1QsWMYvn9ma5gSLHyezY32t=2YGpddOgrCzqCR9qa_ug@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] KVM: RISC-V: SBI FWFT: Add optional init()
 callback for hardware probing
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, inochiama@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_091157_543315_6A80737F 
X-CRM114-Status: GOOD (  21.36  )
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

T24gTW9uLCBKdW4gMSwgMjAyNiBhdCAzOjU24oCvUE0gWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYW4gb3B0aW9uYWwgaW5pdCgpIGNhbGxi
YWNrIHRvIHNlcGFyYXRlIG9uZS10aW1lIGhhcmR3YXJlIHByb2JpbmcKPiBmcm9tIHJ1bnRpbWUg
YXZhaWxhYmlsaXR5IGNoZWNrcy4gRm9yIHBvaW50ZXIgbWFza2luZywgdGhpcyBhbGxvd3MKPiBw
cm9iaW5nIHN1cHBvcnRlZCBQTU0gbGVuZ3RocyBkdXJpbmcgaW5pdGlhbGl6YXRpb24gd2hpbGUg
Y2hlY2tpbmcgSVNBCj4gZXh0ZW5zaW9uIGF2YWlsYWJpbGl0eSBhdCBydW50aW1lLgo+Cj4gRml4
IHRyeV90b19zZXRfcG1tKCkgdG8gcmVzdG9yZSB0aGUgcHJldmlvdXMgSEVOVkNGRy5QTU0gdmFs
dWUgYWZ0ZXIKPiBwcm9iaW5nLCBwcmV2ZW50aW5nIHNpZGUgZWZmZWN0cyBmcm9tIGhhcmR3YXJl
IGRldGVjdGlvbi4gQWRkIHByZWVtcHRpb24KPiBwcm90ZWN0aW9uIHRvIGVuc3VyZSBDU1IgcHJv
YmUgc2VxdWVuY2VzIGNvbXBsZXRlIGF0b21pY2FsbHkgb24gdGhlIHNhbWUKPiBDUFUuCj4KPiBG
aXhlczogNmY1NzZmYzBhZWI5ICgiUklTQy1WOiBLVk06IEFkZCBzdXBwb3J0IGZvciBTQklfRldG
VF9QT0lOVEVSX01BU0tJTkdfUE1MRU4iKQo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdh
bmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+IGluZGV4IDVlNGFhZmIwY2JmMS4uYWVlOTUxZjJi
OGU2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+IEBAIC0zNSw2ICszNSwxNiBAQCBzdHJ1
Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgewo+ICAgICAgICAgICovCj4gICAgICAgICBib29sICgq
c3VwcG9ydGVkKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+Cj4gKyAgICAgICAvKioKPiArICAg
ICAgICAqIEBpbml0OiBQcm9iZSBhbmQgaW5pdGlhbGl6ZSB0aGUgZmVhdHVyZSBvbiB0aGUgdmNw
dQo+ICsgICAgICAgICoKPiArICAgICAgICAqIFRoaXMgY2FsbGJhY2sgaXMgb3B0aW9uYWwuIElm
IHByb3ZpZGVkLCBpdCB3aWxsIGJlIGNhbGxlZCBkdXJpbmcKPiArICAgICAgICAqIHZjcHUgaW5p
dGlhbGl6YXRpb24gdG8gcHJvYmUgdGhlIGZlYXR1cmUgYXZhaWxhYmlsaXR5IGFuZCBwZXJmb3Jt
Cj4gKyAgICAgICAgKiBhbnkgbmVjZXNzYXJ5IGluaXRpYWxpemF0aW9uLiBSZXR1cm5zIHRydWUg
aWYgdGhlIGZlYXR1cmUgaXMgc3VwcG9ydGVkCj4gKyAgICAgICAgKiBhbmQgaW5pdGlhbGl6ZWQg
c3VjY2Vzc2Z1bGx5LCBmYWxzZSBvdGhlcndpc2UuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGJv
b2wgKCppbml0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICsKPiAgICAgICAgIC8qKgo+ICAg
ICAgICAgICogQHJlc2V0OiBSZXNldCB0aGUgZmVhdHVyZSB2YWx1ZSBpcnJlc3BlY3RpdmUgd2hl
dGhlciBmZWF0dXJlIGlzIHN1cHBvcnRlZCBvciBub3QKPiAgICAgICAgICAqCj4gQEAgLTEzMSwx
OSArMTQxLDMwIEBAIHN0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxl
Z2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPgo+ICBzdGF0aWMgYm9vbCB0cnlfdG9fc2V0
X3BtbSh1bnNpZ25lZCBsb25nIHZhbHVlKQo+ICB7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHBy
ZXY7Cj4gKyAgICAgICBib29sIHJldDsKPiArCj4gKyAgICAgICBwcmV2ID0gY3NyX3JlYWRfY2xl
YXIoQ1NSX0hFTlZDRkcsIEVOVkNGR19QTU0pOwo+ICAgICAgICAgY3NyX3NldChDU1JfSEVOVkNG
RywgdmFsdWUpOwo+IC0gICAgICAgcmV0dXJuIChjc3JfcmVhZF9jbGVhcihDU1JfSEVOVkNGRywg
RU5WQ0ZHX1BNTSkgJiBFTlZDRkdfUE1NKSA9PSB2YWx1ZTsKPiArICAgICAgIHJldCA9IChjc3Jf
cmVhZF9jbGVhcihDU1JfSEVOVkNGRywgRU5WQ0ZHX1BNTSkgJiBFTlZDRkdfUE1NKSA9PSB2YWx1
ZTsKPiArICAgICAgIGNzcl93cml0ZShDU1JfSEVOVkNGRywgcHJldik7Cj4gKwo+ICsgICAgICAg
cmV0dXJuIHJldDsKPiAgfQo+Cj4gIHN0YXRpYyBib29sIGt2bV9zYmlfZndmdF9wb2ludGVyX21h
c2tpbmdfcG1sZW5fc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgewo+IC0gICAg
ICAgc3RydWN0IGt2bV9zYmlfZndmdCAqZndmdCA9IHZjcHVfdG9fZndmdCh2Y3B1KTsKPiArICAg
ICAgIHJldHVybiByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSh2Y3B1LT5hcmNoLmlzYSwg
U01OUE0pOwo+ICt9Cj4KPiAtICAgICAgIGlmICghcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFi
bGUodmNwdS0+YXJjaC5pc2EsIFNNTlBNKSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNl
Owo+ICtzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3ZnRfcG9pbnRlcl9tYXNraW5nX3BtbGVuX2luaXQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0
ICpmd2Z0ID0gdmNwdV90b19md2Z0KHZjcHUpOwo+Cj4gKyAgICAgICBwcmVlbXB0X2Rpc2FibGUo
KTsKPiAgICAgICAgIGZ3ZnQtPmhhdmVfdnNfcG1sZW5fNyA9IHRyeV90b19zZXRfcG1tKEVOVkNG
R19QTU1fUE1MRU5fNyk7Cj4gICAgICAgICBmd2Z0LT5oYXZlX3ZzX3BtbGVuXzE2ID0gdHJ5X3Rv
X3NldF9wbW0oRU5WQ0ZHX1BNTV9QTUxFTl8xNik7Cj4gKyAgICAgICBwcmVlbXB0X2VuYWJsZSgp
Owo+Cj4gICAgICAgICByZXR1cm4gZndmdC0+aGF2ZV92c19wbWxlbl83IHx8IGZ3ZnQtPmhhdmVf
dnNfcG1sZW5fMTY7Cj4gIH0KPiBAQCAtMjMxLDYgKzI1Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsKPiAgICAgICAgICAgICAgICAg
LmZpcnN0X3JlZ19udW0gPSBvZmZzZXRvZihzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9md2Z0LCBwb2lu
dGVyX21hc2tpbmcuZW5hYmxlKSAvCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2l6ZW9mKHVuc2lnbmVkIGxvbmcpLAo+ICAgICAgICAgICAgICAgICAuc3VwcG9ydGVkID0ga3Zt
X3NiaV9md2Z0X3BvaW50ZXJfbWFza2luZ19wbWxlbl9zdXBwb3J0ZWQsCj4gKyAgICAgICAgICAg
ICAgIC5pbml0ID0ga3ZtX3NiaV9md2Z0X3BvaW50ZXJfbWFza2luZ19wbWxlbl9pbml0LAo+ICAg
ICAgICAgICAgICAgICAucmVzZXQgPSBrdm1fc2JpX2Z3ZnRfcmVzZXRfcG9pbnRlcl9tYXNraW5n
X3BtbGVuLAo+ICAgICAgICAgICAgICAgICAuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9wb2ludGVy
X21hc2tpbmdfcG1sZW4sCj4gICAgICAgICAgICAgICAgIC5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0
X3BvaW50ZXJfbWFza2luZ19wbWxlbiwKPiBAQCAtMzY1LDYgKzM4Nyw5IEBAIHN0YXRpYyBpbnQg
a3ZtX3NiaV9leHRfZndmdF9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAg
ICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmYtPnN1cHBvcnRlZCA9IHRy
dWU7Cj4KPiArICAgICAgICAgICAgICAgaWYgKGNvbmYtPnN1cHBvcnRlZCAmJiBmZWF0dXJlLT5p
bml0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbmYtPnN1cHBvcnRlZCA9IGZlYXR1cmUt
PmluaXQodmNwdSk7Cj4gKwo+ICAgICAgICAgICAgICAgICBjb25mLT5lbmFibGVkID0gY29uZi0+
c3VwcG9ydGVkOwo+ICAgICAgICAgICAgICAgICBjb25mLT5mZWF0dXJlID0gZmVhdHVyZTsKPiAg
ICAgICAgIH0KPgo+IC0tCj4gMi40My43Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
