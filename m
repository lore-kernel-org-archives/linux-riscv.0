Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2941AEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZTKLClNMyblXyriSWlOniRhnylg6WT4ea/GuZjcugA=; b=EzFk0f0QbbvZxO
	KPyknroAnc6Eh95vIjn5tvQSSRkja8Tg49EJPYiN9Ym+uXDKZ0lpTnDVsBMtGUAHml5EiGHz1TwBw
	8c7MvFMohyVA0hlpZNjrzx8LJmsGz+rxaUjS7ysCTeSgKaVeouuMrDhXZxf1X0aWCiJLC41H3XEe9
	5qh1WWYiJLTfse/3u+0A4eHDZ5HCYvfUcCV+4KccyeFv5eurXDNyNUFSutpvh4XX2i/tNheOx7Rv2
	h7x4bcmvLmRQQpfoqQQ4GABybs33OyN/bBtrnIeVKxfso8UgyFB09Efx+F8gfLBlYS7XDEAX80JU2
	bFtg5QCQjMAKSaIiQjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPQe-00F35M-2h;
	Wed, 28 Jun 2023 07:17:28 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPQb-00F34d-2O
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 07:17:27 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-5ed99ebe076so53139626d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687936644; x=1690528644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPlJ3d55zkkCE0158NpdPdIacPtyKpxD+77cxWNgQn4=;
        b=TwuoyofV3eD+xsbwMKKHNnuWQd3zw4cv4WivLaxlCefTzU7TkE+psudm8VVrov8d2N
         UcyLMd3bx4qvfBZPURRi49EmV8jVybySFMrRiszENeYsQWHd/Vgfp4o6Kc4n9T8CmNZ6
         eddSsbTiSNdhQu8xXJUGC8LjjYT6qHhfPr2qiHU8eOfM1XOmBBs94DMAbHyJMAoW+b7T
         /abi0XdfjE8+dYg/9vWtjFucVD7hjQ3dyw6S/7On00XeA3cVCJq7D5Vb/7HGguYzob2E
         XpDZESJI0kX3CSKM1Jwr6DyICCIXZjyfwb1fURUv00GwQ61JTcdINlkhM+wwPYi67thu
         bhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687936644; x=1690528644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPlJ3d55zkkCE0158NpdPdIacPtyKpxD+77cxWNgQn4=;
        b=BgOyH5bl+owv2a4MS74Fx3pJH/roTbp6dIbKXRxYI78mjldxMuTMDkvmSVPq+ZPR2c
         SMOQxRMaAi+E9TR3KALGsarFPYAnWYwZSgE89OIB8JPaS3o7V4Musjyi8ocbbSjYARpA
         FKQeyYKBPibpas5rrdW/ndlIwuzUJ+j18ySVEcBVXk38ZIfZ+bYAg0lGspJp1mUf/40M
         H9+0pJQcPQRh7R1h1PnYiW2LOS1iolzD4JAjoMIAr/WGeOJX60+v0Rbw1/EJC6P8bBjr
         5ZQ52zY21vTZoQiQuv/PkHsj1cY4SVP7Os0M8LznXwFKNqq4N2GTZiB2/jmIsFX9rp1j
         AGww==
X-Gm-Message-State: AC+VfDwsXYKeXDLMaIJB0ngTnlnmLCyQiAbXViCWOuwKY9I5kGAOZDC8
	XyeqvDdFvVQS5DP774bKizToY4IQYDglH84n6og=
X-Google-Smtp-Source: ACHHUZ4SZINxUDCT1VOxGKSGnyrORp5xMAlVWVYZ4VVr9D12NJWQpx1JwNxevKpURs5vLH73EZrUYAMXE2UkZpD5Us8=
X-Received: by 2002:a05:6214:2524:b0:5f4:5af6:1304 with SMTP id
 gg4-20020a056214252400b005f45af61304mr36084024qvb.16.1687936643694; Wed, 28
 Jun 2023 00:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230517034510.15639-1-zegao@tencent.com> <20230517034510.15639-3-zegao@tencent.com>
