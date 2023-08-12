Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C22EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 02:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HikpipbB/fLMM+kb8rGGZ1tdJGIXD1T7RqIEqvnG4lA=; b=HRBP6iMzcp5ZlD
	cVg1lmZG/AZg8zvTbyd0QFybI3nTCU0v1Akxb82OzWS5w3oqS0D8Ugj1fLFfBtzF3DZlN3bMV6332
	bADBZ31zyLrAIE+ClJzADBvDF+lxSWCNXzo9rQHuf4MddN55CKhPdwtZ2ATtsZKU1GLOoR3Tydn9F
	cayC+pCtJXbj7Lo6MzIvsCB/p/+1YfxXa8cgtEbMGdBMjYyMG1xvZnsw0oX7o69r+Dj/Qn4O29CUT
	uzSclxG3pp6bUo3XZ5aJQrFhbHYAFUS+5RzYm+NSNkzpl0OVQis4F6d6FjkH/7s6+qzjzfnrOdVoF
	MkjZ9T2De0UjtS3jJpLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUehH-00CVfH-0I;
	Sat, 12 Aug 2023 02:49:47 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUehE-00CVeK-1S
	for linux-riscv@lists.infradead.org;
	Sat, 12 Aug 2023 02:49:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-26837895fbbso1747848a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 19:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691808583; x=1692413383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+c6qMk3QtStqzHw364YKIXNMdy6an3kMtp3SLYCoxfM=;
        b=MalmpBtQxt01xsOkZTkhma+joekPlJlFUMeP0v88Y01jMPncp41rCduqz09ABypXGd
         5uGluXGgUaUgMLjiRQB3qEXc6jJ/a99+MdGEJWemD7JI0KypNbkrew/1cKdoni0cnIPi
         N1idOfSREzDnKP3pjEt1sALYZ6Kj6plNjJHT+cu+SrbqOlh2UBRqqNiy3kPBt3ABXEfX
         /8NpDswGuVUWyL7lj6cQEmiH+uzYm7s80mzicVNgcIEEawkwWAscOD73Id2BLStAteh0
         aGAwQEzVicSv9t79gYu1s672xaFiszlxS0H2fY7E7RQI4EbwQPuAUrg3gIr7WSLDdrd7
         c0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691808583; x=1692413383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+c6qMk3QtStqzHw364YKIXNMdy6an3kMtp3SLYCoxfM=;
        b=fPd53pjKYZecG8NjGBjoOWNj1Qh2mKZiWwo1/c1tSeSBEO4jFVlKmTCXMK05fEfQT0
         jB/PrBRC0jevZMHu1d3EwpaPvoFYpCYAaKJ1kAYa7GSrQyBF1/KeTTESngK8GT1TCMnu
         Eean+O8D0mW3ZgtF+GJIg6o04VSDNaIyNJK9Zxm3LKZJjGbdQOtKJSTq9DVk9AbjKZ1x
         VnHPzq1ESxL9+uYmUYuyyT0PZEYHOfMKEAoU5QAv0JcasyTJLxRE0Hs2s9O6wDZ97hRN
         u7qAss/zcFuxSJxQTCA1o+Rad1A8pSyD19m3GHTNIB0G+vdTNKMFLTOrXI4gQNBO3244
         RxDw==
X-Gm-Message-State: AOJu0YzU47DUbmNcY8D0/FWr+MfSzTmnyacEUaaN9cdk6mEB/4L2vdAl
	P9pTxBYvhvohrb9rOgLjDht/bHa73VRyXdcwqHKl7A==
X-Google-Smtp-Source: AGHT+IHku0ag6hrlvpEOpcPSNotrIsIoiIKBhILHsXBMpJJx+KIim1B3QMQhruyHQhr+ZmxJBtxD6KCrXp+upjFH6QM=
X-Received: by 2002:a17:90a:3ee4:b0:262:ee7d:2d20 with SMTP id
 k91-20020a17090a3ee400b00262ee7d2d20mr3093988pjc.12.1691808582631; Fri, 11
 Aug 2023 19:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230802150018.327079-1-apatel@ventanamicro.com>
 <20230802150018.327079-3-apatel@ventanamicro.com> <20230811193924.GA3997669-robh@kernel.org>
