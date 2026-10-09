Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51628CA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vqxp+tpmMDGrQACSqrxv44RC0sf5NJRrtfzwVCff9TU=; b=y4NPjsyA2j3Ezb
	oTxbmd2wBkoKbh0rItjnx7MmXm9gpYuZavqqwEMMfqw5hU0xzpWAcujGE/ljBN71LUYn8y7msmT4U
	IwnaF7YSlMkfkmi6w/VyrVKun5pP0RPY0Ox/TBjq4v+Nn20RVkVEZrl0qR4dppHPGnWjRTC9NGFym
	yuEofMZK2hxL/T3SQ9otJJ1/Yrc6QZSbGIwv4c0BY6TPibZS+h+k1W2/6o/TisxFCqK16GnQUfVdo
	TeXb3MjuiqZlyg+E6Z1BiBk5qa529vW0Fg/XOAkKICX7ib8couCP7XYFaLB7dCcCRLDBCqWFWauof
	E1VVlKTQVQJFN6ccaf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Vv-00000005ymE-3nIQ;
	Fri, 09 Oct 2026 10:07:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Vt-00000005ylM-0vPZ
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 10:07:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48bbb06e746so3352312f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 03:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540459; cv=none;
        d=google.com; s=arc-20260327;
        b=TO9n26NMnR+DBzT5TWA4oSYqMfeh9spC2CjXeeyzL4/esG2qiH+vBU7OIFrSUfaQhd
         bosSy2mGKasbNexSXYrnh2fTOy3pyJ93kZS7+UUewQEiWITGoqh+opPg+JTxYOglxtu6
         dxZCIZvPbWTJwQIu93059o4rcdg5+Pdopf1bTJcKvy3vHhcwr4JfBpitgiwPWMHzajwu
         ISQEH4jzVhOnX0cx/EuivMaE7sD2ywnhC6jlenAe18A67cEA9HAWdae/VDrzOUVs/sHk
         Wue1eYG8iliKhiOXoINfNz3TRLSJF06Xmj8osUGlw2BK0TiLlPuMRU6kHAhyiw0xIeBB
         51OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        fh=H0vD1byyXpoRdJErZTeufxhWUiT/FeFKpyuUl7wRUvo=;
        b=NITGCPPVL3OF1zD38sOPhYK8Mimf5Mn5qO0J70NB73+XH4xWzNUKJgAgbWV9azInbC
         QuPxPn9b41uy1Wk+8KXuY8ANz1lHKsPYBs0jKZyDxNsnA/2y0rh+0+QZWzw4oM2shxiX
         Uwf4/FLBui1BZMy63e6aSOvkjp8ngL3G3rgXy8URUAgeeXQUDMYjaFq8RyiBXNXg4whN
         DLKPCgwMrLEp/WaW1gjxem5+Oz8ZFuXZoBEkJnTzKsuDp4wLLYKOGnnjcXwWIytL3qzf
         ff/ptHT1dIMCUnhK8/+evL3FInSqbwyRewSQQWyGls7T+Lpi3dfVSdWIF3mVQw07kqaI
         yvMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791540459; x=1792145259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        b=eB15jw7BTdKp/h7LPkvyMZtiPsj17fb14H5qNFJlDkBhiGqtNLu6TZeVKya/OTpfuo
         fsJKOZl4zJ/zDXSW7vpkUGHCX3+ZfKeVcYEDFDzI7zsCMMvCG62HW8ZsznG4OGH3OFfp
         FGQ3brj0AFHKLHZd4ybyskk8++D2iclasT87hxtEvsSyRUUXDqROWmEdC3BdD5jq6co6
         o4Q9UiR45HoI8J2KlimJZ8KNRAoJ5HJeq1rmAGLL+93EM732PTXdVYsdQtEWkKK3hwY5
         emIWL6hbk3MlK23NJD8iFYPsaiAxWQoy0dKiwZU7wC9ac4rAbmvup2/MXU7FdA1fmjZX
         IybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540459; x=1792145259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        b=iMdsRTuD7W0d48En04V2Mgmo/xCtXIUScm5j2u7N0Zavgz3iIiZpeNKoFZm7vjZf4q
         fGBhfgiwsLTt8zAE072QQHKn8fLjDE9X0HnBkN8BWcIUh6UG4eAjAx1Kn37ofRTJ+K4F
         u6iwy5aCyQzqEVucGSRWXscuXXLSnSGZYYhy5EDa/uDsYO2zTE22OWeChMQ56qYM+qh3
         WgAiCLgru6GafqamYWl48oQc/1gCJAHvAUiI9+7jVp5eKEdnnb4rGUOiCPKX23QVvYfE
         cC9D5eBTe83p8so7zAQJYG2kjFYmUswk48/QWFlRqrksTl7ZA3DPLh+OKUPEMUA8VT7Y
         PVzg==
