Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6218606A681
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BUE1efqN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Bio26k6H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fgb4ME5Dozp06NOrPj0gQqzdjun5msg9/0jnewU1r/o=; b=BUE1efqNY2HDOOk9ZlZgNjCtAK
	q483y5txrD7lZDYPt74dBLa19ow8LvRfhBr1ZGU7wsB6oI6HMzO5f/O+rYQ/brfRUw8FHgO7UNk82
	L0MwMFKPlOr6xYNzpleRYAXIsvESodGG1fggOUWmuwvyvrsUoENP9AZfaTFnHbyWAoSouaaRBE2gS
	dPrR8KAUvLgeqkXMODTP3/H0GDcfoVCDJ8AYv13Sf183uij7VXfXNtvUCoIaO1zojg1TvZX1ZnAHc
	4bAmYTJa5d3po6zzzj6vMq23J1qtYG2nH+7RGpMDRi/wDMwA9yfUiTWWfcVERnJFFHOMUTpl4eTYZ
	q9mmxowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tb-00000008UOS-3MVK;
	Wed, 25 Nov 2026 05:50:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tZ-00000008ULi-08dj
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:50:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-49a92144733so2573941f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585815; cv=none;
        d=google.com; s=arc-20260327;
        b=bKa+5A3T8baG2/ejW5/BdPiBUI3SXvJTV27Hwzh/1J36fpdW4PjzBuMYd6kPHR4pMk
         aeKbHviEY4vsT3VlOgIcQ7EuiJt1LZkpNdbtLfMctsjxojqIJUD+xflfGqebHRHeWfSj
         SXkLYaUDMvt9zQ3cbxdCH8Bdfnwf2sGXFDKSlDLOIJpnyCHrmv7zihMSd+2PXE7Z6Rob
         P8LGXPzxu3mRP+AFcw0zdx/473dh78Luv6g14gSZdpOQCtLQN14OKI5PUc0zzWl4hhI8
         dr/ERPG1pm5pZllscKW4mgQx8qzOAUi2lzjjQ8greHViBCwotKzhyGZqOguonX/C9RI3
         3TjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kT3tic/d91/ykIxW0D8n99nUbZymWMEwweL5i2/3Bio=;
        fh=js1d4pfEUgcd38ki+ZEVYlzg4PMaV1GjJXDDDyAkfzY=;
        b=mlzV4qyD3XdSnbibkQMPblX/exldgX1fEqoadheZrHsjYsXbclOYIEdG/rASmKgZAU
         rbVNjCwhBZKq5/paNor7RGUzs9WDFwAJYm0U1M5gf6H75CKXP/EKqQHCJP618gs8JIFF
         NMvQoYt35rHbs0+kvJdVPj7nSvMiGtcRl2D27vnJUqiV5lfhmXBdGuFdDxhilstHDk46
         4g7eiNSmy77alujiRPjsN45pH0efDDFQoeKm8viFvaSxsapzygONBffPMzYd6M+I9Z7P
         La79311Qk7lyPpoEQwybop7zH7j1Id/XZXg7pxWBY1eaKIbTqKg4M9vKuyj4hRqz1y9p
         4t9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585815; x=1796190615; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kT3tic/d91/ykIxW0D8n99nUbZymWMEwweL5i2/3Bio=;
        b=Bio26k6HT5pwbxUYGAEh1KJ/mcOA6SzKFc1h+iP/6PanTFWcveRqjm6BvdwZSC332P
         wANMwrHE2DaPFt6REOQQXNXsagT/fY80TpaKZ9hEe0shUKJcxZ+KPKU3iowPhNh9oLxZ
         /FlcVY7OB3d8rfLZDtxBlbIGk2hxrLBaE/W46xHqNnH0TilrM98uVsl0Buu4TB7nGoV4
         jL/gdoKe7Y0m10RKy++yOtztFSktoJIF/tPKmMM2/BSGd07Mvoj4OVuTcJKpWmmsDOkL
         UVrHYxgoV19KInLqTJjM4Fz2+n8u9pf05sz6/jSfINbyEzrxtSveg3h8lYlVQyr+5/Vo
         uYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585815; x=1796190615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kT3tic/d91/ykIxW0D8n99nUbZymWMEwweL5i2/3Bio=;
        b=v8wx4iIEM7bZW8Sv+wsWfNcl6J/YxfyWNRT69tKPElBefHwpJH+TQbMTsy3ApxnBBc
         CRILwAF4QTt76r82jYd6dkCTTE74OvcHAh4MZqnhMkqggZf6WNY3ZS+dIU9KZMk3MLtG
         6XQwucWWcRZDGbJEEOgqR6VFmEIqdXA3JcxngvNlFm8lxA0ZDH/i15C9D8VP5UtwRZTp
         2Z7EH3OI61usZ8+zqEZ/rq1iObeyso93eQ7n2Ua7sgslU7y9uddJMlMLvr/oQkJPjbmX
         C66AD0CxkLq2QRUD5OPnTTF+SE091vxVvPDJKY7Y3llSLvyZhNiPVvwFO3JV6ymzsyg+
         6lIg==
