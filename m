Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC1CFC6171
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 19:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUKbM/UAZjvgeuIUKssrkvmo5wkD08oo5CUlsKIS96c=; b=JyNfCN081NQpCl
	wiqoJUnRmIn9Lwfzm4k17C3pBmySGvzkY1iEgwvYdouHS33FP0uZznoGYtnhj2YKHJ6pIqP84IHsB
	2pVnfQ5yZ+UO5v/BLW5/MncvmXVonKOnSv0XmswATq8atXnGmV+2DZUVgft/MDPydvHXXqyJ6GQUz
	61lqnWJYxB2IK3v5SVDB6pqxtynIfMAZDIA40zhrGTPeN6l5mobo1PoJCkO5ZgqmSkI5pP7vlO7Iq
	MPlSb7EnoCAJMNPJYu2sF+RvjnU9nFUPqmM2NVgDr1Z/7fLRkp3QL2OxxCurMgU6tJNPyBgdF/k7N
	GM6nGY57iFYe+/JteyGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spC5O-0000000GxV1-3YzC;
	Fri, 13 Sep 2024 19:36:06 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spC5L-0000000GxTd-2m87
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 19:36:05 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e1a9dc3efc1so1455911276.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2024 12:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726256162; x=1726860962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3U+IHR6pDMRbfhHaDLoFAFxaYoo4zOVYQxFvK1iMreQ=;
        b=Ec1JvE9toL1NokYpWU11cbkw0kzSpd6mH4MwyjKUUrMR4ykritOSzwteGWHuLq4iKd
         NvdfHLDZZ3G3eQ21JuCP4gyguNSX5d3Q8+ey5h0b5dtGebYxzb1yP+zWNfQYbRYaMmNn
         uy346CMQF9sAXlb1B9+JHnJzngPpACJSBXdawEU9TGqNrcf3xwLHqTOFWYPMcy20xhbd
         g8mide7EwZJxQoSnaSNKPJVkHgUtgG5f9ojxfKA/o4rmBuc/rrzIVLKV4wpvpdDpladk
         d6Rv66zXv2FGmevRibCvDxKA0kigvRsO1tTXa32EhlECiAzTZYF1QdWCd7ArD2US61cy
         LugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726256162; x=1726860962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3U+IHR6pDMRbfhHaDLoFAFxaYoo4zOVYQxFvK1iMreQ=;
        b=ZBBjUFwdBqbX7vAHTf3r4lhf0j00zIfDerWZQCYWsGFx1JDQPRdPQ0ogU/+xGwJbkX
         qDtooI0ymaEuvWTEs9LPAjyyjAQ4eYBCAhbud86YPnr7FE7AmFXhzK5bC+hYlKdJXzQz
         UM7yq/rXWTE+5rl7xcNvoxpo2J7KTzqt9Wmggi05XyKRKjQVmrn5z5Q5TzIRiMxjR3Pv
         rvO0CxiF1Rf3eQ+JXBcAmtSN+QHUjwZKgD0q4xWw2RAKTl7vyXnpoTu6w6NpLXTBlZxO
         znQCbrDrbl+7GE9VqMJkkDOt/qcDDT4APJs2u6CdRHnV5xXlNCLyWUqRdZjMVz6lnjIh
         4amQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlIbt1YW55OEAkhYRENcUYl/+LRmkjkZKTqoJp4XH50oPI/96mSaZI4kVy2T3SHlwYbzjZGhxaYDBmKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxC0ggvZaxu7wQ7QKtAU0oZw3YoNrp9jNakY97OqcDmnuE3Z7v9
	U9jf4WwDjrJkeXyxMXSIYyzYUQXvriRNzDTkDcOb4c5U8cDNH4VofaUa4gC2pavxfaLT8WKIYkx
	piiJeSuDRZ90OBKPEVs2Hic+qu10=
X-Google-Smtp-Source: AGHT+IGt2176DfmuLWxLHRhUxP0ghtikgtAQtBs9a9ck/J1CfxjCxtNDV3zRVrMU5j3a8AABIjT1IH6bzLR1lWVcy+0=
X-Received: by 2002:a05:6902:15c7:b0:e1d:1dee:eeeb with SMTP id
 3f1490d57ef6-e1daff7cac4mr2967353276.22.1726256161483; Fri, 13 Sep 2024
 12:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240912231650.3740732-1-debug@rivosinc.com> <20240912231650.3740732-22-debug@rivosinc.com>
