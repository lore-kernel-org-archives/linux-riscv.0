Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DC0C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 05:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZV7pRQJpByUxSLrl7zsSLrxRYC/bEbPDHKfOJUr150=; b=FOPTYEx0ag2eia
	YyqTwZRCMFmN0JO4bMZ9I2c7uHGHbNH6Afeb2fPYUVggWOPAhtUe9F8TaAd1NmT1mriamu4gr4j7H
	49J/2EfuaJgW5pIGH6P764ieUpkxyE+6+yUIubTSD6O2N/BV+buyYQAgq2T3gi4tooGhvWVSNn5G/
	iGJNjAFVGZMFeZG3PGIEz+PRIgeQqMCS/kP6tWnMQJGyRZfVIG7XpTxOLEmYgbxUrizOrLhxWJFdz
	FyudnKKBSwzX0Qqmn6YlLM9GZp9UOWQx1tW6HiLdY6ykfUK9lYHKs0o1jsyfUOmoG6hnbUX9UnZ7d
	wF0Obr7r65IoiesF7HVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reTqL-0000000GZc1-14ZZ;
	Mon, 26 Feb 2024 05:48:01 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reTqI-0000000GZaf-08hi;
	Mon, 26 Feb 2024 05:47:59 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-512bb2ed1f7so2834642e87.3;
        Sun, 25 Feb 2024 21:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708926474; x=1709531274; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9AaAZqwaMM3hlPPn5OnhezHOMjAT7L8+u/HDWjjaS8=;
        b=FBsSHc1cbbfIUZRNAutLoGYwd3Ax2hjyac15lsczntymuH5D41HUBndH4Nzio0zDDD
         ca6mjRR4Qs2ZZtqWeBMvr+brhZ2jUtVi/HniKgFU0xTOqdkozHqccud+BscQtIxTEfH2
         P+K4S4PtIGWhx790MhlpglibR/10VWwgrWQsRZOvNolP3Zrs3jk34GPwwnofvIJnnqi3
         Pq8tyTTHdLp56/aHo9hWcP/5Z+E7JiPSdqRrqIKfK9nUsLKPffktNZC8/5bgurPnpFGa
         22OsJOjyvJmzQJAwCrk6zYY6k4cy7M3CiHo0VIoNrjoQ6wAV6FtuZDrWsH2Gy+sAKGtN
         HN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708926474; x=1709531274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9AaAZqwaMM3hlPPn5OnhezHOMjAT7L8+u/HDWjjaS8=;
        b=vWhdVEDfli5hzXU9DL2rgTlFEvNA9Mi7u3P6C5+KSqqKoddyXUEG0+OhZsBgxZqQRn
         Hd+UnTyvBdopi6ZvWtmp/yPG5axfUuAooBEgWHbwqRzm2dkezq+geK5j7PhKkGT8dHfK
         3tLsGIQ92aVsCF7eCPCqXnGGpzB/ngvsZbb+NS2MdyazYnUVqdAmvgyofKlUHdlKK05A
         GErOM0lx/3hETjoho9HqnOVPP6XmuNl/fmH+cEqZfsAlk3h42+8Xg+KsJMo6GtSgO52s
         K5KrmIfxDcCebl9U1w3PO6iRCK9T19hMnC/Sqo8MYUhCZlJFZkQnpaCZshyxkIZ4i1BE
         otEg==
X-Forwarded-Encrypted: i=1; AJvYcCX4bEFsY4NVez6+a7urgyL6hFsmsXpI5EJbCLS5xJuxv6q9dSZFFgppJpZel7cOCX+Y19ptlpG6QDNxQSpqumUNGQJMZX3VW6sbJlh8DzjDPmTmuIidufJM58O6eUxPLLfvyUQcin1HJa5fD2jWwiCkHzOh8WV8Dv9Mt69wl8uhYQyFKmscR4XFXsA2f8NCBrcPa/iV
X-Gm-Message-State: AOJu0Yw8mxg7E/wc+DhU0DJao5vZbCZUZpZrEX30BzfaZFEdbREe+j3R
	F5y04szgATsIs7xoVWrwKe0QpyKLWsxCCrDfipQb5kPu4MzRG8O8A4CbuYyQf0n9ZW7z7GoEOxt
	Byl9GWfb/VTvKddzMlqkeRi1n9RE=
