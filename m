Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4F7C5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 20:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sv9hrP6WR8jQwCo07gLW2H0aq2d8IhMGO7TGMbSKBMk=; b=j1oEjJDujOxFm/
	xZ7E2xv+tWhSH6MJsE1X6BRB0+Vl8zUcc+Lgh/gOikwlULahfD466j09OtsmEPOjZzwiLkKFMDiFH
	MH91+Pdpd0KgA0rXMSAhvYv5IjwgvT3by9tRBRxzHbfZMB2M59AyudM/4d4WaU0Hpb1dVYLFRGBxN
	Q1YLe7MivEwDGzyTeNYEURrIQa12V28zUWbS6KFkxNvJ65ZCnTMrjcAUnDm8oSnacBZ27NQychGmT
	28OLv7oWm3t3r/78eoNayXrayrmicuKor8bYP9M3QYbRMtsaYhDH/iz9P0iE2OkeVgKYPWIMr8Og1
	B+4OkayRlKw2SGoNXyLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rctDY-00000002UCl-18za;
	Wed, 21 Feb 2024 20:29:24 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rctDU-00000002U9w-0Q78
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 20:29:21 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-299354e5f01so128743a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 12:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708547357; x=1709152157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sTCGMEew0Fipe902SlrRK/D4WW/nSfSfZfwf/W230pM=;
        b=PMHIrFcowplK/EzkvE4IQyzK5FFkwvedVLa+EEh6VisnfRfcfCjPRdNWOa/JRr6h5H
         wCbyc0Xvso/ZcBHTMXrFvMdJoogaWxyT7+x9cYu0KVrs1/adkCNOI+KhNT8/z7vXOCpT
         Ni4KaFwYcxVI7tzyjiU4vAvnRBnqH04ULRm8uWHZhT6WMnnmgl7AtH/f0wNu3cib6gTV
         D7G2QPxx7yr6LUj09LB5OgCqnEN80trzvZf9GVJHQlG55PRhGduENU2ifEwgQYWJZH++
         4P90m5wbdvy5zflb1gUSOWRvbjtbE+FZrpH4ztOBgxyGEQI19b+1JYVVwU27igd5bUPc
         C6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708547357; x=1709152157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTCGMEew0Fipe902SlrRK/D4WW/nSfSfZfwf/W230pM=;
        b=jo6CP3G53h7T+PAiT8Cr/CtIMxCXDPmYiXcdBILWj34KpNHHwH0PMhY6pTIgLPDq8f
         +T0YFGK7GaiSu5Tdvxx0191AHwd3HtCqj5UA0MLQmOeRh/ELgxcQ6j3jp2Drxhi2JuGQ
         +hzFDcAfh55zJ8GzFNitQNs3lc2qPaNI7Skv867eCgQ3s4dTgAkYRhpad1ORLTx53e0c
         h0h9szWUbt1wa30KFrX0Yuvzl159HfIsnf7ogtwEzsWXnyrK+UQ8Tppl+looLQjPJ+HI
         Ld3vrrLujG1tfcHfnxDTk+fa+1Oo50AtarsxnP2RWYHybkufkdGnOd9qY6xL7j3Gy9HQ
         o53Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3rQYfRShspbkoFzoMqH9frYyjcN5V0MiIGNiST0tVGBy56GoeXAzRYxywCllsHTnchH0HudwC7Dp06P5JYeS2FRSAPJ6gOQMdEEn08xkW
X-Gm-Message-State: AOJu0YxDWMPHS4Gbmsumrz6ivOFMOnjO1EL4GYN5tsZRBS0KNidCzN/I
	M9L/WUW+ZpUwK32YXOZriXZESU6w85ZbTyqQ1kjQumYESfu/A8+ZzejoTQqIMZI=
X-Google-Smtp-Source: AGHT+IEv0rIXEEFymfbI7hv6WvIwIaG4wxAzbyU2mSU6ZNYe3WU2p1qg0ejBWvWUS0oTykMJfq8rng==
X-Received: by 2002:a17:90b:3007:b0:299:8e05:4d7b with SMTP id hg7-20020a17090b300700b002998e054d7bmr783238pjb.4.1708547357279;
        Wed, 21 Feb 2024 12:29:17 -0800 (PST)
Received: from [172.16.0.69] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id pd18-20020a17090b1dd200b0029696f7f443sm2303021pjb.50.2024.02.21.12.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 12:29:16 -0800 (PST)
Message-ID: <b5673bce-09e7-4531-a074-e252aa9e38e8@rivosinc.com>
Date: Wed, 21 Feb 2024 12:29:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
Content-Language: en-US
To: Haibo Xu <xiaobo55x@gmail.com>, Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>, Haibo Xu <haibo1.xu@intel.com>,
 ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Guo Ren <guoren@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>,
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
 <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com>
 <CAJve8omCZxsiP1jF0n5SBh0_U6q7Exj5A1ACFahWpdBoxohaMA@mail.gmail.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <CAJve8omCZxsiP1jF0n5SBh0_U6q7Exj5A1ACFahWpdBoxohaMA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_122920_183849_8FD5A4C7 
