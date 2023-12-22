Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA4CC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zi3SPVdOzlBXeFHsDxO22sK5zKpSSGSDYjXEqTvOBLI=; b=vpYNSWtuGgchN4
	byNrVjyfzQMvRVhjpttMvQFK2baJULU6kF1ts30sHVBiVijmGQu/ewKFfg15dsjMkSx3rGPyfUx1v
	0srxssvBxh7CJSwlHnpdok1/kZ5jWz9mYZSSiX/zAflY8TMcYO86yjg5JAvrrMsftFqdGjxTCiyQt
	faFcJLIwrDo2R7fCvaQDi0qL9cTo5cGlcitsZIHKIoOZRuP3us73kWRd7gS1VxXDo8CndE+djuF7p
	LrI/gE41HfpiEcg5KhlavWUQPiypMIc8HAW0faXVciAhremvOTf1D8WL3yaMBfNoQbKQI8FSXcmRl
	pRWzm5rmOuCHl42fwV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGj6m-006UAF-2H;
	Fri, 22 Dec 2023 17:14:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGj6j-006U9H-1l
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 17:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703265284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cqFAbdxj/IpuKwhr/dOiRTwiBgTE3bII6IeIMBlh9I=;
	b=A0oLBRWTSeKbrRXFGRqocks8WbwSOiFJW3IBFFwkz1k/R8QKVwT/Qlq508BLUhc5GQ3Xq2
	B/+yRDJlZM27UJCTxXp1jR0Bchaebw2jUE2AiZSje1/wZ99ZO0C4eIk4PuZcnNG4gFbEc7
	4lh2WustgbaENTNkYPUAKK+k71efjeQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-i74XU8uWPSqDkq2U6UgG9Q-1; Fri, 22 Dec 2023 12:14:41 -0500
X-MC-Unique: i74XU8uWPSqDkq2U6UgG9Q-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6d289e2b084so2239049b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 09:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703265280; x=1703870080;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cqFAbdxj/IpuKwhr/dOiRTwiBgTE3bII6IeIMBlh9I=;
        b=WgTryE/c+vydaGC/TL3M5PIOJxd/Yyw6Qk33H7EJHkmiTA8fFXCQRh97v2ScCuysEw
         wGj/o0o8nnBmWlh9k9I9tX2sCsphux9TMRdlxSm6jeuaKhx6DTmYivXFYx9/jB/cdJLi
         T3kPpmpOXGJbhKIqgfl8SipEe2bDgIN/dMa81IcnPcUKr1sAe6BdjZgR7imEO6P3nfx4
         xJzpJf61RQ90Kb1HIfiDm/yRcc59HVPW+JPonAIRPcTheXlfeGSSGaRdDAOWWQ8wq16R
         jv3oIGqhaFK4HIDkIGHpWPTnZwxF1d4goLPQ5f7GWX3GsEl56yEdbpXgs6R3fVQeU3lK
         IZNw==
X-Gm-Message-State: AOJu0YxOaYrmuvmhP+hFVGSH5LRRTaYS7INGwKkT2mZONkTNHVNVo5+/
	Yg/VFpS8pJjcXMapw5LlWnUkgRbHWiaXJEaX9+ccl2iuDQ5Ea0bm0iT7Oh8Wd+xaupCJRPD3FSX
	Fme35wH6R8/sm6SVRIhRMmGVYqMqIhIwWszaE
X-Received: by 2002:aa7:8611:0:b0:6d9:83a8:658a with SMTP id p17-20020aa78611000000b006d983a8658amr1601771pfn.43.1703265280019;
        Fri, 22 Dec 2023 09:14:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOb39+DJdojm7AE5y4BjhsDq+FHLdKJbJ61vcHGPwAVIRmEbCs30urzlKL/nvpj4gZy9icNQ==
X-Received: by 2002:aa7:8611:0:b0:6d9:83a8:658a with SMTP id p17-20020aa78611000000b006d983a8658amr1601741pfn.43.1703265279717;
        Fri, 22 Dec 2023 09:14:39 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id k28-20020aa7999c000000b006d98f584ad5sm1180812pfh.199.2023.12.22.09.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 09:14:39 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greg Ungerer <gerg@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/4] riscv: Introduce is_compat_thread() into compat.h
