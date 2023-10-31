Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B689FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 18:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkw8UT2/FHpg93ZoKKc2JQmhwnmqPk0WUlN8dEP4fAQ=; b=E8UfW/aX8nktvM
	3z5UOwM9st5/GMVq53DOdLwSzBTY1tqczGh5fyIyGtxoLsqlJCFSvKiBgPYs8VGegblgpdnY0bfCy
	oYh1lgUZ3sfOMS3M7p6eTGOdbObiBORr4tlrP7E2obcDTra6ByNYjSJr4vFaaHtV4mqO8cRdXyQ2n
	k3MhHDQ2IkkcbxhNk1fNSqbaKt1YGPd6zPot1xfqyxrnvk8OwL+7OOcbXnfBWF1mYAAmCTKMaRXqm
	G7Lz1Pto3nl8Avsgm324SOTuAUI3BTuZ8JNVUVxqrubS/JwLjLMyF3DimhYR30BWADnQ7WP+tdtkZ
	wkooKbMAWuivg4tsKawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxt9V-005vCh-0h;
	Tue, 31 Oct 2023 18:07:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxt9R-005v9p-2a
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 18:07:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4079ed65582so43182525e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698775653; x=1699380453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SL7XBKc+RaoWRznnIRBT+ecFmqke4jto2dLiQ9BSdJk=;
        b=N1eYyyMQI3FLKSE889/GGxb+qxaIpisb00QE9s1YLWs0//nsviNNCBCi65tSyKl/4c
         QVK/Lc0auxpqFJFsxBLpPzL76mTDLRx8HFgHkd5tJsBKGhhtL4sPoAgGL8yDCXnRrCVI
         uuCth6kbdzMQXsc9EYPDVI0vUA8AUf4tQLoFWBOhrT/y76js1Nn2FkpMOmpDAYqgT8YP
         RCAmmo2XVsa5wuwOSwCEh8cHdrYDPVn1Li4HjMc1/q60xsREJ+ne/7YhMUxISGhuA26k
         cQTz3w/ph19OfCn+nNm/nP5sT3Zo9cso550OK2Nxmgmc+fOVlYuOQ2DLy9hkKPUrcmX4
         ZKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698775653; x=1699380453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SL7XBKc+RaoWRznnIRBT+ecFmqke4jto2dLiQ9BSdJk=;
        b=l9lE/hN4uoNz37CX3f23c79a+dGPZ7UkTlOQN7xdoq32r4ggUgtJSETAQwEAPnAUO2
         oY92aJEk4QH/fbbUKwgh0r1p+USaLD2Ei3np1EfDQoKonrcCKt2ZqGzsp6ebLFkuwzPn
         SKXohLfiILkLsIe7bWXQ+q9Z2Rjtag7msYGsvpRcPkXMJgvRQt7N6Uzt8tHDnhIOv7C/
         rgf1zhObRQiBOPlHG2iNy1KDQQoMWzkgCtA2VtzV6Off6GoKKEi0/km4dH4xn91kac5W
         hb0FB9Hn4lh4soruSV2lq3BaDg+w62I+ivRQy4Dsy8UqaLpFLB+Ft1xg20Qo+GehS87P
         Jz9w==
X-Gm-Message-State: AOJu0Yxtk+iMfC7ZWiCuXcZ7rTdH1TbDfR1fdS+3b3MfArZOp7AwLPNV
	WBnay9N//+qOPvdAPX0xo6qoKKz7IdMIirXYjTeRqA==
X-Google-Smtp-Source: AGHT+IHFLsB+x/Jlf8dLEZRxjUW+xtrhgdxgtcISHIyXwdiZB6X7J6AA6vWN4rFFxV90avuFKCaXlLTBqMN6bjVrnP8=
X-Received: by 2002:a05:600c:4708:b0:402:ff8d:609b with SMTP id
 v8-20020a05600c470800b00402ff8d609bmr11137029wmo.33.1698775653184; Tue, 31
 Oct 2023 11:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231031174627.684576-1-masahiroy@kernel.org>
