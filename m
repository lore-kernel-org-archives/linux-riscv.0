Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634EEC83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 17:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c68uPSe7/LQOGq56o78N6Aq9zkoMBOR44J3tL9SMeRE=; b=QvbCAZjoZpWJ4y
	ySj0MnIU9vBmjl9If/d9mGVeCYFY6iclk+wFJGLdqJope6GIQ9L9hmQUvDXL7zF7GELIQgX7ZqDSh
	w9y92VrqEC+wHwpHnN2NFPTJW3s66rvvVjkRe9aG+DBaLWkbEe7Ihn7wwm1zgpgrZCvnZ6QwbQ9d0
	f056MthQs/t1LYAqCQKnsofWJdQ6vXEdtWSNSfGh1GBdg9vuhdhI+QVAUEA/olJgblIdh+5vdPMfP
	sHfqReTI8k0YbuPDegz2pFoPzNxqeo/9Cmv8dS4ih44FjXOq81xe/ll4OcvtJVk6det+tOtx5wtNY
	ih0wVx5FySBn148dfiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ued06-00000005Z5v-0A0p;
	Wed, 23 Jul 2025 17:11:30 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ued03-00000005Z4M-176S;
	Wed, 23 Jul 2025 17:11:28 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-33095f59c43so24831fa.2;
        Wed, 23 Jul 2025 10:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753290685; x=1753895485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0LUnIOIz73OOlhKmDgw5NN8XNp7rSGUS+XkRlIQ8F4=;
        b=Y0SObY0U9htZdVeTuT5uBbrZmTompZWkWiYU0dwjsqtBNon3wJTaFslnSq+9Xd3rYV
         uNMgkU23raZ09SUtK+U1N3Dxw/jrlX+WjhGUwgL9ifXRTE2DVXX/8822vU70tXX2822v
         nlWpyzPAzvTmLCBx3xvyw2vDDdYvUxYX1nG5k5yn4gvdFogTI0GEpHRKeYRMJqP/6kwp
         BqKxXbhQYH9SnBG76fc11P/4zgi4OcGMFmRi1hO2X0vvrhNdA7RPWeKWHEZccK+OyYuI
         Dj98vMJQ36z5czs3bU91udmzsOOkvv+Ih3OjKZwryrZNmEv7JCnkt9rNazyTJhdSRYUz
         hizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753290685; x=1753895485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0LUnIOIz73OOlhKmDgw5NN8XNp7rSGUS+XkRlIQ8F4=;
        b=qyMQ4gz9rejI9ujCmDc2S06xgSvk88QRPbBnij0ECWxTUVw3miT3rrlNJB9Sf5bTsa
         OADZ8my3PUr01qECmAonmzeSOrVRjLV9ezhLKNMVbZY3S5B4xuXmYeAH8AH3kU2fmsfm
         aktRhSmceqKLBbDVFn1PuRDu0uX5dv1BYe+ic7UAoZYWVUL/uvTlDKxWFs7RxTuvH1Ym
         I7t1KIBdFEVHkxAUpSzrojrwaNOKK87zc+YeTqB6sUkgEZSdTP/mdGJWDZjQ0YLbv+A5
         PM2PvpC9pKWhdJVJMo/vJWZE5wDLziJQfJ7g7v8b88d5xyH8YueyzJu1s3LCxto2M78J
         gDRA==
X-Forwarded-Encrypted: i=1; AJvYcCWLFI+WseCyxOIpWC/Nm843PpMSbGZDrTNMzwHnYMb0Mxp8En0Jymlms6OhYTCq2Qh8upS/P7v96sR7vQ==@lists.infradead.org, AJvYcCXqsFxnzYWNBmkS0KYkxnO0E0zggdFhcNHQiLes615Lb05QbkFjwXbEksVJWd2ZOQZAnQ+0e6UHIFw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQBMiW9bjiL6XpcwKr5tQQcmSZLXP3ifmBleJ03M19yVrA7Gf2
	0xu3EBrIytcznE5zQZxGh7+/LujrjAdNktSpB4JoXj4mSwLuQfntG7sx
