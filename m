Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C5BEB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 00:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MsWi8FGhRrbzYlwOOuRJeMWf6garzFSmBzH72NVHFY=; b=UMQJfBpK+H/qwy
	9JeGGfwigz0OkKlzsDJTUVgWnq33hiB2qcwOcGV7kQeOtRK5c7ZcusNoSrFO7Kfli3W8hfC0LzP/C
	AV0vFUREjiZAhFLN1eqitF3cmKOYwDwMSWGC+3isbrPQpH81HsDczdTnNk4tVgSuPJT2rWrDp3oAG
	9MEv1FOX7Yqxcpm18uvvL3/TOrndXfEQs998I5m1G5Ih2zvxgTpKcnlwpPRZVzjAxePklps1BNzFE
	T1tOtfi84vCxiMaBGvW/QYsDUmIcNz5zaVhL5NyhbgcCFf6NjhEywElBYYuzQtPeAcR5fRYuBG0Ig
	Kk8qRFgw3s5mf3TWNxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN09P-00FPuq-0Y;
	Sat, 22 Jul 2023 00:07:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN09M-00FPtf-0S
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 00:07:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 276F861DB6
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 00:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905C0C433CA
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 00:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689984426;
	bh=2aLCwDO4RNMyvWiQ7Gf0WYxWlcoqijS/87EfNa8tSV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sytF87HZUS79ob+llm+N9vmsbE1uo+OoabhgXAc0wMfW5sroqffqiKJp998P7YirM
	 MqP3GpyU5oVw+zkx+T9Z8QOuv0jJVDvevFs/7CfA9DMWB5EEbL13xWYr92SQjnfOI7
	 MELetoicsrlAXGm3PpNoIq0XMFdRXlmMJCooOywt+q9SqEkBB8a7NdeOwEJ37tcudV
	 Eiq5EwU4VMvnNoQXaUJa2wuMgerZ6u3uZe531Wzd3MWD6xLKK5zDmSTGsOepyDT855
	 rx5B+YNdmMpztelTiV9I7NLP5KR13vNoHoRwoWKOzIy3cOnSJ0N1nvHrNT8WXvCR+Z
	 FCdxC9/1rhgxA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5216f713f8bso3242995a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 17:07:06 -0700 (PDT)
X-Gm-Message-State: ABy/qLZVkWtgIDj6SYnlmtT0QY9naFEiQu/2NVwCpClW1JkLzVGX4a21
	BVUYgqg1Xu1cTRudtqIYf9g7oYHAZgJIT4c7TpU=
X-Google-Smtp-Source: APBJJlGcl9QezTiSJ9T9tJT9wWdf04lQ1BB1CWTh4SzgFKovP1Pgqgko53wXBujeXOHWsKdTLL5xW76oF812EC/743c=
X-Received: by 2002:aa7:d991:0:b0:521:d83e:8db2 with SMTP id
 u17-20020aa7d991000000b00521d83e8db2mr2589897eds.39.1689984424762; Fri, 21
 Jul 2023 17:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230716152033.3713581-1-guoren@kernel.org> <bb296a8e-4f84-f45d-8f46-5acfa73022d9@ghiti.fr>
In-Reply-To: <bb296a8e-4f84-f45d-8f46-5acfa73022d9@ghiti.fr>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jul 2023 20:06:53 -0400
X-Gmail-Original-Message-ID: <CAJF2gTTBbHDr4yD=aeof_h1WM6b_CD-yJcs6R5g=jt4-NdAR8w@mail.gmail.com>
Message-ID: <CAJF2gTTBbHDr4yD=aeof_h1WM6b_CD-yJcs6R5g=jt4-NdAR8w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add HAVE_IOREMAP_PROT support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, falcon@tinylab.org, 
	bjorn@kernel.org, conor.dooley@microchip.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_170708_269636_85781CED 
