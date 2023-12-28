Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0C7C46CD2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 03:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsSvMhiKJ+iYsqHQ7GKB/TernhxoXOxw2wijfFYH6W0=; b=XTnTW5YNrUStmO
	FAdDvs8nNKwl/1MjlXm49WSFB3JMPgNZCDkxzrZRSqQVXa/2+tyEHnoCXfFSVvNjR2/GuPZbpipi4
	+ogIMizY2sGJ6OsNW64QnYBnO9Qk40+lK6E5GOVUWIz1DzGGK37A6y7iLPh3HjnglRBbedKCk25eW
	o4pLcimqFmwDfd/TDOWg0kRBiX/1JJQYnOo+53x/7/5TBnc2yhXlbRhWzfEthgAgly3qLWhIqPmid
	/feH1khuNm1uLK+Wg7sxE1ebB93dqlXB6yz59zXsCGVAfmqOksLGpIwgSK4HWYNQuN2+C8bLHKUxJ
	mbRih8vSaQ+ZE8tSysqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIgnk-00G0Sv-0P;
	Thu, 28 Dec 2023 03:11:16 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIgng-00G0Rs-2D
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 03:11:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50e7e1ddaddso2712076e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 19:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703733070; x=1704337870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tojWnjZoOPArkc/1ypwctKQDulVjKNakYJmlzZOcB4=;
        b=dKOXiUIpgxkwWvLWE2fM0Zt6BxgY+a9BNmqyiD+vJbIfVbB22519EZ0rKGC9MUwiR7
         UbeBXjZshvNvuF52y9N2tJZtCAdGFF7IWYLHS/LagoFYQcm+Qj3Eta8yfcCmuga1Cxxv
         k8hrRuTezZMYsuYEVrs4I0VlN0O2oNuf4S0yEX6ly1mXccs6lELnDu0eRujG2lGGydHx
         D0A+C3iD2uZjcK80rIz/l9T6UczCpu2hZBxFMETnmsXX9iSKEYlpo+DT97k84zrv9Nwn
         epPyQIJW3rnLaDf2cxNEHhpIUqJusdurTaDYVNzgXiuyM7HOxJqV6enmqSN67SwZDjp/
         HciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703733070; x=1704337870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tojWnjZoOPArkc/1ypwctKQDulVjKNakYJmlzZOcB4=;
        b=PLBs/4qsEhSJ3jXmZ6vqw+R8eoNAVz+SUFJnC+q3vnoipqhyjWTt+vnpAlsiVDUT7+
         YRB8G+ZrbzzrES1k30w74OPqS7zwEGEqbO0HXKJ3fxGYPRkDuTJUoQiuOOlI6K54vbay
         /OugRvWPlOO9q2yDGQOtZn+E0xp9i6Hyl6Y1YMG/SwStrLNiGpUyUcmK015mmlDz213U
         k2R7x8vD5qjLZfdz5LpnNGqpLYjrYPAnNoO7Gl1hfGDg1Tru8Un1J5mgVGLf9GaMjxmb
         eDX5pQpAE5YZtK/6NNstDMuaArSWze/riW78vt7/iUSB6OEn2E9OpLhofVlzgB5gGPpe
         VVTA==
X-Gm-Message-State: AOJu0Yzk2v7cF1BJ1bsZc8/h8Laht4VJhmb8CeuOVTKySCSdaaOaQ92r
	OewztDJMkbfo8t4bR0DL7VmTu+l1mudzvo2WJFHOUaXaNh5Vrw==
X-Google-Smtp-Source: AGHT+IG9tZ2wg3iQJxAba0ROVCc95Rf84jfl7lOU9lpNNGSZonGS7SyM+Cc8rxSMb7fcGUKgiCL1TrxxQvgJyBtlTKA=
X-Received: by 2002:ac2:5504:0:b0:50e:6a21:f9b2 with SMTP id
 j4-20020ac25504000000b0050e6a21f9b2mr3399360lfk.55.1703733069697; Wed, 27 Dec
 2023 19:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-4-leobras@redhat.com>
 <CABgGipXLe7MxP076CJ=BLAaChAQug5X7qkNxxm9eEnyy92nEJQ@mail.gmail.com> <CAJ6HWG4Pe0co91-tRpV-gKoVUJkobB=uz8J-pjTvyX=Ed49u_w@mail.gmail.com>
