Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F188606A33B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JSZJizJX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=df8KOkyV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2bG1ZFUHauQzGWGgid1ngYj9NCX09S7DUk9Ci00JcuI=; b=JSZJizJXUV2E9ExjYZen7z7F28
	0HqyGkpTOAfKngoDWfIBKe3HOffP5H7cFsMKiPAtvEeDTLQyBuzTcHroofKzrbexcGXDuENoDskRm
	Irl/Cl6+8hNS0WNJyXxWQB2iT4pHrJA0q+b+9o9zGVK55/BE/292r3s+8vndkYV0cA15e5OPEQ2Ti
	JCG5SVIH9Tw8NGin95HLAJsnRZNTro+wsnNMaPA48ObCcWG1lCjwaUeOnwiJ75wzYxJ58eAg3tejG
	iuAAn/wbtCsKnSkOnlDqQlOUWgW9QQkC3nMBsJ+5D4YB80PiOUGd/hyKRC0l3fPBbUJNqxw6sQ9eg
	yaTTR3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjyE-0000000Bhn3-3RVh;
	Fri, 13 Nov 2026 05:37:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjyA-0000000Bhkv-1PDq
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 05:37:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so564493f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 21:37:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794548220; cv=none;
        d=google.com; s=arc-20260327;
        b=mKsxMojW1MxlY/5AcxeYD+92+z/cI5FzYQsniG7uVDmQ1L7JfKaTyrNxPb5J210Alx
         P8hDvyetQX+cz9XkQ7stBgz4zPhfJtR5+ynz0UCmo9E0hCAIY1FK4qIjkqE2UHLxEkCr
         Fl6zpSH2kS1C6trFYX6rbBPhuhzwFJVlLX+cHt7oTIdpQmOav2SmNEWX00XhZqI+3cXV
         GRY3TSpp0dXltRM0+ajW83zk/yvkn++WlpDq4Vm4ald52PSV3h22Qqor48DzK8H2TWxe
         5hLAhdQDiunPkfOqqXQzQyvhGGVuyZZMb2U02EAb6pJ7l/d9zt/9eA05Bkq7OPwCujpQ
         arLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
        fh=BXXUdKemJ5nGhxMht3JsMWnldQSXkOf55ZzptVu92iE=;
        b=jCsffyF53TdSkr83vyHaSBtEVV0KBeL8cPMJCXYwptp4q4mW8/a8CTUZSnoBk2x1Vp
         51cTjReN6FHRh4BAfXN6zQcMKH1AyXwZ9wdoXoUaKgb1LXA0odSiOfQH1LX8SaRMHuju
         FzQqF8SY/QQxxmLsW4+qainPyRVFL/EtKyf24EOMkVBIQm7m4s4mDyREX32+D/TP0Qob
         1rBjwJ09YNXqffCVgs1nFqJan+F7KVm2FkdHRSE4IzKCQdnJ0G32w4o+LUgK6p9vrlyG
         h2wNlpHFUTBIlUkVN3jf7cvTXGHPNELsFxfiBkezRQQaubf0/S5mgeeAh43/LHN86Z9T
         PwLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794548220; x=1795153020; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
        b=df8KOkyVb0gAspxQcIarFtqvtc/IxJyJfPVLGxHFI7ZVRqYnDzhJRI51M8Tlv7fzir
         QjHCgcbkqVsby72RVuzhanF0vHFf4qIq/NK4WdzWRU+T07QkzcrX0i/ejPsBQeiNJV6A
         oEMbVSHPTLQavNy4H5zzR6VeLGh1+S1sYVAp8OH08P5A9q117vJZ1Et7rd5H+osSsSz+
         p8hVPJ6aQtcHkQfkVpidHR8Se44Ja6rUwO4JL9VOQzBt933En2uuE6xLVGyImxEspsFL
         PmEdXD+VK0svzr2NaIOfPNS7zWSR1vgy//9fgX1egF/zYNVXZpJ1thicnBqDnmEG+Fug
         s/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548220; x=1795153020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
        b=IKdkPKuPhOP7/17ew/y2n2yoViZO0QO9pFYIJtTEtUaV+qJvhjFjW+5QPCTpkr+yoT
         pfjJGPEa8JpCpxAl+zPwOeY/hbTnzoU5KdJVtuO4QRld3K50HHl2Dpeh+ENUx+SvNlbt
         hSctvhr6tbtjvsyc2y4OlwyP9Uyl7e+EKAz+vFrR4GjCLej8dtqLghDdkO2EiLAUOYzB
         JVJ5gIebQZ7bS3KhxG7p416rCY3V3V3ulJ0yGcAh2wagCzOVdG0vEcY3gf+oHrHJIiun
         1YQralqAKGvH68RUr4+BX+gx8qTQDGuW1j4HnqKSN4ImHLY831Vd+KfYA7wYJ/tU7Vck
         ZurQ==
