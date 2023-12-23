Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBC2C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3co5LvEU1XK1iNFUPRtsGrCeI5ISSLz/7zaf+zdrdA=; b=v2Qw/Vf/nm4cX/
	/sCuBXHfwxxY/arLJ02rAz2dEC1pn87Kc6potEXQFY/EoO0bIdjorSHgqt8k1bSZTU1MCoz2P0tNV
	i2zabiE86bnwACIwq91mxAl4nuIvzYtG4Oky9Y/xehiOhUSYj6R+gHrc76+VZvq0RLMTVBBBAXPGl
	UWJMxwDlniPw6wxQjPtUUOGNtUQsNyDk0qxsnhtrysjKV+RPRv0Hp2RmIh7mTaSQEGkR2S/UZzAG/
	D6g8S0XMpFhLvpeYxszOjcWMefKAz9bgkZeoqTtNfgf0t1yHEUYZC++4M0ljXbuKLviWdvoY+Ela9
	Ws31rV2ke4m0S2B7eUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtaT-007LMC-1l;
	Sat, 23 Dec 2023 04:26:09 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtaQ-007LKq-0u
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:26:07 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ccb923c4d2so1486781fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 20:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703305556; x=1703910356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh1r+51kM+XQXoePZoBYVvIPaqSuNTim190BEuHTp1w=;
        b=KYR5JSAO9+9Y8OHeewQC7fL/EDvc5ko15U2imuAlnwhzjfveZsNKQ4WemUZpU/98gt
         OyLz7lA+WI7SkoaoZVrvXSnqp8f/+G/6AgV2qb7nSwyFvCPNgHbnUmjqb3JyGHig2IS4
         F87ale91ONiW6tCTMw5JGTPDvF8TTu+XuZfrx6tzVRjOFasHP00MZ8IUukzg0e2QZxVW
         2DA7Zm15m6W67Uj0Gfo/WoouJ6iqJfHqSa0/fO+wTJfMdnP7WqJoGBCECxoSBWJ6cblI
         oCS1EPvLCP/q/FI5KSe5RA89n5z3p2afML8E8o+8V77KN17UiPdvP090vFAGXIAb/zbZ
         GvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703305556; x=1703910356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oh1r+51kM+XQXoePZoBYVvIPaqSuNTim190BEuHTp1w=;
        b=pol99Mgxfv9OEyyvNgQLU+3iKWilf4BbAL1w8U+Bn73dxBjHHLJTggfYTGIATms5/q
         Krz95kfO5OYeF/nZLd8qC5MPmRbrjoBFbUarVtzAJG/bhzFPK8Ifpm5oh/QM0S2ZW6K9
         BMJOgV/5+QhIZSQbY0ea52noX8Fdf4wX/W/acTN+3S7NZMHM64nGoezdKZGIT4qKI3/O
         /6xUuXhxpGVWwNodGXgvMYeh2CKLoGSYYJCk1TAQy4k4b+0wM5S9T2DzjrE7eMXuWwzy
         mbJoF9qRU3mq21tUUlKGNNaspxheaaCjETDSMRGQqdP7yvfEBp0Bvs4/bOLnaScFpyZt
         SpMQ==
X-Gm-Message-State: AOJu0YxbAHTXW9lYWxNxmOegPHf+22a/HbVBWVizwtKGefYwMNgiIBjv
	OBw77XDMDMf9QAaFkbejLd+mWodZDRGiAo2BK4Fy2bKypKk0gA==
X-Google-Smtp-Source: AGHT+IFU3Q6ZEG+67oRWk4/KqL1ZNE9mgkQzAdPAehzdj9SVKh47NEVRI4+S5DVshfifQlG9dZi7NeI4A7pFy9IUZ7I=
X-Received: by 2002:a19:5f14:0:b0:50e:6f20:8e40 with SMTP id
 t20-20020a195f14000000b0050e6f208e40mr298244lfb.207.1703305556174; Fri, 22
 Dec 2023 20:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-4-leobras@redhat.com>