X-Forwarded-Encrypted: i=1; AKwUvBwBuHs52h/aAUqc72MWh5V8p6eR3P5gPO7uM69MZUs719Af4OIGxbNZc5f7J85RuCenoUG713OrDt4ghw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLyo71pbjWW+RGm257gXqfVP3PsPlC1OQLjj2AxVz4Pxd0iHD6t
	NAQJiwvH6adSVlk6miS0Ego7gb3EiOr1sGNq0vkpK/x6ZrtW6J1rzWWastp0esnlAVHu6ET1uur
	BgaHD/ema/2EQD35tHJPkg8S3MuKMF5uiDpYEbMppow==
X-Gm-Gg: AYBFou1hSc0fK5nQhecFdo5mqTge6EmJhPrmyVpOCed5uonCFNwQVj7PbaUOmkxD/pQ
	NP6nnaLw+7blwbaGSflODc03v9VjNVXkY28nftuJ//q14ybBX95hXPQjK7dWTu0pRMcmqI2RZUG
	gocyapxi8WzRZfHehgxhGDnXUyg5Cdkz7122x/RI7dAZfrU1kwV2vesZSFUa+x0e+imyJCpplB7
	uD1FiCvt4eF/yUiWcoXUF1qXrVQoH4GaZBUhyQSpxFJrccPLhgT2r6sNKaJ2i/ACtHclpJC88pY
	JmL1WIn1TFtnr/jos92PmG2gk48TA0d2ZkPvuDJSErp+4XDWCX806dqhRD7+jbKCWxB6Zc0pPv/
	KVEwV6XHKtecJRlFjRQcgqArC6DPPNazSbHJM6RRvPz8C01A1BaftB4cl98XWrGRY7dnDpNIh+w
	==
X-Received: by 2002:a5d:5d83:0:b0:48a:efed:ac97 with SMTP id
 ffacd0b85a97d-48dba9d326amr2435668f8f.33.1791540458537; Fri, 09 Oct 2026
 03:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
In-Reply-To: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 12:07:26 +0200
X-Gm-Features: AclHuK8s2qRUsbqTNG8YPqEmgy3yDujBoTHugKHr0lrqk5zZyltW7DxQdyuRR9k
Message-ID: <CAAhSdy3TOK6B5SUpFs+dQBzfLDy3-otMxTPEPwzOsoNsqY3cKg@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: selftests: Dump sepc/scause/stval on vcpu_arch_dump()
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, zong.li@sifive.com, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_030741_293921_CC8F10AF 
X-CRM114-Status: GOOD (  13.78  )
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

