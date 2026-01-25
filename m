Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1ADE63C82
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 04:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uz1AEDeM5JjzbD+pQ+M1MeD2yzOIdj9d5cgBuMhkz1U=; b=FtD3X/QHv6mj0v
	axun7QwLFMeM6I/9+RJ2sh8r7iPnaUJ/7Z/aYY1bnaEucXNxfHzUbV31s4pXrBYGu/Djbzh/kuGOb
	oKSHs3bWrsa1EWjPm/0PadPC9tdtffQqSRMLlM6pUEQuq3uAEdYNYxxwOIPLcuZ5oeWRUiRUW7ty/
	bn3uhcLB+M/X9nb5eadPXPaIqM+zjkCw2LqGeifyg1vsOOHjiJEp+T8NljGavYtoUsz2aWMqkJUxP
	0N2vikz9Ys7/Ap3/E00ctxs+Uw8gXgG7QPVojku/wP3h+aLM7ILf89t8JpZ1OKil8e9X0PoLHOt4K
	LboKhkfEoniEW5nlo2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrM8-0000000Ap1J-0l1J;
	Sun, 25 Jan 2026 04:04:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrM5-0000000Ap0T-3hxE
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 04:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 145DB4445F
	for <linux-riscv@lists.infradead.org>; Sun, 25 Jan 2026 04:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D4CC2BCC6
	for <linux-riscv@lists.infradead.org>; Sun, 25 Jan 2026 04:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769313842;
	bh=1QP1PVbgfgapGdfxYG9jR9OdjDGN0laLbzVlm9bi+/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XaocTzgqc0Es3j4/8T8G4uoAUd1mHKH8AtIbtaR4alhCqdNxI2igRM7p74pjxp9Zw
	 EbUuK8JheqrMq2x4ij0eRY/zLBKSaT1YhUqAYJc2/BgeVhsg1DjDUzseAe7n4vnIth
	 z/2zsYwWVwmv+J469OSN6ycJFOAxYUGOduEKh/tNSBz5fl9nDuUmlOQjaSVCpQFlvC
	 I84Ws91PfAh9Xd0qhFxUCaI6Xmh1He4hA0nVseGgoY0TqFkc520zg+x6bi1Ndr0L0g
	 MJOhp0QhEXmv9pfq2vAiH2j9uZP9ZfVCiV/qw8Giep843cZzl/3qK/yeHG1FdKT4j7
	 E6Kf0m/KYw9lQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b885d8f4092so399461766b.2
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 20:04:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWW5rm9SHADna654Ds1rU19dMTCYNVBbUKssE+f2zcv89u49ASVc2EMADc4v4u+BW2D2S4Ers7y5d2gVw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8u6LN6uwmveIgkLcRxxc6d85fJ0yyfOgt80FqG12QEDVUNTIf
	WxICbDgebRvvqDG3ls3qqm2ozAlMnwP4LAqpjC8XhXKh9MM+lOQ8lbRF3S4vNiz2LcShVreyTHu
	rd2inB4i0ojOUWJT/dfxkpO7TA6vffZU=
X-Received: by 2002:a17:906:f58c:b0:b88:60d2:11a2 with SMTP id
 a640c23a62f3a-b8d3fbba376mr29407566b.34.1769313841185; Sat, 24 Jan 2026
 20:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20260109051054.188030-1-fearyncess@aosc.io>
In-Reply-To: <20260109051054.188030-1-fearyncess@aosc.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 25 Jan 2026 12:03:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Yk5OWWeH7p=h3JdtJHr6GFoq6wAfCHUbj_R0eoLre=Q@mail.gmail.com>
X-Gm-Features: AZwV_QjI7_MypoP-cFKhVGgow4YwRF06xAdcJWacmzKDSMsegChV4xgnK6Efe80
Message-ID: <CAAhV-H7Yk5OWWeH7p=h3JdtJHr6GFoq6wAfCHUbj_R0eoLre=Q@mail.gmail.com>
Subject: Re: [PATCH] loongarch: wire up memfd_secret system call
To: Lain Fearyncess Yang <fearyncess@aosc.io>
Cc: WANG Xuerui <kernel@xen0n.name>, Kexy Biscuit <kexybiscuit@aosc.io>, 
	Mingcong Bai <jeffbai@aosc.io>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_200405_964382_A86BDD4B 
X-CRM114-Status: GOOD (  13.83  )
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

