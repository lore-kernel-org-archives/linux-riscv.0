Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97669C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 07:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRNZDytUE/cuh1Wlj1pKXQXT4e4VGVjek5t6ozW38Gk=; b=kf5P1Kho/oALLu
	0XppeN4+3zWayJAqG04THv1+06GumK7+hLdUgPobXdlYjxfWnp40llV0ozr/UMykA7nEY9qKVI2pd
	bsGCH0QGPnS4lX9OBd1gPfBUpkoY2my0Uh8qjrUmyNZtr3nVH1FRq5EjsHpWutRFz0+tyB00E71sx
	4/jgvzk7iTaR2BgPOnfj0IH/KTB9GLlUJTKWwjiNqNPwl10qzpYYJbh4Zz3UoePt1u7+PJ2w1gjka
	AiGzzUCUweXXnJIpRWZUEDox5j/27qNw5cWI9QeIuJrsKkewxPaZ/vUPPbndgbKBhrhJKjiG/TMMc
	QV23BjsrmTW6gNKiQlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasVo-0000000F0Rf-0cY2;
	Mon, 05 Aug 2024 07:52:12 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasVl-0000000F0Qd-2jfZ
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 07:52:10 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ef23d04541so116483051fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722844328; x=1723449128; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YA9Y9VMAPxbylebRC1XdIIi/H9qoWvJWVxmB4cwGQA=;
        b=JLiH+z5DCYch+k7m/oUiFxN4U4kIz9WKOVZLOSH2Odr2F4oru4TrnMwby/f9JK/gXd
         z6jMNWVHGXzTITLA9bDjqJQdA20omyi6hQvLlBT6wVo5jqj5MU8+oxuKUq0HJyFX7Cyl
         7NHhAH+Q/z8S6inMU0z4+Hw6DgkE1ba5NzpKbyIAdceAuppCXRRvXhAJ/9FG3ef7WAYV
         5JR5gV+Ux7DxU+lvLW8f+w3QFm3cSN1F9ilY/0vqn5WH1Op3pwOQRE92/6SytcIMW4Ta
         wBEd4oHEeJNCyBB0UNTDMIXproAMQBWyy9GMBr/BelNLYEBaNdSR+JMcvynaZ72NvNp3
         ZcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844328; x=1723449128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YA9Y9VMAPxbylebRC1XdIIi/H9qoWvJWVxmB4cwGQA=;
        b=nG+M9UGLU0w491juUHc9bUCjmDpHO2asdTt2YPiDCR3ivQrlht25plCCfxWKk6obRk
         1mHu6sMQhGTkRLDAqEZEEQoxkJcIKhhSeK1eJoTzexY/0fqCpz5qeXoGDf2IDybiClGw
         XJmBMpMvZq67zAzByf154jx1vR3hRBKEcbS/TMi+ylEMV4YVTLdwHDSEw81E4CCnSZQ2
         FAJHQFnIoTX8q9gbbjvbC9pWBBxGWDWIgrqNwP39CZcxKEuIa/1wWIz9rI3pp6b5GoKE
         LJNb1OzSMaW6U5Vh1gbNcr7Ldy+tidNqXs/DgBrvS1BD34c8xoB0+1MF1U0KDl1pxqyL
         YV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUQtPFS6Uy5QY7WcV4USz5pjb1A9VNCTN0yei5eX/+0wepDXDRFyg34HjhAPNdWzuHkdN+31yf1UiDV1Xga1kMYbZj1gtwkKxjuNVDV2wq
X-Gm-Message-State: AOJu0YywtIq29n5jrcEQZY4DlP1mhYWc7YJy4xw9cd0U/WS7VEsMfcOR
	A1vqbxghMkQ66FFEJi7706JknwAVFnb5pX+CLHv+NFVAj2yLYOP/R1FRz2uCXglt1AGbvK7q0ix
	kNs7Pvot0B+riK5RT1L2Tpz8AlVQqf+z84SLxcg==
X-Google-Smtp-Source: AGHT+IFjTMi5LTeJhpKw69H6ErUCnOJMAzJqM2E7B1tEBffKUkVO1xM1ianZH9WzkF88CksIdFWX3NbjhNpLgGIAIQM=
X-Received: by 2002:a2e:a1c7:0:b0:2ec:56d1:f28 with SMTP id
 38308e7fff4ca-2f15aac3954mr70149661fa.26.1722844327469; Mon, 05 Aug 2024
 00:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240718035444.2977105-1-ruanjinjie@huawei.com> <20240718035444.2977105-4-ruanjinjie@huawei.com>
In-Reply-To: <20240718035444.2977105-4-ruanjinjie@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:51:56 +0200
Message-ID: <CACRpkdaJLBt8-c_f4Q3_nLdB_7hZE9Pv5LiX0ObiycXZcj9j0g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: Use generic interface to simplify crashkernel reservation
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, bhe@redhat.com, vgoyal@redhat.com, 
	dyoung@redhat.com, arnd@arndb.de, afd@ti.com, akpm@linux-foundation.org, 
	eric.devolder@oracle.com, gregkh@linuxfoundation.org, javierm@redhat.com, 
	deller@gmx.de, robh@kernel.org, hbathini@linux.ibm.com, 
	thunder.leizhen@huawei.com, chenjiahao16@huawei.com, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_005209_727196_03D90B5F 
X-CRM114-Status: GOOD (  13.80  )
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

