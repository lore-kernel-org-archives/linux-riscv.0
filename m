Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C0FC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lz8tNSnUwLWUfKdA2Xhgt2F760sIlwsFb22grIHvqm4=; b=DDvuYk2wZqdTRp
	uYYdty7Y8Ql0W/4EsS6cllEL4hgPZboUuKri4Ua3MfPVKzReN/j/ZTaHrvbzUMSvuEoghN/RGVLVl
	M/XR4+WNG/eaE3DMEuX4E8kqsYHG1kbeOUnftmFFyYmG//p068HKrQSDKbTx5oBBWmfNojH6rhzfo
	HxWhc8lBY0eY3En4iS50e3QF0eDlc7nY5RiF1klrMYjKb+VmuWNrvI/Kqb9/BaQJym8OB3x8OjEJq
	cF/Pk9jGKri8uvGyjYVdq9LoBxzTPGhHjSufDQSxtvd2lb+8aTTrS95diHkIVbQGbVPaKRrtuVkZK
	rzm2l4n32gtEXASNdSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mXF-0034LM-SG; Fri, 24 Jun 2022 16:51:57 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mXD-0034KI-13
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 16:51:56 +0000
Received: by mail-yb1-xb31.google.com with SMTP id o79so5472757ybc.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l0DpinNvZxGmxtaLG/tFhvlNkAzZw8AP8a8IjHb2qFI=;
        b=IdVYjOY89LbKF8YzNNPdn/AhkiGUoWNQGT2nGRWjyMDO8Qd5flOSr+qQGK3O2EpYV8
         ydwM/Guke1O+IotKFfJtMCX0cZvjTittvf5mwfnjzS2hgyhWQXF70d7lP14VDamsVfTQ
         gAbaVCY06cvFgcv2hXVHu8z/E80ArXK+7/6/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l0DpinNvZxGmxtaLG/tFhvlNkAzZw8AP8a8IjHb2qFI=;
        b=wU3wNI+kD0UVfCuccLToFYoCrm5oiMXoztPXvS/b99YE1gjc50QD0+vZleopktosOe
         2lcN9SbEqG0cddlKV3g+oVEsHlrII8ngoRFszFmJRf9BA8gX8Mrb2Jw2O8j6wbvHyXyA
         r5cCgVPp27P6HT3OUHTlUM/tSsXGs9FgVnn9K7BSVtzpPpjF8ZK1ipe6MEUfGRK/gKea
         M4qajmz4BS/StWbmOyFcR/fiZVwV/Q2mOTb3+CSPODbS78tcepFcQQTRwPlaVK8rFqtO
         ziQ3i7q51Y4zhkt6Z+570ao9oUy4clvg9SUHRw+rsTIohprsFLLENTbr0r9aUqtNUjXu
         Tnug==
X-Gm-Message-State: AJIora87H2xv21B5lNS+ZilSV1oL4NXJwOfvA4wjbq8WHjniJagyCJgd
	Ww6ppe8C4sPM2oV9uw33iLWF2iAYE/dV2oWoF5bp
X-Google-Smtp-Source: AGRyM1vQi5YWVjwEtdmiqRm2w6lqaKZqE+ChXWxeYo1IUOB+OlXfYGBxdaL1FGw2uU03Jeu4c5f3rOsXz7IOSxs4k2w=
X-Received: by 2002:a25:bcca:0:b0:66c:7e4d:c708 with SMTP id
 l10-20020a25bcca000000b0066c7e4dc708mr103614ybm.228.1656089513226; Fri, 24
 Jun 2022 09:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220624160117.3206-1-nikita.shubin@maquefel.me> <20220624160117.3206-2-nikita.shubin@maquefel.me>
In-Reply-To: <20220624160117.3206-2-nikita.shubin@maquefel.me>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 24 Jun 2022 09:51:40 -0700
Message-ID: <CAOnJCUKpru5s=ktUKj3k5-L1sh8FzTm4t18BcudFXKT4SHaftQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drivers/perf: riscv_pmu_sbi: perf format
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>, 
	linux <linux@yadro.com>, Nikita Shubin <n.shubin@yadro.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_095155_112411_F6B81864 
X-CRM114-Status: GOOD (  17.66  )
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

