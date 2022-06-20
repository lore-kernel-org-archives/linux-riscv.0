Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70058C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 19:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6e+BPcdJ5/i7fwazTCfKnQEFbSQdJ74LJakuwlaus+w=; b=KRay9ZKjKTVWbO
	uznRsZQ08pWOhYKX05efXKL4xjMfA1m4yx12gynp08wIOgTtlL22B06lNB6pJ2pu4Nc6bAwNSHFGZ
	0L15/qkfsfph9R2iG6Ov7784JhiWOoLHZN9/nkcR+cz3tc0RZG1Yj65L80Km93Iv50pDuoycHodBE
	qLTP3QnoLnniy32U6g9mFYL62V39rucF9kcw2Tl6TFuFslKCkV38GoiL/KYHj4yyVlWaAZANIxBPJ
	fmmVZN7jrpEFHb/47gbR4R4TW4PCOxWHHcHskRM+O0SLI+x8aPF7AedkmgHOX7TnG0i7QKXdLz9Iq
	vqV3FpHW22dwOdfBEBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3NGP-0021lf-FL; Mon, 20 Jun 2022 19:40:45 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3NGD-0021if-Tw
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 19:40:35 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id l11so20719064ybu.13
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MF9w10rX2iwd2h9iSBKKxPfiedtUNAOz+4kVUvfb89E=;
        b=GG1JkThoq/+mdEhocGlISJpVEjHwAeMStlF2BWci9LDLNiYtOlkacsBNZIpZecrjsh
         fdXdX+wm2DII0sQ2l84LTw9a/+ECRVwrXXQMYmTPPX4YFQciutNx+K6WKcrFhhntyfrc
         nVkj0ns8Zakha5fZW91ck71QyOYRNYgY4qVg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MF9w10rX2iwd2h9iSBKKxPfiedtUNAOz+4kVUvfb89E=;
        b=ofZn9WvyaMjjTsXhkGt7mgp5Ed7/wIh/fBSujjuCJD2WnAjKZqYzn40BnN4vwQ9DPb
         A5HgptoELo1uWry9Xc26S9Nlc8lPnT0VqZIdqD5+fmz4ibMUyA/q+5ABRMH+dlAru93M
         bTqthNAZjB+F444UpEqQPDJqOhAyE0rE3bk2PI4VpXgNUADzSgSIpZxGO+8AI/Zj+W7o
         XnSjYbVrqw9iew37MgS1HVX4ld3o60f23ph6iFRjrwy6Et6sFZeHjZ7rwo3g2npLrB64
         gy85KsxtiszRVqUuQaurDFn8cxnM/h9GTwPHjxfydoMG9cX7nStZaVHCqnnEPgZG1j5D
         dBQw==
X-Gm-Message-State: AJIora9BMLXw01xRRYVcRNRK196REyz+7SozAUaSZ7P4aGd6OR6huI/N
	tLATSf15djVTg4hLcdcdmn0qM4sgvbseauSM0+MdTxKcsjy8
X-Google-Smtp-Source: AGRyM1vHKyKvtBgGAkqodprREujJq6noPO8phYFn9Ku3wdUySOubjCEpjD6+RZIwfTH5ngx3N8ua9ZZ8yggE0FO1wYY=
X-Received: by 2002:a25:2612:0:b0:664:b1e1:3774 with SMTP id
 m18-20020a252612000000b00664b1e13774mr26937447ybm.228.1655754031926; Mon, 20
 Jun 2022 12:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220619111115.6354-1-nikita.shubin@maquefel.me>
 <20220619111115.6354-2-nikita.shubin@maquefel.me> <CAK9=C2X4TTCEjZya4wz-W6ndBaxzUpLBtzQAGJ4zphVM8NSgdg@mail.gmail.com>
 <20220620174006.1c86a456@redslave.neermore.group>
