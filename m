Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41506C0015E
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 06:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4E3Nj1yv0BLgu751yosqQvb69sqtmtlHEDytLOgyINw=; b=DEnp6lMcJevDdt
	YOKDuat1FeZqaNwxzrFiyULOf0C4XAX1l1Kjer+Xhx9BTCO6pZc6pEfHoo4JwGQ3Y8U1pCW746urx
	gFKUw2oslIIkjGF22f+u0EtaCyijARoyYhmMIM4xqxuz0kGYQ6/zb8KeXmrMGADGvNeyJKJv80/Uu
	u7cO5IZA6TsA2JxE9IeTC3CF8ZSjMEqGrHBPS0dTS8oY8ZKW7ABjFlJR5ww5b1rd83Fxwkf6luiaz
	qPM8Pt54bkjciW43PqhowBuSQacEqIqek5bTWiOuEAySNYP56U6vWbwbJ1TKLP/9RUUtQsyp0H4ey
	C7u4Sxuz5o+Qnjo3eoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDQl-009Vrm-0o;
	Mon, 03 Jul 2023 06:53:03 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDQh-009Vqo-2M
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 06:53:01 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51d9128494cso3630194a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jul 2023 23:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688367176; x=1690959176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVnaXplbKPJXEZ2wiNEToKb7XEKkfgoYbR2y25X8PVI=;
        b=VzflzDnTLPNOQmXJxd99X35fT7q/HR/QamcP6SrxBexExHNgsbOZsyhUeanxMgkLLn
         L/VtZLktB53Ed8yppJ0fFYWScy0Aj/qCc2yCXUG2iBeuMm/QnoCNosqVx5hcRLaINXQ+
         HqW7Fzg6DQrl4EiDtWTntrDjQZQcsuJr+h4kkvHeTeRE8woq+Fz3dwlky3Yeetn+edKK
         ep+HzMFbyP5/k+xDm1DFAYmUNJ/FJswnOHPquMfKSha2av2jSgD6F/uo+GUw9Al2fiab
         BqJ2wR2Gegkgq5Mxrth7KKykU7Rkw0byB8PgzGCA0u4H4skY9up14uq+QiJdKaZgqyq1
         J+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688367176; x=1690959176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVnaXplbKPJXEZ2wiNEToKb7XEKkfgoYbR2y25X8PVI=;
        b=YFWAZ+IetK+Wqfw0+GPjkzRvGQzwCilVzb5rsKa7xe8wXtcXKGpELAWXefzKETI+ln
         9GF0cKlH0my4KjHGLHW1HVokt1lu7/gayZ6msY/io42hR6Ucp+r1HGV49UayCiXc2Uig
         iZhRcwgnDhhZjKlCq60wwQQRw+HHep3gbyLFMqIJGHcOGnnNUQTAhhhZUwngL5OKy29F
         9Vwp5OxYjDJQJON8S3CoA/2mGJgDl1+K4frLMP2xKZOggQt/Ptnz7udBUgwGa4duEFgo
         N4gv5TkmCHxxR2r6en9wg3JQ4ORQKgJ7BSiKxhavqeG//e+HFfZUDNmHhHU61OwYBfDn
         PmJw==
X-Gm-Message-State: ABy/qLYGBc28VJzzUBO5kAtZ+7LbOcqq7OuhxXHwAvjSeAyEYaEarPc7
	1uyS1rxpW0gfNbpeK4LuihEu8QUILPn9roRYGK4=
X-Google-Smtp-Source: APBJJlH9Rx8BE+Ibb788/1pjQjhi6zODsNw7L2myu5MLbnUXY/Hw8WaffqWQhv9tRYXmFSR4j3+5TFUixrmCMQNLOII=
X-Received: by 2002:a05:6402:1a41:b0:51b:df14:594e with SMTP id
 bf1-20020a0564021a4100b0051bdf14594emr5868433edb.39.1688367176421; Sun, 02
 Jul 2023 23:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230517034510.15639-1-zegao@tencent.com> <20230517034510.15639-3-zegao@tencent.com>
 <CALOAHbC6UpfFOOibdDiC7xFc5YFUgZnk3MZ=3Ny6we=AcrNbew@mail.gmail.com>
In-Reply-To: <CALOAHbC6UpfFOOibdDiC7xFc5YFUgZnk3MZ=3Ny6we=AcrNbew@mail.gmail.com>
From: Ze Gao <zegao2021@gmail.com>
Date: Mon, 3 Jul 2023 14:52:45 +0800
Message-ID: <CAD8CoPCSAK_BM3WhJoeu7FCWqpnWpPpYwAEdSaewrZByRN2TOw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] fprobe: make fprobe_kprobe_handler recursion free
To: Yafang Shao <laoar.shao@gmail.com>
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
X-CRM114-CacheID: sfid-20230702_235259_767090_D251DE84 
X-CRM114-Status: GOOD (  30.78  )
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

