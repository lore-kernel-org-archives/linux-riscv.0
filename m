Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B6E606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QgFBjb91;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sjUxHJpS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDKw9iplS3zTO8q8rMY3SgwZLWTMUYPbHi9cOZQPWA0=; b=QgFBjb916cx6me
	WtEPTzqwhj+MpreSfVd5h8V9qXZ9Mo9Xln4+MUu8qUEx7a2zjJait97xNeucJ7V3C/l3x0eepaGAr
	/BiLAb/9pp+Gwzy+wJdlamU4/el1r0Zdd5Iz2lBcI15AZYia+2qYq5GFIl/9OnqZj1VD7jHSWq95A
	hzp0sS8sqOhESxbvJ2YX3ti3T9x5Wqh9LVNRvgG/85El50MiyAQJjD7RhyxY+myFVupFCyxqwNNau
	9bIFrS9ULidAiSeTM8OZQOwziKKb4mv8GQsvAD4ytUkzPKcJyIPNE08PIOzkzWwj0774fz7eCgpCY
	x36weXwpVZ2i9lvxaVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnU9-0000000Dacj-1B0o;
	Thu, 22 Oct 2026 07:45:13 +0000
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnU4-0000000Daay-46Rr
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 07:45:10 +0000
Received: by mail-pj2-x06.google.com with SMTP id 98e67ed59e1d1-3964e7720afso933615a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 00:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655108; x=1793259908; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDXHwat4zLpbZennBEg7uZauJYVMECCPqpPno/TLnRE=;
        b=sjUxHJpSA3mI6smHrfY24HuKW/hjm060HnpLLz0J6BF63PvljYtEt3DaB0SmTvuiG7
         idG6V2Hd5irMkkDIF0mfNdP/lg+JEcgLOpLp4fe9PfgNxdjuyyAigSEuy6D9aGBjMs8l
         ii6ALoPqGuzkrNtzgxPmk8ega01C1f92HWf1hz1XuFhwUuUa4CZDBqgfA9aNgY7gUqSX
         5feSC2knT6vhwm/hSIIat7B/4bRT9wNmuqsIfp9CzCVzw/NhrffA+Jhj7Hrv+6RoXZFT
         YuxYsXLWXXoFRKBkw/AyhR1FlnaKWqwmZw2OaBFUXPP4qAhzYG+4TskwKSQvQUlA/5tc
         Ak1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655108; x=1793259908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDXHwat4zLpbZennBEg7uZauJYVMECCPqpPno/TLnRE=;
        b=0FuTi4Lt/w8icBSe1VggWLp1yBPLLGxPgyymY1IhVl8gyCSJ7A4XCEaGY5P0YfnSNH
         AooksQca57cRlfjiL7jk2h7nSaoyhkQB6P4Da2p1KOfr+C8/arqxnV1AV7gxBCKzv+pp
         mOV6OtSPYIlPHbMzXEy0vKDJ25gkLLSehyEBIKz4A8+CwLQvwmgAsYW8imfbMIf7I7Mh
         iSfvUgT5saxBYzWvBVPQjWkldadRRbdKZSrswsN9ln0svV1HfdHVtE4SPopi9eGQBdIC
         fnPHySoi9LmUN5fNSd+0mTimFRsb5KKH01qO5mbS0Ymg9VXNypvgq+5S1FmdfXsQaWtv
         BD8g==
X-Forwarded-Encrypted: i=1; AKwUvBx8I02cP1FPQkfZKbDnRJAsykYYESLxNX4AaPQtvwtp+DxI8fBFZn7Iuxwfw/oBp/H7nVOWfvPk17MC4A==@lists.infradead.org
X-Gm-Message-State: AFq9FYKP+XzNZyEAUiVgyzMLyeL052Ay8Fo8nQNbQFSl8HFii+U+kuSz
	olbKCy1sW8QgHMnLU2mo5rktYJssUc6Ij46xIL0HfWtxRAaallqYW6Fl
