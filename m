Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D7FC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67J1FPa0yLXZswR4qyQRgQiYFzg8Ca2OiF6575wGwqo=; b=oFdtPNm4sUajuq
	qoBq54+hKYLGlXvabOODB6kJ58XMgqthVwoka33odvFgIdGwNJ5CRTwwhg2YcAdA5/zun9dqQW5m3
	Xgc7Hk2As47p9bjNbR06zs2hUZqmDYO0csK1ytyl5ocGPDzT8QuFI+3cusWQfilrmrAMqWynIhRAu
	TZCxeh8YePLZRwiPTdunFeF/lXTWzrepzMNYxKAb/254ApuNsu3F2e9i90rD/iJ5wbGiRU8nNbg0W
	Tvzc46BsCB02Whew0jq6j//G9jPcLK7i/fEuG+ZxU0DmuqNr7F2Ozlf1TB1UM4euPL+txMvvZ+VHo
	GKarUIz8MmTvbvz9WLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWmi-007eGs-2k;
	Tue, 05 Dec 2023 14:52:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWmf-007eG8-3D
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 14:52:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d076ebf79cso15514015ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701787943; x=1702392743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ByBv3ux7sze9gldwQ6PK9+560Yvk3QCH1GMjLl4z4k=;
        b=TFRbIXlQ/2Y8NgYOrHtQvOtLE4hj8lRXHxgkNLrjL7xtUoXddLyH9B96NDLql0ti+b
         WuPKK/b1xz7bYl4L81GSTDuutlG40oUUebm9MuBh+Mnou7GnW0H0NQkIULOa4rUjL2S6
         qG/jqcdegnxbPld/sTFiZTDVaw6g8OARPamCfycyC9Pgoe3Q8qEZKlCd5lOABcvrywaP
         LSM8aKHF8nO055tEeQCAiObsgBCmuWj4S2/9uADZg3bVW4Pw7dTPXrANLpAkQjTgCGYO
         R2+JKaETqFGAp37bVPz2tX9mdsOQiW1JNyopLT1/bWVILoDRDOGOQ7eEx50GDq3bXlXH
         rCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787943; x=1702392743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ByBv3ux7sze9gldwQ6PK9+560Yvk3QCH1GMjLl4z4k=;
        b=sDNBh77vSZBwomOJE+NhQkfwploNwu5rSI5FKQlbSeb3UB322Y29tAGsGatxmLTKoa
         ynGNp9lWIuYBvLJDBkFkJD6oQBEJDtDlPxzS5UNi6uGMuVh9SN2/rN8eCVEMbRvpivkK
         wwCUqILf9bxFhljdl3SUZN3JjSrKtjSrKykNswaFwhoQTmQ7di11DeSC2fGctP0wErBJ
         Nr+MlT2iObT0khv044Yop7mPcxaW59Rx68KSNLBTJGvcCIIgqHdmqAxYI5Jg8oPr8uMD
         3EIpEdNRzYZu9fxBwBhIzuBnj1R1Pgl/Esm6D2oJe8lx1EIADd2SyGeGJd3sLUvzGYVM
         rx1A==
X-Gm-Message-State: AOJu0YxjiB1+VEd+ELtcbAUhOH5PyMR6Mc2HkyqsQcOSh4pSlgWjlqHX
	7y2nTLm8UZmw+TF3CZviignWjpI6t3XFuKyCvzJJTA==
X-Google-Smtp-Source: AGHT+IHhi6+245LxN6wxFFUT7G88D+PGNxnZ/aL+ySaphfzC/60aeu9G8myzUfq1e1jVmI9xpLAsj5ja7gw2S6aRPOA=
X-Received: by 2002:a17:902:8f8c:b0:1d0:6ffd:ceb8 with SMTP id
 z12-20020a1709028f8c00b001d06ffdceb8mr3489772plo.113.1701787942672; Tue, 05
 Dec 2023 06:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20231205135041.2208004-1-dbarboza@ventanamicro.com> <20231205135041.2208004-4-dbarboza@ventanamicro.com>
In-Reply-To: <20231205135041.2208004-4-dbarboza@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 5 Dec 2023 20:22:10 +0530
Message-ID: <CAK9=C2WaY--O303KfWK0ty8Pe_SipVqAbvARc4hODC=CAhCTnw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org, 
	palmer@dabbelt.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_065226_057278_830B92A3 