T24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgNTo1MeKAr0FNIEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgoKPiBDdXJyZW50bHksIHg4NiwgYXJtNjQsIHJpc2N2IGFuZCBs
b29uZ2FyY2ggaGFzIGJlZW4gc3dpdGNoZWQgdG8gZ2VuZXJpYwo+IGNyYXNoa2VybmVsIHJlc2Vy
dmF0aW9uLCB3aGljaCBpcyBhbHNvIHJlYWR5IGZvciAzMmJpdCBzeXN0ZW0uCj4gU28gd2l0aCB0
aGUgaGVscCBvZiBmdW5jdGlvbiBwYXJzZV9jcmFzaGtlcm5lbCgpIGFuZCBnZW5lcmljCj4gcmVz
ZXJ2ZV9jcmFzaGtlcm5lbF9nZW5lcmljKCksIGFybTMyIGNyYXNoa2VybmVsIHJlc2VydmF0aW9u
IGNhbiBhbHNvCj4gYmUgc2ltcGxpZmllZCBieSBzdGVwczoKPgo+IDEpIEFkZCBhIG5ldyBoZWFk
ZXIgZmlsZSA8YXNtL2NyYXNoX3Jlc2VydmUuaD4sIGFuZCBkZWZpbmUgQ1JBU0hfQUxJR04sCj4g
ICAgQ1JBU0hfQUREUl9MT1dfTUFYLCBDUkFTSF9BRERSX0hJR0hfTUFYIGluIGl0Owo+Cj4gMikg
QWRkIGFyY2hfcmVzZXJ2ZV9jcmFzaGtlcm5lbCgpIHRvIGNhbGwgcGFyc2VfY3Jhc2hrZXJuZWwo
KSBhbmQKPiAgICByZXNlcnZlX2NyYXNoa2VybmVsX2dlbmVyaWMoKTsKPgo+IDMpIEFkZCBBUkNI
X0hBU19HRU5FUklDX0NSQVNIS0VSTkVMX1JFU0VSVkFUSU9OIEtjb25maWcgaW4KPiAgICBhcmNo
L2FybS9LY29uZmlnLgo+Cj4gVGhlIG9sZCByZXNlcnZlX2NyYXNoa2VybmVsKCkgY2FuIGJlIHJl
bW92ZWQuCj4KPiBGb2xsb3dpbmcgdGVzdCBjYXNlcyBoYXZlIGJlZW4gcGVyZm9ybWVkIGFzIGV4
cGVjdGVkIG9uIFFFTVUgdmV4cHJlc3MtYTkKPiAoMUdCIHN5c3RlbSBtZW1vcnkpOgo+Cj4gMSkg
Y3Jhc2hrZXJuZWw9NEcsaGlnaCAgICAgICAgICAgICAgICAgICAgICAgICAgLy8gaW52YWxpZAo+
IDIpIGNyYXNoa2VybmVsPTFHLGhpZ2ggICAgICAgICAgICAgICAgICAgICAgICAgIC8vIGludmFs
aWQKPiAzKSBjcmFzaGtlcm5lbD0xRyxoaWdoIGNyYXNoa2VybmVsPTBNLGxvdyAgICAgICAvLyBp
bnZhbGlkCj4gNCkgY3Jhc2hrZXJuZWw9MjU2TSxoaWdoICAgICAgICAgICAgICAgICAgICAgICAg
Ly8gaW52YWxpZAo+IDUpIGNyYXNoa2VybmVsPTI1Nk0sbG93ICAgICAgICAgICAgICAgICAgICAg
ICAgIC8vIGludmFsaWQKPiA2KSBjcmFzaGtlcm5lbD0yNTZNIGNyYXNoa2VybmVsPTI1Nk0saGln
aCAgICAgICAvLyBoaWdoIGlzIGlnbm9yZWQsIG9rCj4gNykgY3Jhc2hrZXJuZWw9MjU2TSBjcmFz
aGtlcm5lbD0yNTZNLGxvdyAgICAgICAgLy8gbG93IGlzIGlnbm9yZWQsIG9rCj4gOCkgY3Jhc2hr
ZXJuZWw9MjU2TSxoaWdoIGNyYXNoa2VybmVsPTI1Nk0sbG93ICAgLy8gaW52YWxpZAo+IDkpIGNy
YXNoa2VybmVsPTI1Nk0saGlnaCBjcmFzaGtlcm5lbD00Ryxsb3cgICAgIC8vIGludmFsaWQKPiAx
MCkgY3Jhc2hrZXJuZWw9MjU2TSAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBvawo+IDEx
KSBjcmFzaGtlcm5lbD01MTJNICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIG9rCj4gMTIp
IGNyYXNoa2VybmVsPTI1Nk1AMHg4ODAwMDAwMCAgICAgICAgICAgICAgICAgLy8gb2sKPiAxMykg
Y3Jhc2hrZXJuZWw9MjU2TUAweDc4MDAwMDAwICAgICAgICAgICAgICAgICAvLyBvawo+IDE0KSBj
cmFzaGtlcm5lbD01MTJNQDB4NzgwMDAwMDAgICAgICAgICAgICAgICAgIC8vIG9rCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgo+IFRlc3RlZC1i
eTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4KPiAtLS0KPiB2MzoKPiAtIFVw
ZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuCgpJIGhhdmVuJ3QgdXNlZCBjcmFzaCBtdWNoIGJ1dCBp
dCBsb29rcyByaWdodCB0byBteSB1bnRyYWluZWQgZXllLgpBY2tlZC1ieTogTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
