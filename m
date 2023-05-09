Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459CCC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 16:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmD2jdsCMtPbGLdtGB/xz4RujoXl3BpN3m7tSQ4wpxA=; b=23J9as6o/Plm7F
	hGyIQQkW4oTD55Z79CbW9hG/v1GtWj+/Jjsn5bNHH/xosi+ZXjCK/I6YiqZdwPKVIELlkHMClmvuz
	A/G+dhE3Qri/birPCB1GSOgTbnRwr/Df86/KKXpK30ZqHAh48VPyFr4VZmQWpT270TfP3HgZHSPBz
	nrkLOH0aE+zPvvBUFPA5yPHHzhKr7f37Nqs+P+0iSl3HmXWZycqgRe6PpzwUrVKSDeY/zPyyHuuxg
	6oRPqPfJZdk+zjgwuE9Q85dW8h75imojkRxoWK0emIGLRZvDqwnLW22ah4gnmbcIs/2BoEhvzHWra
	orePhSMHQfFxm2t5PNOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwQPQ-003pGX-1L;
	Tue, 09 May 2023 16:41:52 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwQPN-003pFw-2F
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 16:41:51 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f24cfb8539so3305714e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683650507; x=1686242507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FROceCXxvPLn3QgmwriNBcr2jTNl45QJMsriOAUhI2g=;
        b=PgVynsszyyDyJGa76hskdhLRs7gtISWteMbz7DjIIAEbcrcuBJfGiLm02fl1AuOGB7
         DDC7eukMYF1Rk78C73SEFyLxsFE/wtrsJTZG6gR17rF4n8RILKY/9Jv6MdlMuxhujHkT
         YbY8bRX3qj2fOmfLbCB8XRA+E0KYhR+Z0PDFj0e9npVLz4Z2iFe7nOTPf8HB+8YHTTk9
         fryfaFH/K92YPwmkM38Mdr4sRKMX2XoH/9+IOp8ZRSEBqqWEv0AG7hzoy/tqhATBDAhd
         wDI2lQJY1BfAw9mv8xipo4vZRM/PnffOo/FRJTsm0Vqj3f4Wkc7lJVjG5MgOg0lLdM0X
         22eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683650507; x=1686242507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FROceCXxvPLn3QgmwriNBcr2jTNl45QJMsriOAUhI2g=;
        b=MPenaahCAhfVrsviGWRbc3DH9W0KaCmMDuw5aY1nDe4Uy/VrBek/K4GYkVn667gQiU
         trKr0KhCIFj4kzXsNYyMNXzyEkiUQSaChwjdzqOnyN9cWtg84MrkdnlVBkeZaEoS+zcC
         77gcIuNUzmo2TVe6yG46TnS2uThchRgGTeJ13H2YhkkYI6TAHc6jN1J40vu279N45HtV
         qTiCS6oMpsseXRmcm0u8Jbpth9WIOXwkAUcnjpjiiu5mWj3UJbInlhjlcMLGTx5IZmYq
         JlW/cwQZGPCwiPV7HbzC9rPw6J+MLs/+8KsSbLTVedSuh+Oeb/7SGM+MR9vgyyzedSNz
         b2zg==
X-Gm-Message-State: AC+VfDzadVQpq4yw6dd74rnnzq0TLA8jqmNrhi6kipwILvoFMedLfuoS
	8TncNBRPVZcmm0YtJE022SpSkISgz4PUBuey2iwQfw==
X-Google-Smtp-Source: ACHHUZ42TNEnMm6quoByyvMr3JNETn4d0SUot+zK2QvMKh4CfjQ3FheXMimT+5RPUmyaweYtBVrJ0zocQVt2X4nxcks=
X-Received: by 2002:a05:6512:906:b0:4ed:c640:a20d with SMTP id
 e6-20020a056512090600b004edc640a20dmr902453lft.49.1683650506884; Tue, 09 May
 2023 09:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230509103033.11285-1-andy.chiu@sifive.com> <20230509103033.11285-4-andy.chiu@sifive.com>
 <2172277.NgBsaNRSFp@diego>