X-CRM114-Status: GOOD (  17.50  )
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

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCA3OjIx4oCvUE0gRGFuaWVsIEhlbnJpcXVlIEJhcmJvemEK
PGRiYXJib3phQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQWRkIGFsbCB2ZWN0b3IgQ1NS
cyAodnN0YXJ0LCB2bCwgdnR5cGUsIHZjc3IsIHZsZW5iKSBpbiBnZXQtcmVnLWxpc3QuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSA8ZGJhcmJvemFAdmVudGFuYW1p
Y3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyB8IDM1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiBpbmRleCBmOGM5ZmEwYzAzYzUuLjcxMjc4
NWE4ZjIyYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IEBAIC05ODYsNiArOTg2LDM1IEBAIHN0
YXRpYyBpbnQgY29weV9zYmlfZXh0X3JlZ19pbmRpY2VzKHU2NCBfX3VzZXIgKnVpbmRpY2VzKQo+
ICAgICAgICAgcmV0dXJuIG51bV9zYmlfZXh0X3JlZ3MoKTsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxp
bmUgdW5zaWduZWQgbG9uZyBudW1fdmVjdG9yX3JlZ3MoY29uc3Qgc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+ICt7Cj4gKyAgICAgICBpZiAoIXJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZj
cHUtPmFyY2guaXNhLCB2KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAg
ICAgLyogdnN0YXJ0LCB2bCwgdnR5cGUsIHZjc3IsIHZsZW5iOyAqLwo+ICsgICAgICAgcmV0dXJu
IDU7CgpXZSBoYXZlIHR3byB0eXBlIG9mIHZlY3RvciBPTkVfUkVHIElEczoKS1ZNX1JFR19SSVND
Vl9WRUNUT1JfQ1NSX1JFRygpCktWTV9SRUdfUklTQ1ZfVkVDVE9SX1JFRygpCgpZb3UgYXJlIG9u
bHkgcmV0dXJuaW5nIGNvdW50IG9mIEtWTV9SRUdfUklTQ1ZfVkVDVE9SX0NTUl9SRUcoKQpidXQg
bm90IGluY2x1ZGluZyBLVk1fUkVHX1JJU0NWX1ZFQ1RPUl9SRUcoKQoKUmVmZXIsIGt2bV9yaXNj
dl92Y3B1X3ZyZWdfYWRkcigpIGltcGxlbWVudGF0aW9uIGluCmFyY2gvcmlzY3Yva3ZtL3ZjcHVf
dmVjdG9yLmMKCgo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGNvcHlfdmVjdG9yX3JlZ19pbmRpY2Vz
KGNvbnN0IHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHU2NCBfX3VzZXIgKnVpbmRpY2VzKQo+ICt7Cj4gKyAgICAgICBpbnQgbiA9IG51bV92
ZWN0b3JfcmVncyh2Y3B1KTsKPiArICAgICAgIHU2NCByZWcsIHNpemU7Cj4gKwo+ICsgICAgICAg
Zm9yIChpbnQgaSA9IDA7IGkgPCBuOyBpKyspIHsKPiArICAgICAgICAgICAgICAgc2l6ZSA9IElT
X0VOQUJMRUQoQ09ORklHXzMyQklUKSA/IEtWTV9SRUdfU0laRV9VMzIgOiBLVk1fUkVHX1NJWkVf
VTY0Owo+ICsgICAgICAgICAgICAgICByZWcgPSBLVk1fUkVHX1JJU0NWIHwgc2l6ZSB8IEtWTV9S
RUdfUklTQ1ZfVkVDVE9SIHwgaTsKPiArCj4gKyAgICAgICAgICAgICAgIGlmICh1aW5kaWNlcykg
ewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChwdXRfdXNlcihyZWcsIHVpbmRpY2VzKSkK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHVpbmRpY2VzKys7Cj4gKyAgICAgICAgICAgICAgIH0KClNhbWUg
YXMgYWJvdmUuCgo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBuOwo+ICt9Cj4gKwo+
ICAvKgo+ICAgKiBrdm1fcmlzY3ZfdmNwdV9udW1fcmVncyAtIGhvdyBtYW55IHJlZ2lzdGVycyBk
byB3ZSBwcmVzZW50IHZpYSBLVk1fR0VUL1NFVF9PTkVfUkVHCj4gICAqCj4gQEAgLTEwMDEsNiAr
MTAzMCw3IEBAIHVuc2lnbmVkIGxvbmcga3ZtX3Jpc2N2X3ZjcHVfbnVtX3JlZ3Moc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgcmVzICs9IG51bV90aW1lcl9yZWdzKCk7Cj4gICAgICAg
ICByZXMgKz0gbnVtX2ZwX2ZfcmVncyh2Y3B1KTsKPiAgICAgICAgIHJlcyArPSBudW1fZnBfZF9y
ZWdzKHZjcHUpOwo+ICsgICAgICAgcmVzICs9IG51bV92ZWN0b3JfcmVncyh2Y3B1KTsKPiAgICAg
ICAgIHJlcyArPSBudW1faXNhX2V4dF9yZWdzKHZjcHUpOwo+ICAgICAgICAgcmVzICs9IG51bV9z
YmlfZXh0X3JlZ3MoKTsKPgo+IEBAIC0xMDQ1LDYgKzEwNzUsMTEgQEAgaW50IGt2bV9yaXNjdl92
Y3B1X2NvcHlfcmVnX2luZGljZXMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Owo+ICAgICAgICAgdWluZGljZXMgKz0gcmV0Owo+Cj4gKyAgICAgICBy
ZXQgPSBjb3B5X3ZlY3Rvcl9yZWdfaW5kaWNlcyh2Y3B1LCB1aW5kaWNlcyk7Cj4gKyAgICAgICBp
ZiAocmV0IDwgMCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIHVpbmRp
Y2VzICs9IHJldDsKPiArCj4gICAgICAgICByZXQgPSBjb3B5X2lzYV9leHRfcmVnX2luZGljZXMo
dmNwdSwgdWluZGljZXMpOwo+ICAgICAgICAgaWYgKHJldCA8IDApCj4gICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4gLS0KPiAyLjQxLjAKPgo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
