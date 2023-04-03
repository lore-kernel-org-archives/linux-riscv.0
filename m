Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AD4C77B60
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPbbdsYIRb900OrgNaqMsUqe051wUcWPJriZnK4Oj74=; b=oEf3Lu/eaqVqEL
	YOiJCvfryl/jDiubfQ4IEBWu/3PJlkyDXvVeCdOqxTcsyN+cHVBZZbJgy05pf9SD1sB4NtQiq+Psa
	AFLqMkaZFGtyA0Aev8dAINKQfhwIMUYOLkg2dA/BG7Cc/vBjNWE9i2iebwxKIQ0/qFd22/wcF+QWW
	0njr+85ryfjfBD9S3UVmNPcRuxbRP3JdecJ6sUFw29Yx0+2XYJ6ZW1/VhuZ0VeKgIkaKHdS1y/POR
	p2i+vmJi63EFDEjN26BnwJlTx2EqMNyRdPGOu4bgB+/Q7ySCEzux9ciCSGz6E0rQVhKv/G1rO+xSl
	VYkHjaQe+y0bU0KzxPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIw4-00FDkd-0U;
	Mon, 03 Apr 2023 12:05:20 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIw1-00FDhu-0s
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:05:18 +0000
Received: by mail-ed1-x52b.google.com with SMTP id b20so116381248edd.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1680523510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTnNv9XdGhYjOU9CcATjnOwylj3cx5IlVTw/VdMJWrc=;
        b=1QVT5ZwH445IL+4hcb90apKtOn9XWo8AG3e4epOeRhuDSB0LUCiPjbbmuJyWq+tRZb
         u/IgbDyskrFey489XvB7OkvalYU8dGfnykhLS+cPZEjA+onfYSoFNvsj9aT8jfL9ZoBd
         gdzujFLSCOHiz4INorE7Di1m7BdejjdBE3XQhUtdBf69R0gbrkScWTUYd0Skvyxa+Y/h
         aNbQSGo2iTrlLmWazm+hpPGmlATA71GLVf63Wd0caLF+ijf1VOzcsd/o3avhyjbRtYq0
         MuJYMYq42icLOP0yB4Z3MMXeDh43gbbTPuT52FO9H2rlufmD9yYqDL4uZwCdQYxmYNZ6
         Y9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680523510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTnNv9XdGhYjOU9CcATjnOwylj3cx5IlVTw/VdMJWrc=;
        b=iZSju2W3G7D271/+4vfucDrtuqzXxjIQs6951bHXREn7wVA1BV9fKGxA8ErqhQS3wy
         IKX1eZ6snj4rfcELKiV9efNWPWAfbKUxNNV7LgaMN9lw+wkogvHXFBG5RJpGWoy3+US8
         tPVwnN0fURaXl15LUj6fHv4AGIHCobi7kWZVzdB1FGob1HhFJ/kxLN51no8Bll1++5zR
         3vxxtYqIFnq2CF6tQ+xvMy/3nUwnOGJ9Q4sfxZ9lzhEgnOd28jY75YquYmrrhrQh8vAv
         dxYAnUNgFO6AimRCV3UupEY/1oQjNKSwPmJtZu6Hgsb2rtYLCFD0HlDf5r/o8eDKc8QH
         CIsQ==
X-Gm-Message-State: AAQBX9cc8rD8p6dtknv6KzwOXW37aXcCKio8VaiRS5kNvQsL+8os1LBs
	RqGvUL8JvIcyzfTplgB6vZus9LD4siL/8aIbtvVxeg==
X-Google-Smtp-Source: AKy350YucQu0o4XWT9/o4B6ERGyItJAJlV74UNbolWd6EWP1LnSHsHXRJcMFXLDM0cgX2h5Cra/y5okQv4y+6QYR1CY=
X-Received: by 2002:a17:906:7c54:b0:932:6a66:fc43 with SMTP id
 g20-20020a1709067c5400b009326a66fc43mr17062399ejp.13.1680523510364; Mon, 03
 Apr 2023 05:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com> <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
In-Reply-To: <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 3 Apr 2023 17:34:57 +0530
Message-ID: <CAAhSdy1JEQBiO55iCy97arO63VjGc+NicUvvwzTpK97W97LmJg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_050517_315804_3818953A 
X-CRM114-Status: GOOD (  15.79  )
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

T24gTW9uLCBBcHIgMywgMjAyMyBhdCA1OjAx4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciAwMywgMjAyMyBhdCAwMzowMzow
OFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gV2UgaW1wbGVtZW50IE9ORV9SRUcgaW50
ZXJmYWNlIGZvciBBSUEgQ1NScyBhcyBhIHNlcGFyYXRlIHN1YnR5cGUKPiA+IHVuZGVyIHRoZSBD
U1IgT05FX1JFRyBpbnRlcmZhY2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmggfCA4ICsrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAg
ICAgICAgICAgIHwgOCArKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+IGluZGV4IDE4MjAyM2Rj
OWE1MS4uY2JjM2U3NGZhNjcwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgK
PiA+IEBAIC03OSw2ICs3OSwxMCBAQCBzdHJ1Y3Qga3ZtX3Jpc2N2X2NzciB7Cj4gPiAgICAgICB1
bnNpZ25lZCBsb25nIHNjb3VudGVyZW47Cj4gPiAgfTsKPiA+Cj4gPiArLyogQUlBIENTUiByZWdp
c3RlcnMgZm9yIEtWTV9HRVRfT05FX1JFRyBhbmQgS1ZNX1NFVF9PTkVfUkVHICovCj4gPiArc3Ry
dWN0IGt2bV9yaXNjdl9haWFfY3NyIHsKPiA+ICt9Owo+ID4gKwo+ID4gIC8qIFRJTUVSIHJlZ2lz
dGVycyBmb3IgS1ZNX0dFVF9PTkVfUkVHIGFuZCBLVk1fU0VUX09ORV9SRUcgKi8KPiA+ICBzdHJ1
Y3Qga3ZtX3Jpc2N2X3RpbWVyIHsKPiA+ICAgICAgIF9fdTY0IGZyZXF1ZW5jeTsKPiA+IEBAIC0x
MDcsNiArMTExLDcgQEAgZW51bSBLVk1fUklTQ1ZfSVNBX0VYVF9JRCB7Cj4gPiAgICAgICBLVk1f
UklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKPiA+ICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pJ
Q0JPTSwKPiA+ICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pCQiwKPgo+IExvb2tzIGxpa2UgdGhp
cyBwYXRjaCBpcyBhbHNvIGJhc2VkIG9uICJbUEFUQ0hdIFJJU0MtVjogS1ZNOiBBbGxvdyBaYmIK
PiBleHRlbnNpb24gZm9yIEd1ZXN0L1ZNIgoKWWVzLCBkbyB5b3Ugd2FudCBtZSB0byBjaGFuZ2Ug
dGhlIG9yZGVyIG9mIGRlcGVuZGVuY3k/CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