In-Reply-To: <20231031174627.684576-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 31 Oct 2023 11:07:22 -0700
Message-ID: <CAKwvOd=TmAh-eAmOzRxb6Gri8AfOXc7t9mPXgDgDTtAnegZ3iw@mail.gmail.com>
Subject: Re: [PATCH] modpost: fix section mismatch message for RELA
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	Fangrui Song <maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_110741_836756_7AAF39A6 
X-CRM114-Status: GOOD (  18.82  )
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

T24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMTA6NDbigK9BTSBNYXNhaGlybyBZYW1hZGEgPG1hc2Fo
aXJveUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBzZWN0aW9uIG1pc21hdGNoIGNoZWNrIHBy
aW50cyBhIGJvZ3VzIHN5bWJvbCBuYW1lIG9uIHNvbWUKPiBhcmNoaXRlY3R1cmVzLgo+Cj4gW3Rl
c3QgY29kZV0KPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPgo+ICAgaW50IF9faW5pdGRh
dGEgZm9vOwo+ICAgaW50IGdldF9mb28odm9pZCkgeyByZXR1cm4gZm9vOyB9Cj4KPiBJZiB5b3Ug
Y29tcGlsZSBpdCB3aXRoIEdDQyBmb3IgcmlzY3Ygb3IgbG9vbmdhcmNoLCBtb2Rwb3N0IHdpbGwg
c2hvdyBhbgo+IGluY29ycmVjdCBzeW1ib2wgbmFtZToKPgo+ICAgV0FSTklORzogbW9kcG9zdDog
dm1saW51eDogc2VjdGlvbiBtaXNtYXRjaCBpbiByZWZlcmVuY2U6IGdldF9mb28rMHg4IChzZWN0
aW9uOiAudGV4dCkgLT4gZG9uZSAoc2VjdGlvbjogLmluaXQuZGF0YSkKPgo+IFRvIGdldCB0aGUg
Y29ycmVjdCBzeW1ib2wgYWRkcmVzcywgc3RfdmFsdWUgbXVzdCBiZSBhZGRlZAo+Cj4gVGhpcyBp
c3N1ZSBoYXMgbmV2ZXIgYmVlbiBub3RpY2VkIHNpbmNlIGNvbW1pdCA5MzY4NGQzYjgwNjIgKCJr
YnVpbGQ6Cj4gaW5jbHVkZSBzeW1ib2wgbmFtZXMgaW4gc2VjdGlvbiBtaXNtYXRjaCB3YXJuaW5n
cyIpIHByZXN1bWFibHkgYmVjYXVzZQo+IHN0X3ZhbHVlIGJlY29tZXMgemVybyBvbiBtb3N0IGFy
Y2hpdGVjdHVyZXMgd2hlbiB0aGUgcmVmZXJlbmNlZCBzeW1ib2wKPiBpcyBsb29rZWQgdXAuIEl0
IGlzIG5vdCB0cnVlIGZvciByaXNjdiBvciBsb29uZ2FyY2gsIGF0IGxlYXN0Lgo+Cj4gV2l0aCB0
aGlzIGZpeCwgbW9kcG9zdCB3aWxsIHNob3cgdGhlIGNvcnJlY3Qgc3ltYm9sIG5hbWU6Cj4KPiAg
IFdBUk5JTkc6IG1vZHBvc3Q6IHZtbGludXg6IHNlY3Rpb24gbWlzbWF0Y2ggaW4gcmVmZXJlbmNl
OiBnZXRfZm9vKzB4OCAoc2VjdGlvbjogLnRleHQpIC0+IGZvbyAoc2VjdGlvbjogLmluaXQuZGF0
YSkKPgo+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5v
cmc+CgpUaGFua3MgZm9yIHRoZSBwYXRjaCEKUmV2aWV3ZWQtYnk6IE5pY2sgRGVzYXVsbmllcnMg
PG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPgoKPiAtLS0KPgo+ICBzY3JpcHRzL21vZC9tb2Rwb3N0
LmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvbW9kL21vZHBvc3QuYyBiL3NjcmlwdHMv
bW9kL21vZHBvc3QuYwo+IGluZGV4IDk3M2I1ZTVhZTJkZC4uY2I2NDA2ZjQ4NWE5IDEwMDY0NAo+
IC0tLSBhL3NjcmlwdHMvbW9kL21vZHBvc3QuYwo+ICsrKyBiL3NjcmlwdHMvbW9kL21vZHBvc3Qu
Ywo+IEBAIC0xMzgzLDEzICsxMzgzLDE1IEBAIHN0YXRpYyB2b2lkIHNlY3Rpb25fcmVsYShzdHJ1
Y3QgbW9kdWxlICptb2QsIHN0cnVjdCBlbGZfaW5mbyAqZWxmLAo+ICAgICAgICAgY29uc3QgRWxm
X1JlbGEgKnJlbGE7Cj4KPiAgICAgICAgIGZvciAocmVsYSA9IHN0YXJ0OyByZWxhIDwgc3RvcDsg
cmVsYSsrKSB7Cj4gKyAgICAgICAgICAgICAgIEVsZl9TeW0gKnRzeW07Cj4gICAgICAgICAgICAg
ICAgIEVsZl9BZGRyIHRhZGRyLCByX29mZnNldDsKPiAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IHJfdHlwZSwgcl9zeW07Cj4KPiAgICAgICAgICAgICAgICAgcl9vZmZzZXQgPSBUT19OQVRJ
VkUocmVsYS0+cl9vZmZzZXQpOwo+ICAgICAgICAgICAgICAgICBnZXRfcmVsX3R5cGVfYW5kX3N5
bShlbGYsIHJlbGEtPnJfaW5mbywgJnJfdHlwZSwgJnJfc3ltKTsKPgo+IC0gICAgICAgICAgICAg
ICB0YWRkciA9IFRPX05BVElWRShyZWxhLT5yX2FkZGVuZCk7Cj4gKyAgICAgICAgICAgICAgIHRz
eW0gPSBlbGYtPnN5bXRhYl9zdGFydCArIHJfc3ltOwo+ICsgICAgICAgICAgICAgICB0YWRkciA9
IHRzeW0tPnN0X3ZhbHVlICsgVE9fTkFUSVZFKHJlbGEtPnJfYWRkZW5kKTsKPgo+ICAgICAgICAg
ICAgICAgICBzd2l0Y2ggKGVsZi0+aGRyLT5lX21hY2hpbmUpIHsKPiAgICAgICAgICAgICAgICAg
Y2FzZSBFTV9SSVNDVjoKPiBAQCAtMTQwNCw3ICsxNDA2LDcgQEAgc3RhdGljIHZvaWQgc2VjdGlv
bl9yZWxhKHN0cnVjdCBtb2R1bGUgKm1vZCwgc3RydWN0IGVsZl9pbmZvICplbGYsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAgICAgIH0KPgo+IC0gICAgICAg
ICAgICAgICBjaGVja19zZWN0aW9uX21pc21hdGNoKG1vZCwgZWxmLCBlbGYtPnN5bXRhYl9zdGFy
dCArIHJfc3ltLAo+ICsgICAgICAgICAgICAgICBjaGVja19zZWN0aW9uX21pc21hdGNoKG1vZCwg
ZWxmLCB0c3ltLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZzZWNu
ZHgsIGZyb21zZWMsIHJfb2Zmc2V0LCB0YWRkcik7Cj4gICAgICAgICB9Cj4gIH0KPiAtLQo+IDIu
NDAuMQo+CgoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