T24gVHVlLCBTZXAgMSwgMjAyNiBhdCA1OjU34oCvQU0gWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiB2Y3B1X2FyY2hfZHVtcCgpIG9taXRzIHRyYXAt
cmVsYXRlZCBDU1JzLCBtYWtpbmcgaXQgaGFyZCB0byBkaWFnbm9zZQo+IHVuZXhwZWN0ZWQgZ3Vl
c3QgZXhjZXB0aW9ucyBmcm9tIHRoZSBkdW1wIG91dHB1dCBhbG9uZS4KPgo+IFByaW50IHNlcGMs
IHNjYXVzZSwgYW5kIHN0dmFsIGFsb25nc2lkZSB0aGUgZXhpc3RpbmcgcmVnaXN0ZXIgZHVtcC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5j
b20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy40CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jIHwgOCAr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiBpbmRleCBk
ZWQ1NDI5ZjM0NDguLmJmMzU1YWZhODQ4NiAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IEBAIC0yMzUsNiArMjM1LDcgQEAg
dm9pZCByaXNjdl92Y3B1X21tdV9zZXR1cChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHZvaWQg
dmNwdV9hcmNoX2R1bXAoRklMRSAqc3RyZWFtLCBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGlu
ZGVudCkKPiAgewo+ICAgICAgICAgc3RydWN0IGt2bV9yaXNjdl9jb3JlIGNvcmU7Cj4gKyAgICAg
ICBzdHJ1Y3Qga3ZtX3Jpc2N2X2NzciBnZW5lcmFsX2NzcjsKPgo+ICAgICAgICAgY29yZS5tb2Rl
ID0gdmNwdV9nZXRfcmVnKHZjcHUsIFJJU0NWX0NPUkVfUkVHKG1vZGUpKTsKPiAgICAgICAgIGNv
cmUucmVncy5wYyA9IHZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9DT1JFX1JFRyhyZWdzLnBjKSk7
Cj4gQEAgLTI3MCw2ICsyNzEsMTAgQEAgdm9pZCB2Y3B1X2FyY2hfZHVtcChGSUxFICpzdHJlYW0s
IHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTggaW5kZW50KQo+ICAgICAgICAgY29yZS5yZWdzLnQ1
ID0gdmNwdV9nZXRfcmVnKHZjcHUsIFJJU0NWX0NPUkVfUkVHKHJlZ3MudDUpKTsKPiAgICAgICAg
IGNvcmUucmVncy50NiA9IHZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9DT1JFX1JFRyhyZWdzLnQ2
KSk7Cj4KPiArICAgICAgIGdlbmVyYWxfY3NyLnNlcGMgPSB2Y3B1X2dldF9yZWcodmNwdSwgUklT
Q1ZfR0VORVJBTF9DU1JfUkVHKHNlcGMpKTsKPiArICAgICAgIGdlbmVyYWxfY3NyLnNjYXVzZSA9
IHZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9HRU5FUkFMX0NTUl9SRUcoc2NhdXNlKSk7Cj4gKyAg
ICAgICBnZW5lcmFsX2Nzci5zdHZhbCA9IHZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9HRU5FUkFM
X0NTUl9SRUcoc3R2YWwpKTsKPiArCj4gICAgICAgICBmcHJpbnRmKHN0cmVhbSwKPiAgICAgICAg
ICAgICAgICAgIiBNT0RFOiAgMHglbHhcbiIsIGNvcmUubW9kZSk7Cj4gICAgICAgICBmcHJpbnRm
KHN0cmVhbSwKPiBAQCAtMjk2LDYgKzMwMSw5IEBAIHZvaWQgdmNwdV9hcmNoX2R1bXAoRklMRSAq
c3RyZWFtLCBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGluZGVudCkKPiAgICAgICAgIGZwcmlu
dGYoc3RyZWFtLAo+ICAgICAgICAgICAgICAgICAiIFQzOiAweCUwMTZseCAgIFQ0OiAweCUwMTZs
eCBUNTogMHglMDE2bHggVDY6IDB4JTAxNmx4XG4iLAo+ICAgICAgICAgICAgICAgICBjb3JlLnJl
Z3MudDMsIGNvcmUucmVncy50NCwgY29yZS5yZWdzLnQ1LCBjb3JlLnJlZ3MudDYpOwo+ICsgICAg
ICAgZnByaW50ZihzdHJlYW0sCj4gKyAgICAgICAgICAgICAgICJTRVBDOiAweCUwMTZseCBTQ0FV
U0U6IDB4JTAxNmx4IFNUVkFMOiAweCUwMTZseFxuIiwKPiArICAgICAgICAgICAgICAgZ2VuZXJh
bF9jc3Iuc2VwYywgZ2VuZXJhbF9jc3Iuc2NhdXNlLCBnZW5lcmFsX2Nzci5zdHZhbCk7Cj4gIH0K
Pgo+ICBzdGF0aWMgdm9pZCBfX2FsaWduZWQoMTYpIGd1ZXN0X3VuZXhwX3RyYXAodm9pZCkKPgo+
IC0tLQo+IGJhc2UtY29tbWl0OiBiNTA2MGE0YWEzM2Q3ZDc4YThjMTgzN2FiMDhlZjBjODFlYTk2
NjUwCj4gY2hhbmdlLWlkOiAyMDI2MDgzMS1rdm1fa3NlbGZ0ZXN0X2R1bXAtM2Y4ZDRkYWY1YzYw
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