In-Reply-To: <20230517034510.15639-3-zegao@tencent.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 28 Jun 2023 15:16:47 +0800
Message-ID: <CALOAHbC6UpfFOOibdDiC7xFc5YFUgZnk3MZ=3Ny6we=AcrNbew@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] fprobe: make fprobe_kprobe_handler recursion free
To: Ze Gao <zegao2021@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Ze Gao <zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_001725_779212_7237328A 
X-CRM114-Status: GOOD (  25.32  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMTE6NDXigK9BTSBaZSBHYW8gPHplZ2FvMjAyMUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudCBpbXBsZW1lbnRhdGlvbiBjYWxscyBrcHJvYmUgcmVs
YXRlZCBmdW5jdGlvbnMgYmVmb3JlIGRvaW5nCj4gZnRyYWNlIHJlY3Vyc2lvbiBjaGVjayBpbiBm
cHJvYmVfa3Byb2JlX2hhbmRsZXIsIHdoaWNoIG9wZW5zIGRvb3IKPiB0byBrZXJuZWwgY3Jhc2gg
ZHVlIHRvIHN0YWNrIHJlY3Vyc2lvbiBpZiBwcmVlbXB0X2NvdW50X3thZGQsIHN1Yn0KPiBpcyB0
cmFjZWFibGUgaW4ga3Byb2JlX2J1c3lfe2JlZ2luLCBlbmR9Lgo+Cj4gVGhpbmdzIGdvZXMgbGlr
ZSB0aGlzIHdpdGhvdXQgdGhpcyBwYXRjaCBxdW90ZWQgZnJvbSBTdGV2ZW46Cj4gIgo+IGZwcm9i
ZV9rcHJvYmVfaGFuZGxlcigpIHsKPiAgICBrcHJvYmVfYnVzeV9iZWdpbigpIHsKPiAgICAgICBw
cmVlbXB0X2Rpc2FibGUoKSB7Cj4gICAgICAgICAgcHJlZW1wdF9jb3VudF9hZGQoKSB7ICA8LS0g
dHJhY2UKPiAgICAgICAgICAgICBmcHJvYmVfa3Byb2JlX2hhbmRsZXIoKSB7Cj4gICAgICAgICAg
ICAgICAgIFsgd2FzaCwgcmluc2UsIHJlcGVhdCwgQ1JBU0ghISEgXQo+ICIKPgo+IEJ5IHJlZmFj
dG9yaW5nIHRoZSBjb21tb24gcGFydCBvdXQgb2YgZnByb2JlX2twcm9iZV9oYW5kbGVyIGFuZAo+
IGZwcm9iZV9oYW5kbGVyIGFuZCBjYWxsIGZ0cmFjZSByZWN1cnNpb24gZGV0ZWN0aW9uIGF0IHRo
ZSB2ZXJ5IGJlZ2lubmluZywKPiB0aGUgd2hvbGUgZnByb2JlX2twcm9iZV9oYW5kbGVyIGlzIGZy
ZWUgZnJvbSByZWN1cnNpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBaZSBHYW8gPHplZ2FvQHRlbmNl
bnQuY29tPgo+IEFja2VkLWJ5OiBNYXNhbWkgSGlyYW1hdHN1IChHb29nbGUpIDxtaGlyYW1hdEBr
ZXJuZWwub3JnPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXRyYWNlLWtl
cm5lbC8yMDIzMDUxNjA3MTgzMC44MTkwLTMtemVnYW9AdGVuY2VudC5jb20KPiAtLS0KPiAga2Vy
bmVsL3RyYWNlL2Zwcm9iZS5jIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEva2VybmVsL3RyYWNlL2Zwcm9iZS5jIGIva2VybmVsL3Ry
YWNlL2Zwcm9iZS5jCj4gaW5kZXggOWFiYjM5MDViYzhlLi4wOTdjNzQwNzk5YmEgMTAwNjQ0Cj4g
LS0tIGEva2VybmVsL3RyYWNlL2Zwcm9iZS5jCj4gKysrIGIva2VybmVsL3RyYWNlL2Zwcm9iZS5j
Cj4gQEAgLTIwLDMwICsyMCwyMiBAQCBzdHJ1Y3QgZnByb2JlX3JldGhvb2tfbm9kZSB7Cj4gICAg
ICAgICBjaGFyIGRhdGFbXTsKPiAgfTsKPgo+IC1zdGF0aWMgdm9pZCBmcHJvYmVfaGFuZGxlcih1
bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZnRyYWNlX29wcyAqb3BzLCBzdHJ1Y3QgZnRyYWNlX3JlZ3Mg
KmZyZWdzKQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19mcHJvYmVfaGFuZGxlcih1bnNpZ25lZCBs
b25nIGlwLCB1bnNpZ25lZCBsb25nCj4gKyAgICAgICAgICAgICAgIHBhcmVudF9pcCwgc3RydWN0
IGZ0cmFjZV9vcHMgKm9wcywgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncykKPiAgewo+ICAgICAg
ICAgc3RydWN0IGZwcm9iZV9yZXRob29rX25vZGUgKmZwcjsKPiAgICAgICAgIHN0cnVjdCByZXRo
b29rX25vZGUgKnJoID0gTlVMTDsKPiAgICAgICAgIHN0cnVjdCBmcHJvYmUgKmZwOwo+ICAgICAg
ICAgdm9pZCAqZW50cnlfZGF0YSA9IE5VTEw7Cj4gLSAgICAgICBpbnQgYml0LCByZXQ7Cj4gKyAg
ICAgICBpbnQgcmV0Owo+Cj4gICAgICAgICBmcCA9IGNvbnRhaW5lcl9vZihvcHMsIHN0cnVjdCBm
cHJvYmUsIG9wcyk7Cj4gLSAgICAgICBpZiAoZnByb2JlX2Rpc2FibGVkKGZwKSkKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuOwo+IC0KPiAtICAgICAgIGJpdCA9IGZ0cmFjZV90ZXN0X3JlY3Vyc2lv
bl90cnlsb2NrKGlwLCBwYXJlbnRfaXApOwo+IC0gICAgICAgaWYgKGJpdCA8IDApIHsKPiAtICAg
ICAgICAgICAgICAgZnAtPm5taXNzZWQrKzsKPiAtICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0g
ICAgICAgfQo+Cj4gICAgICAgICBpZiAoZnAtPmV4aXRfaGFuZGxlcikgewo+ICAgICAgICAgICAg
ICAgICByaCA9IHJldGhvb2tfdHJ5X2dldChmcC0+cmV0aG9vayk7Cj4gICAgICAgICAgICAgICAg
IGlmICghcmgpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBmcC0+bm1pc3NlZCsrOwo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybjsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICBmcHIgPSBjb250
YWluZXJfb2YocmgsIHN0cnVjdCBmcHJvYmVfcmV0aG9va19ub2RlLCBub2RlKTsKPiAgICAgICAg
ICAgICAgICAgZnByLT5lbnRyeV9pcCA9IGlwOwo+IEBAIC02MSwyMyArNTMsNjAgQEAgc3RhdGlj
IHZvaWQgZnByb2JlX2hhbmRsZXIodW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJl
bnRfaXAsCj4gICAgICAgICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXRob29rX2hvb2socmgsIGZ0cmFjZV9nZXRfcmVncyhmcmVncyksIHRydWUpOwo+ICAgICAgICAg
fQo+IC1vdXQ6Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGZwcm9iZV9oYW5kbGVyKHVuc2lnbmVk
IGxvbmcgaXAsIHVuc2lnbmVkIGxvbmcgcGFyZW50X2lwLAo+ICsgICAgICAgICAgICAgICBzdHJ1
Y3QgZnRyYWNlX29wcyAqb3BzLCBzdHJ1Y3QgZnRyYWNlX3JlZ3MgKmZyZWdzKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3QgZnByb2JlICpmcDsKPiArICAgICAgIGludCBiaXQ7Cj4gKwo+ICsgICAgICAg
ZnAgPSBjb250YWluZXJfb2Yob3BzLCBzdHJ1Y3QgZnByb2JlLCBvcHMpOwo+ICsgICAgICAgaWYg
KGZwcm9iZV9kaXNhYmxlZChmcCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAg
ICAgICAvKiByZWN1cnNpb24gZGV0ZWN0aW9uIGhhcyB0byBnbyBiZWZvcmUgYW55IHRyYWNlYWJs
ZSBmdW5jdGlvbiBhbmQKPiArICAgICAgICAqIGFsbCBmdW5jdGlvbnMgYmVmb3JlIHRoaXMgcG9p
bnQgc2hvdWxkIGJlIG1hcmtlZCBhcyBub3RyYWNlCj4gKyAgICAgICAgKi8KPiArICAgICAgIGJp
dCA9IGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKGlwLCBwYXJlbnRfaXApOwo+ICsgICAg
ICAgaWYgKGJpdCA8IDApIHsKPiArICAgICAgICAgICAgICAgZnAtPm5taXNzZWQrKzsKPiArICAg
ICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgfQo+ICsgICAgICAgX19mcHJvYmVfaGFuZGxl
cihpcCwgcGFyZW50X2lwLCBvcHMsIGZyZWdzKTsKPiAgICAgICAgIGZ0cmFjZV90ZXN0X3JlY3Vy
c2lvbl91bmxvY2soYml0KTsKPiArCj4gIH0KPiAgTk9LUFJPQkVfU1lNQk9MKGZwcm9iZV9oYW5k
bGVyKTsKPgo+ICBzdGF0aWMgdm9pZCBmcHJvYmVfa3Byb2JlX2hhbmRsZXIodW5zaWduZWQgbG9u
ZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBmdHJhY2Vfb3BzICpvcHMsIHN0cnVjdCBmdHJhY2VfcmVncyAqZnJl
Z3MpCj4gIHsKPiAtICAgICAgIHN0cnVjdCBmcHJvYmUgKmZwID0gY29udGFpbmVyX29mKG9wcywg
c3RydWN0IGZwcm9iZSwgb3BzKTsKPiArICAgICAgIHN0cnVjdCBmcHJvYmUgKmZwOwo+ICsgICAg
ICAgaW50IGJpdDsKPiArCj4gKyAgICAgICBmcCA9IGNvbnRhaW5lcl9vZihvcHMsIHN0cnVjdCBm
cHJvYmUsIG9wcyk7Cj4gKyAgICAgICBpZiAoZnByb2JlX2Rpc2FibGVkKGZwKSkKPiArICAgICAg
ICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIC8qIHJlY3Vyc2lvbiBkZXRlY3Rpb24gaGFz
IHRvIGdvIGJlZm9yZSBhbnkgdHJhY2VhYmxlIGZ1bmN0aW9uIGFuZAo+ICsgICAgICAgICogYWxs
IGZ1bmN0aW9ucyBjYWxsZWQgYmVmb3JlIHRoaXMgcG9pbnQgc2hvdWxkIGJlIG1hcmtlZCBhcyBu
b3RyYWNlCj4gKyAgICAgICAgKi8KPiArICAgICAgIGJpdCA9IGZ0cmFjZV90ZXN0X3JlY3Vyc2lv
bl90cnlsb2NrKGlwLCBwYXJlbnRfaXApOwo+ICsgICAgICAgaWYgKGJpdCA8IDApIHsKPiArICAg
ICAgICAgICAgICAgZnAtPm5taXNzZWQrKzsKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsg
ICAgICAgfQo+Cj4gICAgICAgICBpZiAodW5saWtlbHkoa3Byb2JlX3J1bm5pbmcoKSkpIHsKPiAg
ICAgICAgICAgICAgICAgZnAtPm5taXNzZWQrKzsKCkkgaGF2ZSBqdXN0IGxvb2tlZCB0aHJvdWdo
IHRoaXMgcGF0Y2hzZXQsIGp1c3Qgb3V0IG9mIGN1cmlvc2l0eSwKc2hvdWxkbid0IHdlIGNhbGwg
ZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3VubG9jayhiaXQpIGhlcmUgPwpXZSBoYXZlIGFscmVhZHkg
bG9ja2VkIGl0IHN1Y2Nlc3NmdWxseSwgc28gd2h5IHNob3VsZCB3ZSBub3QgdW5sb2NrIGl0PwoK
PiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgICAgfQo+ICsKPiAgICAgICAgIGtwcm9i
ZV9idXN5X2JlZ2luKCk7Cj4gLSAgICAgICBmcHJvYmVfaGFuZGxlcihpcCwgcGFyZW50X2lwLCBv
cHMsIGZyZWdzKTsKPiArICAgICAgIF9fZnByb2JlX2hhbmRsZXIoaXAsIHBhcmVudF9pcCwgb3Bz
LCBmcmVncyk7Cj4gICAgICAgICBrcHJvYmVfYnVzeV9lbmQoKTsKPiArICAgICAgIGZ0cmFjZV90
ZXN0X3JlY3Vyc2lvbl91bmxvY2soYml0KTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGZwcm9iZV9l
eGl0X2hhbmRsZXIoc3RydWN0IHJldGhvb2tfbm9kZSAqcmgsIHZvaWQgKmRhdGEsCj4gLS0KPiAy
LjQwLjEKPgo+CgoKLS0gClJlZ2FyZHMKWWFmYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