In-Reply-To: <20240912231650.3740732-22-debug@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Fri, 13 Sep 2024 21:35:50 +0200
Message-ID: <CAFTtA3NA+OwZv5hJU3EWjuNHNjA3fQzPC+sX84Nb9YyJXdENSA@mail.gmail.com>
Subject: Re: [PATCH v4 21/30] riscv/traps: Introduce software check exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@sifive.com, conor@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, quic_zhonhan@quicinc.com, zong.li@sifive.com, 
	zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, 
	catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, 
	atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, 
	usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, 
	jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, 
	sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, 
	antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, 
	corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, 
	x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, 
	mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, 
	greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, 
	revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, 
	jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, 
	yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, 
	Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, 
	xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, 
	mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, 
	krzk+dt@kernel.org, vbabka@suse.cz, brauner@kernel.org, bhe@redhat.com, 
	ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, 
	ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, 
	ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, 
	akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, 
	rppt@kernel.org, ryan.roberts@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_123603_735832_F626DEE9 
X-CRM114-Status: GOOD (  27.12  )
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

SGkgRGVlcGFrCgpEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4g5pa8IDIwMjTlubQ5
5pyIMTPml6Ug6YCx5LqUIOS4iuWNiDI6MzLlr6vpgZPvvJoKPgo+IHppY2Zpc3MgLyB6aWNmaWxw
IGludHJvZHVjZXMgYSBuZXcgZXhjZXB0aW9uIHRvIHByaXYgaXNhIGBzb2Z0d2FyZSBjaGVjawo+
IGV4Y2VwdGlvbmAgd2l0aCBjYXVzZSBjb2RlID0gMTguIFRoaXMgcGF0Y2ggaW1wbGVtZW50cyBz
b2Z0d2FyZSBjaGVjawo+IGV4Y2VwdGlvbi4KPgo+IEFkZGl0aW9uYWxseSBpdCBpbXBsZW1lbnRz
IGEgY2ZpIHZpb2xhdGlvbiBoYW5kbGVyIHdoaWNoIGNoZWNrcyBmb3IgY29kZQo+IGluIHh0dmFs
LiBJZiB4dHZhbD0yLCBpdCBtZWFucyB0aGF0IHN3IGNoZWNrIGV4Y2VwdGlvbiBoYXBwZW5lZCBi
ZWNhdXNlIG9mCj4gYW4gaW5kaXJlY3QgYnJhbmNoIG5vdCBsYW5kaW5nIG9uIDQgYnl0ZSBhbGln
bmVkIFBDIG9yIG5vdCBsYW5kaW5nIG9uCj4gYGxwYWRgIGluc3RydWN0aW9uIG9yIGxhYmVsIHZh
bHVlIGVtYmVkZGVkIGluIGBscGFkYCBub3QgbWF0Y2hpbmcgbGFiZWwKPiB2YWx1ZSBzZXR1cCBp
biBgeDdgLiBJZiB4dHZhbD0zLCBpdCBtZWFucyB0aGF0IHN3IGNoZWNrIGV4Y2VwdGlvbiBoYXBw
ZW5lZAo+IGJlY2F1c2Ugb2YgbWlzbWF0Y2ggYmV0d2VlbiBsaW5rIHJlZ2lzdGVyICh4MSBvciB4
NSkgYW5kIHRvcCBvZiBzaGFkb3cKPiBzdGFjayAob24gZXhlY3V0aW9uIG9mIGBzc3BvcGNoa2Ap
Lgo+Cj4gSW4gY2FzZSBvZiBjZmkgdmlvbGF0aW9uLCBTSUdTRUdWIGlzIHJhaXNlZCB3aXRoIGNv
ZGU9U0VHVl9DUEVSUi4KPiBTRUdWX0NQRVJSIHdhcyBpbnRyb2R1Y2VkIGJ5IHg4NiBzaGFkb3cg
c3RhY2sgcGF0Y2hlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVz
LmggfCAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmggICB8ICAy
ICsrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgICB8ICAzICsrCj4g
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgICAgICAgICB8IDM4ICsrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oCj4gaW5kZXggY2Q2MjdlYzI4OWYx
Li41YTI3Y2VmZDc4MDUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20t
cHJvdG90eXBlcy5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBl
cy5oCj4gQEAgLTUxLDYgKzUxLDcgQEAgREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNh
bGxfdSk7Cj4gIERFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX3MpOwo+ICBERUNM
QVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9lY2FsbF9tKTsKPiAgREVDTEFSRV9ET19FUlJPUl9J
TkZPKGRvX3RyYXBfYnJlYWspOwo+ICtERUNMQVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9zb2Z0
d2FyZV9jaGVjayk7Cj4KPiAgYXNtbGlua2FnZSB2b2lkIGhhbmRsZV9iYWRfc3RhY2soc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpOwo+ICBhc21saW5rYWdlIHZvaWQgZG9fcGFnZV9mYXVsdChzdHJ1Y3Qg
cHRfcmVncyAqcmVncyk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZW50
cnktY29tbW9uLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oCj4gaW5k
ZXggMjI5M2U1MzVmODY1Li40MDY4YzdlNTQ1MmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZW50cnktY29tbW9uLmgKPiBAQCAtMzksNCArMzksNiBAQCBzdGF0aWMgaW5saW5lIGludCBoYW5k
bGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgfQo+ICAjZW5kaWYK
Pgo+ICtib29sIGhhbmRsZV91c2VyX2NmaV92aW9sYXRpb24oc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Owo+ICsKPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfRU5UUllfQ09NTU9OX0ggKi8KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5
LlMKPiBpbmRleCBjYTkyMDNlNmQ3NmQuLjJlYzc1YmE4NjRhOCAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+
IEBAIC0zODQsNiArMzg0LDkgQEAgU1lNX0RBVEFfU1RBUlRfTE9DQUwoZXhjcF92ZWN0X3RhYmxl
KQo+ICAgICAgICAgUklTQ1ZfUFRSIGRvX3BhZ2VfZmF1bHQgICAvKiBsb2FkIHBhZ2UgZmF1bHQg
Ki8KPiAgICAgICAgIFJJU0NWX1BUUiBkb190cmFwX3Vua25vd24KPiAgICAgICAgIFJJU0NWX1BU
UiBkb19wYWdlX2ZhdWx0ICAgLyogc3RvcmUgcGFnZSBmYXVsdCAqLwo+ICsgICAgICAgUklTQ1Zf
UFRSIGRvX3RyYXBfdW5rbm93biAvKiBjYXVzZT0xNiAqLwo+ICsgICAgICAgUklTQ1ZfUFRSIGRv
X3RyYXBfdW5rbm93biAvKiBjYXVzZT0xNyAqLwo+ICsgICAgICAgUklTQ1ZfUFRSIGRvX3RyYXBf
c29mdHdhcmVfY2hlY2sgLyogY2F1c2U9MTggaXMgc3cgY2hlY2sgZXhjZXB0aW9uICovCj4gIFNZ
TV9EQVRBX0VORF9MQUJFTChleGNwX3ZlY3RfdGFibGUsIFNZTV9MX0xPQ0FMLCBleGNwX3ZlY3Rf
dGFibGVfZW5kKQo+Cj4gICNpZm5kZWYgQ09ORklHX01NVQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IGluZGV4IDUx
ZWJmZDIzZTAwNy4uMzJkMTQ1M2JlZDcyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gQEAgLTM1NCw2ICsz
NTQsNDQgQEAgdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4KPiAg
fQo+Cj4gKyNkZWZpbmUgQ0ZJX1RWQUxfRkNGSV9DT0RFICAgICAyCj4gKyNkZWZpbmUgQ0ZJX1RW
QUxfQkNGSV9DT0RFICAgICAzCj4gKy8qIGhhbmRsZSBjZmkgdmlvbGF0aW9ucyAqLwo+ICtib29s
IGhhbmRsZV91c2VyX2NmaV92aW9sYXRpb24oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gK3sKPiAr
ICAgICAgIGJvb2wgcmV0ID0gZmFsc2U7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHR2YWwgPSBj
c3JfcmVhZChDU1JfVFZBTCk7Cj4gKwo+ICsgICAgICAgaWYgKCgodHZhbCA9PSBDRklfVFZBTF9G
Q0ZJX0NPREUpICYmIGNwdV9zdXBwb3J0c19pbmRpcmVjdF9icl9scF9pbnN0cigpKSB8fAo+ICsg
ICAgICAgICAgICAgICAoKHR2YWwgPT0gQ0ZJX1RWQUxfQkNGSV9DT0RFKSAmJiBjcHVfc3VwcG9y
dHNfc2hhZG93X3N0YWNrKCkpKSB7Cj4gKyAgICAgICAgICAgICAgIGRvX3RyYXBfZXJyb3IocmVn
cywgU0lHU0VHViwgU0VHVl9DUEVSUiwgcmVncy0+ZXBjLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJPb3BzIC0gY29udHJvbCBmbG93IHZpb2xhdGlvbiIpOwo+
ICsgICAgICAgICAgICAgICByZXQgPSB0cnVlOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJl
dHVybiByZXQ7Cj4gK30KPiArLyoKPiArICogc29mdHdhcmUgY2hlY2sgZXhjZXB0aW9uIGlzIGRl
ZmluZWQgd2l0aCByaXNjLXYgY2ZpIHNwZWMuIFNvZnR3YXJlIGNoZWNrCj4gKyAqIGV4Y2VwdGlv
biBpcyByYWlzZWQgd2hlbjotCj4gKyAqIGEpIEFuIGluZGlyZWN0IGJyYW5jaCBkb2Vzbid0IGxh
bmQgb24gNCBieXRlIGFsaWduZWQgUEMgb3IgYGxwYWRgCj4gKyAqICAgIGluc3RydWN0aW9uIG9y
IGBsYWJlbGAgdmFsdWUgcHJvZ3JhbW1lZCBpbiBgbHBhZGAgaW5zdHIgZG9lc24ndAo+ICsgKiAg
ICBtYXRjaCB3aXRoIHZhbHVlIHNldHVwIGluIGB4N2AuIHJlcG9ydGVkIGNvZGUgaW4gYHh0dmFs
YCBpcyAyLgo+ICsgKiBiKSBgc3Nwb3BjaGtgIGluc3RydWN0aW9uIGZpbmRzIGEgbWlzbWF0Y2gg
YmV0d2VlbiB0b3Agb2Ygc2hhZG93IHN0YWNrIChzc3ApCj4gKyAqICAgIGFuZCB4MS94NS4gcmVw
b3J0ZWQgY29kZSBpbiBgeHR2YWxgIGlzIDMuCj4gKyAqLwoKSXQgc2VlbXMgbGlrZSB0aGlzIHRy
YXAgaGFuZGxlciBkb2VzIG5vdCBmb2xsb3cgZ2VuZXJpYyBlbnRyeS4gVGhpcwpjYW4gY2F1c2Ug
cHJvYmxlbXMgYXMgc2lnbmFsIGRlbGl2ZXJ5IGlzIGRvbmUgaW4KaXJxZW50cnlfZXhpdF90b191
c2VyX21vZGUoKS4gUGxlYXNlIHJlZmVyZW5jZSB0aGUgY29tbWl0IGYwYmRkZjUwNTg2ZAooInJp
c2N2OiBlbnRyeTogQ29udmVydCB0byBnZW5lcmljIGVudHJ5IikgZm9yIG1vcmUgaW5mb3JtYXRp
b24uCgo+ICthc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBf
c29mdHdhcmVfY2hlY2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gK3sKPiArICAgICAgIGlmICh1
c2VyX21vZGUocmVncykpIHsKPiArICAgICAgICAgICAgICAgLyogbm90IGEgY2ZpIHZpb2xhdGlv
biwgdGhlbiBtZXJnZSBpbnRvIGZsb3cgb2YgdW5rbm93biB0cmFwIGhhbmRsZXIgKi8KPiArICAg
ICAgICAgICAgICAgaWYgKCFoYW5kbGVfdXNlcl9jZmlfdmlvbGF0aW9uKHJlZ3MpKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGRvX3RyYXBfdW5rbm93bihyZWdzKTsKPiArICAgICAgIH0gZWxz
ZSB7Cj4gKyAgICAgICAgICAgICAgIC8qIHN3IGNoZWNrIGV4Y2VwdGlvbiBjb21pbmcgZnJvbSBr
ZXJuZWwgaXMgYSBidWcgaW4ga2VybmVsICovCj4gKyAgICAgICAgICAgICAgIGRpZShyZWdzLCAi
S2VybmVsIEJVRyIpOwo+ICsgICAgICAgfQo+ICt9Cj4gKwo+ICAjaWZkZWYgQ09ORklHX01NVQo+
ICBhc21saW5rYWdlIF9fdmlzaWJsZSBub2luc3RyIHZvaWQgZG9fcGFnZV9mYXVsdChzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPiAgewo+IC0tCj4gMi40NS4wCj4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCkNoZWVycywKQW5keQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
