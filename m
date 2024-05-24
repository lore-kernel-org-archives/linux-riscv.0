Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768FDC25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQxSy1sx4+L13WUt34djeu+AGNViZrpiXSVGaY0s/uk=; b=tDO30p1jySuhxz
	WMa5wPuIxTRerRt5R7A+Y8WiY+WhJA8gmCK8CcfhaySAYKbU8Xu54+GHeH7S2WVSDo/8t1xaKzAwQ
	PYJom4PuE201eRfRImS0rfae18zMeKpFpVxM72rm2+xseMWelVwFi7eNAJG6nrZWJTlmJziZV+fpt
	drFVlKlD/e02Y1hvOqx1FiybFNY5REMTo/l5OqukNy8HAWnvRkPEhx5CgdV1l8gI1yfFTbAZwI4Ik
	ZF2x21pAicqA5WbuqGiDglS7MEKrQi4UYtIT6JCgYhRMdC2/+PQ55iVsWVlTy0HwzwAEnGEAcdTU8
	ImnS5gWb07/IcGqUdocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sARVQ-00000008b2j-0oMy;
	Fri, 24 May 2024 09:46:32 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sARVN-00000008b0V-3hoj
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 09:46:31 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-62a08092c4dso7319517b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 02:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716543987; x=1717148787; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjgMHPkdKke/sFW+wP3x/OWfAW3icjljhDceGb+T51c=;
        b=P/FqozAIS9IutAqkZLUSwHXP0xErMwSPOJjCON+3X8Wk5yn3jpy21E3AamcFkhlHTW
         +o8xImLtBdZlgFNEQVeaAVnoaY6AlnK8pSlWFkoIQyk143Mc74FPSP21Zt1Ytx1auYcz
         SN3Cwg2McmK7udlmxvqQEGuQ0cUnmztN9/7ACq8uvie7wC7NWBJo/T+mOhoA6I6ZgjxP
         EOhsfZiS3fItTMi/kIZLEZjlt0LXVPnnpe24JXpfGpbeyB5jnP7YPXS7wyg2vSfb7DJi
         atnU1LDyETfXaf6KxuCB6oIm+Ayjo/4ixDGxSATy8idBrNSvCkBKPlDVCys+jpX6wjL8
         ABfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716543987; x=1717148787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjgMHPkdKke/sFW+wP3x/OWfAW3icjljhDceGb+T51c=;
        b=dWiZ6QhHExXwFde9zV2ZPSz85MxkpFczGJfxvMn4hCVu0pCYlNF8BS0ohN+lWYY7DP
         As8yLc/keDgDzHilkOu12TIUg/DbfYUYSfCPppAB9jWlT9OjNsM6ys9dkfZrXGvX9ljn
         KUyb1THPTbIm+X8A7Lfz9za8+0b4iiylh4AYgcNKbGlUyze7BM2ZTKYg3OK9ljJ9bgGk
         jXq8/lrJQUnmzeBvbdfDBHvv0Rz8E7tDwYCqk161d/YWFA8qFrC8WI/rwD7qY+RawLTR
         krQOdX/0y/tj61bobDUWq5l+j9bSOj1wyoL2IIMg0KXX+1ioa7mG7fLyx5ZvjF0sr+OP
         a/+A==
X-Forwarded-Encrypted: i=1; AJvYcCUmGXa9ZEyuKm7wmJYy/Tq5TPOut9dsCX9CFOA4Uednod9ijaAldrIgn1aXMp52DwI/de23s7xrpXHT8B+cIrJ3FsaZCKth+j3dxwTB7mjH
X-Gm-Message-State: AOJu0Yw9vQ4fuQ0srdgcIF6USG8M9SfSK/cDbdCaAmzPidBlV6hwqgrw
	HpALwzrkgUPsgZNoSS2B2P1t+YcVZg2yQEeQLTz09nWNrisIzrMfHNQPQsTlvMgQ3JS/UfnlTaK
	h8QnK55EreW160MMYejSB6/iwuKjkAljgMXwqmg==