In-Reply-To: <20231222074605.452452-4-leobras@redhat.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 23 Dec 2023 12:25:44 +0800
Message-ID: <CABgGipXLe7MxP076CJ=BLAaChAQug5X7qkNxxm9eEnyy92nEJQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] riscv: Introduce is_compat_thread() into compat.h
To: Leonardo Bras <leobras@redhat.com>
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
X-CRM114-CacheID: sfid-20231222_202606_322237_E06FE443 
X-CRM114-Status: GOOD (  22.59  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMzo0NuKAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiB0YXNrX3VzZXJfcmVnc2V0X3ZpZXcoKSBtYWtlcyB1c2Ug
b2YgYSBmdW5jdGlvbiB2ZXJ5IHNpbWlsYXIgdG8KPiBpc19jb21wYXRfdGFzaygpLCBidXQgcG9p
bnRpbmcgdG8gYSBhbnkgdGhyZWFkLgo+Cj4gSW4gYXJtNjQgYXNtL2NvbXBhdC5oIHRoZXJlIGlz
IGEgZnVuY3Rpb24gdmVyeSBzaW1pbGFyIHRvIHRoYXQ6Cj4gaXNfY29tcGF0X3RocmVhZChzdHJ1
Y3QgdGhyZWFkX2luZm8gKnRocmVhZCkKPgo+IENvcHkgdGhpcyBmdW5jdGlvbiB0byByaXNjdiBh
c20vY29tcGF0LmggYW5kIG1ha2UgdXNlIG9mIGl0IGludG8KPiB0YXNrX3VzZXJfcmVnc2V0X3Zp
ZXcoKS4KPgo+IEFsc28sIGludHJvZHVjZSBhIGNvbXBpbGUtdGltZSB0ZXN0IGZvciBDT05GSUdf
Q09NUEFUIGFuZCBzaW1wbGlmeSB0aGUKPiBmdW5jdGlvbiBjb2RlIGJ5IHJlbW92aW5nIHRoZSAj
aWZkZWYuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmggfCA4ICsrKysrKysr
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jICAgICAgfCA2ICsrKy0tLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY29tcGF0LmgKPiBpbmRleCA5MTUxN2I1MWI4ZTI3Li5kYTRiMjhjZDAxYTk1IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NvbXBhdC5oCj4gQEAgLTIwLDYgKzIwLDE0IEBAIHN0YXRpYyBpbmxpbmUg
aW50IGlzX2NvbXBhdF90YXNrKHZvaWQpCj4gICAgICAgICByZXR1cm4gdGVzdF90aHJlYWRfZmxh
ZyhUSUZfMzJCSVQpOwo+ICB9Cj4KPiArc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0X3RocmVh
ZChzdHJ1Y3QgdGhyZWFkX2luZm8gKnRocmVhZCkKPiArewo+ICsgICAgICAgaWYgKCFJU19FTkFC
TEVEKENPTkZJR19DT01QQVQpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAg
ICAgICByZXR1cm4gdGVzdF90aV90aHJlYWRfZmxhZyh0aHJlYWQsIFRJRl8zMkJJVCk7Cj4gK30K
PiArCgpEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gdXNlIGEgI2lmZGVmIENPTkZJR19DT01QQVQgY2xh
dXNlIHRvIGdyb3VwCmlzX2NvbXBhdF90aHJlYWQoKSBhbmQgaXNfY29tcGF0X2ZsYWcoKT8gRm9y
IGV4YW1wbGUsCgojaWZkZWYgQ09ORklHX0NPTVBBVApzdGF0aWMgaW5saW5lIGludCBpc19jb21w
YXRfdGhyZWFkKHN0cnVjdCB0aHJlYWRfaW5mbyAqdGhyZWFkKQp7CiByZXR1cm4gdGVzdF90aV90
aHJlYWRfZmxhZyh0aHJlYWQsIFRJRl8zMkJJVCk7Cn0Kc3RhdGljIGlubGluZSBpbnQgaXNfY29t
cGF0X3Rhc2sodm9pZCkKewogcmV0dXJuIGlzX2NvbXBhdF90aHJlYWQoY3VycmVudCk7Cn0KI2Vs
c2UKc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0X3RocmVhZChzdHJ1Y3QgdGhyZWFkX2luZm8g
KnRocmVhZCkgeyByZXR1cm4gMDsgfQpzdGF0aWMgaW5saW5lIGludCBpc19jb21wYXRfdGFzayh2
b2lkKSB7IHJldHVybiAwOyB9CiNlbmRpZgoKPiAgc3RydWN0IGNvbXBhdF91c2VyX3JlZ3Nfc3Ry
dWN0IHsKPiAgICAgICAgIGNvbXBhdF91bG9uZ190IHBjOwo+ICAgICAgICAgY29tcGF0X3Vsb25n
X3QgcmE7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHRyYWNlLmMKPiBpbmRleCAyYWZlNDYwZGUxNmE2Li5mMzYyODMyMTIzNjE2
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHRyYWNlLmMKPiBAQCAtMzc0LDE0ICszNzQsMTQgQEAgbG9uZyBjb21wYXRf
YXJjaF9wdHJhY2Uoc3RydWN0IHRhc2tfc3RydWN0ICpjaGlsZCwgY29tcGF0X2xvbmdfdCByZXF1
ZXN0LAo+Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gKyNlbHNlCj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgdXNlcl9yZWdzZXRfdmlldyBjb21wYXRfcmlzY3ZfdXNlcl9uYXRpdmVfdmlldyA9
IHt9Owo+ICAjZW5kaWYgLyogQ09ORklHX0NPTVBBVCAqLwo+Cj4gIGNvbnN0IHN0cnVjdCB1c2Vy
X3JlZ3NldF92aWV3ICp0YXNrX3VzZXJfcmVnc2V0X3ZpZXcoc3RydWN0IHRhc2tfc3RydWN0ICp0
YXNrKQo+ICB7Cj4gLSNpZmRlZiBDT05GSUdfQ09NUEFUCj4gLSAgICAgICBpZiAodGVzdF90c2tf
dGhyZWFkX2ZsYWcodGFzaywgVElGXzMyQklUKSkKPiArICAgICAgIGlmIChpc19jb21wYXRfdGhy
ZWFkKCZ0YXNrLT50aHJlYWRfaW5mbykpCj4gICAgICAgICAgICAgICAgIHJldHVybiAmY29tcGF0
X3Jpc2N2X3VzZXJfbmF0aXZlX3ZpZXc7Cj4gICAgICAgICBlbHNlCj4gLSNlbmRpZgo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gJnJpc2N2X3VzZXJfbmF0aXZlX3ZpZXc7Cj4gIH0KPiAtLQo+IDIu
NDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