In-Reply-To: <20230811193924.GA3997669-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 12 Aug 2023 08:19:30 +0530
Message-ID: <CAK9=C2Wncgu2U_EqP0xKNQ7aau947zhE+-hy5pguV=LP=ANikA@mail.gmail.com>
Subject: Re: [PATCH v7 02/15] of: property: Add fw_devlink support for msi-parent
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_194944_516694_3222E945 
X-CRM114-Status: GOOD (  22.83  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBBdWcgMTIsIDIwMjMgYXQgMTowOeKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgMDIsIDIwMjMgYXQgMDg6MzA6MDVQTSArMDUz
MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFRoaXMgYWxsb3dzIGZ3X2RldmxpbmsgdG8gY3JlYXRl
IGRldmljZSBsaW5rcyBiZXR3ZWVuIGNvbnN1bWVycyBvZgo+ID4gYSBNU0kgYW5kIHRoZSBzdXBw
bGllciBvZiB0aGUgTVNJLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9vZi9wcm9wZXJ0eS5jIHwg
MzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MzIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL3Byb3BlcnR5
LmMgYi9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+IGluZGV4IGRkYzc1Y2Q1MDgyNS4uYmMyMDUz
NWRlZWQ3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gPiArKysgYi9k
cml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+IEBAIC0xMzI1LDYgKzEzMjUsMzcgQEAgc3RhdGljIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqcGFyc2VfaW50ZXJydXB0cyhzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
LAo+ID4gICAgICAgcmV0dXJuIG9mX2lycV9wYXJzZV9vbmUobnAsIGluZGV4LCAmc3VwX2FyZ3Mp
ID8gTlVMTCA6IHN1cF9hcmdzLm5wOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqcGFyc2VfbXNpX3BhcmVudChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcF9u
YW1lLCBpbnQgaW5kZXgpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBz
dXBfYXJnczsKPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbXNpX25wOwo+ID4gKwo+ID4g
KyAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1NQQVJDKSkKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIE5VTEw7Cj4gPiArCj4gPiArICAgICBpZiAoc3RyY21wKHByb3BfbmFtZSwgIm1zaS1wYXJl
bnQiKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArCj4gPiArICAgICBtc2lf
bnAgPSBvZl9wYXJzZV9waGFuZGxlKG5wLCBwcm9wX25hbWUsIDApOwo+ID4gKyAgICAgaWYgKG1z
aV9ucCkgewo+ID4gKyAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChtc2lf
bnAsICIjbXNpLWNlbGxzIikpIHsKPgo+IFVzZSBvZl9wcm9wZXJ0eV9wcmVzZW50KCkgdG8gY2hl
Y2sgcHJlc2VuY2UuCj4KPiBIb3dldmVyLCB0aGlzIGNoZWNrIGlzIHdyb25nLiAjbXNpLWNlbGxz
IGlzIG9wdGlvbmFsIGFuZCBhc3N1bWVkIHRvIGJlIDAKPiBpZiBub3QgcHJlc2VudC4gVGhlcmUn
cyBhbm90aGVyIGZsYXZvciBvZiBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpCj4gdGhhdCBh
bGxvd3Mgc3BlY2lmeWluZyBhIGRlZmF1bHQgY2VsbCBjb3VudCwgc28gSSB0aGluayB5b3UgY2Fu
IGdldCByaWQKPiBvZiBhbGwgdGhpcyBjaGVja2luZy4KCk9rYXksIEkgd2lsbCB1cGRhdGUgaW4g
dGhlIG5leHQgcmV2aXNpb24uCgpUaGFua3MsCkFudXAKCj4KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBpZiAoaW5kZXgpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mX25v
ZGVfcHV0KG1zaV9ucCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
TlVMTDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIG1zaV9ucDsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICBv
Zl9ub2RlX3B1dChtc2lfbnApOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgaWYgKG9mX3Bh
cnNlX3BoYW5kbGVfd2l0aF9hcmdzKG5wLCBwcm9wX25hbWUsICIjbXNpLWNlbGxzIiwgaW5kZXgs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnN1cF9hcmdzKSkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArCj4gPiArICAgICByZXR1cm4gc3VwX2Fy
Z3MubnA7Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VwcGxpZXJfYmlu
ZGluZ3Mgb2Zfc3VwcGxpZXJfYmluZGluZ3NbXSA9IHsKPiA+ICAgICAgIHsgLnBhcnNlX3Byb3Ag
PSBwYXJzZV9jbG9ja3MsIH0sCj4gPiAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfaW50ZXJj
b25uZWN0cywgfSwKPiA+IEBAIC0xMzU5LDYgKzEzOTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHN1cHBsaWVyX2JpbmRpbmdzIG9mX3N1cHBsaWVyX2JpbmRpbmdzW10gPSB7Cj4gPiAgICAgICB7
IC5wYXJzZV9wcm9wID0gcGFyc2VfcmVndWxhdG9ycywgfSwKPiA+ICAgICAgIHsgLnBhcnNlX3By
b3AgPSBwYXJzZV9ncGlvLCB9LAo+ID4gICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX2dwaW9z
LCB9LAo+ID4gKyAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX21zaV9wYXJlbnQsIH0sCj4gPiAg
ICAgICB7fQo+ID4gIH07Cj4gPgo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