X-Gm-Gg: ASbGnctLSnnZH9zs7mH/KS1HY/SfytrHak5yuAtExjDqz2NPQ7/FtlYFUfRGwOu0h0W
	wZ8C+S6OK8uCz2aND/zKTKmpYbeg/1uLXsY4ubzbXRMuJ1pz1qtnhuSi1EorX8awqL2IS94b/wT
	0cxLYyaw9j2NRg7wdCNVZKHbR1sd/wA2S7llAQp39Jtu1Gjpw6aGgmbKy+m08huOnJ6Y3HpnXyc
	b/o3BnuOGMdWI0HQ6xSWA4ICnRHAxC2Zo4wodewZapqDvrGAgjLyBNvhV2GHEWoWAjll/arhsb6
	fPcAIfHb6L0G0j62u1SUQMCniwO7WN5YdPfRE4Ej4OgLWSfq8gBP2bGKx19hCI9BUH8F4z/v95J
	Y6K97K+KVd7KpzUIauiCh19ws/FQ1
X-Google-Smtp-Source: AGHT+IH2g67FKl5Ss4FX0QBC4tL2LXDPhFaEQPcQJWbHc0FwMHy9whqZBWSEtQi4JTvV5r53QIeSPA==
X-Received: by 2002:a05:651c:f19:b0:32d:fd8c:7e76 with SMTP id 38308e7fff4ca-330dfd2d969mr3521411fa.7.1753290684563;
        Wed, 23 Jul 2025 10:11:24 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9eaasm19869811fa.85.2025.07.23.10.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 10:11:23 -0700 (PDT)
Message-ID: <4dd38293-4307-474f-8eb7-0e83f5d3b996@gmail.com>
Date: Wed, 23 Jul 2025 19:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] kasan/um: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com,
 dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-9-snovitoll@gmail.com>
 <85de2e1f-a787-4862-87e4-2681e749cef0@gmail.com>
 <CACzwLxiD98BLmEmPhkJQgv297bP_7qw+Vm_icFhTiDYN7WvLjw@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CACzwLxiD98BLmEmPhkJQgv297bP_7qw+Vm_icFhTiDYN7WvLjw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_101127_302512_2002D5E4 
X-CRM114-Status: GOOD (  17.46  )
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