X-Google-Smtp-Source: AGHT+IFxFgCdVShdGgyihbmMGEdbb3FMU62WepRd4W/KTlGzWNAcQNvEg4IXZJAq58ExfevYjpOnAjGeQM4aCs7o1so=
X-Received: by 2002:a05:6512:314d:b0:512:e1e3:cd2c with SMTP id
 s13-20020a056512314d00b00512e1e3cd2cmr2961307lfi.69.1708926474284; Sun, 25
 Feb 2024 21:47:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com> <68856b86a93a4188558e5d0ebac0dd6aac8e404c.1705916069.git.haibo1.xu@intel.com>
 <CAOnJCULwRTSnrQkR2o1P53R=tJ3TAxX+y+XRBesW6OFEzgFv2g@mail.gmail.com>
 <CAJve8om2oOLg5-wKX7m7cBTgzwqiMcb35x=nDi1edY8evXjyMw@mail.gmail.com>
 <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com> <CAAhSdy2TVSt=gCJRf78AzXNVFKy8MGJ+QspSEHeedT7GPAYkUQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2TVSt=gCJRf78AzXNVFKy8MGJ+QspSEHeedT7GPAYkUQ@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 26 Feb 2024 13:47:42 +0800
Message-ID: <CAJve8onL5YB2w6duAr2H=8yJMh=SPsZCvgu+suhd=9U1_egHOg@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, 
	Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Guo Ren <guoren@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240225_214758_106068_F8445BF3 
X-CRM114-Status: GOOD (  34.02  )
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

