Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB3DC48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDXgLeNvYSvurQR3rqEXZLTbHCzyx9BXoW+iNEBWTmo=; b=RGFQ30ykLGdWrY
	audKBO42lcbirbGO7KZFnty71/rYNPc5pYmq3cxRcMPuHQ6Ee2p/f8B7MHEdyT8VHX84aknXR6S8D
	TkqCDev2yMt6O49QxfRjvlVYwZQvIwyrsUVEwdGGaL6hiHBOy3s6KIE62JVi/AYV1IL9w0ba2tqMD
	+75GwAh9ncJulHkGFriVIvPgPoQHCLn9evnP1KJlpJm1nSpmowL8xpt7+uwvCm/B88DQxmjHJPG8H
	Bdbq+1CR6fWNob6JAA+cBClV5tOYyJp8D7s954By5AUkN9tHxXX9pkVz9ew1nT0OjHtuUUJ8kgH56
	f8Pp2VYz4nxD+/f85xDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rci6e-000000005YO-1Ptt;
	Wed, 21 Feb 2024 08:37:32 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rci6Z-000000005Wn-3Tcu
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 08:37:29 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-59927972125so4194563eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708504646; x=1709109446; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMnw9vKJcK+lbDT8FYPd91pzbpe6XkA1QZvMTkaziM0=;
        b=TGsus5tkIe8hHoz6+hPyB5+uI4IDauVF+eqJ0CPrHeJLOm11eIT1HXiSmn8vHWUZYq
         hp9nPfb/3sxLnkVq7V90op3CP2sh2Qk5UBA+3iOTMmMJBVbWiOcoXu+W0kaxu5sSu2GZ
         RIARbTAD7pgYl4tEM8uBnTxVaHZd2DSsGshWAegDgWEKJ/yI6Q3S6cRXxztT8m2M98oq
         b67YnnjndiSiJ7T4eEOCx1tSmMK/R7A3nb0RDPCSGRxTEdm+p7VwDYHnAEQwNlkTngwO
         m1CjUEv831kpxObqYAfe2vRwDmHtuRwX/Ev+TLxbDduDlxijjietDyegsCV5t0zqmuEW
         3YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708504646; x=1709109446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMnw9vKJcK+lbDT8FYPd91pzbpe6XkA1QZvMTkaziM0=;
        b=LUf4O+79UCReU8hN8zpJF2of50oqpOspeV87KGFgV8fRjjfuP5kdAqfBIlVAfGUJCJ
         qFLG+0iJrVJkmpMjT0anu6xCnVamoPDzx5ztSjPgjxmJbFGpixhCdAruHtSEWiL0fVTz
         Bi6rBEV3VzHXQXi5160ScKSLJ6vzLhqSpgq1BjSSJpzR5ZvSyhT4JF1EO/5Mj6NCl/65
         zn66N9NqqNt3h5YrdvP+dt++L68kbhZi58XSZk3sG83dnmIrj78uMDNHx2bbtPpWI2nR
         JiVedoTJE9L3s8QktGpJDW9PMstmaqJDl7JCEbCzhOmo+n7dCARhFtDuIgEwfwCfKvOS
         zlvA==
X-Forwarded-Encrypted: i=1; AJvYcCV5lNWv5Tahk1/YQndESMuJXzGYki+yszsKwLjv5d0xGdawMzUqth0mnn2B6M9b1FdT/d3SoRnXWpaZRr90ovBL9uf4RFY81Q7NHjw2D7jF
X-Gm-Message-State: AOJu0YzP0UUh0mNvUbn6cLEs+VtJm2K1gU/BlZgzWAgfqJKwtHlpSZNs
	w3fO/tox9fbVBHjWM7bE4Fb6IYNHk6kdF1i39dgelT6bNaQXIzGwJ/P7OXgbtR8=
X-Google-Smtp-Source: AGHT+IGwSgsjE3CPVeonNtgWRogjIsKu+qKysC/zJGjHtavZzYR//zpXfv8521DVEpjsYdm9vUOFzw==
X-Received: by 2002:a05:6871:1cc:b0:21a:43e6:9479 with SMTP id q12-20020a05687101cc00b0021a43e69479mr19017547oad.25.1708504646344;
        Wed, 21 Feb 2024 00:37:26 -0800 (PST)
