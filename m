Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62EAC48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 23:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goCs8/qrfWRlhR1jCcinCbZ56YdMIaZSfv6GcwQ9ko4=; b=oI1g6xr1pAduvl
	d9lqMjB7sTe5adk53u/8b6u77or9Ee8XCo1bizPkHLKAK7qjfMALw3kjF0BUUq2JshkZRqV7oIyU1
	phrmo9lvK1QDTEdA2mi8I5mfIPJrQm+oEKKIY51HgEp9tyj4xQ64jKgF9bwDUOfcYkUECwCNlEBqD
	Kv3Z23Ug25Tp8YW5FeKEzi5f26Rnjc9xptheqeg+/mDp0P3rZ3rH0Mz3JhZHUMOM/C69cM8rCe4+S
	GTjdhPqrdQWlgq2iiX+ftpUOgAUGx5Ro01lJ9kcVSb2Piv8XYTbl54cCyIA7Pn9Xm2oyseX2l5H1T
	536WST1gcmxPxcA21vXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcZ9b-0000000GRMH-0WXT;
	Tue, 20 Feb 2024 23:03:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcZ9W-0000000GRJS-2oq4
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 23:03:56 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-512cba0f953so1080519e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 15:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1708470232; x=1709075032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqH0ROPbbtIdqXSURYkySpHgNfveY4dFLQe0qUwTePc=;
        b=o6QOWCIG5nD/MCglkRU8wVYf1PfqzQf0TV2WdInARYItUeimu1mzMcNlg9y7esHLSX
         hLtNXJ3YVenW16s5yTKSCyEFTj8znuOlBmmvxfjV1PN718Bf3QR0Yd7i9AQ5+Prldv7G
         0DXkTi0yjKUM8CUU0ksPgLTMs6ImrvnoYCq30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708470232; x=1709075032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqH0ROPbbtIdqXSURYkySpHgNfveY4dFLQe0qUwTePc=;
        b=fDLrFyy9DR6R3GWr4qe+dWFBY2XEk0dFGifVePyAGCvw3LzEpEwU3dEi6UiNripmez
         OoRdDkbo+2UOkSzGQcGCKgbRMQtQjBLfNYSIQ9hxst4uuBpzrb6tpJ2o5JC7rTYKUBGl
         wxYIW1SJ0PA6QYoTl4HDE3/QuKmJ+iJvebkCYx9oq8UwBCUyNqluSh+Sa83bzkThvui1
         EF7LuFitUz5flUDN9XKyXP7FD2dScrWePQpdnmMB6/Z5/MULizYKBWGeR/BJaFtoT3Dt
         ICY2rL0oKNGBUxkOlZJTKltuF1Rnquwrk8UvAkPS8+7UMxV0keVLwLg6TzruKGIZyeoV
         VU+A==
X-Forwarded-Encrypted: i=1; AJvYcCUpFzLox/MjrqduKHczVfGRINDgtDbmP/pgIFA8AcODOJj8rjXvQRj3MFEuT6gPTi/x4SMnEkeGiOyK0QBo9H2HQFN8UiERMy6HpODkh8AU
X-Gm-Message-State: AOJu0Yxb1IC1x4YYSmfQA+7VtBCJZfMgZipqqPpJ/BxZ4sa4UZR1Oy+7
	OjfSTbC33Xyz0t0p6Gy0E866d7du0IpTgMuvQfkxwRyFC4MvtHu3/xolaMCtdpikHPhAfuQ02pV
	92nng8g68BEaSwUvf8Yw9fV+ayHa/+n2+AiJM
X-Google-Smtp-Source: AGHT+IHvIMp97EquM1HGvlF+EshWPYeFqFX2gVhb+xvtJN9u9TgHl4t/ylyvXaDa1s3oTu4/8hBS3HdAlZdC/VROf90=
X-Received: by 2002:a05:6512:3a8b:b0:512:a964:f222 with SMTP id
 q11-20020a0565123a8b00b00512a964f222mr7687790lfu.21.1708470231958; Tue, 20
 Feb 2024 15:03:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com> <68856b86a93a4188558e5d0ebac0dd6aac8e404c.1705916069.git.haibo1.xu@intel.com>
