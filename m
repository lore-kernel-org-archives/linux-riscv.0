Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281F8C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiBFM34Hmge2JUWM6d3+HzaoIcfMnLCvBZYONgMCUTI=; b=bM7iGOgVr45/pt
	PuVugs8gVwVa+aYuqzD9H5QaUt6WlVS6vzTI1rl0IJ1PnYwqnADTvkK5ZzOQ2yfxGSyZ3IElma5Ru
	WZdlNL98xXC45H7Ztx1Y8tp1KpqDgOsWFvEZLRz1yqIUOSOrraBt0c058CX1BcDvoj7qjOFvcwXTC
	uj7yq4R/B396OwRKCqIDFs3XqcxDZ45zCb91QLdQhW9V9hI1J+KyflVgcsRIDZMMs9waHlzWNMGK0
	cSXxN/ZkSu5L6jMpBXZ53WDPS+YjEPSnJXVJUA4UzY52CXx9BqxbeEqX7l9Ch3NDkoJ3Vn4bGKQaN
	4yA57k3He85suj+vrvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q01dT-00GYNg-3C;
	Fri, 19 May 2023 15:03:15 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q01dQ-00GYMG-16
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 15:03:14 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-965c3f9af2aso514477166b.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1684508591; x=1687100591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKheP3mfcHA8OqSP5L8P3xUF2G81zME8d3EIkrv+D7Y=;
        b=n1dIqjUw7t8ejnmH2sXbUANy0Bv+vJr85kqm1xIv3+uQqsvRRVHVgkLhhzID/JJ4AF
         GqvsgLtrZs3gE2Nf4XH+KCxYGJbMUpvQS5MViZ4eL55gRFaXjAJCI7pRVzZQDN5hNWc/
         0gfaXhy45qycGwTfcz3ZLhDz0EtWmwBnzPYYjbi/yeOdRHxWaDBLNs+nPi0BZ+CxtgPx
         aJEIVCVtkEXYYvO65v4gZoss4iXzKxeGJsMEgtwl8r7Rr9U+vCgSQfkHQ/LmK9gLmCAr
         wdczOjT7Az1OskjuHy1wM3K1qh2x9FtR5bz6C+iG+iFsLHH9H7HQOmmGL/91h14tdFwY
         OEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684508591; x=1687100591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKheP3mfcHA8OqSP5L8P3xUF2G81zME8d3EIkrv+D7Y=;
        b=E6OovKWUNx6sfz7zZT8cBRmXFD5cMsgMZHVTXEaEKgli4uqHc6A5MdV2711cD1meYJ
         JWEN0scK6G0hZm19iSlBWTIjyY+it7M2fwqbvJkHLv+/r/HjgHV28tbwf2QCOR4jcrmq
         UeX/FAWRyj7FQOCACvovMQJhrYEa8S+CI4jWh/FYTduhasPMQCjZpCM1ktc3MVXJZJT0
         qYGu/tnCQ4Mq8M8D0ngRneRJ88cxjWx7Capf8aaL0pBpAz44+VoYUJ5PNFWniQPnI3Ou
         ic0xFPGdMlsJmrJKUzhzr5ggq3XYp0cOBll2Jvle67NscigpzrfBXbestb3LPSqoKV6x
         p49A==
X-Gm-Message-State: AC+VfDxaWQaNNr3RqcEyt6g6NyEJ1NmQCOhu51je8Y0FIq59AcD43dc5
	JtMgRxRoROjdGt1x6XhBV4rWBWUZbvz1H/pRGYByhg==
X-Google-Smtp-Source: ACHHUZ4YxAQsxGiqkNnaYEd4FpiTKFgjN57Tv7i6cAjBH3ksff7K8hGX+yj3avwQT4UhsngTzQfdlTOCiP4Hagpl0Eg=
X-Received: by 2002:a17:907:608a:b0:94a:67a9:6052 with SMTP id
 ht10-20020a170907608a00b0094a67a96052mr1865046ejc.67.1684508590828; Fri, 19
 May 2023 08:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230426171328.69663-1-ajones@ventanamicro.com>
 <20230426171328.69663-2-ajones@ventanamicro.com> <CAAhSdy2_SO5C=aofct0ZYzivcEJmti3e69Pivy0PKEhOyXZ-jw@mail.gmail.com>
In-Reply-To: <CAAhSdy2_SO5C=aofct0ZYzivcEJmti3e69Pivy0PKEhOyXZ-jw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 May 2023 20:32:59 +0530
Message-ID: <CAAhSdy3fi0vk7fLTL=0kL-nYgTEzQ0iBx=4BBDbeuR4WmJgNFw@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: KVM: Disable SBI extension when its probe fails
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_080312_380017_30E5EC66 
X-CRM114-Status: GOOD (  24.30  )
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