SGksIHlhZmFuZy4KCllvdSdyZSByaWdodCwgaXQgc2hvdWxkIGRvIHRoZSB1bmxvY2sgYmVmb3Jl
IHJldHVybiBmb3IgdGhlIHNha2Ugb2YKc2FuaXR5LiAoUGxlYXNlCmlnbm9yZSB0aGUgbGFzdCBt
aXNsZWFkaW5nIHJlcGx5IDopCgpXaWxsIHNlbmQgYSBuZXcgcGF0Y2ggdG8gZml4IGl0LgoKVGhh
bmtzClplCgpPbiBXZWQsIEp1biAyOCwgMjAyMyBhdCAzOjE34oCvUE0gWWFmYW5nIFNoYW8gPGxh
b2FyLnNoYW9AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDE3LCAyMDIzIGF0IDEx
OjQ14oCvQU0gWmUgR2FvIDx6ZWdhbzIwMjFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBDdXJy
ZW50IGltcGxlbWVudGF0aW9uIGNhbGxzIGtwcm9iZSByZWxhdGVkIGZ1bmN0aW9ucyBiZWZvcmUg
ZG9pbmcKPiA+IGZ0cmFjZSByZWN1cnNpb24gY2hlY2sgaW4gZnByb2JlX2twcm9iZV9oYW5kbGVy
LCB3aGljaCBvcGVucyBkb29yCj4gPiB0byBrZXJuZWwgY3Jhc2ggZHVlIHRvIHN0YWNrIHJlY3Vy
c2lvbiBpZiBwcmVlbXB0X2NvdW50X3thZGQsIHN1Yn0KPiA+IGlzIHRyYWNlYWJsZSBpbiBrcHJv
YmVfYnVzeV97YmVnaW4sIGVuZH0uCj4gPgo+ID4gVGhpbmdzIGdvZXMgbGlrZSB0aGlzIHdpdGhv
dXQgdGhpcyBwYXRjaCBxdW90ZWQgZnJvbSBTdGV2ZW46Cj4gPiAiCj4gPiBmcHJvYmVfa3Byb2Jl
X2hhbmRsZXIoKSB7Cj4gPiAgICBrcHJvYmVfYnVzeV9iZWdpbigpIHsKPiA+ICAgICAgIHByZWVt
cHRfZGlzYWJsZSgpIHsKPiA+ICAgICAgICAgIHByZWVtcHRfY291bnRfYWRkKCkgeyAgPC0tIHRy
YWNlCj4gPiAgICAgICAgICAgICBmcHJvYmVfa3Byb2JlX2hhbmRsZXIoKSB7Cj4gPiAgICAgICAg
ICAgICAgICAgWyB3YXNoLCByaW5zZSwgcmVwZWF0LCBDUkFTSCEhISBdCj4gPiAiCj4gPgo+ID4g
QnkgcmVmYWN0b3JpbmcgdGhlIGNvbW1vbiBwYXJ0IG91dCBvZiBmcHJvYmVfa3Byb2JlX2hhbmRs
ZXIgYW5kCj4gPiBmcHJvYmVfaGFuZGxlciBhbmQgY2FsbCBmdHJhY2UgcmVjdXJzaW9uIGRldGVj
dGlvbiBhdCB0aGUgdmVyeSBiZWdpbm5pbmcsCj4gPiB0aGUgd2hvbGUgZnByb2JlX2twcm9iZV9o
YW5kbGVyIGlzIGZyZWUgZnJvbSByZWN1cnNpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWmUg
R2FvIDx6ZWdhb0B0ZW5jZW50LmNvbT4KPiA+IEFja2VkLWJ5OiBNYXNhbWkgSGlyYW1hdHN1IChH
b29nbGUpIDxtaGlyYW1hdEBrZXJuZWwub3JnPgo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtdHJhY2Uta2VybmVsLzIwMjMwNTE2MDcxODMwLjgxOTAtMy16ZWdhb0B0ZW5j
ZW50LmNvbQo+ID4gLS0tCj4gPiAga2VybmVsL3RyYWNlL2Zwcm9iZS5jIHwgNTkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
NCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEva2Vy
bmVsL3RyYWNlL2Zwcm9iZS5jIGIva2VybmVsL3RyYWNlL2Zwcm9iZS5jCj4gPiBpbmRleCA5YWJi
MzkwNWJjOGUuLjA5N2M3NDA3OTliYSAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC90cmFjZS9mcHJv
YmUuYwo+ID4gKysrIGIva2VybmVsL3RyYWNlL2Zwcm9iZS5jCj4gPiBAQCAtMjAsMzAgKzIwLDIy
IEBAIHN0cnVjdCBmcHJvYmVfcmV0aG9va19ub2RlIHsKPiA+ICAgICAgICAgY2hhciBkYXRhW107
Cj4gPiAgfTsKPiA+Cj4gPiAtc3RhdGljIHZvaWQgZnByb2JlX2hhbmRsZXIodW5zaWduZWQgbG9u
ZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZnRyYWNlX29wcyAqb3BzLCBzdHJ1Y3QgZnRyYWNlX3JlZ3MgKmZyZWdzKQo+
ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX2Zwcm9iZV9oYW5kbGVyKHVuc2lnbmVkIGxvbmcgaXAs
IHVuc2lnbmVkIGxvbmcKPiA+ICsgICAgICAgICAgICAgICBwYXJlbnRfaXAsIHN0cnVjdCBmdHJh
Y2Vfb3BzICpvcHMsIHN0cnVjdCBmdHJhY2VfcmVncyAqZnJlZ3MpCj4gPiAgewo+ID4gICAgICAg
ICBzdHJ1Y3QgZnByb2JlX3JldGhvb2tfbm9kZSAqZnByOwo+ID4gICAgICAgICBzdHJ1Y3QgcmV0
aG9va19ub2RlICpyaCA9IE5VTEw7Cj4gPiAgICAgICAgIHN0cnVjdCBmcHJvYmUgKmZwOwo+ID4g
ICAgICAgICB2b2lkICplbnRyeV9kYXRhID0gTlVMTDsKPiA+IC0gICAgICAgaW50IGJpdCwgcmV0
Owo+ID4gKyAgICAgICBpbnQgcmV0Owo+ID4KPiA+ICAgICAgICAgZnAgPSBjb250YWluZXJfb2Yo
b3BzLCBzdHJ1Y3QgZnByb2JlLCBvcHMpOwo+ID4gLSAgICAgICBpZiAoZnByb2JlX2Rpc2FibGVk
KGZwKSkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm47Cj4gPiAtCj4gPiAtICAgICAgIGJpdCA9
IGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKGlwLCBwYXJlbnRfaXApOwo+ID4gLSAgICAg
ICBpZiAoYml0IDwgMCkgewo+ID4gLSAgICAgICAgICAgICAgIGZwLT5ubWlzc2VkKys7Cj4gPiAt
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gLSAgICAgICB9Cj4gPgo+ID4gICAgICAgICBpZiAo
ZnAtPmV4aXRfaGFuZGxlcikgewo+ID4gICAgICAgICAgICAgICAgIHJoID0gcmV0aG9va190cnlf
Z2V0KGZwLT5yZXRob29rKTsKPiA+ICAgICAgICAgICAgICAgICBpZiAoIXJoKSB7Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBmcC0+bm1pc3NlZCsrOwo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBvdXQ7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gPiAg
ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICAgIGZwciA9IGNvbnRhaW5lcl9vZihy
aCwgc3RydWN0IGZwcm9iZV9yZXRob29rX25vZGUsIG5vZGUpOwo+ID4gICAgICAgICAgICAgICAg
IGZwci0+ZW50cnlfaXAgPSBpcDsKPiA+IEBAIC02MSwyMyArNTMsNjAgQEAgc3RhdGljIHZvaWQg
ZnByb2JlX2hhbmRsZXIodW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAs
Cj4gPiAgICAgICAgICAgICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
aG9va19ob29rKHJoLCBmdHJhY2VfZ2V0X3JlZ3MoZnJlZ3MpLCB0cnVlKTsKPiA+ICAgICAgICAg
fQo+ID4gLW91dDoKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgZnByb2JlX2hhbmRsZXIo
dW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCj4gPiArICAgICAgICAg
ICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wcywgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncykK
PiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBmcHJvYmUgKmZwOwo+ID4gKyAgICAgICBpbnQgYml0
Owo+ID4gKwo+ID4gKyAgICAgICBmcCA9IGNvbnRhaW5lcl9vZihvcHMsIHN0cnVjdCBmcHJvYmUs
IG9wcyk7Cj4gPiArICAgICAgIGlmIChmcHJvYmVfZGlzYWJsZWQoZnApKQo+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybjsKPiA+ICsKPiA+ICsgICAgICAgLyogcmVjdXJzaW9uIGRldGVjdGlvbiBo
YXMgdG8gZ28gYmVmb3JlIGFueSB0cmFjZWFibGUgZnVuY3Rpb24gYW5kCj4gPiArICAgICAgICAq
IGFsbCBmdW5jdGlvbnMgYmVmb3JlIHRoaXMgcG9pbnQgc2hvdWxkIGJlIG1hcmtlZCBhcyBub3Ry
YWNlCj4gPiArICAgICAgICAqLwo+ID4gKyAgICAgICBiaXQgPSBmdHJhY2VfdGVzdF9yZWN1cnNp
b25fdHJ5bG9jayhpcCwgcGFyZW50X2lwKTsKPiA+ICsgICAgICAgaWYgKGJpdCA8IDApIHsKPiA+
ICsgICAgICAgICAgICAgICBmcC0+bm1pc3NlZCsrOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
bjsKPiA+ICsgICAgICAgfQo+ID4gKyAgICAgICBfX2Zwcm9iZV9oYW5kbGVyKGlwLCBwYXJlbnRf
aXAsIG9wcywgZnJlZ3MpOwo+ID4gICAgICAgICBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdW5sb2Nr
KGJpdCk7Cj4gPiArCj4gPiAgfQo+ID4gIE5PS1BST0JFX1NZTUJPTChmcHJvYmVfaGFuZGxlcik7
Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGZwcm9iZV9rcHJvYmVfaGFuZGxlcih1bnNpZ25lZCBsb25n
IGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgZnRyYWNlX29wcyAqb3BzLCBzdHJ1Y3QgZnRyYWNlX3JlZ3MgKmZy
ZWdzKQo+ID4gIHsKPiA+IC0gICAgICAgc3RydWN0IGZwcm9iZSAqZnAgPSBjb250YWluZXJfb2Yo
b3BzLCBzdHJ1Y3QgZnByb2JlLCBvcHMpOwo+ID4gKyAgICAgICBzdHJ1Y3QgZnByb2JlICpmcDsK
PiA+ICsgICAgICAgaW50IGJpdDsKPiA+ICsKPiA+ICsgICAgICAgZnAgPSBjb250YWluZXJfb2Yo
b3BzLCBzdHJ1Y3QgZnByb2JlLCBvcHMpOwo+ID4gKyAgICAgICBpZiAoZnByb2JlX2Rpc2FibGVk
KGZwKSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gPiArCj4gPiArICAgICAgIC8qIHJl
Y3Vyc2lvbiBkZXRlY3Rpb24gaGFzIHRvIGdvIGJlZm9yZSBhbnkgdHJhY2VhYmxlIGZ1bmN0aW9u
IGFuZAo+ID4gKyAgICAgICAgKiBhbGwgZnVuY3Rpb25zIGNhbGxlZCBiZWZvcmUgdGhpcyBwb2lu
dCBzaG91bGQgYmUgbWFya2VkIGFzIG5vdHJhY2UKPiA+ICsgICAgICAgICovCj4gPiArICAgICAg
IGJpdCA9IGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKGlwLCBwYXJlbnRfaXApOwo+ID4g
KyAgICAgICBpZiAoYml0IDwgMCkgewo+ID4gKyAgICAgICAgICAgICAgIGZwLT5ubWlzc2VkKys7
Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgICB9Cj4gPgo+ID4gICAgICAg
ICBpZiAodW5saWtlbHkoa3Byb2JlX3J1bm5pbmcoKSkpIHsKPiA+ICAgICAgICAgICAgICAgICBm
cC0+bm1pc3NlZCsrOwo+Cj4gSSBoYXZlIGp1c3QgbG9va2VkIHRocm91Z2ggdGhpcyBwYXRjaHNl
dCwganVzdCBvdXQgb2YgY3VyaW9zaXR5LAo+IHNob3VsZG4ndCB3ZSBjYWxsIGZ0cmFjZV90ZXN0
X3JlY3Vyc2lvbl91bmxvY2soYml0KSBoZXJlID8KPiBXZSBoYXZlIGFscmVhZHkgbG9ja2VkIGl0
IHN1Y2Nlc3NmdWxseSwgc28gd2h5IHNob3VsZCB3ZSBub3QgdW5sb2NrIGl0Pwo+Cj4gPiAgICAg
ICAgICAgICAgICAgcmV0dXJuOwo+ID4gICAgICAgICB9Cj4gPiArCj4gPiAgICAgICAgIGtwcm9i
ZV9idXN5X2JlZ2luKCk7Cj4gPiAtICAgICAgIGZwcm9iZV9oYW5kbGVyKGlwLCBwYXJlbnRfaXAs
IG9wcywgZnJlZ3MpOwo+ID4gKyAgICAgICBfX2Zwcm9iZV9oYW5kbGVyKGlwLCBwYXJlbnRfaXAs
IG9wcywgZnJlZ3MpOwo+ID4gICAgICAgICBrcHJvYmVfYnVzeV9lbmQoKTsKPiA+ICsgICAgICAg
ZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3VubG9jayhiaXQpOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGlj
IHZvaWQgZnByb2JlX2V4aXRfaGFuZGxlcihzdHJ1Y3QgcmV0aG9va19ub2RlICpyaCwgdm9pZCAq
ZGF0YSwKPiA+IC0tCj4gPiAyLjQwLjEKPiA+Cj4gPgo+Cj4KPiAtLQo+IFJlZ2FyZHMKPiBZYWZh
bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
