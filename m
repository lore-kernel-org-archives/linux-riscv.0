Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662B4C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yogfEKLgbL/YJeTMugN1G2ytLv5XOj0RHcimVTYyp7U=; b=ZybjgW40Q07Jhw
	nBbE43ME1C/3Mr2NjxndmYrBkdPtbomHCvqk449QWvlobADG3hdq5ahqfDJZRwo293avMOstfUzaU
	rQq75i3OdkF/eVg2uf9V+1CJ2qHqD3/UteVY78HSNHDGmbW20aNeBehAobJJMMmv3PbbEllahbz++
	fPW3oCA0yP1AbmPp541drBdAPL0h2syxq4cTafTjX7+vLyGuLd5fJq9M63VYie5sC3E94NontHdR3
	3N1m0aX2Rsjia8M5kYFu3uK32ZYHZQlBY9y3Svd7EMtsJZWmwSrA9qYmdSSEF/mtDVwxlWtU5xH0p
	V/6iai88LQiXeG72xa/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q01YJ-00GXKo-0k;
	Fri, 19 May 2023 14:57:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q01YF-00GXJD-2t
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 14:57:54 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-510d8ead2f1so4450943a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1684508268; x=1687100268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MB1gL2oBsC+YZjZOiZ25huW5+Ad4VlGQquEJmqHKDDo=;
        b=IVtbimyeNzXA2kdYBjcuIE7c63sD0W4L6uNEZ5EIBm5XcU6n3MV3sCoN1BSlms0CM1
         t1EnPFSIPcwo4gpZe/aVW5IO1EG4Xh9g8o6diMOMU5pj3NKz5345FrpHFrQ7mfyI+kpl
         IDiWhXIzkTtjtluUV/ul+DjeJ40UlxioQ0PqPKDmmWa8ZRq5gn6uj1jnAN4JwMhvn2Yn
         OAY6nlE2kens59bsPZiEfQ6A4aomCNMLeq1HHViyQ4lnMagcfbTn73kdby5QrGKSDh5b
         1EDPFA1Vd5738Gqccvm0WGlMng+rGCpiO+DmevCCGvg4t65fftFXdqg+w3UlRCMPUFEt
         vfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684508268; x=1687100268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MB1gL2oBsC+YZjZOiZ25huW5+Ad4VlGQquEJmqHKDDo=;
        b=bpSqFccSQSoypbXoBeksET2QhZkLMoI4xtBOyhoEPnBSn+5ccWDuCkhBk+69X1lL5b
         nLlw/BtCpSbWADsTMi8VojE44ESLikrVglbKeI+3WwGVdnFTkGIVb9vj+ZTqtXEKl5j+
         jGY7exHNe8RxGZvm7koEzBbxiBTn/BdNDOXkCPPA1sJd1ZgupzP7+e0UUmpx/in1EwZ7
         HgQivQEv2qaPqJTLK1aulVhqlKCfMIdCnHPBMlizuwVaWzpJvxRf2w4ixhtkfi9wsbht
         GyNCeyG1FzA4YHh/A0KyAStXpCsmRPlBxXBp58RhZIh0MJqWvGrRxWpOpZw9lXPT8a6K
         n52Q==
X-Gm-Message-State: AC+VfDzWCqDMLTFKkLleBlJ2McV8S2eZ9sOHR4KP2GFBTv8G3mbHe6U0
	VwobBjOoqlo2yGnN1HEM3FsdIR/ctAo7M63KVhO10g==
X-Google-Smtp-Source: ACHHUZ4Ti+u+2e3EzdiskfTSJjp/Ui4IHua5nUGV5WNzo47Y2pyXKwksmH8FmOEzjM+jFcSJDVUGJ/uq0YWR/cSBtO4=
X-Received: by 2002:aa7:ce02:0:b0:510:d197:e873 with SMTP id
 d2-20020aa7ce02000000b00510d197e873mr1872859edv.31.1684508268167; Fri, 19 May
 2023 07:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230426171328.69663-1-ajones@ventanamicro.com> <20230426171328.69663-2-ajones@ventanamicro.com>