X-CRM114-Status: GOOD (  22.94  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgNTowN+KAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBHdW8sCj4KPiBPbiAxNi8wNy8yMDIzIDE3OjIwLCBndW9y
ZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGli
YWJhLmNvbT4KPiA+Cj4gPiBBZGQgcHRlX3BncHJvdCBtYWNybywgdGhlbiByaXNjdiBjb3VsZCBo
YXZlIEhBVkVfSU9SRU1BUF9QUk9ULAo+ID4gd2hpY2ggd2lsbCBlbmFibGUgZ2VuZXJpY19hY2Nl
c3NfcGh5cygpIGNvZGUsIGl0IGlzIHVzZWZ1bCBmb3IKPiA+IGRlYnVnLCBlZywgZ2RiLgo+Cj4K
PiBJIGRvbid0IHVuZGVyc3RhbmQsIHdlIGFscmVhZHkgaGF2ZSB0aGUgZ2VuZXJpYyBpb3JlbWFw
X3Byb3QoKQo+IGltcGxlbWVudGF0aW9uIHNpbmNlIHdlIHNlbGVjdCBHRU5FUklDX0lPUkVNQVA6
IHNob3VsZG4ndAo+IEhBVkVfSU9SRU1BUF9QUk9UIGltcGx5IHRoYXQgd2UgaGF2ZSBvdXIgb3du
IGltcGxlbWVudGF0aW9uPwpUaGV5IGFyZSBkaWZmZXJlbnQhIFNlZSBhcmNoL2FybTY0L0tjb25m
aWcsIHdoaWNoIHNlbGVjdHMgYWxsIG9mIHRoZW0uCgpIQVZFX0lPUkVNQVBfUFJPVCB3b3VsZCBl
bmFibGUgeW91ciBkcml2ZXJzL2NoYXIvbWVtLmMKZ2VuZXJpY19hY2Nlc3NfcGh5cyBvZiBtbWFw
X21lbV9vcHMuCgpJdCdzIGEgc21hbGwgZnVuY3Rpb24gZW5hYmxpbmcuCgo+Cj4gVGhhbmtzLAo+
Cj4gQWxleAo+Cj4KPiA+IEJlY2F1c2UgZ2VuZXJpY19hY2Nlc3NfcGh5cygpIHdvdWxkIGNhbGwg
aW9yZW1hcF9wcm90KCktPgo+ID4gcGdwcm90X254KCkgdG8gZGlzYWJsZSBleGN1dGFibGUgYXR0
cmlidXRlLCBhZGQgZGVmaW5pdGlvbgo+ID4gb2YgcGdwcm90X254KCkgZm9yIHJpc2N2Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAg
IC4uLi9mZWF0dXJlcy92bS9pb3JlbWFwX3Byb3QvYXJjaC1zdXBwb3J0LnR4dCAgICAgfCAgMiAr
LQo+ID4gICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKwo+ID4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAg
ICAgICAgIHwgMTUgKysrKysrKysrKysrKysrCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2ZlYXR1cmVzL3ZtL2lvcmVtYXBfcHJvdC9hcmNoLXN1cHBvcnQudHh0IGIvRG9jdW1lbnRh
dGlvbi9mZWF0dXJlcy92bS9pb3JlbWFwX3Byb3QvYXJjaC1zdXBwb3J0LnR4dAo+ID4gaW5kZXgg
YTI0MTQ5ZTU5ZDczLi5lYThjOGEzNjE0NTUgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2ZlYXR1cmVzL3ZtL2lvcmVtYXBfcHJvdC9hcmNoLXN1cHBvcnQudHh0Cj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2ZlYXR1cmVzL3ZtL2lvcmVtYXBfcHJvdC9hcmNoLXN1cHBvcnQudHh0Cj4gPiBA
QCAtMjEsNyArMjEsNyBAQAo+ID4gICAgICAgfCAgICBvcGVucmlzYzogfCBUT0RPIHwKPiA+ICAg
ICAgIHwgICAgICBwYXJpc2M6IHwgVE9ETyB8Cj4gPiAgICAgICB8ICAgICBwb3dlcnBjOiB8ICBv
ayAgfAo+ID4gLSAgICB8ICAgICAgIHJpc2N2OiB8IFRPRE8gfAo+ID4gKyAgICB8ICAgICAgIHJp
c2N2OiB8ICBvayAgfAo+ID4gICAgICAgfCAgICAgICAgczM5MDogfCAgb2sgIHwKPiA+ICAgICAg
IHwgICAgICAgICAgc2g6IHwgIG9rICB8Cj4gPiAgICAgICB8ICAgICAgIHNwYXJjOiB8IFRPRE8g
fAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+ID4gaW5kZXggNGMwN2I5MTg5Yzg2Li4xNTkwMGZhMjA3OTcgMTAwNjQ0Cj4gPiAtLS0gYS9h
cmNoL3Jpc2N2L0tjb25maWcKPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gQEAgLTEx
Nyw2ICsxMTcsNyBAQCBjb25maWcgUklTQ1YKPiA+ICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9O
X0VSUk9SX0lOSkVDVElPTgo+ID4gICAgICAgc2VsZWN0IEhBVkVfR0NDX1BMVUdJTlMKPiA+ICAg
ICAgIHNlbGVjdCBIQVZFX0dFTkVSSUNfVkRTTyBpZiBNTVUgJiYgNjRCSVQKPiA+ICsgICAgIHNl
bGVjdCBIQVZFX0lPUkVNQVBfUFJPVAo+ID4gICAgICAgc2VsZWN0IEhBVkVfSVJRX1RJTUVfQUND
T1VOVElORwo+ID4gICAgICAgc2VsZWN0IEhBVkVfS1BST0JFUyBpZiAhWElQX0tFUk5FTAo+ID4g
ICAgICAgc2VsZWN0IEhBVkVfS1BST0JFU19PTl9GVFJBQ0UgaWYgIVhJUF9LRVJORUwKPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBpbmRleCA3NTk3MGVlMmJkYTIuLmM5NTUyYTE2MWY5
MCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gQEAgLTQxNSw2ICs0MTUs
MTEgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbWtodWdlKHB0ZV90IHB0ZSkKPiA+ICAgICAg
IHJldHVybiBwdGU7Cj4gPiAgIH0KPiA+Cj4gPiArc3RhdGljIGlubGluZSBwZ3Byb3RfdCBwdGVf
cGdwcm90KHB0ZV90IHB0ZSkKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gX19wZ3Byb3QocHRlX3Zh
bChwdGUpICYgfl9QQUdFX1BGTl9NQVNLKTsKPiA+ICt9Cj4gPiArCj4gPiAgICNpZmRlZiBDT05G
SUdfTlVNQV9CQUxBTkNJTkcKPiA+ICAgLyoKPiA+ICAgICogU2VlIHRoZSBjb21tZW50IGluIGlu
Y2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS5oCj4gPiBAQCAtNTczLDYgKzU3OCwxNiBAQCBzdGF0
aWMgaW5saW5lIGludCBwdGVwX2NsZWFyX2ZsdXNoX3lvdW5nKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLAo+ID4gICAgICAgcmV0dXJuIHB0ZXBfdGVzdF9hbmRfY2xlYXJfeW91bmcodm1hLCBh
ZGRyZXNzLCBwdGVwKTsKPiA+ICAgfQo+ID4KPiA+ICsjZGVmaW5lIHBncHJvdF9ueCBwZ3Byb3Rf
bngKPiA+ICtzdGF0aWMgaW5saW5lIHBncHJvdF90IHBncHJvdF9ueChwZ3Byb3RfdCBfcHJvdCkK
PiA+ICt7Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIHByb3QgPSBwZ3Byb3RfdmFsKF9wcm90KTsK
PiA+ICsKPiA+ICsgICAgIHByb3QgJj0gfl9QQUdFX0VYRUM7Cj4gPiArCj4gPiArICAgICByZXR1
cm4gX19wZ3Byb3QocHJvdCk7Cj4gPiArfQo+ID4gKwo+ID4gICAjZGVmaW5lIHBncHJvdF9ub25j
YWNoZWQgcGdwcm90X25vbmNhY2hlZAo+ID4gICBzdGF0aWMgaW5saW5lIHBncHJvdF90IHBncHJv
dF9ub25jYWNoZWQocGdwcm90X3QgX3Byb3QpCj4gPiAgIHsKCgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
