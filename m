Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B54ECAAA3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWUISyRCb9g4Cb/VvYi1bvfgPYra5cR+mFbJLNejETg=; b=RHGyCvwH7SzMpu
	Q6BJiqQ7AsEM1EG8s6N+opGpT2+bGTIa/6Ep1CzoVZhXzJXTXx/L4HjtKpsU+6DnHE2lokhwFc827
	oJcmO8p/TMwuAQoGexSkRBLufXHopUOCRZhxjqwZ1z6AjhkzqyNeALOFJlzOlsHsxXQzqfE3g0KGP
	QF3kV1dC+tLf4MXR94npr2vu7B+8U1n6dSQVdYnGc/q9UHWiSbS24wI7ek1iJ7uQaqBv4kmktKXbA
	Rmkn1uEs6qd5b5Fc9j0IiQ0Ct8y1ot3KXnWAvEIVN/h5gtqBqZ2nmdOEfTr1XR+nfuy/i8NGHqHWr
	B1Yqx2u+fXti3ZzTKYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRU0M-00GU5V-E2; Fri, 26 Aug 2022 07:43:50 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRU0J-00GU4z-BI
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 07:43:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id og21so1621824ejc.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 00:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=F/nfhZc46qE5/TwWod1aI4DtHV3cNbQmnQVOS7KtUiw=;
        b=oYUX+bEJ3UQh33DuSroB74rRtvLbKykp+t2RAxwDLy17IG39SixpC5Od3J6bFsciB9
         L9M6qY6VdiGRtgQ+ffqxDTDMF7lUEKPKr7vINrwUGHEY8re/XIq+N4u42bvu25JqNmnx
         Cmd7mKgbmf3nte+WkudFsZN6VizrJjzc9TgPE4ruvlZgzQQRkRawnESVH58U0GT4fPU0
         tRoOQkDndMYCPPfTQN/Y+XUZbGoqjGCeNAM++5oLIM5+9rSirKi/siCRYLx0utR8a9r/
         mg5AxwuVrD/3PVrOHuB3lC2ua2J3NC5whRotD023zrPibSXyGObsurBGEv8Fi1fiYW+p
         DrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=F/nfhZc46qE5/TwWod1aI4DtHV3cNbQmnQVOS7KtUiw=;
        b=qfP8BOlm8mvxKJMBjTTrMUXfdTYE/pQ6sBmCFG6JKIdbdDc+2rc+mI034HXKVWqVCk
         wLTyOUGUBakd4gEmPqjE//6DQUyGmBcnepnEWyu2w5WOgjeacqsNWD0s8pjE2Z9iXA/q
         dXNwKlFmk6laEo25xHc+nB9HDF1MfDoGVLPdkUtSZlFARdifefC9I50O34uWnMIUszZt
         R+Rwg82xs4Vg2PzQegCjOhcIMpT6aEaY5DqYdRRsnJdYVJqN5ZFWRsOCKi6TY+p2sU5v
         PbJyJkuiR+cuu+WXFf32yF28MK/Kaptsj7BEBP6PJEUlHPfsU7SqCmqWNETrBEA9VN14
         HEFA==
X-Gm-Message-State: ACgBeo1euxIj1P5mB5XhxtmhI1OaEv3zoQDx4j1uMxSyqmWyCRGKJ1og
	U5nyguq+S1/OoafsCEKh+xrMqg==
X-Google-Smtp-Source: AA6agR4FR1taplTOBaRAf+gwkdsaV73At3Y63T+X4h88m7x9hmzQ6iSyIBQqF/N1LTgXniDa9N5s3g==
X-Received: by 2002:a17:906:8a5b:b0:73d:7975:567e with SMTP id gx27-20020a1709068a5b00b0073d7975567emr4601197ejc.378.1661499820198;
        Fri, 26 Aug 2022 00:43:40 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id es5-20020a056402380500b0043bc4b28464sm852979edb.34.2022.08.26.00.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 00:43:39 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:43:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor.Dooley@microchip.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com, Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH -next v2 1/2] riscv: uaccess: rename
 __get/put_user_nocheck to __get/put_mem_nocheck
Message-ID: <20220826074318.g6nwri5ziiutiio5@kamzik>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-2-tongtiangen@huawei.com>
 <20220825105600.ezueddmwehob42rf@kamzik>
 <3541c980-7fcf-7047-cec7-3c2ca6381a99@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3541c980-7fcf-7047-cec7-3c2ca6381a99@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_004347_418522_7E6A8AF7 
X-CRM114-Status: GOOD (  23.90  )
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