X-Google-Smtp-Source: AGHT+IElLw9ldbzBvHZ3/TQt52rrJpYv9UPwEZAezgFRSlhX7EDpAmWQFaSOD80MnXamfMqxd179zHrTOZ6XZB7bNkc=
X-Received: by 2002:a25:ae1e:0:b0:df4:df14:61bc with SMTP id
 3f1490d57ef6-df7721b7236mr1844605276.29.1716543987537; Fri, 24 May 2024
 02:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240403234054.2020347-1-debug@rivosinc.com> <20240403234054.2020347-23-debug@rivosinc.com>
In-Reply-To: <20240403234054.2020347-23-debug@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 24 May 2024 17:46:16 +0800
Message-ID: <CABgGipW4ZTFLh1dkiRuWD0WP4RRkfhyFCc+RsUjCD2EkA5GhSQ@mail.gmail.com>
Subject: Re: [PATCH v3 22/29] riscv sigcontext: adding cfi state field in sigcontext
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, broonie@kernel.org, 
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org, 
	ajones@ventanamicro.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, corbet@lwn.net, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com, akpm@linux-foundation.org, 
	arnd@arndb.de, ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org, 
	jerry.shih@sifive.com, hankuan.chen@sifive.com, greentime.hu@sifive.com, 
	evan@rivosinc.com, xiao.w.wang@intel.com, charlie@rivosinc.com, 
	apatel@ventanamicro.com, mchitale@ventanamicro.com, dbarboza@ventanamicro.com, 
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org, 
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com, 
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de, bhe@redhat.com, 
	jeeheng.sia@starfivetech.com, cyy@cyyself.name, maskray@google.com, 
	ancientmodern4@gmail.com, mathis.salmen@matsal.de, cuiyunhui@bytedance.com, 
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, 
	david@redhat.com, catalin.marinas@arm.com, revest@chromium.org, 
	josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, 
	ojeda@kernel.org, jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_024629_945396_C47BC30E 
X-CRM114-Status: GOOD (  19.68  )
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