Received: from [172.16.0.18] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id h6-20020a63c006000000b0059b2316be86sm8040427pgg.46.2024.02.21.00.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 00:37:25 -0800 (PST)
Message-ID: <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com>
Date: Wed, 21 Feb 2024 00:37:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
Content-Language: en-US
To: Haibo Xu <xiaobo55x@gmail.com>, Atish Patra <atishp@atishpatra.org>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>,
 Minda Chen <minda.chen@starfivetech.com>, Jisheng Zhang
 <jszhang@kernel.org>, Sean Christopherson <seanjc@google.com>,
 Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>,
 Vipin Sharma <vipinsh@google.com>, Thomas Huth <thuth@redhat.com>,
 Aaron Lewis <aaronlewis@google.com>,
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm-riscv@lists.infradead.org
References: <cover.1705916069.git.haibo1.xu@intel.com>
 <68856b86a93a4188558e5d0ebac0dd6aac8e404c.1705916069.git.haibo1.xu@intel.com>
 <CAOnJCULwRTSnrQkR2o1P53R=tJ3TAxX+y+XRBesW6OFEzgFv2g@mail.gmail.com>
 <CAJve8om2oOLg5-wKX7m7cBTgzwqiMcb35x=nDi1edY8evXjyMw@mail.gmail.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <CAJve8om2oOLg5-wKX7m7cBTgzwqiMcb35x=nDi1edY8evXjyMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_003727_901890_1FEB2927 