T24gRnJpLCBNYXkgMTksIDIwMjMgYXQgODoyN+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTA6NDPigK9QTSBB
bmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBXaGVu
IGFuIFNCSSBleHRlbnNpb24gc3BlY2lmaWMgcHJvYmUgZnVuY3Rpb24gZXhpc3RzIGFuZCBmYWls
cywgdGhlbgo+ID4gdXNlIHRoZSBleHRlbnNpb25fZGlzYWJsZWQgY29udGV4dCB0byBkaXNhYmxl
IHRoZSBleHRlbnNpb24uIFRoaXMKPiA+IGVuc3VyZXMgdGhlIGV4dGVuc2lvbidzIGZ1bmN0aW9u
cyBjYW5ub3QgYmUgaW52b2tlZC4gRG9pbmcgdGhlCj4gPiBkaXNhYmxpbmcgaW4ga3ZtX3ZjcHVf
c2JpX2ZpbmRfZXh0KCkgYWxsb3dzIGl0IHRvIGJlIGRvbmUgbGF6aWx5Cj4gPiBvbiBpdHMgZmly
c3QgdXNlLiBDaGVja2luZyBleHRlbnNpb25fZGlzYWJsZWQgcHJpb3IgdG8gcHJvYmluZwo+ID4g
ZW5zdXJlcyB0aGUgcHJvYmUgaXMgb25seSBleGVjdXRlZCBvbmNlIGZvciBkaXNhYmxlZCBleHRl
bnNpb25zLgo+ID4gTGF0ZXIgcGF0Y2hlcyBlbnN1cmUgd2Ugb25seSBleGVjdXRlIHByb2JlIG9u
Y2UgZm9yIGVuYWJsZWQKPiA+IGV4dGVuc2lvbnMgYXMgd2VsbC4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyB8IDIzICsrKysrKysrKysrKysrKy0tLS0tLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaS5jCj4gPiBpbmRleCBlNTJmZGU1MDQ0MzMuLmFhM2MxMjZkMmUzYyAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpLmMKPiA+IEBAIC0zMDcsMTggKzMwNywyNSBAQCBpbnQga3ZtX3Jpc2N2X3Zj
cHVfZ2V0X3JlZ19zYmlfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+ICBjb25zdCBzdHJ1
Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqa3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2ln
bmVkIGxvbmcgZXh0aWQpCj4gPiAgewo+ID4gLSAgICAgICBpbnQgaTsKPiA+IC0gICAgICAgY29u
c3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9uX2VudHJ5ICpzZXh0Owo+ID4gICAgICAg
ICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZjcHUtPmFyY2guc2Jp
X2NvbnRleHQ7Cj4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lv
bl9lbnRyeSAqZW50cnk7Cj4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0
ZW5zaW9uICpleHQ7Cj4gPiArICAgICAgIGludCBpOwo+ID4KPiA+ICAgICAgICAgZm9yIChpID0g
MDsgaSA8IEFSUkFZX1NJWkUoc2JpX2V4dCk7IGkrKykgewo+ID4gLSAgICAgICAgICAgICAgIHNl
eHQgPSAmc2JpX2V4dFtpXTsKPiA+IC0gICAgICAgICAgICAgICBpZiAoc2V4dC0+ZXh0X3B0ci0+
ZXh0aWRfc3RhcnQgPD0gZXh0aWQgJiYKPiA+IC0gICAgICAgICAgICAgICAgICAgc2V4dC0+ZXh0
X3B0ci0+ZXh0aWRfZW5kID49IGV4dGlkKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoc2V4dC0+ZGlzX2lkeCA8IEtWTV9SSVNDVl9TQklfRVhUX01BWCAmJgo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNjb250ZXh0LT5leHRlbnNpb25fZGlzYWJsZWRbc2V4dC0+ZGlz
X2lkeF0pCj4gPiArICAgICAgICAgICAgICAgZW50cnkgPSAmc2JpX2V4dFtpXTsKPiA+ICsgICAg
ICAgICAgICAgICBleHQgPSBlbnRyeS0+ZXh0X3B0cjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAg
ICBpZiAoZXh0LT5leHRpZF9zdGFydCA8PSBleHRpZCAmJiBleHQtPmV4dGlkX2VuZCA+PSBleHRp
ZCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVudHJ5LT5kaXNfaWR4ID49IEtW
TV9SSVNDVl9TQklfRVhUX01BWCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIGV4dDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChzY29udGV4dC0+ZXh0
ZW5zaW9uX2Rpc2FibGVkW2VudHJ5LT5kaXNfaWR4XSkKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
ZXh0LT5wcm9iZSAmJiAhZXh0LT5wcm9iZSh2Y3B1KSkgewo+Cj4gQ2FsbGluZyBwcm9iZSgpIHVw
b24gZXZlcnkga3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KCkgd2lsbCBzaW1wbHkgc2xvdyBkb3duCj4g
YWxsIFNCSSBjYWxscy4KPgo+IEhvdyBhYm91dCBjYWNoaW5nIHByb2JlIHJldHVybiB2YWx1ZXMg
aW4gInN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4dCIKPiBhcyBhbiBhcnJheT8KPgo+IE1heWJl
IHdlIGNhbiBoYXZlIHR3byBhcnJheXM6Cj4gMSkgcHJvYmVfZG9uZVtdIDogQm9vbGVhbiBhcnJh
eSB0byBjaGVjayB3aGV0aGVyIHByb2JlIHdhcyBkb25lLgo+IDIpIHByb2JlX3JldHZhbFtdIDog
Q2FjaGVkIHByb2JlKCkgcmV0dXJuIHZhbHVlcy4KPgo+IFRoZSBTQklfRVhUX0JBU0VfUFJPQkVf
RVhUIGNhbGwgc2hvdWxkIGFsc28gcmV0dXJuIHRoZQo+IGNhY2hlZCB2YWx1ZS4KCklnbm9yZSB0
aGlzIGNvbW1lbnQuIFlvdXIgUEFUQ0gzIGRvZXMgdGhlIHNhbWUgdGhpbmcuCgpSZWdhcmRzLApB
bnVwCgo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNjb250ZXh0LT5leHRl
bnNpb25fZGlzYWJsZWRbZW50cnktPmRpc19pZHhdID0gdHJ1ZTsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gc2JpX2V4dFtpXS5leHRfcHRyOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
fQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGV4dDsKPiA+ICAgICAgICAgICAg
ICAgICB9Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAtLQo+ID4gMi4zOS4yCj4gPgo+Cj4gUmVnYXJk
cywKPiBBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