In-Reply-To: <68856b86a93a4188558e5d0ebac0dd6aac8e404c.1705916069.git.haibo1.xu@intel.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 20 Feb 2024 15:03:40 -0800
Message-ID: <CAOnJCULwRTSnrQkR2o1P53R=tJ3TAxX+y+XRBesW6OFEzgFv2g@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Samuel Holland <samuel@sholland.org>, Minda Chen <minda.chen@starfivetech.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, 
	Like Xu <likexu@tencent.com>, Vipin Sharma <vipinsh@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_150354_920530_04B9786A 
X-CRM114-Status: GOOD (  19.55  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMTo0OOKAr0FNIEhhaWJvIFh1IDxoYWlibzEueHVAaW50
ZWwuY29tPiB3cm90ZToKPgo+IE1vdmUgdmNwdV9oYXNfZXh0IHRvIHRoZSBwcm9jZXNzb3IuYyBh
bmQgcmVuYW1lIGl0IHRvIF9fdmNwdV9oYXNfZXh0Cj4gc28gdGhhdCBvdGhlciB0ZXN0IGNhc2Vz
IGNhbiB1c2UgaXQgZm9yIHZDUFUgZXh0ZW5zaW9uIGNoZWNrLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oIHwgIDIgKysKPiAgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyAgICAgfCAxMCArKysrKysrKysr
Cj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAg
IHwgMTEgKy0tLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4gaW5kZXggYjY4YjFiNzMxYTM0Li5iZDI3ZTFj
Njc1NzkgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUv
cmlzY3YvcHJvY2Vzc29yLmgKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5j
bHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+IEBAIC00Miw2ICs0Miw4IEBAIHN0YXRpYyBpbmxpbmUg
dWludDY0X3QgX19rdm1fcmVnX2lkKHVpbnQ2NF90IHR5cGUsIHVpbnQ2NF90IGlkeCwKPiAgI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1JFRyhpZHgpIF9fa3ZtX3JlZ19pZChLVk1fUkVHX1JJU0NWX0lT
QV9FWFQsIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
ZHgsIEtWTV9SRUdfU0laRV9VTE9ORykKPgo+ICtib29sIF9fdmNwdV9oYXNfZXh0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgaW50IGV4dCk7Cj4gKwo+ICBzdHJ1Y3QgZXhfcmVncyB7Cj4gICAgICAg
ICB1bnNpZ25lZCBsb25nIHJhOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzcDsKPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiBpbmRl
eCAzOWExZTk5MDJkZWMuLmRhZDczY2UxODE2NCAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IEBAIC0xNSw2ICsxNSwxNiBA
QAo+Cj4gIHN0YXRpYyB2bV92YWRkcl90IGV4Y2VwdGlvbl9oYW5kbGVyczsKPgo+ICtib29sIF9f
dmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkKPiArewo+ICsgICAg
ICAgdW5zaWduZWQgbG9uZyB2YWx1ZSA9IDA7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAg
ICAgIHJldCA9IF9fdmNwdV9nZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGV4dCksICZ2
YWx1ZSk7Cj4gKwo+ICsgICAgICAgcmV0dXJuICFyZXQgJiYgISF2YWx1ZTsKPiArfQo+ICsKCk5v
dCBzdXJlIHdoYXQgd2FzIHRoZSBiYXNlIHBhdGNoIG9uIHdoaWNoIHRoaXMgd2FzIHJlYmFzZWQu
IFRoZSBhY3R1YWwKY29tbWl0IGluIHRoZSBxdWV1ZSBicmFuY2ggbG9va3MgZGlmZmVyZW50LgoK
aHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC9jb21taXQvNTU2MzUxN2NjMjAxMmUz
MzI2NDExYjM2MGM5OTI0ZDNmMjcwNmM4ZAoKQm90aCBzZWVtIHRvIGhhdmUgdGhlIHNhbWUgYnVn
IHRob3VnaCB0aGUgdGVzdHMgZmFpbCBub3cgYW5kIHJlcXVpcmUKdGhlIGZvbGxvd2luZyBmaXgu
ClRoZSBleHQgaWQgc2hvdWxkIGJlIHVpbnQ2NF90IGFuZCB3ZSBuZWVkIHRvIHBhc3MgZXh0IGRp
cmVjdGx5IHNvIHRoYXQKU0JJIGV4dGVuc2lvbiB0ZXN0cyBjYW4gYWxzbyBwYXNzLgoKCi0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5o
CkBAIC00OCw3ICs0OCw3IEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgX19rdm1fcmVnX2lkKHVp
bnQ2NF90IHR5cGUsCnVpbnQ2NF90IHN1YnR5cGUsCktWTV9SRUdfUklTQ1ZfU0JJX1NJTkdMRSwg
XAppZHgsIEtWTV9SRUdfU0laRV9VTE9ORykKCi1ib29sIF9fdmNwdV9oYXNfZXh0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgaW50IGV4dCk7Citib29sIF9fdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwgdWludDY0X3QgZXh0KTsKCnN0cnVjdCBleF9yZWdzIHsKdW5zaWduZWQgbG9u
ZyByYTsKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3Yv
cHJvY2Vzc29yLmMKYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nl
c3Nvci5jCmluZGV4IDI4MjU4N2NkNGJiYy4uZWM2NmQzMzFhMTI3IDEwMDY0NAotLS0gYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCisrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKQEAgLTE1LDEyICsx
NSwxMiBAQAoKc3RhdGljIHZtX3ZhZGRyX3QgZXhjZXB0aW9uX2hhbmRsZXJzOwoKLWJvb2wgX192
Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQorYm9vbCBfX3ZjcHVf
aGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVpbnQ2NF90IGV4dCkKewp1bnNpZ25lZCBs
b25nIHZhbHVlID0gMDsKaW50IHJldDsKCi0gcmV0ID0gX192Y3B1X2dldF9yZWcodmNwdSwgUklT
Q1ZfSVNBX0VYVF9SRUcoZXh0KSwgJnZhbHVlKTsKKyByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1
LCBleHQsICZ2YWx1ZSk7CgpyZXR1cm4gIXJldCAmJiAhIXZhbHVlOwp9CgpXaXRoIHRoZSBhYm92
ZSB0aGUgZml4LCBCb3RoIFNCSS9JU0EgZXh0ZW5zaW9uIHRlc3RzIHBhc3MuCiMgLi9nZXQtcmVn
LWxpc3QKc2JpLWJhc2U6IFBBU1MKc2JpLXN0YTogUEFTUwpzYmktcG11OiBQQVNTCnNiaS1kYmNu
OiBQQVNTCmFpYTogUEFTUwpmcF9mOiBQQVNTCmZwX2Q6IFBBU1MKMS4uMCAjIFNLSVAgLSBoIG5v
dCBhdmFpbGFibGUsIHNraXBwaW5nIHRlc3RzCnNtc3RhdGVlbjogUEFTUwpzc2NvZnBtZjogUEFT
Uwpzc3RjOiBQQVNTCjEuLjAgIyBTS0lQIC0gc3ZpbnZhbCBub3QgYXZhaWxhYmxlLCBza2lwcGlu
ZyB0ZXN0cwoxLi4wICMgU0tJUCAtIHN2bmFwb3Qgbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVz
dHMKMS4uMCAjIFNLSVAgLSBzdnBibXQgbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHMKemJh
OiBQQVNTCnpiYjogUEFTUwp6YmM6IFBBU1MKMS4uMCAjIFNLSVAgLSB6YmtiIG5vdCBhdmFpbGFi
bGUsIHNraXBwaW5nIHRlc3RzCjEuLjAgIyBTS0lQIC0gemJrYyBub3QgYXZhaWxhYmxlLCBza2lw
cGluZyB0ZXN0cwoxLi4wICMgU0tJUCAtIHpia3ggbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVz
dHMKemJzOiBQQVNTCnpmYTogUEFTUwoxLi4wICMgU0tJUCAtIHpmaCBub3QgYXZhaWxhYmxlLCBz
a2lwcGluZyB0ZXN0cwoxLi4wICMgU0tJUCAtIHpmaG1pbiBub3QgYXZhaWxhYmxlLCBza2lwcGlu
ZyB0ZXN0cwp6aWNib206IFBBU1MKemljYm96OiBQQVNTCnppY250cjogUEFTUwoxLi4wICMgU0tJ
UCAtIHppY29uZCBub3QgYXZhaWxhYmxlLCBza2lwcGluZyB0ZXN0cwp6aWNzcjogUEFTUwp6aWZl
bmNlaTogUEFTUwp6aWhpbnRudGw6IFBBU1MKemloaW50cGF1c2U6IFBBU1MKemlocG06IFBBU1MK
Cgo+ICBzdGF0aWMgdWludDY0X3QgcGFnZV9hbGlnbihzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDY0
X3QgdikKPiAgewo+ICAgICAgICAgcmV0dXJuICh2ICsgdm0tPnBhZ2Vfc2l6ZSkgJiB+KHZtLT5w
YWdlX3NpemUgLSAxKTsKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2
L2dldC1yZWctbGlzdC5jCj4gaW5kZXggMjVkZTRiOGJjMzQ3Li5lZDI5YmE0NTU4OGMgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5j
Cj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5j
Cj4gQEAgLTc1LDE1ICs3NSw2IEBAIGJvb2wgY2hlY2tfcmVqZWN0X3NldChpbnQgZXJyKQo+ICAg
ICAgICAgcmV0dXJuIGVyciA9PSBFSU5WQUw7Cj4gIH0KPgo+IC1zdGF0aWMgaW5saW5lIGJvb2wg
dmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkKPiAtewo+IC0gICAg
ICAgaW50IHJldDsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsdWU7Cj4gLQo+IC0gICAgICAg
cmV0ID0gX192Y3B1X2dldF9yZWcodmNwdSwgUklTQ1ZfSVNBX0VYVF9SRUcoZXh0KSwgJnZhbHVl
KTsKPiAtICAgICAgIHJldHVybiAocmV0KSA/IGZhbHNlIDogISF2YWx1ZTsKPiAtfQo+IC0KPiAg
dm9pZCBmaW5hbGl6ZV92Y3B1KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IHZjcHVfcmVn
X2xpc3QgKmMpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgaXNhX2V4dF9zdGF0ZVtLVk1f
UklTQ1ZfSVNBX0VYVF9NQVhdID0geyAwIH07Cj4gQEAgLTExMSw3ICsxMDIsNyBAQCB2b2lkIGZp
bmFsaXplX3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAq
YykKPiAgICAgICAgICAgICAgICAgX192Y3B1X3NldF9yZWcodmNwdSwgUklTQ1ZfSVNBX0VYVF9S
RUcocy0+ZmVhdHVyZSksIDEpOwo+Cj4gICAgICAgICAgICAgICAgIC8qIERvdWJsZSBjaGVjayB3
aGV0aGVyIHRoZSBkZXNpcmVkIGV4dGVuc2lvbiB3YXMgZW5hYmxlZCAqLwo+IC0gICAgICAgICAg
ICAgICBfX1RFU1RfUkVRVUlSRSh2Y3B1X2hhc19leHQodmNwdSwgcy0+ZmVhdHVyZSksCj4gKyAg
ICAgICAgICAgICAgIF9fVEVTVF9SRVFVSVJFKF9fdmNwdV9oYXNfZXh0KHZjcHUsIHMtPmZlYXR1
cmUpLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXMgbm90IGF2YWlsYWJsZSwg
c2tpcHBpbmcgdGVzdHNcbiIsIHMtPm5hbWUpOwo+ICAgICAgICAgfQo+ICB9Cj4gLS0KPiAyLjM0
LjEKPgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