SGkgRGVlcGFrLAoKT24gVGh1LCBBcHIgNCwgMjAyNCBhdCA3OjQy4oCvQU0gRGVlcGFrIEd1cHRh
IDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gU2hhZG93IHN0YWNrIG5lZWRzIHRvIGJl
IHNhdmVkIGFuZCByZXN0b3JlZCBvbiBzaWduYWwgZGVsaXZlcnkgYW5kIHNpZ25hbAo+IHJldHVy
bi4KPgo+IHNpZ2NvbnRleHQgZW1iZWRkZWQgaW4gdWNvbnRleHQgaXMgZXh0ZW5kaWJsZS4gQWRk
aW5nIGNmaSBzdGF0ZSBpbiB0aGVyZQo+IHdoaWNoIGNhbiBiZSB1c2VkIHRvIHNhdmUgY2ZpIHN0
YXRlIGJlZm9yZSBzaWduYWwgZGVsaXZlcnkgYW5kIHJlc3RvcmUKPiBjZmkgc3RhdGUgb24gc2ln
cmV0dXJuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNv
bT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3NpZ2NvbnRleHQuaCB8IDUg
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9zaWdjb250ZXh0LmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vc2lnY29udGV4dC5oCj4gaW5kZXggY2Q0ZjE3NWRjODM3Li41Y2NkZDk0
YTA4NTUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3NpZ2NvbnRl
eHQuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9zaWdjb250ZXh0LmgKPiBA
QCAtMjEsNiArMjEsMTAgQEAgc3RydWN0IF9fc2NfcmlzY3Zfdl9zdGF0ZSB7Cj4gICAgICAgICBz
dHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSB2X3N0YXRlOwo+ICB9IF9fYXR0cmlidXRlX18oKGFs
aWduZWQoMTYpKSk7Cj4KPiArc3RydWN0IF9fc2NfcmlzY3ZfY2ZpX3N0YXRlIHsKPiArICAgICAg
IHVuc2lnbmVkIGxvbmcgc3NfcHRyOyAgIC8qIHNoYWRvdyBzdGFjayBwb2ludGVyICovCj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIHJzdmQ7ICAgICAgICAgICAgIC8qIGtlZXBpbmcgYW5vdGhlciB3
b3JkIHJlc2VydmVkIGluIGNhc2Ugd2UgbmVlZCBpdCAqLwo+ICt9Owo+ICAvKgo+ICAgKiBTaWdu
YWwgY29udGV4dCBzdHJ1Y3R1cmUKPiAgICoKPiBAQCAtMjksNiArMzMsNyBAQCBzdHJ1Y3QgX19z
Y19yaXNjdl92X3N0YXRlIHsKPiAgICovCj4gIHN0cnVjdCBzaWdjb250ZXh0IHsKPiAgICAgICAg
IHN0cnVjdCB1c2VyX3JlZ3Nfc3RydWN0IHNjX3JlZ3M7Cj4gKyAgICAgICBzdHJ1Y3QgX19zY19y
aXNjdl9jZmlfc3RhdGUgc2NfY2ZpX3N0YXRlOwoKSSBhbSBjb25jZXJuZWQgYWJvdXQgdGhpcyBj
aGFuZ2UgYXMgdGhpcyBjb3VsZCBwb3RlbnRpYWxseSBicmVhayB1YWJpLgpMZXQncyBzYXkgdGhl
cmUgaXMgYSBwcmUtQ0ZJIHByb2dyYW0gcnVubmluZyBvbiB0aGlzIGtlcm5lbC4gSXQKcmVjZWl2
ZXMgYSBzaWduYWwgc28gdGhlIGtlcm5lbCBsYXlzIG91dCB0aGUgc2lnLXN0YWNrIGFzIHByZXNl
bnRlZCBpbgp0aGlzIHN0cnVjdHVyZS4gSWYgdGhlIHByb2dyYW0gYWNjZXNzZXMgc2NfZnByZWdz
LCBpdCB3b3VsZCBub3cgZ2V0CnNjX2NmaV9zdGF0ZS4gQXMgdGhlIG9mZnNldCBoYXMgY2hhbmdl
ZCwgYW5kIHRoZSBwcmUtQ0ZJIHByb2dyYW0gaGFzCm5vdCBiZWVuIHJlLWNvbXBpbGVkLgoKPiAg
ICAgICAgIHVuaW9uIHsKPiAgICAgICAgICAgICAgICAgdW5pb24gX19yaXNjdl9mcF9zdGF0ZSBz
Y19mcHJlZ3M7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBfX3Jpc2N2X2V4dHJhX2V4dF9oZWFk
ZXIgc2NfZXh0ZGVzYzsKPiAtLQo+IDIuNDMuMgo+CgpUaGVyZSBtYXkgYmUgdHdvIHdheXMgdG8g
ZGVhbCB3aXRoIHRoaXMuIE9uZSBpcyB0byB1c2UgYSBkaWZmZXJlbnQKc2lnbmFsIEFCSSBmb3Ig
Q0ZJLWVuYWJsZWQgcHJvZ3JhbXMuIFRoaXMgbWF5IGNvbXBsaWNhdGUgdGhlIHVzZXIKc3BhY2Ug
YmVjYXVzZSBuZXcgcHJvZ3JhbXMgd2lsbCBoYXZlIHRvIGRldGVybWluZSB3aGV0aGVyIGl0IHNo
b3VsZAp1c2UgdGhlIENGSS1BQkkgYXQgcnVuIHRpbWUuIEFub3RoZXIgd2F5IGlzIHRvIGZvbGxv
dyB3aGF0IFZlY3RvciBkb2VzCmZvciBzaWduYWwgc3RhY2suIEl0IGFkZHMgYSB3YXkgdG8gaW50
cm9kdWNlIG5ldyBleHRlbnNpb25zIG9uIHNpZ25hbApzdGFjayB3aXRob3V0IGltcGFjdGluZyBB
QkkuCgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBtaXN1bmRlcnN0YW5kIGFueXRoaW5nLCB0aGFu
a3MuCgpDaGVlcnMsCkFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