T24gTW9uLCBGZWIgMjYsIDIwMjQgYXQgMToyMOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMjowN+KAr1BNIEF0
aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAyLzIwLzI0
IDE4OjEzLCBIYWlibyBYdSB3cm90ZToKPiA+ID4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgNzow
M+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+ID4gPj4K
PiA+ID4+IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDE6NDjigK9BTSBIYWlibyBYdSA8aGFpYm8x
Lnh1QGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+Pj4KPiA+ID4+PiBNb3ZlIHZjcHVfaGFzX2V4dCB0
byB0aGUgcHJvY2Vzc29yLmMgYW5kIHJlbmFtZSBpdCB0byBfX3ZjcHVfaGFzX2V4dAo+ID4gPj4+
IHNvIHRoYXQgb3RoZXIgdGVzdCBjYXNlcyBjYW4gdXNlIGl0IGZvciB2Q1BVIGV4dGVuc2lvbiBj
aGVjay4KPiA+ID4+Pgo+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVA
aW50ZWwuY29tPgo+ID4gPj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+ID4gPj4+IC0tLQo+ID4gPj4+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggfCAgMiArKwo+ID4gPj4+ICAgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyAgICAgfCAxMCArKysr
KysrKysrCj4gPiA+Pj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJl
Zy1saXN0LmMgICAgICB8IDExICstLS0tLS0tLS0tCj4gPiA+Pj4gICAzIGZpbGVzIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+ID4gPj4+Cj4gPiA+Pj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nv
ci5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29y
LmgKPiA+ID4+PiBpbmRleCBiNjhiMWI3MzFhMzQuLmJkMjdlMWM2NzU3OSAxMDA2NDQKPiA+ID4+
PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNz
b3IuaAo+ID4gPj4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jp
c2N2L3Byb2Nlc3Nvci5oCj4gPiA+Pj4gQEAgLTQyLDYgKzQyLDggQEAgc3RhdGljIGlubGluZSB1
aW50NjRfdCBfX2t2bV9yZWdfaWQodWludDY0X3QgdHlwZSwgdWludDY0X3QgaWR4LAo+ID4gPj4+
ICAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1JFRyhpZHgpIF9fa3ZtX3JlZ19pZChLVk1fUkVHX1JJ
U0NWX0lTQV9FWFQsIFwKPiA+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWR4LCBLVk1fUkVHX1NJWkVfVUxPTkcpCj4gPiA+Pj4KPiA+ID4+PiArYm9v
bCBfX3ZjcHVfaGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBleHQpOwo+ID4gPj4+
ICsKPiA+ID4+PiAgIHN0cnVjdCBleF9yZWdzIHsKPiA+ID4+PiAgICAgICAgICB1bnNpZ25lZCBs
b25nIHJhOwo+ID4gPj4+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3A7Cj4gPiA+Pj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gPiA+
Pj4gaW5kZXggMzlhMWU5OTAyZGVjLi5kYWQ3M2NlMTgxNjQgMTAwNjQ0Cj4gPiA+Pj4gLS0tIGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4gPj4+
ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMK
PiA+ID4+PiBAQCAtMTUsNiArMTUsMTYgQEAKPiA+ID4+Pgo+ID4gPj4+ICAgc3RhdGljIHZtX3Zh
ZGRyX3QgZXhjZXB0aW9uX2hhbmRsZXJzOwo+ID4gPj4+Cj4gPiA+Pj4gK2Jvb2wgX192Y3B1X2hh
c19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQo+ID4gPj4+ICt7Cj4gPiA+Pj4g
KyAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlID0gMDsKPiA+ID4+PiArICAgICAgIGludCByZXQ7
Cj4gPiA+Pj4gKwo+ID4gPj4+ICsgICAgICAgcmV0ID0gX192Y3B1X2dldF9yZWcodmNwdSwgUklT
Q1ZfSVNBX0VYVF9SRUcoZXh0KSwgJnZhbHVlKTsKPiA+ID4+PiArCj4gPiA+Pj4gKyAgICAgICBy
ZXR1cm4gIXJldCAmJiAhIXZhbHVlOwo+ID4gPj4+ICt9Cj4gPiA+Pj4gKwo+ID4gPj4KPiA+ID4+
IE5vdCBzdXJlIHdoYXQgd2FzIHRoZSBiYXNlIHBhdGNoIG9uIHdoaWNoIHRoaXMgd2FzIHJlYmFz
ZWQuIFRoZSBhY3R1YWwKPiA+ID4+IGNvbW1pdCBpbiB0aGUgcXVldWUgYnJhbmNoIGxvb2tzIGRp
ZmZlcmVudC4KPiA+ID4+Cj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggc2V0IHdhcyBiYXNlZCBvbiA2
LjctcmM4Lgo+ID4gPgo+ID4gPj4gaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC9j
b21taXQvNTU2MzUxN2NjMjAxMmUzMzI2NDExYjM2MGM5OTI0ZDNmMjcwNmM4ZAo+ID4gPj4KPiA+
ID4+IEJvdGggc2VlbSB0byBoYXZlIHRoZSBzYW1lIGJ1ZyB0aG91Z2ggdGhlIHRlc3RzIGZhaWwg
bm93IGFuZCByZXF1aXJlCj4gPiA+PiB0aGUgZm9sbG93aW5nIGZpeC4KPiA+ID4+IFRoZSBleHQg
aWQgc2hvdWxkIGJlIHVpbnQ2NF90IGFuZCB3ZSBuZWVkIHRvIHBhc3MgZXh0IGRpcmVjdGx5IHNv
IHRoYXQKPiA+ID4+IFNCSSBleHRlbnNpb24gdGVzdHMgY2FuIGFsc28gcGFzcy4KPiA+ID4+Cj4g
PiA+Cj4gPiA+IEl0J3Mgd2VpcmQgdGhhdCA2LjctcmM4IGhhcyBhbHJlYWR5IGluY2x1ZGVkIEFu
ZHJldydzIGNoYW5nZSBvbiB0aGUgSVNBIGV4dCByZWcsCj4gPiA+IGJ1dCB0aGlzIHBhdGNoIHdh
cyBub3QgZ2VuZXJhdGVkIGFnYWluc3QgaGlzIGNoYW5nZS4KPiA+ID4KPiA+ID4gY29tbWl0IGJk
ZjZhYTMyOGYxMzdlMTg0YjBmY2U2MDdmZDU4NTM1NGMzNzQyZjEKPiA+ID4gQXV0aG9yOiBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gPiBEYXRlOiAgIFdlZCBEZWMg
MTMgMTg6MDk6NTggMjAyMyArMDEwMAo+ID4gPgo+ID4gPiAgICAgIFJJU0MtVjogS1ZNOiBzZWxm
dGVzdHM6IFRyZWF0IFNCSSBleHQgcmVncyBsaWtlIElTQSBleHQgcmVncwo+ID4gPgo+ID4gPiBB
bnl3YXksIHlvdXIgY2hhbmdlcyB3ZXJlIHJpZ2h0LiBQbGVhc2UgZ28gYWhlYWQgdG8gaW5jbHVk
ZSB0aGVtIHdoZW4gbWVyZ2luZy4KPiA+ID4KPiA+Cj4gPiBJIGFtIG5vdCBzdXJlIHdoYXQgaGFw
cGVuZWQuIFByb2JhYmx5LCBhIG1lcmdlIGNvbmZsaWN0IGlzc3VlLgo+ID4KPiA+IEkganVzdCBy
ZWFsaXplZCBJIGZvcmdvdCB0byBjb3B5IHBhc3RlIGFub3RoZXIgZml4IGluIGFyY2ggdGltZXIK
PiA+Cj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvYXJjaF90aW1l
ci5jCj4gPiBAQCAtODUsNyArODUsNyBAQCBzdHJ1Y3Qga3ZtX3ZtICp0ZXN0X3ZtX2NyZWF0ZSh2
b2lkKQo+ID4gICAgICAgICAgaW50IG5yX3ZjcHVzID0gdGVzdF9hcmdzLm5yX3ZjcHVzOwo+ID4K
PiA+ICAgICAgICAgIHZtID0gdm1fY3JlYXRlX3dpdGhfdmNwdXMobnJfdmNwdXMsIGd1ZXN0X2Nv
ZGUsIHZjcHVzKTsKPiA+IC0gICAgICAgX19URVNUX1JFUVVJUkUoX192Y3B1X2hhc19leHQodmNw
dXNbMF0sIEtWTV9SSVNDVl9JU0FfRVhUX1NTVEMpLAo+ID4gKyAgICAgICBfX1RFU1RfUkVRVUlS
RShfX3ZjcHVfaGFzX2V4dCh2Y3B1c1swXSwKPiA+IFJJU0NWX0lTQV9FWFRfUkVHKEtWTV9SSVND
Vl9JU0FfRVhUX1NTVEMpKSwKPgo+IEkgaGF2ZSBzcXVhc2hlZCB0aGlzIGNoYW5nZSBpbnRvIGFu
IGV4aXN0aW5nIGNvbW1pdCBpbiByaXNjdl9rdm1fcXVldWUuCj4KPiBUaGFua3MsCj4gQW51cAo+
CgpUaGFua3MgYSBsb3QsIEFudXAhCgo+ID4KPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gSGFpYm8K
PiA+ID4KPiA+ID4+Cj4gPiA+PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5j
bHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+ID4gPj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiA+ID4+IEBAIC00OCw3ICs0OCw3IEBA
IHN0YXRpYyBpbmxpbmUgdWludDY0X3QgX19rdm1fcmVnX2lkKHVpbnQ2NF90IHR5cGUsCj4gPiA+
PiB1aW50NjRfdCBzdWJ0eXBlLAo+ID4gPj4gS1ZNX1JFR19SSVNDVl9TQklfU0lOR0xFLCBcCj4g
PiA+PiBpZHgsIEtWTV9SRUdfU0laRV9VTE9ORykKPiA+ID4+Cj4gPiA+PiAtYm9vbCBfX3ZjcHVf
aGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBleHQpOwo+ID4gPj4gK2Jvb2wgX192
Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1aW50NjRfdCBleHQpOwo+ID4gPj4K
PiA+ID4+IHN0cnVjdCBleF9yZWdzIHsKPiA+ID4+IHVuc2lnbmVkIGxvbmcgcmE7Cj4gPiA+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNz
b3IuYwo+ID4gPj4gYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nl
c3Nvci5jCj4gPiA+PiBpbmRleCAyODI1ODdjZDRiYmMuLmVjNjZkMzMxYTEyNyAxMDA2NDQKPiA+
ID4+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29y
LmMKPiA+ID4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJv
Y2Vzc29yLmMKPiA+ID4+IEBAIC0xNSwxMiArMTUsMTIgQEAKPiA+ID4+Cj4gPiA+PiBzdGF0aWMg
dm1fdmFkZHJfdCBleGNlcHRpb25faGFuZGxlcnM7Cj4gPiA+Pgo+ID4gPj4gLWJvb2wgX192Y3B1
X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQo+ID4gPj4gK2Jvb2wgX192
Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1aW50NjRfdCBleHQpCj4gPiA+PiB7
Cj4gPiA+PiB1bnNpZ25lZCBsb25nIHZhbHVlID0gMDsKPiA+ID4+IGludCByZXQ7Cj4gPiA+Pgo+
ID4gPj4gLSByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9JU0FfRVhUX1JFRyhleHQp
LCAmdmFsdWUpOwo+ID4gPj4gKyByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBleHQsICZ2YWx1
ZSk7Cj4gPiA+Pgo+ID4gPj4gcmV0dXJuICFyZXQgJiYgISF2YWx1ZTsKPiA+ID4+IH0KPiA+ID4+
Cj4gPiA+PiBXaXRoIHRoZSBhYm92ZSB0aGUgZml4LCBCb3RoIFNCSS9JU0EgZXh0ZW5zaW9uIHRl
c3RzIHBhc3MuCj4gPiA+PiAjIC4vZ2V0LXJlZy1saXN0Cj4gPiA+PiBzYmktYmFzZTogUEFTUwo+
ID4gPj4gc2JpLXN0YTogUEFTUwo+ID4gPj4gc2JpLXBtdTogUEFTUwo+ID4gPj4gc2JpLWRiY246
IFBBU1MKPiA+ID4+IGFpYTogUEFTUwo+ID4gPj4gZnBfZjogUEFTUwo+ID4gPj4gZnBfZDogUEFT
Uwo+ID4gPj4gMS4uMCAjIFNLSVAgLSBoIG5vdCBhdmFpbGFibGUsIHNraXBwaW5nIHRlc3RzCj4g
PiA+PiBzbXN0YXRlZW46IFBBU1MKPiA+ID4+IHNzY29mcG1mOiBQQVNTCj4gPiA+PiBzc3RjOiBQ
QVNTCj4gPiA+PiAxLi4wICMgU0tJUCAtIHN2aW52YWwgbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcg
dGVzdHMKPiA+ID4+IDEuLjAgIyBTS0lQIC0gc3ZuYXBvdCBub3QgYXZhaWxhYmxlLCBza2lwcGlu
ZyB0ZXN0cwo+ID4gPj4gMS4uMCAjIFNLSVAgLSBzdnBibXQgbm90IGF2YWlsYWJsZSwgc2tpcHBp
bmcgdGVzdHMKPiA+ID4+IHpiYTogUEFTUwo+ID4gPj4gemJiOiBQQVNTCj4gPiA+PiB6YmM6IFBB
U1MKPiA+ID4+IDEuLjAgIyBTS0lQIC0gemJrYiBub3QgYXZhaWxhYmxlLCBza2lwcGluZyB0ZXN0
cwo+ID4gPj4gMS4uMCAjIFNLSVAgLSB6YmtjIG5vdCBhdmFpbGFibGUsIHNraXBwaW5nIHRlc3Rz
Cj4gPiA+PiAxLi4wICMgU0tJUCAtIHpia3ggbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHMK
PiA+ID4+IHpiczogUEFTUwo+ID4gPj4gemZhOiBQQVNTCj4gPiA+PiAxLi4wICMgU0tJUCAtIHpm
aCBub3QgYXZhaWxhYmxlLCBza2lwcGluZyB0ZXN0cwo+ID4gPj4gMS4uMCAjIFNLSVAgLSB6Zmht
aW4gbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHMKPiA+ID4+IHppY2JvbTogUEFTUwo+ID4g
Pj4gemljYm96OiBQQVNTCj4gPiA+PiB6aWNudHI6IFBBU1MKPiA+ID4+IDEuLjAgIyBTS0lQIC0g
emljb25kIG5vdCBhdmFpbGFibGUsIHNraXBwaW5nIHRlc3RzCj4gPiA+PiB6aWNzcjogUEFTUwo+
ID4gPj4gemlmZW5jZWk6IFBBU1MKPiA+ID4+IHppaGludG50bDogUEFTUwo+ID4gPj4gemloaW50
cGF1c2U6IFBBU1MKPiA+ID4+IHppaHBtOiBQQVNTCj4gPiA+Pgo+ID4gPj4KPiA+ID4+PiAgIHN0
YXRpYyB1aW50NjRfdCBwYWdlX2FsaWduKHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50NjRfdCB2KQo+
ID4gPj4+ICAgewo+ID4gPj4+ICAgICAgICAgIHJldHVybiAodiArIHZtLT5wYWdlX3NpemUpICYg
fih2bS0+cGFnZV9zaXplIC0gMSk7Cj4gPiA+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gPj4+IGluZGV4IDI1ZGU0YjhiYzM0Ny4u
ZWQyOWJhNDU1ODhjIDEwMDY0NAo+ID4gPj4+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gPj4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gPj4+IEBAIC03NSwxNSArNzUsNiBA
QCBib29sIGNoZWNrX3JlamVjdF9zZXQoaW50IGVycikKPiA+ID4+PiAgICAgICAgICByZXR1cm4g
ZXJyID09IEVJTlZBTDsKPiA+ID4+PiAgIH0KPiA+ID4+Pgo+ID4gPj4+IC1zdGF0aWMgaW5saW5l
IGJvb2wgdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkKPiA+ID4+
PiAtewo+ID4gPj4+IC0gICAgICAgaW50IHJldDsKPiA+ID4+PiAtICAgICAgIHVuc2lnbmVkIGxv
bmcgdmFsdWU7Cj4gPiA+Pj4gLQo+ID4gPj4+IC0gICAgICAgcmV0ID0gX192Y3B1X2dldF9yZWco
dmNwdSwgUklTQ1ZfSVNBX0VYVF9SRUcoZXh0KSwgJnZhbHVlKTsKPiA+ID4+PiAtICAgICAgIHJl
dHVybiAocmV0KSA/IGZhbHNlIDogISF2YWx1ZTsKPiA+ID4+PiAtfQo+ID4gPj4+IC0KPiA+ID4+
PiAgIHZvaWQgZmluYWxpemVfdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCB2Y3B1
X3JlZ19saXN0ICpjKQo+ID4gPj4+ICAgewo+ID4gPj4+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
aXNhX2V4dF9zdGF0ZVtLVk1fUklTQ1ZfSVNBX0VYVF9NQVhdID0geyAwIH07Cj4gPiA+Pj4gQEAg
LTExMSw3ICsxMDIsNyBAQCB2b2lkIGZpbmFsaXplX3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+ID4+PiAgICAgICAgICAgICAgICAgIF9fdmNw
dV9zZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKHMtPmZlYXR1cmUpLCAxKTsKPiA+ID4+
Pgo+ID4gPj4+ICAgICAgICAgICAgICAgICAgLyogRG91YmxlIGNoZWNrIHdoZXRoZXIgdGhlIGRl
c2lyZWQgZXh0ZW5zaW9uIHdhcyBlbmFibGVkICovCj4gPiA+Pj4gLSAgICAgICAgICAgICAgIF9f
VEVTVF9SRVFVSVJFKHZjcHVfaGFzX2V4dCh2Y3B1LCBzLT5mZWF0dXJlKSwKPiA+ID4+PiArICAg
ICAgICAgICAgICAgX19URVNUX1JFUVVJUkUoX192Y3B1X2hhc19leHQodmNwdSwgcy0+ZmVhdHVy
ZSksCj4gPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXMgbm90IGF2YWls
YWJsZSwgc2tpcHBpbmcgdGVzdHNcbiIsIHMtPm5hbWUpOwo+ID4gPj4+ICAgICAgICAgIH0KPiA+
ID4+PiAgIH0KPiA+ID4+PiAtLQo+ID4gPj4+IDIuMzQuMQo+ID4gPj4+Cj4gPiA+Pgo+ID4gPj4K
PiA+ID4+IC0tCj4gPiA+PiBSZWdhcmRzLAo+ID4gPj4gQXRpc2gKPiA+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
