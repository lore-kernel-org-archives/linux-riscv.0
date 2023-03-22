Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451FDC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 03:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+ZsRW8LeIGIQaZa8aJY+OxtjcWH2DGbM9s80xl3Ohg=; b=XO8WSjpXfKU3fU
	tJza9GmTHIj97Fn9ZFIpU6KOjfSBVN7Mduwi+yC24tg7IePywKjJmGqNpTYJc6hxONwbo3r1YUlRo
	Wtu0Amst0S2HGE2+wEP/E649qod7NqqWT+ImeFm2xqCrrI09T5hHqmUutVm2Rt1Dc7ndfBM+7c63F
	N+UcjBezdmYyb9hAJZfIyT7yv8e5SuEcAzlem0NWwh62M2MbqB/QZOATw8vaEoavaOVthLJ5rBHMj
	bfll90Ve0kWJXUVrN7DZ84+aNFhrYZl6hFWrL12EeXr7pvfgTQ9M2hS26giJWdyVNuAbYAEiaGUwj
	i1LFfs3c9/4gkFEMYjtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pepV8-00EUEU-18;
	Wed, 22 Mar 2023 03:51:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pepV5-00EUDi-1f
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 03:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679457058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNlFWdd4gAOcCrXrNbyP6okkc3CGWc9YTMAR4mDkx6k=;
	b=HdoUyGVVogdsnLvKd6Tx0Svnx18dR4Z/tnOKtweAfPz0hmmw9mWcLoq8yn1u0JT4EZnJz/
	UKyX/hv9QLdmhCMJWZsIPMLybsaGjXM8DH1o0nrPZNukswuZHTehYl/jeUrW8kxsp2Yxwa
	+lsloCmDCoSqcZJmqdXEHpBQ11qr7mk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-FKu15dgWMj6Uixw2HrMCFg-1; Tue, 21 Mar 2023 23:50:56 -0400
X-MC-Unique: FKu15dgWMj6Uixw2HrMCFg-1
Received: by mail-qt1-f200.google.com with SMTP id t15-20020a05622a180f00b003e37dd114e3so3356629qtc.10
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 20:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679457056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNlFWdd4gAOcCrXrNbyP6okkc3CGWc9YTMAR4mDkx6k=;
        b=Wi0F6RDPR4+vtEa08vABmbOijEtmhRzVyD5PcNX9fEEA/qZdzVGIiZC5f1xXoaBadl
         hhoo5XwUKseRhnd0EZxhG4Yl2NbbPdK8TKdvgtWZGmBLP1Qp35txFD8fMZYTvbv0O2Ow
         F/GhVYrZoZ0/5grasDRYMzdkM8OJgsZ5Xq75Jdw1pvmUS0iGIp6DFgg1Y2gGzkzLJass
         7B/RSoE/uoGLmICPoL9T/eX2sk4ivvD2oVn+91W2k1cBMEmXGziz8e/U3vZI84/f01f4
         c0OIayo65e1ZTgM5IR+n1vNfDZSaUBkKXX4uN/COEXwCo5PuOfNEO8iy5aq5fbnN9Blj
         E9Jw==
X-Gm-Message-State: AO0yUKUJ4/hytTKSKsQSV+1qzdw99ppOntVO+tt7tJc1YKWWggYVQwVy
	pp6X+zJDFqpvImXiX8/prd60RRY6fcCQ+522sYT+Es5ftEL77iLt/b5F2g5cl4CoSoZbgfrHyk6
	BNxcKBQ1Xu4X8jBglwuNpdsA7ci3f2qgFEYSFamDHx+ZH
X-Received: by 2002:ad4:48c3:0:b0:56f:3e5:850e with SMTP id v3-20020ad448c3000000b0056f03e5850emr438215qvx.3.1679457056448;
        Tue, 21 Mar 2023 20:50:56 -0700 (PDT)
X-Google-Smtp-Source: AK7set+pe3ZLkMJz/5vA/iTHhmSmf1vSPqf+z6ABtE/sVNs42b8Xk1t0/1qQpY48XD2j88pMDbAjsOGyRWTtvXFyLbY=
X-Received: by 2002:ad4:48c3:0:b0:56f:3e5:850e with SMTP id
 v3-20020ad448c3000000b0056f03e5850emr438213qvx.3.1679457056230; Tue, 21 Mar
 2023 20:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230321074249.2221674-1-leobras@redhat.com> <20230321074249.2221674-2-leobras@redhat.com>
 <ZBpPms0PGv4sWR1Y@andrea>
