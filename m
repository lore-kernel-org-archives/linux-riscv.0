Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1984C77B61
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 17:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=URxTuWYsXTYe/mJqzjPxLNjiawwfR5wLjdkG4vj18w4=; b=QFlz+DdMaBR9WAXe1+XPvwAs7Y
	He980JjjgWj1aoGfWWDaUH5ObLGNFxTfm/fn5dLmfk95Wo4HTJvA1KzGiK53HgecoA8LYr80GEX9G
	v8EYKQ2U7CnKdWTFOBn1ONcDsMqLWdJIaebG05fC9omflUbBo0qQF8jB8zEHJ9z5sUlZpRHaeF0F7
	PlCPETwGC5LRZ6EOHXd6E/DpQ59g5SlhzgaARbgY2TNiCXk1HHycFvYwFfjODDT3KCU82tjS/UZI6
	E0i/9+wIVflSEGHhqk49XwjY7DN81r9sqXVqwH0PBhzngV6GOIDhoNBwDP9rUMoQno22ogXMj9HK6
	0xZsrKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pha5O-001O7y-04;
	Wed, 29 Mar 2023 17:59:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pha5K-001O75-22
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 17:59:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id f22so11588293plr.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 10:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1680112785;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ATAQe7qivttkaF6z/d0hrLKosZU1JWYo/P3cLZVbkw=;
        b=NEdOUx/javmB9kDa7FGeUc51U/Wn0STrKWBa4uDg3vm2+W9FVlVH1+/ZMb1zTGKdDj
         d3KLDNLFiScX2SoDgiYm71CYQHSrFsT80Vwc5DPAARaURlvkxOnL/I2SpNS/7RjVoq7M
         jjBHG4IkvUpJrr88X3pQ1Wfo+pEhSovMq/MTY7fiCKb7Nr6D9uNLsLzURn6rQVZeGbce
         2RLnovtWpOUC6EB7GYynif//9myEVnFqbAQ6SEV67g2Ps9E2dBH1Zb7EzSix25ynrfat
         k7WO6rSP3p9XcTqrR8xuaSeMtQV/wtnrluHPs9zpByqTym6w08+dV+DrUSg5AioJPwMA
         gXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680112785;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ATAQe7qivttkaF6z/d0hrLKosZU1JWYo/P3cLZVbkw=;
        b=73EHZ84e0QNIh+0GSl8aVFsVK/wS0We8RIo6djmg2pwR751OozWD8o/Gv7qwrZxAP7
         FA338s2AroIcRMGddKKTI6Ru0G+ZddS4oJUsDy9SKpWh9hY/F6iasG+dPxDuwbvr5/1O
         D3FuCsbhHS8Xy5KBp8M/kEZH63jdhIq0ZS8X3eb5xYI80dFxC3I36BHpUwjDCsnaW6bo
         0gNYn6AAwnpWzlW1zr2lZPoSz+S7ux4GODDaua6HJXJZEsDeYuuLyHKXgD0PDk5CFt36
         NgZ5sBPO/zghlp3hWbk3GT87YdE9o5TORfqUfhq7hA03TBu0V5RfpKQWPgQoJuDe3z4F
         2i/A==
X-Gm-Message-State: AO0yUKXIl4If4E+lwLyiYu+L0il09UlU72MZfgXuEFGndWz9eG0Gj0Kg
	oy47E2ebQQgIjyQ7ehTLODGnHskbPgfUDszDWD0=
X-Google-Smtp-Source: AK7set8WybREuJ/MU50NhWHApZc7Q738Nt6HMrkX3X3+yzmaIkDHQziymzMOq45dYkW+fnJxn7v6Yw==
X-Received: by 2002:a05:6a20:21d5:b0:de:247e:d1fe with SMTP id p21-20020a056a2021d500b000de247ed1femr20032034pzb.1.1680112785240;
        Wed, 29 Mar 2023 10:59:45 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7804d000000b00592626fe48csm6374660pfm.122.2023.03.29.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 10:59:44 -0700 (PDT)
Date: Wed, 29 Mar 2023 10:59:44 -0700 (PDT)
X-Google-Original-Date: Wed, 29 Mar 2023 10:59:40 PDT (-0700)
Subject: Re: [PATCH v8 0/1] riscv: Allow to downgrade paging mode from the command line
In-Reply-To: <20230228154629.240541-1-alexghiti@rivosinc.com>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Conor Dooley <conor@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, bjorn@kernel.org, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-4507ad68-27bd-4d29-bb72-8d8f5bc27e34@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_105946_858942_ABC3EBD2 
X-CRM114-Status: GOOD (  27.93  )
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