In-Reply-To: <CAJ6HWG4Pe0co91-tRpV-gKoVUJkobB=uz8J-pjTvyX=Ed49u_w@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 28 Dec 2023 11:10:58 +0800
Message-ID: <CABgGipU_xLWMFy-fwRqVRAC4_s=PH9cXq9-CGNHgQhOGOB+rdQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] riscv: Introduce is_compat_thread() into compat.h
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Greg Ungerer <gerg@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	David Hildenbrand <david@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Qinglin Pan <panqinglin2020@iscas.ac.cn>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_191112_815380_F1149D9C 
X-CRM114-Status: GOOD (  28.32  )
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

T24gV2VkLCBEZWMgMjcsIDIwMjMgYXQgMzoyNeKAr0FNIExlb25hcmRvIEJyYXMgU29hcmVzIFBh
c3Nvcwo8bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgRGVjIDIzLCAyMDIz
IGF0IDE6MjbigK9BTSBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cm90ZToKPiA+
Cj4gPiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAzOjQ24oCvUE0gTGVvbmFyZG8gQnJhcyA8bGVv
YnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gdGFza191c2VyX3JlZ3NldF92aWV3
KCkgbWFrZXMgdXNlIG9mIGEgZnVuY3Rpb24gdmVyeSBzaW1pbGFyIHRvCj4gPiA+IGlzX2NvbXBh
dF90YXNrKCksIGJ1dCBwb2ludGluZyB0byBhIGFueSB0aHJlYWQuCj4gPiA+Cj4gPiA+IEluIGFy
bTY0IGFzbS9jb21wYXQuaCB0aGVyZSBpcyBhIGZ1bmN0aW9uIHZlcnkgc2ltaWxhciB0byB0aGF0
Ogo+ID4gPiBpc19jb21wYXRfdGhyZWFkKHN0cnVjdCB0aHJlYWRfaW5mbyAqdGhyZWFkKQo+ID4g
Pgo+ID4gPiBDb3B5IHRoaXMgZnVuY3Rpb24gdG8gcmlzY3YgYXNtL2NvbXBhdC5oIGFuZCBtYWtl
IHVzZSBvZiBpdCBpbnRvCj4gPiA+IHRhc2tfdXNlcl9yZWdzZXRfdmlldygpLgo+ID4gPgo+ID4g
PiBBbHNvLCBpbnRyb2R1Y2UgYSBjb21waWxlLXRpbWUgdGVzdCBmb3IgQ09ORklHX0NPTVBBVCBh
bmQgc2ltcGxpZnkgdGhlCj4gPiA+IGZ1bmN0aW9uIGNvZGUgYnkgcmVtb3ZpbmcgdGhlICNpZmRl
Zi4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVvbmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRo
YXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0Lmgg
fCA4ICsrKysrKysrCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyAgICAgIHwgNiAr
KystLS0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29t
cGF0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5oCj4gPiA+IGluZGV4IDkxNTE3
YjUxYjhlMjcuLmRhNGIyOGNkMDFhOTUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY29tcGF0LmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21w
YXQuaAo+ID4gPiBAQCAtMjAsNiArMjAsMTQgQEAgc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0
X3Rhc2sodm9pZCkKPiA+ID4gICAgICAgICByZXR1cm4gdGVzdF90aHJlYWRfZmxhZyhUSUZfMzJC
SVQpOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0X3Ro
cmVhZChzdHJ1Y3QgdGhyZWFkX2luZm8gKnRocmVhZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICBp
ZiAoIUlTX0VOQUJMRUQoQ09ORklHX0NPTVBBVCkpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+ID4gKwo+ID4gPiArICAgICAgIHJldHVybiB0ZXN0X3RpX3RocmVhZF9mbGFnKHRo
cmVhZCwgVElGXzMyQklUKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4KPiA+IERvZXMgaXQgbWFrZSBz
ZW5zZSB0byB1c2UgYSAjaWZkZWYgQ09ORklHX0NPTVBBVCBjbGF1c2UgdG8gZ3JvdXAKPiA+IGlz
X2NvbXBhdF90aHJlYWQoKSBhbmQgaXNfY29tcGF0X2ZsYWcoKT8gRm9yIGV4YW1wbGUsCj4KPiBI
ZWxsbyBBbmR5LAo+Cj4gU3VyZSwgaXQgZG9lcyBtYWtlIHNlbnNlLgo+Cj4gQnV0IEkgaG9uZXN0
bHkgdGhpbmsgdGhhdCB1c2luZyBJU19FTkFCTEVEKCkgaW5zdGVhZCBvZiAjaWZkZWYgKwo+IG11
bHRpcGxlIHNhbWUtbmFtZWQgZnVuY3Rpb25zIHdvcmtzIGJldHRlciBmb3IgY29kZSByZWFkaW5n
LCBhdCBsZWFzdAo+IGZvciBzbWFsbCBmdW5jdGlvbnMgc3VjaCBhcyB0aGVzZS4KPgo+IERvZXMg
dGhpcyBtYWtlIHNlbnNlPwo+Cj4gVGhhbmtzIGZvciByZXZpZXdpbmchCj4gTGVvCgpIaSwgeWVz
IQoKSXQgbWFrZXMgc2Vuc2UgdG8gbWUuCgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5LmNo
aXVAc2lmaXZlLmNvbT4KClRoYW5rcywKQW5keQoKPgo+Cj4gPgo+ID4gI2lmZGVmIENPTkZJR19D
T01QQVQKPiA+IHN0YXRpYyBpbmxpbmUgaW50IGlzX2NvbXBhdF90aHJlYWQoc3RydWN0IHRocmVh
ZF9pbmZvICp0aHJlYWQpCj4gPiB7Cj4gPiAgcmV0dXJuIHRlc3RfdGlfdGhyZWFkX2ZsYWcodGhy
ZWFkLCBUSUZfMzJCSVQpOwo+ID4gfQo+ID4gc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0X3Rh
c2sodm9pZCkKPiA+IHsKPiA+ICByZXR1cm4gaXNfY29tcGF0X3RocmVhZChjdXJyZW50KTsKPiA+
IH0KPiA+ICNlbHNlCj4gPiBzdGF0aWMgaW5saW5lIGludCBpc19jb21wYXRfdGhyZWFkKHN0cnVj
dCB0aHJlYWRfaW5mbyAqdGhyZWFkKSB7IHJldHVybiAwOyB9Cj4gPiBzdGF0aWMgaW5saW5lIGlu
dCBpc19jb21wYXRfdGFzayh2b2lkKSB7IHJldHVybiAwOyB9Cj4gPiAjZW5kaWYKPiA+Cj4gPiA+
ICBzdHJ1Y3QgY29tcGF0X3VzZXJfcmVnc19zdHJ1Y3Qgewo+ID4gPiAgICAgICAgIGNvbXBhdF91
bG9uZ190IHBjOwo+ID4gPiAgICAgICAgIGNvbXBhdF91bG9uZ190IHJhOwo+ID4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJh
Y2UuYwo+ID4gPiBpbmRleCAyYWZlNDYwZGUxNmE2Li5mMzYyODMyMTIzNjE2IDEwMDY0NAo+ID4g
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wdHJhY2UuYwo+ID4gPiBAQCAtMzc0LDE0ICszNzQsMTQgQEAgbG9uZyBjb21wYXRf
YXJjaF9wdHJhY2Uoc3RydWN0IHRhc2tfc3RydWN0ICpjaGlsZCwgY29tcGF0X2xvbmdfdCByZXF1
ZXN0LAo+ID4gPgo+ID4gPiAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ICB9Cj4gPiA+ICsjZWxz
ZQo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCB1c2VyX3JlZ3NldF92aWV3IGNvbXBhdF9yaXNj
dl91c2VyX25hdGl2ZV92aWV3ID0ge307Cj4gPiA+ICAjZW5kaWYgLyogQ09ORklHX0NPTVBBVCAq
Lwo+ID4gPgo+ID4gPiAgY29uc3Qgc3RydWN0IHVzZXJfcmVnc2V0X3ZpZXcgKnRhc2tfdXNlcl9y
ZWdzZXRfdmlldyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spCj4gPiA+ICB7Cj4gPiA+IC0jaWZk
ZWYgQ09ORklHX0NPTVBBVAo+ID4gPiAtICAgICAgIGlmICh0ZXN0X3Rza190aHJlYWRfZmxhZyh0
YXNrLCBUSUZfMzJCSVQpKQo+ID4gPiArICAgICAgIGlmIChpc19jb21wYXRfdGhyZWFkKCZ0YXNr
LT50aHJlYWRfaW5mbykpCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gJmNvbXBhdF9yaXNj
dl91c2VyX25hdGl2ZV92aWV3Owo+ID4gPiAgICAgICAgIGVsc2UKPiA+ID4gLSNlbmRpZgo+ID4g
PiAgICAgICAgICAgICAgICAgcmV0dXJuICZyaXNjdl91c2VyX25hdGl2ZV92aWV3Owo+ID4gPiAg
fQo+ID4gPiAtLQo+ID4gPiAyLjQzLjAKPiA+ID4KPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