X-CRM114-Status: GOOD (  21.20  )
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

T24gMi8yMS8yNCAwNTowOCwgSGFpYm8gWHUgd3JvdGU6Cj4gT24gV2VkLCBGZWIgMjEsIDIwMjQg
YXQgNDozN+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPiB3cm90ZToKPj4K
Pj4gT24gMi8yMC8yNCAxODoxMywgSGFpYm8gWHUgd3JvdGU6Cj4+PiBPbiBXZWQsIEZlYiAyMSwg
MjAyNCBhdCA3OjAz4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEBhdGlzaHBhdHJhLm9yZz4gd3Jv
dGU6Cj4+Pj4KPj4+PiBPbiBNb24sIEphbiAyMiwgMjAyNCBhdCAxOjQ44oCvQU0gSGFpYm8gWHUg
PGhhaWJvMS54dUBpbnRlbC5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBNb3ZlIHZjcHVfaGFzX2V4
dCB0byB0aGUgcHJvY2Vzc29yLmMgYW5kIHJlbmFtZSBpdCB0byBfX3ZjcHVfaGFzX2V4dAo+Pj4+
PiBzbyB0aGF0IG90aGVyIHRlc3QgY2FzZXMgY2FuIHVzZSBpdCBmb3IgdkNQVSBleHRlbnNpb24g
Y2hlY2suCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50
ZWwuY29tPgo+Pj4+PiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1p
Y3JvLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9p
bmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oIHwgIDIgKysKPj4+Pj4gICAgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyAgICAgfCAxMCArKysrKysrKysrCj4+
Pj4+ICAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAg
ICAgIHwgMTEgKy0tLS0tLS0tLS0KPj4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPj4+Pj4gaW5kZXgg
YjY4YjFiNzMxYTM0Li5iZDI3ZTFjNjc1NzkgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4+Pj4+ICsrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4+Pj4+
IEBAIC00Miw2ICs0Miw4IEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgX19rdm1fcmVnX2lkKHVp
bnQ2NF90IHR5cGUsIHVpbnQ2NF90IGlkeCwKPj4+Pj4gICAgI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1JFRyhpZHgpIF9fa3ZtX3JlZ19pZChLVk1fUkVHX1JJU0NWX0lTQV9FWFQsIFwKPj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZHgsIEtWTV9SRUdf
U0laRV9VTE9ORykKPj4+Pj4KPj4+Pj4gK2Jvb2wgX192Y3B1X2hhc19leHQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBpbnQgZXh0KTsKPj4+Pj4gKwo+Pj4+PiAgICBzdHJ1Y3QgZXhfcmVncyB7Cj4+
Pj4+ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHJhOwo+Pj4+PiAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBzcDsKPj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9s
aWIvcmlzY3YvcHJvY2Vzc29yLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jp
c2N2L3Byb2Nlc3Nvci5jCj4+Pj4+IGluZGV4IDM5YTFlOTkwMmRlYy4uZGFkNzNjZTE4MTY0IDEw
MDY0NAo+Pj4+PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3By
b2Nlc3Nvci5jCj4+Pj4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlz
Y3YvcHJvY2Vzc29yLmMKPj4+Pj4gQEAgLTE1LDYgKzE1LDE2IEBACj4+Pj4+Cj4+Pj4+ICAgIHN0
YXRpYyB2bV92YWRkcl90IGV4Y2VwdGlvbl9oYW5kbGVyczsKPj4+Pj4KPj4+Pj4gK2Jvb2wgX192
Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgZXh0KQo+Pj4+PiArewo+Pj4+
PiArICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsdWUgPSAwOwo+Pj4+PiArICAgICAgIGludCByZXQ7
Cj4+Pj4+ICsKPj4+Pj4gKyAgICAgICByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9J
U0FfRVhUX1JFRyhleHQpLCAmdmFsdWUpOwo+Pj4+PiArCj4+Pj4+ICsgICAgICAgcmV0dXJuICFy
ZXQgJiYgISF2YWx1ZTsKPj4+Pj4gK30KPj4+Pj4gKwo+Pj4+Cj4+Pj4gTm90IHN1cmUgd2hhdCB3
YXMgdGhlIGJhc2UgcGF0Y2ggb24gd2hpY2ggdGhpcyB3YXMgcmViYXNlZC4gVGhlIGFjdHVhbAo+
Pj4+IGNvbW1pdCBpbiB0aGUgcXVldWUgYnJhbmNoIGxvb2tzIGRpZmZlcmVudC4KPj4+Pgo+Pj4K
Pj4+IFRoaXMgcGF0Y2ggc2V0IHdhcyBiYXNlZCBvbiA2LjctcmM4Lgo+Pj4KPj4+PiBodHRwczov
L2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4L2NvbW1pdC81NTYzNTE3Y2MyMDEyZTMzMjY0MTFi
MzYwYzk5MjRkM2YyNzA2YzhkCj4+Pj4KPj4+PiBCb3RoIHNlZW0gdG8gaGF2ZSB0aGUgc2FtZSBi
dWcgdGhvdWdoIHRoZSB0ZXN0cyBmYWlsIG5vdyBhbmQgcmVxdWlyZQo+Pj4+IHRoZSBmb2xsb3dp
bmcgZml4Lgo+Pj4+IFRoZSBleHQgaWQgc2hvdWxkIGJlIHVpbnQ2NF90IGFuZCB3ZSBuZWVkIHRv
IHBhc3MgZXh0IGRpcmVjdGx5IHNvIHRoYXQKPj4+PiBTQkkgZXh0ZW5zaW9uIHRlc3RzIGNhbiBh
bHNvIHBhc3MuCj4+Pj4KPj4+Cj4+PiBJdCdzIHdlaXJkIHRoYXQgNi43LXJjOCBoYXMgYWxyZWFk
eSBpbmNsdWRlZCBBbmRyZXcncyBjaGFuZ2Ugb24gdGhlIElTQSBleHQgcmVnLAo+Pj4gYnV0IHRo
aXMgcGF0Y2ggd2FzIG5vdCBnZW5lcmF0ZWQgYWdhaW5zdCBoaXMgY2hhbmdlLgo+Pj4KPj4+IGNv
bW1pdCBiZGY2YWEzMjhmMTM3ZTE4NGIwZmNlNjA3ZmQ1ODUzNTRjMzc0MmYxCj4+PiBBdXRob3I6
IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4+PiBEYXRlOiAgIFdlZCBE
ZWMgMTMgMTg6MDk6NTggMjAyMyArMDEwMAo+Pj4KPj4+ICAgICAgIFJJU0MtVjogS1ZNOiBzZWxm
dGVzdHM6IFRyZWF0IFNCSSBleHQgcmVncyBsaWtlIElTQSBleHQgcmVncwo+Pj4KPj4+IEFueXdh
eSwgeW91ciBjaGFuZ2VzIHdlcmUgcmlnaHQuIFBsZWFzZSBnbyBhaGVhZCB0byBpbmNsdWRlIHRo
ZW0gd2hlbiBtZXJnaW5nLgo+Pj4KPj4KPj4gSSBhbSBub3Qgc3VyZSB3aGF0IGhhcHBlbmVkLiBQ
cm9iYWJseSwgYSBtZXJnZSBjb25mbGljdCBpc3N1ZS4KPj4KPj4gSSBqdXN0IHJlYWxpemVkIEkg
Zm9yZ290IHRvIGNvcHkgcGFzdGUgYW5vdGhlciBmaXggaW4gYXJjaCB0aW1lcgo+Pgo+PiArKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvYXJjaF90aW1lci5jCj4+IEBAIC04
NSw3ICs4NSw3IEBAIHN0cnVjdCBrdm1fdm0gKnRlc3Rfdm1fY3JlYXRlKHZvaWQpCj4+ICAgICAg
ICAgICBpbnQgbnJfdmNwdXMgPSB0ZXN0X2FyZ3MubnJfdmNwdXM7Cj4+Cj4+ICAgICAgICAgICB2
bSA9IHZtX2NyZWF0ZV93aXRoX3ZjcHVzKG5yX3ZjcHVzLCBndWVzdF9jb2RlLCB2Y3B1cyk7Cj4+
IC0gICAgICAgX19URVNUX1JFUVVJUkUoX192Y3B1X2hhc19leHQodmNwdXNbMF0sIEtWTV9SSVND
Vl9JU0FfRVhUX1NTVEMpLAo+PiArICAgICAgIF9fVEVTVF9SRVFVSVJFKF9fdmNwdV9oYXNfZXh0
KHZjcHVzWzBdLAo+PiBSSVNDVl9JU0FfRVhUX1JFRyhLVk1fUklTQ1ZfSVNBX0VYVF9TU1RDKSks
Cj4+Cj4gCj4gUmlnaHQgRml4IQo+IFBsZWFzZSBsZXQgbWUga25vdyBpZiBJIG5lZWQgdG8gcmVi
YXNlIHRoaXMgcGF0Y2ggc2VyaWVzIG9uIHlvdXIgdHJlZQo+IGFuZCByZXNlbnQgaXQuCj4gCgpU
aGF0J3MgQW51cCdzIGNhbGwuCgo+IFRoYW5rcywKPiBIYWlibwo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