In-Reply-To: <20230426171328.69663-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 May 2023 20:27:36 +0530
Message-ID: <CAAhSdy2_SO5C=aofct0ZYzivcEJmti3e69Pivy0PKEhOyXZ-jw@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: KVM: Disable SBI extension when its probe fails
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_075751_932575_31F42665 
X-CRM114-Status: GOOD (  20.91  )
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

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTA6NDPigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdoZW4gYW4gU0JJIGV4dGVuc2lvbiBzcGVjaWZp
YyBwcm9iZSBmdW5jdGlvbiBleGlzdHMgYW5kIGZhaWxzLCB0aGVuCj4gdXNlIHRoZSBleHRlbnNp
b25fZGlzYWJsZWQgY29udGV4dCB0byBkaXNhYmxlIHRoZSBleHRlbnNpb24uIFRoaXMKPiBlbnN1
cmVzIHRoZSBleHRlbnNpb24ncyBmdW5jdGlvbnMgY2Fubm90IGJlIGludm9rZWQuIERvaW5nIHRo
ZQo+IGRpc2FibGluZyBpbiBrdm1fdmNwdV9zYmlfZmluZF9leHQoKSBhbGxvd3MgaXQgdG8gYmUg
ZG9uZSBsYXppbHkKPiBvbiBpdHMgZmlyc3QgdXNlLiBDaGVja2luZyBleHRlbnNpb25fZGlzYWJs
ZWQgcHJpb3IgdG8gcHJvYmluZwo+IGVuc3VyZXMgdGhlIHByb2JlIGlzIG9ubHkgZXhlY3V0ZWQg
b25jZSBmb3IgZGlzYWJsZWQgZXh0ZW5zaW9ucy4KPiBMYXRlciBwYXRjaGVzIGVuc3VyZSB3ZSBv
bmx5IGV4ZWN1dGUgcHJvYmUgb25jZSBmb3IgZW5hYmxlZAo+IGV4dGVuc2lvbnMgYXMgd2VsbC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgfCAyMyArKysrKysrKysrKysrKyst
LS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmkuYwo+IGluZGV4IGU1MmZkZTUwNDQzMy4uYWEzYzEyNmQyZTNjIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaS5jCj4gQEAgLTMwNywxOCArMzA3LDI1IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9n
ZXRfcmVnX3NiaV9leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICBjb25zdCBzdHJ1Y3Qga3Zt
X3ZjcHVfc2JpX2V4dGVuc2lvbiAqa3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25n
IGV4dGlkKQo+ICB7Cj4gLSAgICAgICBpbnQgaTsKPiAtICAgICAgIGNvbnN0IHN0cnVjdCBrdm1f
cmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSAqc2V4dDsKPiAgICAgICAgIHN0cnVjdCBrdm1fdmNw
dV9zYmlfY29udGV4dCAqc2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlfY29udGV4dDsKPiArICAg
ICAgIGNvbnN0IHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSAqZW50cnk7Cj4g
KyAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0Owo+ICsgICAg
ICAgaW50IGk7Cj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNiaV9leHQp
OyBpKyspIHsKPiAtICAgICAgICAgICAgICAgc2V4dCA9ICZzYmlfZXh0W2ldOwo+IC0gICAgICAg
ICAgICAgICBpZiAoc2V4dC0+ZXh0X3B0ci0+ZXh0aWRfc3RhcnQgPD0gZXh0aWQgJiYKPiAtICAg
ICAgICAgICAgICAgICAgIHNleHQtPmV4dF9wdHItPmV4dGlkX2VuZCA+PSBleHRpZCkgewo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGlmIChzZXh0LT5kaXNfaWR4IDwgS1ZNX1JJU0NWX1NCSV9F
WFRfTUFYICYmCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIHNjb250ZXh0LT5leHRlbnNp
b25fZGlzYWJsZWRbc2V4dC0+ZGlzX2lkeF0pCj4gKyAgICAgICAgICAgICAgIGVudHJ5ID0gJnNi
aV9leHRbaV07Cj4gKyAgICAgICAgICAgICAgIGV4dCA9IGVudHJ5LT5leHRfcHRyOwo+ICsKPiAr
ICAgICAgICAgICAgICAgaWYgKGV4dC0+ZXh0aWRfc3RhcnQgPD0gZXh0aWQgJiYgZXh0LT5leHRp
ZF9lbmQgPj0gZXh0aWQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoZW50cnktPmRp
c19pZHggPj0gS1ZNX1JJU0NWX1NCSV9FWFRfTUFYKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIGV4dDsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoc2NvbnRl
eHQtPmV4dGVuc2lvbl9kaXNhYmxlZFtlbnRyeS0+ZGlzX2lkeF0pCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiArICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoZXh0LT5wcm9iZSAmJiAhZXh0LT5wcm9iZSh2Y3B1KSkgewoKQ2FsbGluZyBwcm9iZSgpIHVw
b24gZXZlcnkga3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KCkgd2lsbCBzaW1wbHkgc2xvdyBkb3duCmFs
bCBTQkkgY2FsbHMuCgpIb3cgYWJvdXQgY2FjaGluZyBwcm9iZSByZXR1cm4gdmFsdWVzIGluICJz
dHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQiCmFzIGFuIGFycmF5PwoKTWF5YmUgd2UgY2FuIGhh
dmUgdHdvIGFycmF5czoKMSkgcHJvYmVfZG9uZVtdIDogQm9vbGVhbiBhcnJheSB0byBjaGVjayB3
aGV0aGVyIHByb2JlIHdhcyBkb25lLgoyKSBwcm9iZV9yZXR2YWxbXSA6IENhY2hlZCBwcm9iZSgp
IHJldHVybiB2YWx1ZXMuCgpUaGUgU0JJX0VYVF9CQVNFX1BST0JFX0VYVCBjYWxsIHNob3VsZCBh
bHNvIHJldHVybiB0aGUKY2FjaGVkIHZhbHVlLgoKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNjb250ZXh0LT5leHRlbnNpb25fZGlzYWJsZWRbZW50cnktPmRpc19pZHhdID0gdHJ1
ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBzYmlfZXh0W2ldLmV4dF9wdHI7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBleHQ7Cj4g
ICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+IC0tCj4gMi4zOS4yCj4KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