QXBwbGllZCwgdGhhbmtzLgoKSHVhY2FpCgpPbiBGcmksIEphbiA5LCAyMDI2IGF0IDE6MTHigK9Q
TSBMYWluIEZlYXJ5bmNlc3MgWWFuZyA8ZmVhcnluY2Vzc0Bhb3NjLmlvPiB3cm90ZToKPgo+IEZy
b206ICJMYWluIFwiRmVhcnluY2Vzc1wiIFlhbmciIDxmZWFyeW5jZXNzQGFvc2MuaW8+Cj4KPiBM
b29uZ0FyY2ggc3VwcG9ydHMgQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVAsIHRoZXJlZm9yZSB3aXJl
IHVwIHRoZQo+IG1lbWZkX3NlY3JldCBzeXN0ZW0gY2FsbCwgd2hpY2ggZGVwZW5kcyBvbiBpdC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IExhaW4gIkZlYXJ5bmNlc3MiIFlhbmcgPGZlYXJ5bmNlc3NAYW9z
Yy5pbz4KPiAtLS0KPiAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vdW5pc3RkLmggICAgIHwg
MSArCj4gIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC9NYWtlZmlsZS5zeXNjYWxscyB8IDYgKysrLS0t
Cj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21tL01ha2VmaWxlICAgICB8IDIgKy0KPiAgMyBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vdW5pc3RkLmggYi9hcmNoL2xvb25nYXJj
aC9pbmNsdWRlL2FzbS91bmlzdGQuaAo+IGluZGV4IGUyYzBmM2Q4NmM3YmQuLmU3NjQ5YzE1ODI0
ODIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vdW5pc3RkLmgKPiAr
KysgYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS91bmlzdGQuaAo+IEBAIC0xMCw1ICsxMCw2
IEBACj4KPiAgI2RlZmluZSBfX0FSQ0hfV0FOVF9ORVdfU1RBVAo+ICAjZGVmaW5lIF9fQVJDSF9X
QU5UX1NZU19DTE9ORQo+ICsjZGVmaW5lIF9fQVJDSF9XQU5UX01FTUZEX1NFQ1JFVAo+Cj4gICNk
ZWZpbmUgTlJfc3lzY2FsbHMgKF9fTlJfc3lzY2FsbHMpCj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9v
bmdhcmNoL2tlcm5lbC9NYWtlZmlsZS5zeXNjYWxscyBiL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9N
YWtlZmlsZS5zeXNjYWxscwo+IGluZGV4IGNkNDZjMmI2OWM3ZmQuLjYzNjAzODFiYWY5MzEgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gva2VybmVsL01ha2VmaWxlLnN5c2NhbGxzCj4gKysr
IGIvYXJjaC9sb29uZ2FyY2gva2VybmVsL01ha2VmaWxlLnN5c2NhbGxzCj4gQEAgLTEsNSArMSw1
IEBACj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPgo+IC0jIE5vIHNwZWNp
YWwgQUJJcyBvbiBsb29uZ2FyY2ggc28gZmFyCj4gLXN5c2NhbGxfYWJpc18zMiArPQo+IC1zeXNj
YWxsX2FiaXNfNjQgKz0KPiArIyBBZGQgbWVtZmRfc2VjcmV0IGV4cGxpY3RseSBmb3IgbGE2NCBh
bmQgbGEzMgo+ICtzeXNjYWxsX2FiaXNfMzIgKz0gbWVtZmRfc2VjcmV0Cj4gK3N5c2NhbGxfYWJp
c182NCArPSBtZW1mZF9zZWNyZXQKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbW0vTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tbS9NYWtlZmlsZQo+IGlu
ZGV4IGVhZjkzMTIwOTdmN2IuLjc5NTgyNDM4ZWZjNGQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvbW0vTWFrZWZpbGUKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9tbS9NYWtlZmlsZQo+IEBAIC03Miw3ICs3Miw3IEBAIFRFU1RfR0VOX0ZJTEVTICs9IG1hZHZf
cG9wdWxhdGUKPiAgVEVTVF9HRU5fRklMRVMgKz0gbWFwX2ZpeGVkX25vcmVwbGFjZQo+ICBURVNU
X0dFTl9GSUxFUyArPSBtYXBfaHVnZXRsYgo+ICBURVNUX0dFTl9GSUxFUyArPSBtYXBfcG9wdWxh
dGUKPiAtaWZuZXEgKCwkKGZpbHRlciAkKEFSQ0gpLGFybTY0IHJpc2N2IHJpc2N2NjQgeDg2IHg4
Nl82NCkpCj4gK2lmbmVxICgsJChmaWx0ZXIgJChBUkNIKSxhcm02NCByaXNjdiByaXNjdjY0IHg4
NiB4ODZfNjQgbG9vbmdhcmNoMzIgbG9vbmdhcmNoNjQpKQo+ICBURVNUX0dFTl9GSUxFUyArPSBt
ZW1mZF9zZWNyZXQKPiAgZW5kaWYKPiAgVEVTVF9HRU5fRklMRVMgKz0gbWlncmF0aW9uCj4gLS0K
PiAyLjUyLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
