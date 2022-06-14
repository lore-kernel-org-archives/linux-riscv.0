Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCA4C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCm9SHWvJjR7011GBsTgCVUQk0ZZfrtgOTLAwPlickw=; b=CYHuRaZpK2d/HD
	mbhDbogvvhpmeWjAqt9j2Yr8buQUZIbJjM/aDhgIHAF+fNMI5CMqoI3+k2iQZXRZ7AcLIbJ2TubN6
	4HKUnYm4hZlRoUNu6pL9akSV1pmku/DW9zM+IbC12pOuYPDFhiMM1CT0FMEGzeCxDBXgGUz7RfYuZ
	m9iPv3gckIulXW8zHWwPlplmkxivz9TpzxJR/WPqTbkH6r2C3rel0O+uOIyjgSaeeG9X2fSB1k4rh
	aWPQpCpqk1YT8BmnZUWK8Qv5gFCRTaFvWtb1DnaPp9O5j+T+OV1p26gbNy5Nh3JNzw0AkAd9fGo7E
	RipJyVCxgjvM17Iv2Fmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13ar-008yQ9-Jm; Tue, 14 Jun 2022 10:16:17 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13ao-008yLh-2E
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 10:16:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id i64so8168300pfc.8
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jun 2022 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oTkAGNxSsgwh181G3BLhMwBAv+cbui9P3idq5VmFQGM=;
        b=ES5ej2rgDrlGH8dRgEjHP3Ajh/fz1iwNUYmmemjcYKpXO5XFU3DOL8sS1zPlM1JWD/
         M+AG88HYuxLOm3X17LYS9mjsPMlJKZE+3tCTtPc3aVA6rQC9mnqtrYZn1mjKhS1jIiC1
         i2ubhSGZ2bkD0h9vsRgzr6ggfg6ObI4/+QEiwNpy+ppHhkuWjtSty78AUbV3gbYV9X5a
         u1Vy/dCrbAVGNRUFXaA+ogcXdsbYy8eQF5ucglzPhsvc+B0XbjqkGjCOofQk3ZMsLIsc
         QAOB29EOmUKzaJ41u+2tFlZT5SkJuuhic2htcM80Q8Q2owjvblFxtZR/LREicRdjDm9M
         UJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oTkAGNxSsgwh181G3BLhMwBAv+cbui9P3idq5VmFQGM=;
        b=AIbMakxkvf6/Yxysu858GyimnTp2dZBPzpI7qfOmeNFWlUat76R7ptO131CHy5VNVm
         Znx4nXZ29r3O8R6Bd0jD6ZjvQ3B7mHHif5WQfpJF22FUrqz7v/iTsTHbOk3S0Jz+YJCd
         2mPhwSgFY08TWmtd+pMuolbYO7bWA+DQpYGU/HlKOKycO6BS21jLnPeWJlUUtHlK6syX
         CtDTeicvt8ZAsvvkdgPduyTqioIJD9x7+aZjjgsEWR73+GlKH4wTB1Yv5Ud6mH1kCW8L
         /FohWF/SfieE7DxvoOVWJzfHrLAj2v7xdKnGNX2nZFyKdZ9d+9fBbb1/xk5Gin5h/vKg
         4hQw==
X-Gm-Message-State: AJIora8VNycdrpnm3kpnPZlyZQwfp+lGJJRW1r6FjelGEouict58Tr08
	i3OPqbsO2pCZ6EfXGV/kQ/fvHg==
X-Google-Smtp-Source: AGRyM1t2q5DkfR+x8hOBD7VS8Mfd6S1lbkh60IoJKjXPNhpv6TAtDjhd1eKRVbE6QRwjKL/3vmHhoQ==
X-Received: by 2002:a05:6a00:cca:b0:51b:ed40:b08a with SMTP id b10-20020a056a000cca00b0051bed40b08amr3668131pfv.19.1655201768714;
        Tue, 14 Jun 2022 03:16:08 -0700 (PDT)
Received: from sunil-laptop ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id y1-20020a056a001c8100b0051b97714703sm7022842pfw.187.2022.06.14.03.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 03:16:08 -0700 (PDT)
Date: Tue, 14 Jun 2022 15:46:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?utf-8?B?Sm/Do28gTcOhcmlv?= Domingos <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM PMU PROFILING AND DEBUGGING" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] RISC-V: Create unique identification for SoC PMU
Message-ID: <20220614101600.GA53270@sunil-laptop>
References: <20220607131648.29439-1-nikita.shubin@maquefel.me>
 <20220607131648.29439-2-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607131648.29439-2-nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_031614_167397_1E063A4E 
X-CRM114-Status: GOOD (  25.97  )
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