In-Reply-To: <ZBpPms0PGv4sWR1Y@andrea>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 22 Mar 2023 00:50:45 -0300
Message-ID: <CAJ6HWG46-an3r3WH+n8mHHge8SjqgMbohjTmmk=_EXVmwKZSeA@mail.gmail.com>
Subject: Re: [RESEND RFC PATCH v2 1/6] riscv/cmpxchg: Deduplicate cmpxchg()
 asm functions
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_205059_628530_F3A6CB58 
X-CRM114-Status: GOOD (  17.08  )
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

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgOTo0NeKAr1BNIEFuZHJlYSBQYXJyaSA8cGFycmkuYW5k
cmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAyMSwgMjAyMyBhdCAwNDo0Mjo0
NEFNIC0wMzAwLCBMZW9uYXJkbyBCcmFzIHdyb3RlOgo+ID4gSW4gdGhpcyBoZWFkZXIgZXZlcnkg
Y21weGNoZyBkZWZpbmUgKF9yZWxheGVkLCBfYWNxdWlyZSwgX3JlbGVhc2UsCj4gPiB2YW5pbGxh
KSBjb250YWluIGl0J3Mgb3duIGFzbSBmaWxlLCBib3RoIGZvciA0LWJ5dGUgdmFyaWFibGVzIGFu
IDgtYnl0ZQo+ID4gdmFyaWFibGVzLCBvbiBhIHRvdGFsIG9mIDggdmVyc2lvbnMgb2YgbW9zdGx5
IHRoZSBzYW1lIGFzbS4KPiA+Cj4gPiBUaGlzIGlzIHVzdWFsbHkgYmFkLCBhcyBpdCBtZWFucyBh
bnkgY2hhbmdlIG1heSBiZSBkb25lIGluIHVwIHRvIDgKPiA+IGRpZmZlcmVudCBwbGFjZXMuCj4g
Pgo+ID4gVW5pZnkgdGhvc2UgdmVyc2lvbnMgYnkgY3JlYXRpbmcgYSBuZXcgZGVmaW5lIHdpdGgg
ZW5vdWdoIHBhcmFtZXRlcnMgdG8KPiA+IGdlbmVyYXRlIGFueSB2ZXJzaW9uIG9mIHRoZSBwcmV2
aW91cyA4Lgo+ID4KPiA+IChUaGlzIGRpZCBub3QgY2F1c2UgYW55IGNoYW5nZSBpbiBnZW5lcmF0
ZWQgYXNtKQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVk
aGF0LmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIHwg
MTAyICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MjQgaW5zZXJ0aW9ucygrKSwgNzggZGVsZXRpb25zKC0pCj4KPiBEaWZmIGxvb2tzIG5pY2UsCgpI
ZWxsbyBBbmRyZWEsIHRoYW5rcyBmb3IgcmV2aWV3aW5nIQoKCj4gPiArI2RlZmluZSBfX19jbXB4
Y2hnKGxyX3NmeCwgc2Nfc2Z4LCBwcmVwZW5kLCBhcHBlbmQpICAgICAgICAgICAgICAgICAgXAo+
ID4gK3sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgIHBy
ZXBlbmQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gKyAgICAgICAgICAgICAiMDogICAgIGxyIiBscl9zZnggIiAlMCwgJTJcbiIgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgIiAgICAgICBibmUgICUwLCAlejMs
IDFmXG4iICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICIg
ICAgICAgc2MiIHNjX3NmeCAiICUxLCAlejQsICUyXG4iICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gKyAgICAgICAgICAgICAiICAgICAgIGJuZXogJTEsIDBiXG4iICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgYXBwZW5kICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICIx
OlxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gKyAgICAgICAgICAgICA6ICI9JnIiIChfX3JldCksICI9JnIiIChfX3JjKSwgIitBIiAoKl9f
cHRyKSAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgOiAickoiICgobG9uZylfX29sZCks
ICJySiIgKF9fbmV3KSAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgIDog
Im1lbW9yeSIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gK30KPgo+IFRob3VnaCBJJ20gbm90IHJlYWxseSBhIGZhbiBvZiBtYWNyb3MgZGVwZW5kaW5n
IG9uIGxvY2FsIHZhcmlhYmxlcyB3aXRoCj4gIm1hZ2ljIiBuYW1lcywgY2FuIHRoaXMgYmUgYXZv
aWRlZD8KCllvdSBtZWFuIF9fcmV0LCBfX3JjLCBfX3B0ciwgX19vbGQgYW5kIF9fbmV3ID8KSWYg
c28sIHllcywgd2UgY291bGQgYWRkIHRoZW0gdG8gdGhlIG1hY3JvIHNpZ25hdHVyZSwgYnV0IGl0
IHdvdWxkCmJlY29tZSBxdWl0ZSBiaWcgd2l0aCBub3QgbXVjaCB0byBnYWluLiBUbyByZWR1Y2Ug
aW1wYWN0IGl0IGNvdWxkIGJlCnNvbWV0aGluZyBsaWtlOgoKKyNkZWZpbmUgX19fY21weGNoZyhs
cl9zZngsIHNjX3NmeCwgcHJlcGVuZCwgYXBwZW5kLCByZXQsIHIsIHAsIG8sIG4pCgpJcyB0aGlz
IGEgcG9zc2libGUgZml4Pwo+Cj4gVGhhbmtzLAo+ICAgQW5kcmVhCj4KClRoYW5rIHlvdSEKTGVv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
