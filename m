Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B090CC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UN0Xr5JyROjnSmfO0xnpQlf8XTqq/Am8YSc5VaN/WMo=; b=U9sWvsAjMgifcm
	zSmybPEx128YwipSPybhVtkYowxZTDnhuw4eaNBbQa6ySzXqUSOvfdZJvRaf5cKiTHdcAJ/Ff9N+R
	m66xvYl3c1RoPLWDxt029atX1IyaDVj+aQXLDPCptlV2TxgXhtVr27Ih6BKFCdLd2u1DRbdxv3cfi
	jj5RlkBW72FYzopuc8p6CtPlrtlDo47lboftyl+EXESAIDcsXVFc+zr3HlBdh4GP+QJcQdclMXi4P
	4XGNTzWPIRnYheUpOWoxajiMkCTnqjyya+yU+GGNNDO7MWBbt5yj53bW+piuhsuHWt0uywzbNqdyw
	1P6LMeOeLwGtFyY5jzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3G5s-000Dbv-5O; Mon, 20 Jun 2022 12:01:24 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3G5h-000DZZ-1Y
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 12:01:14 +0000
Received: by mail-lj1-x236.google.com with SMTP id s14so4908095ljs.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 05:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RELZ48tdINLiJ7oRIphqtUqBQp/m2ZnJE4ag9EyIEdE=;
        b=BpFXMUKsQnMnHAlcOEOWAA0qdjsO/jqf16/HCSanER80jjZi+mADHa+M3iAl9OdDzB
         PvCauCAcYEqe/PBMTW9Ru1vq6rB87hX62bNBJovb4K4OjxtGmZxHiOHgYJssjM0eilVI
         rgymKsD63jcjZJkJUxpOzlAoXaLzoYJ0e39M1ak+C8xCn1LURS2uwhPuxkKUNQ4ra2/l
         IYZ69G/G9Ho43O5VlDQvL2CgPU9FeRV7JBkoNUJX8KJvoQwQXRvwjx4mCnVNam3Z+czr
         zuqMCoPUfzMa+fO3kVTfKrFCSTRJIL97kYepOxyO0FEq0iNR2qMIUnCaq2xsI6/I2zHg
         C9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RELZ48tdINLiJ7oRIphqtUqBQp/m2ZnJE4ag9EyIEdE=;
        b=269I4wXzGispokjJ8am7WXHP6+5M13Y9QFLs6efxq8gPeiK6AkA7UH/82YUgW7JWtE
         rOTz2JtqdJq18xB8G+TCwhzSDz/87KQSr0equKxg20GaQUcgbbqQbYlKiL6qSeKSnETm
         8bOpLSWM1JsW1vwc3pvvdXnHUj9OUTaVeMg8dMByt7esOV4B/jIxkPl4ME/xMKJez+O1
         Q5u9+xxxYD8aIz6Oh6Y8THcVVRdbCsfpX9krJsMsBHb5OfcKm1Ou66niEYeODglOze3A
         L/KOA6C5Z47S0ljTWoGcfkq2gKJZYsjpFrPwQOM9MfSHrH3pLTCg8Ml7IBmjjFE8rqW2
         me/Q==
X-Gm-Message-State: AJIora+z6NU+5McU/A5IK9UHGlHE1siStYOmx3H1GCs/YD2nhqh1JXrj
	V8RMqlNJLopRPtw5Q3xBl+X7qokXmxBz+0qViaBUTw==
X-Google-Smtp-Source: AGRyM1t3kCfZUBu+7Zyuh/+Yx/Ni2dDy8M8FTpyJHfVBAHZt9He9PnoI3iyDCjZ4HkKWBvi6WdodL/FD0nSu3pws0c8=
X-Received: by 2002:a2e:a236:0:b0:259:c94:3144 with SMTP id
 i22-20020a2ea236000000b002590c943144mr11361200ljm.466.1655726469519; Mon, 20
 Jun 2022 05:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220619111115.6354-1-nikita.shubin@maquefel.me> <20220619111115.6354-2-nikita.shubin@maquefel.me>
In-Reply-To: <20220619111115.6354-2-nikita.shubin@maquefel.me>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Jun 2022 17:30:58 +0530
Message-ID: <CAK9=C2X4TTCEjZya4wz-W6ndBaxzUpLBtzQAGJ4zphVM8NSgdg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] RISC-V: Create unique identification for SoC PMU
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
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
X-CRM114-CacheID: sfid-20220620_050113_112135_36C902C4 
X-CRM114-Status: GOOD (  24.48  )
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