T24gVHVlLCAyOCBGZWIgMjAyMyAwNzo0NjoyOCBQU1QgKC0wODAwKSwgYWxleGdoaXRpQHJpdm9z
aW5jLmNvbSB3cm90ZToKPiBUaGlzIG5ldyB2ZXJzaW9uIGdldHMgcmlkIG9mIHRoZSBsaW1pdGF0
aW9uIHRoYXQgcHJldmVudGVkIEtBU0FOIGtlcm5lbHMKPiB0byB1c2UgdGhlIG5ld2x5IGludHJv
ZHVjZWQgcGFyYW1ldGVycy4KPgo+IFdoaWxlIGxvb2tpbmcgaW50byBLQVNMUiwgSSBmZWxsIG9u
dG8gY29tbWl0IGFhY2QxNDliNjIzOCAoImFybTY0OiBoZWFkOgo+IGF2b2lkIHJlbG9jYXRpbmcg
dGhlIGtlcm5lbCB0d2ljZSBmb3IgS0FTTFIiKTogaXQgYWxsb3dzIHRvIHVzZSB0aGUgZmR0Cj4g
ZnVuY3Rpb25zIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2VzcyB3aXRoIEtBU0FOIGVuYWJs
ZWQgYnkgc2ltcGx5Cj4gY29tcGlsaW5nIGEgbmV3IHZlcnNpb24gb2YgdGhvc2UgZnVuY3Rpb25z
IHdpdGhvdXQgaW5zdHJ1bWVudGF0aW9uLgo+Cj4gSSBoYWQgdG8gY2hhbmdlIHRoZSBoYW5kbGlu
ZyBvZiB0aGUgY29tbWFuZCBsaW5lIHBhcnNpbmcgdG8gbWFrZSB0aGUKPiBjb2RlIHNlbGYtY29u
dGFpbmVkIGluIGtlcm5lbC9waS9jbWRfZWFybHkuYyB0byBhdm9pZCBjYWxsaW5nIHRvbyBtYW55
Cj4gX19waSBwcmVmaXhlZCBmdW5jdGlvbnMgZnJvbSBvdXRzaWRlIHRoaXMgZmlsZS4KPgo+IEkn
bGwgdXNlIHRoaXMgYXBwcm9hY2ggbGlrZSBhcm02NCB0byBoYW5kbGUgdGhlIGV4dHJhY3Rpb24g
b2YgdGhlIHJhbmRvbQo+IHNlZWRpIGZyb20gdGhlIGRldmljZSB0cmVlIGZvciBLQVNMUi4KPgo+
IGJhc2UtY29tbWl0OiBlYjliZTgzMTBjNTggKCJSSVNDLVY6IGFkZCBhIHNwaW5fc2hhZG93X3N0
YWNrIGRlY2xhcmF0aW9uIikKCkkgaGF2ZSB0aGF0IGluIG15IHRyZWUsIEknbSBzdGlsbCBnZXR0
aW5nIGEgYnVuY2ggb2YgYm9vdCBmYWlsdXJlcyAKdGhvdWdoLiAgSSBjYW4gdHJ5IHRvIGdldCBh
IGxpc3QgaWYgeW91J3JlIG5vdCBzZWVpbmcgYW55LCBidXQgSSdtIGtpbmQgCm9mIHN0dWNrIG9u
IHNvbWUgb3RoZXIgc3R1ZmYgZm9yIGEgYml0Li4uCgo+IHY4Ogo+IC0gRml4IExMVk0gbGQgd2Fy
bmluZyBieSBtb3ZpbmcgdGhlIHNlY3Rpb24gLmluaXQuc2RhdGEgZnJvbQo+ICAga2VybmVsL3Bp
L3N0cmluZy5jIGludG8gdGhlIG5ld2x5IGNyZWF0ZWQgc2VjdGlvbiAuaW5pdC5waWRhdGEKPgo+
IHY3Ogo+IC0gUmViYXNlZCBvbiB0b3Agb2YgZm9yLW5leHQgd2hpY2ggaW50cm9kdWNlcyBsb3Rz
IG9mIGVycm9ycyAodGhhbmtzIHRvCj4gICB0aGUgcGF0Y2h3b3JrIENJKQo+IC0gQWRkIF9fTk9f
Rk9SVElGWSB0byBhdm9pZCB1bmRlZmluZWQgX19waV9mb3J0aWZ5X3BhbmljCj4gLSBBZGQgYW4g
YWxpYXMgdG8gb3VyIG5ld2x5IGludHJvZHVjZWQgc3RybGVuCj4gLSBSZW1vdmUgX19pbml0IGFz
IHNlY3Rpb25zIGFyZSBhbHJlYWR5IHByZWZpeGVkIGluIHRoZSBNYWtlZmlsZQo+IC0gSW50cm9k
dWNlIG5ldyBzZWN0aW9uIGZvciBrZXJuZWwvcGkvc3RyaW5nLmMgdG8gcXVpZXQgdGhlIGZvbGxv
d2luZwo+ICAgd2FybmluZ3MgKG9uY2Ugd2UgaGF2ZSBhbGwgdGhlIHN0cmluZyBmdW5jdGlvbnMs
IHdlJ2xsIGJlIGFibGUgdG8gZ2V0Cj4gICByaWQgb2YgdGhpcyk6Cj4KPiB3YXJuaW5nOiBvcnBo
YW4gc2VjdGlvbiBgLmluaXRfX2J1Z190YWJsZScgZnJvbSBgYXJjaC9yaXNjdi9rZXJuZWwvcGkv
c3RyaW5nLnBpLm8nIGJlaW5nIHBsYWNlZCBpbiBzZWN0aW9uIGAuaW5pdF9fYnVnX3RhYmxlJwo+
IHdhcm5pbmc6IG9ycGhhbiBzZWN0aW9uIGAuaW5pdC5zcm9kYXRhLmNzdDgnIGZyb20gYGFyY2gv
cmlzY3Yva2VybmVsL3BpL3N0cmluZy5waS5vJyBiZWluZyBwbGFjZWQgaW4gc2VjdGlvbiBgLmlu
aXQuc3JvZGF0YS5jc3Q4Jwo+Cj4gdjY6Cj4gLSBGaXggbGx2bSB3YXJuaW5nIGJ5IGZvcndhcmQg
ZGVjbGFyaW5nIHNldF9zYXRwX21vZGVfZnJvbV9jbWRsaW5lCj4KPiB2NToKPiAtIEhhbmRsZSBu
dWxsIGNvbW1hbmQgbGluZSwgVGhhbmtzIEJqw7ZybiEKPiAtIEFkZCBSQi9UQiBmcm9tIEJqw7Zy
bgo+Cj4gdjQ6Cj4gLSBJbnRyb2R1Y2UgcGkvIGZvciBLQVNBTiB0byB3b3JrCj4KPiB2MzoKPiAt
IE1hc3NhZ2UgY29tbWl0IGxvZyB0byBtYWtlIG5vNGx2bCBjbGVhcmVyLCBhcyBhc2tlZCBieSBD
b25vcgo+IC0gQWRkIGEgbm90ZSB0byBrZXJuZWwtcGFyYW1ldGVycy50eHQgcmVnYXJkaW5nIHRo
ZSBpbXBvc3NpYmlsaXR5IHRvIHVzZQo+ICAgdGhvc2UgcGFyYW1ldGVycyB3aGVuIEtBU0FOIGlz
IGVuYWJsZWQsIGFzIHN1Z2dlc3RlZCBieSBDb25vcgo+IC0gQWRkIFJCIGZyb20gQmrDtnJuCj4K
PiB2MjoKPiAtIEhvbm9yIENNRExJTkVfRVhURU5EIGFuZCBDTURMSU5FX0ZPUkNFIGFzIG5vdGlj
ZWQgYnkgQmrDtnJuCj4KPgo+IEFsZXhhbmRyZSBHaGl0aSAoMSk6Cj4gICByaXNjdjogQWxsb3cg
dG8gZG93bmdyYWRlIHBhZ2luZyBtb2RlIGZyb20gdGhlIGNvbW1hbmQgbGluZQo+Cj4gIC4uLi9h
ZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICA1ICstCj4gIGFyY2gv
cmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAyICsKPiAgYXJjaC9y
aXNjdi9rZXJuZWwvcGkvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgMzcgKysrKysrKysrKysK
PiAgYXJjaC9yaXNjdi9rZXJuZWwvcGkvY21kbGluZV9lYXJseS5jICAgICAgICAgIHwgNjIgKysr
KysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4Lmxkcy5TICAgICAg
ICAgICAgICAgfCAgOCArKysKPiAgYXJjaC9yaXNjdi9saWIvbWVtY3B5LlMgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKwo+ICBhcmNoL3Jpc2N2L2xpYi9tZW1tb3ZlLlMgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArCj4gIGFyY2gvcmlzY3YvbGliL3N0cmxlbi5TICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMzYgKysrKysrKysrLS0KPiAgOSBmaWxlcyBjaGFuZ2VkLCAxNDggaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2Vy
bmVsL3BpL01ha2VmaWxlCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9w
aS9jbWRsaW5lX2Vhcmx5LmMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