X-Forwarded-Encrypted: i=1; AL+hErGvyclbJlrFTj/YbX4d9B1CQckpD5xYg5Expau/OppnuI1lfp5khBrRO8JJYJgV14TCHy+Q98LL0NSwpQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8qfWi0n9Bby44wLNHxEnKKqdaFxC2CttiJ4cOvLyKK3PSuxB+p
	Xjx7nupSa0BAVhgbeUkh4PQdPHk4dPtBkXH35QA267mFIXYZSSle3/Prflg1pzJggHhBgDh24hg
	HJMwHJJeFo3c/ibAgGwce1iyaXl3aimuBtco+n0tUsA==
X-Gm-Gg: AYBFou2dzxk+LxICk9g3xy5/RH4O8O0aIy7TCHcY//c8sWHjgIGuMzfjTf0G3vhceuB
	CT+WQvw8JTrlOfGSqCj9OV7ZItVKZK9z4NWiVMda6Y0If9ENjAsHDEO3a87in3DwKODbVZfkzev
	RWJOa+4/hQOCHY/dCYJnNhBTTSudiXqTMs7E6tdwdc1JFIviJDqawF/YxK227XR/cvKxoL78l/7
	FeRtC4wjt6lER+u2LljMDKg8j98WiPeBDDv4SZzlzI0fP4fGOyRB2rrqvgtHxowycvr3NdZ62Rb
	+QFfc4sUPh74EKhrVMU04HdLK6c5nc0Al3RzRzjLXuGnq/ki2ziX66uXGnFYZAb0+qp82qrFEhk
	vmqGhjU905jAzzl7oSOttUh06B4HoJUoeeVd09NHozgMI92+78vqGK8D8nqa7m8RKF0MSbw8TTU
	5+yztcYbXc9dnPylydIMdQ0SPoDwGLnnjZeNbZzJlvd3X2TVGj45Ldv3Rl0HFgXh5IgpobJFhSe
	xhjaw==
X-Received: by 2002:a05:6000:4707:b0:48e:e98:8b6a with SMTP id
 ffacd0b85a97d-49c6d453ed9mr3163083f8f.4.1794548220458; Thu, 12 Nov 2026
 21:37:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1789872556.git.hppiscas@163.com> <fbe7337f6989994ad4dbc4dc03a67e8ebfa61f8d.1789872556.git.hppiscas@163.com>
In-Reply-To: <fbe7337f6989994ad4dbc4dc03a67e8ebfa61f8d.1789872556.git.hppiscas@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:06:48 +0530
X-Gm-Features: AclHuK88LJjsYi40jv-VHQ1EhoNonVCEpnzC8CHgPBMpwYuzpNXU9bTUnQfxb6Y
Message-ID: <CAAhSdy2KAtv=4RAo8aaOjeHWga-JJsLympDWAeg6MjkfAxstoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: Disallow GPA-width changes after AIA init
To: Pengpeng Hou <hppiscas@163.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>, 
	Fangyu Yu <fangyu.yu@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_213703_875769_4969FB86 
X-CRM114-Status: GOOD (  16.75  )
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