T24gRnJpLCBKdW4gMjQsIDIwMjIgYXQgOTowMiBBTSBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1
YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPgo+IEZyb206IE5pa2l0YSBTaHViaW4gPG4uc2h1Ymlu
QHlhZHJvLmNvbT4KPgo+IFVwZGF0ZSBkcml2ZXIgdG8gZXhwb3J0IGZvcm1hdHRpbmcgYW5kIGV2
ZW50IGluZm9ybWF0aW9uIHRvIHN5c2ZzIHNvIGl0Cj4gY2FuIGJlIHVzZWQgYnkgdGhlIHBlcmYg
dXNlciBzcGFjZSB0b29scyB3aXRoIHRoZSBzeW50YXhlczoKPgo+IHBlcmYgc3RhdCAtZSBjcHUv
ZXZlbnQ9MHgwNQo+IHBlcmYgc3RhdCAtZSBjcHUvZXZlbnQ9MHgwNSxmaXJtd2FyZT0weDEvCj4K
PiA2My1iaXQgaXMgdXNlZCB0byBkaXN0aW5ndWlzaCBoYXJkd2FyZSBldmVudHMgZnJvbSBmaXJt
d2FyZS4gRmlybXdhcmUKPiBldmVudHMgYXJlIGRlZmluZWQgYnkgIlJJU0MtViBTdXBlcnZpc29y
IEJpbmFyeSBJbnRlcmZhY2UKPiBTcGVjaWZpY2F0aW9uIi4KPgo+IHBlcmYgc3RhdCAtZSBjcHUv
ZXZlbnQ9MHgwNSxmaXJtd2FyZT0weDEvCj4KPiBpcyBlcXVpdmFsZW50IHRvCj4KPiBwZXJmIHN0
YXQgLWUgcjgwMDAwMDAwMDAwMDAwMDUKPgo+IEluc3BpcmVkLWJ5OiBKb8OjbyBNw6FyaW8gRG9t
aW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0Pgo+IFNpZ25lZC1vZmYtYnk6IE5p
a2l0YSBTaHViaW4gPG4uc2h1YmluQHlhZHJvLmNvbT4KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL2Jsb2IvbWFzdGVyL3Jpc2N2LXNiaS5hZG9j
Cj4gLS0tCj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgfCAyMCArKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11
X3NiaS5jCj4gaW5kZXggZGNhMzUzN2E4ZGNjLi4yYjU4NjFhMTBkOGUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMKPiBAQCAtMjEsNiArMjEsMjUgQEAKPiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiAg
I2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+Cj4gK1BNVV9GT1JNQVRfQVRUUihldmVudCwgImNvbmZp
ZzowLTYyIik7CgpUaGlzIGZvcm1hdCBpcyB1c2VkIGZvciByYXcgZXZlbnRzIGFzIHdlbGwuIFJh
dyBldmVudCBkYXRhIG9ubHkKZW5jb2RlcyA0OCBiaXRzIGFzIHBlciB0aGUgU0JJIHNwZWMuClRo
ZSBSSVNDVl9QTVVfUkFXX0VWRU5UX01BU0sgaW4gdGhlIHNiaS5oIGlzIGluY29ycmVjdC4gSSB3
aWxsIHNlbmQgYSBmaXguCgo+ICtQTVVfRk9STUFUX0FUVFIoZmlybXdhcmUsICJjb25maWc6NjMt
NjMiKTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpyaXNjdl9hcmNoX2Zvcm1hdHNf
YXR0cltdID0gewo+ICsgICAgICAgJmZvcm1hdF9hdHRyX2V2ZW50LmF0dHIsCj4gKyAgICAgICAm
Zm9ybWF0X2F0dHJfZmlybXdhcmUuYXR0ciwKPiArICAgICAgIE5VTEwsCj4gK307Cj4gKwo+ICtz
dGF0aWMgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCByaXNjdl9wbXVfZm9ybWF0X2dyb3VwID0gewo+
ICsgICAgICAgLm5hbWUgPSAiZm9ybWF0IiwKPiArICAgICAgIC5hdHRycyA9IHJpc2N2X2FyY2hf
Zm9ybWF0c19hdHRyLAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVf
Z3JvdXAgKnJpc2N2X3BtdV9hdHRyX2dyb3Vwc1tdID0gewo+ICsgICAgICAgJnJpc2N2X3BtdV9m
b3JtYXRfZ3JvdXAsCj4gKyAgICAgICBOVUxMLAo+ICt9Owo+ICsKPiAgdW5pb24gc2JpX3BtdV9j
dHJfaW5mbyB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlOwo+ICAgICAgICAgc3RydWN0
IHsKPiBAQCAtNzIwLDYgKzczOSw3IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgICAgICAgICAgcG11LT5wbXUu
Y2FwYWJpbGl0aWVzIHw9IFBFUkZfUE1VX0NBUF9OT19JTlRFUlJVUFQ7Cj4gICAgICAgICAgICAg
ICAgIHBtdS0+cG11LmNhcGFiaWxpdGllcyB8PSBQRVJGX1BNVV9DQVBfTk9fRVhDTFVERTsKPiAg
ICAgICAgIH0KPiArICAgICAgIHBtdS0+cG11LmF0dHJfZ3JvdXBzID0gcmlzY3ZfcG11X2F0dHJf
Z3JvdXBzOwo+ICAgICAgICAgcG11LT5udW1fY291bnRlcnMgPSBudW1fY291bnRlcnM7Cj4gICAg
ICAgICBwbXUtPmN0cl9zdGFydCA9IHBtdV9zYmlfY3RyX3N0YXJ0Owo+ICAgICAgICAgcG11LT5j
dHJfc3RvcCA9IHBtdV9zYmlfY3RyX3N0b3A7Cj4gLS0KPiAyLjM1LjEKPgoKCi0tIApSZWdhcmRz
LApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