In-Reply-To: <2172277.NgBsaNRSFp@diego>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 10 May 2023 00:41:35 +0800
Message-ID: <CABgGipW0U6=4AhaM9zWPDKZYdKEYDi04Gm-uRmf_WoOioTaf6w@mail.gmail.com>
Subject: Re: [PATCH -next v19 03/24] riscv: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_V
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Evan Green <evan@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Celeste Liu <coelacanthus@outlook.com>, Andrew Bresticker <abrestic@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_094149_748920_AE8B92D6 
X-CRM114-Status: GOOD (  35.77  )
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

T24gVHVlLCBNYXkgOSwgMjAyMyBhdCA3OjA14oCvUE0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4KPiBBbSBEaWVuc3RhZywgOS4gTWFpIDIwMjMsIDEyOjMwOjEyIENF
U1Qgc2NocmllYiBBbmR5IENoaXU6Cj4gPiBQcm9iaW5nIGtlcm5lbCBzdXBwb3J0IGZvciBWZWN0
b3IgZXh0ZW5zaW9uIGlzIGF2YWlsYWJsZSBub3cuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5k
eSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24v
cmlzY3YvaHdwcm9iZS5yc3QgICAgICAgfCAxMCArKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od3Byb2JlLmggICAgICB8ICAyICstCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaCB8ICAzICsrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19y
aXNjdi5jICAgICAgICAgfCAgOSArKysrKysrKysKPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QK
PiA+IGluZGV4IDlmMGRkNjJkY2I1ZC4uYjg3NTVlMTgwZmJmIDEwMDY0NAo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9yaXNj
di9od3Byb2JlLnJzdAo+ID4gQEAgLTUzLDYgKzUzLDkgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFy
ZSBkZWZpbmVkOgo+ID4gICAgICAgIHByb2dyYW1zIChpdCBtYXkgc3RpbGwgYmUgZXhlY3V0ZWQg
aW4gdXNlcnNwYWNlIHZpYSBhCj4gPiAgICAgICAga2VybmVsLWNvbnRyb2xsZWQgbWVjaGFuaXNt
IHN1Y2ggYXMgdGhlIHZEU08pLgo+ID4KPiA+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVf
QkFTRV9CRUhBVklPUl9WYDogU3VwcG9ydCBmb3IgVmVjdG9yIGV4dGVuc2lvbiwgYXMKPiA+ICsg
ICAgZGVmaW5lZCBieSB2ZXJpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbi4K
Pgo+ICAgICAgICAgXl4gdmVyc2lvbiBbbWlzc2luZyB0aGUgU10KPgo+ID4gKwo+ID4gICogOmM6
bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRfMGA6IEEgYml0bWFzayBjb250YWluaW5n
IHRoZSBleHRlbnNpb25zCj4gPiAgICB0aGF0IGFyZSBjb21wYXRpYmxlIHdpdGggdGhlIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0JBU0VfQkVIQVZJT1JfSU1BYDoKPiA+ICAgIGJhc2Ugc3lzdGVt
IGJlaGF2aW9yLgo+ID4gQEAgLTY0LDYgKzY3LDEzIEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUg
ZGVmaW5lZDoKPiA+ICAgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfSU1BX0NgOiBUaGUgQyBl
eHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcyBkZWZpbmVkCj4gPiAgICAgIGJ5IHZlcnNpb24gMi4y
IG9mIHRoZSBSSVNDLVYgSVNBIG1hbnVhbC4KPiA+Cj4gPiArKiA6YzptYWNybzpgUklTQ1ZfSFdQ
Uk9CRV9LRVlfVl9FWFRfMGA6IEEgYml0bWFzayBjb250YWluaW5nIHRoZSBleHRlbnNpb25zCj4g
PiArICAgdGhhdCBhcmUgY29tcGF0aWJsZSB3aXRoIHRoZSA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9CQVNFX0JFSEFWSU9SX1ZgOiBiYXNlCj4gPiArICAgc3lzdGVtIGJlaGF2aW9yLgo+ID4gKwo+
ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9WYDogVGhlIFYgZXh0ZW5zaW9uIGlzIHN1
cHBvcnRlZCwgYXMgZGVmaW5lZCBieQo+ID4gKyAgICB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1W
IFZlY3RvciBleHRlbnNpb24gbWFudWFsLgo+ID4gKwo+Cj4gdGhpcyBzZWVtcyB0byBiZSBkb3Vi
bGluZyB0aGUgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX1Ygc3RhdGUgd2l0aG91dAo+IGFk
ZGluZyBhZGRpdGlvbmFsIGluZm9ybWF0aW9uPyBCb3RoIGVzc2VudGlhbGx5IHRlbGwgdGhlIHN5
c3RlbSB0aGF0Cj4gViBleHRlbnNpb24gImRlZmluZWQgYnkgdmVyaW9uIDEuMCBvZiB0aGUgUklT
Qy1WIFZlY3RvciBleHRlbnNpb24iIGlzIHN1cHBvcnRlZC4KCkkgd2FzIHRoaW5raW5nIHRoYXQg
UklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX1YgaW5kaWNhdGVzIHRoZSBrZXJuZWwKaGFzIGEg
cHJvYmUgZm9yIHZlY3RvciAoanVzdCBsaWtlIFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9J
TUEpIGFuZApSSVNDVl9IV1BST0JFX0tFWV9WX0VYVF8wIGlzIHdoZXJlIHRoZSBrZXJuZWwgcmVw
b3J0cyB3aGF0IGV4YWN0bHkgdGhlCmV4dGVuc2lvbiBpcy4gVGhpcyBtYXBzIHRvIHRoZSBjb25k
aXRpb24gbWF0Y2hpbmcgb2YgRixELCBhbmQgQyBpbgpJTUEuIElmIHRoYXQgaXMgbm90IHRoZSBj
YXNlIHRoZW4gSSB0aGluayB0aGVyZSBpcyBubyBuZWVkIGZvciB0aGlzCmVudHJ5LgoKPgo+IEkg
ZG9uJ3QgcXVlc3Rpb24gdGhhdCB3ZSdsbCBwcm9iYWJseSBuZWVkIGEga2V5IGZvciBkZWVwZXIg
dmVjdG9yLQo+IHNwZWNpZmljcyBidXQgSSBndWVzcyBJJ2QgdGhlIGNvbW1pdCBtZXNzYWdlIHNo
b3VsZCBkZWZpbml0bHkgZXhwbGFpbgo+IHdoeSB0aGVyZSBpcyBhIGR1cGxpY2F0aW9uIGhlcmUu
CgpJIHN1cHBvc2Ugc29tZXRoaW5nIGxpa2UgWnZmaCBzaG91bGQgZmFsbCBpbnRvIHRoZSBjYXRl
Z29yeSBvZgpSSVNDVl9IV1BST0JFX0tFWV9WX0VYVF8wLiBJIHdpbGwgYWRkIHRoaXMgZXhhbXBs
ZSBpbnRvIHRoZSBjb21taXQKbWVzc2FnZSBpZiB5b3UgYWdyZWUgdGhhdCBpcyBhIGdvb2QgZXhh
bXBsZS4KCj4KPgo+ID4gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6
IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCj4gPiAgICBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od3Byb2JlLmgKPiA+IGluZGV4IDc4OTM2ZjRmZjUxMy4uMzlkZjg2MDRmZWExIDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gPiBAQCAtOCw2ICs4LDYgQEAKPiA+Cj4gPiAg
I2luY2x1ZGUgPHVhcGkvYXNtL2h3cHJvYmUuaD4KPiA+Cj4gPiAtI2RlZmluZSBSSVNDVl9IV1BS
T0JFX01BWF9LRVkgNQo+ID4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDYKPiA+Cj4g
PiAgI2VuZGlmCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3
cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+IGluZGV4
IDhkNzQ1YTRhZDhhMi4uOTNhN2ZkM2ZkMzQxIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaAo+ID4gQEAgLTIyLDYgKzIyLDcgQEAgc3RydWN0IHJpc2N2X2h3cHJv
YmUgewo+ID4gICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfTUlNUElEICAgICAyCj4gPiAgI2Rl
ZmluZSBSSVNDVl9IV1BST0JFX0tFWV9CQVNFX0JFSEFWSU9SICAgICAgMwo+ID4gICNkZWZpbmUg
ICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9JTUEgKDEgPDwgMCkKPiA+
ICsjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0JBU0VfQkVIQVZJT1JfViAgICgx
IDw8IDEpCj4gPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzAgIDQKPiA+ICAj
ZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0lNQV9GRCAgICAgICAgICAgICgxIDw8
IDApCj4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9JTUFfQyAgICAgICAg
ICAgICAoMSA8PCAxKQo+ID4gQEAgLTMyLDYgKzMzLDggQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUg
ewo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9GQVNU
ICAgICAgICAgICAoMyA8PCAwKQo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJP
QkVfTUlTQUxJR05FRF9VTlNVUFBPUlRFRCAgICAoNCA8PCAwKQo+ID4gICNkZWZpbmUgICAgICAg
ICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9NQVNLICAgICAgICAgICAoNyA8PCAwKQo+
ID4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfVl9FWFRfMCAgICA2Cj4gPiArI2RlZmluZSAg
ICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9WICAgICAgICAgICAgICAgICAoMSA8PCAwKQo+ID4g
IC8qIEluY3JlYXNlIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSB3aGVuIGFkZGluZyBpdGVtcy4gKi8K
PiA+Cj4gPiAgI2VuZGlmCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jp
c2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+ID4gaW5kZXggNWRiMjk2ODNl
YmVlLi42MjgwYTdmNzc4YjMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
cmlzY3YuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiA+IEBAIC0x
MCw2ICsxMCw3IEBACj4gPiAgI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gPiAgI2luY2x1
ZGUgPGFzbS9od3Byb2JlLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiA+ICsjaW5jbHVk
ZSA8YXNtL3ZlY3Rvci5oPgo+ID4gICNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGFzbS91YWNjZXNzLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS91bmlzdGQuaD4KPiA+IEBA
IC0xNjEsNiArMTYyLDcgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3Qgcmlz
Y3ZfaHdwcm9iZSAqcGFpciwKPiA+ICAgICAgICAqLwo+ID4gICAgICAgY2FzZSBSSVNDVl9IV1BS
T0JFX0tFWV9CQVNFX0JFSEFWSU9SOgo+ID4gICAgICAgICAgICAgICBwYWlyLT52YWx1ZSA9IFJJ
U0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9JTUE7Cj4gPiArICAgICAgICAgICAgIHBhaXItPnZh
bHVlIHw9IFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9WOwo+Cj4gRG9lc24ndCB0aGlzIGFs
c28gbmVlZCBhCj4gICAgICAgICBpZiAoaGFzX3ZlY3RvcigpKQo+CgpJZiB0aGUgUklTQ1ZfSFdQ
Uk9CRV9LRVlfQkFTRV9CRUhBVklPUiBwYXJ0IGp1c3QgdGVsbHMgd2hldGhlciBod3Byb2JlCnN1
cHBvcnRzIHByb2Jpbmcgb2YgYSBzZXQgb2YgZXh0ZW5zaW9ucyB0aGVuIEkgdGhpbmsgd2Ugc2hv
dWxkIG5vdCBhZGQKdGhlIGlmIHN0YXRlbWVudCBoZXJlLCBidXQgbWF5YmUgSSBtaXN1bmRlcnN0
b29kIHNvbWV0aGluZy4uCgo+Cj4gSGVpa28KPgo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+
Cj4gPiAgICAgICBjYXNlIFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRfMDoKPiA+IEBAIC0xNzMs
NiArMTc1LDEzIEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfb25lX3BhaXIoc3RydWN0IHJpc2N2X2h3
cHJvYmUgKnBhaXIsCj4gPgo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+Cj4gPiArICAgICBj
YXNlIFJJU0NWX0hXUFJPQkVfS0VZX1ZfRVhUXzA6Cj4gPiArICAgICAgICAgICAgIHBhaXItPnZh
bHVlID0gMDsKPiA+ICsgICAgICAgICAgICAgaWYgKGhhc192ZWN0b3IoKSkKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX1Y7Cj4gPiArCj4gPiAr
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4gICAgICAgY2FzZSBSSVNDVl9IV1BST0JFX0tF
WV9DUFVQRVJGXzA6Cj4gPiAgICAgICAgICAgICAgIHBhaXItPnZhbHVlID0gaHdwcm9iZV9taXNh
bGlnbmVkKGNwdXMpOwo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+Cj4KPgo+Cj4KClRoYW5r
cywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