X-Forwarded-Encrypted: i=1; AL+hErH1spqm7rpuCBs7UbRfj7qXwtXn3Cm0MBg2Il8EFfiiDHrLDcc7Rq6pVKZxjfiHs3Z9iY9zvsdXiiwB2w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/D14fXHK0xjd3x7gScGjcjOE+fiEKqUlR8L0LXCgjeZzjsnGBB
	exur/0Im19IWuVorigOP30oW6chaDYJcA8qkj0f3paPyQf7tgj6ctLwh4VkDo+GtPyIPSV8p0Db
	LsbPAPXUysOex3Meg9fYxaeWUGsmftXi1u3Ht1M9SAw==
X-Gm-Gg: AZFdTZf+b4+2I+aK1qeAPhotKtGXfxK5bBQcqTU3kpLZTns9tO0X1k2cP8AM5MBY2bM
	Go5iuOGkNhTiVU/8zQls0APGVOhz39pdbID5Y+cLIL5+EWyNCmzGft8TSQ1Cf6gLKgTX5lW/SXM
	zPNckdaPHv24tfSlrk9GvLtjYcu69O655GyGth9TBX93wqRYf5YxCvyvSSr/M9GYGz2YNBHJl1Q
	YI2EN6HLxJ6PQIBwY1a/5xb93v4mWJ8BNBv8WrxHWxcm/ZxevYfE63Lbn6AmmPibCqRqrFXjszc
	i/3PYTzmdpsfU5zKr0rXRxUVEJklF8SNFAOouWUKGMbLQn7dfx5HlmCd1CiYqfX4iv/DG7ND0DG
	GzyfOa3i9SgNNEsexhQOLRzJC5ksFuKPNTmD7v6iWjAimQMaZHOKdy+2a1XUTC6sZg0ep9o/1uj
	nXWi5djiuxwErr5zfsCFFcwdFeb2elgHM9baCxaWNC7gB+R0spYpDx0lE=
X-Received: by 2002:a05:6000:4008:b0:4b6:8c1:bc3d with SMTP id
 ffacd0b85a97d-4b608c1bc69mr9271540f8f.57.1795585815308; Tue, 24 Nov 2026
 21:50:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-5-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-5-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:20:02 +0530