T24gU3VuLCBTZXAgMjAsIDIwMjYgYXQgNjo0MOKAr1BNIFBlbmdwZW5nIEhvdSA8aHBwaXNjYXNA
MTYzLmNvbT4gd3JvdGU6Cj4KPiBLVk1fRU5BQkxFX0NBUChLVk1fQ0FQX1ZNX0dQQV9CSVRTKSBh
bGxvd3MgdXNlcnNwYWNlIHRvIHJlZHVjZSB0aGUKPiBzdGFnZS0yIEdQQSB3aWR0aCB3aGlsZSBh
IFZNIGhhcyBubyB2Q1BVcyBvciBtZW1vcnkgc2xvdHMuCj4KPiBBSUEgaW5pdGlhbGl6YXRpb24g
Y2FuIGNvbXBsZXRlIHdpdGggYW4gQVBMSUMgYW5kIG5vIHZDUFVzIG9yIG1lbW9yeQo+IHNsb3Rz
LiBUaGUgQVBMSUMgTU1JTyBkZXZpY2UgaGFzIHRoZW4gYmVlbiByZWdpc3RlcmVkLCBidXQgdGhl
IGV4aXN0aW5nCj4gY2hlY2tzIHN0aWxsIGFsbG93IHVzZXJzcGFjZSB0byBzaHJpbmsgdGhlIEdQ
QSB3aWR0aCBiZWxvdyBpdHMgYWRkcmVzcy4KPgo+IFJlamVjdCBHUEEtd2lkdGggY2hhbmdlcyBh
ZnRlciBBSUEgaW5pdGlhbGl6YXRpb24uIEJvdGggcGF0aHMgaG9sZAo+IGt2bS0+bG9jaywgc2Vy
aWFsaXppbmcgdGhlIHdpZHRoIGNoYW5nZSB3aXRoIEFJQSBpbml0aWFsaXphdGlvbi4KPgo+IFRo
ZSBpc3N1ZSB3YXMgZm91bmQgYnkgb3VyIHN0YXRpYy1hbmFseXNpcyB0b29sLgo+Cj4gRml4ZXM6
IDcyNjNiNGZkYjBiMiAoIlJJU0MtVjogS1ZNOiBSZXVzZSBLVk1fQ0FQX1ZNX0dQQV9CSVRTIHRv
IHNlbGVjdCBIR0FUUC5NT0RFIikKPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KPiBBc3Npc3RlZC1ieTogZ3B0IDUKPiBTaWduZWQtb2ZmLWJ5OiBQZW5ncGVu
ZyBIb3UgPGhwcGlzY2FzQDE2My5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBhIGZpeCBmb3Ig
TGludXgtNy40LXJjWAoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzQ4NTJmM2I4OTg1YzM1MzgxMWZhMDY1ZTQ3MDFkNzZk
YzlhN2YwODYuMTc4NjUxMjY3MS5naXQucGVuZ3BlbmdAaXNjYXMuYWMuY24vCj4gLSBObyBjaGFu
Z2UgdG8gdGhlIGNvZGU7IHJldGFpbiBBbnVwJ3MgUmV2aWV3ZWQtYnkuCj4gLSBSZWJhc2UgYW5k
IGNsYXJpZnkgdGhlIGxvY2tpbmcgZGVzY3JpcHRpb24uCj4KPiAgYXJjaC9yaXNjdi9rdm0vdm0u
YyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bS5jIGIvYXJjaC9yaXNjdi9rdm0v
dm0uYwo+IGluZGV4IGE5ZjA4M2YuLjY2ZWRmYWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdm0uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKPiBAQCAtMjUwLDcgKzI1MCw4IEBA
IGludCBrdm1fdm1faW9jdGxfZW5hYmxlX2NhcChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1f
ZW5hYmxlX2NhcCAqY2FwKQo+ICAgICAgICAgICAgICAgICBtdXRleF9sb2NrKCZrdm0tPmxvY2sp
Owo+ICAgICAgICAgICAgICAgICBtdXRleF9sb2NrKCZrdm0tPnNsb3RzX2xvY2spOwo+Cj4gLSAg
ICAgICAgICAgICAgIGlmIChrdm0tPmNyZWF0ZWRfdmNwdXMgfHwgIWt2bV9hcmVfYWxsX21lbXNs
b3RzX2VtcHR5KGt2bSkpCj4gKyAgICAgICAgICAgICAgIGlmIChrdm0tPmNyZWF0ZWRfdmNwdXMg
fHwgIWt2bV9hcmVfYWxsX21lbXNsb3RzX2VtcHR5KGt2bSkgfHwKPiArICAgICAgICAgICAgICAg
ICAgIGt2bV9yaXNjdl9haWFfaW5pdGlhbGl6ZWQoa3ZtKSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByID0gLUVCVVNZOwo+ICAgICAgICAgICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAg
ICAgICAgICAga3ZtLT5hcmNoLnBnZF9sZXZlbHMgPSBuZXdfbGV2ZWxzOwo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