T24gRnJpLCBBdWcgMjYsIDIwMjIgYXQgMDI6MzM6NDdQTSArMDgwMCwgVG9uZyBUaWFuZ2VuIHdy
b3RlOgo+IAo+IAo+IOWcqCAyMDIyLzgvMjUgMTg6NTYsIEFuZHJldyBKb25lcyDlhpnpgZM6Cj4g
PiBPbiBNb24sIEF1ZyAxNSwgMjAyMiBhdCAwMzoyMDoyNEFNICswMDAwLCBUb25nIFRpYW5nZW4g
d3JvdGU6Cj4gPiA+IEN1cnJlbnQsIFRoZSBoZWxwZXJzIF9fZ2V0L3B1dF91c2VyX25vY2hlY2so
KSBpcyB1c2VkIGJ5IGdldC9wdXRfdXNlcigpIGFuZAo+ID4gPiBfX2dldC9wdXRfa2VybmVsX25v
ZmF1bHQoKSwgd2hpY2ggaXMgbm90IGFsd2F5cyB1YWNjZXNzLCBzbyB0aGUgbmFtZSB3aXRoCj4g
PiA+ICp1c2VyKiBpcyBub3QgYXBwcm9wcmlhdGUuCj4gPiA+IAo+ID4gPiBBbHNvIHJlbmFtZSB4
eHhfdXNlcl94eHggdG8geHh4X21lbV94eCAgb24gdGhlIGNhbGwgcGF0aCBvZgo+ID4gPiBfX2dl
dC9wdXRfdXNlcl9ub2NoZWNrKCkKPiA+ID4gCj4gPiA+IE9ubHkgcmVmYWN0b3IgY29kZSB3aXRo
b3V0IGFueSBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBU
b25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgNDggKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjQg
ZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS91YWNjZXNzLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ID4gPiBp
bmRleCA4NTU0NTBiZWQ5ZjUuLjEzNzBkYTA1NWI0NCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS91YWNjZXNzLmgKPiA+ID4gQEAgLTUwLDcgKzUwLDcgQEAKPiA+ID4gICAgKiBjYWxsLgo+
ID4gPiAgICAqLwo+ID4gPiAtI2RlZmluZSBfX2dldF91c2VyX2FzbShpbnNuLCB4LCBwdHIsIGVy
cikJCQlcCj4gPiA+ICsjZGVmaW5lIF9fZ2V0X21lbV9hc20oaW5zbiwgeCwgcHRyLCBlcnIpCQkJ
XAo+ID4gPiAgIGRvIHsJCQkJCQkJCVwKPiA+ID4gICAJX190eXBlb2ZfXyh4KSBfX3g7CQkJCQlc
Cj4gPiA+ICAgCV9fYXNtX18gX192b2xhdGlsZV9fICgJCQkJCVwKPiA+ID4gQEAgLTY0LDEyICs2
NCwxMiBAQCBkbyB7CQkJCQkJCQlcCj4gPiA+ICAgfSB3aGlsZSAoMCkKPiA+ID4gICAjaWZkZWYg
Q09ORklHXzY0QklUCj4gPiA+IC0jZGVmaW5lIF9fZ2V0X3VzZXJfOCh4LCBwdHIsIGVycikgXAo+
ID4gPiAtCV9fZ2V0X3VzZXJfYXNtKCJsZCIsIHgsIHB0ciwgZXJyKQo+ID4gPiArI2RlZmluZSBf
X2dldF9tZW1fOCh4LCBwdHIsIGVycikgXAo+ID4gPiArCV9fZ2V0X21lbV9hc20oImxkIiwgeCwg
cHRyLCBlcnIpCj4gPiA+ICAgI2Vsc2UgLyogIUNPTkZJR182NEJJVCAqLwo+ID4gPiAtI2RlZmlu
ZSBfX2dldF91c2VyXzgoeCwgcHRyLCBlcnIpCQkJCVwKPiA+ID4gKyNkZWZpbmUgX19nZXRfbWVt
XzgoeCwgcHRyLCBlcnIpCQkJCVwKPiA+ID4gICBkbyB7CQkJCQkJCQlcCj4gPiA+IC0JdTMyIF9f
dXNlciAqX19wdHIgPSAodTMyIF9fdXNlciAqKShwdHIpOwkJXAo+ID4gPiArCXUzMiAqX19wdHIg
PSAodTMyICopKHB0cik7CQkJCVwKPiA+IAo+ID4gRG9lc24ndCBjYXN0aW5nIGF3YXkgX191c2Vy
IHJlZHVjZSBzcGFyc2UncyB1dGlsaXR5Pwo+IAo+IEZyb20gdGhlIGNhbGwgbG9naWNbMV0sIHRo
ZSBhZGRyZXNzIHBhc3NlZCBpbnRvIHRoaXMgbWFjcm8gaXMgbm90Cj4gbmVjZXNzYXJpbHkgX191
c2VyLiBJIHVuZGVyc3RhbmQgdGhhdCBubyBwcm9ibGVtIHdpbGwgYmUgaW50cm9kdWNlZCBmb3IK
PiBzcGFyc2UncyB1dGlsaXR5Lgo+IAo+IEluIGFkZGl0aW9uLCB0aGVyZSBpcyBubyBuZWVkIHRv
IGRvIGEgcG9pbnRlciBjb252ZXJzaW9uIGhlcmUsIHdpbGwgYmUgZml4ZWQKPiBuZXh0IHZlcnNp
b24uCj4gCj4gWzFdIF9fZ2V0X2tlcm5lbF9ub2ZhdWx0IC0+IF9fZ2V0X21lbV9ub2NoZWNrIC0+
IF9fZ2V0X21lbV84CgpZZXMsIEkgdW5kZXJzdG9vZCB0aGF0LiBNeSBjb25jZXJuIHdhcyBmb3Ig
dGhlIHRpbWVzIHRoYXQgdGhlIGFkZHJlc3Mgd2FzCl9fdXNlciBhcyB3ZSdkIG5vIGxvbmdlciBn
ZXQgdGhhdCBjaGVjayBmb3IgdGhlbS4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