X-Gm-Gg: AYBFou3qpi1FeX+bQjSHFI/sE5sKqEVGJRP2zMCR1RCVmATL/wzRQFRH5xHcIe7fFhl
	N4WJSWceWNQM5bAMJeqihPeV7XO74kmRJ1LVDPMgskZUPn6vxDV1uT0rNwdoS73bMhgu7JId668
	USX01WCPpUAJBeE/bGSbsO5CqQsqkXQRdDRFuQrG7dSTz7mV0K8V4QawRaeJfMdg4u0kHn/UwUH
	devP9H5idfUIwBc8x7P1ywU5Cx4uYecsA3y8n9a5i8plrtaLUvF7n3YzCFEZfuI5zgxuIp2/Bb7
	aqPzM5Tiy8CMwB1mna784HXMu3vrH3BBkgRNkHrXxweErB/98a0nsKcr5BH6/GAWiOXwP6Z5Ru/
	xHrx7Gc71NKaWnbcfLNdCfkREkjhIRMWPcVh/RFS5Cr5FMe5fRG9iSSUMNK9wHfiN5f2/Cz3EZs
	K3gswnMRe+znX9phI7wwegnWwyGP9ArqlZFDXFG57ya3fCDv3gy0nyESTLh83LaF+mp8buX3jh8
	1M+e1rJRNu67BVsir+xQJ3/V3JYzuxjq3O8zaKxrtHvl8Crk4l52LYmQh0qn98=
X-Received: by 2002:a17:90b:5870:b0:3ab:5758:3766 with SMTP id 98e67ed59e1d1-3ad8707700dmr3724932a91.51.1792655107849;
        Thu, 22 Oct 2026 00:45:07 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49366fdsm2945920a91.14.2026.10.22.00.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:45:06 -0700 (PDT)
Message-ID: <098ff899-81b9-4ccc-a143-1e324446258f@gmail.com>
Date: Thu, 22 Oct 2026 15:44:48 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] crash_core: serialize crash header preparation
 against hotplug
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org,
 m.szyprowski@samsung.com
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-4-chenwandun1@gmail.com>
 <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
 <a1665f9e-3116-47bc-974e-98dce408fa37@gmail.com>
 <31d63208-3ef2-420f-a0c2-d9d6d49c5e21@huawei.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <31d63208-3ef2-420f-a0c2-d9d6d49c5e21@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_004509_051120_F936A349 