T24gU3VuLCBKdW4gMTksIDIwMjIgYXQgNDo0MSBQTSBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1
YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPgo+IEZyb206IE5pa2l0YSBTaHViaW4gPG4uc2h1Ymlu
QHlhZHJvLmNvbT4KPgo+IFByb3ZpZGUgUklTQy1WIFNCSSBQTVUgaWQgdG8gZGlzdGluZ3Vpc2gg
ZGlmZmVyZW50IGNvcmVzIG9yIFNvQ3MgdmlhCj4gImRldmljZXMvcGxhdGZvcm0vcmlzY3YtcG11
L2lkIiBzeXNmcyBlbnRyeS4KPgo+IFRoZSBpZGVudGlmaWNhdGlvbiBpcyBnZW5lcmF0ZWQgYXMg
c3RyaW5nIG9mIG1hcmNoaWQsIG1pbXBpZCwgbXZlbmRvcmlkCj4gaW4gaGV4IGZvcm1hdCBzZXBh
cmF0ZWQgYnkgY29tYSAtICIweDcwMDMyLDB4NzAwMzIsMHgwIi4KPgo+IFRoZSBDU1JzIGFyZSBk
ZXRhaWxlZCBpbiB0aGUgUklTQy1WIHByaXZpbGVnZWQgc3BlYyBbMV0uCj4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsCj4KPiBJbnNwaXJlZC1ieTogSm/Do28g
TcOhcmlvIERvbWluZ29zIDxqb2FvLm1hcmlvQHRlY25pY28udWxpc2JvYS5wdD4KPiBTaWduZWQt
b2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+CgpUaGUgbXZlbmRvcmlk
LCBtYXJjaGlkLCBhbmQgbWltcGlkIGNhbiBiZSB1c2VmdWwgdG8gYXBwcyBvdGhlciB0aGFuCnBl
cmYgdG9vbC4KCkkgaGF2ZSB0cmllZCB0byBleHRlbmQgL3Byb2MvY3B1aW5mbyB3aXRoIHRoaXMg
aW5mb3JtYXRpb24gd2hpY2ggY2FuIGJlCnBhcnNlZCBieSBwZXJmIHRvb2w6Cmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDIyMDYyMDExNTU0OS4xNTI5NTk3LTEtYXBhdGVsQHZlbnRhbmFt
aWNyby5jb20vCgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+IHYzLT52NDoKPiAtIHVzZSBzdHJpbmcg
Zm9yIHBtdWlkCj4gLSByZW5hbWUgcG11X3NiaV9pZF9zaG93IHRvIGlkX3Nob3cKPiAtIGZpeCBl
cnJvciBwcmludCBtZXNzYWdlIGluIGlkX3Nob3cKPiAtIGZpeCBERVZJQ0VfQVRUUiB0byB1c2Ug
b2N0YWwgcGVybWlzc2lvbnMKPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICAg
IHwgIDMgKysrCj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgICB8IDQxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9wZXJmL3Jpc2N2X3Bt
dS5oIHwgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5j
Cj4gaW5kZXggNzc1ZDMzMjJiNDIyLi41MGRkOWI2ZWNjOWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+IEBAIC02
MjcsMTYgKzYyNywxOSBAQCBsb25nIHNiaV9nZXRfbXZlbmRvcmlkKHZvaWQpCj4gIHsKPiAgICAg
ICAgIHJldHVybiBfX3NiaV9iYXNlX2VjYWxsKFNCSV9FWFRfQkFTRV9HRVRfTVZFTkRPUklEKTsK
PiAgfQo+ICtFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbXZlbmRvcmlkKTsKPgo+ICBsb25nIHNiaV9n
ZXRfbWFyY2hpZCh2b2lkKQo+ICB7Cj4gICAgICAgICByZXR1cm4gX19zYmlfYmFzZV9lY2FsbChT
QklfRVhUX0JBU0VfR0VUX01BUkNISUQpOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0woc2JpX2dldF9t
YXJjaGlkKTsKPgo+ICBsb25nIHNiaV9nZXRfbWltcGlkKHZvaWQpCj4gIHsKPiAgICAgICAgIHJl
dHVybiBfX3NiaV9iYXNlX2VjYWxsKFNCSV9FWFRfQkFTRV9HRVRfTUlNUElEKTsKPiAgfQo+ICtF
WFBPUlRfU1lNQk9MKHNiaV9nZXRfbWltcGlkKTsKPgo+ICBzdGF0aWMgdm9pZCBzYmlfc2VuZF9j
cHVtYXNrX2lwaShjb25zdCBzdHJ1Y3QgY3B1bWFzayAqdGFyZ2V0KQo+ICB7Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11
X3NiaS5jCj4gaW5kZXggZGNhMzUzN2E4ZGNjLi5iZTgxMmY4NTU2MTcgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMKPiBAQCAtNjkzLDYgKzY5MywyOCBAQCBzdGF0aWMgaW50IHBtdV9zYmlfc2V0dXBf
aXJxcyhzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUsIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZQo+
ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgc3NpemVfdCBpZF9zaG93KHN0cnVj
dCBkZXZpY2UgKmRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBk
ZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4gK3sKPiArICAgICAgIGludCBsZW47
Cj4gKyAgICAgICBzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUgPSBjb250YWluZXJfb2YoZGV2X2dldF9k
cnZkYXRhKGRldiksIHN0cnVjdCByaXNjdl9wbXUsIHBtdSk7Cj4gKwo+ICsgICAgICAgbGVuID0g
c3ByaW50ZihidWYsICIlc1xuIiwgcG11LT5wbXVpZCk7Cj4gKyAgICAgICBpZiAobGVuIDw9IDAp
Cj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiaW52YWxpZCBzcHJpbnRmIGxlbjogJWRc
biIsIGxlbik7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGxlbjsKPiArfQo+ICsKPiArc3RhdGljIERF
VklDRV9BVFRSKGlkLCAwNjQ0LCBpZF9zaG93LCBOVUxMKTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3Qg
YXR0cmlidXRlICpwbXVfc2JpX2F0dHJzW10gPSB7Cj4gKyAgICAgICAmZGV2X2F0dHJfaWQuYXR0
ciwKPiArICAgICAgIE5VTEwKPiArfTsKPiArCj4gK0FUVFJJQlVURV9HUk9VUFMocG11X3NiaSk7
Cj4gKwo+ICBzdGF0aWMgaW50IHBtdV9zYmlfZGV2aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gIHsKPiAgICAgICAgIHN0cnVjdCByaXNjdl9wbXUgKnBtdSA9IE5VTEw7
Cj4gQEAgLTcxNCw2ICs3MzYsMTQgQEAgc3RhdGljIGludCBwbXVfc2JpX2RldmljZV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgaWYgKHBtdV9zYmlfZ2V0X2N0
cmluZm8obnVtX2NvdW50ZXJzKSkKPiAgICAgICAgICAgICAgICAgZ290byBvdXRfZnJlZTsKPgo+
ICsgICAgICAgLyogZmlsbCBwbXVpZCAqLwo+ICsgICAgICAgcG11LT5wbXVpZCA9IGthc3ByaW50
ZihHRlBfS0VSTkVMLCAiMHglbHgsMHglbHgsMHglbHgiLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzYmlfZ2V0X21hcmNoaWQoKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2JpX2dldF9taW1waWQoKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2JpX2dldF9tdmVuZG9yaWQoKSk7Cj4gKyAgICAgICBpZiAoIXBtdS0+cG11aWQpCj4gKyAgICAg
ICAgICAgICAgIGdvdG8gb3V0X2ZyZWVfcG11aWQ7Cj4gKwo+ICAgICAgICAgcmV0ID0gcG11X3Ni
aV9zZXR1cF9pcnFzKHBtdSwgcGRldik7Cj4gICAgICAgICBpZiAocmV0IDwgMCkgewo+ICAgICAg
ICAgICAgICAgICBwcl9pbmZvKCJQZXJmIHNhbXBsaW5nL2ZpbHRlcmluZyBpcyBub3Qgc3VwcG9y
dGVkIGFzIHNzY29mIGV4dGVuc2lvbiBpcyBub3QgYXZhaWxhYmxlXG4iKTsKPiBAQCAtNzM5LDgg
Kzc2OSwxOSBAQCBzdGF0aWMgaW50IHBtdV9zYmlfZGV2aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICB9
Cj4KPiArICAgICAgIHJldCA9IHN5c2ZzX2NyZWF0ZV9ncm91cCgmcGRldi0+ZGV2LmtvYmosICZw
bXVfc2JpX2dyb3VwKTsKPiArICAgICAgIGlmIChyZXQpIHsKPiArICAgICAgICAgICAgICAgZGV2
X2VycigmcGRldi0+ZGV2LCAic3lzZnMgY3JlYXRpb24gZmFpbGVkXG4iKTsKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBwZGV2LT5kZXYuZ3Jv
dXBzID0gcG11X3NiaV9ncm91cHM7Cj4gKyAgICAgICBkZXZfc2V0X2RydmRhdGEoJnBkZXYtPmRl
diwgcG11KTsKPiArCj4gICAgICAgICByZXR1cm4gMDsKPgo+ICtvdXRfZnJlZV9wbXVpZDoKPiAr
ICAgICAgIGtmcmVlKHBtdS0+cG11aWQpOwo+ICBvdXRfZnJlZToKPiAgICAgICAgIGtmcmVlKHBt
dSk7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Bl
cmYvcmlzY3ZfcG11LmggYi9pbmNsdWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmgKPiBpbmRleCA0
NmY5YjZmZTMwNmUuLmNmMzU1N2I3N2ZiOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3Bl
cmYvcmlzY3ZfcG11LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11LmgKPiBA
QCAtNDIsNiArNDIsNyBAQCBzdHJ1Y3QgY3B1X2h3X2V2ZW50cyB7Cj4gIHN0cnVjdCByaXNjdl9w
bXUgewo+ICAgICAgICAgc3RydWN0IHBtdSAgICAgIHBtdTsKPiAgICAgICAgIGNoYXIgICAgICAg
ICAgICAqbmFtZTsKPiArICAgICAgIGNoYXIgICAgICAgICAgICAqcG11aWQ7Cj4KPiAgICAgICAg
IGlycXJldHVybl90ICAgICAoKmhhbmRsZV9pcnEpKGludCBpcnFfbnVtLCB2b2lkICpkZXYpOwo+
Cj4gLS0KPiAyLjM1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