Date: Fri, 22 Dec 2023 14:14:21 -0300
Message-ID: <ZYXD7XU8dXrE31Sq@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTSdrGhAihjYSn_9u8_Yup86GgLDELZSmHnYRc5K1BESBA@mail.gmail.com>
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-4-leobras@redhat.com> <CAJF2gTSdrGhAihjYSn_9u8_Yup86GgLDELZSmHnYRc5K1BESBA@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_091445_658825_4ECE82B2 
X-CRM114-Status: GOOD (  26.10  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDc6MjA6MzZQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAzOjQ34oCvUE0gTGVvbmFyZG8gQnJhcyA8bGVvYnJh
c0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiB0YXNrX3VzZXJfcmVnc2V0X3ZpZXcoKSBtYWtl
cyB1c2Ugb2YgYSBmdW5jdGlvbiB2ZXJ5IHNpbWlsYXIgdG8KPiA+IGlzX2NvbXBhdF90YXNrKCks
IGJ1dCBwb2ludGluZyB0byBhIGFueSB0aHJlYWQuCj4gPgo+ID4gSW4gYXJtNjQgYXNtL2NvbXBh
dC5oIHRoZXJlIGlzIGEgZnVuY3Rpb24gdmVyeSBzaW1pbGFyIHRvIHRoYXQ6Cj4gPiBpc19jb21w
YXRfdGhyZWFkKHN0cnVjdCB0aHJlYWRfaW5mbyAqdGhyZWFkKQo+ID4KPiA+IENvcHkgdGhpcyBm
dW5jdGlvbiB0byByaXNjdiBhc20vY29tcGF0LmggYW5kIG1ha2UgdXNlIG9mIGl0IGludG8KPiA+
IHRhc2tfdXNlcl9yZWdzZXRfdmlldygpLgo+ID4KPiA+IEFsc28sIGludHJvZHVjZSBhIGNvbXBp
bGUtdGltZSB0ZXN0IGZvciBDT05GSUdfQ09NUEFUIGFuZCBzaW1wbGlmeSB0aGUKPiA+IGZ1bmN0
aW9uIGNvZGUgYnkgcmVtb3ZpbmcgdGhlICNpZmRlZi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBM
ZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NvbXBhdC5oIHwgOCArKysrKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVs
L3B0cmFjZS5jICAgICAgfCA2ICsrKy0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jb21wYXQuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmgKPiA+
IGluZGV4IDkxNTE3YjUxYjhlMjcuLmRhNGIyOGNkMDFhOTUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NvbXBhdC5oCj4gPiBAQCAtMjAsNiArMjAsMTQgQEAgc3RhdGljIGlubGluZSBpbnQgaXNf
Y29tcGF0X3Rhc2sodm9pZCkKPiA+ICAgICAgICAgcmV0dXJuIHRlc3RfdGhyZWFkX2ZsYWcoVElG
XzMyQklUKTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBpbmxpbmUgaW50IGlzX2NvbXBhdF90aHJl
YWQoc3RydWN0IHRocmVhZF9pbmZvICp0aHJlYWQpCj4gPiArewo+ID4gKyAgICAgICBpZiAoIUlT
X0VOQUJMRUQoQ09ORklHX0NPTVBBVCkpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
V2UgYWxzbyBjb3VsZCBwdXQgdGhpcyBpbnRvIGlzX2NvbXBhdF90YXNrKCkuCj4gCgpZZWFoISBp
dCdzIGRvbmUgaW4gYSBwcmV2aW91cyBwYXRjaC4gOikKCj4gPiArCj4gPiArICAgICAgIHJldHVy
biB0ZXN0X3RpX3RocmVhZF9mbGFnKHRocmVhZCwgVElGXzMyQklUKTsKPiA+ICt9Cj4gPiArCj4g
PiAgc3RydWN0IGNvbXBhdF91c2VyX3JlZ3Nfc3RydWN0IHsKPiA+ICAgICAgICAgY29tcGF0X3Vs
b25nX3QgcGM7Cj4gPiAgICAgICAgIGNvbXBhdF91bG9uZ190IHJhOwo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMK
PiA+IGluZGV4IDJhZmU0NjBkZTE2YTYuLmYzNjI4MzIxMjM2MTYgMTAwNjQ0Cj4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHRy
YWNlLmMKPiA+IEBAIC0zNzQsMTQgKzM3NCwxNCBAQCBsb25nIGNvbXBhdF9hcmNoX3B0cmFjZShz
dHJ1Y3QgdGFza19zdHJ1Y3QgKmNoaWxkLCBjb21wYXRfbG9uZ190IHJlcXVlc3QsCj4gPgo+ID4g
ICAgICAgICByZXR1cm4gcmV0Owo+ID4gIH0KPiA+ICsjZWxzZQo+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgdXNlcl9yZWdzZXRfdmlldyBjb21wYXRfcmlzY3ZfdXNlcl9uYXRpdmVfdmlldyA9IHt9
Owo+ID4gICNlbmRpZiAvKiBDT05GSUdfQ09NUEFUICovCj4gPgo+ID4gIGNvbnN0IHN0cnVjdCB1
c2VyX3JlZ3NldF92aWV3ICp0YXNrX3VzZXJfcmVnc2V0X3ZpZXcoc3RydWN0IHRhc2tfc3RydWN0
ICp0YXNrKQo+ID4gIHsKPiA+IC0jaWZkZWYgQ09ORklHX0NPTVBBVAo+ID4gLSAgICAgICBpZiAo
dGVzdF90c2tfdGhyZWFkX2ZsYWcodGFzaywgVElGXzMyQklUKSkKPiA+ICsgICAgICAgaWYgKGlz
X2NvbXBhdF90aHJlYWQoJnRhc2stPnRocmVhZF9pbmZvKSkKPiA+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gJmNvbXBhdF9yaXNjdl91c2VyX25hdGl2ZV92aWV3Owo+ID4gICAgICAgICBlbHNlCj4g
PiAtI2VuZGlmCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuICZyaXNjdl91c2VyX25hdGl2ZV92
aWV3Owo+ID4gIH0KPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4gTEdUTQo+IAo+IFJldmlld2VkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KClRoYW5rcyEKTGVvCgo+IAo+IC0tIAo+IEJl
c3QgUmVnYXJkcwo+ICBHdW8gUmVuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