X-CRM114-Status: GOOD (  24.50  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMC8yMi8yNiAxMDowMCwgSmluamllIFJ1YW4gd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjYv
MTAvMjEgMTc6NDgsIFdhbmR1biDlhpnpgZM6Cj4+Cj4+Cj4+IE9uIDEwLzIxLzI2IDE3OjEzLCBK
aW5qaWUgUnVhbiB3cm90ZToKPj4+Cj4+Pgo+Pj4g5ZyoIDIwMjYvMTAvMjEgMTY6MzAsIFdhbmR1
biBDaGVuIOWGmemBkzoKPj4+PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5n
LmNvbT4KPj4+Pgo+Pj4+IGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIGNvdW50cyBtZW1vcnkgcmFu
Z2VzIGJlZm9yZSBwb3B1bGF0aW5nIHRoZQo+Pj4+IGFsbG9jYXRlZCBjcmFzaF9tZW0gYXJyYXku
IFRoZSB3ZWFrIGltcGxlbWVudGF0aW9uIHVzZWQgYnkgQVJNNjQsCj4+Pj4gUklTQy1WIGFuZCBM
b29uZ0FyY2ggd2Fsa3MgbWVtYmxvY2subWVtb3J5LCB3aGlsZSB4ODYgcGVyZm9ybXMgdGhlIHNh
bWUKPj4+PiB0d28tcGFzcyBvcGVyYXRpb24gb3ZlciBzeXN0ZW0gUkFNIHJlc291cmNlcy4gQ29u
Y3VycmVudCBtZW1vcnkgaG90cGx1Zwo+Pj4+IGNhbiBjaGFuZ2UgcmFuZ2Ugc291cmNlIGJldHdl
ZW4gdGhlIHR3byB3YWxrcyBhbmQgbWFrZSB0aGUgcG9wdWxhdGUKPj4+PiBwYXNzIG92ZXJmbG93
IGNtZW0tPnJhbmdlcy4KPj4+Pgo+Pj4+IFRha2UgZGV2aWNlX2hvdHBsdWdfbG9jayB3aGVuIHBy
ZXBhcmluZyBjcmFzaCBoZWFkZXJzIGR1cmluZwo+Pj4+IGtleGVjX2ZpbGVfbG9hZCgpLiBUaGUg
eDg2L3Jpc2N2IG1lbW9yeSBob3RwbHVnIHBhdGggYWxyZWFkeSB0YWtlcwo+Pj4+IGRldmljZV9o
b3RwbHVnX2xvY2ssIHNvIGNhbGwgX19jcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBkaXJlY3RseQo+
Pj4+IHRvIGF2b2lkIHJlY3Vyc2l2ZSBsb2NraW5nLgo+Pj4+Cj4+Pj4gU2FzaGlrbyByZXBvcnRl
ZCB0aGlzIGlzc3VlIGluIFsxXS4KPj4+Pgo+Pj4+IEZpeGVzOiAzNzUxZTcyOGNlZjIgKCJhcm02
NDoga2V4ZWNfZmlsZTogYWRkIGNyYXNoIGR1bXAgc3VwcG9ydCIpCj4+Pj4gRml4ZXM6IDFiY2Nh
ODYyMGE5MSAoIkxvb25nQXJjaDogQWRkIGNyYXNoIGR1bXAgc3VwcG9ydCBmb3Iga2V4ZWNfZmls
ZSIpCj4+Pj4gRml4ZXM6IDhhY2VhNDU1ZmFmYSAoIlJJU0MtVjogU3VwcG9ydCBmb3Iga2V4ZWNf
ZmlsZSBvbiBwYW5pYyIpCj4+Pj4gRml4ZXM6IGRkNWY3MjYwNzZjYyAoImtleGVjOiBzdXBwb3J0
IGZvciBrZXhlYyBvbiBwYW5pYyB1c2luZyBuZXcgc3lzdGVtIGNhbGwiKQo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFdhbmR1biBDaGVuIDxjaGVud2FuZHVuQGxpeGlhbmcuY29tPgo+Pj4+IExpbms6IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9tZXNzYWdlLzIwMjYwODA2MTAxMDAyLjFGODRFMUYwMDBFOUBz
bXRwLmtlcm5lbC5vcmcgWzFdCj4+Pj4gQWNrZWQtYnk6IEJhb3F1YW4gSGUgPGJhb3F1YW4uaGVA
bGludXguZGV2Pgo+Pj4+IC0tLQo+Pj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaC5jICB8ICAy
ICstCj4+Pj4gIGFyY2gveDg2L2tlcm5lbC9jcmFzaC5jICAgIHwgIDIgKy0KPj4+PiAgaW5jbHVk
ZS9saW51eC9jcmFzaF9jb3JlLmggfCAgMiArKwo+Pj4+ICBrZXJuZWwvY3Jhc2hfY29yZS5jICAg
ICAgICB8IDE3ICsrKysrKysrKysrKysrKy0tCj4+Pj4gIDQgZmlsZXMgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9jcmFzaC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2guYwo+Pj4+IGluZGV4
IGZlNWE0YjMwNmFhZS4uYWM4ZGYyZWRmMmE3IDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL2NyYXNoLmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaC5jCj4+Pj4g
QEAgLTcwLDcgKzcwLDcgQEAgdm9pZCBhcmNoX2NyYXNoX2hhbmRsZV9ob3RwbHVnX2V2ZW50KHN0
cnVjdCBraW1hZ2UgKmltYWdlLCB2b2lkICphcmcpCj4+Pj4gIAkgKiBDcmVhdGUgdGhlIG5ldyBl
bGZjb3JlaGRyIHJlZmxlY3RpbmcgdGhlIGNoYW5nZXMgdG8gQ1BVIGFuZC9vcgo+Pj4+ICAJICog
bWVtb3J5IHJlc291cmNlcy4KPj4+PiAgCSAqLwo+Pj4+IC0JaWYgKGNyYXNoX3ByZXBhcmVfaGVh
ZGVycyh0cnVlLCAmZWxmYnVmLCAmZWxmc3osIE5VTEwpKSB7Cj4+Pj4gKwlpZiAoX19jcmFzaF9w
cmVwYXJlX2hlYWRlcnModHJ1ZSwgJmVsZmJ1ZiwgJmVsZnN6LCBOVUxMKSkgewo+Pj4+ICAJCXBy
X2VycigidW5hYmxlIHRvIGNyZWF0ZSBuZXcgZWxmY29yZWhkciIpOwo+Pj4+ICAJCWdvdG8gb3V0
Owo+Pj4+ICAJfQo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3Jhc2guYyBiL2Fy
Y2gveDg2L2tlcm5lbC9jcmFzaC5jCj4+Pj4gaW5kZXggZTZmMjM5MzNhNmRmLi5iZWYwMDhhMGNi
MjIgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2NyYXNoLmMKPj4+PiArKysgYi9h
cmNoL3g4Ni9rZXJuZWwvY3Jhc2guYwo+Pj4+IEBAIC00NjUsNyArNDY1LDcgQEAgdm9pZCBhcmNo
X2NyYXNoX2hhbmRsZV9ob3RwbHVnX2V2ZW50KHN0cnVjdCBraW1hZ2UgKmltYWdlLCB2b2lkICph
cmcpCj4+Pj4gIAkgKiBDcmVhdGUgdGhlIG5ldyBlbGZjb3JlaGRyIHJlZmxlY3RpbmcgdGhlIGNo
YW5nZXMgdG8gQ1BVIGFuZC9vcgo+Pj4+ICAJICogbWVtb3J5IHJlc291cmNlcy4KPj4+PiAgCSAq
Lwo+Pj4+IC0JaWYgKGNyYXNoX3ByZXBhcmVfaGVhZGVycyhJU19FTkFCTEVEKENPTkZJR19YODZf
NjQpLCAmZWxmYnVmLCAmZWxmc3osIE5VTEwpKSB7Cj4+Pj4gKwlpZiAoX19jcmFzaF9wcmVwYXJl
X2hlYWRlcnMoSVNfRU5BQkxFRChDT05GSUdfWDg2XzY0KSwgJmVsZmJ1ZiwgJmVsZnN6LCBOVUxM
KSkgewo+Pj4+ICAJCXByX2VycigidW5hYmxlIHRvIGNyZWF0ZSBuZXcgZWxmY29yZWhkciIpOwo+
Pj4+ICAJCWdvdG8gb3V0Owo+Pj4+ICAJfQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2NyYXNoX2NvcmUuaCBiL2luY2x1ZGUvbGludXgvY3Jhc2hfY29yZS5oCj4+Pj4gaW5kZXggYmMw
ODcxMjRjZDc4Li4yOGU3YTgxY2YyNjMgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9j
cmFzaF9jb3JlLmgKPj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2NyYXNoX2NvcmUuaAo+Pj4+IEBA
IC02MSw2ICs2MSw4IEBAIGV4dGVybiBpbnQgY3Jhc2hfcHJlcGFyZV9lbGY2NF9oZWFkZXJzKHN0
cnVjdCBjcmFzaF9tZW0gKm1lbSwgaW50IG5lZWRfa2VybmVsX21hCj4+Pj4gIAkJCQkgICAgICAg
dm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6KTsKPj4+PiAgZXh0ZXJuIGludCBjcmFzaF9w
cmVwYXJlX2hlYWRlcnMoaW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAqKmFkZHIsCj4+Pj4gIAkJ
CQkgdW5zaWduZWQgbG9uZyAqc3osIHVuc2lnbmVkIGxvbmcgKm5yX21lbV9yYW5nZXMpOwo+Pj4+
ICtpbnQgX19jcmFzaF9wcmVwYXJlX2hlYWRlcnMoaW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAq
KmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6LAo+Pj4+ICsJCQkgICAgdW5zaWduZWQgbG9uZyAqbnJf
bWVtX3Jhbmdlcyk7Cj4+Pj4gIGV4dGVybiBpbnQgY3Jhc2hfZXhjbHVkZV9jb3JlX3Jhbmdlcyhz
dHJ1Y3QgY3Jhc2hfbWVtICoqY21lbSk7Cj4+Pj4gIAo+Pj4+ICBzdHJ1Y3Qga2ltYWdlOwo+Pj4+
IGRpZmYgLS1naXQgYS9rZXJuZWwvY3Jhc2hfY29yZS5jIGIva2VybmVsL2NyYXNoX2NvcmUuYwo+
Pj4+IGluZGV4IGZhYTBmMjJkYmI0MS4uOGE4NjFhOTQ2ZTI2IDEwMDY0NAo+Pj4+IC0tLSBhL2tl
cm5lbC9jcmFzaF9jb3JlLmMKPj4+PiArKysgYi9rZXJuZWwvY3Jhc2hfY29yZS5jCj4+Pj4gQEAg
LTE2LDYgKzE2LDcgQEAKPj4+PiAgI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4+Pj4gICNpbmNsdWRl
IDxsaW51eC9jcHVob3RwbHVnLmg+Cj4+Pj4gICNpbmNsdWRlIDxsaW51eC9tZW1ibG9jay5oPgo+
Pj4+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4+Pj4gICNpbmNsdWRlIDxsaW51eC9rbWVt
bGVhay5oPgo+Pj4+ICAjaW5jbHVkZSA8bGludXgvY3Jhc2hfY29yZS5oPgo+Pj4+ICAjaW5jbHVk
ZSA8bGludXgvcmVib290Lmg+Cj4+Pj4gQEAgLTM0NCw4ICszNDUsOCBAQCBpbnQgY3Jhc2hfZXhj
bHVkZV9jb3JlX3JhbmdlcyhzdHJ1Y3QgY3Jhc2hfbWVtICoqY21lbSkKPj4+PiAgCXJldHVybiAw
Owo+Pj4+ICB9Cj4+Pj4gIAo+Pj4+IC1pbnQgY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKGludCBuZWVk
X2tlcm5lbF9tYXAsIHZvaWQgKiphZGRyLCB1bnNpZ25lZCBsb25nICpzeiwKPj4+PiAtCQkJICB1
bnNpZ25lZCBsb25nICpucl9tZW1fcmFuZ2VzKQo+Pj4+ICtpbnQgX19jcmFzaF9wcmVwYXJlX2hl
YWRlcnMoaW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6
LAo+Pj4+ICsJCQkgICAgdW5zaWduZWQgbG9uZyAqbnJfbWVtX3JhbmdlcykKPj4+PiAgewo+Pj4+
ICAJdW5zaWduZWQgaW50IG1heF9ucl9yYW5nZXM7Cj4+Pj4gIAlzdHJ1Y3QgY3Jhc2hfbWVtICpj
bWVtOwo+Pj4+IEBAIC0zODIsNiArMzgzLDE4IEBAIGludCBjcmFzaF9wcmVwYXJlX2hlYWRlcnMo
aW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6LAo+Pj4+
ICAJcmV0dXJuIHJldDsKPj4+PiAgfQo+Pj4+ICAKPj4+PiAraW50IGNyYXNoX3ByZXBhcmVfaGVh
ZGVycyhpbnQgbmVlZF9rZXJuZWxfbWFwLCB2b2lkICoqYWRkciwgdW5zaWduZWQgbG9uZyAqc3os
Cj4+Pj4gKwkJCSAgdW5zaWduZWQgbG9uZyAqbnJfbWVtX3JhbmdlcykKPj4+PiArewo+Pj4+ICsJ
aW50IHJldDsKPj4+PiArCj4+Pj4gKwlsb2NrX2RldmljZV9ob3RwbHVnKCk7Cj4+Pj4gKwlyZXQg
PSBfX2NyYXNoX3ByZXBhcmVfaGVhZGVycyhuZWVkX2tlcm5lbF9tYXAsIGFkZHIsIHN6LCBucl9t
ZW1fcmFuZ2VzKTsKPj4+PiArCXVubG9ja19kZXZpY2VfaG90cGx1ZygpOwo+Pj4KPj4+IEkgdGhp
bmsgdGhpcyBwYXRjaCBjb25mbGljdHMgd2l0aCBteSBjaGFuZ2VzIGFuZCB3b3VsZCBhbHNvIGNv
bmZsaWN0Cj4+PiB3aXRoIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBhcm02NCBjcmFzaCBob3RwbHVn
Lgo+Pj4KPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkyMTA5MDQ1MC44MDc1
NzUtMTUtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+Pj4KPj4gSGF2ZSB0aGVzZSBwYXRjaGVzIGFs
cmVhZHkgYmVlbiBtZXJnZWQ/IE15IGN1cnJlbnQgd29yayBpcyBiYXNlZCBvbiB0aGUgbGF0ZXN0
Cj4+IGxpbnV4LW5leHQuIElmIHRoZXkgaGF2ZSBhbHJlYWR5IGJlZW4gbWVyZ2VkIGludG8gdGhl
IG1haW50YWluZXIncyBicmFuY2gsCj4+IHBsZWFzZSBsZXQgbWUga25vdywgSSB3aWxsIHVwZGF0
ZSBteSB0cmVlIGFuZCByZWJhc2UvcmUtYWRhcHQgbXkgY2hhbmdlcyBhY2NvcmRpbmdseS4KPj4K
Pj4KPj4gQWxzbywgcmVnYXJkaW5nIHRoZSBjaGFuZ2VzIGluIGtlcm5lbC9jcmFzaF9jb3JlLmM6
IGl0IGxvb2tzIGxpa2Ugd2UgbW9kaWZpZWQKPj4gdGhlIHNhbWUgc3BvdCwgdGhlIGNoYW5nZSBp
cyBub3Qgd3JvbmcsIGlzIHRoYXQgcmlnaHQ/Cj4gCj4gSGkgV2FuZHVuLAo+IAo+IEhvd2V2ZXIs
IEkgdGhpbmsgc29tZW9uZSBzaG91bGQgaGF2ZSBpbmZvcm1lZCBtZSBpbiBhZHZhbmNlOyBvdGhl
cndpc2UsCj4gZG9pbmcgZHVwbGljYXRlIGZpeCB3b3JrIGlzIHBvaW50bGVzcy4KPiAKPiBJIHNl
ZSB0aGF0IHBhcnQgb2YgeW91ciBwYXRjaCBzZXJpZXMgbW9kaWZpZXMgY29kZSBJIHByZXZpb3Vz
bHkgY2hhbmdlZCwKPiBidXQgSSB3YXMgbm90IENDJ2QuCgpIaSBKaW5qaWUsCgpTb3JyeSBmb3Ig
bm90IENDJ2luZyB5b3UuIEkga2VlcCB0aGUgcGVyLXBhdGNoIENjIGxpc3RzIHNob3J0IGJlY2F1
c2UKbGFyZ2UgcmVjaXBpZW50IHNldHMgaGF2ZSBjYXVzZWQgbXkgc2VuZHMgdG8gYmUgY3V0IG9m
ZiBtaWR3YXkgYmVmb3JlLAooSSdtIHN0aWxsIHRyeWluZyB0byB0cmFjayBkb3duIGV4YWN0bHkg
d2hlcmUgdGhlIHByb2JsZW0gaXMpIHlvdSBzaG91bGQKaGF2ZSBiZWVuIG9uIHRoZSBsaXN0IHRo
YXQncyBteSBtaXNzLiBZb3UnbGwgYmUgb24gdGhlIENjIG9mIGV2ZXJ5IGZ1dHVyZQp2ZXJzaW9u
Lgo+IAo+Pgo+Pj4gYXJtNjQgY3Jhc2ggaG90cGx1ZzoKPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI2MDkxODEwMDQ0Mi4zODQxMTM1LTE4LXJ1YW5qaW5qaWVAaHVhd2VpLmNvbS8K
Pj4KPj4gSW4gYWRkaXRpb24sIGlmIGFybTY0IGdhaW5zIGNyYXNoIGhvdHBsdWcgc3VwcG9ydCwg
dGhlIGNvZGUgdGhlcmUgd291bGQgaW5kZWVkCj4+IG5lZWQgdG8gYmUgbW9kaWZpZWQgKHRvIGF2
b2lkIGEgZGVhZGxvY2spLiBBcyBvZiBub3csIGFybTY0IGNyYXNoIGhvdHBsdWcKPj4gc3VwcG9y
dCBoYXMgbm90IGJlZW4gbWVyZ2VkIHlldCBlaXRoZXIsIGhhcyBpdD8gSSBqdXN0IHdhbnQgdG8g
bWFrZSBzdXJlIEkKPj4gaGF2ZW4ndCBtaXNzZWQgYW55dGhpbmcuCj4gCj4gWWVzLCB5b3UgYXJl
IHJpZ2h0LiBJZiB5b3VyIHBhdGNoIHNlcmllcyB3aWxsIGJlIG1lcmdlZCBzb29uLCBJIHdpbGwK
PiBkZXZlbG9wIGJhc2VkIG9uIGl0LgoKQWxzbyB0aGFua3MgZm9yIHlvdXIgcmVtaW5kZXIsIG90
aGVyd2lzZSBJIG1pZ2h0IGxhdGVyIG92ZXJsb29rIHRoZSBjYXNlCndoZXJlIGFybTY0IGhhcyBh
bHJlYWR5IGdhaW5lZCBjcmFzaCBob3RwbHVnIHN1cHBvcnQsIGFuZCBpbnRyb2R1Y2UgYnVncwph
cyBhIHJlc3VsdC4KCgpCZXN0IHJlZ2FyZHMsCldhbmR1bj4KPj4KPj4+Cj4+Pj4gKwo+Pj4+ICsJ
cmV0dXJuIHJldDsKPj4+PiArfQo+Pj4+ICsKPj4+PiAgLyoqCj4+Pj4gICAqIGNyYXNoX2V4Y2x1
ZGVfbWVtX3JhbmdlIC0gZXhjbHVkZSBhIG1lbSByYW5nZSBmb3IgZXhpc3RpbmcgcmFuZ2VzCj4+
Pj4gICAqIEBtZW06IG1lbS0+cmFuZ2UgY29udGFpbnMgYW4gYXJyYXkgb2YgcmFuZ2VzIHNvcnRl
ZCBpbiBhc2NlbmRpbmcgb3JkZXIKPj4+Cj4+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
