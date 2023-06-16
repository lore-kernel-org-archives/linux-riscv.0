Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3074EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xESx4asCBeHs7D89G6CQuGJH28UlN3+v82+CRN5o9e4=; b=1soGPkJlzhLTLa
	wg8FCy6iyJYWXmbDYrEyXfc+IlOcvj2h9YFjN71XPvj3aFGB2EMTJTkdglXNEl349kGkm8ajOP+6w
	0iUoEjU8uu2yQ23C5oWu2P4lgRw2rOjgpPC0GNEoEB4qUxSRGUVs+vMWuPaQWEdm6ElVg8BtxIIrk
	GQ1oYL8pQn/UlgbdQgb7HnzAHP7qdMx+Sl9CYddUMG22QZsyl7ZRDqXZ23iy7uSR+Ve//pgqOKrJS
	cemlKjk+pij9GTR8e4B5yTWgRJu57wVUo6NuVmw6FUoBxj65Ym/3aHqoaPPxObFNxuMB/rJstX6qO
	2Wc+HQ9UH77JV5XkTVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8Qk-000Y92-38;
	Fri, 16 Jun 2023 12:19:54 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8Qi-000Y8G-1l
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 12:19:53 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51a3f911135so511185a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jun 2023 05:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1686917990; x=1689509990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MosOklUNgvqifdhsCUo4moVzcaCroJZ7UdTzOr+75BI=;
        b=tn+xpS97rpRmozcSmZ93QTrcVSiGR7+pnTvkfQclJXzJkSBGm2Gio/mKTPAvvRwAf7
         XUpchRP7CGqXom3QfZK6Ijz/gz/XFisw+mVfGycjiN9XVlrXgixRvX5gsd71ha8PCH7y
         JtPpnUE6oJ4IkOuEciaFtAyNmuOGih3we2eDacdzrotGazkr4LiieTd59HEvFZAuXbeC
         CUYZmiFDelVGIPFVggmVjYwNxAewy9/EmXQ9DTVwmyG5OhUbvBw/DFaUPJ4nMZxOOGNm
         T/TrcbViUevAXI5SrWgmxp3TZXpRXOHqIfi0q9ZnoUHUu5oMEsYWKpyyDQM50nxvv7LJ
         4c7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686917990; x=1689509990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MosOklUNgvqifdhsCUo4moVzcaCroJZ7UdTzOr+75BI=;
        b=GbjX1XWEYZGfZgKBdVwmq0z3gLU/0HgUUiBWmvD8fZ8Cpjtuh2YgeqYwhw9Tdqv58J
         B1+CwW3Niksxi0zGAmjytI4jg6wTLEFivgFk3rWzL05YrxS3eslCXxNL+VTAGqO0R079
         3heBz9yQlhtnW5eUZe6zk6JZVmBzTEvySCHmsODEccN9mdzsx0X5+eCKysjm1plWSW5Q
         NdPEYuN4zoxLXGoGynhz37HilKoAR65UtOX1PxmNcx/ONLM288PFREbBwryZISyUc/ET
         /AV8EVXFW8kgRCsoEr9HQupnk6TboFB5diRjMU44TpF+CaswemcKoJkXjqxKDtA7t9Iw
         6H5A==
X-Gm-Message-State: AC+VfDwo0TVevY9lYptq+2F87Sz6KpA6VOBXtKuimaXywXyoBFTnUwOa
	XdtD5Gxz4nxVB3Sz+Le/MP8WOcn031x8/x7WyS1+6Q==
X-Google-Smtp-Source: ACHHUZ77UHbOd8DerdFF1eVNKYlRvZqSimLHBKpk7GsJkukHoGREIquwh5hCTlR7VqcS9XcVtYy0oubeMcluj5L2UMQ=
X-Received: by 2002:a17:907:6d83:b0:96f:d345:d100 with SMTP id
 sb3-20020a1709076d8300b0096fd345d100mr1728831ejc.59.1686917990056; Fri, 16
 Jun 2023 05:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230616115410.166244-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20230616115410.166244-1-ben.dooks@codethink.co.uk>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Jun 2023 17:49:38 +0530
Message-ID: <CAAhSdy0-WJVBbJJoePLRooRFquiJKRizpEO6ATTnds9iNJou-Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: define vcpu_sbi_ext_pmu in header
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	atishp@atishpatra.or
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_051952_777751_1467FE6A 
X-CRM114-Status: GOOD (  15.87  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgNToyNOKAr1BNIEJlbiBEb29rcyA8YmVuLmRvb2tzQGNv
ZGV0aGluay5jby51az4gd3JvdGU6Cj4KPiBTcGFyc2UgaXMgZ2l2aW5nIGEgd2FybmluZyBhYm91
dCB2Y3B1X3NiaV9leHRfcG11IG5vdCBiZWluZwo+IGRlZmluZWQsIHNvIGFkZCBhIGRlZmluaXRp
b24gdG8gdGhlIHJlbGV2YW50IGhlYWRlciB0byBmaXgKPiB0aGUgZm9sbG93aW5nOgo+Cj4gYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmM6ODE6Mzc6IHdhcm5pbmc6IHN5bWJvbCAndmNwdV9z
YmlfZXh0X3BtdScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPgo+IEZp
eGVzOiAzZTVlNTZjNjBhMTQ3NyAoInJpc2N2OiBrdm06IG1vdmUgZXh0ZXJuIHNiaV9leHQgZGVj
bGFyYXRpb25zIHRvIGEgaGVhZGVyIikKPiBTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5k
b29rc0Bjb2RldGhpbmsuY28udWs+CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAzICsrKwo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwgNCArLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV92Y3B1X3NiaS5oCj4gaW5kZXggNDI3ODEyNWEzOGE1Li5iOTRjN2U5NThkYTcgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiBAQCAtNjYsNCArNjYsNyBAQCBleHRl
cm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X2hzbTsK
PiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4
dF9leHBlcmltZW50YWw7Cj4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVu
c2lvbiB2Y3B1X3NiaV9leHRfdmVuZG9yOwo+Cj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfUE1VX1NC
SQo+ICtleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlf
ZXh0X3BtdTsKPiArI2VuZGlmCj4gICNlbmRpZiAvKiBfX1JJU0NWX0tWTV9WQ1BVX1NCSV9IX18g
Ki8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpLmMKPiBpbmRleCBlNTJmZGU1MDQ0MzMuLmM5NzNkOTJhMGJhNSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmkuYwo+IEBAIC0yMCw5ICsyMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga3ZtX3Zj
cHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfdjAxID0gewo+ICB9Owo+ICAjZW5kaWYKPgo+
IC0jaWZkZWYgQ09ORklHX1JJU0NWX1BNVV9TQkkKPiAtZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1f
dmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9wbXU7Cj4gLSNlbHNlCj4gKyNpZm5kZWYg
Q09ORklHX1JJU0NWX1BNVV9TQkkKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlf
ZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9wbXUgPSB7Cj4gICAgICAgICAuZXh0aWRfc3RhcnQgPSAt
MVVMLAo+ICAgICAgICAgLmV4dGlkX2VuZCA9IC0xVUwsCj4gLS0KPiAyLjM5LjIKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