X-Gm-Features: Aa3M54p30lsdKRUsZb_oZ9Ir_KFeKDghmbl1hKMXGWdC2yvUELIJH6ADrwgQ5jc
Message-ID: <CAAhSdy1XYx+Piha+gkpMNgFprSwQ=P4gT9SwWgwQfLzhP1thbw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] KVM: riscv: Free G-stage page tables after an RCU
 grace period
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_215017_108767_0176C52B 
X-CRM114-Status: GOOD (  28.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRy1zdGFnZSBwYWdlIHRhYmxlcyBhcmUgY3VycmVudGx5
IGZyZWVkIGltbWVkaWF0ZWx5IGFmdGVyIGJlaW5nCj4gdW5saW5rZWQgdW5kZXIgbW11X2xvY2su
IFRoaXMgaXMgc2FmZSB3aGlsZSBhbGwgd2Fsa2VycyBob2xkIG1tdV9sb2NrLAo+IGFzIGEgdGFi
bGUgY2Fubm90IGJlIGZyZWVkIHdoaWxlIGEgd2Fsa2VyIGlzIHVzaW5nIGl0LiBBIHN1YnNlcXVl
bnQKPiBjaGFuZ2Ugd2lsbCBhbGxvdyBhZ2luZyB3YWxrcyB3aXRob3V0IG1tdV9sb2NrLCB3aGVy
ZSBhIHdhbGtlciBtYXkKPiBvYnRhaW4gYSBjaGlsZCB0YWJsZSBwb2ludGVyIGp1c3QgYmVmb3Jl
IGEgY29uY3VycmVudCB1bm1hcCB1bmxpbmtzCj4gYW5kIGZyZWVzIHRoZSB0YWJsZS4KPgo+IERl
ZmVyIGZyZWVpbmcgdW5saW5rZWQgcGFnZS10YWJsZSBwYWdlcyB3aXRoIGNhbGxfcmN1KCkuIFRo
ZSBwYXJlbnQKPiBlbnRyeSBpcyBjbGVhcmVkIGJlZm9yZSB0aGUgY2hpbGQgdGFibGUgaXMgcmV0
aXJlZCwgc28gbmV3IHdhbGtlcnMKPiBjYW5ub3QgYWNxdWlyZSBpdCB3aGlsZSBleGlzdGluZyBS
Q1UtcHJvdGVjdGVkIHdhbGtlcnMgY2FuIHNhZmVseQo+IGZpbmlzaCB1c2luZyBpdC4KPgo+IEFw
cGx5IHRoZSBzYW1lIGxpZmV0aW1lIHJ1bGUgdG8gdGhlIHJvb3QgUEdELiBVbnB1Ymxpc2ggdGhl
IHJvb3Qgd2l0aAo+IFdSSVRFX09OQ0UoKSBhbmQgZGVmZXIgaXRzIGZyZWUgd2l0aCBjYWxsX3Jj
dSgpLiBLZWVwIHBnZF9sZXZlbHMKPiB1bmNoYW5nZWQgc28gYSB3YWxrZXIgdGhhdCBvYnNlcnZl
ZCB0aGUgb2xkIHJvb3QgY29udGludWVzIHRvIHVzZQo+IG1hdGNoaW5nIHBhZ2UtdGFibGUgbWV0
YWRhdGEuCj4KPiBXYWl0IGZvciBwZW5kaW5nIEctc3RhZ2UgcGFnZS10YWJsZSBjYWxsYmFja3Mg
d2l0aCByY3VfYmFycmllcigpIHdoZW4KPiB0aGUgUklTQy1WIEtWTSBtb2R1bGUgZXhpdHMgc28g
dGhhdCB0aGV5IGNvbXBsZXRlIGJlZm9yZSB0aGUgbW9kdWxlIGlzCj4gdW5sb2FkZWQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBTZXVuZ0p1IENoZW9uIDxzdXVuajEzMzFAZ21haWwuY29tPgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCB8ICAyICstCj4gIGFyY2gvcmlz
Y3Yva3ZtL2dzdGFnZS5jICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrLQo+ICBhcmNo
L3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAgICAgICB8ICAzICsrKwo+ICBhcmNoL3Jpc2N2L2t2
bS9tbXUuYyAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKystLS0KPiAgNCBmaWxlcyBj
aGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fZ3N0YWdlLmgKPiBpbmRleCBhMDNkYjFhMTAwOTUuLmNhZWVkNmRlNmRiZSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gQEAgLTExMSw3ICsxMTEsNyBAQCBz
dGF0aWMgaW5saW5lIHZvaWQga3ZtX3Jpc2N2X2dzdGFnZV9pbml0KHN0cnVjdCBrdm1fZ3N0YWdl
ICpnc3RhZ2UsIHN0cnVjdCBrdm0gKgo+ICAgICAgICAgZ3N0YWdlLT5rdm0gPSBrdm07Cj4gICAg
ICAgICBnc3RhZ2UtPmZsYWdzID0gMDsKPiAgICAgICAgIGdzdGFnZS0+dm1pZCA9IFJFQURfT05D
RShrdm0tPmFyY2gudm1pZC52bWlkKTsKPiAtICAgICAgIGdzdGFnZS0+cGdkID0ga3ZtLT5hcmNo
LnBnZDsKPiArICAgICAgIGdzdGFnZS0+cGdkID0gUkVBRF9PTkNFKGt2bS0+YXJjaC5wZ2QpOwo+
ICAgICAgICAgZ3N0YWdlLT5wZ2RfbGV2ZWxzID0ga3ZtLT5hcmNoLnBnZF9sZXZlbHM7Cj4gIH0K
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3Zt
L2dzdGFnZS5jCj4gaW5kZXggZjdlNDc1NmNlMTViLi5mYzM5ZDE4OGIyMGEgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2Uu
Ywo+IEBAIC0yMiw2ICsyMiwyMCBAQCB1bnNpZ25lZCBsb25nIGt2bV9yaXNjdl9nc3RhZ2VfbWF4
X3BnZF9sZXZlbHMgX19yb19hZnRlcl9pbml0ID0gMjsKPiAgI2RlZmluZSBnc3RhZ2VfcHRlX2xl
YWYoX19wdGUpIFwKPiAgICAgICAgIChwdGVfdmFsKF9fcHRlKSAmIChfUEFHRV9SRUFEIHwgX1BB
R0VfV1JJVEUgfCBfUEFHRV9FWEVDKSkKPgo+ICtzdGF0aWMgdm9pZCBnc3RhZ2VfZnJlZV9wYWdl
X3RhYmxlX3JjdShzdHJ1Y3QgcmN1X2hlYWQgKmhlYWQpCj4gK3sKPiArICAgICAgIHB1dF9wYWdl
KGNvbnRhaW5lcl9vZihoZWFkLCBzdHJ1Y3QgcGFnZSwgcmN1X2hlYWQpKTsKPiArfQo+ICsKPiAr
LyoKPiArICogRGVmZXIgZnJlZWluZyBhbiB1bmxpbmtlZCBwYWdlIHRhYmxlIHVudGlsIGxvY2ts
ZXNzIHdhbGtlcnMKPiArICogdGhhdCBtYXkgaGF2ZSBvYnNlcnZlZCBpdCBoYXZlIGV4aXRlZC4K
PiArICovCj4gK3N0YXRpYyB2b2lkIGdzdGFnZV9mcmVlX3BhZ2VfdGFibGUocHRlX3QgKnRhYmxl
KQo+ICt7Cj4gKyAgICAgICBjYWxsX3JjdSgmdmlydF90b19wYWdlKHRhYmxlKS0+cmN1X2hlYWQs
IGdzdGFnZV9mcmVlX3BhZ2VfdGFibGVfcmN1KTsKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSB1
bnNpZ25lZCBsb25nIGdzdGFnZV9wdGVfaW5kZXgoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncGFfdCBhZGRy
LCB1MzIgbGV2ZWwpCj4gIHsKPiBAQCAtNDA2LDcgKzQyMCw3IEBAIGJvb2wga3ZtX3Jpc2N2X2dz
dGFnZV9vcF9wdGUoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3BhX3QgYWRkciwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBmbHVzaCB8PSBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZShnc3Rh
Z2UsIGFkZHIgKyBpICogbmV4dF9wYWdlX3NpemUsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm5leHRfcHRlcFtpXSwgbmV4dF9wdGVw
X2xldmVsLCBvcCk7Cj4gICAgICAgICAgICAgICAgIGlmIChvcCA9PSBHU1RBR0VfT1BfQ0xFQVIp
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcHV0X3BhZ2UodmlydF90b19wYWdlKG5leHRfcHRl
cCkpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdzdGFnZV9mcmVlX3BhZ2VfdGFibGUobmV4
dF9wdGVwKTsKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIGlmIChvcCA9PSBH
U1RBR0VfT1BfQ0xFQVIpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfcHRlKHB0ZXAs
IF9fcHRlKDApKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbWFpbi5jIGIvYXJjaC9y
aXNjdi9rdm0vbWFpbi5jCj4gaW5kZXggODk1NjhjY2NlMDFkLi41ZmNmNDI1ZjcxNTAgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbWFpbi5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbWFp
bi5jCj4gQEAgLTI2Miw2ICsyNjIsOSBAQCBzdGF0aWMgdm9pZCBfX2V4aXQgcmlzY3Zfa3ZtX2V4
aXQodm9pZCkKPiAgewo+ICAgICAgICAga3ZtX2V4aXQoKTsKPgo+ICsgICAgICAgLyogV2FpdCBm
b3IgcGVuZGluZyBHLXN0YWdlIHBhZ2UtdGFibGUgUkNVIGNhbGxiYWNrcy4gKi8KPiArICAgICAg
IHJjdV9iYXJyaWVyKCk7Cj4gKwoKSnVzdCBsaWtlIFREUCBNTVUgaW4gS1ZNIHg4NiwgdGhpcyBz
aG91bGQgYmUgcGFydCBvZgprdm1fYXJjaF9kZXN0cm95X3ZtKCkgaW5zdGVhZCBvZiBkb2luZyBh
dCBtb2R1bGUgZXhpdCB0aW1lLgoKSSB3aWxsIHVwZGF0ZSBhdCB0aGUgdGltZSBvZiBtZXJnaW5n
LgoKPiAgICAgICAgIC8qIFVucmVnaXN0ZXIgQ1BVIFBNIG5vdGlmaWVyICovCj4gICAgICAgICBp
ZiAoSVNfRU5BQkxFRChDT05GSUdfQ1BVX1BNKSkKPiAgICAgICAgICAgICAgICAgY3B1X3BtX3Vu
cmVnaXN0ZXJfbm90aWZpZXIoJmt2bV9yaXNjdl9jcHVfcG1fbmIpOwo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMzQyZjYw
NjM5OWU1Li44YWVkNjlhYmY4MTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMK
PiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC03NjEsNiArNzYxLDEzIEBAIGludCBr
dm1fcmlzY3ZfbW11X2FsbG9jX3BnZChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICByZXR1cm4g
MDsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIGt2bV9yaXNjdl9tbXVfZnJlZV9wZ2RfcmN1KHN0cnVj
dCByY3VfaGVhZCAqaGVhZCkKPiArewo+ICsgICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UgPSBjb250
YWluZXJfb2YoaGVhZCwgc3RydWN0IHBhZ2UsIHJjdV9oZWFkKTsKPiArCj4gKyAgICAgICBfX2Zy
ZWVfcGFnZXMocGFnZSwgZ2V0X29yZGVyKGt2bV9yaXNjdl9nc3RhZ2VfcGdkX3NpemUpKTsKPiAr
fQo+ICsKPiAgdm9pZCBrdm1fcmlzY3ZfbW11X2ZyZWVfcGdkKHN0cnVjdCBrdm0gKmt2bSkKPiAg
ewo+ICAgICAgICAgc3RydWN0IGt2bV9nc3RhZ2UgZ3N0YWdlOwo+IEBAIC03NzMsOSArNzgwLDEy
IEBAIHZvaWQga3ZtX3Jpc2N2X21tdV9mcmVlX3BnZChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAg
ICAgICAgICAgIGZsdXNoID0ga3ZtX3Jpc2N2X2dzdGFnZV91bm1hcF9yYW5nZSgmZ3N0YWdlLCAw
VUwsCj4gICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9ncGFfc2l6ZShr
dm0tPmFyY2gucGdkX2xldmVscyksIGZhbHNlKTsKPiAgICAgICAgICAgICAgICAgcGdkID0gUkVB
RF9PTkNFKGt2bS0+YXJjaC5wZ2QpOwo+IC0gICAgICAgICAgICAgICBrdm0tPmFyY2gucGdkID0g
TlVMTDsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogS2VlcCBwZ2Rf
bGV2ZWxzIHVuY2hhbmdlZCBmb3IgbG9ja2xlc3Mgd2Fsa2VycyB0aGF0IGFscmVhZHkKPiArICAg
ICAgICAgICAgICAgICogb2JzZXJ2ZWQgdGhlIG9sZCByb290Lgo+ICsgICAgICAgICAgICAgICAg
Ki8KPiArICAgICAgICAgICAgICAgV1JJVEVfT05DRShrdm0tPmFyY2gucGdkLCBOVUxMKTsKPiAg
ICAgICAgICAgICAgICAga3ZtLT5hcmNoLnBnZF9waHlzID0gMDsKPiAtICAgICAgICAgICAgICAg
a3ZtLT5hcmNoLnBnZF9sZXZlbHMgPSAwOwo+ICAgICAgICAgfQo+ICAgICAgICAgd3JpdGVfdW5s
b2NrKCZrdm0tPm1tdV9sb2NrKTsKPgo+IEBAIC03ODMsNyArNzkzLDcgQEAgdm9pZCBrdm1fcmlz
Y3ZfbW11X2ZyZWVfcGdkKHN0cnVjdCBrdm0gKmt2bSkKPiAgICAgICAgICAgICAgICAga3ZtX2Zs
dXNoX3JlbW90ZV90bGJzKGt2bSk7Cj4KPiAgICAgICAgIGlmIChwZ2QpCj4gLSAgICAgICAgICAg
ICAgIGZyZWVfcGFnZXMoKHVuc2lnbmVkIGxvbmcpcGdkLCBnZXRfb3JkZXIoa3ZtX3Jpc2N2X2dz
dGFnZV9wZ2Rfc2l6ZSkpOwo+ICsgICAgICAgICAgICAgICBjYWxsX3JjdSgmdmlydF90b19wYWdl
KHBnZCktPnJjdV9oZWFkLCBrdm1fcmlzY3ZfbW11X2ZyZWVfcGdkX3JjdSk7Cj4KPiAgICAgICAg
IGt2bV9tbXVfZnJlZV9tZW1vcnlfY2FjaGUoJmt2bS0+YXJjaC5wZ2Rfc3BsaXRfcGFnZV9jYWNo
ZSk7Cj4gIH0KPiAtLQo+IDIuNTIuMAo+CgpPdGhlcndpc2UsIExHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