SGkgTmlraXRhLAoKT24gVHVlLCBKdW4gMDcsIDIwMjIgYXQgMDQ6MTY6NDRQTSArMDMwMCwgTmlr
aXRhIFNodWJpbiB3cm90ZToKPiBGcm9tOiBKb8OjbyBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFy
aW9AdGVjbmljby51bGlzYm9hLnB0Pgo+IAo+IFRoZSBTQkkgUE1VIHBsYXRmb3JtIGRyaXZlciBk
aWQgbm90IHByb3ZpZGUgYW55IGlkZW50aWZpY2F0aW9uIGZvcgo+IHBlcmYgZXZlbnRzIG1hdGNo
aW5nLiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBuZXcgc3lzZnMgZmlsZSBpbnNpZGUgdGhlCj4g
cGxhdGZvcm0gZGV2aWNlIChzb2M6cG11L2lkKSBmb3IgcG11IGlkZW50aWZpY2F0aW9uLgo+IAo+
IFRoZSBpZGVudGlmaWNhdGlvbiBpcyBhIDY0LWJpdCB2YWx1ZSBnZW5lcmF0ZWQgYXM6Cj4gWzYz
LTMyXTogbXZlbmRvcmlkOwo+IFszMV06IG1hcmNoaWRbTVNCXTsKPiBbMzAtMTZdOiBtYXJjaGlk
WzE1LTBdOwo+IFsxNS0wXTogbWltcGlkWzE1TVNCc107Cj4gCj4gVGhlIENTUnMgYXJlIGRldGFp
bGVkIGluIHRoZSBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjIFsxXS4KPiBUaGUgbWFyY2hpZCBpcyBz
cGxpdCBpbiBNU0IgKyAxNUxTQnMsIGR1ZSB0byB0aGUgTVNCIGJlaW5nIHVzZWQgZm9yCj4gb3Bl
bi1zb3VyY2UgYXJjaGl0ZWN0dXJlIGlkZW50aWZpY2F0aW9uLgo+IAo+IFsxXSBodHRwczovL2dp
dGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1hbnVhbAo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvw6Nv
IE3DoXJpbyBEb21pbmdvcyA8am9hby5tYXJpb0B0ZWNuaWNvLnVsaXNib2EucHQ+Cj4gVGVzdGVk
LWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva2VybmVsL3NiaS5jICAgICAgfCAgMyArKysKPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVz
IGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+IGluZGV4IDc3NWQzMzIyYjQy
Mi4uNTBkZDliNmVjYzllIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiBAQCAtNjI3LDE2ICs2MjcsMTkgQEAgbG9u
ZyBzYmlfZ2V0X212ZW5kb3JpZCh2b2lkKQo+ICB7Cj4gIAlyZXR1cm4gX19zYmlfYmFzZV9lY2Fs
bChTQklfRVhUX0JBU0VfR0VUX01WRU5ET1JJRCk7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTChzYmlf
Z2V0X212ZW5kb3JpZCk7Cj4gIAo+ICBsb25nIHNiaV9nZXRfbWFyY2hpZCh2b2lkKQo+ICB7Cj4g
IAlyZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VUX01BUkNISUQpOwo+ICB9
Cj4gK0VYUE9SVF9TWU1CT0woc2JpX2dldF9tYXJjaGlkKTsKPiAgCj4gIGxvbmcgc2JpX2dldF9t
aW1waWQodm9pZCkKPiAgewo+ICAJcmV0dXJuIF9fc2JpX2Jhc2VfZWNhbGwoU0JJX0VYVF9CQVNF
X0dFVF9NSU1QSUQpOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0woc2JpX2dldF9taW1waWQpOwo+ICAK
PiAgc3RhdGljIHZvaWQgc2JpX3NlbmRfY3B1bWFza19pcGkoY29uc3Qgc3RydWN0IGNwdW1hc2sg
KnRhcmdldCkKPiAgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5j
IGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IGluZGV4IGExMzE3YTQ4MzUxMi4uMTVh
YjNkYzY4ZTdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiAr
KysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAgLTY5Myw2ICs2OTMsNDYgQEAg
c3RhdGljIGludCBwbXVfc2JpX3NldHVwX2lycXMoc3RydWN0IHJpc2N2X3BtdSAqcG11LCBzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGUKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMg
dWludDY0X3QgcG11X3NiaV9nZXRfcG11X2lkKHZvaWQpCj4gK3sKPiArCXVuaW9uIHNiaV9wbXVf
aWQgewo+ICsJCXVpbnQ2NF90IHZhbHVlOwo+ICsJCXN0cnVjdCB7Cj4gKwkJCXVpbnQxNl90IGlt
cDoxNjsKPiArCQkJdWludDE2X3QgYXJjaDoxNjsKPiArCQkJdWludDMyX3QgdmVuZG9yOjMyOwo+
ICsJCX07Cj4gKwl9IHBtdWlkOwo+ICsKPiArCXBtdWlkLnZhbHVlID0gMDsKPiArCXBtdWlkLnZl
bmRvciA9ICh1aW50MzJfdCkgc2JpX2dldF9tdmVuZG9yaWQoKTsKPiArCXBtdWlkLmFyY2ggPSAo
c2JpX2dldF9tYXJjaGlkKCkgPj4gKDYzIC0gMTUpICYgKDEgPDwgMTUpKSB8IChzYmlfZ2V0X21h
cmNoaWQoKSAmIDB4N0ZGRik7CgpUaGlzIHN0YXRlbWVudCBnZW5lcmF0ZXMgYmVsb3cgd2Fybmlu
ZyBpbiBydjMyIGJ1aWxkLgoKZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYzogSW4gZnVuY3Rp
b24gJ3BtdV9zYmlfZ2V0X3BtdV9pZCc6CiBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jOjcx
NTo0MTogd2FybmluZzogcmlnaHQgc2hpZnQgY291bnQgPj0KIHdpZHRoIG9mIHR5cGUgWy1Xc2hp
ZnQtY291bnQtb3ZlcmZsb3ddCiAgNzE1IHwgICAgICAgIHBtdWlkLmFyY2ggPSAoc2JpX2dldF9t
YXJjaGlkKCkgPj4gKDYzIC0gMTUpICYgKDEgPDwgMTUpKQogIHwgKHNiaV9nZXRfbWFyY2hpZCgp
ICYgMHg3RkZGKTsKICAgICAKClBsZWFzZSB0YWtlIGNhcmUgb2YgdGhpcyB3aGVuIHlvdSByZXdv
cmsgdGhpcyBwYXRjaC4KClRoYW5rcwpTdW5pbAoKPiArCXBtdWlkLmltcCA9IChzYmlfZ2V0X21p
bXBpZCgpID4+IDE2KTsKPiArCj4gKwlyZXR1cm4gcG11aWQudmFsdWU7Cj4gK30KPiArCj4gK3N0
YXRpYyBzc2l6ZV90IHBtdV9zYmlfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJc3Ry
dWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKPiArewo+ICsJaW50IGxlbjsK
PiArCj4gKwlsZW4gPSBzcHJpbnRmKGJ1ZiwgIjB4JWxseFxuIiwgcG11X3NiaV9nZXRfcG11X2lk
KCkpOwo+ICsJaWYgKGxlbiA8PSAwKQo+ICsJCWRldl9lcnIoZGV2LCAibXlkcnY6IEludmFsaWQg
c3ByaW50ZiBsZW46ICVkbiIsIGxlbik7Cj4gKwo+ICsJcmV0dXJuIGxlbjsKPiArfQo+ICsKPiAr
c3RhdGljIERFVklDRV9BVFRSKGlkLCBTX0lSVUdPIHwgU19JV1VTUiwgcG11X3NiaV9pZF9zaG93
LCAwKTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpwbXVfc2JpX2F0dHJzW10gPSB7
Cj4gKwkmZGV2X2F0dHJfaWQuYXR0ciwKPiArCU5VTEwKPiArfTsKPiArCj4gK0FUVFJJQlVURV9H
Uk9VUFMocG11X3NiaSk7Cj4gKwo+ICBzdGF0aWMgaW50IHBtdV9zYmlfZGV2aWNlX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVjdCByaXNjdl9wbXUgKnBt
dSA9IE5VTEw7Cj4gQEAgLTcyOSw2ICs3NjksMTMgQEAgc3RhdGljIGludCBwbXVfc2JpX2Rldmlj
ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJcG11LT5jdHJfY2xlYXJf
aWR4ID0gcG11X3NiaV9jdHJfY2xlYXJfaWR4Owo+ICAJcG11LT5jdHJfcmVhZCA9IHBtdV9zYmlf
Y3RyX3JlYWQ7Cj4gIAo+ICsJcmV0ID0gc3lzZnNfY3JlYXRlX2dyb3VwKCZwZGV2LT5kZXYua29i
aiwgJnBtdV9zYmlfZ3JvdXApOwo+ICsJaWYgKHJldCkgewo+ICsJCWRldl9lcnIoJnBkZXYtPmRl
diwgInN5c2ZzIGNyZWF0aW9uIGZhaWxlZFxuIik7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiAr
CXBkZXYtPmRldi5ncm91cHMgPSBwbXVfc2JpX2dyb3VwczsKPiArCj4gIAlyZXQgPSBjcHVocF9z
dGF0ZV9hZGRfaW5zdGFuY2UoQ1BVSFBfQVBfUEVSRl9SSVNDVl9TVEFSVElORywgJnBtdS0+bm9k
ZSk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gLS0gCj4gMi4zNS4xCj4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