CgpPbiA3LzIyLzI1IDQ6MTcgUE0sIFNhYnlyemhhbiBUYXNib2xhdG92IHdyb3RlOgo+IE9uIFR1
ZSwgSnVsIDIyLCAyMDI1IGF0IDQ6MDDigK9BTSBBbmRyZXkgUnlhYmluaW4gPHJ5YWJpbmluLmEu
YUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiA3LzE3LzI1IDQ6MjcgUE0sIFNhYnly
emhhbiBUYXNib2xhdG92IHdyb3RlOgo+Pj4gVXNlck1vZGUgTGludXggbmVlZHMgZGVmZXJyZWQg
S0FTQU4gaW5pdGlhbGl6YXRpb24gYXMgaXQgaGFzIGEgY3VzdG9tCj4+PiBrYXNhbl9hcmNoX2lz
X3JlYWR5KCkgaW1wbGVtZW50YXRpb24gdGhhdCB0cmFja3Mgc2hhZG93IG1lbW9yeSByZWFkaW5l
c3MKPj4+IHZpYSB0aGUga2FzYW5fdW1faXNfcmVhZHkgZmxhZy4KPj4+Cj4+PiBTZWxlY3QgQVJD
SF9ERUZFUl9LQVNBTiB0byBlbmFibGUgdGhlIHVuaWZpZWQgc3RhdGljIGtleSBtZWNoYW5pc20K
Pj4+IGZvciBydW50aW1lIEtBU0FOIGNvbnRyb2wuIENhbGwga2FzYW5faW5pdF9nZW5lcmljKCkg
d2hpY2ggaGFuZGxlcwo+Pj4gR2VuZXJpYyBLQVNBTiBpbml0aWFsaXphdGlvbiBhbmQgZW5hYmxl
cyB0aGUgc3RhdGljIGtleS4KPj4+Cj4+PiBEZWxldGUgdGhlIGtleSBrYXNhbl91bV9pc19yZWFk
eSBpbiBmYXZvciBvZiB0aGUgdW5pZmllZCBrYXNhbl9lbmFibGVkKCkKPj4+IGludGVyZmFjZS4K
Pj4+Cj4+PiBOb3RlIHRoYXQga2FzYW5faW5pdF9nZW5lcmljIGhhcyBfX2luaXQgbWFjcm8sIHdo
aWNoIGlzIGNhbGxlZCBieQo+Pj4ga2FzYW5faW5pdCgpIHdoaWNoIGlzIG5vdCBtYXJrZWQgd2l0
aCBfX2luaXQgaW4gYXJjaC91bSBjb2RlLgo+Pj4KPj4+IENsb3NlczogaHR0cHM6Ly9idWd6aWxs
YS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTcwNDkKPj4+IFNpZ25lZC1vZmYtYnk6IFNh
YnlyemhhbiBUYXNib2xhdG92IDxzbm92aXRvbGxAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiBDaGFu
Z2VzIGluIHYzOgo+Pj4gLSBBZGRlZCBDT05GSUdfQVJDSF9ERUZFUl9LQVNBTiBzZWxlY3Rpb24g
Zm9yIHByb3BlciBydW50aW1lIGNvbnRyb2wKPj4+IC0tLQo+Pj4gIGFyY2gvdW0vS2NvbmZpZyAg
ICAgICAgICAgICB8IDEgKwo+Pj4gIGFyY2gvdW0vaW5jbHVkZS9hc20va2FzYW4uaCB8IDUgLS0t
LS0KPj4+ICBhcmNoL3VtL2tlcm5lbC9tZW0uYyAgICAgICAgfCA0ICsrLS0KPj4+ICAzIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvYXJjaC91bS9LY29uZmlnIGIvYXJjaC91bS9LY29uZmlnCj4+PiBpbmRleCBmMDhlOGE3
ZmFjOS4uZmQ2ZDc4YmJhNTIgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3VtL0tjb25maWcKPj4+ICsr
KyBiL2FyY2gvdW0vS2NvbmZpZwo+Pj4gQEAgLTgsNiArOCw3IEBAIGNvbmZpZyBVTUwKPj4+ICAg
ICAgIHNlbGVjdCBBUkNIX1dBTlRTX0RZTkFNSUNfVEFTS19TVFJVQ1QKPj4+ICAgICAgIHNlbGVj
dCBBUkNIX0hBU19DUFVfRklOQUxJWkVfSU5JVAo+Pj4gICAgICAgc2VsZWN0IEFSQ0hfSEFTX0ZP
UlRJRllfU09VUkNFCj4+PiArICAgICBzZWxlY3QgQVJDSF9ERUZFUl9LQVNBTgo+Pj4gICAgICAg
c2VsZWN0IEFSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEwKPj4+ICAgICAgIHNlbGVjdCBBUkNIX0hB
U19LQ09WCj4+PiAgICAgICBzZWxlY3QgQVJDSF9IQVNfU1RSTkNQWV9GUk9NX1VTRVIKPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3VtL2luY2x1ZGUvYXNtL2thc2FuLmggYi9hcmNoL3VtL2luY2x1ZGUv
YXNtL2thc2FuLmgKPj4+IGluZGV4IGY5N2JiMWY3Yjg1Li44MWJjZGMwZjk2MiAxMDA2NDQKPj4+
IC0tLSBhL2FyY2gvdW0vaW5jbHVkZS9hc20va2FzYW4uaAo+Pj4gKysrIGIvYXJjaC91bS9pbmNs
dWRlL2FzbS9rYXNhbi5oCj4+PiBAQCAtMjQsMTEgKzI0LDYgQEAKPj4+Cj4+PiAgI2lmZGVmIENP
TkZJR19LQVNBTgo+Pj4gIHZvaWQga2FzYW5faW5pdCh2b2lkKTsKPj4+IC1leHRlcm4gaW50IGth
c2FuX3VtX2lzX3JlYWR5Owo+Pj4gLQo+Pj4gLSNpZmRlZiBDT05GSUdfU1RBVElDX0xJTksKPj4+
IC0jZGVmaW5lIGthc2FuX2FyY2hfaXNfcmVhZHkoKSAoa2FzYW5fdW1faXNfcmVhZHkpCj4+PiAt
I2VuZGlmCj4+PiAgI2Vsc2UKPj4+ICBzdGF0aWMgaW5saW5lIHZvaWQga2FzYW5faW5pdCh2b2lk
KSB7IH0KPj4+ICAjZW5kaWYgLyogQ09ORklHX0tBU0FOICovCj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC91bS9rZXJuZWwvbWVtLmMgYi9hcmNoL3VtL2tlcm5lbC9tZW0uYwo+Pj4gaW5kZXggNzZiZWM3
ZGU4MWIuLjA1OGNiNzBlMzMwIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC91bS9rZXJuZWwvbWVtLmMK
Pj4+ICsrKyBiL2FyY2gvdW0va2VybmVsL21lbS5jCj4+PiBAQCAtMjEsOSArMjEsOSBAQAo+Pj4g
ICNpbmNsdWRlIDxvcy5oPgo+Pj4gICNpbmNsdWRlIDx1bV9tYWxsb2MuaD4KPj4+ICAjaW5jbHVk
ZSA8bGludXgvc2NoZWQvdGFzay5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9rYXNhbi5oPgo+Pj4K
Pj4+ICAjaWZkZWYgQ09ORklHX0tBU0FOCj4+PiAtaW50IGthc2FuX3VtX2lzX3JlYWR5Owo+Pj4g
IHZvaWQga2FzYW5faW5pdCh2b2lkKQo+Pj4gIHsKPj4+ICAgICAgIC8qCj4+PiBAQCAtMzIsNyAr
MzIsNyBAQCB2b2lkIGthc2FuX2luaXQodm9pZCkKPj4+ICAgICAgICAqLwo+Pj4gICAgICAga2Fz
YW5fbWFwX21lbW9yeSgodm9pZCAqKUtBU0FOX1NIQURPV19TVEFSVCwgS0FTQU5fU0hBRE9XX1NJ
WkUpOwo+Pj4gICAgICAgaW5pdF90YXNrLmthc2FuX2RlcHRoID0gMDsKPj4+IC0gICAgIGthc2Fu
X3VtX2lzX3JlYWR5ID0gdHJ1ZTsKPj4+ICsgICAgIGthc2FuX2luaXRfZ2VuZXJpYygpOwo+Pgo+
PiBJIHRoaW5rIHRoaXMgcnVucyBiZWZvcmUganVtcF9sYWJlbF9pbml0KCksIGFuZCBzdGF0aWMg
a2V5cyBzaG91bGRuJ3QgYmUgc3dpdGNoZWQgYmVmb3JlIHRoYXQuPiAgfQo+IAo+IEkgZ290IHRo
ZSB3YXJuaW5nIGluIG15IGxvY2FsIGNvbXBpbGF0aW9uIGFuZCBmcm9tIGtlcm5lbCBDSSBbMV0u
Cj4gCj4gYXJjaC91bSBwbGFjZXMga2FzYW5faW5pdCgpIGluIG93biBgLmthc2FuX2luaXRgIHNl
Y3Rpb24sIHdoaWxlCj4ga2FzYW5faW5pdF9nZW5lcmljKCkgaXMgY2FsbGVkIGZyb20gX19pbml0
LgoKTm8sIGthc2FuX2luaXQoKSBpcyBpbiB0ZXh0IHNlY3Rpb24gYXMgdGhlIHdhcm5pbmcgc2F5
cy4gSXQncyBrYXNhbl9pbml0X3B0ciBpbiAua2FzYW5faW5pdC4KQWRkaW5nIF9faW5pdCB0byBr
YXNhbl9pbml0KCkgc2hvdWxkIGZpeCB0aGUgd2FybmluZy4KCgo+IENvdWxkIHlvdSBzdWdnZXN0
IGEgd2F5IGhvdyBJIGNhbiB2ZXJpZnkgdGhlIGZ1bmN0aW9ucyBjYWxsIG9yZGVyPwo+IAoKQnkg
Y29kZSBpbnNwZWN0aW9uPyBvciBydW4gdWRlciBnZGIuCgprYXNhbl9pbml0KCkgaXMgaW5pdGlh
bGl6YXRpb24gcm91dGluZSBjYWxsZWQgYmVmb3JlIG1haW4oKS4KanVtcF9sYWJlbF9pbml0KCkg
Y2FsbGVkIGZyb20gc3RhcnRfa2VybmVsKCk8LXN0YXJ0X2tlcm5lbF9wcm9jKCk8LS4uLiBtYWlu
KCkKCj4gSSBuZWVkIHRvIGZhbWlsaWFyaXplIG15c2VsZiB3aXRoIGhvdyB0byBydW4gYXJjaC91
bSBsb2NhbGx5IAoKSXQncyBhcyBzaW1wbGUgYXM6CkFSQ0g9dW0gIG1ha2UgCi4vbGludXggcm9v
dGZzdHlwZT1ob3N0ZnMgcm8gaW5pdD0vYmluL2Jhc2gKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