In-Reply-To: <20220620174006.1c86a456@redslave.neermore.group>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 20 Jun 2022 12:40:20 -0700
Message-ID: <CAOnJCU+7_z1WN_Z6frQcUwzztVL4itbPSfmLUa_7Ob5xCtLo+Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] RISC-V: Create unique identification for SoC PMU
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Anup Patel <apatel@ventanamicro.com>, Will Deacon <will@kernel.org>, 
	Sunil V L <sunilvl@ventanamicro.com>, 
	=?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>, 
	linux <linux@yadro.com>, Nikita Shubin <n.shubin@yadro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_124034_188333_8CC88DC7 
X-CRM114-Status: GOOD (  33.54  )
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

T24gTW9uLCBKdW4gMjAsIDIwMjIgYXQgNzo0MCBBTSBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1
YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPgo+IE9uIE1vbiwgMjAgSnVuIDIwMjIgMTc6MzA6NTgg
KzA1MzAKPiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiA+
IE9uIFN1biwgSnVuIDE5LCAyMDIyIGF0IDQ6NDEgUE0gTmlraXRhIFNodWJpbgo+ID4gPG5pa2l0
YS5zaHViaW5AbWFxdWVmZWwubWU+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBOaWtpdGEgU2h1
YmluIDxuLnNodWJpbkB5YWRyby5jb20+Cj4gPiA+Cj4gPiA+IFByb3ZpZGUgUklTQy1WIFNCSSBQ
TVUgaWQgdG8gZGlzdGluZ3Vpc2ggZGlmZmVyZW50IGNvcmVzIG9yIFNvQ3MgdmlhCj4gPiA+ICJk
ZXZpY2VzL3BsYXRmb3JtL3Jpc2N2LXBtdS9pZCIgc3lzZnMgZW50cnkuCj4gPiA+Cj4gPiA+IFRo
ZSBpZGVudGlmaWNhdGlvbiBpcyBnZW5lcmF0ZWQgYXMgc3RyaW5nIG9mIG1hcmNoaWQsIG1pbXBp
ZCwKPiA+ID4gbXZlbmRvcmlkIGluIGhleCBmb3JtYXQgc2VwYXJhdGVkIGJ5IGNvbWEgLSAiMHg3
MDAzMiwweDcwMDMyLDB4MCIuCj4gPiA+Cj4gPiA+IFRoZSBDU1JzIGFyZSBkZXRhaWxlZCBpbiB0
aGUgUklTQy1WIHByaXZpbGVnZWQgc3BlYyBbMV0uCj4gPiA+IFsxXSBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3YtaXNhLW1hbnVhbAo+ID4gPgo+ID4gPiBJbnNwaXJlZC1ieTogSm/Do28g
TcOhcmlvIERvbWluZ29zIDxqb2FvLm1hcmlvQHRlY25pY28udWxpc2JvYS5wdD4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgo+ID4KPiA+IFRo
ZSBtdmVuZG9yaWQsIG1hcmNoaWQsIGFuZCBtaW1waWQgY2FuIGJlIHVzZWZ1bCB0byBhcHBzIG90
aGVyIHRoYW4KPiA+IHBlcmYgdG9vbC4KPiA+Cj4gPiBJIGhhdmUgdHJpZWQgdG8gZXh0ZW5kIC9w
cm9jL2NwdWluZm8gd2l0aCB0aGlzIGluZm9ybWF0aW9uIHdoaWNoIGNhbgo+ID4gYmUgcGFyc2Vk
IGJ5IHBlcmYgdG9vbDoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDYyMDEx
NTU0OS4xNTI5NTk3LTEtYXBhdGVsQHZlbnRhbmFtaWNyby5jb20vCj4KPiBBdGlzaCwgd2hhdCBk
byB5b3UgdGhpbmsgYWJvdXQgdGhpcyA/Cj4KPiBSSVNDLVYgcGVyZiBjYW4gcmVseSBvbiAiL3By
b2MvY3B1aW5mbyIsIGluIHNvbWUgc2ltaWxhciBtYW5uZXIgbGlrZQo+ICJ0b29scy9wZXJmL2Fy
Y2gvczM5MC91dGlsL2hlYWRlci5jIiBkb2VzLgo+CgpZZXMuIFdlIGNhbiBleHBvc2UgdGhlc2Ug
dGhyZWUgdmFsdWVzIGVpdGhlciBpbiBzeXNmcyBvciBwcm9jZnMgKC9wcm9jL2NwdWluZm8pLgpG
b3IgcGVyZiB0b29sLCBpdCBzaG91bGRuJ3QgbWF0dGVyIGFzIHRoZSBoZWFkZXIuYyB3aWxsIG5l
ZWQgdG8KZ2VuZXJhdGUgdGhlIHVuaXF1ZSBjcHVpZApzdHJpbmcgZnJvbSBlaXRoZXIuCgpJIGFt
IG5vdCBzdXJlIGlmIGFueSBvdGhlciB1c2Vyc3BhY2UgdG9vbCBwcmVmZXJzIHRvIHBhcnNlIHN5
c2ZzCmluc3RlYWQgb2YgY3B1aW5mby4KCj4gQ2FuIGl0IGNyZWF0ZSBwcm9ibGVtcyB3aXRoIHBt
dSBpZGVudGlmaWNhdGlvbiBpbiBjYXNlIG9mIGhldGVyZ2Vub3VzCj4gaGFydHMgPwo+CgpEb2Vz
IHBlcmYgc3VwcG9ydCBoZXRlcmdlbm91cyBoYXJ0cyBhdCBhbGwgPyBBUk02NCBjb2RlCih0b29s
L3BlcmYvYXJjaC9hcm02NC91dGlsL2hlYWRlci5jKQpqdXN0IGJyZWFrcyBvdXQgb2YgdGhlIGxv
b3AgYWZ0ZXIgZmluZGluZyB0aGUgZmlyc3QgTUlEUi4KCj4gPgo+ID4gUmVnYXJkcywKPiA+IEFu
dXAKPiA+Cj4gPiA+IC0tLQo+ID4gPiB2My0+djQ6Cj4gPiA+IC0gdXNlIHN0cmluZyBmb3IgcG11
aWQKPiA+ID4gLSByZW5hbWUgcG11X3NiaV9pZF9zaG93IHRvIGlkX3Nob3cKPiA+ID4gLSBmaXgg
ZXJyb3IgcHJpbnQgbWVzc2FnZSBpbiBpZF9zaG93Cj4gPiA+IC0gZml4IERFVklDRV9BVFRSIHRv
IHVzZSBvY3RhbCBwZXJtaXNzaW9ucwo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVs
L3NiaS5jICAgICAgICB8ICAzICsrKwo+ID4gPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
YyAgIHwgNDEKPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyBpbmNsdWRl
L2xpbnV4L3BlcmYvcmlzY3ZfcG11LmggfAo+ID4gPiAgMSArIDMgZmlsZXMgY2hhbmdlZCwgNDUg
aW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+ID4gPiBpbmRleCA3NzVkMzMyMmI0MjIu
LjUwZGQ5YjZlY2M5ZSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiA+ID4gQEAgLTYyNywxNiArNjI3
LDE5IEBAIGxvbmcgc2JpX2dldF9tdmVuZG9yaWQodm9pZCkKPiA+ID4gIHsKPiA+ID4gICAgICAg
ICByZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VUX01WRU5ET1JJRCk7Cj4g
PiA+ICB9Cj4gPiA+ICtFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbXZlbmRvcmlkKTsKPiA+ID4KPiA+
ID4gIGxvbmcgc2JpX2dldF9tYXJjaGlkKHZvaWQpCj4gPiA+ICB7Cj4gPiA+ICAgICAgICAgcmV0
dXJuIF9fc2JpX2Jhc2VfZWNhbGwoU0JJX0VYVF9CQVNFX0dFVF9NQVJDSElEKTsKPiA+ID4gIH0K
PiA+ID4gK0VYUE9SVF9TWU1CT0woc2JpX2dldF9tYXJjaGlkKTsKPiA+ID4KPiA+ID4gIGxvbmcg
c2JpX2dldF9taW1waWQodm9pZCkKPiA+ID4gIHsKPiA+ID4gICAgICAgICByZXR1cm4gX19zYmlf
YmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VUX01JTVBJRCk7Cj4gPiA+ICB9Cj4gPiA+ICtFWFBP
UlRfU1lNQk9MKHNiaV9nZXRfbWltcGlkKTsKPiA+ID4KPiA+ID4gIHN0YXRpYyB2b2lkIHNiaV9z
ZW5kX2NwdW1hc2tfaXBpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICp0YXJnZXQpCj4gPiA+ICB7Cj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiA+IGIvZHJp
dmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBpbmRleCBkY2EzNTM3YThkY2MuLmJlODEyZjg1NTYx
Nwo+ID4gPiAxMDA2NDQgLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gPiAr
KysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiA+IEBAIC02OTMsNiArNjkzLDI4
IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9zZXR1cF9pcnFzKHN0cnVjdCByaXNjdl9wbXUKPiA+ID4g
KnBtdSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRlIHJldHVybiAwOwo+ID4gPiAgfQo+ID4g
Pgo+ID4gPiArc3RhdGljIHNzaXplX3QgaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUg
KmF0dHIsIGNoYXIKPiA+ID4gKmJ1ZikgK3sKPiA+ID4gKyAgICAgICBpbnQgbGVuOwo+ID4gPiAr
ICAgICAgIHN0cnVjdCByaXNjdl9wbXUgKnBtdSA9IGNvbnRhaW5lcl9vZihkZXZfZ2V0X2RydmRh
dGEoZGV2KSwKPiA+ID4gc3RydWN0IHJpc2N2X3BtdSwgcG11KTsgKwo+ID4gPiArICAgICAgIGxl
biA9IHNwcmludGYoYnVmLCAiJXNcbiIsIHBtdS0+cG11aWQpOwo+ID4gPiArICAgICAgIGlmIChs
ZW4gPD0gMCkKPiA+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiaW52YWxpZCBzcHJp
bnRmIGxlbjogJWRcbiIsIGxlbik7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICByZXR1cm4gbGVuOwo+
ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgREVWSUNFX0FUVFIoaWQsIDA2NDQsIGlkX3No
b3csIE5VTEwpOwo+ID4gPiArCj4gPiA+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqcG11X3Ni
aV9hdHRyc1tdID0gewo+ID4gPiArICAgICAgICZkZXZfYXR0cl9pZC5hdHRyLAo+ID4gPiArICAg
ICAgIE5VTEwKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK0FUVFJJQlVURV9HUk9VUFMocG11X3Ni
aSk7Cj4gPiA+ICsKPiA+ID4gIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ID4gIHsKPiA+ID4gICAgICAgICBzdHJ1Y3Qgcmlz
Y3ZfcG11ICpwbXUgPSBOVUxMOwo+ID4gPiBAQCAtNzE0LDYgKzczNiwxNCBAQCBzdGF0aWMgaW50
IHBtdV9zYmlfZGV2aWNlX3Byb2JlKHN0cnVjdAo+ID4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
IGlmIChwbXVfc2JpX2dldF9jdHJpbmZvKG51bV9jb3VudGVycykpCj4gPiA+ICAgICAgICAgICAg
ICAgICBnb3RvIG91dF9mcmVlOwo+ID4gPgo+ID4gPiArICAgICAgIC8qIGZpbGwgcG11aWQgKi8K
PiA+ID4gKyAgICAgICBwbXUtPnBtdWlkID0ga2FzcHJpbnRmKEdGUF9LRVJORUwsICIweCVseCww
eCVseCwweCVseCIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfZ2V0
X21hcmNoaWQoKSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9nZXRf
bWltcGlkKCksCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfZ2V0X212
ZW5kb3JpZCgpKTsKPiA+ID4gKyAgICAgICBpZiAoIXBtdS0+cG11aWQpCj4gPiA+ICsgICAgICAg
ICAgICAgICBnb3RvIG91dF9mcmVlX3BtdWlkOwo+ID4gPiArCj4gPiA+ICAgICAgICAgcmV0ID0g
cG11X3NiaV9zZXR1cF9pcnFzKHBtdSwgcGRldik7Cj4gPiA+ICAgICAgICAgaWYgKHJldCA8IDAp
IHsKPiA+ID4gICAgICAgICAgICAgICAgIHByX2luZm8oIlBlcmYgc2FtcGxpbmcvZmlsdGVyaW5n
IGlzIG5vdCBzdXBwb3J0ZWQKPiA+ID4gYXMgc3Njb2YgZXh0ZW5zaW9uIGlzIG5vdCBhdmFpbGFi
bGVcbiIpOyBAQCAtNzM5LDggKzc2OSwxOSBAQAo+ID4gPiBzdGF0aWMgaW50IHBtdV9zYmlfZGV2
aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+IHJldHVybiByZXQ7
IH0KPiA+ID4KPiA+ID4gKyAgICAgICByZXQgPSBzeXNmc19jcmVhdGVfZ3JvdXAoJnBkZXYtPmRl
di5rb2JqLCAmcG11X3NiaV9ncm91cCk7Cj4gPiA+ICsgICAgICAgaWYgKHJldCkgewo+ID4gPiAr
ICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAic3lzZnMgY3JlYXRpb24gZmFpbGVk
XG4iKTsKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ICsgICAgICAgfQo+
ID4gPiArCj4gPiA+ICsgICAgICAgcGRldi0+ZGV2Lmdyb3VwcyA9IHBtdV9zYmlfZ3JvdXBzOwo+
ID4gPiArICAgICAgIGRldl9zZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2LCBwbXUpOwo+ID4gPiArCj4g
PiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+Cj4gPiA+ICtvdXRfZnJlZV9wbXVpZDoKPiA+ID4g
KyAgICAgICBrZnJlZShwbXUtPnBtdWlkKTsKPiA+ID4gIG91dF9mcmVlOgo+ID4gPiAgICAgICAg
IGtmcmVlKHBtdSk7Cj4gPiA+ICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvcGVyZi9yaXNjdl9wbXUuaAo+ID4gPiBiL2luY2x1ZGUvbGludXgvcGVy
Zi9yaXNjdl9wbXUuaCBpbmRleCA0NmY5YjZmZTMwNmUuLmNmMzU1N2I3N2ZiOAo+ID4gPiAxMDA2
NDQgLS0tIGEvaW5jbHVkZS9saW51eC9wZXJmL3Jpc2N2X3BtdS5oCj4gPiA+ICsrKyBiL2luY2x1
ZGUvbGludXgvcGVyZi9yaXNjdl9wbXUuaAo+ID4gPiBAQCAtNDIsNiArNDIsNyBAQCBzdHJ1Y3Qg
Y3B1X2h3X2V2ZW50cyB7Cj4gPiA+ICBzdHJ1Y3QgcmlzY3ZfcG11IHsKPiA+ID4gICAgICAgICBz
dHJ1Y3QgcG11ICAgICAgcG11Owo+ID4gPiAgICAgICAgIGNoYXIgICAgICAgICAgICAqbmFtZTsK
PiA+ID4gKyAgICAgICBjaGFyICAgICAgICAgICAgKnBtdWlkOwo+ID4gPgo+ID4gPiAgICAgICAg
IGlycXJldHVybl90ICAgICAoKmhhbmRsZV9pcnEpKGludCBpcnFfbnVtLCB2b2lkICpkZXYpOwo+
ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjM1LjEKPiA+ID4KPgoKCi0tIApSZWdhcmRzLApBdGlzaAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