X-CRM114-Status: GOOD (  24.23  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi8yMC8yNCAxODoxMywgSGFpYm8gWHUgd3JvdGU6Cj4gT24gV2VkLCBGZWIgMjEsIDIwMjQg
YXQgNzowM+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+
Pgo+PiBPbiBNb24sIEphbiAyMiwgMjAyNCBhdCAxOjQ44oCvQU0gSGFpYm8gWHUgPGhhaWJvMS54
dUBpbnRlbC5jb20+IHdyb3RlOgo+Pj4KPj4+IE1vdmUgdmNwdV9oYXNfZXh0IHRvIHRoZSBwcm9j
ZXNzb3IuYyBhbmQgcmVuYW1lIGl0IHRvIF9fdmNwdV9oYXNfZXh0Cj4+PiBzbyB0aGF0IG90aGVy
IHRlc3QgY2FzZXMgY2FuIHVzZSBpdCBmb3IgdkNQVSBleHRlbnNpb24gY2hlY2suCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4+PiBSZXZpZXdl
ZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPj4+IC0tLQo+Pj4g
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaCB8
ICAyICsrCj4+PiAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vz
c29yLmMgICAgIHwgMTAgKysrKysrKysrKwo+Pj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICB8IDExICstLS0tLS0tLS0tCj4+PiAgIDMgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nl
c3Nvci5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vz
c29yLmgKPj4+IGluZGV4IGI2OGIxYjczMWEzNC4uYmQyN2UxYzY3NTc5IDEwMDY0NAo+Pj4gLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgK
Pj4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nl
c3Nvci5oCj4+PiBAQCAtNDIsNiArNDIsOCBAQCBzdGF0aWMgaW5saW5lIHVpbnQ2NF90IF9fa3Zt
X3JlZ19pZCh1aW50NjRfdCB0eXBlLCB1aW50NjRfdCBpZHgsCj4+PiAgICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9SRUcoaWR4KSBfX2t2bV9yZWdfaWQoS1ZNX1JFR19SSVNDVl9JU0FfRVhULCBcCj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWR4LCBLVk1f
UkVHX1NJWkVfVUxPTkcpCj4+Pgo+Pj4gK2Jvb2wgX192Y3B1X2hhc19leHQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBpbnQgZXh0KTsKPj4+ICsKPj4+ICAgc3RydWN0IGV4X3JlZ3Mgewo+Pj4gICAg
ICAgICAgdW5zaWduZWQgbG9uZyByYTsKPj4+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3A7Cj4+
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9j
ZXNzb3IuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29y
LmMKPj4+IGluZGV4IDM5YTFlOTkwMmRlYy4uZGFkNzNjZTE4MTY0IDEwMDY0NAo+Pj4gLS0tIGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+Pj4gKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+Pj4g
QEAgLTE1LDYgKzE1LDE2IEBACj4+Pgo+Pj4gICBzdGF0aWMgdm1fdmFkZHJfdCBleGNlcHRpb25f
aGFuZGxlcnM7Cj4+Pgo+Pj4gK2Jvb2wgX192Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBpbnQgZXh0KQo+Pj4gK3sKPj4+ICsgICAgICAgdW5zaWduZWQgbG9uZyB2YWx1ZSA9IDA7
Cj4+PiArICAgICAgIGludCByZXQ7Cj4+PiArCj4+PiArICAgICAgIHJldCA9IF9fdmNwdV9nZXRf
cmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGV4dCksICZ2YWx1ZSk7Cj4+PiArCj4+PiArICAg
ICAgIHJldHVybiAhcmV0ICYmICEhdmFsdWU7Cj4+PiArfQo+Pj4gKwo+Pgo+PiBOb3Qgc3VyZSB3
aGF0IHdhcyB0aGUgYmFzZSBwYXRjaCBvbiB3aGljaCB0aGlzIHdhcyByZWJhc2VkLiBUaGUgYWN0
dWFsCj4+IGNvbW1pdCBpbiB0aGUgcXVldWUgYnJhbmNoIGxvb2tzIGRpZmZlcmVudC4KPj4KPiAK
PiBUaGlzIHBhdGNoIHNldCB3YXMgYmFzZWQgb24gNi43LXJjOC4KPiAKPj4gaHR0cHM6Ly9naXRo
dWIuY29tL2t2bS1yaXNjdi9saW51eC9jb21taXQvNTU2MzUxN2NjMjAxMmUzMzI2NDExYjM2MGM5
OTI0ZDNmMjcwNmM4ZAo+Pgo+PiBCb3RoIHNlZW0gdG8gaGF2ZSB0aGUgc2FtZSBidWcgdGhvdWdo
IHRoZSB0ZXN0cyBmYWlsIG5vdyBhbmQgcmVxdWlyZQo+PiB0aGUgZm9sbG93aW5nIGZpeC4KPj4g
VGhlIGV4dCBpZCBzaG91bGQgYmUgdWludDY0X3QgYW5kIHdlIG5lZWQgdG8gcGFzcyBleHQgZGly
ZWN0bHkgc28gdGhhdAo+PiBTQkkgZXh0ZW5zaW9uIHRlc3RzIGNhbiBhbHNvIHBhc3MuCj4+Cj4g
Cj4gSXQncyB3ZWlyZCB0aGF0IDYuNy1yYzggaGFzIGFscmVhZHkgaW5jbHVkZWQgQW5kcmV3J3Mg
Y2hhbmdlIG9uIHRoZSBJU0EgZXh0IHJlZywKPiBidXQgdGhpcyBwYXRjaCB3YXMgbm90IGdlbmVy
YXRlZCBhZ2FpbnN0IGhpcyBjaGFuZ2UuCj4gCj4gY29tbWl0IGJkZjZhYTMyOGYxMzdlMTg0YjBm
Y2U2MDdmZDU4NTM1NGMzNzQyZjEKPiBBdXRob3I6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+Cj4gRGF0ZTogICBXZWQgRGVjIDEzIDE4OjA5OjU4IDIwMjMgKzAxMDAKPiAK
PiAgICAgIFJJU0MtVjogS1ZNOiBzZWxmdGVzdHM6IFRyZWF0IFNCSSBleHQgcmVncyBsaWtlIElT
QSBleHQgcmVncwo+IAo+IEFueXdheSwgeW91ciBjaGFuZ2VzIHdlcmUgcmlnaHQuIFBsZWFzZSBn
byBhaGVhZCB0byBpbmNsdWRlIHRoZW0gd2hlbiBtZXJnaW5nLgo+IAoKSSBhbSBub3Qgc3VyZSB3
aGF0IGhhcHBlbmVkLiBQcm9iYWJseSwgYSBtZXJnZSBjb25mbGljdCBpc3N1ZS4KCkkganVzdCBy
ZWFsaXplZCBJIGZvcmdvdCB0byBjb3B5IHBhc3RlIGFub3RoZXIgZml4IGluIGFyY2ggdGltZXIK
CisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMKQEAg
LTg1LDcgKzg1LDcgQEAgc3RydWN0IGt2bV92bSAqdGVzdF92bV9jcmVhdGUodm9pZCkKICAgICAg
ICAgaW50IG5yX3ZjcHVzID0gdGVzdF9hcmdzLm5yX3ZjcHVzOwoKICAgICAgICAgdm0gPSB2bV9j
cmVhdGVfd2l0aF92Y3B1cyhucl92Y3B1cywgZ3Vlc3RfY29kZSwgdmNwdXMpOwotICAgICAgIF9f
VEVTVF9SRVFVSVJFKF9fdmNwdV9oYXNfZXh0KHZjcHVzWzBdLCBLVk1fUklTQ1ZfSVNBX0VYVF9T
U1RDKSwKKyAgICAgICBfX1RFU1RfUkVRVUlSRShfX3ZjcHVfaGFzX2V4dCh2Y3B1c1swXSwgClJJ
U0NWX0lTQV9FWFRfUkVHKEtWTV9SSVNDVl9JU0FfRVhUX1NTVEMpKSwKCgo+IFRoYW5rcywKPiBI
YWlibwo+IAo+Pgo+PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9y
aXNjdi9wcm9jZXNzb3IuaAo+PiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5j
bHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+PiBAQCAtNDgsNyArNDgsNyBAQCBzdGF0aWMgaW5saW5l
IHVpbnQ2NF90IF9fa3ZtX3JlZ19pZCh1aW50NjRfdCB0eXBlLAo+PiB1aW50NjRfdCBzdWJ0eXBl
LAo+PiBLVk1fUkVHX1JJU0NWX1NCSV9TSU5HTEUsIFwKPj4gaWR4LCBLVk1fUkVHX1NJWkVfVUxP
TkcpCj4+Cj4+IC1ib29sIF9fdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50
IGV4dCk7Cj4+ICtib29sIF9fdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdWlu
dDY0X3QgZXh0KTsKPj4KPj4gc3RydWN0IGV4X3JlZ3Mgewo+PiB1bnNpZ25lZCBsb25nIHJhOwo+
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9j
ZXNzb3IuYwo+PiBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vz
c29yLmMKPj4gaW5kZXggMjgyNTg3Y2Q0YmJjLi5lYzY2ZDMzMWExMjcgMTAwNjQ0Cj4+IC0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPj4gKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+PiBA
QCAtMTUsMTIgKzE1LDEyIEBACj4+Cj4+IHN0YXRpYyB2bV92YWRkcl90IGV4Y2VwdGlvbl9oYW5k
bGVyczsKPj4KPj4gLWJvb2wgX192Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBp
bnQgZXh0KQo+PiArYm9vbCBfX3ZjcHVfaGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVp
bnQ2NF90IGV4dCkKPj4gewo+PiB1bnNpZ25lZCBsb25nIHZhbHVlID0gMDsKPj4gaW50IHJldDsK
Pj4KPj4gLSByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9JU0FfRVhUX1JFRyhleHQp
LCAmdmFsdWUpOwo+PiArIHJldCA9IF9fdmNwdV9nZXRfcmVnKHZjcHUsIGV4dCwgJnZhbHVlKTsK
Pj4KPj4gcmV0dXJuICFyZXQgJiYgISF2YWx1ZTsKPj4gfQo+Pgo+PiBXaXRoIHRoZSBhYm92ZSB0
aGUgZml4LCBCb3RoIFNCSS9JU0EgZXh0ZW5zaW9uIHRlc3RzIHBhc3MuCj4+ICMgLi9nZXQtcmVn
LWxpc3QKPj4gc2JpLWJhc2U6IFBBU1MKPj4gc2JpLXN0YTogUEFTUwo+PiBzYmktcG11OiBQQVNT
Cj4+IHNiaS1kYmNuOiBQQVNTCj4+IGFpYTogUEFTUwo+PiBmcF9mOiBQQVNTCj4+IGZwX2Q6IFBB
U1MKPj4gMS4uMCAjIFNLSVAgLSBoIG5vdCBhdmFpbGFibGUsIHNraXBwaW5nIHRlc3RzCj4+IHNt
c3RhdGVlbjogUEFTUwo+PiBzc2NvZnBtZjogUEFTUwo+PiBzc3RjOiBQQVNTCj4+IDEuLjAgIyBT
S0lQIC0gc3ZpbnZhbCBub3QgYXZhaWxhYmxlLCBza2lwcGluZyB0ZXN0cwo+PiAxLi4wICMgU0tJ
UCAtIHN2bmFwb3Qgbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHMKPj4gMS4uMCAjIFNLSVAg
LSBzdnBibXQgbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdHMKPj4gemJhOiBQQVNTCj4+IHpi
YjogUEFTUwo+PiB6YmM6IFBBU1MKPj4gMS4uMCAjIFNLSVAgLSB6YmtiIG5vdCBhdmFpbGFibGUs
IHNraXBwaW5nIHRlc3RzCj4+IDEuLjAgIyBTS0lQIC0gemJrYyBub3QgYXZhaWxhYmxlLCBza2lw
cGluZyB0ZXN0cwo+PiAxLi4wICMgU0tJUCAtIHpia3ggbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcg
dGVzdHMKPj4gemJzOiBQQVNTCj4+IHpmYTogUEFTUwo+PiAxLi4wICMgU0tJUCAtIHpmaCBub3Qg
YXZhaWxhYmxlLCBza2lwcGluZyB0ZXN0cwo+PiAxLi4wICMgU0tJUCAtIHpmaG1pbiBub3QgYXZh
aWxhYmxlLCBza2lwcGluZyB0ZXN0cwo+PiB6aWNib206IFBBU1MKPj4gemljYm96OiBQQVNTCj4+
IHppY250cjogUEFTUwo+PiAxLi4wICMgU0tJUCAtIHppY29uZCBub3QgYXZhaWxhYmxlLCBza2lw
cGluZyB0ZXN0cwo+PiB6aWNzcjogUEFTUwo+PiB6aWZlbmNlaTogUEFTUwo+PiB6aWhpbnRudGw6
IFBBU1MKPj4gemloaW50cGF1c2U6IFBBU1MKPj4gemlocG06IFBBU1MKPj4KPj4KPj4+ICAgc3Rh
dGljIHVpbnQ2NF90IHBhZ2VfYWxpZ24oc3RydWN0IGt2bV92bSAqdm0sIHVpbnQ2NF90IHYpCj4+
PiAgIHsKPj4+ICAgICAgICAgIHJldHVybiAodiArIHZtLT5wYWdlX3NpemUpICYgfih2bS0+cGFn
ZV9zaXplIC0gMSk7Cj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2
L2dldC1yZWctbGlzdC5jCj4+PiBpbmRleCAyNWRlNGI4YmMzNDcuLmVkMjliYTQ1NTg4YyAxMDA2
NDQKPj4+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxp
c3QuYwo+Pj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWct
bGlzdC5jCj4+PiBAQCAtNzUsMTUgKzc1LDYgQEAgYm9vbCBjaGVja19yZWplY3Rfc2V0KGludCBl
cnIpCj4+PiAgICAgICAgICByZXR1cm4gZXJyID09IEVJTlZBTDsKPj4+ICAgfQo+Pj4KPj4+IC1z
dGF0aWMgaW5saW5lIGJvb2wgdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50
IGV4dCkKPj4+IC17Cj4+PiAtICAgICAgIGludCByZXQ7Cj4+PiAtICAgICAgIHVuc2lnbmVkIGxv
bmcgdmFsdWU7Cj4+PiAtCj4+PiAtICAgICAgIHJldCA9IF9fdmNwdV9nZXRfcmVnKHZjcHUsIFJJ
U0NWX0lTQV9FWFRfUkVHKGV4dCksICZ2YWx1ZSk7Cj4+PiAtICAgICAgIHJldHVybiAocmV0KSA/
IGZhbHNlIDogISF2YWx1ZTsKPj4+IC19Cj4+PiAtCj4+PiAgIHZvaWQgZmluYWxpemVfdmNwdShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+Pj4gICB7Cj4+
PiAgICAgICAgICB1bnNpZ25lZCBsb25nIGlzYV9leHRfc3RhdGVbS1ZNX1JJU0NWX0lTQV9FWFRf
TUFYXSA9IHsgMCB9Owo+Pj4gQEAgLTExMSw3ICsxMDIsNyBAQCB2b2lkIGZpbmFsaXplX3ZjcHUo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPj4+ICAgICAg
ICAgICAgICAgICAgX192Y3B1X3NldF9yZWcodmNwdSwgUklTQ1ZfSVNBX0VYVF9SRUcocy0+ZmVh
dHVyZSksIDEpOwo+Pj4KPj4+ICAgICAgICAgICAgICAgICAgLyogRG91YmxlIGNoZWNrIHdoZXRo
ZXIgdGhlIGRlc2lyZWQgZXh0ZW5zaW9uIHdhcyBlbmFibGVkICovCj4+PiAtICAgICAgICAgICAg
ICAgX19URVNUX1JFUVVJUkUodmNwdV9oYXNfZXh0KHZjcHUsIHMtPmZlYXR1cmUpLAo+Pj4gKyAg
ICAgICAgICAgICAgIF9fVEVTVF9SRVFVSVJFKF9fdmNwdV9oYXNfZXh0KHZjcHUsIHMtPmZlYXR1
cmUpLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXMgbm90IGF2YWlsYWJs
ZSwgc2tpcHBpbmcgdGVzdHNcbiIsIHMtPm5hbWUpOwo+Pj4gICAgICAgICAgfQo+Pj4gICB9Cj4+
PiAtLQo+Pj4gMi4zNC4xCj4+Pgo+Pgo+Pgo+PiAtLQo+PiBSZWdhcmRzLAo+PiBBdGlzaAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
